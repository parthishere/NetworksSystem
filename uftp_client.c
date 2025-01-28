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
#include <sys/types.h>
#include <sys/socket.h>

#define MAXDATASIZE 100

void *getin_addr(struct sockaddr *sa){
    if(sa->sa_family == AF_INET){
        return &(((struct sockaddr_in*)(sa))->sin_addr);
    }
    else if (sa->sa_family == AF_INET6){
        return &(((struct sockaddr_in6*)(sa))->sin6_addr);
    }
    return NULL;
}


int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf(" You messed up, command is ./client <SERVER_IP> <SERVER_PORT>\n");
        exit(EXIT_FAILURE);
    }

    /*
    struct addrinfo {
               int              ai_flags;
               int              ai_family;
               int              ai_socktype;
               int              ai_protocol;
               socklen_t        ai_addrlen;
               struct sockaddr *ai_addr;
               char            *ai_canonname;
               struct addrinfo *ai_next;
           };

    */
    struct addrinfo hints, *serv_info, *temp;
    int status;
    int sockfd;
    socklen_t addr_len = sizeof(struct addrinfo);
    int numbytes;
    char buf[MAXDATASIZE];
    char ip[INET6_ADDRSTRLEN];

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC; // AF_INET
    hints.ai_socktype = SOCK_DGRAM;

    char *server_address = argv[1];
    printf("Passed Server Address %s\n", server_address);
    char *server_port = argv[2];
    printf("Passed Server Port %s\n", server_port);

    if ((status = getaddrinfo(server_address, server_port, &hints, &serv_info)) < 0)
    {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE);                                         // exit if there is an error
    }
    printf("[+] getaddrinfo call successful\n");

    /*
        int socket(int domain, int type, int protocol);
        we need domain to be IF_INET (IPv4)
        we need type to be UDP
        and protocol: specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0
    */
    for (temp = serv_info; temp != NULL; temp = temp->ai_next)
    {
        if ((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            perror("client: socket");
            exit(EXIT_FAILURE);
            continue;
        }
        printf("[+] socket call successful\n");

        break;
    }
    freeaddrinfo(serv_info);

    if(temp == NULL){
        fprintf(stderr, "[-] socket connection failed for client \n");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    /* 
     ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
   snprintf(buf, sizeof buf, "hello world!");
    if((numbytes = sendto(sockfd, buf, sizeof(buf), 0, (struct sockaddr*)serv_info->ai_addr, addr_len)) < 0){
        perror("client: sendto");
        close(sockfd);
        exit(EXIT_FAILURE);
    }



    if((numbytes = recvfrom(sockfd, buf, MAXDATASIZE -1, 0, (struct sockaddr *)serv_info, &addr_len)) < 0){
        perror("client: recvfrom");
        close(sockfd);
        exit(EXIT_FAILURE);
    }
    
    buf[numbytes] = '\0';
    char *temp_ip = getin_addr((struct sockaddr *)serv_info->ai_addr);
    printf("client recieve %s from IP %s\n", buf, temp_ip);

    close(sockfd);
    

    return EXIT_SUCCESS;
}