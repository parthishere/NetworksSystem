#include "server_method.h"

/**
 * Display command menu and process user input
 *
 * Presents available commands to user and processes their selection.
 * Supports multiple input methods (SCANF, FGETS, or raw read) based
 * on compilation flags.
 *
 * @param filename  Buffer to store filename parameter if command requires one
 * @return         Command type from commands_t enum
 */
void print_menu()
{
    /* Display menu header */
    printf(YEL "\n\nThis client can support distributed FTP\n\n");
    printf("Currently this program can support following commands \n");
    /* Display available commands */
    printf("get <filename>   : Get the file name in server and print the file\n");
    printf("put <filename>   : if filename does not exists on server, create one. \n");
    printf("delete <filename>: if filename does exists on server, delete that file\n");
    printf("ls               : get the list of all the files/chunks in all server and print it\n");
    printf("exit             : exit from the client program and free the resources in client and server\n");
    printf("server info      : get to know server info\n");
    printf("help             : print this help \n");
    printf("\n" RESET);
}

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
    if ((strncmp(cmd, "ls", strlen("ls")) == 0 && strlen(cmd) == strlen("ls")) || (strncmp(cmd, "list", strlen("list")) == 0 && strlen(cmd) == strlen("list")))
    {
        return LS;
    }
    else if (strncmp(cmd, "get", strlen("get")) == 0 && strlen(cmd) == strlen("get"))
    {
        if (argc != 3)
            goto error;
        *filename = argv[2];
        return GET;
    }
    else if (strncmp(cmd, "put", strlen("put")) == 0 && strlen(cmd) == strlen("put"))
    {
        if (argc != 3)
            goto error;
        *filename = argv[2];
        return PUT;
    }
    else if (strncmp(cmd, "exit", strlen("exit")) == 0 && strlen(cmd) == strlen("exit"))
    {
        return EXIT;
    }
    else if (strncmp(cmd, "delete", strlen("delete")) == 0 && strlen(cmd) == strlen("delete"))
    {
        if (argc != 3)
            goto error;
        *filename = argv[2];
        return DELETE;
    }
    else if ((strncmp(cmd, "serverinfo", strlen("serverinfo")) == 0 && strlen(cmd) == strlen("serverinfo")) || (strncmp(cmd, "info", strlen("info")) == 0 && strlen(cmd) == strlen("info")))
    {
        return SERVER_INFO;
    }
    else if (strncmp(cmd, "help", strlen("help")) == 0 && strlen(cmd) == strlen("help"))
    {
        print_menu();
        return HELP;
    }

error:;
    printf(RED "[-] Wrong command ! \n\r" RESET);
    print_menu();

    return -1;
}
