#pragma once

#include "common.h"
#include "parser.h"


void parse_request_line(char *request, HttpHeader_t *header);
void build_and_send_header(HttpHeader_t *request_header, sockdetails_t *sd);    
void *handle_req(sockdetails_t sd);

