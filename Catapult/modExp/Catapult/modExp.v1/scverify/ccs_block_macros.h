// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_modExp
extern void mc_testbench_capture_IN(ac_int<64, false > base, ac_int<64, false > exp, ac_int<64, false > m,  ac_int<64, false > &result);
extern void mc_testbench_capture_OUT(ac_int<64, false > base, ac_int<64, false > exp, ac_int<64, false > m,  ac_int<64, false > &result);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_modExp_11 \
  ccs_real_modExp(const ac_int<64, false > base,const ac_int<64, false > exp,const ac_int<64, false > m,ac_int<64, false > &result);\
  void modExp(const ac_int<64, false > base,const ac_int<64, false > exp,const ac_int<64, false > m,ac_int<64, false > &result)\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'modExp' for RTL block 'modExp'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(base,exp,m,result);\
    ccs_real_modExp(base,exp,m,result);\
    mc_testbench_capture_OUT(base,exp,m,result);\
}\
  void ccs_real_modExp
#else
#define ccs_intercept_modExp_11 modExp
#endif //CCS_DESIGN_FUNC_modExp
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

