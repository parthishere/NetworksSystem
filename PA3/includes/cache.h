#pragma once

#include "common.h"

typedef struct cache_entry
{
    char url_hash[HASH_STR_LENGTH];
    char filepath[PATH_MAX];
    unsigned long timestamp;
    struct cache_entry *next; // For handling collisions
} cache_entry_t;

typedef struct
{
    cache_entry_t *buckets[HASH_TABLE_SIZE];
    pthread_mutex_t lock; // For thread safety
} cache_table_t;



cache_table_t *init_cache_table(int global);
unsigned int hash_index(const char *hash_str);
int init_cache(cache_table_t *table);
int cache_add_new(cache_table_t *table, const char *url, const char *filepath);
void cache_add_existing(cache_table_t *table, const char *hash, char *filename);
int cache_lookup(cache_table_t *table, const char *url, char *filepath, time_t timeout);
char *str2md5(char *str, int length);
void cleanup_cache(cache_table_t *table);