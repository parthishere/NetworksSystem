#include "common.h"



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
        printf("exit");
        return EXIT;
    }
    else if (strncmp(cmd, "delete ", strlen("delete ")) == 0)
    {
        return DELETE;
    }
    else
    {
        printf(RED "[-] Wrong command try again \n\r" RESET);
        return -1;
    }
}


/**
 * List Directory Contents with Reliable Transfer
 *
 * Implements reliable directory listing transmission over UDP using
 * stop-and-wait protocol with CRC error detection and acknowledgment.
 * Sends each filename as a separate packet with sequence numbers.
 *
 * Protocol Flow:
 * 1. Read directory entry
 * 2. Construct packet with header
 * 3. Send and wait for ACK
 * 4. Retry on NACK up to RETRY_COUNT times
 *
 * @param sd  Pointer to socket details structure
 */
void list_files(sockDetails_t *sd)
{
    // set_timeout(sd, TIMEOUT);
    printf("\n\nLS\n\n");

    // /* Initialize directory scanning */
    
    // int total_bytes;
    // int retry_count = 0;

    // /* Initialize transmission buffers and CRC */
    // char recieve_buffer[RECIEVE_SIZE]; // 256bytes
    // char transmit_buffer[TRANSMIT_SIZE];
    // uint8_t crc = crc8(0, NULL, 0);
    // 
    
    //     retry:;
    //         /* Prepare filename packet */
    //         
    //        

    //         /* Construct packet header
    //          * Format: [2B length][2B sequence][1B CRC][data]
    //          */
    //         char packet[TRANSMIT_SIZE + HEADERSIZE];
    //         packet[0] = (record_len & 0x00FF); // packet lenght
    //         packet[1] = ((record_len & 0xFF00) >> 8);
    //         packet[2] = (seq_num & 0x00FF);
    //         packet[3] = (seq_num & 0xFF00) >> 8;
    //         crc = crc8(crc, transmit_buffer, record_len); // crc
    //         packet[4] = crc;

    //         // for better readability
    //         *(transmit_buffer + record_len) = '\n';
    //         record_len++;

    //         /* Send packet and handle acknowledgment */
    //         memcpy(packet + HEADERSIZE, transmit_buffer, record_len);
    //         _send(sd, record_len + HEADERSIZE, packet);
    //         printf(MAG "> %s" RESET, transmit_buffer);

    //         bzero(recieve_buffer, sizeof(recieve_buffer));
    //         _recv(sd, RECIEVE_SIZE, recieve_buffer);

    //         /* Process acknowledgment */
    //         if (strncmp(recieve_buffer, ACK, 7) == 0)
    //         {
    //             // got the ack we can append
    //             seq_num++;
    //             retry_count = 0;
    //             continue;
    //         }
    //         else
    //         {
    //             if (retry_count >= RETRY_COUNT)
    //             {
    //                 printf(RED "[-] Max retries reached. Aborting.\n" RESET);
    //                 break;
    //             }
    //             printf(RED "[-] NACK -> Retry sending the packet\n" RESET);
    //             goto retry;
    //         }
    //     }

    //     /* Send end-of-transmission marker */
    //     _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

    //     closedir(dp);
    // }
    // remove_timeout(sd);
}

/**
 * Handle GET File Request
 *
 * Implements reliable file transfer from server to client using
 * stop-and-wait protocol with error detection and retransmission.
 *
 * Protocol Features:
 * - CRC-based error detection
 * - Sequence number tracking
 * - Automatic retransmission on NACK
 * - Maximum retry limit
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing the GET request
 */
