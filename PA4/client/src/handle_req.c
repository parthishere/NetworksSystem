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
    fd_set readfds;                   /* File descriptor set for select() */
    int file_fd;


        FD_ZERO(&readfds);
        // FD_SET(sd->client_sock_fd, &readfds);

        /* Set timeout period for idle connections */
        struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

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