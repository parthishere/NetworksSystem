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

#include <unistd.h> // For system calls write, read e close
#include <fcntl.h>

#define MAXDATASIZE 100
#define RECIEVE_SIZE 1024*10 // 10KB buffer
#define TRANSMIT_SIZE 1024*10 // 10KB buffer
// this means that we can read uptp 5 mb in total as of now.
#define DATA_SIZE 1024 * 1024 * 5 // 5MB buffer;
#define HEADERSIZE 3

#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"
#define ACK "ack\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA "Unable to complete operation\t\t\t\n\0"
#define FILE_NOT_FOUND ""

typedef enum
{
    GET,
    PUT,
    DELETE,
    LS,
    EXIT,
    number_of_command,
} commands_t;

typedef struct
{
    int sockfd;
    struct sockaddr_storage their_addr;
    int addr_len;
    int recvBytes, sentBytes;
} sockdetails_t;

commands_t whichcmd(char *cmd);

void *getin_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET)
    {
        return (&(((struct sockaddr_in *)(sa))->sin_addr));
    }
    else if (sa->sa_family == AF_INET6)
    {
        return (&(((struct sockaddr_in6 *)(sa))->sin6_addr));
    }
    return NULL;
}

void error(sockdetails_t *sd, char *msg)
{
    sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)&sd->their_addr, sd->addr_len);
    perror(msg);
    close(sd->sockfd);
    exit(EXIT_FAILURE);
}

void _send(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->sentBytes = sendto(sd->sockfd, packet, size, 0, (struct sockaddr *)&sd->their_addr, sd->addr_len)) < 0)
    {
        error(sd, "send");
    }
}

void _recv(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->recvBytes = recvfrom(sd->sockfd, packet, size, 0, (struct sockaddr *)&sd->their_addr, &sd->addr_len)) < 0)
    {
        error(sd, "recv");
    }
}

void list_files(sockdetails_t *sd)
{
    DIR *dp;
    struct dirent *ep;
    int total_bytes;

    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];

    dp = opendir("./");
    if (dp != NULL)
    {
        int seq_num = 0;
        while ((ep = readdir(dp)) != NULL)
        {
        retry:
            int record_len = strlen(ep->d_name);
            bzero(transmit_buffer, sizeof(transmit_buffer));

            memcpy(transmit_buffer, ep->d_name, record_len);

            char packet[TRANSMIT_SIZE + HEADERSIZE];
            packet[0] = record_len; // packet lenght
            packet[1] = -1;         // total lenght
            packet[2] = seq_num;    // seq number

            // for better readability
            *(transmit_buffer + record_len) = '\n';
            record_len++;

            memcpy(packet + HEADERSIZE, transmit_buffer, record_len);
            _send(sd, record_len + HEADERSIZE, packet);

            bzero(recieve_buffer, sizeof(recieve_buffer));
            _recv(sd, RECIEVE_SIZE, recieve_buffer);
            printf("server recieve %s \n", recieve_buffer);

            if (strncmp(recieve_buffer, ACK, 7) == 0)
            {
                // got the ack we can append
                seq_num++;
                continue;
            }
            goto retry;
        }

        _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

        closedir(dp);
    }
}

