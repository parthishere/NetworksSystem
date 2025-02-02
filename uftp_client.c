/*******************************************************************************
 * Copyright (c) 2025
 *
 * File: uftp_client.c
 *
 * Description:
 * This file implements a UDP-based FTP client that supports basic file transfer
 * operations including GET, PUT, DELETE, and directory listing (LS). The client
 * implements reliable data transfer over UDP using acknowledgments, timeouts,
 * and CRC-based error detection. It supports both manual input and file-based
 * transfers with configurable buffer sizes and timeout values.
 *
 * Key Features:
 * - Reliable UDP transfer with ACK/NACK mechanism
 * - CRC8 error detection
 * - Configurable timeout and retry mechanisms
 * - Support for large file transfers max up to 60KB * 65536 = 4GB after configuration
 * - Interactive command-line interface
 *
 * Protocol Details:
 * - Packet Structure: 5-byte header + data payload
 * - Header Format: [2 bytes length][2 bytes sequence number][1 byte CRC]
 * - Maximum packet size: 60KB (configurable)
 * - Error Detection: CRC8 with lookup table
 *
 * Author: Parth Thakkar
 * Last Modified: February 1, 2025
 ******************************************************************************/

/* System Headers
 * Core system functionality for memory, I/O, and string operations
 */
#include <stdio.h>   // Standard I/O operations
#include <stdlib.h>  // Memory allocation, random numbers
#include <stdint.h>  // Fixed-width integer types
#include <stdbool.h> // Boolean type and values
#include <string.h>  // String manipulation functions
#include <unistd.h>  // UNIX standard functions
#include <termios.h> // Terminal I/O interfaces
#include <errno.h>   // Error number definitions
#include <dirent.h>  // Directory entry operations

/* Network Headers
 * Required for implementing UDP socket communication
 */
#include <sys/types.h>  // Basic system data types
#include <sys/socket.h> // Socket definitions and functions
#include <netdb.h>      // Network database operations
#include <arpa/inet.h>  // Internet operations
#include <netinet/in.h> // Internet address family
#include <sys/stat.h>   // File status and information
#include <fcntl.h>      // File control options

/* Terminal Color Definitions
 * ANSI escape sequences for colored output
 * Used to enhance user interface and error reporting
 */
#define RED "\x1B[31m"  // Error messages
#define GRN "\x1B[32m"  // Success messages
#define YEL "\x1B[33m"  // Warnings and prompts
#define BLU "\x1B[34m"  // Informational messages
#define MAG "\x1B[35m"  // Input echo and data display
#define CYN "\x1B[36m"  // Alternative highlighting
#define WHT "\x1B[37m"  // Standard output
#define RESET "\x1B[0m" // Reset to default color

/* Buffer and Protocol Configurations
 * Define sizes and limits for data transfer
 */
#define MAXDATASIZE 100            // Maximum size for general data buffers
#define RECIEVE_SIZE (1024 * 30)   // 30 KB receive buffer, expandable to 60KB
#define TRANSMIT_SIZE RECIEVE_SIZE // Matching transmit buffer size
#define HEADERSIZE 5               // Header: 2B length + 2B sequence + 1B CRC

/* Protocol Parameters
 * Network and communication settings
 */
#define TIMEOUT 3                          // Socket timeout in seconds
#define DOWNLOAD_FOLDER_NAME "./Downloads" // Default directory for downloaded files

/* Protocol Message Definitions
 * Standard messages used in the communication protocol
 * All messages are padded with tabs to maintain consistent length
 */
#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"                                   // Marks end of data stream
#define ACK "ack\t\t\t\0"                                                   // Positive acknowledgment
#define NACK "nack\t\t\t\0"                                                 // Negative acknowledgment
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\t\t\n\0" // Operation failure
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\t\t\n\0"                           // File access error
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\t\t\n\0"                         // File already exists

#define DOWNLOAD_FOLDER_NAME "./Downloads"

/* Screen Management
 * Terminal control sequence for clearing screen
 */
#define clrscr ({printf("\033[2J\033[H");\
fflush(stdout); })

#define RETRY_COUNT 3

