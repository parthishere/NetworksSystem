/**
 * @file builder.c
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

#include "builder.h"
