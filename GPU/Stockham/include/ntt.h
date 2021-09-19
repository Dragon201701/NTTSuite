#ifndef NTT_H_
#define NTT_H_

#include <cstdint>
#include <cmath>
#include <iostream>
#include "utils.h"
#define VECTOR_SIZE 16384

//#define DEBUG 1

/**
 * Perform an PEASE NTT on an input vector and return the result
 *
 * @param vec 	The input vector to be transformed
 * @param n	The size of the input vector
 * @param p	The prime to be used as the modulus of the transformation
 * @param f	The primitive root of the prime
 * @param rev	Whether to perform bit reversal on the input vector
 * @return 	The transformed vector
 */
DATA_TYPE* stockham_dit(DATA_TYPE* vec, DATA_TYPE n,  DATA_TYPE p,  DATA_TYPE g);
void cudaPrepare(int n, DATA_TYPE p, DATA_TYPE g);
void cudaFree();

#endif /* NTT_H_ */