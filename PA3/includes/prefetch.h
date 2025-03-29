
#pragma once

#include "cache.h"

// Link prefetcher structure
typedef struct {
    cache_table_t* cache;      // Reference to cache table
    int timeout;               // Cache timeout value
    pthread_mutex_t lock;      // Thread safety lock
} prefetcher_t;
