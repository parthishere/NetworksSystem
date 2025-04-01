// localhost, 127.0.0.0/8, ::1

#include "prefetch.h"

void *prefetch_thread_func(void *data)
{
    prefetcher_t *prefetch_data = (prefetcher_t *)data;

    // Create a temporary structure to hold HTTP header and sockdetails
    HttpHeader_t temp_header;

    // Process each link
    for (int i = 0; i < prefetch_data->linknum; i++)
    {
        // Skip empty links
        if (!prefetch_data->links[i] || strlen(prefetch_data->links[i]) == 0)
        {
            continue;
        }

        // Initialize header
        memset(&temp_header, 0, sizeof(HttpHeader_t));

        // Check if link is absolute or relative
        if (strncmp(prefetch_data->links[i], "http://", 7) == 0 ||
            strncmp(prefetch_data->links[i], "https://", 8) == 0)
        {
            // Absolute URL - need to parse it
            char *url_copy = prefetch_data->links[i];
            char *protocol_end = strstr(url_copy, "://");

            if (!protocol_end)
            {
                free(url_copy);
                continue;
            }

            char *host_start = protocol_end + 3;
            char *path_start = strchr(host_start, '/');

            if (!path_start)
            {
                // Default path if none specified
                temp_header.uri_str = strdup("/");
                temp_header.hostname_str = strdup(host_start);
            }
            else
            {
                *path_start = '\0'; // Temporarily split string
                temp_header.hostname_str = strdup(host_start);
                temp_header.uri_str = strdup(path_start); // Include leading slash
                *path_start = '/';                        // Restore original string
            }

            free(url_copy);
            printf(MAG "[+] Absolute URL: host=%s, path=%s\n" RESET,
                   temp_header.hostname_str, temp_header.uri_str);
        }
        else
        {
            // Relative URL - combine with base
            temp_header.hostname_str = strdup(prefetch_data->base_url);

            // Handle different relative path formats
            if (prefetch_data->links[i][0] == '/')
            {
                // Path is already absolute from root
                temp_header.uri_str = strdup(prefetch_data->links[i]);
            }
            else
            {
                // Need to prepend a slash
                char *full_path;
                asprintf(&full_path, "/%s", prefetch_data->links[i]);
                temp_header.uri_str = full_path;
            }

            printf(MAG "[+] Relative URL: host=%s, path=%s\n" RESET,
                   temp_header.hostname_str, temp_header.uri_str);
        }

        // Set default port if needed
        temp_header.hostname_port_str = strdup("80");

        // Check if dynamic content before making the request
        int dynamic = is_dynamic_content(temp_header.uri_str, NULL);

        // Fetch the content but don't send to client and don't recursively prefetch
        check_and_send_from_cache(&temp_header, prefetch_data->sd, dynamic, 0, 0);

        // Clean up
        // free(temp_header.uri_str);
        // free(temp_header.hostname_str);
        // free(temp_header.hostname_port_str);
    }

    // Clean up the link data
    for (int i = 0; i < prefetch_data->linknum; i++)
    {
        if (!prefetch_data->links[i])
            free(prefetch_data->links[i]);
    }
    if (!prefetch_data->links)
        free(prefetch_data->links);
    if (!prefetch_data->base_url)
        free(prefetch_data->base_url);
    free(prefetch_data);

    return NULL;
}

// Extract links from HTML content
char **extract_links(const char *html_content, int *link_count)
{
    char **links = NULL;
    *link_count = 0;

    // Simple regex to find href links
    const char *pattern = "href=[\"']([^\"']+)[\"']";
    regex_t regex;
    regmatch_t matches[2];

    if (regcomp(&regex, pattern, REG_EXTENDED) != 0)
    {
        return NULL;
    }

    const char *cursor = html_content;
    while (regexec(&regex, cursor, 2, matches, 0) == 0)
    {
        // Extract the link URL (submatch 1)
        int start = matches[1].rm_so;
        int end = matches[1].rm_eo;
        int length = end - start;

        char *link = malloc(length + 1);
        strncpy(link, cursor + start, length);
        link[length] = '\0';
        // if(strncmp(link, "#", strlen(link)) == 0) continue;
        // if(strncmp(link, "", strlen(link)) == 0) continue;

        // Add to links array
        links = realloc(links, (*link_count + 1) * sizeof(char *));
        links[*link_count] = link;
        if (strncmp(link, "#", sizeof(link)) != 0 && strstr(link, "https://") == NULL)
        {
            (*link_count)++;
        }

        // Move cursor past this match
        cursor += matches[0].rm_eo;
    }

    regfree(&regex);
    return links;
}

void free_links(char **links, int total_links)
{
    for (int i = 0; i < total_links; i++)
    {
        free(links[i]);
        links[i] = NULL;
    }
    free(links);
}