// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_axi_test
extern void mc_testbench_capture_IN( ac_sync &run,  ac_int<32, false > a[16],  ac_int<32, false > &arrsum,  ac_sync &complete);
extern void mc_testbench_capture_OUT( ac_sync &run,  ac_int<32, false > a[16],  ac_int<32, false > &arrsum,  ac_sync &complete);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_axi_test_5 \
  ccs_real_axi_test(ac_sync &run,ac_int<32, false > a[16],ac_int<32, false > &arrsum,ac_sync &complete);\
  void axi_test(ac_sync &run,ac_int<32, false > a[16],ac_int<32, false > &arrsum,ac_sync &complete)\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'axi_test' for RTL block 'axi_test'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(run,a,arrsum,complete);\
    ccs_real_axi_test(run,a,arrsum,complete);\
    mc_testbench_capture_OUT(run,a,arrsum,complete);\
}\
  void ccs_real_axi_test
#else
#define ccs_intercept_axi_test_5 axi_test
#endif //CCS_DESIGN_FUNC_axi_test
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// main 9 INLINE
#define ccs_intercept_main_9 main
