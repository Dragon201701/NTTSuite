void mc_testbench_capture_IN( ac_int<32, false > vec[4096], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[4096],  ac_int<32, false > twiddle_h[4096],  ac_int<32, false > result[13][4096]) { mc_testbench::capture_IN(vec,p,r,twiddle,twiddle_h,result); }
void mc_testbench_capture_OUT( ac_int<32, false > vec[4096], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[4096],  ac_int<32, false > twiddle_h[4096],  ac_int<32, false > result[13][4096]) { mc_testbench::capture_OUT(vec,p,r,twiddle,twiddle_h,result); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

