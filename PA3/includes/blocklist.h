#pragma once

#include "common.h"

typedef struct {
    char **patterns;        // Array of pattern strings
    int pattern_count;      // Number of patterns
} blocklist_t;

blocklist_t* init_blocklist(int new);
int is_blocked(blocklist_t* blocklist, const char* hostname);
int glob_match(const char* pattern, const char* string);
void cleanup_blocklist(blocklist_t *bl);