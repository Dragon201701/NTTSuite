#include <iostream>

#include "../include/ntt.h"
#include "../include/config.h"
#include "../include/utils.h"

// #define BIT_REVERSE_INDEX(index, result) ({\
//     while(index > 0){\
//         if(index % 2){\
//             result++;\
//             index--;\
//         }
//         index >> 1;\
//         result << 1;\
//     }
// })

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
		}
		result[i] = modulo(temp,p);
	}
	return result;
}

int main(int argc, char **argv){
    uint64_t p = (479 << 21) + 1, r = 3;
    uint64_t * vec = randVec(VECTOR_SIZE, 1000);
    uint64_t * result_g = naiveNTT(vec, VECTOR_SIZE, p, r);
    uint64_t * result1 = (uint64_t *)malloc(VECTOR_SIZE * sizeof(uint64_t));
    uint64_t * result2 = (uint64_t *)malloc(VECTOR_SIZE * sizeof(uint64_t));
    uint64_t * result3 = (uint64_t *)malloc(VECTOR_SIZE * sizeof(uint64_t));
    inPlaceNTT_DIF(vec, p, r, result1);
    inPlaceNTT_DIT(vec, VECTOR_SIZE, p, r, false, result2);
    //printVec(result_g, VECTOR_SIZE);
    compVec(result1, result2, VECTOR_SIZE, true);
    cout << "Hello, World!" << endl;
    //uint64_t bit_reverse_index_in = 6, bit_reverse_index_out = 0;
    //BIT_REVERSE_INDEX(bit_reverse_index_in, bit_reverse_index_out);
    //cout << "Bit reverse index: " << bit_reverse_index_in << " get: " << bit_reverse_index_out << endl;
    return 0;
}