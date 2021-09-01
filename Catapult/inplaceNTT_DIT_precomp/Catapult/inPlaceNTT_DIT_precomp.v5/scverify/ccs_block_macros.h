// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_inPlaceNTT_DIT_precomp
extern void mc_testbench_capture_IN( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r,  ac_int<64, false > twiddle[1024]);
extern void mc_testbench_capture_OUT( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r,  ac_int<64, false > twiddle[1024]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_inPlaceNTT_DIT_precomp_41 \
  ccs_real_inPlaceNTT_DIT_precomp(ac_int<64, false > vec[1024],ac_int<64, false > p,ac_int<64, false > r,ac_int<64, false > twiddle[1024]);\
  void inPlaceNTT_DIT_precomp(ac_int<64, false > vec[1024],ac_int<64, false > p,ac_int<64, false > r,ac_int<64, false > twiddle[1024])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'inPlaceNTT_DIT_precomp' for RTL block 'inPlaceNTT_DIT_precomp'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(vec,p,r,twiddle);\
    ccs_real_inPlaceNTT_DIT_precomp(vec,p,r,twiddle);\
    mc_testbench_capture_OUT(vec,p,r,twiddle);\
}\
  void ccs_real_inPlaceNTT_DIT_precomp
#else
#define ccs_intercept_inPlaceNTT_DIT_precomp_41 inPlaceNTT_DIT_precomp
#endif //CCS_DESIGN_FUNC_inPlaceNTT_DIT_precomp
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// atan_2mi 172 INLINE
#define ccs_intercept_atan_2mi_172 atan_2mi
// atan_pi_2mi 248 INLINE
#define ccs_intercept_atan_pi_2mi_248 atan_pi_2mi
// K 255 INLINE
#define ccs_intercept_K_255 K
// modulo 19 INLINE
#define ccs_intercept_modulo_19 modulo
