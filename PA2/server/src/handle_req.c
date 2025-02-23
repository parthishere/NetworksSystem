#include "handle_req.h"

#include <sys/sendfile.h>

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5
#define NSEC_PER_SEC 1000000000

#define DEFAULT_PORT "8080"
#define WWW_ROOT "./www"

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

int str_equals(char *a, char *b, int size)
{
    return (strncmp(a, b, size) == 0);
}

void parse_request_line(char *request, HttpHeader_t *header)
{

    if (request == NULL || header == NULL)
        return;

    // just get the header
    char *entire_req = request;
    char *lines[MAX_LINE_TO_TOKENIZE_IN_HTTP + 1];
    int line_number = -1;
    lines[++line_number] = strtok(entire_req, "\r\n");

    while (((lines[++line_number] = strtok(NULL, "\r\n")) != NULL) && (line_number < MAX_LINE_TO_TOKENIZE_IN_HTTP))
        ;

    line_number = -1;
    char *line = lines[0];
    while (line_number < MAX_LINE_TO_TOKENIZE_IN_HTTP && line != NULL && *line != '\0')
    {
        line = lines[++line_number];
        int word_number = 0;
        char *token = strtok(line, " ");
        if (word_number == 0 && token != NULL && strcmp(token, reqMethod[GET]) == 0)
        {
            header->method_str = reqMethod[GET];
            header->method = GET;
        }
        word_number++;
        while ((token = strtok(NULL, " ")) != NULL)
        {
            if (line_number == 0)
            {
                if (word_number == 1)
                {
                    header->uri_str = token;
                }

                else if (word_number == 2)
                {
                    if (strncmp(token, "HTTP/1.", 7) != 0)
                    {
                        header->http_version = ERROR_VERSION;
                        continue;
                    }
                    if (token[7] == '1')
                    {
                        header->http_version_str = http_type[HTTP1_1];
                        header->http_version = HTTP1_1;
                    }
                    else if (token[7] == '0')
                    {
                        header->http_version_str = http_type[HTTP1_0];
                        header->http_version = HTTP1_0;
                    }
                    else
                    {
                        header->http_version = ERROR_VERSION;
                    }
                }
            }
            if (line_number == 1 && word_number == 1)
            {
                header->hostname_str = token;
            }
            if (line_number == 2 && word_number == 1)
            {
                if (strncmp(token, "Keep-alive", sizeof(token)))
                {
                    header->connection_keep_alive = 1;
                }
                else if (strncmp(token, "Close", sizeof(token)))
                {
                    header->connection_close = 1;
                }
            }
            word_number++;
        }
    }
}

// GET / HTTP/1.1\r\nHost: example.com\r\nConnection: keep-alive\r\n\r\n
// GET /style.css HTTP/1.1\r\nHost: example.com\r\nConnection: keep-alive\r\n\r\n
// GET /script.js HTTP/1.1\r\nHost: example.com\r\nConnection: keep-alive\r\n\r\n

