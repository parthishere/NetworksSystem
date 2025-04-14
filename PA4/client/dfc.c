#include "common.h"

char *str2md5(char *str, int length)
{

    EVP_MD_CTX *context = EVP_MD_CTX_new();
    const EVP_MD *md = EVP_md5();
    EVP_DigestInit_ex(context, md, NULL);
    int md_len;
    char *out = (char *)malloc(33);
    unsigned char digest[16];

    while (length > 0)
    {
        if (length > 512)
        {
            EVP_DigestUpdate(context, str, 512);
        }
        else
        {
            EVP_DigestUpdate(context, str, length);
        }
        length -= 512;
        str += 512;
    }
    EVP_DigestFinal_ex(context, digest, &md_len);
    EVP_MD_CTX_free(context);

    for (int n = 0; n < md_len; ++n)
    {
        snprintf(&(out[n * 2]), 16 * 2, "%02x", (unsigned int)digest[n]);
    }
    return out;
}





// #define SCANF 1
// #define FGETS 1

void print_menu();
commands_t whichcmd(char *cmd);



/**
 * Handle network errors and timeouts
 *
 * Processes network operation errors, handles timeouts, and sends error notifications
 * to the remote peer when necessary. Prints error messages in red for visibility.
 *
 * @param sd   Pointer to socket details structure
 * @param msg  Error message to be displayed using perror()
 *
 * Error handling:
 * - EAGAIN/EWOULDBLOCK: Indicates timeout condition
 * - Other errors: Sends ERROR_FOR_DYNAMIC_DATA to peer
 */
// void error(sockdetails_t *sd, char *msg)
// {
//     printf(RED "[-] Error somewhere ! Check below message to see details \n" RESET);

//     perror(msg);

//     /* Check for timeout conditions */
//     if (errno == EAGAIN || errno == EWOULDBLOCK)
//     {
//         printf(RED "[-] Timeout\n" RESET);
//     }
//     else
//     {
//         /* Notify peer about error condition */
//         sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)&sd->their_addr, sd->addr_len);
//         // close(sd->sockfd);
//         // exit(EXIT_FAILURE);
//     }
// }

/**
 * Wrapper for UDP packet transmission
 *
 * Sends a UDP packet and updates the sent bytes count in the socket details.
 * Handles error conditions through the error() function.
 *
 * @param sd      Pointer to socket details structure
 * @param size    Size of data to send in bytes
 * @param packet  Pointer to data buffer to send
 *
 * Note: Updates sd->sentBytes with the number of bytes sent
 */
// void _send(sockdetails_t *sd, int size, void *packet)
// {
//     if ((sd->sentBytes = sendto(sd->sockfd, packet, size, 0, (struct sockaddr *)sd->their_addr, sd->addr_len)) < 0)
//     {
//         error(sd, "send");
//     }
// }

/**
 * Wrapper for UDP packet reception
 *
 * Receives a UDP packet and updates the received bytes count in the socket details.
 * Handles error conditions through the error() function.
 *
 * @param sd      Pointer to socket details structure
 * @param size    Maximum size of data to receive
 * @param packet  Pointer to buffer for received data
 *
 * Note: Updates sd->recvBytes with the number of bytes received
 */
// void _recv(sockdetails_t *sd, int size, void *packet)
// {
//     if ((sd->recvBytes = recvfrom(sd->sockfd, packet, size, 0, (struct sockaddr *)sd->their_addr, &sd->addr_len)) < 0)
//     {
//         error(sd, "recv");
//     }
// }

/**
 * Configure socket receive timeout
 *
 * Sets the SO_RCVTIMEO socket option to implement a timeout for receive operations.
 * Exits program on failure to set socket option.
 *
 * @param sd   Pointer to socket details structure
 * @param sec  Timeout value in seconds
 *
 * Implementation:
 * - Uses timeval structure for timeout specification
 * - Sets microseconds to 0 (timeout precision in seconds only)
 * - Applies timeout using setsockopt with SO_RCVTIMEO
 */
// void set_timeout(sockdetails_t *sd, int sec)
// {

//     struct timeval timeout;
//     timeout.tv_sec = sec;
//     timeout.tv_usec = 0;

//     if (setsockopt(sd->sockfd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) == -1)
//     {
//         perror("setsockopt");
//         exit(1);
//     }
// }

/**
 * Remove socket receive timeout
 *
 * Disables the SO_RCVTIMEO socket option by setting it to zero.
 * Exits program on failure to set socket option.
 *
 * @param sd  Pointer to socket details structure
 *
 * Implementation:
 * - Sets both seconds and microseconds to 0
 * - Effectively removes any timeout on receive operations
 */
// void remove_timeout(sockdetails_t *sd)
// {
//     struct timeval timeout;
//     timeout.tv_sec = 0;
//     timeout.tv_usec = 0;

//     if (setsockopt(sd->sockfd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) == -1)
//     {
//         perror("setsockopt");
//         exit(1);
//     }
// }