/**
 * CRC-8 Lookup Table
 * Pre-computed lookup table for CRC-8 calculation using polynomial 0x31 (x^8 + x^5 + x^4 + 1)
 * Used for error detection in packet transmission
 * Table contains 256 pre-computed values to optimize CRC calculation
 */
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

/**
 * Socket Details Structure
 * Encapsulates all necessary information for a UDP socket connection
 */
typedef struct
{
    int sockfd;                  // Socket file descriptor for the connection
    struct sockaddr *their_addr; // Pointer to remote address structure
    int addr_len;                // Length of the address structure
    int recvBytes;               // Number of bytes received in last operation
    int sentBytes;               // Number of bytes sent in last operation
} sockdetails_t;

/**
 * Command Enumeration
 * Defines supported FTP commands for the client
 */
typedef enum
{
    GET,               // Download file from server
    PUT,               // Upload file to server
    DELETE,            // Remove file from server
    LS,                // List directory contents
    EXIT,              // Terminate connection
    number_of_command, // Total number of commands (used for validation)
} commands_t;

// #define SCANF 1
// #define FGETS 1

commands_t print_menu();
commands_t whichcmd(char *cmd);

/**
 * Calculate CRC-8 checksum for error detection
 *
 * Implements CRC-8 calculation using a pre-computed lookup table for efficiency.
 * Supports incremental CRC calculation for processing data in chunks.
 *
 * @param crc   Initial CRC value (use 0 for first chunk)
 * @param data  Pointer to data buffer for CRC calculation
 * @param len   Length of data in bytes
 *
 * @return      Calculated CRC-8 value (8 bits)
 *
 * Usage example:
 *   uint8_t crc = crc8(0, NULL, 0);            // Initialize CRC
 *   crc = crc8(crc, data_chunk1, length1);     // Process first chunk
 *   crc = crc8(crc, data_chunk2, length2);     // Process second chunk
 */
unsigned crc8(unsigned crc, unsigned char const *data, size_t len)
{
    if (data == NULL)
        return 0;
    crc &= 0xff; // ensure 8 bit value
    unsigned char const *end = data + len;
    while (data < end)
        crc = crc8_table[crc ^ *data++]; // Update CRC using lookup table
    return crc;
}

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
void error(sockdetails_t *sd, char *msg)
{
    printf(RED "[-] Error somewhere ! Check below message to see details \n" RESET);

    perror(msg);

    /* Check for timeout conditions */
    if (errno == EAGAIN || errno == EWOULDBLOCK)
    {
        printf(RED "[-] Timeout\n" RESET);
    }
    else
    {
        /* Notify peer about error condition */
        sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)&sd->their_addr, sd->addr_len);
        // close(sd->sockfd);
        // exit(EXIT_FAILURE);
    }
}

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
void _send(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->sentBytes = sendto(sd->sockfd, packet, size, 0, (struct sockaddr *)sd->their_addr, sd->addr_len)) < 0)
    {
        error(sd, "send");
    }
}

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
void _recv(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->recvBytes = recvfrom(sd->sockfd, packet, size, 0, (struct sockaddr *)sd->their_addr, &sd->addr_len)) < 0)
    {
        error(sd, "recv");
    }
}

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

/**
 * Extract IP address from sockaddr structure
 *
 * Returns pointer to the IP address within a sockaddr structure,
 * handling both IPv4 and IPv6 addresses.
 *
 * @param sa  Pointer to generic socket address structure
 * @return    Pointer to IP address within the structure, NULL if invalid family
 *
 * Supports:
 * - IPv4 (AF_INET): Returns pointer to sin_addr
 * - IPv6 (AF_INET6): Returns pointer to sin6_addr
 */
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

/**
 * Parse and identify command from user input
 *
 * Analyzes input string to determine which FTP command was requested.
 * Handles basic command parsing and validation.
 *
 * @param cmd  Null-terminated string containing user command
 * @return     Corresponding commands_t enum value, or:
 *             -1 for invalid command
 *             -2 for newline (triggers screen clear)
 *
 * Supported Commands:
 * - "ls\n": List directory contents
 * - "get <filename>": Download file
 * - "put <filename>": Upload file
 * - "delete <filename>": Remove file
 * - "exit\n": Terminate session
 *
 * Note: Uses strncmp for command matching to prevent buffer overflows
 */
