#pragma once

#include "common.h"

typedef struct connection_entry {
    char host_hash[HASH_STR_LENGTH];
    char *hostname;           // Original hostname for reference
    int sockfd;               // Socket to origin server
    time_t timestamp;         // Last activity timestamp
    struct connection_entry *next;  // For handling collisions
} connection_entry_t;

typedef struct {
    connection_entry_t *buckets[HASH_TABLE_SIZE];
} connection_table_t;

unsigned int hash_index(const char *hash_str);
connection_table_t *init_connection_table(int global) ;
void *connection_cleanup_thread(void *arg);
int save_connection(connection_table_t *table, char *hostname, int sockfd);
int get_connection(connection_table_t *table, char *hostname);
int remove_connection(connection_table_t *table, char *hostname, int close_socket);
void cleanup_connection_table(connection_table_t *table);

