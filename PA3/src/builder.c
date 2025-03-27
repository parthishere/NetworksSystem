/**
 * @file builder.c
 * @brief HTTP Response Builder Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements HTTP response generation and file serving functionality.
 * It handles:
 * - Response header construction
 * - Content type detection
 * - File transmission (with zero-copy support)
 * - Error response generation
 * - Security validations
 */

#include "builder.h"

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5

static char *http_type[supported_http_protocols + 1] = {
    "HTTP/1.0",
    "HTTP/1.1"};

static char *status_codes[total_status_codes + 1] = {
    "200 OK",
    "400 Bad Request",
    "403 Forbidden",
    "404 Not Found",
    "405 Method Not Allowed",
    "505 HTTP Version Not Supported"};

static char *reqMethod[total_req_methods + 1] = {
    "GET",
    "POST",
    "DELETE",
    "PATCH"};

static char *contentType[total_content_types + 1] = {
    "text/html",
    "text/css",
    "text/plain",
    "application/javascript",
    "image/png",
    "image/gif",
    "image/jpg",
    "image/x-icon",
    "ERROR"};

/**
 * @function send_
 * @brief Sends a simple HTTP response with status code and message
 *
 * @param request_header Original request header
 * @param message Response message
 * @param code HTTP status code
 * @param sd Socket details structure
 *
 * Used for sending error responses and simple text messages.
 */
void send_(HttpHeader_t *request_header, char *message, statusCode_t code, sockdetails_t *sd)
{
    char *return_request;
    int return_size;

    return_size = asprintf(&return_request,
                           "%s %s\r\n"
                           "Content-Type: text/plain\r\n"
                           "\r\n"
                           "%s",
                           request_header->http_version_str,
                           status_codes[code],
                           message);

    send(sd->client_sock_fd, return_request, return_size, 0);
}

// GET / HTTP/1.1\r\nHost: example.com\r\nConnection: keep-alive\r\n\r\n
// GET /style.css HTTP/1.1\r\nHost: example.com\r\nConnection: keep-alive\r\n\r\n
// GET /script.js HTTP/1.1\r\nHost: example.com\r\nConnection: keep-alive\r\n\r\n

/**
 * @function get_content_type
 * @brief Determines MIME type based on file extension
 *
 * @param ext File extension (without dot)
 * @return contentType_t Corresponding MIME type enum
 *
 * Maps common file extensions to their appropriate MIME types.
 * Returns TEXT_PLAIN for unknown extensions.
 */
static contentType_t get_content_type(const char *ext)
{
    if (!ext)
        return TEXT_PLAIN;
    if (!strcmp(ext, "html") || !strcmp(ext, "htm"))
        return TEXT_HTML;
    if (!strcmp(ext, "css"))
        return TEXT_CSS;
    if (!strcmp(ext, "txt"))
        return TEXT_PLAIN;
    if (!strcmp(ext, "js"))
        return APPLICATION_JAVASCRIPT;
    if (!strcmp(ext, "png"))
        return IMAGE_PNG;
    if (!strcmp(ext, "gif"))
        return IMAGE_GIF;
    if (!strcmp(ext, "jpg"))
        return IMAGE_JPG;
    if (!strncmp(ext, "ico", 3))
        return IMAGE_X_ICON;
    else
        return total_content_types;
}

/**
 * @function construct_filepath
 * @brief Constructs full filesystem path from URI
 *
 * @param uri Request URI
 * @return char* Constructed filesystem path
 *
 * Handles root path ("/") by returning index.html
 * Otherwise prepends ROOT_DIR to the URI
 */
static char *construct_filepath(const char *uri)
{
    char *filename;
    if (!strcmp(uri, "/"))
    {
        asprintf(&filename, "%s/index.html", ROOT_DIR);
    }
    else
    {
        asprintf(&filename, "%s%s", ROOT_DIR, uri);
    }
    return filename;
}

/**
 * @function try_alternative_html
 * @brief Attempts to find alternative HTML file extensions
 *
 * @param original_filename Original filename to try alternatives for
 * @param final_filename Pointer to store successful filename
 * @return int File descriptor or -1 on failure
 *
 * Tries .htm when .html fails and vice versa
 * Used to handle common HTML extension variations
 */
int try_alternative_html(const char *original_filename, char **final_filename)
{
    if (!original_filename || !final_filename)
        return -1;

    int fd = -1;
    size_t len = strlen(original_filename);

    // If ends with .html, try .htm
    if (len > 5 && strcmp(original_filename + len - 5, ".html") == 0)
    {
        *final_filename = strdup(original_filename);
        if (!*final_filename)
            return -1;

        (*final_filename)[len - 1] = '\0'; // Remove 'l' to make it .htm
        fd = open(*final_filename, O_RDONLY);
        if (fd < 0)
        {
            free(*final_filename);
            *final_filename = NULL;
        }
    }
    // If ends with .htm, try .html
    else if (len > 4 && strcmp(original_filename + len - 4, ".htm") == 0)
    {
        if (asprintf(final_filename, "%sl", original_filename) < 0)
        {
            return -1;
        }
        fd = open(*final_filename, O_RDONLY);
        if (fd < 0)
        {
            free(*final_filename);
            *final_filename = NULL;
        }
    }

    return fd;
}

/**
 * @function handle_file_request
 * @brief Handles file opening and error conditions
 *
 * @param request_header HTTP request header
 * @param sd Socket details
 * @param filename Filename to open
 * @param final_filename Pointer to store actual filename used
 * @return int File descriptor or -1 on error
 *
 * Handles:
 * - File access permissions
 * - File existence
 * - Alternative HTML extensions
 * - Error responses
 */