void read_server_conf(sockdetails_t *sd){
    FILE *fs = fopen(SERVER_CONF, "r");
    char line[1024];
    
    int i = 0;
    char *saved_remaining_line;

    clientdetails_t *current = NULL;
    clientdetails_t *prev = NULL;
    while(fgets(line, sizeof(line)-1, fs) != NULL){
        int dfs_no;

        current = malloc(sizeof(clientdetails_t));
        if(sd->client_details = NULL){
            sd->client_details = current;
        }

        char *line_dup = strdup(line);
        char *tok = strtok_r(line, " ", &saved_remaining_line);
        // free(tok);
        tok = strtok_r(NULL, " ", &saved_remaining_line);
        sscanf(tok, "dfs%d", &dfs_no);
        tok = strtok_r(NULL, ":", &saved_remaining_line);
        printf("Token %s %s\n\n", tok, saved_remaining_line);

        current->client_port = strdup(saved_remaining_line);
        current->client_ip = strdup(tok);
        current->next = prev;
        current->dfsno = dfs_no;
        sd->number_of_clients++;

        prev = current;
        
        free(line_dup);
        i++;
    }

    
    fclose(fs);
}

/**
 * Main entry point for FTP client application
 *
 * Initializes network connection, creates required directories, and handles
 * the main command processing loop. Supports both IPv4 and IPv6 connections
 * through UDP socket communication.
 *
 * Command Line Arguments:
 * @param argc     Number of arguments (must be 3)
 * @param argv     Argument array:
 *                 argv[1] - Server IP address
 *                 argv[2] - Server port number
 *
 * @return EXIT_SUCCESS on normal termination, EXIT_FAILURE on error
 */
int main(int argc, char *argv[])
{
    sockdetails_t sd;
    
    pthread_mutex_init(&sd.lock, NULL);
    
    // int status = mkdir(CACHE_ROOT, 0777); 
    // if (status == 0) {
    //     printf(GRN"[+] Directory '%s' created successfully.\n"RESET, CACHE_ROOT);
    // } else if (errno == EEXIST) {
    //     printf(GRN"[+] Directory '%s' already exists.\n"RESET, CACHE_ROOT);
    // } else {
    //     perror(RED"[-] Error creating directory");
    //     exit(EXIT_FAILURE);
    // }

    /* Validate command line arguments */
    if (argc != 3 && argc != 2)
    {
        printf(RED "[-] You messed up, command is ./dfc <COMMAND> <FILENAME>\n" RESET);
        print_menu();
        
        exit(EXIT_FAILURE);
    }

    read_server_conf(&sd);

    commands_t cmd = whichcmd(argv[1]);
    printf("Command %d %s\n", cmd, argv[1]);



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

    

    /* Process user commands through menu interface */
    // switch (print_menu(filename))
    // {
    // case LS:
    //     /* List directory contents */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "ls");
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     // list files
    //     list_files(&sd);
    //     break;
    // case GET:
    //     /* Download file from server */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     if (filename[0] == '\0') // return error
    //     {
    //         printf(RED "[-] File Name is Empty\n" RESET);
    //         break;
    //     }
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "get %s", filename);
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     get_file(&sd, filename);
    //     break;
    // case PUT:
    //     /* Upload file to server */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "put %s", filename);
    //     printf("put %s\n", filename);
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     if (put_file_file(&sd, filename) == -1)
    //     {
    //         put_file(&sd); // Fall back to manual input mode
    //     }
    //     break;

    // case DELETE:
    //     /* Delete file from server */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "delete %s", filename);
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     delete_file(&sd, filename);
    //     break;
    // case EXIT:
    //     /* Clean termination */
    //     bzero(transmit_buffer, sizeof transmit_buffer);
    //     snprintf(transmit_buffer, sizeof transmit_buffer, "exit");
    //     _send(&sd, sizeof transmit_buffer, transmit_buffer);
    //     cleanup_resources(&sd);
    //     break;
    // case SERVER_INFO:
    //     // Screen clear requested
    //     continue;
    // default:
    //     break;
    // }

    // close(sockfd);

    return EXIT_SUCCESS;
}

/**
 * Display command menu and process user input
 *
 * Presents available commands to user and processes their selection.
 * Supports multiple input methods (SCANF, FGETS, or raw read) based
 * on compilation flags.
 *
 * @param filename  Buffer to store filename parameter if command requires one
 * @return         Command type from commands_t enum
 */
void print_menu()
{
    /* Display menu header */
    printf(YEL "\n\nThis client can support distributed FTP\n\n");
    printf("Currently this program can support following commands \n");
    /* Display available commands */
    printf("get <filename>   : Get the file name in server and print the file\n");
    printf("put <filename>   : if filename does not exists on server, create one. \n");
    printf("delete <filename>: if filename does exists on server, delete that file\n");
    printf("ls               : get the list of all the files/chunks in all server and print it\n");
    printf("exit             : exit from the client program and free the resources in client and server\n");
    printf("server info      : get to know server info\n");
    printf("help             : print this help \n");
    printf("\n" RESET);
}
