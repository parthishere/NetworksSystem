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

    while (1)
    {
        FD_ZERO(&readfds);
        FD_SET(sd->client_sock_fd, &readfds);

        /* Set timeout period for idle connections */
        struct timeval timeout = {TIMEOUT_SEC, 0};

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
                   gettid(), TIMEOUT_SEC);
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

            printf("command: (%d) %s\n", total_bytes, recieved_buf);

            if ((numbytes = recv(sd->client_sock_fd, &recieved_buf[total_bytes], TRANSMIT_SIZE, 0)) < 0)
            {
                break;
                fprintf(stderr, RED "[-] (%d) read\n", gettid());
                // break;
            }
           
            printf("\n\n==============================================================\n"
                   "[+] (%d) Received request from client [%d bytes]:\n"
                   "==============================================================\n"
                   "%s\n",
                   gettid(), numbytes, recieved_buf);

            if ((numbytes = recv(sd->client_sock_fd, &recieved_buf[total_bytes], TRANSMIT_SIZE, 0)) < 0)
            {
                break;
                fprintf(stderr, RED "[-] (%d) read\n", gettid());
                // break;
            }



            printf("\n\n==============================================================\n"
                   "[+] (%d) Received request from client [%d bytes]:\n"
                   "==============================================================\n"
                   "%s\n",
                   gettid(), total_bytes, recieved_buf);

            memset(recieved_buf, 0, sizeof(recieved_buf));

            /* Clear header for next request */
        }
    }
cleanup:;
    /* Clean up resources before exit */
    // Only close the client socket, file_fd is already closed in the handler functions
    // or was never opened if we jumped to cleanup without accessing a file
    close(sd->client_sock_fd);

    return NULL;
}

// /**
//  * Process Client Commands and Handle Responses
//  *
//  * Main command processing function that receives client commands,
//  * identifies the requested operation, and dispatches to appropriate handlers.
//  * Supports GET, PUT, DELETE, LS, and EXIT operations.
//  *
//  * Protocol Flow:
//  * 1. Receive command from client
//  * 2. Extract client IP and command
//  * 3. Parse and validate command
//  * 4. Dispatch to appropriate handler
//  *
//  * @param sockfd Socket file descriptor for client communication
//  */
// void recieve_and_send(int sockfd)
// {
//     /* Initialize buffers and structures */
//     char recieve_buffer[RECIEVE_SIZE]; // 256bytes
//     char transmit_buffer[TRANSMIT_SIZE];
//     char ip[INET6_ADDRSTRLEN];

//     int recvBytes, sentBytes;

//     /* Set up socket details structure */
//     sockdetails_t sd;
//     sd.sockfd = sockfd;
//     sd.addr_len = sizeof(sd.their_addr);

//     bzero(recieve_buffer, RECIEVE_SIZE);
//     _recv(&sd, RECIEVE_SIZE, recieve_buffer);

//     /* Log client information */
//     char *temp_ip = getin_addr((struct sockaddr *)&sd.their_addr);
//     printf(GRN "\n\n[+] Recieved Command \"%s\" from IP %s\n" RESET, recieve_buffer, inet_ntop(sd.their_addr.ss_family, temp_ip, ip, sizeof ip));

//      /* Parse command and dispatch to handler */
//     commands_t cmd = whichcmd(recieve_buffer);
//     switch (cmd)
//     {
//     case LS:
//         list_files(&sd);
//         break;

//     case GET:
//         get_file(&sd, recieve_buffer);
//         break;

//     case PUT:
//         put_file(&sd, recieve_buffer);
//         break;

//     case EXIT:
//         cleanup_client_resouces(&sd);
//         break;

//     case DELETE:
//         delete_file(&sd, recieve_buffer);
//         break;

//     default:
//         _send(&sd, strlen(WRONG_COMMAND), WRONG_COMMAND);
//         break;
//     }

//     /*
//     ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
//                       const struct sockaddr *dest_addr, socklen_t addrlen);

//     */
// }
