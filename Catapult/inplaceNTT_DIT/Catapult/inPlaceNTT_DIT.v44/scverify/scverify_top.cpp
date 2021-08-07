#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_2R1W_RBW_DUAL_trans_rsc.h"
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
#define TOP_HDL_ENTITY inPlaceNTT_DIT
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_4;
extern double __scv_hold_time_RSCID_5;
extern double __scv_hold_time_RSCID_6;
extern double __scv_hold_time_RSCID_7;
extern double __scv_hold_time_RSCID_8;
extern double __scv_hold_time_RSCID_9;
extern double __scv_hold_time_RSCID_10;
extern double __scv_hold_time_RSCID_11;
extern double __scv_hold_time_RSCID_12;
extern double __scv_hold_time_RSCID_13;
extern double __scv_hold_time_RSCID_14;
extern double __scv_hold_time_RSCID_15;
extern double __scv_hold_time_RSCID_16;
extern double __scv_hold_time_RSCID_17;
extern double __scv_hold_time_RSCID_18;
extern double __scv_hold_time_RSCID_19;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_4 = 0;
double __scv_hold_time_RSCID_5 = 0;
double __scv_hold_time_RSCID_6 = 0;
double __scv_hold_time_RSCID_7 = 0;
double __scv_hold_time_RSCID_8 = 0;
double __scv_hold_time_RSCID_9 = 0;
double __scv_hold_time_RSCID_10 = 0;
double __scv_hold_time_RSCID_11 = 0;
double __scv_hold_time_RSCID_12 = 0;
double __scv_hold_time_RSCID_13 = 0;
double __scv_hold_time_RSCID_14 = 0;
double __scv_hold_time_RSCID_15 = 0;
double __scv_hold_time_RSCID_16 = 0;
double __scv_hold_time_RSCID_17 = 0;
double __scv_hold_time_RSCID_18 = 0;
double __scv_hold_time_RSCID_19 = 0;
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
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_0_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_0_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_1_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_1_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_2_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_2_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_3_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_3_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_4_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_4_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_5_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_5_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_6_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_6_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_7_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_7_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_8_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_8_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_8_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_8_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_9_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_9_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_9_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_9_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_10_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_10_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_10_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_10_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_11_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_11_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_11_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_11_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_12_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_12_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_12_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_12_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_13_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_13_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_13_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_13_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_14_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_14_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_14_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_14_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0_15_adra;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_15_da;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_15_wea;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_15_qa;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<64> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<64> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  ccs_DUT_wrapper                                                              inPlaceNTT_DIT_INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__0__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__0__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__0__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__1__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__1__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__1__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__2__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__2__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__2__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__3__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__3__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__3__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__4__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__4__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__4__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__5__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__5__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__5__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__6__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__6__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__6__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__7__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__7__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__7__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__8__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__8__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__8__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__9__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__9__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__9__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__10__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__10__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__10__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__11__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__11__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__11__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__12__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__12__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__12__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__13__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__13__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__13__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__14__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__14__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__14__INST;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_0__15__adrb;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0__15__qb;
  BLOCK_2R1W_RBW_DUAL_trans_rsc<8,64,256 >                                     vec_rsc_0__15__INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   r_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,4096> >                TLS_in_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_vec;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,4096> >                TLS_out_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_vec;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_3_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_4_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_5_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_6_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_7_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_8_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_9_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_10_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_11_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_12_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_13_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_14_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_15_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<64, false >,4096>,64,false>  transactor_vec;
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
    , CCS_CLK_CTOR(clk, "clk", 12.2, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 122.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_vec_rsc_0_0_adra("TLS_vec_rsc_0_0_adra")
    , TLS_vec_rsc_0_0_da("TLS_vec_rsc_0_0_da")
    , TLS_vec_rsc_0_0_wea("TLS_vec_rsc_0_0_wea")
    , TLS_vec_rsc_0_0_qa("TLS_vec_rsc_0_0_qa")
    , TLS_vec_rsc_triosy_0_0_lz("TLS_vec_rsc_triosy_0_0_lz")
    , TLS_vec_rsc_0_1_adra("TLS_vec_rsc_0_1_adra")
    , TLS_vec_rsc_0_1_da("TLS_vec_rsc_0_1_da")
    , TLS_vec_rsc_0_1_wea("TLS_vec_rsc_0_1_wea")
    , TLS_vec_rsc_0_1_qa("TLS_vec_rsc_0_1_qa")
    , TLS_vec_rsc_triosy_0_1_lz("TLS_vec_rsc_triosy_0_1_lz")
    , TLS_vec_rsc_0_2_adra("TLS_vec_rsc_0_2_adra")
    , TLS_vec_rsc_0_2_da("TLS_vec_rsc_0_2_da")
    , TLS_vec_rsc_0_2_wea("TLS_vec_rsc_0_2_wea")
    , TLS_vec_rsc_0_2_qa("TLS_vec_rsc_0_2_qa")
    , TLS_vec_rsc_triosy_0_2_lz("TLS_vec_rsc_triosy_0_2_lz")
    , TLS_vec_rsc_0_3_adra("TLS_vec_rsc_0_3_adra")
    , TLS_vec_rsc_0_3_da("TLS_vec_rsc_0_3_da")
    , TLS_vec_rsc_0_3_wea("TLS_vec_rsc_0_3_wea")
    , TLS_vec_rsc_0_3_qa("TLS_vec_rsc_0_3_qa")
    , TLS_vec_rsc_triosy_0_3_lz("TLS_vec_rsc_triosy_0_3_lz")
    , TLS_vec_rsc_0_4_adra("TLS_vec_rsc_0_4_adra")
    , TLS_vec_rsc_0_4_da("TLS_vec_rsc_0_4_da")
    , TLS_vec_rsc_0_4_wea("TLS_vec_rsc_0_4_wea")
    , TLS_vec_rsc_0_4_qa("TLS_vec_rsc_0_4_qa")
    , TLS_vec_rsc_triosy_0_4_lz("TLS_vec_rsc_triosy_0_4_lz")
    , TLS_vec_rsc_0_5_adra("TLS_vec_rsc_0_5_adra")
    , TLS_vec_rsc_0_5_da("TLS_vec_rsc_0_5_da")
    , TLS_vec_rsc_0_5_wea("TLS_vec_rsc_0_5_wea")
    , TLS_vec_rsc_0_5_qa("TLS_vec_rsc_0_5_qa")
    , TLS_vec_rsc_triosy_0_5_lz("TLS_vec_rsc_triosy_0_5_lz")
    , TLS_vec_rsc_0_6_adra("TLS_vec_rsc_0_6_adra")
    , TLS_vec_rsc_0_6_da("TLS_vec_rsc_0_6_da")
    , TLS_vec_rsc_0_6_wea("TLS_vec_rsc_0_6_wea")
    , TLS_vec_rsc_0_6_qa("TLS_vec_rsc_0_6_qa")
    , TLS_vec_rsc_triosy_0_6_lz("TLS_vec_rsc_triosy_0_6_lz")
    , TLS_vec_rsc_0_7_adra("TLS_vec_rsc_0_7_adra")
    , TLS_vec_rsc_0_7_da("TLS_vec_rsc_0_7_da")
    , TLS_vec_rsc_0_7_wea("TLS_vec_rsc_0_7_wea")
    , TLS_vec_rsc_0_7_qa("TLS_vec_rsc_0_7_qa")
    , TLS_vec_rsc_triosy_0_7_lz("TLS_vec_rsc_triosy_0_7_lz")
    , TLS_vec_rsc_0_8_adra("TLS_vec_rsc_0_8_adra")
    , TLS_vec_rsc_0_8_da("TLS_vec_rsc_0_8_da")
    , TLS_vec_rsc_0_8_wea("TLS_vec_rsc_0_8_wea")
    , TLS_vec_rsc_0_8_qa("TLS_vec_rsc_0_8_qa")
    , TLS_vec_rsc_triosy_0_8_lz("TLS_vec_rsc_triosy_0_8_lz")
    , TLS_vec_rsc_0_9_adra("TLS_vec_rsc_0_9_adra")
    , TLS_vec_rsc_0_9_da("TLS_vec_rsc_0_9_da")
    , TLS_vec_rsc_0_9_wea("TLS_vec_rsc_0_9_wea")
    , TLS_vec_rsc_0_9_qa("TLS_vec_rsc_0_9_qa")
    , TLS_vec_rsc_triosy_0_9_lz("TLS_vec_rsc_triosy_0_9_lz")
    , TLS_vec_rsc_0_10_adra("TLS_vec_rsc_0_10_adra")
    , TLS_vec_rsc_0_10_da("TLS_vec_rsc_0_10_da")
    , TLS_vec_rsc_0_10_wea("TLS_vec_rsc_0_10_wea")
    , TLS_vec_rsc_0_10_qa("TLS_vec_rsc_0_10_qa")
    , TLS_vec_rsc_triosy_0_10_lz("TLS_vec_rsc_triosy_0_10_lz")
    , TLS_vec_rsc_0_11_adra("TLS_vec_rsc_0_11_adra")
    , TLS_vec_rsc_0_11_da("TLS_vec_rsc_0_11_da")
    , TLS_vec_rsc_0_11_wea("TLS_vec_rsc_0_11_wea")
    , TLS_vec_rsc_0_11_qa("TLS_vec_rsc_0_11_qa")
    , TLS_vec_rsc_triosy_0_11_lz("TLS_vec_rsc_triosy_0_11_lz")
    , TLS_vec_rsc_0_12_adra("TLS_vec_rsc_0_12_adra")
    , TLS_vec_rsc_0_12_da("TLS_vec_rsc_0_12_da")
    , TLS_vec_rsc_0_12_wea("TLS_vec_rsc_0_12_wea")
    , TLS_vec_rsc_0_12_qa("TLS_vec_rsc_0_12_qa")
    , TLS_vec_rsc_triosy_0_12_lz("TLS_vec_rsc_triosy_0_12_lz")
    , TLS_vec_rsc_0_13_adra("TLS_vec_rsc_0_13_adra")
    , TLS_vec_rsc_0_13_da("TLS_vec_rsc_0_13_da")
    , TLS_vec_rsc_0_13_wea("TLS_vec_rsc_0_13_wea")
    , TLS_vec_rsc_0_13_qa("TLS_vec_rsc_0_13_qa")
    , TLS_vec_rsc_triosy_0_13_lz("TLS_vec_rsc_triosy_0_13_lz")
    , TLS_vec_rsc_0_14_adra("TLS_vec_rsc_0_14_adra")
    , TLS_vec_rsc_0_14_da("TLS_vec_rsc_0_14_da")
    , TLS_vec_rsc_0_14_wea("TLS_vec_rsc_0_14_wea")
    , TLS_vec_rsc_0_14_qa("TLS_vec_rsc_0_14_qa")
    , TLS_vec_rsc_triosy_0_14_lz("TLS_vec_rsc_triosy_0_14_lz")
    , TLS_vec_rsc_0_15_adra("TLS_vec_rsc_0_15_adra")
    , TLS_vec_rsc_0_15_da("TLS_vec_rsc_0_15_da")
    , TLS_vec_rsc_0_15_wea("TLS_vec_rsc_0_15_wea")
    , TLS_vec_rsc_0_15_qa("TLS_vec_rsc_0_15_qa")
    , TLS_vec_rsc_triosy_0_15_lz("TLS_vec_rsc_triosy_0_15_lz")
    , TLS_p_rsc_dat("TLS_p_rsc_dat")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_r_rsc_dat("TLS_r_rsc_dat")
    , TLS_r_rsc_triosy_lz("TLS_r_rsc_triosy_lz")
    , inPlaceNTT_DIT_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , TLS_vec_rsc_0__0__adrb("TLS_vec_rsc_0__0__adrb")
    , TLS_vec_rsc_0__0__qb("TLS_vec_rsc_0__0__qb")
    , vec_rsc_0__0__INST("vec_rsc_0__0_", true)
    , TLS_vec_rsc_0__1__adrb("TLS_vec_rsc_0__1__adrb")
    , TLS_vec_rsc_0__1__qb("TLS_vec_rsc_0__1__qb")
    , vec_rsc_0__1__INST("vec_rsc_0__1_", true)
    , TLS_vec_rsc_0__2__adrb("TLS_vec_rsc_0__2__adrb")
    , TLS_vec_rsc_0__2__qb("TLS_vec_rsc_0__2__qb")
    , vec_rsc_0__2__INST("vec_rsc_0__2_", true)
    , TLS_vec_rsc_0__3__adrb("TLS_vec_rsc_0__3__adrb")
    , TLS_vec_rsc_0__3__qb("TLS_vec_rsc_0__3__qb")
    , vec_rsc_0__3__INST("vec_rsc_0__3_", true)
    , TLS_vec_rsc_0__4__adrb("TLS_vec_rsc_0__4__adrb")
    , TLS_vec_rsc_0__4__qb("TLS_vec_rsc_0__4__qb")
    , vec_rsc_0__4__INST("vec_rsc_0__4_", true)
    , TLS_vec_rsc_0__5__adrb("TLS_vec_rsc_0__5__adrb")
    , TLS_vec_rsc_0__5__qb("TLS_vec_rsc_0__5__qb")
    , vec_rsc_0__5__INST("vec_rsc_0__5_", true)
    , TLS_vec_rsc_0__6__adrb("TLS_vec_rsc_0__6__adrb")
    , TLS_vec_rsc_0__6__qb("TLS_vec_rsc_0__6__qb")
    , vec_rsc_0__6__INST("vec_rsc_0__6_", true)
    , TLS_vec_rsc_0__7__adrb("TLS_vec_rsc_0__7__adrb")
    , TLS_vec_rsc_0__7__qb("TLS_vec_rsc_0__7__qb")
    , vec_rsc_0__7__INST("vec_rsc_0__7_", true)
    , TLS_vec_rsc_0__8__adrb("TLS_vec_rsc_0__8__adrb")
    , TLS_vec_rsc_0__8__qb("TLS_vec_rsc_0__8__qb")
    , vec_rsc_0__8__INST("vec_rsc_0__8_", true)
    , TLS_vec_rsc_0__9__adrb("TLS_vec_rsc_0__9__adrb")
    , TLS_vec_rsc_0__9__qb("TLS_vec_rsc_0__9__qb")
    , vec_rsc_0__9__INST("vec_rsc_0__9_", true)
    , TLS_vec_rsc_0__10__adrb("TLS_vec_rsc_0__10__adrb")
    , TLS_vec_rsc_0__10__qb("TLS_vec_rsc_0__10__qb")
    , vec_rsc_0__10__INST("vec_rsc_0__10_", true)
    , TLS_vec_rsc_0__11__adrb("TLS_vec_rsc_0__11__adrb")
    , TLS_vec_rsc_0__11__qb("TLS_vec_rsc_0__11__qb")
    , vec_rsc_0__11__INST("vec_rsc_0__11_", true)
    , TLS_vec_rsc_0__12__adrb("TLS_vec_rsc_0__12__adrb")
    , TLS_vec_rsc_0__12__qb("TLS_vec_rsc_0__12__qb")
    , vec_rsc_0__12__INST("vec_rsc_0__12_", true)
    , TLS_vec_rsc_0__13__adrb("TLS_vec_rsc_0__13__adrb")
    , TLS_vec_rsc_0__13__qb("TLS_vec_rsc_0__13__qb")
    , vec_rsc_0__13__INST("vec_rsc_0__13_", true)
    , TLS_vec_rsc_0__14__adrb("TLS_vec_rsc_0__14__adrb")
    , TLS_vec_rsc_0__14__qb("TLS_vec_rsc_0__14__qb")
    , vec_rsc_0__14__INST("vec_rsc_0__14_", true)
    , TLS_vec_rsc_0__15__adrb("TLS_vec_rsc_0__15__adrb")
    , TLS_vec_rsc_0__15__qb("TLS_vec_rsc_0__15__qb")
    , vec_rsc_0__15__INST("vec_rsc_0__15_", true)
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
    , trios_monitor_vec_rsc_triosy_0_8_lz_INST("trios_monitor_vec_rsc_triosy_0_8_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_9_lz_INST("trios_monitor_vec_rsc_triosy_0_9_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_10_lz_INST("trios_monitor_vec_rsc_triosy_0_10_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_11_lz_INST("trios_monitor_vec_rsc_triosy_0_11_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_12_lz_INST("trios_monitor_vec_rsc_triosy_0_12_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_13_lz_INST("trios_monitor_vec_rsc_triosy_0_13_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_14_lz_INST("trios_monitor_vec_rsc_triosy_0_14_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_15_lz_INST("trios_monitor_vec_rsc_triosy_0_15_lz_INST")
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
    , sync_generator_INST("sync_generator", true, false, false, false, 490205, 490205, 0)
    , catapult_monitor_INST("Monitor", clk, true, 490205LL, 490205LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    inPlaceNTT_DIT_INST.clk(clk);
    inPlaceNTT_DIT_INST.rst(TLS_rst);
    inPlaceNTT_DIT_INST.vec_rsc_0_0_adra(TLS_vec_rsc_0_0_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_0_da(TLS_vec_rsc_0_0_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_0_wea(TLS_vec_rsc_0_0_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_0_qa(TLS_vec_rsc_0_0_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_0_lz(TLS_vec_rsc_triosy_0_0_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_1_adra(TLS_vec_rsc_0_1_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_1_da(TLS_vec_rsc_0_1_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_1_wea(TLS_vec_rsc_0_1_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_1_qa(TLS_vec_rsc_0_1_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_1_lz(TLS_vec_rsc_triosy_0_1_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_2_adra(TLS_vec_rsc_0_2_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_2_da(TLS_vec_rsc_0_2_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_2_wea(TLS_vec_rsc_0_2_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_2_qa(TLS_vec_rsc_0_2_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_2_lz(TLS_vec_rsc_triosy_0_2_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_3_adra(TLS_vec_rsc_0_3_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_3_da(TLS_vec_rsc_0_3_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_3_wea(TLS_vec_rsc_0_3_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_3_qa(TLS_vec_rsc_0_3_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_3_lz(TLS_vec_rsc_triosy_0_3_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_4_adra(TLS_vec_rsc_0_4_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_4_da(TLS_vec_rsc_0_4_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_4_wea(TLS_vec_rsc_0_4_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_4_qa(TLS_vec_rsc_0_4_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_4_lz(TLS_vec_rsc_triosy_0_4_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_5_adra(TLS_vec_rsc_0_5_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_5_da(TLS_vec_rsc_0_5_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_5_wea(TLS_vec_rsc_0_5_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_5_qa(TLS_vec_rsc_0_5_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_5_lz(TLS_vec_rsc_triosy_0_5_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_6_adra(TLS_vec_rsc_0_6_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_6_da(TLS_vec_rsc_0_6_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_6_wea(TLS_vec_rsc_0_6_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_6_qa(TLS_vec_rsc_0_6_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_6_lz(TLS_vec_rsc_triosy_0_6_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_7_adra(TLS_vec_rsc_0_7_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_7_da(TLS_vec_rsc_0_7_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_7_wea(TLS_vec_rsc_0_7_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_7_qa(TLS_vec_rsc_0_7_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_7_lz(TLS_vec_rsc_triosy_0_7_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_8_adra(TLS_vec_rsc_0_8_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_8_da(TLS_vec_rsc_0_8_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_8_wea(TLS_vec_rsc_0_8_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_8_qa(TLS_vec_rsc_0_8_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_8_lz(TLS_vec_rsc_triosy_0_8_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_9_adra(TLS_vec_rsc_0_9_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_9_da(TLS_vec_rsc_0_9_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_9_wea(TLS_vec_rsc_0_9_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_9_qa(TLS_vec_rsc_0_9_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_9_lz(TLS_vec_rsc_triosy_0_9_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_10_adra(TLS_vec_rsc_0_10_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_10_da(TLS_vec_rsc_0_10_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_10_wea(TLS_vec_rsc_0_10_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_10_qa(TLS_vec_rsc_0_10_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_10_lz(TLS_vec_rsc_triosy_0_10_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_11_adra(TLS_vec_rsc_0_11_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_11_da(TLS_vec_rsc_0_11_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_11_wea(TLS_vec_rsc_0_11_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_11_qa(TLS_vec_rsc_0_11_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_11_lz(TLS_vec_rsc_triosy_0_11_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_12_adra(TLS_vec_rsc_0_12_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_12_da(TLS_vec_rsc_0_12_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_12_wea(TLS_vec_rsc_0_12_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_12_qa(TLS_vec_rsc_0_12_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_12_lz(TLS_vec_rsc_triosy_0_12_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_13_adra(TLS_vec_rsc_0_13_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_13_da(TLS_vec_rsc_0_13_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_13_wea(TLS_vec_rsc_0_13_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_13_qa(TLS_vec_rsc_0_13_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_13_lz(TLS_vec_rsc_triosy_0_13_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_14_adra(TLS_vec_rsc_0_14_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_14_da(TLS_vec_rsc_0_14_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_14_wea(TLS_vec_rsc_0_14_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_14_qa(TLS_vec_rsc_0_14_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_14_lz(TLS_vec_rsc_triosy_0_14_lz);
    inPlaceNTT_DIT_INST.vec_rsc_0_15_adra(TLS_vec_rsc_0_15_adra);
    inPlaceNTT_DIT_INST.vec_rsc_0_15_da(TLS_vec_rsc_0_15_da);
    inPlaceNTT_DIT_INST.vec_rsc_0_15_wea(TLS_vec_rsc_0_15_wea);
    inPlaceNTT_DIT_INST.vec_rsc_0_15_qa(TLS_vec_rsc_0_15_qa);
    inPlaceNTT_DIT_INST.vec_rsc_triosy_0_15_lz(TLS_vec_rsc_triosy_0_15_lz);
    inPlaceNTT_DIT_INST.p_rsc_dat(TLS_p_rsc_dat);
    inPlaceNTT_DIT_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    inPlaceNTT_DIT_INST.r_rsc_dat(TLS_r_rsc_dat);
    inPlaceNTT_DIT_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);

    vec_rsc_0__0__INST.qa(TLS_vec_rsc_0_0_qa);
    vec_rsc_0__0__INST.wea(TLS_vec_rsc_0_0_wea);
    vec_rsc_0__0__INST.da(TLS_vec_rsc_0_0_da);
    vec_rsc_0__0__INST.adra(TLS_vec_rsc_0_0_adra);
    vec_rsc_0__0__INST.clk(clk);
    vec_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__0__INST.adrb(TLS_vec_rsc_0__0__adrb);
    vec_rsc_0__0__INST.qb(TLS_vec_rsc_0__0__qb);
    vec_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_4)));

    vec_rsc_0__1__INST.qa(TLS_vec_rsc_0_1_qa);
    vec_rsc_0__1__INST.wea(TLS_vec_rsc_0_1_wea);
    vec_rsc_0__1__INST.da(TLS_vec_rsc_0_1_da);
    vec_rsc_0__1__INST.adra(TLS_vec_rsc_0_1_adra);
    vec_rsc_0__1__INST.clk(clk);
    vec_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__1__INST.adrb(TLS_vec_rsc_0__1__adrb);
    vec_rsc_0__1__INST.qb(TLS_vec_rsc_0__1__qb);
    vec_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_5)));

    vec_rsc_0__2__INST.qa(TLS_vec_rsc_0_2_qa);
    vec_rsc_0__2__INST.wea(TLS_vec_rsc_0_2_wea);
    vec_rsc_0__2__INST.da(TLS_vec_rsc_0_2_da);
    vec_rsc_0__2__INST.adra(TLS_vec_rsc_0_2_adra);
    vec_rsc_0__2__INST.clk(clk);
    vec_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__2__INST.adrb(TLS_vec_rsc_0__2__adrb);
    vec_rsc_0__2__INST.qb(TLS_vec_rsc_0__2__qb);
    vec_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_6)));

    vec_rsc_0__3__INST.qa(TLS_vec_rsc_0_3_qa);
    vec_rsc_0__3__INST.wea(TLS_vec_rsc_0_3_wea);
    vec_rsc_0__3__INST.da(TLS_vec_rsc_0_3_da);
    vec_rsc_0__3__INST.adra(TLS_vec_rsc_0_3_adra);
    vec_rsc_0__3__INST.clk(clk);
    vec_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__3__INST.adrb(TLS_vec_rsc_0__3__adrb);
    vec_rsc_0__3__INST.qb(TLS_vec_rsc_0__3__qb);
    vec_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_7)));

    vec_rsc_0__4__INST.qa(TLS_vec_rsc_0_4_qa);
    vec_rsc_0__4__INST.wea(TLS_vec_rsc_0_4_wea);
    vec_rsc_0__4__INST.da(TLS_vec_rsc_0_4_da);
    vec_rsc_0__4__INST.adra(TLS_vec_rsc_0_4_adra);
    vec_rsc_0__4__INST.clk(clk);
    vec_rsc_0__4__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__4__INST.adrb(TLS_vec_rsc_0__4__adrb);
    vec_rsc_0__4__INST.qb(TLS_vec_rsc_0__4__qb);
    vec_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_8)));

    vec_rsc_0__5__INST.qa(TLS_vec_rsc_0_5_qa);
    vec_rsc_0__5__INST.wea(TLS_vec_rsc_0_5_wea);
    vec_rsc_0__5__INST.da(TLS_vec_rsc_0_5_da);
    vec_rsc_0__5__INST.adra(TLS_vec_rsc_0_5_adra);
    vec_rsc_0__5__INST.clk(clk);
    vec_rsc_0__5__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__5__INST.adrb(TLS_vec_rsc_0__5__adrb);
    vec_rsc_0__5__INST.qb(TLS_vec_rsc_0__5__qb);
    vec_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_9)));

    vec_rsc_0__6__INST.qa(TLS_vec_rsc_0_6_qa);
    vec_rsc_0__6__INST.wea(TLS_vec_rsc_0_6_wea);
    vec_rsc_0__6__INST.da(TLS_vec_rsc_0_6_da);
    vec_rsc_0__6__INST.adra(TLS_vec_rsc_0_6_adra);
    vec_rsc_0__6__INST.clk(clk);
    vec_rsc_0__6__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__6__INST.adrb(TLS_vec_rsc_0__6__adrb);
    vec_rsc_0__6__INST.qb(TLS_vec_rsc_0__6__qb);
    vec_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_10)));

    vec_rsc_0__7__INST.qa(TLS_vec_rsc_0_7_qa);
    vec_rsc_0__7__INST.wea(TLS_vec_rsc_0_7_wea);
    vec_rsc_0__7__INST.da(TLS_vec_rsc_0_7_da);
    vec_rsc_0__7__INST.adra(TLS_vec_rsc_0_7_adra);
    vec_rsc_0__7__INST.clk(clk);
    vec_rsc_0__7__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__7__INST.adrb(TLS_vec_rsc_0__7__adrb);
    vec_rsc_0__7__INST.qb(TLS_vec_rsc_0__7__qb);
    vec_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_11)));

    vec_rsc_0__8__INST.qa(TLS_vec_rsc_0_8_qa);
    vec_rsc_0__8__INST.wea(TLS_vec_rsc_0_8_wea);
    vec_rsc_0__8__INST.da(TLS_vec_rsc_0_8_da);
    vec_rsc_0__8__INST.adra(TLS_vec_rsc_0_8_adra);
    vec_rsc_0__8__INST.clk(clk);
    vec_rsc_0__8__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__8__INST.adrb(TLS_vec_rsc_0__8__adrb);
    vec_rsc_0__8__INST.qb(TLS_vec_rsc_0__8__qb);
    vec_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_12)));

    vec_rsc_0__9__INST.qa(TLS_vec_rsc_0_9_qa);
    vec_rsc_0__9__INST.wea(TLS_vec_rsc_0_9_wea);
    vec_rsc_0__9__INST.da(TLS_vec_rsc_0_9_da);
    vec_rsc_0__9__INST.adra(TLS_vec_rsc_0_9_adra);
    vec_rsc_0__9__INST.clk(clk);
    vec_rsc_0__9__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__9__INST.adrb(TLS_vec_rsc_0__9__adrb);
    vec_rsc_0__9__INST.qb(TLS_vec_rsc_0__9__qb);
    vec_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_13)));

    vec_rsc_0__10__INST.qa(TLS_vec_rsc_0_10_qa);
    vec_rsc_0__10__INST.wea(TLS_vec_rsc_0_10_wea);
    vec_rsc_0__10__INST.da(TLS_vec_rsc_0_10_da);
    vec_rsc_0__10__INST.adra(TLS_vec_rsc_0_10_adra);
    vec_rsc_0__10__INST.clk(clk);
    vec_rsc_0__10__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__10__INST.adrb(TLS_vec_rsc_0__10__adrb);
    vec_rsc_0__10__INST.qb(TLS_vec_rsc_0__10__qb);
    vec_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_14)));

    vec_rsc_0__11__INST.qa(TLS_vec_rsc_0_11_qa);
    vec_rsc_0__11__INST.wea(TLS_vec_rsc_0_11_wea);
    vec_rsc_0__11__INST.da(TLS_vec_rsc_0_11_da);
    vec_rsc_0__11__INST.adra(TLS_vec_rsc_0_11_adra);
    vec_rsc_0__11__INST.clk(clk);
    vec_rsc_0__11__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__11__INST.adrb(TLS_vec_rsc_0__11__adrb);
    vec_rsc_0__11__INST.qb(TLS_vec_rsc_0__11__qb);
    vec_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_15)));

    vec_rsc_0__12__INST.qa(TLS_vec_rsc_0_12_qa);
    vec_rsc_0__12__INST.wea(TLS_vec_rsc_0_12_wea);
    vec_rsc_0__12__INST.da(TLS_vec_rsc_0_12_da);
    vec_rsc_0__12__INST.adra(TLS_vec_rsc_0_12_adra);
    vec_rsc_0__12__INST.clk(clk);
    vec_rsc_0__12__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__12__INST.adrb(TLS_vec_rsc_0__12__adrb);
    vec_rsc_0__12__INST.qb(TLS_vec_rsc_0__12__qb);
    vec_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_16)));

    vec_rsc_0__13__INST.qa(TLS_vec_rsc_0_13_qa);
    vec_rsc_0__13__INST.wea(TLS_vec_rsc_0_13_wea);
    vec_rsc_0__13__INST.da(TLS_vec_rsc_0_13_da);
    vec_rsc_0__13__INST.adra(TLS_vec_rsc_0_13_adra);
    vec_rsc_0__13__INST.clk(clk);
    vec_rsc_0__13__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__13__INST.adrb(TLS_vec_rsc_0__13__adrb);
    vec_rsc_0__13__INST.qb(TLS_vec_rsc_0__13__qb);
    vec_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_17)));

    vec_rsc_0__14__INST.qa(TLS_vec_rsc_0_14_qa);
    vec_rsc_0__14__INST.wea(TLS_vec_rsc_0_14_wea);
    vec_rsc_0__14__INST.da(TLS_vec_rsc_0_14_da);
    vec_rsc_0__14__INST.adra(TLS_vec_rsc_0_14_adra);
    vec_rsc_0__14__INST.clk(clk);
    vec_rsc_0__14__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__14__INST.adrb(TLS_vec_rsc_0__14__adrb);
    vec_rsc_0__14__INST.qb(TLS_vec_rsc_0__14__qb);
    vec_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_18)));

    vec_rsc_0__15__INST.qa(TLS_vec_rsc_0_15_qa);
    vec_rsc_0__15__INST.wea(TLS_vec_rsc_0_15_wea);
    vec_rsc_0__15__INST.da(TLS_vec_rsc_0_15_da);
    vec_rsc_0__15__INST.adra(TLS_vec_rsc_0_15_adra);
    vec_rsc_0__15__INST.clk(clk);
    vec_rsc_0__15__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__15__INST.adrb(TLS_vec_rsc_0__15__adrb);
    vec_rsc_0__15__INST.qb(TLS_vec_rsc_0__15__qb);
    vec_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_19)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

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

    trios_monitor_vec_rsc_triosy_0_8_lz_INST.trios(TLS_vec_rsc_triosy_0_8_lz);
    trios_monitor_vec_rsc_triosy_0_8_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_9_lz_INST.trios(TLS_vec_rsc_triosy_0_9_lz);
    trios_monitor_vec_rsc_triosy_0_9_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_10_lz_INST.trios(TLS_vec_rsc_triosy_0_10_lz);
    trios_monitor_vec_rsc_triosy_0_10_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_11_lz_INST.trios(TLS_vec_rsc_triosy_0_11_lz);
    trios_monitor_vec_rsc_triosy_0_11_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_12_lz_INST.trios(TLS_vec_rsc_triosy_0_12_lz);
    trios_monitor_vec_rsc_triosy_0_12_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_13_lz_INST.trios(TLS_vec_rsc_triosy_0_13_lz);
    trios_monitor_vec_rsc_triosy_0_13_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_14_lz_INST.trios(TLS_vec_rsc_triosy_0_14_lz);
    trios_monitor_vec_rsc_triosy_0_14_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_15_lz_INST.trios(TLS_vec_rsc_triosy_0_15_lz);
    trios_monitor_vec_rsc_triosy_0_15_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_vec.in_fifo(TLS_in_fifo_vec);
    transactor_vec.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_vec);
    transactor_vec.out_fifo(TLS_out_fifo_vec);
    transactor_vec.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_vec);
    transactor_vec.bind_clk(clk, true, rst);
    transactor_vec.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_vec.register_block(&vec_rsc_0__0__INST, vec_rsc_0__0__INST.basename(), TLS_vec_rsc_triosy_0_0_lz,
        0, 4080, 16);
    transactor_vec.register_block(&vec_rsc_0__1__INST, vec_rsc_0__1__INST.basename(), TLS_vec_rsc_triosy_0_1_lz,
        1, 4081, 16);
    transactor_vec.register_block(&vec_rsc_0__2__INST, vec_rsc_0__2__INST.basename(), TLS_vec_rsc_triosy_0_2_lz,
        2, 4082, 16);
    transactor_vec.register_block(&vec_rsc_0__3__INST, vec_rsc_0__3__INST.basename(), TLS_vec_rsc_triosy_0_3_lz,
        3, 4083, 16);
    transactor_vec.register_block(&vec_rsc_0__4__INST, vec_rsc_0__4__INST.basename(), TLS_vec_rsc_triosy_0_4_lz,
        4, 4084, 16);
    transactor_vec.register_block(&vec_rsc_0__5__INST, vec_rsc_0__5__INST.basename(), TLS_vec_rsc_triosy_0_5_lz,
        5, 4085, 16);
    transactor_vec.register_block(&vec_rsc_0__6__INST, vec_rsc_0__6__INST.basename(), TLS_vec_rsc_triosy_0_6_lz,
        6, 4086, 16);
    transactor_vec.register_block(&vec_rsc_0__7__INST, vec_rsc_0__7__INST.basename(), TLS_vec_rsc_triosy_0_7_lz,
        7, 4087, 16);
    transactor_vec.register_block(&vec_rsc_0__8__INST, vec_rsc_0__8__INST.basename(), TLS_vec_rsc_triosy_0_8_lz,
        8, 4088, 16);
    transactor_vec.register_block(&vec_rsc_0__9__INST, vec_rsc_0__9__INST.basename(), TLS_vec_rsc_triosy_0_9_lz,
        9, 4089, 16);
    transactor_vec.register_block(&vec_rsc_0__10__INST, vec_rsc_0__10__INST.basename(), TLS_vec_rsc_triosy_0_10_lz,
        10, 4090, 16);
    transactor_vec.register_block(&vec_rsc_0__11__INST, vec_rsc_0__11__INST.basename(), TLS_vec_rsc_triosy_0_11_lz,
        11, 4091, 16);
    transactor_vec.register_block(&vec_rsc_0__12__INST, vec_rsc_0__12__INST.basename(), TLS_vec_rsc_triosy_0_12_lz,
        12, 4092, 16);
    transactor_vec.register_block(&vec_rsc_0__13__INST, vec_rsc_0__13__INST.basename(), TLS_vec_rsc_triosy_0_13_lz,
        13, 4093, 16);
    transactor_vec.register_block(&vec_rsc_0__14__INST, vec_rsc_0__14__INST.basename(), TLS_vec_rsc_triosy_0_14_lz,
        14, 4094, 16);
    transactor_vec.register_block(&vec_rsc_0__15__INST, vec_rsc_0__15__INST.basename(), TLS_vec_rsc_triosy_0_15_lz,
        15, 4095, 16);

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
  vec_rsc_0__8__INST.clear();
  vec_rsc_0__9__INST.clear();
  vec_rsc_0__10__INST.clear();
  vec_rsc_0__11__INST.clear();
  vec_rsc_0__12__INST.clear();
  vec_rsc_0__13__INST.clear();
  vec_rsc_0__14__INST.clear();
  vec_rsc_0__15__INST.clear();
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
    generate_reset_event.notify(122.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(122.000000 , SC_NS);
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
