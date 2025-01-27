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


int main(int argc, char *argv[]){
    if(argc != 3){
        printf(" You messed up, command is ./client <SERVER_IP> <SERVER_PORT> | current command (%d) %s %s %s\n", argc, argv[0], argv[1], argv[2]);
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
    char ip[INET6_ADDRSTRLEN];
    void* address;  

    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    // hints.ai_flags = 

    char *server_address = argv[1];
    printf("Passed Server Address %s\n", server_address);
    char *server_port = argv[2];
    printf("Passed Server Port %s\n", server_port);

    if((status = getaddrinfo(server_address, server_port, &hints, &serv_info)) < 0){
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE); // exit if there is an error
    }
    printf("[+] getaddrinfo call successful\n");

    for(temp = serv_info; temp != NULL; temp = temp->ai_next){
        if((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0){
            perror("socket");
            continue;
        }
        printf("[+] socket call successful\n");


        if((connect(sockfd, temp->ai_addr, temp->ai_addrlen) == -1)){
            close(sockfd);
            perror("client: connect");
            continue;
        }
        printf("[+] connect call successful\n");

        break;
    }

    if(temp == NULL){
        fprintf(stderr, "client: failed to connect \n");
        exit(EXIT_FAILURE);
    }
    
    if(temp->ai_addr->sa_family == AF_INET){
        address = &(((struct sockaddr_in*)(temp->ai_addr))->sin_addr);
    }
    else if (temp->ai_addr->sa_family == AF_INET6){
        address = &(((struct sockaddr_in6*)(temp->ai_addr))->sin6_addr);
    }
    else{
        address = NULL;
    }
    
    inet_ntop(temp->ai_family, address, ip, sizeof ip);
    printf("Client connecting to : %s\n", ip);

    freeaddrinfo(serv_info); // we do not need this anumore

    int numbytes;
    char buf[MAXDATASIZE];
    if((numbytes = recv(sockfd, buf, MAXDATASIZE - 1, 0)) < 0){
        perror("recv");
        exit(EXIT_FAILURE);
    }
    printf("[+] recv call successful\n");

    buf[numbytes] = '\0';
    printf("client recieve %s\n", buf);
    close(sockfd);


    /*
        int socket(int domain, int type, int protocol);
        we need domain to be IF_INET (IPv4)
        we need type to be UDP
        and protocol: specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0
    */
    if((sockfd = socket(AF_INET, SOCK_DGRAM, 0))){
        perror("socket");
        exit(EXIT_FAILURE);
    }



    return EXIT_SUCCESS;
}