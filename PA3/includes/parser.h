/**
 * @file parser.h
 * @brief HTTP Request Parser Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements an HTTP request parser that supports HTTP/1.0 and HTTP/1.1
 * protocols. It provides both thread-safe and thread-unsafe parsing methods with
 * comprehensive error checking and security validations.
 */

#pragma once

#include "common.h"


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
int parse_request_line_thread_safe(char *request, HttpHeader_t *header);



/**
 * @function parse_request_line_thread_unsafe
 * @brief Legacy thread-unsafe HTTP request parser
 * 
 * @param request Raw HTTP request string to parse
 * @param header Pointer to header structure to populate
 * 
 * @warning This function is not thread-safe and should be used with caution
 * @deprecated Use parse_request_line_thread_safe instead
 * 
 * This function provides basic HTTP request parsing without thread safety
 * or comprehensive error checking. Maintained for backward compatibility.
 */
void parse_request_line_thread_unsafe(char *request, HttpHeader_t *header);

void cleanup_header(HttpHeader_t *header);