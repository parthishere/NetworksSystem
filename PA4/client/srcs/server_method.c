

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
    set_timeout(sd, TIMEOUT);

    char recieve_buffer[RECIEVE_SIZE];   // Buffer for incoming packets
    char transmit_buffer[TRANSMIT_SIZE]; // Buffer for outgoing ACK/NACK
    int current_count = 0;               // Expected sequence number
    int retry_count = 0;                 // Number of retry attempts
    uint8_t crc = crc8(0, NULL, 0);      // Initialize CRC calculation

    while (1)
    {
    retry:;
        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Check for end of transmission or errors */
        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA)) == 0)
        {
            printf(GRN "\n\n-- Done -- \n\n" RESET);
            break;
        }
        /* Extract header information */
        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            return;
        }

        /* Verify packet integrity */
        int seq_num = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];

        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        char *temp_ip = getin_addr(sd->their_addr);
        printf(MAG "> %s" RESET, &recieve_buffer[HEADERSIZE]);

        bzero(transmit_buffer, TRANSMIT_SIZE);
        /* Handle packet validation and acknowledgment */
        if ((unsigned)crc_server == (unsigned)crc && seq_num == current_count)
        {
            /* Valid packet received - send ACK */
            memcpy(transmit_buffer, ACK, 7);
            retry_count = 0;
            _send(sd, 7, transmit_buffer);
            current_count++;
        }

        else
        {
            /* Invalid packet or wrong sequence - request retransmission */
            retry_count++;
            memcpy(transmit_buffer, NACK, 7);
            _send(sd, 8, transmit_buffer);
            if (retry_count >= RETRY_COUNT)
            {
                retry_count = 0;
                printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                break;
            }
            goto retry;
        }
    }
    remove_timeout(sd);
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
    set_timeout(sd, TIMEOUT);
    printf("\n\nGET\n\n");

    /* Initialize buffers and counters */
    char recieve_buffer[RECIEVE_SIZE];
    char transmit_buffer[TRANSMIT_SIZE];
    int current_count = 0; // Expected sequence number
    int retry_count = 0;   // Retry counter
    char whole_filename[60];

    /* Prepare local file */
    snprintf(whole_filename, sizeof(whole_filename), "./Downloads/%s", filename);
    FILE *fp = fopen(whole_filename, "wb");
    uint8_t crc = crc8(0, NULL, 0);
    while (1)
    {

        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Check for end of transmission or errors */
        if (strncmp(recieve_buffer, END_OF_DYNAMIC_DATA, strlen(END_OF_DYNAMIC_DATA) + 1) == 0)
        {
            printf(GRN "\n\n--- End of file received. --\n\n" RESET);
            break;
        }

        if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA)) == 0)
        {
            printf(RED "[-] !!!!!!!~~~~~~~~~~ Error somewhere ~~~~~~~~~~!!!!!!! \n" RESET);
            fclose(fp);
            remove(whole_filename); // Clean up partial file
            return;
        }

        /* Process packet header */
        int seq_num = (((recieve_buffer[3] << 8) & 0xFF00) | (recieve_buffer[2] & 0x00FF));
        int data_length = (((recieve_buffer[1] << 8) & 0xFF00) | (recieve_buffer[0] & 0x00FF));
        uint8_t crc_server = recieve_buffer[4];
        crc = crc8(crc, &recieve_buffer[HEADERSIZE], data_length);
        bzero(transmit_buffer, TRANSMIT_SIZE);

        printf("%d %d %d %d\n", seq_num, data_length, crc_server, crc);
        /* Validate packet integrity */ 
        if (crc_server == crc && seq_num == current_count)
        {
            /* Process valid packet */
            retry_count = 0;
            memcpy(transmit_buffer, ACK, strlen(ACK));
            _send(sd, strlen(ACK), transmit_buffer);
            current_count++;
        }
        else
        {
            /* Handle invalid packet */
            retry_count++;
            if (retry_count >= RETRY_COUNT)
                break;
            printf(RED "[-]  Sequence number does not match, asking to re-send the packet \n\r" RESET);
            memcpy(transmit_buffer, NACK, strlen(NACK));
            _send(sd, strlen(NACK), transmit_buffer);

            continue;
        }

        printf(MAG "%s\n" RESET, recieve_buffer + HEADERSIZE);
        fwrite(&recieve_buffer[HEADERSIZE], 1, data_length, fp);
    }

    /* Write data to file */
    printf(GRN "\n\n[+] Downloaded \"%s\" file in Downloads folder\n\n" RESET, filename);
    fclose(fp);
    remove_timeout(sd);
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
    set_timeout(sd, TIMEOUT);
    printf("\n\PUT\n\n");
    char whole_filename[100];

    /* Handle empty filename - switch to manual input mode */
    if (recieve_buffer[0] == '\0')
    {

        printf(RED "[-] File Name is Empty" RESET);
        printf(RED "[-] Going Manual: enter your buffer through stdin(command line:) press ESC key when done \n" RESET);
        printf(RED "[-] \t\t There is 100 sec timeout so write quick :) ! \n\n" RESET);
        remove_timeout(sd);
        return -1;
    }

    /* Prepare file path and open file */
    snprintf(whole_filename, sizeof(whole_filename), "./Downloads/%s", recieve_buffer);

    size_t file_size;
    DIR *dp;
    struct dirent *ep;
    int total_bytes;
    int seq_num = 0;
    int retry_count = 0;

    char transmit_buffer[TRANSMIT_SIZE];
    int fd = open(whole_filename, O_RDONLY);
    if (fd < 0)
    {
        printf(RED "[-] Error Opening File \n" RESET);
        printf(RED "[-] Going Manual: enter your buffer through stdin(command line:) press ESC key when done \n" RESET);
        printf(RED "[-] \t\t There is 100 sec timeout so write quick :) ! \n\n" RESET);
        remove_timeout(sd);
        return -1;
    }
    /* Initialize transfer */
    bzero(transmit_buffer, TRANSMIT_SIZE);
    bzero(recieve_buffer, RECIEVE_SIZE);
    uint8_t crc = crc8(0, NULL, 0);
    /* Read and send file in chunks */
    while ((total_bytes = read(fd, &transmit_buffer[HEADERSIZE], TRANSMIT_SIZE - HEADERSIZE)) > 0)
    {
        if (seq_num >= 0xFFFF)
        {
            break; // Sequence number overflow
        }
    retry:;
        /* Construct packet header */
        transmit_buffer[0] = (total_bytes & 0x00FF);
        transmit_buffer[1] = (total_bytes & 0xFF00) >> 8;
        transmit_buffer[2] = (seq_num & 0x00FF);
        transmit_buffer[3] = (seq_num & 0xFF00) >> 8;
        crc = crc8(crc, &transmit_buffer[HEADERSIZE], total_bytes); // crc
        transmit_buffer[4] = crc;

        /* Send packet and wait for acknowledgment */
        printf("\nSending packet %d (length: %d (%d %d))\n", seq_num, total_bytes, transmit_buffer[0], transmit_buffer[1]);
        printf(MAG "> %s" RESET, transmit_buffer + HEADERSIZE);
        _send(sd, total_bytes + HEADERSIZE, transmit_buffer);

        bzero(recieve_buffer, RECIEVE_SIZE);
        _recv(sd, RECIEVE_SIZE, recieve_buffer);

        /* Handle acknowledgment */
        if (strncmp(recieve_buffer, ACK, 7) == 0)
        {
            bzero(transmit_buffer, TRANSMIT_SIZE);
            seq_num++;
            continue;
        }
        else
        {
            retry_count++;
            if (retry_count >= RETRY_COUNT)
            {
                retry_count = 0;
                printf(RED "[-] Max retries reached. Aborting.\n" RESET);
                break;
            }
            printf(RED "[-]  NACK -> Retry sending the packet \n\r" RESET);
            goto retry;
        }
    }

    /* Complete transfer */
    printf(GRN "\n\n-- End Of File --\n\n" RESET);
    _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);

    close(fd);
    remove_timeout(sd);
    return 0;
}

