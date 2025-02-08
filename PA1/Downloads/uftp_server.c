/*******************************************************************************
 * Copyright (c) 2025
 *
 * File: server.c
 *
 * Description:
 * UDP-based FTP server implementation providing reliable file transfer services.
 * Implements a custom protocol over UDP with error detection, acknowledgments,
 * and retransmission mechanisms. Supports basic file operations including GET,
 * PUT, DELETE, and directory listing.
 *
 * Protocol Features:
 * - Reliable data transfer over UDP using stop-and-wait protocol
 * - CRC-8 error detection with lookup table optimization
 * - 5-byte header format: [2B length][2B sequence][1B CRC]
 * - Maximum packet size: 30KB (configurable up to 60KB)
 * - Automatic retransmission on errors
 *
 * Author: Parth Thakkar
 * Last Modified: February 1, 2025
 ******************************************************************************/

/* Standard Library Headers
 * Core system functionality and standard I/O operations
 */
#include <stdio.h>   // Standard I/O operations
#include <stdlib.h>  // Memory allocation, conversion functions
#include <stdint.h>  // Fixed-width integer types (uint8_t, etc.)
#include <stdbool.h> // Boolean type and values
#include <string.h>  // String manipulation functions
#include <unistd.h>  // POSIX operating system API
#include <errno.h>   // Error number definitions

/* Network Protocol Headers
 * Required for UDP socket implementation and network operations
 */
#include <sys/types.h>  // System data types
#include <sys/socket.h> // Socket interface functions
#include <netdb.h>      // Network address conversion
#include <arpa/inet.h>  // Internet operations
#include <netinet/in.h> // Internet protocol family
#include <dirent.h>     // Directory entry operations

/* File Operation Headers
 * Support for file system operations
 */
#include <unistd.h> // System calls (read, write, close)
#include <fcntl.h>  // File control options

/* ANSI Terminal Color Definitions
 * Used for status message formatting and visual feedback
 */
#define RED "\x1B[31m"  // Error messages
#define GRN "\x1B[32m"  // Success indicators
#define YEL "\x1B[33m"  // Warnings
#define BLU "\x1B[34m"  // Informational messages
#define MAG "\x1B[35m"  // Data visualization
#define CYN "\x1B[36m"  // Alternative highlighting
#define WHT "\x1B[37m"  // Standard output
#define RESET "\x1B[0m" // Reset formatting

/* Protocol Configuration Constants
 * Define buffer sizes and protocol parameters
 */
#define MAXDATASIZE 100           // Maximum size for general data
#define RECIEVE_SIZE (1024 * 30)  // 30KB receive buffer
#define TRANSMIT_SIZE (1024 * 30) // 30KB transmit buffer
#define HEADERSIZE 5              // Protocol header size in bytes
#define TIMEOUT 5                 // Socket timeout in seconds

/* Protocol Message Definitions
 * Standard messages used in the communication protocol
 * Each message is padded with tabs for consistent length
 */
#define END_OF_DYNAMIC_DATA "EOF\t\t\t\0"                                   // End of data marker
#define ACK "ack\t\t\t\0"                                                   // Positive acknowledgment
#define NACK "nack\t\t\t\0"                                                 // Negative acknowledgment
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\t\t\n\0" // Operation failure
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\t\t\n\0"                           // File not found error
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\t\t\n\0"                         // File exists error
#define WRONG_COMMAND "WRONG_COMMAND\t\t\t\n\0"                             // Invalid command error

#define RETRY_COUNT 3

/**
 * Command Enumeration
 * Defines supported FTP operations
 */
typedef enum
{
    GET,               // Retrieve file from server
    PUT,               // Upload file to server
    DELETE,            // Remove file from server
    LS,                // List directory contents
    EXIT,              // Terminate connection
    number_of_command, // Total number of commands (used for validation)
} commands_t;

/**
 * Socket Details Structure
 * Encapsulates connection state and socket information for a client
 */
typedef struct
{
    int sockfd;                         // Socket file descriptor
    struct sockaddr_storage their_addr; // Client address information
    int addr_len;                       // Length of address structure
    int recvBytes;                      // Bytes received in last operation
    int sentBytes;                      // Bytes sent in last operation
} sockdetails_t;

