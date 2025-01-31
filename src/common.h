#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <termios.h>
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

// #define SCANF 1
// #define FGETS 1


#define RED "\x1B[31m"
#define GRN "\x1B[32m"
#define YEL "\x1B[33m"
#define BLU "\x1B[34m"
#define MAG "\x1B[35m"
#define CYN "\x1B[36m"
#define WHT "\x1B[37m"
#define RESET "\x1B[0m"


#define RECIEVE_SIZE 1024 * 30  // 30 KB
#define TRANSMIT_SIZE 1024 * 30 // 30KB

#define HEADERSIZE 5

#define TIMEOUT 5

#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"
#define ACK "ack\t\t\t\0"
#define NACK "nack\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\t\t\n\0"
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\t\t\n\0"
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\t\t\n\0"
#define WRONG_COMMAND "WRONG_COMMAND\t\t\t\n\0"

#define clrscr ({printf("\033[2J\033[H");\
fflush(stdout); })


typedef struct
{
    int sockfd;
    struct sockaddr_storage their_addr;
    int addr_len;
    int recvBytes, sentBytes;
} sockdetails_t;


typedef enum
{
    GET,
    PUT,
    DELETE,
    LS,
    EXIT,
    number_of_command,
} commands_t;


unsigned crc8(unsigned crc, unsigned char const *data, size_t len);
void error(sockdetails_t *sd, char *msg);
void _send(sockdetails_t *sd, int size, void *packet);
void _recv(sockdetails_t *sd, int size, void *packet);
void set_timeout(sockdetails_t *sd, int sec);
void remove_timeout(sockdetails_t *sd);
void *getin_addr(struct sockaddr *sa);
commands_t whichcmd(char *cmd);