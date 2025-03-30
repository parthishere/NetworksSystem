// localhost, 127.0.0.0/8, ::1

#include "prefetch.h"

// Initialize prefetcher
prefetcher_t* init_prefetcher(cache_table_t* cache, int timeout) {
    prefetcher_t* prefetcher = malloc(sizeof(prefetcher_t));
    if (!prefetcher) return NULL;
    
    prefetcher->cache = cache;
    prefetcher->timeout = timeout;
    pthread_mutex_init(&prefetcher->lock, NULL);
    
    return prefetcher;
}


// Extract links from HTML content
char** extract_links(const char* html_content, int* link_count) {
    char** links = NULL;
    *link_count = 0;
    
    // Simple regex to find href links
    const char* pattern = "href=[\"']([^\"']+)[\"']";
    regex_t regex;
    regmatch_t matches[2];
    
    if (regcomp(&regex, pattern, REG_EXTENDED) != 0) {
        return NULL;
    }
    
    const char* cursor = html_content;
    while (regexec(&regex, cursor, 2, matches, 0) == 0) {
        // Extract the link URL (submatch 1)
        int start = matches[1].rm_so;
        int end = matches[1].rm_eo;
        int length = end - start;
        
        char* link = malloc(length + 1);
        strncpy(link, cursor + start, length);
        link[length] = '\0';
        // if(strncmp(link, "#", strlen(link)) == 0) continue;
        //if(strncmp(link, "", strlen(link)) == 0) continue;
       
        
        // Add to links array
        links = realloc(links, (*link_count + 1) * sizeof(char*));
        links[*link_count] = link;
        if(strncmp(link, "#", sizeof(link)) != 0){
            printf("Links %s \n", link);
            (*link_count)++;
        }
            
        
        // Move cursor past this match
        cursor += matches[0].rm_eo;
    }
    
    regfree(&regex);
    return links;
}