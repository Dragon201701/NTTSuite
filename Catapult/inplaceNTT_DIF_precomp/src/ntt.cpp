
#include "../include/ntt.h"

/**
 * Perform the operation 'base^exp (mod m)' using the memory-efficient method
 *
 * @param base	The base of the expression
 * @param exp	The exponent of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design inline
UINT64_T modExp(UINT64_T base, UINT64_T exp, UINT64_T m){

	UINT64_T result = 1;
	
	while(exp > 0){

		if(exp % 2){

			result = (result * base) % m;

		}

		exp = exp >> 1;
		base = (base * base) % m;
	}

	return result;

}
#pragma hls_design top
void inPlaceNTT_DIF(VEC_T vec[VECTOR_SIZE], UINT64_T p, UINT64_T r, VEC_T result[VECTOR_SIZE]){
	COPY_LOOP:for(unsigned i = 0; i < VECTOR_SIZE; i++){
		result[i] = vec[i];
	}
    	UINT64_T factor1, factor2;
	unsigned m;
	STAGE_LOOP: for(unsigned i = VECTOR_ADDR_BIT; i > 0; i--){ 
		m = 1 << i;
		VEC_LOOP: for(unsigned  j = 0; j < VECTOR_SIZE; j+=m){
			COMP_LOOP: for(unsigned k = 0; k < m >> 1; k++){
		        	VEC_T tmp = twiddle[(1 << (VECTOR_ADDR_BIT - i)) * k];
				factor1 = vec[j + k];
				factor2 = vec[j + k + m >> 1];
				vec[j + k + m >> 1] = modulo(tmp * modulo(factor1 - factor2, p), p);
				vec[j + k] = modulo(factor1 + factor2, p);
			}
		}
	}
	
	/*if(rev){
		return bit_reverse(result,n);
	}else{
		return result;
	}*/
}