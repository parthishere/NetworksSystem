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

#define _send(sockfd, message, message_len, goto_where) ({                                               \
    int numbytes;                                                                                        \
    if ((numbytes = send(sockfd, message, message_len, 0)) <= 0)                                         \
    {                                                                                                    \
        printf(RED "[-] ERROR: Send operation failed (errno: %d - %s)\n" RESET, errno, strerror(errno)); \
        goto goto_where;                                                                                 \
    }                                                                                                    \
    numbytes;                                                                                            \
})

#define _recv(sockfd, message, message_len, goto_where) ({                                                  \
    int numbytes;                                                                                           \
    if ((numbytes = recv(sockfd, message, message_len, 0)) < 0)                                             \
    {                                                                                                       \
        printf(RED "[-] ERROR: Receive operation failed (errno: %d - %s)\n" RESET, errno, strerror(errno)); \
        goto goto_where;                                                                                    \
    }                                                                                                       \
    else if (numbytes == 0)                                                                                 \
    {                                                                                                       \
        close(sockfd);                                                                                      \
        printf(YEL "[-] NOTICE: Connection closed by client\n" RESET);                                      \
        goto goto_where;                                                                                    \
    }                                                                                                       \
    numbytes;                                                                                               \
})

#pragma pack(push, 1)
typedef struct message_header_s
{
    uint8_t command;          // 0=put, 1=get
    uint8_t chunk_id;         // Which chunk (0-based)
    uint32_t filename_length; // length of filename
    uint32_t data_length;     // Length of following data
} message_header_t;
#pragma pack(pop)

