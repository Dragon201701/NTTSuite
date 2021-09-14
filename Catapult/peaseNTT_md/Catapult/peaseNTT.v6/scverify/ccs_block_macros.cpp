void mc_testbench_capture_IN( ac_int<32, false > xt[16384], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[16384],  ac_int<32, false > twiddle_h[16384]) { mc_testbench::capture_IN(xt,p,r,twiddle,twiddle_h); }
void mc_testbench_capture_OUT( ac_int<32, false > xt[16384], ac_int<32, false > p, ac_int<32, false > r,  ac_int<32, false > twiddle[16384],  ac_int<32, false > twiddle_h[16384]) { mc_testbench::capture_OUT(xt,p,r,twiddle,twiddle_h); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

