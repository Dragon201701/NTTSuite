//#include <cstdlib> 		/* malloc() */
#include <iostream>
using namespace std;
#include <stdlib.h>
#include <mc_scverify.h>

#include "../include/axi_test.h"

CCS_MAIN(int argc, char **argv){
    // DATA_TYPE a[16], b[16], d[16];
    DATA_TYPE a[16], b[16];
    ac_sync        run, complete;
    unsigned       error_count = 0;

    for (unsigned iter=0; iter<3; iter++) {
        // fill op1 and op2 arrays with random data:
        for(unsigned i = 0; i < 16; i++){
            a[i] = i * iter;
        }

        run.sync_out();
// #ifdef CCS_SCVERIFY
//         if (iter==0) {
//             // due to the nb_sync_in, we need to ignore the first output compare
//             // because result will not have been initialized with any values
//             testbench::result_ignore = true;
//         }
// #endif
        CCS_DESIGN(axi_test)(run, a, b, complete);
        complete.sync_in();
        for(unsigned i = 0; i < 16; i++){
            if(b[i] != a[i] + 100){
                error_count++;
            }
        }    
    }
    
    
    cout << __FILE__ << ":" << __LINE__ << " - End of testbench." << endl;
	CCS_RETURN(error_count);
}