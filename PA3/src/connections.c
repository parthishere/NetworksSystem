#include "connections.h"

#include <openssl/md5.h>
#include <openssl/evp.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include "cache.h"



// Global connection table
static connection_table_t *global_conn_table;
static pthread_t cleanup_thread;
static int cleanup_thread_running = 0;

/**
 * @brief Initialize connection table and start cleanup thread
 * @param global If non-zero, initialize global table
 * @return Pointer to connection table
 */
connection_table_t *init_connection_table(int global) {
    connection_table_t *table;
    
    if (global) {
        global_conn_table = malloc(sizeof(connection_table_t));
        if (!global_conn_table)
            return NULL;

        memset(global_conn_table->buckets, 0, sizeof(global_conn_table->buckets));
        // pthread_mutex_init(&global_conn_table->lock, NULL);
        
        table = global_conn_table;
    } else {
        table = malloc(sizeof(connection_table_t));
        if (!table)
            return NULL;

        memset(table->buckets, 0, sizeof(table->buckets));
        // pthread_mutex_init(&table->lock, NULL);
    }
    
    // Start cleanup thread if global table and not already running
    if (global && !cleanup_thread_running) {
        cleanup_thread_running = 1;
        pthread_create(&cleanup_thread, NULL, connection_cleanup_thread, NULL);
        pthread_detach(cleanup_thread);
    }
    
    return table;
}

/**
 * @brief Cleanup thread that periodically checks for and closes idle connections
 * @param arg Unused
 * @return NULL
 */
void *connection_cleanup_thread(void *arg) {
    while (cleanup_thread_running) {
        // Sleep for 5 seconds between checks
        sleep(5);
        
        time_t current_time = time(NULL);
        // pthread_mutex_lock(&global_conn_table->lock);
        
        // Check each bucket
        for (int i = 0; i < HASH_TABLE_SIZE; i++) {
            connection_entry_t *entry = global_conn_table->buckets[i];
            if (entry != NULL && entry->hostname) {
                // Check if connection has timed out
                if (current_time - entry->timestamp >= TIMEOUT_HTTP_SEC) {
                    // Remove from list
                    // Close socket and free resources
                    printf(MAG"[~] (%d) Cleanup: Closing idle connection to %s (idle for %ld seconds)\n"RESET, 
                           gettid(), entry->hostname, current_time - entry->timestamp);
                    
                    close(entry->sockfd);
                    if(entry->hostname) {
                        free(entry->hostname);
                        entry->hostname = NULL;
                    }
                    if(entry){
                        free(entry);
                        entry = NULL;
                    }
                } 
            }
        }
        
        // pthread_mutex_unlock(&global_conn_table->lock);
    }
    
    return NULL;
}

/**
 * @brief Save socket descriptor for a host
 * @param table Connection table to use (NULL for global)
 * @param hostname Hostname
 * @param sockfd Socket descriptor
 * @return 0 on success, -1 on failure
 */
int save_connection(connection_table_t *table, char *hostname, int sockfd) {
    connection_table_t *table_to_use = table ? table : global_conn_table;
    
    if (!hostname || sockfd < 0)
        return -1;
    
    // Generate hash for hostname
    char *host_hash = str2md5(hostname, strlen(hostname));
    if (!host_hash)
        return -1;
    
    // Find hash table index
    unsigned int index = hash_index(host_hash);
    
    // Create new entry
    connection_entry_t *entry = malloc(sizeof(connection_entry_t));
    if (!entry) {
        free(host_hash);
        return -1;
    }
    
    strncpy(entry->host_hash, host_hash, HASH_STR_LENGTH);
    entry->hostname = strdup(hostname);
    entry->sockfd = sockfd;
    entry->timestamp = time(NULL);
    
    free(host_hash);  // Hash copied to entry, can free original
    
    // Add to hash table
    // pthread_mutex_lock(&table_to_use->lock);
    
    // Add at beginning of list (most recent connections first)
    table_to_use->buckets[index] = entry;
    
    // pthread_mutex_unlock(&table_to_use->lock);
    
    printf(GRN"[+] (%d) Socket fd Saved connection to %s (socket %d)\n"RESET, gettid(), hostname, sockfd);
    return 0;
}

