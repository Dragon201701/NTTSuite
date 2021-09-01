
#include "../include/ntt.h"

/**
 * Perform the operation 'base^exp (mod m)' using the memory-efficient method
 *
 * @param base	The base of the expression
 * @param exp	The exponent of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design ccore
UINT64_T modulo_dev(UINT64_T base, UINT64_T m){

	UINT64_T result = base % m;
	
	return result >= 0? (UINT64_T) result : (UINT64_T) (result + m);

}
 
/*#pragma hls_design inline
UINT64_T modExp_dev(UINT64_T base, UINT64_T exp, UINT64_T m){

	UINT64_T result = 1;
	
	while(exp > 0){

		if(exp % 2){

			result = (result * base) % m;

		}

		exp = exp >> 1;
		base = (base * base) % m;
	}

	return result;

}*/
#pragma hls_design top
void inPlaceNTT_DIF(UINT64_T vec[VECTOR_SIZE], UINT64_T p, UINT64_T r, UINT64_T twiddle[VECTOR_SIZE]){
    UINT64_T factor1, factor2;

	unsigned m;
	STAGE_LOOP: for(unsigned i = VECTOR_ADDR_BIT; i > 0; i--){ 
		m = 1 << i;
		VEC_LOOP: for(unsigned  j = 0; j < VECTOR_SIZE; j+=m){
			COMP_LOOP: for(unsigned k = 0; k < m/2; k++){
		        //UINT64_T tmp = twiddle[(1 << (VECTOR_ADDR_BIT - i)) * k];
				UINT64_T twiddle_f = twiddle[m/2 - 1 + k];
				factor1 = vec[j + k];
				factor2 = vec[j + k + m/2];
				vec[j + k] = modulo_dev(factor1 + factor2, p);
				vec[j + k + m/2] = modulo_dev(twiddle_f * modulo_dev(factor1 - factor2, p), p);
			}
		}
	}
	
}