int handle_file_request(HttpHeader_t *request_header, sockdetails_t *sd,
                        const char *filename, char **final_filename)
{
    int fd = open(filename, O_RDONLY);
    *final_filename = strdup(filename); // Store original filename

    if (fd < 0)
    {
        const char *ext = strrchr(filename, '.');

        switch (errno)
        {
        case EACCES:
            printf(RED "[-] (%d) Access denied\n" RESET, gettid());
            send_(request_header, "Access denied", FORBIDDEN, sd);
            break;

        case ENOENT:
            // Only try alternative extensions for HTML files
            if (ext && (*final_filename != NULL) &&
                (strcmp(ext, ".html") == 0 || strcmp(ext, ".htm") == 0))
            {

                free(*final_filename); // Free original filename
                fd = try_alternative_html(filename, final_filename);

                if (fd < 0)
                {
                    printf(RED "[-] (%d) File not found (tried both .html and .htm)\n" RESET, gettid());
                    send_(request_header, "File not found", NOT_FOUND, sd);
                }
                else
                {
                    printf(GRN "[+] (%d) Found alternative HTML file\n" RESET, gettid());
                    return fd; // Successfully found alternative
                }
            }
            else
            {
                printf(RED "[-] (%d) File not found\n" RESET, gettid());
                send_(request_header, "File not found", NOT_FOUND, sd);
            }
            break;

        default:
            printf(RED "[-] (%d) Bad request\n" RESET, gettid());
            send_(request_header, "Bad request", BAD_REQ, sd);
            break;
        }

        free(*final_filename);
        *final_filename = NULL;
        return -1;
    }

    return fd;
}

/**
 * @function build_and_send_header
 * @brief Main function for building and sending HTTP responses
 *
 * @param request_header HTTP request header
 * @param sd Socket details structure
 *
 * This function:
 * 1. Validates request parameters
 * 2. Handles security checks
 * 3. Processes file requests
 * 4. Builds appropriate headers
 * 5. Sends response using optimal method
 *
 * Features:
 * - Zero-copy file transfer using sendfile() when available
 * - Fallback to buffered transfer
 * - Keep-alive connection support
 * - Content type detection
 * - Security validation
 */
void build_and_send_header(HttpHeader_t *request_header, sockdetails_t *sd)
{
    char *filename, *final_filename, *return_request;
    int return_size;

    if (request_header == NULL)
        return;

    
    if((request_header->parser_error & OK) == 0){
        printf(RED "[-] (%d) SOMETHING WENT WRONG\n" RESET, gettid());
        send_(request_header, "SOMETHING WENT WRONG", request_header->parser_error, sd);
        return;
    }
    

    /* Construct and validate filepath */
    filename = construct_filepath(request_header->uri_str);
    if (!filename)
    {
        send_(request_header, "Internal server error", FORBIDDEN, sd);
        return;
    }

    /* Handle file opening and errors */
    int fd = handle_file_request(request_header, sd, filename, &final_filename);
    if (fd < 0)
    {
        free(filename);
        return;
    }

    size_t size;
    char *ext;
    char *content_type;
    int header_size;
    char file_buffer[RECIEVE_SIZE];

    /* Process GET requests */
    if (request_header->method == GET)
    {
        /* Determine content type */
        ext = strrchr(filename, '.');
        content_type = contentType[get_content_type(ext ? ext + 1 : NULL)];

        if (strncmp(content_type, "ERROR", 5) == 0)
        {
            free(filename);
            printf(RED "[-] (%d) Bad Extension\n" RESET, gettid());
            send_(request_header, "Bad Extension", BAD_REQ, sd);
            return;
        }

        /* Get file size */
        size = lseek(fd, 0, SEEK_END);
        lseek(fd, 0, SEEK_SET);

        /* Build response header */
        const char *connection_type = request_header->connection_keep_alive ? "Connection: Keep-alive" : "Connection: close";

        /* Handle header construction errors */
        header_size = asprintf(&return_request, "%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n%s\r\n\r\n", request_header->http_version_str, status_codes[OK], content_type, size, connection_type);

        if (header_size < 0)
        {
            close(fd);
            free(filename);
            printf(RED "[-] (%d) Bad request\n" RESET, gettid());
            send_(request_header, "Bad request", BAD_REQ, sd);
            if (return_request != NULL)
                free(return_request);
            return;
        }

        /* Send response header */
        int numbytes = 0, temp_size = size;
        if ((numbytes = send(sd->client_sock_fd, return_request, header_size, MSG_NOSIGNAL)) < 0)
        {
            close(sd->client_sock_fd);
            close(fd);
            perror("Send header");
            return;
        }

#if USE_SENDFILE
        /* Try sendfile - zero copy */
        numbytes = sendfile(sd->client_sock_fd, fd, NULL, size);
        if (numbytes > 0)
        {
            printf(MAG "[+] (%d) Sent file %s, size: %d\n" RESET, gettid(), filename, numbytes);
            close(fd);
            return;
        }

#else
        /* Buffered file transfer */
        while ((numbytes = read(fd, file_buffer, RECIEVE_SIZE)) > 0 && temp_size > 0)
        {

            if (send(sd->client_sock_fd, file_buffer, numbytes, MSG_NOSIGNAL) < 0)
            {
                perror("Send file");
                close(sd->client_sock_fd);
                return;
            }
            printf(MAG "[+] (%d) Sent file %s ,size: %d\n\n" RESET, gettid(), filename, numbytes);
            temp_size -= numbytes;
        }
#endif

        free(filename);
        close(fd);
    }
    /* Handle unsupported methods */
    else
    {
        printf(RED "[-] (%d) Method not allowed \n" RESET, gettid());
        send_(request_header, "Method not allowed !", METHOD_NOT_ALLOWED, sd);
        send(sd->client_sock_fd, return_request, return_size, 0);
    }
}

void build_for_og_server(){
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);
    
}