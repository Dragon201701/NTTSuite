#include "../include/ntt.h"
#include "../include/utils.h"
#include "../include/config.h"

using namespace std;

/**
 * Perform the operation 'base (mod m)'
 *
 * @param base	The base of the expression
 * @param m	The modulus of the expression
 * @return 	The result of the expression
 */
#pragma hls_design inline
UINT64_T modulo_dev(INT64_T base, UINT64_T m){
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
#pragma hls_design inline
UINT64_T modExp_dev(UINT64_T base, UINT64_T exp, UINT64_T m){
	UINT64_T result = 1;
	MODEXP_WHILE: while(exp > 0){
        result = (UINT64_T)(result * base);
        result = modulo_dev(result, m);
		exp--;
	}
	return result;
}
#pragma hls_design inline
void cpyVec_dev(UINT64_T[VECTOR_SIZE] src, UINT64_T[VECTOR_SIZE] dst){
    COPY_LOOP: for(int i = 0; i < VECTOR_SIZE; i++){
        dst[i] = src[i];
    }
}
#pragma hls_design top
void peaceNTT(UINT64_T[VECTOR_SIZE] vec, UINT64_T p, UINT64_T g, UINT64_T[VECTOR_SIZE] result){
    UINT64_T t = (uint64_t)log2(n);
    UINT64_T r_strt = 0;
    UINT64_T r_end  = exp2(t - 1);
    UINT64_T mid = VECTOR_SIZE / 2;
    UINT64_T[VECTOR_SIZE] xt;
    cpyVec_dev(vec, xt);
    STAGE_LOOP: for (unsigned c = t; c >= 1; c--){
        UINT64_T w = modExp_dev(g, (p - 1) / exp2(t - c + 1), p);
        UINT64_T base = exp2(c - 1);
        COMP_LOOP: for (UINT64_T r = r_strt; r < r_end; r++){
            UINT64_T r1 = floor(r / base);
            UINT64_T f1 = xt[r * 2];
            UINT64_T f2 = modulo_dev(modExp_dev(w, r1, p) * xt[r*2 + 1], p);
            result[r]       = modulo_dev(f1 + f2, p);
            result[r + mid]  = modulo_dev(f1 - f2, p);
        }
        cpyVec_dev(result, xt);
#ifndef __SYNTHESIS__
        cout<<"Device Complte stage: "<<c<<" computation.\n";
#endif
    }
}
