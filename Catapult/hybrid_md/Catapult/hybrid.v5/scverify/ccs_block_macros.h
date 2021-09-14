// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_hybrid
extern void mc_testbench_capture_IN( ac_int<32, false > x[1024], ac_int<32, false > m,  ac_int<32, false > twiddle[32],  ac_int<32, false > twiddle_h[32],  ac_int<20, true > revArr[32],  ac_int<32, false > tw[1024],  ac_int<32, false > tw_h[1024]);
extern void mc_testbench_capture_OUT( ac_int<32, false > x[1024], ac_int<32, false > m,  ac_int<32, false > twiddle[32],  ac_int<32, false > twiddle_h[32],  ac_int<20, true > revArr[32],  ac_int<32, false > tw[1024],  ac_int<32, false > tw_h[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_hybrid_59 \
  ccs_real_hybrid(ac_int<32, false > x[1024],ac_int<32, false > m,ac_int<32, false > twiddle[32],ac_int<32, false > twiddle_h[32],ac_int<20, true > revArr[32],ac_int<32, false > tw[1024],ac_int<32, false > tw_h[1024]);\
  void hybrid(ac_int<32, false > x[1024],ac_int<32, false > m,ac_int<32, false > twiddle[32],ac_int<32, false > twiddle_h[32],ac_int<20, true > revArr[32],ac_int<32, false > tw[1024],ac_int<32, false > tw_h[1024])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'hybrid' for RTL block 'hybrid'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(x,m,twiddle,twiddle_h,revArr,tw,tw_h);\
    ccs_real_hybrid(x,m,twiddle,twiddle_h,revArr,tw,tw_h);\
    mc_testbench_capture_OUT(x,m,twiddle,twiddle_h,revArr,tw,tw_h);\
}\
  void ccs_real_hybrid
#else
#define ccs_intercept_hybrid_59 hybrid
#endif //CCS_DESIGN_FUNC_hybrid
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// mult 18 INLINE
#define ccs_intercept_mult_18 mult
// naiveNTT 37 INLINE
#define ccs_intercept_naiveNTT_37 naiveNTT
// getBitReverseArr 63 INLINE
#define ccs_intercept_getBitReverseArr_63 getBitReverseArr
// bit_reverse 91 INLINE
#define ccs_intercept_bit_reverse_91 bit_reverse
// compVec 121 INLINE
#define ccs_intercept_compVec_121 compVec
// modExp 155 INLINE
#define ccs_intercept_modExp_155 modExp
// modulo 182 INLINE
#define ccs_intercept_modulo_182 modulo
// printVec 195 INLINE
#define ccs_intercept_printVec_195 printVec
// modulo_add 12 INLINE
#define ccs_intercept_modulo_add_12 modulo_add
// modulo_sub 31 INLINE
#define ccs_intercept_modulo_sub_31 modulo_sub
// butterFly 47 INLINE
#define ccs_intercept_butterFly_47 butterFly
