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

typedef struct message_header_s
{
    uint8_t command;          // 0=put, 1=get
    uint8_t chunk_id;         // Which chunk (0-based)
    uint32_t filename_length; // length of filename
    uint32_t data_length;     // Length of following data
} message_header_t;

uint32_t str2md5(char *str, int length)
{
    printf("filename %s, len %d\n", str, length);

    EVP_MD_CTX *context = EVP_MD_CTX_new();
    const EVP_MD *md = EVP_md5();
    EVP_DigestInit_ex(context, md, NULL);
    int md_len;
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
    uint32_t hash = 0;
    for (int n = 0; n < md_len; ++n)
    {
        hash += digest[n];
    }

    return hash;
}

void *get_in_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET)
    {
        return &(((struct sockaddr_in *)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6 *)sa)->sin6_addr);
}

void cleanup_connection(sockDetails_t *sd)
{
    serverDetails_t *current = sd->servers_details;
    int i = 0;
    while (current)
    {
        if (current->client_sock_fd > 0)
        {
            close(current->client_sock_fd);
            current->client_sock_fd = -1;
            sd->server_sock_fds[i] = -1;
        }
        sd->number_of_available_servers = 0;
        i++;
        current = current->next;
    }
}

void connect_and_put_chunks(sockDetails_t *sd, char *chunks[], int chunk_sizes[], int hash)
{
    serverDetails_t *current = sd->servers_details;
    int i = 0;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    int chunks_stored[sd->number_of_servers];                          // NUMBER_OF_PAIRS
    memset(chunks_stored, 0, sd->number_of_servers * 4);
    while (current)
    {

        struct addrinfo hints, *temp;
        char ip[INET6_ADDRSTRLEN];

        int status;
        sd->server_sock_fds[i] = -1;
        current->client_sock_fd = -1;

        /* Configure address hints structure */
        memset(&hints, 0, sizeof(hints));
        hints.ai_family = AF_UNSPEC;
        hints.ai_socktype = SOCK_STREAM; // for TCP

        if (atoi(current->server_port) <= 1024)
        {
            fprintf(stderr, RED "[-] Port Value < 1024 ! keep port value higher than 1024 \n" RESET);
            exit(EXIT_FAILURE);
        }

        if ((status = getaddrinfo(current->server_ip, current->server_port, &hints, &sd->connect_to_info)) < 0)
        {
            fprintf(stderr, RED "getaddrinfo: %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
            goto next;                                                            // exit if there is an error
        }

        for (temp = sd->connect_to_info; temp != NULL; temp = temp->ai_next)
        {
            if ((current->client_sock_fd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
            {
                perror(RED "server: socket");
                goto next;
            }

            if ((connect(current->client_sock_fd, temp->ai_addr, temp->ai_addrlen)) < 0)
            {
                fprintf(stderr, RED "\n[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
                close(current->client_sock_fd);
                goto next;
            }

            break;
        }

        if (temp == NULL)
        {
            fprintf(stderr, RED "\n[-] (%d) temp = NULL, connection failed %d\n" RESET, gettid(), errno);
            goto next;
        }

        sd->server_sock_fds[i] = current->client_sock_fd;
        sd->number_of_available_servers++;

        int index = (((i - hash) < 0) ? sd->number_of_servers : (i - hash));
        char *send_command;

        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            index = (index + j) % sd->number_of_servers;
            chunks_stored[index]++;

            message_header_t message = {PUT, index, strlen(sd->filename), chunk_sizes[index]};

            if (send(current->client_sock_fd, &message, sizeof(message), 0) < 0)
            {
                fprintf(stderr, "sent failed %d", errno);
                goto next;
            }

            if (send(current->client_sock_fd, sd->filename, strlen(sd->filename), 0) < 0)
            {
                fprintf(stderr, "sent failed %d", errno);
                goto next;
            }
            int total_bytes = 0, numbytes = 0;
            while (total_bytes < chunk_sizes[index])
            {
                if ((numbytes = send(current->client_sock_fd, chunks[index], chunk_sizes[index], 0)) < 0)
                {
                    fprintf(stderr, "sent failed %d", errno);
                    goto next;
                }
                total_bytes += numbytes;
            }
            printf("Sent chunk %d to server %d \n", index, i);
            // ack from server
            char recieve_buffer[RECIEVE_SIZE];
            memset(recieve_buffer, 0, sizeof(recieve_buffer));
            if ((numbytes = recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, 0)) <= 0)
            {
                fprintf(stderr, "recv failed \n");
            }

            if (strncmp(recieve_buffer, ACK, 7) != 0)
                printf("nack recieved \n");

            send(current->client_sock_fd, ACK, 7, 0); // ack from client
        }

        char s[INET6_ADDRSTRLEN];
        inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
        printf(GRN "[+] (%d) Connection established to server: %s\n"
                   "[+] (%d) Server IP address: %s:%s\n" RESET,
               gettid(), current->server_ip, gettid(), s,
               current->server_port);

    next:;
        i++;
        current = current->next;
    }

    // NUMBER_OF_PAIRS

    for (int i = 0; i < sd->number_of_servers; i++)
    {
        if (chunks_stored[i] <= 0)
        {
            printf("Could not put the file realaibley chunk :%d\n", i);
            return;
        }
    }
    printf("Suck sess full put\n");
}

void get_file_chunks_and_join(sockDetails_t *sd, int hash)
{
    int i = 0, numbytes = 0, totalbytes = 0;
    serverDetails_t *current = sd->servers_details;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    int chunks_stored[NUMBER_OF_PAIRS];                          // NUMBER_OF_PAIRS
    int chunks_stored_sizes[NUMBER_OF_PAIRS];                          // NUMBER_OF_PAIRS
    char *chunks[NUMBER_OF_PAIRS];
    memset(chunks, 0, sizeof(chunks));
    memset(chunks_stored, 0, sizeof(chunks_stored));
    char recieve_buffer[RECIEVE_SIZE];

    while (current)
    {
        int index = (((i - hash) < 0) ? sd->number_of_servers : (i - hash));


        struct addrinfo hints, *temp;
        char ip[INET6_ADDRSTRLEN];

        int status;
        sd->server_sock_fds[i] = -1;
        current->client_sock_fd = -1;

        /* Configure address hints structure */
        memset(&hints, 0, sizeof(hints));
        hints.ai_family = AF_UNSPEC;
        hints.ai_socktype = SOCK_STREAM; // for TCP

        if (atoi(current->server_port) <= 1024)
        {
            fprintf(stderr, RED "[-] Port Value < 1024 ! keep port value higher than 1024 \n" RESET);
            exit(EXIT_FAILURE);
        }

        if ((status = getaddrinfo(current->server_ip, current->server_port, &hints, &sd->connect_to_info)) < 0)
        {
            fprintf(stderr, RED "getaddrinfo: %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
            goto next;                                                            // exit if there is an error
        }

        for (temp = sd->connect_to_info; temp != NULL; temp = temp->ai_next)
        {
            if ((current->client_sock_fd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
            {
                perror(RED "server: socket");
                goto next;
            }

            if ((connect(current->client_sock_fd, temp->ai_addr, temp->ai_addrlen)) < 0)
            {
                fprintf(stderr, RED "\n[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
                close(current->client_sock_fd);
                goto next;
            }

            break;
        }

        if (temp == NULL)
        {
            fprintf(stderr, RED "\n[-] (%d) temp = NULL, connection failed %d\n" RESET, gettid(), errno);
            goto next;
        }

        sd->server_sock_fds[i] = current->client_sock_fd;
        sd->number_of_available_servers++;

        printf("chunks: ");
        
        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            index = (index + j) % sd->number_of_servers;

            if(chunks_stored[index] >= 1) continue;

            message_header_t message_header = {
                .command = GET,
                .chunk_id = index,
                .filename_length = strlen(sd->filename),
                .data_length = 0};
            numbytes = send(current->client_sock_fd, &message_header, sizeof(message_header), 0);

            // Send Filename
            numbytes = send(current->client_sock_fd, sd->filename, strlen(sd->filename), 0);

            // ACK
            numbytes = recv(current->client_sock_fd, recieve_buffer, 7, 0);
            // numbytes = recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), 0);
            if (strncmp(recieve_buffer, ACK, 7) != 0)
            {
                fprintf(stderr, "NACK recieved %d\n", numbytes);
                goto next;
            }
            else
            {
                printf("ACK!!!!!!! %d\n", numbytes);
            }

            message_header_t *recv_message_header = malloc(sizeof(message_header_t)); // free it later


            numbytes = recv(current->client_sock_fd, recv_message_header, sizeof(message_header_t), 0);

            printf("Server has fucking shit %d %d %d %d (numbytes read) %d\n", recv_message_header->chunk_id, recv_message_header->command, recv_message_header->data_length, recv_message_header->filename_length, numbytes);

            int total_bytes = 0, numbytes = 0;
            memset(recieve_buffer, 0, sizeof(recieve_buffer));
            total_bytes = 0;
            chunks[index] = malloc(recv_message_header->data_length); // free this later
            while (total_bytes < recv_message_header->data_length)
            {
                memset(recieve_buffer, 0, sizeof(recieve_buffer));
                printf("were waiting here\n");
                if ((numbytes = recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, 0)) < 0)
                {
                    printf("recv failed \n");
                    goto next;
                }
                printf("not here");
                memcpy(&chunks[index][total_bytes], recieve_buffer, numbytes);
                total_bytes += numbytes;
            }
        

            
            numbytes = send(current->client_sock_fd, ACK, 7, 0);
            printf("recieved chunk bitch from server %d - chunk %d\n", i, index);

            memset(recieve_buffer, 0, sizeof(recieve_buffer));
            numbytes = recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), 0); // ack

            chunks_stored[index]++;
            chunks_stored_sizes[index] =  recv_message_header->data_length;
            free(recv_message_header);
        }
        printf("for server %d\n", i);

        char s[INET6_ADDRSTRLEN];
        inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
        printf(GRN "[+] (%d) Connection established to server: %s\n"
                   "[+] (%d) Server IP address: %s:%s\n" RESET,
               gettid(), current->server_ip, gettid(), s,
               current->server_port);



    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
    }

    FILE *fs = fopen(sd->filename, "wb");

    for(int i=0; i<NUMBER_OF_PAIRS; i++){
        chunks[i];
        chunks_stored_sizes[i];
        fwrite(chunks[i], chunks_stored_sizes[i], 1, fs);
        

        free(chunks[i]);
    }
    fclose(fs);
}

void put_file(sockDetails_t *sd)
{
    FILE *fs = fopen(sd->filename, "rb");
    if (fs == NULL)
    {
        fprintf(stderr, "[-] Error opening file %d \n" RESET, errno);
        return;
    }
    uint32_t hash = str2md5(sd->filename, strlen(sd->filename));
    // printf("hash: %u | modulo: %d\n\r", hash, hash % sd->number_of_servers);

    fseek(fs, 0L, SEEK_END);
    int size = ftell(fs);
    fseek(fs, 0, SEEK_SET);

    int chunk_sizes[MAX_NUMBER_OF_SERVERS]; // NUMBER_OF_PAIRS
    char *chunks[MAX_NUMBER_OF_SERVERS];    // NUMBER_OF_PAIRS
    int total_chunk_size_until_now = 0;

    // NUMBER_OF_PAIRS
    for (int i = 0; i < sd->number_of_servers; i++)
    {
        int chunk_size;
        if (i == sd->number_of_servers - 1)
            chunk_size = size - total_chunk_size_until_now;
        else
            chunk_size = size / sd->number_of_servers;
        total_chunk_size_until_now += chunk_size;

        chunk_sizes[i] = chunk_size;

        char *chunk = malloc(chunk_size); // free
        chunks[i] = chunk;
        fread(chunk, 1, chunk_size, fs);

        printf("Size of chunk %d is %d for filename %s\n", i, chunk_size, sd->filename);
    }

    connect_and_put_chunks(sd, chunks, chunk_sizes, hash % sd->number_of_servers);
}

void get_file(sockDetails_t *sd)
{
    get_file_chunks_and_join(sd, str2md5(sd->filename, strlen(sd->filename)) % sd->number_of_servers);
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
    char recieved_buf[RECIEVE_SIZE];  /* Buffer for incoming requests */
    char transmit_buf[TRANSMIT_SIZE]; /* Buffer for incoming requests */
    fd_set readfds;                   /* File descriptor set for select() */
    int file_fd;

    FD_ZERO(&readfds);
    // FD_SET(sd->client_sock_fd, &readfds);

    /* Set timeout period for idle connections */
    struct timeval timeout = {TIMEOUT_HTTP_SEC, 0};

    /* Process user commands through menu interface */
    switch (sd->command_int)
    {
    case LS:
        /* List directory contents */

        break;
    case GET:
        /* Download file from server */

        get_file(sd);
        break;
    case PUT:

        /* Upload file to server */
        put_file(sd);
        break;

    case DELETE:
        /* Delete file from server */
        break;
    case EXIT:
        /* Clean termination */

        break;
    case SERVER_INFO:
        // Screen clear requested
    default:
        break;
    }

    /* Monitor socket for incoming data */
    // int select_status = select(sd->client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
    /* Handle select errors */
    // if (select_status < 0)
    // {
    //     fprintf(stderr, RED "[-] (%d) Select syscall failed with error: %d (%s)\n" RESET,
    //             gettid(), errno, strerror(errno));
    //     break;
    // }

    /* Handle connection timeout */
    //         else if (select_status == 0)
    //         {
    //             printf(YEL "\n[-] (%d) CONNECTION TIMEOUT:\n"
    //                        "[-] Client connection idle for %d seconds\n"
    //                        "------------------------------------------------------------\n" RESET,
    //                    gettid(), TIMEOUT_HTTP_SEC);
    //             break;
    //         }

    //         /* Process incoming data when available */
    //         else if (FD_ISSET(sd->client_sock_fd, &readfds))
    //         {
    //             memset(recieved_buf, 0, sizeof(recieved_buf));
    //             /* Read incoming request with error checking */
    //             int total_bytes = 0;

    //             if ((numbytes = recv(sd->client_sock_fd, &recieved_buf[total_bytes], TRANSMIT_SIZE, 0)) < 0)
    //             {
    //                 break;
    //                 fprintf(stderr, RED "[-] (%d) read\n", gettid());
    //                 // break;
    //             }
    //             // You get a return value of 0 for recv() when the connection was closed by the other host
    //             if (numbytes == 0)
    //             {
    //                 fprintf(stderr, RED "[-] (%d) peer has closed the connection exiting\n", gettid());
    //                 break;
    //             }

    //             total_bytes += (numbytes - 1);

    //             printf("\n\n==============================================================\n"
    //                    "[+] (%d) Received request from client [%d bytes]:\n"
    //                    "==============================================================\n"
    //                    "%s\n",
    //                    gettid(), total_bytes, recieved_buf);

    //             /* Initialize header structure and parse request */
    //             memset(&header, 0, sizeof(HttpHeader_t));
    //             if (parse_request_line_thread_safe(recieved_buf, &header) < 0)
    //             {
    //                 send_error_response(sd->client_sock_fd, header.http_version_str, header.parser_error);
    //                 goto cleanup;
    //             }

    //             if (is_blocked(NULL, header.hostname_str))
    //             {
    //                 printf(RED "[-] (%d) ACCESS DENIED: Domain is in blocklist\n"
    //                            "[-] Blocked domain: %s\n" RESET,
    //                        gettid(), header.hostname_str);

    //                 send_error_response(sd->client_sock_fd, header.http_version_str, FORBIDDEN);

    //                 goto cleanup;
    //             }

    //             int returnval = check_and_send_from_cache(&header, sd, is_dynamic_content(header.uri_str, recieved_buf), 1, 1);

    //             /* Check if connection should be closed */
    //             if ((header.connection_close == 1 && header.connection_keep_alive == 0) || returnval < 0)
    //             {
    //                 goto cleanup;
    //             }
    //             cleanup_header(&header);
    //             memset(recieved_buf, 0, sizeof(recieved_buf));

    //             /* Clear header for next request */
    //         }
    //     }
    // cleanup:;
    //     /* Clean up resources before exit */
    //     cleanup_header(&header);
    //     // Only close the client socket, file_fd is already closed in the handler functions
    //     // or was never opened if we jumped to cleanup without accessing a file
    //     close(sd->client_sock_fd);

    return NULL;
}