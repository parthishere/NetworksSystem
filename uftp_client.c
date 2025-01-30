#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <termios.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

#define SCREEN_HEIGHT 50

#define RED   "\x1B[31m"
#define GRN   "\x1B[32m"
#define YEL   "\x1B[33m"
#define BLU   "\x1B[34m"
#define MAG   "\x1B[35m"
#define CYN   "\x1B[36m"
#define WHT   "\x1B[37m"
#define RESET "\x1B[0m"

#define MAXDATASIZE 100
#define RECIEVE_SIZE 1024 * 30 // 30 KB
#define TRANSMIT_SIZE 1024 * 30 // 30KB
// this means that we can read uptp 5 mb in total as of now.
#define DATA_SIZE 1024 * 1024 * 5 // 5MB buffer;
#define HEADERSIZE 5

#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"
#define ACK "ack\t\t\t\0"
#define NACK "nack\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\t\t\n\0"
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\t\t\n\0"
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\t\t\n\0"

#define clrscr ({printf("\033[2J\033[H");\
fflush(stdout); })




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


typedef struct
{
    int sockfd;
    struct sockaddr *their_addr;
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

// #define SCANF 1
// #define FGETS 1

commands_t print_menu();
commands_t whichcmd(char *cmd);


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


void error(sockdetails_t *sd, char *msg)
{
    sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, sizeof(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)sd->their_addr, sd->addr_len);
    perror(msg);
    close(sd->sockfd);
    exit(EXIT_FAILURE);
}

void _send(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->sentBytes = sendto(sd->sockfd, packet, size, 0, (struct sockaddr *)sd->their_addr, sd->addr_len)) < 0)
    {
        error(sd, "send");
    }
}

void _recv(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->recvBytes = recvfrom(sd->sockfd, packet, size, 0, (struct sockaddr *)sd->their_addr, &sd->addr_len)) < 0)
    {
        error(sd, "recv");
    }
}

void *getin_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET)
    {
        return &(((struct sockaddr_in *)(sa))->sin_addr);
    }
    else if (sa->sa_family == AF_INET6)
    {
        return &(((struct sockaddr_in6 *)(sa))->sin6_addr);
    }
    return NULL;
}

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
    else if (strncmp(cmd, "put", strlen("get")) == 0)
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
    else if(*cmd == 10){
        clrscr;
        return -2;
    }
    else
    {
        printf(RED "[-] Wrong command try again \n\r" RESET);
        return -1;
    }
}

void list_files(sockdetails_t *sd)
{

    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes
    int current_count = 0;
    int retry_count = 0;
    uint8_t crc = crc8(0, NULL, 0);
    while (1)
    {
        retry: ;
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);
        if(strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA)) == 0){
            printf(GRN "\n\n-- Done -- \n\n" RESET);
            break;
        }
        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            return;
        }

        int seq_num         = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length     = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];

        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        char *temp_ip = getin_addr(sd->their_addr);
        printf(MAG"> %s"RESET, &recieve_buffer[HEADERSIZE]);

        bzero(transmit_buffer, TRANSMIT_SIZE);
        if ((unsigned)crc_server == (unsigned)crc && seq_num == current_count)
        {
            memcpy(transmit_buffer, ACK, 7);
            _send(sd, 7, transmit_buffer);
            current_count++;
        }
        
        else
        {
            retry_count++;
            memcpy(transmit_buffer, NACK, 7);
            _send(sd, 8, transmit_buffer);
            if(retry_count >= 3){
                retry_count = 0;
                printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                break;
            }
            goto retry;
        }
    } 
}

