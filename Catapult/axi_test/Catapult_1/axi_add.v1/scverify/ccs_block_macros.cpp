void mc_testbench_capture_IN( ac_int<32, false > a[16],  ac_int<32, false > b[16]) { mc_testbench::capture_IN(a,b); }
void mc_testbench_capture_OUT( ac_int<32, false > a[16],  ac_int<32, false > b[16]) { mc_testbench::capture_OUT(a,b); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

