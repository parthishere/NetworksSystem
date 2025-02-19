#include "fork.h"



void use_fork(sockdetails_t sd)
{
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE];
    int client_sock_fd;
    char *send_buf = NULL;
    HttpHeader_t header;
    // fork implementation
    if (fork() == 0)
    {

        printf("in child fd");
        close(sd.sockfd);

        // we are in the child process now
        if ((numbytes = recv(sd.client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
        {
            perror("read");
            exit(-1);
        }
        int return_size;
        
        parse_request_line(recieved_buf, &header);
        build_header(&header, &send_buf, &return_size);
        
        // parse_request_line(buf, &header);
        // build_header(&header, send_req);

        if ((numbytes = send(sd.client_sock_fd, send_buf, return_size, 0)) < 0)
        {
            perror("write");
            exit(-1);
        }
        free(send_buf);
        close(client_sock_fd);
        exit(0);
    }
    else
    {

        close(sd.client_sock_fd);
        wait(NULL);
    }
}