#include "../include/ntt.cuh"

using namespace std;

__device__ DATA_TYPE modulo_dev(DATA_TYPE_SIGNED base, DATA_TYPE_SIGNED m) {
	DATA_TYPE_SIGNED result = base % m;
	return (result >= 0) ? result : result + m;
}

__device__ DATA_TYPE modExp_cu(DATA_TYPE base, unsigned exp, DATA_TYPE m){
	DATA_TYPE result = 1;
    while(exp > 0){
        result = modulo_dev(result * base, m);
        exp--;
    }
    return result;
}
__global__ void inplaceNTT_DIT_precomp_stage(DATA_TYPE* vec, int batch,
		DATA_TYPE m, DATA_TYPE p, DATA_TYPE* twiddle, int thread_offset) {
	int j = blockIdx.x * m + batch;
	int k = threadIdx.x + thread_offset;
	DATA_TYPE f1 = vec[j + k];
	DATA_TYPE f2 = modulo_dev(twiddle[(DATA_TYPE)m/2 - 1 + k] * vec[j + k + m / 2], p);
	vec[j + k] = modulo_dev(f1 + f2, p);
	vec[j + k + m / 2] = modulo_dev(f1 - f2, p);
}
__global__ void  bit_reverse_cu(DATA_TYPE *result, DATA_TYPE *vec, unsigned num_bits){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < VECTOR_SIZE){
		unsigned reverse_num = 0;
		for(unsigned j = 0; j < num_bits; j++){
			reverse_num = reverse_num << 1;
			if(i & (1 << j)){
				reverse_num = reverse_num | 1;
			}
		}
		result[reverse_num] = vec[i];
    }
}