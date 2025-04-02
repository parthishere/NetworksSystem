#include "cache.h"

#include <openssl/md5.h>
#include <openssl/evp.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>

// Global cache table
static cache_table_t *global_table;

cache_table_t *init_cache_table(int global)
{
    if (global)
    {
        global_table = malloc(sizeof(cache_table_t));
        if (!global_table)
            return NULL;

        memset(global_table->buckets, 0, sizeof(global_table->buckets));
        pthread_mutex_init(&global_table->lock, NULL);

        return global_table;
    }
    else
    {
        cache_table_t *table = malloc(sizeof(cache_table_t));
        if (!table)
            return NULL;

        memset(table->buckets, 0, sizeof(table->buckets));
        pthread_mutex_init(&table->lock, NULL);

        return table;
    }
}

unsigned int hash_index(const char *hash_str)
{
    // really simple hash function
    unsigned int hash = 0;
    for (int i = 0; hash_str[i] != '\0'; i++)
    {
        hash = hash * 31 + hash_str[i];
    }
    return hash % HASH_TABLE_SIZE;
}

int init_cache(cache_table_t *table)
{
    cache_table_t *table_to_use = NULL;
    struct stat st;

    if (table == NULL)
    {
        table_to_use = global_table;
    }
    else
    {
        table_to_use = table;
    }

    struct dirent *dp;
    DIR *dfd;
    char *dir = CACHE_ROOT;
    if ((dfd = opendir(dir)) == NULL)
    {
        fprintf(stderr, "Can't open dir %s\n", dir);
        return -1;
    }

    char filename_qfd[264];

    while ((dp = readdir(dfd)) != NULL)
    {
        struct stat stbuf;
        sprintf(filename_qfd, "%s/%s", dir, dp->d_name);
        if (stat(filename_qfd, &stbuf) == -1)
        {
            fprintf(stderr, "cannot stat %s\n", dp->d_name);
            continue;
        }
        if ((stbuf.st_mode & S_IFMT) == S_IFDIR)
        {
            continue;
            // Skip directories
        }

        cache_add_existing(NULL, dp->d_name, filename_qfd);

        
    }
}

int cache_add_new(cache_table_t *table, const char *url, const char *filepath)
{
    cache_table_t *table_to_use = NULL;
    struct stat st;

    if (table == NULL)
    {
        table_to_use = global_table;
    }
    else
    {
        table_to_use = table;
    }

    char str[strlen(url) + strlen(filepath) + 2];
    int n = snprintf(str, sizeof(str), "%s/%s", url, filepath);
    if (n != strlen(str))
        printf("something you will need to tweak\n");

    char *hashstr = str2md5(str, strlen(str));
    char *filename; // remember to free it later
    asprintf(&filename, "%s/%s", CACHE_ROOT, hashstr);

    cache_entry_t *entry = malloc(sizeof(cache_entry_t));
    if (!entry)
        return -1;
    int file_fd = open(filename, O_CREAT | O_RDWR, 0666);
    if (file_fd < 0)
    {
        perror("open");
        free(entry);
        return -1;
    }

    strncpy(entry->url_hash, hashstr, HASH_STR_LENGTH - 1);
    entry->url_hash[HASH_STR_LENGTH - 1] = '\0';
    strncpy(entry->filepath, filepath, PATH_MAX - 1);
    entry->filepath[PATH_MAX - 1] = '\0';


    if (stat(filename, &st) != 0)
    { // Use filename, not entry->url_hash
        perror("stat");
        close(file_fd);
        free(entry);
        free(filename);
        return -1;
    }

    entry->timestamp = st.st_ctime; // Use mtime instead of ctime

    unsigned int index = hash_index(hashstr);

    pthread_mutex_lock(&table_to_use->lock);

    if (table_to_use->buckets[index] == NULL)
    {
        table_to_use->buckets[index] = entry;
    }
    else
    {
        entry->next = table_to_use->buckets[index];
        table_to_use->buckets[index] = entry;
    }

    pthread_mutex_unlock(&table_to_use->lock);

    return file_fd;
}

