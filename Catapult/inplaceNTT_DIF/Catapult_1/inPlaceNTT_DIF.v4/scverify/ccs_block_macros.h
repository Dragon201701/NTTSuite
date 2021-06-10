// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_inPlaceNTT_DIF
extern void mc_testbench_capture_IN( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r,  ac_int<64, false > result[1024]);
extern void mc_testbench_capture_OUT( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r,  ac_int<64, false > result[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_inPlaceNTT_DIF_33 \
  ccs_real_inPlaceNTT_DIF(ac_int<64, false > vec[1024],ac_int<64, false > p,ac_int<64, false > r,ac_int<64, false > result[1024]);\
  void inPlaceNTT_DIF(ac_int<64, false > vec[1024],ac_int<64, false > p,ac_int<64, false > r,ac_int<64, false > result[1024])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'inPlaceNTT_DIF' for RTL block 'inPlaceNTT_DIF'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(vec,p,r,result);\
    ccs_real_inPlaceNTT_DIF(vec,p,r,result);\
    mc_testbench_capture_OUT(vec,p,r,result);\
}\
  void ccs_real_inPlaceNTT_DIF
#else
#define ccs_intercept_inPlaceNTT_DIF_33 inPlaceNTT_DIF
#endif //CCS_DESIGN_FUNC_inPlaceNTT_DIF
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// atan_2mi 79 INLINE
#define ccs_intercept_atan_2mi_79 atan_2mi
// atan_pi_2mi 89 INLINE
#define ccs_intercept_atan_pi_2mi_89 atan_pi_2mi
// K 99 INLINE
#define ccs_intercept_K_99 K
// modExp 13 INLINE
#define ccs_intercept_modExp_13 modExp
