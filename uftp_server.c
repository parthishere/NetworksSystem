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
#define RECIEVE_SIZE 256
#define TRANSMIT_SIZE 512 
// this means that we can read uptp 5 mb in total as of now.
#define DATA_SIZE 1024 * 1024 * 5 // 5MB buffer;

#define END_OF_DYNAMIC_DATA			"\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA		"Unable to complete operation\n\t\t\t\0"

/*
SERVER
*/


typedef struct {
    uint8_t total_len; // 2bytes
    uint8_t total_len_of_file; // 2bytes
    uint8_t seqence_num; // 2 bytes
}header_t;

typedef enum {
    GET,
    PUT,
    DELETE,
    LS,
    EXIT,
    number_of_command,
}commands_t;

// #define SCANF 1
// #define FGETS 1

commands_t whichcmd(char *cmd);

void *getin_addr(struct sockaddr *sa){
    if(sa->sa_family == AF_INET){
        return (&(((struct sockaddr_in*)(sa))->sin_addr));
    }
    else if (sa->sa_family == AF_INET6){
        return (&(((struct sockaddr_in6*)(sa))->sin6_addr));
    }
    return NULL;
}


void recieve_and_send(int sockfd){
    struct sockaddr_storage their_addr;
    socklen_t addr_len = sizeof their_addr;

    char recieve_buffer[RECIEVE_SIZE]; //256bytes
    char transmit_buffer[TRANSMIT_SIZE];
    char data_buffer[DATA_SIZE];

    int recvBytes, sentBytes;

    if((recvBytes = recvfrom(sockfd, recieve_buffer, RECIEVE_SIZE, 0, (struct sockaddr *)&their_addr, &addr_len)) < 0){
        perror("recv");
        close(sockfd);
        exit(EXIT_FAILURE);
    }
    printf("[+] recv call successful\n");

    // buf[numbytes] = '\0';
    char *temp_ip = getin_addr((struct sockaddr *)&their_addr);
    printf("server recieve %s from IP %s\n", recieve_buffer, temp_ip);

    commands_t cmd = whichcmd(recieve_buffer);

    
    switch(cmd){
        case LS:
            DIR *dp;
            struct dirent *ep;
            int total_bytes;

            dp = opendir("./");
            
            if(dp != NULL){
                int seq_num = 0;
                while((ep = readdir(dp)) != NULL){
retry:
                    int record_len = strlen(ep->d_name);
                    bzero(transmit_buffer, sizeof(transmit_buffer));

                    memcpy(transmit_buffer, ep->d_name, record_len);

                    char packet[256+1+1+1];
                    packet[0] = record_len;
                    packet[1] = -1;
                    packet[2] = seq_num;

                    *(transmit_buffer + record_len) = '\n';
                    record_len++;
                    memcpy(packet+3, transmit_buffer, record_len);
                    
                    if((sentBytes = sendto(sockfd, packet, (record_len + 1 + 3), 0,(struct sockaddr *)&their_addr, addr_len)) < 0){
                        perror("server: send");
                        close(sockfd);
                        exit(EXIT_FAILURE);
                    }

                    bzero(recieve_buffer, sizeof(recieve_buffer));
                    if((recvBytes = recvfrom(sockfd, recieve_buffer, RECIEVE_SIZE, 0, (struct sockaddr *)&their_addr, &addr_len)) < 0){
                        perror("recv");
                        close(sockfd);
                        exit(EXIT_FAILURE);
                    }
                    printf("server recieve %s \n", recieve_buffer);

                    if(strncmp(recieve_buffer, "ack\t\t\t\0", 7) == 0){
                        printf("rcv ack\n");
                        // got the ack we can append
                        seq_num++;
                        continue;
                    }
                    printf("rcv nack\n");
                    goto retry;
                    
                    
                }

                if((sentBytes = sendto(sockfd, END_OF_DYNAMIC_DATA, sizeof(END_OF_DYNAMIC_DATA), 0,(struct sockaddr *)&their_addr, addr_len)) < 0){
                    perror("server: send");
                    close(sockfd);
                    exit(EXIT_FAILURE);
                }

        
                
                closedir(dp);
            }
            
            puts(data_buffer);
            
            break;

        case GET:
            char *str = strtok(recieve_buffer, " ");
            printf("%s\n", str);
            str = strtok(NULL, " ");
            printf("%s\n", str);

            break;

    }

    /*
    ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
   

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
    
    int status;
    int sockfd;
    
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

    recieve_and_send(sockfd);

    
    close(sockfd);
    

    return EXIT_SUCCESS;
}

// data will be 256 bytes;
// header: total len, total_len of file, seq, data




commands_t whichcmd(char *cmd){
    if(strncmp(cmd, "ls", strlen("ls")) == 0){
        printf("command is ls \n");
        return LS;
    }
    else if(strncmp(cmd, "get", strlen("get")) == 0){
        printf("command is get \n");
        return GET;
    }
    else if(strncmp(cmd, "put", strlen("get")) == 0){
        printf("command is put \n");
        return PUT;
    }
}