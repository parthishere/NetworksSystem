/**
 * @file handle_req.c
 * @brief HTTP Request Handler Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements the main HTTP request handling logic, managing:
 * - Connection timeouts using select()
 * - Request reading and parsing
 * - Response generation
 * - Connection persistence (keep-alive)
 * - Resource cleanup
 *
 * The handler supports both HTTP/1.0 and HTTP/1.1 connections with
 * configurable timeout periods and buffer sizes.
 */

#include "handle_req.h"

#define _send(sockfd, message, message_len, goto_where) ({           \
    int nbytes;                                                      \
    if ((nbytes = send(sockfd, message, message_len, 0)) <= 0)       \
    {                                                                \
        printf(RED "[-] Send failed, error no: %d \n" RESET, errno); \
        close(sockfd);                                               \
        goto goto_where;                                             \
    }                                                                \
    nbytes;                                                          \
})

#define _recv(sockfd, message, message_len, goto_where) ({                            \
    int nbytes;                                                                       \
    if ((nbytes = recv(sockfd, message, message_len, 0)) < 0)                        \
    {                                                                                 \
        printf(RED "[-] Recv failed, error no: %d \n" RESET, errno);                  \
        close(sockfd);                                                                \
        goto goto_where;                                                              \
    }                                                                                 \
    else if (nbytes == 0)                                                             \
    {                                                                                 \
        close(sockfd);                                                                \
        printf(RED "[-] Client Closed the Connection, error no: %d \n" RESET, errno); \
    }                                                                                 \
    nbytes;                                                                           \
})

void *get_in_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET)
    {
        return &(((struct sockaddr_in *)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6 *)sa)->sin6_addr);
}

typedef struct message_header_s
{
    uint8_t command;          // 0=put, 1=get
    uint8_t chunk_id;         // Which chunk (0-based)
    uint32_t filename_length; // length of filename
    uint32_t data_length;     // Length of following data
} message_header_t;

void put_command(sockDetails_t *sd, message_header_t *message_header)
{
    int numbytes = 0, total_bytes = 0, numbytes_w = 0;
    char recieved_buf[RECIEVE_SIZE];
    int status = 0;

    memset(recieved_buf, 0, sizeof(recieved_buf));
    numbytes = _recv(sd->client_sock_fd, recieved_buf, message_header->filename_length, done);
    printf("filename we are putting: %s (%d)\n", recieved_buf, message_header->chunk_id);

    char *filename;
    asprintf(&filename, "%s/%s_%d", sd->dirname, recieved_buf, message_header->chunk_id);
    FILE *fs = fopen(filename, "wb");
    if (fs == NULL)
    {
        printf("could not open file ! \n");
        status = -1;
        goto done;
    }

    while (total_bytes < message_header->data_length)
    {
        memset(recieved_buf, 0, sizeof(recieved_buf));
        numbytes = _recv(sd->client_sock_fd, recieved_buf, message_header->data_length, done);
        numbytes_w = fwrite(recieved_buf, numbytes, 1, fs);

        if (numbytes != numbytes_w * numbytes)
        {
            fprintf(stderr, "Num bytes read and write did not match \n");
            status = -1;
            break;
        }
        total_bytes += numbytes;
    }

    // ACK
    if (status >= 0)
        numbytes = _send(sd->client_sock_fd, ACK, 7, done);
    else
        numbytes = _send(sd->client_sock_fd, NACK, 8, done);

done:
    free(filename);
    fclose(fs);
}

void get_command(sockDetails_t *sd, message_header_t *message_header)
{
    int numbytes = 0, total_bytes = 0, numbytes_r = 0;
    char recieved_buf[RECIEVE_SIZE];
    char transmit_buf[TRANSMIT_SIZE];
    int status = 0;

    memset(recieved_buf, 0, sizeof(recieved_buf));
    numbytes = _recv(sd->client_sock_fd, recieved_buf, message_header->filename_length, done);
    printf("filename : %s\n", recieved_buf);

    char *filename;
    asprintf(&filename, "%s/%s_%d", sd->dirname, recieved_buf, message_header->chunk_id);
    FILE *fs = fopen(filename, "rb");
    if (fs == NULL)
    {
        printf("Reading failed \n");
        numbytes = _send(sd->client_sock_fd, NACK, 8, done);
        status = -1;
        goto done;
    }
    fseek(fs, 0, SEEK_END);
    int file_size = ftell(fs);
    fseek(fs, 0, SEEK_SET);

    printf("file size %d \n", file_size);
    // send ack
    numbytes = _send(sd->client_sock_fd, ACK, 7, done);

    message_header_t message_header_send = {
        .command = GET,
        .chunk_id = message_header->chunk_id,
        .filename_length = strlen(filename),
        .data_length = file_size,
    };

    numbytes = _send(sd->client_sock_fd, &message_header_send, sizeof(message_header_t), done);
    total_bytes = 0;
    while (total_bytes < file_size)
    {
        memset(transmit_buf, 0, sizeof(transmit_buf));
        numbytes = fread(transmit_buf, 1, file_size, fs);
        numbytes = _send(sd->client_sock_fd, transmit_buf, numbytes, done);
        printf("send bytes:%d\n", numbytes);

        total_bytes += numbytes;
    }

    memset(recieved_buf, 0, sizeof(recieved_buf));
    numbytes = _recv(sd->client_sock_fd, recieved_buf, RECIEVE_SIZE, done);
    if (strncmp(recieved_buf, ACK, 7) == 0)
    {
        printf("ACK recv so client is good\n");
    }
    else
    {
        printf("something went wrong\n");
    }

    _send(sd->client_sock_fd, ACK, 7, done);
    // else send(sd->client_sock_fd, NACK, 8, 0);

done:
    free(filename);
    fclose(fs);
}

