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

    printf("something came \n");
    while (1)
    {
        /* Initialize select() parameters */
        FD_ZERO(&readfds);
        FD_SET(sd.client_sock_fd, &readfds);

        /* Set timeout period for idle connections */
        struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

        printf("something came %d \n", sd.client_sock_fd);
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
            /* Read incoming request with error checking */
            if ((numbytes = recv(sd.client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
            {
                perror(RED "[-] read");
                return NULL;
            }

            printf("recieved_buf : %s\n\n", recieved_buf);
            /* Initialize header structure and parse request */
            memset(&header, 0, sizeof(HttpHeader_t));
            if(parse_request_line_thread_safe(recieved_buf, &header) < 0){
                // error
                printf("Error !\n");
                break;
            }
            if(is_blocked(NULL, header.hostname_str)){
                break;
            }

            int file_fd;
            if(file_fd = cache_lookup(NULL, header.hostname_str, header.uri_str, 10) < 0){
                // failed create a new socket!
                sockdetails_t sd;
                sd.addr_len = sizeof(sd.client_info);

                struct addrinfo hints, *temp;

                memset(&hints, 0, sizeof(hints));
                hints.ai_family = AF_UNSPEC;
                hints.ai_socktype = SOCK_STREAM; // for TCP
                
                if ((getaddrinfo(header.hostname_str, header.hostname_port_str, &hints, &sd.server_info)) < 0)
                {
                    fprintf(stderr, RED "getaddrinfo\n" RESET); // this will print error to stderr fd
                    exit(EXIT_FAILURE);                                                   // exit if there is an error
                }
                printf(GRN "[+] getaddrinfo call successful\n" RESET);
                printf(" Host name %s, port name %s\n\r", header.hostname_str, header.hostname_port_str);

                for (temp = sd.server_info; temp != NULL; temp = temp->ai_next)
                {
                    /*
                    int socket(int domain, int type, int protocol);
                    we need domain to be IF_INET (IPv4)
                    we need type to be UDP
                    and protocol: specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0
                    */
                    if ((sd.sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
                    {
                        perror(RED "server: socket");
                        continue;
                    }
                    printf(GRN "[+] socket call successful\n" RESET);
                    
                    // if()

                    break;
                }

                if(temp == NULL){
                    fprintf(stderr, RED "[-] socket connection failed for server \n" RESET);
                    close(sd.sockfd);
                    exit(EXIT_FAILURE);
                }

                if((sd.client_sock_fd = connect(sd.sockfd, sd.server_info->ai_addr, sd.server_info->ai_addrlen)) < 0){
                    fprintf(stderr, RED "[-] connect failed for server %d\n" RESET, errno);
                    close(sd.sockfd);
                    exit(EXIT_FAILURE);
                }

                const char *connection_type = header.connection_keep_alive ? "Connection: Keep-alive" : "Connection: close";
                printf("waiting for send ?? \n");
                char *send_req = "GET  /index.html HTTP/1.1\r\nHost: localhost:8080";
                if(send(sd.client_sock_fd, send_req, strlen(send_req), 0) < 0){
                    fprintf(stderr, RED "[-] send failed for server %d \n" RESET, errno);
                    close(sd.sockfd);
                    close(sd.client_sock_fd);
                    exit(EXIT_FAILURE);
                }
                printf("Sent\n\r");

                char recv_buf[RECIEVE_SIZE];
                if(recv(sd.client_sock_fd, recv_buf, sizeof(recv_buf), 0) < 0){
                    fprintf(stderr, RED "[-] recv failed for server \n" RESET);
                    close(sd.sockfd);
                    close(sd.client_sock_fd);
                    exit(EXIT_FAILURE);
                }

                printf("recv buf %s\n", recv_buf);
                /* Handle header construction errors */
               



            }
            else{
                // file_fd

                // create another thread;
            }

           
            // printf("Hostname %s\n", header.hostname_str);

            //         
            
            printf("lets see if its working\n");

            /* Generate and send response */
            // build_and_send_header(&header, &sd);

            /* Check if connection should be closed */
            if (header.connection_close == 1 || header.connection_keep_alive == 0)
            {
                break;
            }
            /* Clear header for next request */
            memset(&header, 0, sizeof(header));
        }
    }

    /* Clean up resources before exit */
    close(sd.client_sock_fd);

    return NULL;
}