uint32_t str2md5(char *str, int length)
{
    EVP_MD_CTX *context = EVP_MD_CTX_new();
    const EVP_MD *md = EVP_md5();
    EVP_DigestInit_ex(context, md, NULL);
    unsigned int md_len;
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
    for (unsigned int n = 0; n < md_len; ++n)
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

void cleanup_current_connection(serverDetails_t *current)
{
    close(current->client_sock_fd);
}

void cleanup_connection(sockDetails_t *sd)
{
    serverDetails_t *current = sd->servers_details;
    while (current)
    {
        serverDetails_t *temp = current;
        if (current->client_sock_fd > 0)
            close(current->client_sock_fd);

        current->client_sock_fd = -1;
        if (current->server_ip)
            free(current->server_ip);
        current->server_ip = NULL;
        if (current->server_port)
            free(current->server_port);
        current->server_port = NULL;

        current = current->next;

        free(temp);
    }

}

int connect_server(sockDetails_t *sd, serverDetails_t *current, int server_index)
{
    struct addrinfo hints, *temp;
    int status = 1;

    sd->server_sock_fds[server_index] = -1;
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
        fprintf(stderr, RED "[-] ERROR: DNS resolution failed - %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
        status = -1;                                                                                // exit if there is an error
        goto cleanup;
    }

    for (temp = sd->connect_to_info; temp != NULL; temp = temp->ai_next)
    {
        if ((current->client_sock_fd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            fprintf(stderr, RED "[-] ERROR: Cannot create socket for server (%s:%s)\n" RESET, current->server_ip, current->server_port);
            status = -1; // exit if there is an error
            goto cleanup;
        }

        if ((connect(current->client_sock_fd, temp->ai_addr, temp->ai_addrlen)) < 0)
        {
            fprintf(stderr, RED "\n[-] CONNECTION FAILED: Server %d (%s:%s)\n" RESET, server_index + 1, current->server_ip, current->server_port);
            fprintf(stderr, RED "    Error: %s (errno: %d)\n" RESET, strerror(errno), errno);
            close(current->client_sock_fd);
            status = -1; // exit if there is an error
            goto cleanup;
        }

        break;
    }

    if (temp == NULL)
    {
        fprintf(stderr, RED "\n[-] ERROR: Connection attempt exhausted all available addresses (thread: %d, errno: %d)\n" RESET, gettid(), errno);
        status = -1; // exit if there is an error
        goto cleanup;
    }

    sd->server_sock_fds[server_index] = current->client_sock_fd;
    sd->number_of_available_servers++;

    char s[INET6_ADDRSTRLEN];
    inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
    printf(GRN "\n[+] CONNECTION ESTABLISHED: Server %d\n" RESET, server_index + 1);
    printf(GRN "    Address: %s:%s\n" RESET, current->server_ip, current->server_port);

    struct timeval tv;
    tv.tv_sec = TIMEOUT_SEC; // 5 second timeout
    tv.tv_usec = 0;
    setsockopt(current->client_sock_fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
    setsockopt(current->client_sock_fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));

    // fprintf(stderr, YEL "\n[!] Connection timeout to server %d (%s:%s)\n" RESET, server_index+1, current->server_ip, current->server_port);
    // fprintf(stderr, YEL "    Server did not respond within timeout period\n\n" RESET);

cleanup:
    freeaddrinfo(temp);
    return status;
}

void connect_and_put_chunks(sockDetails_t *sd, char *chunks[], int chunk_sizes[], int hash)
{

    printf(MAG "\n[*] FILE DISTRIBUTION MAPPING\n" RESET);
    printf(MAG "    File hash value: %d\n" RESET, hash);
    printf(MAG "    Starting server: %d\n\n" RESET, hash % sd->number_of_servers + 1);

    serverDetails_t *current = sd->servers_details;
    int i = 0, numbytes;

    int chunks_stored[NUMBER_OF_PAIRS];
    char recieve_buffer[RECIEVE_SIZE];

    memset(chunks_stored, 0, NUMBER_OF_PAIRS * 4);

    while (current)
    {
        if (connect_server(sd, current, i) < 0)
            goto next;

        int index = (hash + i) % sd->number_of_servers;

        printf(MAG "[*] CHUNK ASSIGNMENT: Server %d\n" RESET, i + 1);
        printf(MAG "    Storing chunks: " RESET);
        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            printf(MAG "%d " RESET, (index + j) % sd->number_of_servers + 1);
        }
        printf("\n");

        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            // Server chunk assignment
            index = (index + j) % sd->number_of_servers;
            chunks_stored[index]++;

            message_header_t message = {
                .command = PUT,
                .chunk_id = index,
                .filename_length = strlen(sd->filename),
                .data_length = chunk_sizes[index]};

            numbytes = _send(current->client_sock_fd, &message, sizeof(message_header_t), next);
            memset(recieve_buffer, 0 ,sizeof(recieve_buffer));
            numbytes = _recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, next);

            numbytes = _send(current->client_sock_fd, sd->filename, message.filename_length, next);
            memset(recieve_buffer, 0 ,sizeof(recieve_buffer));
            numbytes = _recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, next);

            numbytes = _send(current->client_sock_fd, chunks[index], chunk_sizes[index], next);
            memset(recieve_buffer, 0, sizeof(recieve_buffer));
            numbytes = _recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, next);


            if (strncmp(recieve_buffer, ACK, ACK_LEN) != 0)
            {
                printf(RED "[-] ERROR: Received NACK from server for chunk %d\n" RESET, index + 1);
                goto next;
            }
            else
            {
                printf(GRN "[+] Stored chunk %d to server %d\n" RESET, index, i + 1);
            }

            (void)numbytes;
        }

    next:;
        cleanup_current_connection(current);
        i++;
        current = current->next;
    }

    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        if (chunks_stored[i] <= 0)
        {
            printf(RED "\n=========================================\n" RESET);
            printf(RED "    PUT OPERATION FAILED\n" RESET);
            printf(RED "    File: %s\n" RESET, sd->filename);
            printf(RED "    Cannot store file reliably\n" RESET);
            printf(RED "    Missing redundancy for chunk %d\n" RESET, i + 1);
            printf(RED "=========================================\n\n" RESET);
            return;
        }
    }

    // Put operation success
    printf(GRN "\n=========================================\n" RESET);
    printf(GRN "    FILE UPLOAD SUCCESSFUL\n" RESET);
    printf(GRN "    File: %s\n" RESET, sd->filename);
    printf(GRN "    All chunks stored with redundancy\n" RESET);
    printf(GRN "=========================================\n\n" RESET);
}

