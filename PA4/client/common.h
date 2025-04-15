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
#define SERVER_CONF "./dfc.conf"
#define MAX_SIZE (1024 * 30)   /* Maximum buffer size (30KB) */
#define RECIEVE_SIZE MAX_SIZE  /* Receive buffer size */
#define TRANSMIT_SIZE MAX_SIZE /* Transmit buffer size */
#define USE_FORK 0             /* Use threading instead of forking */
#define TOTAL_THREADS 10       /* Number of worker threads */
#define MAX_THREAD_IN_POOL 200 /* Maximum thread pool size */
#define TIMEOUT_SEC 10         /* Connection timeout in seconds */
#define RETRY_COUNT 3
#define MAX_NUMBER_OF_SERVERS 1024
#define MAX_NUMBER_OF_CHUNKS_PER_SERVER 2
/** @} */

#if USE_FORK == 0
#define USE_THREADPOOL 1
#endif

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

/* Protocol Message Definitions
 * Standard messages used in the communication protocol
 * Each message is padded with tabs for consistent length
 */
#define END_OF_DYNAMIC_DATA "EOF\t\n0\t\n\0"                                   // End of data marker
#define ACK "ack\t\n0\t\n\0"                                                   // Positive acknowledgment
#define NACK "nack\t\n0\t\n\0"                                                 // Negative acknowledgment
#define ERROR_FOR_DYNAMIC_DATA "UNABLE_TO_COMPLETE_THE_OPERATION\t\n0\t\n\0" // Operation failure
#define FILE_NOT_FOUND "FILE_NOT_FOUND\t\n0\t\n\0"                           // File not found error
#define FILE_EXISTS "FILE_ALREADY_EXISTS\t\n0\t\n\0"                         // File exists error
#define WRONG_COMMAND "WRONG_COMMAND\t\n0\t\n\0"                             // Invalid command error
#define TIMEOUT_HTTP_SEC 10

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

/**
 * @enum contentType_s
 * @brief Supported content types for responses
 */
typedef enum contentType_s
{
    TEXT_HTML,              /* text/html */
    TEXT_CSS,               /* text/css */
    TEXT_PLAIN,             /* text/plain */
    APPLICATION_JAVASCRIPT, /* application/javascript */
    IMAGE_PNG,              /* image/png */
    IMAGE_GIF,              /* image/gif */
    IMAGE_JPG,              /* image/jpeg */
    IMAGE_X_ICON,           /* image/x-icon */
    total_content_types     /* Count of supported types */
} contentType_t;

/**
 * @enum parse_result_t
 * @brief Parser result codes
 */
typedef enum
{
    PARSE_OK = 0,                     /* Successful parse */
    PARSE_ERROR_INVALID_METHOD = -1,  /* Unknown HTTP method */
    PARSE_ERROR_INVALID_URI = -2,     /* Malformed URI */
    PARSE_ERROR_INVALID_VERSION = -3, /* Unsupported HTTP version */
    PARSE_ERROR_MALFORMED = -4,       /* General syntax error */
    PARSE_ERROR_BUFFER_OVERFLOW = -5  /* Request too large */
} parse_result_t;



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
    char *command; // no need to free it afterwards
    char *filename;
    commands_t command_int;
    serverDetails_t *servers_details;
    int number_of_servers;
    struct addrinfo *connect_to_info;        // Client address information
    int timeout;
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