/**
 * CRC-8 Lookup Table
 * Pre-computed table for CRC-8/KOOP polynomial: x^8 + x^6 + x^3 + x^2 + 1 (0x14D)
 *
 * Implementation Details:
 * - Width: 8 bits
 * - Polynomial: 0x4d
 * - Initial value: 0xff
 * - Reflect Input/Output: true
 * - XOR output: 0xff
 * - Check value: 0xd8
 *
 * Reference: Koopman, et al. (http://www.ece.cmu.edu/~koopman/roses/dsn04/koopman04_crc_poly_embedded.pdf)
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

commands_t whichcmd(char *cmd);

/**
 * Extract IP address from socket address structure
 *
 * Handles both IPv4 and IPv6 addresses, extracting the appropriate address
 * field from the socket address structure.
 *
 * @param sa  Pointer to socket address structure (sockaddr)
 * @return    Pointer to IP address field, NULL if family not supported
 */
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

/**
 * Calculate CRC-8 checksum for error detection
    Return the CRC-8 of data[0..len-1] applied to the seed crc. This permits the
    calculation of a CRC a chunk at a time, using the previously returned value
    for the next seed. If data is NULL, then return the initial seed. See the
    test code for an example of the proper usage.
 * Implements CRC-8/KOOP algorithm using pre-computed lookup table.
 * Supports incremental CRC calculation for processing data in chunks.
 *
 * @param crc   Initial CRC value (use 0 for first chunk)
 * @param data  Pointer to data buffer for CRC calculation
 * @param len   Length of data in bytes
 *
 * @return      Calculated CRC-8 value
 *
 * Example Usage:
 *   uint8_t crc = crc8(0, NULL, 0);           // Initialize CRC
 *   crc = crc8(crc, data_chunk1, length1);    // Process first chunk
 *   crc = crc8(crc, data_chunk2, length2);    // Process second chunk
 */

unsigned crc8(unsigned crc, unsigned char const *data, size_t len)
{
    if (data == NULL)
        return 0;
    crc &= 0xff;
    unsigned char const *end = data + len;
    while (data < end)
        crc = crc8_table[crc ^ *data++]; // Update CRC using lookup table
    return crc;
}

/**
 * Handle network operation errors
 *
 * Processes and reports network errors, distinguishing between timeouts
 * and other error conditions. For timeouts, displays message; for other errors,
 * notifies client of operation failure.
 *
 * @param sd   Pointer to socket details structure
 * @param msg  Error message to be displayed
 *
 * Error Handling:
 * - Timeout (EAGAIN/EWOULDBLOCK): Display timeout message
 * - Other errors: Send error notification to client
 */
void error(sockdetails_t *sd, char *msg)
{
    printf(RED "[-] Error somewhere ! Check below message to see details \n");

    perror(msg); // Print system error message

    if (errno == EAGAIN || errno == EWOULDBLOCK)
    {
        /* Handle timeout conditions */
        printf(RED "[-] Timeout\n" RESET);
    }
    else
    {
        /* Notify client of error condition */
        sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)&sd->their_addr, sd->addr_len);
        // close(sd->sockfd);
        // exit(EXIT_FAILURE);
    }
}

/**
 * Reliable UDP send wrapper
 *
 * Encapsulates UDP packet transmission with error handling.
 * Updates sent bytes count in socket details structure.
 *
 * @param sd      Pointer to socket details structure
 * @param size    Size of data to send
 * @param packet  Pointer to data buffer
 *
 * Implementation:
 * - Uses sendto() for UDP transmission
 * - Updates sentBytes counter
 * - Handles transmission errors through error()
 */
void _send(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->sentBytes = sendto(sd->sockfd, packet, size, 0, (struct sockaddr *)&sd->their_addr, sd->addr_len)) < 0)
    {
        error(sd, "[-] send");
    }
}

/**
 * Reliable UDP receive wrapper
 *
 * Encapsulates UDP packet reception with error handling.
 * Updates received bytes count in socket details structure.
 *
 * @param sd      Pointer to socket details structure
 * @param size    Maximum size of data to receive
 * @param packet  Pointer to receive buffer
 *
 * Implementation:
 * - Uses recvfrom() for UDP reception
 * - Updates recvBytes counter
 * - Handles reception errors through error()
 */
