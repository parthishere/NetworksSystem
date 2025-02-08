
#include "../common.h"
#include "src/queue.h"
#include "src/fork.h"
#include "src/handle_req.h"
#include "src/setup.h"





int main(int argc, char *argv[])
{

    if (argc != 2)
    {
        printf(RED "[-] You messed up, command is ./server <PORT> | current command (%d) %s %s\n" RESET, argc, argv[0], argv[1]);
        exit(EXIT_FAILURE);
    }

    sockdetails_t sd;
    sd.addr_len = sizeof(sd.client_info);

    init_server_side_socket(&sd, argv);

#if USE_FORK == 0
    threadpool tp = create_threadpool(10);
    if (tp == NULL)
        exit(1);
#endif

    while (1)
    {
        if ((sd.client_sock_fd = accept(sd.sockfd, (struct sockaddr *)&sd.client_info, &sd.addr_len)) < 0)
        {
            perror("accept");
            exit(1);
        }

#if USE_FORK == 1
        use_fork(&sd);
#else
        dispatch(tp, handle_req, &sd);
#endif
    }

    freeaddrinfo(sd.server_info); // we do not need this anymore

    return 0;
}