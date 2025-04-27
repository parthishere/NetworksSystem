#include "common.h"
#include "server_method.h"
#include "handle_req.h"






// #define SCANF 1
// #define FGETS 1

void print_menu();




void read_server_conf(sockDetails_t *sd){
    FILE *fs = fopen(SERVER_CONF, "r");
    if(fs == NULL) {
        fprintf(stderr, "[-] Could not open conf file %s \n\r", SERVER_CONF);
        system("ls");
        exit(EXIT_FAILURE);
    }
    char line[1024];
    
    int i = 0;
    char *saved_remaining_line;

    serverDetails_t *current = NULL;
    serverDetails_t *prev = NULL;
    while(fgets(line, sizeof(line)-1, fs) != NULL && sd->number_of_servers<MAX_NUMBER_OF_SERVERS){
        int dfs_no;

        current = malloc(sizeof(serverDetails_t));
        if(sd->servers_details == NULL){
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
    if(sd->number_of_servers <= 0) {
        printf(RED "[-] ERROR: No servers found in configuration file\n" RESET);
        exit(EXIT_FAILURE);
    }

    printf(GRN "[+] SERVER CONFIGURATION: %d server(s) found in config file\n" RESET, sd->number_of_servers);
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

    if((strncmp(WHERE_TO_DOWNLOAD_FILE, ".", strlen(WHERE_TO_DOWNLOAD_FILE)) != 0) &&
     (strlen(WHERE_TO_DOWNLOAD_FILE) == 1)){
        int status = mkdir(WHERE_TO_DOWNLOAD_FILE, 0777); 
        if (status == 0) {
            printf(GRN"[+] Directory '%s' created successfully.\n"RESET, WHERE_TO_DOWNLOAD_FILE);
        } else if (errno == EEXIST) {
            printf(GRN"[+] Directory '%s' already exists.\n"RESET, WHERE_TO_DOWNLOAD_FILE);
        } else {
            perror(RED"[-] Error creating directory");
            exit(EXIT_FAILURE);
        }
    }
    
    
    pthread_mutex_init(&sd.lock, NULL);

    /* Validate command line arguments */
    if (argc < 2)
    {
        printf(RED "[-] ERROR: Invalid command usage\n" RESET);
        printf(RED "    Usage: ./dfc <COMMAND> [FILENAME]\n" RESET);
        print_menu();
        
        exit(EXIT_FAILURE);
    }

    read_server_conf(&sd);

    int filename_index = 2;
    int total_filenames = argc - filename_index;
    
    sd.command_int = whichcmd(argc, argv);
    
    if(sd.command_int >= LS) {
        // Commands without filenames (LS, SERVER_INFO, EXIT)
        sd.filename = NULL; // Ensure filename is NULL for these commands
        handle_req(&sd);
    } else if (total_filenames <= 0) {
        // Command requires a filename but none provided
        printf(RED "[-] ERROR: No filename specified for %s command\n" RESET, 
            sd.command_int == GET ? "GET" : 
            sd.command_int == PUT ? "PUT" : 
            sd.command_int == DELETE ? "DELETE" : "this");
        print_menu();
        exit(EXIT_FAILURE);
    } else {
        // Process each filename individually
        for(int i = 0; i < total_filenames; i++){
            sd.filename = argv[filename_index];
            printf(GRN "[+] Processing file %d of %d: %s\n" RESET, 
                i+1, total_filenames, sd.filename);
            handle_req(&sd);
            filename_index++;
        }
    }

    cleanup_connection(&sd);
    
    return EXIT_SUCCESS;
}
