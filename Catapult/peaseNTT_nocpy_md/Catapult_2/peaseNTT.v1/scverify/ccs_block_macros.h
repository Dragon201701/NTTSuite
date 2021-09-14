// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_peaseNTT
extern void mc_testbench_capture_IN( ac_int<32, false > xt[1024], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024]);
extern void mc_testbench_capture_OUT( ac_int<32, false > xt[1024], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_peaseNTT_61 \
  ccs_real_peaseNTT(ac_int<32, false > xt[1024],ac_int<32, false > p,ac_int<32, false > r,ac_int<32, false > twiddle[1024],ac_int<32, false > twiddle_h[1024]);\
  void peaseNTT(ac_int<32, false > xt[1024],ac_int<32, false > p,ac_int<32, false > r,ac_int<32, false > twiddle[1024],ac_int<32, false > twiddle_h[1024])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'peaseNTT' for RTL block 'peaseNTT'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(xt,p,r,twiddle,twiddle_h);\
    ccs_real_peaseNTT(xt,p,r,twiddle,twiddle_h);\
    mc_testbench_capture_OUT(xt,p,r,twiddle,twiddle_h);\
}\
  void ccs_real_peaseNTT
#else
#define ccs_intercept_peaseNTT_61 peaseNTT
#endif //CCS_DESIGN_FUNC_peaseNTT
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// mult 14 INLINE
#define ccs_intercept_mult_14 mult
// naiveNTT 33 INLINE
#define ccs_intercept_naiveNTT_33 naiveNTT
// bit_reverse 60 INLINE
#define ccs_intercept_bit_reverse_60 bit_reverse
// compVec 90 INLINE
#define ccs_intercept_compVec_90 compVec
// modExp 124 INLINE
#define ccs_intercept_modExp_124 modExp
// modulo 151 INLINE
#define ccs_intercept_modulo_151 modulo
// printVec 164 INLINE
#define ccs_intercept_printVec_164 printVec
// modulo_add 12 INLINE
#define ccs_intercept_modulo_add_12 modulo_add
// modulo_sub 26 INLINE
#define ccs_intercept_modulo_sub_26 modulo_sub
// butterFly1 42 INLINE
#define ccs_intercept_butterFly1_42 butterFly1
// butterFly2 50 INLINE
#define ccs_intercept_butterFly2_50 butterFly2
// randVec 11 INLINE
#define ccs_intercept_randVec_11 randVec
// gettwiddle 21 INLINE
#define ccs_intercept_gettwiddle_21 gettwiddle
// main 34 INLINE
#define ccs_intercept_main_34 main
