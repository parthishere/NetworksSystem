#pragma once

#include "common.h"
#include "http_types.h"


int parse_request_line2(char *request, HttpHeader_t *header);