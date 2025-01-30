#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/typer(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET)
    {
        return (&(((struct sockaddr_in *)(sa))->sin_addr));
    }
    else if (sa->sa_family == AF_INET6)
    {
        return (&(((struct sockaddr_in6 *)(sa))->sin6_addr));
    }
    rett total_bytes;

    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];

    dp = opendir("./");
    if (dp != NULL)
    {
        int seq_num = 0;
        while ((ep = readdir(dp)) != NULL)
        {
        retry:
ieve %s \n", recieve_buffer);

            if (strncmp(recieve_buffer, ACK, 7) == 0)
            {
                // got the ack we can append
                seq_num++;
                continue;
            }
            goto retry;
        }

      SEEK_END);
    file_size = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    printf("File size: %li bytes\n", file_size);

    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    
    while ((total_bytes = fread(transmit_bufferntinue;
        }
        else
        {
            retry_count++;
            if (retry_count >= 3)
            {
                printf("Max retries reached. Aborting.\n");
                break;
            }
            printf("retry \n\r");
     ffer);
        break;
    }

    /*
    ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
}

int main(int argc, char *argv[])
{
    if (argc != 2)ily = AF_UNSPEC;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_flags = AI_PASSIVE; // fill up my IP

    char *server_port = argv[1];
    printf("Passed Server Port %s\n", server_port);

    if ((status = getaddrinfo(NULL, server_port, &hints, &serv>ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            perror("server: socket");
            continue;
        }
        printf("[+] socket call successful\n");

        int timeout = 100;
        struct timeval time;
        timderr, "[-] socket connection failed for server \n");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    inet_ntop(temp->ai_family, ge