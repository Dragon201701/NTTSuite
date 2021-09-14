void mc_testbench_capture_IN( ac_sync &run,  ac_int<32, false > vec[4096], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[4096],  ac_int<32, false > twiddle_h[4096],  ac_sync &complete) { mc_testbench::capture_IN(run,vec,p,r,twiddle,twiddle_h,complete); }
void mc_testbench_capture_OUT( ac_sync &run,  ac_int<32, false > vec[4096], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[4096],  ac_int<32, false > twiddle_h[4096],  ac_sync &complete) { mc_testbench::capture_OUT(run,vec,p,r,twiddle,twiddle_h,complete); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

