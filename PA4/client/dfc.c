#include "common.h"
#include "server_method.h"
#include "handle_req.h"






// #define SCANF 1
// #define FGETS 1

void print_menu();




void read_server_conf(sockDetails_t *sd){
    FILE *fs = fopen(SERVER_CONF, "r");
    char line[1024];
    
    int i = 0;
    char *saved_remaining_line;

    serverDetails_t *current = NULL;
    serverDetails_t *prev = NULL;
    while(fgets(line, sizeof(line)-1, fs) != NULL && sd->number_of_servers<MAX_NUMBER_OF_SERVERS){
        int dfs_no;

        current = malloc(sizeof(serverDetails_t));
        if(sd->servers_details == NULL){
            printf("saved first occurance \n\r");
            sd->servers_details = current;
        }
        else{
            prev->next = current;
        }

        char *line_dup = strdup(line);
        char *tok = strtok_r(line, " ", &saved_remaining_line);

        tok = strtok_r(NULL, " ", &saved_remaining_line);
        sscanf(tok, "dfs%d", &dfs_no);
        tok = strtok_r(NULL, ":", &saved_remaining_line);
        
        current->server_ip = strndup(tok, strlen(tok)); // free
        if(current->server_ip == NULL) exit(EXIT_FAILURE);
        
        tok = strtok_r(NULL, "\n", &saved_remaining_line);
        current->server_port = strndup(tok, strlen(tok)); // free
        
        if(current->server_port == NULL) exit(EXIT_FAILURE);

        current->dfsno = dfs_no;
        sd->number_of_servers++;

        prev = current;
        
        free(line_dup);
        i++;
    }

    printf("Number of servers configured %d \n", sd->number_of_servers);
    fclose(fs);
}




/**
 * Main entry point for FTP client application
 *
 * Initializes network connection, creates required directories, and handles
 * the main command processing loop. Supports both IPv4 and IPv6 connections
 * through UDP socket communication.
 *
 * Command Line Arguments:
 * @param argc     Number of arguments (must be 3)
 * @param argv     Argument array:
 *                 argv[1] - Server IP address
 *                 argv[2] - Server port number
 *
 * @return EXIT_SUCCESS on normal termination, EXIT_FAILURE on error
 */
int main(int argc, char *argv[])
{
    sockDetails_t sd;
    sd.servers_details = NULL;
    
    pthread_mutex_init(&sd.lock, NULL);

    /* Validate command line arguments */
    if (argc != 3 && argc != 2)
    {
        printf(RED "[-] You messed up, command is ./dfc <COMMAND> <FILENAME>\n" RESET);
        print_menu();
        
        exit(EXIT_FAILURE);
    }

    read_server_conf(&sd);
    char *filename = NULL;
    sd.command_int = whichcmd(argc, argv, &filename);
    sd.filename = filename;
    
    if(filename){
        handle_req(&sd);
    }
    else{
        exit(EXIT_SUCCESS);
    }

    return EXIT_SUCCESS;
}

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