/**
 * @brief Get connection for a host
 * @param table Connection table to use (NULL for global)
 * @param hostname Hostname
 * @return Socket descriptor on success, -1 if not found
 */
int get_connection(connection_table_t *table, char *hostname) {
    connection_table_t *table_to_use = table ? table : global_conn_table;
    int sockfd = -1;
    
    if (!hostname)
        return -1;
    
    // Generate hash for hostname
    char *host_hash = str2md5(hostname, strlen(hostname));
    if (!host_hash)
        return -1;
    
    // Find hash table index
    unsigned int index = hash_index(host_hash);
    
    // pthread_mutex_lock(&table_to_use->lock);
    
    // Search in bucket
    connection_entry_t *entry = table_to_use->buckets[index];
    if (entry && entry->host_hash) {
        if (strcmp(entry->host_hash, host_hash) == 0) {
            // Found entry, update timestamp
            entry->timestamp = time(NULL);
            sockfd = entry->sockfd;
        }
    }
    
    // pthread_mutex_unlock(&table_to_use->lock);
    free(host_hash);
    
    if (sockfd != -1) {
        printf(GRN"[+][Connection] Found existing connection to %s (socket %d)\n"RESET, hostname, sockfd);
    }
    else{
        printf(YEL"[-] (%d) Connection not found to %s (socket %d)\n"RESET, gettid(), hostname, sockfd);
    }
    
    return sockfd;
}

/**
 * @brief Remove connection for a host
 * @param table Connection table to use (NULL for global)
 * @param hostname Hostname
 * @param close_socket If non-zero, close the socket
 * @return Socket descriptor that was removed, -1 if not found
 */
int remove_connection(connection_table_t *table, char *hostname, int close_socket) {
    connection_table_t *table_to_use = table ? table : global_conn_table;
    int sockfd = -1;
    
    if (!hostname)
        return -1;
    
    // Generate hash for hostname
    char *host_hash = str2md5(hostname, strlen(hostname));
    if (!host_hash)
        return -1;
    
    // Find hash table index
    unsigned int index = hash_index(host_hash);
    
    // pthread_mutex_lock(&table_to_use->lock);
    
    // Search in bucket

    connection_entry_t *entry = table_to_use->buckets[index];
    
    if (entry && entry->host_hash) {
        if (strcmp(entry->host_hash, host_hash) == 0) {
            sockfd = entry->sockfd;
            free(entry->hostname);
            free(entry);
        }
    }
    
    // pthread_mutex_unlock(&table_to_use->lock);
    free(host_hash);
    
    if (sockfd != -1) {
        // printf("[+] (%d) Socket connection removed connection to %s (socket %d)\n", hostname, sockfd);
        
        // Close socket if requested
        if (close_socket) {
            close(sockfd);
            printf("[+] (%d) Socket connection closed socket %d\n", gettid(), sockfd);
        }
    }
    
    return sockfd;
}

/**
 * @brief Clean up connection table (call at program exit)
 * @param table Connection table to clean up (NULL for global)
 */
void cleanup_connection_table(connection_table_t *table) {
    connection_table_t *table_to_use = table ? table : global_conn_table;
    
    if (!table_to_use)
        return;
    
    // pthread_mutex_lock(&table_to_use->lock);
    
    // Stop cleanup thread if cleaning up global table
    if (table_to_use == global_conn_table) {
        cleanup_thread_running = 0;
    }
    
    // Free all entries
    for (int i = 0; i < HASH_TABLE_SIZE; i++) {
        connection_entry_t *entry = table_to_use->buckets[i];
        if (entry) {
            
            // Close socket and free entry
            close(entry->sockfd);
            free(entry->hostname);
            free(entry);
        }
        table_to_use->buckets[i] = NULL;
    }
    
    // pthread_mutex_unlock(&table_to_use->lock);
    
    // Destroy mutex and free table if not global
    if (table_to_use != global_conn_table) {
        // pthread_mutex_destroy(&table_to_use->lock);
        free(table_to_use);
    }
}