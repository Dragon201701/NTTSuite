#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_slave_mem_trans_rsc.h"
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
extern double __scv_hold_time_RSCID_23;
extern double __scv_hold_time_RSCID_24;
extern double __scv_hold_time_RSCID_25;
extern double __scv_hold_time_RSCID_26;
extern double __scv_hold_time_RSCID_27;
extern double __scv_hold_time_RSCID_28;
extern double __scv_hold_time_RSCID_29;
extern double __scv_hold_time_RSCID_30;
extern double __scv_hold_time_RSCID_31;
extern double __scv_hold_time_RSCID_32;
extern double __scv_hold_time_RSCID_33;
extern double __scv_hold_time_RSCID_34;
extern double __scv_hold_time_RSCID_35;
extern double __scv_hold_time_RSCID_36;
extern double __scv_hold_time_RSCID_37;
extern double __scv_hold_time_RSCID_38;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_23 = 0;
double __scv_hold_time_RSCID_24 = 0;
double __scv_hold_time_RSCID_25 = 0;
double __scv_hold_time_RSCID_26 = 0;
double __scv_hold_time_RSCID_27 = 0;
double __scv_hold_time_RSCID_28 = 0;
double __scv_hold_time_RSCID_29 = 0;
double __scv_hold_time_RSCID_30 = 0;
double __scv_hold_time_RSCID_31 = 0;
double __scv_hold_time_RSCID_32 = 0;
double __scv_hold_time_RSCID_33 = 0;
double __scv_hold_time_RSCID_34 = 0;
double __scv_hold_time_RSCID_35 = 0;
double __scv_hold_time_RSCID_36 = 0;
double __scv_hold_time_RSCID_37 = 0;
double __scv_hold_time_RSCID_38 = 0;
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
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_0_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_0_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_0_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_0_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_0_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_1_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_1_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_1_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_1_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_1_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_2_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_2_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_2_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_2_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_2_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_3_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_3_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_3_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_3_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_3_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_4_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_4_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_4_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_4_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_5_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_5_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_5_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_5_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_6_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_6_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_6_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_6_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_7_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_7_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_qa;
  sc_signal<sc_lv<7> >                                                         TLS_xt_rsc_0_7_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_7_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<32> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<32> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_0_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_1_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_1_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_1_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_1_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_1_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_1_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_1_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_1_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_1_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_1_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_1_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_1_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_1_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_2_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_2_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_2_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_2_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_2_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_2_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_2_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_2_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_2_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_2_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_2_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_2_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_2_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_3_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_3_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_3_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_3_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_3_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_3_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_3_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_3_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_0_3_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_0_3_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_3_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_0_3_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_3_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_0_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_1_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_1_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_1_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_1_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_1_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_1_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_1_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_1_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_1_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_1_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_1_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_1_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_1_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_1_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_2_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_2_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_2_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_2_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_2_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_2_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_2_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_2_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_2_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_2_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_2_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_2_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_2_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_2_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_3_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_3_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_3_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_3_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_3_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_3_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_3_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_3_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_0_3_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_0_3_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_0_3_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_3_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_0_3_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_3_lz;
  ccs_DUT_wrapper                                                              peaseNTT_INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__0__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__1__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__2__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__3__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__4__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__5__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__6__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<7,32,128 >                                    xt_rsc_0__7__INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   r_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_1_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_1_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__1__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_2_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_2_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__2__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_3_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_0_3_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__3__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__1__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__2__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER;
  ccs_axi4_slave_mem_trans_rsc<256,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__3__INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_xt;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_out_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_xt;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_3_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_4_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_5_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_6_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_7_lz_INST;
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
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_staller_inst_core_wen;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_s_raddr_core_sct;
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
    , CCS_CLK_CTOR(clk, "clk", 5, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 110.000000, false)
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
    , TLS_r_rsc_dat("TLS_r_rsc_dat")
    , TLS_r_rsc_triosy_lz("TLS_r_rsc_triosy_lz")
    , TLS_twiddle_rsc_0_0_s_tdone("TLS_twiddle_rsc_0_0_s_tdone")
    , TLS_twiddle_rsc_0_0_tr_write_done("TLS_twiddle_rsc_0_0_tr_write_done")
    , TLS_twiddle_rsc_0_0_RREADY("TLS_twiddle_rsc_0_0_RREADY")
    , TLS_twiddle_rsc_0_0_RVALID("TLS_twiddle_rsc_0_0_RVALID")
    , TLS_twiddle_rsc_0_0_RUSER("TLS_twiddle_rsc_0_0_RUSER")
    , TLS_twiddle_rsc_0_0_RLAST("TLS_twiddle_rsc_0_0_RLAST")
    , TLS_twiddle_rsc_0_0_RRESP("TLS_twiddle_rsc_0_0_RRESP")
    , TLS_twiddle_rsc_0_0_RDATA("TLS_twiddle_rsc_0_0_RDATA")
    , TLS_twiddle_rsc_0_0_RID("TLS_twiddle_rsc_0_0_RID")
    , TLS_twiddle_rsc_0_0_ARREADY("TLS_twiddle_rsc_0_0_ARREADY")
    , TLS_twiddle_rsc_0_0_ARVALID("TLS_twiddle_rsc_0_0_ARVALID")
    , TLS_twiddle_rsc_0_0_ARUSER("TLS_twiddle_rsc_0_0_ARUSER")
    , TLS_twiddle_rsc_0_0_ARREGION("TLS_twiddle_rsc_0_0_ARREGION")
    , TLS_twiddle_rsc_0_0_ARQOS("TLS_twiddle_rsc_0_0_ARQOS")
    , TLS_twiddle_rsc_0_0_ARPROT("TLS_twiddle_rsc_0_0_ARPROT")
    , TLS_twiddle_rsc_0_0_ARCACHE("TLS_twiddle_rsc_0_0_ARCACHE")
    , TLS_twiddle_rsc_0_0_ARLOCK("TLS_twiddle_rsc_0_0_ARLOCK")
    , TLS_twiddle_rsc_0_0_ARBURST("TLS_twiddle_rsc_0_0_ARBURST")
    , TLS_twiddle_rsc_0_0_ARSIZE("TLS_twiddle_rsc_0_0_ARSIZE")
    , TLS_twiddle_rsc_0_0_ARLEN("TLS_twiddle_rsc_0_0_ARLEN")
    , TLS_twiddle_rsc_0_0_ARADDR("TLS_twiddle_rsc_0_0_ARADDR")
    , TLS_twiddle_rsc_0_0_ARID("TLS_twiddle_rsc_0_0_ARID")
    , TLS_twiddle_rsc_0_0_BREADY("TLS_twiddle_rsc_0_0_BREADY")
    , TLS_twiddle_rsc_0_0_BVALID("TLS_twiddle_rsc_0_0_BVALID")
    , TLS_twiddle_rsc_0_0_BUSER("TLS_twiddle_rsc_0_0_BUSER")
    , TLS_twiddle_rsc_0_0_BRESP("TLS_twiddle_rsc_0_0_BRESP")
    , TLS_twiddle_rsc_0_0_BID("TLS_twiddle_rsc_0_0_BID")
    , TLS_twiddle_rsc_0_0_WREADY("TLS_twiddle_rsc_0_0_WREADY")
    , TLS_twiddle_rsc_0_0_WVALID("TLS_twiddle_rsc_0_0_WVALID")
    , TLS_twiddle_rsc_0_0_WUSER("TLS_twiddle_rsc_0_0_WUSER")
    , TLS_twiddle_rsc_0_0_WLAST("TLS_twiddle_rsc_0_0_WLAST")
    , TLS_twiddle_rsc_0_0_WSTRB("TLS_twiddle_rsc_0_0_WSTRB")
    , TLS_twiddle_rsc_0_0_WDATA("TLS_twiddle_rsc_0_0_WDATA")
    , TLS_twiddle_rsc_0_0_AWREADY("TLS_twiddle_rsc_0_0_AWREADY")
    , TLS_twiddle_rsc_0_0_AWVALID("TLS_twiddle_rsc_0_0_AWVALID")
    , TLS_twiddle_rsc_0_0_AWUSER("TLS_twiddle_rsc_0_0_AWUSER")
    , TLS_twiddle_rsc_0_0_AWREGION("TLS_twiddle_rsc_0_0_AWREGION")
    , TLS_twiddle_rsc_0_0_AWQOS("TLS_twiddle_rsc_0_0_AWQOS")
    , TLS_twiddle_rsc_0_0_AWPROT("TLS_twiddle_rsc_0_0_AWPROT")
    , TLS_twiddle_rsc_0_0_AWCACHE("TLS_twiddle_rsc_0_0_AWCACHE")
    , TLS_twiddle_rsc_0_0_AWLOCK("TLS_twiddle_rsc_0_0_AWLOCK")
    , TLS_twiddle_rsc_0_0_AWBURST("TLS_twiddle_rsc_0_0_AWBURST")
    , TLS_twiddle_rsc_0_0_AWSIZE("TLS_twiddle_rsc_0_0_AWSIZE")
    , TLS_twiddle_rsc_0_0_AWLEN("TLS_twiddle_rsc_0_0_AWLEN")
    , TLS_twiddle_rsc_0_0_AWADDR("TLS_twiddle_rsc_0_0_AWADDR")
    , TLS_twiddle_rsc_0_0_AWID("TLS_twiddle_rsc_0_0_AWID")
    , TLS_twiddle_rsc_triosy_0_0_lz("TLS_twiddle_rsc_triosy_0_0_lz")
    , TLS_twiddle_rsc_0_1_s_tdone("TLS_twiddle_rsc_0_1_s_tdone")
    , TLS_twiddle_rsc_0_1_tr_write_done("TLS_twiddle_rsc_0_1_tr_write_done")
    , TLS_twiddle_rsc_0_1_RREADY("TLS_twiddle_rsc_0_1_RREADY")
    , TLS_twiddle_rsc_0_1_RVALID("TLS_twiddle_rsc_0_1_RVALID")
    , TLS_twiddle_rsc_0_1_RUSER("TLS_twiddle_rsc_0_1_RUSER")
    , TLS_twiddle_rsc_0_1_RLAST("TLS_twiddle_rsc_0_1_RLAST")
    , TLS_twiddle_rsc_0_1_RRESP("TLS_twiddle_rsc_0_1_RRESP")
    , TLS_twiddle_rsc_0_1_RDATA("TLS_twiddle_rsc_0_1_RDATA")
    , TLS_twiddle_rsc_0_1_RID("TLS_twiddle_rsc_0_1_RID")
    , TLS_twiddle_rsc_0_1_ARREADY("TLS_twiddle_rsc_0_1_ARREADY")
    , TLS_twiddle_rsc_0_1_ARVALID("TLS_twiddle_rsc_0_1_ARVALID")
    , TLS_twiddle_rsc_0_1_ARUSER("TLS_twiddle_rsc_0_1_ARUSER")
    , TLS_twiddle_rsc_0_1_ARREGION("TLS_twiddle_rsc_0_1_ARREGION")
    , TLS_twiddle_rsc_0_1_ARQOS("TLS_twiddle_rsc_0_1_ARQOS")
    , TLS_twiddle_rsc_0_1_ARPROT("TLS_twiddle_rsc_0_1_ARPROT")
    , TLS_twiddle_rsc_0_1_ARCACHE("TLS_twiddle_rsc_0_1_ARCACHE")
    , TLS_twiddle_rsc_0_1_ARLOCK("TLS_twiddle_rsc_0_1_ARLOCK")
    , TLS_twiddle_rsc_0_1_ARBURST("TLS_twiddle_rsc_0_1_ARBURST")
    , TLS_twiddle_rsc_0_1_ARSIZE("TLS_twiddle_rsc_0_1_ARSIZE")
    , TLS_twiddle_rsc_0_1_ARLEN("TLS_twiddle_rsc_0_1_ARLEN")
    , TLS_twiddle_rsc_0_1_ARADDR("TLS_twiddle_rsc_0_1_ARADDR")
    , TLS_twiddle_rsc_0_1_ARID("TLS_twiddle_rsc_0_1_ARID")
    , TLS_twiddle_rsc_0_1_BREADY("TLS_twiddle_rsc_0_1_BREADY")
    , TLS_twiddle_rsc_0_1_BVALID("TLS_twiddle_rsc_0_1_BVALID")
    , TLS_twiddle_rsc_0_1_BUSER("TLS_twiddle_rsc_0_1_BUSER")
    , TLS_twiddle_rsc_0_1_BRESP("TLS_twiddle_rsc_0_1_BRESP")
    , TLS_twiddle_rsc_0_1_BID("TLS_twiddle_rsc_0_1_BID")
    , TLS_twiddle_rsc_0_1_WREADY("TLS_twiddle_rsc_0_1_WREADY")
    , TLS_twiddle_rsc_0_1_WVALID("TLS_twiddle_rsc_0_1_WVALID")
    , TLS_twiddle_rsc_0_1_WUSER("TLS_twiddle_rsc_0_1_WUSER")
    , TLS_twiddle_rsc_0_1_WLAST("TLS_twiddle_rsc_0_1_WLAST")
    , TLS_twiddle_rsc_0_1_WSTRB("TLS_twiddle_rsc_0_1_WSTRB")
    , TLS_twiddle_rsc_0_1_WDATA("TLS_twiddle_rsc_0_1_WDATA")
    , TLS_twiddle_rsc_0_1_AWREADY("TLS_twiddle_rsc_0_1_AWREADY")
    , TLS_twiddle_rsc_0_1_AWVALID("TLS_twiddle_rsc_0_1_AWVALID")
    , TLS_twiddle_rsc_0_1_AWUSER("TLS_twiddle_rsc_0_1_AWUSER")
    , TLS_twiddle_rsc_0_1_AWREGION("TLS_twiddle_rsc_0_1_AWREGION")
    , TLS_twiddle_rsc_0_1_AWQOS("TLS_twiddle_rsc_0_1_AWQOS")
    , TLS_twiddle_rsc_0_1_AWPROT("TLS_twiddle_rsc_0_1_AWPROT")
    , TLS_twiddle_rsc_0_1_AWCACHE("TLS_twiddle_rsc_0_1_AWCACHE")
    , TLS_twiddle_rsc_0_1_AWLOCK("TLS_twiddle_rsc_0_1_AWLOCK")
    , TLS_twiddle_rsc_0_1_AWBURST("TLS_twiddle_rsc_0_1_AWBURST")
    , TLS_twiddle_rsc_0_1_AWSIZE("TLS_twiddle_rsc_0_1_AWSIZE")
    , TLS_twiddle_rsc_0_1_AWLEN("TLS_twiddle_rsc_0_1_AWLEN")
    , TLS_twiddle_rsc_0_1_AWADDR("TLS_twiddle_rsc_0_1_AWADDR")
    , TLS_twiddle_rsc_0_1_AWID("TLS_twiddle_rsc_0_1_AWID")
    , TLS_twiddle_rsc_triosy_0_1_lz("TLS_twiddle_rsc_triosy_0_1_lz")
    , TLS_twiddle_rsc_0_2_s_tdone("TLS_twiddle_rsc_0_2_s_tdone")
    , TLS_twiddle_rsc_0_2_tr_write_done("TLS_twiddle_rsc_0_2_tr_write_done")
    , TLS_twiddle_rsc_0_2_RREADY("TLS_twiddle_rsc_0_2_RREADY")
    , TLS_twiddle_rsc_0_2_RVALID("TLS_twiddle_rsc_0_2_RVALID")
    , TLS_twiddle_rsc_0_2_RUSER("TLS_twiddle_rsc_0_2_RUSER")
    , TLS_twiddle_rsc_0_2_RLAST("TLS_twiddle_rsc_0_2_RLAST")
    , TLS_twiddle_rsc_0_2_RRESP("TLS_twiddle_rsc_0_2_RRESP")
    , TLS_twiddle_rsc_0_2_RDATA("TLS_twiddle_rsc_0_2_RDATA")
    , TLS_twiddle_rsc_0_2_RID("TLS_twiddle_rsc_0_2_RID")
    , TLS_twiddle_rsc_0_2_ARREADY("TLS_twiddle_rsc_0_2_ARREADY")
    , TLS_twiddle_rsc_0_2_ARVALID("TLS_twiddle_rsc_0_2_ARVALID")
    , TLS_twiddle_rsc_0_2_ARUSER("TLS_twiddle_rsc_0_2_ARUSER")
    , TLS_twiddle_rsc_0_2_ARREGION("TLS_twiddle_rsc_0_2_ARREGION")
    , TLS_twiddle_rsc_0_2_ARQOS("TLS_twiddle_rsc_0_2_ARQOS")
    , TLS_twiddle_rsc_0_2_ARPROT("TLS_twiddle_rsc_0_2_ARPROT")
    , TLS_twiddle_rsc_0_2_ARCACHE("TLS_twiddle_rsc_0_2_ARCACHE")
    , TLS_twiddle_rsc_0_2_ARLOCK("TLS_twiddle_rsc_0_2_ARLOCK")
    , TLS_twiddle_rsc_0_2_ARBURST("TLS_twiddle_rsc_0_2_ARBURST")
    , TLS_twiddle_rsc_0_2_ARSIZE("TLS_twiddle_rsc_0_2_ARSIZE")
    , TLS_twiddle_rsc_0_2_ARLEN("TLS_twiddle_rsc_0_2_ARLEN")
    , TLS_twiddle_rsc_0_2_ARADDR("TLS_twiddle_rsc_0_2_ARADDR")
    , TLS_twiddle_rsc_0_2_ARID("TLS_twiddle_rsc_0_2_ARID")
    , TLS_twiddle_rsc_0_2_BREADY("TLS_twiddle_rsc_0_2_BREADY")
    , TLS_twiddle_rsc_0_2_BVALID("TLS_twiddle_rsc_0_2_BVALID")
    , TLS_twiddle_rsc_0_2_BUSER("TLS_twiddle_rsc_0_2_BUSER")
    , TLS_twiddle_rsc_0_2_BRESP("TLS_twiddle_rsc_0_2_BRESP")
    , TLS_twiddle_rsc_0_2_BID("TLS_twiddle_rsc_0_2_BID")
    , TLS_twiddle_rsc_0_2_WREADY("TLS_twiddle_rsc_0_2_WREADY")
    , TLS_twiddle_rsc_0_2_WVALID("TLS_twiddle_rsc_0_2_WVALID")
    , TLS_twiddle_rsc_0_2_WUSER("TLS_twiddle_rsc_0_2_WUSER")
    , TLS_twiddle_rsc_0_2_WLAST("TLS_twiddle_rsc_0_2_WLAST")
    , TLS_twiddle_rsc_0_2_WSTRB("TLS_twiddle_rsc_0_2_WSTRB")
    , TLS_twiddle_rsc_0_2_WDATA("TLS_twiddle_rsc_0_2_WDATA")
    , TLS_twiddle_rsc_0_2_AWREADY("TLS_twiddle_rsc_0_2_AWREADY")
    , TLS_twiddle_rsc_0_2_AWVALID("TLS_twiddle_rsc_0_2_AWVALID")
    , TLS_twiddle_rsc_0_2_AWUSER("TLS_twiddle_rsc_0_2_AWUSER")
    , TLS_twiddle_rsc_0_2_AWREGION("TLS_twiddle_rsc_0_2_AWREGION")
    , TLS_twiddle_rsc_0_2_AWQOS("TLS_twiddle_rsc_0_2_AWQOS")
    , TLS_twiddle_rsc_0_2_AWPROT("TLS_twiddle_rsc_0_2_AWPROT")
    , TLS_twiddle_rsc_0_2_AWCACHE("TLS_twiddle_rsc_0_2_AWCACHE")
    , TLS_twiddle_rsc_0_2_AWLOCK("TLS_twiddle_rsc_0_2_AWLOCK")
    , TLS_twiddle_rsc_0_2_AWBURST("TLS_twiddle_rsc_0_2_AWBURST")
    , TLS_twiddle_rsc_0_2_AWSIZE("TLS_twiddle_rsc_0_2_AWSIZE")
    , TLS_twiddle_rsc_0_2_AWLEN("TLS_twiddle_rsc_0_2_AWLEN")
    , TLS_twiddle_rsc_0_2_AWADDR("TLS_twiddle_rsc_0_2_AWADDR")
    , TLS_twiddle_rsc_0_2_AWID("TLS_twiddle_rsc_0_2_AWID")
    , TLS_twiddle_rsc_triosy_0_2_lz("TLS_twiddle_rsc_triosy_0_2_lz")
    , TLS_twiddle_rsc_0_3_s_tdone("TLS_twiddle_rsc_0_3_s_tdone")
    , TLS_twiddle_rsc_0_3_tr_write_done("TLS_twiddle_rsc_0_3_tr_write_done")
    , TLS_twiddle_rsc_0_3_RREADY("TLS_twiddle_rsc_0_3_RREADY")
    , TLS_twiddle_rsc_0_3_RVALID("TLS_twiddle_rsc_0_3_RVALID")
    , TLS_twiddle_rsc_0_3_RUSER("TLS_twiddle_rsc_0_3_RUSER")
    , TLS_twiddle_rsc_0_3_RLAST("TLS_twiddle_rsc_0_3_RLAST")
    , TLS_twiddle_rsc_0_3_RRESP("TLS_twiddle_rsc_0_3_RRESP")
    , TLS_twiddle_rsc_0_3_RDATA("TLS_twiddle_rsc_0_3_RDATA")
    , TLS_twiddle_rsc_0_3_RID("TLS_twiddle_rsc_0_3_RID")
    , TLS_twiddle_rsc_0_3_ARREADY("TLS_twiddle_rsc_0_3_ARREADY")
    , TLS_twiddle_rsc_0_3_ARVALID("TLS_twiddle_rsc_0_3_ARVALID")
    , TLS_twiddle_rsc_0_3_ARUSER("TLS_twiddle_rsc_0_3_ARUSER")
    , TLS_twiddle_rsc_0_3_ARREGION("TLS_twiddle_rsc_0_3_ARREGION")
    , TLS_twiddle_rsc_0_3_ARQOS("TLS_twiddle_rsc_0_3_ARQOS")
    , TLS_twiddle_rsc_0_3_ARPROT("TLS_twiddle_rsc_0_3_ARPROT")
    , TLS_twiddle_rsc_0_3_ARCACHE("TLS_twiddle_rsc_0_3_ARCACHE")
    , TLS_twiddle_rsc_0_3_ARLOCK("TLS_twiddle_rsc_0_3_ARLOCK")
    , TLS_twiddle_rsc_0_3_ARBURST("TLS_twiddle_rsc_0_3_ARBURST")
    , TLS_twiddle_rsc_0_3_ARSIZE("TLS_twiddle_rsc_0_3_ARSIZE")
    , TLS_twiddle_rsc_0_3_ARLEN("TLS_twiddle_rsc_0_3_ARLEN")
    , TLS_twiddle_rsc_0_3_ARADDR("TLS_twiddle_rsc_0_3_ARADDR")
    , TLS_twiddle_rsc_0_3_ARID("TLS_twiddle_rsc_0_3_ARID")
    , TLS_twiddle_rsc_0_3_BREADY("TLS_twiddle_rsc_0_3_BREADY")
    , TLS_twiddle_rsc_0_3_BVALID("TLS_twiddle_rsc_0_3_BVALID")
    , TLS_twiddle_rsc_0_3_BUSER("TLS_twiddle_rsc_0_3_BUSER")
    , TLS_twiddle_rsc_0_3_BRESP("TLS_twiddle_rsc_0_3_BRESP")
    , TLS_twiddle_rsc_0_3_BID("TLS_twiddle_rsc_0_3_BID")
    , TLS_twiddle_rsc_0_3_WREADY("TLS_twiddle_rsc_0_3_WREADY")
    , TLS_twiddle_rsc_0_3_WVALID("TLS_twiddle_rsc_0_3_WVALID")
    , TLS_twiddle_rsc_0_3_WUSER("TLS_twiddle_rsc_0_3_WUSER")
    , TLS_twiddle_rsc_0_3_WLAST("TLS_twiddle_rsc_0_3_WLAST")
    , TLS_twiddle_rsc_0_3_WSTRB("TLS_twiddle_rsc_0_3_WSTRB")
    , TLS_twiddle_rsc_0_3_WDATA("TLS_twiddle_rsc_0_3_WDATA")
    , TLS_twiddle_rsc_0_3_AWREADY("TLS_twiddle_rsc_0_3_AWREADY")
    , TLS_twiddle_rsc_0_3_AWVALID("TLS_twiddle_rsc_0_3_AWVALID")
    , TLS_twiddle_rsc_0_3_AWUSER("TLS_twiddle_rsc_0_3_AWUSER")
    , TLS_twiddle_rsc_0_3_AWREGION("TLS_twiddle_rsc_0_3_AWREGION")
    , TLS_twiddle_rsc_0_3_AWQOS("TLS_twiddle_rsc_0_3_AWQOS")
    , TLS_twiddle_rsc_0_3_AWPROT("TLS_twiddle_rsc_0_3_AWPROT")
    , TLS_twiddle_rsc_0_3_AWCACHE("TLS_twiddle_rsc_0_3_AWCACHE")
    , TLS_twiddle_rsc_0_3_AWLOCK("TLS_twiddle_rsc_0_3_AWLOCK")
    , TLS_twiddle_rsc_0_3_AWBURST("TLS_twiddle_rsc_0_3_AWBURST")
    , TLS_twiddle_rsc_0_3_AWSIZE("TLS_twiddle_rsc_0_3_AWSIZE")
    , TLS_twiddle_rsc_0_3_AWLEN("TLS_twiddle_rsc_0_3_AWLEN")
    , TLS_twiddle_rsc_0_3_AWADDR("TLS_twiddle_rsc_0_3_AWADDR")
    , TLS_twiddle_rsc_0_3_AWID("TLS_twiddle_rsc_0_3_AWID")
    , TLS_twiddle_rsc_triosy_0_3_lz("TLS_twiddle_rsc_triosy_0_3_lz")
    , TLS_twiddle_h_rsc_0_0_s_tdone("TLS_twiddle_h_rsc_0_0_s_tdone")
    , TLS_twiddle_h_rsc_0_0_tr_write_done("TLS_twiddle_h_rsc_0_0_tr_write_done")
    , TLS_twiddle_h_rsc_0_0_RREADY("TLS_twiddle_h_rsc_0_0_RREADY")
    , TLS_twiddle_h_rsc_0_0_RVALID("TLS_twiddle_h_rsc_0_0_RVALID")
    , TLS_twiddle_h_rsc_0_0_RUSER("TLS_twiddle_h_rsc_0_0_RUSER")
    , TLS_twiddle_h_rsc_0_0_RLAST("TLS_twiddle_h_rsc_0_0_RLAST")
    , TLS_twiddle_h_rsc_0_0_RRESP("TLS_twiddle_h_rsc_0_0_RRESP")
    , TLS_twiddle_h_rsc_0_0_RDATA("TLS_twiddle_h_rsc_0_0_RDATA")
    , TLS_twiddle_h_rsc_0_0_RID("TLS_twiddle_h_rsc_0_0_RID")
    , TLS_twiddle_h_rsc_0_0_ARREADY("TLS_twiddle_h_rsc_0_0_ARREADY")
    , TLS_twiddle_h_rsc_0_0_ARVALID("TLS_twiddle_h_rsc_0_0_ARVALID")
    , TLS_twiddle_h_rsc_0_0_ARUSER("TLS_twiddle_h_rsc_0_0_ARUSER")
    , TLS_twiddle_h_rsc_0_0_ARREGION("TLS_twiddle_h_rsc_0_0_ARREGION")
    , TLS_twiddle_h_rsc_0_0_ARQOS("TLS_twiddle_h_rsc_0_0_ARQOS")
    , TLS_twiddle_h_rsc_0_0_ARPROT("TLS_twiddle_h_rsc_0_0_ARPROT")
    , TLS_twiddle_h_rsc_0_0_ARCACHE("TLS_twiddle_h_rsc_0_0_ARCACHE")
    , TLS_twiddle_h_rsc_0_0_ARLOCK("TLS_twiddle_h_rsc_0_0_ARLOCK")
    , TLS_twiddle_h_rsc_0_0_ARBURST("TLS_twiddle_h_rsc_0_0_ARBURST")
    , TLS_twiddle_h_rsc_0_0_ARSIZE("TLS_twiddle_h_rsc_0_0_ARSIZE")
    , TLS_twiddle_h_rsc_0_0_ARLEN("TLS_twiddle_h_rsc_0_0_ARLEN")
    , TLS_twiddle_h_rsc_0_0_ARADDR("TLS_twiddle_h_rsc_0_0_ARADDR")
    , TLS_twiddle_h_rsc_0_0_ARID("TLS_twiddle_h_rsc_0_0_ARID")
    , TLS_twiddle_h_rsc_0_0_BREADY("TLS_twiddle_h_rsc_0_0_BREADY")
    , TLS_twiddle_h_rsc_0_0_BVALID("TLS_twiddle_h_rsc_0_0_BVALID")
    , TLS_twiddle_h_rsc_0_0_BUSER("TLS_twiddle_h_rsc_0_0_BUSER")
    , TLS_twiddle_h_rsc_0_0_BRESP("TLS_twiddle_h_rsc_0_0_BRESP")
    , TLS_twiddle_h_rsc_0_0_BID("TLS_twiddle_h_rsc_0_0_BID")
    , TLS_twiddle_h_rsc_0_0_WREADY("TLS_twiddle_h_rsc_0_0_WREADY")
    , TLS_twiddle_h_rsc_0_0_WVALID("TLS_twiddle_h_rsc_0_0_WVALID")
    , TLS_twiddle_h_rsc_0_0_WUSER("TLS_twiddle_h_rsc_0_0_WUSER")
    , TLS_twiddle_h_rsc_0_0_WLAST("TLS_twiddle_h_rsc_0_0_WLAST")
    , TLS_twiddle_h_rsc_0_0_WSTRB("TLS_twiddle_h_rsc_0_0_WSTRB")
    , TLS_twiddle_h_rsc_0_0_WDATA("TLS_twiddle_h_rsc_0_0_WDATA")
    , TLS_twiddle_h_rsc_0_0_AWREADY("TLS_twiddle_h_rsc_0_0_AWREADY")
    , TLS_twiddle_h_rsc_0_0_AWVALID("TLS_twiddle_h_rsc_0_0_AWVALID")
    , TLS_twiddle_h_rsc_0_0_AWUSER("TLS_twiddle_h_rsc_0_0_AWUSER")
    , TLS_twiddle_h_rsc_0_0_AWREGION("TLS_twiddle_h_rsc_0_0_AWREGION")
    , TLS_twiddle_h_rsc_0_0_AWQOS("TLS_twiddle_h_rsc_0_0_AWQOS")
    , TLS_twiddle_h_rsc_0_0_AWPROT("TLS_twiddle_h_rsc_0_0_AWPROT")
    , TLS_twiddle_h_rsc_0_0_AWCACHE("TLS_twiddle_h_rsc_0_0_AWCACHE")
    , TLS_twiddle_h_rsc_0_0_AWLOCK("TLS_twiddle_h_rsc_0_0_AWLOCK")
    , TLS_twiddle_h_rsc_0_0_AWBURST("TLS_twiddle_h_rsc_0_0_AWBURST")
    , TLS_twiddle_h_rsc_0_0_AWSIZE("TLS_twiddle_h_rsc_0_0_AWSIZE")
    , TLS_twiddle_h_rsc_0_0_AWLEN("TLS_twiddle_h_rsc_0_0_AWLEN")
    , TLS_twiddle_h_rsc_0_0_AWADDR("TLS_twiddle_h_rsc_0_0_AWADDR")
    , TLS_twiddle_h_rsc_0_0_AWID("TLS_twiddle_h_rsc_0_0_AWID")
    , TLS_twiddle_h_rsc_triosy_0_0_lz("TLS_twiddle_h_rsc_triosy_0_0_lz")
    , TLS_twiddle_h_rsc_0_1_s_tdone("TLS_twiddle_h_rsc_0_1_s_tdone")
    , TLS_twiddle_h_rsc_0_1_tr_write_done("TLS_twiddle_h_rsc_0_1_tr_write_done")
    , TLS_twiddle_h_rsc_0_1_RREADY("TLS_twiddle_h_rsc_0_1_RREADY")
    , TLS_twiddle_h_rsc_0_1_RVALID("TLS_twiddle_h_rsc_0_1_RVALID")
    , TLS_twiddle_h_rsc_0_1_RUSER("TLS_twiddle_h_rsc_0_1_RUSER")
    , TLS_twiddle_h_rsc_0_1_RLAST("TLS_twiddle_h_rsc_0_1_RLAST")
    , TLS_twiddle_h_rsc_0_1_RRESP("TLS_twiddle_h_rsc_0_1_RRESP")
    , TLS_twiddle_h_rsc_0_1_RDATA("TLS_twiddle_h_rsc_0_1_RDATA")
    , TLS_twiddle_h_rsc_0_1_RID("TLS_twiddle_h_rsc_0_1_RID")
    , TLS_twiddle_h_rsc_0_1_ARREADY("TLS_twiddle_h_rsc_0_1_ARREADY")
    , TLS_twiddle_h_rsc_0_1_ARVALID("TLS_twiddle_h_rsc_0_1_ARVALID")
    , TLS_twiddle_h_rsc_0_1_ARUSER("TLS_twiddle_h_rsc_0_1_ARUSER")
    , TLS_twiddle_h_rsc_0_1_ARREGION("TLS_twiddle_h_rsc_0_1_ARREGION")
    , TLS_twiddle_h_rsc_0_1_ARQOS("TLS_twiddle_h_rsc_0_1_ARQOS")
    , TLS_twiddle_h_rsc_0_1_ARPROT("TLS_twiddle_h_rsc_0_1_ARPROT")
    , TLS_twiddle_h_rsc_0_1_ARCACHE("TLS_twiddle_h_rsc_0_1_ARCACHE")
    , TLS_twiddle_h_rsc_0_1_ARLOCK("TLS_twiddle_h_rsc_0_1_ARLOCK")
    , TLS_twiddle_h_rsc_0_1_ARBURST("TLS_twiddle_h_rsc_0_1_ARBURST")
    , TLS_twiddle_h_rsc_0_1_ARSIZE("TLS_twiddle_h_rsc_0_1_ARSIZE")
    , TLS_twiddle_h_rsc_0_1_ARLEN("TLS_twiddle_h_rsc_0_1_ARLEN")
    , TLS_twiddle_h_rsc_0_1_ARADDR("TLS_twiddle_h_rsc_0_1_ARADDR")
    , TLS_twiddle_h_rsc_0_1_ARID("TLS_twiddle_h_rsc_0_1_ARID")
    , TLS_twiddle_h_rsc_0_1_BREADY("TLS_twiddle_h_rsc_0_1_BREADY")
    , TLS_twiddle_h_rsc_0_1_BVALID("TLS_twiddle_h_rsc_0_1_BVALID")
    , TLS_twiddle_h_rsc_0_1_BUSER("TLS_twiddle_h_rsc_0_1_BUSER")
    , TLS_twiddle_h_rsc_0_1_BRESP("TLS_twiddle_h_rsc_0_1_BRESP")
    , TLS_twiddle_h_rsc_0_1_BID("TLS_twiddle_h_rsc_0_1_BID")
    , TLS_twiddle_h_rsc_0_1_WREADY("TLS_twiddle_h_rsc_0_1_WREADY")
    , TLS_twiddle_h_rsc_0_1_WVALID("TLS_twiddle_h_rsc_0_1_WVALID")
    , TLS_twiddle_h_rsc_0_1_WUSER("TLS_twiddle_h_rsc_0_1_WUSER")
    , TLS_twiddle_h_rsc_0_1_WLAST("TLS_twiddle_h_rsc_0_1_WLAST")
    , TLS_twiddle_h_rsc_0_1_WSTRB("TLS_twiddle_h_rsc_0_1_WSTRB")
    , TLS_twiddle_h_rsc_0_1_WDATA("TLS_twiddle_h_rsc_0_1_WDATA")
    , TLS_twiddle_h_rsc_0_1_AWREADY("TLS_twiddle_h_rsc_0_1_AWREADY")
    , TLS_twiddle_h_rsc_0_1_AWVALID("TLS_twiddle_h_rsc_0_1_AWVALID")
    , TLS_twiddle_h_rsc_0_1_AWUSER("TLS_twiddle_h_rsc_0_1_AWUSER")
    , TLS_twiddle_h_rsc_0_1_AWREGION("TLS_twiddle_h_rsc_0_1_AWREGION")
    , TLS_twiddle_h_rsc_0_1_AWQOS("TLS_twiddle_h_rsc_0_1_AWQOS")
    , TLS_twiddle_h_rsc_0_1_AWPROT("TLS_twiddle_h_rsc_0_1_AWPROT")
    , TLS_twiddle_h_rsc_0_1_AWCACHE("TLS_twiddle_h_rsc_0_1_AWCACHE")
    , TLS_twiddle_h_rsc_0_1_AWLOCK("TLS_twiddle_h_rsc_0_1_AWLOCK")
    , TLS_twiddle_h_rsc_0_1_AWBURST("TLS_twiddle_h_rsc_0_1_AWBURST")
    , TLS_twiddle_h_rsc_0_1_AWSIZE("TLS_twiddle_h_rsc_0_1_AWSIZE")
    , TLS_twiddle_h_rsc_0_1_AWLEN("TLS_twiddle_h_rsc_0_1_AWLEN")
    , TLS_twiddle_h_rsc_0_1_AWADDR("TLS_twiddle_h_rsc_0_1_AWADDR")
    , TLS_twiddle_h_rsc_0_1_AWID("TLS_twiddle_h_rsc_0_1_AWID")
    , TLS_twiddle_h_rsc_triosy_0_1_lz("TLS_twiddle_h_rsc_triosy_0_1_lz")
    , TLS_twiddle_h_rsc_0_2_s_tdone("TLS_twiddle_h_rsc_0_2_s_tdone")
    , TLS_twiddle_h_rsc_0_2_tr_write_done("TLS_twiddle_h_rsc_0_2_tr_write_done")
    , TLS_twiddle_h_rsc_0_2_RREADY("TLS_twiddle_h_rsc_0_2_RREADY")
    , TLS_twiddle_h_rsc_0_2_RVALID("TLS_twiddle_h_rsc_0_2_RVALID")
    , TLS_twiddle_h_rsc_0_2_RUSER("TLS_twiddle_h_rsc_0_2_RUSER")
    , TLS_twiddle_h_rsc_0_2_RLAST("TLS_twiddle_h_rsc_0_2_RLAST")
    , TLS_twiddle_h_rsc_0_2_RRESP("TLS_twiddle_h_rsc_0_2_RRESP")
    , TLS_twiddle_h_rsc_0_2_RDATA("TLS_twiddle_h_rsc_0_2_RDATA")
    , TLS_twiddle_h_rsc_0_2_RID("TLS_twiddle_h_rsc_0_2_RID")
    , TLS_twiddle_h_rsc_0_2_ARREADY("TLS_twiddle_h_rsc_0_2_ARREADY")
    , TLS_twiddle_h_rsc_0_2_ARVALID("TLS_twiddle_h_rsc_0_2_ARVALID")
    , TLS_twiddle_h_rsc_0_2_ARUSER("TLS_twiddle_h_rsc_0_2_ARUSER")
    , TLS_twiddle_h_rsc_0_2_ARREGION("TLS_twiddle_h_rsc_0_2_ARREGION")
    , TLS_twiddle_h_rsc_0_2_ARQOS("TLS_twiddle_h_rsc_0_2_ARQOS")
    , TLS_twiddle_h_rsc_0_2_ARPROT("TLS_twiddle_h_rsc_0_2_ARPROT")
    , TLS_twiddle_h_rsc_0_2_ARCACHE("TLS_twiddle_h_rsc_0_2_ARCACHE")
    , TLS_twiddle_h_rsc_0_2_ARLOCK("TLS_twiddle_h_rsc_0_2_ARLOCK")
    , TLS_twiddle_h_rsc_0_2_ARBURST("TLS_twiddle_h_rsc_0_2_ARBURST")
    , TLS_twiddle_h_rsc_0_2_ARSIZE("TLS_twiddle_h_rsc_0_2_ARSIZE")
    , TLS_twiddle_h_rsc_0_2_ARLEN("TLS_twiddle_h_rsc_0_2_ARLEN")
    , TLS_twiddle_h_rsc_0_2_ARADDR("TLS_twiddle_h_rsc_0_2_ARADDR")
    , TLS_twiddle_h_rsc_0_2_ARID("TLS_twiddle_h_rsc_0_2_ARID")
    , TLS_twiddle_h_rsc_0_2_BREADY("TLS_twiddle_h_rsc_0_2_BREADY")
    , TLS_twiddle_h_rsc_0_2_BVALID("TLS_twiddle_h_rsc_0_2_BVALID")
    , TLS_twiddle_h_rsc_0_2_BUSER("TLS_twiddle_h_rsc_0_2_BUSER")
    , TLS_twiddle_h_rsc_0_2_BRESP("TLS_twiddle_h_rsc_0_2_BRESP")
    , TLS_twiddle_h_rsc_0_2_BID("TLS_twiddle_h_rsc_0_2_BID")
    , TLS_twiddle_h_rsc_0_2_WREADY("TLS_twiddle_h_rsc_0_2_WREADY")
    , TLS_twiddle_h_rsc_0_2_WVALID("TLS_twiddle_h_rsc_0_2_WVALID")
    , TLS_twiddle_h_rsc_0_2_WUSER("TLS_twiddle_h_rsc_0_2_WUSER")
    , TLS_twiddle_h_rsc_0_2_WLAST("TLS_twiddle_h_rsc_0_2_WLAST")
    , TLS_twiddle_h_rsc_0_2_WSTRB("TLS_twiddle_h_rsc_0_2_WSTRB")
    , TLS_twiddle_h_rsc_0_2_WDATA("TLS_twiddle_h_rsc_0_2_WDATA")
    , TLS_twiddle_h_rsc_0_2_AWREADY("TLS_twiddle_h_rsc_0_2_AWREADY")
    , TLS_twiddle_h_rsc_0_2_AWVALID("TLS_twiddle_h_rsc_0_2_AWVALID")
    , TLS_twiddle_h_rsc_0_2_AWUSER("TLS_twiddle_h_rsc_0_2_AWUSER")
    , TLS_twiddle_h_rsc_0_2_AWREGION("TLS_twiddle_h_rsc_0_2_AWREGION")
    , TLS_twiddle_h_rsc_0_2_AWQOS("TLS_twiddle_h_rsc_0_2_AWQOS")
    , TLS_twiddle_h_rsc_0_2_AWPROT("TLS_twiddle_h_rsc_0_2_AWPROT")
    , TLS_twiddle_h_rsc_0_2_AWCACHE("TLS_twiddle_h_rsc_0_2_AWCACHE")
    , TLS_twiddle_h_rsc_0_2_AWLOCK("TLS_twiddle_h_rsc_0_2_AWLOCK")
    , TLS_twiddle_h_rsc_0_2_AWBURST("TLS_twiddle_h_rsc_0_2_AWBURST")
    , TLS_twiddle_h_rsc_0_2_AWSIZE("TLS_twiddle_h_rsc_0_2_AWSIZE")
    , TLS_twiddle_h_rsc_0_2_AWLEN("TLS_twiddle_h_rsc_0_2_AWLEN")
    , TLS_twiddle_h_rsc_0_2_AWADDR("TLS_twiddle_h_rsc_0_2_AWADDR")
    , TLS_twiddle_h_rsc_0_2_AWID("TLS_twiddle_h_rsc_0_2_AWID")
    , TLS_twiddle_h_rsc_triosy_0_2_lz("TLS_twiddle_h_rsc_triosy_0_2_lz")
    , TLS_twiddle_h_rsc_0_3_s_tdone("TLS_twiddle_h_rsc_0_3_s_tdone")
    , TLS_twiddle_h_rsc_0_3_tr_write_done("TLS_twiddle_h_rsc_0_3_tr_write_done")
    , TLS_twiddle_h_rsc_0_3_RREADY("TLS_twiddle_h_rsc_0_3_RREADY")
    , TLS_twiddle_h_rsc_0_3_RVALID("TLS_twiddle_h_rsc_0_3_RVALID")
    , TLS_twiddle_h_rsc_0_3_RUSER("TLS_twiddle_h_rsc_0_3_RUSER")
    , TLS_twiddle_h_rsc_0_3_RLAST("TLS_twiddle_h_rsc_0_3_RLAST")
    , TLS_twiddle_h_rsc_0_3_RRESP("TLS_twiddle_h_rsc_0_3_RRESP")
    , TLS_twiddle_h_rsc_0_3_RDATA("TLS_twiddle_h_rsc_0_3_RDATA")
    , TLS_twiddle_h_rsc_0_3_RID("TLS_twiddle_h_rsc_0_3_RID")
    , TLS_twiddle_h_rsc_0_3_ARREADY("TLS_twiddle_h_rsc_0_3_ARREADY")
    , TLS_twiddle_h_rsc_0_3_ARVALID("TLS_twiddle_h_rsc_0_3_ARVALID")
    , TLS_twiddle_h_rsc_0_3_ARUSER("TLS_twiddle_h_rsc_0_3_ARUSER")
    , TLS_twiddle_h_rsc_0_3_ARREGION("TLS_twiddle_h_rsc_0_3_ARREGION")
    , TLS_twiddle_h_rsc_0_3_ARQOS("TLS_twiddle_h_rsc_0_3_ARQOS")
    , TLS_twiddle_h_rsc_0_3_ARPROT("TLS_twiddle_h_rsc_0_3_ARPROT")
    , TLS_twiddle_h_rsc_0_3_ARCACHE("TLS_twiddle_h_rsc_0_3_ARCACHE")
    , TLS_twiddle_h_rsc_0_3_ARLOCK("TLS_twiddle_h_rsc_0_3_ARLOCK")
    , TLS_twiddle_h_rsc_0_3_ARBURST("TLS_twiddle_h_rsc_0_3_ARBURST")
    , TLS_twiddle_h_rsc_0_3_ARSIZE("TLS_twiddle_h_rsc_0_3_ARSIZE")
    , TLS_twiddle_h_rsc_0_3_ARLEN("TLS_twiddle_h_rsc_0_3_ARLEN")
    , TLS_twiddle_h_rsc_0_3_ARADDR("TLS_twiddle_h_rsc_0_3_ARADDR")
    , TLS_twiddle_h_rsc_0_3_ARID("TLS_twiddle_h_rsc_0_3_ARID")
    , TLS_twiddle_h_rsc_0_3_BREADY("TLS_twiddle_h_rsc_0_3_BREADY")
    , TLS_twiddle_h_rsc_0_3_BVALID("TLS_twiddle_h_rsc_0_3_BVALID")
    , TLS_twiddle_h_rsc_0_3_BUSER("TLS_twiddle_h_rsc_0_3_BUSER")
    , TLS_twiddle_h_rsc_0_3_BRESP("TLS_twiddle_h_rsc_0_3_BRESP")
    , TLS_twiddle_h_rsc_0_3_BID("TLS_twiddle_h_rsc_0_3_BID")
    , TLS_twiddle_h_rsc_0_3_WREADY("TLS_twiddle_h_rsc_0_3_WREADY")
    , TLS_twiddle_h_rsc_0_3_WVALID("TLS_twiddle_h_rsc_0_3_WVALID")
    , TLS_twiddle_h_rsc_0_3_WUSER("TLS_twiddle_h_rsc_0_3_WUSER")
    , TLS_twiddle_h_rsc_0_3_WLAST("TLS_twiddle_h_rsc_0_3_WLAST")
    , TLS_twiddle_h_rsc_0_3_WSTRB("TLS_twiddle_h_rsc_0_3_WSTRB")
    , TLS_twiddle_h_rsc_0_3_WDATA("TLS_twiddle_h_rsc_0_3_WDATA")
    , TLS_twiddle_h_rsc_0_3_AWREADY("TLS_twiddle_h_rsc_0_3_AWREADY")
    , TLS_twiddle_h_rsc_0_3_AWVALID("TLS_twiddle_h_rsc_0_3_AWVALID")
    , TLS_twiddle_h_rsc_0_3_AWUSER("TLS_twiddle_h_rsc_0_3_AWUSER")
    , TLS_twiddle_h_rsc_0_3_AWREGION("TLS_twiddle_h_rsc_0_3_AWREGION")
    , TLS_twiddle_h_rsc_0_3_AWQOS("TLS_twiddle_h_rsc_0_3_AWQOS")
    , TLS_twiddle_h_rsc_0_3_AWPROT("TLS_twiddle_h_rsc_0_3_AWPROT")
    , TLS_twiddle_h_rsc_0_3_AWCACHE("TLS_twiddle_h_rsc_0_3_AWCACHE")
    , TLS_twiddle_h_rsc_0_3_AWLOCK("TLS_twiddle_h_rsc_0_3_AWLOCK")
    , TLS_twiddle_h_rsc_0_3_AWBURST("TLS_twiddle_h_rsc_0_3_AWBURST")
    , TLS_twiddle_h_rsc_0_3_AWSIZE("TLS_twiddle_h_rsc_0_3_AWSIZE")
    , TLS_twiddle_h_rsc_0_3_AWLEN("TLS_twiddle_h_rsc_0_3_AWLEN")
    , TLS_twiddle_h_rsc_0_3_AWADDR("TLS_twiddle_h_rsc_0_3_AWADDR")
    , TLS_twiddle_h_rsc_0_3_AWID("TLS_twiddle_h_rsc_0_3_AWID")
    , TLS_twiddle_h_rsc_triosy_0_3_lz("TLS_twiddle_h_rsc_triosy_0_3_lz")
    , peaseNTT_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , xt_rsc_0__0__INST("xt_rsc_0__0_", true)
    , xt_rsc_0__1__INST("xt_rsc_0__1_", true)
    , xt_rsc_0__2__INST("xt_rsc_0__2_", true)
    , xt_rsc_0__3__INST("xt_rsc_0__3_", true)
    , xt_rsc_0__4__INST("xt_rsc_0__4_", true)
    , xt_rsc_0__5__INST("xt_rsc_0__5_", true)
    , xt_rsc_0__6__INST("xt_rsc_0__6_", true)
    , xt_rsc_0__7__INST("xt_rsc_0__7_", true)
    , p_rsc_INST("p_rsc", true)
    , r_rsc_INST("r_rsc", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_0_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RUSER")
    , twiddle_rsc_0__0__INST("twiddle_rsc_0__0_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_1_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_1_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RUSER")
    , twiddle_rsc_0__1__INST("twiddle_rsc_0__1_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_2_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_2_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RUSER")
    , twiddle_rsc_0__2__INST("twiddle_rsc_0__2_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_3_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_3_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RUSER")
    , twiddle_rsc_0__3__INST("twiddle_rsc_0__3_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER")
    , twiddle_h_rsc_0__0__INST("twiddle_h_rsc_0__0_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER")
    , twiddle_h_rsc_0__1__INST("twiddle_h_rsc_0__1_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER")
    , twiddle_h_rsc_0__2__INST("twiddle_h_rsc_0__2_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER")
    , twiddle_h_rsc_0__3__INST("twiddle_h_rsc_0__3_", true)
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
    , sync_generator_INST("sync_generator", true, false, false, false, 2983, 2983, 0)
    , catapult_monitor_INST("Monitor", clk, true, 2983LL, 2983LL)
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
    peaseNTT_INST.xt_rsc_0_4_adra(TLS_xt_rsc_0_4_adra);
    peaseNTT_INST.xt_rsc_0_4_da(TLS_xt_rsc_0_4_da);
    peaseNTT_INST.xt_rsc_0_4_wea(TLS_xt_rsc_0_4_wea);
    peaseNTT_INST.xt_rsc_0_4_qa(TLS_xt_rsc_0_4_qa);
    peaseNTT_INST.xt_rsc_0_4_adrb(TLS_xt_rsc_0_4_adrb);
    peaseNTT_INST.xt_rsc_0_4_db(TLS_xt_rsc_0_4_db);
    peaseNTT_INST.xt_rsc_0_4_web(TLS_xt_rsc_0_4_web);
    peaseNTT_INST.xt_rsc_0_4_qb(TLS_xt_rsc_0_4_qb);
    peaseNTT_INST.xt_rsc_triosy_0_4_lz(TLS_xt_rsc_triosy_0_4_lz);
    peaseNTT_INST.xt_rsc_0_5_adra(TLS_xt_rsc_0_5_adra);
    peaseNTT_INST.xt_rsc_0_5_da(TLS_xt_rsc_0_5_da);
    peaseNTT_INST.xt_rsc_0_5_wea(TLS_xt_rsc_0_5_wea);
    peaseNTT_INST.xt_rsc_0_5_qa(TLS_xt_rsc_0_5_qa);
    peaseNTT_INST.xt_rsc_0_5_adrb(TLS_xt_rsc_0_5_adrb);
    peaseNTT_INST.xt_rsc_0_5_db(TLS_xt_rsc_0_5_db);
    peaseNTT_INST.xt_rsc_0_5_web(TLS_xt_rsc_0_5_web);
    peaseNTT_INST.xt_rsc_0_5_qb(TLS_xt_rsc_0_5_qb);
    peaseNTT_INST.xt_rsc_triosy_0_5_lz(TLS_xt_rsc_triosy_0_5_lz);
    peaseNTT_INST.xt_rsc_0_6_adra(TLS_xt_rsc_0_6_adra);
    peaseNTT_INST.xt_rsc_0_6_da(TLS_xt_rsc_0_6_da);
    peaseNTT_INST.xt_rsc_0_6_wea(TLS_xt_rsc_0_6_wea);
    peaseNTT_INST.xt_rsc_0_6_qa(TLS_xt_rsc_0_6_qa);
    peaseNTT_INST.xt_rsc_0_6_adrb(TLS_xt_rsc_0_6_adrb);
    peaseNTT_INST.xt_rsc_0_6_db(TLS_xt_rsc_0_6_db);
    peaseNTT_INST.xt_rsc_0_6_web(TLS_xt_rsc_0_6_web);
    peaseNTT_INST.xt_rsc_0_6_qb(TLS_xt_rsc_0_6_qb);
    peaseNTT_INST.xt_rsc_triosy_0_6_lz(TLS_xt_rsc_triosy_0_6_lz);
    peaseNTT_INST.xt_rsc_0_7_adra(TLS_xt_rsc_0_7_adra);
    peaseNTT_INST.xt_rsc_0_7_da(TLS_xt_rsc_0_7_da);
    peaseNTT_INST.xt_rsc_0_7_wea(TLS_xt_rsc_0_7_wea);
    peaseNTT_INST.xt_rsc_0_7_qa(TLS_xt_rsc_0_7_qa);
    peaseNTT_INST.xt_rsc_0_7_adrb(TLS_xt_rsc_0_7_adrb);
    peaseNTT_INST.xt_rsc_0_7_db(TLS_xt_rsc_0_7_db);
    peaseNTT_INST.xt_rsc_0_7_web(TLS_xt_rsc_0_7_web);
    peaseNTT_INST.xt_rsc_0_7_qb(TLS_xt_rsc_0_7_qb);
    peaseNTT_INST.xt_rsc_triosy_0_7_lz(TLS_xt_rsc_triosy_0_7_lz);
    peaseNTT_INST.p_rsc_dat(TLS_p_rsc_dat);
    peaseNTT_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    peaseNTT_INST.r_rsc_dat(TLS_r_rsc_dat);
    peaseNTT_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);
    peaseNTT_INST.twiddle_rsc_0_0_s_tdone(TLS_twiddle_rsc_0_0_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_0_tr_write_done(TLS_twiddle_rsc_0_0_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_0_RREADY(TLS_twiddle_rsc_0_0_RREADY);
    peaseNTT_INST.twiddle_rsc_0_0_RVALID(TLS_twiddle_rsc_0_0_RVALID);
    peaseNTT_INST.twiddle_rsc_0_0_RUSER(TLS_twiddle_rsc_0_0_RUSER);
    peaseNTT_INST.twiddle_rsc_0_0_RLAST(TLS_twiddle_rsc_0_0_RLAST);
    peaseNTT_INST.twiddle_rsc_0_0_RRESP(TLS_twiddle_rsc_0_0_RRESP);
    peaseNTT_INST.twiddle_rsc_0_0_RDATA(TLS_twiddle_rsc_0_0_RDATA);
    peaseNTT_INST.twiddle_rsc_0_0_RID(TLS_twiddle_rsc_0_0_RID);
    peaseNTT_INST.twiddle_rsc_0_0_ARREADY(TLS_twiddle_rsc_0_0_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_0_ARVALID(TLS_twiddle_rsc_0_0_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_0_ARUSER(TLS_twiddle_rsc_0_0_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_0_ARREGION(TLS_twiddle_rsc_0_0_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_0_ARQOS(TLS_twiddle_rsc_0_0_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_0_ARPROT(TLS_twiddle_rsc_0_0_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_0_ARCACHE(TLS_twiddle_rsc_0_0_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_0_ARLOCK(TLS_twiddle_rsc_0_0_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_0_ARBURST(TLS_twiddle_rsc_0_0_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_0_ARSIZE(TLS_twiddle_rsc_0_0_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_0_ARLEN(TLS_twiddle_rsc_0_0_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_0_ARADDR(TLS_twiddle_rsc_0_0_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_0_ARID(TLS_twiddle_rsc_0_0_ARID);
    peaseNTT_INST.twiddle_rsc_0_0_BREADY(TLS_twiddle_rsc_0_0_BREADY);
    peaseNTT_INST.twiddle_rsc_0_0_BVALID(TLS_twiddle_rsc_0_0_BVALID);
    peaseNTT_INST.twiddle_rsc_0_0_BUSER(TLS_twiddle_rsc_0_0_BUSER);
    peaseNTT_INST.twiddle_rsc_0_0_BRESP(TLS_twiddle_rsc_0_0_BRESP);
    peaseNTT_INST.twiddle_rsc_0_0_BID(TLS_twiddle_rsc_0_0_BID);
    peaseNTT_INST.twiddle_rsc_0_0_WREADY(TLS_twiddle_rsc_0_0_WREADY);
    peaseNTT_INST.twiddle_rsc_0_0_WVALID(TLS_twiddle_rsc_0_0_WVALID);
    peaseNTT_INST.twiddle_rsc_0_0_WUSER(TLS_twiddle_rsc_0_0_WUSER);
    peaseNTT_INST.twiddle_rsc_0_0_WLAST(TLS_twiddle_rsc_0_0_WLAST);
    peaseNTT_INST.twiddle_rsc_0_0_WSTRB(TLS_twiddle_rsc_0_0_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_0_WDATA(TLS_twiddle_rsc_0_0_WDATA);
    peaseNTT_INST.twiddle_rsc_0_0_AWREADY(TLS_twiddle_rsc_0_0_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_0_AWVALID(TLS_twiddle_rsc_0_0_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_0_AWUSER(TLS_twiddle_rsc_0_0_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_0_AWREGION(TLS_twiddle_rsc_0_0_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_0_AWQOS(TLS_twiddle_rsc_0_0_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_0_AWPROT(TLS_twiddle_rsc_0_0_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_0_AWCACHE(TLS_twiddle_rsc_0_0_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_0_AWLOCK(TLS_twiddle_rsc_0_0_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_0_AWBURST(TLS_twiddle_rsc_0_0_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_0_AWSIZE(TLS_twiddle_rsc_0_0_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_0_AWLEN(TLS_twiddle_rsc_0_0_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_0_AWADDR(TLS_twiddle_rsc_0_0_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_0_AWID(TLS_twiddle_rsc_0_0_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_0_lz(TLS_twiddle_rsc_triosy_0_0_lz);
    peaseNTT_INST.twiddle_rsc_0_1_s_tdone(TLS_twiddle_rsc_0_1_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_1_tr_write_done(TLS_twiddle_rsc_0_1_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_1_RREADY(TLS_twiddle_rsc_0_1_RREADY);
    peaseNTT_INST.twiddle_rsc_0_1_RVALID(TLS_twiddle_rsc_0_1_RVALID);
    peaseNTT_INST.twiddle_rsc_0_1_RUSER(TLS_twiddle_rsc_0_1_RUSER);
    peaseNTT_INST.twiddle_rsc_0_1_RLAST(TLS_twiddle_rsc_0_1_RLAST);
    peaseNTT_INST.twiddle_rsc_0_1_RRESP(TLS_twiddle_rsc_0_1_RRESP);
    peaseNTT_INST.twiddle_rsc_0_1_RDATA(TLS_twiddle_rsc_0_1_RDATA);
    peaseNTT_INST.twiddle_rsc_0_1_RID(TLS_twiddle_rsc_0_1_RID);
    peaseNTT_INST.twiddle_rsc_0_1_ARREADY(TLS_twiddle_rsc_0_1_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_1_ARVALID(TLS_twiddle_rsc_0_1_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_1_ARUSER(TLS_twiddle_rsc_0_1_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_1_ARREGION(TLS_twiddle_rsc_0_1_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_1_ARQOS(TLS_twiddle_rsc_0_1_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_1_ARPROT(TLS_twiddle_rsc_0_1_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_1_ARCACHE(TLS_twiddle_rsc_0_1_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_1_ARLOCK(TLS_twiddle_rsc_0_1_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_1_ARBURST(TLS_twiddle_rsc_0_1_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_1_ARSIZE(TLS_twiddle_rsc_0_1_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_1_ARLEN(TLS_twiddle_rsc_0_1_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_1_ARADDR(TLS_twiddle_rsc_0_1_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_1_ARID(TLS_twiddle_rsc_0_1_ARID);
    peaseNTT_INST.twiddle_rsc_0_1_BREADY(TLS_twiddle_rsc_0_1_BREADY);
    peaseNTT_INST.twiddle_rsc_0_1_BVALID(TLS_twiddle_rsc_0_1_BVALID);
    peaseNTT_INST.twiddle_rsc_0_1_BUSER(TLS_twiddle_rsc_0_1_BUSER);
    peaseNTT_INST.twiddle_rsc_0_1_BRESP(TLS_twiddle_rsc_0_1_BRESP);
    peaseNTT_INST.twiddle_rsc_0_1_BID(TLS_twiddle_rsc_0_1_BID);
    peaseNTT_INST.twiddle_rsc_0_1_WREADY(TLS_twiddle_rsc_0_1_WREADY);
    peaseNTT_INST.twiddle_rsc_0_1_WVALID(TLS_twiddle_rsc_0_1_WVALID);
    peaseNTT_INST.twiddle_rsc_0_1_WUSER(TLS_twiddle_rsc_0_1_WUSER);
    peaseNTT_INST.twiddle_rsc_0_1_WLAST(TLS_twiddle_rsc_0_1_WLAST);
    peaseNTT_INST.twiddle_rsc_0_1_WSTRB(TLS_twiddle_rsc_0_1_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_1_WDATA(TLS_twiddle_rsc_0_1_WDATA);
    peaseNTT_INST.twiddle_rsc_0_1_AWREADY(TLS_twiddle_rsc_0_1_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_1_AWVALID(TLS_twiddle_rsc_0_1_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_1_AWUSER(TLS_twiddle_rsc_0_1_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_1_AWREGION(TLS_twiddle_rsc_0_1_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_1_AWQOS(TLS_twiddle_rsc_0_1_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_1_AWPROT(TLS_twiddle_rsc_0_1_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_1_AWCACHE(TLS_twiddle_rsc_0_1_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_1_AWLOCK(TLS_twiddle_rsc_0_1_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_1_AWBURST(TLS_twiddle_rsc_0_1_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_1_AWSIZE(TLS_twiddle_rsc_0_1_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_1_AWLEN(TLS_twiddle_rsc_0_1_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_1_AWADDR(TLS_twiddle_rsc_0_1_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_1_AWID(TLS_twiddle_rsc_0_1_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_1_lz(TLS_twiddle_rsc_triosy_0_1_lz);
    peaseNTT_INST.twiddle_rsc_0_2_s_tdone(TLS_twiddle_rsc_0_2_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_2_tr_write_done(TLS_twiddle_rsc_0_2_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_2_RREADY(TLS_twiddle_rsc_0_2_RREADY);
    peaseNTT_INST.twiddle_rsc_0_2_RVALID(TLS_twiddle_rsc_0_2_RVALID);
    peaseNTT_INST.twiddle_rsc_0_2_RUSER(TLS_twiddle_rsc_0_2_RUSER);
    peaseNTT_INST.twiddle_rsc_0_2_RLAST(TLS_twiddle_rsc_0_2_RLAST);
    peaseNTT_INST.twiddle_rsc_0_2_RRESP(TLS_twiddle_rsc_0_2_RRESP);
    peaseNTT_INST.twiddle_rsc_0_2_RDATA(TLS_twiddle_rsc_0_2_RDATA);
    peaseNTT_INST.twiddle_rsc_0_2_RID(TLS_twiddle_rsc_0_2_RID);
    peaseNTT_INST.twiddle_rsc_0_2_ARREADY(TLS_twiddle_rsc_0_2_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_2_ARVALID(TLS_twiddle_rsc_0_2_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_2_ARUSER(TLS_twiddle_rsc_0_2_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_2_ARREGION(TLS_twiddle_rsc_0_2_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_2_ARQOS(TLS_twiddle_rsc_0_2_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_2_ARPROT(TLS_twiddle_rsc_0_2_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_2_ARCACHE(TLS_twiddle_rsc_0_2_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_2_ARLOCK(TLS_twiddle_rsc_0_2_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_2_ARBURST(TLS_twiddle_rsc_0_2_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_2_ARSIZE(TLS_twiddle_rsc_0_2_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_2_ARLEN(TLS_twiddle_rsc_0_2_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_2_ARADDR(TLS_twiddle_rsc_0_2_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_2_ARID(TLS_twiddle_rsc_0_2_ARID);
    peaseNTT_INST.twiddle_rsc_0_2_BREADY(TLS_twiddle_rsc_0_2_BREADY);
    peaseNTT_INST.twiddle_rsc_0_2_BVALID(TLS_twiddle_rsc_0_2_BVALID);
    peaseNTT_INST.twiddle_rsc_0_2_BUSER(TLS_twiddle_rsc_0_2_BUSER);
    peaseNTT_INST.twiddle_rsc_0_2_BRESP(TLS_twiddle_rsc_0_2_BRESP);
    peaseNTT_INST.twiddle_rsc_0_2_BID(TLS_twiddle_rsc_0_2_BID);
    peaseNTT_INST.twiddle_rsc_0_2_WREADY(TLS_twiddle_rsc_0_2_WREADY);
    peaseNTT_INST.twiddle_rsc_0_2_WVALID(TLS_twiddle_rsc_0_2_WVALID);
    peaseNTT_INST.twiddle_rsc_0_2_WUSER(TLS_twiddle_rsc_0_2_WUSER);
    peaseNTT_INST.twiddle_rsc_0_2_WLAST(TLS_twiddle_rsc_0_2_WLAST);
    peaseNTT_INST.twiddle_rsc_0_2_WSTRB(TLS_twiddle_rsc_0_2_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_2_WDATA(TLS_twiddle_rsc_0_2_WDATA);
    peaseNTT_INST.twiddle_rsc_0_2_AWREADY(TLS_twiddle_rsc_0_2_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_2_AWVALID(TLS_twiddle_rsc_0_2_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_2_AWUSER(TLS_twiddle_rsc_0_2_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_2_AWREGION(TLS_twiddle_rsc_0_2_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_2_AWQOS(TLS_twiddle_rsc_0_2_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_2_AWPROT(TLS_twiddle_rsc_0_2_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_2_AWCACHE(TLS_twiddle_rsc_0_2_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_2_AWLOCK(TLS_twiddle_rsc_0_2_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_2_AWBURST(TLS_twiddle_rsc_0_2_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_2_AWSIZE(TLS_twiddle_rsc_0_2_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_2_AWLEN(TLS_twiddle_rsc_0_2_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_2_AWADDR(TLS_twiddle_rsc_0_2_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_2_AWID(TLS_twiddle_rsc_0_2_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_2_lz(TLS_twiddle_rsc_triosy_0_2_lz);
    peaseNTT_INST.twiddle_rsc_0_3_s_tdone(TLS_twiddle_rsc_0_3_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_3_tr_write_done(TLS_twiddle_rsc_0_3_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_3_RREADY(TLS_twiddle_rsc_0_3_RREADY);
    peaseNTT_INST.twiddle_rsc_0_3_RVALID(TLS_twiddle_rsc_0_3_RVALID);
    peaseNTT_INST.twiddle_rsc_0_3_RUSER(TLS_twiddle_rsc_0_3_RUSER);
    peaseNTT_INST.twiddle_rsc_0_3_RLAST(TLS_twiddle_rsc_0_3_RLAST);
    peaseNTT_INST.twiddle_rsc_0_3_RRESP(TLS_twiddle_rsc_0_3_RRESP);
    peaseNTT_INST.twiddle_rsc_0_3_RDATA(TLS_twiddle_rsc_0_3_RDATA);
    peaseNTT_INST.twiddle_rsc_0_3_RID(TLS_twiddle_rsc_0_3_RID);
    peaseNTT_INST.twiddle_rsc_0_3_ARREADY(TLS_twiddle_rsc_0_3_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_3_ARVALID(TLS_twiddle_rsc_0_3_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_3_ARUSER(TLS_twiddle_rsc_0_3_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_3_ARREGION(TLS_twiddle_rsc_0_3_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_3_ARQOS(TLS_twiddle_rsc_0_3_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_3_ARPROT(TLS_twiddle_rsc_0_3_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_3_ARCACHE(TLS_twiddle_rsc_0_3_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_3_ARLOCK(TLS_twiddle_rsc_0_3_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_3_ARBURST(TLS_twiddle_rsc_0_3_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_3_ARSIZE(TLS_twiddle_rsc_0_3_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_3_ARLEN(TLS_twiddle_rsc_0_3_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_3_ARADDR(TLS_twiddle_rsc_0_3_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_3_ARID(TLS_twiddle_rsc_0_3_ARID);
    peaseNTT_INST.twiddle_rsc_0_3_BREADY(TLS_twiddle_rsc_0_3_BREADY);
    peaseNTT_INST.twiddle_rsc_0_3_BVALID(TLS_twiddle_rsc_0_3_BVALID);
    peaseNTT_INST.twiddle_rsc_0_3_BUSER(TLS_twiddle_rsc_0_3_BUSER);
    peaseNTT_INST.twiddle_rsc_0_3_BRESP(TLS_twiddle_rsc_0_3_BRESP);
    peaseNTT_INST.twiddle_rsc_0_3_BID(TLS_twiddle_rsc_0_3_BID);
    peaseNTT_INST.twiddle_rsc_0_3_WREADY(TLS_twiddle_rsc_0_3_WREADY);
    peaseNTT_INST.twiddle_rsc_0_3_WVALID(TLS_twiddle_rsc_0_3_WVALID);
    peaseNTT_INST.twiddle_rsc_0_3_WUSER(TLS_twiddle_rsc_0_3_WUSER);
    peaseNTT_INST.twiddle_rsc_0_3_WLAST(TLS_twiddle_rsc_0_3_WLAST);
    peaseNTT_INST.twiddle_rsc_0_3_WSTRB(TLS_twiddle_rsc_0_3_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_3_WDATA(TLS_twiddle_rsc_0_3_WDATA);
    peaseNTT_INST.twiddle_rsc_0_3_AWREADY(TLS_twiddle_rsc_0_3_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_3_AWVALID(TLS_twiddle_rsc_0_3_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_3_AWUSER(TLS_twiddle_rsc_0_3_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_3_AWREGION(TLS_twiddle_rsc_0_3_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_3_AWQOS(TLS_twiddle_rsc_0_3_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_3_AWPROT(TLS_twiddle_rsc_0_3_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_3_AWCACHE(TLS_twiddle_rsc_0_3_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_3_AWLOCK(TLS_twiddle_rsc_0_3_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_3_AWBURST(TLS_twiddle_rsc_0_3_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_3_AWSIZE(TLS_twiddle_rsc_0_3_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_3_AWLEN(TLS_twiddle_rsc_0_3_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_3_AWADDR(TLS_twiddle_rsc_0_3_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_3_AWID(TLS_twiddle_rsc_0_3_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_3_lz(TLS_twiddle_rsc_triosy_0_3_lz);
    peaseNTT_INST.twiddle_h_rsc_0_0_s_tdone(TLS_twiddle_h_rsc_0_0_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_0_tr_write_done(TLS_twiddle_h_rsc_0_0_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_0_RREADY(TLS_twiddle_h_rsc_0_0_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_0_RVALID(TLS_twiddle_h_rsc_0_0_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_0_RUSER(TLS_twiddle_h_rsc_0_0_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_0_RLAST(TLS_twiddle_h_rsc_0_0_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_0_RRESP(TLS_twiddle_h_rsc_0_0_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_0_RDATA(TLS_twiddle_h_rsc_0_0_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_0_RID(TLS_twiddle_h_rsc_0_0_RID);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARREADY(TLS_twiddle_h_rsc_0_0_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARVALID(TLS_twiddle_h_rsc_0_0_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARUSER(TLS_twiddle_h_rsc_0_0_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARREGION(TLS_twiddle_h_rsc_0_0_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARQOS(TLS_twiddle_h_rsc_0_0_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARPROT(TLS_twiddle_h_rsc_0_0_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARCACHE(TLS_twiddle_h_rsc_0_0_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARLOCK(TLS_twiddle_h_rsc_0_0_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARBURST(TLS_twiddle_h_rsc_0_0_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARSIZE(TLS_twiddle_h_rsc_0_0_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARLEN(TLS_twiddle_h_rsc_0_0_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARADDR(TLS_twiddle_h_rsc_0_0_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_0_ARID(TLS_twiddle_h_rsc_0_0_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_0_BREADY(TLS_twiddle_h_rsc_0_0_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_0_BVALID(TLS_twiddle_h_rsc_0_0_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_0_BUSER(TLS_twiddle_h_rsc_0_0_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_0_BRESP(TLS_twiddle_h_rsc_0_0_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_0_BID(TLS_twiddle_h_rsc_0_0_BID);
    peaseNTT_INST.twiddle_h_rsc_0_0_WREADY(TLS_twiddle_h_rsc_0_0_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_0_WVALID(TLS_twiddle_h_rsc_0_0_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_0_WUSER(TLS_twiddle_h_rsc_0_0_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_0_WLAST(TLS_twiddle_h_rsc_0_0_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_0_WSTRB(TLS_twiddle_h_rsc_0_0_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_0_WDATA(TLS_twiddle_h_rsc_0_0_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWREADY(TLS_twiddle_h_rsc_0_0_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWVALID(TLS_twiddle_h_rsc_0_0_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWUSER(TLS_twiddle_h_rsc_0_0_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWREGION(TLS_twiddle_h_rsc_0_0_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWQOS(TLS_twiddle_h_rsc_0_0_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWPROT(TLS_twiddle_h_rsc_0_0_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWCACHE(TLS_twiddle_h_rsc_0_0_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWLOCK(TLS_twiddle_h_rsc_0_0_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWBURST(TLS_twiddle_h_rsc_0_0_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWSIZE(TLS_twiddle_h_rsc_0_0_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWLEN(TLS_twiddle_h_rsc_0_0_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWADDR(TLS_twiddle_h_rsc_0_0_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_0_AWID(TLS_twiddle_h_rsc_0_0_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_0_lz(TLS_twiddle_h_rsc_triosy_0_0_lz);
    peaseNTT_INST.twiddle_h_rsc_0_1_s_tdone(TLS_twiddle_h_rsc_0_1_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_1_tr_write_done(TLS_twiddle_h_rsc_0_1_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_1_RREADY(TLS_twiddle_h_rsc_0_1_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_1_RVALID(TLS_twiddle_h_rsc_0_1_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_1_RUSER(TLS_twiddle_h_rsc_0_1_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_1_RLAST(TLS_twiddle_h_rsc_0_1_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_1_RRESP(TLS_twiddle_h_rsc_0_1_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_1_RDATA(TLS_twiddle_h_rsc_0_1_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_1_RID(TLS_twiddle_h_rsc_0_1_RID);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARREADY(TLS_twiddle_h_rsc_0_1_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARVALID(TLS_twiddle_h_rsc_0_1_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARUSER(TLS_twiddle_h_rsc_0_1_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARREGION(TLS_twiddle_h_rsc_0_1_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARQOS(TLS_twiddle_h_rsc_0_1_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARPROT(TLS_twiddle_h_rsc_0_1_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARCACHE(TLS_twiddle_h_rsc_0_1_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARLOCK(TLS_twiddle_h_rsc_0_1_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARBURST(TLS_twiddle_h_rsc_0_1_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARSIZE(TLS_twiddle_h_rsc_0_1_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARLEN(TLS_twiddle_h_rsc_0_1_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARADDR(TLS_twiddle_h_rsc_0_1_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_1_ARID(TLS_twiddle_h_rsc_0_1_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_1_BREADY(TLS_twiddle_h_rsc_0_1_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_1_BVALID(TLS_twiddle_h_rsc_0_1_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_1_BUSER(TLS_twiddle_h_rsc_0_1_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_1_BRESP(TLS_twiddle_h_rsc_0_1_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_1_BID(TLS_twiddle_h_rsc_0_1_BID);
    peaseNTT_INST.twiddle_h_rsc_0_1_WREADY(TLS_twiddle_h_rsc_0_1_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_1_WVALID(TLS_twiddle_h_rsc_0_1_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_1_WUSER(TLS_twiddle_h_rsc_0_1_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_1_WLAST(TLS_twiddle_h_rsc_0_1_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_1_WSTRB(TLS_twiddle_h_rsc_0_1_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_1_WDATA(TLS_twiddle_h_rsc_0_1_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWREADY(TLS_twiddle_h_rsc_0_1_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWVALID(TLS_twiddle_h_rsc_0_1_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWUSER(TLS_twiddle_h_rsc_0_1_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWREGION(TLS_twiddle_h_rsc_0_1_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWQOS(TLS_twiddle_h_rsc_0_1_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWPROT(TLS_twiddle_h_rsc_0_1_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWCACHE(TLS_twiddle_h_rsc_0_1_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWLOCK(TLS_twiddle_h_rsc_0_1_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWBURST(TLS_twiddle_h_rsc_0_1_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWSIZE(TLS_twiddle_h_rsc_0_1_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWLEN(TLS_twiddle_h_rsc_0_1_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWADDR(TLS_twiddle_h_rsc_0_1_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_1_AWID(TLS_twiddle_h_rsc_0_1_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_1_lz(TLS_twiddle_h_rsc_triosy_0_1_lz);
    peaseNTT_INST.twiddle_h_rsc_0_2_s_tdone(TLS_twiddle_h_rsc_0_2_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_2_tr_write_done(TLS_twiddle_h_rsc_0_2_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_2_RREADY(TLS_twiddle_h_rsc_0_2_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_2_RVALID(TLS_twiddle_h_rsc_0_2_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_2_RUSER(TLS_twiddle_h_rsc_0_2_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_2_RLAST(TLS_twiddle_h_rsc_0_2_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_2_RRESP(TLS_twiddle_h_rsc_0_2_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_2_RDATA(TLS_twiddle_h_rsc_0_2_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_2_RID(TLS_twiddle_h_rsc_0_2_RID);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARREADY(TLS_twiddle_h_rsc_0_2_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARVALID(TLS_twiddle_h_rsc_0_2_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARUSER(TLS_twiddle_h_rsc_0_2_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARREGION(TLS_twiddle_h_rsc_0_2_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARQOS(TLS_twiddle_h_rsc_0_2_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARPROT(TLS_twiddle_h_rsc_0_2_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARCACHE(TLS_twiddle_h_rsc_0_2_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARLOCK(TLS_twiddle_h_rsc_0_2_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARBURST(TLS_twiddle_h_rsc_0_2_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARSIZE(TLS_twiddle_h_rsc_0_2_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARLEN(TLS_twiddle_h_rsc_0_2_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARADDR(TLS_twiddle_h_rsc_0_2_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_2_ARID(TLS_twiddle_h_rsc_0_2_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_2_BREADY(TLS_twiddle_h_rsc_0_2_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_2_BVALID(TLS_twiddle_h_rsc_0_2_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_2_BUSER(TLS_twiddle_h_rsc_0_2_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_2_BRESP(TLS_twiddle_h_rsc_0_2_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_2_BID(TLS_twiddle_h_rsc_0_2_BID);
    peaseNTT_INST.twiddle_h_rsc_0_2_WREADY(TLS_twiddle_h_rsc_0_2_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_2_WVALID(TLS_twiddle_h_rsc_0_2_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_2_WUSER(TLS_twiddle_h_rsc_0_2_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_2_WLAST(TLS_twiddle_h_rsc_0_2_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_2_WSTRB(TLS_twiddle_h_rsc_0_2_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_2_WDATA(TLS_twiddle_h_rsc_0_2_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWREADY(TLS_twiddle_h_rsc_0_2_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWVALID(TLS_twiddle_h_rsc_0_2_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWUSER(TLS_twiddle_h_rsc_0_2_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWREGION(TLS_twiddle_h_rsc_0_2_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWQOS(TLS_twiddle_h_rsc_0_2_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWPROT(TLS_twiddle_h_rsc_0_2_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWCACHE(TLS_twiddle_h_rsc_0_2_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWLOCK(TLS_twiddle_h_rsc_0_2_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWBURST(TLS_twiddle_h_rsc_0_2_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWSIZE(TLS_twiddle_h_rsc_0_2_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWLEN(TLS_twiddle_h_rsc_0_2_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWADDR(TLS_twiddle_h_rsc_0_2_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_2_AWID(TLS_twiddle_h_rsc_0_2_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_2_lz(TLS_twiddle_h_rsc_triosy_0_2_lz);
    peaseNTT_INST.twiddle_h_rsc_0_3_s_tdone(TLS_twiddle_h_rsc_0_3_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_3_tr_write_done(TLS_twiddle_h_rsc_0_3_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_3_RREADY(TLS_twiddle_h_rsc_0_3_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_3_RVALID(TLS_twiddle_h_rsc_0_3_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_3_RUSER(TLS_twiddle_h_rsc_0_3_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_3_RLAST(TLS_twiddle_h_rsc_0_3_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_3_RRESP(TLS_twiddle_h_rsc_0_3_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_3_RDATA(TLS_twiddle_h_rsc_0_3_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_3_RID(TLS_twiddle_h_rsc_0_3_RID);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARREADY(TLS_twiddle_h_rsc_0_3_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARVALID(TLS_twiddle_h_rsc_0_3_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARUSER(TLS_twiddle_h_rsc_0_3_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARREGION(TLS_twiddle_h_rsc_0_3_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARQOS(TLS_twiddle_h_rsc_0_3_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARPROT(TLS_twiddle_h_rsc_0_3_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARCACHE(TLS_twiddle_h_rsc_0_3_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARLOCK(TLS_twiddle_h_rsc_0_3_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARBURST(TLS_twiddle_h_rsc_0_3_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARSIZE(TLS_twiddle_h_rsc_0_3_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARLEN(TLS_twiddle_h_rsc_0_3_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARADDR(TLS_twiddle_h_rsc_0_3_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_3_ARID(TLS_twiddle_h_rsc_0_3_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_3_BREADY(TLS_twiddle_h_rsc_0_3_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_3_BVALID(TLS_twiddle_h_rsc_0_3_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_3_BUSER(TLS_twiddle_h_rsc_0_3_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_3_BRESP(TLS_twiddle_h_rsc_0_3_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_3_BID(TLS_twiddle_h_rsc_0_3_BID);
    peaseNTT_INST.twiddle_h_rsc_0_3_WREADY(TLS_twiddle_h_rsc_0_3_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_3_WVALID(TLS_twiddle_h_rsc_0_3_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_3_WUSER(TLS_twiddle_h_rsc_0_3_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_3_WLAST(TLS_twiddle_h_rsc_0_3_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_3_WSTRB(TLS_twiddle_h_rsc_0_3_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_3_WDATA(TLS_twiddle_h_rsc_0_3_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWREADY(TLS_twiddle_h_rsc_0_3_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWVALID(TLS_twiddle_h_rsc_0_3_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWUSER(TLS_twiddle_h_rsc_0_3_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWREGION(TLS_twiddle_h_rsc_0_3_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWQOS(TLS_twiddle_h_rsc_0_3_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWPROT(TLS_twiddle_h_rsc_0_3_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWCACHE(TLS_twiddle_h_rsc_0_3_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWLOCK(TLS_twiddle_h_rsc_0_3_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWBURST(TLS_twiddle_h_rsc_0_3_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWSIZE(TLS_twiddle_h_rsc_0_3_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWLEN(TLS_twiddle_h_rsc_0_3_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWADDR(TLS_twiddle_h_rsc_0_3_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_3_AWID(TLS_twiddle_h_rsc_0_3_AWID);
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
    xt_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_23)));

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
    xt_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_24)));

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
    xt_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_25)));

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
    xt_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_26)));

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
    xt_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_27)));

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
    xt_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_28)));

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
    xt_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_29)));

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
    xt_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_30)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWID.outSCALAR(TLS_twiddle_rsc_0_0_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWUSER.outSCALAR(TLS_twiddle_rsc_0_0_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_WUSER.outSCALAR(TLS_twiddle_rsc_0_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BID.inSCALAR(TLS_twiddle_rsc_0_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BUSER.inSCALAR(TLS_twiddle_rsc_0_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARID.outSCALAR(TLS_twiddle_rsc_0_0_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARUSER.outSCALAR(TLS_twiddle_rsc_0_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RID.inSCALAR(TLS_twiddle_rsc_0_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RUSER.inSCALAR(TLS_twiddle_rsc_0_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_0_RUSER);

    twiddle_rsc_0__0__INST.ACLK(clk);
    twiddle_rsc_0__0__INST.ARESETn(rst);
    twiddle_rsc_0__0__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_0_AWID);
    twiddle_rsc_0__0__INST.AWADDR(TLS_twiddle_rsc_0_0_AWADDR);
    twiddle_rsc_0__0__INST.AWLEN(TLS_twiddle_rsc_0_0_AWLEN);
    twiddle_rsc_0__0__INST.AWSIZE(TLS_twiddle_rsc_0_0_AWSIZE);
    twiddle_rsc_0__0__INST.AWBURST(TLS_twiddle_rsc_0_0_AWBURST);
    twiddle_rsc_0__0__INST.AWLOCK(TLS_twiddle_rsc_0_0_AWLOCK);
    twiddle_rsc_0__0__INST.AWCACHE(TLS_twiddle_rsc_0_0_AWCACHE);
    twiddle_rsc_0__0__INST.AWPROT(TLS_twiddle_rsc_0_0_AWPROT);
    twiddle_rsc_0__0__INST.AWQOS(TLS_twiddle_rsc_0_0_AWQOS);
    twiddle_rsc_0__0__INST.AWREGION(TLS_twiddle_rsc_0_0_AWREGION);
    twiddle_rsc_0__0__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_0_AWUSER);
    twiddle_rsc_0__0__INST.AWVALID(TLS_twiddle_rsc_0_0_AWVALID);
    twiddle_rsc_0__0__INST.AWREADY(TLS_twiddle_rsc_0_0_AWREADY);
    twiddle_rsc_0__0__INST.WDATA(TLS_twiddle_rsc_0_0_WDATA);
    twiddle_rsc_0__0__INST.WSTRB(TLS_twiddle_rsc_0_0_WSTRB);
    twiddle_rsc_0__0__INST.WLAST(TLS_twiddle_rsc_0_0_WLAST);
    twiddle_rsc_0__0__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_0_WUSER);
    twiddle_rsc_0__0__INST.WVALID(TLS_twiddle_rsc_0_0_WVALID);
    twiddle_rsc_0__0__INST.WREADY(TLS_twiddle_rsc_0_0_WREADY);
    twiddle_rsc_0__0__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_0_BID);
    twiddle_rsc_0__0__INST.BRESP(TLS_twiddle_rsc_0_0_BRESP);
    twiddle_rsc_0__0__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_0_BUSER);
    twiddle_rsc_0__0__INST.BVALID(TLS_twiddle_rsc_0_0_BVALID);
    twiddle_rsc_0__0__INST.BREADY(TLS_twiddle_rsc_0_0_BREADY);
    twiddle_rsc_0__0__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_0_ARID);
    twiddle_rsc_0__0__INST.ARADDR(TLS_twiddle_rsc_0_0_ARADDR);
    twiddle_rsc_0__0__INST.ARLEN(TLS_twiddle_rsc_0_0_ARLEN);
    twiddle_rsc_0__0__INST.ARSIZE(TLS_twiddle_rsc_0_0_ARSIZE);
    twiddle_rsc_0__0__INST.ARBURST(TLS_twiddle_rsc_0_0_ARBURST);
    twiddle_rsc_0__0__INST.ARLOCK(TLS_twiddle_rsc_0_0_ARLOCK);
    twiddle_rsc_0__0__INST.ARCACHE(TLS_twiddle_rsc_0_0_ARCACHE);
    twiddle_rsc_0__0__INST.ARPROT(TLS_twiddle_rsc_0_0_ARPROT);
    twiddle_rsc_0__0__INST.ARQOS(TLS_twiddle_rsc_0_0_ARQOS);
    twiddle_rsc_0__0__INST.ARREGION(TLS_twiddle_rsc_0_0_ARREGION);
    twiddle_rsc_0__0__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_0_ARUSER);
    twiddle_rsc_0__0__INST.ARVALID(TLS_twiddle_rsc_0_0_ARVALID);
    twiddle_rsc_0__0__INST.ARREADY(TLS_twiddle_rsc_0_0_ARREADY);
    twiddle_rsc_0__0__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_0_RID);
    twiddle_rsc_0__0__INST.RDATA(TLS_twiddle_rsc_0_0_RDATA);
    twiddle_rsc_0__0__INST.RRESP(TLS_twiddle_rsc_0_0_RRESP);
    twiddle_rsc_0__0__INST.RLAST(TLS_twiddle_rsc_0_0_RLAST);
    twiddle_rsc_0__0__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_0_RUSER);
    twiddle_rsc_0__0__INST.RVALID(TLS_twiddle_rsc_0_0_RVALID);
    twiddle_rsc_0__0__INST.RREADY(TLS_twiddle_rsc_0_0_RREADY);
    twiddle_rsc_0__0__INST.tr_write_done(TLS_twiddle_rsc_0_0_tr_write_done);
    twiddle_rsc_0__0__INST.s_tdone(TLS_twiddle_rsc_0_0_s_tdone);
    twiddle_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_31)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWID.outSCALAR(TLS_twiddle_rsc_0_1_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWUSER.outSCALAR(TLS_twiddle_rsc_0_1_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_WUSER.outSCALAR(TLS_twiddle_rsc_0_1_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BID.inSCALAR(TLS_twiddle_rsc_0_1_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BUSER.inSCALAR(TLS_twiddle_rsc_0_1_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARID.outSCALAR(TLS_twiddle_rsc_0_1_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARUSER.outSCALAR(TLS_twiddle_rsc_0_1_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RID.inSCALAR(TLS_twiddle_rsc_0_1_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RUSER.inSCALAR(TLS_twiddle_rsc_0_1_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_1_RUSER);

    twiddle_rsc_0__1__INST.ACLK(clk);
    twiddle_rsc_0__1__INST.ARESETn(rst);
    twiddle_rsc_0__1__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_1_AWID);
    twiddle_rsc_0__1__INST.AWADDR(TLS_twiddle_rsc_0_1_AWADDR);
    twiddle_rsc_0__1__INST.AWLEN(TLS_twiddle_rsc_0_1_AWLEN);
    twiddle_rsc_0__1__INST.AWSIZE(TLS_twiddle_rsc_0_1_AWSIZE);
    twiddle_rsc_0__1__INST.AWBURST(TLS_twiddle_rsc_0_1_AWBURST);
    twiddle_rsc_0__1__INST.AWLOCK(TLS_twiddle_rsc_0_1_AWLOCK);
    twiddle_rsc_0__1__INST.AWCACHE(TLS_twiddle_rsc_0_1_AWCACHE);
    twiddle_rsc_0__1__INST.AWPROT(TLS_twiddle_rsc_0_1_AWPROT);
    twiddle_rsc_0__1__INST.AWQOS(TLS_twiddle_rsc_0_1_AWQOS);
    twiddle_rsc_0__1__INST.AWREGION(TLS_twiddle_rsc_0_1_AWREGION);
    twiddle_rsc_0__1__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_1_AWUSER);
    twiddle_rsc_0__1__INST.AWVALID(TLS_twiddle_rsc_0_1_AWVALID);
    twiddle_rsc_0__1__INST.AWREADY(TLS_twiddle_rsc_0_1_AWREADY);
    twiddle_rsc_0__1__INST.WDATA(TLS_twiddle_rsc_0_1_WDATA);
    twiddle_rsc_0__1__INST.WSTRB(TLS_twiddle_rsc_0_1_WSTRB);
    twiddle_rsc_0__1__INST.WLAST(TLS_twiddle_rsc_0_1_WLAST);
    twiddle_rsc_0__1__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_1_WUSER);
    twiddle_rsc_0__1__INST.WVALID(TLS_twiddle_rsc_0_1_WVALID);
    twiddle_rsc_0__1__INST.WREADY(TLS_twiddle_rsc_0_1_WREADY);
    twiddle_rsc_0__1__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_1_BID);
    twiddle_rsc_0__1__INST.BRESP(TLS_twiddle_rsc_0_1_BRESP);
    twiddle_rsc_0__1__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_1_BUSER);
    twiddle_rsc_0__1__INST.BVALID(TLS_twiddle_rsc_0_1_BVALID);
    twiddle_rsc_0__1__INST.BREADY(TLS_twiddle_rsc_0_1_BREADY);
    twiddle_rsc_0__1__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_1_ARID);
    twiddle_rsc_0__1__INST.ARADDR(TLS_twiddle_rsc_0_1_ARADDR);
    twiddle_rsc_0__1__INST.ARLEN(TLS_twiddle_rsc_0_1_ARLEN);
    twiddle_rsc_0__1__INST.ARSIZE(TLS_twiddle_rsc_0_1_ARSIZE);
    twiddle_rsc_0__1__INST.ARBURST(TLS_twiddle_rsc_0_1_ARBURST);
    twiddle_rsc_0__1__INST.ARLOCK(TLS_twiddle_rsc_0_1_ARLOCK);
    twiddle_rsc_0__1__INST.ARCACHE(TLS_twiddle_rsc_0_1_ARCACHE);
    twiddle_rsc_0__1__INST.ARPROT(TLS_twiddle_rsc_0_1_ARPROT);
    twiddle_rsc_0__1__INST.ARQOS(TLS_twiddle_rsc_0_1_ARQOS);
    twiddle_rsc_0__1__INST.ARREGION(TLS_twiddle_rsc_0_1_ARREGION);
    twiddle_rsc_0__1__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_1_ARUSER);
    twiddle_rsc_0__1__INST.ARVALID(TLS_twiddle_rsc_0_1_ARVALID);
    twiddle_rsc_0__1__INST.ARREADY(TLS_twiddle_rsc_0_1_ARREADY);
    twiddle_rsc_0__1__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_1_RID);
    twiddle_rsc_0__1__INST.RDATA(TLS_twiddle_rsc_0_1_RDATA);
    twiddle_rsc_0__1__INST.RRESP(TLS_twiddle_rsc_0_1_RRESP);
    twiddle_rsc_0__1__INST.RLAST(TLS_twiddle_rsc_0_1_RLAST);
    twiddle_rsc_0__1__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_1_RUSER);
    twiddle_rsc_0__1__INST.RVALID(TLS_twiddle_rsc_0_1_RVALID);
    twiddle_rsc_0__1__INST.RREADY(TLS_twiddle_rsc_0_1_RREADY);
    twiddle_rsc_0__1__INST.tr_write_done(TLS_twiddle_rsc_0_1_tr_write_done);
    twiddle_rsc_0__1__INST.s_tdone(TLS_twiddle_rsc_0_1_s_tdone);
    twiddle_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_32)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWID.outSCALAR(TLS_twiddle_rsc_0_2_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWUSER.outSCALAR(TLS_twiddle_rsc_0_2_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_WUSER.outSCALAR(TLS_twiddle_rsc_0_2_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BID.inSCALAR(TLS_twiddle_rsc_0_2_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BUSER.inSCALAR(TLS_twiddle_rsc_0_2_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARID.outSCALAR(TLS_twiddle_rsc_0_2_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARUSER.outSCALAR(TLS_twiddle_rsc_0_2_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RID.inSCALAR(TLS_twiddle_rsc_0_2_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RUSER.inSCALAR(TLS_twiddle_rsc_0_2_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_2_RUSER);

    twiddle_rsc_0__2__INST.ACLK(clk);
    twiddle_rsc_0__2__INST.ARESETn(rst);
    twiddle_rsc_0__2__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_2_AWID);
    twiddle_rsc_0__2__INST.AWADDR(TLS_twiddle_rsc_0_2_AWADDR);
    twiddle_rsc_0__2__INST.AWLEN(TLS_twiddle_rsc_0_2_AWLEN);
    twiddle_rsc_0__2__INST.AWSIZE(TLS_twiddle_rsc_0_2_AWSIZE);
    twiddle_rsc_0__2__INST.AWBURST(TLS_twiddle_rsc_0_2_AWBURST);
    twiddle_rsc_0__2__INST.AWLOCK(TLS_twiddle_rsc_0_2_AWLOCK);
    twiddle_rsc_0__2__INST.AWCACHE(TLS_twiddle_rsc_0_2_AWCACHE);
    twiddle_rsc_0__2__INST.AWPROT(TLS_twiddle_rsc_0_2_AWPROT);
    twiddle_rsc_0__2__INST.AWQOS(TLS_twiddle_rsc_0_2_AWQOS);
    twiddle_rsc_0__2__INST.AWREGION(TLS_twiddle_rsc_0_2_AWREGION);
    twiddle_rsc_0__2__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_2_AWUSER);
    twiddle_rsc_0__2__INST.AWVALID(TLS_twiddle_rsc_0_2_AWVALID);
    twiddle_rsc_0__2__INST.AWREADY(TLS_twiddle_rsc_0_2_AWREADY);
    twiddle_rsc_0__2__INST.WDATA(TLS_twiddle_rsc_0_2_WDATA);
    twiddle_rsc_0__2__INST.WSTRB(TLS_twiddle_rsc_0_2_WSTRB);
    twiddle_rsc_0__2__INST.WLAST(TLS_twiddle_rsc_0_2_WLAST);
    twiddle_rsc_0__2__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_2_WUSER);
    twiddle_rsc_0__2__INST.WVALID(TLS_twiddle_rsc_0_2_WVALID);
    twiddle_rsc_0__2__INST.WREADY(TLS_twiddle_rsc_0_2_WREADY);
    twiddle_rsc_0__2__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_2_BID);
    twiddle_rsc_0__2__INST.BRESP(TLS_twiddle_rsc_0_2_BRESP);
    twiddle_rsc_0__2__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_2_BUSER);
    twiddle_rsc_0__2__INST.BVALID(TLS_twiddle_rsc_0_2_BVALID);
    twiddle_rsc_0__2__INST.BREADY(TLS_twiddle_rsc_0_2_BREADY);
    twiddle_rsc_0__2__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_2_ARID);
    twiddle_rsc_0__2__INST.ARADDR(TLS_twiddle_rsc_0_2_ARADDR);
    twiddle_rsc_0__2__INST.ARLEN(TLS_twiddle_rsc_0_2_ARLEN);
    twiddle_rsc_0__2__INST.ARSIZE(TLS_twiddle_rsc_0_2_ARSIZE);
    twiddle_rsc_0__2__INST.ARBURST(TLS_twiddle_rsc_0_2_ARBURST);
    twiddle_rsc_0__2__INST.ARLOCK(TLS_twiddle_rsc_0_2_ARLOCK);
    twiddle_rsc_0__2__INST.ARCACHE(TLS_twiddle_rsc_0_2_ARCACHE);
    twiddle_rsc_0__2__INST.ARPROT(TLS_twiddle_rsc_0_2_ARPROT);
    twiddle_rsc_0__2__INST.ARQOS(TLS_twiddle_rsc_0_2_ARQOS);
    twiddle_rsc_0__2__INST.ARREGION(TLS_twiddle_rsc_0_2_ARREGION);
    twiddle_rsc_0__2__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_2_ARUSER);
    twiddle_rsc_0__2__INST.ARVALID(TLS_twiddle_rsc_0_2_ARVALID);
    twiddle_rsc_0__2__INST.ARREADY(TLS_twiddle_rsc_0_2_ARREADY);
    twiddle_rsc_0__2__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_2_RID);
    twiddle_rsc_0__2__INST.RDATA(TLS_twiddle_rsc_0_2_RDATA);
    twiddle_rsc_0__2__INST.RRESP(TLS_twiddle_rsc_0_2_RRESP);
    twiddle_rsc_0__2__INST.RLAST(TLS_twiddle_rsc_0_2_RLAST);
    twiddle_rsc_0__2__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_2_RUSER);
    twiddle_rsc_0__2__INST.RVALID(TLS_twiddle_rsc_0_2_RVALID);
    twiddle_rsc_0__2__INST.RREADY(TLS_twiddle_rsc_0_2_RREADY);
    twiddle_rsc_0__2__INST.tr_write_done(TLS_twiddle_rsc_0_2_tr_write_done);
    twiddle_rsc_0__2__INST.s_tdone(TLS_twiddle_rsc_0_2_s_tdone);
    twiddle_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_33)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWID.outSCALAR(TLS_twiddle_rsc_0_3_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWUSER.outSCALAR(TLS_twiddle_rsc_0_3_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_WUSER.outSCALAR(TLS_twiddle_rsc_0_3_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BID.inSCALAR(TLS_twiddle_rsc_0_3_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BUSER.inSCALAR(TLS_twiddle_rsc_0_3_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARID.outSCALAR(TLS_twiddle_rsc_0_3_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARUSER.outSCALAR(TLS_twiddle_rsc_0_3_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RID.inSCALAR(TLS_twiddle_rsc_0_3_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RUSER.inSCALAR(TLS_twiddle_rsc_0_3_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_3_RUSER);

    twiddle_rsc_0__3__INST.ACLK(clk);
    twiddle_rsc_0__3__INST.ARESETn(rst);
    twiddle_rsc_0__3__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_3_AWID);
    twiddle_rsc_0__3__INST.AWADDR(TLS_twiddle_rsc_0_3_AWADDR);
    twiddle_rsc_0__3__INST.AWLEN(TLS_twiddle_rsc_0_3_AWLEN);
    twiddle_rsc_0__3__INST.AWSIZE(TLS_twiddle_rsc_0_3_AWSIZE);
    twiddle_rsc_0__3__INST.AWBURST(TLS_twiddle_rsc_0_3_AWBURST);
    twiddle_rsc_0__3__INST.AWLOCK(TLS_twiddle_rsc_0_3_AWLOCK);
    twiddle_rsc_0__3__INST.AWCACHE(TLS_twiddle_rsc_0_3_AWCACHE);
    twiddle_rsc_0__3__INST.AWPROT(TLS_twiddle_rsc_0_3_AWPROT);
    twiddle_rsc_0__3__INST.AWQOS(TLS_twiddle_rsc_0_3_AWQOS);
    twiddle_rsc_0__3__INST.AWREGION(TLS_twiddle_rsc_0_3_AWREGION);
    twiddle_rsc_0__3__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_3_AWUSER);
    twiddle_rsc_0__3__INST.AWVALID(TLS_twiddle_rsc_0_3_AWVALID);
    twiddle_rsc_0__3__INST.AWREADY(TLS_twiddle_rsc_0_3_AWREADY);
    twiddle_rsc_0__3__INST.WDATA(TLS_twiddle_rsc_0_3_WDATA);
    twiddle_rsc_0__3__INST.WSTRB(TLS_twiddle_rsc_0_3_WSTRB);
    twiddle_rsc_0__3__INST.WLAST(TLS_twiddle_rsc_0_3_WLAST);
    twiddle_rsc_0__3__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_3_WUSER);
    twiddle_rsc_0__3__INST.WVALID(TLS_twiddle_rsc_0_3_WVALID);
    twiddle_rsc_0__3__INST.WREADY(TLS_twiddle_rsc_0_3_WREADY);
    twiddle_rsc_0__3__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_3_BID);
    twiddle_rsc_0__3__INST.BRESP(TLS_twiddle_rsc_0_3_BRESP);
    twiddle_rsc_0__3__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_3_BUSER);
    twiddle_rsc_0__3__INST.BVALID(TLS_twiddle_rsc_0_3_BVALID);
    twiddle_rsc_0__3__INST.BREADY(TLS_twiddle_rsc_0_3_BREADY);
    twiddle_rsc_0__3__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_3_ARID);
    twiddle_rsc_0__3__INST.ARADDR(TLS_twiddle_rsc_0_3_ARADDR);
    twiddle_rsc_0__3__INST.ARLEN(TLS_twiddle_rsc_0_3_ARLEN);
    twiddle_rsc_0__3__INST.ARSIZE(TLS_twiddle_rsc_0_3_ARSIZE);
    twiddle_rsc_0__3__INST.ARBURST(TLS_twiddle_rsc_0_3_ARBURST);
    twiddle_rsc_0__3__INST.ARLOCK(TLS_twiddle_rsc_0_3_ARLOCK);
    twiddle_rsc_0__3__INST.ARCACHE(TLS_twiddle_rsc_0_3_ARCACHE);
    twiddle_rsc_0__3__INST.ARPROT(TLS_twiddle_rsc_0_3_ARPROT);
    twiddle_rsc_0__3__INST.ARQOS(TLS_twiddle_rsc_0_3_ARQOS);
    twiddle_rsc_0__3__INST.ARREGION(TLS_twiddle_rsc_0_3_ARREGION);
    twiddle_rsc_0__3__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_3_ARUSER);
    twiddle_rsc_0__3__INST.ARVALID(TLS_twiddle_rsc_0_3_ARVALID);
    twiddle_rsc_0__3__INST.ARREADY(TLS_twiddle_rsc_0_3_ARREADY);
    twiddle_rsc_0__3__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_3_RID);
    twiddle_rsc_0__3__INST.RDATA(TLS_twiddle_rsc_0_3_RDATA);
    twiddle_rsc_0__3__INST.RRESP(TLS_twiddle_rsc_0_3_RRESP);
    twiddle_rsc_0__3__INST.RLAST(TLS_twiddle_rsc_0_3_RLAST);
    twiddle_rsc_0__3__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_3_RUSER);
    twiddle_rsc_0__3__INST.RVALID(TLS_twiddle_rsc_0_3_RVALID);
    twiddle_rsc_0__3__INST.RREADY(TLS_twiddle_rsc_0_3_RREADY);
    twiddle_rsc_0__3__INST.tr_write_done(TLS_twiddle_rsc_0_3_tr_write_done);
    twiddle_rsc_0__3__INST.s_tdone(TLS_twiddle_rsc_0_3_s_tdone);
    twiddle_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_34)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWID.outSCALAR(TLS_twiddle_h_rsc_0_0_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_0_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BID.inSCALAR(TLS_twiddle_h_rsc_0_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARID.outSCALAR(TLS_twiddle_h_rsc_0_0_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RID.inSCALAR(TLS_twiddle_h_rsc_0_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER);

    twiddle_h_rsc_0__0__INST.ACLK(clk);
    twiddle_h_rsc_0__0__INST.ARESETn(rst);
    twiddle_h_rsc_0__0__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_0_AWID);
    twiddle_h_rsc_0__0__INST.AWADDR(TLS_twiddle_h_rsc_0_0_AWADDR);
    twiddle_h_rsc_0__0__INST.AWLEN(TLS_twiddle_h_rsc_0_0_AWLEN);
    twiddle_h_rsc_0__0__INST.AWSIZE(TLS_twiddle_h_rsc_0_0_AWSIZE);
    twiddle_h_rsc_0__0__INST.AWBURST(TLS_twiddle_h_rsc_0_0_AWBURST);
    twiddle_h_rsc_0__0__INST.AWLOCK(TLS_twiddle_h_rsc_0_0_AWLOCK);
    twiddle_h_rsc_0__0__INST.AWCACHE(TLS_twiddle_h_rsc_0_0_AWCACHE);
    twiddle_h_rsc_0__0__INST.AWPROT(TLS_twiddle_h_rsc_0_0_AWPROT);
    twiddle_h_rsc_0__0__INST.AWQOS(TLS_twiddle_h_rsc_0_0_AWQOS);
    twiddle_h_rsc_0__0__INST.AWREGION(TLS_twiddle_h_rsc_0_0_AWREGION);
    twiddle_h_rsc_0__0__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_0_AWUSER);
    twiddle_h_rsc_0__0__INST.AWVALID(TLS_twiddle_h_rsc_0_0_AWVALID);
    twiddle_h_rsc_0__0__INST.AWREADY(TLS_twiddle_h_rsc_0_0_AWREADY);
    twiddle_h_rsc_0__0__INST.WDATA(TLS_twiddle_h_rsc_0_0_WDATA);
    twiddle_h_rsc_0__0__INST.WSTRB(TLS_twiddle_h_rsc_0_0_WSTRB);
    twiddle_h_rsc_0__0__INST.WLAST(TLS_twiddle_h_rsc_0_0_WLAST);
    twiddle_h_rsc_0__0__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_0_WUSER);
    twiddle_h_rsc_0__0__INST.WVALID(TLS_twiddle_h_rsc_0_0_WVALID);
    twiddle_h_rsc_0__0__INST.WREADY(TLS_twiddle_h_rsc_0_0_WREADY);
    twiddle_h_rsc_0__0__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_0_BID);
    twiddle_h_rsc_0__0__INST.BRESP(TLS_twiddle_h_rsc_0_0_BRESP);
    twiddle_h_rsc_0__0__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER);
    twiddle_h_rsc_0__0__INST.BVALID(TLS_twiddle_h_rsc_0_0_BVALID);
    twiddle_h_rsc_0__0__INST.BREADY(TLS_twiddle_h_rsc_0_0_BREADY);
    twiddle_h_rsc_0__0__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_0_ARID);
    twiddle_h_rsc_0__0__INST.ARADDR(TLS_twiddle_h_rsc_0_0_ARADDR);
    twiddle_h_rsc_0__0__INST.ARLEN(TLS_twiddle_h_rsc_0_0_ARLEN);
    twiddle_h_rsc_0__0__INST.ARSIZE(TLS_twiddle_h_rsc_0_0_ARSIZE);
    twiddle_h_rsc_0__0__INST.ARBURST(TLS_twiddle_h_rsc_0_0_ARBURST);
    twiddle_h_rsc_0__0__INST.ARLOCK(TLS_twiddle_h_rsc_0_0_ARLOCK);
    twiddle_h_rsc_0__0__INST.ARCACHE(TLS_twiddle_h_rsc_0_0_ARCACHE);
    twiddle_h_rsc_0__0__INST.ARPROT(TLS_twiddle_h_rsc_0_0_ARPROT);
    twiddle_h_rsc_0__0__INST.ARQOS(TLS_twiddle_h_rsc_0_0_ARQOS);
    twiddle_h_rsc_0__0__INST.ARREGION(TLS_twiddle_h_rsc_0_0_ARREGION);
    twiddle_h_rsc_0__0__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_0_ARUSER);
    twiddle_h_rsc_0__0__INST.ARVALID(TLS_twiddle_h_rsc_0_0_ARVALID);
    twiddle_h_rsc_0__0__INST.ARREADY(TLS_twiddle_h_rsc_0_0_ARREADY);
    twiddle_h_rsc_0__0__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_0_RID);
    twiddle_h_rsc_0__0__INST.RDATA(TLS_twiddle_h_rsc_0_0_RDATA);
    twiddle_h_rsc_0__0__INST.RRESP(TLS_twiddle_h_rsc_0_0_RRESP);
    twiddle_h_rsc_0__0__INST.RLAST(TLS_twiddle_h_rsc_0_0_RLAST);
    twiddle_h_rsc_0__0__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER);
    twiddle_h_rsc_0__0__INST.RVALID(TLS_twiddle_h_rsc_0_0_RVALID);
    twiddle_h_rsc_0__0__INST.RREADY(TLS_twiddle_h_rsc_0_0_RREADY);
    twiddle_h_rsc_0__0__INST.tr_write_done(TLS_twiddle_h_rsc_0_0_tr_write_done);
    twiddle_h_rsc_0__0__INST.s_tdone(TLS_twiddle_h_rsc_0_0_s_tdone);
    twiddle_h_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_35)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWID.outSCALAR(TLS_twiddle_h_rsc_0_1_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_1_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_1_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BID.inSCALAR(TLS_twiddle_h_rsc_0_1_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_1_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARID.outSCALAR(TLS_twiddle_h_rsc_0_1_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_1_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RID.inSCALAR(TLS_twiddle_h_rsc_0_1_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_1_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER);

    twiddle_h_rsc_0__1__INST.ACLK(clk);
    twiddle_h_rsc_0__1__INST.ARESETn(rst);
    twiddle_h_rsc_0__1__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_1_AWID);
    twiddle_h_rsc_0__1__INST.AWADDR(TLS_twiddle_h_rsc_0_1_AWADDR);
    twiddle_h_rsc_0__1__INST.AWLEN(TLS_twiddle_h_rsc_0_1_AWLEN);
    twiddle_h_rsc_0__1__INST.AWSIZE(TLS_twiddle_h_rsc_0_1_AWSIZE);
    twiddle_h_rsc_0__1__INST.AWBURST(TLS_twiddle_h_rsc_0_1_AWBURST);
    twiddle_h_rsc_0__1__INST.AWLOCK(TLS_twiddle_h_rsc_0_1_AWLOCK);
    twiddle_h_rsc_0__1__INST.AWCACHE(TLS_twiddle_h_rsc_0_1_AWCACHE);
    twiddle_h_rsc_0__1__INST.AWPROT(TLS_twiddle_h_rsc_0_1_AWPROT);
    twiddle_h_rsc_0__1__INST.AWQOS(TLS_twiddle_h_rsc_0_1_AWQOS);
    twiddle_h_rsc_0__1__INST.AWREGION(TLS_twiddle_h_rsc_0_1_AWREGION);
    twiddle_h_rsc_0__1__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_1_AWUSER);
    twiddle_h_rsc_0__1__INST.AWVALID(TLS_twiddle_h_rsc_0_1_AWVALID);
    twiddle_h_rsc_0__1__INST.AWREADY(TLS_twiddle_h_rsc_0_1_AWREADY);
    twiddle_h_rsc_0__1__INST.WDATA(TLS_twiddle_h_rsc_0_1_WDATA);
    twiddle_h_rsc_0__1__INST.WSTRB(TLS_twiddle_h_rsc_0_1_WSTRB);
    twiddle_h_rsc_0__1__INST.WLAST(TLS_twiddle_h_rsc_0_1_WLAST);
    twiddle_h_rsc_0__1__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_1_WUSER);
    twiddle_h_rsc_0__1__INST.WVALID(TLS_twiddle_h_rsc_0_1_WVALID);
    twiddle_h_rsc_0__1__INST.WREADY(TLS_twiddle_h_rsc_0_1_WREADY);
    twiddle_h_rsc_0__1__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_1_BID);
    twiddle_h_rsc_0__1__INST.BRESP(TLS_twiddle_h_rsc_0_1_BRESP);
    twiddle_h_rsc_0__1__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER);
    twiddle_h_rsc_0__1__INST.BVALID(TLS_twiddle_h_rsc_0_1_BVALID);
    twiddle_h_rsc_0__1__INST.BREADY(TLS_twiddle_h_rsc_0_1_BREADY);
    twiddle_h_rsc_0__1__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_1_ARID);
    twiddle_h_rsc_0__1__INST.ARADDR(TLS_twiddle_h_rsc_0_1_ARADDR);
    twiddle_h_rsc_0__1__INST.ARLEN(TLS_twiddle_h_rsc_0_1_ARLEN);
    twiddle_h_rsc_0__1__INST.ARSIZE(TLS_twiddle_h_rsc_0_1_ARSIZE);
    twiddle_h_rsc_0__1__INST.ARBURST(TLS_twiddle_h_rsc_0_1_ARBURST);
    twiddle_h_rsc_0__1__INST.ARLOCK(TLS_twiddle_h_rsc_0_1_ARLOCK);
    twiddle_h_rsc_0__1__INST.ARCACHE(TLS_twiddle_h_rsc_0_1_ARCACHE);
    twiddle_h_rsc_0__1__INST.ARPROT(TLS_twiddle_h_rsc_0_1_ARPROT);
    twiddle_h_rsc_0__1__INST.ARQOS(TLS_twiddle_h_rsc_0_1_ARQOS);
    twiddle_h_rsc_0__1__INST.ARREGION(TLS_twiddle_h_rsc_0_1_ARREGION);
    twiddle_h_rsc_0__1__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_1_ARUSER);
    twiddle_h_rsc_0__1__INST.ARVALID(TLS_twiddle_h_rsc_0_1_ARVALID);
    twiddle_h_rsc_0__1__INST.ARREADY(TLS_twiddle_h_rsc_0_1_ARREADY);
    twiddle_h_rsc_0__1__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_1_RID);
    twiddle_h_rsc_0__1__INST.RDATA(TLS_twiddle_h_rsc_0_1_RDATA);
    twiddle_h_rsc_0__1__INST.RRESP(TLS_twiddle_h_rsc_0_1_RRESP);
    twiddle_h_rsc_0__1__INST.RLAST(TLS_twiddle_h_rsc_0_1_RLAST);
    twiddle_h_rsc_0__1__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER);
    twiddle_h_rsc_0__1__INST.RVALID(TLS_twiddle_h_rsc_0_1_RVALID);
    twiddle_h_rsc_0__1__INST.RREADY(TLS_twiddle_h_rsc_0_1_RREADY);
    twiddle_h_rsc_0__1__INST.tr_write_done(TLS_twiddle_h_rsc_0_1_tr_write_done);
    twiddle_h_rsc_0__1__INST.s_tdone(TLS_twiddle_h_rsc_0_1_s_tdone);
    twiddle_h_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_36)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWID.outSCALAR(TLS_twiddle_h_rsc_0_2_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_2_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_2_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BID.inSCALAR(TLS_twiddle_h_rsc_0_2_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_2_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARID.outSCALAR(TLS_twiddle_h_rsc_0_2_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_2_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RID.inSCALAR(TLS_twiddle_h_rsc_0_2_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_2_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER);

    twiddle_h_rsc_0__2__INST.ACLK(clk);
    twiddle_h_rsc_0__2__INST.ARESETn(rst);
    twiddle_h_rsc_0__2__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_2_AWID);
    twiddle_h_rsc_0__2__INST.AWADDR(TLS_twiddle_h_rsc_0_2_AWADDR);
    twiddle_h_rsc_0__2__INST.AWLEN(TLS_twiddle_h_rsc_0_2_AWLEN);
    twiddle_h_rsc_0__2__INST.AWSIZE(TLS_twiddle_h_rsc_0_2_AWSIZE);
    twiddle_h_rsc_0__2__INST.AWBURST(TLS_twiddle_h_rsc_0_2_AWBURST);
    twiddle_h_rsc_0__2__INST.AWLOCK(TLS_twiddle_h_rsc_0_2_AWLOCK);
    twiddle_h_rsc_0__2__INST.AWCACHE(TLS_twiddle_h_rsc_0_2_AWCACHE);
    twiddle_h_rsc_0__2__INST.AWPROT(TLS_twiddle_h_rsc_0_2_AWPROT);
    twiddle_h_rsc_0__2__INST.AWQOS(TLS_twiddle_h_rsc_0_2_AWQOS);
    twiddle_h_rsc_0__2__INST.AWREGION(TLS_twiddle_h_rsc_0_2_AWREGION);
    twiddle_h_rsc_0__2__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_2_AWUSER);
    twiddle_h_rsc_0__2__INST.AWVALID(TLS_twiddle_h_rsc_0_2_AWVALID);
    twiddle_h_rsc_0__2__INST.AWREADY(TLS_twiddle_h_rsc_0_2_AWREADY);
    twiddle_h_rsc_0__2__INST.WDATA(TLS_twiddle_h_rsc_0_2_WDATA);
    twiddle_h_rsc_0__2__INST.WSTRB(TLS_twiddle_h_rsc_0_2_WSTRB);
    twiddle_h_rsc_0__2__INST.WLAST(TLS_twiddle_h_rsc_0_2_WLAST);
    twiddle_h_rsc_0__2__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_2_WUSER);
    twiddle_h_rsc_0__2__INST.WVALID(TLS_twiddle_h_rsc_0_2_WVALID);
    twiddle_h_rsc_0__2__INST.WREADY(TLS_twiddle_h_rsc_0_2_WREADY);
    twiddle_h_rsc_0__2__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_2_BID);
    twiddle_h_rsc_0__2__INST.BRESP(TLS_twiddle_h_rsc_0_2_BRESP);
    twiddle_h_rsc_0__2__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER);
    twiddle_h_rsc_0__2__INST.BVALID(TLS_twiddle_h_rsc_0_2_BVALID);
    twiddle_h_rsc_0__2__INST.BREADY(TLS_twiddle_h_rsc_0_2_BREADY);
    twiddle_h_rsc_0__2__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_2_ARID);
    twiddle_h_rsc_0__2__INST.ARADDR(TLS_twiddle_h_rsc_0_2_ARADDR);
    twiddle_h_rsc_0__2__INST.ARLEN(TLS_twiddle_h_rsc_0_2_ARLEN);
    twiddle_h_rsc_0__2__INST.ARSIZE(TLS_twiddle_h_rsc_0_2_ARSIZE);
    twiddle_h_rsc_0__2__INST.ARBURST(TLS_twiddle_h_rsc_0_2_ARBURST);
    twiddle_h_rsc_0__2__INST.ARLOCK(TLS_twiddle_h_rsc_0_2_ARLOCK);
    twiddle_h_rsc_0__2__INST.ARCACHE(TLS_twiddle_h_rsc_0_2_ARCACHE);
    twiddle_h_rsc_0__2__INST.ARPROT(TLS_twiddle_h_rsc_0_2_ARPROT);
    twiddle_h_rsc_0__2__INST.ARQOS(TLS_twiddle_h_rsc_0_2_ARQOS);
    twiddle_h_rsc_0__2__INST.ARREGION(TLS_twiddle_h_rsc_0_2_ARREGION);
    twiddle_h_rsc_0__2__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_2_ARUSER);
    twiddle_h_rsc_0__2__INST.ARVALID(TLS_twiddle_h_rsc_0_2_ARVALID);
    twiddle_h_rsc_0__2__INST.ARREADY(TLS_twiddle_h_rsc_0_2_ARREADY);
    twiddle_h_rsc_0__2__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_2_RID);
    twiddle_h_rsc_0__2__INST.RDATA(TLS_twiddle_h_rsc_0_2_RDATA);
    twiddle_h_rsc_0__2__INST.RRESP(TLS_twiddle_h_rsc_0_2_RRESP);
    twiddle_h_rsc_0__2__INST.RLAST(TLS_twiddle_h_rsc_0_2_RLAST);
    twiddle_h_rsc_0__2__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER);
    twiddle_h_rsc_0__2__INST.RVALID(TLS_twiddle_h_rsc_0_2_RVALID);
    twiddle_h_rsc_0__2__INST.RREADY(TLS_twiddle_h_rsc_0_2_RREADY);
    twiddle_h_rsc_0__2__INST.tr_write_done(TLS_twiddle_h_rsc_0_2_tr_write_done);
    twiddle_h_rsc_0__2__INST.s_tdone(TLS_twiddle_h_rsc_0_2_s_tdone);
    twiddle_h_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_37)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWID.outSCALAR(TLS_twiddle_h_rsc_0_3_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_3_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_3_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BID.inSCALAR(TLS_twiddle_h_rsc_0_3_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_3_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARID.outSCALAR(TLS_twiddle_h_rsc_0_3_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_3_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RID.inSCALAR(TLS_twiddle_h_rsc_0_3_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_3_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER);

    twiddle_h_rsc_0__3__INST.ACLK(clk);
    twiddle_h_rsc_0__3__INST.ARESETn(rst);
    twiddle_h_rsc_0__3__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_3_AWID);
    twiddle_h_rsc_0__3__INST.AWADDR(TLS_twiddle_h_rsc_0_3_AWADDR);
    twiddle_h_rsc_0__3__INST.AWLEN(TLS_twiddle_h_rsc_0_3_AWLEN);
    twiddle_h_rsc_0__3__INST.AWSIZE(TLS_twiddle_h_rsc_0_3_AWSIZE);
    twiddle_h_rsc_0__3__INST.AWBURST(TLS_twiddle_h_rsc_0_3_AWBURST);
    twiddle_h_rsc_0__3__INST.AWLOCK(TLS_twiddle_h_rsc_0_3_AWLOCK);
    twiddle_h_rsc_0__3__INST.AWCACHE(TLS_twiddle_h_rsc_0_3_AWCACHE);
    twiddle_h_rsc_0__3__INST.AWPROT(TLS_twiddle_h_rsc_0_3_AWPROT);
    twiddle_h_rsc_0__3__INST.AWQOS(TLS_twiddle_h_rsc_0_3_AWQOS);
    twiddle_h_rsc_0__3__INST.AWREGION(TLS_twiddle_h_rsc_0_3_AWREGION);
    twiddle_h_rsc_0__3__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_3_AWUSER);
    twiddle_h_rsc_0__3__INST.AWVALID(TLS_twiddle_h_rsc_0_3_AWVALID);
    twiddle_h_rsc_0__3__INST.AWREADY(TLS_twiddle_h_rsc_0_3_AWREADY);
    twiddle_h_rsc_0__3__INST.WDATA(TLS_twiddle_h_rsc_0_3_WDATA);
    twiddle_h_rsc_0__3__INST.WSTRB(TLS_twiddle_h_rsc_0_3_WSTRB);
    twiddle_h_rsc_0__3__INST.WLAST(TLS_twiddle_h_rsc_0_3_WLAST);
    twiddle_h_rsc_0__3__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_3_WUSER);
    twiddle_h_rsc_0__3__INST.WVALID(TLS_twiddle_h_rsc_0_3_WVALID);
    twiddle_h_rsc_0__3__INST.WREADY(TLS_twiddle_h_rsc_0_3_WREADY);
    twiddle_h_rsc_0__3__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_3_BID);
    twiddle_h_rsc_0__3__INST.BRESP(TLS_twiddle_h_rsc_0_3_BRESP);
    twiddle_h_rsc_0__3__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER);
    twiddle_h_rsc_0__3__INST.BVALID(TLS_twiddle_h_rsc_0_3_BVALID);
    twiddle_h_rsc_0__3__INST.BREADY(TLS_twiddle_h_rsc_0_3_BREADY);
    twiddle_h_rsc_0__3__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_3_ARID);
    twiddle_h_rsc_0__3__INST.ARADDR(TLS_twiddle_h_rsc_0_3_ARADDR);
    twiddle_h_rsc_0__3__INST.ARLEN(TLS_twiddle_h_rsc_0_3_ARLEN);
    twiddle_h_rsc_0__3__INST.ARSIZE(TLS_twiddle_h_rsc_0_3_ARSIZE);
    twiddle_h_rsc_0__3__INST.ARBURST(TLS_twiddle_h_rsc_0_3_ARBURST);
    twiddle_h_rsc_0__3__INST.ARLOCK(TLS_twiddle_h_rsc_0_3_ARLOCK);
    twiddle_h_rsc_0__3__INST.ARCACHE(TLS_twiddle_h_rsc_0_3_ARCACHE);
    twiddle_h_rsc_0__3__INST.ARPROT(TLS_twiddle_h_rsc_0_3_ARPROT);
    twiddle_h_rsc_0__3__INST.ARQOS(TLS_twiddle_h_rsc_0_3_ARQOS);
    twiddle_h_rsc_0__3__INST.ARREGION(TLS_twiddle_h_rsc_0_3_ARREGION);
    twiddle_h_rsc_0__3__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_3_ARUSER);
    twiddle_h_rsc_0__3__INST.ARVALID(TLS_twiddle_h_rsc_0_3_ARVALID);
    twiddle_h_rsc_0__3__INST.ARREADY(TLS_twiddle_h_rsc_0_3_ARREADY);
    twiddle_h_rsc_0__3__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_3_RID);
    twiddle_h_rsc_0__3__INST.RDATA(TLS_twiddle_h_rsc_0_3_RDATA);
    twiddle_h_rsc_0__3__INST.RRESP(TLS_twiddle_h_rsc_0_3_RRESP);
    twiddle_h_rsc_0__3__INST.RLAST(TLS_twiddle_h_rsc_0_3_RLAST);
    twiddle_h_rsc_0__3__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER);
    twiddle_h_rsc_0__3__INST.RVALID(TLS_twiddle_h_rsc_0_3_RVALID);
    twiddle_h_rsc_0__3__INST.RREADY(TLS_twiddle_h_rsc_0_3_RREADY);
    twiddle_h_rsc_0__3__INST.tr_write_done(TLS_twiddle_h_rsc_0_3_tr_write_done);
    twiddle_h_rsc_0__3__INST.s_tdone(TLS_twiddle_h_rsc_0_3_s_tdone);
    twiddle_h_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_38)));

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
        1016, 8);
    transactor_xt.register_block(&xt_rsc_0__1__INST, xt_rsc_0__1__INST.basename(), TLS_xt_rsc_triosy_0_1_lz, 1,
        1017, 8);
    transactor_xt.register_block(&xt_rsc_0__2__INST, xt_rsc_0__2__INST.basename(), TLS_xt_rsc_triosy_0_2_lz, 2,
        1018, 8);
    transactor_xt.register_block(&xt_rsc_0__3__INST, xt_rsc_0__3__INST.basename(), TLS_xt_rsc_triosy_0_3_lz, 3,
        1019, 8);
    transactor_xt.register_block(&xt_rsc_0__4__INST, xt_rsc_0__4__INST.basename(), TLS_xt_rsc_triosy_0_4_lz, 4,
        1020, 8);
    transactor_xt.register_block(&xt_rsc_0__5__INST, xt_rsc_0__5__INST.basename(), TLS_xt_rsc_triosy_0_5_lz, 5,
        1021, 8);
    transactor_xt.register_block(&xt_rsc_0__6__INST, xt_rsc_0__6__INST.basename(), TLS_xt_rsc_triosy_0_6_lz, 6,
        1022, 8);
    transactor_xt.register_block(&xt_rsc_0__7__INST, xt_rsc_0__7__INST.basename(), TLS_xt_rsc_triosy_0_7_lz, 7,
        1023, 8);

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
  xt_rsc_0__4__INST.clear();
  xt_rsc_0__5__INST.clear();
  xt_rsc_0__6__INST.clear();
  xt_rsc_0__7__INST.clear();
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
    generate_reset_event.notify(110.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(110.000000 , SC_NS);
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
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_staller_inst_core_wen, /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_staller_inst/core_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_0_i_inst/peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst/twiddle_rsc_0_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_0_i_inst/peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst/twiddle_rsc_0_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_0_i_inst/peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst/twiddle_rsc_0_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_1_i_inst/peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst/twiddle_rsc_0_1_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_1_i_inst/peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst/twiddle_rsc_0_1_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_1_i_inst/peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst/twiddle_rsc_0_1_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_2_i_inst/peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst/twiddle_rsc_0_2_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_2_i_inst/peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst/twiddle_rsc_0_2_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_2_i_inst/peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst/twiddle_rsc_0_2_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_3_i_inst/peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst/twiddle_rsc_0_3_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_3_i_inst/peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst/twiddle_rsc_0_3_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_3_i_inst/peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst/twiddle_rsc_0_3_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_0_i_inst/peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst/twiddle_h_rsc_0_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_0_i_inst/peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst/twiddle_h_rsc_0_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_0_i_inst/peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst/twiddle_h_rsc_0_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_1_i_inst/peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst/twiddle_h_rsc_0_1_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_1_i_inst/peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst/twiddle_h_rsc_0_1_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_1_i_inst/peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst/twiddle_h_rsc_0_1_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_2_i_inst/peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst/twiddle_h_rsc_0_2_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_2_i_inst/peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst/twiddle_h_rsc_0_2_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_2_i_inst/peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst/twiddle_h_rsc_0_2_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_3_i_inst/peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst/twiddle_h_rsc_0_3_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_3_i_inst/peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst/twiddle_h_rsc_0_3_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_3_i_inst/peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst/twiddle_h_rsc_0_3_i_s_raddr_core_sct);
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