commands_t whichcmd(char *cmd)
{
    if (strncmp(cmd, "ls\n", strlen(cmd)) == 0)
    {
        return LS;
    }
    else if (strncmp(cmd, "get ", strlen("get ")) == 0)
    {
        return GET;
    }
    else if (strncmp(cmd, "put ", strlen("put ")) == 0)
    {
        return PUT;
    }
    else if (strncmp(cmd, "exit\n", strlen(cmd)) == 0)
    {
        return EXIT;
    }
    else if (strncmp(cmd, "delete ", strlen("delete ")) == 0)
    {
        return DELETE;
    }
    else if (*cmd == 10) // Newline character
    {
        clrscr; // Clear screen on empty input
        return -2;
    }
    else
    {
        printf(RED "[-] Wrong command try again \n\r" RESET);
        return -1;
    }
}

/**
 * Retrieve and display directory listing from server
 *
 * Implements reliable transfer of directory listing data using a stop-and-wait
 * protocol with CRC error detection and acknowledgment mechanism.
 *
 * Protocol Details:
 * - Uses 5-byte header: [2B length][2B sequence][1B CRC]
 * - Maximum packet size: RECIEVE_SIZE (30KB)
 * - Error Detection: CRC8 with acknowledgment
 * - Timeout: Configurable (default: TIMEOUT seconds)
 *
 * @param sd  Pointer to socket details structure
 */
void list_files(sockdetails_t *sd)
{
    set_timeout(sd, TIMEOUT);

    char recieve_buffer[RECIEVE_SIZE];   // Buffer for incoming packets
    char transmit_buffer[TRANSMIT_SIZE]; // Buffer for outgoing ACK/NACK
    int current_count = 0;               // Expected sequence number
    int retry_count = 0;                 // Number of retry attempts
    uint8_t crc = crc8(0, NULL, 0);      // Initialize CRC calculation

    while (1)
    {
    retry:;
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Check for end of transmission or errors */
        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA)) == 0)
        {
            printf(GRN "\n\n-- Done -- \n\n" RESET);
            break;
        }
        /* Extract header information */
        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            return;
        }

        /* Verify packet integrity */
        int seq_num = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];

        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        char *temp_ip = getin_addr(sd->their_addr);
        printf(MAG "> %s" RESET, &recieve_buffer[HEADERSIZE]);

        bzero(transmit_buffer, TRANSMIT_SIZE);
        /* Handle packet validation and acknowledgment */
        if ((unsigned)crc_server == (unsigned)crc && seq_num == current_count)
        {
            /* Valid packet received - send ACK */
            memcpy(transmit_buffer, ACK, 7);
            retry_count = 0;
            _send(sd, 7, transmit_buffer);
            current_count++;
        }

        else
        {
            /* Invalid packet or wrong sequence - request retransmission */
            retry_count++;
            memcpy(transmit_buffer, NACK, 7);
            _send(sd, 8, transmit_buffer);
            if (retry_count >= RETRY_COUNT)
            {
                retry_count = 0;
                printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                break;
            }
            goto retry;
        }
    }
    remove_timeout(sd);
}

/**
 * Download file from server
 *
 * Implements reliable file transfer from server using stop-and-wait protocol
 * with CRC error detection and acknowledgment mechanism. Saves received file
 * to local Downloads directory.
 *
 * Protocol Details:
 * - Header format: [2B length][2B sequence][1B CRC]
 * - Error handling: CRC8 validation with retransmission
 * - Maximum retries: 3 attempts per packet
 *
 * @param sd        Pointer to socket details structure
 * @param filename  Name of file to download
 */
