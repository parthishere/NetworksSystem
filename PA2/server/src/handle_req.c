#include "handle_req.h"

void *handle_req(sockdetails_t sd)
{
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE];
    HttpHeader_t header;

    fd_set readfds;

    while (1)
    {

        FD_ZERO(&readfds);
        FD_SET(sd.client_sock_fd, &readfds);
        struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};
        // aria2
        // hping3
        // nc
        // sendfile - 0 copy
        // sendmessage

        int select_status = select(sd.client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
        if (select_status < 0)
        {
            perror(RED "select error");
            break;
        }

        if (select_status == 0)
        {
            printf(YEL "[-] (%d) Connection timed out\n" RESET, gettid());
            break;
        }

        if (FD_ISSET(sd.client_sock_fd, &readfds))
        {
            if ((numbytes = recv(sd.client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
            {
                perror(RED "[-] read");
                return NULL;
            }

            memset(&header, 0, sizeof(HttpHeader_t));

            parse_request_line_thread_safe(recieved_buf, &header);
            
            build_and_send_header(&header, &sd);

            if (header.connection_close == 1 || header.connection_keep_alive == 0)
            {
                close(sd.client_sock_fd);
                return NULL;
            }
            memset(&header, 0, sizeof(header));
        }
    }

    close(sd.client_sock_fd);

    return NULL;
}