void get_file(sockdetails_t *sd, char *filename)
{
    printf("\n\nGET\n\n");
    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes
    int current_count = 0;
    int retry_count = 0;
    char whole_filename[60];
    snprintf(whole_filename, sizeof(whole_filename), "./Downloads/%s", filename);
    FILE *fp = fopen(whole_filename, "wb");
    uint8_t crc = crc8(0, NULL, 0);
    while (1)
    {

        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA) + 1) == 0)
        {
            printf(GRN "\n\n--- End of file received. --\n\n" RESET);
            break;
        }

        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            fclose(fp);
            return;
        }

        int seq_num     = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server    = recieve_buffer[4];
        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);  
        bzero(transmit_buffer, TRANSMIT_SIZE);


        if(crc_server == crc && seq_num == current_count){
            retry_count = 0;
            memcpy(transmit_buffer, ACK, strlen(ACK));
            _send(sd, strlen(ACK), transmit_buffer);
            current_count++;
        }
        else
        {
            retry_count++;
            if(retry_count >= 3) break;
            printf(RED "[-]  Sequence number does not match, asking to re-send the packet \n\r" RESET);
            memcpy(transmit_buffer, NACK, strlen(NACK));
            _send(sd, strlen(NACK), transmit_buffer);
            
            continue;
        }

        printf(MAG"%s\n"RESET, recieve_buffer + HEADERSIZE);
        fwrite(&recieve_buffer[HEADERSIZE], 1, data_length, fp);
    }
    printf(GRN"\n\n[+] Downloaded \"%s\" file in Downloads folder\n\n"RESET, filename);
    fclose(fp);
}

void put_file(sockdetails_t *sd)
{
    printf("\n\nPUT\n\n");
    char recieve_buffer[RECIEVE_SIZE];
    char transmit_buffer[TRANSMIT_SIZE];
    int write_pointer = HEADERSIZE; // 0, 1, 2 are filled
    int seq_number = 0;
    int retry_count = 0;
    bool send_data = false, end_of_data = false;

    // // reddit artical about changing behaviour of the unix
    struct termios old_tio, new_tio;
    unsigned char c;

    // Get current terminal settings
    tcgetattr(STDIN_FILENO, &old_tio);
    new_tio = old_tio;

    // Disable canonical mode and echo
    new_tio.c_lflag &= (~ICANON & ~ECHO);
    if(tcsetattr(STDIN_FILENO, TCSANOW, &new_tio)<0)perror("tcsetattr");

    int column_number = 1;
    uint8_t crc = crc8(0, NULL, 0);
    while (1)
    {
        char ch;
        read(STDIN_FILENO, &ch, 1);
        if (ch == 10) {  // Enter key resets to a new line
            printf("\n");
            column_number = 1;
        }else if(ch == 127){ // backspace
            if(column_number <= 1){

            }
            else{
                write_pointer--;
                column_number-=1;
                
                printf("\033[1D");
                printf(" ");
                printf("\033[1D");
                fflush(stdout);
                continue;
            }
            
        } 
        else {
            printf(MAG"%c\n"RESET, ch, ch);
            printf("\033[1A"); // Move cursor up
            printf("\033[%dC", column_number); // Move cursor right
            column_number++;
            fflush(stdout);
        }

        if (write_pointer >= TRANSMIT_SIZE - 1 - HEADERSIZE || ch == 27) // -1 as it is index, and index starts from 0;
        {
            if (ch == 27 && write_pointer > 0)
            {
                send_data = true;
                end_of_data = true;
            }
            else if (ch != 27 && write_pointer > 0)
            {
                send_data = true;
                end_of_data = false;
            }
            else if (ch == 27 && write_pointer == 0)
            {
                send_data = false;
                end_of_data = true;
            }

            if (send_data)
            {
            retry: ;
                transmit_buffer[0] = ((write_pointer - HEADERSIZE) & 0xFF);
                transmit_buffer[1] = (((write_pointer - HEADERSIZE) & 0xFF00) >> 8);
                transmit_buffer[2] = (seq_number & 0x00FF);
                transmit_buffer[3] = (seq_number & 0xFF00) >> 8;
                crc = crc8(crc, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE); // crc
                printf("CRC %d\n", crc);
                transmit_buffer[4] = crc;

                _send(sd, TRANSMIT_SIZE, transmit_buffer);
                write_pointer = HEADERSIZE;

                bzero(recieve_buffer, TRANSMIT_SIZE);
                _recv(sd, RECIEVE_SIZE, recieve_buffer);
                if (strncmp(recieve_buffer, ACK, 7) == 0)
                {

                    bzero(transmit_buffer, TRANSMIT_SIZE);
                    seq_number++;
                    if(seq_number >= 0xFFFF) break;
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

            if (end_of_data)
            {
                seq_number = 0;
                printf(GRN "\n\n-- End Of File --\n\n" RESET);
                _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);
                end_of_data = false;
                break;
            }
        }

        transmit_buffer[write_pointer++] = ch;
    }
    tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
}

void delete_file(sockdetails_t *sd, char* filename){
    printf("\n\nDELETE\n\n");

    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes
    bzero(recieve_buffer, RECIEVE_SIZE);
    _recv(sd, RECIEVE_SIZE, recieve_buffer);
    if(strncmp(recieve_buffer, FILE_NOT_FOUND, strlen(FILE_NOT_FOUND)) == 0){
        printf(RED"[-] Could not find the file on server: %s\n" RESET, filename);
        return;
    } 
    else if(strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA) == 0)){
        printf(RED"[-] Something went wrong on server\n\n"RESET);
        return;
    }
    printf(GRN"\n\n[+] File: \"%s\" deleted \n\n", recieve_buffer);
}


