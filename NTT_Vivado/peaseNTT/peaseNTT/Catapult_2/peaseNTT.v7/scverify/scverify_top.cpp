#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW_trans_rsc.h"
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_DPRAM_RBW_DUAL_trans_rsc.h"
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
#define TOP_HDL_ENTITY peaseNTT
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_11;
extern double __scv_hold_time_RSCID_12;
extern double __scv_hold_time_RSCID_13;
extern double __scv_hold_time_RSCID_14;
extern double __scv_hold_time_RSCID_15;
extern double __scv_hold_time_RSCID_16;
extern double __scv_hold_time_RSCID_17;
extern double __scv_hold_time_RSCID_18;
extern double __scv_hold_time_RSCID_19;
extern double __scv_hold_time_RSCID_20;
extern double __scv_hold_time_RSCID_21;
extern double __scv_hold_time_RSCID_22;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_11 = 0;
double __scv_hold_time_RSCID_12 = 0;
double __scv_hold_time_RSCID_13 = 0;
double __scv_hold_time_RSCID_14 = 0;
double __scv_hold_time_RSCID_15 = 0;
double __scv_hold_time_RSCID_16 = 0;
double __scv_hold_time_RSCID_17 = 0;
double __scv_hold_time_RSCID_18 = 0;
double __scv_hold_time_RSCID_19 = 0;
double __scv_hold_time_RSCID_20 = 0;
double __scv_hold_time_RSCID_21 = 0;
double __scv_hold_time_RSCID_22 = 0;
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
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_0_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_0_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_0_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_0_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_1_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_1_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_1_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_1_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_2_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_2_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_2_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_2_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_3_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_3_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_3_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_3_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<32> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<32> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_0_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_1_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_2_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_3_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_0_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_1_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_2_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_3_radr;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_3_lz;
  ccs_DUT_wrapper                                                              peaseNTT_INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__0__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__1__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__2__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__3__INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   r_rsc_INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0__0__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0__0__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__0__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_rsc_0__0__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0__1__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0__1__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__1__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_rsc_0__1__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0__2__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0__2__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__2__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_rsc_0__2__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0__3__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0__3__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__3__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_rsc_0__3__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0__0__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0__0__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_h_rsc_0__0__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_h_rsc_0__0__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0__1__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0__1__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_h_rsc_0__1__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_h_rsc_0__1__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0__2__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0__2__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_h_rsc_0__2__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_h_rsc_0__2__INST;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0__3__d;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0__3__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_h_rsc_0__3__we;
  BLOCK_1R1W_RBW_trans_rsc<8,32,256 >                                          twiddle_h_rsc_0__3__INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_xt;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_out_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_xt;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_3_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_xt;
  tlm::tlm_fifo<ac_int<32, false > >                                           TLS_in_fifo_p;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_p;
  mc_trios_input_monitor                                                       trios_monitor_p_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                             transactor_p;
  tlm::tlm_fifo<ac_int<32, false > >                                           TLS_in_fifo_r;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_r;
  mc_trios_input_monitor                                                       trios_monitor_r_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                             transactor_r;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_twiddle;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_0_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_1_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_2_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_3_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_twiddle;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_twiddle_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle_h;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_twiddle_h;
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
    , CCS_CLK_CTOR(clk, "clk", 5.1, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 112.199997, false)
    , TLS_rst("TLS_rst")
    , TLS_xt_rsc_0_0_adra("TLS_xt_rsc_0_0_adra")
    , TLS_xt_rsc_0_0_da("TLS_xt_rsc_0_0_da")
    , TLS_xt_rsc_0_0_wea("TLS_xt_rsc_0_0_wea")
    , TLS_xt_rsc_0_0_qa("TLS_xt_rsc_0_0_qa")
    , TLS_xt_rsc_0_0_adrb("TLS_xt_rsc_0_0_adrb")
    , TLS_xt_rsc_0_0_db("TLS_xt_rsc_0_0_db")
    , TLS_xt_rsc_0_0_web("TLS_xt_rsc_0_0_web")
    , TLS_xt_rsc_0_0_qb("TLS_xt_rsc_0_0_qb")
    , TLS_xt_rsc_triosy_0_0_lz("TLS_xt_rsc_triosy_0_0_lz")
    , TLS_xt_rsc_0_1_adra("TLS_xt_rsc_0_1_adra")
    , TLS_xt_rsc_0_1_da("TLS_xt_rsc_0_1_da")
    , TLS_xt_rsc_0_1_wea("TLS_xt_rsc_0_1_wea")
    , TLS_xt_rsc_0_1_qa("TLS_xt_rsc_0_1_qa")
    , TLS_xt_rsc_0_1_adrb("TLS_xt_rsc_0_1_adrb")
    , TLS_xt_rsc_0_1_db("TLS_xt_rsc_0_1_db")
    , TLS_xt_rsc_0_1_web("TLS_xt_rsc_0_1_web")
    , TLS_xt_rsc_0_1_qb("TLS_xt_rsc_0_1_qb")
    , TLS_xt_rsc_triosy_0_1_lz("TLS_xt_rsc_triosy_0_1_lz")
    , TLS_xt_rsc_0_2_adra("TLS_xt_rsc_0_2_adra")
    , TLS_xt_rsc_0_2_da("TLS_xt_rsc_0_2_da")
    , TLS_xt_rsc_0_2_wea("TLS_xt_rsc_0_2_wea")
    , TLS_xt_rsc_0_2_qa("TLS_xt_rsc_0_2_qa")
    , TLS_xt_rsc_0_2_adrb("TLS_xt_rsc_0_2_adrb")
    , TLS_xt_rsc_0_2_db("TLS_xt_rsc_0_2_db")
    , TLS_xt_rsc_0_2_web("TLS_xt_rsc_0_2_web")
    , TLS_xt_rsc_0_2_qb("TLS_xt_rsc_0_2_qb")
    , TLS_xt_rsc_triosy_0_2_lz("TLS_xt_rsc_triosy_0_2_lz")
    , TLS_xt_rsc_0_3_adra("TLS_xt_rsc_0_3_adra")
    , TLS_xt_rsc_0_3_da("TLS_xt_rsc_0_3_da")
    , TLS_xt_rsc_0_3_wea("TLS_xt_rsc_0_3_wea")
    , TLS_xt_rsc_0_3_qa("TLS_xt_rsc_0_3_qa")
    , TLS_xt_rsc_0_3_adrb("TLS_xt_rsc_0_3_adrb")
    , TLS_xt_rsc_0_3_db("TLS_xt_rsc_0_3_db")
    , TLS_xt_rsc_0_3_web("TLS_xt_rsc_0_3_web")
    , TLS_xt_rsc_0_3_qb("TLS_xt_rsc_0_3_qb")
    , TLS_xt_rsc_triosy_0_3_lz("TLS_xt_rsc_triosy_0_3_lz")
    , TLS_p_rsc_dat("TLS_p_rsc_dat")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_r_rsc_dat("TLS_r_rsc_dat")
    , TLS_r_rsc_triosy_lz("TLS_r_rsc_triosy_lz")
    , TLS_twiddle_rsc_0_0_radr("TLS_twiddle_rsc_0_0_radr")
    , TLS_twiddle_rsc_0_0_q("TLS_twiddle_rsc_0_0_q")
    , TLS_twiddle_rsc_triosy_0_0_lz("TLS_twiddle_rsc_triosy_0_0_lz")
    , TLS_twiddle_rsc_0_1_radr("TLS_twiddle_rsc_0_1_radr")
    , TLS_twiddle_rsc_0_1_q("TLS_twiddle_rsc_0_1_q")
    , TLS_twiddle_rsc_triosy_0_1_lz("TLS_twiddle_rsc_triosy_0_1_lz")
    , TLS_twiddle_rsc_0_2_radr("TLS_twiddle_rsc_0_2_radr")
    , TLS_twiddle_rsc_0_2_q("TLS_twiddle_rsc_0_2_q")
    , TLS_twiddle_rsc_triosy_0_2_lz("TLS_twiddle_rsc_triosy_0_2_lz")
    , TLS_twiddle_rsc_0_3_radr("TLS_twiddle_rsc_0_3_radr")
    , TLS_twiddle_rsc_0_3_q("TLS_twiddle_rsc_0_3_q")
    , TLS_twiddle_rsc_triosy_0_3_lz("TLS_twiddle_rsc_triosy_0_3_lz")
    , TLS_twiddle_h_rsc_0_0_radr("TLS_twiddle_h_rsc_0_0_radr")
    , TLS_twiddle_h_rsc_0_0_q("TLS_twiddle_h_rsc_0_0_q")
    , TLS_twiddle_h_rsc_triosy_0_0_lz("TLS_twiddle_h_rsc_triosy_0_0_lz")
    , TLS_twiddle_h_rsc_0_1_radr("TLS_twiddle_h_rsc_0_1_radr")
    , TLS_twiddle_h_rsc_0_1_q("TLS_twiddle_h_rsc_0_1_q")
    , TLS_twiddle_h_rsc_triosy_0_1_lz("TLS_twiddle_h_rsc_triosy_0_1_lz")
    , TLS_twiddle_h_rsc_0_2_radr("TLS_twiddle_h_rsc_0_2_radr")
    , TLS_twiddle_h_rsc_0_2_q("TLS_twiddle_h_rsc_0_2_q")
    , TLS_twiddle_h_rsc_triosy_0_2_lz("TLS_twiddle_h_rsc_triosy_0_2_lz")
    , TLS_twiddle_h_rsc_0_3_radr("TLS_twiddle_h_rsc_0_3_radr")
    , TLS_twiddle_h_rsc_0_3_q("TLS_twiddle_h_rsc_0_3_q")
    , TLS_twiddle_h_rsc_triosy_0_3_lz("TLS_twiddle_h_rsc_triosy_0_3_lz")
    , peaseNTT_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , xt_rsc_0__0__INST("xt_rsc_0__0_", true)
    , xt_rsc_0__1__INST("xt_rsc_0__1_", true)
    , xt_rsc_0__2__INST("xt_rsc_0__2_", true)
    , xt_rsc_0__3__INST("xt_rsc_0__3_", true)
    , p_rsc_INST("p_rsc", true)
    , r_rsc_INST("r_rsc", true)
    , TLS_twiddle_rsc_0__0__d("TLS_twiddle_rsc_0__0__d")
    , TLS_twiddle_rsc_0__0__wadr("TLS_twiddle_rsc_0__0__wadr")
    , TLS_twiddle_rsc_0__0__we("TLS_twiddle_rsc_0__0__we")
    , twiddle_rsc_0__0__INST("twiddle_rsc_0__0_", true)
    , TLS_twiddle_rsc_0__1__d("TLS_twiddle_rsc_0__1__d")
    , TLS_twiddle_rsc_0__1__wadr("TLS_twiddle_rsc_0__1__wadr")
    , TLS_twiddle_rsc_0__1__we("TLS_twiddle_rsc_0__1__we")
    , twiddle_rsc_0__1__INST("twiddle_rsc_0__1_", true)
    , TLS_twiddle_rsc_0__2__d("TLS_twiddle_rsc_0__2__d")
    , TLS_twiddle_rsc_0__2__wadr("TLS_twiddle_rsc_0__2__wadr")
    , TLS_twiddle_rsc_0__2__we("TLS_twiddle_rsc_0__2__we")
    , twiddle_rsc_0__2__INST("twiddle_rsc_0__2_", true)
    , TLS_twiddle_rsc_0__3__d("TLS_twiddle_rsc_0__3__d")
    , TLS_twiddle_rsc_0__3__wadr("TLS_twiddle_rsc_0__3__wadr")
    , TLS_twiddle_rsc_0__3__we("TLS_twiddle_rsc_0__3__we")
    , twiddle_rsc_0__3__INST("twiddle_rsc_0__3_", true)
    , TLS_twiddle_h_rsc_0__0__d("TLS_twiddle_h_rsc_0__0__d")
    , TLS_twiddle_h_rsc_0__0__wadr("TLS_twiddle_h_rsc_0__0__wadr")
    , TLS_twiddle_h_rsc_0__0__we("TLS_twiddle_h_rsc_0__0__we")
    , twiddle_h_rsc_0__0__INST("twiddle_h_rsc_0__0_", true)
    , TLS_twiddle_h_rsc_0__1__d("TLS_twiddle_h_rsc_0__1__d")
    , TLS_twiddle_h_rsc_0__1__wadr("TLS_twiddle_h_rsc_0__1__wadr")
    , TLS_twiddle_h_rsc_0__1__we("TLS_twiddle_h_rsc_0__1__we")
    , twiddle_h_rsc_0__1__INST("twiddle_h_rsc_0__1_", true)
    , TLS_twiddle_h_rsc_0__2__d("TLS_twiddle_h_rsc_0__2__d")
    , TLS_twiddle_h_rsc_0__2__wadr("TLS_twiddle_h_rsc_0__2__wadr")
    , TLS_twiddle_h_rsc_0__2__we("TLS_twiddle_h_rsc_0__2__we")
    , twiddle_h_rsc_0__2__INST("twiddle_h_rsc_0__2_", true)
    , TLS_twiddle_h_rsc_0__3__d("TLS_twiddle_h_rsc_0__3__d")
    , TLS_twiddle_h_rsc_0__3__wadr("TLS_twiddle_h_rsc_0__3__wadr")
    , TLS_twiddle_h_rsc_0__3__we("TLS_twiddle_h_rsc_0__3__we")
    , twiddle_h_rsc_0__3__INST("twiddle_h_rsc_0__3_", true)
    , TLS_in_fifo_xt("TLS_in_fifo_xt", -1)
    , TLS_in_wait_ctrl_fifo_xt("TLS_in_wait_ctrl_fifo_xt", -1)
    , TLS_out_fifo_xt("TLS_out_fifo_xt", -1)
    , TLS_out_wait_ctrl_fifo_xt("TLS_out_wait_ctrl_fifo_xt", -1)
    , trios_monitor_xt_rsc_triosy_0_0_lz_INST("trios_monitor_xt_rsc_triosy_0_0_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_1_lz_INST("trios_monitor_xt_rsc_triosy_0_1_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_2_lz_INST("trios_monitor_xt_rsc_triosy_0_2_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_3_lz_INST("trios_monitor_xt_rsc_triosy_0_3_lz_INST")
    , transactor_xt("transactor_xt", 0, 32, 0)
    , TLS_in_fifo_p("TLS_in_fifo_p", -1)
    , TLS_in_wait_ctrl_fifo_p("TLS_in_wait_ctrl_fifo_p", -1)
    , trios_monitor_p_rsc_triosy_lz_INST("trios_monitor_p_rsc_triosy_lz_INST")
    , transactor_p("transactor_p", 0, 32, 0)
    , TLS_in_fifo_r("TLS_in_fifo_r", -1)
    , TLS_in_wait_ctrl_fifo_r("TLS_in_wait_ctrl_fifo_r", -1)
    , trios_monitor_r_rsc_triosy_lz_INST("trios_monitor_r_rsc_triosy_lz_INST")
    , transactor_r("transactor_r", 0, 32, 0)
    , TLS_in_fifo_twiddle("TLS_in_fifo_twiddle", -1)
    , TLS_in_wait_ctrl_fifo_twiddle("TLS_in_wait_ctrl_fifo_twiddle", -1)
    , trios_monitor_twiddle_rsc_triosy_0_0_lz_INST("trios_monitor_twiddle_rsc_triosy_0_0_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_1_lz_INST("trios_monitor_twiddle_rsc_triosy_0_1_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_2_lz_INST("trios_monitor_twiddle_rsc_triosy_0_2_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_3_lz_INST("trios_monitor_twiddle_rsc_triosy_0_3_lz_INST")
    , transactor_twiddle("transactor_twiddle", 0, 32, 0)
    , TLS_in_fifo_twiddle_h("TLS_in_fifo_twiddle_h", -1)
    , TLS_in_wait_ctrl_fifo_twiddle_h("TLS_in_wait_ctrl_fifo_twiddle_h", -1)
    , trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST")
    , transactor_twiddle_h("transactor_twiddle_h", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 1380, 1380, 0)
    , catapult_monitor_INST("Monitor", clk, true, 1380LL, 1380LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    peaseNTT_INST.clk(clk);
    peaseNTT_INST.rst(TLS_rst);
    peaseNTT_INST.xt_rsc_0_0_adra(TLS_xt_rsc_0_0_adra);
    peaseNTT_INST.xt_rsc_0_0_da(TLS_xt_rsc_0_0_da);
    peaseNTT_INST.xt_rsc_0_0_wea(TLS_xt_rsc_0_0_wea);
    peaseNTT_INST.xt_rsc_0_0_qa(TLS_xt_rsc_0_0_qa);
    peaseNTT_INST.xt_rsc_0_0_adrb(TLS_xt_rsc_0_0_adrb);
    peaseNTT_INST.xt_rsc_0_0_db(TLS_xt_rsc_0_0_db);
    peaseNTT_INST.xt_rsc_0_0_web(TLS_xt_rsc_0_0_web);
    peaseNTT_INST.xt_rsc_0_0_qb(TLS_xt_rsc_0_0_qb);
    peaseNTT_INST.xt_rsc_triosy_0_0_lz(TLS_xt_rsc_triosy_0_0_lz);
    peaseNTT_INST.xt_rsc_0_1_adra(TLS_xt_rsc_0_1_adra);
    peaseNTT_INST.xt_rsc_0_1_da(TLS_xt_rsc_0_1_da);
    peaseNTT_INST.xt_rsc_0_1_wea(TLS_xt_rsc_0_1_wea);
    peaseNTT_INST.xt_rsc_0_1_qa(TLS_xt_rsc_0_1_qa);
    peaseNTT_INST.xt_rsc_0_1_adrb(TLS_xt_rsc_0_1_adrb);
    peaseNTT_INST.xt_rsc_0_1_db(TLS_xt_rsc_0_1_db);
    peaseNTT_INST.xt_rsc_0_1_web(TLS_xt_rsc_0_1_web);
    peaseNTT_INST.xt_rsc_0_1_qb(TLS_xt_rsc_0_1_qb);
    peaseNTT_INST.xt_rsc_triosy_0_1_lz(TLS_xt_rsc_triosy_0_1_lz);
    peaseNTT_INST.xt_rsc_0_2_adra(TLS_xt_rsc_0_2_adra);
    peaseNTT_INST.xt_rsc_0_2_da(TLS_xt_rsc_0_2_da);
    peaseNTT_INST.xt_rsc_0_2_wea(TLS_xt_rsc_0_2_wea);
    peaseNTT_INST.xt_rsc_0_2_qa(TLS_xt_rsc_0_2_qa);
    peaseNTT_INST.xt_rsc_0_2_adrb(TLS_xt_rsc_0_2_adrb);
    peaseNTT_INST.xt_rsc_0_2_db(TLS_xt_rsc_0_2_db);
    peaseNTT_INST.xt_rsc_0_2_web(TLS_xt_rsc_0_2_web);
    peaseNTT_INST.xt_rsc_0_2_qb(TLS_xt_rsc_0_2_qb);
    peaseNTT_INST.xt_rsc_triosy_0_2_lz(TLS_xt_rsc_triosy_0_2_lz);
    peaseNTT_INST.xt_rsc_0_3_adra(TLS_xt_rsc_0_3_adra);
    peaseNTT_INST.xt_rsc_0_3_da(TLS_xt_rsc_0_3_da);
    peaseNTT_INST.xt_rsc_0_3_wea(TLS_xt_rsc_0_3_wea);
    peaseNTT_INST.xt_rsc_0_3_qa(TLS_xt_rsc_0_3_qa);
    peaseNTT_INST.xt_rsc_0_3_adrb(TLS_xt_rsc_0_3_adrb);
    peaseNTT_INST.xt_rsc_0_3_db(TLS_xt_rsc_0_3_db);
    peaseNTT_INST.xt_rsc_0_3_web(TLS_xt_rsc_0_3_web);
    peaseNTT_INST.xt_rsc_0_3_qb(TLS_xt_rsc_0_3_qb);
    peaseNTT_INST.xt_rsc_triosy_0_3_lz(TLS_xt_rsc_triosy_0_3_lz);
    peaseNTT_INST.p_rsc_dat(TLS_p_rsc_dat);
    peaseNTT_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    peaseNTT_INST.r_rsc_dat(TLS_r_rsc_dat);
    peaseNTT_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);
    peaseNTT_INST.twiddle_rsc_0_0_radr(TLS_twiddle_rsc_0_0_radr);
    peaseNTT_INST.twiddle_rsc_0_0_q(TLS_twiddle_rsc_0_0_q);
    peaseNTT_INST.twiddle_rsc_triosy_0_0_lz(TLS_twiddle_rsc_triosy_0_0_lz);
    peaseNTT_INST.twiddle_rsc_0_1_radr(TLS_twiddle_rsc_0_1_radr);
    peaseNTT_INST.twiddle_rsc_0_1_q(TLS_twiddle_rsc_0_1_q);
    peaseNTT_INST.twiddle_rsc_triosy_0_1_lz(TLS_twiddle_rsc_triosy_0_1_lz);
    peaseNTT_INST.twiddle_rsc_0_2_radr(TLS_twiddle_rsc_0_2_radr);
    peaseNTT_INST.twiddle_rsc_0_2_q(TLS_twiddle_rsc_0_2_q);
    peaseNTT_INST.twiddle_rsc_triosy_0_2_lz(TLS_twiddle_rsc_triosy_0_2_lz);
    peaseNTT_INST.twiddle_rsc_0_3_radr(TLS_twiddle_rsc_0_3_radr);
    peaseNTT_INST.twiddle_rsc_0_3_q(TLS_twiddle_rsc_0_3_q);
    peaseNTT_INST.twiddle_rsc_triosy_0_3_lz(TLS_twiddle_rsc_triosy_0_3_lz);
    peaseNTT_INST.twiddle_h_rsc_0_0_radr(TLS_twiddle_h_rsc_0_0_radr);
    peaseNTT_INST.twiddle_h_rsc_0_0_q(TLS_twiddle_h_rsc_0_0_q);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_0_lz(TLS_twiddle_h_rsc_triosy_0_0_lz);
    peaseNTT_INST.twiddle_h_rsc_0_1_radr(TLS_twiddle_h_rsc_0_1_radr);
    peaseNTT_INST.twiddle_h_rsc_0_1_q(TLS_twiddle_h_rsc_0_1_q);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_1_lz(TLS_twiddle_h_rsc_triosy_0_1_lz);
    peaseNTT_INST.twiddle_h_rsc_0_2_radr(TLS_twiddle_h_rsc_0_2_radr);
    peaseNTT_INST.twiddle_h_rsc_0_2_q(TLS_twiddle_h_rsc_0_2_q);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_2_lz(TLS_twiddle_h_rsc_triosy_0_2_lz);
    peaseNTT_INST.twiddle_h_rsc_0_3_radr(TLS_twiddle_h_rsc_0_3_radr);
    peaseNTT_INST.twiddle_h_rsc_0_3_q(TLS_twiddle_h_rsc_0_3_q);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_3_lz(TLS_twiddle_h_rsc_triosy_0_3_lz);

    xt_rsc_0__0__INST.qb(TLS_xt_rsc_0_0_qb);
    xt_rsc_0__0__INST.web(TLS_xt_rsc_0_0_web);
    xt_rsc_0__0__INST.db(TLS_xt_rsc_0_0_db);
    xt_rsc_0__0__INST.adrb(TLS_xt_rsc_0_0_adrb);
    xt_rsc_0__0__INST.qa(TLS_xt_rsc_0_0_qa);
    xt_rsc_0__0__INST.wea(TLS_xt_rsc_0_0_wea);
    xt_rsc_0__0__INST.da(TLS_xt_rsc_0_0_da);
    xt_rsc_0__0__INST.adra(TLS_xt_rsc_0_0_adra);
    xt_rsc_0__0__INST.clka(clk);
    xt_rsc_0__0__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__0__INST.clkb(clk);
    xt_rsc_0__0__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_11)));

    xt_rsc_0__1__INST.qb(TLS_xt_rsc_0_1_qb);
    xt_rsc_0__1__INST.web(TLS_xt_rsc_0_1_web);
    xt_rsc_0__1__INST.db(TLS_xt_rsc_0_1_db);
    xt_rsc_0__1__INST.adrb(TLS_xt_rsc_0_1_adrb);
    xt_rsc_0__1__INST.qa(TLS_xt_rsc_0_1_qa);
    xt_rsc_0__1__INST.wea(TLS_xt_rsc_0_1_wea);
    xt_rsc_0__1__INST.da(TLS_xt_rsc_0_1_da);
    xt_rsc_0__1__INST.adra(TLS_xt_rsc_0_1_adra);
    xt_rsc_0__1__INST.clka(clk);
    xt_rsc_0__1__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__1__INST.clkb(clk);
    xt_rsc_0__1__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_12)));

    xt_rsc_0__2__INST.qb(TLS_xt_rsc_0_2_qb);
    xt_rsc_0__2__INST.web(TLS_xt_rsc_0_2_web);
    xt_rsc_0__2__INST.db(TLS_xt_rsc_0_2_db);
    xt_rsc_0__2__INST.adrb(TLS_xt_rsc_0_2_adrb);
    xt_rsc_0__2__INST.qa(TLS_xt_rsc_0_2_qa);
    xt_rsc_0__2__INST.wea(TLS_xt_rsc_0_2_wea);
    xt_rsc_0__2__INST.da(TLS_xt_rsc_0_2_da);
    xt_rsc_0__2__INST.adra(TLS_xt_rsc_0_2_adra);
    xt_rsc_0__2__INST.clka(clk);
    xt_rsc_0__2__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__2__INST.clkb(clk);
    xt_rsc_0__2__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_13)));

    xt_rsc_0__3__INST.qb(TLS_xt_rsc_0_3_qb);
    xt_rsc_0__3__INST.web(TLS_xt_rsc_0_3_web);
    xt_rsc_0__3__INST.db(TLS_xt_rsc_0_3_db);
    xt_rsc_0__3__INST.adrb(TLS_xt_rsc_0_3_adrb);
    xt_rsc_0__3__INST.qa(TLS_xt_rsc_0_3_qa);
    xt_rsc_0__3__INST.wea(TLS_xt_rsc_0_3_wea);
    xt_rsc_0__3__INST.da(TLS_xt_rsc_0_3_da);
    xt_rsc_0__3__INST.adra(TLS_xt_rsc_0_3_adra);
    xt_rsc_0__3__INST.clka(clk);
    xt_rsc_0__3__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__3__INST.clkb(clk);
    xt_rsc_0__3__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_14)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    twiddle_rsc_0__0__INST.q(TLS_twiddle_rsc_0_0_q);
    twiddle_rsc_0__0__INST.radr(TLS_twiddle_rsc_0_0_radr);
    twiddle_rsc_0__0__INST.clk(clk);
    twiddle_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__0__INST.d(TLS_twiddle_rsc_0__0__d);
    twiddle_rsc_0__0__INST.wadr(TLS_twiddle_rsc_0__0__wadr);
    twiddle_rsc_0__0__INST.we(TLS_twiddle_rsc_0__0__we);
    twiddle_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_15)));

    twiddle_rsc_0__1__INST.q(TLS_twiddle_rsc_0_1_q);
    twiddle_rsc_0__1__INST.radr(TLS_twiddle_rsc_0_1_radr);
    twiddle_rsc_0__1__INST.clk(clk);
    twiddle_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__1__INST.d(TLS_twiddle_rsc_0__1__d);
    twiddle_rsc_0__1__INST.wadr(TLS_twiddle_rsc_0__1__wadr);
    twiddle_rsc_0__1__INST.we(TLS_twiddle_rsc_0__1__we);
    twiddle_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_16)));

    twiddle_rsc_0__2__INST.q(TLS_twiddle_rsc_0_2_q);
    twiddle_rsc_0__2__INST.radr(TLS_twiddle_rsc_0_2_radr);
    twiddle_rsc_0__2__INST.clk(clk);
    twiddle_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__2__INST.d(TLS_twiddle_rsc_0__2__d);
    twiddle_rsc_0__2__INST.wadr(TLS_twiddle_rsc_0__2__wadr);
    twiddle_rsc_0__2__INST.we(TLS_twiddle_rsc_0__2__we);
    twiddle_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_17)));

    twiddle_rsc_0__3__INST.q(TLS_twiddle_rsc_0_3_q);
    twiddle_rsc_0__3__INST.radr(TLS_twiddle_rsc_0_3_radr);
    twiddle_rsc_0__3__INST.clk(clk);
    twiddle_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__3__INST.d(TLS_twiddle_rsc_0__3__d);
    twiddle_rsc_0__3__INST.wadr(TLS_twiddle_rsc_0__3__wadr);
    twiddle_rsc_0__3__INST.we(TLS_twiddle_rsc_0__3__we);
    twiddle_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_18)));

    twiddle_h_rsc_0__0__INST.q(TLS_twiddle_h_rsc_0_0_q);
    twiddle_h_rsc_0__0__INST.radr(TLS_twiddle_h_rsc_0_0_radr);
    twiddle_h_rsc_0__0__INST.clk(clk);
    twiddle_h_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__0__INST.d(TLS_twiddle_h_rsc_0__0__d);
    twiddle_h_rsc_0__0__INST.wadr(TLS_twiddle_h_rsc_0__0__wadr);
    twiddle_h_rsc_0__0__INST.we(TLS_twiddle_h_rsc_0__0__we);
    twiddle_h_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_19)));

    twiddle_h_rsc_0__1__INST.q(TLS_twiddle_h_rsc_0_1_q);
    twiddle_h_rsc_0__1__INST.radr(TLS_twiddle_h_rsc_0_1_radr);
    twiddle_h_rsc_0__1__INST.clk(clk);
    twiddle_h_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__1__INST.d(TLS_twiddle_h_rsc_0__1__d);
    twiddle_h_rsc_0__1__INST.wadr(TLS_twiddle_h_rsc_0__1__wadr);
    twiddle_h_rsc_0__1__INST.we(TLS_twiddle_h_rsc_0__1__we);
    twiddle_h_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_20)));

    twiddle_h_rsc_0__2__INST.q(TLS_twiddle_h_rsc_0_2_q);
    twiddle_h_rsc_0__2__INST.radr(TLS_twiddle_h_rsc_0_2_radr);
    twiddle_h_rsc_0__2__INST.clk(clk);
    twiddle_h_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__2__INST.d(TLS_twiddle_h_rsc_0__2__d);
    twiddle_h_rsc_0__2__INST.wadr(TLS_twiddle_h_rsc_0__2__wadr);
    twiddle_h_rsc_0__2__INST.we(TLS_twiddle_h_rsc_0__2__we);
    twiddle_h_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_21)));

    twiddle_h_rsc_0__3__INST.q(TLS_twiddle_h_rsc_0_3_q);
    twiddle_h_rsc_0__3__INST.radr(TLS_twiddle_h_rsc_0_3_radr);
    twiddle_h_rsc_0__3__INST.clk(clk);
    twiddle_h_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__3__INST.d(TLS_twiddle_h_rsc_0__3__d);
    twiddle_h_rsc_0__3__INST.wadr(TLS_twiddle_h_rsc_0__3__wadr);
    twiddle_h_rsc_0__3__INST.we(TLS_twiddle_h_rsc_0__3__we);
    twiddle_h_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_22)));

    trios_monitor_xt_rsc_triosy_0_0_lz_INST.trios(TLS_xt_rsc_triosy_0_0_lz);
    trios_monitor_xt_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_1_lz_INST.trios(TLS_xt_rsc_triosy_0_1_lz);
    trios_monitor_xt_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_2_lz_INST.trios(TLS_xt_rsc_triosy_0_2_lz);
    trios_monitor_xt_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_3_lz_INST.trios(TLS_xt_rsc_triosy_0_3_lz);
    trios_monitor_xt_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_xt.in_fifo(TLS_in_fifo_xt);
    transactor_xt.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_xt);
    transactor_xt.out_fifo(TLS_out_fifo_xt);
    transactor_xt.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_xt);
    transactor_xt.bind_clk(clk, true, rst);
    transactor_xt.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_xt.register_block(&xt_rsc_0__0__INST, xt_rsc_0__0__INST.basename(), TLS_xt_rsc_triosy_0_0_lz, 0,
        1020, 4);
    transactor_xt.register_block(&xt_rsc_0__1__INST, xt_rsc_0__1__INST.basename(), TLS_xt_rsc_triosy_0_1_lz, 1,
        1021, 4);
    transactor_xt.register_block(&xt_rsc_0__2__INST, xt_rsc_0__2__INST.basename(), TLS_xt_rsc_triosy_0_2_lz, 2,
        1022, 4);
    transactor_xt.register_block(&xt_rsc_0__3__INST, xt_rsc_0__3__INST.basename(), TLS_xt_rsc_triosy_0_3_lz, 3,
        1023, 4);

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

    trios_monitor_twiddle_rsc_triosy_0_0_lz_INST.trios(TLS_twiddle_rsc_triosy_0_0_lz);
    trios_monitor_twiddle_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_1_lz_INST.trios(TLS_twiddle_rsc_triosy_0_1_lz);
    trios_monitor_twiddle_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_2_lz_INST.trios(TLS_twiddle_rsc_triosy_0_2_lz);
    trios_monitor_twiddle_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_3_lz_INST.trios(TLS_twiddle_rsc_triosy_0_3_lz);
    trios_monitor_twiddle_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_0__0__INST, twiddle_rsc_0__0__INST.basename(), TLS_twiddle_rsc_triosy_0_0_lz,
        0, 1020, 4);
    transactor_twiddle.register_block(&twiddle_rsc_0__1__INST, twiddle_rsc_0__1__INST.basename(), TLS_twiddle_rsc_triosy_0_1_lz,
        1, 1021, 4);
    transactor_twiddle.register_block(&twiddle_rsc_0__2__INST, twiddle_rsc_0__2__INST.basename(), TLS_twiddle_rsc_triosy_0_2_lz,
        2, 1022, 4);
    transactor_twiddle.register_block(&twiddle_rsc_0__3__INST, twiddle_rsc_0__3__INST.basename(), TLS_twiddle_rsc_triosy_0_3_lz,
        3, 1023, 4);

    trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_0_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_1_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_2_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_3_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle_h.in_fifo(TLS_in_fifo_twiddle_h);
    transactor_twiddle_h.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle_h);
    transactor_twiddle_h.bind_clk(clk, true, rst);
    transactor_twiddle_h.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__0__INST, twiddle_h_rsc_0__0__INST.basename(), TLS_twiddle_h_rsc_triosy_0_0_lz,
        0, 1020, 4);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__1__INST, twiddle_h_rsc_0__1__INST.basename(), TLS_twiddle_h_rsc_triosy_0_1_lz,
        1, 1021, 4);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__2__INST, twiddle_h_rsc_0__2__INST.basename(), TLS_twiddle_h_rsc_triosy_0_2_lz,
        2, 1022, 4);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__3__INST, twiddle_h_rsc_0__3__INST.basename(), TLS_twiddle_h_rsc_triosy_0_3_lz,
        3, 1023, 4);

    testbench_INST.clk(clk);
    testbench_INST.ccs_xt_IN(TLS_in_fifo_xt);
    testbench_INST.ccs_wait_ctrl_xt_IN(TLS_in_wait_ctrl_fifo_xt);
    testbench_INST.ccs_xt(TLS_out_fifo_xt);
    testbench_INST.ccs_wait_ctrl_xt(TLS_out_wait_ctrl_fifo_xt);
    testbench_INST.ccs_p(TLS_in_fifo_p);
    testbench_INST.ccs_wait_ctrl_p(TLS_in_wait_ctrl_fifo_p);
    testbench_INST.ccs_r(TLS_in_fifo_r);
    testbench_INST.ccs_wait_ctrl_r(TLS_in_wait_ctrl_fifo_r);
    testbench_INST.ccs_twiddle(TLS_in_fifo_twiddle);
    testbench_INST.ccs_wait_ctrl_twiddle(TLS_in_wait_ctrl_fifo_twiddle);
    testbench_INST.ccs_twiddle_h(TLS_in_fifo_twiddle_h);
    testbench_INST.ccs_wait_ctrl_twiddle_h(TLS_in_wait_ctrl_fifo_twiddle_h);
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
  xt_rsc_0__0__INST.clear();
  xt_rsc_0__1__INST.clear();
  xt_rsc_0__2__INST.clear();
  xt_rsc_0__3__INST.clear();
  p_rsc_INST.clear();
  r_rsc_INST.clear();
  twiddle_rsc_0__0__INST.clear();
  twiddle_rsc_0__1__INST.clear();
  twiddle_rsc_0__2__INST.clear();
  twiddle_rsc_0__3__INST.clear();
  twiddle_h_rsc_0__0__INST.clear();
  twiddle_h_rsc_0__1__INST.clear();
  twiddle_h_rsc_0__2__INST.clear();
  twiddle_h_rsc_0__3__INST.clear();
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
    transactor_xt.set_auto_wait_limit(l);
    transactor_p.set_auto_wait_limit(l);
    transactor_r.set_auto_wait_limit(l);
    transactor_twiddle.set_auto_wait_limit(l);
    transactor_twiddle_h.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_xt_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_p_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_r_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_h_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_xt_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_p_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_r_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_h_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_xt_count = -1;
  static int transactor_p_count = -1;
  static int transactor_r_count = -1;
  static int transactor_twiddle_count = -1;
  static int transactor_twiddle_h_count = -1;

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
    debug("transactor_xt",transactor_xt_flags,transactor_xt_count);
    debug("transactor_p",transactor_p_flags,transactor_p_count);
    debug("transactor_r",transactor_r_flags,transactor_r_count);
    debug("transactor_twiddle",transactor_twiddle_flags,transactor_twiddle_count);
    debug("transactor_twiddle_h",transactor_twiddle_h_flags,transactor_twiddle_h_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_xt") == 0)
    xlator_p = &transactor_xt;
  if (strcmp(varname,"transactor_p") == 0)
    xlator_p = &transactor_p;
  if (strcmp(varname,"transactor_r") == 0)
    xlator_p = &transactor_r;
  if (strcmp(varname,"transactor_twiddle") == 0)
    xlator_p = &transactor_twiddle;
  if (strcmp(varname,"transactor_twiddle_h") == 0)
    xlator_p = &transactor_twiddle_h;
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
    generate_reset_event.notify(112.199997 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(112.199997 , SC_NS);
    } else {
      transactor_xt.reset_streams();
      transactor_p.reset_streams();
      transactor_r.reset_streams();
      transactor_twiddle.reset_streams();
      transactor_twiddle_h.reset_streams();
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
