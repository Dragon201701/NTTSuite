// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_inPlaceNTT_DIF
extern void mc_testbench_capture_IN( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r);
extern void mc_testbench_capture_OUT( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_inPlaceNTT_DIF_33 \
  ccs_real_inPlaceNTT_DIF(ac_int<64, false > vec[1024],ac_int<64, false > p,ac_int<64, false > r);\
  void inPlaceNTT_DIF(ac_int<64, false > vec[1024],ac_int<64, false > p,ac_int<64, false > r)\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'inPlaceNTT_DIF' for RTL block 'inPlaceNTT_DIF'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(vec,p,r);\
    ccs_real_inPlaceNTT_DIF(vec,p,r);\
    mc_testbench_capture_OUT(vec,p,r);\
}\
  void ccs_real_inPlaceNTT_DIF
#else
#define ccs_intercept_inPlaceNTT_DIF_33 inPlaceNTT_DIF
#endif //CCS_DESIGN_FUNC_inPlaceNTT_DIF
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// modulo_dev 10 BLOCK
#define ccs_intercept_modulo_dev_10 modulo_dev
// modExp_dev 24 INLINE
#define ccs_intercept_modExp_dev_24 modExp_dev
