void mc_testbench_capture_IN(ac_fixed<3, 1, true, AC_TRN, AC_WRAP > i_sample,  ac_fixed<10, -2, true, AC_TRN, AC_WRAP > b[127],  ac_fixed<9, 1, true, AC_RND, AC_SAT_SYM > &y) { mc_testbench::capture_IN(i_sample,b,y); }
void mc_testbench_capture_OUT(ac_fixed<3, 1, true, AC_TRN, AC_WRAP > i_sample,  ac_fixed<10, -2, true, AC_TRN, AC_WRAP > b[127],  ac_fixed<9, 1, true, AC_RND, AC_SAT_SYM > &y) { mc_testbench::capture_OUT(i_sample,b,y); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