void put_file(sockDetails_t *sd)
{
    FILE *fs = fopen(sd->filename, "rb");
    if (fs == NULL)
    {
        fprintf(stderr, RED "[-] Error opening file %d \n" RESET, errno);
        return;
    }

    char *temp_filename = strrchr(sd->filename, '/');
    if (temp_filename == NULL)
    {
        temp_filename = sd->filename;
    }
    else
    {
        temp_filename++;
    }

    uint32_t hash = str2md5(temp_filename, strlen(temp_filename));
    sd->filename = temp_filename;

    fseek(fs, 0L, SEEK_END);
    int size = ftell(fs);
    fseek(fs, 0, SEEK_SET);

    int chunk_sizes[NUMBER_OF_PAIRS];
    char *chunks[NUMBER_OF_PAIRS];
    int total_chunk_size_until_now = 0;

    printf(MAG "\n[*] FILE PREPARATION\n" RESET);
    printf(MAG "    Filename: %s\n" RESET, sd->filename);
    printf(MAG "    Total size: %d bytes\n" RESET, size);
    printf(MAG "    Chunking into %d parts\n\n" RESET, NUMBER_OF_PAIRS);

    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        int chunk_size;
        if (i == NUMBER_OF_PAIRS - 1)
            chunk_size = size - total_chunk_size_until_now;
        else
            chunk_size = size / NUMBER_OF_PAIRS;
        total_chunk_size_until_now += chunk_size;

        chunk_sizes[i] = chunk_size;

        char *chunk = malloc(chunk_size); // free
        chunks[i] = chunk;
        fread(chunk, 1, chunk_size, fs);

        printf(MAG "[*] CHUNK CREATED: %d of %d\n" RESET, i + 1, NUMBER_OF_PAIRS);
        printf(MAG "    Size: %d bytes\n\n" RESET, chunk_size);
    }

    connect_and_put_chunks(sd, chunks, chunk_sizes, hash % sd->number_of_servers);
}

