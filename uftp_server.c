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


int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf(" You messed up, command is ./server <PORT>\n");
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
    struct sockaddr_storage their_addr;
    void *address;
    int status;
    socklen_t sin_size;
    int sockfd;
    int yes = 1;

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE; // fill up my IP address

    char *server_port = argv[1];
    printf("Passed Server Port %s\n", server_port);

    if ((status = getaddrinfo(NULL, server_port, &hints, &serv_info)) < 0)
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
            perror("server: socket");
            exit(EXIT_FAILURE);
            continue;
        }
        printf("[+] socket call successful\n");

        /*
        int setsockopt(int sockfd, int level, int optname,
                      const void optval[.optlen],
                      socklen_t optlen);

        */
        if(setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes)) < 0){
            close(sockfd);
            perror("server: setsockopt");
            continue;
        }
        printf("[+] setsockopt call successful\n");

        /*
        int bind(int sockfd, const struct sockaddr *addr,
                socklen_t addrlen);
        */
        if(bind(sockfd, temp->ai_addr, temp->ai_addrlen) < 0){
            close(sockfd);
            perror("server: bind");
            continue;
        }
        printf("[+] bind call successful\n");

        break;
    }
    freeaddrinfo(serv_info);

    if(temp == NULL){
        fprintf(stderr, "[-] socket connection failed for server \n");
        exit(EXIT_FAILURE);
    }

    if ((status = listen(sockfd, 10)) < 0)
    {
        fprintf(stderr, "error in listen %s\n", gai_strerror(status));
        exit(EXIT_FAILURE);
    }
    printf("[+] listen call successful\n");

    int new_fd;
    char ip[INET6_ADDRSTRLEN];
   
    while (1)
    {
    
        // why we are passing by address here is, we have to allocate the space for thier addr as accept call does not allocate space for the pointer. 
        sin_size = sizeof their_addr;
        new_fd = accept(sockfd, (struct sockaddr *)&their_addr, &sin_size);
        if (new_fd == -1) {
            perror("accept");
            continue;
        }

        if(their_addr.ss_family == AF_INET){
            address = &(((struct sockaddr_in*)&their_addr)->sin_addr);
        }
        else if(their_addr.ss_family == AF_INET6){
            address = &(((struct sockaddr_in6*)&their_addr)->sin6_addr);
        }
        else{
            address = NULL;
        }
        inet_ntop(their_addr.ss_family, address, ip, sizeof(ip));

        printf("server: got connection from %s\n", ip);

        /* 
        ssize_t send(int sockfd, const void buf[.len], size_t len, int flags);
        */
        if(send(new_fd, "hello world!", 13, 0) < 0){
            perror("send");
        }
        close(new_fd);
    }
    

    return EXIT_SUCCESS;
}