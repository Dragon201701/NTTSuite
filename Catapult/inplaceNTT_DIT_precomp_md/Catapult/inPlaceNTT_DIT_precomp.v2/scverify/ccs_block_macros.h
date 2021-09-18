// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_inPlaceNTT_DIT_precomp
extern void mc_testbench_capture_IN( ac_sync &run,  ac_int<32, false > vec[1024], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024],  ac_sync &complete);
extern void mc_testbench_capture_OUT( ac_sync &run,  ac_int<32, false > vec[1024], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[1024],  ac_int<32, false > twiddle_h[1024],  ac_sync &complete);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_inPlaceNTT_DIT_precomp_48 \
  ccs_real_inPlaceNTT_DIT_precomp(ac_sync &run,ac_int<32, false > vec[1024],ac_int<32, false > p,ac_int<32, false > r,ac_int<32, false > twiddle[1024],ac_int<32, false > twiddle_h[1024],ac_sync &complete);\
  void inPlaceNTT_DIT_precomp(ac_sync &run,ac_int<32, false > vec[1024],ac_int<32, false > p,ac_int<32, false > r,ac_int<32, false > twiddle[1024],ac_int<32, false > twiddle_h[1024],ac_sync &complete)\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'inPlaceNTT_DIT_precomp' for RTL block 'inPlaceNTT_DIT_precomp'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(run,vec,p,r,twiddle,twiddle_h,complete);\
    ccs_real_inPlaceNTT_DIT_precomp(run,vec,p,r,twiddle,twiddle_h,complete);\
    mc_testbench_capture_OUT(run,vec,p,r,twiddle,twiddle_h,complete);\
}\
  void ccs_real_inPlaceNTT_DIT_precomp
#else
#define ccs_intercept_inPlaceNTT_DIT_precomp_48 inPlaceNTT_DIT_precomp
#endif //CCS_DESIGN_FUNC_inPlaceNTT_DIT_precomp
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// modulo_sub 24 BLOCK
#define ccs_intercept_modulo_sub_24 modulo_sub
// modulo_add 12 BLOCK
#define ccs_intercept_modulo_add_12 modulo_add
// mult 37 INLINE
#define ccs_intercept_mult_37 mult
