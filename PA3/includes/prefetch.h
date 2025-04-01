
#pragma once

#include "cache.h"
#include <regex.h>

// Link prefetcher structure
typedef struct {
    int linknum;       // Cache timeout value
    char **links;      // Thread safety lock
} prefetcher_t;

void *prefetch_thread_func(void *);
char** extract_links(const char* html_content, int* link_count);