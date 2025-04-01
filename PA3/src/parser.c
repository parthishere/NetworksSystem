/**
 * @file parser.c
 * @brief HTTP Request Parser Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements an HTTP request parser that supports HTTP/1.0 and HTTP/1.1
 * protocols. It provides both thread-safe and thread-unsafe parsing methods with
 * comprehensive error checking and security validations.
 */
#include "parser.h"

#define MAX_LINE_TO_TOKENIZE_IN_HTTP 7


#define SOME_ERROR -1
#define GOOD_TO_GO 0

/**
 * @brief Array of supported HTTP request methods
 *
 * Ordered array of supported HTTP methods matching the enum
 * defined in the header file
 */
static char *reqMethod[total_req_methods + 1] = {
    "GET",
    "POST",
    "DELETE",
    "PATCH", "", "", ""};

/**
 * @brief Array of supported HTTP protocol versions
 *
 * Maps protocol enum values to their string representations
 */
static char *http_type[supported_http_protocols + 1] = {
    "HTTP/1.0",
    "HTTP/1.1"};


typedef enum states_s {
    method_parse,
    host_parse,
    user_agent_parse,
    accpet_parse,
    accpet_language_parse,
    accept_encoding_parse,
    referer_parse,
    accept_parse,
    connection_parse,
    cache_control_parse,
}states_t;



/**
 * @brief Extracts the path from a full URL in an HTTP request
 * @param url The full URL (e.g., "http://detectportal.firefox.com/canonical.html")
 * @return Pointer to newly allocated string containing just the path
 *         Caller must free this memory
 */
char* extract_uri_path(const char* url) {
    // Skip the protocol (http:// or https://)
    const char* protocol_end = strstr(url, "://");
    if (!protocol_end) {
        return strdup("/"); // No protocol found, assume root path
    }
    
    // Move past the ://
    const char* host_start = protocol_end + 3;
    
    // Find the first slash after the host
    const char* path_start = strchr(host_start, '/');
    if (!path_start) {
        return strdup("/"); // No path found, return root path
    }
    
    // Duplicate the path portion
    return strdup(path_start);
}


/**
 * @function parse_request_line_thread_safe
 * @brief Thread-safe HTTP request parser
 *
 * @param request Raw HTTP request string to parse
 * @param header Pointer to header structure to populate
 * @return int Parse status code (PARSE_OK or error code)
 *
 * This function performs thread-safe parsing of HTTP requests by:
 * 1. Validating input parameters
 * 2. Creating a safe copy of the request
 * 3. Parsing request line components
 * 4. Validating HTTP method, URI, and version
 * 5. Processing additional headers
 *
 * Security features:
 * - Buffer overflow prevention
 * - Path traversal detection
 * - Input validation
 * - Memory safety checks
 */
