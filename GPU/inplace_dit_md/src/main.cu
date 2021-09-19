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

int main(int argc, char **argv){
    int n = VECTOR_SIZE;
    DATA_TYPE p = (479  << 21) + 1;
  	DATA_TYPE r = 3;
    
    DATA_TYPE *vec = 0, *dev_vec = 0, *twiddle = 0, *dev_twiddle = 0;
    DATA_TYPE *result_g, *result;
    vec = randVec(VECTOR_SIZE, 1000);
    printVec(vec, VECTOR_SIZE);
    twiddle = twiddle_cal(VECTOR_SIZE, r, p);
    result_g = naiveNTT(vec, VECTOR_SIZE, p, r);

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

    cudaMalloc((void**)&dev_vec, VECTOR_SIZE * sizeof(DATA_TYPE));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "dev vec cudaMalloc failed!");
        goto Error;
    }
    cudaStatus = cudaMemcpy(dev_vec, vec, VECTOR_SIZE * sizeof(DATA_TYPE), cudaMemcpyHostToDevice);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "vec cudaMemcpy failed!");
        goto Error;
    }

    cudaMalloc((void**)&dev_twiddle, VECTOR_SIZE * sizeof(DATA_TYPE));
    cudaStatus = cudaMemcpy(dev_twiddle, twiddle, VECTOR_SIZE * sizeof(DATA_TYPE), cudaMemcpyHostToDevice);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "twiddle cudaMemcpy failed!");
        goto Error;
    }
    for (int i = 1; i <= log2(n); i++) {
        uint64_t m = (int)pow(2, i);
        uint64_t k_ = (p - 1) / m;
        uint64_t a = modExp(r, k_, p);
        int numblocks = 64, maxthreads = 1024, numthreads = m / 2, thread_offset = 0;

        for (int batch = 0; batch < n; batch += m * numblocks) {
            // if (numthreads > maxthreads) {
                dimBlock.x = maxthreads;
                for (int stage = 0; stage < numthreads / maxthreads; stage++) {
                    inplaceNTT_DIT_precomp_stage << <numblocks, dimBlock >> > (dev_vec, batch, m, p, dev_twiddle, stage * maxthreads);
                }
            // }
            // else {
            //     dimBlock.x = numthreads;
            //     inplaceNTT_DIT_precomp_stage << <numblocks, dimBlock >> > (dev_vec, batch, m, p, dev_twiddle, 0);
            // }
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
    // Copy output vector from GPU buffer to host memory.
    result = (DATA_TYPE *)malloc(sizeof(DATA_TYPE) * VECTOR_SIZE);
    cudaStatus = cudaMemcpy(result, dev_vec, n * sizeof(uint64_t), cudaMemcpyDeviceToHost);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "result cudaMemcpy failed!");
        goto Error;
    }
    compVec(result_g, result, VECTOR_SIZE, true);

Error:
    cudaFree(dev_vec);
    cudaFree(dev_twiddle);
    return cudaStatus;
}