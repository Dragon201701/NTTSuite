// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_axi_add
extern void mc_testbench_capture_IN( ac_int<32, false > a[16],  ac_int<32, false > b[16]);
extern void mc_testbench_capture_OUT( ac_int<32, false > a[16],  ac_int<32, false > b[16]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_axi_add_5 \
  ccs_real_axi_add(ac_int<32, false > a[16],ac_int<32, false > b[16]);\
  void axi_add(ac_int<32, false > a[16],ac_int<32, false > b[16])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'axi_add' for RTL block 'axi_add'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(a,b);\
    ccs_real_axi_add(a,b);\
    mc_testbench_capture_OUT(a,b);\
}\
  void ccs_real_axi_add
#else
#define ccs_intercept_axi_add_5 axi_add
#endif //CCS_DESIGN_FUNC_axi_add
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

