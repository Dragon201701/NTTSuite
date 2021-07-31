#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW_trans_rsc.h"
#include "ccs_ioport_trans_rsc_v1.h"
#include <mc_monitor.h>
#include <mc_simulator_extensions.h>
#include "mc_dut_wrapper.h"
#include "ccs_probes.cpp"
#include <mt19937ar.c>
#ifndef TO_QUOTED_STRING
#define TO_QUOTED_STRING(x) TO_QUOTED_STRING1(x)
#define TO_QUOTED_STRING1(x) #x
#endif
#ifndef TOP_HDL_ENTITY
#define TOP_HDL_ENTITY inPlaceNTT_DIF
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_5;
extern double __scv_hold_time_RSCID_6;
extern double __scv_hold_time_RSCID_8;
extern double __scv_hold_time_RSCID_9;
extern double __scv_hold_time_RSCID_10;
extern double __scv_hold_time_RSCID_11;
extern double __scv_hold_time_RSCID_12;
extern double __scv_hold_time_RSCID_13;
extern double __scv_hold_time_RSCID_14;
extern double __scv_hold_time_RSCID_15;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_5 = 0;
double __scv_hold_time_RSCID_6 = 0;
double __scv_hold_time_RSCID_8 = 0;
double __scv_hold_time_RSCID_9 = 0;
double __scv_hold_time_RSCID_10 = 0;
double __scv_hold_time_RSCID_11 = 0;
double __scv_hold_time_RSCID_12 = 0;
double __scv_hold_time_RSCID_13 = 0;
double __scv_hold_time_RSCID_14 = 0;
double __scv_hold_time_RSCID_15 = 0;
#endif

class scverify_top : public sc_module
{
public:
  sc_signal<sc_logic>                                                          rst;
  sc_signal<sc_logic>                                                          rst_n;
  sc_signal<sc_logic>                                                          SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                          SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                          TLS_design_is_idle;
  sc_signal<bool>                                                              TLS_design_is_idle_reg;
  sc_clock                                                                     clk;
  mc_programmable_reset                                                        rst_driver;
  sc_signal<sc_logic>                                                          TLS_rst;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_0_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_0_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_0_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_1_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_1_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_1_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_2_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_2_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_2_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_3_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_3_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_3_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_4_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_4_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_4_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_5_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_5_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_5_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_6_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_6_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_6_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_7_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_7_we;
  sc_signal<sc_lv<7> >                                                         TLS_vec_rsc_0_7_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<64> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<64> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  ccs_DUT_wrapper                                                              inPlaceNTT_DIF_INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__0__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__1__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__2__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__3__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__4__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__5__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__6__INST;
  BLOCK_1R1W_RBW_trans_rsc<7,64,128 >                                          vec_rsc_0__7__INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   r_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_in_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_vec;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_out_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_vec;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_3_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_4_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_5_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_6_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_7_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<64, false >,1024>,64,false>  transactor_vec;
  tlm::tlm_fifo<ac_int<64, false > >                                           TLS_in_fifo_p;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_p;
  mc_trios_input_monitor                                                       trios_monitor_p_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<64, false >,64,false>                             transactor_p;
  tlm::tlm_fifo<ac_int<64, false > >                                           TLS_in_fifo_r;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_r;
  mc_trios_input_monitor                                                       trios_monitor_r_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<64, false >,64,false>                             transactor_r;
  mc_testbench                                                                 testbench_INST;
  sc_signal<sc_logic>                                                          catapult_start;
  sc_signal<sc_logic>                                                          catapult_done;
  sc_signal<sc_logic>                                                          catapult_ready;
  sc_signal<sc_logic>                                                          in_sync;
  sc_signal<sc_logic>                                                          out_sync;
  sc_signal<sc_logic>                                                          inout_sync;
  sc_signal<unsigned>                                                          wait_for_init;
  sync_generator                                                               sync_generator_INST;
  catapult_monitor                                                             catapult_monitor_INST;
  ccs_probe_monitor                                                           *ccs_probe_monitor_INST;
  sc_event                                                                     generate_reset_event;
  sc_event                                                                     deadlock_event;
  sc_signal<sc_logic>                                                          deadlocked;
  sc_signal<sc_logic>                                                          maxsimtime;
  sc_event                                                                     max_sim_time_event;
  sc_signal<sc_logic>                                                          TLS_enable_stalls;
  sc_signal<unsigned short>                                                    TLS_stall_coverage;

