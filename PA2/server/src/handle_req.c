#include "handle_req.h"

#include <sys/sendfile.h>

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5
#define NSEC_PER_SEC 1000000000

#define MAX_HEADER_LINES 10

#define MAX_URI_LENGTH 2048
#define MAX_MIME_LENGTH 64
#define DEFAULT_PORT "8080"
#define WWW_ROOT "./www"
#define USE_SENDFILE 1

char *http_type[supported_http_protocols + 1] = {
    "HTTP/1.0",
    "HTTP/1.1"};

char *status_codes[total_status_codes + 1] = {
    "200 OK",
    "400 Bad Request",
    "403 Forbidden",
    "404 Not Found",
    "405 Method Not Allowed",
    "505 HTTP Version Not Supported"};

char *reqMethod[total_req_methods + 1] = {
    "GET",
    "POST",
    "DELETE",
    "PATCH"};

char *contentType[total_content_types + 1] = {
    "text/html",
    "text/css",
    "text/plain",
    "application/javascript",
    "image/png",
    "image/gif",
    "image/jpg",
    "image/x-icon",
    "ERROR"};

typedef struct filedata_s
{
    char *content;
    int size;
} filesize_t;

void send_(char **return_request, HttpHeader_t *request_header, int *return_size, char *message, statusCode_t code)
{
    *return_size = asprintf(return_request,
                            "%s %s\r\n"
                            "Content-Type: text/plain\r\n"
                            "\r\n"
                            "%s",
                            request_header->http_version_str,
                            status_codes[code],
                            message);
}

int str_equals(char *a, char *b, int size)
{
    return (strncmp(a, b, size) == 0);
}

void parse_request_line(char *request, HttpHeader_t *header)
{

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
            if (line_number == 2 && word_number == 1 && strncmp(token, "Keep-alive", sizeof(token)))
            {
                header->connection_keep_alive = 1;
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

    if (request_header->http_version == ERROR_VERSION)
    {
        send_(&return_request, request_header, &return_size, "WRONG HTTP VERSION", VERSION_NOT_SUPPORTED);
        send(sd->client_sock_fd, return_request, return_size, 0);
    }

    if (strstr(request_header->uri_str, "..") != NULL)
    {
        send_(&return_request, request_header, &return_size, "You are trying to access files above in directory", FORBIDDEN);
        send(sd->client_sock_fd, return_request, return_size, 0);
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
            // HTTP/1.0 400 Bad Request
            perror("file open");
            send_(&return_request, request_header, &return_size, "Webpage do not exists", NOT_FOUND);
            send(sd->client_sock_fd, return_request, return_size, 0);
            free(filename);
            return;
        }

        size = lseek(fd, 0, SEEK_END);
        lseek(fd, 0, SEEK_SET);

        ext = strrchr(filename, '.');
        content_type = contentType[get_content_type(ext ? ext + 1 : NULL)];

        if (strncmp(content_type, "ERROR", 5) == 0)
        {
            printf("EXT %s\n", ext);
            send_(&return_request, request_header, &return_size, "not working", 2);
            send(sd->client_sock_fd, return_request, return_size, 0);
            return;
        }

        header_size = asprintf(&return_request, "%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n\r\n", request_header->http_version_str, status_codes[OK], content_type, size);

        if (header_size < 0)
        {
            close(fd);
            free(filename);

            return;
        }

        int numbytes = 0, temp_size = size;
        if ((numbytes = send(sd->client_sock_fd, return_request, header_size, 0)) < 0)
        {
            close(fd);
            perror("Send");
            return;
        }
        // printf("sent header, size %d\n", numbytes);

#if USE_SENDFILE
        /* Try sendfile first - zero copy */
        numbytes = sendfile(sd->client_sock_fd, fd, NULL, size);
        if (numbytes > 0)
        {
            printf("[+] Sent file %s(%d)\n", filename, numbytes);
            close(fd);
            return;
        }

#else
        while ((numbytes = read(fd, file_buffer, RECIEVE_SIZE)) > 0 && temp_size > 0)
        {

            if (send(sd->client_sock_fd, file_buffer, numbytes, 0) < 0)
            {
                perror("Send");
                return;
            }
            printf("sent file %d\n", numbytes);
            temp_size -= numbytes;
        }
#endif

        free(filename);
        close(fd);
    }
    else
    {
        send_(&return_request, request_header, &return_size, "Method not allowed !", METHOD_NOT_ALLOWED);
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
    
    fd_set readfds, writefds, exceptfds;
    
    while (1)
    {

        FD_ZERO(&readfds);
        FD_SET(sd.client_sock_fd, &readfds);
        struct timeval timeout = {10, 0};
        // aria2
        // hping3
        // nc
        // sendfile - 0 copy
        // sendmessage

        int select_status = select(sd.client_sock_fd + 1, &readfds, NULL, NULL, &timeout);
        if (select_status < 0)
        {
            perror("select error");
            break;
        }

        if (select_status == 0)
        {
            printf("Connection timed out\n");
            break;
        }

        if (FD_ISSET(sd.client_sock_fd, &readfds))
        {
            if ((numbytes = recv(sd.client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
            {
                perror("read");
                return NULL;
            }

            memset(&header, 0, sizeof(HttpHeader_t));
            parse_request_line(recieved_buf, &header);

            build_and_send_header(&header, &sd);
        }
        // something was ready torread
    }
    // delta_t(&start_time, &end_time, &delta_time);

    // while (delta_time.tv_sec <= TIMEOUT_HTTP_SEC)
    // {
    // while (1)
    // {
    // we are in the child process now

    // clock_gettime(CLOCK_REALTIME, &end_time);

    // int total_sec;

    // if (total_sec = delta_t(&start_time, &end_time, &delta_time) >= TIMEOUT_HTTP_SEC)
    // {
    //     printf("Timeout !!!\n");
    //     // break;
    // }
    printf("whoooooo timeout !!!\n");
    close(sd.client_sock_fd);

    return NULL;
}