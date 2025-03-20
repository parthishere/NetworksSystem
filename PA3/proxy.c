
#include "common.h"
#include "includes/queue.h"
#include "includes/handle_req.h"
#include "includes/setup.h"
#include "includes/fork.h"

static volatile sig_atomic_t shutdown_flag = 0;
static pthread_mutex_t shutdown_mutex = PTHREAD_MUTEX_INITIALIZER;


void sig_handler(int num) {
    char *data = "\n\nCleaning up resources...\n";
    write(STDOUT_FILENO, data, strlen(data));
    shutdown_flag = 1;
}

int main(int argc, char *argv[])
{
    struct sigaction sa;
    memset(&sa, 0, sizeof(sa));
    sigemptyset(&sa.sa_mask);    // Clear signal mask
    sa.sa_flags = 0;   
    sa.sa_handler = sig_handler;
    
    sigaction(SIGINT, &sa, NULL);
    signal(SIGPIPE, SIG_IGN);


    if (argc != 2)
    {
        printf(RED "[-] You messed up, command is ./server <PORT> | current command (%d) %s %s\n" RESET, argc, argv[0], argv[1]);
        exit(EXIT_FAILURE);
    }

    sockdetails_t sd;
    sd.addr_len = sizeof(sd.client_info);

    init_server_side_socket(&sd, argv);

#if USE_FORK == 0
    threadpool tp = create_threadpool(TOTAL_THREADS);
    if (tp == NULL)
        goto cleanup;
#endif

    while (!shutdown_flag)
    {
        if ((sd.client_sock_fd = accept(sd.sockfd, (struct sockaddr *)&sd.client_info, &sd.addr_len)) < 0 && errno != EINTR)
        {
            perror(RED"accept"RESET);
            goto cleanup;
        }
#if USE_FORK == 1
        use_fork(&sd);
#else
        dispatch(tp, handle_req, sd);
#endif

        pthread_mutex_lock(&shutdown_mutex);
        if(shutdown_flag){
            break;
        }
        pthread_mutex_unlock(&shutdown_mutex);

    }

cleanup:;

    close(sd.client_sock_fd);
    close(sd.sockfd);
#if USE_FORK == 0
    destroy_threadpool(tp);
#else
    cleanup_zombie_processes();
#endif

    return 0;
}
