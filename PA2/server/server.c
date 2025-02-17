
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
#if USE_FORK == 1
        // use_fork(&sd);
#else
        // dispatch(tp, handle_req, &sd);
#endif
    handle_req(&sd);
    }

    freeaddrinfo(sd.server_info); // we do not need this anymore

    return 0;
}