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



int connect_server(sockDetails_t *sd, serverDetails_t *current, int server_index)
{
    struct addrinfo hints, *temp;

    int status;
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
        fprintf(stderr, RED "getaddrinfo: %s\n" RESET, gai_strerror(status)); // this will print error to stderr fd
        return -1;                                                            // exit if there is an error
    }

    for (temp = sd->connect_to_info; temp != NULL; temp = temp->ai_next)
    {
        if ((current->client_sock_fd = socket(temp->ai_family, temp->ai_socktype, temp->ai_protocol)) < 0)
        {
            perror(RED "server: socket");
            return -1;
        }

        if ((connect(current->client_sock_fd, temp->ai_addr, temp->ai_addrlen)) < 0)
        {
            fprintf(stderr, RED "\n[-] (%d) connect failed for server %d\n" RESET, gettid(), errno);
            close(current->client_sock_fd);
            return -1;
        }

        break;
    }

    if (temp == NULL)
    {
        fprintf(stderr, RED "\n[-] (%d) temp = NULL, connection failed %d\n" RESET, gettid(), errno);
        return -1;
    }

    sd->server_sock_fds[server_index] = current->client_sock_fd;
    sd->number_of_available_servers++;

    char s[INET6_ADDRSTRLEN];
    inet_ntop(temp->ai_family, get_in_addr((struct sockaddr *)temp->ai_addr), s, sizeof s);
    printf(GRN "[+] (%d) Connection established to server: %s\n"
               "[+] (%d) Server IP address: %s:%s\n" RESET,
           gettid(), current->server_ip, gettid(), s,
           current->server_port);
    return 1;
}


void connect_and_put_chunks(sockDetails_t *sd, char *chunks[], int chunk_sizes[], int hash)
{
    serverDetails_t *current = sd->servers_details;
    int i = 0;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    int chunks_stored[NUMBER_OF_PAIRS];
    memset(chunks_stored, 0, NUMBER_OF_PAIRS * 4);
    while (current)
    {

        if (connect_server(sd, current, i) < 0)
            goto next;

        int index = (((i - hash) < 0) ? sd->number_of_servers : (i - hash));

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

    next:;
        close(current->client_sock_fd);
        i++;
        current = current->next;
    }

    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
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
    int i = 0, numbytes = 0;
    serverDetails_t *current = sd->servers_details;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    int chunks_stored[NUMBER_OF_PAIRS];
    int chunks_stored_sizes[NUMBER_OF_PAIRS];
    char *chunks[NUMBER_OF_PAIRS];
    char recieve_buffer[RECIEVE_SIZE];

    memset(chunks, 0, sizeof(chunks));
    memset(chunks_stored, 0, sizeof(chunks_stored));

    while (current)
    {
        if (connect_server(sd, current, i) < 0)
            goto next;

        int index = (((i - hash) < 0) ? sd->number_of_servers : (i - hash));

        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            index = (index + j) % sd->number_of_servers;

            if (chunks_stored[index] >= 1)
                continue;

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
                if ((numbytes = recv(current->client_sock_fd, recieve_buffer, RECIEVE_SIZE, 0)) < 0)
                {
                    printf("recv failed \n");
                    goto next;
                }
                memcpy(&chunks[index][total_bytes], recieve_buffer, numbytes);
                total_bytes += numbytes;
            }

            numbytes = send(current->client_sock_fd, ACK, 7, 0);
            printf("recieved chunk bitch from server %d - chunk %d\n", i, index);

            memset(recieve_buffer, 0, sizeof(recieve_buffer));
            numbytes = recv(current->client_sock_fd, recieve_buffer, sizeof(recieve_buffer), 0); // ack

            chunks_stored[index]++;
            chunks_stored_sizes[index] = recv_message_header->data_length;
            free(recv_message_header);
        }

    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
    }

    FILE *fs = fopen(sd->filename, "wb");

    for (int i = 0; i < NUMBER_OF_PAIRS; i++)
    {
        if (chunks[i] == 0 || chunks_stored_sizes[i] <= 0 || chunks_stored[i] <= 0)
        {
            printf("Chunk not found !\n\r");
            fclose(fs);
            exit(EXIT_FAILURE);
        }
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

    fseek(fs, 0L, SEEK_END);
    int size = ftell(fs);
    fseek(fs, 0, SEEK_SET);

    int chunk_sizes[NUMBER_OF_PAIRS];
    char *chunks[NUMBER_OF_PAIRS];
    int total_chunk_size_until_now = 0;

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

        printf("Size of chunk %d is %d for filename %s\n", i, chunk_size, sd->filename);
    }

    connect_and_put_chunks(sd, chunks, chunk_sizes, hash % sd->number_of_servers);
}

