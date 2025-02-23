#pragma once

typedef enum httpType_s
{
    HTTP1_0,
    HTTP1_1,
    ERROR_VERSION,
    supported_http_protocols
} httpType_t;

typedef enum statusCode_s
{
    OK,
    BAD_REQ,
    FORBIDDEN,
    NOT_FOUND,
    METHOD_NOT_ALLOWED,
    VERSION_NOT_SUPPORTED,
    total_status_codes,
} statusCode_t;

typedef enum method_s
{
    GET,
    POST,
    PUT,
    DELETE,
    PATCH,
    HEAD,
    total_req_methods,
} method_t;

typedef enum contentType_s
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


typedef enum
{
    PARSE_OK = 0,
    PARSE_ERROR_INVALID_METHOD = -1,
    PARSE_ERROR_INVALID_URI = -2,
    PARSE_ERROR_INVALID_VERSION = -3,
    PARSE_ERROR_MALFORMED = -4,
    PARSE_ERROR_BUFFER_OVERFLOW = -5
} parse_result_t;

typedef struct req_header_s
{
    httpType_t http_version;
    char *http_version_str;

    char *uri_str;
    char *hostname_str;

    contentType_t content_type;
    char *content_type_str;

    method_t method;
    char *method_str;

    statusCode_t *status_code;
    char *status_code_str;

    int connection_keep_alive;
    int connection_close;

    int parser_error;
} HttpHeader_t;
