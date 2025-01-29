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
#define RECIEVE_SIZE 256
#define TRANSMIT_SIZE 512 
#define DATA_SIZE 1024 * 1024 * 5 // 5MB buffer;

#define END_OF_DYNAMIC_DATA			"\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA		"Unable to complete operation\n\t\t\t\0"

typedef struct {
    uint16_t total_len; // 2bytes
    uint16_t total_len_of_file; // 2bytes
    uint16_t seqence_num; // 2 bytes
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

commands_t print_menu();
commands_t whichcmd(char *cmd);


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
    switch(print_menu()){
        case LS:
            snprintf(buf, sizeof buf, "ls");
            break;
        case GET:
            snprintf(buf, sizeof buf, "get parth");
            break;
        case EXIT:
            break;
    }

   
    if((numbytes = sendto(sockfd, buf, sizeof(buf), 0, (struct sockaddr*)serv_info->ai_addr, addr_len)) < 0){
        perror("client: sendto");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    char recieve_buffer[RECIEVE_SIZE]; //256bytes
    char transmit_buffer[RECIEVE_SIZE]; //256bytes
    int recvBytes, sentBytes;
    int current_count = 0;
    do{
    // while(strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, 4) == 0){
        bzero(recieve_buffer, sizeof(recieve_buffer));
        if((recvBytes = recvfrom(sockfd, recieve_buffer, RECIEVE_SIZE, 0, (struct sockaddr *)serv_info, &addr_len)) < 0){
            perror("client: recvfrom");
            close(sockfd);
            exit(EXIT_FAILURE);
        }

        char *temp_ip = getin_addr((struct sockaddr *)serv_info->ai_addr);
        printf("client recieve %s from IP %s\n", &recieve_buffer[3], temp_ip);


        bzero(transmit_buffer, sizeof(transmit_buffer));
        if(recieve_buffer[2] == current_count){
            memcpy(transmit_buffer, "ack\t\t\t\0", 7);
            current_count++;
        }else{
            memcpy(transmit_buffer, "nack\t\t\t\0", 7);
        }

        if((sentBytes = sendto(sockfd, transmit_buffer, 7, 0, (struct sockaddr*)serv_info->ai_addr, addr_len)) < 0){
            perror("client: sendto");
            close(sockfd);
            exit(EXIT_FAILURE);
        }

    }while(strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, 4) != 0);


   
    // wait for the input;
    // we can use scanf, fgets, read calls to do that


    

    close(sockfd);
    

    return EXIT_SUCCESS;
}

commands_t print_menu(){
    printf("This client can support FTP through UDP\n");
    printf("Currently this program can support following commands \n");
    printf("get <filename> : Get the file name in server and print the file");
    printf("ls : get the list of all the files in server and print it\n");
    printf("exit: exit from the client and free the resources\n");
    printf("put <filename>: if filename does not exists on server, create one\n");
    printf("\n");


#if SCANF == 1
    char cmd[100];
    printf("Enter your choice \n");
    scanf("%s", cmd);
    printf("%s\n", cmd);
    
#elif FGETS == 1
    char cmd[100];
    printf("Enter your choice \n");
    fgets(cmd, sizeof(cmd), stdin);
    printf("%s\n", cmd);

#else
    char cmd[100];
    printf("Enter your choice \n");
    int bytesread = read(STDIN_FILENO, cmd, sizeof(cmd));
    printf("%s\n", cmd);

#endif

    return whichcmd(cmd);
}



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