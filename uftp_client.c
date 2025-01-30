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
#define HEADERSIZE 3

#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"
#define ACK "ack\t\t\t\0"
#define NACK "nack\t\t\t\0"
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\t\t\n\0"
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\t\t\n\0"
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\t\t\n\0"

#define clrscr ({printf("\033[2J\033[H");\
fflush(stdout); })

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
    while (1)
    {
        
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);
        if(strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA)) == 0){
            printf(GRN "\n\n-- Done -- \n\n" RESET);
            break;
        }

        char *temp_ip = getin_addr(sd->their_addr);
        printf(MAG"> %s"RESET, &recieve_buffer[3]);

        bzero(transmit_buffer, TRANSMIT_SIZE);
        if (recieve_buffer[2] == current_count)
        {
            memcpy(transmit_buffer, ACK, 7);
            _send(sd, 7, transmit_buffer);
            current_count++;
        }
        
        else
        {
            memcpy(transmit_buffer, NACK, 7);
            _send(sd, 8, transmit_buffer);
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

        int seq_num = (uint16_t)recieve_buffer[2];
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));

        bzero(transmit_buffer, TRANSMIT_SIZE);

        if (seq_num == current_count)
        {
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
    while (1)
    {
        char ch;
        read(STDIN_FILENO, &ch, 1);
        if (ch == 10) {  // Enter key resets to a new line
            printf("\n");
            // printf("\033[0C");
            column_number = 1;
            // fflush(stdout);
        }else if(ch == 127){ // backspace
            write_pointer--;
            column_number-=2;
            printf("\033[%dC", column_number);
            fflush(stdout);
            // printf(" ");
            column_number++;
            printf("\033[%dC", column_number);
            fflush(stdout);
            continue;
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
            retry:
                transmit_buffer[0] = ((write_pointer - HEADERSIZE) & 0xFF);
                transmit_buffer[1] = (((write_pointer - HEADERSIZE) & 0xFF00) >> 8);
                transmit_buffer[2] = seq_number;

                _send(sd, TRANSMIT_SIZE, transmit_buffer);
                write_pointer = HEADERSIZE;

                bzero(recieve_buffer, TRANSMIT_SIZE);
                _recv(sd, RECIEVE_SIZE, recieve_buffer);
                if (strncmp(recieve_buffer, ACK, 7) == 0)
                {

                    bzero(transmit_buffer, TRANSMIT_SIZE);
                    seq_number++;
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

// void put_file(sockdetails_t *sd)
// {
//     char recieve_buffer[RECIEVE_SIZE];
//     char transmit_buffer[TRANSMIT_SIZE];
//     int write_pointer = HEADERSIZE; // 0, 1, 2 are filled
//     int seq_number = 0;
//     int retry_count = 0;
//     bool send_data = false, end_of_data = false;
//     // char *write_pointer = transmit_buffer;
//     // reddit artical about changing behaviour of the unix
//     struct termios old_tio, new_tio;
//     unsigned char c;
//     // Get current terminal settings
//     tcgetattr(STDIN_FILENO, &old_tio);
//     new_tio = old_tio;
//     // Disable canonical mode and echo
//     new_tio.c_lflag &= (~ICANON & ~ECHO);
//     tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);
//     while (1)
//     {
//         char ch;
//         read(STDIN_FILENO, &ch, 1);
//         // char ch = getc(stdin); // Get character without echo
//         printf(MAG"entered char %c\n" RESET, ch);
//         if (write_pointer >= 10 || ch == 27) // -1 as it is index, and index starts from 0;
//         // if (write_pointer >= TRANSMIT_SIZE - 1 - HEADERSIZE) // -1 as it is index, and index starts from 0;
//         {
//             if (ch == 27 && write_pointer > 0)
//             {
//                 send_data = true;
//                 end_of_data = true;
//             }
//             else if (ch != 27 && write_pointer > 0)
//             {
//                 send_data = true;
//                 end_of_data = false;
//             }
//             else if (ch == 27 && write_pointer == 0)
//             {
//                 send_data = false;
//                 end_of_data = true;
//             }
//             if (send_data)
//             {
//             retry:
//                 transmit_buffer[0] = ((write_pointer - HEADERSIZE) & 0xFF);
//                 transmit_buffer[1] = (((write_pointer - HEADERSIZE) & 0xFF00) >> 8);
//                 transmit_buffer[2] = seq_number;
//                 _send(sd, TRANSMIT_SIZE, transmit_buffer);
//                 write_pointer = HEADERSIZE;
//                 bzero(recieve_buffer, TRANSMIT_SIZE);
//                 _recv(sd, RECIEVE_SIZE, recieve_buffer);
//                 if (strncmp(recieve_buffer, ACK, 7) == 0)
//                 {
//                     bzero(transmit_buffer, TRANSMIT_SIZE);
//                     seq_number++;
//                 }
//                 else
//                 {
//                     retry_count++;
//                     if (retry_count >= 3)
//                     {
//                         retry_count = 0;
//                         printf("Max retries reached. Aborting.\n");
//                         break;
//                     }
//                     printf("retry \n\r");
//                     goto retry;
//                 }
//             }
//             if (end_of_data)
//             {
//                 seq_number = 0;
//                 printf("End of file sent !\n\n\n");
//                 _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);
//                 end_of_data = false;
//                 break;
//             }
//         }
//         transmit_buffer[write_pointer++] = ch;
//     }
//     tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
// }


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
