#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

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

#define RED "\x1B[31m"
#define GRN "\x1B[32m"
#define YEL "\x1B[33m"
#define BLU "\x1B[34m"
#define MAG "\x1B[35m"
#define CYN "\x1B[36m"
#define WHT "\x1B[37m"
#define RESET "\x1B[0m"

#define MAXDATASIZE 100
#define RECIEVE_SIZE 1024 * 30
#define TRANSMIT_SIZE 1024 * 30
#define HEADERSIZE 5

#define TIMEOUT 5

#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"
#define ACK "ack\t\t\t\0"
#define NACK "nack\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\t\t\n\0"
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\t\t\n\0"
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\t\t\n\0"
#define WRONG_COMMAND "WRONG_COMMAND\t\t\t\n\0"

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

// 8-bit CRC using the polynomial x^8+x^6+x^3+x^2+1, 0x14D.
// Chosen based on Koopman, et al. (0xA6 in his notation = 0x14D >> 1):
// http://www.ece.cmu.edu/~koopman/roses/dsn04/koopman04_crc_poly_embedded.pdf
//
// This implementation is reflected, processing the least-significant bit of the
// input first, has an initial CRC register value of 0xff, and exclusive-or's
// the final register value with 0xff. As a result the CRC of an empty string,
// and therefore the initial CRC value, is zero.
//
// The standard description of this CRC is:
// width=8 poly=0x4d init=0xff refin=true refout=true xorout=0xff check=0xd8
// name="CRC-8/KOOP"

static unsigned char const crc8_table[] = {
    0xea, 0xd4, 0x96, 0xa8, 0x12, 0x2c, 0x6e, 0x50, 0x7f, 0x41, 0x03, 0x3d,
    0x87, 0xb9, 0xfb, 0xc5, 0xa5, 0x9b, 0xd9, 0xe7, 0x5d, 0x63, 0x21, 0x1f,
    0x30, 0x0e, 0x4c, 0x72, 0xc8, 0xf6, 0xb4, 0x8a, 0x74, 0x4a, 0x08, 0x36,
    0x8c, 0xb2, 0xf0, 0xce, 0xe1, 0xdf, 0x9d, 0xa3, 0x19, 0x27, 0x65, 0x5b,
    0x3b, 0x05, 0x47, 0x79, 0xc3, 0xfd, 0xbf, 0x81, 0xae, 0x90, 0xd2, 0xec,
    0x56, 0x68, 0x2a, 0x14, 0xb3, 0x8d, 0xcf, 0xf1, 0x4b, 0x75, 0x37, 0x09,
    0x26, 0x18, 0x5a, 0x64, 0xde, 0xe0, 0xa2, 0x9c, 0xfc, 0xc2, 0x80, 0xbe,
    0x04, 0x3a, 0x78, 0x46, 0x69, 0x57, 0x15, 0x2b, 0x91, 0xaf, 0xed, 0xd3,
    0x2d, 0x13, 0x51, 0x6f, 0xd5, 0xeb, 0xa9, 0x97, 0xb8, 0x86, 0xc4, 0xfa,
    0x40, 0x7e, 0x3c, 0x02, 0x62, 0x5c, 0x1e, 0x20, 0x9a, 0xa4, 0xe6, 0xd8,
    0xf7, 0xc9, 0x8b, 0xb5, 0x0f, 0x31, 0x73, 0x4d, 0x58, 0x66, 0x24, 0x1a,
    0xa0, 0x9e, 0xdc, 0xe2, 0xcd, 0xf3, 0xb1, 0x8f, 0x35, 0x0b, 0x49, 0x77,
    0x17, 0x29, 0x6b, 0x55, 0xef, 0xd1, 0x93, 0xad, 0x82, 0xbc, 0xfe, 0xc0,
    0x7a, 0x44, 0x06, 0x38, 0xc6, 0xf8, 0xba, 0x84, 0x3e, 0x00, 0x42, 0x7c,
    0x53, 0x6d, 0x2f, 0x11, 0xab, 0x95, 0xd7, 0xe9, 0x89, 0xb7, 0xf5, 0xcb,
    0x71, 0x4f, 0x0d, 0x33, 0x1c, 0x22, 0x60, 0x5e, 0xe4, 0xda, 0x98, 0xa6,
    0x01, 0x3f, 0x7d, 0x43, 0xf9, 0xc7, 0x85, 0xbb, 0x94, 0xaa, 0xe8, 0xd6,
    0x6c, 0x52, 0x10, 0x2e, 0x4e, 0x70, 0x32, 0x0c, 0xb6, 0x88, 0xca, 0xf4,
    0xdb, 0xe5, 0xa7, 0x99, 0x23, 0x1d, 0x5f, 0x61, 0x9f, 0xa1, 0xe3, 0xdd,
    0x67, 0x59, 0x1b, 0x25, 0x0a, 0x34, 0x76, 0x48, 0xf2, 0xcc, 0x8e, 0xb0,
    0xd0, 0xee, 0xac, 0x92, 0x28, 0x16, 0x54, 0x6a, 0x45, 0x7b, 0x39, 0x07,
    0xbd, 0x83, 0xc1, 0xff};

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