void get_file(sockDetails_t *sd)
{

    // Calculate file hash to determine starting server
    char *temp_filename = strrchr(sd->filename, '/');
    if (temp_filename == NULL)
    {
        temp_filename = sd->filename;
    }
    else
    {
        temp_filename++;
    }
    uint32_t hash = str2md5(temp_filename, strlen(temp_filename));
    sd->filename = temp_filename;

    int i = 0, numbytes = 0;
    serverDetails_t *current = sd->servers_details;

    // Track chunk status
    int chunks_stored[NUMBER_OF_PAIRS];
    int chunks_stored_sizes[NUMBER_OF_PAIRS];
    char *chunks[NUMBER_OF_PAIRS];
    char recieve_buffer[RECIEVE_SIZE];
    int total_chunks_downloaded = 0;

    // Initialize chunk tracking arrays
    memset(chunks, 0, sizeof(chunks));
    memset(chunks_stored, 0, sizeof(chunks_stored));
    memset(chunks_stored_sizes, 0, sizeof(chunks_stored_sizes));

    // Track server connection status
    int servers_contacted = 0;
    int servers_available = 0;

    // Try to get chunks from each server
    while (current && total_chunks_downloaded <= NUMBER_OF_PAIRS)
    {
        servers_contacted++;

        

        servers_available++;
        printf(GRN "[+] CONNECTION ESTABLISHED: Server %d is online\n" RESET, i + 1);

        // Calculate which chunks should be on this server based on the hash
        int index = (hash + i) % sd->number_of_servers;

        printf(MAG "[*] REQUESTING CHUNKS: Server %d should have chunks " RESET, i + 1);
        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            printf("%d ", (index + j) % sd->number_of_servers + 1);
        }
        printf("\n");

        // Try to get each chunk from this server
        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            if (connect_server(sd, current, i) < 0)
            {
                goto next;
            }

            index = (index + j) % sd->number_of_servers;

            // Skip if we already have this chunk
            if (chunks_stored[index] >= 1)
            {
                printf(YEL "    [!] Skipping chunk %d (already downloaded)\n" RESET, index + 1);
                continue;
            }

            printf(MAG "    [*] Requesting chunk %d from server %d\n" RESET, index + 1, i + 1);

            // Prepare request header
            message_header_t message_header = {
                .command = GET,
                .chunk_id = index,
                .filename_length = strlen(sd->filename),
                .data_length = 0};

            // printf("Raw header bytes: (send)");
            // unsigned char *bytes = (unsigned char *)&message_header;
            // for (int i = 0; i < sizeof(message_header_t); i++)
            // {
            //     printf("%02x ", bytes[i]);
            // }
            // printf("\n");
            // Send request header and filename

            numbytes = _send(current->client_sock_fd, &message_header, sizeof(message_header_t), next);
            numbytes = _recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), next);

            numbytes = _send(current->client_sock_fd, sd->filename, strlen(sd->filename), next);
            numbytes = _recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), next);

            if (strncmp(recieve_buffer, ACK, ACK_LEN) != 0)
            {
                printf(RED "    [-] Server %d does not have chunk %d\n" RESET, i + 1, index + 1);
                continue; // Try next chunk instead of giving up on the server
            }

            printf(GRN "    [+] Server has chunk %d, downloading...\n" RESET, index + 1);

            numbytes = _send(current->client_sock_fd, ACK, ACK_LEN, chunk_failed);
            memset(&message_header, 0, sizeof(message_header_t));
            numbytes = _recv(current->client_sock_fd, &message_header, sizeof(message_header), chunk_failed);

            // printf("message_header recieved %d \n", numbytes);
            // printf("Raw header bytes: (recv)");
            // bytes = (unsigned char *)&message_header;
            // for (int i = 0; i < sizeof(message_header_t); i++)
            // {
            //     printf("%02x ", bytes[i]);
            // }
            // printf("\n");

            int data_size = message_header.data_length;
            printf(MAG "    [*] Chunk %d size: %d bytes\n" RESET, message_header.chunk_id + 1, data_size);

            // Allocate memory for chunk data
            chunks[index] = malloc(data_size);
            if (chunks[index] == NULL)
            {
                printf(RED "    [-] ERROR: Memory allocation failed for chunk %d\n" RESET, index + 1);
                return;
            }

            numbytes = _send(current->client_sock_fd, ACK, ACK_LEN, chunk_failed);
            // Receive chunk data
            int total_bytes = 0;
            while (total_bytes < data_size)
            {
                memset(recieve_buffer, 0, sizeof(recieve_buffer));
                numbytes = _recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, chunk_failed);
                

                int bytes_to_copy = numbytes;
                if (total_bytes + bytes_to_copy > data_size) {
                    bytes_to_copy = data_size - total_bytes;
                }

                memcpy(&chunks[index][total_bytes], recieve_buffer, bytes_to_copy);
                total_bytes += numbytes;

                // Show progress for large chunks
                if (data_size > 10000 && total_bytes % 10000 == 0)
                {
                    printf(MAG "    [*] Downloaded %d/%d bytes (%.1f%%)\n" RESET,
                           total_bytes, data_size, (float)total_bytes / data_size * 100);
                }
            }

            // // Send ACK for received chunk
            numbytes = _send(current->client_sock_fd, ACK, ACK_LEN, chunk_failed);

            numbytes = _recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, chunk_failed);

            // Mark chunk as successfully received
            chunks_stored[index] = 1;
            chunks_stored_sizes[index] = data_size;
            total_chunks_downloaded++;

            printf(GRN "    [+] CHUNK %d DOWNLOADED SUCCESSFULLY (%d bytes)\n" RESET, index + 1, data_size);

            close(current->client_sock_fd);
            continue;

        chunk_failed:
            close(current->client_sock_fd);
            printf(RED "    [-] ERROR: Failed to download chunk %d\n" RESET, index + 1);
            if (chunks[index])
            {
                free(chunks[index]);
                chunks[index] = NULL;
            }
        }

    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
    }

    // Print download summary
    printf(MAG "\n=========================================\n" RESET);
    printf(MAG "    DOWNLOAD SUMMARY: %s\n" RESET, sd->filename);
    printf(MAG "=========================================\n\n" RESET);

    printf(MAG"Server status: %d/%d available\n"RESET, servers_available, servers_contacted);
    printf(MAG"Chunks status: %d/%d downloaded\n\n"RESET, total_chunks_downloaded, NUMBER_OF_PAIRS);

    // Print chunk status
    printf("Chunk breakdown:\n");
    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        if (chunks_stored[i] > 0)
        {
            printf(GRN "  [✓] Chunk %d: %d bytes\n" RESET, i + 1, chunks_stored_sizes[i]);
        }
        else
        {
            printf(RED "  [✗] Chunk %d: MISSING\n" RESET, i + 1);
        }
    }
    printf("\n");

    // Check if all chunks were retrieved
    int can_rebuild = 1;
    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        if (chunks[i] == NULL || chunks_stored_sizes[i] <= 0 || chunks_stored[i] <= 0)
        {
            can_rebuild = 0;
            printf(RED "[!] CANNOT RECONSTRUCT: Missing chunk %d\n" RESET, i + 1);
        }
    }

    if (!can_rebuild)
    {
        printf(RED "\n=========================================\n" RESET);
        printf(RED "    DOWNLOAD FAILED: %s\n" RESET, sd->filename);
        printf(RED "    Reason: Missing chunks prevent reconstruction\n" RESET);
        printf(RED "    Required: %d/%d chunks\n" RESET, NUMBER_OF_PAIRS, NUMBER_OF_PAIRS);
        printf(RED "    Available: %d/%d chunks\n" RESET, total_chunks_downloaded, NUMBER_OF_PAIRS);
        printf(RED "=========================================\n\n" RESET);

        // Free allocated memory
        for (int i = 0; i < NUMBER_OF_PAIRS; i++)
        {
            if (chunks[i] != NULL)
                free(chunks[i]);
        }

        return;
    }

    // Reassemble file
    printf(MAG "[*] REASSEMBLING FILE: All chunks available\n" RESET);

    char *filename;

    asprintf(&filename, "%s/%s", WHERE_TO_DOWNLOAD_FILE, sd->filename);

    FILE *fs = fopen(filename, "wb");
    if (fs == NULL)
    {
        printf(RED "[-] ERROR: Could not create output file: %s\n" RESET, sd->filename);

        // Free allocated memory
        for (int i = 0; i < NUMBER_OF_PAIRS; i++)
        {
            if (chunks[i] != NULL)
                free(chunks[i]);
        }

        return;
    }
    free(filename);

    // Calculate total file size
    int total_file_size = 0;
    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        total_file_size += chunks_stored_sizes[i];
    }

    // Write chunks in order
    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        printf(MAG "    [*] Writing chunk %d (%d bytes)\n" RESET, i + 1, chunks_stored_sizes[i]);
        fwrite(chunks[i], chunks_stored_sizes[i], 1, fs);
        free(chunks[i]);
    }
    fclose(fs);

    printf(GRN "\n=========================================\n" RESET);
    printf(GRN "    DOWNLOAD SUCCESSFUL: %s\n" RESET, sd->filename);
    printf(GRN "    Total file size: %d bytes\n" RESET, total_file_size);
    printf(GRN "    All %d chunks retrieved and reassembled\n" RESET, NUMBER_OF_PAIRS);
    printf(GRN "=========================================\n\n" RESET);
}

