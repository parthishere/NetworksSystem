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
    if (sa->sa_family == AF_INET) {
        return &(((struct sockaddr_in*)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6*)sa)->sin6_addr);
}


int is_dynamic_content(const char *url, char *recieved_buf) {

    if (strstr(recieved_buf, "Cache-Control: no-cache") || 
        strstr(recieved_buf, "Cache-Control: no-store") ||
        strstr(recieved_buf, "Pragma: no-cache")) {
        return 1;  // Server explicitly asked not to cache
    }

    const char *content_type = strstr(recieved_buf, "Content-Type:");
    if (content_type) {
        if (strstr(content_type, "application/json") ||
            strstr(content_type, "text/javascript") ||
            strstr(content_type, "application/xml")) {
            return 1;  // Likely dynamic content
        }
    }

    // Check for query parameters (anything after ?)
    if (strchr(url, '?') != NULL) {
        return 1;  // URL contains query parameters
    }
    
    return 0;  // No query parameters found
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
                perror(RED "[-] read");
                return NULL;
            }

            // printf("recieved_buf : %s\n\n", recieved_buf);
            /* Initialize header structure and parse request */
            memset(&header, 0, sizeof(HttpHeader_t));
            if(parse_request_line_thread_safe(recieved_buf, &header) < 0){
                // error
                char *send_req = "HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong";
                if(send(sd.client_sock_fd, send_req, strlen(send_req), 0) <0){
                    fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
                    close(sd.client_sock_fd);
                    break;
                }
                goto cleanup;
            }
            
            if(is_blocked(NULL, header.hostname_str)){
                char *send_req = "HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked";
                if(send(sd.client_sock_fd, send_req, strlen(send_req), 0) <0){
                    fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
                    close(sd.client_sock_fd);
                    break;
                }
                break;
            }

            int link_count, total_links;
                char **links;

            printf("is dynamic content %d\n\r", is_dynamic_content(header.uri_str, recieved_buf));

            if((file_fd = cache_lookup(NULL, header.hostname_str, header.uri_str, 60)) < 0 || is_dynamic_content(header.uri_str, recieved_buf)){
                // failed create a new socket!

                struct addrinfo hints, *temp, *servinfo;
                int sockfd;
                int numbytes;

                memset(&hints, 0, sizeof(hints));
                hints.ai_family = AF_UNSPEC;
                hints.ai_socktype = SOCK_STREAM; // for TCP
                if(header.hostname_port_str == NULL) header.hostname_port_str = "80";
                if(strcmp(header.hostname_port_str, "8080") == 0 && (strcmp(header.hostname_str, "localhost") == 0 || strcmp(header.hostname_str, "127.0.1.1") == 0)) {
                    char *send_req = "HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\n\r\n\r cannot req proxy";
                    if(send(sd.client_sock_fd, send_req, strlen(send_req), 0) <0){
                        fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
                        close(sd.client_sock_fd);
                        break;
                    }
                    goto cleanup;
                }
                
                if ((getaddrinfo(header.hostname_str, header.hostname_port_str, &hints, &servinfo)) < 0)
                {
                    fprintf(stderr, RED "getaddrinfo\n" RESET); // this will print error to stderr fd
                    char *send_req = "HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked";
                    if(send(sd.client_sock_fd, send_req, strlen(send_req), 0) <0){
                        fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
                        close(sd.client_sock_fd);
                        break;
                    }     
                    goto cleanup;                                              
                }
                printf(GRN "[+] getaddrinfo call successful\n" RESET);

                for (temp = servinfo; temp != NULL; temp = temp->ai_next)
                {
                    if ((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
                    {
                        perror(RED "server: socket");
                        continue;
                    }
                    printf(GRN "[+] socket call successful\n" RESET);
                    
                    if((connect(sockfd, temp->ai_addr, temp->ai_addrlen)) < 0){
                        fprintf(stderr, RED "[-] connect failed for server %d\n" RESET, errno);
                        close(sockfd);
                        continue;
                    }
                    printf(GRN "[+] connect call successful\n" RESET);
                    
                    break;
                }

                
                if(temp == NULL){
                    fprintf(stderr, RED "[-] socket connection failed for server \n" RESET);
                    close(sockfd);
                    exit(EXIT_FAILURE);
                }
                
                char s[INET6_ADDRSTRLEN];
                inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
                printf("client: connecting to %s\n", s);
                
                freeaddrinfo(servinfo); 
                

                const char *connection_type = header.connection_keep_alive ? "Connection: Keep-alive" : "Connection: close";
                printf("waiting for send ?? \n");
                char *send_req;
                asprintf(&send_req,  "GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n", header.uri_str, header.hostname_str, header.extra_header);
                
                printf("header -> %s", send_req);

                if(send(sockfd, send_req, strlen(send_req), MSG_NOSIGNAL) < 0){
                    fprintf(stderr, RED "[-] send failed for server %d \n" RESET, errno);
                    close(sockfd);
                    exit(EXIT_FAILURE);
                }

                int file_fd = cache_add_new(NULL, header.hostname_str, header.uri_str);

                

                while(1){
                    memset(recieved_buf, 0, sizeof(recieved_buf));
                    if((numbytes = recv(sockfd, recieved_buf, RECIEVE_SIZE, 0)) <= 0){
                        fprintf(stderr, RED "[-] recv failed for server \n" RESET);
                        close(sockfd);           
                        //exit(EXIT_FAILURE);
                        break;
                    }
                    write(file_fd, recieved_buf, numbytes);
                    // printf("recv buf %d: '%s'\n", numbytes, recieved_buf);
                    links = extract_links(recieved_buf, &link_count);
                    total_links += link_count;
                    links += link_count;
                    if(send(sd.client_sock_fd, recieved_buf, numbytes, MSG_NOSIGNAL) < 0){
                        fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
                        close(sockfd);
                        // exit(EXIT_FAILURE);
                    }
                }

                pthread_t *thread;

               
                
                close(file_fd);
                
            }
            else{
                printf(YEL"Sent from cache \n\r"RESET);
                while(1){
                    memset(recieved_buf, 0, sizeof(recieved_buf));
                    numbytes = read(file_fd, recieved_buf, sizeof(recieved_buf));
                    if(numbytes <= 0) {
                        break;
                    }
                    if(send(sd.client_sock_fd, recieved_buf, numbytes, 0) <0){
                        fprintf(stderr, RED "[-] send-server failed for server %d\n" RESET, errno);
                        close(sd.client_sock_fd);
                        break;
                    }
                }

                close(file_fd);
                // create another thread;
            }
            pthread_t pthread;
            if(links != NULL){
                // pthread_create(&pthread, NULL, prefetch_thread_func, links);
            }
            
           
            // printf("Hostname %s\n", header.hostname_str);
            
            /* Generate and send response */
            // build_and_send_header(&header, &sd);
            
            /* Check if connection should be closed */
            if (header.connection_close == 1 || header.connection_keep_alive == 0)
            {
                goto cleanup;
            }
            /* Clear header for next request */
            memset(&header, 0, sizeof(header));
            memset(recieved_buf, 0, sizeof(recieved_buf));
        }
    }
cleanup:;
    /* Clean up resources before exit */
    close(file_fd);
    close(sd.client_sock_fd);

    return NULL;
}