void _recv(sockdetails_t *sd, int size, void *packet)
{
    if ((sd->recvBytes = recvfrom(sd->sockfd, packet, size, 0, (struct sockaddr *)&sd->their_addr, &sd->addr_len)) < 0)
    {
        error(sd, "[-] recv");
    }
}

/**
 * Configure socket receive timeout
 *
 * Sets SO_RCVTIMEO socket option to implement receive timeout.
 * Configures both seconds and microseconds components.
 *
 * @param sd   Pointer to socket details structure
 * @param sec  Timeout value in seconds
 *
 * Error Handling:
 * - Exits on socket option setting failure
 *
 * Implementation Notes:
 * - Uses timeval structure for timeout specification
 * - Microseconds component set to 0
 * - Applies to receive operations only
 */
void set_timeout(sockdetails_t *sd, int sec)
{
    /* Configure timeout structure */
    struct timeval timeout;
    timeout.tv_sec = sec; // Seconds component
    timeout.tv_usec = 0;  // Microseconds component

    /* Set socket option */
    if (setsockopt(sd->sockfd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) == -1)
    {
        perror("setsockopt");
        exit(1);
    }
}

/**
 * Remove socket receive timeout
 *
 * Disables SO_RCVTIMEO socket option by setting timeout to zero.
 * Returns socket to blocking mode.
 *
 * @param sd  Pointer to socket details structure
 *
 * Error Handling:
 * - Exits on socket option setting failure
 *
 * Implementation Notes:
 * - Sets both seconds and microseconds to 0
 * - Effectively disables timeout mechanism
 */
void remove_timeout(sockdetails_t *sd)
{
    /* Configure timeout structure for no timeout */
    struct timeval timeout;
    timeout.tv_sec = 0;  // No seconds timeout
    timeout.tv_usec = 0; // No microseconds timeout

    /* Remove socket option */
    if (setsockopt(sd->sockfd, SOL_SOCKET, SO_RCVTIMEO,
                   &timeout, sizeof(timeout)) == -1)
    {
        perror("setsockopt");
        exit(1);
    }
}

/**
 * List Directory Contents with Reliable Transfer
 *
 * Implements reliable directory listing transmission over UDP using
 * stop-and-wait protocol with CRC error detection and acknowledgment.
 * Sends each filename as a separate packet with sequence numbers.
 *
 * Protocol Flow:
 * 1. Read directory entry
 * 2. Construct packet with header
 * 3. Send and wait for ACK
 * 4. Retry on NACK up to RETRY_COUNT times
 *
 * @param sd  Pointer to socket details structure
 */
void list_files(sockdetails_t *sd)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nLS\n\n");

    /* Initialize directory scanning */
    DIR *dp;
    struct dirent *ep;
    int total_bytes;
    int retry_count = 0;

    /* Initialize transmission buffers and CRC */
    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];
    uint8_t crc = crc8(0, NULL, 0);
    dp = opendir("./");
    if (dp != NULL)
    {
        int seq_num = 0; // Packet sequence counter
        while ((ep = readdir(dp)) != NULL)
        {
        retry:;
            /* Prepare filename packet */
            int record_len = strlen(ep->d_name);
            bzero(transmit_buffer, sizeof(transmit_buffer));

            memcpy(transmit_buffer, ep->d_name, record_len);

            /* Construct packet header
             * Format: [2B length][2B sequence][1B CRC][data]
             */
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

            /* Send packet and handle acknowledgment */
            memcpy(packet + HEADERSIZE, transmit_buffer, record_len);
            _send(sd, record_len + HEADERSIZE, packet);
            printf(MAG "> %s" RESET, transmit_buffer);

            bzero(recieve_buffer, sizeof(recieve_buffer));
            _recv(sd, RECIEVE_SIZE, recieve_buffer);

            /* Process acknowledgment */
            if (strncmp(recieve_buffer, ACK, 7) == 0)
            {
                // got the ack we can append
                seq_num++;
                retry_count = 0;
                continue;
            }
            else
            {
                if (retry_count >= RETRY_COUNT)
                {
                    printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                    break;
                }
                printf(RED "[-] NACK -> Retry sending the packet\n" RESET);
                goto retry;
            }
        }

        /* Send end-of-transmission marker */
        _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

        closedir(dp);
    }
    remove_timeout(sd);
}

