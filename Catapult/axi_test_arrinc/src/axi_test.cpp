#include "../include/axi_test.h"

#pragma hls_design
void axi_test(ac_sync & run, DATA_TYPE a[16], ac_sync & complete){
    if(run.nb_sync_in()){
        ADD_LOOP: for(unsigned i = 0; i < 16; i++){
            a[i] += 100;
        }
        complete.sync_out();
    }
}