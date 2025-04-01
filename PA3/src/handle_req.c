/**
 * @file handle_req.c
 * @brief HTTP Request Handler Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements the main HTTP request handling logic, managing:
 * - Connection timeouts using select()
 * - Request reading and parsing
 * - Response generation
 * - Connection persistence (keep-alive)
 * - Resource cleanup
 *
 * The handler supports both HTTP/1.0 and HTTP/1.1 connections with
 * configurable timeout periods and buffer sizes.
 */

#include "handle_req.h"

void *get_in_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET)
    {
        return &(((struct sockaddr_in *)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6 *)sa)->sin6_addr);
}

int is_dynamic_content(const char *url, char *recieved_buf)
{

    if (recieved_buf != NULL)
    {
        if (strstr(recieved_buf, "Cache-Control: no-cache") ||
            strstr(recieved_buf, "Cache-Control: no-store") ||
            strstr(recieved_buf, "Pragma: no-cache"))
        {
            return 1; // Server explicitly asked not to cache
        }

        const char *content_type = strstr(recieved_buf, "Content-Type:");
        if (content_type)
        {
            if (strstr(content_type, "application/json") ||
                strstr(content_type, "text/javascript") ||
                strstr(content_type, "application/xml"))
            {
                return 1; // Likely dynamic content
            }
        }
    }

    // Check for query parameters (anything after ?)
    if (strchr(url, '?') != NULL)
    {
        return 1; // URL contains query parameters
    }

    return 0; // No query parameters found
}

void prefetch_thread_create(sockdetails_t *sd, int total_links, char **all_links, HttpHeader_t *header)
{
    pthread_t prefetch_thread;
    prefetcher_t *data = malloc(sizeof(prefetcher_t));
    data->links = malloc(sizeof(char *) * total_links);
    data->sd = malloc(sizeof(sockdetails_t));
    memcpy(data->sd, sd, sizeof(sockdetails_t));
    data->sd->client_sock_fd = -1;
    for (int i = 0; i < total_links; i++)
    {
        data->links[i] = strdup(all_links[i]);
    }
    data->linknum = total_links;
    data->base_url = strdup(header->hostname_str);

    pthread_create(&prefetch_thread, NULL, prefetch_thread_func, data);
    pthread_detach(prefetch_thread);
}

