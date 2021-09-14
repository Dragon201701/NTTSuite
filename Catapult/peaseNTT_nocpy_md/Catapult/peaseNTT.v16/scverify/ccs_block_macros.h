// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_peaseNTT
extern void mc_testbench_capture_IN( ac_int<32, false > xt[4096], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[4096],  ac_int<32, false > twiddle_h[4096]);
extern void mc_testbench_capture_OUT( ac_int<32, false > xt[4096], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[4096],  ac_int<32, false > twiddle_h[4096]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_peaseNTT_60 \
  ccs_real_peaseNTT(ac_int<32, false > xt[4096],ac_int<32, false > p,ac_int<32, false > r,ac_int<32, false > twiddle[4096],ac_int<32, false > twiddle_h[4096]);\
  void peaseNTT(ac_int<32, false > xt[4096],ac_int<32, false > p,ac_int<32, false > r,ac_int<32, false > twiddle[4096],ac_int<32, false > twiddle_h[4096])\
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
#define ccs_intercept_peaseNTT_60 peaseNTT
#endif //CCS_DESIGN_FUNC_peaseNTT
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// atan_2mi 172 INLINE
#define ccs_intercept_atan_2mi_172 atan_2mi
// atan_pi_2mi 248 INLINE
#define ccs_intercept_atan_pi_2mi_248 atan_pi_2mi
// K 255 INLINE
#define ccs_intercept_K_255 K
// mult 18 INLINE
#define ccs_intercept_mult_18 mult
// naiveNTT 37 INLINE
#define ccs_intercept_naiveNTT_37 naiveNTT
// bit_reverse 64 INLINE
#define ccs_intercept_bit_reverse_64 bit_reverse
// compVec 94 INLINE
#define ccs_intercept_compVec_94 compVec
// modExp 128 INLINE
#define ccs_intercept_modExp_128 modExp
// modulo 155 INLINE
#define ccs_intercept_modulo_155 modulo
// printVec 168 INLINE
#define ccs_intercept_printVec_168 printVec
// modulo_add 12 INLINE
#define ccs_intercept_modulo_add_12 modulo_add
// modulo_sub 26 INLINE
#define ccs_intercept_modulo_sub_26 modulo_sub
// butterFly1 42 INLINE
#define ccs_intercept_butterFly1_42 butterFly1
// butterFly2 50 INLINE
#define ccs_intercept_butterFly2_50 butterFly2
