// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_peaceNTT
extern void mc_testbench_capture_IN( ac_int<64, false > vec[4096], ac_int<64, false > p, ac_int<64, false > g,  ac_int<64, false > result[4096],  ac_int<64, false > twiddle[4096]);
extern void mc_testbench_capture_OUT( ac_int<64, false > vec[4096], ac_int<64, false > p, ac_int<64, false > g,  ac_int<64, false > result[4096],  ac_int<64, false > twiddle[4096]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_peaceNTT_68 \
  ccs_real_peaceNTT(ac_int<64, false > vec[4096],ac_int<64, false > p,ac_int<64, false > g,ac_int<64, false > result[4096],ac_int<64, false > twiddle[4096]);\
  void peaceNTT(ac_int<64, false > vec[4096],ac_int<64, false > p,ac_int<64, false > g,ac_int<64, false > result[4096],ac_int<64, false > twiddle[4096])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'peaceNTT' for RTL block 'peaceNTT'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(vec,p,g,result,twiddle);\
    ccs_real_peaceNTT(vec,p,g,result,twiddle);\
    mc_testbench_capture_OUT(vec,p,g,result,twiddle);\
}\
  void ccs_real_peaceNTT
#else
#define ccs_intercept_peaceNTT_68 peaceNTT
#endif //CCS_DESIGN_FUNC_peaceNTT
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// atan_2mi 79 INLINE
#define ccs_intercept_atan_2mi_79 atan_2mi
// atan_pi_2mi 89 INLINE
#define ccs_intercept_atan_pi_2mi_89 atan_pi_2mi
// K 99 INLINE
#define ccs_intercept_K_99 K
// modulo_dev 15 INLINE
#define ccs_intercept_modulo_dev_15 modulo_dev
// modExp_dev 32 INLINE
#define ccs_intercept_modExp_dev_32 modExp_dev
// cpyVec_dev 57 INLINE
#define ccs_intercept_cpyVec_dev_57 cpyVec_dev
