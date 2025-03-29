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
            // if(parse_request_line_thread_safe(recieved_buf, &header) < 0){
            //     // error
            //     printf("Error !\n");
            // }

            sockdetails_t sd;
            sd.addr_len = sizeof(sd.client_info);
            printf("Hostname %s\n", header.hostname_str);

            // init_socket(&sd, header.hostname_port_str, header.hostname_str);            
            
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