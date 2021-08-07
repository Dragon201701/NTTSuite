void mc_testbench_capture_IN( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r) { mc_testbench::capture_IN(vec,p,r); }
void mc_testbench_capture_OUT( ac_int<64, false > vec[1024], ac_int<64, false > p, ac_int<64, false > r) { mc_testbench::capture_OUT(vec,p,r); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

