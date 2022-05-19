#ifndef NTT_H_
#define NTT_H_

#include <cstdint>
#include <cmath>
#include <iostream>
#include "utils.h"

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#define VECTOR_SIZE 	1024
#define VECTOR_ADDR_BIT 10
#define numberblock	512
#define numberthread 	512

typedef uint64_t DATA_TYPE;
typedef int64_t DATA_TYPE_SIGNED;

__device__ DATA_TYPE modulo_dev(DATA_TYPE_SIGNED base, DATA_TYPE_SIGNED m);
__device__ DATA_TYPE modExp_cu(DATA_TYPE base, unsigned exp, DATA_TYPE m);
__device__ void modulo_cu(int64_t base, int64_t m, DATA_TYPE &a);
 __global__ void inplaceNTT_DIF_precomp_stage(DATA_TYPE* vec, int k, int j, 
 		DATA_TYPE m, DATA_TYPE p, DATA_TYPE* twiddle, int i);
__global__ void  bit_reverse_cu(DATA_TYPE *result, DATA_TYPE *vec, unsigned num_bits);
__global__ void butter_prec(DATA_TYPE *yt, DATA_TYPE *xt, DATA_TYPE *twiddle, unsigned base, DATA_TYPE p);
#endif /* NTT_H_ */