int if_not_cached(HttpHeader_t *header, sockdetails_t *sd, int send_to_client, int prefetch)
{
    printf("\n");
    if (!prefetch)
        printf(MAG "[+] (%d) Prefetching *not* Cached uri\n" RESET, gettid());

    struct addrinfo hints, *temp, *servinfo;
    int sockfd;
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    int total_links = 0;
    char **all_links = NULL;

    printf(YEL "[+] (%d) Asking file from server \n\r" RESET, gettid());

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM; // for TCP

    if (header->hostname_port_str == NULL)
        header->hostname_port_str = "80";

    if (strcmp(header->hostname_port_str, "8080") == 0 && (strcmp(header->hostname_str, "localhost") == 0 || strcmp(header->hostname_str, "127.0.1.1") == 0) && send_to_client)
    {
        char *send_req = "HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\n\r\n\r cannot req proxy";
        if (send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0)
        {
            fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
            close(sd->client_sock_fd);
        }
        return -1;
    }

    if ((getaddrinfo(header->hostname_str, header->hostname_port_str, &hints, &servinfo)) < 0)
    {
        fprintf(stderr, RED "getaddrinfo\n" RESET); // this will print error to stderr fd
        char *send_req = "HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked";
        if (send_to_client && (send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0))
        {
            fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
            close(sd->client_sock_fd);
        }
        return -1;
        // goto cleanup;
    }

    for (temp = servinfo; temp != NULL; temp = temp->ai_next)
    {
        if ((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            perror(RED "server: socket");
            continue;
        }

        if ((connect(sockfd, temp->ai_addr, temp->ai_addrlen)) < 0)
        {
            fprintf(stderr, RED "[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
            close(sockfd);
            continue;
        }

        break;
    }

    if (temp == NULL)
    {
        fprintf(stderr, RED "[-] (%d) socket connection failed for server \n" RESET, gettid());
        close(sockfd);
        return -1;
    }

    char s[INET6_ADDRSTRLEN];
    inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
    printf(MAG "[+] (%d) client: connecting to %s\n" RESET, gettid(), s);

    freeaddrinfo(servinfo);

    const char *connection_type = header->connection_keep_alive ? "Connection: Keep-alive" : "Connection: close";
    char *send_req;
    // free
    if (header->extra_header)
    {
        asprintf(&send_req, "GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n", header->uri_str, header->hostname_str, header->extra_header);
    }
    else
    {
        asprintf(&send_req, "GET %s HTTP/1.0\r\nHost: %s\r\n\r\n", header->uri_str, header->hostname_str);
    }

    if (send(sockfd, send_req, strlen(send_req), MSG_NOSIGNAL) < 0)
    {
        fprintf(stderr, RED "[-] (%d) send failed for server %d \n" RESET, gettid(), errno);
        close(sockfd);
        return -1;
    }

    int file_fd = cache_add_new(NULL, header->hostname_str, header->uri_str);

    free(send_req);

    while (1)
    {
        memset(recieved_buf, 0, sizeof(recieved_buf));
        if ((numbytes = recv(sockfd, recieved_buf, RECIEVE_SIZE, 0)) <= 0)
        {
            break;
        }
        write(file_fd, recieved_buf, numbytes);

        int link_count = 0;
        char **chunk_links = extract_links(recieved_buf, &link_count);

        if (link_count > 0 && chunk_links != NULL)
        {
            // Resize the all_links array to accommodate new links
            all_links = realloc(all_links, (total_links + link_count) * sizeof(char *));

            // Copy pointers to the new links
            for (int i = 0; i < link_count; i++)
            {
                all_links[total_links + i] = chunk_links[i];
            }

            // Update total count
            total_links += link_count;

            // Don't free chunk_links itself as we're keeping the pointers,
            // but free the array
            free(chunk_links);
        }

        if (send_to_client && sd->client_sock_fd > 0)
        {
            if (send(sd->client_sock_fd, recieved_buf, numbytes, MSG_NOSIGNAL) < 0)
            {
                fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                close(file_fd);
                close(sockfd);
                return -1;
            }
        }
    }

    if (all_links != NULL && prefetch)
    {
        prefetch_thread_create(sd, total_links, all_links, header);
    }

    close(file_fd);

    // keep-alive
    close(sockfd);

    return 1;
}

int if_cached(HttpHeader_t *header, sockdetails_t *sd, int file_fd, int send_to_client, int prefetch)
{
    printf("\n");
    if (!prefetch)
        printf(MAG "[+] (%d) Prefetching Cached uri\n\r" RESET, gettid());

    char recieved_buf[TRANSMIT_SIZE];
    char **all_links = NULL;
    int total_links = 0;
    printf(YEL "[+] (%d) Sent file from cache \n\r" RESET, gettid());
    while (1)
    {
        memset(recieved_buf, 0, sizeof(recieved_buf));
        int numbytes = read(file_fd, recieved_buf, sizeof(recieved_buf));
        if (numbytes <= 0)
        {
            break;
        }

        int link_count = 0;
        char **chunk_links = extract_links(recieved_buf, &link_count);

        if (link_count > 0 && chunk_links != NULL)
        {
            // Resize the all_links array to accommodate new links
            all_links = realloc(all_links, (total_links + link_count) * sizeof(char *));

            // Copy pointers to the new links
            for (int i = 0; i < link_count; i++)
            {
                all_links[total_links + i] = strdup(chunk_links[i]);
            }

            // Update total count
            total_links += link_count;

            // Don't free chunk_links itself as we're keeping the pointers,
            // but free the array
            free(chunk_links);
        }

        if (send_to_client && sd->client_sock_fd > 0)
        {
            if (send(sd->client_sock_fd, recieved_buf, numbytes, 0) < 0)
            {
                fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                close(sd->client_sock_fd);
                return -1;
            }
        }
    }

    if (all_links != NULL && prefetch)
    {
        prefetch_thread_create(sd, total_links, all_links, header);
    }

    free(all_links);
    close(file_fd);
}

void check_and_send_from_cache(HttpHeader_t *header, sockdetails_t *sd, int dynamic_content, int send_to_client, int prefetch)
{
    int file_fd;

    if ((file_fd = cache_lookup(NULL, header->hostname_str, header->uri_str, sd->timeout)) < 0 || dynamic_content)
    {
        if_not_cached(header, sd, send_to_client, prefetch);
    }
    else
    {
        if_cached(header, sd, file_fd, send_to_client, prefetch);
    }

    close(file_fd);
}

/**
 * @function handle_req
 * @brief Main HTTP request handler function
 *
 * @param sd Socket details structure containing connection information
 * @return void* Always returns NULL
 *
 * This function implements the main request handling loop that:
 * 1. Monitors socket for incoming data using select()
 * 2. Implements timeout mechanism for idle connections
 * 3. Reads and processes HTTP requests
 * 4. Manages connection persistence based on HTTP headers
 * 5. Ensures proper resource cleanup
 *
 * Threading: This function is designed to be thread-safe and can be
 * called by multiple threads simultaneously with different connections.
 */
void *handle_req(sockdetails_t sd)
{
    int numbytes;                     /* Number of bytes received */
    char recieved_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    HttpHeader_t header;              /* HTTP header structure */
    fd_set readfds;                   /* File descriptor set for select() */
    int file_fd;

    while (1)
    {
        memset(recieved_buf, 0, sizeof(recieved_buf));
        /* Initialize select() parameters */
        FD_ZERO(&readfds);
        FD_SET(sd.client_sock_fd, &readfds);

        /* Set timeout period for idle connections */
        struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

        /* Monitor socket for incoming data */
        int select_status = select(sd.client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
        /* Handle select errors */
        if (select_status < 0)
        {
            perror(RED "select error");
            break;
        }

        /* Handle connection timeout */
        if (select_status == 0)
        {
            printf(YEL "[-] (%d) Connection timed out\n" RESET, gettid());
            break;
        }

        /* Process incoming data when available */
        if (FD_ISSET(sd.client_sock_fd, &readfds))
        {
            memset(recieved_buf, 0, sizeof(recieved_buf));
            /* Read incoming request with error checking */
            if ((numbytes = recv(sd.client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
            {
                fprintf(stderr, RED "[-] (%d) read", gettid());
                return NULL;
            }

            // printf("recieved_buf : %s\n\n", recieved_buf);
            /* Initialize header structure and parse request */
            memset(&header, 0, sizeof(HttpHeader_t));
            if (parse_request_line_thread_safe(recieved_buf, &header) < 0)
            {
                // error
                // we need to send different error according with different error
                printf(RED "[-] (%d) Parsing went wrong : 0x%02X \n\r" RESET, gettid(), header.parser_error);
                char *send_req = "HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong";
                if (send(sd.client_sock_fd, send_req, strlen(send_req), 0) < 0)
                {
                    fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                }
                goto cleanup;
            }

            if (is_blocked(NULL, header.hostname_str))
            {
                printf(RED "[-] (%d) Blocked Domain \n\r" RESET, gettid());
                char *send_req = "HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked";
                if (send(sd.client_sock_fd, send_req, strlen(send_req), 0) < 0)
                {
                    fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                    goto cleanup;
                }
                goto cleanup;
            }

            check_and_send_from_cache(&header, &sd, is_dynamic_content(header.uri_str, recieved_buf), 1, 1);

            memset(&header, 0, sizeof(header));
            memset(recieved_buf, 0, sizeof(recieved_buf));

            /* Check if connection should be closed */
            if (header.connection_close == 1 || header.connection_keep_alive == 0)
            {
                goto cleanup;
            }
            /* Clear header for next request */
        }
    }
cleanup:;
    /* Clean up resources before exit */
    cleanup_header(&header);
    memset(recieved_buf, 0, sizeof(recieved_buf));
    close(file_fd);
    close(sd.client_sock_fd);

    return NULL;
}