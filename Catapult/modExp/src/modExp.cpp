#include "../include/modExp.h"
using namespace std;
/**
 * Perform the operation 'base^exp (mod m)' using the memory-efficient method
 *
 * @param base	The base of the expression
 * @param exp	The exponent of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design top
void modExp(UINT64_T base, UINT64_T exp, UINT64_T m, UINT64_T &result){

	UINT64_T result = 1;
	while(exp > 0){
        result = ((UINT64_T)(result * base) % m);
        exp--;
    }


	//return result;
}
