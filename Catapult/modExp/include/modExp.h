#ifndef MODEXP_H_
#define MODEXP_H_

//#include <ac_fixed.h>
//#include <mgc_ac_math.h>
//#include <ac_math.h>
#include <ac_int.h>
//#define VECTOR_WIDTH 64
//typedef ac_int<VECTOR_WIDTH, false>   VEC_T;
typedef ac_int<64, false>   UINT64_T;

/**
 * Perform the operation 'base^exp (mod m)' using the memory-efficient method
 *
 * @param base	The base of the expression
 * @param exp	The exponent of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
void modExp(UINT64_T base, UINT64_T exp, UINT64_T m, UINT64_T &result);

#endif /* MODEXP_H_ */