void get_file(sockDetails_t *sd, char *recieve_buffer)
{
    // set_timeout(sd, TIMEOUT);
    printf("\n\nGET\n\n");
    // char filename[50];
    // /* Extract filename from request */
    // sscanf(&recieve_buffer[strlen("get") + 1], "%s", filename);

    // /* Validate filename */
    // if (filename[0] == '\0')
    // {
    //     printf(RED "[-] File Name is Empty" RESET);
    //     _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
    //     remove_timeout(sd);
    //     return;
    // }

    // /* Initialize transfer parameters */
    // size_t file_size;
    // DIR *dp;
    // struct dirent *ep;
    // int total_bytes;
    // int seq_num = 0;
    // int retry_count = 0;

    // char transmit_buffer[TRANSMIT_SIZE];

    // /* Open and validate file */
    // int fd = open(filename, O_RDONLY);
    // if (fd < 0)
    // {
    //     printf(RED "[-] Error Opening File \n" RESET);
    //     _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
    //     remove_timeout(sd);
    //     return;
    // }

    // /* Initialize transfer buffers and CRC */
    // bzero(transmit_buffer, TRANSMIT_SIZE);
    // bzero(recieve_buffer, RECIEVE_SIZE);
    // uint8_t crc = crc8(0, NULL, 0);

    // /* Read and send file in chunks */
    // while ((total_bytes = read(fd, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE)) > 0)
    // {
    //     /* Check sequence number overflow */
    //     if (seq_num >= 0xFFFF)
    //     {
    //         break;
    //     }
    // retry:;
    //     /* Construct packet header */
    //     transmit_buffer[0] = (total_bytes & 0x00FF);      // Length low byte
    //     transmit_buffer[1] = (total_bytes & 0xFF00) >> 8; // Length high byte
    //     transmit_buffer[2] = (seq_num & 0x00FF);          // Sequence low byte
    //     transmit_buffer[3] = (seq_num & 0xFF00) >> 8;     // Sequence high byte
    //     crc = crc8(crc, &transmit_buffer[HEADERSIZE], total_bytes);
    //     transmit_buffer[4] = crc;

    //     /* Send packet and display progress */
    //     printf("\nSending packet %d (length: %d (%d %d))\n", seq_num, total_bytes, transmit_buffer[0], transmit_buffer[1]);
    //     printf(MAG "> %s" RESET, transmit_buffer + HEADERSIZE);
    //     _send(sd, total_bytes + HEADERSIZE, transmit_buffer);

    //     /* Wait for acknowledgment */
    //     bzero(recieve_buffer, RECIEVE_SIZE);
    //     _recv(sd, RECIEVE_SIZE, recieve_buffer);

    //     /* Process acknowledgment */
    //     if (strncmp(recieve_buffer, ACK, 7) == 0)
    //     {
    //         bzero(transmit_buffer, TRANSMIT_SIZE);
    //         seq_num++;
    //         continue;
    //     }
    //     else
    //     {
    //         retry_count++;
    //         if (retry_count >= RETRY_COUNT)
    //         {
    //             retry_count = 0;
    //             printf(RED "[-] Max retries reached. Aborting.\n" RESET);
    //             break;
    //         }
    //         printf(RED "[-]  NACK -> Retry sending the packet \n\r" RESET);
    //         goto retry;
    //     }
    // }

    // /* Complete transfer */
    // printf(GRN "\n\n-- End Of File --\n\n" RESET);
    // _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

    // close(fd);
    // remove_timeout(sd);
}

/**
 * Handle DELETE File Operation
 *
 * Implements file deletion with existence verification and error handling.
 * Searches current directory for file and removes if found.
 *
 * @param sd             Pointer to socket details structure
 * @param recieve_buffer Buffer containing DELETE command and filename
 */
void delete_file(sockDetails_t *sd, char *recieve_buffer)
{
    /* Set standard timeout and extract filename */
    // set_timeout(sd, TIMEOUT);
    printf("\n\nDELETE\n\n");
    // char filename[50];
    // sscanf(&recieve_buffer[strlen("delete") + 1], "%s", filename);
    // /* Validate filename */
    // if (filename[0] == '\0')
    // {
    //     printf(RED "[-] File Name is Empty\n" RESET);
    //     _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
    //     remove_timeout(sd);
    //     return;
    // }

    // /* Initialize directory scanning */
    // DIR *dp;
    // struct dirent *ep;
    // int total_bytes;

    // char transmit_buffer[TRANSMIT_SIZE];
    // /* Open and scan current directory */
    // dp = opendir("./");
    // if (dp != NULL)
    // {
    //     int seq_num = 0;
    //     while ((ep = readdir(dp)) != NULL)
    //     {
    //         /* Check for matching filename */
    //         if (strncmp(ep->d_name, filename, strlen(ep->d_name)) == 0)
    //         {
    //             printf(GRN "[+] Found the file %s, deleting it\n" RESET, filename);
    //             bzero(transmit_buffer, sizeof(transmit_buffer));
    //             _send(sd, sizeof(ACK), ACK);
    //             remove(ep->d_name);
    //             closedir(dp);
    //             remove_timeout(sd);
    //             return;
    //         }
    //     }

    //     /* Handle file not found */
    //     printf(RED "[-] Could not find the file: %s\n" RESET, filename);
    //     _send(sd, strlen(FILE_NOT_FOUND), FILE_NOT_FOUND);
    //     closedir(dp);
    // }
    // else
    // {   
    //     /* Handle directory access error */
    //     printf(RED "[-] Something went wrong while opening PWD\n" RESET);
    //     _send(sd, strlen(ERROR_FOR_DYNAMIC_DATA), ERROR_FOR_DYNAMIC_DATA);
    // }
    // remove_timeout(sd);
}