void cache_add_existing(cache_table_t *table, const char *hash, char *filename)
{
    cache_table_t *table_to_use = NULL;
    struct stat st;

    // printf("dp->dname %s\r\n", hash);
    // printf("filename %s\r\n", filename);
    if (table == NULL)
    {
        table_to_use = global_table;
    }
    else
    {
        table_to_use = table;
    }

    cache_entry_t *entry = malloc(sizeof(cache_entry_t));
    if (!entry)
        return;
    
    int file_fd = open(filename, O_RDONLY | 0666);
    if (file_fd < 0)
    {
        free(entry);
        fprintf(stderr, "cannot open file");
        return;
    }
    if (stat(filename, &st) != 0)
    {
        fprintf(stderr, "cannot stat");
    }

    strcpy(entry->url_hash, hash);
    strcpy(entry->filepath, hash);

    entry->timestamp = st.st_ctime; // timestamp
    entry->next = NULL;

    unsigned int index = hash_index(hash);

    pthread_mutex_lock(&table_to_use->lock);

    if (table_to_use->buckets[index] == NULL)
    {
        table_to_use->buckets[index] = entry;
    }
    else
    {
        entry->next = table_to_use->buckets[index];
        table_to_use->buckets[index] = entry;
    }
    close(file_fd);
    pthread_mutex_unlock(&table_to_use->lock);
}

int cache_lookup(cache_table_t *table, const char *url, char *filepath, time_t timeout)
{
    cache_table_t *table_to_use = NULL;
    int file_fd = -1;
    if (table == NULL)
    {
        table_to_use = global_table;
    }
    else
    {
        table_to_use = table;
    }

    char str[strlen(url) + strlen(filepath) + 2];
    int n = snprintf(str, sizeof(str), "%s/%s", url, filepath);
    if (n != strlen(str))
        printf("something you will need to tweak\n");

    char *hashstr = str2md5(str, strlen(str));
    unsigned int index = hash_index(hashstr);
    cache_entry_t *entry = table_to_use->buckets[index];
    pthread_mutex_lock(&table_to_use->lock);
    while (entry)
    {
        if (strcmp(entry->url_hash, hashstr) == 0)
        {
            time_t current_time;
            time(&current_time);

            char *entire_filename ;
            asprintf(&entire_filename, "%s/%s", CACHE_ROOT, entry->url_hash);

            if (current_time - entry->timestamp <= timeout)
            {
                printf(YEL"[+] (%d) File is %lu sec long (<%ld)!\n"RESET, gettid(), current_time - entry->timestamp, timeout);
                file_fd = open(entire_filename, O_RDONLY);
                if (file_fd < 0)
                {
                    perror("file opening from cache");
                }
                pthread_mutex_unlock(&table_to_use->lock);
                return file_fd;
            }
            else
            {
                
                printf(YEL"[+] (%d) File is %lu sec long, (Need to fetch newer one) (>%ld)!\n"RESET, gettid(), current_time - entry->timestamp, timeout);
                pthread_mutex_unlock(&table_to_use->lock);
                remove(entire_filename);
                return file_fd;
            }
        }
        entry = entry->next;
    }
    pthread_mutex_unlock(&table_to_use->lock);
    return file_fd; // Not found
}

char *str2md5(char *str, int length)
{

    EVP_MD_CTX *context = EVP_MD_CTX_new();
    const EVP_MD *md = EVP_md5();
    EVP_DigestInit_ex(context, md, NULL);
    int md_len;
    char *out = (char *)malloc(33);
    unsigned char digest[16];

    while (length > 0)
    {
        if (length > 512)
        {
            EVP_DigestUpdate(context, str, 512);
        }
        else
        {
            EVP_DigestUpdate(context, str, length);
        }
        length -= 512;
        str += 512;
    }
    EVP_DigestFinal_ex(context, digest, &md_len);
    EVP_MD_CTX_free(context);

    for (int n = 0; n < md_len; ++n)
    {
        snprintf(&(out[n * 2]), 16 * 2, "%02x", (unsigned int)digest[n]);
    }
    return out;
}

void cleanup_cache(cache_table_t *table)
{
    cache_table_t *table_to_use = NULL;
    int file_fd = -1;
    if (table == NULL)
    {
        table_to_use = global_table;
    }
    else
    {
        table_to_use = table;
    }

    cache_entry_t *entry;
    int i = 0;
    for (i = 0; i < HASH_TABLE_SIZE; i++)
    {
        entry = table_to_use->buckets[i];
        cache_entry_t *prev = entry;
        if (entry && entry->next)
        {
            if(prev) free(prev);
            prev = entry;
            entry = entry->next;
        }
        // free(prev);
        if (table_to_use->buckets[i]) free(table_to_use->buckets[i]);
    }
    pthread_mutex_destroy(&table_to_use->lock);

    free(table_to_use);
}
