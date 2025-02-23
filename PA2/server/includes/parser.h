#pragma once

#include "common.h"


int parse_request_line_thread_safe(char *request, HttpHeader_t *header);