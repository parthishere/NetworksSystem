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
 * Required for implementing UDP socket communication
 */
#include <sys/types.h>  // Basic system data types
#include <sys/socket.h> // Socket definitions and functions
#include <netdb.h>      // Network database operations
#include <arpa/inet.h>  // Internet operations
#include <netinet/in.h> // Internet address family
#include <sys/stat.h>   // File status and information
#include <fcntl.h>      // File control options

#include <sys/wait.h>
#include <sched.h>
#include <time.h>
#include <pthread.h>
#include <sys/sysinfo.h>


#include <sys/sendfile.h>


#define USE_SENDFILE 1
#define ROOT_DIR "./www"

#define MAX_SIZE (1024 * 30)   // 30KB
#define RECIEVE_SIZE MAX_SIZE  // 30KB receive buffer
#define TRANSMIT_SIZE MAX_SIZE // 30KB transmit buffer

#define USE_FORK 0

#define TOTAL_THREADS 150
#define MAX_THREAD_IN_POOL 200

#define TIMEOUT_HTTP_SEC 2 // sec

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



typedef enum httpType_s
{
    HTTP1_0,
    HTTP1_1,
    ERROR_VERSION,
    supported_http_protocols
} httpType_t;

typedef enum statusCode_s
{
    OK,
    BAD_REQ,
    FORBIDDEN,
    NOT_FOUND,
    METHOD_NOT_ALLOWED,
    VERSION_NOT_SUPPORTED,
    total_status_codes,
} statusCode_t;

typedef enum method_s
{
    GET,
    POST,
    PUT,
    DELETE,
    PATCH,
    HEAD,
    total_req_methods,
} method_t;

typedef enum contentType_s
{
    TEXT_HTML,
    TEXT_CSS,
    TEXT_PLAIN,
    APPLICATION_JAVASCRIPT,
    IMAGE_PNG,
    IMAGE_GIF,
    IMAGE_JPG,
    IMAGE_X_ICON,
    total_content_types
} contentType_t;


typedef enum
{
    PARSE_OK = 0,
    PARSE_ERROR_INVALID_METHOD = -1,
    PARSE_ERROR_INVALID_URI = -2,
    PARSE_ERROR_INVALID_VERSION = -3,
    PARSE_ERROR_MALFORMED = -4,
    PARSE_ERROR_BUFFER_OVERFLOW = -5
} parse_result_t;



typedef struct req_header_s
{
    httpType_t http_version;
    char *http_version_str;

    char *uri_str;
    char *hostname_str;

    contentType_t content_type;
    char *content_type_str;

    method_t method;
    char *method_str;

    statusCode_t *status_code;
    char *status_code_str;

    int connection_keep_alive;
    int connection_close;

    int parser_error;
} HttpHeader_t;




/**
 * Socket Details Structure
 * Encapsulates connection state and socket information for a client
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
} sockdetails_t;



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