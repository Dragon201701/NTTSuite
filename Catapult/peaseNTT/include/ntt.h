#ifndef NTT_H_
#define NTT_H_

#include <cstdint>
#include <cmath>
#include <iostream>
#define VECTOR_SIZE 1024

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
uint64_t* peaceNTT(uint64_t * vec, uint64_t n, uint64_t p, uint64_t g, bool rev);

#endif /* NTT_H_ */