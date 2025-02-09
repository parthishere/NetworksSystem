#include "handle_req.h"

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5

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

// \r\n
// \r\n\r\n

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
    while (((lines[++index] = strtok(NULL, "\r\n")) != NULL) && (index < MAX_LINE_TO_TOKENIZE_IN_HTTP))
    {
        // printf("tokenized line: %d) %s\n",index, lines[index]);
    }
    index = -1;
    char *line;
    while (index < MAX_LINE_TO_TOKENIZE_IN_HTTP && line != NULL && *line != '\0')
    {
        line = lines[++index];
        int token_index = 0;
        char *token = strtok(line, " ");
        if (token_index == 0)
        {
            // printf("tokenized token: %s\n", token);
            if (strcmp(token, reqMethod[GET]) == 0)
            {
                printf("GET\n");
                header->method_str = reqMethod[GET];
                header->method = GET;
            }
            // GET, post, delete, stuff
            /* code */
        }
        token_index++;
        while ((token = strtok(NULL, " ")) != NULL)
        {
            if (index == 0)
            {
                // line number one we will have get / and other stuff

                if (token_index == 1)
                {
                    // filename
                    printf("Filename: %s\n", token);
                    header->uri_str = token;
                }

                if (token_index == 2)
                {
                    // http type
                    printf("HTTP Version: %s\n", token);
                    if (strcmp(token, http_type[HTTP1_1]))
                    {
                        printf("1.1\n");
                        header->http_version_str = http_type[HTTP1_1];
                        header->http_version = HTTP1_1;
                    }
                }
            }
            if (index == 1)
            {
                // line number 2,
                // Host: localhost:8888
                if(token_index == 1){
                    printf("Hostname : %s\n", token);
                }
            }
            if (index == 2)
            {
                // Connection: Keep-alive
                if(token_index == 1){
                    printf("what the fuck is connection %s\n", token);
                }
            }
            token_index++;
        }
    }

    // char *token = strtok(temp_line, " ");
    //     printf("tokenized token: %s\n", token);
    //     while((token = strtok(NULL, " ")) != NULL){
    //         printf("tokenized token: %s\n", token);
    //     }
    //     line = strtok();

    // while(line != NULL){
    //     printf("tokenized line: %s\n", line);
    //     char *token = strtok(line, " ");
    //     printf("tokenized token: %s\n", token);
    //     while((token = strtok(NULL, " ")) != NULL){
    //         printf("tokenized token: %s\n", token);
    //     }

    // }
    printf("Exiting\n\r");

    return 0;

    /*
    GET / HTTP/1.1
    Host: localhost:8888
    Connection: keep-alive
    sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132", "Google Chrome";v="132"
    sec-ch-ua-mobile: ?0
    sec-ch-ua-platform: "Linux"
    Upgrade-Insecure-Requests: 1
    User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*\/*;q=0.8,application/signed-exchange;v=b3;q=0.7
    Sec-Fetch-Site: none
    Sec-Fetch-Mode: navigate
    Sec-Fetch-User: ?1
    Sec-Fetch-Dest: document
    Accept-Encoding: gzip, deflate, br, zstd
    Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,ja;q=0.7
    Cookie: username-localhost-8888=2|1:0|10:1738574629|23:username-localhost-8888|196:eyJ1c2VybmFtZSI6ICI2Y2I3OGU0ODE1MjY0NTNlOTE1NzQ2YzkzNDYzMTA4YyIsICJuYW1lIjogIkFub255bW91cyBIaW1hbGlhIiwgImRpc3BsYXlfbmFtZSI6ICJBbm9ueW1vdXMgSGltYWxpYSIsICJpbml0aWFscyI6ICJBSCIsICJjb2xvciI6IG51bGx9|3623a8db5bef1c503d71af0cb73df5a314ef3537fbbaebc1f770eeda187bc9a6; _xsrf=2|89fc6454|6ddc179b7b6b4c51269d96c086edd18a|1738574629
    */

    // char *token;
    // token = strtok(line, " ");
    // if (token)
    // header->method_str = strdup(token);
    // token = strtok(NULL, " ");
    // if (token)
    // header->uri_str = strdup(token);
    // token = strtok(NULL, "\r\n");
    // if (token)
    // header->http_version_str = strdup(token);

    // if (!header->method_str || !header->uri_str || !header->http_version_str)
    //     return -1;

    return 0;
}

void build_request_header(char *header)
{
}

// request builder

void *handle_req(void *args)
{
    int numbytes;
    char buf[TRANSMIT_SIZE];
    sockdetails_t *sd = (sockdetails_t *)args;
    while (1)
    {
        printf("withing handle req\n");
        // we are in the child process now
        if ((numbytes = recv(sd->client_sock_fd, buf, sizeof(buf), 0)) < 0)
        {
            perror("read");
            // exit(-1);
            return NULL;
        }

        printf("got string \n: %s\n\n\n\n ---- \n\n", buf);

        HttpHeader_t header;
        parse_request_line(buf, &header);

        bzero(buf, sizeof(buf));
        snprintf(buf, sizeof(buf), "parth is here\n");

        if ((numbytes = send(sd->client_sock_fd, buf, sizeof(buf), 0)) < 0)
        {
            perror("write");
            return NULL;
            // exit(-1);
        }
    }
    return NULL;
}