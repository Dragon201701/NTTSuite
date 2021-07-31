void mc_testbench_capture_IN(ac_int<64, false > base, ac_int<64, false > exp, ac_int<64, false > m,  ac_int<64, false > &result) { mc_testbench::capture_IN(base,exp,m,result); }
void mc_testbench_capture_OUT(ac_int<64, false > base, ac_int<64, false > exp, ac_int<64, false > m,  ac_int<64, false > &result) { mc_testbench::capture_OUT(base,exp,m,result); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