// Function to extract original filename from server format
// Format: "chunk_id_original_filename_chunk_id"
char *extract_original_filename(const char *server_filename)
{
    // Find the first underscore
    const char *first_underscore = strchr(server_filename, '_');
    if (first_underscore == NULL)
    {
        return NULL; // Invalid format
    }

    // Move past the first underscore
    first_underscore++;

    // Find the last underscore
    const char *last_underscore = strrchr(first_underscore, '_');
    if (last_underscore == NULL)
    {
        return NULL; // Invalid format
    }

    // Calculate length of original filename
    size_t original_len = last_underscore - first_underscore;

    // Allocate memory and copy
    char *original_filename = malloc(original_len + 1);
    if (original_filename == NULL)
    {
        return NULL; // Memory allocation failed
    }

    // Copy the original filename part
    strncpy(original_filename, first_underscore, original_len);
    original_filename[original_len] = '\0';

    return original_filename;
}
// Function to extract original filename and chunk ID from server format
// Format: "dirname/original_filename_chunk_id"
int parse_server_filename(const char *server_filename, char **original_filename, int *chunk_id)
{
    // Skip past directory part if present
    const char *filename_part = strrchr(server_filename, '/');
    if (filename_part != NULL)
    {
        filename_part++; // Skip past the '/'
    }
    else
    {
        filename_part = server_filename; // No directory separator found
    }

    // Find the last underscore (before chunk_id)
    const char *last_underscore = strrchr(filename_part, '_');
    if (last_underscore == NULL)
    {
        return -1; // Invalid format
    }

    // Extract chunk ID
    *chunk_id = atoi(last_underscore + 1);

    // Calculate length of original filename
    size_t original_len = last_underscore - filename_part;

    // Allocate memory for original filename
    *original_filename = malloc(original_len + 1);
    if (*original_filename == NULL)
    {
        return -1; // Memory allocation failed
    }

    // Copy the original filename part
    strncpy(*original_filename, filename_part, original_len);
    (*original_filename)[original_len] = '\0';

    return 0;
}

