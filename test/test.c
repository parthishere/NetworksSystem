
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>

int main()
{
    char line[] = "Host: google.com";
    // char line[] = "Host: 127.0.1.1:8000";
    char *token_context = NULL;
    char *key;
    char *value;
    key = strtok_r(line, ":", &token_context);
    value = strtok_r(NULL, "", &token_context);
    
    
    printf("key %s value %s\n", key, value);

    key = strtok_r(value, ":", &token_context);
    value = strtok_r(NULL, "", &token_context);
    printf("key %s value %s\n", key, value);
    // struct stat st;
    // stat("main.c", &st);
    // printf("%d", st.st_ctime);
    
    return 0;
}
