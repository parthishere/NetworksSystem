/**
 * @file fork.c
 * @brief Fork-based Connection Handler Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements connection handling using process forking,
 * providing process isolation for each client connection. It includes
 * zombie process cleanup and proper resource management for both
 * parent and child processes.
 */

#include "fork.h"


/**
 * @function cleanup_zombie_processes
 * @brief Cleans up terminated child processes to prevent zombie processes
 * 
 * This function performs non-blocking cleanup of terminated child processes by:
 * 1. Using waitpid() with WNOHANG to check for terminated children
 * 2. Continuing cleanup until no more terminated children are found
 * 3. Logging each cleanup operation for monitoring
 * 
 * @note This should be called periodically or in response to SIGCHLD
 */
void cleanup_zombie_processes() {
    pid_t pid;
    while ((pid = waitpid(-1, NULL, WNOHANG)) > 0) {
        printf("Cleaned up child process %d\n", pid);
    }
}


/**
 * @function use_fork
 * @brief Handles client connections using process forking
 * 
 * @param sd Pointer to socket details structure
 * 
 * This function implements a forking server model that:
 * 1. Creates a new process for each client connection
 * 2. Manages socket descriptors in both parent and child
 * 3. Implements timeout handling using select()
 * 4. Processes HTTP requests in the child process
 * 5. Ensures proper cleanup of resources
 * 
 * Process Management:
 * - Parent process: Closes client socket and continues accepting
 * - Child process: Closes server socket and handles client communication
 */
void use_fork(sockdetails_t *sd)
{
    int numbytes;                        /* Bytes received from client */
    char recieved_buf[TRANSMIT_SIZE];    /* Buffer for incoming requests */
    int client_sock_fd;                  /* Client socket descriptor */
    HttpHeader_t header;                 /* HTTP header structure */

    /* Store socket descriptors for clarity */
    int client_socket = sd->client_sock_fd;
    int sever_socket = sd->sockfd;
    
    // fork implementation
    if (fork() == 0)
    {
        close(sever_socket);  /* Child doesn't need server socket */
        
        fd_set readfds;  /* File descriptor set for select() */
        while (1)
        {
            /* Initialize select() parameters */
            FD_ZERO(&readfds);
            FD_SET(client_socket, &readfds);
            struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

            /* Monitor client socket for activity */
            int select_status = select(client_socket + 1, &readfds, NULL, NULL, &timeout);
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

            /* Process incoming data */
            if (FD_ISSET(client_socket, &readfds))
            {
                /* Read client request */
                if ((numbytes = recv(client_socket, recieved_buf, sizeof(recieved_buf), 0)) < 0)
                {
                    perror(RED "[-] read");
                }

                /* Parse and process HTTP request */
                memset(&header, 0, sizeof(HttpHeader_t));
                parse_request_line_thread_safe(recieved_buf, &header);

                /* Generate and send response */
                build_and_send_header(&header, sd);

                /* Check if connection should be closed */
                if (header.connection_close == 1 || header.connection_keep_alive == 0)
                {
                    break;
                    
                }
                memset(&header, 0, sizeof(header));
            }
        }
        
        /* Clean up and exit child process */
        close(client_socket);
        _exit(0); /* Use _exit() in forked child */
    }
    else
    {
        close(sd->client_sock_fd);
        /* Note: Zombie cleanup handled by cleanup_zombie_processes() */
    }
}