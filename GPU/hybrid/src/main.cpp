#include "../include/main.h"
#include <time.h>

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
DATA_TYPE *naiveNTT(DATA_TYPE *vec, unsigned n, DATA_TYPE p, DATA_TYPE r){

	DATA_TYPE k = (p - 1)/n;
	DATA_TYPE a = modExp(r,k,p);

	DATA_TYPE *result;
	result = (DATA_TYPE *) malloc(n*sizeof(DATA_TYPE));

	DATA_TYPE temp;
	for(DATA_TYPE i = 0; i < n; i++){

		temp = 0;
		for(DATA_TYPE j = 0; j < n; j++){
	
			temp = modulo(temp + modulo(vec[j]*modExp(a, i*j, p),p),p);
			/*temp = temp + modulo(vec[j]*modExp(a, i*j, p),p);*/
			/*temp = temp + vec[j]*modExp(a, i*j, p);*/

		}
		result[i] = modulo(temp,p);

	}

	return result;

}
int main(int argc, char *argv[]){

	int n = VECTOR_SIZE;
 	//DATA_TYPE p = 68719403009;
  	//DATA_TYPE r = 36048964756;
 	DATA_TYPE p = (479  << 21) + 1;
  	DATA_TYPE r = 3;

	DATA_TYPE vec[VECTOR_SIZE];
#ifdef DEBUG
	DATA_TYPE vec2[VECTOR_SIZE];
#endif
	DATA_TYPE *result1, *result2;

	for (unsigned i = 0; i < VECTOR_SIZE; i++){
		vec[i] = i;
#ifdef DEBUG
		vec2[i] = i;
#endif
	}

	cudaPrepare(VECTOR_SIZE, p, r);
	
#ifdef DEBUG
	result2 = naiveNTT(vec2, n, p, r);
	result1 = six_step(vec, n,  p, r);
	cout<<"Compare result: "<<compVec(result1, result2, n, true);
	free(result2);
#else
	clock_t begin = clock();
	int times = 1000;
	for(int i=0; i<times; i++){
		six_step(vec, n,  p, r);
	}
	clock_t end = clock();
	double time = (double)(end-begin) / CLOCKS_PER_SEC * 1e6 / times;
	cout<<"Average time for six_step algorithm(points num: " << VECTOR_SIZE<<"): "<<time<<"us"<<endl;
#endif

	cudaFree();
	return 0;

}