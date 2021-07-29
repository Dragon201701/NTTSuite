#include "../include/ntt.h"
/**
 * Perform the operation 'base (mod m)'
 *
 * @param base	The base of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design ccore
UINT64_T modulo_dev(ac_int<64, true> base, UINT64_T m){
	ac_int<64, true> q, result;
	result = base % m;
	return (result >= 0) ? (UINT64_T)result : (UINT64_T)(result + m);
}
/**
 * Perform the operation 'base^exp (mod m)' using the memory-efficient method
 *
 * @param base	The base of the expression
 * @param exp	The exponent of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design inline
UINT64_T modExp_dev(UINT64_T base, UINT64_T exp, UINT64_T m){
	UINT64_T result = 1, q = 1;
	while(exp > 0){
        result = ((UINT64_T)(result * base) % m);
        exp--;
    }
	return result;
}
#pragma hls_design top
void inPlaceNTT_DIF(UINT64_T vec[VECTOR_SIZE], UINT64_T p, UINT64_T r){
    UINT64_T factor1, factor2;
	UINT64_T m, k_, a, q;
	STAGE_MAIN_LOOP:for(unsigned i = VECTOR_ADDR_BIT; i >= 1; i--){
		m = 1 << (i - 1);
		k_ = ((UINT64_T)(p - 1))/m;
		a = modExp_dev(r,k_,p);

		STAGE_VEC_LOOP:for(unsigned j = 0; j < VECTOR_SIZE; j+=m){

			COMP_LOOP: for(unsigned k = 0; k < (m >> 1); k++){

				factor1 = vec[j + k];
				factor2 = vec[(UINT64_T)(j + k + (m >> 1))];

				vec[j + k] 		= modulo_dev(ac_int<64, true>(factor1 + factor2),  p);
				//vec[j + k + m >> 1]	= ((modExp(a,k,p) * ((factor1 - factor2) % p))) % p;
				vec[(UINT64_T)(j + k + (m >> 1))]	= modulo_dev((modExp_dev(a,k,p) * modulo_dev(ac_int<64, true>(factor1 - factor2), p)), p);
			}
		}
	}
}