  void TLS_rst_method();
  void max_sim_time_notify();
  void start_of_simulation();
  void setup_debug();
  void debug(const char* varname, int flags, int count);
  void generate_reset();
  void install_observe_foreign_signals();
  void deadlock_watch();
  void deadlock_notify();

  // Constructor
  SC_HAS_PROCESS(scverify_top);
  scverify_top(const sc_module_name& name)
    : rst("rst")
    , rst_n("rst_n")
    , SIG_SC_LOGIC_0("SIG_SC_LOGIC_0")
    , SIG_SC_LOGIC_1("SIG_SC_LOGIC_1")
    , TLS_design_is_idle("TLS_design_is_idle")
    , TLS_design_is_idle_reg("TLS_design_is_idle_reg")
    , CCS_CLK_CTOR(clk, "clk", 20, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 140.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_vec_rsc_0_0_wadr("TLS_vec_rsc_0_0_wadr")
    , TLS_vec_rsc_0_0_d("TLS_vec_rsc_0_0_d")
    , TLS_vec_rsc_0_0_we("TLS_vec_rsc_0_0_we")
    , TLS_vec_rsc_0_0_radr("TLS_vec_rsc_0_0_radr")
    , TLS_vec_rsc_0_0_q("TLS_vec_rsc_0_0_q")
    , TLS_vec_rsc_triosy_0_0_lz("TLS_vec_rsc_triosy_0_0_lz")
    , TLS_vec_rsc_0_1_wadr("TLS_vec_rsc_0_1_wadr")
    , TLS_vec_rsc_0_1_d("TLS_vec_rsc_0_1_d")
    , TLS_vec_rsc_0_1_we("TLS_vec_rsc_0_1_we")
    , TLS_vec_rsc_0_1_radr("TLS_vec_rsc_0_1_radr")
    , TLS_vec_rsc_0_1_q("TLS_vec_rsc_0_1_q")
    , TLS_vec_rsc_triosy_0_1_lz("TLS_vec_rsc_triosy_0_1_lz")
    , TLS_vec_rsc_0_2_wadr("TLS_vec_rsc_0_2_wadr")
    , TLS_vec_rsc_0_2_d("TLS_vec_rsc_0_2_d")
    , TLS_vec_rsc_0_2_we("TLS_vec_rsc_0_2_we")
    , TLS_vec_rsc_0_2_radr("TLS_vec_rsc_0_2_radr")
    , TLS_vec_rsc_0_2_q("TLS_vec_rsc_0_2_q")
    , TLS_vec_rsc_triosy_0_2_lz("TLS_vec_rsc_triosy_0_2_lz")
    , TLS_vec_rsc_0_3_wadr("TLS_vec_rsc_0_3_wadr")
    , TLS_vec_rsc_0_3_d("TLS_vec_rsc_0_3_d")
    , TLS_vec_rsc_0_3_we("TLS_vec_rsc_0_3_we")
    , TLS_vec_rsc_0_3_radr("TLS_vec_rsc_0_3_radr")
    , TLS_vec_rsc_0_3_q("TLS_vec_rsc_0_3_q")
    , TLS_vec_rsc_triosy_0_3_lz("TLS_vec_rsc_triosy_0_3_lz")
    , TLS_vec_rsc_0_4_wadr("TLS_vec_rsc_0_4_wadr")
    , TLS_vec_rsc_0_4_d("TLS_vec_rsc_0_4_d")
    , TLS_vec_rsc_0_4_we("TLS_vec_rsc_0_4_we")
    , TLS_vec_rsc_0_4_radr("TLS_vec_rsc_0_4_radr")
    , TLS_vec_rsc_0_4_q("TLS_vec_rsc_0_4_q")
    , TLS_vec_rsc_triosy_0_4_lz("TLS_vec_rsc_triosy_0_4_lz")
    , TLS_vec_rsc_0_5_wadr("TLS_vec_rsc_0_5_wadr")
    , TLS_vec_rsc_0_5_d("TLS_vec_rsc_0_5_d")
    , TLS_vec_rsc_0_5_we("TLS_vec_rsc_0_5_we")
    , TLS_vec_rsc_0_5_radr("TLS_vec_rsc_0_5_radr")
    , TLS_vec_rsc_0_5_q("TLS_vec_rsc_0_5_q")
    , TLS_vec_rsc_triosy_0_5_lz("TLS_vec_rsc_triosy_0_5_lz")
    , TLS_vec_rsc_0_6_wadr("TLS_vec_rsc_0_6_wadr")
    , TLS_vec_rsc_0_6_d("TLS_vec_rsc_0_6_d")
    , TLS_vec_rsc_0_6_we("TLS_vec_rsc_0_6_we")
    , TLS_vec_rsc_0_6_radr("TLS_vec_rsc_0_6_radr")
    , TLS_vec_rsc_0_6_q("TLS_vec_rsc_0_6_q")
    , TLS_vec_rsc_triosy_0_6_lz("TLS_vec_rsc_triosy_0_6_lz")
    , TLS_vec_rsc_0_7_wadr("TLS_vec_rsc_0_7_wadr")
    , TLS_vec_rsc_0_7_d("TLS_vec_rsc_0_7_d")
    , TLS_vec_rsc_0_7_we("TLS_vec_rsc_0_7_we")
    , TLS_vec_rsc_0_7_radr("TLS_vec_rsc_0_7_radr")
    , TLS_vec_rsc_0_7_q("TLS_vec_rsc_0_7_q")
    , TLS_vec_rsc_triosy_0_7_lz("TLS_vec_rsc_triosy_0_7_lz")
    , TLS_p_rsc_dat("TLS_p_rsc_dat")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_r_rsc_dat("TLS_r_rsc_dat")
    , TLS_r_rsc_triosy_lz("TLS_r_rsc_triosy_lz")
    , inPlaceNTT_DIF_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , vec_rsc_0__0__INST("vec_rsc_0__0_", true)
    , vec_rsc_0__1__INST("vec_rsc_0__1_", true)
    , vec_rsc_0__2__INST("vec_rsc_0__2_", true)
    , vec_rsc_0__3__INST("vec_rsc_0__3_", true)
    , vec_rsc_0__4__INST("vec_rsc_0__4_", true)
    , vec_rsc_0__5__INST("vec_rsc_0__5_", true)
    , vec_rsc_0__6__INST("vec_rsc_0__6_", true)
    , vec_rsc_0__7__INST("vec_rsc_0__7_", true)
    , p_rsc_INST("p_rsc", true)
    , r_rsc_INST("r_rsc", true)
    , TLS_in_fifo_vec("TLS_in_fifo_vec", -1)
    , TLS_in_wait_ctrl_fifo_vec("TLS_in_wait_ctrl_fifo_vec", -1)
    , TLS_out_fifo_vec("TLS_out_fifo_vec", -1)
    , TLS_out_wait_ctrl_fifo_vec("TLS_out_wait_ctrl_fifo_vec", -1)
    , trios_monitor_vec_rsc_triosy_0_0_lz_INST("trios_monitor_vec_rsc_triosy_0_0_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_1_lz_INST("trios_monitor_vec_rsc_triosy_0_1_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_2_lz_INST("trios_monitor_vec_rsc_triosy_0_2_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_3_lz_INST("trios_monitor_vec_rsc_triosy_0_3_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_4_lz_INST("trios_monitor_vec_rsc_triosy_0_4_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_5_lz_INST("trios_monitor_vec_rsc_triosy_0_5_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_6_lz_INST("trios_monitor_vec_rsc_triosy_0_6_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_7_lz_INST("trios_monitor_vec_rsc_triosy_0_7_lz_INST")
    , transactor_vec("transactor_vec", 0, 64, 0)
    , TLS_in_fifo_p("TLS_in_fifo_p", -1)
    , TLS_in_wait_ctrl_fifo_p("TLS_in_wait_ctrl_fifo_p", -1)
    , trios_monitor_p_rsc_triosy_lz_INST("trios_monitor_p_rsc_triosy_lz_INST")
    , transactor_p("transactor_p", 0, 64, 0)
    , TLS_in_fifo_r("TLS_in_fifo_r", -1)
    , TLS_in_wait_ctrl_fifo_r("TLS_in_wait_ctrl_fifo_r", -1)
    , trios_monitor_r_rsc_triosy_lz_INST("trios_monitor_r_rsc_triosy_lz_INST")
    , transactor_r("transactor_r", 0, 64, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 292052, 292052, 0)
    , catapult_monitor_INST("Monitor", clk, true, 292052LL, 292052LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    inPlaceNTT_DIF_INST.clk(clk);
    inPlaceNTT_DIF_INST.rst(TLS_rst);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_wadr(TLS_vec_rsc_0_0_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_d(TLS_vec_rsc_0_0_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_we(TLS_vec_rsc_0_0_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_radr(TLS_vec_rsc_0_0_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_q(TLS_vec_rsc_0_0_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_0_lz(TLS_vec_rsc_triosy_0_0_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_wadr(TLS_vec_rsc_0_1_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_d(TLS_vec_rsc_0_1_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_we(TLS_vec_rsc_0_1_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_radr(TLS_vec_rsc_0_1_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_q(TLS_vec_rsc_0_1_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_1_lz(TLS_vec_rsc_triosy_0_1_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_wadr(TLS_vec_rsc_0_2_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_d(TLS_vec_rsc_0_2_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_we(TLS_vec_rsc_0_2_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_radr(TLS_vec_rsc_0_2_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_q(TLS_vec_rsc_0_2_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_2_lz(TLS_vec_rsc_triosy_0_2_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_wadr(TLS_vec_rsc_0_3_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_d(TLS_vec_rsc_0_3_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_we(TLS_vec_rsc_0_3_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_radr(TLS_vec_rsc_0_3_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_q(TLS_vec_rsc_0_3_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_3_lz(TLS_vec_rsc_triosy_0_3_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_wadr(TLS_vec_rsc_0_4_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_d(TLS_vec_rsc_0_4_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_we(TLS_vec_rsc_0_4_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_radr(TLS_vec_rsc_0_4_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_q(TLS_vec_rsc_0_4_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_4_lz(TLS_vec_rsc_triosy_0_4_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_wadr(TLS_vec_rsc_0_5_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_d(TLS_vec_rsc_0_5_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_we(TLS_vec_rsc_0_5_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_radr(TLS_vec_rsc_0_5_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_q(TLS_vec_rsc_0_5_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_5_lz(TLS_vec_rsc_triosy_0_5_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_wadr(TLS_vec_rsc_0_6_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_d(TLS_vec_rsc_0_6_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_we(TLS_vec_rsc_0_6_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_radr(TLS_vec_rsc_0_6_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_q(TLS_vec_rsc_0_6_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_6_lz(TLS_vec_rsc_triosy_0_6_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_wadr(TLS_vec_rsc_0_7_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_d(TLS_vec_rsc_0_7_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_we(TLS_vec_rsc_0_7_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_radr(TLS_vec_rsc_0_7_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_q(TLS_vec_rsc_0_7_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_7_lz(TLS_vec_rsc_triosy_0_7_lz);
    inPlaceNTT_DIF_INST.p_rsc_dat(TLS_p_rsc_dat);
    inPlaceNTT_DIF_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    inPlaceNTT_DIF_INST.r_rsc_dat(TLS_r_rsc_dat);
    inPlaceNTT_DIF_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);

    vec_rsc_0__0__INST.q(TLS_vec_rsc_0_0_q);
    vec_rsc_0__0__INST.radr(TLS_vec_rsc_0_0_radr);
    vec_rsc_0__0__INST.we(TLS_vec_rsc_0_0_we);
    vec_rsc_0__0__INST.d(TLS_vec_rsc_0_0_d);
    vec_rsc_0__0__INST.wadr(TLS_vec_rsc_0_0_wadr);
    vec_rsc_0__0__INST.clk(clk);
    vec_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_8)));

    vec_rsc_0__1__INST.q(TLS_vec_rsc_0_1_q);
    vec_rsc_0__1__INST.radr(TLS_vec_rsc_0_1_radr);
    vec_rsc_0__1__INST.we(TLS_vec_rsc_0_1_we);
    vec_rsc_0__1__INST.d(TLS_vec_rsc_0_1_d);
    vec_rsc_0__1__INST.wadr(TLS_vec_rsc_0_1_wadr);
    vec_rsc_0__1__INST.clk(clk);
    vec_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_9)));

    vec_rsc_0__2__INST.q(TLS_vec_rsc_0_2_q);
    vec_rsc_0__2__INST.radr(TLS_vec_rsc_0_2_radr);
    vec_rsc_0__2__INST.we(TLS_vec_rsc_0_2_we);
    vec_rsc_0__2__INST.d(TLS_vec_rsc_0_2_d);
    vec_rsc_0__2__INST.wadr(TLS_vec_rsc_0_2_wadr);
    vec_rsc_0__2__INST.clk(clk);
    vec_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_10)));

    vec_rsc_0__3__INST.q(TLS_vec_rsc_0_3_q);
    vec_rsc_0__3__INST.radr(TLS_vec_rsc_0_3_radr);
    vec_rsc_0__3__INST.we(TLS_vec_rsc_0_3_we);
    vec_rsc_0__3__INST.d(TLS_vec_rsc_0_3_d);
    vec_rsc_0__3__INST.wadr(TLS_vec_rsc_0_3_wadr);
    vec_rsc_0__3__INST.clk(clk);
    vec_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_11)));

    vec_rsc_0__4__INST.q(TLS_vec_rsc_0_4_q);
    vec_rsc_0__4__INST.radr(TLS_vec_rsc_0_4_radr);
    vec_rsc_0__4__INST.we(TLS_vec_rsc_0_4_we);
    vec_rsc_0__4__INST.d(TLS_vec_rsc_0_4_d);
    vec_rsc_0__4__INST.wadr(TLS_vec_rsc_0_4_wadr);
    vec_rsc_0__4__INST.clk(clk);
    vec_rsc_0__4__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_12)));

    vec_rsc_0__5__INST.q(TLS_vec_rsc_0_5_q);
    vec_rsc_0__5__INST.radr(TLS_vec_rsc_0_5_radr);
    vec_rsc_0__5__INST.we(TLS_vec_rsc_0_5_we);
    vec_rsc_0__5__INST.d(TLS_vec_rsc_0_5_d);
    vec_rsc_0__5__INST.wadr(TLS_vec_rsc_0_5_wadr);
    vec_rsc_0__5__INST.clk(clk);
    vec_rsc_0__5__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_13)));

    vec_rsc_0__6__INST.q(TLS_vec_rsc_0_6_q);
    vec_rsc_0__6__INST.radr(TLS_vec_rsc_0_6_radr);
    vec_rsc_0__6__INST.we(TLS_vec_rsc_0_6_we);
    vec_rsc_0__6__INST.d(TLS_vec_rsc_0_6_d);
    vec_rsc_0__6__INST.wadr(TLS_vec_rsc_0_6_wadr);
    vec_rsc_0__6__INST.clk(clk);
    vec_rsc_0__6__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_14)));

    vec_rsc_0__7__INST.q(TLS_vec_rsc_0_7_q);
    vec_rsc_0__7__INST.radr(TLS_vec_rsc_0_7_radr);
    vec_rsc_0__7__INST.we(TLS_vec_rsc_0_7_we);
    vec_rsc_0__7__INST.d(TLS_vec_rsc_0_7_d);
    vec_rsc_0__7__INST.wadr(TLS_vec_rsc_0_7_wadr);
    vec_rsc_0__7__INST.clk(clk);
    vec_rsc_0__7__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_15)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_5)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_6)));

    trios_monitor_vec_rsc_triosy_0_0_lz_INST.trios(TLS_vec_rsc_triosy_0_0_lz);
    trios_monitor_vec_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_1_lz_INST.trios(TLS_vec_rsc_triosy_0_1_lz);
    trios_monitor_vec_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_2_lz_INST.trios(TLS_vec_rsc_triosy_0_2_lz);
    trios_monitor_vec_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_3_lz_INST.trios(TLS_vec_rsc_triosy_0_3_lz);
    trios_monitor_vec_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_4_lz_INST.trios(TLS_vec_rsc_triosy_0_4_lz);
    trios_monitor_vec_rsc_triosy_0_4_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_5_lz_INST.trios(TLS_vec_rsc_triosy_0_5_lz);
    trios_monitor_vec_rsc_triosy_0_5_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_6_lz_INST.trios(TLS_vec_rsc_triosy_0_6_lz);
    trios_monitor_vec_rsc_triosy_0_6_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_7_lz_INST.trios(TLS_vec_rsc_triosy_0_7_lz);
    trios_monitor_vec_rsc_triosy_0_7_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_vec.in_fifo(TLS_in_fifo_vec);
    transactor_vec.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_vec);
    transactor_vec.out_fifo(TLS_out_fifo_vec);
    transactor_vec.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_vec);
    transactor_vec.bind_clk(clk, true, rst);
    transactor_vec.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_vec.register_block(&vec_rsc_0__0__INST, vec_rsc_0__0__INST.basename(), TLS_vec_rsc_triosy_0_0_lz,
        0, 1016, 8);
    transactor_vec.register_block(&vec_rsc_0__1__INST, vec_rsc_0__1__INST.basename(), TLS_vec_rsc_triosy_0_1_lz,
        1, 1017, 8);
    transactor_vec.register_block(&vec_rsc_0__2__INST, vec_rsc_0__2__INST.basename(), TLS_vec_rsc_triosy_0_2_lz,
        2, 1018, 8);
    transactor_vec.register_block(&vec_rsc_0__3__INST, vec_rsc_0__3__INST.basename(), TLS_vec_rsc_triosy_0_3_lz,
        3, 1019, 8);
    transactor_vec.register_block(&vec_rsc_0__4__INST, vec_rsc_0__4__INST.basename(), TLS_vec_rsc_triosy_0_4_lz,
        4, 1020, 8);
    transactor_vec.register_block(&vec_rsc_0__5__INST, vec_rsc_0__5__INST.basename(), TLS_vec_rsc_triosy_0_5_lz,
        5, 1021, 8);
    transactor_vec.register_block(&vec_rsc_0__6__INST, vec_rsc_0__6__INST.basename(), TLS_vec_rsc_triosy_0_6_lz,
        6, 1022, 8);
    transactor_vec.register_block(&vec_rsc_0__7__INST, vec_rsc_0__7__INST.basename(), TLS_vec_rsc_triosy_0_7_lz,
        7, 1023, 8);

    trios_monitor_p_rsc_triosy_lz_INST.trios(TLS_p_rsc_triosy_lz);
    trios_monitor_p_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_p.in_fifo(TLS_in_fifo_p);
    transactor_p.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_p);
    transactor_p.bind_clk(clk, true, rst);
    transactor_p.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_p.register_block(&p_rsc_INST, p_rsc_INST.basename(), TLS_p_rsc_triosy_lz, 0, 0, 1);

    trios_monitor_r_rsc_triosy_lz_INST.trios(TLS_r_rsc_triosy_lz);
    trios_monitor_r_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_r.in_fifo(TLS_in_fifo_r);
    transactor_r.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_r);
    transactor_r.bind_clk(clk, true, rst);
    transactor_r.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_r.register_block(&r_rsc_INST, r_rsc_INST.basename(), TLS_r_rsc_triosy_lz, 0, 0, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_vec_IN(TLS_in_fifo_vec);
    testbench_INST.ccs_wait_ctrl_vec_IN(TLS_in_wait_ctrl_fifo_vec);
    testbench_INST.ccs_vec(TLS_out_fifo_vec);
    testbench_INST.ccs_wait_ctrl_vec(TLS_out_wait_ctrl_fifo_vec);
    testbench_INST.ccs_p(TLS_in_fifo_p);
    testbench_INST.ccs_wait_ctrl_p(TLS_in_wait_ctrl_fifo_p);
    testbench_INST.ccs_r(TLS_in_fifo_r);
    testbench_INST.ccs_wait_ctrl_r(TLS_in_wait_ctrl_fifo_r);
    testbench_INST.design_is_idle(TLS_design_is_idle_reg);
    testbench_INST.enable_stalls(TLS_enable_stalls);
    testbench_INST.stall_coverage(TLS_stall_coverage);

    sync_generator_INST.clk(clk);
    sync_generator_INST.rst(rst);
    sync_generator_INST.in_sync(in_sync);
    sync_generator_INST.out_sync(out_sync);
    sync_generator_INST.inout_sync(inout_sync);
    sync_generator_INST.wait_for_init(wait_for_init);
    sync_generator_INST.catapult_start(catapult_start);
    sync_generator_INST.catapult_ready(catapult_ready);
    sync_generator_INST.catapult_done(catapult_done);

    catapult_monitor_INST.rst(rst);


    SC_METHOD(TLS_rst_method);
      sensitive_pos << TLS_rst;
      dont_initialize();

    SC_METHOD(max_sim_time_notify);
      sensitive << max_sim_time_event;
      dont_initialize();

    SC_METHOD(generate_reset);
      sensitive << generate_reset_event;
      sensitive << testbench_INST.reset_request_event;

    SC_METHOD(deadlock_watch);
      sensitive << clk;
      dont_initialize();

    SC_METHOD(deadlock_notify);
      sensitive << deadlock_event;
      dont_initialize();


    #if defined(CCS_SCVERIFY) && defined(CCS_DUT_RTL) && !defined(CCS_DUT_SYSC) && !defined(CCS_SYSC) && !defined(CCS_DUT_POWER)
        ccs_probe_monitor_INST = new ccs_probe_monitor("ccs_probe_monitor");
    ccs_probe_monitor_INST->clk(clk);
    ccs_probe_monitor_INST->rst(rst);
    #endif
    SIG_SC_LOGIC_0.write(SC_LOGIC_0);
    SIG_SC_LOGIC_1.write(SC_LOGIC_1);
    mt19937_init_genrand(19650218UL);
    install_observe_foreign_signals();
  }
};
void scverify_top::TLS_rst_method() {
  std::ostringstream msg;
  msg << "TLS_rst active @ " << sc_time_stamp();
  SC_REPORT_INFO("HW reset", msg.str().c_str());
  vec_rsc_0__0__INST.clear();
  vec_rsc_0__1__INST.clear();
  vec_rsc_0__2__INST.clear();
  vec_rsc_0__3__INST.clear();
  vec_rsc_0__4__INST.clear();
  vec_rsc_0__5__INST.clear();
  vec_rsc_0__6__INST.clear();
  vec_rsc_0__7__INST.clear();
  p_rsc_INST.clear();
  r_rsc_INST.clear();
}

void scverify_top::max_sim_time_notify() {
  testbench_INST.set_failed(true);
  testbench_INST.check_results();
  SC_REPORT_ERROR("System", "Specified maximum simulation time reached");
  sc_stop();
}

void scverify_top::start_of_simulation() {
  char *SCVerify_AUTOWAIT = getenv("SCVerify_AUTOWAIT");
  if (SCVerify_AUTOWAIT) {
    int l = atoi(SCVerify_AUTOWAIT);
    transactor_vec.set_auto_wait_limit(l);
    transactor_p.set_auto_wait_limit(l);
    transactor_r.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_vec_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_p_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_r_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_vec_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_p_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_r_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_vec_count = -1;
  static int transactor_p_count = -1;
  static int transactor_r_count = -1;

  // At the breakpoint, modify the local variables
  // above to turn on/off different levels of transaction
  // logging for each variable. Available flags are:
  //   MC_TRANSACTOR_EMPTY       - log empty FIFOs (on by default)
  //   MC_TRANSACTOR_UNDERFLOW   - log FIFOs that run empty and then are loaded again (off)
  //   MC_TRANSACTOR_READ        - log all read events
  //   MC_TRANSACTOR_WRITE       - log all write events
  //   MC_TRANSACTOR_LOAD        - log all FIFO load events
  //   MC_TRANSACTOR_DUMP        - log all FIFO dump events
  //   MC_TRANSACTOR_STREAMCNT   - log all streamed port index counter events
  //   MC_TRANSACTOR_WAIT        - log user specified handshake waits
  //   MC_TRANSACTOR_SIZE        - log input FIFO size updates

  std::ifstream debug_cmds;
  debug_cmds.open("scverify.cmd",std::fstream::in);
  if (debug_cmds.is_open()) {
    std::cout << "Reading SCVerify debug commands from file 'scverify.cmd'" << std::endl;
    std::string line;
    while (getline(debug_cmds,line)) {
      std::size_t pos1 = line.find(" ");
      if (pos1 == std::string::npos) continue;
      std::size_t pos2 = line.find(" ", pos1+1);
      std::string varname = line.substr(0,pos1);
      std::string flags = line.substr(pos1+1,pos2-pos1-1);
      std::string count = line.substr(pos2+1);
      debug(varname.c_str(),std::atoi(flags.c_str()),std::atoi(count.c_str()));
    }
    debug_cmds.close();
  } else {
    debug("transactor_vec",transactor_vec_flags,transactor_vec_count);
    debug("transactor_p",transactor_p_flags,transactor_p_count);
    debug("transactor_r",transactor_r_flags,transactor_r_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_vec") == 0)
    xlator_p = &transactor_vec;
  if (strcmp(varname,"transactor_p") == 0)
    xlator_p = &transactor_p;
  if (strcmp(varname,"transactor_r") == 0)
    xlator_p = &transactor_r;
  if (xlator_p) {
    debug_attr_p = xlator_p->get_attribute("MC_TRANSACTOR_EVENT");
    if (!debug_attr_p) {
      debug_attr_p = new sc_attribute<int>("MC_TRANSACTOR_EVENT",flags);
      xlator_p->add_attribute(*debug_attr_p);
    }
    ((sc_attribute<int>*)debug_attr_p)->value = flags;
  }

  if (count>=0) {
    debug_attr_p = xlator_p->get_attribute("MC_TRANSACTOR_COUNT");
    if (!debug_attr_p) {
      debug_attr_p = new sc_attribute<int>("MC_TRANSACTOR_COUNT",count);
      xlator_p->add_attribute(*debug_attr_p);
    }
    ((sc_attribute<int>*)debug_attr_p)->value = count;
  }
}

// Process: SC_METHOD generate_reset
void scverify_top::generate_reset() {
  static bool activate_reset = true;
  static bool toggle_hw_reset = false;
  if (activate_reset || sc_time_stamp() == SC_ZERO_TIME) {
    setup_debug();
    activate_reset = false;
    rst.write(SC_LOGIC_1);
    rst_driver.reset_driver();
    generate_reset_event.notify(140.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(140.000000 , SC_NS);
    } else {
      transactor_vec.reset_streams();
      transactor_p.reset_streams();
      transactor_r.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
#endif
#endif
}

void scverify_top::deadlock_watch() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
#if defined(MTI_SYSTEMC) || defined(NCSC) || defined(VCS_SYSTEMC)
#endif
#endif
#endif
}

void scverify_top::deadlock_notify() {
  if (deadlocked.read() == SC_LOGIC_1) {
    testbench_INST.check_results();
    SC_REPORT_ERROR("System", "Simulation deadlock detected");
    sc_stop();
  }
}

#if defined(MC_SIMULATOR_OSCI) || defined(MC_SIMULATOR_VCS)
int sc_main(int argc, char *argv[]) {
  sc_report_handler::set_actions("/IEEE_Std_1666/deprecated", SC_DO_NOTHING);
  scverify_top scverify_top("scverify_top");
  sc_start();
  return scverify_top.testbench_INST.failed();
}
#else
MC_MODULE_EXPORT(scverify_top);
#endif
