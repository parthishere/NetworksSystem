/**
 * @file handle_req.c
 * @brief HTTP Request Handler Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements the main HTTP request handling logic, managing:
 * - Connection timeouts using select()
 * - Request reading and parsing
 * - Response generation
 * - Connection persistence (keep-alive)
 * - Resource cleanup
 *
 * The handler supports both HTTP/1.0 and HTTP/1.1 connections with
 * configurable timeout periods and buffer sizes.
 */

#pragma once

#include "common.h"
#include "parser.h"
#include "builder.h"
#include "setup.h"
#include "cache.h"
#include "blocklist.h"
#include "prefetch.h"

/**
 * @function handle_req
 * @brief Main HTTP request handler function
 *
 * @param sd Socket details structure containing connection information
 * @return void* Always returns NULL
 *
 * This function implements the main request handling loop that:
 * 1. Monitors socket for incoming data using select()
 * 2. Implements timeout mechanism for idle connections
 * 3. Reads and processes HTTP requests
 * 4. Manages connection persistence based on HTTP headers
 * 5. Ensures proper resource cleanup
 *
 * Threading: This function is designed to be thread-safe and can be
 * called by multiple threads simultaneously with different connections.
 */   
void *handle_req(sockdetails_t *sd);

int if_cached(HttpHeader_t *header, sockdetails_t *sd, int file_fd, int send_to_client, int prefetch);
int if_not_cached(HttpHeader_t *header, sockdetails_t *sd, int send_to_client, int prefetch);
int is_dynamic_content(const char *url, char *recieved_buf);
int check_and_send_from_cache(HttpHeader_t *header, sockdetails_t *sd, int dynamic_content, int send_to_client, int prefetch);

