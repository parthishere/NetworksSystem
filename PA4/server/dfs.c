#include "common.h"
#include "handle_req.h"
#include "queue.h"
#include "setup.h"


static volatile sig_atomic_t shutdown_flag = 0;
static pthread_mutex_t shutdown_mutex = PTHREAD_MUTEX_INITIALIZER;


void sig_handler(int num) {
    char *data = "\n\nCleaning up resources...\n";
    write(STDOUT_FILENO, data, strlen(data));
    shutdown_flag = 1;
    (void)num;
}

int main(int argc, char *argv[])
{
    struct sigaction sa;
    memset(&sa, 0, sizeof(sa));
    sigemptyset(&sa.sa_mask);    // Clear signal mask
    sa.sa_flags = 0;   
    sa.sa_handler = sig_handler;
    
    // sigaction(SIGINT, &sa, NULL);
    signal(SIGPIPE, SIG_IGN);

   
    if (argc != 3)
    {
        printf(RED "[-] You messed up, command is ./dfs <DFS_DIR> <PORT> | (passed numer of args: %d) \n" RESET, argc);
        exit(EXIT_FAILURE);   
    }

    sockDetails_t sd;
    pthread_mutex_init(&sd.lock, NULL);
    sd.dirname = argv[1];
    
    int status = mkdir(argv[1], 0777); 
    if (status == 0) {
        printf(GRN"[+] Directory '%s' created successfully.\n"RESET, argv[1]);
    } else if (errno == EEXIST) {
        printf(GRN"[+] Directory '%s' already exists.\n"RESET, argv[1]);
    } else {
        perror(RED"[-] Error creating directory");
        exit(EXIT_FAILURE);
    }
    
    sd.addr_len = sizeof(sd.client_info);


    init_socket(&sd, argv[2]);

#if USE_FORK == 0
    threadpool tp = create_threadpool(TOTAL_THREADS);
    if (tp == NULL)
        goto cleanup;
#else
    printf(RED"[-] Only supports Threadpool !!!\n"RESET);
    exit(EXIT_FAILURE);
#endif


    while (!shutdown_flag)
    {
        if ((sd.client_sock_fd = accept(sd.sockfd, (struct sockaddr *)&sd.client_info, (socklen_t *)&sd.addr_len)) < 0 && errno != EINTR)
        {
            perror(RED"accept"RESET);
            goto cleanup;
        }

        dispatch(tp, handle_req, &sd);


        pthread_mutex_lock(&shutdown_mutex);
        if(shutdown_flag){
            break;
        }
        pthread_mutex_unlock(&shutdown_mutex);

    }

cleanup:;

    close(sd.sockfd);

    destroy_threadpool(tp);


    return 0;
}