void ls_command(sockDetails_t *sd, message_header_t *message_header)
{

    int numbytes = 0, total_bytes = 0, numbytes_r = 0;
    char recieved_buf[RECIEVE_SIZE];
    char transmit_buf[TRANSMIT_SIZE];
    int status = 0;

    DIR *dp;
    struct dirent *ep;
    dp = opendir(sd->dirname);

    if (dp != NULL)
    {
        int seq_num = 0; // Packet sequence counter
        while ((ep = readdir(dp)) != NULL)
        {
            if (ep->d_type != DT_REG)
                continue;
            int record_len = strlen(ep->d_name);

            bzero(transmit_buf, sizeof(transmit_buf));
            memcpy(transmit_buf, ep->d_name, record_len);

            message_header_t message_header_send = {
                .command = LS,
                .chunk_id = 0,
                .filename_length = record_len,
                .data_length = 0,
            };

            send(sd->client_sock_fd, &message_header_send, sizeof(message_header_send), 0);

            send(sd->client_sock_fd, transmit_buf, record_len, 0);
        }
        send(sd->client_sock_fd, ACK, 7, 0);
    }
    else
    {
        send(sd->client_sock_fd, NACK, 7, 0);
    }
}

void delete_command(sockDetails_t *sd, message_header_t *message_header)
{
    int numbytes = 0;
    char recieved_buf[RECIEVE_SIZE];

    memset(recieved_buf, 0, sizeof(recieved_buf));
    numbytes = _recv(sd->client_sock_fd, recieved_buf, message_header->filename_length, done);
    printf("filename : %s\n", recieved_buf);

    char *filename;
    asprintf(&filename, "%s/%s_%d", sd->dirname, recieved_buf, message_header->chunk_id);

    FILE *fs = fopen(filename, "wb");
    if (fs == NULL)
    {
        send(sd->client_sock_fd, NACK, 8, 0);
    }

    if (remove(filename) < 0)
    {
        send(sd->client_sock_fd, ACK, 7, 0);
    }
    else
    {
        send(sd->client_sock_fd, NACK, 8, 0);
    }

    free(filename);

done:;
    return;
}

/**
 * @function handle_req
 * @brief Main HTTP request handler function
 *
 * @param sd Socket details structure containing connection information
 * @return void* Always returns NULL
 *
 * This function implements the main request handling loop that:
 * 1. Monitors socket for incoming data using select()
 * 2. Implements timeout mechanism for idle connections
 * 3. Reads and processes HTTP requests
 * 4. Manages connection persistence based on HTTP headers
 * 5. Ensures proper resource cleanup
 *
 * Threading: This function is designed to be thread-safe and can be
 * called by multiple threads simultaneously with different connections.
 */
void *handle_req(sockDetails_t *sd)
{
    int numbytes;                     /* Number of bytes received */
    char recieved_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    fd_set readfds;                   /* File descriptor set for select() */
    int file_fd;

    while (1)
    {
        FD_ZERO(&readfds);
        FD_SET(sd->client_sock_fd, &readfds);

        /* Set timeout period for idle connections */
        struct timeval timeout = {TIMEOUT_SEC, 0};

        /* Monitor socket for incoming data */
        int select_status = select(sd->client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
        /* Handle select errors */
        if (select_status < 0)
        {
            fprintf(stderr, RED "[-] (%d) Select syscall failed with error: %d (%s)\n" RESET,
                    gettid(), errno, strerror(errno));
            goto cleanup;
        }

        /* Handle connection timeout */
        else if (select_status == 0)
        {
            printf(YEL "\n[-] (%d) CONNECTION TIMEOUT:\n"
                       "[-] Client connection idle for %d seconds\n"
                       "------------------------------------------------------------\n" RESET,
                   gettid(), TIMEOUT_SEC);
            goto cleanup;
        }

        /* Process incoming data when available */
        else if (FD_ISSET(sd->client_sock_fd, &readfds))
        {
            memset(recieved_buf, 0, sizeof(recieved_buf));
            /* Read incoming request with error checking */
            int total_bytes = 0;
            message_header_t message_header;

            _recv(sd->client_sock_fd, &message_header, sizeof(message_header_t), cleanup);

            printf("[+] Recieved bytes:%d | command %d, chunk: %d, filename length %d, data length %d \n", numbytes, message_header.command, message_header.chunk_id, message_header.filename_length, message_header.data_length);

            switch (message_header.command)
            {
            case PUT:
                put_command(sd, &message_header);
                break;
            case GET:
                get_command(sd, &message_header);
                break;
            case DELETE:
                delete_command(sd, &message_header);
                break;
            case LS:
                ls_command(sd, &message_header);
                break;
            }
        }
    }

cleanup:;
    /* Clean up resources before exit */
    // Only close the client socket, file_fd is already closed in the handler functions
    // or was never opened if we jumped to cleanup without accessing a file
    close(sd->client_sock_fd);

    return NULL;
}
