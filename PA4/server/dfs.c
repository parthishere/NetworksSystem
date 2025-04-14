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
    if (argc != 3)
    {
        printf(RED "[-] You messed up, command is ./server <WORKING_DIR> <PORT> | current command ARGS: (%d)\n" RESET, argc);
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

