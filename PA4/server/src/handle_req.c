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
#include <ctype.h>

#define _send(sockfd, message, message_len, goto_where) ({                            \
    int nbytes;                                                                       \
    if ((nbytes = send(sockfd, message, message_len, 0)) < 0)                         \
    {                                                                                 \
        printf(RED "[-] Send failed, error no: %d \n" RESET, errno);                  \
        close(sockfd);                                                                \
        goto goto_where;                                                              \
    }                                                                                 \
    else if (nbytes == 0)                                                             \
    {                                                                                 \
        close(sockfd);                                                                \
        printf(YEL "[-] Client Closed the Connection, error no: %d \n" RESET, errno); \
        goto goto_where;                                                              \
    }                                                                                 \
    nbytes;                                                                           \
})

#define _recv(sockfd, message, message_len, goto_where) ({                            \
    int nbytes;                                                                       \
    if ((nbytes = recv(sockfd, message, message_len, 0)) < 0)                         \
    {                                                                                 \
        printf(RED "[-] Recv failed, error no: %d \n" RESET, errno);                  \
        close(sockfd);                                                                \
        goto goto_where;                                                              \
    }                                                                                 \
    else if (nbytes == 0)                                                             \
    {                                                                                 \
        close(sockfd);                                                                \
        printf(YEL "[-] Client Closed the Connection, error no: %d \n" RESET, errno); \
        goto goto_where;                                                              \
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

#pragma pack(push, 1)
typedef struct message_header_s
{
    uint8_t command;          // 0=put, 1=get
    uint8_t chunk_id;         // Which chunk (0-based)
    uint32_t filename_length; // length of filename
    uint32_t data_length;     // Length of following data
} message_header_t;
#pragma pack(pop)

void put_command(sockDetails_t *sd, message_header_t *message_header)
{
    int numbytes = 0, total_bytes = 0, numbytes_w = 0;
    char recieved_buf[RECIEVE_SIZE];
    int status = 0;
    char *filename;

    memset(recieved_buf, 0, sizeof(recieved_buf));
    if(message_header->filename_length > RECIEVE_SIZE) {
        printf("Too large filename size \n");
        goto done;
    }
    numbytes = _recv(sd->client_sock_fd, recieved_buf, message_header->filename_length, done);

    if (asprintf(&filename, "%s/%s_%d", sd->dirname, recieved_buf, message_header->chunk_id) < 0)
        goto done;

    FILE *fs = fopen(filename, "wb");
    if (fs == NULL)
    {
        fprintf(stderr, RED "\n[-] Error opening file: %s\n" RESET, filename);
        fprintf(stderr, RED "    Error: %s (code: %d)\n\n" RESET, strerror(errno), errno);
        status = -1;
        goto done;
    }
    numbytes = _send(sd->client_sock_fd, ACK, ACK_LEN, done);

    while (total_bytes < (int)message_header->data_length)
    {
        memset(recieved_buf, 0, sizeof(recieved_buf));
        numbytes = _recv(sd->client_sock_fd, recieved_buf, sizeof(recieved_buf), done);
        numbytes_w = fwrite(recieved_buf, numbytes, 1, fs);

        if (numbytes != numbytes_w * numbytes)
        {
            fprintf(stderr, RED "[-] Num bytes read and write did not match \n" RESET);
            status = -1;
            break;
        }
        total_bytes += numbytes;
    }

    // ACK
    if (status >= 0)
    {
        numbytes = _send(sd->client_sock_fd, ACK, ACK_LEN, done);
        printf(GRN "\n=========================================\n" RESET);
        printf(GRN "    PUT SUCCESSFUL\n" RESET);
        printf(GRN "    FILE: %s\n" RESET, filename);
        printf(GRN "    CHUNK: %d stored !\n" RESET, message_header->chunk_id);
        printf(GRN "=========================================\n\n" RESET);
    }
    else
    {

        numbytes = _send(sd->client_sock_fd, NACK, NACK_LEN, done);
        printf(RED "\n=========================================\n" RESET);
        printf(RED "    PUT FAILED\n" RESET);
        printf(RED "    FILE: %s\n" RESET, filename);
        printf(RED "    CHUNK: %d stored !\n" RESET, message_header->chunk_id);
        printf(RED "=========================================\n\n" RESET);
    }

done:
    free(filename);
    fclose(fs);
}

void get_command(sockDetails_t *sd, message_header_t *message_header)
{
    int numbytes = 0;
    char recieved_buf[RECIEVE_SIZE];
    char transmit_buf[TRANSMIT_SIZE];
    char *filename;

    memset(recieved_buf, 0, sizeof(recieved_buf));
    if(message_header->filename_length > RECIEVE_SIZE) {
        printf(RED"[-] Too large filename size \n"RESET);
        goto done;
    }
    numbytes = _recv(sd->client_sock_fd, recieved_buf, message_header->filename_length, done);
    
    asprintf(&filename, "%s/%s_%d", sd->dirname, recieved_buf, message_header->chunk_id);

    FILE *fs = fopen(filename, "rb");
    if (fs == NULL)
    {
        printf(RED"[-] Reading failed \n"RESET);
        numbytes = _send(sd->client_sock_fd, NACK, NACK_LEN, done);
        free(filename);
        return;
    }

    fseek(fs, 0, SEEK_END);
    int file_size = ftell(fs);
    fseek(fs, 0, SEEK_SET);

    // send ack
    numbytes = _send(sd->client_sock_fd, ACK, ACK_LEN, done);

    numbytes = _recv(sd->client_sock_fd, recieved_buf, sizeof(recieved_buf), done);

    message_header_t message_header_send = {
        .command = GET,
        .chunk_id = message_header->chunk_id,
        .filename_length = strlen(filename),
        .data_length = file_size,
    };

    numbytes = _send(sd->client_sock_fd, &message_header_send, sizeof(message_header_send), done);

    // unsigned char *bytes = (unsigned char *)&message_header_send;
    // for (long unsigned int i = 0; i < sizeof(message_header_t); i++)
    // {
    //     printf("%02x ", bytes[i]);
    // }
    // printf("\n");

    while ((numbytes = fread(transmit_buf, 1, sizeof(transmit_buf), fs)) > 0)
    {
        numbytes = _send(sd->client_sock_fd, transmit_buf, numbytes, done);
        printf("send bytes:%d\n", numbytes);

        memset(transmit_buf, 0, sizeof(transmit_buf));
    }

    memset(recieved_buf, 0, sizeof(recieved_buf));
    numbytes = _recv(sd->client_sock_fd, recieved_buf, RECIEVE_SIZE, done);
    if (strncmp(recieved_buf, ACK, ACK_LEN) == 0)
    {
        printf(GRN "\n=========================================\n" RESET);
        printf(GRN "    GET FILE SUCCESSFUL\n" RESET);
        printf(GRN "    FILE: %s\n" RESET, filename);
        printf(GRN "    CHUNK: %d sent !\n" RESET, message_header->chunk_id);
        printf(GRN "=========================================\n\n" RESET);
    }
    else
    {
        printf(RED "\n=========================================\n" RESET);
        printf(RED "    GET FAILED\n" RESET);
        printf(RED "    FILE: %s\n" RESET, filename);
        printf(RED "    CHUNK: %d stored !\n" RESET, message_header->chunk_id);
        printf(RED "=========================================\n\n" RESET);
    }
    numbytes = _send(sd->client_sock_fd, ACK, ACK_LEN, done);

done:
    // free(filename);
    if(fs)
        fclose(fs);
}

void ls_command(sockDetails_t *sd, message_header_t *message_header)
{
    printf(CYN "\n=========================================\n" RESET);
    printf(CYN "    PROCESSING LIST COMMAND\n" RESET);
    printf(CYN "    Server directory: %s\n" RESET, sd->dirname);
    printf(CYN "=========================================\n\n" RESET);


    // Recursive function to list directories
    list_directory(sd, sd->dirname);

    (void)message_header;

    // Send end-of-listing marker
    send(sd->client_sock_fd, ACK, ACK_LEN, 0);

    printf(GRN "\n[+] Directory listing completed successfully\n\n" RESET);
}

/**
 * Recursively lists all files in a directory and its subdirectories
 * @param sd Socket details
 * @param base_path The base server directory path
 * @param rel_path The relative path from the base
 */
void list_directory(sockDetails_t *sd, const char *base_path)
{
    DIR *dp;
    struct dirent *entry;
    struct stat statbuf;

    printf(CYN "[*] Scanning directory: %s\n" RESET, base_path);

    dp = opendir(base_path);
    if (dp == NULL)
    {
        fprintf(stderr, RED "[-] Failed to open directory: %s\n" RESET, base_path);
        fprintf(stderr, RED "    Error: %s (code: %d)\n\n" RESET, strerror(errno), errno);
        return;
    }

    while ((entry = readdir(dp)) != NULL)
    {
        // Skip "." and ".." entries
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
        {
            continue;
        }

        // Construct path for this entry
        char entry_path[PATH_MAX];
        snprintf(entry_path, sizeof(entry_path), "%s/%s", base_path, entry->d_name);

        // Get file status
        if (stat(entry_path, &statbuf) < 0)
        {
            fprintf(stderr, RED "[-] Failed to get file status: %s\n" RESET, entry_path);
            continue;
        }

        if (S_ISREG(statbuf.st_mode))
        {
            // Regular file - check if it's a chunk file (has underscore and number at the end)
            char *last_underscore = strrchr(entry->d_name, '_');
            if (last_underscore != NULL && isdigit(*(last_underscore + 1)))
            {
                // This is a chunk file
                char file_path[PATH_MAX];

                // Only include the path part for the client
                snprintf(file_path, sizeof(file_path), "%s", entry->d_name);

                // Extract chunk ID from filename
                int chunk_id = atoi(last_underscore + 1);

                printf(GRN "[+] Found chunk file: %s (Chunk ID: %d)\n" RESET, file_path, chunk_id);

                // Send file information to client
                message_header_t message_header_send = {
                    .command = LS,
                    .chunk_id = chunk_id,
                    .filename_length = strlen(file_path),
                    .data_length = 0,
                };

                send(sd->client_sock_fd, &message_header_send, sizeof(message_header_send), 0);
                send(sd->client_sock_fd, file_path, message_header_send.filename_length, 0);
            }
        }
    }

    closedir(dp);
}

void delete_command(sockDetails_t *sd, message_header_t *message_header)
{

    char recieved_buf[RECIEVE_SIZE];

    memset(recieved_buf, 0, sizeof(recieved_buf));
    if(message_header->filename_length > RECIEVE_SIZE) {
        printf("Too large filename size \n");
        goto done;
    }
    _recv(sd->client_sock_fd, recieved_buf, message_header->filename_length, done);
    

    char *filename;
    asprintf(&filename, "%s/%s_%d", sd->dirname, recieved_buf, message_header->chunk_id);

    FILE *fs = fopen(filename, "wb");
    if (fs == NULL)
    {
        send(sd->client_sock_fd, NACK, NACK_LEN, 0);
    }

    if (remove(filename) >= 0)
    {
        printf(GRN "\n=========================================\n" RESET);
        printf(GRN "    DELETE FILE SUCCESSFUL\n" RESET);
        printf(GRN "    FILE: %s\n" RESET, filename);
        printf(GRN "    CHUNK: %d deleted !\n" RESET, message_header->chunk_id);
        printf(GRN "=========================================\n\n" RESET);
        send(sd->client_sock_fd, ACK, ACK_LEN, 0);
    }
    else
    {
        printf(RED "\n=========================================\n" RESET);
        printf(RED "    DELETE FAILED\n" RESET);
        printf(RED "    FILE: %s\n" RESET, filename);
        printf(RED "    CHUNK: %d deleted !\n" RESET, message_header->chunk_id);
        printf(RED "=========================================\n\n" RESET);
        send(sd->client_sock_fd, NACK, NACK_LEN, 0);
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
    char recieved_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    fd_set readfds;                   /* File descriptor set for select() */

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
            printf(YEL "\n[!] (%d) CONNECTION TIMEOUT:\n"
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
            message_header_t message_header;
            memset(&message_header, 0, sizeof(message_header_t));

            _recv(sd->client_sock_fd, &message_header, sizeof(message_header_t), cleanup);

            printf(MAG "\n=========================================\n" RESET);
            printf(MAG "    OPERATION: %s\n" RESET,
                   message_header.command == PUT ? "PUT" : message_header.command == GET       ? "GET"
                                                       : message_header.command == LS          ? "LIST"
                                                       : message_header.command == DELETE      ? "DELETE"
                                                       : message_header.command == SERVER_INFO ? "SERVER INFO"
                                                                                               : "UNKNOWN");
            printf(MAG "    CHUNK NUMBER: %d \n" RESET, message_header.chunk_id);
            printf(MAG "    FILENAME LENGTH: %d \n" RESET, message_header.filename_length);
            printf(MAG "    DATA LENGTH: %d \n" RESET, message_header.data_length);
            printf(MAG "=========================================\n" RESET);

            _send(sd->client_sock_fd, ACK, ACK_LEN, cleanup);
            
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
