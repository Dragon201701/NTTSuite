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
    
    const unsigned VECTOR_COUNT = 3;  // number of vectors to test
    for (unsigned iter=0; iter<VECTOR_COUNT; iter++) {
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
        CCS_DESIGN(axi_test)(run, a, complete);
        complete.sync_in();
        // check the results:
        cout << __FILE__ <<
                ":Checking " << 16 << " output values..." <<
                endl;
        for(unsigned i = 0; i < 16; i++){
            if(a[i] != i * iter + 100){
                error_count++;
                cout << __FILE__ << ":Result mismatch running iter=" << iter << "A["<<i<<"]="<<a[i]<<endl;
            }
        }    
    }
    
    cout << __FILE__ <<
        ":Testbench Complete with " << error_count <<
        " mismatches, after running " << VECTOR_COUNT << " iteration(s)." <<
        endl;
    cout << __FILE__ << ":" << __LINE__ << " - End of testbench." << endl;
	CCS_RETURN(error_count);
}