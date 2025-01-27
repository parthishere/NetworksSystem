#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

#define PORT "3490"
#define FIND_ADDRESSES 0


int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf(" You messed up, command is showip <DESTINATION_HOSTNAME>\n");
        exit(EXIT_FAILURE);
    }
    // char ipstr[INET6_ADDRSTRLEN];

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


    struct sockaddr {
        sa_family_t sa_family; // Address family (e.g., AF_INET, AF_INET6)
        char        sa_data[14]; // Protocol-specific address information
    };

    struct sockaddr_in {
        sa_family_t    sin_family; // Address family (AF_INET for IPv4)
        in_port_t      sin_port;   // Port number (16-bit)
        struct in_addr sin_addr;   // IPv4 address (32-bit)
        char           sin_zero[8]; // Padding to make the structure the same size as sockaddr
    };


    */
    struct addrinfo hints, *res, *temp;
    int status;
    char ipstr[INET6_ADDRSTRLEN]; // 46

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE; // fill in my IP for me // otherwise if you wanna listen to specific IP fill that instead

    /*
    // Given  node  and service, which identify an Internet host and a service, service could be like "http" or "port number" from /etc/services
    int getaddrinfo(const char *restrict node,
                       const char *restrict service,
                       const struct addrinfo *restrict hints,
                       struct addrinfo **restrict res);
    */
#if FIND_ADDRESSES == 1
    if ((status = getaddrinfo(argv[1], NULL, &hints, &res)) < 0)
    {
#elif FIND_ADDRESSES == 0
    if ((status = getaddrinfo(NULL, PORT, &hints, &res)) < 0)
    {
#endif
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status));
        exit(EXIT_FAILURE);
    }
    printf("[+] getaddrinfo successfull\n");

    for (temp = res; temp != NULL; temp = temp->ai_next)
    {

        void *addr;
        char *type;

        if (temp->ai_family == AF_INET) // for ipv4
        {
            struct sockaddr_in *ipv4 = (struct sockaddr_in *)temp->ai_addr;
            addr = &(ipv4->sin_addr);
            type = "IPv4";
        }
        else
        {
            struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)temp->ai_addr;
            addr = &(ipv6->sin6_addr);
            type = "IPv6";
        }

        inet_ntop(temp->ai_family, addr, ipstr, sizeof ipstr);
        printf("%s: %s\n", type, ipstr);
    }

    int sockfd = socket(res->ai_family, res->ai_socktype, res->ai_protocol);

    /*
    Old way of doing things 

    my_addr.sin_family = AF_INET;
    my_addr.sin_port = htons(PORT);
    my_addr.sin_addr.s_addr = inet_addr("10.12.110.57");
    memset(my_addr.sin_zero, '\0', sizeof my_addr.sin_zero);
    */

    if((status = bind(sockfd, res->ai_addr, res->ai_addrlen)) < 0){
        fprintf(stderr, "bind: %s\n", gai_strerror(status));
        exit(EXIT_FAILURE);
    }
    printf("[+] Bind sucsessfull \n");

    // int yes = 1;
    // if(setsockopt(listerner, SOL_SOCKET, SO_REUSERADDR, &yes, sizeof yes) == -1){
    //     perror("setsockopt");
    //     exit(EXIT_FAILURE);
    // }

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;

    // if((status = connect(sockfd, ))) // if you wanna create client that connects to some website 
    // listen() // for server 
    // accept() // for server



    

    return EXIT_SUCCESS;
}