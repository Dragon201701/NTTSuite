void mc_testbench_capture_IN( ac_int<32, false > x[1024], ac_int<32, false > m,  ac_int<32, false > twiddle[32],  ac_int<32, false > twiddle_h[32],  ac_int<20, true > revArr[32],  ac_int<32, false > tw[1024],  ac_int<32, false > tw_h[1024]) { mc_testbench::capture_IN(x,m,twiddle,twiddle_h,revArr,tw,tw_h); }
void mc_testbench_capture_OUT( ac_int<32, false > x[1024], ac_int<32, false > m,  ac_int<32, false > twiddle[32],  ac_int<32, false > twiddle_h[32],  ac_int<20, true > revArr[32],  ac_int<32, false > tw[1024],  ac_int<32, false > tw_h[1024]) { mc_testbench::capture_OUT(x,m,twiddle,twiddle_h,revArr,tw,tw_h); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