static contentType_t get_content_type(const char *ext)
{
    if (!ext)
        return TEXT_PLAIN;
    if (!strcmp(ext, "html"))
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

void build_and_send_header(HttpHeader_t *request_header, sockdetails_t *sd)
{
    char *filename, *return_request;
    int return_size;

    if(request_header == NULL) return;

    switch(request_header->parser_error){
        case PARSE_ERROR_INVALID_METHOD:
        case PARSE_ERROR_INVALID_URI:
        case PARSE_ERROR_MALFORMED:
        case PARSE_ERROR_BUFFER_OVERFLOW:
            send_(request_header, "SOMETHING WENT WRONG", VERSION_NOT_SUPPORTED, sd);
            return;
        default:
        break;
    }

    if (request_header->http_version == ERROR_VERSION || request_header->parser_error == PARSE_ERROR_INVALID_METHOD)
    {
        printf(RED "[-] (%d) WRONG HTTP VERSION\n" RESET, gettid());
        send_(request_header, "WRONG HTTP VERSION", VERSION_NOT_SUPPORTED, sd);
        return;
    }

    if (strstr(request_header->uri_str, "..") != NULL)
    {
        printf(RED "[-] (%d) Trying to access files above in directory\n" RESET, gettid());
        send_(request_header, "You are trying to access files above in directory\n", FORBIDDEN, sd);
        return;
    }

    filename = construct_filepath(request_header->uri_str);

    int fd = open(filename, O_RDONLY);

    size_t size;
    char *ext;
    char *content_type;
    int header_size;
    char file_buffer[RECIEVE_SIZE];
    if (request_header->method == GET)
    {
        if (fd < 0)
        {
            switch (errno)
            {
            case EACCES:
                printf(RED "[-] (%d) Access denied\n" RESET, gettid());
                send_(request_header, "Access denied", FORBIDDEN, sd);
                break;
            case ENOENT:
                printf(RED "[-] (%d) File not found\n" RESET, gettid());
                send_(request_header, "File not found", NOT_FOUND, sd);
                break;
            default:
                printf(RED "[-] (%d) Bad request\n" RESET, gettid());
                send_(request_header, "Bad request", BAD_REQ, sd);
            }
            // HTTP/1.0 400 Bad Request
            free(filename);
            perror(RED "[-] file open\n" RESET);
            return;
        }
        
        size = lseek(fd, 0, SEEK_END);
        lseek(fd, 0, SEEK_SET);
        
        ext = strrchr(filename, '.');
        content_type = contentType[get_content_type(ext ? ext + 1 : NULL)];
        
        if (strncmp(content_type, "ERROR", 5) == 0)
        {
            free(filename);
            printf(RED "[-] (%d) Bad Extension\n" RESET, gettid());
            send_(request_header, "Bad Extension", BAD_REQ, sd);
            return;
        }
        
        const char *connection_type = request_header->connection_keep_alive ? 
                                    "Connection: Keep-alive" : 
                                    "Connection: close";

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
        
        int numbytes = 0, temp_size = size;
        if ((numbytes = send(sd->client_sock_fd, return_request, header_size, MSG_NOSIGNAL)) < 0)
        {
            close(sd->client_sock_fd);
            close(fd);
            perror("Send header");
            return;
        }

        #if USE_SENDFILE
        /* Try sendfile first - zero copy */
        numbytes = sendfile(sd->client_sock_fd, fd, NULL, size);
        if (numbytes > 0)
        {
            printf(MAG"[+] (%d) Sent file %s, size: %d\n"RESET, gettid(), filename, numbytes);
            close(fd);
            return;
        }
        
        #else
        while ((numbytes = read(fd, file_buffer, RECIEVE_SIZE)) > 0 && temp_size > 0)
        {
            
            if (send(sd->client_sock_fd, file_buffer, numbytes, MSG_NOSIGNAL) < 0)
            {
                perror("Send file");
                close(sd->client_sock_fd);
                return;
            }
            printf(MAG"[+] (%d) Sent file %s ,size: %d\n\n"RESET, gettid(), filename, numbytes);
            temp_size -= numbytes;
        }
#endif

        free(filename);
        close(fd);
    }
    else if(request_header->method != POST || request_header->method != HEAD || request_header->method != PATCH)
    {
        printf(RED"[-] (%d) Method not allowed \n"RESET, gettid());
        send_(request_header, "Method not allowed !", METHOD_NOT_ALLOWED, sd);
        send(sd->client_sock_fd, return_request, return_size, 0);
    }
}

static int delta_t(struct timespec *start, struct timespec *stop,
                   struct timespec *delta)
{
    int dt_sec = stop->tv_sec - start->tv_sec;
    int dt_nsec = stop->tv_nsec - start->tv_nsec;

    delta->tv_sec = dt_sec;
    delta->tv_nsec = dt_nsec >= 0 ? dt_nsec : NSEC_PER_SEC + dt_nsec;
    if (dt_nsec < 0)
        delta->tv_sec--;

    return (delta->tv_nsec / NSEC_PER_SEC) + delta->tv_sec;
}

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
            // parse_request_line(recieved_buf, &header);
            parse_request_line2(recieved_buf, &header);
            
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