// Return the CRC-8 of data[0..len-1] applied to the seed crc. This permits the
// calculation of a CRC a chunk at a time, using the previously returned value
// for the next seed. If data is NULL, then return the initial seed. See the
// test code for an example of the proper usage.
unsigned crc8(unsigned crc, unsigned char const *data, size_t len)
{
    if (data == NULL)
        return 0;
    crc &= 0xff;
    unsigned char const *end = data + len;
    while (data < end)
        crc = crc8_table[crc ^ *data++];
    return crc;
}

// crc = crc8(crc, buf, len);

void error(sockdetails_t *sd, char *msg)
{
    printf(RED "[-] Error somewhere ! Check below message to see details \n" RESET);

    perror(msg);
    if (errno == EAGAIN || errno == EWOULDBLOCK)
    {
        printf(RED "[-] Timeout\n" RESET);
    }
    else
    {
        sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)&sd->their_addr, sd->addr_len);
        // close(sd->sockfd);
        // exit(EXIT_FAILURE);
    }
}

void _send(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->sentBytes = sendto(sd->sockfd, packet, size, 0, (struct sockaddr *)&sd->their_addr, sd->addr_len)) < 0)
    {
        error(sd, "[-] send");
    }
}

void _recv(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->recvBytes = recvfrom(sd->sockfd, packet, size, 0, (struct sockaddr *)&sd->their_addr, &sd->addr_len)) < 0)
    {
        error(sd, "[-] recv");
    }
}

void set_timeout(sockdetails_t *sd, int sec)
{

    struct timeval timeout;
    timeout.tv_sec = sec;
    timeout.tv_usec = 0;

    if (setsockopt(sd->sockfd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) == -1)
    {
        perror("setsockopt");
        exit(1);
    }
}

void remove_timeout(sockdetails_t *sd)
{
    struct timeval timeout;
    timeout.tv_sec = 0;
    timeout.tv_usec = 0;

    if (setsockopt(sd->sockfd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) == -1)
    {
        perror("setsockopt");
        exit(1);
    }
}

void list_files(sockdetails_t *sd)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nLS\n\n");
    DIR *dp;
    struct dirent *ep;
    int total_bytes;

    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];
    uint8_t crc = crc8(0, NULL, 0);
    dp = opendir("./");
    if (dp != NULL)
    {
        int seq_num = 0;
        while ((ep = readdir(dp)) != NULL)
        {
        retry:;
            int record_len = strlen(ep->d_name);
            bzero(transmit_buffer, sizeof(transmit_buffer));

            memcpy(transmit_buffer, ep->d_name, record_len);

            char packet[TRANSMIT_SIZE + HEADERSIZE];
            packet[0] = (record_len & 0x00FF); // packet lenght
            packet[1] = ((record_len & 0xFF00) >> 8);
            packet[2] = (seq_num & 0x00FF);
            packet[3] = (seq_num & 0xFF00) >> 8;
            crc = crc8(crc, transmit_buffer, record_len); // crc
            packet[4] = crc;

            // for better readability
            *(transmit_buffer + record_len) = '\n';
            record_len++;

            memcpy(packet + HEADERSIZE, transmit_buffer, record_len);
            _send(sd, record_len + HEADERSIZE, packet);
            printf(MAG "> %s" RESET, transmit_buffer);

            bzero(recieve_buffer, sizeof(recieve_buffer));
            _recv(sd, RECIEVE_SIZE, recieve_buffer);

            if (strncmp(recieve_buffer, ACK, 7) == 0)
            {
                // got the ack we can append
                seq_num++;
                continue;
            }
            printf(RED "[-] NACK -> Retry sending the packet\n" RESET);
            goto retry;
        }

        _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

        closedir(dp);
    }
    remove_timeout(sd);
}

