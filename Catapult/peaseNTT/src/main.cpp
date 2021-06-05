#include "../include/main.h"

using namespace std;

/**
 * Perform a basic NTT on an input vector and return the result
 *
 * @param vec 	The input vector to be transformed
 * @param n	The size of the input vector
 * @param p	The prime to be used as the modulus of the transformation
 * @param r	The primitive root of the prime
 * @return 	The transformed vector
 */
uint64_t *naiveNTT(uint64_t *vec, uint64_t n, uint64_t p, uint64_t r){

	uint64_t k = (p - 1)/n;
	uint64_t a = modExp(r,k,p);

	uint64_t *result;
	result = (uint64_t *) malloc(n*sizeof(uint64_t));

	uint64_t temp;
	for(uint64_t i = 0; i < n; i++){

		temp = 0;
		for(uint64_t j = 0; j < n; j++){
	
			temp = modulo(temp + modulo(vec[j]*modExp(a, i*j, p),p),p);
			/*temp = temp + modulo(vec[j]*modExp(a, i*j, p),p);*/
			/*temp = temp + vec[j]*modExp(a, i*j, p);*/

		}
		result[i] = modulo(temp,p);

	}

	return result;

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
uint64_t *inPlaceNTT_DIT(uint64_t *vec, uint64_t n, uint64_t p, uint64_t r, bool rev){

	uint64_t *result;
	result = (uint64_t *) malloc(n*sizeof(uint64_t));

	if(rev){
		result = bit_reverse(vec,n);
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

	return result;

}

int main(int argc, char *argv[]){

	uint64_t k = 3;

	uint64_t n = VECTOR_SIZE;
  	uint64_t p = 68719403009;
  	uint64_t r = 36048964756;

	uint64_t vec[VECTOR_SIZE], vec2[VECTOR_SIZE];
	uint64_t *result1, *result2;

	for (int i = 0; i < VECTOR_SIZE; i++){
		vec[i] = i;
		vec2[i] = i;
	}
	result2 = inPlaceNTT_DIT(vec2, VECTOR_SIZE, p, r, false);
	result1 = peaceNTT(vec, VECTOR_SIZE,  p, r, false);
	//printVec(result, VECTOR_SIZE);

	cout<<"Compare result: "<<compVec(result1, result2, n, true);
	free(result1);
	free(result2);
/*	
	//uint64_t *vec = randVec(n,10);

	uint64_t *out1 = naiveNTT(vec,n,p,r);
	printVec(out1,n);

	uint64_t *out2 = fourStepNTT(vec,n,p,r,2);
	printVec(out2,n);
*/
	return 0;

}