/**
 * @file setup.h
 * @brief Network Socket Setup Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements socket initialization and configuration functions for
 * a network server. It handles both IPv4 and IPv6 address families and
 * provides TCP stream socket setup with proper error handling.
 */

#pragma once

#include "common.h"

void init_socket(sockdetails_t *sd, char *port);
