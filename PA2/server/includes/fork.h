/**
 * @file fork.h
 * @brief Fork-based Connection Handler Implementation
 * @copyright (c) 2025 Parth Thakkar
 *
 * This file implements connection handling using process forking,
 * providing process isolation for each client connection. It includes
 * zombie process cleanup and proper resource management for both
 * parent and child processes.
 */

#pragma once

#include "common.h"
#include "builder.h"
#include "handle_req.h"

/**
 * @function cleanup_zombie_processes
 * @brief Cleans up terminated child processes to prevent zombie processes
 *
 * This function performs non-blocking cleanup of terminated child processes by:
 * 1. Using waitpid() with WNOHANG to check for terminated children
 * 2. Continuing cleanup until no more terminated children are found
 * 3. Logging each cleanup operation for monitoring
 *
 * @note This should be called periodically or in response to SIGCHLD
 */
void cleanup_zombie_processes();



/**
 * @function use_fork
 * @brief Handles client connections using process forking
 * 
 * @param sd Pointer to socket details structure
 * 
 * This function implements a forking server model that:
 * 1. Creates a new process for each client connection
 * 2. Manages socket descriptors in both parent and child
 * 3. Implements timeout handling using select()
 * 4. Processes HTTP requests in the child process
 * 5. Ensures proper cleanup of resources
 * 
 * Process Management:
 * - Parent process: Closes client socket and continues accepting
 * - Child process: Closes server socket and handles client communication
 */
void use_fork(sockdetails_t *sd);
