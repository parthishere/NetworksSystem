/**
 * @file setup.c
 * @brief Network Socket Setup Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements socket initialization and configuration functions for
 * a network server. It handles both IPv4 and IPv6 address families and
 * provides TCP stream socket setup with proper error handling.
 */

#include "includes/setup.h"


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
        send(sd->client_sock_fd, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA), 0);
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
    if ((sd->sentBytes = send(sd->client_sock_fd, packet, size, 0)) < 0)
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
    if ((sd->recvBytes = recv(sd->client_sock_fd, packet, size, 0)) < 0)
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
 * @function getin_addr
 * @brief Extracts the IP address structure from a sockaddr structure
 *
 * @param sa Pointer to generic socket address structure
 * @return void* Pointer to the IP address structure (IPv4 or IPv6)
 *
 * This function handles both IPv4 and IPv6 addresses by:
 * 1. Checking the address family
 * 2. Performing appropriate structure casting
 * 3. Returning pointer to the correct address field
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
 * @function init_server_side_socket
 * @brief Initializes and configures a server-side TCP socket
 *
 * @param sd Pointer to socket details structure
 * @param argv Command line arguments array containing port number
 *
 * This function performs complete server socket setup:
 * 1. Configures address parameters
 * 2. Creates and binds socket
 * 3. Sets socket options
 * 4. Prepares for listening
 *
 * @note Port number must be > 1024 (non-privileged ports)
 * @note Supports both IPv4 and IPv6
 */
void init_socket(sockdetails_t *sd, char *port)
{
    struct addrinfo hints, *temp;
    char ip[INET6_ADDRSTRLEN];

    int status;
    int sockfd;

    /* Configure address hints structure */
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM; // for TCP
    hints.ai_flags = AI_PASSIVE;     // fill up my IP

    char *server_port = port;
    // printf("Passed Server Port %s\n", server_port);
    if (atoi(server_port) <= 1024)
    {
        fprintf(stderr, RED "[-] Port Value < 1024 ! keep port value higher than 1024 \n" RESET);
        exit(EXIT_FAILURE);
    }

    /* Validate and set port number */

    /* Get address information */
    if ((status = getaddrinfo(NULL, server_port, &hints, &sd->server_info)) < 0)
    {
        fprintf(stderr, RED "getaddrinfo: %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
        exit(EXIT_FAILURE);                                                   // exit if there is an error
    }
    printf(GRN "[+] getaddrinfo call successful\n" RESET);

    /* Create and configure socket */
    for (temp = sd->server_info; temp != NULL; temp = temp->ai_next)
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

        int yes = 1;
        /* Set socket options */
        if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1)
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
    sd->sockfd = sockfd;

    /* Display server information */
    inet_ntop(temp->ai_family, getin_addr(temp->ai_addr), ip, sizeof ip);
    printf(GRN "[+] Server recieving TCP/HTTP1.0 packet to : %s\n" RESET, ip);

    freeaddrinfo(temp);

    if (listen(sockfd, TOTAL_THREADS * 2) < 0)
    {
        perror("listen");
        exit(1);
    }
}