#ifndef NTT_H_
#define NTT_H_

#include <cstdint>
#include <cmath>
#include <iostream>
#define VECTOR_SIZE 1024

uint64_t* peaceNTT(uint64_t * vec, uint64_t p, uint64_t r);

#endif /* NTT_H_ */