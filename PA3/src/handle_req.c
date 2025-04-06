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
        if(all_links[i]) data->links[i] = strdup(all_links[i]);
    }
    data->linknum = total_links;

    data->base_url = strdup(header->hostname_str);
    data->base_port = header->hostname_port_str ? strdup(header->hostname_port_str) : NULL;

    pthread_create(&prefetch_thread, NULL, prefetch_thread_func, data);
    pthread_detach(prefetch_thread);
}

int if_not_cached(HttpHeader_t *header, sockdetails_t *sd, int send_to_client, int prefetch)
{

    if (!prefetch)
        printf(MAG "[+] (%d) Prefetching *not* Cached uri: %s%s\n" RESET, 
               gettid(), header->hostname_str, header->uri_str);

    struct addrinfo hints, *temp, *servinfo;
    int sockfd;
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
    
    if(header->hostname_port_str == NULL) header->hostname_port_str = strdup("80");
    
    if(strcmp(header->hostname_port_str, "8080") == 0 && ((strcmp(header->hostname_str, "localhost") == 0 || strcmp(header->hostname_str, "127.0.1.1") == 0)) && send_to_client)
    {
        char *send_req = "HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\r\n\r\n cannot req proxy";
        if (send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0)
        {
            fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
        }
        return -1;
    }

    

    if ((getaddrinfo(header->hostname_str, header->hostname_port_str, &hints, &servinfo)) < 0)
    {
        fprintf(stderr, RED "getaddrinfo\n" RESET); // this will print error to stderr fd
        if(sd->client_sock_fd > 0 && send_to_client){
            char *send_req = "HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked";
            if ((send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0))
            {
                fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
            }
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
        if(sd->client_sock_fd > 0 && send_to_client){
            char *send_req = "HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nConnect Failed\r\n\r\n";
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
           "[+] Server IP address: %s:%s\n" RESET, 
           gettid(), header->hostname_str, s, 
           header->hostname_port_str ? header->hostname_port_str : "80");

    freeaddrinfo(servinfo);

    const char *connection_type = "Connection: close";
    // const char *connection_type = header->connection_keep_alive ? "Connection: keep-alive" : "Connection: close";
    char *send_req;
    // free
    if (header->extra_header)
    {
        asprintf(&send_req, "GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n%s\r\n", header->uri_str, header->hostname_str, connection_type, header->extra_header);
        // asprintf(&send_req, "GET %s %s\r\n%s\r\nHost: %s\r\n%s\r\n", header->uri_str, header->http_version_str, header->hostname_str, connection_type,header->extra_header);
    }
    else
    {
        asprintf(&send_req, "GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n\r\n", header->uri_str, header->hostname_str, connection_type);
        // asprintf(&send_req, "GET %s %s\r\nHost: %s\r\n%s\r\n\r\n", header->uri_str, header->http_version_str, header->hostname_str, connection_type);
    }  
    printf("[+] Sent request %s \n\r", send_req);

    if (send(sockfd, send_req, strlen(send_req), MSG_NOSIGNAL) < 0)
    {
        fprintf(stderr, RED "[-] (%d) send failed for server %d \n" RESET, gettid(), errno);
        close(sockfd);
        return -1;
    }

    int file_fd = cache_add_new(NULL, header->hostname_str, header->uri_str);

    free(send_req);

    // pthread_mutex_lock(&sd->lock);
    int initial = 1;
    while (1)
    {
        
        memset(recieved_buf, 0, sizeof(recieved_buf));
        if ((numbytes = recv(sockfd, recieved_buf, RECIEVE_SIZE, 0)) < 0)
        {
            fprintf(stderr, "[-] Recv failed for proxy <-> server \n\r");
            break;
        }
        else if(numbytes == 0){
            fprintf(stderr, "[-] Connetion close proxy <-> server \n\r");
            break;
        }
         // if(initial == 1){
        //     // manipulate recieved buffer according to us; 
        //     // recieved_buf;

        //     // content length
        //     // keep-alive
        //     char *content_length = strstr(recieved_buf, "Content-Length: ");
        //     printf("content length %s \n", content_length);

        //     char *eoh = strstr(recieved_buf, "\r\n\r\n");
        //     // memcpy(recieved_buf, eoh, sizoef(eoh));
        //     initial = 0;
        // }
        write(file_fd, recieved_buf, numbytes);

        int link_count = 0;
        char **chunk_links = extract_links(recieved_buf, &link_count);

        if (link_count > 0 && chunk_links != NULL)
        {
            // Resize the all_links array to accommodate new links
            all_links = realloc(all_links, (total_links + link_count) * sizeof(char *));

            if (!all_links) {
                fprintf(stderr, RED "[-] (%d) Memory allocation failed for links array (requested %zu bytes)\n" RESET, 
                       gettid(), (total_links + link_count) * sizeof(char *));
                free(chunk_links);
                // pthread_mutex_unlock(&sd->lock);
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
                // pthread_mutex_unlock(&sd->lock);
                return -1;
            }
            printf(GRN"[+] (%d) Sent %d bytes directly (%s %s) !\n"RESET, gettid(), numbytes, header->hostname_str, header->uri_str);
        }
        printf(GRN"[+] (%d) %d bytes Saved to cache ! (%s %s) !\n"RESET, gettid(), numbytes, header->hostname_str, header->uri_str);
    }
    // pthread_mutex_unlock(&sd->lock);

    
    close(file_fd);
    // close that
    close(sockfd);
    
    if (all_links != NULL && prefetch)
    {
        printf(GRN"[+] (%d) Prefetching for %s:%s/%s \n"RESET,gettid(), header->hostname_str, header->hostname_port_str, header->uri_str);
        prefetch_thread_create(sd, total_links, all_links, header);
        
        // Free the all_links array since prefetch_thread_create makes its own copies
        for (int i = 0; i < total_links; i++) {
            free(all_links[i]); // Free each link string that was allocated with strdup
        }
    }
    free(all_links);
    
    // Free the all_links array itself
   

    return 1;
}

int if_cached(HttpHeader_t *header, sockdetails_t *sd, int file_fd, int send_to_client, int prefetch)
{
    if (!prefetch)
        printf(MAG"[+] (%d) Prefetching Cached uri: %s%s\n" RESET, 
               gettid(), header->hostname_str, header->uri_str);

    char recieved_buf[TRANSMIT_SIZE];
    char **all_links = NULL;
    int total_links = 0;
    
    // pthread_mutex_lock(&sd->lock);
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

            if (!all_links) {
                fprintf(stderr, RED "[-] (%d) Memory allocation failed\n" RESET, gettid());
                free(chunk_links);
                // pthread_mutex_unlock(&sd->lock);
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
                // pthread_mutex_unlock(&sd->lock);
                return -1;
            }
            printf(GRN"[+] (%d) Sent %d bytes from cache (%s/%s) !\n"RESET,gettid(), numbytes, header->hostname_str, header->uri_str);
        }
    }
    // pthread_mutex_unlock(&sd->lock);

    if (all_links != NULL && prefetch)
    {
        printf(GRN"[+] (%d) Prefetching for %s:%s/%s \n"RESET,gettid(), header->hostname_str, header->hostname_port_str, header->uri_str);
        prefetch_thread_create(sd, total_links, all_links, header);
    }

    close(file_fd);

    // Free all allocated link strings before freeing the array
    if (all_links != NULL) {
        for (int i = 0; i < total_links; i++) {
            if (all_links[i] != NULL) {
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
    // if(!prefetch) pthread_mutex_unlock(&sd->lock);
    
    // No need to close file_fd here as it's closed in both if_cached and if_not_cached
    // Removing the potential double-close that could cause issues
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
           
            if ((numbytes  = recv(sd->client_sock_fd, &recieved_buf[total_bytes], TRANSMIT_SIZE, 0)) < 0)
            {
                break;
                fprintf(stderr, RED "[-] (%d) read\n", gettid());
                // break;
            }
            // You get a return value of 0 for recv() when the connection was closed by the other host
            if(numbytes == 0){
                fprintf(stderr, RED "[-] (%d) peer has closed the connection exiting\n", gettid());
                break;
            }
            
            total_bytes += (numbytes-1);

            

            printf("\n\n==============================================================\n"
                   "[+] (%d) Received request from client [%d bytes]:\n"
                   "==============================================================\n"
                   "%s\n",  gettid(), total_bytes, recieved_buf);

            /* Initialize header structure and parse request */
            memset(&header, 0, sizeof(HttpHeader_t));
            if (parse_request_line_thread_safe(recieved_buf, &header) < 0)
            {
                // error
                // we need to send different error according with different error
                printf(RED "[-] (%d) HTTP Parsing Error:\n"
                       "[-] Error code: 0x%02X\n" RESET, 
                       gettid(), header.parser_error);
                char *send_req = "HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\r\nContent-Length: 19\r\n\r\nSomthing went wrong";
                if (send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0)
                {
                    fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                }
                goto cleanup;
            }

            if (is_blocked(NULL, header.hostname_str))
            {
                printf(RED "[-] (%d) ACCESS DENIED: Domain is in blocklist\n"
                       "[-] Blocked domain: %s\n"RESET, 
                       gettid(), header.hostname_str);
                char *send_req = "HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked";
                if (send(sd->client_sock_fd, send_req, strlen(send_req), 0) < 0)
                {
                    fprintf(stderr, RED "[-] (%d) send-server failed for server %d\n" RESET, gettid(), errno);
                    goto cleanup;
                }
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