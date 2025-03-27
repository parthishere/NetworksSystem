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

    char filename_qfd[264] ;

    while ((dp = readdir(dfd)) != NULL)
    {
        struct stat stbuf; 
        sprintf( filename_qfd , "%s/%s",dir,dp->d_name) ;
        if(stat(dp->d_name, &stbuf) == -1){
            fprintf(stderr, "cannot stat %s\n", dp->d_name);
            continue;
        }

        cache_add_existing(NULL, dp->d_name);

        if ( ( stbuf.st_mode & S_IFMT ) == S_IFDIR )
        {
            continue;
            // Skip directories
        }
    }
}

void cache_add_new(cache_table_t *table, const char *url, const char *filepath)
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

    cache_entry_t *entry = malloc(sizeof(cache_entry_t));
    if (!entry)
        return;
    int file_fd = open(entry->url_hash, O_CREAT | 0666);
    if (file_fd < 0)
    {
        free(entry);
        return;
    }
    if (stat(entry->url_hash, &st) != 0)
    {
        perror(entry->url_hash);
    }

    strcpy(entry->url_hash, hashstr);
    strcpy(entry->filepath, filepath);

    entry->timestamp = st.st_ctime; // timestamp
    entry->next = NULL;

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
}



void cache_add_existing(cache_table_t *table, const char *hash)
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

    cache_entry_t *entry = malloc(sizeof(cache_entry_t));
    if (!entry)
        return;
    int file_fd = open(entry->url_hash, O_RDONLY | 0666);
    if (file_fd < 0)
    {
        free(entry);
        fprintf(stderr, "cannot open file");
        return;
    }
    if (stat(entry->url_hash, &st) != 0)
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
    while (entry)
    {
        if (strcmp(entry->url_hash, hashstr) == 0)
        {
            time_t current_time = time(NULL);
            if (current_time - entry->timestamp <= timeout)
            {
                file_fd = open(entry->url_hash, O_RDONLY);
                if (file_fd < 0)
                {
                    perror("file opening from cache");
                }
                pthread_mutex_unlock(&table_to_use->lock);
                return file_fd;
            }
            else
            {
                pthread_mutex_unlock(&table_to_use->lock);
                remove(entry->url_hash);
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
