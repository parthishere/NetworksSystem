#include "handle_req.h"

void *handle_req(void *args)
{
    int numbytes;
    char buf[TRANSMIT_SIZE];
    sockdetails_t *sd = (sockdetails_t *)args;
    while (1)
    {
        printf("withing handle req\n");
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
        // close(sd->client_sock_fd);
    }

    // sleep(10);
    // printf("Fininshed handle req\n");
    return NULL;
}