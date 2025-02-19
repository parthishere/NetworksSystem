#pragma once

#include "common.h"
#include "http_types.h"


int parse_request_line(char *request, HttpHeader_t *header);
void build_header(HttpHeader_t *request_header, char **return_request, int *return_size);
void *handle_req(sockdetails_t sd);

