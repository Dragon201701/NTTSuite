#ifndef CONFIG_H_
#define CONFIG_H_

#include <ac_int.h>

#define VECTOR_SIZE  1024
#define VECTOR_WIDTH  64
#define VECTOR_ADDR_BIT  10
#define PARAMS_WIDTH  32
#define VECTOR_WIDTH 32

//typedef uint64_t DATA_TYPE;
//typedef uint64_t DATA_TYPE_TMP;
//typedef int64_t	DATA_TYPE_SIGNED;
//typedef uint32_t PARAMS_TYPE;
typedef ac_int<32, false> PARAMS_TYPE;
typedef ac_int<32, false> DATA_TYPE;
typedef ac_int<32, true> DATA_TYPE_SIGNED;
typedef ac_int<32, false> DATA_TYPE_TMP;

#endif /* CONFIG_H_ */