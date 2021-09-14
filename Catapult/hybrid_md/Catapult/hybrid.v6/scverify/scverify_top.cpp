#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_slave_mem_trans_rsc.h"
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
#define TOP_HDL_ENTITY hybrid
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_1;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_4;
extern double __scv_hold_time_RSCID_5;
extern double __scv_hold_time_RSCID_6;
extern double __scv_hold_time_RSCID_7;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_1 = 0;
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_4 = 0;
double __scv_hold_time_RSCID_5 = 0;
double __scv_hold_time_RSCID_6 = 0;
double __scv_hold_time_RSCID_7 = 0;
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
  sc_signal<sc_logic>                                                          TLS_x_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_lz;
  sc_signal<sc_lv<32> >                                                        TLS_m_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_m_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_h_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_h_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_twiddle_h_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_twiddle_h_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_revArr_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_revArr_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_revArr_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_revArr_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_revArr_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_revArr_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_revArr_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_revArr_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_revArr_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_revArr_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_revArr_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_revArr_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_revArr_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_revArr_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_revArr_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_revArr_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_tw_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_tw_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_tw_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_tw_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_tw_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_tw_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_tw_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_tw_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_tw_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_tw_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_tw_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_tw_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_tw_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_tw_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_tw_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_tw_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_tw_h_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_tw_h_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_tw_h_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_tw_h_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_tw_h_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_tw_h_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_tw_h_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_tw_h_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_tw_h_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_tw_h_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_tw_h_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_tw_h_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_tw_h_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_tw_h_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_tw_h_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_tw_h_rsc_triosy_lz;
  ccs_DUT_wrapper                                                              hybrid_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                x_rsc_INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   m_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  twiddle_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_twiddle_h_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_twiddle_h_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  twiddle_h_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_revArr_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_revArr_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_revArr_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_revArr_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_revArr_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_revArr_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,20,32,0,0,12,32,1,1,1,0,0 >                  revArr_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                tw_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_h_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_h_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_h_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_h_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_tw_h_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_tw_h_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                tw_h_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_x;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_x;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_out_fifo_x;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_x;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_x;
  tlm::tlm_fifo<ac_int<32, false > >                                           TLS_in_fifo_m;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_m;
  mc_trios_input_monitor                                                       trios_monitor_m_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                             transactor_m;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,32> >                  TLS_in_fifo_twiddle;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,32>,32,false>    transactor_twiddle;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,32> >                  TLS_in_fifo_twiddle_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle_h;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,32>,32,false>    transactor_twiddle_h;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<20, true >,32> >                   TLS_in_fifo_revArr;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_revArr;
  mc_trios_input_monitor                                                       trios_monitor_revArr_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<20, true >,32>,20,true>      transactor_revArr;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_tw;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_tw;
  mc_trios_input_monitor                                                       trios_monitor_tw_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_tw;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_tw_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_tw_h;
  mc_trios_input_monitor                                                       trios_monitor_tw_h_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_tw_h;
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
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_staller_inst_core_wen;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_twiddle_rsci_inst_hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_twiddle_rsci_inst_hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_twiddle_rsci_inst_hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_twiddle_h_rsci_inst_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_twiddle_h_rsci_inst_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_twiddle_h_rsci_inst_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst_revArr_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst_revArr_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst_tw_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst_tw_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst_tw_h_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst_tw_h_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr_core_sct;
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
    , CCS_CLK_CTOR(clk, "clk", 5.88, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 111.720001, false)
    , TLS_rst("TLS_rst")
    , TLS_x_rsc_s_tdone("TLS_x_rsc_s_tdone")
    , TLS_x_rsc_tr_write_done("TLS_x_rsc_tr_write_done")
    , TLS_x_rsc_RREADY("TLS_x_rsc_RREADY")
    , TLS_x_rsc_RVALID("TLS_x_rsc_RVALID")
    , TLS_x_rsc_RUSER("TLS_x_rsc_RUSER")
    , TLS_x_rsc_RLAST("TLS_x_rsc_RLAST")
    , TLS_x_rsc_RRESP("TLS_x_rsc_RRESP")
    , TLS_x_rsc_RDATA("TLS_x_rsc_RDATA")
    , TLS_x_rsc_RID("TLS_x_rsc_RID")
    , TLS_x_rsc_ARREADY("TLS_x_rsc_ARREADY")
    , TLS_x_rsc_ARVALID("TLS_x_rsc_ARVALID")
    , TLS_x_rsc_ARUSER("TLS_x_rsc_ARUSER")
    , TLS_x_rsc_ARREGION("TLS_x_rsc_ARREGION")
    , TLS_x_rsc_ARQOS("TLS_x_rsc_ARQOS")
    , TLS_x_rsc_ARPROT("TLS_x_rsc_ARPROT")
    , TLS_x_rsc_ARCACHE("TLS_x_rsc_ARCACHE")
    , TLS_x_rsc_ARLOCK("TLS_x_rsc_ARLOCK")
    , TLS_x_rsc_ARBURST("TLS_x_rsc_ARBURST")
    , TLS_x_rsc_ARSIZE("TLS_x_rsc_ARSIZE")
    , TLS_x_rsc_ARLEN("TLS_x_rsc_ARLEN")
    , TLS_x_rsc_ARADDR("TLS_x_rsc_ARADDR")
    , TLS_x_rsc_ARID("TLS_x_rsc_ARID")
    , TLS_x_rsc_BREADY("TLS_x_rsc_BREADY")
    , TLS_x_rsc_BVALID("TLS_x_rsc_BVALID")
    , TLS_x_rsc_BUSER("TLS_x_rsc_BUSER")
    , TLS_x_rsc_BRESP("TLS_x_rsc_BRESP")
    , TLS_x_rsc_BID("TLS_x_rsc_BID")
    , TLS_x_rsc_WREADY("TLS_x_rsc_WREADY")
    , TLS_x_rsc_WVALID("TLS_x_rsc_WVALID")
    , TLS_x_rsc_WUSER("TLS_x_rsc_WUSER")
    , TLS_x_rsc_WLAST("TLS_x_rsc_WLAST")
    , TLS_x_rsc_WSTRB("TLS_x_rsc_WSTRB")
    , TLS_x_rsc_WDATA("TLS_x_rsc_WDATA")
    , TLS_x_rsc_AWREADY("TLS_x_rsc_AWREADY")
    , TLS_x_rsc_AWVALID("TLS_x_rsc_AWVALID")
    , TLS_x_rsc_AWUSER("TLS_x_rsc_AWUSER")
    , TLS_x_rsc_AWREGION("TLS_x_rsc_AWREGION")
    , TLS_x_rsc_AWQOS("TLS_x_rsc_AWQOS")
    , TLS_x_rsc_AWPROT("TLS_x_rsc_AWPROT")
    , TLS_x_rsc_AWCACHE("TLS_x_rsc_AWCACHE")
    , TLS_x_rsc_AWLOCK("TLS_x_rsc_AWLOCK")
    , TLS_x_rsc_AWBURST("TLS_x_rsc_AWBURST")
    , TLS_x_rsc_AWSIZE("TLS_x_rsc_AWSIZE")
    , TLS_x_rsc_AWLEN("TLS_x_rsc_AWLEN")
    , TLS_x_rsc_AWADDR("TLS_x_rsc_AWADDR")
    , TLS_x_rsc_AWID("TLS_x_rsc_AWID")
    , TLS_x_rsc_triosy_lz("TLS_x_rsc_triosy_lz")
    , TLS_m_rsc_dat("TLS_m_rsc_dat")
    , TLS_m_rsc_triosy_lz("TLS_m_rsc_triosy_lz")
    , TLS_twiddle_rsc_s_tdone("TLS_twiddle_rsc_s_tdone")
    , TLS_twiddle_rsc_tr_write_done("TLS_twiddle_rsc_tr_write_done")
    , TLS_twiddle_rsc_RREADY("TLS_twiddle_rsc_RREADY")
    , TLS_twiddle_rsc_RVALID("TLS_twiddle_rsc_RVALID")
    , TLS_twiddle_rsc_RUSER("TLS_twiddle_rsc_RUSER")
    , TLS_twiddle_rsc_RLAST("TLS_twiddle_rsc_RLAST")
    , TLS_twiddle_rsc_RRESP("TLS_twiddle_rsc_RRESP")
    , TLS_twiddle_rsc_RDATA("TLS_twiddle_rsc_RDATA")
    , TLS_twiddle_rsc_RID("TLS_twiddle_rsc_RID")
    , TLS_twiddle_rsc_ARREADY("TLS_twiddle_rsc_ARREADY")
    , TLS_twiddle_rsc_ARVALID("TLS_twiddle_rsc_ARVALID")
    , TLS_twiddle_rsc_ARUSER("TLS_twiddle_rsc_ARUSER")
    , TLS_twiddle_rsc_ARREGION("TLS_twiddle_rsc_ARREGION")
    , TLS_twiddle_rsc_ARQOS("TLS_twiddle_rsc_ARQOS")
    , TLS_twiddle_rsc_ARPROT("TLS_twiddle_rsc_ARPROT")
    , TLS_twiddle_rsc_ARCACHE("TLS_twiddle_rsc_ARCACHE")
    , TLS_twiddle_rsc_ARLOCK("TLS_twiddle_rsc_ARLOCK")
    , TLS_twiddle_rsc_ARBURST("TLS_twiddle_rsc_ARBURST")
    , TLS_twiddle_rsc_ARSIZE("TLS_twiddle_rsc_ARSIZE")
    , TLS_twiddle_rsc_ARLEN("TLS_twiddle_rsc_ARLEN")
    , TLS_twiddle_rsc_ARADDR("TLS_twiddle_rsc_ARADDR")
    , TLS_twiddle_rsc_ARID("TLS_twiddle_rsc_ARID")
    , TLS_twiddle_rsc_BREADY("TLS_twiddle_rsc_BREADY")
    , TLS_twiddle_rsc_BVALID("TLS_twiddle_rsc_BVALID")
    , TLS_twiddle_rsc_BUSER("TLS_twiddle_rsc_BUSER")
    , TLS_twiddle_rsc_BRESP("TLS_twiddle_rsc_BRESP")
    , TLS_twiddle_rsc_BID("TLS_twiddle_rsc_BID")
    , TLS_twiddle_rsc_WREADY("TLS_twiddle_rsc_WREADY")
    , TLS_twiddle_rsc_WVALID("TLS_twiddle_rsc_WVALID")
    , TLS_twiddle_rsc_WUSER("TLS_twiddle_rsc_WUSER")
    , TLS_twiddle_rsc_WLAST("TLS_twiddle_rsc_WLAST")
    , TLS_twiddle_rsc_WSTRB("TLS_twiddle_rsc_WSTRB")
    , TLS_twiddle_rsc_WDATA("TLS_twiddle_rsc_WDATA")
    , TLS_twiddle_rsc_AWREADY("TLS_twiddle_rsc_AWREADY")
    , TLS_twiddle_rsc_AWVALID("TLS_twiddle_rsc_AWVALID")
    , TLS_twiddle_rsc_AWUSER("TLS_twiddle_rsc_AWUSER")
    , TLS_twiddle_rsc_AWREGION("TLS_twiddle_rsc_AWREGION")
    , TLS_twiddle_rsc_AWQOS("TLS_twiddle_rsc_AWQOS")
    , TLS_twiddle_rsc_AWPROT("TLS_twiddle_rsc_AWPROT")
    , TLS_twiddle_rsc_AWCACHE("TLS_twiddle_rsc_AWCACHE")
    , TLS_twiddle_rsc_AWLOCK("TLS_twiddle_rsc_AWLOCK")
    , TLS_twiddle_rsc_AWBURST("TLS_twiddle_rsc_AWBURST")
    , TLS_twiddle_rsc_AWSIZE("TLS_twiddle_rsc_AWSIZE")
    , TLS_twiddle_rsc_AWLEN("TLS_twiddle_rsc_AWLEN")
    , TLS_twiddle_rsc_AWADDR("TLS_twiddle_rsc_AWADDR")
    , TLS_twiddle_rsc_AWID("TLS_twiddle_rsc_AWID")
    , TLS_twiddle_rsc_triosy_lz("TLS_twiddle_rsc_triosy_lz")
    , TLS_twiddle_h_rsc_s_tdone("TLS_twiddle_h_rsc_s_tdone")
    , TLS_twiddle_h_rsc_tr_write_done("TLS_twiddle_h_rsc_tr_write_done")
    , TLS_twiddle_h_rsc_RREADY("TLS_twiddle_h_rsc_RREADY")
    , TLS_twiddle_h_rsc_RVALID("TLS_twiddle_h_rsc_RVALID")
    , TLS_twiddle_h_rsc_RUSER("TLS_twiddle_h_rsc_RUSER")
    , TLS_twiddle_h_rsc_RLAST("TLS_twiddle_h_rsc_RLAST")
    , TLS_twiddle_h_rsc_RRESP("TLS_twiddle_h_rsc_RRESP")
    , TLS_twiddle_h_rsc_RDATA("TLS_twiddle_h_rsc_RDATA")
    , TLS_twiddle_h_rsc_RID("TLS_twiddle_h_rsc_RID")
    , TLS_twiddle_h_rsc_ARREADY("TLS_twiddle_h_rsc_ARREADY")
    , TLS_twiddle_h_rsc_ARVALID("TLS_twiddle_h_rsc_ARVALID")
    , TLS_twiddle_h_rsc_ARUSER("TLS_twiddle_h_rsc_ARUSER")
    , TLS_twiddle_h_rsc_ARREGION("TLS_twiddle_h_rsc_ARREGION")
    , TLS_twiddle_h_rsc_ARQOS("TLS_twiddle_h_rsc_ARQOS")
    , TLS_twiddle_h_rsc_ARPROT("TLS_twiddle_h_rsc_ARPROT")
    , TLS_twiddle_h_rsc_ARCACHE("TLS_twiddle_h_rsc_ARCACHE")
    , TLS_twiddle_h_rsc_ARLOCK("TLS_twiddle_h_rsc_ARLOCK")
    , TLS_twiddle_h_rsc_ARBURST("TLS_twiddle_h_rsc_ARBURST")
    , TLS_twiddle_h_rsc_ARSIZE("TLS_twiddle_h_rsc_ARSIZE")
    , TLS_twiddle_h_rsc_ARLEN("TLS_twiddle_h_rsc_ARLEN")
    , TLS_twiddle_h_rsc_ARADDR("TLS_twiddle_h_rsc_ARADDR")
    , TLS_twiddle_h_rsc_ARID("TLS_twiddle_h_rsc_ARID")
    , TLS_twiddle_h_rsc_BREADY("TLS_twiddle_h_rsc_BREADY")
    , TLS_twiddle_h_rsc_BVALID("TLS_twiddle_h_rsc_BVALID")
    , TLS_twiddle_h_rsc_BUSER("TLS_twiddle_h_rsc_BUSER")
    , TLS_twiddle_h_rsc_BRESP("TLS_twiddle_h_rsc_BRESP")
    , TLS_twiddle_h_rsc_BID("TLS_twiddle_h_rsc_BID")
    , TLS_twiddle_h_rsc_WREADY("TLS_twiddle_h_rsc_WREADY")
    , TLS_twiddle_h_rsc_WVALID("TLS_twiddle_h_rsc_WVALID")
    , TLS_twiddle_h_rsc_WUSER("TLS_twiddle_h_rsc_WUSER")
    , TLS_twiddle_h_rsc_WLAST("TLS_twiddle_h_rsc_WLAST")
    , TLS_twiddle_h_rsc_WSTRB("TLS_twiddle_h_rsc_WSTRB")
    , TLS_twiddle_h_rsc_WDATA("TLS_twiddle_h_rsc_WDATA")
    , TLS_twiddle_h_rsc_AWREADY("TLS_twiddle_h_rsc_AWREADY")
    , TLS_twiddle_h_rsc_AWVALID("TLS_twiddle_h_rsc_AWVALID")
    , TLS_twiddle_h_rsc_AWUSER("TLS_twiddle_h_rsc_AWUSER")
    , TLS_twiddle_h_rsc_AWREGION("TLS_twiddle_h_rsc_AWREGION")
    , TLS_twiddle_h_rsc_AWQOS("TLS_twiddle_h_rsc_AWQOS")
    , TLS_twiddle_h_rsc_AWPROT("TLS_twiddle_h_rsc_AWPROT")
    , TLS_twiddle_h_rsc_AWCACHE("TLS_twiddle_h_rsc_AWCACHE")
    , TLS_twiddle_h_rsc_AWLOCK("TLS_twiddle_h_rsc_AWLOCK")
    , TLS_twiddle_h_rsc_AWBURST("TLS_twiddle_h_rsc_AWBURST")
    , TLS_twiddle_h_rsc_AWSIZE("TLS_twiddle_h_rsc_AWSIZE")
    , TLS_twiddle_h_rsc_AWLEN("TLS_twiddle_h_rsc_AWLEN")
    , TLS_twiddle_h_rsc_AWADDR("TLS_twiddle_h_rsc_AWADDR")
    , TLS_twiddle_h_rsc_AWID("TLS_twiddle_h_rsc_AWID")
    , TLS_twiddle_h_rsc_triosy_lz("TLS_twiddle_h_rsc_triosy_lz")
    , TLS_revArr_rsc_s_tdone("TLS_revArr_rsc_s_tdone")
    , TLS_revArr_rsc_tr_write_done("TLS_revArr_rsc_tr_write_done")
    , TLS_revArr_rsc_RREADY("TLS_revArr_rsc_RREADY")
    , TLS_revArr_rsc_RVALID("TLS_revArr_rsc_RVALID")
    , TLS_revArr_rsc_RUSER("TLS_revArr_rsc_RUSER")
    , TLS_revArr_rsc_RLAST("TLS_revArr_rsc_RLAST")
    , TLS_revArr_rsc_RRESP("TLS_revArr_rsc_RRESP")
    , TLS_revArr_rsc_RDATA("TLS_revArr_rsc_RDATA")
    , TLS_revArr_rsc_RID("TLS_revArr_rsc_RID")
    , TLS_revArr_rsc_ARREADY("TLS_revArr_rsc_ARREADY")
    , TLS_revArr_rsc_ARVALID("TLS_revArr_rsc_ARVALID")
    , TLS_revArr_rsc_ARUSER("TLS_revArr_rsc_ARUSER")
    , TLS_revArr_rsc_ARREGION("TLS_revArr_rsc_ARREGION")
    , TLS_revArr_rsc_ARQOS("TLS_revArr_rsc_ARQOS")
    , TLS_revArr_rsc_ARPROT("TLS_revArr_rsc_ARPROT")
    , TLS_revArr_rsc_ARCACHE("TLS_revArr_rsc_ARCACHE")
    , TLS_revArr_rsc_ARLOCK("TLS_revArr_rsc_ARLOCK")
    , TLS_revArr_rsc_ARBURST("TLS_revArr_rsc_ARBURST")
    , TLS_revArr_rsc_ARSIZE("TLS_revArr_rsc_ARSIZE")
    , TLS_revArr_rsc_ARLEN("TLS_revArr_rsc_ARLEN")
    , TLS_revArr_rsc_ARADDR("TLS_revArr_rsc_ARADDR")
    , TLS_revArr_rsc_ARID("TLS_revArr_rsc_ARID")
    , TLS_revArr_rsc_BREADY("TLS_revArr_rsc_BREADY")
    , TLS_revArr_rsc_BVALID("TLS_revArr_rsc_BVALID")
    , TLS_revArr_rsc_BUSER("TLS_revArr_rsc_BUSER")
    , TLS_revArr_rsc_BRESP("TLS_revArr_rsc_BRESP")
    , TLS_revArr_rsc_BID("TLS_revArr_rsc_BID")
    , TLS_revArr_rsc_WREADY("TLS_revArr_rsc_WREADY")
    , TLS_revArr_rsc_WVALID("TLS_revArr_rsc_WVALID")
    , TLS_revArr_rsc_WUSER("TLS_revArr_rsc_WUSER")
    , TLS_revArr_rsc_WLAST("TLS_revArr_rsc_WLAST")
    , TLS_revArr_rsc_WSTRB("TLS_revArr_rsc_WSTRB")
    , TLS_revArr_rsc_WDATA("TLS_revArr_rsc_WDATA")
    , TLS_revArr_rsc_AWREADY("TLS_revArr_rsc_AWREADY")
    , TLS_revArr_rsc_AWVALID("TLS_revArr_rsc_AWVALID")
    , TLS_revArr_rsc_AWUSER("TLS_revArr_rsc_AWUSER")
    , TLS_revArr_rsc_AWREGION("TLS_revArr_rsc_AWREGION")
    , TLS_revArr_rsc_AWQOS("TLS_revArr_rsc_AWQOS")
    , TLS_revArr_rsc_AWPROT("TLS_revArr_rsc_AWPROT")
    , TLS_revArr_rsc_AWCACHE("TLS_revArr_rsc_AWCACHE")
    , TLS_revArr_rsc_AWLOCK("TLS_revArr_rsc_AWLOCK")
    , TLS_revArr_rsc_AWBURST("TLS_revArr_rsc_AWBURST")
    , TLS_revArr_rsc_AWSIZE("TLS_revArr_rsc_AWSIZE")
    , TLS_revArr_rsc_AWLEN("TLS_revArr_rsc_AWLEN")
    , TLS_revArr_rsc_AWADDR("TLS_revArr_rsc_AWADDR")
    , TLS_revArr_rsc_AWID("TLS_revArr_rsc_AWID")
    , TLS_revArr_rsc_triosy_lz("TLS_revArr_rsc_triosy_lz")
    , TLS_tw_rsc_s_tdone("TLS_tw_rsc_s_tdone")
    , TLS_tw_rsc_tr_write_done("TLS_tw_rsc_tr_write_done")
    , TLS_tw_rsc_RREADY("TLS_tw_rsc_RREADY")
    , TLS_tw_rsc_RVALID("TLS_tw_rsc_RVALID")
    , TLS_tw_rsc_RUSER("TLS_tw_rsc_RUSER")
    , TLS_tw_rsc_RLAST("TLS_tw_rsc_RLAST")
    , TLS_tw_rsc_RRESP("TLS_tw_rsc_RRESP")
    , TLS_tw_rsc_RDATA("TLS_tw_rsc_RDATA")
    , TLS_tw_rsc_RID("TLS_tw_rsc_RID")
    , TLS_tw_rsc_ARREADY("TLS_tw_rsc_ARREADY")
    , TLS_tw_rsc_ARVALID("TLS_tw_rsc_ARVALID")
    , TLS_tw_rsc_ARUSER("TLS_tw_rsc_ARUSER")
    , TLS_tw_rsc_ARREGION("TLS_tw_rsc_ARREGION")
    , TLS_tw_rsc_ARQOS("TLS_tw_rsc_ARQOS")
    , TLS_tw_rsc_ARPROT("TLS_tw_rsc_ARPROT")
    , TLS_tw_rsc_ARCACHE("TLS_tw_rsc_ARCACHE")
    , TLS_tw_rsc_ARLOCK("TLS_tw_rsc_ARLOCK")
    , TLS_tw_rsc_ARBURST("TLS_tw_rsc_ARBURST")
    , TLS_tw_rsc_ARSIZE("TLS_tw_rsc_ARSIZE")
    , TLS_tw_rsc_ARLEN("TLS_tw_rsc_ARLEN")
    , TLS_tw_rsc_ARADDR("TLS_tw_rsc_ARADDR")
    , TLS_tw_rsc_ARID("TLS_tw_rsc_ARID")
    , TLS_tw_rsc_BREADY("TLS_tw_rsc_BREADY")
    , TLS_tw_rsc_BVALID("TLS_tw_rsc_BVALID")
    , TLS_tw_rsc_BUSER("TLS_tw_rsc_BUSER")
    , TLS_tw_rsc_BRESP("TLS_tw_rsc_BRESP")
    , TLS_tw_rsc_BID("TLS_tw_rsc_BID")
    , TLS_tw_rsc_WREADY("TLS_tw_rsc_WREADY")
    , TLS_tw_rsc_WVALID("TLS_tw_rsc_WVALID")
    , TLS_tw_rsc_WUSER("TLS_tw_rsc_WUSER")
    , TLS_tw_rsc_WLAST("TLS_tw_rsc_WLAST")
    , TLS_tw_rsc_WSTRB("TLS_tw_rsc_WSTRB")
    , TLS_tw_rsc_WDATA("TLS_tw_rsc_WDATA")
    , TLS_tw_rsc_AWREADY("TLS_tw_rsc_AWREADY")
    , TLS_tw_rsc_AWVALID("TLS_tw_rsc_AWVALID")
    , TLS_tw_rsc_AWUSER("TLS_tw_rsc_AWUSER")
    , TLS_tw_rsc_AWREGION("TLS_tw_rsc_AWREGION")
    , TLS_tw_rsc_AWQOS("TLS_tw_rsc_AWQOS")
    , TLS_tw_rsc_AWPROT("TLS_tw_rsc_AWPROT")
    , TLS_tw_rsc_AWCACHE("TLS_tw_rsc_AWCACHE")
    , TLS_tw_rsc_AWLOCK("TLS_tw_rsc_AWLOCK")
    , TLS_tw_rsc_AWBURST("TLS_tw_rsc_AWBURST")
    , TLS_tw_rsc_AWSIZE("TLS_tw_rsc_AWSIZE")
    , TLS_tw_rsc_AWLEN("TLS_tw_rsc_AWLEN")
    , TLS_tw_rsc_AWADDR("TLS_tw_rsc_AWADDR")
    , TLS_tw_rsc_AWID("TLS_tw_rsc_AWID")
    , TLS_tw_rsc_triosy_lz("TLS_tw_rsc_triosy_lz")
    , TLS_tw_h_rsc_s_tdone("TLS_tw_h_rsc_s_tdone")
    , TLS_tw_h_rsc_tr_write_done("TLS_tw_h_rsc_tr_write_done")
    , TLS_tw_h_rsc_RREADY("TLS_tw_h_rsc_RREADY")
    , TLS_tw_h_rsc_RVALID("TLS_tw_h_rsc_RVALID")
    , TLS_tw_h_rsc_RUSER("TLS_tw_h_rsc_RUSER")
    , TLS_tw_h_rsc_RLAST("TLS_tw_h_rsc_RLAST")
    , TLS_tw_h_rsc_RRESP("TLS_tw_h_rsc_RRESP")
    , TLS_tw_h_rsc_RDATA("TLS_tw_h_rsc_RDATA")
    , TLS_tw_h_rsc_RID("TLS_tw_h_rsc_RID")
    , TLS_tw_h_rsc_ARREADY("TLS_tw_h_rsc_ARREADY")
    , TLS_tw_h_rsc_ARVALID("TLS_tw_h_rsc_ARVALID")
    , TLS_tw_h_rsc_ARUSER("TLS_tw_h_rsc_ARUSER")
    , TLS_tw_h_rsc_ARREGION("TLS_tw_h_rsc_ARREGION")
    , TLS_tw_h_rsc_ARQOS("TLS_tw_h_rsc_ARQOS")
    , TLS_tw_h_rsc_ARPROT("TLS_tw_h_rsc_ARPROT")
    , TLS_tw_h_rsc_ARCACHE("TLS_tw_h_rsc_ARCACHE")
    , TLS_tw_h_rsc_ARLOCK("TLS_tw_h_rsc_ARLOCK")
    , TLS_tw_h_rsc_ARBURST("TLS_tw_h_rsc_ARBURST")
    , TLS_tw_h_rsc_ARSIZE("TLS_tw_h_rsc_ARSIZE")
    , TLS_tw_h_rsc_ARLEN("TLS_tw_h_rsc_ARLEN")
    , TLS_tw_h_rsc_ARADDR("TLS_tw_h_rsc_ARADDR")
    , TLS_tw_h_rsc_ARID("TLS_tw_h_rsc_ARID")
    , TLS_tw_h_rsc_BREADY("TLS_tw_h_rsc_BREADY")
    , TLS_tw_h_rsc_BVALID("TLS_tw_h_rsc_BVALID")
    , TLS_tw_h_rsc_BUSER("TLS_tw_h_rsc_BUSER")
    , TLS_tw_h_rsc_BRESP("TLS_tw_h_rsc_BRESP")
    , TLS_tw_h_rsc_BID("TLS_tw_h_rsc_BID")
    , TLS_tw_h_rsc_WREADY("TLS_tw_h_rsc_WREADY")
    , TLS_tw_h_rsc_WVALID("TLS_tw_h_rsc_WVALID")
    , TLS_tw_h_rsc_WUSER("TLS_tw_h_rsc_WUSER")
    , TLS_tw_h_rsc_WLAST("TLS_tw_h_rsc_WLAST")
    , TLS_tw_h_rsc_WSTRB("TLS_tw_h_rsc_WSTRB")
    , TLS_tw_h_rsc_WDATA("TLS_tw_h_rsc_WDATA")
    , TLS_tw_h_rsc_AWREADY("TLS_tw_h_rsc_AWREADY")
    , TLS_tw_h_rsc_AWVALID("TLS_tw_h_rsc_AWVALID")
    , TLS_tw_h_rsc_AWUSER("TLS_tw_h_rsc_AWUSER")
    , TLS_tw_h_rsc_AWREGION("TLS_tw_h_rsc_AWREGION")
    , TLS_tw_h_rsc_AWQOS("TLS_tw_h_rsc_AWQOS")
    , TLS_tw_h_rsc_AWPROT("TLS_tw_h_rsc_AWPROT")
    , TLS_tw_h_rsc_AWCACHE("TLS_tw_h_rsc_AWCACHE")
    , TLS_tw_h_rsc_AWLOCK("TLS_tw_h_rsc_AWLOCK")
    , TLS_tw_h_rsc_AWBURST("TLS_tw_h_rsc_AWBURST")
    , TLS_tw_h_rsc_AWSIZE("TLS_tw_h_rsc_AWSIZE")
    , TLS_tw_h_rsc_AWLEN("TLS_tw_h_rsc_AWLEN")
    , TLS_tw_h_rsc_AWADDR("TLS_tw_h_rsc_AWADDR")
    , TLS_tw_h_rsc_AWID("TLS_tw_h_rsc_AWID")
    , TLS_tw_h_rsc_triosy_lz("TLS_tw_h_rsc_triosy_lz")
    , hybrid_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , CCS_ADAPTOR_TLS_x_rsc_AWID("CCS_ADAPTOR_TLS_x_rsc_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_AWUSER("CCS_ADAPTOR_TLS_x_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_WUSER("CCS_ADAPTOR_TLS_x_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_ARID("CCS_ADAPTOR_TLS_x_rsc_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_ARUSER("CCS_ADAPTOR_TLS_x_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RUSER")
    , x_rsc_INST("x_rsc", true)
    , m_rsc_INST("m_rsc", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RUSER")
    , twiddle_rsc_INST("twiddle_rsc", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RUSER")
    , twiddle_h_rsc_INST("twiddle_h_rsc", true)
    , CCS_ADAPTOR_TLS_revArr_rsc_AWID("CCS_ADAPTOR_TLS_revArr_rsc_AWID")
    , CCS_ADAPTOR_TLS_revArr_rsc_AWUSER("CCS_ADAPTOR_TLS_revArr_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_revArr_rsc_WUSER("CCS_ADAPTOR_TLS_revArr_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BUSER")
    , CCS_ADAPTOR_TLS_revArr_rsc_ARID("CCS_ADAPTOR_TLS_revArr_rsc_ARID")
    , CCS_ADAPTOR_TLS_revArr_rsc_ARUSER("CCS_ADAPTOR_TLS_revArr_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RUSER")
    , revArr_rsc_INST("revArr_rsc", true)
    , CCS_ADAPTOR_TLS_tw_rsc_AWID("CCS_ADAPTOR_TLS_tw_rsc_AWID")
    , CCS_ADAPTOR_TLS_tw_rsc_AWUSER("CCS_ADAPTOR_TLS_tw_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_tw_rsc_WUSER("CCS_ADAPTOR_TLS_tw_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BUSER")
    , CCS_ADAPTOR_TLS_tw_rsc_ARID("CCS_ADAPTOR_TLS_tw_rsc_ARID")
    , CCS_ADAPTOR_TLS_tw_rsc_ARUSER("CCS_ADAPTOR_TLS_tw_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RUSER")
    , tw_rsc_INST("tw_rsc", true)
    , CCS_ADAPTOR_TLS_tw_h_rsc_AWID("CCS_ADAPTOR_TLS_tw_h_rsc_AWID")
    , CCS_ADAPTOR_TLS_tw_h_rsc_AWUSER("CCS_ADAPTOR_TLS_tw_h_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_tw_h_rsc_WUSER("CCS_ADAPTOR_TLS_tw_h_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BUSER")
    , CCS_ADAPTOR_TLS_tw_h_rsc_ARID("CCS_ADAPTOR_TLS_tw_h_rsc_ARID")
    , CCS_ADAPTOR_TLS_tw_h_rsc_ARUSER("CCS_ADAPTOR_TLS_tw_h_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RUSER")
    , tw_h_rsc_INST("tw_h_rsc", true)
    , TLS_in_fifo_x("TLS_in_fifo_x", -1)
    , TLS_in_wait_ctrl_fifo_x("TLS_in_wait_ctrl_fifo_x", -1)
    , TLS_out_fifo_x("TLS_out_fifo_x", -1)
    , TLS_out_wait_ctrl_fifo_x("TLS_out_wait_ctrl_fifo_x", -1)
    , trios_monitor_x_rsc_triosy_lz_INST("trios_monitor_x_rsc_triosy_lz_INST")
    , transactor_x("transactor_x", 0, 32, 0)
    , TLS_in_fifo_m("TLS_in_fifo_m", -1)
    , TLS_in_wait_ctrl_fifo_m("TLS_in_wait_ctrl_fifo_m", -1)
    , trios_monitor_m_rsc_triosy_lz_INST("trios_monitor_m_rsc_triosy_lz_INST")
    , transactor_m("transactor_m", 0, 32, 0)
    , TLS_in_fifo_twiddle("TLS_in_fifo_twiddle", -1)
    , TLS_in_wait_ctrl_fifo_twiddle("TLS_in_wait_ctrl_fifo_twiddle", -1)
    , trios_monitor_twiddle_rsc_triosy_lz_INST("trios_monitor_twiddle_rsc_triosy_lz_INST")
    , transactor_twiddle("transactor_twiddle", 0, 32, 0)
    , TLS_in_fifo_twiddle_h("TLS_in_fifo_twiddle_h", -1)
    , TLS_in_wait_ctrl_fifo_twiddle_h("TLS_in_wait_ctrl_fifo_twiddle_h", -1)
    , trios_monitor_twiddle_h_rsc_triosy_lz_INST("trios_monitor_twiddle_h_rsc_triosy_lz_INST")
    , transactor_twiddle_h("transactor_twiddle_h", 0, 32, 0)
    , TLS_in_fifo_revArr("TLS_in_fifo_revArr", -1)
    , TLS_in_wait_ctrl_fifo_revArr("TLS_in_wait_ctrl_fifo_revArr", -1)
    , trios_monitor_revArr_rsc_triosy_lz_INST("trios_monitor_revArr_rsc_triosy_lz_INST")
    , transactor_revArr("transactor_revArr", 0, 20, 0)
    , TLS_in_fifo_tw("TLS_in_fifo_tw", -1)
    , TLS_in_wait_ctrl_fifo_tw("TLS_in_wait_ctrl_fifo_tw", -1)
    , trios_monitor_tw_rsc_triosy_lz_INST("trios_monitor_tw_rsc_triosy_lz_INST")
    , transactor_tw("transactor_tw", 0, 32, 0)
    , TLS_in_fifo_tw_h("TLS_in_fifo_tw_h", -1)
    , TLS_in_wait_ctrl_fifo_tw_h("TLS_in_wait_ctrl_fifo_tw_h", -1)
    , trios_monitor_tw_h_rsc_triosy_lz_INST("trios_monitor_tw_h_rsc_triosy_lz_INST")
    , transactor_tw_h("transactor_tw_h", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 32050, 32050, 0)
    , catapult_monitor_INST("Monitor", clk, true, 32050LL, 32050LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    hybrid_INST.clk(clk);
    hybrid_INST.rst(TLS_rst);
    hybrid_INST.x_rsc_s_tdone(TLS_x_rsc_s_tdone);
    hybrid_INST.x_rsc_tr_write_done(TLS_x_rsc_tr_write_done);
    hybrid_INST.x_rsc_RREADY(TLS_x_rsc_RREADY);
    hybrid_INST.x_rsc_RVALID(TLS_x_rsc_RVALID);
    hybrid_INST.x_rsc_RUSER(TLS_x_rsc_RUSER);
    hybrid_INST.x_rsc_RLAST(TLS_x_rsc_RLAST);
    hybrid_INST.x_rsc_RRESP(TLS_x_rsc_RRESP);
    hybrid_INST.x_rsc_RDATA(TLS_x_rsc_RDATA);
    hybrid_INST.x_rsc_RID(TLS_x_rsc_RID);
    hybrid_INST.x_rsc_ARREADY(TLS_x_rsc_ARREADY);
    hybrid_INST.x_rsc_ARVALID(TLS_x_rsc_ARVALID);
    hybrid_INST.x_rsc_ARUSER(TLS_x_rsc_ARUSER);
    hybrid_INST.x_rsc_ARREGION(TLS_x_rsc_ARREGION);
    hybrid_INST.x_rsc_ARQOS(TLS_x_rsc_ARQOS);
    hybrid_INST.x_rsc_ARPROT(TLS_x_rsc_ARPROT);
    hybrid_INST.x_rsc_ARCACHE(TLS_x_rsc_ARCACHE);
    hybrid_INST.x_rsc_ARLOCK(TLS_x_rsc_ARLOCK);
    hybrid_INST.x_rsc_ARBURST(TLS_x_rsc_ARBURST);
    hybrid_INST.x_rsc_ARSIZE(TLS_x_rsc_ARSIZE);
    hybrid_INST.x_rsc_ARLEN(TLS_x_rsc_ARLEN);
    hybrid_INST.x_rsc_ARADDR(TLS_x_rsc_ARADDR);
    hybrid_INST.x_rsc_ARID(TLS_x_rsc_ARID);
    hybrid_INST.x_rsc_BREADY(TLS_x_rsc_BREADY);
    hybrid_INST.x_rsc_BVALID(TLS_x_rsc_BVALID);
    hybrid_INST.x_rsc_BUSER(TLS_x_rsc_BUSER);
    hybrid_INST.x_rsc_BRESP(TLS_x_rsc_BRESP);
    hybrid_INST.x_rsc_BID(TLS_x_rsc_BID);
    hybrid_INST.x_rsc_WREADY(TLS_x_rsc_WREADY);
    hybrid_INST.x_rsc_WVALID(TLS_x_rsc_WVALID);
    hybrid_INST.x_rsc_WUSER(TLS_x_rsc_WUSER);
    hybrid_INST.x_rsc_WLAST(TLS_x_rsc_WLAST);
    hybrid_INST.x_rsc_WSTRB(TLS_x_rsc_WSTRB);
    hybrid_INST.x_rsc_WDATA(TLS_x_rsc_WDATA);
    hybrid_INST.x_rsc_AWREADY(TLS_x_rsc_AWREADY);
    hybrid_INST.x_rsc_AWVALID(TLS_x_rsc_AWVALID);
    hybrid_INST.x_rsc_AWUSER(TLS_x_rsc_AWUSER);
    hybrid_INST.x_rsc_AWREGION(TLS_x_rsc_AWREGION);
    hybrid_INST.x_rsc_AWQOS(TLS_x_rsc_AWQOS);
    hybrid_INST.x_rsc_AWPROT(TLS_x_rsc_AWPROT);
    hybrid_INST.x_rsc_AWCACHE(TLS_x_rsc_AWCACHE);
    hybrid_INST.x_rsc_AWLOCK(TLS_x_rsc_AWLOCK);
    hybrid_INST.x_rsc_AWBURST(TLS_x_rsc_AWBURST);
    hybrid_INST.x_rsc_AWSIZE(TLS_x_rsc_AWSIZE);
    hybrid_INST.x_rsc_AWLEN(TLS_x_rsc_AWLEN);
    hybrid_INST.x_rsc_AWADDR(TLS_x_rsc_AWADDR);
    hybrid_INST.x_rsc_AWID(TLS_x_rsc_AWID);
    hybrid_INST.x_rsc_triosy_lz(TLS_x_rsc_triosy_lz);
    hybrid_INST.m_rsc_dat(TLS_m_rsc_dat);
    hybrid_INST.m_rsc_triosy_lz(TLS_m_rsc_triosy_lz);
    hybrid_INST.twiddle_rsc_s_tdone(TLS_twiddle_rsc_s_tdone);
    hybrid_INST.twiddle_rsc_tr_write_done(TLS_twiddle_rsc_tr_write_done);
    hybrid_INST.twiddle_rsc_RREADY(TLS_twiddle_rsc_RREADY);
    hybrid_INST.twiddle_rsc_RVALID(TLS_twiddle_rsc_RVALID);
    hybrid_INST.twiddle_rsc_RUSER(TLS_twiddle_rsc_RUSER);
    hybrid_INST.twiddle_rsc_RLAST(TLS_twiddle_rsc_RLAST);
    hybrid_INST.twiddle_rsc_RRESP(TLS_twiddle_rsc_RRESP);
    hybrid_INST.twiddle_rsc_RDATA(TLS_twiddle_rsc_RDATA);
    hybrid_INST.twiddle_rsc_RID(TLS_twiddle_rsc_RID);
    hybrid_INST.twiddle_rsc_ARREADY(TLS_twiddle_rsc_ARREADY);
    hybrid_INST.twiddle_rsc_ARVALID(TLS_twiddle_rsc_ARVALID);
    hybrid_INST.twiddle_rsc_ARUSER(TLS_twiddle_rsc_ARUSER);
    hybrid_INST.twiddle_rsc_ARREGION(TLS_twiddle_rsc_ARREGION);
    hybrid_INST.twiddle_rsc_ARQOS(TLS_twiddle_rsc_ARQOS);
    hybrid_INST.twiddle_rsc_ARPROT(TLS_twiddle_rsc_ARPROT);
    hybrid_INST.twiddle_rsc_ARCACHE(TLS_twiddle_rsc_ARCACHE);
    hybrid_INST.twiddle_rsc_ARLOCK(TLS_twiddle_rsc_ARLOCK);
    hybrid_INST.twiddle_rsc_ARBURST(TLS_twiddle_rsc_ARBURST);
    hybrid_INST.twiddle_rsc_ARSIZE(TLS_twiddle_rsc_ARSIZE);
    hybrid_INST.twiddle_rsc_ARLEN(TLS_twiddle_rsc_ARLEN);
    hybrid_INST.twiddle_rsc_ARADDR(TLS_twiddle_rsc_ARADDR);
    hybrid_INST.twiddle_rsc_ARID(TLS_twiddle_rsc_ARID);
    hybrid_INST.twiddle_rsc_BREADY(TLS_twiddle_rsc_BREADY);
    hybrid_INST.twiddle_rsc_BVALID(TLS_twiddle_rsc_BVALID);
    hybrid_INST.twiddle_rsc_BUSER(TLS_twiddle_rsc_BUSER);
    hybrid_INST.twiddle_rsc_BRESP(TLS_twiddle_rsc_BRESP);
    hybrid_INST.twiddle_rsc_BID(TLS_twiddle_rsc_BID);
    hybrid_INST.twiddle_rsc_WREADY(TLS_twiddle_rsc_WREADY);
    hybrid_INST.twiddle_rsc_WVALID(TLS_twiddle_rsc_WVALID);
    hybrid_INST.twiddle_rsc_WUSER(TLS_twiddle_rsc_WUSER);
    hybrid_INST.twiddle_rsc_WLAST(TLS_twiddle_rsc_WLAST);
    hybrid_INST.twiddle_rsc_WSTRB(TLS_twiddle_rsc_WSTRB);
    hybrid_INST.twiddle_rsc_WDATA(TLS_twiddle_rsc_WDATA);
    hybrid_INST.twiddle_rsc_AWREADY(TLS_twiddle_rsc_AWREADY);
    hybrid_INST.twiddle_rsc_AWVALID(TLS_twiddle_rsc_AWVALID);
    hybrid_INST.twiddle_rsc_AWUSER(TLS_twiddle_rsc_AWUSER);
    hybrid_INST.twiddle_rsc_AWREGION(TLS_twiddle_rsc_AWREGION);
    hybrid_INST.twiddle_rsc_AWQOS(TLS_twiddle_rsc_AWQOS);
    hybrid_INST.twiddle_rsc_AWPROT(TLS_twiddle_rsc_AWPROT);
    hybrid_INST.twiddle_rsc_AWCACHE(TLS_twiddle_rsc_AWCACHE);
    hybrid_INST.twiddle_rsc_AWLOCK(TLS_twiddle_rsc_AWLOCK);
    hybrid_INST.twiddle_rsc_AWBURST(TLS_twiddle_rsc_AWBURST);
    hybrid_INST.twiddle_rsc_AWSIZE(TLS_twiddle_rsc_AWSIZE);
    hybrid_INST.twiddle_rsc_AWLEN(TLS_twiddle_rsc_AWLEN);
    hybrid_INST.twiddle_rsc_AWADDR(TLS_twiddle_rsc_AWADDR);
    hybrid_INST.twiddle_rsc_AWID(TLS_twiddle_rsc_AWID);
    hybrid_INST.twiddle_rsc_triosy_lz(TLS_twiddle_rsc_triosy_lz);
    hybrid_INST.twiddle_h_rsc_s_tdone(TLS_twiddle_h_rsc_s_tdone);
    hybrid_INST.twiddle_h_rsc_tr_write_done(TLS_twiddle_h_rsc_tr_write_done);
    hybrid_INST.twiddle_h_rsc_RREADY(TLS_twiddle_h_rsc_RREADY);
    hybrid_INST.twiddle_h_rsc_RVALID(TLS_twiddle_h_rsc_RVALID);
    hybrid_INST.twiddle_h_rsc_RUSER(TLS_twiddle_h_rsc_RUSER);
    hybrid_INST.twiddle_h_rsc_RLAST(TLS_twiddle_h_rsc_RLAST);
    hybrid_INST.twiddle_h_rsc_RRESP(TLS_twiddle_h_rsc_RRESP);
    hybrid_INST.twiddle_h_rsc_RDATA(TLS_twiddle_h_rsc_RDATA);
    hybrid_INST.twiddle_h_rsc_RID(TLS_twiddle_h_rsc_RID);
    hybrid_INST.twiddle_h_rsc_ARREADY(TLS_twiddle_h_rsc_ARREADY);
    hybrid_INST.twiddle_h_rsc_ARVALID(TLS_twiddle_h_rsc_ARVALID);
    hybrid_INST.twiddle_h_rsc_ARUSER(TLS_twiddle_h_rsc_ARUSER);
    hybrid_INST.twiddle_h_rsc_ARREGION(TLS_twiddle_h_rsc_ARREGION);
    hybrid_INST.twiddle_h_rsc_ARQOS(TLS_twiddle_h_rsc_ARQOS);
    hybrid_INST.twiddle_h_rsc_ARPROT(TLS_twiddle_h_rsc_ARPROT);
    hybrid_INST.twiddle_h_rsc_ARCACHE(TLS_twiddle_h_rsc_ARCACHE);
    hybrid_INST.twiddle_h_rsc_ARLOCK(TLS_twiddle_h_rsc_ARLOCK);
    hybrid_INST.twiddle_h_rsc_ARBURST(TLS_twiddle_h_rsc_ARBURST);
    hybrid_INST.twiddle_h_rsc_ARSIZE(TLS_twiddle_h_rsc_ARSIZE);
    hybrid_INST.twiddle_h_rsc_ARLEN(TLS_twiddle_h_rsc_ARLEN);
    hybrid_INST.twiddle_h_rsc_ARADDR(TLS_twiddle_h_rsc_ARADDR);
    hybrid_INST.twiddle_h_rsc_ARID(TLS_twiddle_h_rsc_ARID);
    hybrid_INST.twiddle_h_rsc_BREADY(TLS_twiddle_h_rsc_BREADY);
    hybrid_INST.twiddle_h_rsc_BVALID(TLS_twiddle_h_rsc_BVALID);
    hybrid_INST.twiddle_h_rsc_BUSER(TLS_twiddle_h_rsc_BUSER);
    hybrid_INST.twiddle_h_rsc_BRESP(TLS_twiddle_h_rsc_BRESP);
    hybrid_INST.twiddle_h_rsc_BID(TLS_twiddle_h_rsc_BID);
    hybrid_INST.twiddle_h_rsc_WREADY(TLS_twiddle_h_rsc_WREADY);
    hybrid_INST.twiddle_h_rsc_WVALID(TLS_twiddle_h_rsc_WVALID);
    hybrid_INST.twiddle_h_rsc_WUSER(TLS_twiddle_h_rsc_WUSER);
    hybrid_INST.twiddle_h_rsc_WLAST(TLS_twiddle_h_rsc_WLAST);
    hybrid_INST.twiddle_h_rsc_WSTRB(TLS_twiddle_h_rsc_WSTRB);
    hybrid_INST.twiddle_h_rsc_WDATA(TLS_twiddle_h_rsc_WDATA);
    hybrid_INST.twiddle_h_rsc_AWREADY(TLS_twiddle_h_rsc_AWREADY);
    hybrid_INST.twiddle_h_rsc_AWVALID(TLS_twiddle_h_rsc_AWVALID);
    hybrid_INST.twiddle_h_rsc_AWUSER(TLS_twiddle_h_rsc_AWUSER);
    hybrid_INST.twiddle_h_rsc_AWREGION(TLS_twiddle_h_rsc_AWREGION);
    hybrid_INST.twiddle_h_rsc_AWQOS(TLS_twiddle_h_rsc_AWQOS);
    hybrid_INST.twiddle_h_rsc_AWPROT(TLS_twiddle_h_rsc_AWPROT);
    hybrid_INST.twiddle_h_rsc_AWCACHE(TLS_twiddle_h_rsc_AWCACHE);
    hybrid_INST.twiddle_h_rsc_AWLOCK(TLS_twiddle_h_rsc_AWLOCK);
    hybrid_INST.twiddle_h_rsc_AWBURST(TLS_twiddle_h_rsc_AWBURST);
    hybrid_INST.twiddle_h_rsc_AWSIZE(TLS_twiddle_h_rsc_AWSIZE);
    hybrid_INST.twiddle_h_rsc_AWLEN(TLS_twiddle_h_rsc_AWLEN);
    hybrid_INST.twiddle_h_rsc_AWADDR(TLS_twiddle_h_rsc_AWADDR);
    hybrid_INST.twiddle_h_rsc_AWID(TLS_twiddle_h_rsc_AWID);
    hybrid_INST.twiddle_h_rsc_triosy_lz(TLS_twiddle_h_rsc_triosy_lz);
    hybrid_INST.revArr_rsc_s_tdone(TLS_revArr_rsc_s_tdone);
    hybrid_INST.revArr_rsc_tr_write_done(TLS_revArr_rsc_tr_write_done);
    hybrid_INST.revArr_rsc_RREADY(TLS_revArr_rsc_RREADY);
    hybrid_INST.revArr_rsc_RVALID(TLS_revArr_rsc_RVALID);
    hybrid_INST.revArr_rsc_RUSER(TLS_revArr_rsc_RUSER);
    hybrid_INST.revArr_rsc_RLAST(TLS_revArr_rsc_RLAST);
    hybrid_INST.revArr_rsc_RRESP(TLS_revArr_rsc_RRESP);
    hybrid_INST.revArr_rsc_RDATA(TLS_revArr_rsc_RDATA);
    hybrid_INST.revArr_rsc_RID(TLS_revArr_rsc_RID);
    hybrid_INST.revArr_rsc_ARREADY(TLS_revArr_rsc_ARREADY);
    hybrid_INST.revArr_rsc_ARVALID(TLS_revArr_rsc_ARVALID);
    hybrid_INST.revArr_rsc_ARUSER(TLS_revArr_rsc_ARUSER);
    hybrid_INST.revArr_rsc_ARREGION(TLS_revArr_rsc_ARREGION);
    hybrid_INST.revArr_rsc_ARQOS(TLS_revArr_rsc_ARQOS);
    hybrid_INST.revArr_rsc_ARPROT(TLS_revArr_rsc_ARPROT);
    hybrid_INST.revArr_rsc_ARCACHE(TLS_revArr_rsc_ARCACHE);
    hybrid_INST.revArr_rsc_ARLOCK(TLS_revArr_rsc_ARLOCK);
    hybrid_INST.revArr_rsc_ARBURST(TLS_revArr_rsc_ARBURST);
    hybrid_INST.revArr_rsc_ARSIZE(TLS_revArr_rsc_ARSIZE);
    hybrid_INST.revArr_rsc_ARLEN(TLS_revArr_rsc_ARLEN);
    hybrid_INST.revArr_rsc_ARADDR(TLS_revArr_rsc_ARADDR);
    hybrid_INST.revArr_rsc_ARID(TLS_revArr_rsc_ARID);
    hybrid_INST.revArr_rsc_BREADY(TLS_revArr_rsc_BREADY);
    hybrid_INST.revArr_rsc_BVALID(TLS_revArr_rsc_BVALID);
    hybrid_INST.revArr_rsc_BUSER(TLS_revArr_rsc_BUSER);
    hybrid_INST.revArr_rsc_BRESP(TLS_revArr_rsc_BRESP);
    hybrid_INST.revArr_rsc_BID(TLS_revArr_rsc_BID);
    hybrid_INST.revArr_rsc_WREADY(TLS_revArr_rsc_WREADY);
    hybrid_INST.revArr_rsc_WVALID(TLS_revArr_rsc_WVALID);
    hybrid_INST.revArr_rsc_WUSER(TLS_revArr_rsc_WUSER);
    hybrid_INST.revArr_rsc_WLAST(TLS_revArr_rsc_WLAST);
    hybrid_INST.revArr_rsc_WSTRB(TLS_revArr_rsc_WSTRB);
    hybrid_INST.revArr_rsc_WDATA(TLS_revArr_rsc_WDATA);
    hybrid_INST.revArr_rsc_AWREADY(TLS_revArr_rsc_AWREADY);
    hybrid_INST.revArr_rsc_AWVALID(TLS_revArr_rsc_AWVALID);
    hybrid_INST.revArr_rsc_AWUSER(TLS_revArr_rsc_AWUSER);
    hybrid_INST.revArr_rsc_AWREGION(TLS_revArr_rsc_AWREGION);
    hybrid_INST.revArr_rsc_AWQOS(TLS_revArr_rsc_AWQOS);
    hybrid_INST.revArr_rsc_AWPROT(TLS_revArr_rsc_AWPROT);
    hybrid_INST.revArr_rsc_AWCACHE(TLS_revArr_rsc_AWCACHE);
    hybrid_INST.revArr_rsc_AWLOCK(TLS_revArr_rsc_AWLOCK);
    hybrid_INST.revArr_rsc_AWBURST(TLS_revArr_rsc_AWBURST);
    hybrid_INST.revArr_rsc_AWSIZE(TLS_revArr_rsc_AWSIZE);
    hybrid_INST.revArr_rsc_AWLEN(TLS_revArr_rsc_AWLEN);
    hybrid_INST.revArr_rsc_AWADDR(TLS_revArr_rsc_AWADDR);
    hybrid_INST.revArr_rsc_AWID(TLS_revArr_rsc_AWID);
    hybrid_INST.revArr_rsc_triosy_lz(TLS_revArr_rsc_triosy_lz);
    hybrid_INST.tw_rsc_s_tdone(TLS_tw_rsc_s_tdone);
    hybrid_INST.tw_rsc_tr_write_done(TLS_tw_rsc_tr_write_done);
    hybrid_INST.tw_rsc_RREADY(TLS_tw_rsc_RREADY);
    hybrid_INST.tw_rsc_RVALID(TLS_tw_rsc_RVALID);
    hybrid_INST.tw_rsc_RUSER(TLS_tw_rsc_RUSER);
    hybrid_INST.tw_rsc_RLAST(TLS_tw_rsc_RLAST);
    hybrid_INST.tw_rsc_RRESP(TLS_tw_rsc_RRESP);
    hybrid_INST.tw_rsc_RDATA(TLS_tw_rsc_RDATA);
    hybrid_INST.tw_rsc_RID(TLS_tw_rsc_RID);
    hybrid_INST.tw_rsc_ARREADY(TLS_tw_rsc_ARREADY);
    hybrid_INST.tw_rsc_ARVALID(TLS_tw_rsc_ARVALID);
    hybrid_INST.tw_rsc_ARUSER(TLS_tw_rsc_ARUSER);
    hybrid_INST.tw_rsc_ARREGION(TLS_tw_rsc_ARREGION);
    hybrid_INST.tw_rsc_ARQOS(TLS_tw_rsc_ARQOS);
    hybrid_INST.tw_rsc_ARPROT(TLS_tw_rsc_ARPROT);
    hybrid_INST.tw_rsc_ARCACHE(TLS_tw_rsc_ARCACHE);
    hybrid_INST.tw_rsc_ARLOCK(TLS_tw_rsc_ARLOCK);
    hybrid_INST.tw_rsc_ARBURST(TLS_tw_rsc_ARBURST);
    hybrid_INST.tw_rsc_ARSIZE(TLS_tw_rsc_ARSIZE);
    hybrid_INST.tw_rsc_ARLEN(TLS_tw_rsc_ARLEN);
    hybrid_INST.tw_rsc_ARADDR(TLS_tw_rsc_ARADDR);
    hybrid_INST.tw_rsc_ARID(TLS_tw_rsc_ARID);
    hybrid_INST.tw_rsc_BREADY(TLS_tw_rsc_BREADY);
    hybrid_INST.tw_rsc_BVALID(TLS_tw_rsc_BVALID);
    hybrid_INST.tw_rsc_BUSER(TLS_tw_rsc_BUSER);
    hybrid_INST.tw_rsc_BRESP(TLS_tw_rsc_BRESP);
    hybrid_INST.tw_rsc_BID(TLS_tw_rsc_BID);
    hybrid_INST.tw_rsc_WREADY(TLS_tw_rsc_WREADY);
    hybrid_INST.tw_rsc_WVALID(TLS_tw_rsc_WVALID);
    hybrid_INST.tw_rsc_WUSER(TLS_tw_rsc_WUSER);
    hybrid_INST.tw_rsc_WLAST(TLS_tw_rsc_WLAST);
    hybrid_INST.tw_rsc_WSTRB(TLS_tw_rsc_WSTRB);
    hybrid_INST.tw_rsc_WDATA(TLS_tw_rsc_WDATA);
    hybrid_INST.tw_rsc_AWREADY(TLS_tw_rsc_AWREADY);
    hybrid_INST.tw_rsc_AWVALID(TLS_tw_rsc_AWVALID);
    hybrid_INST.tw_rsc_AWUSER(TLS_tw_rsc_AWUSER);
    hybrid_INST.tw_rsc_AWREGION(TLS_tw_rsc_AWREGION);
    hybrid_INST.tw_rsc_AWQOS(TLS_tw_rsc_AWQOS);
    hybrid_INST.tw_rsc_AWPROT(TLS_tw_rsc_AWPROT);
    hybrid_INST.tw_rsc_AWCACHE(TLS_tw_rsc_AWCACHE);
    hybrid_INST.tw_rsc_AWLOCK(TLS_tw_rsc_AWLOCK);
    hybrid_INST.tw_rsc_AWBURST(TLS_tw_rsc_AWBURST);
    hybrid_INST.tw_rsc_AWSIZE(TLS_tw_rsc_AWSIZE);
    hybrid_INST.tw_rsc_AWLEN(TLS_tw_rsc_AWLEN);
    hybrid_INST.tw_rsc_AWADDR(TLS_tw_rsc_AWADDR);
    hybrid_INST.tw_rsc_AWID(TLS_tw_rsc_AWID);
    hybrid_INST.tw_rsc_triosy_lz(TLS_tw_rsc_triosy_lz);
    hybrid_INST.tw_h_rsc_s_tdone(TLS_tw_h_rsc_s_tdone);
    hybrid_INST.tw_h_rsc_tr_write_done(TLS_tw_h_rsc_tr_write_done);
    hybrid_INST.tw_h_rsc_RREADY(TLS_tw_h_rsc_RREADY);
    hybrid_INST.tw_h_rsc_RVALID(TLS_tw_h_rsc_RVALID);
    hybrid_INST.tw_h_rsc_RUSER(TLS_tw_h_rsc_RUSER);
    hybrid_INST.tw_h_rsc_RLAST(TLS_tw_h_rsc_RLAST);
    hybrid_INST.tw_h_rsc_RRESP(TLS_tw_h_rsc_RRESP);
    hybrid_INST.tw_h_rsc_RDATA(TLS_tw_h_rsc_RDATA);
    hybrid_INST.tw_h_rsc_RID(TLS_tw_h_rsc_RID);
    hybrid_INST.tw_h_rsc_ARREADY(TLS_tw_h_rsc_ARREADY);
    hybrid_INST.tw_h_rsc_ARVALID(TLS_tw_h_rsc_ARVALID);
    hybrid_INST.tw_h_rsc_ARUSER(TLS_tw_h_rsc_ARUSER);
    hybrid_INST.tw_h_rsc_ARREGION(TLS_tw_h_rsc_ARREGION);
    hybrid_INST.tw_h_rsc_ARQOS(TLS_tw_h_rsc_ARQOS);
    hybrid_INST.tw_h_rsc_ARPROT(TLS_tw_h_rsc_ARPROT);
    hybrid_INST.tw_h_rsc_ARCACHE(TLS_tw_h_rsc_ARCACHE);
    hybrid_INST.tw_h_rsc_ARLOCK(TLS_tw_h_rsc_ARLOCK);
    hybrid_INST.tw_h_rsc_ARBURST(TLS_tw_h_rsc_ARBURST);
    hybrid_INST.tw_h_rsc_ARSIZE(TLS_tw_h_rsc_ARSIZE);
    hybrid_INST.tw_h_rsc_ARLEN(TLS_tw_h_rsc_ARLEN);
    hybrid_INST.tw_h_rsc_ARADDR(TLS_tw_h_rsc_ARADDR);
    hybrid_INST.tw_h_rsc_ARID(TLS_tw_h_rsc_ARID);
    hybrid_INST.tw_h_rsc_BREADY(TLS_tw_h_rsc_BREADY);
    hybrid_INST.tw_h_rsc_BVALID(TLS_tw_h_rsc_BVALID);
    hybrid_INST.tw_h_rsc_BUSER(TLS_tw_h_rsc_BUSER);
    hybrid_INST.tw_h_rsc_BRESP(TLS_tw_h_rsc_BRESP);
    hybrid_INST.tw_h_rsc_BID(TLS_tw_h_rsc_BID);
    hybrid_INST.tw_h_rsc_WREADY(TLS_tw_h_rsc_WREADY);
    hybrid_INST.tw_h_rsc_WVALID(TLS_tw_h_rsc_WVALID);
    hybrid_INST.tw_h_rsc_WUSER(TLS_tw_h_rsc_WUSER);
    hybrid_INST.tw_h_rsc_WLAST(TLS_tw_h_rsc_WLAST);
    hybrid_INST.tw_h_rsc_WSTRB(TLS_tw_h_rsc_WSTRB);
    hybrid_INST.tw_h_rsc_WDATA(TLS_tw_h_rsc_WDATA);
    hybrid_INST.tw_h_rsc_AWREADY(TLS_tw_h_rsc_AWREADY);
    hybrid_INST.tw_h_rsc_AWVALID(TLS_tw_h_rsc_AWVALID);
    hybrid_INST.tw_h_rsc_AWUSER(TLS_tw_h_rsc_AWUSER);
    hybrid_INST.tw_h_rsc_AWREGION(TLS_tw_h_rsc_AWREGION);
    hybrid_INST.tw_h_rsc_AWQOS(TLS_tw_h_rsc_AWQOS);
    hybrid_INST.tw_h_rsc_AWPROT(TLS_tw_h_rsc_AWPROT);
    hybrid_INST.tw_h_rsc_AWCACHE(TLS_tw_h_rsc_AWCACHE);
    hybrid_INST.tw_h_rsc_AWLOCK(TLS_tw_h_rsc_AWLOCK);
    hybrid_INST.tw_h_rsc_AWBURST(TLS_tw_h_rsc_AWBURST);
    hybrid_INST.tw_h_rsc_AWSIZE(TLS_tw_h_rsc_AWSIZE);
    hybrid_INST.tw_h_rsc_AWLEN(TLS_tw_h_rsc_AWLEN);
    hybrid_INST.tw_h_rsc_AWADDR(TLS_tw_h_rsc_AWADDR);
    hybrid_INST.tw_h_rsc_AWID(TLS_tw_h_rsc_AWID);
    hybrid_INST.tw_h_rsc_triosy_lz(TLS_tw_h_rsc_triosy_lz);

    CCS_ADAPTOR_TLS_x_rsc_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_AWID);
    CCS_ADAPTOR_TLS_x_rsc_AWID.outSCALAR(TLS_x_rsc_AWID);

    CCS_ADAPTOR_TLS_x_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_AWUSER.outSCALAR(TLS_x_rsc_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_WUSER.outSCALAR(TLS_x_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BID.inSCALAR(TLS_x_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BID.outVECTOR(CCS_ADAPTOR_x_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BUSER.inSCALAR(TLS_x_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_ARID);
    CCS_ADAPTOR_TLS_x_rsc_ARID.outSCALAR(TLS_x_rsc_ARID);

    CCS_ADAPTOR_TLS_x_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_ARUSER.outSCALAR(TLS_x_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RID.inSCALAR(TLS_x_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RID.outVECTOR(CCS_ADAPTOR_x_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RUSER.inSCALAR(TLS_x_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_RUSER);

    x_rsc_INST.ACLK(clk);
    x_rsc_INST.ARESETn(rst);
    x_rsc_INST.AWID(CCS_ADAPTOR_x_rsc_AWID);
    x_rsc_INST.AWADDR(TLS_x_rsc_AWADDR);
    x_rsc_INST.AWLEN(TLS_x_rsc_AWLEN);
    x_rsc_INST.AWSIZE(TLS_x_rsc_AWSIZE);
    x_rsc_INST.AWBURST(TLS_x_rsc_AWBURST);
    x_rsc_INST.AWLOCK(TLS_x_rsc_AWLOCK);
    x_rsc_INST.AWCACHE(TLS_x_rsc_AWCACHE);
    x_rsc_INST.AWPROT(TLS_x_rsc_AWPROT);
    x_rsc_INST.AWQOS(TLS_x_rsc_AWQOS);
    x_rsc_INST.AWREGION(TLS_x_rsc_AWREGION);
    x_rsc_INST.AWUSER(CCS_ADAPTOR_x_rsc_AWUSER);
    x_rsc_INST.AWVALID(TLS_x_rsc_AWVALID);
    x_rsc_INST.AWREADY(TLS_x_rsc_AWREADY);
    x_rsc_INST.WDATA(TLS_x_rsc_WDATA);
    x_rsc_INST.WSTRB(TLS_x_rsc_WSTRB);
    x_rsc_INST.WLAST(TLS_x_rsc_WLAST);
    x_rsc_INST.WUSER(CCS_ADAPTOR_x_rsc_WUSER);
    x_rsc_INST.WVALID(TLS_x_rsc_WVALID);
    x_rsc_INST.WREADY(TLS_x_rsc_WREADY);
    x_rsc_INST.BID(CCS_ADAPTOR_x_rsc_BID);
    x_rsc_INST.BRESP(TLS_x_rsc_BRESP);
    x_rsc_INST.BUSER(CCS_ADAPTOR_x_rsc_BUSER);
    x_rsc_INST.BVALID(TLS_x_rsc_BVALID);
    x_rsc_INST.BREADY(TLS_x_rsc_BREADY);
    x_rsc_INST.ARID(CCS_ADAPTOR_x_rsc_ARID);
    x_rsc_INST.ARADDR(TLS_x_rsc_ARADDR);
    x_rsc_INST.ARLEN(TLS_x_rsc_ARLEN);
    x_rsc_INST.ARSIZE(TLS_x_rsc_ARSIZE);
    x_rsc_INST.ARBURST(TLS_x_rsc_ARBURST);
    x_rsc_INST.ARLOCK(TLS_x_rsc_ARLOCK);
    x_rsc_INST.ARCACHE(TLS_x_rsc_ARCACHE);
    x_rsc_INST.ARPROT(TLS_x_rsc_ARPROT);
    x_rsc_INST.ARQOS(TLS_x_rsc_ARQOS);
    x_rsc_INST.ARREGION(TLS_x_rsc_ARREGION);
    x_rsc_INST.ARUSER(CCS_ADAPTOR_x_rsc_ARUSER);
    x_rsc_INST.ARVALID(TLS_x_rsc_ARVALID);
    x_rsc_INST.ARREADY(TLS_x_rsc_ARREADY);
    x_rsc_INST.RID(CCS_ADAPTOR_x_rsc_RID);
    x_rsc_INST.RDATA(TLS_x_rsc_RDATA);
    x_rsc_INST.RRESP(TLS_x_rsc_RRESP);
    x_rsc_INST.RLAST(TLS_x_rsc_RLAST);
    x_rsc_INST.RUSER(CCS_ADAPTOR_x_rsc_RUSER);
    x_rsc_INST.RVALID(TLS_x_rsc_RVALID);
    x_rsc_INST.RREADY(TLS_x_rsc_RREADY);
    x_rsc_INST.tr_write_done(TLS_x_rsc_tr_write_done);
    x_rsc_INST.s_tdone(TLS_x_rsc_s_tdone);
    x_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    m_rsc_INST.dat(TLS_m_rsc_dat);
    m_rsc_INST.clk(clk);
    m_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    CCS_ADAPTOR_TLS_twiddle_rsc_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_AWID.outSCALAR(TLS_twiddle_rsc_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_AWUSER.outSCALAR(TLS_twiddle_rsc_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_WUSER.outSCALAR(TLS_twiddle_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BID.inSCALAR(TLS_twiddle_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BUSER.inSCALAR(TLS_twiddle_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_ARID.outSCALAR(TLS_twiddle_rsc_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_ARUSER.outSCALAR(TLS_twiddle_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RID.inSCALAR(TLS_twiddle_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RUSER.inSCALAR(TLS_twiddle_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_RUSER);

    twiddle_rsc_INST.ACLK(clk);
    twiddle_rsc_INST.ARESETn(rst);
    twiddle_rsc_INST.AWID(CCS_ADAPTOR_twiddle_rsc_AWID);
    twiddle_rsc_INST.AWADDR(TLS_twiddle_rsc_AWADDR);
    twiddle_rsc_INST.AWLEN(TLS_twiddle_rsc_AWLEN);
    twiddle_rsc_INST.AWSIZE(TLS_twiddle_rsc_AWSIZE);
    twiddle_rsc_INST.AWBURST(TLS_twiddle_rsc_AWBURST);
    twiddle_rsc_INST.AWLOCK(TLS_twiddle_rsc_AWLOCK);
    twiddle_rsc_INST.AWCACHE(TLS_twiddle_rsc_AWCACHE);
    twiddle_rsc_INST.AWPROT(TLS_twiddle_rsc_AWPROT);
    twiddle_rsc_INST.AWQOS(TLS_twiddle_rsc_AWQOS);
    twiddle_rsc_INST.AWREGION(TLS_twiddle_rsc_AWREGION);
    twiddle_rsc_INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_AWUSER);
    twiddle_rsc_INST.AWVALID(TLS_twiddle_rsc_AWVALID);
    twiddle_rsc_INST.AWREADY(TLS_twiddle_rsc_AWREADY);
    twiddle_rsc_INST.WDATA(TLS_twiddle_rsc_WDATA);
    twiddle_rsc_INST.WSTRB(TLS_twiddle_rsc_WSTRB);
    twiddle_rsc_INST.WLAST(TLS_twiddle_rsc_WLAST);
    twiddle_rsc_INST.WUSER(CCS_ADAPTOR_twiddle_rsc_WUSER);
    twiddle_rsc_INST.WVALID(TLS_twiddle_rsc_WVALID);
    twiddle_rsc_INST.WREADY(TLS_twiddle_rsc_WREADY);
    twiddle_rsc_INST.BID(CCS_ADAPTOR_twiddle_rsc_BID);
    twiddle_rsc_INST.BRESP(TLS_twiddle_rsc_BRESP);
    twiddle_rsc_INST.BUSER(CCS_ADAPTOR_twiddle_rsc_BUSER);
    twiddle_rsc_INST.BVALID(TLS_twiddle_rsc_BVALID);
    twiddle_rsc_INST.BREADY(TLS_twiddle_rsc_BREADY);
    twiddle_rsc_INST.ARID(CCS_ADAPTOR_twiddle_rsc_ARID);
    twiddle_rsc_INST.ARADDR(TLS_twiddle_rsc_ARADDR);
    twiddle_rsc_INST.ARLEN(TLS_twiddle_rsc_ARLEN);
    twiddle_rsc_INST.ARSIZE(TLS_twiddle_rsc_ARSIZE);
    twiddle_rsc_INST.ARBURST(TLS_twiddle_rsc_ARBURST);
    twiddle_rsc_INST.ARLOCK(TLS_twiddle_rsc_ARLOCK);
    twiddle_rsc_INST.ARCACHE(TLS_twiddle_rsc_ARCACHE);
    twiddle_rsc_INST.ARPROT(TLS_twiddle_rsc_ARPROT);
    twiddle_rsc_INST.ARQOS(TLS_twiddle_rsc_ARQOS);
    twiddle_rsc_INST.ARREGION(TLS_twiddle_rsc_ARREGION);
    twiddle_rsc_INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_ARUSER);
    twiddle_rsc_INST.ARVALID(TLS_twiddle_rsc_ARVALID);
    twiddle_rsc_INST.ARREADY(TLS_twiddle_rsc_ARREADY);
    twiddle_rsc_INST.RID(CCS_ADAPTOR_twiddle_rsc_RID);
    twiddle_rsc_INST.RDATA(TLS_twiddle_rsc_RDATA);
    twiddle_rsc_INST.RRESP(TLS_twiddle_rsc_RRESP);
    twiddle_rsc_INST.RLAST(TLS_twiddle_rsc_RLAST);
    twiddle_rsc_INST.RUSER(CCS_ADAPTOR_twiddle_rsc_RUSER);
    twiddle_rsc_INST.RVALID(TLS_twiddle_rsc_RVALID);
    twiddle_rsc_INST.RREADY(TLS_twiddle_rsc_RREADY);
    twiddle_rsc_INST.tr_write_done(TLS_twiddle_rsc_tr_write_done);
    twiddle_rsc_INST.s_tdone(TLS_twiddle_rsc_s_tdone);
    twiddle_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_AWID.outSCALAR(TLS_twiddle_h_rsc_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_AWUSER.outSCALAR(TLS_twiddle_h_rsc_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_WUSER.outSCALAR(TLS_twiddle_h_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BID.inSCALAR(TLS_twiddle_h_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BUSER.inSCALAR(TLS_twiddle_h_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_ARID.outSCALAR(TLS_twiddle_h_rsc_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_ARUSER.outSCALAR(TLS_twiddle_h_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RID.inSCALAR(TLS_twiddle_h_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RUSER.inSCALAR(TLS_twiddle_h_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_RUSER);

    twiddle_h_rsc_INST.ACLK(clk);
    twiddle_h_rsc_INST.ARESETn(rst);
    twiddle_h_rsc_INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_AWID);
    twiddle_h_rsc_INST.AWADDR(TLS_twiddle_h_rsc_AWADDR);
    twiddle_h_rsc_INST.AWLEN(TLS_twiddle_h_rsc_AWLEN);
    twiddle_h_rsc_INST.AWSIZE(TLS_twiddle_h_rsc_AWSIZE);
    twiddle_h_rsc_INST.AWBURST(TLS_twiddle_h_rsc_AWBURST);
    twiddle_h_rsc_INST.AWLOCK(TLS_twiddle_h_rsc_AWLOCK);
    twiddle_h_rsc_INST.AWCACHE(TLS_twiddle_h_rsc_AWCACHE);
    twiddle_h_rsc_INST.AWPROT(TLS_twiddle_h_rsc_AWPROT);
    twiddle_h_rsc_INST.AWQOS(TLS_twiddle_h_rsc_AWQOS);
    twiddle_h_rsc_INST.AWREGION(TLS_twiddle_h_rsc_AWREGION);
    twiddle_h_rsc_INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_AWUSER);
    twiddle_h_rsc_INST.AWVALID(TLS_twiddle_h_rsc_AWVALID);
    twiddle_h_rsc_INST.AWREADY(TLS_twiddle_h_rsc_AWREADY);
    twiddle_h_rsc_INST.WDATA(TLS_twiddle_h_rsc_WDATA);
    twiddle_h_rsc_INST.WSTRB(TLS_twiddle_h_rsc_WSTRB);
    twiddle_h_rsc_INST.WLAST(TLS_twiddle_h_rsc_WLAST);
    twiddle_h_rsc_INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_WUSER);
    twiddle_h_rsc_INST.WVALID(TLS_twiddle_h_rsc_WVALID);
    twiddle_h_rsc_INST.WREADY(TLS_twiddle_h_rsc_WREADY);
    twiddle_h_rsc_INST.BID(CCS_ADAPTOR_twiddle_h_rsc_BID);
    twiddle_h_rsc_INST.BRESP(TLS_twiddle_h_rsc_BRESP);
    twiddle_h_rsc_INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_BUSER);
    twiddle_h_rsc_INST.BVALID(TLS_twiddle_h_rsc_BVALID);
    twiddle_h_rsc_INST.BREADY(TLS_twiddle_h_rsc_BREADY);
    twiddle_h_rsc_INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_ARID);
    twiddle_h_rsc_INST.ARADDR(TLS_twiddle_h_rsc_ARADDR);
    twiddle_h_rsc_INST.ARLEN(TLS_twiddle_h_rsc_ARLEN);
    twiddle_h_rsc_INST.ARSIZE(TLS_twiddle_h_rsc_ARSIZE);
    twiddle_h_rsc_INST.ARBURST(TLS_twiddle_h_rsc_ARBURST);
    twiddle_h_rsc_INST.ARLOCK(TLS_twiddle_h_rsc_ARLOCK);
    twiddle_h_rsc_INST.ARCACHE(TLS_twiddle_h_rsc_ARCACHE);
    twiddle_h_rsc_INST.ARPROT(TLS_twiddle_h_rsc_ARPROT);
    twiddle_h_rsc_INST.ARQOS(TLS_twiddle_h_rsc_ARQOS);
    twiddle_h_rsc_INST.ARREGION(TLS_twiddle_h_rsc_ARREGION);
    twiddle_h_rsc_INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_ARUSER);
    twiddle_h_rsc_INST.ARVALID(TLS_twiddle_h_rsc_ARVALID);
    twiddle_h_rsc_INST.ARREADY(TLS_twiddle_h_rsc_ARREADY);
    twiddle_h_rsc_INST.RID(CCS_ADAPTOR_twiddle_h_rsc_RID);
    twiddle_h_rsc_INST.RDATA(TLS_twiddle_h_rsc_RDATA);
    twiddle_h_rsc_INST.RRESP(TLS_twiddle_h_rsc_RRESP);
    twiddle_h_rsc_INST.RLAST(TLS_twiddle_h_rsc_RLAST);
    twiddle_h_rsc_INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_RUSER);
    twiddle_h_rsc_INST.RVALID(TLS_twiddle_h_rsc_RVALID);
    twiddle_h_rsc_INST.RREADY(TLS_twiddle_h_rsc_RREADY);
    twiddle_h_rsc_INST.tr_write_done(TLS_twiddle_h_rsc_tr_write_done);
    twiddle_h_rsc_INST.s_tdone(TLS_twiddle_h_rsc_s_tdone);
    twiddle_h_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_4)));

    CCS_ADAPTOR_TLS_revArr_rsc_AWID.inVECTOR(CCS_ADAPTOR_revArr_rsc_AWID);
    CCS_ADAPTOR_TLS_revArr_rsc_AWID.outSCALAR(TLS_revArr_rsc_AWID);

    CCS_ADAPTOR_TLS_revArr_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_revArr_rsc_AWUSER);
    CCS_ADAPTOR_TLS_revArr_rsc_AWUSER.outSCALAR(TLS_revArr_rsc_AWUSER);

    CCS_ADAPTOR_TLS_revArr_rsc_WUSER.inVECTOR(CCS_ADAPTOR_revArr_rsc_WUSER);
    CCS_ADAPTOR_TLS_revArr_rsc_WUSER.outSCALAR(TLS_revArr_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BID.inSCALAR(TLS_revArr_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BID.outVECTOR(CCS_ADAPTOR_revArr_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BUSER.inSCALAR(TLS_revArr_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_BUSER.outVECTOR(CCS_ADAPTOR_revArr_rsc_BUSER);

    CCS_ADAPTOR_TLS_revArr_rsc_ARID.inVECTOR(CCS_ADAPTOR_revArr_rsc_ARID);
    CCS_ADAPTOR_TLS_revArr_rsc_ARID.outSCALAR(TLS_revArr_rsc_ARID);

    CCS_ADAPTOR_TLS_revArr_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_revArr_rsc_ARUSER);
    CCS_ADAPTOR_TLS_revArr_rsc_ARUSER.outSCALAR(TLS_revArr_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RID.inSCALAR(TLS_revArr_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RID.outVECTOR(CCS_ADAPTOR_revArr_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RUSER.inSCALAR(TLS_revArr_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_revArr_rsc_RUSER.outVECTOR(CCS_ADAPTOR_revArr_rsc_RUSER);

    revArr_rsc_INST.ACLK(clk);
    revArr_rsc_INST.ARESETn(rst);
    revArr_rsc_INST.AWID(CCS_ADAPTOR_revArr_rsc_AWID);
    revArr_rsc_INST.AWADDR(TLS_revArr_rsc_AWADDR);
    revArr_rsc_INST.AWLEN(TLS_revArr_rsc_AWLEN);
    revArr_rsc_INST.AWSIZE(TLS_revArr_rsc_AWSIZE);
    revArr_rsc_INST.AWBURST(TLS_revArr_rsc_AWBURST);
    revArr_rsc_INST.AWLOCK(TLS_revArr_rsc_AWLOCK);
    revArr_rsc_INST.AWCACHE(TLS_revArr_rsc_AWCACHE);
    revArr_rsc_INST.AWPROT(TLS_revArr_rsc_AWPROT);
    revArr_rsc_INST.AWQOS(TLS_revArr_rsc_AWQOS);
    revArr_rsc_INST.AWREGION(TLS_revArr_rsc_AWREGION);
    revArr_rsc_INST.AWUSER(CCS_ADAPTOR_revArr_rsc_AWUSER);
    revArr_rsc_INST.AWVALID(TLS_revArr_rsc_AWVALID);
    revArr_rsc_INST.AWREADY(TLS_revArr_rsc_AWREADY);
    revArr_rsc_INST.WDATA(TLS_revArr_rsc_WDATA);
    revArr_rsc_INST.WSTRB(TLS_revArr_rsc_WSTRB);
    revArr_rsc_INST.WLAST(TLS_revArr_rsc_WLAST);
    revArr_rsc_INST.WUSER(CCS_ADAPTOR_revArr_rsc_WUSER);
    revArr_rsc_INST.WVALID(TLS_revArr_rsc_WVALID);
    revArr_rsc_INST.WREADY(TLS_revArr_rsc_WREADY);
    revArr_rsc_INST.BID(CCS_ADAPTOR_revArr_rsc_BID);
    revArr_rsc_INST.BRESP(TLS_revArr_rsc_BRESP);
    revArr_rsc_INST.BUSER(CCS_ADAPTOR_revArr_rsc_BUSER);
    revArr_rsc_INST.BVALID(TLS_revArr_rsc_BVALID);
    revArr_rsc_INST.BREADY(TLS_revArr_rsc_BREADY);
    revArr_rsc_INST.ARID(CCS_ADAPTOR_revArr_rsc_ARID);
    revArr_rsc_INST.ARADDR(TLS_revArr_rsc_ARADDR);
    revArr_rsc_INST.ARLEN(TLS_revArr_rsc_ARLEN);
    revArr_rsc_INST.ARSIZE(TLS_revArr_rsc_ARSIZE);
    revArr_rsc_INST.ARBURST(TLS_revArr_rsc_ARBURST);
    revArr_rsc_INST.ARLOCK(TLS_revArr_rsc_ARLOCK);
    revArr_rsc_INST.ARCACHE(TLS_revArr_rsc_ARCACHE);
    revArr_rsc_INST.ARPROT(TLS_revArr_rsc_ARPROT);
    revArr_rsc_INST.ARQOS(TLS_revArr_rsc_ARQOS);
    revArr_rsc_INST.ARREGION(TLS_revArr_rsc_ARREGION);
    revArr_rsc_INST.ARUSER(CCS_ADAPTOR_revArr_rsc_ARUSER);
    revArr_rsc_INST.ARVALID(TLS_revArr_rsc_ARVALID);
    revArr_rsc_INST.ARREADY(TLS_revArr_rsc_ARREADY);
    revArr_rsc_INST.RID(CCS_ADAPTOR_revArr_rsc_RID);
    revArr_rsc_INST.RDATA(TLS_revArr_rsc_RDATA);
    revArr_rsc_INST.RRESP(TLS_revArr_rsc_RRESP);
    revArr_rsc_INST.RLAST(TLS_revArr_rsc_RLAST);
    revArr_rsc_INST.RUSER(CCS_ADAPTOR_revArr_rsc_RUSER);
    revArr_rsc_INST.RVALID(TLS_revArr_rsc_RVALID);
    revArr_rsc_INST.RREADY(TLS_revArr_rsc_RREADY);
    revArr_rsc_INST.tr_write_done(TLS_revArr_rsc_tr_write_done);
    revArr_rsc_INST.s_tdone(TLS_revArr_rsc_s_tdone);
    revArr_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_5)));

    CCS_ADAPTOR_TLS_tw_rsc_AWID.inVECTOR(CCS_ADAPTOR_tw_rsc_AWID);
    CCS_ADAPTOR_TLS_tw_rsc_AWID.outSCALAR(TLS_tw_rsc_AWID);

    CCS_ADAPTOR_TLS_tw_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_tw_rsc_AWUSER);
    CCS_ADAPTOR_TLS_tw_rsc_AWUSER.outSCALAR(TLS_tw_rsc_AWUSER);

    CCS_ADAPTOR_TLS_tw_rsc_WUSER.inVECTOR(CCS_ADAPTOR_tw_rsc_WUSER);
    CCS_ADAPTOR_TLS_tw_rsc_WUSER.outSCALAR(TLS_tw_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BID.inSCALAR(TLS_tw_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BID.outVECTOR(CCS_ADAPTOR_tw_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BUSER.inSCALAR(TLS_tw_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_BUSER.outVECTOR(CCS_ADAPTOR_tw_rsc_BUSER);

    CCS_ADAPTOR_TLS_tw_rsc_ARID.inVECTOR(CCS_ADAPTOR_tw_rsc_ARID);
    CCS_ADAPTOR_TLS_tw_rsc_ARID.outSCALAR(TLS_tw_rsc_ARID);

    CCS_ADAPTOR_TLS_tw_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_tw_rsc_ARUSER);
    CCS_ADAPTOR_TLS_tw_rsc_ARUSER.outSCALAR(TLS_tw_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RID.inSCALAR(TLS_tw_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RID.outVECTOR(CCS_ADAPTOR_tw_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RUSER.inSCALAR(TLS_tw_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_rsc_RUSER.outVECTOR(CCS_ADAPTOR_tw_rsc_RUSER);

    tw_rsc_INST.ACLK(clk);
    tw_rsc_INST.ARESETn(rst);
    tw_rsc_INST.AWID(CCS_ADAPTOR_tw_rsc_AWID);
    tw_rsc_INST.AWADDR(TLS_tw_rsc_AWADDR);
    tw_rsc_INST.AWLEN(TLS_tw_rsc_AWLEN);
    tw_rsc_INST.AWSIZE(TLS_tw_rsc_AWSIZE);
    tw_rsc_INST.AWBURST(TLS_tw_rsc_AWBURST);
    tw_rsc_INST.AWLOCK(TLS_tw_rsc_AWLOCK);
    tw_rsc_INST.AWCACHE(TLS_tw_rsc_AWCACHE);
    tw_rsc_INST.AWPROT(TLS_tw_rsc_AWPROT);
    tw_rsc_INST.AWQOS(TLS_tw_rsc_AWQOS);
    tw_rsc_INST.AWREGION(TLS_tw_rsc_AWREGION);
    tw_rsc_INST.AWUSER(CCS_ADAPTOR_tw_rsc_AWUSER);
    tw_rsc_INST.AWVALID(TLS_tw_rsc_AWVALID);
    tw_rsc_INST.AWREADY(TLS_tw_rsc_AWREADY);
    tw_rsc_INST.WDATA(TLS_tw_rsc_WDATA);
    tw_rsc_INST.WSTRB(TLS_tw_rsc_WSTRB);
    tw_rsc_INST.WLAST(TLS_tw_rsc_WLAST);
    tw_rsc_INST.WUSER(CCS_ADAPTOR_tw_rsc_WUSER);
    tw_rsc_INST.WVALID(TLS_tw_rsc_WVALID);
    tw_rsc_INST.WREADY(TLS_tw_rsc_WREADY);
    tw_rsc_INST.BID(CCS_ADAPTOR_tw_rsc_BID);
    tw_rsc_INST.BRESP(TLS_tw_rsc_BRESP);
    tw_rsc_INST.BUSER(CCS_ADAPTOR_tw_rsc_BUSER);
    tw_rsc_INST.BVALID(TLS_tw_rsc_BVALID);
    tw_rsc_INST.BREADY(TLS_tw_rsc_BREADY);
    tw_rsc_INST.ARID(CCS_ADAPTOR_tw_rsc_ARID);
    tw_rsc_INST.ARADDR(TLS_tw_rsc_ARADDR);
    tw_rsc_INST.ARLEN(TLS_tw_rsc_ARLEN);
    tw_rsc_INST.ARSIZE(TLS_tw_rsc_ARSIZE);
    tw_rsc_INST.ARBURST(TLS_tw_rsc_ARBURST);
    tw_rsc_INST.ARLOCK(TLS_tw_rsc_ARLOCK);
    tw_rsc_INST.ARCACHE(TLS_tw_rsc_ARCACHE);
    tw_rsc_INST.ARPROT(TLS_tw_rsc_ARPROT);
    tw_rsc_INST.ARQOS(TLS_tw_rsc_ARQOS);
    tw_rsc_INST.ARREGION(TLS_tw_rsc_ARREGION);
    tw_rsc_INST.ARUSER(CCS_ADAPTOR_tw_rsc_ARUSER);
    tw_rsc_INST.ARVALID(TLS_tw_rsc_ARVALID);
    tw_rsc_INST.ARREADY(TLS_tw_rsc_ARREADY);
    tw_rsc_INST.RID(CCS_ADAPTOR_tw_rsc_RID);
    tw_rsc_INST.RDATA(TLS_tw_rsc_RDATA);
    tw_rsc_INST.RRESP(TLS_tw_rsc_RRESP);
    tw_rsc_INST.RLAST(TLS_tw_rsc_RLAST);
    tw_rsc_INST.RUSER(CCS_ADAPTOR_tw_rsc_RUSER);
    tw_rsc_INST.RVALID(TLS_tw_rsc_RVALID);
    tw_rsc_INST.RREADY(TLS_tw_rsc_RREADY);
    tw_rsc_INST.tr_write_done(TLS_tw_rsc_tr_write_done);
    tw_rsc_INST.s_tdone(TLS_tw_rsc_s_tdone);
    tw_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_6)));

    CCS_ADAPTOR_TLS_tw_h_rsc_AWID.inVECTOR(CCS_ADAPTOR_tw_h_rsc_AWID);
    CCS_ADAPTOR_TLS_tw_h_rsc_AWID.outSCALAR(TLS_tw_h_rsc_AWID);

    CCS_ADAPTOR_TLS_tw_h_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_tw_h_rsc_AWUSER);
    CCS_ADAPTOR_TLS_tw_h_rsc_AWUSER.outSCALAR(TLS_tw_h_rsc_AWUSER);

    CCS_ADAPTOR_TLS_tw_h_rsc_WUSER.inVECTOR(CCS_ADAPTOR_tw_h_rsc_WUSER);
    CCS_ADAPTOR_TLS_tw_h_rsc_WUSER.outSCALAR(TLS_tw_h_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BID.inSCALAR(TLS_tw_h_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BID.outVECTOR(CCS_ADAPTOR_tw_h_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BUSER.inSCALAR(TLS_tw_h_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_BUSER.outVECTOR(CCS_ADAPTOR_tw_h_rsc_BUSER);

    CCS_ADAPTOR_TLS_tw_h_rsc_ARID.inVECTOR(CCS_ADAPTOR_tw_h_rsc_ARID);
    CCS_ADAPTOR_TLS_tw_h_rsc_ARID.outSCALAR(TLS_tw_h_rsc_ARID);

    CCS_ADAPTOR_TLS_tw_h_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_tw_h_rsc_ARUSER);
    CCS_ADAPTOR_TLS_tw_h_rsc_ARUSER.outSCALAR(TLS_tw_h_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RID.inSCALAR(TLS_tw_h_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RID.outVECTOR(CCS_ADAPTOR_tw_h_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RUSER.inSCALAR(TLS_tw_h_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_tw_h_rsc_RUSER.outVECTOR(CCS_ADAPTOR_tw_h_rsc_RUSER);

    tw_h_rsc_INST.ACLK(clk);
    tw_h_rsc_INST.ARESETn(rst);
    tw_h_rsc_INST.AWID(CCS_ADAPTOR_tw_h_rsc_AWID);
    tw_h_rsc_INST.AWADDR(TLS_tw_h_rsc_AWADDR);
    tw_h_rsc_INST.AWLEN(TLS_tw_h_rsc_AWLEN);
    tw_h_rsc_INST.AWSIZE(TLS_tw_h_rsc_AWSIZE);
    tw_h_rsc_INST.AWBURST(TLS_tw_h_rsc_AWBURST);
    tw_h_rsc_INST.AWLOCK(TLS_tw_h_rsc_AWLOCK);
    tw_h_rsc_INST.AWCACHE(TLS_tw_h_rsc_AWCACHE);
    tw_h_rsc_INST.AWPROT(TLS_tw_h_rsc_AWPROT);
    tw_h_rsc_INST.AWQOS(TLS_tw_h_rsc_AWQOS);
    tw_h_rsc_INST.AWREGION(TLS_tw_h_rsc_AWREGION);
    tw_h_rsc_INST.AWUSER(CCS_ADAPTOR_tw_h_rsc_AWUSER);
    tw_h_rsc_INST.AWVALID(TLS_tw_h_rsc_AWVALID);
    tw_h_rsc_INST.AWREADY(TLS_tw_h_rsc_AWREADY);
    tw_h_rsc_INST.WDATA(TLS_tw_h_rsc_WDATA);
    tw_h_rsc_INST.WSTRB(TLS_tw_h_rsc_WSTRB);
    tw_h_rsc_INST.WLAST(TLS_tw_h_rsc_WLAST);
    tw_h_rsc_INST.WUSER(CCS_ADAPTOR_tw_h_rsc_WUSER);
    tw_h_rsc_INST.WVALID(TLS_tw_h_rsc_WVALID);
    tw_h_rsc_INST.WREADY(TLS_tw_h_rsc_WREADY);
    tw_h_rsc_INST.BID(CCS_ADAPTOR_tw_h_rsc_BID);
    tw_h_rsc_INST.BRESP(TLS_tw_h_rsc_BRESP);
    tw_h_rsc_INST.BUSER(CCS_ADAPTOR_tw_h_rsc_BUSER);
    tw_h_rsc_INST.BVALID(TLS_tw_h_rsc_BVALID);
    tw_h_rsc_INST.BREADY(TLS_tw_h_rsc_BREADY);
    tw_h_rsc_INST.ARID(CCS_ADAPTOR_tw_h_rsc_ARID);
    tw_h_rsc_INST.ARADDR(TLS_tw_h_rsc_ARADDR);
    tw_h_rsc_INST.ARLEN(TLS_tw_h_rsc_ARLEN);
    tw_h_rsc_INST.ARSIZE(TLS_tw_h_rsc_ARSIZE);
    tw_h_rsc_INST.ARBURST(TLS_tw_h_rsc_ARBURST);
    tw_h_rsc_INST.ARLOCK(TLS_tw_h_rsc_ARLOCK);
    tw_h_rsc_INST.ARCACHE(TLS_tw_h_rsc_ARCACHE);
    tw_h_rsc_INST.ARPROT(TLS_tw_h_rsc_ARPROT);
    tw_h_rsc_INST.ARQOS(TLS_tw_h_rsc_ARQOS);
    tw_h_rsc_INST.ARREGION(TLS_tw_h_rsc_ARREGION);
    tw_h_rsc_INST.ARUSER(CCS_ADAPTOR_tw_h_rsc_ARUSER);
    tw_h_rsc_INST.ARVALID(TLS_tw_h_rsc_ARVALID);
    tw_h_rsc_INST.ARREADY(TLS_tw_h_rsc_ARREADY);
    tw_h_rsc_INST.RID(CCS_ADAPTOR_tw_h_rsc_RID);
    tw_h_rsc_INST.RDATA(TLS_tw_h_rsc_RDATA);
    tw_h_rsc_INST.RRESP(TLS_tw_h_rsc_RRESP);
    tw_h_rsc_INST.RLAST(TLS_tw_h_rsc_RLAST);
    tw_h_rsc_INST.RUSER(CCS_ADAPTOR_tw_h_rsc_RUSER);
    tw_h_rsc_INST.RVALID(TLS_tw_h_rsc_RVALID);
    tw_h_rsc_INST.RREADY(TLS_tw_h_rsc_RREADY);
    tw_h_rsc_INST.tr_write_done(TLS_tw_h_rsc_tr_write_done);
    tw_h_rsc_INST.s_tdone(TLS_tw_h_rsc_s_tdone);
    tw_h_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_7)));

    trios_monitor_x_rsc_triosy_lz_INST.trios(TLS_x_rsc_triosy_lz);
    trios_monitor_x_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_x.in_fifo(TLS_in_fifo_x);
    transactor_x.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_x);
    transactor_x.out_fifo(TLS_out_fifo_x);
    transactor_x.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_x);
    transactor_x.bind_clk(clk, true, rst);
    transactor_x.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_x.register_block(&x_rsc_INST, x_rsc_INST.basename(), TLS_x_rsc_triosy_lz, 0, 1023, 1);

    trios_monitor_m_rsc_triosy_lz_INST.trios(TLS_m_rsc_triosy_lz);
    trios_monitor_m_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_m.in_fifo(TLS_in_fifo_m);
    transactor_m.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_m);
    transactor_m.bind_clk(clk, true, rst);
    transactor_m.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_m.register_block(&m_rsc_INST, m_rsc_INST.basename(), TLS_m_rsc_triosy_lz, 0, 0, 1);

    trios_monitor_twiddle_rsc_triosy_lz_INST.trios(TLS_twiddle_rsc_triosy_lz);
    trios_monitor_twiddle_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_INST, twiddle_rsc_INST.basename(), TLS_twiddle_rsc_triosy_lz,
        0, 31, 1);

    trios_monitor_twiddle_h_rsc_triosy_lz_INST.trios(TLS_twiddle_h_rsc_triosy_lz);
    trios_monitor_twiddle_h_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle_h.in_fifo(TLS_in_fifo_twiddle_h);
    transactor_twiddle_h.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle_h);
    transactor_twiddle_h.bind_clk(clk, true, rst);
    transactor_twiddle_h.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle_h.register_block(&twiddle_h_rsc_INST, twiddle_h_rsc_INST.basename(), TLS_twiddle_h_rsc_triosy_lz,
        0, 31, 1);

    trios_monitor_revArr_rsc_triosy_lz_INST.trios(TLS_revArr_rsc_triosy_lz);
    trios_monitor_revArr_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_revArr.in_fifo(TLS_in_fifo_revArr);
    transactor_revArr.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_revArr);
    transactor_revArr.bind_clk(clk, true, rst);
    transactor_revArr.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_revArr.register_block(&revArr_rsc_INST, revArr_rsc_INST.basename(), TLS_revArr_rsc_triosy_lz, 0,
        31, 1);

    trios_monitor_tw_rsc_triosy_lz_INST.trios(TLS_tw_rsc_triosy_lz);
    trios_monitor_tw_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_tw.in_fifo(TLS_in_fifo_tw);
    transactor_tw.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_tw);
    transactor_tw.bind_clk(clk, true, rst);
    transactor_tw.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_tw.register_block(&tw_rsc_INST, tw_rsc_INST.basename(), TLS_tw_rsc_triosy_lz, 0, 1023, 1);

    trios_monitor_tw_h_rsc_triosy_lz_INST.trios(TLS_tw_h_rsc_triosy_lz);
    trios_monitor_tw_h_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_tw_h.in_fifo(TLS_in_fifo_tw_h);
    transactor_tw_h.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_tw_h);
    transactor_tw_h.bind_clk(clk, true, rst);
    transactor_tw_h.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_tw_h.register_block(&tw_h_rsc_INST, tw_h_rsc_INST.basename(), TLS_tw_h_rsc_triosy_lz, 0, 1023, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_x_IN(TLS_in_fifo_x);
    testbench_INST.ccs_wait_ctrl_x_IN(TLS_in_wait_ctrl_fifo_x);
    testbench_INST.ccs_x(TLS_out_fifo_x);
    testbench_INST.ccs_wait_ctrl_x(TLS_out_wait_ctrl_fifo_x);
    testbench_INST.ccs_m(TLS_in_fifo_m);
    testbench_INST.ccs_wait_ctrl_m(TLS_in_wait_ctrl_fifo_m);
    testbench_INST.ccs_twiddle(TLS_in_fifo_twiddle);
    testbench_INST.ccs_wait_ctrl_twiddle(TLS_in_wait_ctrl_fifo_twiddle);
    testbench_INST.ccs_twiddle_h(TLS_in_fifo_twiddle_h);
    testbench_INST.ccs_wait_ctrl_twiddle_h(TLS_in_wait_ctrl_fifo_twiddle_h);
    testbench_INST.ccs_revArr(TLS_in_fifo_revArr);
    testbench_INST.ccs_wait_ctrl_revArr(TLS_in_wait_ctrl_fifo_revArr);
    testbench_INST.ccs_tw(TLS_in_fifo_tw);
    testbench_INST.ccs_wait_ctrl_tw(TLS_in_wait_ctrl_fifo_tw);
    testbench_INST.ccs_tw_h(TLS_in_fifo_tw_h);
    testbench_INST.ccs_wait_ctrl_tw_h(TLS_in_wait_ctrl_fifo_tw_h);
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
  x_rsc_INST.clear();
  m_rsc_INST.clear();
  twiddle_rsc_INST.clear();
  twiddle_h_rsc_INST.clear();
  revArr_rsc_INST.clear();
  tw_rsc_INST.clear();
  tw_h_rsc_INST.clear();
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
    transactor_x.set_auto_wait_limit(l);
    transactor_m.set_auto_wait_limit(l);
    transactor_twiddle.set_auto_wait_limit(l);
    transactor_twiddle_h.set_auto_wait_limit(l);
    transactor_revArr.set_auto_wait_limit(l);
    transactor_tw.set_auto_wait_limit(l);
    transactor_tw_h.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_x_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_m_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_h_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_revArr_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_tw_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_tw_h_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_x_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_m_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_h_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_revArr_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_tw_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_tw_h_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_x_count = -1;
  static int transactor_m_count = -1;
  static int transactor_twiddle_count = -1;
  static int transactor_twiddle_h_count = -1;
  static int transactor_revArr_count = -1;
  static int transactor_tw_count = -1;
  static int transactor_tw_h_count = -1;

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
    debug("transactor_x",transactor_x_flags,transactor_x_count);
    debug("transactor_m",transactor_m_flags,transactor_m_count);
    debug("transactor_twiddle",transactor_twiddle_flags,transactor_twiddle_count);
    debug("transactor_twiddle_h",transactor_twiddle_h_flags,transactor_twiddle_h_count);
    debug("transactor_revArr",transactor_revArr_flags,transactor_revArr_count);
    debug("transactor_tw",transactor_tw_flags,transactor_tw_count);
    debug("transactor_tw_h",transactor_tw_h_flags,transactor_tw_h_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_x") == 0)
    xlator_p = &transactor_x;
  if (strcmp(varname,"transactor_m") == 0)
    xlator_p = &transactor_m;
  if (strcmp(varname,"transactor_twiddle") == 0)
    xlator_p = &transactor_twiddle;
  if (strcmp(varname,"transactor_twiddle_h") == 0)
    xlator_p = &transactor_twiddle_h;
  if (strcmp(varname,"transactor_revArr") == 0)
    xlator_p = &transactor_revArr;
  if (strcmp(varname,"transactor_tw") == 0)
    xlator_p = &transactor_tw;
  if (strcmp(varname,"transactor_tw_h") == 0)
    xlator_p = &transactor_tw_h;
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
    generate_reset_event.notify(111.720001 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(111.720001 , SC_NS);
    } else {
      transactor_x.reset_streams();
      transactor_m.reset_streams();
      transactor_twiddle.reset_streams();
      transactor_twiddle_h.reset_streams();
      transactor_revArr.reset_streams();
      transactor_tw.reset_streams();
      transactor_tw_h.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_staller_inst_core_wen, /scverify_top/rtl/hybrid_core_inst/hybrid_core_staller_inst/core_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsci_inst/hybrid_core_x_rsci_x_rsc_wait_ctrl_inst/x_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsci_inst/hybrid_core_x_rsci_x_rsc_wait_ctrl_inst/x_rsci_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsci_inst/hybrid_core_x_rsci_x_rsc_wait_ctrl_inst/x_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_ctrl_inst_x_rsci_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsci_inst/hybrid_core_x_rsci_x_rsc_wait_ctrl_inst/x_rsci_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsci_inst/hybrid_core_x_rsci_x_rsc_wait_dp_inst/x_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsci_inst_hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsci_inst/hybrid_core_x_rsci_x_rsc_wait_dp_inst/x_rsci_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_twiddle_rsci_inst_hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_twiddle_rsci_inst/hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst/twiddle_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_twiddle_rsci_inst_hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_twiddle_rsci_inst/hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst/twiddle_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_twiddle_rsci_inst_hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_twiddle_rsci_inst/hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst/twiddle_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_twiddle_h_rsci_inst_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_twiddle_h_rsci_inst/hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst/twiddle_h_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_twiddle_h_rsci_inst_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_twiddle_h_rsci_inst/hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst/twiddle_h_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_twiddle_h_rsci_inst_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_twiddle_h_rsci_inst/hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst_revArr_rsci_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_revArr_rsci_inst/hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst/revArr_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst_revArr_rsci_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_revArr_rsci_inst/hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst/revArr_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_revArr_rsci_inst/hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst/revArr_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst_tw_rsci_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_tw_rsci_inst/hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst/tw_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst_tw_rsci_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_tw_rsci_inst/hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst/tw_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_tw_rsci_inst/hybrid_core_tw_rsci_tw_rsc_wait_dp_inst/tw_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst_tw_h_rsci_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_tw_h_rsci_inst/hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst/tw_h_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst_tw_h_rsci_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_tw_h_rsci_inst/hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst/tw_h_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_tw_h_rsci_inst/hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst/tw_h_rsci_s_raddr_core_sct);
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
