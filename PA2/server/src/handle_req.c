#include "handle_req.h"

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5

// char *header200 = "HTTP/1.0 200 OK\nServer:  v0.1\nContent-Type: text/html\n\n";
// char *header400 = "HTTP/1.0 400 Bad Request\nServer:  v0.1\nContent-Type: text/html\n\n";
// char *header404 = "HTTP/1.0 404 Not Found\nServer:  v0.1\nContent-Type: text/html\n\n";


typedef enum
{
    HTTP1_0,
    HTTP1_1,
    supported_http_protocols
} httpType_t;

char *http_type[supported_http_protocols] = {
    "HTTP/1.0",
    "HTTP/1.1"};

typedef enum
{
    OK,
    BAD_REQ,
    FORBIDDEN,
    NOT_FOUND,
    METHOD_NOT_ALLOWED,
    VERSION_NOT_SUPPORTED,
    total_status_codes,
} statusCode_t;

char *status_codes[total_status_codes] = {
    "200 OK",
    "400 Bad Request",
    "403 Forbidden",
    "404 Not Found",
    "405 Method Not Allowed",
    "505 HTTP Version Not Supported"};

typedef enum
{
    GET,
    POST,
    PUT,
    DELETE,
    PATCH,
    total_req_methods,
} method_t;

char *reqMethod[total_req_methods] = {
    "GET",
    "POST",
    "DELETE",
    "PATCH"};

typedef enum
{
    TEXT_HTML,
    TEXT_CSS,
    TEXT_PLAIN,
    APPLICATION_JAVASCRIPT,
    IMAGE_PNG,
    IMAGE_GIF,
    IMAGE_JPG,
    IMAGE_X_ICON,
    total_content_types
} contentType_t;

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
 
typedef struct req_header_s
{
    httpType_t http_version;
    char *http_version_str;

    char *uri_str;

    contentType_t content_type;
    char *content_type_str;

    method_t *method;
    char *method_str;

    statusCode_t *status_code;
    char *status_code_str;

} HttpHeader_t;

// \r\n
// \r\n\r\n



typedef struct filedata_s
{
    char *content;
    int size;
} filesize_t;

// command parser
int get_http_thing_to_do(HttpHeader_t *header)
{
}

int parse_request_line(char *request, HttpHeader_t *header)
{

    // just get the header
    char *entire_req = request;
    char *lines[MAX_LINE_TO_TOKENIZE_IN_HTTP + 1];
    int index = -1;
    lines[++index] = strtok(entire_req, "\r\n");

    // printf("tokenized line: %s, header line %s\n", lines[index], entire_req);

    while (((lines[++index] = strtok(NULL, "\r\n")) != NULL) && (index < MAX_LINE_TO_TOKENIZE_IN_HTTP));

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
                    // printf("Filename: %s\n", token);
                    header->uri_str = token;
                }

                if (token_index == 2)
                {
                    // http type
                    // printf("HTTP Version: %s\n", token);
                    if (strcmp(token, http_type[HTTP1_1])==0)
                    {
                        // printf("1.1\n");
                        header->http_version_str = http_type[HTTP1_1];
                        header->http_version = HTTP1_1;
                    }
                }
            }
            if (index == 1)
            {
                // line number 2,
                // Host: localhost:8888
                if (token_index == 1)
                {
                    // printf("Hostname : %s\n", token);
                }
            }
            if (index == 2)
            {
                // Connection: Keep-alive
                if (token_index == 1)
                {
                    // printf("what the fuck is connection %s\n", token);
                }
            }
            token_index++;
        }
    }

    // printf("Exiting\n\r");
    return 0;
}

filesize_t *get_file_data()
{
    return NULL;
}

void build_header(HttpHeader_t *request_header, char **return_request)
{
    // if(request_header->method == GET){
    //     // request_header->uri_str;
    // }
    char *filename = "./www/index.html";
    // char *filename = "/home/parth/Work/All_data/university/Network\ System/Assignments/PA2/server/www/index.html";
    size_t current_size = 1;
    struct stat *st;
    FILE *file = fopen(filename, "rb");
    size_t size;
    char * file_buffer;
    char *ext;
    char *content_type;
    int header_size;
    if (request_header->method == GET)
    {
        if (file == NULL)
        {
            // HTTP/1.0 400 Bad Request
            perror("file open");
            asprintf(return_request, "%s %s\r\n", request_header->http_version_str, status_codes[BAD_REQ]);
            return;
        }

        fseeko(file, 0, SEEK_END);
        size = ftello(file);
        fseeko(file, 0, SEEK_SET);

        file_buffer = malloc(size + 1);

        fread(file_buffer, size, 1, file);

        ext = strrchr(filename, '.');
        ext++;

        content_type = contentType[TEXT_HTML];
        if (strncmp(ext, "html", sizeof(ext)) == 0)
        {
            
        }

        header_size = asprintf(return_request, "%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n\r\n%s", request_header->http_version_str, status_codes[OK], content_type, size, file_buffer);

        if (strncmp(ext, "txt", sizeof(ext)) == 0)
            ;
        if (strncmp(ext, "css", sizeof(ext)) == 0)
            ;

        
    }
}

// request builder

// GET / HTTP/1.1\r\nPostman-Token: 23464349-ae43-4094-8db2-e58c7bbf77b1\r\nHost: localhost:8888

void *handle_req(void *args)
{
    int numbytes;
    char recieved_buf[TRANSMIT_SIZE];
    char *send_buf = NULL;
    sockdetails_t *sd = (sockdetails_t *)args;
    HttpHeader_t header;
    // while (1)
    // {
        

        // we are in the child process now
        if ((numbytes = recv(sd->client_sock_fd, recieved_buf, sizeof(recieved_buf), 0)) < 0)
        {
            perror("read");
            exit(1);
        }

        printf("recieved header :\n%s\n ---- \n\n", recieved_buf);
 
        parse_request_line(recieved_buf, &header);
        build_header(&header, &send_buf);
        if(send_buf == NULL) return NULL;
        printf("sending heade: \n%s\n --- \n\n", send_buf);

        size_t send_len = strlen(send_buf);
        if ((numbytes = send(sd->client_sock_fd, send_buf, send_len, 0)) < 0)
        {
            perror("write");
            return NULL;
        }
        free(send_buf);
        close(sd->client_sock_fd);
    // }
    return NULL;
}