void cleanup_resources(sockdetails_t *sd){

    char recieve_buffer[RECIEVE_SIZE];

    bzero(recieve_buffer, TRANSMIT_SIZE);
    _recv(sd, RECIEVE_SIZE, recieve_buffer);
    if(strncmp(recieve_buffer, ACK, strlen(ACK))){
        // done
        close(sd->sockfd);
        exit(EXIT_SUCCESS);
    }
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
    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes

    char ip[INET6_ADDRSTRLEN];

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC; // AF_INET
    hints.ai_socktype = SOCK_DGRAM;

    char *server_address = argv[1];
    printf(GRN"[+] Passed Server Address %s\n"RESET, server_address);
    char *server_port = argv[2];
    printf(GRN"[+] Passed Server Port %s\n"RESET, server_port);

    if ((status = getaddrinfo(server_address, server_port, &hints, &serv_info)) < 0)
    {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE);                                         // exit if there is an error
    }
    printf(GRN"[+] getaddrinfo call successful\n"RESET);

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
        printf(GRN"[+] socket call successful\n"RESET);

        break;
    }

    if (temp == NULL)
    {
        fprintf(stderr, "[-] socket connection failed for client \n");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    sockdetails_t sd;
    sd.sockfd = sockfd;
    sd.their_addr = serv_info->ai_addr;
    sd.addr_len = sizeof(struct sockaddr);

    /*
     ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
    bool exit = false;
    char filename[256];

    while (true)
    {
        switch (print_menu(filename))
        {
        case LS:
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "ls");
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            // list files
            list_files(&sd);
            break;
        case GET:
            bzero(transmit_buffer, sizeof transmit_buffer);
            if (filename[0] == '\0') // return error
            {
                printf(RED "[-] File Name is Empty\n" RESET);
                break;
            }
            snprintf(transmit_buffer, sizeof transmit_buffer, "get %s", filename);
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            get_file(&sd, filename);
            break;
        case PUT:
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "put %s", filename);
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            put_file(&sd);
            break;

        case DELETE:
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "delete %s", filename);
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            delete_file(&sd, filename);
            break;
        case EXIT:
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "exit");
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            // cleanup();
            break;
        case -2:
            continue;
        default:
            break;
        }

        
        if (exit)
            break;
    }

    // wait for the input;
    // we can use scanf, fgets, read calls to do that

    close(sockfd);

    return EXIT_SUCCESS;
}

commands_t print_menu(char *filename)
{
    
    printf(YEL"\n\nThis client can support FTP through UDP\n\n");
    printf("Currently this program can support following commands \n");
    printf("get <filename> : Get the file name in server and print the file\n");
    printf("put <filename> : if filename does not exists on server, create one\n");
    printf("delete         : <filename>: if filename does not exists on server, delete that file\n");
    printf("ls             : get the list of all the files in server and print it\n");
    printf("exit           : exit from the client program and free the resources in client and server\n");
    printf("enter key (|_) : Again pressing enter will clear the screen\n");
    printf("\n"RESET);

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
    char cmd[256];
    printf("Enter one of the comamnds ! \n>");
    int bytesread = read(STDIN_FILENO, cmd, sizeof(cmd));
    printf(MAG"%s\n"RESET, cmd);

#endif
    sscanf(cmd, "%*s %s", filename);
    return whichcmd(cmd);
}