void get_file(sockdetails_t *sd, char *recieve_buffer)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nGET\n\n");
    char filename[50];
    sscanf(&recieve_buffer[strlen("get") + 1], "%s", filename);
    if (filename[0] == '\0')
    {
        printf(RED "[-] File Name is Empty" RESET);
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
    if (fd < 0)
    {
        printf(RED "[-] Error Opening File \n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        return;
    }

    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    uint8_t crc = crc8(0, NULL, 0);
    while ((total_bytes = read(fd, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE)) > 0)
    {
        if (seq_num >= 0xFFFF)
        {
            break;
        }
    retry:;
        transmit_buffer[0] = (total_bytes & 0x00FF);
        transmit_buffer[1] = (total_bytes & 0xFF00) >> 8;
        transmit_buffer[2] = (seq_num & 0x00FF);
        transmit_buffer[3] = (seq_num & 0xFF00) >> 8;
        crc = crc8(crc, &transmit_buffer[HEADERSIZE], total_bytes); // crc
        transmit_buffer[4] = crc;

        printf("\nSending packet %d (length: %d (%d %d))\n", seq_num, total_bytes, transmit_buffer[0], transmit_buffer[1]);
        printf(MAG "> %s" RESET, transmit_buffer + HEADERSIZE);
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
                retry_count = 0;
                printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                break;
            }
            printf(RED "[-]  NACK -> Retry sending the packet \n\r" RESET);
            goto retry;
        }
    }

    printf(GRN "\n\n-- End Of File --\n\n" RESET);
    _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

    close(fd);
    remove_timeout(sd);
}

void put_file(sockdetails_t *sd, char *recieve_buffer)
{
    set_timeout(sd, 100);
    printf("\n\nPUT\n\n");
    char filename[50];
    sscanf(&recieve_buffer[strlen("put") + 1], "%s", filename);
    if (filename[0] == '\0')
    {
        printf(RED "[-] File Name is Empty" RESET);
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
    int current_count = 0;

    int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0)
    {
        printf(RED "[-] Error Opening File \n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        return;
    }

    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    uint8_t crc = crc8(0, NULL, 0);
    while (1)
    {
    retry:;
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA)) == 0)
        {
            printf(GRN "\n\n--- End of file received. --\n\n" RESET);
            close(fd);
            break;
        }

        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            close(fd);
            return;
        }

        int seq_num = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];
        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        printf("CRC %d %d\n", crc_server, crc);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        if ((unsigned)crc_server == (unsigned)crc && seq_num == current_count)
        {
            retry_count = 0;
            memcpy(transmit_buffer, ACK, strlen(ACK));
            _send(sd, strlen(ACK), transmit_buffer);
            current_count++;
        }
        else
        {
            retry_count++;
            if (retry_count >= 3)
                break;
            printf(RED "[-]  Sequence number does not match, asking to re-send the packet Seq:%d(%d) crc_recv %d(%d) \n\r" RESET, seq_num, current_count, crc, crc_server);
            memcpy(transmit_buffer, NACK, strlen(NACK));
            _send(sd, strlen(NACK), transmit_buffer);
            continue;
        }

        printf(MAG "%s\n" RESET, recieve_buffer + HEADERSIZE);
        total_bytes = write(fd, &recieve_buffer[HEADERSIZE], data_length);
    }
    printf(GRN "\n\n[+] Wrote \"%s\" file to current folder\n\n" RESET, filename);
    remove_timeout(sd);
}

