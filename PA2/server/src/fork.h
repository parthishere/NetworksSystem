#pragma once

#include "common.h"


void use_fork(sockdetails_t *sd)
{
    int numbytes;
    char buf[TRANSMIT_SIZE];
    // fork implementation
    if (fork() == 0)
    {

        printf("in child fd");
        close(sd->sockfd);

        // we are in the child process now
        if ((numbytes = recv(sd->client_sock_fd, buf, sizeof(buf), 0)) < 0)
        {
            perror("read");
            exit(-1);
        }
        printf("%s", buf);
        bzero(buf, sizeof(buf));
        snprintf(buf, sizeof(buf), "parth is here\n");

        if ((numbytes = send(sd->client_sock_fd, buf, sizeof(buf), 0)) < 0)
        {
            perror("write");
            exit(-1);
        }
        close(sd->client_sock_fd);
        exit(0);
    }
    else
    {

        close(sd->client_sock_fd);
        wait(NULL);
    }
}