int parse_request_line_thread_safe(char *request, HttpHeader_t *header)
{
    
    if (!request || !header || strlen(request) > MAX_SIZE)
    {
        header->parser_error |= BAD_REQ;
        printf("no reqest, no header, no len \n");
        return SOME_ERROR;
    }
    
    char request_copy[strlen(request)+1];
    strncpy(request_copy, request, strlen(request));

    memset(header, 0, sizeof(HttpHeader_t));
    header->http_version = ERROR_VERSION;
    header->method = -1;
    header->current_state = method_parse;
    
    char *lines[MAX_LINE_TO_TOKENIZE_IN_HTTP + 1];
    int line_count = 0;
    char *line_ctx = NULL;
    char *line = strtok_r(request_copy, "\r\n", &line_ctx);
    
    while (line && line_count < MAX_LINE_TO_TOKENIZE_IN_HTTP){
        if (*line != '\0')
        {
            lines[line_count++] = line;
        }
        line = strtok_r(NULL, "\r\n", &line_ctx);
    }
    
    if (line_count == 0)
    {
        
        printf("line count error \n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    
    char *method = NULL, *uri = NULL, *version = NULL;
    char *token_ctx = NULL;
    
    
    method = strtok_r(lines[0], " ", &token_ctx);
    if (!method)
    {
        printf("no method \n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    
    
    // Parse method
    int valid_method = 0;
    int valid_header = 0;
    for (int i = 0; i < total_req_methods; i++)
    {
        
        if (strncmp(method, reqMethod[i], strlen(method)) == 0)
        {
            if(strncmp(method, reqMethod[GET], strlen(method)) == 0){
                header->method = i;
                header->method_str = reqMethod[i];
                valid_method = 1;
                valid_header = 1;
            }
            else{
                valid_header = 1;
                valid_method = 0;
            }
            break;
        }
    }
    if (!valid_header)
    {
        printf("no valid header \n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    else if(!valid_method){
        printf("no valid method \n");
        header->parser_error |= METHOD_NOT_ALLOWED;
        return SOME_ERROR;
    }
    
    // Get URI
    uri = strtok_r(NULL, " ", &token_ctx);
    if (!uri)
    {
        printf("no valid uri \n");
        header->parser_error |= PARSE_ERROR_INVALID_URI;
        return SOME_ERROR;
    }
    
    // Validate URI length and characters
    size_t uri_len = strlen(uri);
    if (uri_len == 0)
    {
        
        printf("uri len =0 \n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    
    // Check for path traversal attempts
    if (strstr(uri, "..") != NULL)
    {
        
        printf("uri has .. \n");
        header->parser_error |= FORBIDDEN;
        return SOME_ERROR;
    }
    
    // Copy URI
    header->uri_str = extract_uri_path(uri);; // Remember to free this later
    if (!header->uri_str)
    {
        printf("uri str null \n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    
    // Get HTTP version
    version = strtok_r(NULL, " ", &token_ctx);
    if (!version)
    {
        printf("no version found\n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    
    
    
    // Validate HTTP version
    
    if (strncmp(version, "HTTP/1.", 7) != 0)
    {
        printf("wrong thing found\n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
    }
    
    
    if (strlen(version) > 8 || strlen(version) < 7){
        printf("somthing wrong in version\n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR;
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
        printf("somthing wrong in version\n");
        header->parser_error |= VERSION_NOT_SUPPORTED;
        return SOME_ERROR;
    }
    
    header->current_state = host_parse;
    header->connection_close = 1;

    // Parse remaining headers
    for (int i = 1; i < line_count; i++)
    {
        char *line = strdup(lines[i]);
        // printf("hehe > %s, %s \n\r", line, lines[i]);
        char *key = strtok_r(lines[i], ":", &token_ctx);
        char *value = strtok_r(NULL, " ", &token_ctx);
        
        if (!key || !value)
        {
            continue;
        }
        
        // Trim whitespace
        while (*value == ' ')
        value++;
        
        if (strncasecmp(key, "Host", strlen(key)) == 0)
        {
            key = strtok_r(value, ":", &token_ctx);
            value = strtok_r(NULL, " ", &token_ctx);
            
            if(!key){
                printf("no host\n");
                header->parser_error |= BAD_REQ;
                return SOME_ERROR;
            }
            
            header->hostname_str = strdup(key);
            
            if (!header->hostname_str) {
                printf("no host\n");
                header->parser_error |= BAD_REQ;
                return SOME_ERROR;
            }
            
            
            if(value){
                header->hostname_port_str = strdup(value);
            }
            
            if (!header->hostname_port_str) {
                header->hostname_port_str = NULL;
                
            }
            
        }
        
        else if (strcasecmp(key, "Connection") == 0)
        {
            header->connection_keep_alive = (strcasecmp(value, "keep-alive") == 0);
            header->connection_close = (strcasecmp(value, "Close") == 0);
        }
        else if (strcasecmp(key, "Cache-Control") == 0){
            // strtok_r()
            // header->max_age = value; // remember to free max_age afterwards
        }
        else{
            if(strstr(line, ":") == NULL){
                printf(": not found !");
            }
            
            if(header->extra_header == NULL){
                header->extra_header = malloc(strlen(line) + 3);
                strncpy(header->extra_header, line, strlen(line));
                strcat(header->extra_header, "\r\n");
            }
            else{
                header->extra_header = realloc(header->extra_header, strlen(header->extra_header)+strlen(line)+3);
                strcat(header->extra_header, line);
                strcat(header->extra_header, "\r\n");
            }
            
            // printf("header -> extra header %s\n", header->extra_header);
            
            
            // all the extra headers
        }
        free(line);
        // Add more header parsing as needed
    }
    
    if (header->http_version == HTTP1_1 && !header->hostname_str)
    {
        printf("no host in 1.1\n");
        header->parser_error |= BAD_REQ;
        return SOME_ERROR; // Host is required for HTTP/1.1
    }

    return GOOD_TO_GO;
}


   

    
    

    // // Validate required headers for HTTP/1.1
    // 

    // 
/**
 * @function cleanup_header
 * @brief Frees all dynamically allocated memory in header structure
 * 
 * @param header Pointer to header structure to clean up
 * 
 * This function safely releases all dynamically allocated memory
 * in the header structure and zeros out the structure.
 */
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

/**
 * @function str_equals
 * @brief Safely compares two strings up to specified size
 * 
 * @param a First string to compare
 * @param b Second string to compare
 * @param size Maximum number of characters to compare
 * @return int 1 if strings are equal, 0 otherwise
 */
int str_equals(char *a, char *b, int size)
{
    return (strncmp(a, b, size) == 0);
}

