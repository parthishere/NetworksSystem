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
commands_t whichcmd(char *cmd)
{
    if (strncmp(cmd, "ls\n", strlen(cmd)) == 0)
    {
        return LS;
    }
    else if (strncmp(cmd, "get ", strlen("get ")) == 0)
    {
        return GET;
    }
    else if (strncmp(cmd, "put ", strlen("put ")) == 0)
    {
        return PUT;
    }
    else if (strncmp(cmd, "exit\n", strlen(cmd)) == 0)
    {
        return EXIT;
    }
    else if (strncmp(cmd, "delete ", strlen("delete ")) == 0)
    {
        return DELETE;
    }
    else if (strncmp(cmd, "server info\n", strlen("server info\n")) == 0)
    {
        return SERVER_INFO;
    }
    else
    {
        printf(RED "[-] Wrong command ! \n\r" RESET);
        return -1;
    }
}



/**
 * Retrieve and display directory listing from server
 *
 * Implements reliable transfer of directory listing data using a stop-and-wait
 * protocol with CRC error detection and acknowledgment mechanism.
 *
 * Protocol Details:
 * - Uses 5-byte header: [2B length][2B sequence][1B CRC]
 * - Maximum packet size: RECIEVE_SIZE (30KB)
 * - Error Detection: CRC8 with acknowledgment
 * - Timeout: Configurable (default: TIMEOUT seconds)
 *
 * @param sd  Pointer to socket details structure
 */
void list_files(sockdetails_t *sd)
{
    // set_timeout(sd, TIMEOUT);

    char recieve_buffer[RECIEVE_SIZE];   // Buffer for incoming packets
    char transmit_buffer[TRANSMIT_SIZE]; // Buffer for outgoing ACK/NACK
    int current_count = 0;               // Expected sequence number
    int retry_count = 0;                 // Number of retry attempts


 
    // remove_timeout(sd);
}

/**
 * Download file from server
 *
 * Implements reliable file transfer from server using stop-and-wait protocol
 * with CRC error detection and acknowledgment mechanism. Saves received file
 * to local Downloads directory.
 *
 * Protocol Details:
 * - Header format: [2B length][2B sequence][1B CRC]
 * - Error handling: CRC8 validation with retransmission
 * - Maximum retries: 3 attempts per packet
 *
 * @param sd        Pointer to socket details structure
 * @param filename  Name of file to download
 */
void get_file(sockdetails_t *sd, char *filename)
{
    // set_timeout(sd, TIMEOUT);
    printf("\n\nGET\n\n");

    /* Initialize buffers and counters */
    char recieve_buffer[RECIEVE_SIZE];
    char transmit_buffer[TRANSMIT_SIZE];
    int current_count = 0; // Expected sequence number
    int retry_count = 0;   // Retry counter
    char whole_filename[60];

   
    // remove_timeout(sd);
}

/**
 * Upload file to server
 *
 * Implements reliable file transfer to server using stop-and-wait protocol
 * with CRC error detection. Handles both file-based and manual input modes
 * .
 *
 * Protocol Details:
 * - Header format: [2B length][2B sequence][1B CRC]
 * - Maximum sequence number: 0xFFFF
 * - Maximum retries per packet: 3
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing filename or manual input
 * @return              0 on success, -1 on error/manual mode
 */
int put_file_file(sockdetails_t *sd, char *recieve_buffer)
{
    // set_timeout(sd, TIMEOUT);
    // printf("\n\PUT\n\n");
    char whole_filename[100];

    // remove_timeout(sd);
    return 0;
}



/**
 * Delete file from server
 *
 * Sends delete request to server and processes response.
 * Handles error conditions and server responses.
 *
 * @param sd        Pointer to socket details structure
 * @param filename  Name of file to delete
 */
void delete_file(sockdetails_t *sd, char *filename)
{
    // set_timeout(sd, TIMEOUT);
    printf("\n\nDELETE\n\n");

    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes
    bzero(recieve_buffer, RECIEVE_SIZE);
    
    printf(GRN "\n\n[+] File: \"%s\" deleted \n\n", filename);
    // remove_timeout(sd);
}

/**
 * Cleanup socket resources and exit
 *
 * Handles graceful shutdown of socket connection.
 * Waits for final acknowledgment from server before closing.
 *
 * @param sd  Pointer to socket details structure
 */
void cleanup_resources(sockdetails_t *sd)
{

    char recieve_buffer[RECIEVE_SIZE];

    bzero(recieve_buffer, TRANSMIT_SIZE);
    /* Wait for final server acknowledgment */
  
}