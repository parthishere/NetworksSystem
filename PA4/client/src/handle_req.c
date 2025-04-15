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

void connect_save_send(sockDetails_t *sd, int servers_to_connect_to[], int arr_length, char *message)
{
    serverDetails_t *current = sd->servers_details;
    int i = 0;
    while (current)
    {

        if (i >= arr_length || servers_to_connect_to[i] == 0)
            goto next;

        struct addrinfo hints, *temp;
        char ip[INET6_ADDRSTRLEN];

        int status;
        int sockfd;

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

        char s[INET6_ADDRSTRLEN];
        inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
        printf(GRN "[+] (%d) Connection established to server: %s\n"
                   "[+] (%d) Server IP address: %s:%s\n" RESET,
               gettid(), current->server_ip, gettid(), s,
               current->server_port);

        if (send(current->client_sock_fd, message, strlen(message), 0) < 0)
        {
            fprintf(stderr, "sent failed %d", errno);
            goto next;
        }

    next:;
        i++;
        current = current->next;
    }
}

// void connect_save_and_send(sockDetails_t *sd, char *message){
//     serverDetails_t *current = sd->servers_details;
//     while(current){

//         if(send(current->client_sock_fd, "ls", 2, 0) < 0){
//             fprintf(stderr, RED"[-] send failed %d \n"RESET, errno);
//             goto next;
//         }
//         printf("Sent \n");
// next:;
//         current = current->next;
//     }
// }

void recv_and_showing(sockDetails_t *sd)
{
    serverDetails_t *current = sd->servers_details;
    while (current)
    {

        if (send(current->client_sock_fd, "ls", 2, 0) < 0)
        {
            fprintf(stderr, RED "[-] send failed %d \n" RESET, errno);
            goto next;
        }
        printf("Sent \n");
    next:;
        current = current->next;
    }
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

    // connect_save_and_send(sd, "ls");

    int servers[] = {1, 1, 1, 1};
    /* Process user commands through menu interface */
    switch (sd->command_int)
    {
    case LS:
        /* List directory contents */
        connect_save_send(sd, servers, 4, "ls");

        break;
    case GET:
        /* Download file from server */

        break;
    case PUT:
        /* Upload file to server */
        
        FILE *fs = fopen(sd->filename, "rb");
        if(fs == NULL){
            fprintf(stderr, "[-] Error opening file %d \n"RESET, errno);
        }
        uint32_t buf = str2md5(sd->filename, strlen(sd->filename));
        printf("Buf %lu %d\n\r", buf, buf%4);
        
        fseek(fs, 0L, SEEK_END);
        int size = ftell(fs);
        
        fseek(fs, 0, SEEK_SET);
        
        int chunk1_size = size/4;
        int chunk2_size = size/4;
        int chunk3_size = size/4;
        int chunk4_size = size - chunk1_size - chunk2_size - chunk3_size;

        printf("size %d %d %d %d %d %d\n", size, chunk1_size, chunk2_size, chunk3_size, chunk4_size, chunk1_size+ chunk2_size+ chunk3_size+ chunk4_size);
        char *chunk1 = malloc(chunk1_size+5);
        char *chunk2 = malloc(chunk2_size+5);
        char *chunk3 = malloc(chunk3_size+5);
        char *chunk4 = malloc(chunk4_size+5);

        *chunk1 = (chunk1_size & 0xFF);
        *(chunk1+1) = ((chunk1_size >> 8) & 0xFF);
        *(chunk1+2) = ((chunk1_size >> 16) & 0xFF);
        *(chunk1+3) = ((chunk1_size >> 24) & 0xFF);
        *(chunk1+4) = 1;
        
        *chunk2 = chunk2_size & 0xFF;
        *(chunk2+1) = ((chunk2_size >> 8) & 0xFF);
        *(chunk2+2) = ((chunk2_size >> 16) & 0xFF);
        *(chunk2+3) = ((chunk2_size >> 24) & 0xFF);
        *(chunk2+4) = 2;

        *chunk3 = chunk3_size & 0xFF;
        *(chunk3+1) = ((chunk3_size >> 8) && 0xFF);
        *(chunk3+2) = ((chunk3_size >> 16) && 0xFF);
        *(chunk3+3) = ((chunk3_size >> 24) && 0xFF);
        *(chunk3+4) = 3;

        *chunk4 = chunk4_size & 0xFF;
        *(chunk4+1) = ((chunk4_size >> 8) && 0xFF);
        *(chunk4+2) = ((chunk4_size >> 16) && 0xFF);
        *(chunk4+3) = ((chunk4_size >> 24) && 0xFF);
        *(chunk4+4) = 4;
        

        fseek(fs, 0, SEEK_SET);
        fread(chunk1+5, 1, chunk1_size, fs);
        
        fseek(fs, chunk1_size, SEEK_SET);
        fread(chunk2+5, 1, chunk2_size, fs);
        
        fseek(fs, chunk1_size+chunk2_size, SEEK_SET);
        fread(chunk3+5, 1, chunk3_size, fs);
        
        fseek(fs, chunk1_size+chunk2_size+chunk3_size, SEEK_SET);
        fread(chunk4+5, 1, chunk4_size, fs);
        
        // char *chunk1_2 = malloc(chunk1_size+chunk2_size);
        // char *chunk2_3 = malloc(chunk2_size+chunk3_size);
        // char *chunk3_4 = malloc(chunk3_size+chunk4_size);
        // char *chunk4_1 = malloc(chunk4_size+chunk1_size);
        
        
        // fseek(fs, 0, SEEK_SET);
        // fread(chunk1_2, 1, chunk1_size+chunk2_size, fs);

        // fseek(fs, chunk1_size, SEEK_SET);
        // fread(chunk2_3, 1, chunk2_size+chunk3_size, fs);

        // fseek(fs, chunk2_size, SEEK_SET);
        // fread(chunk3_4, 1, chunk3_size+chunk4_size, fs);

        // fseek(fs, chunk3_size, SEEK_SET);
        // fread(chunk4_1, 1, chunk4_size, fs);
        // fseek(fs, 0, SEEK_SET);
        // fread(chunk4_1+chunk4_size, 1, chunk1_size, fs);

        
        FILE *out_file = fopen("reconstructed_file", "wb");
        if (out_file) {
            printf("Chunk %d, chunk size %d \n ", *(chunk1+4), (*chunk1 + (*(chunk1+1) << 8) + (*(chunk1+2) << 16) + (*(chunk1+3) << 24)));
            printf("Chunk %d, chunk size %d \n ", *(chunk2+4), (*chunk2 + (*(chunk2+1) << 8) + (*(chunk2+2) << 16) + (*(chunk2+3) << 24)));
            printf("Chunk %d, chunk size %d,%d,%d,%d \n ", *(chunk3+4), *chunk3, *(chunk3+1), *(chunk3+2), *(chunk3+3));
            printf("Chunk %d, chunk size %d,%d,%d,%d \n ", *(chunk4+4), *chunk4, *(chunk4+1), *(chunk4+2), *(chunk4+3));
            fwrite(chunk1+5, 1, chunk1_size, out_file);
            fwrite(chunk2+5, 1, chunk2_size, out_file);
            fwrite(chunk3+5, 1, chunk3_size, out_file);
            fwrite(chunk4+5, 1, chunk4_size, out_file);
            fclose(out_file);
            printf("File reconstructed successfully\n");
        }
        fclose(fs);

        connect_save_send(sd, servers, 4, "put"); 

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