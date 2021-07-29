// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_stockham_DIT
extern void mc_testbench_capture_IN( ac_int<64, false > xt[1024], ac_int<64, false > p, ac_int<64, false > g,  ac_int<64, false > twiddle[1024]);
extern void mc_testbench_capture_OUT( ac_int<64, false > xt[1024], ac_int<64, false > p, ac_int<64, false > g,  ac_int<64, false > twiddle[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_stockham_DIT_42 \
  ccs_real_stockham_DIT(ac_int<64, false > xt[1024],ac_int<64, false > p,ac_int<64, false > g,ac_int<64, false > twiddle[1024]);\
  void stockham_DIT(ac_int<64, false > xt[1024],ac_int<64, false > p,ac_int<64, false > g,ac_int<64, false > twiddle[1024])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'stockham_DIT' for RTL block 'stockham_DIT'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(xt,p,g,twiddle);\
    ccs_real_stockham_DIT(xt,p,g,twiddle);\
    mc_testbench_capture_OUT(xt,p,g,twiddle);\
}\
  void ccs_real_stockham_DIT
#else
#define ccs_intercept_stockham_DIT_42 stockham_DIT
#endif //CCS_DESIGN_FUNC_stockham_DIT
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// atan_2mi 79 INLINE
#define ccs_intercept_atan_2mi_79 atan_2mi
// atan_pi_2mi 89 INLINE
#define ccs_intercept_atan_pi_2mi_89 atan_pi_2mi
// K 99 INLINE
#define ccs_intercept_K_99 K
// modulo_dev 5 INLINE
#define ccs_intercept_modulo_dev_5 modulo_dev
// modExp 22 INLINE
#define ccs_intercept_modExp_22 modExp
