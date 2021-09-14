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

__global__ void butter_prec(DATA_TYPE *yt, DATA_TYPE *xt, DATA_TYPE *twiddle, unsigned base, DATA_TYPE p) {
    int blck=   blockIdx.x;
    int r   =   threadIdx.x;
    int mid =   VECTOR_SIZE_H >> 1;
    unsigned base_addr =  blck * VECTOR_SIZE_H;
    DATA_TYPE f1 = xt[base_addr + (r << 1)];
    DATA_TYPE f2 ;
    modulo_cu(twiddle[r & base] * xt[base_addr + (r << 1) + 1], p, f2);
    modulo_cu(f1 + f2, p, yt[base_addr + r]);
    modulo_cu(f1 - f2, p, yt[base_addr + r + mid]);
}


__global__ void transpose(DATA_TYPE *x){
    int j = threadIdx.x;
    int i = blockIdx.x;
    //if((i < VECTOR_SIZE_H) && (j < VECTOR_SIZE_H)){
    if(i < j){
        DATA_TYPE tmp = x[i * VECTOR_SIZE_H + j];
        x[i * VECTOR_SIZE_H + j] = x[j * VECTOR_SIZE_H + i];
        x[j * VECTOR_SIZE_H + i] = tmp;
    }
    //}
}
__global__ void time_factor(DATA_TYPE *result, DATA_TYPE *vec, DATA_TYPE *twiddle, DATA_TYPE m){
    int k = threadIdx.x;
    int p = blockIdx.x;
    if(k >= p){
        DATA_TYPE wkp = twiddle[p * k]; 
        DATA_TYPE a, b;
        modulo_cu(vec[p * VECTOR_SIZE_H + k] * wkp, m, a);
        modulo_cu(vec[k * VECTOR_SIZE_H + p] * wkp, m, b);
        result[p * VECTOR_SIZE_H + k] = b;
        result[k * VECTOR_SIZE_H + p] = a;
    }
}

__global__ void  bit_reverse_cu(DATA_TYPE *result, DATA_TYPE *vec, unsigned *revArr){
    int j = threadIdx.x;
    int i = blockIdx.x;
    result[i * VECTOR_SIZE_H + revArr[j]] = vec[i * VECTOR_SIZE_H + j];
}

// GPU Mem pointer
DATA_TYPE* d_x ;
DATA_TYPE* d_y ;
DATA_TYPE* d_twiddle ;
DATA_TYPE* d_twiddle_h ;
// CPU Mem pointer
DATA_TYPE *result ;
unsigned *revArr;

void getRevArr(unsigned *revArr, unsigned n){

	unsigned num_bits = log2(n);

	unsigned reverse_num;
	for(unsigned i = 0; i < n; i++){

		reverse_num = 0;
		for(unsigned j = 0; j < num_bits; j++){

			reverse_num = reverse_num << 1;
			if(i & (1 << j)){
				reverse_num = reverse_num | 1;
			}
		}

        revArr[i] = reverse_num;
	}
}

void cudaPrepare(int n, DATA_TYPE p, DATA_TYPE g){

    cudaDeviceProp myCuda;
    cudaGetDeviceProperties(&myCuda, 0);
    cout<<"Cuda Name : "<<myCuda.name<<endl;
    size_t freeMem, totalMem;
    cudaMemGetInfo(&freeMem, &totalMem);
    cout<<"Cuda FreeMemory is" << freeMem<<" ; Total Memory is "<<totalMem<<endl;

    DATA_TYPE * twiddle = (DATA_TYPE*)malloc(VECTOR_SIZE * sizeof(DATA_TYPE));
    DATA_TYPE * tw      = (DATA_TYPE*)malloc(VECTOR_SIZE_H * sizeof(DATA_TYPE));

    DATA_TYPE w0 = modExp(g, (p - 1) / VECTOR_SIZE, p);

    DATA_TYPE witer = 1;
    for(int i = 0; i < VECTOR_SIZE; i++){
        twiddle[i] = witer;
        witer = modulo(witer * w0, p);
    }
    w0 = modExp(g, (p - 1) / VECTOR_SIZE_H, p);
    witer = 1;
    for(int i = 0; i < VECTOR_SIZE_H; i++){
        tw[i] = witer;
        witer = modulo(witer * w0, p);
    }


    unsigned *revArrCpu = (unsigned*)malloc(VECTOR_SIZE_H * sizeof(unsigned));
    getRevArr(revArrCpu, VECTOR_SIZE_H);

    cudaMalloc(&d_x, VECTOR_SIZE * sizeof(DATA_TYPE ));
    cudaMalloc(&d_y, VECTOR_SIZE * sizeof(DATA_TYPE ));
    cudaMalloc(&revArr, VECTOR_SIZE_H * sizeof(DATA_TYPE ));
    cudaMalloc(&d_twiddle, VECTOR_SIZE * sizeof(DATA_TYPE ));
    cudaMalloc(&d_twiddle_h, VECTOR_SIZE_H * sizeof(DATA_TYPE ));

    cudaMemcpy(revArr, revArrCpu, VECTOR_SIZE_H * sizeof(DATA_TYPE ), cudaMemcpyHostToDevice);
    cudaMemcpy(d_twiddle, twiddle, VECTOR_SIZE * sizeof(DATA_TYPE ), cudaMemcpyHostToDevice);
    cudaMemcpy(d_twiddle_h, tw, VECTOR_SIZE_H * sizeof(DATA_TYPE ), cudaMemcpyHostToDevice);

	result = (DATA_TYPE*) malloc((int)n*sizeof(DATA_TYPE));

    free(revArrCpu);
}

