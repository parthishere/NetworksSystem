#include "blocklist.h"

static blocklist_t *_blocklist = NULL;

blocklist_t* init_blocklist() {
    _blocklist = malloc(sizeof(blocklist_t));
    if (!_blocklist) return NULL;
    
    _blocklist->patterns = NULL;
    _blocklist->pattern_count = 0;
    
    // Load patterns from file
    FILE* file = fopen(BLOCKLIST_FILE_NAME, "r");
    if (!file) return _blocklist;  // No blocklist file
    
    char line[256];
    while (fgets(line, sizeof(line), file)) {
        // Remove newline
        line[strcspn(line, "\n")] = 0;
        
        // Add pattern to array
        _blocklist->patterns = realloc(_blocklist->patterns, 
                              (_blocklist->pattern_count + 1) * sizeof(char*));
        _blocklist->patterns[_blocklist->pattern_count] = strdup(line);
        _blocklist->pattern_count++;
    }
    
    fclose(file);
    
    return _blocklist;
}


// Check if a hostname is blocked
int is_blocked(blocklist_t* blocklist, const char* hostname) {
    if (blocklist == NULL) blocklist = _blocklist;
    
    for (int i = 0; i < blocklist->pattern_count; i++) {
        if (glob_match(blocklist->patterns[i], hostname)) {
            return 1;  // Blocked
        }
    }
    
    return 0;  // Not blocked
}

/**
 * @brief Match a string against a glob pattern
 * @param pattern The pattern to match against
 * @param string The string to check
 * @return 1 if the string matches the pattern, 0 otherwise
 *
 * Supports:
 * - '*' matches any sequence of characters
 * - '?' matches any single character
 * - '[abc]' matches any character in the set
 * - '[a-z]' matches any character in the range
 */
int glob_match(const char* pattern, const char* string) {
    // End of pattern reached, check if string is also at end
    if (*pattern == '\0') {
        return (*string == '\0');
    }
    
    // Handle wildcard '*'
    if (*pattern == '*') {
        // Try to match the rest of the pattern with different substrings
        // of the input string (including empty substring)
        while (1) {
            if (glob_match(pattern + 1, string)) {
                return 1;
            }
            if (*string == '\0') {
                return 0;
            }
            string++;
        }
    }
    
    // Handle character class [...]
    if (*pattern == '[') {
        int matched = 0;
        pattern++;  // Move past '['
        
        // Check if character is negated with '!'
        int negate = (*pattern == '!' || *pattern == '^');
        if (negate) pattern++;
        
        // Empty character class never matches
        if (*pattern == ']') return 0;
        
        // Match single character against the class
        if (*string != '\0') {
            char c = *string;
            
            // Check each character in the class
            while (*pattern != ']') {
                if (*pattern == '\0') {
                    // Unterminated character class
                    return 0;
                }
                
                // Check for range (e.g., 'a-z')
                if (pattern[1] == '-' && pattern[2] != ']') {
                    if (c >= *pattern && c <= pattern[2]) {
                        matched = 1;
                        break;
                    }
                    pattern += 3;
                } else {
                    // Single character
                    if (*pattern == c) {
                        matched = 1;
                        break;
                    }
                    pattern++;
                }
            }
            
            // Move to end of character class
            while (*pattern != ']' && *pattern != '\0') {
                pattern++;
            }
            
            // If we reached the end of pattern without a closing bracket
            if (*pattern == '\0') {
                return 0;
            }
            
            // Apply negation
            if (negate) {
                matched = !matched;
            }
            
            // If not matched, this path fails
            if (!matched) {
                return 0;
            }
            else{
                return 1;
            }
        } else {
            // String ended but we expected a character to match the class
            return 0;
        }
        
        // Move past closing ']'
        pattern++;
    } 
    // Handle single character match
    else if (*pattern == '?' || *pattern == *string) {
        // '?' matches any character, or characters match exactly
        if (*string == '\0') {
            return 0;  // String ended but pattern expected a character
        }
    } else {
        return 0;  // Characters don't match
    }
    
    // Move to next character in both strings
    return glob_match(pattern + 1, string + 1);
}