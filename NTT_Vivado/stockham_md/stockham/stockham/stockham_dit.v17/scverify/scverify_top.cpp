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
#define TOP_HDL_ENTITY stockham_dit
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_4;
extern double __scv_hold_time_RSCID_14;
extern double __scv_hold_time_RSCID_15;
extern double __scv_hold_time_RSCID_16;
extern double __scv_hold_time_RSCID_17;
extern double __scv_hold_time_RSCID_18;
extern double __scv_hold_time_RSCID_19;
extern double __scv_hold_time_RSCID_20;
extern double __scv_hold_time_RSCID_21;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_4 = 0;
double __scv_hold_time_RSCID_14 = 0;
double __scv_hold_time_RSCID_15 = 0;
double __scv_hold_time_RSCID_16 = 0;
double __scv_hold_time_RSCID_17 = 0;
double __scv_hold_time_RSCID_18 = 0;
double __scv_hold_time_RSCID_19 = 0;
double __scv_hold_time_RSCID_20 = 0;
double __scv_hold_time_RSCID_21 = 0;
#endif

class scverify_top : public sc_module
{
public:
  sc_signal<sc_logic>                                                           rst;
  sc_signal<sc_logic>                                                           rst_n;
  sc_signal<sc_logic>                                                           SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                           SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                           TLS_design_is_idle;
  sc_signal<bool>                                                               TLS_design_is_idle_reg;
  sc_clock                                                                      clk;
  mc_programmable_reset                                                         rst_driver;
  sc_signal<sc_logic>                                                           TLS_rst;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_0_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_0_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_0_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_0_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_0_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_0_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_0_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_0_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_1_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_1_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_1_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_1_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_1_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_1_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_1_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_1_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_2_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_2_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_2_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_2_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_2_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_2_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_2_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_2_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_3_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_3_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_3_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_3_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_3_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_3_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_3_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_3_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_4_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_4_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_4_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_4_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_4_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_4_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_4_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_4_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_5_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_5_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_5_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_5_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_5_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_5_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_5_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_5_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_6_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_6_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_6_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_6_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_6_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_6_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_6_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_6_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_7_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_7_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_7_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_7_qa;
  sc_signal<sc_lv<11> >                                                         TLS_xt_rsc_0_7_adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_7_db;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_7_web;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_7_qb;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<32> >                                                         TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                           TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<14> >                                                         TLS_twiddle_rsc_radr;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_q;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_lz;
  sc_signal<sc_lv<14> >                                                         TLS_twiddle_h_rsc_radr;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_q;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_lz;
  ccs_DUT_wrapper                                                               stockham_dit_INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__0__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__1__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__2__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__3__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__4__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__5__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__6__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<11,32,2048 >                                   xt_rsc_0__7__INST;
  ccs_in_trans_rsc_v1<1,32 >                                                    p_rsc_INST;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_d;
  sc_signal<sc_lv<14> >                                                         TLS_twiddle_rsc_wadr;
  sc_signal<sc_logic >                                                          TLS_twiddle_rsc_we;
  BLOCK_1R1W_RBW_trans_rsc<14,32,16384 >                                        twiddle_rsc_INST;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_d;
  sc_signal<sc_lv<14> >                                                         TLS_twiddle_h_rsc_wadr;
  sc_signal<sc_logic >                                                          TLS_twiddle_h_rsc_we;
  BLOCK_1R1W_RBW_trans_rsc<14,32,16384 >                                        twiddle_h_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16384> >                TLS_in_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_xt;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16384> >                TLS_out_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_out_wait_ctrl_fifo_xt;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_3_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_4_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_5_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_6_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_7_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16384>,32,false>  transactor_xt;
  tlm::tlm_fifo<ac_int<32, false > >                                            TLS_in_fifo_p;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_p;
  mc_trios_input_monitor                                                        trios_monitor_p_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                              transactor_p;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16384> >                TLS_in_fifo_twiddle;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_twiddle;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16384>,32,false>  transactor_twiddle;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16384> >                TLS_in_fifo_twiddle_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_twiddle_h;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16384>,32,false>  transactor_twiddle_h;
  mc_testbench                                                                  testbench_INST;
  sc_signal<sc_logic>                                                           catapult_start;
  sc_signal<sc_logic>                                                           catapult_done;
  sc_signal<sc_logic>                                                           catapult_ready;
  sc_signal<sc_logic>                                                           in_sync;
  sc_signal<sc_logic>                                                           out_sync;
  sc_signal<sc_logic>                                                           inout_sync;
  sc_signal<unsigned>                                                           wait_for_init;
  sync_generator                                                                sync_generator_INST;
  catapult_monitor                                                              catapult_monitor_INST;
  ccs_probe_monitor                                                            *ccs_probe_monitor_INST;
  sc_event                                                                      generate_reset_event;
  sc_event                                                                      deadlock_event;
  sc_signal<sc_logic>                                                           deadlocked;
  sc_signal<sc_logic>                                                           maxsimtime;
  sc_event                                                                      max_sim_time_event;
  sc_signal<sc_logic>                                                           TLS_enable_stalls;
  sc_signal<unsigned short>                                                     TLS_stall_coverage;

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
    , CCS_CLK_CTOR(clk, "clk", 8, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 120.000000, false)
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
    , TLS_xt_rsc_0_4_adra("TLS_xt_rsc_0_4_adra")
    , TLS_xt_rsc_0_4_da("TLS_xt_rsc_0_4_da")
    , TLS_xt_rsc_0_4_wea("TLS_xt_rsc_0_4_wea")
    , TLS_xt_rsc_0_4_qa("TLS_xt_rsc_0_4_qa")
    , TLS_xt_rsc_0_4_adrb("TLS_xt_rsc_0_4_adrb")
    , TLS_xt_rsc_0_4_db("TLS_xt_rsc_0_4_db")
    , TLS_xt_rsc_0_4_web("TLS_xt_rsc_0_4_web")
    , TLS_xt_rsc_0_4_qb("TLS_xt_rsc_0_4_qb")
    , TLS_xt_rsc_triosy_0_4_lz("TLS_xt_rsc_triosy_0_4_lz")
    , TLS_xt_rsc_0_5_adra("TLS_xt_rsc_0_5_adra")
    , TLS_xt_rsc_0_5_da("TLS_xt_rsc_0_5_da")
    , TLS_xt_rsc_0_5_wea("TLS_xt_rsc_0_5_wea")
    , TLS_xt_rsc_0_5_qa("TLS_xt_rsc_0_5_qa")
    , TLS_xt_rsc_0_5_adrb("TLS_xt_rsc_0_5_adrb")
    , TLS_xt_rsc_0_5_db("TLS_xt_rsc_0_5_db")
    , TLS_xt_rsc_0_5_web("TLS_xt_rsc_0_5_web")
    , TLS_xt_rsc_0_5_qb("TLS_xt_rsc_0_5_qb")
    , TLS_xt_rsc_triosy_0_5_lz("TLS_xt_rsc_triosy_0_5_lz")
    , TLS_xt_rsc_0_6_adra("TLS_xt_rsc_0_6_adra")
    , TLS_xt_rsc_0_6_da("TLS_xt_rsc_0_6_da")
    , TLS_xt_rsc_0_6_wea("TLS_xt_rsc_0_6_wea")
    , TLS_xt_rsc_0_6_qa("TLS_xt_rsc_0_6_qa")
    , TLS_xt_rsc_0_6_adrb("TLS_xt_rsc_0_6_adrb")
    , TLS_xt_rsc_0_6_db("TLS_xt_rsc_0_6_db")
    , TLS_xt_rsc_0_6_web("TLS_xt_rsc_0_6_web")
    , TLS_xt_rsc_0_6_qb("TLS_xt_rsc_0_6_qb")
    , TLS_xt_rsc_triosy_0_6_lz("TLS_xt_rsc_triosy_0_6_lz")
    , TLS_xt_rsc_0_7_adra("TLS_xt_rsc_0_7_adra")
    , TLS_xt_rsc_0_7_da("TLS_xt_rsc_0_7_da")
    , TLS_xt_rsc_0_7_wea("TLS_xt_rsc_0_7_wea")
    , TLS_xt_rsc_0_7_qa("TLS_xt_rsc_0_7_qa")
    , TLS_xt_rsc_0_7_adrb("TLS_xt_rsc_0_7_adrb")
    , TLS_xt_rsc_0_7_db("TLS_xt_rsc_0_7_db")
    , TLS_xt_rsc_0_7_web("TLS_xt_rsc_0_7_web")
    , TLS_xt_rsc_0_7_qb("TLS_xt_rsc_0_7_qb")
    , TLS_xt_rsc_triosy_0_7_lz("TLS_xt_rsc_triosy_0_7_lz")
    , TLS_p_rsc_dat("TLS_p_rsc_dat")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_twiddle_rsc_radr("TLS_twiddle_rsc_radr")
    , TLS_twiddle_rsc_q("TLS_twiddle_rsc_q")
    , TLS_twiddle_rsc_triosy_lz("TLS_twiddle_rsc_triosy_lz")
    , TLS_twiddle_h_rsc_radr("TLS_twiddle_h_rsc_radr")
    , TLS_twiddle_h_rsc_q("TLS_twiddle_h_rsc_q")
    , TLS_twiddle_h_rsc_triosy_lz("TLS_twiddle_h_rsc_triosy_lz")
    , stockham_dit_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , xt_rsc_0__0__INST("xt_rsc_0__0_", true)
    , xt_rsc_0__1__INST("xt_rsc_0__1_", true)
    , xt_rsc_0__2__INST("xt_rsc_0__2_", true)
    , xt_rsc_0__3__INST("xt_rsc_0__3_", true)
    , xt_rsc_0__4__INST("xt_rsc_0__4_", true)
    , xt_rsc_0__5__INST("xt_rsc_0__5_", true)
    , xt_rsc_0__6__INST("xt_rsc_0__6_", true)
    , xt_rsc_0__7__INST("xt_rsc_0__7_", true)
    , p_rsc_INST("p_rsc", true)
    , TLS_twiddle_rsc_d("TLS_twiddle_rsc_d")
    , TLS_twiddle_rsc_wadr("TLS_twiddle_rsc_wadr")
    , TLS_twiddle_rsc_we("TLS_twiddle_rsc_we")
    , twiddle_rsc_INST("twiddle_rsc", true)
    , TLS_twiddle_h_rsc_d("TLS_twiddle_h_rsc_d")
    , TLS_twiddle_h_rsc_wadr("TLS_twiddle_h_rsc_wadr")
    , TLS_twiddle_h_rsc_we("TLS_twiddle_h_rsc_we")
    , twiddle_h_rsc_INST("twiddle_h_rsc", true)
    , TLS_in_fifo_xt("TLS_in_fifo_xt", -1)
    , TLS_in_wait_ctrl_fifo_xt("TLS_in_wait_ctrl_fifo_xt", -1)
    , TLS_out_fifo_xt("TLS_out_fifo_xt", -1)
    , TLS_out_wait_ctrl_fifo_xt("TLS_out_wait_ctrl_fifo_xt", -1)
    , trios_monitor_xt_rsc_triosy_0_0_lz_INST("trios_monitor_xt_rsc_triosy_0_0_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_1_lz_INST("trios_monitor_xt_rsc_triosy_0_1_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_2_lz_INST("trios_monitor_xt_rsc_triosy_0_2_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_3_lz_INST("trios_monitor_xt_rsc_triosy_0_3_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_4_lz_INST("trios_monitor_xt_rsc_triosy_0_4_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_5_lz_INST("trios_monitor_xt_rsc_triosy_0_5_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_6_lz_INST("trios_monitor_xt_rsc_triosy_0_6_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_7_lz_INST("trios_monitor_xt_rsc_triosy_0_7_lz_INST")
    , transactor_xt("transactor_xt", 0, 32, 0)
    , TLS_in_fifo_p("TLS_in_fifo_p", -1)
    , TLS_in_wait_ctrl_fifo_p("TLS_in_wait_ctrl_fifo_p", -1)
    , trios_monitor_p_rsc_triosy_lz_INST("trios_monitor_p_rsc_triosy_lz_INST")
    , transactor_p("transactor_p", 0, 32, 0)
    , TLS_in_fifo_twiddle("TLS_in_fifo_twiddle", -1)
    , TLS_in_wait_ctrl_fifo_twiddle("TLS_in_wait_ctrl_fifo_twiddle", -1)
    , trios_monitor_twiddle_rsc_triosy_lz_INST("trios_monitor_twiddle_rsc_triosy_lz_INST")
    , transactor_twiddle("transactor_twiddle", 0, 32, 0)
    , TLS_in_fifo_twiddle_h("TLS_in_fifo_twiddle_h", -1)
    , TLS_in_wait_ctrl_fifo_twiddle_h("TLS_in_wait_ctrl_fifo_twiddle_h", -1)
    , trios_monitor_twiddle_h_rsc_triosy_lz_INST("trios_monitor_twiddle_h_rsc_triosy_lz_INST")
    , transactor_twiddle_h("transactor_twiddle_h", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 344164, 344164, 0)
    , catapult_monitor_INST("Monitor", clk, true, 344164LL, 344164LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    stockham_dit_INST.clk(clk);
    stockham_dit_INST.rst(TLS_rst);
    stockham_dit_INST.xt_rsc_0_0_adra(TLS_xt_rsc_0_0_adra);
    stockham_dit_INST.xt_rsc_0_0_da(TLS_xt_rsc_0_0_da);
    stockham_dit_INST.xt_rsc_0_0_wea(TLS_xt_rsc_0_0_wea);
    stockham_dit_INST.xt_rsc_0_0_qa(TLS_xt_rsc_0_0_qa);
    stockham_dit_INST.xt_rsc_0_0_adrb(TLS_xt_rsc_0_0_adrb);
    stockham_dit_INST.xt_rsc_0_0_db(TLS_xt_rsc_0_0_db);
    stockham_dit_INST.xt_rsc_0_0_web(TLS_xt_rsc_0_0_web);
    stockham_dit_INST.xt_rsc_0_0_qb(TLS_xt_rsc_0_0_qb);
    stockham_dit_INST.xt_rsc_triosy_0_0_lz(TLS_xt_rsc_triosy_0_0_lz);
    stockham_dit_INST.xt_rsc_0_1_adra(TLS_xt_rsc_0_1_adra);
    stockham_dit_INST.xt_rsc_0_1_da(TLS_xt_rsc_0_1_da);
    stockham_dit_INST.xt_rsc_0_1_wea(TLS_xt_rsc_0_1_wea);
    stockham_dit_INST.xt_rsc_0_1_qa(TLS_xt_rsc_0_1_qa);
    stockham_dit_INST.xt_rsc_0_1_adrb(TLS_xt_rsc_0_1_adrb);
    stockham_dit_INST.xt_rsc_0_1_db(TLS_xt_rsc_0_1_db);
    stockham_dit_INST.xt_rsc_0_1_web(TLS_xt_rsc_0_1_web);
    stockham_dit_INST.xt_rsc_0_1_qb(TLS_xt_rsc_0_1_qb);
    stockham_dit_INST.xt_rsc_triosy_0_1_lz(TLS_xt_rsc_triosy_0_1_lz);
    stockham_dit_INST.xt_rsc_0_2_adra(TLS_xt_rsc_0_2_adra);
    stockham_dit_INST.xt_rsc_0_2_da(TLS_xt_rsc_0_2_da);
    stockham_dit_INST.xt_rsc_0_2_wea(TLS_xt_rsc_0_2_wea);
    stockham_dit_INST.xt_rsc_0_2_qa(TLS_xt_rsc_0_2_qa);
    stockham_dit_INST.xt_rsc_0_2_adrb(TLS_xt_rsc_0_2_adrb);
    stockham_dit_INST.xt_rsc_0_2_db(TLS_xt_rsc_0_2_db);
    stockham_dit_INST.xt_rsc_0_2_web(TLS_xt_rsc_0_2_web);
    stockham_dit_INST.xt_rsc_0_2_qb(TLS_xt_rsc_0_2_qb);
    stockham_dit_INST.xt_rsc_triosy_0_2_lz(TLS_xt_rsc_triosy_0_2_lz);
    stockham_dit_INST.xt_rsc_0_3_adra(TLS_xt_rsc_0_3_adra);
    stockham_dit_INST.xt_rsc_0_3_da(TLS_xt_rsc_0_3_da);
    stockham_dit_INST.xt_rsc_0_3_wea(TLS_xt_rsc_0_3_wea);
    stockham_dit_INST.xt_rsc_0_3_qa(TLS_xt_rsc_0_3_qa);
    stockham_dit_INST.xt_rsc_0_3_adrb(TLS_xt_rsc_0_3_adrb);
    stockham_dit_INST.xt_rsc_0_3_db(TLS_xt_rsc_0_3_db);
    stockham_dit_INST.xt_rsc_0_3_web(TLS_xt_rsc_0_3_web);
    stockham_dit_INST.xt_rsc_0_3_qb(TLS_xt_rsc_0_3_qb);
    stockham_dit_INST.xt_rsc_triosy_0_3_lz(TLS_xt_rsc_triosy_0_3_lz);
    stockham_dit_INST.xt_rsc_0_4_adra(TLS_xt_rsc_0_4_adra);
    stockham_dit_INST.xt_rsc_0_4_da(TLS_xt_rsc_0_4_da);
    stockham_dit_INST.xt_rsc_0_4_wea(TLS_xt_rsc_0_4_wea);
    stockham_dit_INST.xt_rsc_0_4_qa(TLS_xt_rsc_0_4_qa);
    stockham_dit_INST.xt_rsc_0_4_adrb(TLS_xt_rsc_0_4_adrb);
    stockham_dit_INST.xt_rsc_0_4_db(TLS_xt_rsc_0_4_db);
    stockham_dit_INST.xt_rsc_0_4_web(TLS_xt_rsc_0_4_web);
    stockham_dit_INST.xt_rsc_0_4_qb(TLS_xt_rsc_0_4_qb);
    stockham_dit_INST.xt_rsc_triosy_0_4_lz(TLS_xt_rsc_triosy_0_4_lz);
    stockham_dit_INST.xt_rsc_0_5_adra(TLS_xt_rsc_0_5_adra);
    stockham_dit_INST.xt_rsc_0_5_da(TLS_xt_rsc_0_5_da);
    stockham_dit_INST.xt_rsc_0_5_wea(TLS_xt_rsc_0_5_wea);
    stockham_dit_INST.xt_rsc_0_5_qa(TLS_xt_rsc_0_5_qa);
    stockham_dit_INST.xt_rsc_0_5_adrb(TLS_xt_rsc_0_5_adrb);
    stockham_dit_INST.xt_rsc_0_5_db(TLS_xt_rsc_0_5_db);
    stockham_dit_INST.xt_rsc_0_5_web(TLS_xt_rsc_0_5_web);
    stockham_dit_INST.xt_rsc_0_5_qb(TLS_xt_rsc_0_5_qb);
    stockham_dit_INST.xt_rsc_triosy_0_5_lz(TLS_xt_rsc_triosy_0_5_lz);
    stockham_dit_INST.xt_rsc_0_6_adra(TLS_xt_rsc_0_6_adra);
    stockham_dit_INST.xt_rsc_0_6_da(TLS_xt_rsc_0_6_da);
    stockham_dit_INST.xt_rsc_0_6_wea(TLS_xt_rsc_0_6_wea);
    stockham_dit_INST.xt_rsc_0_6_qa(TLS_xt_rsc_0_6_qa);
    stockham_dit_INST.xt_rsc_0_6_adrb(TLS_xt_rsc_0_6_adrb);
    stockham_dit_INST.xt_rsc_0_6_db(TLS_xt_rsc_0_6_db);
    stockham_dit_INST.xt_rsc_0_6_web(TLS_xt_rsc_0_6_web);
    stockham_dit_INST.xt_rsc_0_6_qb(TLS_xt_rsc_0_6_qb);
    stockham_dit_INST.xt_rsc_triosy_0_6_lz(TLS_xt_rsc_triosy_0_6_lz);
    stockham_dit_INST.xt_rsc_0_7_adra(TLS_xt_rsc_0_7_adra);
    stockham_dit_INST.xt_rsc_0_7_da(TLS_xt_rsc_0_7_da);
    stockham_dit_INST.xt_rsc_0_7_wea(TLS_xt_rsc_0_7_wea);
    stockham_dit_INST.xt_rsc_0_7_qa(TLS_xt_rsc_0_7_qa);
    stockham_dit_INST.xt_rsc_0_7_adrb(TLS_xt_rsc_0_7_adrb);
    stockham_dit_INST.xt_rsc_0_7_db(TLS_xt_rsc_0_7_db);
    stockham_dit_INST.xt_rsc_0_7_web(TLS_xt_rsc_0_7_web);
    stockham_dit_INST.xt_rsc_0_7_qb(TLS_xt_rsc_0_7_qb);
    stockham_dit_INST.xt_rsc_triosy_0_7_lz(TLS_xt_rsc_triosy_0_7_lz);
    stockham_dit_INST.p_rsc_dat(TLS_p_rsc_dat);
    stockham_dit_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    stockham_dit_INST.twiddle_rsc_radr(TLS_twiddle_rsc_radr);
    stockham_dit_INST.twiddle_rsc_q(TLS_twiddle_rsc_q);
    stockham_dit_INST.twiddle_rsc_triosy_lz(TLS_twiddle_rsc_triosy_lz);
    stockham_dit_INST.twiddle_h_rsc_radr(TLS_twiddle_h_rsc_radr);
    stockham_dit_INST.twiddle_h_rsc_q(TLS_twiddle_h_rsc_q);
    stockham_dit_INST.twiddle_h_rsc_triosy_lz(TLS_twiddle_h_rsc_triosy_lz);

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
    xt_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_14)));

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
    xt_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_15)));

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
    xt_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_16)));

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
    xt_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_17)));

    xt_rsc_0__4__INST.qb(TLS_xt_rsc_0_4_qb);
    xt_rsc_0__4__INST.web(TLS_xt_rsc_0_4_web);
    xt_rsc_0__4__INST.db(TLS_xt_rsc_0_4_db);
    xt_rsc_0__4__INST.adrb(TLS_xt_rsc_0_4_adrb);
    xt_rsc_0__4__INST.qa(TLS_xt_rsc_0_4_qa);
    xt_rsc_0__4__INST.wea(TLS_xt_rsc_0_4_wea);
    xt_rsc_0__4__INST.da(TLS_xt_rsc_0_4_da);
    xt_rsc_0__4__INST.adra(TLS_xt_rsc_0_4_adra);
    xt_rsc_0__4__INST.clka(clk);
    xt_rsc_0__4__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__4__INST.clkb(clk);
    xt_rsc_0__4__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_18)));

    xt_rsc_0__5__INST.qb(TLS_xt_rsc_0_5_qb);
    xt_rsc_0__5__INST.web(TLS_xt_rsc_0_5_web);
    xt_rsc_0__5__INST.db(TLS_xt_rsc_0_5_db);
    xt_rsc_0__5__INST.adrb(TLS_xt_rsc_0_5_adrb);
    xt_rsc_0__5__INST.qa(TLS_xt_rsc_0_5_qa);
    xt_rsc_0__5__INST.wea(TLS_xt_rsc_0_5_wea);
    xt_rsc_0__5__INST.da(TLS_xt_rsc_0_5_da);
    xt_rsc_0__5__INST.adra(TLS_xt_rsc_0_5_adra);
    xt_rsc_0__5__INST.clka(clk);
    xt_rsc_0__5__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__5__INST.clkb(clk);
    xt_rsc_0__5__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_19)));

    xt_rsc_0__6__INST.qb(TLS_xt_rsc_0_6_qb);
    xt_rsc_0__6__INST.web(TLS_xt_rsc_0_6_web);
    xt_rsc_0__6__INST.db(TLS_xt_rsc_0_6_db);
    xt_rsc_0__6__INST.adrb(TLS_xt_rsc_0_6_adrb);
    xt_rsc_0__6__INST.qa(TLS_xt_rsc_0_6_qa);
    xt_rsc_0__6__INST.wea(TLS_xt_rsc_0_6_wea);
    xt_rsc_0__6__INST.da(TLS_xt_rsc_0_6_da);
    xt_rsc_0__6__INST.adra(TLS_xt_rsc_0_6_adra);
    xt_rsc_0__6__INST.clka(clk);
    xt_rsc_0__6__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__6__INST.clkb(clk);
    xt_rsc_0__6__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_20)));

    xt_rsc_0__7__INST.qb(TLS_xt_rsc_0_7_qb);
    xt_rsc_0__7__INST.web(TLS_xt_rsc_0_7_web);
    xt_rsc_0__7__INST.db(TLS_xt_rsc_0_7_db);
    xt_rsc_0__7__INST.adrb(TLS_xt_rsc_0_7_adrb);
    xt_rsc_0__7__INST.qa(TLS_xt_rsc_0_7_qa);
    xt_rsc_0__7__INST.wea(TLS_xt_rsc_0_7_wea);
    xt_rsc_0__7__INST.da(TLS_xt_rsc_0_7_da);
    xt_rsc_0__7__INST.adra(TLS_xt_rsc_0_7_adra);
    xt_rsc_0__7__INST.clka(clk);
    xt_rsc_0__7__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__7__INST.clkb(clk);
    xt_rsc_0__7__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_21)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    twiddle_rsc_INST.q(TLS_twiddle_rsc_q);
    twiddle_rsc_INST.radr(TLS_twiddle_rsc_radr);
    twiddle_rsc_INST.clk(clk);
    twiddle_rsc_INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_INST.d(TLS_twiddle_rsc_d);
    twiddle_rsc_INST.wadr(TLS_twiddle_rsc_wadr);
    twiddle_rsc_INST.we(TLS_twiddle_rsc_we);
    twiddle_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    twiddle_h_rsc_INST.q(TLS_twiddle_h_rsc_q);
    twiddle_h_rsc_INST.radr(TLS_twiddle_h_rsc_radr);
    twiddle_h_rsc_INST.clk(clk);
    twiddle_h_rsc_INST.clken(SIG_SC_LOGIC_1);
    twiddle_h_rsc_INST.d(TLS_twiddle_h_rsc_d);
    twiddle_h_rsc_INST.wadr(TLS_twiddle_h_rsc_wadr);
    twiddle_h_rsc_INST.we(TLS_twiddle_h_rsc_we);
    twiddle_h_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_4)));

    trios_monitor_xt_rsc_triosy_0_0_lz_INST.trios(TLS_xt_rsc_triosy_0_0_lz);
    trios_monitor_xt_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_1_lz_INST.trios(TLS_xt_rsc_triosy_0_1_lz);
    trios_monitor_xt_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_2_lz_INST.trios(TLS_xt_rsc_triosy_0_2_lz);
    trios_monitor_xt_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_3_lz_INST.trios(TLS_xt_rsc_triosy_0_3_lz);
    trios_monitor_xt_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_4_lz_INST.trios(TLS_xt_rsc_triosy_0_4_lz);
    trios_monitor_xt_rsc_triosy_0_4_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_5_lz_INST.trios(TLS_xt_rsc_triosy_0_5_lz);
    trios_monitor_xt_rsc_triosy_0_5_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_6_lz_INST.trios(TLS_xt_rsc_triosy_0_6_lz);
    trios_monitor_xt_rsc_triosy_0_6_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_7_lz_INST.trios(TLS_xt_rsc_triosy_0_7_lz);
    trios_monitor_xt_rsc_triosy_0_7_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_xt.in_fifo(TLS_in_fifo_xt);
    transactor_xt.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_xt);
    transactor_xt.out_fifo(TLS_out_fifo_xt);
    transactor_xt.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_xt);
    transactor_xt.bind_clk(clk, true, rst);
    transactor_xt.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_xt.register_block(&xt_rsc_0__0__INST, xt_rsc_0__0__INST.basename(), TLS_xt_rsc_triosy_0_0_lz, 0,
        16376, 8);
    transactor_xt.register_block(&xt_rsc_0__1__INST, xt_rsc_0__1__INST.basename(), TLS_xt_rsc_triosy_0_1_lz, 1,
        16377, 8);
    transactor_xt.register_block(&xt_rsc_0__2__INST, xt_rsc_0__2__INST.basename(), TLS_xt_rsc_triosy_0_2_lz, 2,
        16378, 8);
    transactor_xt.register_block(&xt_rsc_0__3__INST, xt_rsc_0__3__INST.basename(), TLS_xt_rsc_triosy_0_3_lz, 3,
        16379, 8);
    transactor_xt.register_block(&xt_rsc_0__4__INST, xt_rsc_0__4__INST.basename(), TLS_xt_rsc_triosy_0_4_lz, 4,
        16380, 8);
    transactor_xt.register_block(&xt_rsc_0__5__INST, xt_rsc_0__5__INST.basename(), TLS_xt_rsc_triosy_0_5_lz, 5,
        16381, 8);
    transactor_xt.register_block(&xt_rsc_0__6__INST, xt_rsc_0__6__INST.basename(), TLS_xt_rsc_triosy_0_6_lz, 6,
        16382, 8);
    transactor_xt.register_block(&xt_rsc_0__7__INST, xt_rsc_0__7__INST.basename(), TLS_xt_rsc_triosy_0_7_lz, 7,
        16383, 8);

    trios_monitor_p_rsc_triosy_lz_INST.trios(TLS_p_rsc_triosy_lz);
    trios_monitor_p_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_p.in_fifo(TLS_in_fifo_p);
    transactor_p.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_p);
    transactor_p.bind_clk(clk, true, rst);
    transactor_p.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_p.register_block(&p_rsc_INST, p_rsc_INST.basename(), TLS_p_rsc_triosy_lz, 0, 0, 1);

    trios_monitor_twiddle_rsc_triosy_lz_INST.trios(TLS_twiddle_rsc_triosy_lz);
    trios_monitor_twiddle_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_INST, twiddle_rsc_INST.basename(), TLS_twiddle_rsc_triosy_lz,
        0, 16383, 1);

    trios_monitor_twiddle_h_rsc_triosy_lz_INST.trios(TLS_twiddle_h_rsc_triosy_lz);
    trios_monitor_twiddle_h_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle_h.in_fifo(TLS_in_fifo_twiddle_h);
    transactor_twiddle_h.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle_h);
    transactor_twiddle_h.bind_clk(clk, true, rst);
    transactor_twiddle_h.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle_h.register_block(&twiddle_h_rsc_INST, twiddle_h_rsc_INST.basename(), TLS_twiddle_h_rsc_triosy_lz,
        0, 16383, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_xt_IN(TLS_in_fifo_xt);
    testbench_INST.ccs_wait_ctrl_xt_IN(TLS_in_wait_ctrl_fifo_xt);
    testbench_INST.ccs_xt(TLS_out_fifo_xt);
    testbench_INST.ccs_wait_ctrl_xt(TLS_out_wait_ctrl_fifo_xt);
    testbench_INST.ccs_p(TLS_in_fifo_p);
    testbench_INST.ccs_wait_ctrl_p(TLS_in_wait_ctrl_fifo_p);
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
  xt_rsc_0__4__INST.clear();
  xt_rsc_0__5__INST.clear();
  xt_rsc_0__6__INST.clear();
  xt_rsc_0__7__INST.clear();
  p_rsc_INST.clear();
  twiddle_rsc_INST.clear();
  twiddle_h_rsc_INST.clear();
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
    transactor_twiddle.set_auto_wait_limit(l);
    transactor_twiddle_h.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_xt_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_p_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_h_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_xt_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_p_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_h_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_xt_count = -1;
  static int transactor_p_count = -1;
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
    generate_reset_event.notify(120.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(120.000000 , SC_NS);
    } else {
      transactor_xt.reset_streams();
      transactor_p.reset_streams();
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
