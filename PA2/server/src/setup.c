#include "setup.h"

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

void init_server_side_socket(sockdetails_t *sd, char *argv[])
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

    /* Validate and set port number */
    char *server_port = argv[1];
    printf("Passed Server Port %s\n", server_port);
    if (atoi(server_port) <= 4000)
    {
        fprintf(stderr, RED "[-] Port Value < 4000 ! keep port value higher than that \n" RESET);
        exit(EXIT_FAILURE);
    }

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
    
    if (listen(sockfd, TOTAL_THREADS*2) < 0)
    {
        perror("listen");
        exit(1);
    }
}