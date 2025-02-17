#include "fork.h"


void use_fork(sockdetails_t *sd)
{
    int numbytes;
    char buf[TRANSMIT_SIZE];
    int client_sock_fd;
    // fork implementation
    if (fork() == 0)
    {

        printf("in child fd");
        close(sd->sockfd);

        if ((client_sock_fd = accept(sd->sockfd, (struct sockaddr *)&sd->client_info, &sd->addr_len)) < 0)
        {
            perror("accept");
            exit(1);
        }

        // we are in the child process now
        if ((numbytes = recv(client_sock_fd, buf, sizeof(buf), 0)) < 0)
        {
            perror("read");
            exit(-1);
        }
        printf("%s", buf);
        // HttpHeader_t header;
        char send_req[1024*100];
        
        // parse_request_line(buf, &header);
        // build_header(&header, send_req);

        if ((numbytes = send(client_sock_fd, buf, sizeof(buf), 0)) < 0)
        {
            perror("write");
            exit(-1);
        }
        close(client_sock_fd);
        exit(0);
    }
    else
    {

        close(sd->client_sock_fd);
        wait(NULL);
    }
}