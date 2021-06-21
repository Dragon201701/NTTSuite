void mc_testbench_capture_IN( ac_int<64, false > vec[4096], ac_int<64, false > p, ac_int<64, false > g,  ac_int<64, false > result[4096],  ac_int<64, false > twiddle[4096]) { mc_testbench::capture_IN(vec,p,g,result,twiddle); }
void mc_testbench_capture_OUT( ac_int<64, false > vec[4096], ac_int<64, false > p, ac_int<64, false > g,  ac_int<64, false > result[4096],  ac_int<64, false > twiddle[4096]) { mc_testbench::capture_OUT(vec,p,g,result,twiddle); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

