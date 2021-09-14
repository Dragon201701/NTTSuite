// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_peaseNTT
extern void mc_testbench_capture_IN( ac_int<32, false > xt[1024], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024]);
extern void mc_testbench_capture_OUT( ac_int<32, false > xt[1024], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_peaseNTT_81 \
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
#define ccs_intercept_peaseNTT_81 peaseNTT
#endif //CCS_DESIGN_FUNC_peaseNTT
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// mult 40 BLOCK
#define ccs_intercept_mult_40 mult
// modulo_sub 26 BLOCK
#define ccs_intercept_modulo_sub_26 modulo_sub
// modulo_add 12 BLOCK
#define ccs_intercept_modulo_add_12 modulo_add
// bit_reverse 14 INLINE
#define ccs_intercept_bit_reverse_14 bit_reverse
// compVec 44 INLINE
#define ccs_intercept_compVec_44 compVec
// modExp 78 INLINE
#define ccs_intercept_modExp_78 modExp
// modulo 105 INLINE
#define ccs_intercept_modulo_105 modulo
// printVec 118 INLINE
#define ccs_intercept_printVec_118 printVec
// butterFly1 62 INLINE
#define ccs_intercept_butterFly1_62 butterFly1
// butterFly2 70 INLINE
#define ccs_intercept_butterFly2_70 butterFly2
// randVec 9 INLINE
#define ccs_intercept_randVec_9 randVec
// naiveNTT 27 INLINE
#define ccs_intercept_naiveNTT_27 naiveNTT
// gettwiddle 46 INLINE
#define ccs_intercept_gettwiddle_46 gettwiddle
// main 59 INLINE
#define ccs_intercept_main_59 main
