#include "common.h"
#include "handle_req.h"
#include "queue.h"
#include "setup.h"

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
    
    // sigaction(SIGINT, &sa, NULL);
    signal(SIGPIPE, SIG_IGN);

    sockdetails_t sd;
    pthread_mutex_init(&sd.lock, NULL);
    
    printf("Argv[1] %s\n", argv[1]);
    // int status = mkdir(argv[1], 0777); 
    // if (status == 0) {
    //     printf(GRN"[+] Directory '%s' created successfully.\n"RESET, argv[1]);
    // } else if (errno == EEXIST) {
    //     printf(GRN"[+] Directory '%s' already exists.\n"RESET, argv[1]);
    // } else {
    //     perror(RED"[-] Error creating directory");
    //     exit(EXIT_FAILURE);
    // }

    if (argc != 3)
    {
        
        printf(RED "[-] You messed up, command is ./dfs <DFS_DIR> <PORT> | (passed numer of args: %d) \n" RESET, argc);
        exit(EXIT_FAILURE);
        
        
    }
    
    
    
    printf(GRN"[+] Cache Timeout is set to %d sec\n"RESET,sd.timeout);
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
        if ((sd.client_sock_fd = accept(sd.sockfd, (struct sockaddr *)&sd.client_info, &sd.addr_len)) < 0 && errno != EINTR)
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

