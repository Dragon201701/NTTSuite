#include "../include/ntt.cuh"
#include "../include/utils.h"

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
		}
		result[i] = modulo(temp,p);
	}
	return result;
}
DATA_TYPE* inPlaceNTT_DIF_precomp_golden(DATA_TYPE* vec, DATA_TYPE n, DATA_TYPE p, DATA_TYPE r, DATA_TYPE* twiddle, bool rev) {
    DATA_TYPE * result;
    result = (DATA_TYPE*)malloc(n * sizeof(DATA_TYPE));
    DATA_TYPE m;
    for (int i = log2(n); i >= 1; i--) {
        m = 1 << i;
        for (DATA_TYPE j = 0; j < n; j += m) {
            for (DATA_TYPE k = 0; k < m / 2; k++) {
    	        DATA_TYPE w = twiddle[(1 << (VECTOR_ADDR_BIT - i)) * k];
	            DATA_TYPE f1 = vec[j + k];
	            DATA_TYPE f2 = vec[j + k + m/2];
	            vec[j + k] = modulo(f1 + f2, p);
	            vec[j + k + m/2] = modulo(w * modulo(f1 - f2, p), p);
            }
        }
    }
    if (rev) {
        result = bit_reverse(vec, n);
    }
    else {
        for (DATA_TYPE i = 0; i < n; i++) {
            result[i] = vec[i];
        }
    }
    return result;
}

float nttcuda(int n, DATA_TYPE p, DATA_TYPE r){
    DATA_TYPE *vec, *twiddle;
    DATA_TYPE *result_g, *result;

    cudaError_t cudaStatus;
    cudaStatus = cudaSetDevice(0);
    struct cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties, 0);
    cout<<"Cuda Name : "<<properties.name<<endl;
    size_t freeMem, totalMem;
    cudaMemGetInfo(&freeMem, &totalMem);
    cout<<"Cuda FreeMemory is " << freeMem<<"; Total Memory is "<<totalMem<<endl;
    cout << "using " << properties.multiProcessorCount << " multiprocessors" << endl;
    cout << "max threads per processor: " << properties.maxThreadsPerMultiProcessor << endl;

    int threadsPerBlock = 1024;
    int blocksPerGrid = ((VECTOR_SIZE>>1) + threadsPerBlock - 1) / threadsPerBlock;

    int threadsPerBlockRev = 512;
    int blocksPerGridRev = (VECTOR_SIZE + threadsPerBlock - 1) / threadsPerBlock;

    unsigned t = (unsigned)log2(n);

    cudaEvent_t malloc_start, malloc_stop, cuda_start, cuda_stop;
    cudaEventCreate(&malloc_start);
    cudaEventCreate(&malloc_stop);
    cudaEventCreate(&cuda_start);
    cudaEventCreate(&cuda_stop);

    cudaEventRecord(malloc_start,0);
    cudaStatus = cudaMallocManaged(&vec, VECTOR_SIZE * sizeof(DATA_TYPE));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "vec cudaMallocManaged failed!");
        goto Error;
    }
    cudaStatus = cudaMallocManaged(&result, VECTOR_SIZE * sizeof(DATA_TYPE));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "vec cudaMallocManaged failed!");
        goto Error;
    }
    
    cudaStatus = cudaMallocManaged(&twiddle, VECTOR_SIZE * sizeof(DATA_TYPE));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "twiddle cudaMallocManaged failed!");
        goto Error;
    }
    cudaEventRecord(malloc_stop,0);
    cudaEventSynchronize(malloc_stop);
    float malloc_et;
    cudaEventElapsedTime( &malloc_et, malloc_start, malloc_stop);
    //printf("CUDA Time: %f milliseconds (ms) \n", cuda_et);

    randVec(VECTOR_SIZE, vec, 1000);
    result_g = naiveNTT(vec, VECTOR_SIZE, p, r);
    twiddle_cal(VECTOR_SIZE, r, p, twiddle);



    cudaEventRecord(cuda_start,0);
    // cudaEventRecord(kernel_start,0);

    for (unsigned c = t; c >= 1; c--){
        unsigned base = -1 << (c - 1);
        //unsigned base = -1 << (c - 1);
        butter_prec<<<blocksPerGrid, threadsPerBlock>>>(result, vec, twiddle, base, p);
        cudaMemcpy(vec, result, VECTOR_SIZE * sizeof(DATA_TYPE), cudaMemcpyDeviceToDevice);
        //printVec(xt,n);
    }
    
    cudaEventRecord(cuda_stop,0);
    cudaEventSynchronize(cuda_stop);
    float cuda_et;
    cudaEventElapsedTime( &cuda_et, cuda_start, cuda_stop);
    printf("CUDA Time: %f milliseconds (ms) \n", cuda_et + malloc_et);

    // Check for any errors launching the kernel
    cudaStatus = cudaGetLastError();
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "Kernel launch failed: %s\n", cudaGetErrorString(cudaStatus));
        goto Error;
    }

    compVec(result, result_g, VECTOR_SIZE, true);
    cudaFree(vec);
    cudaFree(result);
    cudaFree(twiddle);
    return cuda_et + malloc_et;
Error:
    cudaFree(vec);
    cudaFree(twiddle);
    return -1;

}
int main(int argc, char **argv){
    int n = VECTOR_SIZE;
    DATA_TYPE p = (479  << 21) + 1;
  	DATA_TYPE r = 3;
    
    float result = 0;

    for (int i = 0; i < 100; i++){
        result += nttcuda(n, p, r);
    }
    cout << "Average for 100 tests: " << result/100 << endl;
    
}