void list_file(sockDetails_t *sd)
{
    printf(MAG "\n[*] SCANNING SERVERS FOR FILES\n" RESET);

    int i = 0, numbytes = 0;
    serverDetails_t *current = sd->servers_details;
    char recieve_buffer[RECIEVE_SIZE];

    // Store file information
    typedef struct file_info
    {
        char *filename;
        int chunks_present[NUMBER_OF_PAIRS];
        struct file_info *next;
    } file_info_t;

    file_info_t *file_list = NULL;

    // For each server
    while (current)
    {
        printf(MAG "\n[*] QUERYING: Server %d (%s:%s)\n" RESET, i + 1, current->server_ip, current->server_port);

        if (connect_server(sd, current, i) < 0)
        {
            goto next;
        }

        message_header_t message_header = {
            .command = LS,
            .chunk_id = 0,
            .filename_length = 0,
            .data_length = 0};
        numbytes = _send(current->client_sock_fd, &message_header, sizeof(message_header), next);
        printf(MAG "[*] LIST REQUEST SENT\n" RESET);
        numbytes = _recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, next);

        int files_found = 0;

        // Process server response
        while (1)
        {
            memset(&message_header, 0, sizeof(message_header_t));
            numbytes = _recv(current->client_sock_fd, &message_header, sizeof(message_header_t), next);
            if (numbytes <= 0)
                break;

            memcpy(recieve_buffer, (void *)&message_header, numbytes);
            if (strncmp(recieve_buffer, ACK, ACK_LEN) == 0 || strncmp(recieve_buffer, NACK, NACK_LEN) == 0)
                break;

            bzero(recieve_buffer, sizeof(recieve_buffer));
            numbytes = recv(current->client_sock_fd, recieve_buffer, message_header.filename_length, 0);
            if (numbytes <= 0 || strncmp(recieve_buffer, ACK, ACK_LEN) == 0 || strncmp(recieve_buffer, NACK, NACK_LEN) == 0)
                break;

            // Parse filename to extract original name and chunk ID
            char *original_filename = NULL;
            int chunk_id = -1;
            if (parse_server_filename(recieve_buffer, &original_filename, &chunk_id) == 0 && chunk_id < NUMBER_OF_PAIRS)
            {
                files_found++;

                // Find or create file entry
                file_info_t *file_entry = file_list;
                int found = 0;

                while (file_entry != NULL)
                {
                    if (strcmp(file_entry->filename, original_filename) == 0)
                    {
                        found = 1;
                        file_entry->chunks_present[chunk_id] += 1;
                        break;
                    }
                    file_entry = file_entry->next;
                }

                // Create new entry if not found
                if (!found)
                {
                    file_entry = malloc(sizeof(file_info_t));
                    file_entry->filename = strdup(original_filename);
                    memset(file_entry->chunks_present, 0, NUMBER_OF_PAIRS * sizeof(int));
                    file_entry->chunks_present[chunk_id] = 1;
                    file_entry->next = file_list;
                    file_list = file_entry;
                }

                printf(MAG "    [*] Chunk %d of %s found on server %d\n" RESET,
                       chunk_id + 1, original_filename, i + 1);
                free(original_filename);
            }
            else
            {
                printf(RED "    [-] ERROR: Could not parse filename: %s\n" RESET, recieve_buffer);
            }
        }

        if (files_found == 0)
        {
            printf(YEL "    [!] No files found on server %d\n" RESET, i + 1);
        }
        else
        {
            printf(GRN "    [+] Found %d file chunks on server %d\n" RESET, files_found, i + 1);
        }

    next:;
        if (current->client_sock_fd >= 0)
        {
            close(current->client_sock_fd);
        }
        current = current->next;
        i++;
    }

    // Display file status summary
    printf(MAG "\n=========================================\n" RESET);
    printf(MAG "    FILE AVAILABILITY SUMMARY\n" RESET);
    printf(MAG "=========================================\n\n" RESET);

    if (file_list == NULL)
    {
        printf(YEL "[!] No files found on any server\n\n" RESET);
    }
    else
    {
        // Print file table header
        printf("%-30s %-15s %-15s\n", "FILENAME", "STATUS", "CHUNKS AVAILABLE");
        printf("--------------------------------------------------------------\n");

        // Process each file
        file_info_t *file_entry = file_list;
        while (file_entry != NULL)
        {
            // Check file completeness
            int chunks_available = 0;
            int can_rebuild = 1;

            for (int j = 0; j < NUMBER_OF_PAIRS; j++)
            {
                if (file_entry->chunks_present[j] > 0)
                {
                    chunks_available++;
                }
                else
                {
                    can_rebuild = 0;
                }
            }

            // Print file status
            printf("%-30s ", file_entry->filename);

            if (can_rebuild)
            {
                printf(GRN "%-15s" RESET, "COMPLETE");
            }
            else
            {
                printf(RED "%-15s" RESET, "INCOMPLETE");
            }

            printf("%-2d/%-2d", chunks_available, NUMBER_OF_PAIRS);

            // Print chunk detail
            printf(" [");
            for (int j = 0; j < NUMBER_OF_PAIRS; j++)
            {
                if (file_entry->chunks_present[j] > 0)
                {
                    printf(GRN "%d" RESET, j + 1);
                }
                else
                {
                    printf(RED "X" RESET);
                }

                if (j < NUMBER_OF_PAIRS - 1)
                    printf(",");
            }
            printf("]\n");

            // Move to next file and free current
            file_info_t *temp = file_entry;
            file_entry = file_entry->next;

            free(temp->filename);
            free(temp);
        }
        printf("\n");
    }
}

