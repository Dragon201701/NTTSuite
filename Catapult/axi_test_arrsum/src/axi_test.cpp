#include "../include/axi_test.h"

#pragma hls_design top

void axi_test(ac_sync & run, DATA_TYPE a[16], DATA_TYPE &arrsum, ac_sync & complete){
    DATA_TYPE sum = 0;
    if(run.nb_sync_in()){
        ADD_LOOP: for(unsigned i = 0; i < 16; i++){
            sum += a[i];
        }
        arrsum = sum;
        complete.sync_out();
    }
}