#include <cstdlib> 		/* malloc() */
#include <iostream>

#include <mc_scverify.h>

#include "../include/ntt.h"
#include "../include/config.h"

using namespace std;

void printVec(UINT64_T *vec){

	std::cout << "[";
	for(unsigned i = 0; i < VECTOR_SIZE; i++){

		std::cout << vec[i] << ",";

	}
	std::cout << "]" << std::endl;

}
/**
 * Perform the operation 'base (mod m)'
 *
 * @param base	The base of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
UINT64_T modulo(INT64_T base, UINT64_T m){

	INT64_T result = base % m;
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
UINT64_T modExp(UINT64_T base, UINT64_T exp, UINT64_T m){

	UINT64_T result = 1;
	
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
UINT64_T *inPlaceNTT_DIF_golden(UINT64_T *vec, UINT64_T p, UINT64_T r){

	UINT64_T *result;
	result = (UINT64_T *) malloc(VECTOR_SIZE*sizeof(UINT64_T));

	for(unsigned i = 0; i < VECTOR_SIZE; i++){
		result[i] = vec[i];
	}

	UINT64_T m,k_,a,factor1,factor2;
	for(unsigned i = VECTOR_ADDR_BIT; i >= 1; i--){

		m = 1 << i;

		k_ = (p - 1)/m;
		a = modExp(r,k_,p);

		for(unsigned j = 0; j < VECTOR_SIZE; j+=m){

			for(unsigned k = 0; k < m/2; k++){

				factor1 = result[(UINT64_T)(j + k)];
				factor2 = result[(UINT64_T)(j + k + m/2)];

				result[(UINT64_T)(j + k)] 		= modulo((UINT64_T)(factor1 + factor2),p);
				result[(UINT64_T)(j + k + m/2)]	= modulo((UINT64_T)(modExp(a,k,p)*modulo(factor1 - factor2,p)),p);

			}
		}
	}
	
    return result;
}

UINT64_T *randVec(UINT64_T max){
	UINT64_T *vec = (UINT64_T *)malloc(VECTOR_SIZE * sizeof(UINT64_T));
	srand(time(0));
	for(unsigned i = 0; i < VECTOR_SIZE; i++){
		vec[i] = rand() % (max + 1);
	}
	return vec;
}
void randVec(UINT64_T * vec, UINT64_T max){
	srand(time(0));
	for(unsigned i = 0; i < VECTOR_SIZE; i++){
		vec[i] = rand() % (max + 1);
	}
}
void randVec(UINT64_T * vec, UINT64_T * vec2, UINT64_T max){
	srand(time(0));
	for(unsigned i = 0; i < VECTOR_SIZE; i++){
		UINT64_T value = rand() % (max + 1);
		vec[i] = value;
		vec2[i] = value;
	}
}
bool compVec(UINT64_T *vec1, UINT64_T *vec2, bool debug){
	bool comp = true;
	for(unsigned i = 0; i < VECTOR_SIZE; i++){

		if(vec1[i] != vec2[i]){
			comp = false;

			if(debug){
				std::cout << "(vec1[" << i << "] : " << vec1[i] << ")";
				std::cout << "!= (vec2[" << i << "] : " << vec2[i] << ")";
				std::cout << std::endl;
			}else{
				break;
			}
		}
	}
	return comp;
}
void gettwiddle(UINT64_T *twiddle, UINT64_T p, UINT64_T r){
	for(unsigned i = VECTOR_ADDR_BIT; i >= 1; i--){
		unsigned m = 1 << i;
		UINT64_T k_ = (p - 1)/m;
		UINT64_T a = modExp(r, k_, p);
		for(unsigned k = 0; k < m/2; k++){
			twiddle[m/2 - 1 + k] = modExp(a, k, p);
		}
	}
}
CCS_MAIN(int argc, char **argv){

	UINT64_T p = 68719403009;
	UINT64_T r = 36048964756;	

	UINT64_T vec[VECTOR_SIZE], vec2[VECTOR_SIZE], twiddle[VECTOR_SIZE];
	UINT64_T * golden_output;
	randVec(vec, vec2, 1000);
	gettwiddle(twiddle, p, r);

	//printVec(inPlaceNTT_DIT_precomp(vec,n,p,r),n);
	CCS_DESIGN(inPlaceNTT_DIF)(vec, p, r, twiddle);
    golden_output = inPlaceNTT_DIF_golden(vec2, p, r);
	compVec(vec, golden_output, true);
	cout << __FILE__ << ":" << __LINE__ << " - End of testbench." << endl;
	CCS_RETURN(0);

}