
#pragma once

#include "cache.h"
#include "handle_req.h"
#include <regex.h>

// Link prefetcher structure
typedef struct {
    int linknum;       // Cache timeout value
    char **links;      // Thread safety lock
    char *base_url;
    sockdetails_t *sd;
} prefetcher_t;

void *prefetch_thread_func(void *);
char** extract_links(const char* html_content, int* link_count);