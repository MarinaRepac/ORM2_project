#pragma once

#include <arpa/inet.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef struct custom_header {
	uint16_t seq_no;	// Sequence number
} custom_header;

custom_header create_custom_header(uint16_t seq_no);
