#include <cmath>		/* log2(), pow() */
#include <cstdint>		/* uint64_t */

//#include <iostream>

//#include "../include/utils.h"	/* bit_reverse(), modExp(), modulo() */

#include "../include/ntt.h" 	//INCLUDE HEADER FILE
#include <ac_int.h>
#include <ac_math.h>
/**
 * Perform the operation 'base (mod m)'
 *
 * @param base	The base of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design inline
VEC_T modulo(INT64_T base, PARAM_T m){

	INT64_T q;
	
	INT64_T result = base % m;
	return (result >= 0) ? (VEC_T)result : (VEC_T)(result + m);

}
/**
 * We are using this right now mostly.
 * Perform an in-place iterative breadth-first decimation-in-time Cooley-Tukey NTT on an input vector using precomputed 
 * twiddle factors and return the result
 *
 * @param vec 		The input vector to be transformed
 * @param n		The size of the input vector
 * @param p		The prime to be used as the modulus of the transformation
 * @param r		The primitive root of the prime
 * @param twiddle	The precomputed list of necessary twiddle factors
 * @param rev		Whether to perform bit reversal on the input vector
 * @return 		The transformed vector
 */
#pragma hls_design top
void inPlaceNTT_DIT_precomp(VEC_T vec[VECTOR_SIZE],  PARAM_T p, PARAM_T r, VEC_T twiddle[VECTOR_SIZE]){
	VEC_T factor1, factor2;
	unsigned m;
	STAGE_LOOP: for(unsigned i = 1; i < VECTOR_ADDR_BIT; i++){ 

		m = 1 << i;

		VEC_LOOP: for(unsigned  j = 0; j < VECTOR_SIZE; j+=m){
			
			COMP_LOOP: for(unsigned k = 0; k < m >> 1; k++){

				factor1 = vec[j + k];
				factor2 = (twiddle[(1 << (i-1)) - 1 + k] * vec[j + k + m >> 1]) % p;
				vec[j + k] = modulo(factor1 + factor2, p);
				vec[j + k + m >> 1] = modulo(factor1 - factor2, p);

			}
		}
	}


	//return result;

}

