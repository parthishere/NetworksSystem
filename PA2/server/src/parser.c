#include "parser.h"

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 5

static char *reqMethod[total_req_methods + 1] = {
    "GET",
    "POST",
    "DELETE",
    "PATCH"};

static char *http_type[supported_http_protocols + 1] = {
    "HTTP/1.0",
    "HTTP/1.1"};

int parse_request_line2(char *request, HttpHeader_t *header)
{
    if (!request || !header)
    {
        return PARSE_ERROR_MALFORMED;
    }

    // Make a copy of the request to avoid modifying original
    char request_copy[MAX_SIZE];
    if (strlen(request) >= MAX_SIZE)
    {
        header->parser_error = PARSE_ERROR_BUFFER_OVERFLOW;
        return PARSE_ERROR_BUFFER_OVERFLOW;
    }
    strncpy(request_copy, request, MAX_SIZE - 1);
    request_copy[MAX_SIZE - 1] = '\0';

    // Initialize header structure
    memset(header, 0, sizeof(HttpHeader_t));
    header->http_version = ERROR_VERSION;
    header->method = -1;

    // Split into lines first
    char *lines[MAX_LINE_TO_TOKENIZE_IN_HTTP + 1];
    int line_count = 0;
    char *line_ctx = NULL;
    char *line = strtok_r(request_copy, "\r\n", &line_ctx);

    while (line && line_count < MAX_LINE_TO_TOKENIZE_IN_HTTP)
    {
        // Skip empty lines
        if (*line != '\0')
        {
            lines[line_count++] = line;
        }
        line = strtok_r(NULL, "\r\n", &line_ctx);
    }

    if (line_count == 0)
    {
        header->parser_error = PARSE_ERROR_MALFORMED;
        return PARSE_ERROR_MALFORMED;
    }

    // Parse request line (first line)
    char *method = NULL, *uri = NULL, *version = NULL;
    char *token_ctx = NULL;

    // Get method
    method = strtok_r(lines[0], " ", &token_ctx);
    if (!method)
    {
        header->parser_error = PARSE_ERROR_MALFORMED;
        return PARSE_ERROR_MALFORMED;
    }

    // Parse method
    int valid_method = 0;
    for (int i = 0; i < total_req_methods; i++)
    {
        if (strcmp(method, reqMethod[i]) == 0)
        {
            header->method = i;
            header->method_str = reqMethod[i];
            valid_method = 1;
            break;
        }
    }
    if (!valid_method)
    {
        header->parser_error = PARSE_ERROR_INVALID_METHOD;
        return PARSE_ERROR_INVALID_METHOD;
    }

    // Get URI
    uri = strtok_r(NULL, " ", &token_ctx);
    if (!uri)
    {
        header->parser_error = PARSE_ERROR_INVALID_URI;
        return PARSE_ERROR_INVALID_URI;
    }

    // Validate URI length and characters
    size_t uri_len = strlen(uri);
    if (uri_len == 0)
    {
        header->parser_error = PARSE_ERROR_INVALID_URI;
        return PARSE_ERROR_INVALID_URI;
    }

    // Check for path traversal attempts
    if (strstr(uri, "..") != NULL)
    {
        header->parser_error = PARSE_ERROR_INVALID_URI;
        return PARSE_ERROR_INVALID_URI;
    }

    // Copy URI
    header->uri_str = strdup(uri); // Remember to free this later
    if (!header->uri_str)
    {
        header->parser_error = PARSE_ERROR_BUFFER_OVERFLOW;
        return PARSE_ERROR_BUFFER_OVERFLOW;
    }

    // Get HTTP version
    version = strtok_r(NULL, " ", &token_ctx);
    if (!version)
    {
        header->parser_error = PARSE_ERROR_INVALID_VERSION;
        return PARSE_ERROR_INVALID_VERSION;
    }

    // Validate HTTP version
    if (strncmp(version, "HTTP/1.", 7) != 0)
    {
        header->parser_error = PARSE_ERROR_INVALID_VERSION;
        header->http_version = ERROR_VERSION;
        return PARSE_ERROR_INVALID_VERSION;
    }

    switch (version[7])
    {
    case '1':
        header->http_version = HTTP1_1;
        header->http_version_str = http_type[HTTP1_1];
        break;
    case '0':
        header->http_version = HTTP1_0;
        header->http_version_str = http_type[HTTP1_0];
        break;
    default:
        header->http_version = ERROR_VERSION;
        header->parser_error = PARSE_ERROR_INVALID_VERSION;
        return PARSE_ERROR_INVALID_VERSION;
    }
    
    // Parse remaining headers
    for (int i = 1; i < line_count; i++)
    {
        char *key = strtok_r(lines[i], ":", &token_ctx);
        char *value = strtok_r(NULL, " ", &token_ctx);
        
        if (!key || !value)
        {
            continue;
        }

        // Trim whitespace
        while (*value == ' ')
        value++;

        if (strcasecmp(key, "Host") == 0)
        {
            header->hostname_str = strdup(value);
        }
        else if (strcasecmp(key, "Connection") == 0)
        {
            header->connection_keep_alive = (strcasecmp(value, "keep-alive") == 0);
            header->connection_close = (strcasecmp(value, "Close") == 0);
        }
        // Add more header parsing as needed
    }
    
    // Validate required headers for HTTP/1.1
    if (header->http_version == HTTP1_1 && !header->hostname_str)
    {
        header->parser_error = PARSE_ERROR_MALFORMED;
        return PARSE_ERROR_MALFORMED; // Host is required for HTTP/1.1
    }


    return PARSE_OK;
}

// Helper function to clean up header memory
void cleanup_header(HttpHeader_t *header)
{
    if (header)
    {
        free((void *)header->uri_str);
        free((void *)header->hostname_str);
        // Add other fields that were dynamically allocated
        memset(header, 0, sizeof(HttpHeader_t));
    }
}