/**
 * Manual file upload operation with interactive terminal input
 *
 * Implements manual data entry mode for file upload with real-time terminal
 * handling and reliable data transfer protocol. Supports backspace editing
 * and ESC key termination.
 *
 * Terminal Handling:
 * - Disables canonical mode for immediate character processing
 * - Implements custom backspace handling
 * - Provides real-time cursor manipulation
 *
 * Protocol Details:
 * - Header: [2B length][2B sequence][1B CRC]
 * - Maximum timeout: 100 seconds for manual input
 * - Supports packet retransmission
 *
 * @param sd  Pointer to socket details structure
 */
void put_file(sockdetails_t *sd)
{
    set_timeout(sd, 100); // Extended timeout for manual input

    /* Initialize buffers and counters */
    char recieve_buffer[RECIEVE_SIZE];
    char transmit_buffer[TRANSMIT_SIZE];
    int write_pointer = HEADERSIZE; // Current write position in buffer
    int seq_number = 0;             // Packet sequence counter
    int retry_count = 0;            // Retransmission counter
    bool send_data = false;         // Flag to trigger packet transmission
    bool end_of_data = false;       // Flag to mark end of input

    /* Terminal configuration for raw input mode */
    struct termios old_tio, new_tio;
    unsigned char c;

    /* Save current terminal settings */
    tcgetattr(STDIN_FILENO, &old_tio);
    new_tio = old_tio;

    /* Configure terminal for raw input
     * - Disable canonical mode (no line buffering)
     * - Disable echo (manual echo handling)
     */
    new_tio.c_lflag &= (~ICANON & ~ECHO);
    if (tcsetattr(STDIN_FILENO, TCSANOW, &new_tio) < 0)
        perror("tcsetattr");

    /* Initialize display and CRC */
    int column_number = 1;
    uint8_t crc = crc8(0, NULL, 0);

    /* Main input processing loop */
    while (1)
    {
        char ch;
        read(STDIN_FILENO, &ch, 1);

        /* Handle special characters */
        if (ch == 10)
        { // Enter key resets to a new line
            printf("\n");
            column_number = 1;
        }
        else if (ch == 127) // Backspace
        {                   // backspace
            if (column_number <= 1)
            {
            }
            else
            {
                /* Update buffer and display */
                write_pointer--;
                column_number -= 1;

                /* Move cursor left, clear character, reset position */
                printf("\033[1D"); // Move left
                printf(" ");       // Clear character
                printf("\033[1D"); // Move left again
                fflush(stdout);
                continue;
            }
        }
        else // Regular character
        {
            /* Echo character and update cursor position */
            printf(MAG "%c\n" RESET, ch, ch);
            printf("\033[1A");                 // Move cursor up
            printf("\033[%dC", column_number); // Move cursor right
            column_number++;
            fflush(stdout);
        }

        /* Check if buffer is full or ESC pressed */
        if (write_pointer >= TRANSMIT_SIZE - 1 - HEADERSIZE || ch == 27) // -1 as it is index, and index starts from 0;
        {
            /* Determine transmission state based on buffer content and ESC */
            if (ch == 27 && write_pointer > 0)
            {
                send_data = true;
                end_of_data = true;
            }
            else if (ch != 27 && write_pointer > 0)
            {
                send_data = true;
                end_of_data = false;
            }
            else if (ch == 27 && write_pointer == 0)
            {
                send_data = false;
                end_of_data = true;
            }

            /* Handle packet transmission */
            if (send_data)
            {
                /* Construct packet header */
                transmit_buffer[0] = ((write_pointer - HEADERSIZE) & 0xFF);
                transmit_buffer[1] = (((write_pointer - HEADERSIZE) & 0xFF00) >> 8);
                transmit_buffer[2] = (seq_number & 0x00FF);
                transmit_buffer[3] = (seq_number & 0xFF00) >> 8;
                crc = crc8(crc, &transmit_buffer[HEADERSIZE], write_pointer - HEADERSIZE); // crc
                transmit_buffer[4] = crc;

                /* Send packet and process acknowledgment */
                _send(sd, TRANSMIT_SIZE, transmit_buffer);
                write_pointer = HEADERSIZE;

                bzero(recieve_buffer, TRANSMIT_SIZE);
                _recv(sd, RECIEVE_SIZE, recieve_buffer);
                if (strncmp(recieve_buffer, ACK, 7) == 0)
                {
                    /* Successful transmission */
                    bzero(transmit_buffer, TRANSMIT_SIZE);
                    seq_number++;
                    if (seq_number >= 0xFFFF)
                        break; // Sequence number overflow
                }
                else
                {
                    /* Handle retransmission */
                    printf(RED "[-] NACK - Max retries reached. Aborting.\n" RESET);
                    break;
                }
            }

            /* Handle end of transmission */
            if (end_of_data)
            {
                seq_number = 0;
                printf(GRN "\n\n-- End Of File --\n\n" RESET);
                _send(sd, strlen(END_OF_DYNAMIC_DATA), END_OF_DYNAMIC_DATA);
                end_of_data = false;
                break;
            }
        }

        /* Store character in buffer */
        transmit_buffer[write_pointer++] = ch;
    }
    /* Restore terminal settings and cleanup */
    tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
    remove_timeout(sd);
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
    set_timeout(sd, TIMEOUT);
    printf("\n\nDELETE\n\n");

    char recieve_buffer[RECIEVE_SIZE];   // 256bytes
    char transmit_buffer[TRANSMIT_SIZE]; // 256bytes
    bzero(recieve_buffer, RECIEVE_SIZE);
    _recv(sd, RECIEVE_SIZE, recieve_buffer);
    if (strncmp(recieve_buffer, FILE_NOT_FOUND, strlen(FILE_NOT_FOUND)) == 0)
    {
        printf(RED "[-] Could not find the file on server: %s\n" RESET, filename);
        return;
    }
    else if (strncmp(recieve_buffer, ERROR_FOR_DYNAMIC_DATA, strlen(ERROR_FOR_DYNAMIC_DATA) == 0))
    {
        printf(RED "[-] Something went wrong on server\n\n" RESET);
        return;
    }
    printf(GRN "\n\n[+] File: \"%s\" deleted \n\n", filename);
    remove_timeout(sd);
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
    _recv(sd, RECIEVE_SIZE, recieve_buffer);
    if (strncmp(recieve_buffer, ACK, strlen(ACK)) == 0)
    {
        printf(GRN "[+] ACK recieved exiting \n" RESET);
        // done
        close(sd->sockfd);
        exit(EXIT_SUCCESS);
    }
}