void get_file(sockdetails_t *sd, char *filename)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nGET\n\n");

    /* Initialize buffers and counters */
    char recieve_buffer[RECIEVE_SIZE];
    char transmit_buffer[TRANSMIT_SIZE];
    int current_count = 0; // Expected sequence number
    int retry_count = 0;   // Retry counter
    char whole_filename[60];

    /* Prepare local file */
    snprintf(whole_filename, sizeof(whole_filename), "./Downloads/%s", filename);
    FILE *fp = fopen(whole_filename, "wb");
    uint8_t crc = crc8(0, NULL, 0);
    while (1)
    {

        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Check for end of transmission or errors */
        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA) + 1) == 0)
        {
            printf(GRN "\n\n--- End of file received. --\n\n" RESET);
            break;
        }

        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            fclose(fp);
            remove(whole_filename); // Clean up partial file
            return;
        }

        /* Process packet header */
        int seq_num = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];
        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        printf("%d %d %d %d\n", seq_num, data_length, crc_server, crc);
        /* Validate packet integrity */ 
        if (crc_server == crc && seq_num == current_count)
        {
            /* Process valid packet */
            retry_count = 0;
            memcpy(transmit_buffer, ACK, strlen(ACK));
            _send(sd, strlen(ACK), transmit_buffer);
            current_count++;
        }
        else
        {
            /* Handle invalid packet */
            retry_count++;
            if (retry_count >= RETRY_COUNT)
                break;
            printf(RED "[-]  Sequence number does not match, asking to re-send the packet \n\r" RESET);
            memcpy(transmit_buffer, NACK, strlen(NACK));
            _send(sd, strlen(NACK), transmit_buffer);

            continue;
        }

        printf(MAG "%s\n" RESET, recieve_buffer + HEADERSIZE);
        fwrite(&recieve_buffer[HEADERSIZE], 1, data_length, fp);
    }

    /* Write data to file */
    printf(GRN "\n\n[+] Downloaded \"%s\" file in Downloads folder\n\n" RESET, filename);
    fclose(fp);
    remove_timeout(sd);
}

/**
 * Upload file to server
 *
 * Implements reliable file transfer to server using stop-and-wait protocol
 * with CRC error detection. Handles both file-based and manual input modes
 * .
 *
 * Protocol Details:
 * - Header format: [2B length][2B sequence][1B CRC]
 * - Maximum sequence number: 0xFFFF
 * - Maximum retries per packet: 3
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing filename or manual input
 * @return              0 on success, -1 on error/manual mode
 */
int put_file_file(sockdetails_t *sd, char *recieve_buffer)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\PUT\n\n");
    char whole_filename[100];

    /* Handle empty filename - switch to manual input mode */
    if (recieve_buffer[0] == '\0')
    {

        printf(RED "[-] File Name is Empty" RESET);
        printf(RED "[-] Going Manual: enter your buffer through stdin(command line:) press ESC key when done \n" RESET);
        printf(RED "[-] \t\t There is 100 sec timeout so write quick :) ! \n\n" RESET);
        remove_timeout(sd);
        return -1;
    }

    /* Prepare file path and open file */
    snprintf(whole_filename, sizeof(whole_filename), "./Downloads/%s", recieve_buffer);

    size_t file_size;
    DIR *dp;
    struct dirent *ep;
    int total_bytes;
    int seq_num = 0;
    int retry_count = 0;

    char transmit_buffer[TRANSMIT_SIZE];
    int fd = open(whole_filename, O_RDONLY);
    if (fd < 0)
    {
        printf(RED "[-] Error Opening File \n" RESET);
        printf(RED "[-] Going Manual: enter your buffer through stdin(command line:) press ESC key when done \n" RESET);
        printf(RED "[-] \t\t There is 100 sec timeout so write quick :) ! \n\n" RESET);
        remove_timeout(sd);
        return -1;
    }
    /* Initialize transfer */
    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    uint8_t crc = crc8(0, NULL, 0);
    /* Read and send file in chunks */
    while ((total_bytes = read(fd, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE)) > 0)
    {
        if (seq_num >= 0xFFFF)
        {
            break; // Sequence number overflow
        }
    retry:;
        /* Construct packet header */
        transmit_buffer[0] = (total_bytes & 0x00FF);
        transmit_buffer[1] = (total_bytes & 0xFF00) >> 8;
        transmit_buffer[2] = (seq_num & 0x00FF);
        transmit_buffer[3] = (seq_num & 0xFF00) >> 8;
        crc = crc8(crc, &transmit_buffer[HEADERSIZE], total_bytes); // crc
        transmit_buffer[4] = crc;

        /* Send packet and wait for acknowledgment */
        printf("\nSending packet %d (length: %d (%d %d))\n", seq_num, total_bytes, transmit_buffer[0], transmit_buffer[1]);
        printf(MAG "> %s" RESET, transmit_buffer + HEADERSIZE);
        _send(sd, total_bytes + HEADERSIZE, transmit_buffer);

        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Handle acknowledgment */
        if (strncmp(recieve_buffer, ACK, 7) == 0)
        {
            bzero(transmit_buffer, TRANSMIT_SIZE);
            seq_num++;
            continue;
        }
        else
        {
            retry_count++;
            if (retry_count >= RETRY_COUNT)
            {
                retry_count = 0;
                printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                break;
            }
            printf(RED "[-]  NACK -> Retry sending the packet \n\r" RESET);
            goto retry;
        }
    }

    /* Complete transfer */
    printf(GRN "\n\n-- End Of File --\n\n" RESET);
    _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

    close(fd);
    remove_timeout(sd);
    return 0;
}