void get_file(sockdetails_t *sd, char *recieve_buffer)
{
    char filename[50];
    sscanf(&recieve_buffer[4], "%s", filename);
    if (filename[0] == '\0')
    {
        printf("File not found");
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        return;
    }

    size_t file_size;
    DIR *dp;
    struct dirent *ep;
    int total_bytes;
    int seq_num = 0;
    int retry_count = 0;

    char transmit_buffer[TRANSMIT_SIZE];

    int fd = open(filename, O_RDONLY);
    if(fd < 0){
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        return;
    }

    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);

    while ((total_bytes = read(fd, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE)) > 0)
    {
    retry:
        transmit_buffer[0] = (total_bytes & 0x00FF);
        transmit_buffer[1] = (total_bytes & 0xFF00) >> 8;
        transmit_buffer[2] = seq_num;
        printf("first char ->> %c %c %c %c %c %c\n", transmit_buffer[HEADERSIZE], transmit_buffer[HEADERSIZE+1], transmit_buffer[HEADERSIZE+2], transmit_buffer[HEADERSIZE+3], transmit_buffer[HEADERSIZE+4], transmit_buffer[HEADERSIZE+5]);

        printf("Sending packet %d (length: %d (%d %d))\n", seq_num, total_bytes, transmit_buffer[0], transmit_buffer[1]);
        printf("%s", transmit_buffer + HEADERSIZE);
        _send(sd, total_bytes + HEADERSIZE, transmit_buffer);

        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        if (strncmp(recieve_buffer, ACK, 7) == 0)
        {
            bzero(transmit_buffer, TRANSMIT_SIZE);
            seq_num++;
            continue;
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
            goto retry;
        }
    }

    _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

    // fclose(fp);
    close(fd);
}

void recieve_and_send(int sockfd)
{
    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];

    int recvBytes, sentBytes;

    sockdetails_t sd;
    sd.sockfd = sockfd;
    sd.addr_len = sizeof(sd.their_addr);

    _recv(&sd, RECIEVE_SIZE, recieve_buffer);
    printf("[+] recv call successful\n");

    char *temp_ip = getin_addr((struct sockaddr *)&sd.their_addr);
    printf("server recieve %s from IP %s\n", recieve_buffer, temp_ip);

    commands_t cmd = whichcmd(recieve_buffer);

    switch (cmd)
    {
    case LS:
        list_files(&sd);
        break;

    case GET:
        get_file(&sd, recieve_buffer);
        break;
    }

    /*
    ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
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

    if ((status = getaddrinfo(NULL, server_port, &hints, &serv_info)) < 0)
    {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE);                                         // exit if there is an error
    }
    printf("[+] getaddrinfo call successful\n");

    for (temp = serv_info; temp != NULL; temp = temp->ai_next)
    {
        /*
        int socket(int domain, int type, int protocol);
        we need domain to be IF_INET (IPv4)
        we need type to be UDP
        and protocol: specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0
        */
        if ((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            perror("server: socket");
            continue;
        }
        printf("[+] socket call successful\n");

        int timeout = 100;
        struct timeval time;
        time.tv_sec = 5;
        time.tv_usec = 0;

        int yes = 1;

        // if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1 ||
        //     setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, &time, sizeof(time)) == -1 ||
        //     setsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO, &time, sizeof(time)) == -1)
        // {
        //     perror("setsockopt");
        //     exit(1);
        // }

        /*
        int bind(int sockfd, const struct sockaddr *addr,
                socklen_t addrlen);
        */
        if (bind(sockfd, temp->ai_addr, temp->ai_addrlen) < 0)
        {
            close(sockfd);
            perror("server: bind");
            continue;
        }

        break;
    }

    if (temp == NULL)
    {
        fprintf(stderr, "[-] socket connection failed for server \n");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    inet_ntop(temp->ai_family, getin_addr(temp->ai_addr), ip, sizeof ip);
    printf("Server recieving UDP packet to : %s\n", ip);

    freeaddrinfo(serv_info); // we do not need this anymore

    bool exit = false;
    while (true)
    {
        recieve_and_send(sockfd);
    }

    close(sockfd);

    return EXIT_SUCCESS;
}

// data will be 256 bytes;
// header: total len, total_len of file, seq, data

commands_t whichcmd(char *cmd)
{
    if (strncmp(cmd, "ls", strlen("ls")) == 0)
    {
        printf("command is ls \n");
        return LS;
    }
    else if (strncmp(cmd, "get", strlen("get")) == 0)
    {
        printf("command is get \n");
        return GET;
    }
    else if (strncmp(cmd, "put", strlen("get")) == 0)
    {
        printf("command is put \n");
        return PUT;
    }
}