/**
 * Handle GET File Request
 *
 * Implements reliable file transfer from server to client using
 * stop-and-wait protocol with error detection and retransmission.
 *
 * Protocol Features:
 * - CRC-based error detection
 * - Sequence number tracking
 * - Automatic retransmission on NACK
 * - Maximum retry limit
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing the GET request
 */
void get_file(sockdetails_t *sd, char *recieve_buffer)
{
    set_timeout(sd, TIMEOUT);
    printf("\n\nGET\n\n");
    char filename[50];
    /* Extract filename from request */
    sscanf(&recieve_buffer[strlen("get") + 1], "%s", filename);

    /* Validate filename */
    if (filename[0] == '\0')
    {
        printf(RED "[-] File Name is Empty" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        remove_timeout(sd);
        return;
    }

    /* Initialize transfer parameters */
    size_t file_size;
    DIR *dp;
    struct dirent *ep;
    int total_bytes;
    int seq_num = 0;
    int retry_count = 0;

    char transmit_buffer[TRANSMIT_SIZE];

    /* Open and validate file */
    int fd = open(filename, O_RDONLY);
    if (fd < 0)
    {
        printf(RED "[-] Error Opening File \n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        remove_timeout(sd);
        return;
    }

    /* Initialize transfer buffers and CRC */
    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    uint8_t crc = crc8(0, NULL, 0);

    /* Read and send file in chunks */
    while ((total_bytes = read(fd, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE)) > 0)
    {
        /* Check sequence number overflow */
        if (seq_num >= 0xFFFF)
        {
            break;
        }
    retry:;
        /* Construct packet header */
        transmit_buffer[0] = (total_bytes & 0x00FF);      // Length low byte
        transmit_buffer[1] = (total_bytes & 0xFF00) >> 8; // Length high byte
        transmit_buffer[2] = (seq_num & 0x00FF);          // Sequence low byte
        transmit_buffer[3] = (seq_num & 0xFF00) >> 8;     // Sequence high byte
        crc = crc8(crc, &transmit_buffer[HEADERSIZE], total_bytes);
        transmit_buffer[4] = crc;

        /* Send packet and display progress */
        printf("\nSending packet %d (length: %d (%d %d))\n", seq_num, total_bytes, transmit_buffer[0], transmit_buffer[1]);
        printf(MAG "> %s" RESET, transmit_buffer + HEADERSIZE);
        _send(sd, total_bytes + HEADERSIZE, transmit_buffer);

        /* Wait for acknowledgment */
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Process acknowledgment */
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
}

/**
 * Handle PUT File Operation
 *
 * Implements reliable file upload from client to server using stop-and-wait protocol
 * with CRC error detection and sequence number verification.
 *
 * Protocol Flow:
 * 1. Receive filename and validate
 * 2. Create/truncate file
 * 3. Receive data packets with error checking
 * 4. Send ACK/NACK based on validation
 * 5. Write validated data to file
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing PUT command and filename
 */
void put_file(sockdetails_t *sd, char *recieve_buffer)
{
    /* Set extended timeout for file writing for manual mode ! */
    set_timeout(sd, 50);
    printf("\n\nPUT\n\n");

    /* Extract and validate filename */
    char filename[50];
    sscanf(&recieve_buffer[strlen("put") + 1], "%s", filename);
    if (filename[0] == '\0')
    {
        printf(RED "[-] File Name is Empty" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        remove_timeout(sd);
        return;
    }

    /* Initialize transfer parameters */
    size_t file_size;
    DIR *dp;
    struct dirent *ep;
    int total_bytes;
    int seq_num = 0;
    int retry_count = 0;
    char transmit_buffer[TRANSMIT_SIZE];
    int current_count = 0;

    /* Create or truncate file with read-write permissions */
    int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0)
    {
        printf(RED "[-] Error Opening File \n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        remove_timeout(sd);
        return;
    }

    /* Initialize buffers and CRC */
    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    uint8_t crc = crc8(0, NULL, 0);

    /* Main reception loop */
    while (1)
    {
    retry:;
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Check for end of transmission */
        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA)) == 0)
        {
            printf(GRN "\n\n--- End of file received. --\n\n" RESET);
            close(fd);
            break;
        }

        /* Handle transmission errors */
        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            close(fd);
            remove_timeout(sd);
            return;
        }

        /* Extract and validate packet header */
        int seq_num = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];
        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        /* Verify packet integrity and sequence */
        if ((unsigned)crc_server == (unsigned)crc && seq_num == current_count)
        {
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
            printf(RED "[-]  Sequence number does not match, asking to re-send the packet Seq:%d(%d) crc_recv %d(%d) \n\r" RESET, seq_num, current_count, crc, crc_server);
            memcpy(transmit_buffer, NACK, strlen(NACK));
            _send(sd, strlen(NACK), transmit_buffer);
            continue;
        }

        /* Write validated data to file */
        printf(MAG "%s\n" RESET, recieve_buffer + HEADERSIZE);
        total_bytes = write(fd, &recieve_buffer[HEADERSIZE], data_length);
    }
    printf(GRN "\n\n[+] Wrote \"%s\" file to current folder\n\n" RESET, filename);
    remove_timeout(sd);
}

