#include "handle_req.h"

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5
#define NSEC_PER_SEC 1000000000

char *http_type[supported_http_protocols] = {
    "HTTP/1.0",
    "HTTP/1.1"};

char *status_codes[total_status_codes] = {
    "200 OK",
    "400 Bad Request",
    "403 Forbidden",
    "404 Not Found",
    "405 Method Not Allowed",
    "505 HTTP Version Not Supported"};

char *reqMethod[total_req_methods] = {
    "GET",
    "POST",
    "DELETE",
    "PATCH"};

char *contentType[total_content_types] = {
    "text/html",
    "text/css",
    "text/plain",
    "application/javascript"
    "image/png",
    "image/gif",
    "image/png",
    "image/x-icon",
};

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

int parse_request_line(char *request, HttpHeader_t *header)
{

    // just get the header
    char *entire_req = request;
    char *lines[MAX_LINE_TO_TOKENIZE_IN_HTTP + 1];
    int index = -1;
    lines[++index] = strtok(entire_req, "\r\n");

    // printf("tokenized line: %s, header line %s\n", lines[index], entire_req);

    while (((lines[++index] = strtok(NULL, "\r\n")) != NULL) && (index < MAX_LINE_TO_TOKENIZE_IN_HTTP))
        ;

    index = -1;
    char *line = lines[0];
    while (index < MAX_LINE_TO_TOKENIZE_IN_HTTP && line != NULL && *line != '\0')
    {
        line = lines[++index];
        int token_index = 0;
        char *token = strtok(line, " ");
        if (token_index == 0)
        {
            // printf("tokenized token: %s\n", token);
            if (token != NULL && strcmp(token, reqMethod[GET]) == 0)
            {
                // printf("GET\n");
                header->method_str = reqMethod[GET];
                header->method = GET;
            }
        }
        token_index++;
        while ((token = strtok(NULL, " ")) != NULL)
        {
            if (index == 0)
            {
                if (token_index == 1)
                {
                    // filename
                    printf("Filename: %s\n", token);
                    header->uri_str = token;
                }

                if (token_index == 2)
                {
                    // http type
                    // printf("HTTP Version: %s\n", token);
                    if (strcmp(token, http_type[HTTP1_1]) == 0)
                    {
                        // printf("1.1\n");
                        header->http_version_str = http_type[HTTP1_1];
                        header->http_version = HTTP1_1;
                    }
                    else if (strcmp(token, http_type[HTTP1_0]) == 0)
                    {
                        // printf("1.1\n");
                        header->http_version_str = http_type[HTTP1_0];
                        header->http_version = HTTP1_0;
                    }
                    else
                    {
                        header->http_version = ERROR_VERSION;
                    }
                }
            }
            if (index == 1)
            {
                // line number 2,
                // Host: localhost:8888
                if (token_index == 1)
                {
                    header->hostname_str = token;
                    // printf("Hostname : %s\n", token);
                }
            }
            if (index == 2)
            {
                // Connection: Keep-alive
                
                if (token_index == 1 && strncmp(token, "Keep-alive", sizeof(token)))
                {
                    header->connection_keep_alive = 1;
                    // printf("what the fuck is connection %s\n", token);
                }
            }
            token_index++;
        }
    }

    // printf("Exiting\n\r");
    return 0;
}