void get_file(sockDetails_t *sd)
{
    get_file_chunks_and_join(sd, str2md5(sd->filename, strlen(sd->filename)) % sd->number_of_servers);
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

    int i = 0, numbytes = 0;
    serverDetails_t *current = sd->servers_details;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    char recieve_buffer[RECIEVE_SIZE];
    int chunks_stored[NUMBER_OF_PAIRS];

    while (current)
    {

        if (connect_server(sd, current, i) < 0)
            goto next;

        message_header_t message_header = {
            .command = LS,
            .chunk_id = 0,
            .filename_length = 0,
            .data_length = 0};
        numbytes = send(current->client_sock_fd, &message_header, sizeof(message_header), 0);

        while (1)
        {
            memset(&message_header, 0, sizeof(message_header_t));
            numbytes = recv(current->client_sock_fd, &message_header, sizeof(message_header_t), 0);
            if (numbytes <= 0)
                break;
            // printf("Numbytes rescieved %d filelength %d from server %d \n", numbytes, message_header.filename_length, i);

            memcpy(recieve_buffer, (void *)&message_header, numbytes);
            if (strncmp(recieve_buffer, ACK, 7) == 0)
                break;
            if (strncmp(recieve_buffer, NACK, 8) == 0)
                break;

            bzero(recieve_buffer, sizeof(recieve_buffer));
            numbytes = recv(current->client_sock_fd, recieve_buffer, message_header.filename_length, 0);
            if (numbytes <= 0)
                break;
            if (strncmp(recieve_buffer, ACK, 7) == 0)
                break;
            if (strncmp(recieve_buffer, NACK, 8) == 0)
                break;
            char *original_filename = NULL;
            int chunk_id = -1;
            if (parse_server_filename(recieve_buffer, &original_filename, &chunk_id) == 0)
            {
                printf("Extracted: Original file = %s, Chunk ID = %d\n", original_filename, chunk_id);
                // Use original_filename and chunk_id as needed
                free(original_filename); // Don't forget to free when done
                if (chunk_id >= NUMBER_OF_PAIRS)
                {
                    printf("Failed to parse chunk id\n");
                    break;
                }
                chunks_stored[chunk_id]++;
            }
            else
            {
                printf("Failed to parse filename\n");
            }
        }

        for (int i = 0; i < NUMBER_OF_PAIRS; i++)
        {
            if (chunks_stored[i] <= 0)
            {
                printf("INCOMPLETE PAIR\n");
            }
        }

    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
    }
}

void delete_file(sockDetails_t *sd)
{

    int i = 0, numbytes = 0;
    serverDetails_t *current = sd->servers_details;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    char recieve_buffer[RECIEVE_SIZE];

    while (current)
    {
        if (connect_server(sd, current, i) < 0)
            goto next;

        int hash = str2md5(sd->filename, strlen(sd->filename)) % sd->number_of_servers;
        int index = (((i - hash) < 0) ? sd->number_of_servers : (i - hash));
        for (int j = 0; j < MAX_NUMBER_OF_CHUNKS_PER_SERVER; j++)
        {
            index = (index + j) % sd->number_of_servers;

            message_header_t message_header = {
                .command = DELETE,
                .chunk_id = index,
                .filename_length = strlen(sd->filename),
                .data_length = 0};
            numbytes = send(current->client_sock_fd, &message_header, sizeof(message_header), 0);

            bzero(recieve_buffer, sizeof(recieve_buffer));
            numbytes = recv(current->client_sock_fd, recieve_buffer, message_header.filename_length, 0);
            if (numbytes <= 0)
                break;
            if (strncmp(recieve_buffer, ACK, 7) == 0)
                break;
            if (strncmp(recieve_buffer, NACK, 8) == 0)
                break;
        }
    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
    }
}

void server_info(sockDetails_t *sd)
{

    int i = 0;
    serverDetails_t *current = sd->servers_details;
    sd->server_sock_fds = malloc(sd->number_of_servers * sizeof(int)); // free it afterwards
    while (current)
    {
        if (connect_server(sd, current, i) < 0)
            goto next;
    next:;
        close(current->client_sock_fd);
        current = current->next;
        i++;
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