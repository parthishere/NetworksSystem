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
    if (url != NULL && strchr(url, '?') != NULL)
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
    // memcpy(data->sd, sd, sizeof(sockdetails_t));
    data->sd->client_sock_fd = -1;
    data->sd->timeout = sd->timeout;

    for (int i = 0; i < total_links; i++)
    {
        if (all_links[i])
            data->links[i] = strdup(all_links[i]);
    }
    data->linknum = total_links;

    data->base_url = strdup(header->hostname_str);
    data->base_port = header->hostname_port_str ? strdup(header->hostname_port_str) : NULL;
    data->http_version_str = strdup(header->http_version_str);
    data->keep_open_connection = header->connection_keep_alive;

    pthread_create(&prefetch_thread, NULL, prefetch_thread_func, data);
    pthread_detach(prefetch_thread);
}

int if_not_cached(HttpHeader_t *header, sockdetails_t *sd, int send_to_client, int prefetch)
{

    if (!prefetch)
        printf(MAG "[+] (%d) Prefetching *not* Cached uri: %s%s\n" RESET,
               gettid(), header->hostname_str, header->uri_str);

    struct addrinfo hints, *temp, *servinfo;
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    int total_links = 0;
    char **all_links = NULL;

    printf(YEL "[+] (%d) Requesting file from server: %s:%s%s\n" RESET,
           gettid(), header->hostname_str,
           header->hostname_port_str ? header->hostname_port_str : "80", header->uri_str);

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM; // for TCP

    if (header->hostname_port_str == NULL)
        header->hostname_port_str = strdup("80");

    if (strcmp(header->hostname_port_str, "8080") == 0 && ((strcmp(header->hostname_str, "localhost") == 0 || strcmp(header->hostname_str, "127.0.1.1") == 0)) && send_to_client)
    {
        char *send_req;
        asprintf(&send_req, "%s 403 Forbidden\r\nContent-Type: text/plain\r\n\r\n cannot req proxy", header->http_version_str);
        if (send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0)
        {
            fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
        }
        free(send_req);
        return -1;
    }

    int sockfd = get_connection(NULL, header->hostname_str);

    if (sockfd < 0)
    {
        if ((getaddrinfo(header->hostname_str, header->hostname_port_str, &hints, &servinfo)) < 0)
        {
            fprintf(stderr, RED "getaddrinfo\n" RESET); // this will print error to stderr fd
            if (sd->client_sock_fd > 0 && send_to_client)
            {
                char *send_req;

                asprintf(&send_req, "%s 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked", header->http_version_str);

                if ((send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0))
                {
                    fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                }
                free(send_req);
            }

            return -1;
        }

        for (temp = servinfo; temp != NULL; temp = temp->ai_next)
        {
            // keep-alive -> keep proxy < - > client (firefox)
            // close -> proxy < - > webserver
            if ((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
            {
                perror(RED "server: socket");
                continue;
            }

            if ((connect(sockfd, temp->ai_addr, temp->ai_addrlen)) < 0)
            {
                fprintf(stderr, RED "\n[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
                close(sockfd);
                continue;
            }

            break;
        }

        if (temp == NULL)
        {
            if (sd->client_sock_fd > 0 && send_to_client)
            {
                char *send_req;
                asprintf(&send_req, "%s 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked", header->http_version_str);
                if ((send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0))
                {
                    fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                }
            }
            close(sockfd);
            return -1;
        }

        char s[INET6_ADDRSTRLEN];
        inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
        printf(GRN "[+] (%d) Connection established to server: %s\n"
                   "[+] (%d) Server IP address: %s:%s\n" RESET,
               gettid(), header->hostname_str, gettid(), s,
               header->hostname_port_str ? header->hostname_port_str : "80");

        save_connection(NULL, header->hostname_str, sockfd);
        freeaddrinfo(servinfo);
    }
    else
    {
        printf(YEL "Existing connection found %d \n" RESET, sockfd);
    }

    // header->connection_keep_alive = 0;
    // const char *connection_type = "Connection: close";
    const char *connection_type = header->connection_keep_alive ? "Connection: keep-alive" : "Connection: close";
    char *send_req;
    // free
    if (header->extra_header)
    {
        asprintf(&send_req, "GET %s %s\r\nHost: %s\r\n%s\r\n%s\r\n", header->uri_str, header->http_version_str, header->hostname_str, connection_type, header->extra_header);
        // asprintf(&send_req, "GET %s %s\r\n%s\r\nHost: %s\r\n%s\r\n", header->uri_str, header->http_version_str, header->hostname_str, connection_type,header->extra_header);
    }
    else
    {
        asprintf(&send_req, "GET %s %s\r\nHost: %s\r\n%s\r\n\r\n", header->uri_str, header->http_version_str, header->hostname_str, connection_type);
        // asprintf(&send_req, "GET %s %s\r\nHost: %s\r\n%s\r\n\r\n", header->uri_str, header->http_version_str, header->hostname_str, connection_type);
    }

    printf(MAG"[+] (%d) Sent request \n%s \n\r"RESET, gettid(), send_req);
    if (send(sockfd, send_req, strlen(send_req), MSG_NOSIGNAL) < 0)
    {
        fprintf(stderr, RED "[-] (%d) send failed for server %d \n" RESET, gettid(), errno);
        close(sockfd);
        return -1;
    }

    int file_fd = cache_add_new(NULL, header->hostname_str, header->uri_str);

    free(send_req);

    pthread_mutex_lock(&sd->lock);
    int initial = 1;
    int content_length = -1;
    char *content_type = NULL;
    int headers_end_pos = 0;
    int total_bytes = 0;
    int body_bytes = 0;
    int chunked_encoding = 0;
    int found_end_chunk = 0;
    int from_server_close = 0;

    while (1)
    {
        memset(recieved_buf, 0, sizeof(recieved_buf));
        if ((numbytes = recv(sockfd, recieved_buf, RECIEVE_SIZE, 0)) < 0)
        {
            fprintf(stderr, "[-] (%d) Recv failed for proxy <-> server \n\r", gettid());
            break;
        }
        else if (numbytes == 0)
        {
            fprintf(stderr, "[-] (%d) Connetion close proxy <-> server \n\r", gettid());
            break;
        }

        if (initial == 1)
        {
            initial = 0;

            char *headers_end = strstr(recieved_buf, "\r\n\r\n");
            if (headers_end)
            {
                headers_end_pos = headers_end - recieved_buf + 4; // +4 for \r\n\r\n

                if(strcasecmp(recieved_buf, "Connection: close")){
                    from_server_close = 1;
                }

                if (strcasestr(recieved_buf, "Transfer-Encoding: chunked"))
                {
                    chunked_encoding = 1;

                    // Check for end chunk in first response
                    if (strstr(recieved_buf, "\r\n0\r\n\r\n"))
                    {
                        found_end_chunk = 1;
                        printf("[+] Found end chunk marker in first response\n");
                    }
                }

                // Extract Content-Length
                char *cl_header = strcasestr(recieved_buf, "Content-Length:");
                if (cl_header)
                {
                    char *cl_end = strstr(cl_header, "\r\n");
                    if (cl_end)
                    {
                        content_length = atoi(cl_header + 16); // Skip "Content-Length: "
                        printf(GRN"[+] Detected Content-Length: %d\n"RESET, content_length);
                    }
                }

                // Extract Content-Type
                char *ct_header = strcasestr(recieved_buf, "Content-Type:");
                if (ct_header)
                {
                    char *ct_end = strstr(ct_header, "\r\n");
                    if (ct_end)
                    {
                        int ct_len = ct_end - (ct_header + 13); // Skip "Content-Type: "
                        content_type = malloc(ct_len + 1);
                        if (content_type)
                        {
                            memcpy(content_type, ct_header + 13, ct_len);
                            content_type[ct_len] = '\0';
                            printf(GRN"[+] Detected Content-Type: %s\n"RESET, content_type);
                        }
                    }
                }

                if (content_length == -1 && !chunked_encoding)
                {
                    // We'll need to buffer the entire response, but can't do that yet
                    // Just note that we're missing Content-Length
                    printf(RED"[-] (%d) Missing Content-Length in non-chunked response, Response: \n%s\n"RESET, gettid(), recieved_buf);
                    chunked_encoding = 1;
                    // return -1;
                }
            }
        }
        else
        {
            total_bytes += numbytes;

            // Check for end chunk marker in chunked encoding
            if (chunked_encoding && strstr(recieved_buf, "\r\n0\r\n\r\n"))
            {
                found_end_chunk = 1;
                printf(GRN"[+] (%d) Found end chunk marker\n"RESET, gettid());
            }
        }
        write(file_fd, recieved_buf, numbytes);

        int link_count = 0;
        char **chunk_links = extract_links(recieved_buf, &link_count);
        if (link_count > 0 && chunk_links != NULL)
        {
            // Resize the all_links array to accommodate new links
            all_links = realloc(all_links, (total_links + link_count) * sizeof(char *));

            if (!all_links)
            {
                fprintf(stderr, RED "[-] (%d) Memory allocation failed for links array (requested %zu bytes)\n" RESET,
                        gettid(), (total_links + link_count) * sizeof(char *));
                free(chunk_links);
                pthread_mutex_unlock(&sd->lock);
                return -1;
            }
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

        if (send_to_client)
        {
            if (send(sd->client_sock_fd, recieved_buf, numbytes, MSG_NOSIGNAL) < 0)
            {
                fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                close(file_fd);
                close(sockfd);
                pthread_mutex_unlock(&sd->lock);
                return -1;
            }
            printf(GRN "[+] (%d) Sent %d bytes directly (%s %s) !\n" RESET, gettid(), numbytes, header->hostname_str, header->uri_str);
        }
        printf(GRN "[+] (%d) %d bytes Saved to cache ! (%s %s) !\n" RESET, gettid(), numbytes, header->hostname_str, header->uri_str);

        // Break conditions - three ways to determine end of response:
        // 1. Content-Length met
        // 2. Found end chunk in chunked encoding
        // 3. Connection closed by server (handled at start of loop)

        if ((content_length > 0 && body_bytes >= content_length) ||
            (chunked_encoding && found_end_chunk))
        {
            printf("[+] Response complete (bytes: %d, expected: %d)\n",
                   body_bytes, content_length);
            break;
        }
    }
    if (content_type)
    {
        free(content_type);
    }
    pthread_mutex_unlock(&sd->lock);

    close(file_fd);

    if (!header->connection_keep_alive || from_server_close)
    {
        remove_connection(NULL, header->hostname_str, 1);
    }

    if (all_links != NULL && prefetch)
    {
        printf(GRN "[+] (%d) Prefetching for %s:%s/%s \n" RESET, gettid(), header->hostname_str, header->hostname_port_str, header->uri_str);
        prefetch_thread_create(sd, total_links, all_links, header);

        // Free the all_links array since prefetch_thread_create makes its own copies
        for (int i = 0; i < total_links; i++)
        {
            free(all_links[i]); // Free each link string that was allocated with strdup
        }
    }
    free(all_links);

    // Free the all_links array itself

    return 1;
}

// 1. 400 Bad Request: Detected but sent as 404
// 2. 405 Method Not Allowed: Detected but sent as 404
// 3. 408 Request Timeout: Not implemented
// 4. 500 Internal Server Error: Not implemented for internal errors
// 5. 502 Bad Gateway: Not implemented (using 403 instead)
// 6. 504 Gateway Timeout: Not implemented
// 7. 505 HTTP Version Not Supported: Detected but sent as 404
// 8. 508 Loop Detected: Not implemented (using 404)

int if_cached(HttpHeader_t *header, sockdetails_t *sd, int file_fd, int send_to_client, int prefetch)
{
    if (!prefetch)
        printf(MAG "[+] (%d) Prefetching Cached uri: %s%s\n" RESET,
               gettid(), header->hostname_str, header->uri_str);

    char recieved_buf[TRANSMIT_SIZE];
    char **all_links = NULL;
    int total_links = 0;

    pthread_mutex_lock(&sd->lock);
    // Get file size
    long file_size = lseek(file_fd, 0, SEEK_END) > 0 ? lseek(file_fd, 0, SEEK_CUR) : 0;

    printf(GRN "[+] (%d) Serving file from cache: %s%s\n"
               "[+] Cache file size: %ld bytes\n" RESET,
           gettid(), header->hostname_str, header->uri_str, file_size);

    // Reset file position to beginning
    lseek(file_fd, 0, SEEK_SET);
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

            if (!all_links)
            {
                fprintf(stderr, RED "[-] (%d) Memory allocation failed\n" RESET, gettid());
                free(chunk_links);
                pthread_mutex_unlock(&sd->lock);
                return -1;
            }

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
                pthread_mutex_unlock(&sd->lock);
                return -1;
            }
            printf(GRN "[+] (%d) Sent %d bytes from cache (%s/%s) !\n" RESET, gettid(), numbytes, header->hostname_str, header->uri_str);
        }
    }

    pthread_mutex_unlock(&sd->lock);


    if (all_links != NULL && prefetch)
    {
        printf(GRN "[+] (%d) Prefetching for %s:%s/%s \n" RESET, gettid(), header->hostname_str, header->hostname_port_str, header->uri_str);
        prefetch_thread_create(sd, total_links, all_links, header);
    }

    close(file_fd);

    // Free all allocated link strings before freeing the array
    if (all_links != NULL)
    {
        for (int i = 0; i < total_links; i++)
        {
            if (all_links[i] != NULL)
            {
                free(all_links[i]); // Free each link string allocated with strdup
            }
        }
        free(all_links); // Free the array itself
    }

    return 0; // Add return value to be consistent with if_not_cached
}

int check_and_send_from_cache(HttpHeader_t *header, sockdetails_t *sd, int dynamic_content, int send_to_client, int prefetch)
{
    int file_fd;
    int result;

    file_fd = cache_lookup(NULL, header->hostname_str, header->uri_str, sd->timeout);

    if (file_fd < 0 || dynamic_content)
    {
        // Not in cache or dynamic content - need to fetch from server
        result = if_not_cached(header, sd, send_to_client, prefetch);
    }
    else
    {
        // Found in cache - serve from cache
        result = if_cached(header, sd, file_fd, send_to_client, prefetch);
        // Don't close file_fd here as it's already closed in if_cached
    }
    return result;

    // No need to close file_fd here as it's closed in both if_cached and if_not_cached
    // Removing the potential double-close that could cause issues
}

/**
 * @brief Get HTTP status text for a given status code
 * @param status_code The HTTP status code
 * @return The corresponding status text
 */
const char *get_status_text(statusCode_t status_code)
{
    switch (status_code)
    {
    case OK:
        return "200 OK";
    case BAD_REQ:
        return "400 Bad Request";
    case FORBIDDEN:
        return "403 Forbidden";
    case NOT_FOUND:
        return "404 Not Found";
    case METHOD_NOT_ALLOWED:
        return "405 Method Not Allowed";
    case VERSION_NOT_SUPPORTED:
        return "505 HTTP Version Not Supported";
    default:
        return "400 Unknown";
    }
}

/**
 * @brief Send a standardized HTTP error response
 * @param client_fd The client socket file descriptor
 * @param http_version HTTP version string (e.g., "HTTP/1.0")
 * @param status_code HTTP status code
 * @param message Error message to include in the response body
 */
void send_error_response(int client_fd, const char *http_version, statusCode_t status_code)
{
    char *response;
    const char *status_text = get_status_text(status_code);
    int length = strlen(status_text);
    printf("error we will be sending %d %s", status_code, status_text);

    if (http_version == NULL)
    {
        asprintf(&response, "HTTP/1.0 %s\r\n"
                            "Content-Type: text/plain\r\n"
                            "Content-Length: %d\r\n"
                            "Connection: close\r\n"
                            "\r\n"
                            "%s",
                 status_text, length, status_text);
    }
    else
    {
        asprintf(&response, "%s %s\r\n"
                            "Content-Type: text/plain\r\n"
                            "Content-Length: %d\r\n"
                            "Connection: close\r\n"
                            "\r\n"
                            "%s",
                 http_version, status_text, length, status_text);
    }

    if (response)
    {
        send(client_fd, response, strlen(response), 0);
        free(response);
    }
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
void *handle_req(sockdetails_t *sd)
{
    int numbytes;                     /* Number of bytes received */
    char recieved_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    HttpHeader_t header;              /* HTTP header structure */
    fd_set readfds;                   /* File descriptor set for select() */
    int file_fd;

    while (1)
    {
        FD_ZERO(&readfds);
        FD_SET(sd->client_sock_fd, &readfds);

        /* Set timeout period for idle connections */
        struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

        /* Monitor socket for incoming data */
        int select_status = select(sd->client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
        /* Handle select errors */
        if (select_status < 0)
        {
            fprintf(stderr, RED "[-] (%d) Select syscall failed with error: %d (%s)\n" RESET,
                    gettid(), errno, strerror(errno));
            break;
        }

        /* Handle connection timeout */
        else if (select_status == 0)
        {
            printf(YEL "\n[-] (%d) CONNECTION TIMEOUT:\n"
                       "[-] Client connection idle for %d seconds\n"
                       "------------------------------------------------------------\n" RESET,
                   gettid(), TIMEOUT_HTTP_SEC);
            break;
        }

        /* Process incoming data when available */
        else if (FD_ISSET(sd->client_sock_fd, &readfds))
        {
            memset(recieved_buf, 0, sizeof(recieved_buf));
            /* Read incoming request with error checking */
            int total_bytes = 0;

            if ((numbytes = recv(sd->client_sock_fd, &recieved_buf[total_bytes], TRANSMIT_SIZE, 0)) < 0)
            {
                break;
                fprintf(stderr, RED "[-] (%d) read\n", gettid());
                // break;
            }
            // You get a return value of 0 for recv() when the connection was closed by the other host
            if (numbytes == 0)
            {
                fprintf(stderr, RED "[-] (%d) peer has closed the connection exiting\n", gettid());
                break;
            }

            total_bytes += (numbytes - 1);

            printf("\n\n==============================================================\n"
                   "[+] (%d) Received request from client [%d bytes]:\n"
                   "==============================================================\n"
                   "%s\n",
                   gettid(), total_bytes, recieved_buf);

            /* Initialize header structure and parse request */
            memset(&header, 0, sizeof(HttpHeader_t));
            if (parse_request_line_thread_safe(recieved_buf, &header) < 0)
            {
                send_error_response(sd->client_sock_fd, header.http_version_str, header.parser_error);
                goto cleanup;
            }

            if (is_blocked(NULL, header.hostname_str))
            {
                printf(RED "[-] (%d) ACCESS DENIED: Domain is in blocklist\n"
                           "[-] Blocked domain: %s\n" RESET,
                       gettid(), header.hostname_str);
                
                send_error_response(sd->client_sock_fd, header.http_version_str, FORBIDDEN);
                
                goto cleanup;
            }

            int returnval = check_and_send_from_cache(&header, sd, is_dynamic_content(header.uri_str, recieved_buf), 1, 1);

            /* Check if connection should be closed */
            if ((header.connection_close == 1 && header.connection_keep_alive == 0) || returnval < 0)
            {
                goto cleanup;
            }
            cleanup_header(&header);
            memset(recieved_buf, 0, sizeof(recieved_buf));

            /* Clear header for next request */
        }
    }
cleanup:;
    /* Clean up resources before exit */
    cleanup_header(&header);
    // Only close the client socket, file_fd is already closed in the handler functions
    // or was never opened if we jumped to cleanup without accessing a file
    close(sd->client_sock_fd);

    return NULL;
}