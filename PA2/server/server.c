
#include "../common.h"
#include "src/queue.h"


void *server_thread_serve(void *args)
{
    int sockfd = *(int *)args;
    while (1)
    {
    }
    return NULL;
}

void init_threads()
{
    cpu_set_t allcpuset;
    cpu_set_t threadcpu; // indivudual thread cpu affinity
    int coreid;
    int rc;

    printf("This system has %d processors configured and %d processors available.\n", get_nprocs_conf(), get_nprocs());
    CPU_ZERO(&allcpuset);

    for (int i = 0; i < NUM_THREADS; i++)
    {
        coreid = i % get_nprocs();
        printf("Setting thread %d to core %d\n", i, coreid);
        CPU_SET(coreid, &threadcpu);
        rc = pthread_attr_init(&rt_sched_attr[i]);
        rc = pthread_attr_setaffinity_np(&rt_sched_attr[i], sizeof(cpu_set_t), &threadcpu);

        threadParams[i].threadIdx = i;

        pthread_create(&threads[i],               // pointer to thread descriptor
                       (void *)0,                 // use default attributes
                       server_thread_serve,             // thread function entry point
                       (void *)&(threadParams[i]) // parameters to pass in
        );
    }
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
    if (atoi(server_port) != 8888)
    {
        fprintf(stderr, RED "[-] Port Value != 8888 ! keep port value equal to 8888 \n" RESET);
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

    if (listen(sockfd, 5) < 0)
    {
        perror("listen");
        exit(1);
    }
}

void * handle_req(void *args){
    
    printf("withing handle req\n");
    sleep(10);
    printf("Fininshed handle req\n");
    return NULL;
}

int main(int argc, char *argv[])
{

    if (argc != 2)
    {
        printf(RED "[-] You messed up, command is ./server <PORT> | current command (%d) %s %s\n" RESET, argc, argv[0], argv[1]);
        exit(EXIT_FAILURE);
    }

    sockdetails_t sd;
    sd.addr_len = sizeof(sd.client_info);

    int numbytes;
    char buf[TRANSMIT_SIZE];

    init_server_side_socket(&sd, argv);

    threadpool tp = create_threadpool(1);
    if(tp == NULL) exit(1);

    while (1)
    {
        if ((sd.client_sock_fd = accept(sd.sockfd, (struct sockaddr *)&sd.client_info, &sd.addr_len)) < 0)
        {
            perror("accept");
            exit(1);
        }
        dispatch(tp, handle_req, NULL);
        //fork implementation
        // if (fork() == 0)
        // {

        //     printf("in child fd");
        //     close(sd.sockfd);

        //     // we are in the child process now
        //     if ((numbytes = recv(sd.client_sock_fd, buf, sizeof(buf), 0)) < 0)
        //     {
        //         perror("read");
        //         exit(-1);
        //     }
        //     printf("%s", buf);
        //     bzero(buf, sizeof(buf));
        //     snprintf(buf, sizeof(buf), "parth is here\n");

        //     if ((numbytes = send(sd.client_sock_fd, buf, sizeof(buf), 0)) < 0)
        //     {
        //         perror("write");
        //         exit(-1);
        //     }
        //     close(sd.client_sock_fd);
        //     exit(0);
        // }
        // else
        // {

        //     close(sd.client_sock_fd);
        //     wait(NULL);
        // }
    }

    freeaddrinfo(sd.server_info); // we do not need this anymore

    return 0;
}