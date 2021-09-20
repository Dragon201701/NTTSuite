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
DATA_TYPE* inPlaceNTT_DIT_precomp_golden(DATA_TYPE* vec, DATA_TYPE n, DATA_TYPE p, DATA_TYPE r, DATA_TYPE* twiddle, bool rev) {
    DATA_TYPE * result;
    result = (DATA_TYPE*)malloc(n * sizeof(DATA_TYPE));
    if (rev) {
        result = bit_reverse(vec, n);
    }
    else {
        for (DATA_TYPE i = 0; i < n; i++) {
            result[i] = vec[i];
        }
    }
    DATA_TYPE m, factor1, factor2;
    for (int i = 1; i <= log2(n); i++) {
        m = 1 << i;
        for (DATA_TYPE j = 0; j < n; j += m) {
            for (DATA_TYPE k = 0; k < m / 2; k++) {
                factor1 = result[j + k];
                factor2 = modulo(twiddle[(1 << (VECTOR_ADDR_BIT - i)) * k] * result[j + k + m / 2], p);
                result[j + k] = modulo(factor1 + factor2, p);
                result[j + k + m / 2] = modulo(factor1 - factor2, p);
            }
        }
    }
    return result;
}
int main(int argc, char **argv){
    int n = VECTOR_SIZE;
    DATA_TYPE p = (479  << 21) + 1;
  	DATA_TYPE r = 3;
    
    DATA_TYPE *vec = 0, *dev_vec = 0, *twiddle = 0, *dev_twiddle = 0;
    DATA_TYPE *result_g, *result;
    vec = randVec(VECTOR_SIZE, 1000);
    //printVec(vec, VECTOR_SIZE);
    twiddle = twiddle_cal(VECTOR_SIZE, r, p);
    //result_g = naiveNTT(vec, VECTOR_SIZE, p, r);
    cudaError_t cudaStatus;
    dim3 dimGrid, dimBlock;
    cudaStatus = cudaSetDevice(0);
    struct cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties, 0);
    cout<<"Cuda Name : "<<properties.name<<endl;
    size_t freeMem, totalMem;
    cudaMemGetInfo(&freeMem, &totalMem);
    cout<<"Cuda FreeMemory is " << freeMem<<"; Total Memory is "<<totalMem<<endl;
    cout << "using " << properties.multiProcessorCount << " multiprocessors" << endl;
    cout << "max threads per processor: " << properties.maxThreadsPerMultiProcessor << endl;

    cudaStatus = cudaMalloc((void**)&dev_vec, VECTOR_SIZE * sizeof(DATA_TYPE));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "vec cudaMalloc failed!");
        goto Error;
    }
    cudaStatus = cudaMemcpy(dev_vec, vec, VECTOR_SIZE * sizeof(DATA_TYPE), cudaMemcpyHostToDevice);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "vec cudaMemcpy failed!");
        goto Error;
    }

    cudaStatus = cudaMalloc((void**)&dev_twiddle, VECTOR_SIZE * sizeof(DATA_TYPE));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "twiddle cudaMalloc failed!");
        goto Error;
    }
    cudaStatus = cudaMemcpy(dev_twiddle, twiddle, VECTOR_SIZE * sizeof(DATA_TYPE), cudaMemcpyHostToDevice);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "twiddle cudaMemcpy failed!");
        goto Error;
    }
    cudaEvent_t kernel_start, kernel_stop, cuda_start, cuda_stop;
    cudaEventCreate(&kernel_start);
    cudaEventCreate(&kernel_stop);
    cudaEventRecord(kernel_start,0);
    for (int i = 1; i <= log2(n); i++) {
        int m           = 1 << i;
        int maxBlocks   = m >> 1;
        int maxThreads  = 1 << (VECTOR_ADDR_BIT - i - 1);

        for(unsigned block_offset = 0; block_offset < m/2; block_offset += numberblock){
			for(unsigned  thread_offset = 0; thread_offset < VECTOR_SIZE; thread_offset += numberthread * m){
                inplaceNTT_DIF_precomp_stage << <numberblock, numberthread>> > (dev_vec, block_offset, thread_offset, m, p, dev_twiddle, i);
            }
        }
    }
    
    // Check for any errors launching the kernel
    cudaStatus = cudaGetLastError();
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "Kernel launch failed: %s\n", cudaGetErrorString(cudaStatus));
        goto Error;
    }
    // cudaDeviceSynchronize waits for the kernel to finish, and returns
    // any errors encountered during the launch.
    cudaStatus = cudaDeviceSynchronize();
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching addKernel!\n", cudaStatus);
        goto Error;
    }

    cudaEventRecord(kernel_stop,0);
    cudaEventSynchronize(kernel_stop);
    float kernel_et;
    cudaEventElapsedTime( &kernel_et, kernel_start, kernel_stop);
    printf("Kernel Time: %f milliseconds (ms) \n", kernel_et);
    
    // Copy output vector from GPU buffer to host memory.
    result = (DATA_TYPE *)malloc(sizeof(DATA_TYPE) * VECTOR_SIZE);
    cudaStatus = cudaMemcpy(result, dev_vec, n * sizeof(DATA_TYPE), cudaMemcpyDeviceToHost);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "result cudaMemcpy failed!");
        goto Error;
    }
    result_g = inPlaceNTT_DIT_precomp_golden(vec, VECTOR_SIZE, p, r, twiddle, false);
    compVec(result, result_g, VECTOR_SIZE, true);

Error:
    cudaFree(dev_vec);
    cudaFree(dev_twiddle);
    return cudaStatus;
}