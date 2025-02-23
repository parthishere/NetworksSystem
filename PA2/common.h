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


#define USE_SENDFILE 0
#define ROOT_DIR "./www"

#define MAX_SIZE (1024 * 30)   // 30KB
#define RECIEVE_SIZE MAX_SIZE  // 30KB receive buffer
#define TRANSMIT_SIZE MAX_SIZE // 30KB transmit buffer

#define NUM_THREADS (4)
#define NUM_CPUS (1)

#define USE_FORK 0

#define TOTAL_THREADS 100
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



// /**
//  * Handle network operation errors
//  *
//  * Processes and reports network errors, distinguishing between timeouts
//  * and other error conditions. For timeouts, displays message; for other errors,
//  * notifies client of operation failure.
//  *
//  * @param sd   Pointer to socket details structure
//  * @param msg  Error message to be displayed
//  *
//  * Error Handling:
//  * - Timeout (EAGAIN/EWOULDBLOCK): Display timeout message
//  * - Other errors: Send error notification to client
//  */
// void error(sockdetails_t *sd, char *msg)
// {
//     printf(RED "[-] Error somewhere ! Check below message to see details \n");

//     perror(msg); // Print system error message

//     if (errno == EAGAIN || errno == EWOULDBLOCK)
//     {
//         /* Handle timeout conditions */
//         printf(RED "[-] Timeout\n" RESET);
//     }
//     else
//     {
//         /* Notify client of error condition */
//         sendto(sd->sockfd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0, (struct sockaddr *)&sd->their_addr, sd->addr_len);
//         // close(sd->sockfd);
//         // exit(EXIT_FAILURE);
//     }
// }
#endif