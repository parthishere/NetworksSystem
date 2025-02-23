#include "fork.h"

void cleanup_zombie_processes() {
    pid_t pid;
    while ((pid = waitpid(-1, NULL, WNOHANG)) > 0) {
        printf("Cleaned up child process %d\n", pid);
    }
}

void use_fork(sockdetails_t *sd)
{
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE];
    int client_sock_fd;
    HttpHeader_t header;

    int client_socket = sd->client_sock_fd;
    int sever_socket = sd->sockfd;
    
    // fork implementation
    if (fork() == 0)
    {
        close(sever_socket);
        fd_set readfds;
        while (1)
        {
            FD_ZERO(&readfds);
            FD_SET(client_socket, &readfds);
            struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

            int select_status = select(client_socket + 1, &readfds, NULL, NULL, &timeout);
            if (select_status < 0)
            {
                perror(RED "select error");
                break;
            }

            if (select_status == 0)
            {
                printf(YEL "[-] (%d) Connection timed out\n" RESET, gettid());
                break;
            }

            if (FD_ISSET(client_socket, &readfds))
            {
                if ((numbytes = recv(client_socket, recieved_buf, sizeof(recieved_buf), 0)) < 0)
                {
                    perror(RED "[-] read");
                  
                }

                memset(&header, 0, sizeof(HttpHeader_t));
                // parse_request_line(recieved_buf, &header);
                parse_request_line_thread_safe(recieved_buf, &header);

                build_and_send_header(&header, sd);

                if (header.connection_close == 1 || header.connection_keep_alive == 0)
                {
                    break;
                    
                }
                memset(&header, 0, sizeof(header));
            }
        }
        close(client_socket);
        _exit(0);
    }
    else
    {
        close(sd->client_sock_fd);
        // wait(NULL);
    }
}