void delete_file(sockdetails_t *sd, char *recieve_buffer)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nDELETE\n\n");
    char filename[50];
    sscanf(&recieve_buffer[strlen("delete") + 1], "%s", filename);
    if (filename[0] == '\0')
    {
        printf(RED "[-] File Name is Empty\n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        return;
    }

    DIR *dp;
    struct dirent *ep;
    int total_bytes;

    char transmit_buffer[TRANSMIT_SIZE];
    dp = opendir("./");
    if (dp != NULL)
    {
        int seq_num = 0;
        while ((ep = readdir(dp)) != NULL)
        {
            if (strncmp(ep->d_name, filename, strlen(ep->d_name)) == 0)
            {
                printf(GRN "[+] Found the file %s, deleting it\n" RESET, filename);
                bzero(transmit_buffer, sizeof(transmit_buffer));
                _send(sd, sizeof(ACK), ACK);
                remove(ep->d_name);
                closedir(dp);
                return;
            }
        }

        printf(RED "[-] Could not find the file: %s\n" RESET, filename);
        _send(sd, strlen(FILE_NOT_FOUND), FILE_NOT_FOUND);
        closedir(dp);
    }
    else
    {
        printf(RED "[-] Something went wrong while opening PWD\n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
    }
    remove_timeout(sd);
}

void cleanup_client_resouces(sockdetails_t *sd)
{
    char transmit_buffer[TRANSMIT_SIZE];
    bzero(transmit_buffer, TRANSMIT_SIZE);
    snprintf(transmit_buffer, sizeof(ACK), ACK);
    _send(sd, TRANSMIT_SIZE, transmit_buffer);
    // something cleanup, we will use child processes to make it more useable !
}

void recieve_and_send(int sockfd)
{
    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];
    char ip[INET6_ADDRSTRLEN];

    int recvBytes, sentBytes;

    sockdetails_t sd;
    sd.sockfd = sockfd;
    sd.addr_len = sizeof(sd.their_addr);

    _recv(&sd, RECIEVE_SIZE, recieve_buffer);

    char *temp_ip = getin_addr((struct sockaddr *)&sd.their_addr);
    printf(GRN "\n\n[+] Recieved Command \"%s\" from IP %s\n" RESET, recieve_buffer, inet_ntop(sd.their_addr.ss_family, temp_ip, ip, sizeof ip));

    commands_t cmd = whichcmd(recieve_buffer);

    switch (cmd)
    {
    case LS:
        list_files(&sd);
        break;

    case GET:
        get_file(&sd, recieve_buffer);
        break;

    case PUT:
        put_file(&sd, recieve_buffer);
        break;

    case EXIT:
        cleanup_client_resouces(&sd);
        break;

    case DELETE:
        delete_file(&sd, recieve_buffer);
        break;

    default:
        _send(&sd, strlen(WRONG_COMMAND), WRONG_COMMAND);
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
        printf(RED "[-] You messed up, command is ./server <PORT> | current command (%d) %s %s\n" RESET, argc, argv[0], argv[1]);
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
    printf(GRN "[+] getaddrinfo call successful\n" RESET);

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
        printf(GRN "[+] socket call successful\n" RESET);

        struct timeval timeout;
        timeout.tv_sec = 3;
        timeout.tv_usec = 0;

        int yes = 1;

        if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1 || setsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout)) == -1)
        {
            perror("setsockopt");
            exit(1);
        }

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
    printf(GRN "[+] Server recieving UDP packet to : %s\n" RESET, ip);

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
        return LS;
    }
    else if (strncmp(cmd, "get", strlen("get")) == 0)
    {
        return GET;
    }
    else if (strncmp(cmd, "put", strlen("put")) == 0)
    {
        return PUT;
    }
    else if (strncmp(cmd, "exit", strlen("exit")) == 0)
    {
        return EXIT;
    }
    else if (strncmp(cmd, "delete", strlen("delete")) == 0)
    {
        return DELETE;
    }
    else
    {
        printf(RED "[-] Wrong command try again \n\r" RESET);
        return -1;
    }
}