void cudaFree(){
    cudaFree(&d_twiddle);
    free(result);
    cudaFree(&d_x);
    cudaFree(&d_y);
    cudaFree(&revArr);
}


DATA_TYPE* six_step(DATA_TYPE * vec, int n, DATA_TYPE m, DATA_TYPE g){

    // Transfer data from cpu to gpu
    cudaMemcpy(d_x, vec, VECTOR_SIZE * sizeof(DATA_TYPE ), cudaMemcpyHostToDevice);

    int threadsPerBlock = VECTOR_SIZE_H;
    int blocksPerGrid   = VECTOR_SIZE_H;
    transpose<<<blocksPerGrid, threadsPerBlock>>>(d_x);
    
    bit_reverse_cu<<<blocksPerGrid, threadsPerBlock>>>(d_y, d_x, revArr);
    for (unsigned c = VECTOR_ADDR_BIT_H; c >= 2; c-=2){
        unsigned base = -1 << (c - 1);
        //unsigned base = -1 << (c - 1);
        butter_prec<<<blocksPerGrid, (threadsPerBlock >> 1)>>>(d_x, d_y, d_twiddle_h, base, m);

        base = -1 << (c - 2);
        butter_prec<<<blocksPerGrid, (threadsPerBlock >> 1)>>>(d_y, d_x, d_twiddle_h, base, m);
        //printVec(xt,n);
    }
    if(VECTOR_ADDR_BIT_H % 2){
        unsigned base = -1;
        butter_prec<<<blocksPerGrid, (threadsPerBlock >> 1)>>>(d_x, d_y, d_twiddle_h, base, m);
        DATA_TYPE *tmp = d_x;
        d_x = d_y;
        d_y = tmp;
    }

    time_factor<<<blocksPerGrid, threadsPerBlock>>>(d_x, d_y, d_twiddle, m);

    bit_reverse_cu<<<blocksPerGrid, threadsPerBlock>>>(d_y, d_x, revArr);
    for (unsigned c = VECTOR_ADDR_BIT_H; c >= 2; c-=2){
        unsigned base = -1 << (c - 1);
        //unsigned base = -1 << (c - 1);
        butter_prec<<<blocksPerGrid, (threadsPerBlock >> 1)>>>(d_x, d_y, d_twiddle_h, base, m);

        base = -1 << (c - 2);
        butter_prec<<<blocksPerGrid, (threadsPerBlock >> 1)>>>(d_y, d_x, d_twiddle_h, base, m);
        //printVec(xt,n);
    }
    if(VECTOR_ADDR_BIT_H % 2){
        unsigned base = -1;
        butter_prec<<<blocksPerGrid, (threadsPerBlock >> 1)>>>(d_x, d_y, d_twiddle_h, base, m);
        DATA_TYPE *tmp = d_x;
        d_x = d_y;
        d_y = tmp;
    }

    transpose<<<blocksPerGrid, threadsPerBlock>>>(d_y);

    cudaMemcpy(vec, d_y, VECTOR_SIZE * sizeof(DATA_TYPE), cudaMemcpyDeviceToHost);

    return vec;
}