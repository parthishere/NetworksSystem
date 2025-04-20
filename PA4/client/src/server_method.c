#include "server_method.h"

/**
 * Parse and identify command from user input
 *
 * Analyzes input string to determine which FTP command was requested.
 * Handles basic command parsing and validation.
 *
 * @param cmd  Null-terminated string containing user command
 * @return     Corresponding commands_t enum value, or:
 *             -1 for invalid command
 *             -2 for newline (triggers screen clear)
 *
 * Supported Commands:
 * - "ls\n": List directory contents
 * - "get <filename>": Download file
 * - "put <filename>": Upload file
 * - "delete <filename>": Remove file
 * - "exit\n": Terminate session
 *
 * Note: Uses strncmp for command matching to prevent buffer overflows
 */
commands_t whichcmd(int argc, char *argv[], char **filename)
{
    char *cmd = argv[1];
    if (strncmp(cmd, "ls", strlen("ls")) == 0)
    {
        return LS;
    }
    else if (strncmp(cmd, "get", strlen("get")) == 0 && strlen(cmd) == strlen("get"))
    {
        if(argc != 3) goto error;
        *filename = argv[2];
        return GET;
    }
    else if (strncmp(cmd, "put", strlen("put")) == 0 && strlen(cmd) == strlen("put"))
    {
        if(argc != 3) goto error;
        *filename = argv[2];
        return PUT;
    }
    else if (strncmp(cmd, "exit", strlen("exit")) == 0 && strlen(cmd) == strlen("exit"))
    {
        return EXIT;
    }
    else if (strncmp(cmd, "delete", strlen("delete")) == 0 && strlen(cmd) == strlen("delete"))
    {
        if(argc != 3) goto error;
        *filename = argv[2];
        return DELETE;
    }
    else if (strncmp(cmd, "serverinfo", strlen("serverinfo")) == 0 && strlen(cmd) == strlen("serverinfo"))
    {
        return SERVER_INFO;
    }
    else if (strncmp(cmd, "help", strlen("help")) == 0 && strlen(cmd) == strlen("help"))
    {
        return HELP;
    }

    
    
error:;    
    printf(RED "[-] Wrong command ! \n\r" RESET);
    return -1;
}