/**
 * Handle DELETE File Operation
 *
 * Implements file deletion with existence verification and error handling.
 * Searches current directory for file and removes if found.
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing DELETE command and filename
 */
void delete_file(sockdetails_t *sd, char *recieve_buffer)
{
    /* Set standard timeout and extract filename */
    set_timeout(sd, TIMEOUT);
    printf("\n\nDELETE\n\n");
    char filename[50];
    sscanf(&recieve_buffer[strlen("delete") + 1], "%s", filename);
    /* Validate filename */
    if (filename[0] == '\0')
    {
        printf(RED "[-] File Name is Empty\n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
        remove_timeout(sd);
        return;
    }

    /* Initialize directory scanning */
    DIR *dp;
    struct dirent *ep;
    int total_bytes;

    char transmit_buffer[TRANSMIT_SIZE];
    /* Open and scan current directory */
    dp = opendir("./");
    if (dp != NULL)
    {
        int seq_num = 0;
        while ((ep = readdir(dp)) != NULL)
        {
            /* Check for matching filename */
            if (strncmp(ep->d_name, filename, strlen(ep->d_name)) == 0)
            {
                printf(GRN "[+] Found the file %s, deleting it\n" RESET, filename);
                bzero(transmit_buffer, sizeof(transmit_buffer));
                _send(sd, sizeof(ACK), ACK);
                remove(ep->d_name);
                closedir(dp);
                remove_timeout(sd);
                return;
            }
        }

        /* Handle file not found */
        printf(RED "[-] Could not find the file: %s\n" RESET, filename);
        _send(sd, strlen(FILE_NOT_FOUND), FILE_NOT_FOUND);
        closedir(dp);
    }
    else
    {   
        /* Handle directory access error */
        printf(RED "[-] Something went wrong while opening PWD\n" RESET);
        _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
    }
    remove_timeout(sd);
}


/**
 * Clean up Client Resources
 * 
 * Performs cleanup operations when client requests disconnection.
 * Sends acknowledgment to client and removes timeout settings.
 * 
 * @param sd  Pointer to socket details structure
 * 
 * Note: Future enhancement planned for child process handling
 */
void cleanup_client_resouces(sockdetails_t *sd)
{
    /* Send acknowledgment to client */
    char transmit_buffer[TRANSMIT_SIZE];
    bzero(transmit_buffer, TRANSMIT_SIZE);
    snprintf(transmit_buffer, sizeof(ACK), ACK);
    _send(sd, TRANSMIT_SIZE, transmit_buffer);

    /* Remove timeout and cleanup */
    remove_timeout(sd);
    // something cleanup, we will use child processes to make it more useable !
}


/**
 * Process Client Commands and Handle Responses
 * 
 * Main command processing function that receives client commands,
 * identifies the requested operation, and dispatches to appropriate handlers.
 * Supports GET, PUT, DELETE, LS, and EXIT operations.
 * 
 * Protocol Flow:
 * 1. Receive command from client
 * 2. Extract client IP and command
 * 3. Parse and validate command
 * 4. Dispatch to appropriate handler
 * 
 * @param sockfd Socket file descriptor for client communication
 */
void recieve_and_send(int sockfd)
{
    /* Initialize buffers and structures */
    char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    char transmit_buffer[TRANSMIT_SIZE];
    char ip[INET6_ADDRSTRLEN];

    int recvBytes, sentBytes;

    /* Set up socket details structure */
    sockdetails_t sd;
    sd.sockfd = sockfd;
    sd.addr_len = sizeof(sd.their_addr);

    bzero(recieve_buffer, RECIEVE_SIZE);
    _recv(&sd, RECIEVE_SIZE, recieve_buffer);

    /* Log client information */
    char *temp_ip = getin_addr((struct sockaddr *)&sd.their_addr);
    printf(GRN "\n\n[+] Recieved Command \"%s\" from IP %s\n" RESET, recieve_buffer, inet_ntop(sd.their_addr.ss_family, temp_ip, ip, sizeof ip));

     /* Parse command and dispatch to handler */
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


/**
 * Server Main Function
 * 
 * Initializes UDP server, configures socket options, and enters
 * main processing loop. Handles IPv4/IPv6 connections with timeout
 * and address reuse capabilities.
 * 
 * Server Features:
 * - IPv4/IPv6 support (AF_UNSPEC)
 * - Configurable port (>5000)
 * - Socket timeout handling
 * - Address reuse capability
 * 
 * @param argc Argument count (expects 2)
 * @param argv Arguments (program name, port number)
 * @return EXIT_SUCCESS on normal termination, EXIT_FAILURE on error
 */
int main(int argc, char *argv[])
{   
    /* Validate command line arguments */
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
   /* Initialize network structures */
    struct addrinfo hints, *serv_info, *temp;

    int status;
    int sockfd;

    int numbytes;
    char buf[MAXDATASIZE];
    char ip[INET6_ADDRSTRLEN];

    /* Configure address hints structure */
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_flags = AI_PASSIVE; // fill up my IP

    /* Validate and set port number */
    char *server_port = argv[1];
    printf("Passed Server Port %s\n", server_port);
    if (atoi(server_port) <= 5000)
    {
        fprintf(stderr, RED "[-] Port Value <= 5000 ! keep port value more than 5000 \n" RESET);
        exit(EXIT_FAILURE);
    }

    /* Get address information */
    if ((status = getaddrinfo(NULL, server_port, &hints, &serv_info)) < 0)
    {
        fprintf(stderr, RED "getaddrinfo: %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE);                                                   // exit if there is an error
    }
    printf(GRN "[+] getaddrinfo call successful\n" RESET);

        /* Create and configure socket */

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
            perror(RED "server: socket");
            continue;
        }
        printf(GRN "[+] socket call successful\n" RESET);

        /* Configure socket timeouts */
        struct timeval timeout;
        timeout.tv_sec = TIMEOUT;
        timeout.tv_usec = 0;

        int yes = 1;
        /* Set socket options */
        if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1 || setsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout)) == -1)
        {
            perror(RED "setsockopt");
            exit(1);
        }

        /*
        int bind(int sockfd, const struct sockaddr *addr,
                socklen_t addrlen);
        */
        if (bind(sockfd, temp->ai_addr, temp->ai_addrlen) < 0)
        {
            close(sockfd);
            perror(RED "server: bind");
            continue;
        }

        break;
    }

    /* Verify socket creation and binding */
    if (temp == NULL)
    {
        fprintf(stderr, RED "[-] socket connection failed for server \n" RESET);
        close(sockfd);
        exit(EXIT_FAILURE);
    }

     /* Display server information */
    inet_ntop(temp->ai_family, getin_addr(temp->ai_addr), ip, sizeof ip);
    printf(GRN "[+] Server recieving UDP packet to : %s\n" RESET, ip);

    freeaddrinfo(serv_info); // we do not need this anymore

     /* Main server loop */
    bool exit = false;
    while (true)
    {
        recieve_and_send(sockfd);
    }

    /* Cleanup */
    close(sockfd);

    return EXIT_SUCCESS;
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
        printf("exit");
        return EXIT;
    }
    else if (strncmp(cmd, "delete ", strlen("delete ")) == 0)
    {
        return DELETE;
    }
    else
    {
        printf(RED "[-] Wrong command try again \n\r" RESET);
        return -1;
    }
}