/**
 * Manual file upload operation with interactive terminal input
 *
 * Implements manual data entry mode for file upload with real-time terminal
 * handling and reliable data transfer protocol. Supports backspace editing
 * and ESC key termination.
 *
 * Terminal Handling:
 * - Disables canonical mode for immediate character processing
 * - Implements custom backspace handling
 * - Provides real-time cursor manipulation
 *
 * Protocol Details:
 * - Header: [2B length][2B sequence][1B CRC]
 * - Maximum timeout: 100 seconds for manual input
 * - Supports packet retransmission
 *
 * @param sd  Pointer to socket details structure
 */
void put_file(sockdetails_t *sd)
{
    set_timeout(sd, 100); // Extended timeout for manual input

    /* Initialize buffers and counters */
    char recieve_buffer[RECIEVE_SIZE];
    char transmit_buffer[TRANSMIT_SIZE];
    int write_pointer = HEADERSIZE; // Current write position in buffer
    int seq_number = 0;             // Packet sequence counter
    int retry_count = 0;            // Retransmission counter
    bool send_data = false;         // Flag to trigger packet transmission
    bool end_of_data = false;       // Flag to mark end of input

    /* Terminal configuration for raw input mode */
    struct termios old_tio, new_tio;
    unsigned char c;

    /* Save current terminal settings */
    tcgetattr(STDIN_FILENO, &old_tio);
    new_tio = old_tio;

    /* Configure terminal for raw input
     * - Disable canonical mode (no line buffering)
     * - Disable echo (manual echo handling)
     */
    new_tio.c_lflag &= (~ICANON & ~ECHO);
    if (tcsetattr(STDIN_FILENO, TCSANOW, &new_tio) < 0)
        perror("tcsetattr");

    /* Initialize display and CRC */
    int column_number = 1;
    uint8_t crc = crc8(0, NULL, 0);

    /* Main input processing loop */
    while (1)
    {
        char ch;
        read(STDIN_FILENO, &ch, 1);

        /* Handle special characters */
        if (ch == 10)
        { // Enter key resets to a new line
            printf("\n");
            column_number = 1;
        }
        else if (ch == 127) // Backspace
        {                   // backspace
            if (column_number <= 1)
            {
            }
            else
            {
                /* Update buffer and display */
                write_pointer--;
                column_number -= 1;

                /* Move cursor left, clear character, reset position */
                printf("\033[1D"); // Move left
                printf(" ");       // Clear character
                printf("\033[1D"); // Move left again
                fflush(stdout);
                continue;
            }
        }
        else // Regular character
        {
            /* Echo character and update cursor position */
            printf(MAG "%c\n" RESET, ch, ch);
            printf("\033[1A");                 // Move cursor up
            printf("\033[%dC", column_number); // Move cursor right
            column_number++;
            fflush(stdout);
        }

        /* Check if buffer is full or ESC pressed */
        if (write_pointer >= TRANSMIT_SIZE - 1 - HEADERSIZE || ch == 27) // -1 as it is index, and index starts from 0;
        {
            /* Determine transmission state based on buffer content and ESC */
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

            /* Handle packet transmission */
            if (send_data)
            {
                /* Construct packet header */
                transmit_buffer[0] = ((write_pointer - HEADERSIZE) & 0xFF);
                transmit_buffer[1] = (((write_pointer - HEADERSIZE) & 0xFF00) >> 8);
                transmit_buffer[2] = (seq_number & 0x00FF);
                transmit_buffer[3] = (seq_number & 0xFF00) >> 8;
                crc = crc8(crc, &transmit_buffer[HEADERSIZE], write_pointer - HEADERSIZE); // crc
                transmit_buffer[4] = crc;

                /* Send packet and process acknowledgment */
                _send(sd, TRANSMIT_SIZE, transmit_buffer);
                write_pointer = HEADERSIZE;

                bzero(recieve_buffer, TRANSMIT_SIZE);
                _recv(sd, RECIEVE_SIZE, recieve_buffer);
                if (strncmp(recieve_buffer, ACK, 7) == 0)
                {
                    /* Successful transmission */
                    bzero(transmit_buffer, TRANSMIT_SIZE);
                    seq_number++;
                    if (seq_number >= 0xFFFF)
                        break; // Sequence number overflow
                }
                else
                {
                    /* Handle retransmission */
                    printf(RED "[-] NACK - Max retries reached. Aborting.\n" RESET);
                    break;
                }
            }

            /* Handle end of transmission */
            if (end_of_data)
            {
                seq_number = 0;
                printf(GRN "\n\n-- End Of File --\n\n" RESET);
                _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);
                end_of_data = false;
                break;
            }
        }

        /* Store character in buffer */
        transmit_buffer[write_pointer++] = ch;
    }
    /* Restore terminal settings and cleanup */
    tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
    remove_timeout(sd);
}

