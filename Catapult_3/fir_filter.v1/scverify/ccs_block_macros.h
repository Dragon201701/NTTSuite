// ccs_block_macros.h
#include "mc_testbench.h"
extern void mc_testbench_capture_IN(ac_fixed<3, 1, true, AC_TRN, AC_WRAP > i_sample,  ac_fixed<10, -2, true, AC_TRN, AC_WRAP > b[127],  ac_fixed<9, 1, true, AC_RND, AC_SAT_SYM > &y);
extern void mc_testbench_capture_OUT(ac_fixed<3, 1, true, AC_TRN, AC_WRAP > i_sample,  ac_fixed<10, -2, true, AC_TRN, AC_WRAP > b[127],  ac_fixed<9, 1, true, AC_RND, AC_SAT_SYM > &y);
extern void mc_testbench_wait_for_idle_sync();

#ifdef CCS_DESIGN_FUNC_fir_filter
#define ccs_intercept_fir_filter_13 \
  ccs_real_fir_filter(const ac_fixed<3, 1, true, AC_TRN, AC_WRAP > i_sample,ac_fixed<10, -2, true, AC_TRN, AC_WRAP > b[127],ac_fixed<9, 1, true, AC_RND, AC_SAT_SYM > &y);\
  void fir_filter(const ac_fixed<3, 1, true, AC_TRN, AC_WRAP > i_sample,ac_fixed<10, -2, true, AC_TRN, AC_WRAP > b[127],ac_fixed<9, 1, true, AC_RND, AC_SAT_SYM > &y)\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'fir_filter' for RTL block 'fir_filter'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(i_sample,b,y);\
    ccs_real_fir_filter(i_sample,b,y);\
    mc_testbench_capture_OUT(i_sample,b,y);\
}\
  void ccs_real_fir_filter
#else
#define ccs_intercept_fir_filter_13 fir_filter
#endif
