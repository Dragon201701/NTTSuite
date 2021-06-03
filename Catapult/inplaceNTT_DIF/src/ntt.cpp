
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
    unsigned k_;
    unsigned a;
    //UINT64_T i;
    //mgc_ac_log2(n, i);
	STAGE_MAIN_LOOP:for(unsigned i = VECTOR_ADDR_BIT; i >= 1; i--){

		m = 2^i;

		k_ = ((UINT64_T)(p - 1))/m;
		a = modExp(r,k_,p);

		STAGE_VEC_LOOP:for(unsigned j = 0; j < VECTOR_SIZE; j+=m){

			COMP_LOOP: for(unsigned k = 0; k < m/2; k++){

				factor1 = result[j + k];
				factor2 = result[j + k + m/2];

				result[j + k] 		= (factor1 + factor2) % p;
				result[j + k + m/2]	= ((modExp(a,k,p) * ((factor1 - factor2) % p))) % p;

			}
		}
	}
	
	/*if(rev){
		return bit_reverse(result,n);
	}else{
		return result;
	}*/
}