void build_header(HttpHeader_t *request_header, char **return_request, int *return_size)
{
    char *filename;

    // if(request_header->)
    if (request_header->http_version == ERROR_VERSION)
    {
        send_(return_request, request_header, return_size, "WRONG HTTP VERSION", VERSION_NOT_SUPPORTED);
    }

    if (strstr(request_header->uri_str, "..") != NULL)
    {
        send_(return_request, request_header, return_size, "You are trying to access files above in directory", FORBIDDEN);
        return;
    }
    else if (strncmp(request_header->uri_str, "/", sizeof(request_header->uri_str)) == 0)
    {
        asprintf(&filename, "./www/index.html");
    }
    else
    {
        asprintf(&filename, "./www%s", request_header->uri_str);
    }

    FILE *file = fopen(filename, "rb");
    size_t size;
    char *file_buffer;
    char *ext;
    char *content_type;
    int header_size;
    if (request_header->method == GET)
    {
        if (file == NULL)
        {
            // HTTP/1.0 400 Bad Request
            perror("file open");
            send_(return_request, request_header, return_size, "Webpage do not exists", NOT_FOUND);
            free(filename);
            return;
        }

        fseeko(file, 0, SEEK_END);
        size = ftello(file);
        fseeko(file, 0, SEEK_SET);

        
        file_buffer = malloc(size + 1);

        if (fread(file_buffer, 1, size, file) != size)
        {
            printf("size mismatches \n");
            free(file_buffer);
            fclose(file);
            free(filename);
            // error
        }

        ext = strrchr(filename, '.');
        if (ext)
        {
            ext++;
            if (strcmp(ext, "html") == 0)
                content_type = contentType[TEXT_HTML];
            else if (strcmp(ext, "css") == 0)
                content_type = contentType[TEXT_CSS];
            else if (strcmp(ext, "txt") == 0)
                content_type = contentType[TEXT_PLAIN];
            else if (strcmp(ext, "js") == 0)
                content_type = contentType[APPLICATION_JAVASCRIPT];
            else if (strcmp(ext, "png") == 0)
                content_type = contentType[IMAGE_PNG];
            else if (strcmp(ext, "gif") == 0)
                content_type = contentType[IMAGE_GIF];
            else if (strcmp(ext, "jpg") == 0)
                content_type = contentType[IMAGE_JPG];
            else if (strcmp(ext, "ico") == 0)
                content_type = contentType[IMAGE_X_ICON];
            // ext error
        }

        header_size = asprintf(return_request, "%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n\r\n", request_header->http_version_str, status_codes[OK], content_type, size);

        if (header_size < 0)
        {
            free(file_buffer);
            fclose(file);
            free(filename);
            free(*return_request);
            // error
            return;
        }

        *return_request = realloc(*return_request, header_size + size);
        if (*return_request == NULL)
        {
            free(file_buffer);
            fclose(file);
            free(filename);
            free(*return_request);
            // error
            return;
        }
        memcpy(*return_request + header_size, file_buffer, size);
        *return_size = header_size + size;

        free(file_buffer);
        free(filename);
        fclose(file);
    }
    else
    {
        send_(return_request, request_header, return_size, "Method not allowed !", METHOD_NOT_ALLOWED);
    }
}



void build_and_send_header(HttpHeader_t *request_header, char **return_request, int *return_size, sockdetails_t *sd)
{
    char *filename;

    // if(request_header->)
    if (request_header->http_version == ERROR_VERSION)
    {
        send_(return_request, request_header, return_size, "WRONG HTTP VERSION", VERSION_NOT_SUPPORTED);
    }

    if (strstr(request_header->uri_str, "..") != NULL)
    {
        send_(return_request, request_header, return_size, "You are trying to access files above in directory", FORBIDDEN);
        return;
    }
    else if (strncmp(request_header->uri_str, "/", sizeof(request_header->uri_str)) == 0)
    {
        asprintf(&filename, "./www/index.html");
    }
    else
    {
        asprintf(&filename, "./www%s", request_header->uri_str);
    }

    FILE *file = fopen(filename, "rb");
    size_t size;
    char *ext;
    char *content_type;
    int header_size;
    char file_buffer[RECIEVE_SIZE];
    if (request_header->method == GET)
    {
        if (file == NULL)
        {
            // HTTP/1.0 400 Bad Request
            perror("file open");
            send_(return_request, request_header, return_size, "Webpage do not exists", NOT_FOUND);
            free(filename);
            return;
        }

        fseeko(file, 0, SEEK_END);
        size = ftello(file);
        fseeko(file, 0, SEEK_SET);

        

        ext = strrchr(filename, '.');
        if (ext)
        {
            ext++;
            if (strcmp(ext, "html") == 0)
                content_type = contentType[TEXT_HTML];
            else if (strcmp(ext, "css") == 0)
                content_type = contentType[TEXT_CSS];
            else if (strcmp(ext, "txt") == 0)
                content_type = contentType[TEXT_PLAIN];
            else if (strcmp(ext, "js") == 0)
                content_type = contentType[APPLICATION_JAVASCRIPT];
            else if (strcmp(ext, "png") == 0)
                content_type = contentType[IMAGE_PNG];
            else if (strcmp(ext, "gif") == 0)
                content_type = contentType[IMAGE_GIF];
            else if (strcmp(ext, "jpg") == 0)
                content_type = contentType[IMAGE_JPG];
            else if (strcmp(ext, "ico") == 0)
                content_type = contentType[IMAGE_X_ICON];
            // ext error
        }

        header_size = asprintf(return_request, "%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n\r\n", request_header->http_version_str, status_codes[OK], content_type, size);

        if (header_size < 0)
        {
            fclose(file);
            free(filename);
            free(*return_request);
            // error
            return;
        }
        int numbytes = 0, temp_size = size;
        if((numbytes = send(sd->client_sock_fd, *return_request, header_size, 0)) < 0){
            perror("Send");
            return;
        }
        printf("sent header, size %d\n", numbytes);
        
        
        
        while ((numbytes = fread(file_buffer, 1, RECIEVE_SIZE, file)) > 0 && temp_size > 0)
        {
            
            if(send(sd->client_sock_fd, file_buffer, numbytes, 0) < 0){
                perror("Send");
                return;
            }
            printf("sent file %d\n", numbytes);
            temp_size -= numbytes;

            // printf("size mismatches \n");
            // free(file_buffer);
            // fclose(file);
            // free(filename);
            // error
        }

    

        free(filename);
        fclose(file);
    }
    else
    {
        send_(return_request, request_header, return_size, "Method not allowed !", METHOD_NOT_ALLOWED);
    }
}


