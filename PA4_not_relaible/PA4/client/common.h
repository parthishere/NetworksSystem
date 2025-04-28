/**
 * @file common.h
 * @brief Common Definitions and Types for HTTP Server Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This header file defines core types, constants, and structures used throughout
 * the HTTP server implementation. It provides:
 * - System and network header inclusions
 * - Configuration constants
 * - Protocol-specific enumerations
 * - Data structures for request/response handling
 * - Utility function declarations
 *
 * The definitions support both IPv4 and IPv6 networking, HTTP/1.0 and HTTP/1.1
 * protocols, and various content types for web serving capabilities.
 */

#ifndef __COMMON_H__
#define __COMMON_H__

/* System Headers
 * Core system functionality for memory, I/O, and string operations
 */
#define _GNU_SOURCE
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
 * Required for implementing UDP/TCP socket communication
 */
#include <sys/types.h>  // Basic system data types
#include <sys/socket.h> // Socket definitions and functions
#include <netdb.h>      // Network database operations
#include <arpa/inet.h>  // Internet operations
#include <netinet/in.h> // Internet address family
#include <sys/stat.h>   // File status and information
#include <fcntl.h>      // File control options

/* Process and Thread Management Headers */
#include <sys/wait.h>    /* Process wait functions */
#include <sched.h>       /* Scheduling functions */
#include <time.h>        /* Time and date functions */
#include <pthread.h>     /* POSIX threads */
#include <sys/sysinfo.h> /* System statistics */

/* File Transfer Optimization */
#include <sys/sendfile.h> /* Zero-copy file transfer */

#include <openssl/md5.h>
#include <openssl/evp.h>

/**
 * @name Server Configuration Constants
 * @{
 */
#define WHERE_TO_DOWNLOAD_FILE "."
#define SERVER_CONF "./dfc.conf"

#define MAX_SIZE (1024 * 30)   /* Maximum buffer size (30KB) */
#define RECIEVE_SIZE MAX_SIZE  /* Receive buffer size */
#define TRANSMIT_SIZE MAX_SIZE /* Transmit buffer size */

#define TOTAL_THREADS 10       /* Number of worker threads */

#define TIMEOUT_SEC 1         /* Connection timeout in seconds */
#define MAX_NUMBER_OF_SERVERS 4
#define NUMBER_OF_PAIRS 4
#define MAX_NUMBER_OF_CHUNKS_PER_SERVER 3
/** @} */

/* Terminal Color Definitions
 * ANSI escape sequences for colored output
 * Used to enhance user interface and error reporting
 */
#define RED "\x1B[31m"  // Error messages
#define GRN "\x1B[32m"  // Success messages
#define YEL "\x1B[33m"  // Warnings and prompts
#define BLU "\x1B[34m"  // Informational messages
#define MAG "\x1B[36m"  // Alternative highlighting
#define WHT "\x1B[37m"  // Standard output
#define RESET "\x1B[0m" // Reset to default color

/* Protocol Message Definitions
 * Standard messages used in the communication protocol
 * Each message is padded with tabs for consistent length
 */
#define ACK "ack\t\n0\t\n\0"                                                   // Positive acknowledgment
#define ACK_LEN 7

#define NACK "nack\t\n0\t\n\0"                                                 // Negative acknowledgment
#define NACK_LEN 8

/* Screen Management
 * Terminal control sequence for clearing screen
 */
#define clrscr ({printf("\033[2J\033[H");\
    fflush(stdout); })

#define HASH_STR_LENGTH 33 // MD5 hex string (32 chars + null)

/**
 * Command Enumeration
 * Defines supported FTP commands for the client
 */
typedef enum
{
    GET,    // Download file from server
    PUT,    // Upload file to server
    DELETE, // Remove file from server
    LS,     // List directory contents
    EXIT,   // Terminate connection
    SERVER_INFO,
    HELP,
    number_of_command, // Total number of commands (used for validation)
} commands_t;




typedef struct serverDetails_t {
    int client_sock_fd;
    char *server_port; // need to free it afterwards - server port to connect to
    char *server_ip;  // need to free it afterwards - client ip to connect to 
    int dfsno;
    struct serverDetails_t *next; // need to free it afterwards, next element - link list
}serverDetails_t;

/**
 * @struct sockdetails_t
 * @brief Socket Details Structure
 *
 * Encapsulates connection state and socket information for a client connection,
 * including file descriptors, address information, and transfer statistics.
 */
typedef struct
{
    int sockfd; // Socket file descriptor
    char *command; // no need to free it (argv)
    char *filename; // no need to free it (argv)
    commands_t command_int;
    serverDetails_t *servers_details;
    struct addrinfo *connect_to_info;        // Client address information
    int server_sock_fds[MAX_NUMBER_OF_SERVERS];
    int number_of_servers;
    int number_of_available_servers;

    pthread_mutex_t lock;
} sockDetails_t;


/**
 * @struct threadParams_t
 * @brief Thread Parameters Structure
 *
 * Contains parameters passed to worker threads.
 */
typedef struct
{
    int threadIdx;
} threadParams_t;

/**
 * Extract IP address from socket address structure
 *
 * Handles both IPv4 and IPv6 addresses, extracting the appropriate address
 * field from the socket address structure.
 *
 * @param sa  Pointer to socket address structure (sockaddr)
 * @return    Pointer to IP address field, NULL if family not supported
 */
void *getin_addr(struct sockaddr *sa);

#endif