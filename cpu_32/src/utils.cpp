#ifndef UTILS_H_
#define UTILS_H_

#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <ctime>
#include <iostream>

#include "../include/config.h"
#include "../include/utils.h"



/**
 * Compare two vectors element-wise and return whether they are equivalent
 *
 * @param vec1	The first vector to compare
 * @param vec2 	The second vector to compare
 * @param n 	The length of the vectors
 * @param debug	Whether to print debug information (will run entire vector)
 * @return 	Whether the two vectors are element-wise equivalent
 */
bool compVec(uint64_t *vec1, uint64_t *vec2, uint64_t n, bool debug){

	bool comp = true;
	for(uint64_t i = 0; i < n; i++){

		if(vec1[i] != vec2[i]){
			comp = false;

			if(debug){
				std::cout << "(vec1[" << i << "] : " << vec1[i] << ")";
				std::cout << "!= (vec2[" << i << "] : " << vec2[i] << ")";
				std::cout << std::endl;
			}else{
				break;
			}
		}
	}

	return comp;

}

/**
 * Print an array of arbitrary length in a readable format
 *
 * @param vec	The array to be displayed
 * @param n	The length of the array
 */
void printVec(uint64_t *vec, uint64_t n){

	std::cout << "[";
	for(uint64_t i = 0; i < n; i++){

		std::cout << vec[i] << ",";

	}
	std::cout << "]" << std::endl;

}
/**
 * Generate an array of arbitrary length containing random positive integers 
 *
 * @param n	The length of the array
 * @param max	The maximum value for an array element [Default: RAND_MAX]
 */
uint64_t *randVec(uint64_t n, uint64_t max){

	uint64_t *vec;
	vec = (uint64_t *)malloc(n*sizeof(uint64_t));

	srand(time(0));
	for(uint64_t i = 0; i < n; i++){

		vec[i] = rand()%(max + 1);

	}
	return vec;

}

#endif