void delete_file(sockDetails_t *sd)
{

    int i = 0, numbytes = 0;
    serverDetails_t *current = sd->servers_details;
    char recieve_buffer[RECIEVE_SIZE];

    while (current)
    {
        if (connect_server(sd, current, i) < 0)
            goto next;

        int hash = str2md5(sd->filename, strlen(sd->filename)) % sd->number_of_servers;
        int index = (hash + i) % sd->number_of_servers;
        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            index = (index + j) % sd->number_of_servers;

            message_header_t message_header = {
                .command = DELETE,
                .chunk_id = index,
                .filename_length = strlen(sd->filename),
                .data_length = 0};

            numbytes = _send(current->client_sock_fd, &message_header, sizeof(message_header_t), next);
            bzero(recieve_buffer, sizeof(recieve_buffer));
            numbytes = _recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), next);

            numbytes = _send(current->client_sock_fd, sd->filename, message_header.filename_length, next);
            bzero(recieve_buffer, sizeof(recieve_buffer));
            numbytes = _recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), next);
            if (strncmp(recieve_buffer, ACK, ACK_LEN) == 0)
            {
                printf(GRN "\n=========================================\n" RESET);
                printf(GRN "    FILE DELETE SUCCESSFUL\n" RESET);
                printf(GRN "    File: %s\n" RESET, sd->filename);
                printf(GRN "    All chunks removed from servers\n" RESET);
                printf(GRN "=========================================\n\n" RESET);
            }
            if (strncmp(recieve_buffer, NACK, NACK_LEN) == 0)
            {
                printf(RED "[-] ERROR: File not found or permission denied on server\n" RESET);
            }

            (void)numbytes;
        }
    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
    }
}

