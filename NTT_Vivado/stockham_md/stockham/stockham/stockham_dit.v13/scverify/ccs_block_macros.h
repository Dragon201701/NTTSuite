// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_stockham_dit
extern void mc_testbench_capture_IN( ac_int<32, false > xt[1024], ac_int<32, false > p,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024]);
extern void mc_testbench_capture_OUT( ac_int<32, false > xt[1024], ac_int<32, false > p,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_stockham_dit_32 \
  ccs_real_stockham_dit(ac_int<32, false > xt[1024],ac_int<32, false > p,ac_int<32, false > twiddle[1024],ac_int<32, false > twiddle_h[1024]);\
  void stockham_dit(ac_int<32, false > xt[1024],ac_int<32, false > p,ac_int<32, false > twiddle[1024],ac_int<32, false > twiddle_h[1024])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'stockham_dit' for RTL block 'stockham_dit'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(xt,p,twiddle,twiddle_h);\
    ccs_real_stockham_dit(xt,p,twiddle,twiddle_h);\
    mc_testbench_capture_OUT(xt,p,twiddle,twiddle_h);\
}\
  void ccs_real_stockham_dit
#else
#define ccs_intercept_stockham_dit_32 stockham_dit
#endif //CCS_DESIGN_FUNC_stockham_dit
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

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