// request builder

// GET / HTTP/1.1\r\nPostman-Token: 23464349-ae43-4094-8db2-e58c7bbf77b1\r\nHost: localhost:8888

int delta_t(struct timespec *start, struct timespec *stop, struct timespec *delta_t)
{
    int dt_sec = stop->tv_sec - start->tv_sec;
    int dt_nsec = stop->tv_nsec - start->tv_nsec;

    if (dt_sec >= 0)
    {
        if (dt_nsec >= 0)
        {
            delta_t->tv_sec = dt_sec;
            delta_t->tv_nsec = dt_nsec;
        }
        else
        {
            delta_t->tv_sec = ((dt_sec == 0) ? 0 : (dt_sec - 1));
            delta_t->tv_nsec = NSEC_PER_SEC + dt_nsec;
        }
    }
    else
    {
        if (dt_nsec >= 0)
        {
            delta_t->tv_sec = dt_sec;
            delta_t->tv_nsec = dt_nsec;
        }
        else
        {
            delta_t->tv_sec = dt_sec - 1;
            delta_t->tv_nsec = NSEC_PER_SEC + dt_nsec;
        }
    }
    return (delta_t->tv_nsec / NSEC_PER_SEC) + delta_t->tv_sec;

}

void *handle_req(sockdetails_t sd)
{
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE];
    char *send_buf = NULL;
    HttpHeader_t header;
    struct timespec start_time = {0, 0};
    struct timespec end_time = {0, 0};
    struct timespec delta_time = {0, 0};
    clock_gettime(CLOCK_REALTIME, &start_time);
    clock_gettime(CLOCK_REALTIME, &end_time);
    
    // delta_t(&start_time, &end_time, &delta_time);

    // while (delta_time.tv_sec <= TIMEOUT_HTTP_SEC)
    // {
    // while (1)
    // {
        // we are in the child process now
        if ((numbytes = recv(sd.client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
        {
            perror("read");
            return NULL;
        }
        
        int return_size;
        memset(&header, 0, sizeof(HttpHeader_t));
        parse_request_line(recieved_buf, &header);

        build_and_send_header(&header, &send_buf, &return_size, &sd);

        // build_header(&header, &send_buf, &return_size);
        
        // if(header.connection_keep_alive == 1){
        //     clock_gettime(CLOCK_REALTIME, &start_time);
        // }
        
        // if ((numbytes = send(sd.client_sock_fd, send_buf, return_size, 0)) < 0)
        // {
        //     perror("write");
        //     return NULL;
        // }
        free(send_buf);
        
        
        clock_gettime(CLOCK_REALTIME, &end_time);
        
        int total_sec;
        
        if(total_sec = delta_t(&start_time, &end_time, &delta_time) >= TIMEOUT_HTTP_SEC){
            printf("Timeout !!!\n", total_sec);
            // break;
        }

    // }
    close(sd.client_sock_fd);

    return NULL;
}