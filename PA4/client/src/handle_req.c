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


void initialize_and_save(sockDetails_t *sd){
    serverDetails_t *current = sd->servers_details;
    while(current){
        printf("hellow \n");

        struct addrinfo hints, *temp;
        char ip[INET6_ADDRSTRLEN];
    
        int status;
        int sockfd;
    
        /* Configure address hints structure */
        memset(&hints, 0, sizeof(hints));
        hints.ai_family = AF_UNSPEC;
        hints.ai_socktype = SOCK_STREAM; // for TCP

        if (atoi(current->server_port) <= 1024)
        {
            fprintf(stderr, RED "[-] Port Value < 1024 ! keep port value higher than 1024 \n" RESET);
            exit(EXIT_FAILURE);
        }

        printf("server ip %s, server port %s \n", current->server_ip, current->server_port);
        if ((status = getaddrinfo(current->server_ip, current->server_port, &hints, &sd->connect_to_info)) < 0)
        {
            fprintf(stderr, RED "getaddrinfo: %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
            exit(EXIT_FAILURE);                                                   // exit if there is an error
        }

        for (temp = sd->connect_to_info; temp != NULL; temp = temp->ai_next)
        {
            if ((current->client_sock_fd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
            {
                perror(RED "server: socket");
                continue;
            }

            if ((connect(current->client_sock_fd, temp->ai_addr, temp->ai_addrlen)) < 0)
            {
                fprintf(stderr, RED "\n[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
                close(current->client_sock_fd);
                continue;
            }
            
            break;
        }
        
        if (temp == NULL)
        {
            fprintf(stderr, RED "\n[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
            exit(EXIT_FAILURE);
        }

        char s[INET6_ADDRSTRLEN];
        inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
        printf(GRN "[+] (%d) Connection established to server: %s\n"
                   "[+] (%d) Server IP address: %s:%s\n" RESET,
               gettid(), current->server_ip, gettid(), s,
               current->server_port);



        current = current -> next;
    }
}

void connect_save_and_send(sockDetails_t *sd, char *message){
    serverDetails_t *current = sd->servers_details;
    // while(current){
        // current->client_sock_fd

    // }
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
void *handle_req(sockDetails_t *sd)
{
    int numbytes;                     /* Number of bytes received */
    char recieved_buf[RECIEVE_SIZE]; /* Buffer for incoming requests */
    char transmit_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    fd_set readfds;                   /* File descriptor set for select() */
    int file_fd;

    FD_ZERO(&readfds);
    // FD_SET(sd->client_sock_fd, &readfds);

    /* Set timeout period for idle connections */
    struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

    initialize_and_save(sd);

    /* Process user commands through menu interface */
    // switch (sd->command)
    // {
    // case LS:
    //     /* List directory contents */

    //     connect_save_and_send(sd, "ls");
    //     bzero(transmit_buf, sizeof transmit_buf);
    //     snprintf(transmit_buf, sizeof transmit_buf, "ls");
    //     send(sd, sizeof(transmit_buf), transmit_buffer);
    //     // list files
    //     list_files(&sd);
    //     break;
    // case GET:
    //     /* Download file from server */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     if (filename[0] == '\0') // return error
    //     {
    //         printf(RED "[-] File Name is Empty\n" RESET);
    //         break;
    //     }
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "get %s", filename);
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     get_file(&sd, filename);
    //     break;
    // case PUT:
    //     /* Upload file to server */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "put %s", filename);
    //     printf("put %s\n", filename);
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     if (put_file_file(&sd, filename) == -1)
    //     {
    //         put_file(&sd); // Fall back to manual input mode
    //     }
    //     break;

    // case DELETE:
    //     /* Delete file from server */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "delete %s", filename);
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     delete_file(&sd, filename);
    //     break;
    // case EXIT:
    //     /* Clean termination */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "exit");
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     cleanup_resources(&sd);
    //     break;
    // case SERVER_INFO:
    //     // Screen clear requested
    // default:
    //     break;
    // }

    /* Monitor socket for incoming data */
    // int select_status = select(sd->client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
    /* Handle select errors */
    // if (select_status < 0)
    // {
    //     fprintf(stderr, RED "[-] (%d) Select syscall failed with error: %d (%s)\n" RESET,
    //             gettid(), errno, strerror(errno));
    //     break;
    // }

    /* Handle connection timeout */
    //         else if (select_status == 0)
    //         {
    //             printf(YEL "\n[-] (%d) CONNECTION TIMEOUT:\n"
    //                        "[-] Client connection idle for %d seconds\n"
    //                        "------------------------------------------------------------\n" RESET,
    //                    gettid(), TIMEOUT_HTTP_SEC);
    //             break;
    //         }

    //         /* Process incoming data when available */
    //         else if (FD_ISSET(sd->client_sock_fd, &readfds))
    //         {
    //             memset(recieved_buf, 0, sizeof(recieved_buf));
    //             /* Read incoming request with error checking */
    //             int total_bytes = 0;

    //             if ((numbytes = recv(sd->client_sock_fd, &recieved_buf[total_bytes], TRANSMIT_SIZE, 0)) < 0)
    //             {
    //                 break;
    //                 fprintf(stderr, RED "[-] (%d) read\n", gettid());
    //                 // break;
    //             }
    //             // You get a return value of 0 for recv() when the connection was closed by the other host
    //             if (numbytes == 0)
    //             {
    //                 fprintf(stderr, RED "[-] (%d) peer has closed the connection exiting\n", gettid());
    //                 break;
    //             }

    //             total_bytes += (numbytes - 1);

    //             printf("\n\n==============================================================\n"
    //                    "[+] (%d) Received request from client [%d bytes]:\n"
    //                    "==============================================================\n"
    //                    "%s\n",
    //                    gettid(), total_bytes, recieved_buf);

    //             /* Initialize header structure and parse request */
    //             memset(&header, 0, sizeof(HttpHeader_t));
    //             if (parse_request_line_thread_safe(recieved_buf, &header) < 0)
    //             {
    //                 send_error_response(sd->client_sock_fd, header.http_version_str, header.parser_error);
    //                 goto cleanup;
    //             }

    //             if (is_blocked(NULL, header.hostname_str))
    //             {
    //                 printf(RED "[-] (%d) ACCESS DENIED: Domain is in blocklist\n"
    //                            "[-] Blocked domain: %s\n" RESET,
    //                        gettid(), header.hostname_str);

    //                 send_error_response(sd->client_sock_fd, header.http_version_str, FORBIDDEN);

    //                 goto cleanup;
    //             }

    //             int returnval = check_and_send_from_cache(&header, sd, is_dynamic_content(header.uri_str, recieved_buf), 1, 1);

    //             /* Check if connection should be closed */
    //             if ((header.connection_close == 1 && header.connection_keep_alive == 0) || returnval < 0)
    //             {
    //                 goto cleanup;
    //             }
    //             cleanup_header(&header);
    //             memset(recieved_buf, 0, sizeof(recieved_buf));

    //             /* Clear header for next request */
    //         }
    //     }
    // cleanup:;
    //     /* Clean up resources before exit */
    //     cleanup_header(&header);
    //     // Only close the client socket, file_fd is already closed in the handler functions
    //     // or was never opened if we jumped to cleanup without accessing a file
    //     close(sd->client_sock_fd);

    return NULL;
}