#ifndef AXI_TEST_H_
#define AXI_TEST_H_

#include "ac_int.h"
#include "ac_sync.h"

typedef ac_int<32, false> DATA_TYPE;

void axi_test(ac_sync & run, DATA_TYPE a[16], DATA_TYPE b[16], ac_sync & complete);

#endif