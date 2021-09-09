#include "../include/ntt.h"
#include "../include/config.h"

// #define BIT_REVERSE_INDEX(index, result)\
// {\
//     while(index > 0)\
//         if(index % 2)\
//             result++\
//         index >> 1\
//         result << 1\
// }\

/**
 * Return vector with each element of the input at its bit-reversed position
 *
 * @param vec The vector to bit reverse
 * @param n   The length of the vector, must be a power of two
 * @return    The bit reversed vector
 */
void bit_reverse(uint64_t *vec, uint64_t n, uint64_t * result){

	uint64_t num_bits = log2(n);

	uint64_t reverse_num;
	for(uint64_t i = 0; i < n; i++){

		reverse_num = 0;
		for(uint64_t j = 0; j < num_bits; j++){

			reverse_num = reverse_num << 1;
			if(i & (1 << j)){
				reverse_num = reverse_num | 1;
			}
		}

		result[reverse_num] = vec[i];

	}

}

/**
 * Perform the operation 'base (mod m)'
 *
 * @param base	The base of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
uint64_t modulo(int64_t base, int64_t m){

	int64_t result = base % m;
	return (result >= 0) ? result : result + m;

}

/**
 * Perform the operation 'base^exp (mod m)' using the memory-efficient method
 *
 * @param base	The base of the expression
 * @param exp	The exponent of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
uint64_t modExp(uint64_t base, uint64_t exp, uint64_t m){

	uint64_t result = 1;
	
	while(exp > 0){

		if(exp % 2){

			result = modulo(result*base, m);

		}

		exp = exp >> 1;
		base = modulo(base*base,m);
	}

	return result;

}
/**
 * Perform an in-place iterative breadth-first decimation-in-frequency Cooley-Tukey NTT on an input vector and return the result
 *
 * @param vec 	The input vector to be transformed
 * @param n	The size of the input vector
 * @param p	The prime to be used as the modulus of the transformation
 * @param r	The primitive root of the prime
 * @param rev	Whether to perform bit reversal on the output vector
 * @return 	The transformed vector
 */
void inPlaceNTT_DIF(uint64_t *vec, uint64_t p, uint64_t r, uint64_t * result){


	for(unsigned i = 0; i < VECTOR_SIZE; i++){
		result[i] = vec[i];
	}

	uint64_t factor1, factor2;
	unsigned m, k_, a;
	for(unsigned i = VECTOR_SIZE_LOG2; i >= 1; i--){

		m = 1 << i;

		k_ = (uint64_t)(p - 1)/m;
		a = modExp(r,k_,p);

		for(unsigned j = 0; j < VECTOR_SIZE; j+=m){

			for(unsigned k = 0; k < m/2; k++){

				factor1 = result[j + k];
				factor2 = result[j + k + m/2];

				result[j + k] 		= modulo((uint64_t)(factor1 + factor2),p);
				result[j + k + m/2]	= modulo((uint64_t)(modExp(a,k,p)*modulo(factor1 - factor2,p)),p);

			}
		}
	}
	
}

/**
 * Perform an in-place iterative breadth-first decimation-in-time Cooley-Tukey NTT on an input vector and return the result
 *
 * @param vec 	The input vector to be transformed
 * @param n	The size of the input vector
 * @param p	The prime to be used as the modulus of the transformation
 * @param r	The primitive root of the prime
 * @param rev	Whether to perform bit reversal on the input vector
 * @return 	The transformed vector
 */
void inPlaceNTT_DIT(uint64_t *vec, uint64_t n, uint64_t p, uint64_t r, bool rev, uint64_t * result){

	if(rev){
		bit_reverse(vec,n,result);
	}else{
		for(uint64_t i = 0; i < n; i++){	
			result[i] = vec[i];
		}
	}

	uint64_t m,k_,a,factor1,factor2;
	for(uint64_t i = 1; i <= log2(n); i++){ 

		m = pow(2,i);

		k_ = (p - 1)/m;
		a = modExp(r,k_,p);

		for(uint64_t j = 0; j < n; j+=m){

			for(uint64_t k = 0; k < m/2; k++){

				factor1 = result[j + k];
				factor2 = modulo(modExp(a,k,p)*result[j + k + m/2],p);
			
				result[j + k] 		= modulo(factor1 + factor2, p);
				result[j + k+m/2] 	= modulo(factor1 - factor2, p);

			}
		}

		//printVec(result,n);
	}

	//return result;

}
