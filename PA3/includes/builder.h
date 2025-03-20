/**
 * @file builder.h
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

#pragma once

#include "common.h"

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
void build_and_send_header(HttpHeader_t *request_header, sockdetails_t *sd);