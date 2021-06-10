#ifndef NTT_H_
#define NTT_H_

#include <cstdint>
#include <cmath>
#include <iostream>

#include "config.h"


void peaceNTT(UINT64_T[VECTOR_SIZE] vec, UINT64_T p, UINT64_T g, UINT64_T[VECTOR_SIZE] result);

#endif /* NTT_H_ */