/**
 * Delete file from server
 *
 * Sends delete request to server and processes response.
 * Handles error conditions and server responses.
 *
 * @param sd        Pointer to socket details structure
 * @param filename  Name of file to delete
 */
void delete_file(sockdetails_t *sd, char *filename)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nDELETE\n\n");

    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes
    bzero(recieve_buffer, RECIEVE_SIZE);
    _recv(sd, RECIEVE_SIZE, recieve_buffer);
    if (strncmp(recieve_buffer, FILE_NOT_FOUND, strlen(FILE_NOT_FOUND)) == 0)
    {
        printf(RED "[-] Could not find the file on server: %s\n" RESET, filename);
        return;
    }
    else if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA) == 0))
    {
        printf(RED "[-] Something went wrong on server\n\n" RESET);
        return;
    }
    printf(GRN "\n\n[+] File: \"%s\" deleted \n\n", filename);
    remove_timeout(sd);
}

/**
 * Cleanup socket resources and exit
 *
 * Handles graceful shutdown of socket connection.
 * Waits for final acknowledgment from server before closing.
 *
 * @param sd  Pointer to socket details structure
 */
void cleanup_resources(sockdetails_t *sd)
{

    char recieve_buffer[RECIEVE_SIZE];

    bzero(recieve_buffer, TRANSMIT_SIZE);
    /* Wait for final server acknowledgment */
    _recv(sd, RECIEVE_SIZE, recieve_buffer);
    if (strncmp(recieve_buffer, ACK, strlen(ACK)) == 0)
    {
        printf(GRN "[+] ACK recieved exiting \n" RESET);
        // done
        close(sd->sockfd);
        exit(EXIT_SUCCESS);
    }
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
    /* Validate command line arguments */
    if (argc != 3)
    {
        printf(RED "[-] You messed up, command is ./client <SERVER_IP> <SERVER_PORT>\n" RESET);
        exit(EXIT_FAILURE);
    }

    struct stat st = {0};
    /* Create Downloads directory if it doesn't exist */
    if (stat("/Downloads", &st) == -1)
    {
        mkdir("/Downloads", 0766); // Create with rwxrw-rw- permissions
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
    /* Initialize network structures and buffers */
    struct addrinfo hints, *serv_info, *temp;
    int status;
    int sockfd;
    socklen_t addr_len = sizeof(struct addrinfo);
    int numbytes;
    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes

    char ip[INET6_ADDRSTRLEN];

    /* Configure address hints structure for UDP socket */
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC; // AF_INET
    hints.ai_socktype = SOCK_DGRAM;

    /* Extract server address and port from arguments */
    char *server_address = argv[1];
    printf(GRN "[+] Passed Server Address %s\n" RESET, server_address);
    char *server_port = argv[2];
    printf(GRN "[+] Passed Server Port %s\n" RESET, server_port);

    /* Resolve server address using getaddrinfo */
    if ((status = getaddrinfo(server_address, server_port, &hints, &serv_info)) < 0)
    {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE);                                         // exit if there is an error
    }
    printf(GRN "[+] getaddrinfo call successful\n" RESET);

    /*
        int socket(int domain, int type, int protocol);
        we need domain to be IF_INET (IPv4)
        we need type to be UDP
        and protocol: specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0
    */
    /* Create socket
     * Iterate through available addresses until successful connection
     * Supports both IPv4 and IPv6 addresses
     */
    for (temp = serv_info; temp != NULL; temp = temp->ai_next)
    {
        if ((sockfd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            perror(RED "client: socket" RESET);
            exit(EXIT_FAILURE);
            continue;
        }
        printf(GRN "[+] socket call successful\n" RESET);

        break;
    }

    /* Verify socket creation */
    if (temp == NULL)
    {
        fprintf(stderr, RED "[-] socket connection failed for client \n" RESET);
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    /* Initialize socket details structure */
    sockdetails_t sd;
    sd.sockfd = sockfd;
    sd.their_addr = serv_info->ai_addr;
    sd.addr_len = sizeof(struct sockaddr);

    /*
     ssize_t sendto(int sockfd, const void buf[.len], size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

    */
    /* Main command processing loop */
    bool exit = false;
    char filename[256];

    while (true)
    {
        /* Process user commands through menu interface */
        switch (print_menu(filename))
        {
        case LS:
            /* List directory contents */
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "ls");
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            // list files
            list_files(&sd);
            break;
        case GET:
            /* Download file from server */
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
            /* Upload file to server */
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "put %s", filename);
            printf("put %s\n", filename);
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            if (put_file_file(&sd, filename) == -1)
            {
                put_file(&sd); // Fall back to manual input mode
            }
            break;

        case DELETE:
            /* Delete file from server */
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "delete %s", filename);
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            delete_file(&sd, filename);
            break;
        case EXIT:
            /* Clean termination */
            bzero(transmit_buffer, sizeof transmit_buffer);
            snprintf(transmit_buffer, sizeof transmit_buffer, "exit");
            _send(&sd, sizeof transmit_buffer, transmit_buffer);
            cleanup_resources(&sd);
            break;
        case -2:
            // Screen clear requested
            continue;
        default:
            break;
        }

        /* Cleanup and exit */
        if (exit)
            break;
    }

    // wait for the input;
    // we can use scanf, fgets, read calls to do that

    close(sockfd);

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
commands_t print_menu(char *filename)
{
    /* Display menu header */
    printf(YEL "\n\nThis client can support FTP through UDP\n\n");
    printf("Currently this program can support following commands \n");
    /* Display available commands */
    printf("get <filename>   : Get the file name in server and print the file\n");
    printf("put <filename>   : if filename does not exists on server, create one. \n\t\t   *If there is any error while opening file on client,\n\t\t   It will go manual and you have to enter you input through command line !!*\n");
    printf("delete <filename>: if filename does not exists on server, delete that file\n");
    printf("ls               : get the list of all the files in server and print it\n");
    printf("exit             : exit from the client program and free the resources in client and server\n");
    printf("enter key (|_)   : Again pressing enter will clear the screen\n");
    printf("\n" RESET);

    /* Process user input based on compilation flags */
#if SCANF == 1
    char cmd[100];
    printf("Enter your choice \n");
    scanf("%s", cmd);
    printf("%s\n", cmd);

#elif FGETS == 1
    /* fgets-based input processing */
    char cmd[100];
    printf("Enter your choice \n");
    fgets(cmd, sizeof(cmd), stdin);
    printf("%s\n", cmd);

#else
    /* Raw read-based input processing */
    char cmd[256];
    bzero(cmd, sizeof cmd);
    printf("Enter one of the comamnds ! \n>");
    int bytesread = read(STDIN_FILENO, cmd, sizeof(cmd));
    printf(MAG "%s\n" RESET, cmd);

#endif
    /* Extract filename if present and return command type */
    sscanf(cmd, "%*s %s", filename);
    return whichcmd(cmd);
}
