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
#include <sys/wait.h>         /* Process wait functions */
#include <sched.h>            /* Scheduling functions */
#include <time.h>             /* Time and date functions */
#include <pthread.h>          /* POSIX threads */
#include <sys/sysinfo.h>      /* System statistics */

/* File Transfer Optimization */
#include <sys/sendfile.h>     /* Zero-copy file transfer */

#include <glob.h>


/**
 * @name Server Configuration Constants
 * @{
 */
#define BLOCKLIST_FILE_NAME "./blocklist.cfg"
#define CACHE_ROOT "./cache"
#define USE_SENDFILE 1          /* Enable zero-copy file transfers */
#define ROOT_DIR "./www"        /* Web root directory */
#define MAX_SIZE (1024 * 30)    /* Maximum buffer size (30KB) */
#define RECIEVE_SIZE MAX_SIZE   /* Receive buffer size */
#define TRANSMIT_SIZE MAX_SIZE  /* Transmit buffer size */
#define USE_FORK 0              /* Use threading instead of forking */
#define TOTAL_THREADS 10       /* Number of worker threads */
#define MAX_THREAD_IN_POOL 200  /* Maximum thread pool size */
#define TIMEOUT_HTTP_SEC 10      /* Connection timeout in seconds */
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



/**
 * @enum httpType_s
 * @brief Supported HTTP protocol versions
 */
typedef enum httpType_s
{
    HTTP1_0,                    /* HTTP/1.0 protocol */
    HTTP1_1,                    /* HTTP/1.1 protocol */
    ERROR_VERSION,              /* Invalid/unsupported version */
    supported_http_protocols    /* Count of supported protocols */
} httpType_t;

/**
 * @enum statusCode_s
 * @brief HTTP response status codes
 */
typedef enum statusCode_s
{
    OK = 1 << 0,                         /* 200 OK */
    BAD_REQ = 1 << 1,                    /* 400 Bad Request */
    FORBIDDEN = 1 << 2,                  /* 403 Forbidden */
    NOT_FOUND = 1 << 3,                  /* 404 Not Found */
    METHOD_NOT_ALLOWED = 1 << 4,         /* 405 Method Not Allowed */
    VERSION_NOT_SUPPORTED = 1 << 5,      /* 505 HTTP Version Not Supported */
    total_status_codes,         /* Count of status codes */
} statusCode_t;


/**
 * @enum method_s
 * @brief Supported HTTP methods
 */
typedef enum method_s
{
    GET,                        /* HTTP GET method */
    POST,                       /* HTTP POST method */
    PUT,                        /* HTTP PUT method */
    DELETE,                     /* HTTP DELETE method */
    PATCH,                      /* HTTP PATCH method */
    HEAD,                       /* HTTP HEAD method */
    total_req_methods,          /* Count of supported methods */
} method_t;

/**
 * @enum contentType_s
 * @brief Supported content types for responses
 */
typedef enum contentType_s
{
    TEXT_HTML,                  /* text/html */
    TEXT_CSS,                   /* text/css */
    TEXT_PLAIN,                 /* text/plain */
    APPLICATION_JAVASCRIPT,     /* application/javascript */
    IMAGE_PNG,                  /* image/png */
    IMAGE_GIF,                  /* image/gif */
    IMAGE_JPG,                  /* image/jpeg */
    IMAGE_X_ICON,              /* image/x-icon */
    total_content_types         /* Count of supported types */
} contentType_t;


/**
 * @enum parse_result_t
 * @brief Parser result codes
 */
typedef enum
{
    PARSE_OK = 0,                         /* Successful parse */
    PARSE_ERROR_INVALID_METHOD = -1,      /* Unknown HTTP method */
    PARSE_ERROR_INVALID_URI = -2,         /* Malformed URI */
    PARSE_ERROR_INVALID_VERSION = -3,     /* Unsupported HTTP version */
    PARSE_ERROR_MALFORMED = -4,           /* General syntax error */
    PARSE_ERROR_BUFFER_OVERFLOW = -5      /* Request too large */
} parse_result_t;


/**
 * @struct req_header_s
 * @brief HTTP request header structure
 * 
 * Contains parsed HTTP request information including:
 * - Protocol version
 * - URI and hostname
 * - Content type
 * - Request method
 * - Status codes
 * - Connection state
 */
typedef struct req_header_s
{
    httpType_t http_version;           /* Protocol version enum */
    char *http_version_str;            /* Protocol version string */

    char *uri_str;                     /* Request URI */
    char *hostname_str;                /* Host header value */
    char *hostname_port_str;

    contentType_t content_type;        /* Response content type enum */
    char *content_type_str;            /* Content type string */

    method_t method;                   /* Request method enum */
    char *method_str;                  /* Method string */

    statusCode_t *status_code;         /* Response status enum */
    char *status_code_str;             /* Status string */

    int connection_keep_alive;         /* Keep-alive flag */
    int connection_close;              /* Connection: close flag */

    int parser_error;                  /* Parser error code */
    int current_state;

    int open_file_fd;

    int max_age;

    char *extra_header; // free this
} HttpHeader_t;




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
    int client_sock_fd;
    struct sockaddr_storage client_info; // Client address information
    struct addrinfo *server_info;        // Client address information
    int addr_len;                        // Length of address structure
    int recvBytes;                       // Bytes received in last operation
    int sentBytes;                       // Bytes sent in last operation
    int timeout;
    int port;
    pthread_mutex_t lock;
} sockdetails_t;


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