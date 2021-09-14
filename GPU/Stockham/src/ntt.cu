#include "../include/ntt.h"
#include "../include/utils.h"
#include <inttypes.h>
using namespace std;

void cpyVec(DATA_TYPE* src, DATA_TYPE*dst, int length){
    for(int i=0; i<length; i++){
        dst[i] = src[i];
    }
}
__device__ void modulo_cu(int64_t base, int64_t m, DATA_TYPE &a){
	int64_t result = base % m;
	a = result >= 0? result : result + m;
}

__device__ void modExp_cu(DATA_TYPE base, unsigned exp, DATA_TYPE m, DATA_TYPE &a){

	DATA_TYPE result = 1;
	
	while(exp > 0){

		if(exp % 2){

			modulo_cu(result*base, m, result);

		}

		exp = exp >> 1;
		modulo_cu(base*base,m,base);
	}

    a = result;
}

__global__ void butter_prec(DATA_TYPE *y, DATA_TYPE *x, DATA_TYPE *d_twiddle, unsigned nn, unsigned s, unsigned shift, unsigned m, DATA_TYPE p) {
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    int mid = VECTOR_SIZE >> 1;
    if(t < mid){
        const int upper = (~(s - 1)) & t;
        DATA_TYPE w = d_twiddle[(upper >> shift) << shift];
        int q     = (s - 1) & t;
        DATA_TYPE a = y[q + (upper << 1)];
        DATA_TYPE b ;
        modulo_cu(y[q + (upper << 1) + s] * w, p, b);
        modulo_cu(a + b, p, x[q + upper]);
        modulo_cu(a - b, p, x[q + upper + s * m]);
    }
}

// GPU Mem pointer
DATA_TYPE* d_x ;
DATA_TYPE* d_y ;
DATA_TYPE* d_twiddle ;

void cudaPrepare(int n, DATA_TYPE p, DATA_TYPE g){
    cudaDeviceProp myCuda;
    cudaGetDeviceProperties(&myCuda, 0);
    cout<<"Cuda Name : "<<myCuda.name<<endl;
    size_t freeMem, totalMem;
    cudaMemGetInfo(&freeMem, &totalMem);
    cout<<"Cuda FreeMemory is" << freeMem<<" ; Total Memory is "<<totalMem<<endl;
    DATA_TYPE * twiddle = (DATA_TYPE*)malloc(n * sizeof(DATA_TYPE));
    DATA_TYPE w0 = modExp(g, (p - 1) / n, p);
    DATA_TYPE witer = 1;
    for(int i = 0; i < n; i++){
        twiddle[i] = witer;
        witer = modulo(witer * w0, p);
    }
    cudaMalloc(&d_x, VECTOR_SIZE * sizeof(DATA_TYPE ));
    cudaMalloc(&d_y, VECTOR_SIZE * sizeof(DATA_TYPE ));
    cudaMalloc(&d_twiddle, VECTOR_SIZE * sizeof(DATA_TYPE ));
    cudaMemcpy(d_twiddle, twiddle, VECTOR_SIZE * sizeof(DATA_TYPE ), cudaMemcpyHostToDevice);
}

void cudaFree(){
    cudaFree(&d_twiddle);
    cudaFree(&d_x);
    cudaFree(&d_y);
}

DATA_TYPE* stockham_dit(DATA_TYPE* vec, DATA_TYPE n,  DATA_TYPE p,  DATA_TYPE g){

    unsigned t = (unsigned)log2(n);
    cudaMemcpy(d_x, vec, VECTOR_SIZE * sizeof(DATA_TYPE ), cudaMemcpyHostToDevice);
    int threadsPerBlock = 256;
    int blocksPerGrid = ((VECTOR_SIZE>>1) + threadsPerBlock - 1) / threadsPerBlock;

    DATA_TYPE * tmp = d_x;
    d_x = d_y;
    d_y = tmp;

    int s = n >> 1;
    int shift = t - 1;
    for(int nn = 2; nn <= n ; nn = nn << 1, s = s >> 1, shift = shift - 1){
        const int m = nn / 2;
        butter_prec<<<blocksPerGrid, threadsPerBlock>>>(d_y, d_x, d_twiddle, nn, s, shift, m, p);
        tmp = d_x;
        d_x = d_y;
        d_y = tmp;
    }   

    cudaMemcpy(vec, d_y, VECTOR_SIZE * sizeof(DATA_TYPE ), cudaMemcpyDeviceToHost);

    return vec;

}