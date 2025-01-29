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
#include <dirent.h>

#define MAXDATASIZE 100

/*
SERVER
*/

void *getin_addr(struct sockaddr *sa){
    if(sa->sa_family == AF_INET){
        return (&(((struct sockaddr_in*)(sa))->sin_addr));
    }
    else if (sa->sa_family == AF_INET6){
        return (&(((struct sockaddr_in6*)(sa))->sin6_addr));
    }
    return NULL;
}

int main(int argc, char *argv[]){
    if(argc != 2){
        printf(" You messed up, command is ./server <PORT> | current command (%d) %s %s\n", argc, argv[0], argv[1]);
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
    int status;
    int sockfd;
    socklen_t addr_len = sizeof their_addr;
    int numbytes;
    char buf[MAXDATASIZE];
    char ip[INET6_ADDRSTRLEN];

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_flags = AI_PASSIVE; // fill up my IP

    char *server_port = argv[1];
    printf("Passed Server Port %s\n", server_port);

    if((status = getaddrinfo(NULL, server_port, &hints, &serv_info)) < 0){
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE); // exit if there is an error
    }
    printf("[+] getaddrinfo call successful\n");

    for(temp = serv_info; temp != NULL; temp = temp->ai_next){
        /*
        int socket(int domain, int type, int protocol);
        we need domain to be IF_INET (IPv4)
        we need type to be UDP
        and protocol: specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0
        */
        if((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0){
            perror("server: socket");
            continue;
        }
        printf("[+] socket call successful\n");

        /*
        int bind(int sockfd, const struct sockaddr *addr,
                socklen_t addrlen);
        */
        if(bind(sockfd, temp->ai_addr, temp->ai_addrlen) < 0){
            close(sockfd);
            perror("server: bind");
            continue;
        }

        break;
    }

    if(temp == NULL){
        fprintf(stderr, "[-] socket connection failed for server \n");
        close(sockfd);
        exit(EXIT_FAILURE);
    }
    
    
    
    inet_ntop(temp->ai_family, getin_addr(temp->ai_addr), ip, sizeof ip);
    printf("Server recieving UDP packet to : %s\n", ip);

    freeaddrinfo(serv_info); // we do not need this anymore

    
    if((numbytes = recvfrom(sockfd, buf, MAXDATASIZE - 1, 0, (struct sockaddr *)&their_addr, &addr_len)) < 0){
        perror("recv");
        close(sockfd);
        exit(EXIT_FAILURE);
    }
    printf("[+] recv call successful\n");

    buf[numbytes] = '\0';
    char *temp_ip = getin_addr((struct sockaddr *)&their_addr);
    printf("server recieve %s from IP %s\n", buf, temp_ip);

    snprintf(buf, sizeof buf, "hello fuck");
    /*
    ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
    // if((numbytes = sendto(sockfd, buf, MAXDATASIZE - 1, 0,(struct sockaddr *)&their_addr, addr_len)) < 0){
    //     perror("server: send");
    //     close(sockfd);
    //     exit(EXIT_FAILURE);
    // }


    DIR *dp;
    struct dirent *ep;
    dp = opendir("./");
    char dirent[256*100]; // 100 entries max
    char *temp_dirent = dirent;
    if(dp != NULL){
        while((ep = readdir(dp)) != NULL){
            memcpy(temp_dirent, ep->d_name, strlen(ep->d_name));
            temp_dirent += strlen(ep->d_name);
            *temp_dirent = '\n';
            temp_dirent += 1;
            
        }
        closedir(dp);
    }

    puts(dirent);
    if((numbytes = sendto(sockfd, dirent, sizeof(dirent), 0,(struct sockaddr *)&their_addr, addr_len)) < 0){
        perror("server: send");
        close(sockfd);
        exit(EXIT_FAILURE);
    }
    close(sockfd);
    

    return EXIT_SUCCESS;
}