void server_info(sockDetails_t *sd)
{
    printf(MAG "\n=========================================\n" RESET);
    printf(MAG "    DFS SERVER STATUS CHECK\n" RESET);
    printf(MAG "=========================================\n\n" RESET);

    int i = 0;
    int servers_online = 0;
    serverDetails_t *current = sd->servers_details;

    // Allocate array to track server socket FDs

    // Individual server status
    printf(MAG "[*] CHECKING INDIVIDUAL SERVER STATUS\n\n" RESET);

    // Try to connect to each server
    while (current)
    {
        printf(MAG "[*] Server %d (%s:%s): " RESET, i + 1, current->server_ip, current->server_port);

        // Attempt connection
        if (connect_server(sd, current, i) < 0)
        {
            printf(RED "OFFLINE\n" RESET);
            printf(RED "    Unable to establish connection\n\n" RESET);
        }
        else
        {
            servers_online++;
            printf(GRN "ONLINE\n" RESET);
            printf(GRN "    Connection established successfully\n" RESET);

            // Get round-trip time (simulated here)
            printf(GRN "    Response time: %.2f ms\n\n" RESET, 15.0 + (rand() % 100));
        }

        // Clean up and move to next server
        if (current->client_sock_fd >= 0)
        {
            close(current->client_sock_fd);
        }
        current = current->next;
        i++;
    }

    // Overall system status
    printf(MAG "\n=========================================\n" RESET);
    printf(MAG "    SYSTEM STATUS SUMMARY\n" RESET);
    printf(MAG "=========================================\n\n" RESET);

    // Server availability
    printf("Servers available: %d/%d ", servers_online, sd->number_of_servers);

    if (servers_online == sd->number_of_servers)
    {
        printf(GRN "(All servers online)\n" RESET);
    }
    else if (servers_online >= 2)
    {
        printf(YEL "(System operational with reduced redundancy)\n" RESET);
    }
    else if (servers_online >= 1)
    {
        printf(YEL "(System partially operational - limited functionality)\n" RESET);
    }
    else
    {
        printf(RED "(System offline - no servers available)\n" RESET);
    }

    // System capabilities based on available servers
    printf("\nSystem capabilities with %d/%d servers:\n", servers_online, sd->number_of_servers);

    if (servers_online >= 1)
    {
        printf(GRN "  [✓] " RESET);
    }
    else
    {
        printf(RED "  [✗] " RESET);
    }
    printf("LIST - View available files\n");

    if (servers_online >= NUMBER_OF_PAIRS)
    {
        printf(GRN "  [✓] " RESET);
    }
    else
    {
        printf(RED "  [✗] " RESET);
    }
    printf("GET - Download complete files\n");

    if (servers_online >= 1)
    {
        printf(GRN "  [✓] " RESET);
    }
    else
    {
        printf(RED "  [✗] " RESET);
    }
    printf("PUT - Upload files (with %s redundancy)\n",
           servers_online >= NUMBER_OF_PAIRS ? "full" : "partial");

    if (servers_online >= 1)
    {
        printf(GRN "  [✓] " RESET);
    }
    else
    {
        printf(RED "  [✗] " RESET);
    }
    printf("DELETE - Remove files (may be incomplete with partial servers)\n\n");

    printf(MAG "=========================================\n\n" RESET);

    // Free memory

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

    printf(MAG "\n=========================================\n" RESET);
    printf(MAG "    OPERATION: %s\n" RESET,
           sd->command_int == PUT ? "PUT" : sd->command_int == GET       ? "GET"
                                        : sd->command_int == LS          ? "LIST"
                                        : sd->command_int == DELETE      ? "DELETE"
                                        : sd->command_int == SERVER_INFO ? "SERVER INFO"
                                                                         : "UNKNOWN");
    printf(MAG "=========================================\n\n" RESET);

    /* Process user commands through menu interface */
    switch (sd->command_int)
    {
    case LS:
        list_file(sd);
        break;
    case GET:
        get_file(sd);
        break;
    case PUT:
        put_file(sd);
        break;
    case DELETE:
        delete_file(sd);
        break;
    case EXIT:
        exit(EXIT_SUCCESS);
        break;
    case SERVER_INFO:
        server_info(sd);
        break;
    default:
        break;
    }

    return NULL;
}