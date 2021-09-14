#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_slave_mem_trans_rsc.h"
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_2R1W_RBW_trans_rsc.h"
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
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_4;
extern double __scv_hold_time_RSCID_5;
extern double __scv_hold_time_RSCID_6;
extern double __scv_hold_time_RSCID_7;
extern double __scv_hold_time_RSCID_74;
extern double __scv_hold_time_RSCID_75;
extern double __scv_hold_time_RSCID_76;
extern double __scv_hold_time_RSCID_77;
extern double __scv_hold_time_RSCID_78;
extern double __scv_hold_time_RSCID_79;
extern double __scv_hold_time_RSCID_80;
extern double __scv_hold_time_RSCID_81;
extern double __scv_hold_time_RSCID_82;
extern double __scv_hold_time_RSCID_83;
extern double __scv_hold_time_RSCID_84;
extern double __scv_hold_time_RSCID_85;
extern double __scv_hold_time_RSCID_86;
extern double __scv_hold_time_RSCID_87;
extern double __scv_hold_time_RSCID_88;
extern double __scv_hold_time_RSCID_89;
extern double __scv_hold_time_RSCID_90;
extern double __scv_hold_time_RSCID_91;
extern double __scv_hold_time_RSCID_92;
extern double __scv_hold_time_RSCID_93;
extern double __scv_hold_time_RSCID_94;
extern double __scv_hold_time_RSCID_95;
extern double __scv_hold_time_RSCID_96;
extern double __scv_hold_time_RSCID_97;
extern double __scv_hold_time_RSCID_98;
extern double __scv_hold_time_RSCID_99;
extern double __scv_hold_time_RSCID_100;
extern double __scv_hold_time_RSCID_101;
extern double __scv_hold_time_RSCID_102;
extern double __scv_hold_time_RSCID_103;
extern double __scv_hold_time_RSCID_104;
extern double __scv_hold_time_RSCID_105;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_4 = 0;
double __scv_hold_time_RSCID_5 = 0;
double __scv_hold_time_RSCID_6 = 0;
double __scv_hold_time_RSCID_7 = 0;
double __scv_hold_time_RSCID_74 = 0;
double __scv_hold_time_RSCID_75 = 0;
double __scv_hold_time_RSCID_76 = 0;
double __scv_hold_time_RSCID_77 = 0;
double __scv_hold_time_RSCID_78 = 0;
double __scv_hold_time_RSCID_79 = 0;
double __scv_hold_time_RSCID_80 = 0;
double __scv_hold_time_RSCID_81 = 0;
double __scv_hold_time_RSCID_82 = 0;
double __scv_hold_time_RSCID_83 = 0;
double __scv_hold_time_RSCID_84 = 0;
double __scv_hold_time_RSCID_85 = 0;
double __scv_hold_time_RSCID_86 = 0;
double __scv_hold_time_RSCID_87 = 0;
double __scv_hold_time_RSCID_88 = 0;
double __scv_hold_time_RSCID_89 = 0;
double __scv_hold_time_RSCID_90 = 0;
double __scv_hold_time_RSCID_91 = 0;
double __scv_hold_time_RSCID_92 = 0;
double __scv_hold_time_RSCID_93 = 0;
double __scv_hold_time_RSCID_94 = 0;
double __scv_hold_time_RSCID_95 = 0;
double __scv_hold_time_RSCID_96 = 0;
double __scv_hold_time_RSCID_97 = 0;
double __scv_hold_time_RSCID_98 = 0;
double __scv_hold_time_RSCID_99 = 0;
double __scv_hold_time_RSCID_100 = 0;
double __scv_hold_time_RSCID_101 = 0;
double __scv_hold_time_RSCID_102 = 0;
double __scv_hold_time_RSCID_103 = 0;
double __scv_hold_time_RSCID_104 = 0;
double __scv_hold_time_RSCID_105 = 0;
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
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_0_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_0_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_0_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_0_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_0_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_0_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_0_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_0_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_0_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_0_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_0_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_0_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_0_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_0_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_0_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_0_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_0_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_1_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_1_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_1_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_1_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_1_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_1_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_1_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_1_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_1_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_1_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_1_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_1_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_1_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_1_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_1_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_1_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_1_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_2_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_2_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_2_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_2_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_2_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_2_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_2_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_2_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_2_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_2_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_2_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_2_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_2_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_2_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_2_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_2_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_2_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_3_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_3_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_3_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_3_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_3_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_3_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_3_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_3_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_3_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_3_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_3_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_3_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_3_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_3_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_3_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_3_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_3_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_4_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_4_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_4_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_4_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_4_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_4_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_4_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_4_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_4_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_4_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_4_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_4_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_4_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_4_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_4_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_4_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_4_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_5_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_5_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_5_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_5_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_5_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_5_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_5_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_5_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_5_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_5_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_5_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_5_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_5_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_5_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_5_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_5_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_5_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_6_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_6_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_6_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_6_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_6_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_6_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_6_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_6_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_6_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_6_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_6_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_6_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_6_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_6_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_6_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_6_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_6_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_7_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_7_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_7_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_7_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_7_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_7_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_7_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_7_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_7_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_7_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_7_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_7_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_7_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_7_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_7_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_7_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_7_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_8_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_8_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_8_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_8_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_8_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_8_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_8_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_8_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_8_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_8_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_8_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_8_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_8_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_8_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_8_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_8_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_8_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_9_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_9_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_9_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_9_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_9_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_9_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_9_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_9_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_9_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_9_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_9_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_9_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_9_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_9_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_9_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_9_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_9_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_10_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_10_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_10_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_10_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_10_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_10_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_10_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_10_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_10_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_10_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_10_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_10_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_10_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_10_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_10_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_10_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_10_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_11_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_11_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_11_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_11_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_11_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_11_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_11_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_11_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_11_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_11_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_11_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_11_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_11_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_11_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_11_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_11_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_11_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_12_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_12_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_12_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_12_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_12_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_12_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_12_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_12_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_12_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_12_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_12_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_12_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_12_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_12_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_12_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_12_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_12_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_13_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_13_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_13_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_13_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_13_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_13_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_13_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_13_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_13_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_13_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_13_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_13_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_13_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_13_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_13_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_13_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_13_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_14_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_14_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_14_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_14_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_14_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_14_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_14_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_14_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_14_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_14_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_14_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_14_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_14_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_14_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_14_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_14_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_14_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_15_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_15_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_15_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_15_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_15_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_15_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_15_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_15_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_15_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_15_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_15_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_15_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_15_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_15_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_15_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_15_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_15_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_16_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_16_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_16_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_16_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_16_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_16_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_16_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_16_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_16_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_16_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_16_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_16_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_16_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_16_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_16_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_16_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_16_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_17_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_17_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_17_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_17_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_17_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_17_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_17_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_17_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_17_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_17_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_17_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_17_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_17_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_17_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_17_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_17_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_17_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_18_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_18_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_18_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_18_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_18_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_18_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_18_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_18_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_18_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_18_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_18_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_18_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_18_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_18_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_18_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_18_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_18_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_19_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_19_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_19_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_19_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_19_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_19_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_19_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_19_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_19_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_19_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_19_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_19_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_19_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_19_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_19_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_19_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_19_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_20_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_20_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_20_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_20_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_20_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_20_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_20_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_20_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_20_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_20_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_20_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_20_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_20_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_20_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_20_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_20_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_20_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_21_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_21_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_21_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_21_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_21_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_21_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_21_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_21_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_21_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_21_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_21_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_21_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_21_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_21_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_21_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_21_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_21_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_22_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_22_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_22_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_22_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_22_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_22_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_22_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_22_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_22_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_22_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_22_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_22_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_22_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_22_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_22_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_22_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_22_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_23_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_23_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_23_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_23_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_23_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_23_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_23_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_23_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_23_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_23_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_23_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_23_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_23_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_23_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_23_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_23_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_23_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_24_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_24_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_24_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_24_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_24_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_24_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_24_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_24_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_24_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_24_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_24_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_24_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_24_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_24_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_24_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_24_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_24_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_25_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_25_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_25_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_25_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_25_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_25_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_25_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_25_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_25_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_25_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_25_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_25_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_25_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_25_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_25_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_25_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_25_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_26_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_26_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_26_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_26_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_26_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_26_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_26_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_26_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_26_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_26_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_26_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_26_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_26_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_26_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_26_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_26_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_26_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_27_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_27_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_27_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_27_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_27_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_27_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_27_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_27_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_27_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_27_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_27_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_27_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_27_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_27_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_27_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_27_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_27_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_28_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_28_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_28_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_28_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_28_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_28_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_28_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_28_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_28_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_28_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_28_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_28_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_28_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_28_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_28_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_28_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_28_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_29_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_29_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_29_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_29_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_29_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_29_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_29_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_29_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_29_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_29_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_29_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_29_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_29_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_29_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_29_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_29_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_29_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_30_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_30_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_30_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_30_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_30_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_30_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_30_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_30_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_30_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_30_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_30_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_30_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_30_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_30_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_30_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_30_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_30_0_lz;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_s_tdone;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_RREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_RVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_RUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_31_0_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_31_0_RDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_RID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_ARREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_ARVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_31_0_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_31_0_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_31_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_31_0_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_31_0_ARADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_ARID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_BREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_BVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_31_0_BRESP;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_BID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_WREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_WVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_WUSER;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_x_rsc_31_0_WDATA;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_AWREADY;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_AWVALID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_31_0_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_x_rsc_31_0_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_x_rsc_31_0_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_x_rsc_31_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_x_rsc_31_0_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_x_rsc_31_0_AWADDR;
  sc_signal<sc_logic>                                                          TLS_x_rsc_31_0_AWID;
  sc_signal<sc_logic>                                                          TLS_x_rsc_triosy_31_0_lz;
  sc_signal<sc_lv<32> >                                                        TLS_m_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_m_rsc_triosy_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_h_rsc_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_qb;
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
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_0_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_0_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_0_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_0_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_0_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_0_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_0__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_1_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_1_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_1_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_1_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_1_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_1_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_1__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_2_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_2_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_2_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_2_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_2_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_2_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_2__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_3_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_3_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_3_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_3_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_3_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_3_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_3__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_4_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_4_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_4_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_4_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_4_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_4_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_4__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_5_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_5_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_5_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_5_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_5_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_5_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_5__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_6_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_6_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_6_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_6_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_6_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_6_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_6__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_7_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_7_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_7_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_7_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_7_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_7_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_7__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_8_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_8_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_8_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_8_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_8_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_8_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_8__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_9_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_9_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_9_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_9_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_9_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_9_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_9__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_10_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_10_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_10_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_10_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_10_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_10_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_10__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_11_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_11_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_11_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_11_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_11_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_11_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_11__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_12_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_12_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_12_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_12_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_12_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_12_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_12__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_13_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_13_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_13_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_13_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_13_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_13_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_13__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_14_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_14_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_14_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_14_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_14_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_14_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_14__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_15_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_15_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_15_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_15_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_15_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_15_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_15__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_16_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_16_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_16_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_16_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_16_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_16_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_16__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_17_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_17_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_17_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_17_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_17_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_17_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_17__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_18_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_18_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_18_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_18_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_18_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_18_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_18__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_19_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_19_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_19_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_19_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_19_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_19_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_19__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_20_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_20_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_20_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_20_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_20_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_20_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_20__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_21_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_21_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_21_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_21_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_21_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_21_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_21__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_22_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_22_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_22_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_22_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_22_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_22_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_22__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_23_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_23_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_23_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_23_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_23_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_23_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_23__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_24_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_24_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_24_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_24_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_24_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_24_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_24__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_25_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_25_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_25_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_25_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_25_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_25_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_25__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_26_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_26_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_26_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_26_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_26_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_26_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_26__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_27_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_27_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_27_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_27_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_27_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_27_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_27__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_28_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_28_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_28_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_28_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_28_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_28_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_28__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_29_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_29_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_29_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_29_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_29_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_29_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_29__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_30_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_30_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_30_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_30_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_30_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_30_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_30__0__INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_31_0_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_31_0_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_31_0_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_31_0_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_x_rsc_31_0_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_x_rsc_31_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<32,32,32,0,0,12,32,1,1,1,0,0 >                  x_rsc_31__0__INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   m_rsc_INST;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_da;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_qa;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_wea;
  BLOCK_2R1W_RBW_trans_rsc<5,32,32 >                                           twiddle_rsc_INST;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_h_rsc_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_da;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_qa;
  sc_signal<sc_logic >                                                         TLS_twiddle_h_rsc_wea;
  BLOCK_2R1W_RBW_trans_rsc<5,32,32 >                                           twiddle_h_rsc_INST;
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
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_1_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_2_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_3_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_4_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_5_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_6_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_7_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_8_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_9_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_10_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_11_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_12_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_13_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_14_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_15_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_16_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_17_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_18_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_19_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_20_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_21_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_22_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_23_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_24_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_25_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_26_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_27_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_28_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_29_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_30_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_x_rsc_triosy_31_0_lz_INST;
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
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst_revArr_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst_revArr_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_revArr_rsci_inst_hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst_tw_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst_tw_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_rsci_inst_hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst_tw_h_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst_tw_h_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_tw_h_rsci_inst_hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_dp_inst_x_rsc_0_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_dp_inst_x_rsc_0_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_dp_inst_x_rsc_1_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_dp_inst_x_rsc_1_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_dp_inst_x_rsc_2_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_dp_inst_x_rsc_2_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_dp_inst_x_rsc_3_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_dp_inst_x_rsc_3_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_dp_inst_x_rsc_4_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_dp_inst_x_rsc_4_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_dp_inst_x_rsc_5_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_dp_inst_x_rsc_5_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_dp_inst_x_rsc_6_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_dp_inst_x_rsc_6_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_dp_inst_x_rsc_7_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_dp_inst_x_rsc_7_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_dp_inst_x_rsc_8_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_dp_inst_x_rsc_8_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_dp_inst_x_rsc_9_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_dp_inst_x_rsc_9_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_dp_inst_x_rsc_10_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_dp_inst_x_rsc_10_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_dp_inst_x_rsc_11_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_dp_inst_x_rsc_11_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_dp_inst_x_rsc_12_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_dp_inst_x_rsc_12_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_dp_inst_x_rsc_13_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_dp_inst_x_rsc_13_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_dp_inst_x_rsc_14_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_dp_inst_x_rsc_14_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_dp_inst_x_rsc_15_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_dp_inst_x_rsc_15_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_dp_inst_x_rsc_16_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_dp_inst_x_rsc_16_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_dp_inst_x_rsc_17_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_dp_inst_x_rsc_17_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_dp_inst_x_rsc_18_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_dp_inst_x_rsc_18_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_dp_inst_x_rsc_19_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_dp_inst_x_rsc_19_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_dp_inst_x_rsc_20_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_dp_inst_x_rsc_20_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_dp_inst_x_rsc_21_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_dp_inst_x_rsc_21_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_dp_inst_x_rsc_22_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_dp_inst_x_rsc_22_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_dp_inst_x_rsc_23_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_dp_inst_x_rsc_23_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_dp_inst_x_rsc_24_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_dp_inst_x_rsc_24_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_dp_inst_x_rsc_25_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_dp_inst_x_rsc_25_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_dp_inst_x_rsc_26_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_dp_inst_x_rsc_26_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_dp_inst_x_rsc_27_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_dp_inst_x_rsc_27_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_dp_inst_x_rsc_28_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_dp_inst_x_rsc_28_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_dp_inst_x_rsc_29_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_dp_inst_x_rsc_29_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_dp_inst_x_rsc_30_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_dp_inst_x_rsc_30_0_i_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_dp_inst_x_rsc_31_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_dp_inst_x_rsc_31_0_i_s_waddr_core_sct;
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
    , TLS_x_rsc_0_0_s_tdone("TLS_x_rsc_0_0_s_tdone")
    , TLS_x_rsc_0_0_tr_write_done("TLS_x_rsc_0_0_tr_write_done")
    , TLS_x_rsc_0_0_RREADY("TLS_x_rsc_0_0_RREADY")
    , TLS_x_rsc_0_0_RVALID("TLS_x_rsc_0_0_RVALID")
    , TLS_x_rsc_0_0_RUSER("TLS_x_rsc_0_0_RUSER")
    , TLS_x_rsc_0_0_RLAST("TLS_x_rsc_0_0_RLAST")
    , TLS_x_rsc_0_0_RRESP("TLS_x_rsc_0_0_RRESP")
    , TLS_x_rsc_0_0_RDATA("TLS_x_rsc_0_0_RDATA")
    , TLS_x_rsc_0_0_RID("TLS_x_rsc_0_0_RID")
    , TLS_x_rsc_0_0_ARREADY("TLS_x_rsc_0_0_ARREADY")
    , TLS_x_rsc_0_0_ARVALID("TLS_x_rsc_0_0_ARVALID")
    , TLS_x_rsc_0_0_ARUSER("TLS_x_rsc_0_0_ARUSER")
    , TLS_x_rsc_0_0_ARREGION("TLS_x_rsc_0_0_ARREGION")
    , TLS_x_rsc_0_0_ARQOS("TLS_x_rsc_0_0_ARQOS")
    , TLS_x_rsc_0_0_ARPROT("TLS_x_rsc_0_0_ARPROT")
    , TLS_x_rsc_0_0_ARCACHE("TLS_x_rsc_0_0_ARCACHE")
    , TLS_x_rsc_0_0_ARLOCK("TLS_x_rsc_0_0_ARLOCK")
    , TLS_x_rsc_0_0_ARBURST("TLS_x_rsc_0_0_ARBURST")
    , TLS_x_rsc_0_0_ARSIZE("TLS_x_rsc_0_0_ARSIZE")
    , TLS_x_rsc_0_0_ARLEN("TLS_x_rsc_0_0_ARLEN")
    , TLS_x_rsc_0_0_ARADDR("TLS_x_rsc_0_0_ARADDR")
    , TLS_x_rsc_0_0_ARID("TLS_x_rsc_0_0_ARID")
    , TLS_x_rsc_0_0_BREADY("TLS_x_rsc_0_0_BREADY")
    , TLS_x_rsc_0_0_BVALID("TLS_x_rsc_0_0_BVALID")
    , TLS_x_rsc_0_0_BUSER("TLS_x_rsc_0_0_BUSER")
    , TLS_x_rsc_0_0_BRESP("TLS_x_rsc_0_0_BRESP")
    , TLS_x_rsc_0_0_BID("TLS_x_rsc_0_0_BID")
    , TLS_x_rsc_0_0_WREADY("TLS_x_rsc_0_0_WREADY")
    , TLS_x_rsc_0_0_WVALID("TLS_x_rsc_0_0_WVALID")
    , TLS_x_rsc_0_0_WUSER("TLS_x_rsc_0_0_WUSER")
    , TLS_x_rsc_0_0_WLAST("TLS_x_rsc_0_0_WLAST")
    , TLS_x_rsc_0_0_WSTRB("TLS_x_rsc_0_0_WSTRB")
    , TLS_x_rsc_0_0_WDATA("TLS_x_rsc_0_0_WDATA")
    , TLS_x_rsc_0_0_AWREADY("TLS_x_rsc_0_0_AWREADY")
    , TLS_x_rsc_0_0_AWVALID("TLS_x_rsc_0_0_AWVALID")
    , TLS_x_rsc_0_0_AWUSER("TLS_x_rsc_0_0_AWUSER")
    , TLS_x_rsc_0_0_AWREGION("TLS_x_rsc_0_0_AWREGION")
    , TLS_x_rsc_0_0_AWQOS("TLS_x_rsc_0_0_AWQOS")
    , TLS_x_rsc_0_0_AWPROT("TLS_x_rsc_0_0_AWPROT")
    , TLS_x_rsc_0_0_AWCACHE("TLS_x_rsc_0_0_AWCACHE")
    , TLS_x_rsc_0_0_AWLOCK("TLS_x_rsc_0_0_AWLOCK")
    , TLS_x_rsc_0_0_AWBURST("TLS_x_rsc_0_0_AWBURST")
    , TLS_x_rsc_0_0_AWSIZE("TLS_x_rsc_0_0_AWSIZE")
    , TLS_x_rsc_0_0_AWLEN("TLS_x_rsc_0_0_AWLEN")
    , TLS_x_rsc_0_0_AWADDR("TLS_x_rsc_0_0_AWADDR")
    , TLS_x_rsc_0_0_AWID("TLS_x_rsc_0_0_AWID")
    , TLS_x_rsc_triosy_0_0_lz("TLS_x_rsc_triosy_0_0_lz")
    , TLS_x_rsc_1_0_s_tdone("TLS_x_rsc_1_0_s_tdone")
    , TLS_x_rsc_1_0_tr_write_done("TLS_x_rsc_1_0_tr_write_done")
    , TLS_x_rsc_1_0_RREADY("TLS_x_rsc_1_0_RREADY")
    , TLS_x_rsc_1_0_RVALID("TLS_x_rsc_1_0_RVALID")
    , TLS_x_rsc_1_0_RUSER("TLS_x_rsc_1_0_RUSER")
    , TLS_x_rsc_1_0_RLAST("TLS_x_rsc_1_0_RLAST")
    , TLS_x_rsc_1_0_RRESP("TLS_x_rsc_1_0_RRESP")
    , TLS_x_rsc_1_0_RDATA("TLS_x_rsc_1_0_RDATA")
    , TLS_x_rsc_1_0_RID("TLS_x_rsc_1_0_RID")
    , TLS_x_rsc_1_0_ARREADY("TLS_x_rsc_1_0_ARREADY")
    , TLS_x_rsc_1_0_ARVALID("TLS_x_rsc_1_0_ARVALID")
    , TLS_x_rsc_1_0_ARUSER("TLS_x_rsc_1_0_ARUSER")
    , TLS_x_rsc_1_0_ARREGION("TLS_x_rsc_1_0_ARREGION")
    , TLS_x_rsc_1_0_ARQOS("TLS_x_rsc_1_0_ARQOS")
    , TLS_x_rsc_1_0_ARPROT("TLS_x_rsc_1_0_ARPROT")
    , TLS_x_rsc_1_0_ARCACHE("TLS_x_rsc_1_0_ARCACHE")
    , TLS_x_rsc_1_0_ARLOCK("TLS_x_rsc_1_0_ARLOCK")
    , TLS_x_rsc_1_0_ARBURST("TLS_x_rsc_1_0_ARBURST")
    , TLS_x_rsc_1_0_ARSIZE("TLS_x_rsc_1_0_ARSIZE")
    , TLS_x_rsc_1_0_ARLEN("TLS_x_rsc_1_0_ARLEN")
    , TLS_x_rsc_1_0_ARADDR("TLS_x_rsc_1_0_ARADDR")
    , TLS_x_rsc_1_0_ARID("TLS_x_rsc_1_0_ARID")
    , TLS_x_rsc_1_0_BREADY("TLS_x_rsc_1_0_BREADY")
    , TLS_x_rsc_1_0_BVALID("TLS_x_rsc_1_0_BVALID")
    , TLS_x_rsc_1_0_BUSER("TLS_x_rsc_1_0_BUSER")
    , TLS_x_rsc_1_0_BRESP("TLS_x_rsc_1_0_BRESP")
    , TLS_x_rsc_1_0_BID("TLS_x_rsc_1_0_BID")
    , TLS_x_rsc_1_0_WREADY("TLS_x_rsc_1_0_WREADY")
    , TLS_x_rsc_1_0_WVALID("TLS_x_rsc_1_0_WVALID")
    , TLS_x_rsc_1_0_WUSER("TLS_x_rsc_1_0_WUSER")
    , TLS_x_rsc_1_0_WLAST("TLS_x_rsc_1_0_WLAST")
    , TLS_x_rsc_1_0_WSTRB("TLS_x_rsc_1_0_WSTRB")
    , TLS_x_rsc_1_0_WDATA("TLS_x_rsc_1_0_WDATA")
    , TLS_x_rsc_1_0_AWREADY("TLS_x_rsc_1_0_AWREADY")
    , TLS_x_rsc_1_0_AWVALID("TLS_x_rsc_1_0_AWVALID")
    , TLS_x_rsc_1_0_AWUSER("TLS_x_rsc_1_0_AWUSER")
    , TLS_x_rsc_1_0_AWREGION("TLS_x_rsc_1_0_AWREGION")
    , TLS_x_rsc_1_0_AWQOS("TLS_x_rsc_1_0_AWQOS")
    , TLS_x_rsc_1_0_AWPROT("TLS_x_rsc_1_0_AWPROT")
    , TLS_x_rsc_1_0_AWCACHE("TLS_x_rsc_1_0_AWCACHE")
    , TLS_x_rsc_1_0_AWLOCK("TLS_x_rsc_1_0_AWLOCK")
    , TLS_x_rsc_1_0_AWBURST("TLS_x_rsc_1_0_AWBURST")
    , TLS_x_rsc_1_0_AWSIZE("TLS_x_rsc_1_0_AWSIZE")
    , TLS_x_rsc_1_0_AWLEN("TLS_x_rsc_1_0_AWLEN")
    , TLS_x_rsc_1_0_AWADDR("TLS_x_rsc_1_0_AWADDR")
    , TLS_x_rsc_1_0_AWID("TLS_x_rsc_1_0_AWID")
    , TLS_x_rsc_triosy_1_0_lz("TLS_x_rsc_triosy_1_0_lz")
    , TLS_x_rsc_2_0_s_tdone("TLS_x_rsc_2_0_s_tdone")
    , TLS_x_rsc_2_0_tr_write_done("TLS_x_rsc_2_0_tr_write_done")
    , TLS_x_rsc_2_0_RREADY("TLS_x_rsc_2_0_RREADY")
    , TLS_x_rsc_2_0_RVALID("TLS_x_rsc_2_0_RVALID")
    , TLS_x_rsc_2_0_RUSER("TLS_x_rsc_2_0_RUSER")
    , TLS_x_rsc_2_0_RLAST("TLS_x_rsc_2_0_RLAST")
    , TLS_x_rsc_2_0_RRESP("TLS_x_rsc_2_0_RRESP")
    , TLS_x_rsc_2_0_RDATA("TLS_x_rsc_2_0_RDATA")
    , TLS_x_rsc_2_0_RID("TLS_x_rsc_2_0_RID")
    , TLS_x_rsc_2_0_ARREADY("TLS_x_rsc_2_0_ARREADY")
    , TLS_x_rsc_2_0_ARVALID("TLS_x_rsc_2_0_ARVALID")
    , TLS_x_rsc_2_0_ARUSER("TLS_x_rsc_2_0_ARUSER")
    , TLS_x_rsc_2_0_ARREGION("TLS_x_rsc_2_0_ARREGION")
    , TLS_x_rsc_2_0_ARQOS("TLS_x_rsc_2_0_ARQOS")
    , TLS_x_rsc_2_0_ARPROT("TLS_x_rsc_2_0_ARPROT")
    , TLS_x_rsc_2_0_ARCACHE("TLS_x_rsc_2_0_ARCACHE")
    , TLS_x_rsc_2_0_ARLOCK("TLS_x_rsc_2_0_ARLOCK")
    , TLS_x_rsc_2_0_ARBURST("TLS_x_rsc_2_0_ARBURST")
    , TLS_x_rsc_2_0_ARSIZE("TLS_x_rsc_2_0_ARSIZE")
    , TLS_x_rsc_2_0_ARLEN("TLS_x_rsc_2_0_ARLEN")
    , TLS_x_rsc_2_0_ARADDR("TLS_x_rsc_2_0_ARADDR")
    , TLS_x_rsc_2_0_ARID("TLS_x_rsc_2_0_ARID")
    , TLS_x_rsc_2_0_BREADY("TLS_x_rsc_2_0_BREADY")
    , TLS_x_rsc_2_0_BVALID("TLS_x_rsc_2_0_BVALID")
    , TLS_x_rsc_2_0_BUSER("TLS_x_rsc_2_0_BUSER")
    , TLS_x_rsc_2_0_BRESP("TLS_x_rsc_2_0_BRESP")
    , TLS_x_rsc_2_0_BID("TLS_x_rsc_2_0_BID")
    , TLS_x_rsc_2_0_WREADY("TLS_x_rsc_2_0_WREADY")
    , TLS_x_rsc_2_0_WVALID("TLS_x_rsc_2_0_WVALID")
    , TLS_x_rsc_2_0_WUSER("TLS_x_rsc_2_0_WUSER")
    , TLS_x_rsc_2_0_WLAST("TLS_x_rsc_2_0_WLAST")
    , TLS_x_rsc_2_0_WSTRB("TLS_x_rsc_2_0_WSTRB")
    , TLS_x_rsc_2_0_WDATA("TLS_x_rsc_2_0_WDATA")
    , TLS_x_rsc_2_0_AWREADY("TLS_x_rsc_2_0_AWREADY")
    , TLS_x_rsc_2_0_AWVALID("TLS_x_rsc_2_0_AWVALID")
    , TLS_x_rsc_2_0_AWUSER("TLS_x_rsc_2_0_AWUSER")
    , TLS_x_rsc_2_0_AWREGION("TLS_x_rsc_2_0_AWREGION")
    , TLS_x_rsc_2_0_AWQOS("TLS_x_rsc_2_0_AWQOS")
    , TLS_x_rsc_2_0_AWPROT("TLS_x_rsc_2_0_AWPROT")
    , TLS_x_rsc_2_0_AWCACHE("TLS_x_rsc_2_0_AWCACHE")
    , TLS_x_rsc_2_0_AWLOCK("TLS_x_rsc_2_0_AWLOCK")
    , TLS_x_rsc_2_0_AWBURST("TLS_x_rsc_2_0_AWBURST")
    , TLS_x_rsc_2_0_AWSIZE("TLS_x_rsc_2_0_AWSIZE")
    , TLS_x_rsc_2_0_AWLEN("TLS_x_rsc_2_0_AWLEN")
    , TLS_x_rsc_2_0_AWADDR("TLS_x_rsc_2_0_AWADDR")
    , TLS_x_rsc_2_0_AWID("TLS_x_rsc_2_0_AWID")
    , TLS_x_rsc_triosy_2_0_lz("TLS_x_rsc_triosy_2_0_lz")
    , TLS_x_rsc_3_0_s_tdone("TLS_x_rsc_3_0_s_tdone")
    , TLS_x_rsc_3_0_tr_write_done("TLS_x_rsc_3_0_tr_write_done")
    , TLS_x_rsc_3_0_RREADY("TLS_x_rsc_3_0_RREADY")
    , TLS_x_rsc_3_0_RVALID("TLS_x_rsc_3_0_RVALID")
    , TLS_x_rsc_3_0_RUSER("TLS_x_rsc_3_0_RUSER")
    , TLS_x_rsc_3_0_RLAST("TLS_x_rsc_3_0_RLAST")
    , TLS_x_rsc_3_0_RRESP("TLS_x_rsc_3_0_RRESP")
    , TLS_x_rsc_3_0_RDATA("TLS_x_rsc_3_0_RDATA")
    , TLS_x_rsc_3_0_RID("TLS_x_rsc_3_0_RID")
    , TLS_x_rsc_3_0_ARREADY("TLS_x_rsc_3_0_ARREADY")
    , TLS_x_rsc_3_0_ARVALID("TLS_x_rsc_3_0_ARVALID")
    , TLS_x_rsc_3_0_ARUSER("TLS_x_rsc_3_0_ARUSER")
    , TLS_x_rsc_3_0_ARREGION("TLS_x_rsc_3_0_ARREGION")
    , TLS_x_rsc_3_0_ARQOS("TLS_x_rsc_3_0_ARQOS")
    , TLS_x_rsc_3_0_ARPROT("TLS_x_rsc_3_0_ARPROT")
    , TLS_x_rsc_3_0_ARCACHE("TLS_x_rsc_3_0_ARCACHE")
    , TLS_x_rsc_3_0_ARLOCK("TLS_x_rsc_3_0_ARLOCK")
    , TLS_x_rsc_3_0_ARBURST("TLS_x_rsc_3_0_ARBURST")
    , TLS_x_rsc_3_0_ARSIZE("TLS_x_rsc_3_0_ARSIZE")
    , TLS_x_rsc_3_0_ARLEN("TLS_x_rsc_3_0_ARLEN")
    , TLS_x_rsc_3_0_ARADDR("TLS_x_rsc_3_0_ARADDR")
    , TLS_x_rsc_3_0_ARID("TLS_x_rsc_3_0_ARID")
    , TLS_x_rsc_3_0_BREADY("TLS_x_rsc_3_0_BREADY")
    , TLS_x_rsc_3_0_BVALID("TLS_x_rsc_3_0_BVALID")
    , TLS_x_rsc_3_0_BUSER("TLS_x_rsc_3_0_BUSER")
    , TLS_x_rsc_3_0_BRESP("TLS_x_rsc_3_0_BRESP")
    , TLS_x_rsc_3_0_BID("TLS_x_rsc_3_0_BID")
    , TLS_x_rsc_3_0_WREADY("TLS_x_rsc_3_0_WREADY")
    , TLS_x_rsc_3_0_WVALID("TLS_x_rsc_3_0_WVALID")
    , TLS_x_rsc_3_0_WUSER("TLS_x_rsc_3_0_WUSER")
    , TLS_x_rsc_3_0_WLAST("TLS_x_rsc_3_0_WLAST")
    , TLS_x_rsc_3_0_WSTRB("TLS_x_rsc_3_0_WSTRB")
    , TLS_x_rsc_3_0_WDATA("TLS_x_rsc_3_0_WDATA")
    , TLS_x_rsc_3_0_AWREADY("TLS_x_rsc_3_0_AWREADY")
    , TLS_x_rsc_3_0_AWVALID("TLS_x_rsc_3_0_AWVALID")
    , TLS_x_rsc_3_0_AWUSER("TLS_x_rsc_3_0_AWUSER")
    , TLS_x_rsc_3_0_AWREGION("TLS_x_rsc_3_0_AWREGION")
    , TLS_x_rsc_3_0_AWQOS("TLS_x_rsc_3_0_AWQOS")
    , TLS_x_rsc_3_0_AWPROT("TLS_x_rsc_3_0_AWPROT")
    , TLS_x_rsc_3_0_AWCACHE("TLS_x_rsc_3_0_AWCACHE")
    , TLS_x_rsc_3_0_AWLOCK("TLS_x_rsc_3_0_AWLOCK")
    , TLS_x_rsc_3_0_AWBURST("TLS_x_rsc_3_0_AWBURST")
    , TLS_x_rsc_3_0_AWSIZE("TLS_x_rsc_3_0_AWSIZE")
    , TLS_x_rsc_3_0_AWLEN("TLS_x_rsc_3_0_AWLEN")
    , TLS_x_rsc_3_0_AWADDR("TLS_x_rsc_3_0_AWADDR")
    , TLS_x_rsc_3_0_AWID("TLS_x_rsc_3_0_AWID")
    , TLS_x_rsc_triosy_3_0_lz("TLS_x_rsc_triosy_3_0_lz")
    , TLS_x_rsc_4_0_s_tdone("TLS_x_rsc_4_0_s_tdone")
    , TLS_x_rsc_4_0_tr_write_done("TLS_x_rsc_4_0_tr_write_done")
    , TLS_x_rsc_4_0_RREADY("TLS_x_rsc_4_0_RREADY")
    , TLS_x_rsc_4_0_RVALID("TLS_x_rsc_4_0_RVALID")
    , TLS_x_rsc_4_0_RUSER("TLS_x_rsc_4_0_RUSER")
    , TLS_x_rsc_4_0_RLAST("TLS_x_rsc_4_0_RLAST")
    , TLS_x_rsc_4_0_RRESP("TLS_x_rsc_4_0_RRESP")
    , TLS_x_rsc_4_0_RDATA("TLS_x_rsc_4_0_RDATA")
    , TLS_x_rsc_4_0_RID("TLS_x_rsc_4_0_RID")
    , TLS_x_rsc_4_0_ARREADY("TLS_x_rsc_4_0_ARREADY")
    , TLS_x_rsc_4_0_ARVALID("TLS_x_rsc_4_0_ARVALID")
    , TLS_x_rsc_4_0_ARUSER("TLS_x_rsc_4_0_ARUSER")
    , TLS_x_rsc_4_0_ARREGION("TLS_x_rsc_4_0_ARREGION")
    , TLS_x_rsc_4_0_ARQOS("TLS_x_rsc_4_0_ARQOS")
    , TLS_x_rsc_4_0_ARPROT("TLS_x_rsc_4_0_ARPROT")
    , TLS_x_rsc_4_0_ARCACHE("TLS_x_rsc_4_0_ARCACHE")
    , TLS_x_rsc_4_0_ARLOCK("TLS_x_rsc_4_0_ARLOCK")
    , TLS_x_rsc_4_0_ARBURST("TLS_x_rsc_4_0_ARBURST")
    , TLS_x_rsc_4_0_ARSIZE("TLS_x_rsc_4_0_ARSIZE")
    , TLS_x_rsc_4_0_ARLEN("TLS_x_rsc_4_0_ARLEN")
    , TLS_x_rsc_4_0_ARADDR("TLS_x_rsc_4_0_ARADDR")
    , TLS_x_rsc_4_0_ARID("TLS_x_rsc_4_0_ARID")
    , TLS_x_rsc_4_0_BREADY("TLS_x_rsc_4_0_BREADY")
    , TLS_x_rsc_4_0_BVALID("TLS_x_rsc_4_0_BVALID")
    , TLS_x_rsc_4_0_BUSER("TLS_x_rsc_4_0_BUSER")
    , TLS_x_rsc_4_0_BRESP("TLS_x_rsc_4_0_BRESP")
    , TLS_x_rsc_4_0_BID("TLS_x_rsc_4_0_BID")
    , TLS_x_rsc_4_0_WREADY("TLS_x_rsc_4_0_WREADY")
    , TLS_x_rsc_4_0_WVALID("TLS_x_rsc_4_0_WVALID")
    , TLS_x_rsc_4_0_WUSER("TLS_x_rsc_4_0_WUSER")
    , TLS_x_rsc_4_0_WLAST("TLS_x_rsc_4_0_WLAST")
    , TLS_x_rsc_4_0_WSTRB("TLS_x_rsc_4_0_WSTRB")
    , TLS_x_rsc_4_0_WDATA("TLS_x_rsc_4_0_WDATA")
    , TLS_x_rsc_4_0_AWREADY("TLS_x_rsc_4_0_AWREADY")
    , TLS_x_rsc_4_0_AWVALID("TLS_x_rsc_4_0_AWVALID")
    , TLS_x_rsc_4_0_AWUSER("TLS_x_rsc_4_0_AWUSER")
    , TLS_x_rsc_4_0_AWREGION("TLS_x_rsc_4_0_AWREGION")
    , TLS_x_rsc_4_0_AWQOS("TLS_x_rsc_4_0_AWQOS")
    , TLS_x_rsc_4_0_AWPROT("TLS_x_rsc_4_0_AWPROT")
    , TLS_x_rsc_4_0_AWCACHE("TLS_x_rsc_4_0_AWCACHE")
    , TLS_x_rsc_4_0_AWLOCK("TLS_x_rsc_4_0_AWLOCK")
    , TLS_x_rsc_4_0_AWBURST("TLS_x_rsc_4_0_AWBURST")
    , TLS_x_rsc_4_0_AWSIZE("TLS_x_rsc_4_0_AWSIZE")
    , TLS_x_rsc_4_0_AWLEN("TLS_x_rsc_4_0_AWLEN")
    , TLS_x_rsc_4_0_AWADDR("TLS_x_rsc_4_0_AWADDR")
    , TLS_x_rsc_4_0_AWID("TLS_x_rsc_4_0_AWID")
    , TLS_x_rsc_triosy_4_0_lz("TLS_x_rsc_triosy_4_0_lz")
    , TLS_x_rsc_5_0_s_tdone("TLS_x_rsc_5_0_s_tdone")
    , TLS_x_rsc_5_0_tr_write_done("TLS_x_rsc_5_0_tr_write_done")
    , TLS_x_rsc_5_0_RREADY("TLS_x_rsc_5_0_RREADY")
    , TLS_x_rsc_5_0_RVALID("TLS_x_rsc_5_0_RVALID")
    , TLS_x_rsc_5_0_RUSER("TLS_x_rsc_5_0_RUSER")
    , TLS_x_rsc_5_0_RLAST("TLS_x_rsc_5_0_RLAST")
    , TLS_x_rsc_5_0_RRESP("TLS_x_rsc_5_0_RRESP")
    , TLS_x_rsc_5_0_RDATA("TLS_x_rsc_5_0_RDATA")
    , TLS_x_rsc_5_0_RID("TLS_x_rsc_5_0_RID")
    , TLS_x_rsc_5_0_ARREADY("TLS_x_rsc_5_0_ARREADY")
    , TLS_x_rsc_5_0_ARVALID("TLS_x_rsc_5_0_ARVALID")
    , TLS_x_rsc_5_0_ARUSER("TLS_x_rsc_5_0_ARUSER")
    , TLS_x_rsc_5_0_ARREGION("TLS_x_rsc_5_0_ARREGION")
    , TLS_x_rsc_5_0_ARQOS("TLS_x_rsc_5_0_ARQOS")
    , TLS_x_rsc_5_0_ARPROT("TLS_x_rsc_5_0_ARPROT")
    , TLS_x_rsc_5_0_ARCACHE("TLS_x_rsc_5_0_ARCACHE")
    , TLS_x_rsc_5_0_ARLOCK("TLS_x_rsc_5_0_ARLOCK")
    , TLS_x_rsc_5_0_ARBURST("TLS_x_rsc_5_0_ARBURST")
    , TLS_x_rsc_5_0_ARSIZE("TLS_x_rsc_5_0_ARSIZE")
    , TLS_x_rsc_5_0_ARLEN("TLS_x_rsc_5_0_ARLEN")
    , TLS_x_rsc_5_0_ARADDR("TLS_x_rsc_5_0_ARADDR")
    , TLS_x_rsc_5_0_ARID("TLS_x_rsc_5_0_ARID")
    , TLS_x_rsc_5_0_BREADY("TLS_x_rsc_5_0_BREADY")
    , TLS_x_rsc_5_0_BVALID("TLS_x_rsc_5_0_BVALID")
    , TLS_x_rsc_5_0_BUSER("TLS_x_rsc_5_0_BUSER")
    , TLS_x_rsc_5_0_BRESP("TLS_x_rsc_5_0_BRESP")
    , TLS_x_rsc_5_0_BID("TLS_x_rsc_5_0_BID")
    , TLS_x_rsc_5_0_WREADY("TLS_x_rsc_5_0_WREADY")
    , TLS_x_rsc_5_0_WVALID("TLS_x_rsc_5_0_WVALID")
    , TLS_x_rsc_5_0_WUSER("TLS_x_rsc_5_0_WUSER")
    , TLS_x_rsc_5_0_WLAST("TLS_x_rsc_5_0_WLAST")
    , TLS_x_rsc_5_0_WSTRB("TLS_x_rsc_5_0_WSTRB")
    , TLS_x_rsc_5_0_WDATA("TLS_x_rsc_5_0_WDATA")
    , TLS_x_rsc_5_0_AWREADY("TLS_x_rsc_5_0_AWREADY")
    , TLS_x_rsc_5_0_AWVALID("TLS_x_rsc_5_0_AWVALID")
    , TLS_x_rsc_5_0_AWUSER("TLS_x_rsc_5_0_AWUSER")
    , TLS_x_rsc_5_0_AWREGION("TLS_x_rsc_5_0_AWREGION")
    , TLS_x_rsc_5_0_AWQOS("TLS_x_rsc_5_0_AWQOS")
    , TLS_x_rsc_5_0_AWPROT("TLS_x_rsc_5_0_AWPROT")
    , TLS_x_rsc_5_0_AWCACHE("TLS_x_rsc_5_0_AWCACHE")
    , TLS_x_rsc_5_0_AWLOCK("TLS_x_rsc_5_0_AWLOCK")
    , TLS_x_rsc_5_0_AWBURST("TLS_x_rsc_5_0_AWBURST")
    , TLS_x_rsc_5_0_AWSIZE("TLS_x_rsc_5_0_AWSIZE")
    , TLS_x_rsc_5_0_AWLEN("TLS_x_rsc_5_0_AWLEN")
    , TLS_x_rsc_5_0_AWADDR("TLS_x_rsc_5_0_AWADDR")
    , TLS_x_rsc_5_0_AWID("TLS_x_rsc_5_0_AWID")
    , TLS_x_rsc_triosy_5_0_lz("TLS_x_rsc_triosy_5_0_lz")
    , TLS_x_rsc_6_0_s_tdone("TLS_x_rsc_6_0_s_tdone")
    , TLS_x_rsc_6_0_tr_write_done("TLS_x_rsc_6_0_tr_write_done")
    , TLS_x_rsc_6_0_RREADY("TLS_x_rsc_6_0_RREADY")
    , TLS_x_rsc_6_0_RVALID("TLS_x_rsc_6_0_RVALID")
    , TLS_x_rsc_6_0_RUSER("TLS_x_rsc_6_0_RUSER")
    , TLS_x_rsc_6_0_RLAST("TLS_x_rsc_6_0_RLAST")
    , TLS_x_rsc_6_0_RRESP("TLS_x_rsc_6_0_RRESP")
    , TLS_x_rsc_6_0_RDATA("TLS_x_rsc_6_0_RDATA")
    , TLS_x_rsc_6_0_RID("TLS_x_rsc_6_0_RID")
    , TLS_x_rsc_6_0_ARREADY("TLS_x_rsc_6_0_ARREADY")
    , TLS_x_rsc_6_0_ARVALID("TLS_x_rsc_6_0_ARVALID")
    , TLS_x_rsc_6_0_ARUSER("TLS_x_rsc_6_0_ARUSER")
    , TLS_x_rsc_6_0_ARREGION("TLS_x_rsc_6_0_ARREGION")
    , TLS_x_rsc_6_0_ARQOS("TLS_x_rsc_6_0_ARQOS")
    , TLS_x_rsc_6_0_ARPROT("TLS_x_rsc_6_0_ARPROT")
    , TLS_x_rsc_6_0_ARCACHE("TLS_x_rsc_6_0_ARCACHE")
    , TLS_x_rsc_6_0_ARLOCK("TLS_x_rsc_6_0_ARLOCK")
    , TLS_x_rsc_6_0_ARBURST("TLS_x_rsc_6_0_ARBURST")
    , TLS_x_rsc_6_0_ARSIZE("TLS_x_rsc_6_0_ARSIZE")
    , TLS_x_rsc_6_0_ARLEN("TLS_x_rsc_6_0_ARLEN")
    , TLS_x_rsc_6_0_ARADDR("TLS_x_rsc_6_0_ARADDR")
    , TLS_x_rsc_6_0_ARID("TLS_x_rsc_6_0_ARID")
    , TLS_x_rsc_6_0_BREADY("TLS_x_rsc_6_0_BREADY")
    , TLS_x_rsc_6_0_BVALID("TLS_x_rsc_6_0_BVALID")
    , TLS_x_rsc_6_0_BUSER("TLS_x_rsc_6_0_BUSER")
    , TLS_x_rsc_6_0_BRESP("TLS_x_rsc_6_0_BRESP")
    , TLS_x_rsc_6_0_BID("TLS_x_rsc_6_0_BID")
    , TLS_x_rsc_6_0_WREADY("TLS_x_rsc_6_0_WREADY")
    , TLS_x_rsc_6_0_WVALID("TLS_x_rsc_6_0_WVALID")
    , TLS_x_rsc_6_0_WUSER("TLS_x_rsc_6_0_WUSER")
    , TLS_x_rsc_6_0_WLAST("TLS_x_rsc_6_0_WLAST")
    , TLS_x_rsc_6_0_WSTRB("TLS_x_rsc_6_0_WSTRB")
    , TLS_x_rsc_6_0_WDATA("TLS_x_rsc_6_0_WDATA")
    , TLS_x_rsc_6_0_AWREADY("TLS_x_rsc_6_0_AWREADY")
    , TLS_x_rsc_6_0_AWVALID("TLS_x_rsc_6_0_AWVALID")
    , TLS_x_rsc_6_0_AWUSER("TLS_x_rsc_6_0_AWUSER")
    , TLS_x_rsc_6_0_AWREGION("TLS_x_rsc_6_0_AWREGION")
    , TLS_x_rsc_6_0_AWQOS("TLS_x_rsc_6_0_AWQOS")
    , TLS_x_rsc_6_0_AWPROT("TLS_x_rsc_6_0_AWPROT")
    , TLS_x_rsc_6_0_AWCACHE("TLS_x_rsc_6_0_AWCACHE")
    , TLS_x_rsc_6_0_AWLOCK("TLS_x_rsc_6_0_AWLOCK")
    , TLS_x_rsc_6_0_AWBURST("TLS_x_rsc_6_0_AWBURST")
    , TLS_x_rsc_6_0_AWSIZE("TLS_x_rsc_6_0_AWSIZE")
    , TLS_x_rsc_6_0_AWLEN("TLS_x_rsc_6_0_AWLEN")
    , TLS_x_rsc_6_0_AWADDR("TLS_x_rsc_6_0_AWADDR")
    , TLS_x_rsc_6_0_AWID("TLS_x_rsc_6_0_AWID")
    , TLS_x_rsc_triosy_6_0_lz("TLS_x_rsc_triosy_6_0_lz")
    , TLS_x_rsc_7_0_s_tdone("TLS_x_rsc_7_0_s_tdone")
    , TLS_x_rsc_7_0_tr_write_done("TLS_x_rsc_7_0_tr_write_done")
    , TLS_x_rsc_7_0_RREADY("TLS_x_rsc_7_0_RREADY")
    , TLS_x_rsc_7_0_RVALID("TLS_x_rsc_7_0_RVALID")
    , TLS_x_rsc_7_0_RUSER("TLS_x_rsc_7_0_RUSER")
    , TLS_x_rsc_7_0_RLAST("TLS_x_rsc_7_0_RLAST")
    , TLS_x_rsc_7_0_RRESP("TLS_x_rsc_7_0_RRESP")
    , TLS_x_rsc_7_0_RDATA("TLS_x_rsc_7_0_RDATA")
    , TLS_x_rsc_7_0_RID("TLS_x_rsc_7_0_RID")
    , TLS_x_rsc_7_0_ARREADY("TLS_x_rsc_7_0_ARREADY")
    , TLS_x_rsc_7_0_ARVALID("TLS_x_rsc_7_0_ARVALID")
    , TLS_x_rsc_7_0_ARUSER("TLS_x_rsc_7_0_ARUSER")
    , TLS_x_rsc_7_0_ARREGION("TLS_x_rsc_7_0_ARREGION")
    , TLS_x_rsc_7_0_ARQOS("TLS_x_rsc_7_0_ARQOS")
    , TLS_x_rsc_7_0_ARPROT("TLS_x_rsc_7_0_ARPROT")
    , TLS_x_rsc_7_0_ARCACHE("TLS_x_rsc_7_0_ARCACHE")
    , TLS_x_rsc_7_0_ARLOCK("TLS_x_rsc_7_0_ARLOCK")
    , TLS_x_rsc_7_0_ARBURST("TLS_x_rsc_7_0_ARBURST")
    , TLS_x_rsc_7_0_ARSIZE("TLS_x_rsc_7_0_ARSIZE")
    , TLS_x_rsc_7_0_ARLEN("TLS_x_rsc_7_0_ARLEN")
    , TLS_x_rsc_7_0_ARADDR("TLS_x_rsc_7_0_ARADDR")
    , TLS_x_rsc_7_0_ARID("TLS_x_rsc_7_0_ARID")
    , TLS_x_rsc_7_0_BREADY("TLS_x_rsc_7_0_BREADY")
    , TLS_x_rsc_7_0_BVALID("TLS_x_rsc_7_0_BVALID")
    , TLS_x_rsc_7_0_BUSER("TLS_x_rsc_7_0_BUSER")
    , TLS_x_rsc_7_0_BRESP("TLS_x_rsc_7_0_BRESP")
    , TLS_x_rsc_7_0_BID("TLS_x_rsc_7_0_BID")
    , TLS_x_rsc_7_0_WREADY("TLS_x_rsc_7_0_WREADY")
    , TLS_x_rsc_7_0_WVALID("TLS_x_rsc_7_0_WVALID")
    , TLS_x_rsc_7_0_WUSER("TLS_x_rsc_7_0_WUSER")
    , TLS_x_rsc_7_0_WLAST("TLS_x_rsc_7_0_WLAST")
    , TLS_x_rsc_7_0_WSTRB("TLS_x_rsc_7_0_WSTRB")
    , TLS_x_rsc_7_0_WDATA("TLS_x_rsc_7_0_WDATA")
    , TLS_x_rsc_7_0_AWREADY("TLS_x_rsc_7_0_AWREADY")
    , TLS_x_rsc_7_0_AWVALID("TLS_x_rsc_7_0_AWVALID")
    , TLS_x_rsc_7_0_AWUSER("TLS_x_rsc_7_0_AWUSER")
    , TLS_x_rsc_7_0_AWREGION("TLS_x_rsc_7_0_AWREGION")
    , TLS_x_rsc_7_0_AWQOS("TLS_x_rsc_7_0_AWQOS")
    , TLS_x_rsc_7_0_AWPROT("TLS_x_rsc_7_0_AWPROT")
    , TLS_x_rsc_7_0_AWCACHE("TLS_x_rsc_7_0_AWCACHE")
    , TLS_x_rsc_7_0_AWLOCK("TLS_x_rsc_7_0_AWLOCK")
    , TLS_x_rsc_7_0_AWBURST("TLS_x_rsc_7_0_AWBURST")
    , TLS_x_rsc_7_0_AWSIZE("TLS_x_rsc_7_0_AWSIZE")
    , TLS_x_rsc_7_0_AWLEN("TLS_x_rsc_7_0_AWLEN")
    , TLS_x_rsc_7_0_AWADDR("TLS_x_rsc_7_0_AWADDR")
    , TLS_x_rsc_7_0_AWID("TLS_x_rsc_7_0_AWID")
    , TLS_x_rsc_triosy_7_0_lz("TLS_x_rsc_triosy_7_0_lz")
    , TLS_x_rsc_8_0_s_tdone("TLS_x_rsc_8_0_s_tdone")
    , TLS_x_rsc_8_0_tr_write_done("TLS_x_rsc_8_0_tr_write_done")
    , TLS_x_rsc_8_0_RREADY("TLS_x_rsc_8_0_RREADY")
    , TLS_x_rsc_8_0_RVALID("TLS_x_rsc_8_0_RVALID")
    , TLS_x_rsc_8_0_RUSER("TLS_x_rsc_8_0_RUSER")
    , TLS_x_rsc_8_0_RLAST("TLS_x_rsc_8_0_RLAST")
    , TLS_x_rsc_8_0_RRESP("TLS_x_rsc_8_0_RRESP")
    , TLS_x_rsc_8_0_RDATA("TLS_x_rsc_8_0_RDATA")
    , TLS_x_rsc_8_0_RID("TLS_x_rsc_8_0_RID")
    , TLS_x_rsc_8_0_ARREADY("TLS_x_rsc_8_0_ARREADY")
    , TLS_x_rsc_8_0_ARVALID("TLS_x_rsc_8_0_ARVALID")
    , TLS_x_rsc_8_0_ARUSER("TLS_x_rsc_8_0_ARUSER")
    , TLS_x_rsc_8_0_ARREGION("TLS_x_rsc_8_0_ARREGION")
    , TLS_x_rsc_8_0_ARQOS("TLS_x_rsc_8_0_ARQOS")
    , TLS_x_rsc_8_0_ARPROT("TLS_x_rsc_8_0_ARPROT")
    , TLS_x_rsc_8_0_ARCACHE("TLS_x_rsc_8_0_ARCACHE")
    , TLS_x_rsc_8_0_ARLOCK("TLS_x_rsc_8_0_ARLOCK")
    , TLS_x_rsc_8_0_ARBURST("TLS_x_rsc_8_0_ARBURST")
    , TLS_x_rsc_8_0_ARSIZE("TLS_x_rsc_8_0_ARSIZE")
    , TLS_x_rsc_8_0_ARLEN("TLS_x_rsc_8_0_ARLEN")
    , TLS_x_rsc_8_0_ARADDR("TLS_x_rsc_8_0_ARADDR")
    , TLS_x_rsc_8_0_ARID("TLS_x_rsc_8_0_ARID")
    , TLS_x_rsc_8_0_BREADY("TLS_x_rsc_8_0_BREADY")
    , TLS_x_rsc_8_0_BVALID("TLS_x_rsc_8_0_BVALID")
    , TLS_x_rsc_8_0_BUSER("TLS_x_rsc_8_0_BUSER")
    , TLS_x_rsc_8_0_BRESP("TLS_x_rsc_8_0_BRESP")
    , TLS_x_rsc_8_0_BID("TLS_x_rsc_8_0_BID")
    , TLS_x_rsc_8_0_WREADY("TLS_x_rsc_8_0_WREADY")
    , TLS_x_rsc_8_0_WVALID("TLS_x_rsc_8_0_WVALID")
    , TLS_x_rsc_8_0_WUSER("TLS_x_rsc_8_0_WUSER")
    , TLS_x_rsc_8_0_WLAST("TLS_x_rsc_8_0_WLAST")
    , TLS_x_rsc_8_0_WSTRB("TLS_x_rsc_8_0_WSTRB")
    , TLS_x_rsc_8_0_WDATA("TLS_x_rsc_8_0_WDATA")
    , TLS_x_rsc_8_0_AWREADY("TLS_x_rsc_8_0_AWREADY")
    , TLS_x_rsc_8_0_AWVALID("TLS_x_rsc_8_0_AWVALID")
    , TLS_x_rsc_8_0_AWUSER("TLS_x_rsc_8_0_AWUSER")
    , TLS_x_rsc_8_0_AWREGION("TLS_x_rsc_8_0_AWREGION")
    , TLS_x_rsc_8_0_AWQOS("TLS_x_rsc_8_0_AWQOS")
    , TLS_x_rsc_8_0_AWPROT("TLS_x_rsc_8_0_AWPROT")
    , TLS_x_rsc_8_0_AWCACHE("TLS_x_rsc_8_0_AWCACHE")
    , TLS_x_rsc_8_0_AWLOCK("TLS_x_rsc_8_0_AWLOCK")
    , TLS_x_rsc_8_0_AWBURST("TLS_x_rsc_8_0_AWBURST")
    , TLS_x_rsc_8_0_AWSIZE("TLS_x_rsc_8_0_AWSIZE")
    , TLS_x_rsc_8_0_AWLEN("TLS_x_rsc_8_0_AWLEN")
    , TLS_x_rsc_8_0_AWADDR("TLS_x_rsc_8_0_AWADDR")
    , TLS_x_rsc_8_0_AWID("TLS_x_rsc_8_0_AWID")
    , TLS_x_rsc_triosy_8_0_lz("TLS_x_rsc_triosy_8_0_lz")
    , TLS_x_rsc_9_0_s_tdone("TLS_x_rsc_9_0_s_tdone")
    , TLS_x_rsc_9_0_tr_write_done("TLS_x_rsc_9_0_tr_write_done")
    , TLS_x_rsc_9_0_RREADY("TLS_x_rsc_9_0_RREADY")
    , TLS_x_rsc_9_0_RVALID("TLS_x_rsc_9_0_RVALID")
    , TLS_x_rsc_9_0_RUSER("TLS_x_rsc_9_0_RUSER")
    , TLS_x_rsc_9_0_RLAST("TLS_x_rsc_9_0_RLAST")
    , TLS_x_rsc_9_0_RRESP("TLS_x_rsc_9_0_RRESP")
    , TLS_x_rsc_9_0_RDATA("TLS_x_rsc_9_0_RDATA")
    , TLS_x_rsc_9_0_RID("TLS_x_rsc_9_0_RID")
    , TLS_x_rsc_9_0_ARREADY("TLS_x_rsc_9_0_ARREADY")
    , TLS_x_rsc_9_0_ARVALID("TLS_x_rsc_9_0_ARVALID")
    , TLS_x_rsc_9_0_ARUSER("TLS_x_rsc_9_0_ARUSER")
    , TLS_x_rsc_9_0_ARREGION("TLS_x_rsc_9_0_ARREGION")
    , TLS_x_rsc_9_0_ARQOS("TLS_x_rsc_9_0_ARQOS")
    , TLS_x_rsc_9_0_ARPROT("TLS_x_rsc_9_0_ARPROT")
    , TLS_x_rsc_9_0_ARCACHE("TLS_x_rsc_9_0_ARCACHE")
    , TLS_x_rsc_9_0_ARLOCK("TLS_x_rsc_9_0_ARLOCK")
    , TLS_x_rsc_9_0_ARBURST("TLS_x_rsc_9_0_ARBURST")
    , TLS_x_rsc_9_0_ARSIZE("TLS_x_rsc_9_0_ARSIZE")
    , TLS_x_rsc_9_0_ARLEN("TLS_x_rsc_9_0_ARLEN")
    , TLS_x_rsc_9_0_ARADDR("TLS_x_rsc_9_0_ARADDR")
    , TLS_x_rsc_9_0_ARID("TLS_x_rsc_9_0_ARID")
    , TLS_x_rsc_9_0_BREADY("TLS_x_rsc_9_0_BREADY")
    , TLS_x_rsc_9_0_BVALID("TLS_x_rsc_9_0_BVALID")
    , TLS_x_rsc_9_0_BUSER("TLS_x_rsc_9_0_BUSER")
    , TLS_x_rsc_9_0_BRESP("TLS_x_rsc_9_0_BRESP")
    , TLS_x_rsc_9_0_BID("TLS_x_rsc_9_0_BID")
    , TLS_x_rsc_9_0_WREADY("TLS_x_rsc_9_0_WREADY")
    , TLS_x_rsc_9_0_WVALID("TLS_x_rsc_9_0_WVALID")
    , TLS_x_rsc_9_0_WUSER("TLS_x_rsc_9_0_WUSER")
    , TLS_x_rsc_9_0_WLAST("TLS_x_rsc_9_0_WLAST")
    , TLS_x_rsc_9_0_WSTRB("TLS_x_rsc_9_0_WSTRB")
    , TLS_x_rsc_9_0_WDATA("TLS_x_rsc_9_0_WDATA")
    , TLS_x_rsc_9_0_AWREADY("TLS_x_rsc_9_0_AWREADY")
    , TLS_x_rsc_9_0_AWVALID("TLS_x_rsc_9_0_AWVALID")
    , TLS_x_rsc_9_0_AWUSER("TLS_x_rsc_9_0_AWUSER")
    , TLS_x_rsc_9_0_AWREGION("TLS_x_rsc_9_0_AWREGION")
    , TLS_x_rsc_9_0_AWQOS("TLS_x_rsc_9_0_AWQOS")
    , TLS_x_rsc_9_0_AWPROT("TLS_x_rsc_9_0_AWPROT")
    , TLS_x_rsc_9_0_AWCACHE("TLS_x_rsc_9_0_AWCACHE")
    , TLS_x_rsc_9_0_AWLOCK("TLS_x_rsc_9_0_AWLOCK")
    , TLS_x_rsc_9_0_AWBURST("TLS_x_rsc_9_0_AWBURST")
    , TLS_x_rsc_9_0_AWSIZE("TLS_x_rsc_9_0_AWSIZE")
    , TLS_x_rsc_9_0_AWLEN("TLS_x_rsc_9_0_AWLEN")
    , TLS_x_rsc_9_0_AWADDR("TLS_x_rsc_9_0_AWADDR")
    , TLS_x_rsc_9_0_AWID("TLS_x_rsc_9_0_AWID")
    , TLS_x_rsc_triosy_9_0_lz("TLS_x_rsc_triosy_9_0_lz")
    , TLS_x_rsc_10_0_s_tdone("TLS_x_rsc_10_0_s_tdone")
    , TLS_x_rsc_10_0_tr_write_done("TLS_x_rsc_10_0_tr_write_done")
    , TLS_x_rsc_10_0_RREADY("TLS_x_rsc_10_0_RREADY")
    , TLS_x_rsc_10_0_RVALID("TLS_x_rsc_10_0_RVALID")
    , TLS_x_rsc_10_0_RUSER("TLS_x_rsc_10_0_RUSER")
    , TLS_x_rsc_10_0_RLAST("TLS_x_rsc_10_0_RLAST")
    , TLS_x_rsc_10_0_RRESP("TLS_x_rsc_10_0_RRESP")
    , TLS_x_rsc_10_0_RDATA("TLS_x_rsc_10_0_RDATA")
    , TLS_x_rsc_10_0_RID("TLS_x_rsc_10_0_RID")
    , TLS_x_rsc_10_0_ARREADY("TLS_x_rsc_10_0_ARREADY")
    , TLS_x_rsc_10_0_ARVALID("TLS_x_rsc_10_0_ARVALID")
    , TLS_x_rsc_10_0_ARUSER("TLS_x_rsc_10_0_ARUSER")
    , TLS_x_rsc_10_0_ARREGION("TLS_x_rsc_10_0_ARREGION")
    , TLS_x_rsc_10_0_ARQOS("TLS_x_rsc_10_0_ARQOS")
    , TLS_x_rsc_10_0_ARPROT("TLS_x_rsc_10_0_ARPROT")
    , TLS_x_rsc_10_0_ARCACHE("TLS_x_rsc_10_0_ARCACHE")
    , TLS_x_rsc_10_0_ARLOCK("TLS_x_rsc_10_0_ARLOCK")
    , TLS_x_rsc_10_0_ARBURST("TLS_x_rsc_10_0_ARBURST")
    , TLS_x_rsc_10_0_ARSIZE("TLS_x_rsc_10_0_ARSIZE")
    , TLS_x_rsc_10_0_ARLEN("TLS_x_rsc_10_0_ARLEN")
    , TLS_x_rsc_10_0_ARADDR("TLS_x_rsc_10_0_ARADDR")
    , TLS_x_rsc_10_0_ARID("TLS_x_rsc_10_0_ARID")
    , TLS_x_rsc_10_0_BREADY("TLS_x_rsc_10_0_BREADY")
    , TLS_x_rsc_10_0_BVALID("TLS_x_rsc_10_0_BVALID")
    , TLS_x_rsc_10_0_BUSER("TLS_x_rsc_10_0_BUSER")
    , TLS_x_rsc_10_0_BRESP("TLS_x_rsc_10_0_BRESP")
    , TLS_x_rsc_10_0_BID("TLS_x_rsc_10_0_BID")
    , TLS_x_rsc_10_0_WREADY("TLS_x_rsc_10_0_WREADY")
    , TLS_x_rsc_10_0_WVALID("TLS_x_rsc_10_0_WVALID")
    , TLS_x_rsc_10_0_WUSER("TLS_x_rsc_10_0_WUSER")
    , TLS_x_rsc_10_0_WLAST("TLS_x_rsc_10_0_WLAST")
    , TLS_x_rsc_10_0_WSTRB("TLS_x_rsc_10_0_WSTRB")
    , TLS_x_rsc_10_0_WDATA("TLS_x_rsc_10_0_WDATA")
    , TLS_x_rsc_10_0_AWREADY("TLS_x_rsc_10_0_AWREADY")
    , TLS_x_rsc_10_0_AWVALID("TLS_x_rsc_10_0_AWVALID")
    , TLS_x_rsc_10_0_AWUSER("TLS_x_rsc_10_0_AWUSER")
    , TLS_x_rsc_10_0_AWREGION("TLS_x_rsc_10_0_AWREGION")
    , TLS_x_rsc_10_0_AWQOS("TLS_x_rsc_10_0_AWQOS")
    , TLS_x_rsc_10_0_AWPROT("TLS_x_rsc_10_0_AWPROT")
    , TLS_x_rsc_10_0_AWCACHE("TLS_x_rsc_10_0_AWCACHE")
    , TLS_x_rsc_10_0_AWLOCK("TLS_x_rsc_10_0_AWLOCK")
    , TLS_x_rsc_10_0_AWBURST("TLS_x_rsc_10_0_AWBURST")
    , TLS_x_rsc_10_0_AWSIZE("TLS_x_rsc_10_0_AWSIZE")
    , TLS_x_rsc_10_0_AWLEN("TLS_x_rsc_10_0_AWLEN")
    , TLS_x_rsc_10_0_AWADDR("TLS_x_rsc_10_0_AWADDR")
    , TLS_x_rsc_10_0_AWID("TLS_x_rsc_10_0_AWID")
    , TLS_x_rsc_triosy_10_0_lz("TLS_x_rsc_triosy_10_0_lz")
    , TLS_x_rsc_11_0_s_tdone("TLS_x_rsc_11_0_s_tdone")
    , TLS_x_rsc_11_0_tr_write_done("TLS_x_rsc_11_0_tr_write_done")
    , TLS_x_rsc_11_0_RREADY("TLS_x_rsc_11_0_RREADY")
    , TLS_x_rsc_11_0_RVALID("TLS_x_rsc_11_0_RVALID")
    , TLS_x_rsc_11_0_RUSER("TLS_x_rsc_11_0_RUSER")
    , TLS_x_rsc_11_0_RLAST("TLS_x_rsc_11_0_RLAST")
    , TLS_x_rsc_11_0_RRESP("TLS_x_rsc_11_0_RRESP")
    , TLS_x_rsc_11_0_RDATA("TLS_x_rsc_11_0_RDATA")
    , TLS_x_rsc_11_0_RID("TLS_x_rsc_11_0_RID")
    , TLS_x_rsc_11_0_ARREADY("TLS_x_rsc_11_0_ARREADY")
    , TLS_x_rsc_11_0_ARVALID("TLS_x_rsc_11_0_ARVALID")
    , TLS_x_rsc_11_0_ARUSER("TLS_x_rsc_11_0_ARUSER")
    , TLS_x_rsc_11_0_ARREGION("TLS_x_rsc_11_0_ARREGION")
    , TLS_x_rsc_11_0_ARQOS("TLS_x_rsc_11_0_ARQOS")
    , TLS_x_rsc_11_0_ARPROT("TLS_x_rsc_11_0_ARPROT")
    , TLS_x_rsc_11_0_ARCACHE("TLS_x_rsc_11_0_ARCACHE")
    , TLS_x_rsc_11_0_ARLOCK("TLS_x_rsc_11_0_ARLOCK")
    , TLS_x_rsc_11_0_ARBURST("TLS_x_rsc_11_0_ARBURST")
    , TLS_x_rsc_11_0_ARSIZE("TLS_x_rsc_11_0_ARSIZE")
    , TLS_x_rsc_11_0_ARLEN("TLS_x_rsc_11_0_ARLEN")
    , TLS_x_rsc_11_0_ARADDR("TLS_x_rsc_11_0_ARADDR")
    , TLS_x_rsc_11_0_ARID("TLS_x_rsc_11_0_ARID")
    , TLS_x_rsc_11_0_BREADY("TLS_x_rsc_11_0_BREADY")
    , TLS_x_rsc_11_0_BVALID("TLS_x_rsc_11_0_BVALID")
    , TLS_x_rsc_11_0_BUSER("TLS_x_rsc_11_0_BUSER")
    , TLS_x_rsc_11_0_BRESP("TLS_x_rsc_11_0_BRESP")
    , TLS_x_rsc_11_0_BID("TLS_x_rsc_11_0_BID")
    , TLS_x_rsc_11_0_WREADY("TLS_x_rsc_11_0_WREADY")
    , TLS_x_rsc_11_0_WVALID("TLS_x_rsc_11_0_WVALID")
    , TLS_x_rsc_11_0_WUSER("TLS_x_rsc_11_0_WUSER")
    , TLS_x_rsc_11_0_WLAST("TLS_x_rsc_11_0_WLAST")
    , TLS_x_rsc_11_0_WSTRB("TLS_x_rsc_11_0_WSTRB")
    , TLS_x_rsc_11_0_WDATA("TLS_x_rsc_11_0_WDATA")
    , TLS_x_rsc_11_0_AWREADY("TLS_x_rsc_11_0_AWREADY")
    , TLS_x_rsc_11_0_AWVALID("TLS_x_rsc_11_0_AWVALID")
    , TLS_x_rsc_11_0_AWUSER("TLS_x_rsc_11_0_AWUSER")
    , TLS_x_rsc_11_0_AWREGION("TLS_x_rsc_11_0_AWREGION")
    , TLS_x_rsc_11_0_AWQOS("TLS_x_rsc_11_0_AWQOS")
    , TLS_x_rsc_11_0_AWPROT("TLS_x_rsc_11_0_AWPROT")
    , TLS_x_rsc_11_0_AWCACHE("TLS_x_rsc_11_0_AWCACHE")
    , TLS_x_rsc_11_0_AWLOCK("TLS_x_rsc_11_0_AWLOCK")
    , TLS_x_rsc_11_0_AWBURST("TLS_x_rsc_11_0_AWBURST")
    , TLS_x_rsc_11_0_AWSIZE("TLS_x_rsc_11_0_AWSIZE")
    , TLS_x_rsc_11_0_AWLEN("TLS_x_rsc_11_0_AWLEN")
    , TLS_x_rsc_11_0_AWADDR("TLS_x_rsc_11_0_AWADDR")
    , TLS_x_rsc_11_0_AWID("TLS_x_rsc_11_0_AWID")
    , TLS_x_rsc_triosy_11_0_lz("TLS_x_rsc_triosy_11_0_lz")
    , TLS_x_rsc_12_0_s_tdone("TLS_x_rsc_12_0_s_tdone")
    , TLS_x_rsc_12_0_tr_write_done("TLS_x_rsc_12_0_tr_write_done")
    , TLS_x_rsc_12_0_RREADY("TLS_x_rsc_12_0_RREADY")
    , TLS_x_rsc_12_0_RVALID("TLS_x_rsc_12_0_RVALID")
    , TLS_x_rsc_12_0_RUSER("TLS_x_rsc_12_0_RUSER")
    , TLS_x_rsc_12_0_RLAST("TLS_x_rsc_12_0_RLAST")
    , TLS_x_rsc_12_0_RRESP("TLS_x_rsc_12_0_RRESP")
    , TLS_x_rsc_12_0_RDATA("TLS_x_rsc_12_0_RDATA")
    , TLS_x_rsc_12_0_RID("TLS_x_rsc_12_0_RID")
    , TLS_x_rsc_12_0_ARREADY("TLS_x_rsc_12_0_ARREADY")
    , TLS_x_rsc_12_0_ARVALID("TLS_x_rsc_12_0_ARVALID")
    , TLS_x_rsc_12_0_ARUSER("TLS_x_rsc_12_0_ARUSER")
    , TLS_x_rsc_12_0_ARREGION("TLS_x_rsc_12_0_ARREGION")
    , TLS_x_rsc_12_0_ARQOS("TLS_x_rsc_12_0_ARQOS")
    , TLS_x_rsc_12_0_ARPROT("TLS_x_rsc_12_0_ARPROT")
    , TLS_x_rsc_12_0_ARCACHE("TLS_x_rsc_12_0_ARCACHE")
    , TLS_x_rsc_12_0_ARLOCK("TLS_x_rsc_12_0_ARLOCK")
    , TLS_x_rsc_12_0_ARBURST("TLS_x_rsc_12_0_ARBURST")
    , TLS_x_rsc_12_0_ARSIZE("TLS_x_rsc_12_0_ARSIZE")
    , TLS_x_rsc_12_0_ARLEN("TLS_x_rsc_12_0_ARLEN")
    , TLS_x_rsc_12_0_ARADDR("TLS_x_rsc_12_0_ARADDR")
    , TLS_x_rsc_12_0_ARID("TLS_x_rsc_12_0_ARID")
    , TLS_x_rsc_12_0_BREADY("TLS_x_rsc_12_0_BREADY")
    , TLS_x_rsc_12_0_BVALID("TLS_x_rsc_12_0_BVALID")
    , TLS_x_rsc_12_0_BUSER("TLS_x_rsc_12_0_BUSER")
    , TLS_x_rsc_12_0_BRESP("TLS_x_rsc_12_0_BRESP")
    , TLS_x_rsc_12_0_BID("TLS_x_rsc_12_0_BID")
    , TLS_x_rsc_12_0_WREADY("TLS_x_rsc_12_0_WREADY")
    , TLS_x_rsc_12_0_WVALID("TLS_x_rsc_12_0_WVALID")
    , TLS_x_rsc_12_0_WUSER("TLS_x_rsc_12_0_WUSER")
    , TLS_x_rsc_12_0_WLAST("TLS_x_rsc_12_0_WLAST")
    , TLS_x_rsc_12_0_WSTRB("TLS_x_rsc_12_0_WSTRB")
    , TLS_x_rsc_12_0_WDATA("TLS_x_rsc_12_0_WDATA")
    , TLS_x_rsc_12_0_AWREADY("TLS_x_rsc_12_0_AWREADY")
    , TLS_x_rsc_12_0_AWVALID("TLS_x_rsc_12_0_AWVALID")
    , TLS_x_rsc_12_0_AWUSER("TLS_x_rsc_12_0_AWUSER")
    , TLS_x_rsc_12_0_AWREGION("TLS_x_rsc_12_0_AWREGION")
    , TLS_x_rsc_12_0_AWQOS("TLS_x_rsc_12_0_AWQOS")
    , TLS_x_rsc_12_0_AWPROT("TLS_x_rsc_12_0_AWPROT")
    , TLS_x_rsc_12_0_AWCACHE("TLS_x_rsc_12_0_AWCACHE")
    , TLS_x_rsc_12_0_AWLOCK("TLS_x_rsc_12_0_AWLOCK")
    , TLS_x_rsc_12_0_AWBURST("TLS_x_rsc_12_0_AWBURST")
    , TLS_x_rsc_12_0_AWSIZE("TLS_x_rsc_12_0_AWSIZE")
    , TLS_x_rsc_12_0_AWLEN("TLS_x_rsc_12_0_AWLEN")
    , TLS_x_rsc_12_0_AWADDR("TLS_x_rsc_12_0_AWADDR")
    , TLS_x_rsc_12_0_AWID("TLS_x_rsc_12_0_AWID")
    , TLS_x_rsc_triosy_12_0_lz("TLS_x_rsc_triosy_12_0_lz")
    , TLS_x_rsc_13_0_s_tdone("TLS_x_rsc_13_0_s_tdone")
    , TLS_x_rsc_13_0_tr_write_done("TLS_x_rsc_13_0_tr_write_done")
    , TLS_x_rsc_13_0_RREADY("TLS_x_rsc_13_0_RREADY")
    , TLS_x_rsc_13_0_RVALID("TLS_x_rsc_13_0_RVALID")
    , TLS_x_rsc_13_0_RUSER("TLS_x_rsc_13_0_RUSER")
    , TLS_x_rsc_13_0_RLAST("TLS_x_rsc_13_0_RLAST")
    , TLS_x_rsc_13_0_RRESP("TLS_x_rsc_13_0_RRESP")
    , TLS_x_rsc_13_0_RDATA("TLS_x_rsc_13_0_RDATA")
    , TLS_x_rsc_13_0_RID("TLS_x_rsc_13_0_RID")
    , TLS_x_rsc_13_0_ARREADY("TLS_x_rsc_13_0_ARREADY")
    , TLS_x_rsc_13_0_ARVALID("TLS_x_rsc_13_0_ARVALID")
    , TLS_x_rsc_13_0_ARUSER("TLS_x_rsc_13_0_ARUSER")
    , TLS_x_rsc_13_0_ARREGION("TLS_x_rsc_13_0_ARREGION")
    , TLS_x_rsc_13_0_ARQOS("TLS_x_rsc_13_0_ARQOS")
    , TLS_x_rsc_13_0_ARPROT("TLS_x_rsc_13_0_ARPROT")
    , TLS_x_rsc_13_0_ARCACHE("TLS_x_rsc_13_0_ARCACHE")
    , TLS_x_rsc_13_0_ARLOCK("TLS_x_rsc_13_0_ARLOCK")
    , TLS_x_rsc_13_0_ARBURST("TLS_x_rsc_13_0_ARBURST")
    , TLS_x_rsc_13_0_ARSIZE("TLS_x_rsc_13_0_ARSIZE")
    , TLS_x_rsc_13_0_ARLEN("TLS_x_rsc_13_0_ARLEN")
    , TLS_x_rsc_13_0_ARADDR("TLS_x_rsc_13_0_ARADDR")
    , TLS_x_rsc_13_0_ARID("TLS_x_rsc_13_0_ARID")
    , TLS_x_rsc_13_0_BREADY("TLS_x_rsc_13_0_BREADY")
    , TLS_x_rsc_13_0_BVALID("TLS_x_rsc_13_0_BVALID")
    , TLS_x_rsc_13_0_BUSER("TLS_x_rsc_13_0_BUSER")
    , TLS_x_rsc_13_0_BRESP("TLS_x_rsc_13_0_BRESP")
    , TLS_x_rsc_13_0_BID("TLS_x_rsc_13_0_BID")
    , TLS_x_rsc_13_0_WREADY("TLS_x_rsc_13_0_WREADY")
    , TLS_x_rsc_13_0_WVALID("TLS_x_rsc_13_0_WVALID")
    , TLS_x_rsc_13_0_WUSER("TLS_x_rsc_13_0_WUSER")
    , TLS_x_rsc_13_0_WLAST("TLS_x_rsc_13_0_WLAST")
    , TLS_x_rsc_13_0_WSTRB("TLS_x_rsc_13_0_WSTRB")
    , TLS_x_rsc_13_0_WDATA("TLS_x_rsc_13_0_WDATA")
    , TLS_x_rsc_13_0_AWREADY("TLS_x_rsc_13_0_AWREADY")
    , TLS_x_rsc_13_0_AWVALID("TLS_x_rsc_13_0_AWVALID")
    , TLS_x_rsc_13_0_AWUSER("TLS_x_rsc_13_0_AWUSER")
    , TLS_x_rsc_13_0_AWREGION("TLS_x_rsc_13_0_AWREGION")
    , TLS_x_rsc_13_0_AWQOS("TLS_x_rsc_13_0_AWQOS")
    , TLS_x_rsc_13_0_AWPROT("TLS_x_rsc_13_0_AWPROT")
    , TLS_x_rsc_13_0_AWCACHE("TLS_x_rsc_13_0_AWCACHE")
    , TLS_x_rsc_13_0_AWLOCK("TLS_x_rsc_13_0_AWLOCK")
    , TLS_x_rsc_13_0_AWBURST("TLS_x_rsc_13_0_AWBURST")
    , TLS_x_rsc_13_0_AWSIZE("TLS_x_rsc_13_0_AWSIZE")
    , TLS_x_rsc_13_0_AWLEN("TLS_x_rsc_13_0_AWLEN")
    , TLS_x_rsc_13_0_AWADDR("TLS_x_rsc_13_0_AWADDR")
    , TLS_x_rsc_13_0_AWID("TLS_x_rsc_13_0_AWID")
    , TLS_x_rsc_triosy_13_0_lz("TLS_x_rsc_triosy_13_0_lz")
    , TLS_x_rsc_14_0_s_tdone("TLS_x_rsc_14_0_s_tdone")
    , TLS_x_rsc_14_0_tr_write_done("TLS_x_rsc_14_0_tr_write_done")
    , TLS_x_rsc_14_0_RREADY("TLS_x_rsc_14_0_RREADY")
    , TLS_x_rsc_14_0_RVALID("TLS_x_rsc_14_0_RVALID")
    , TLS_x_rsc_14_0_RUSER("TLS_x_rsc_14_0_RUSER")
    , TLS_x_rsc_14_0_RLAST("TLS_x_rsc_14_0_RLAST")
    , TLS_x_rsc_14_0_RRESP("TLS_x_rsc_14_0_RRESP")
    , TLS_x_rsc_14_0_RDATA("TLS_x_rsc_14_0_RDATA")
    , TLS_x_rsc_14_0_RID("TLS_x_rsc_14_0_RID")
    , TLS_x_rsc_14_0_ARREADY("TLS_x_rsc_14_0_ARREADY")
    , TLS_x_rsc_14_0_ARVALID("TLS_x_rsc_14_0_ARVALID")
    , TLS_x_rsc_14_0_ARUSER("TLS_x_rsc_14_0_ARUSER")
    , TLS_x_rsc_14_0_ARREGION("TLS_x_rsc_14_0_ARREGION")
    , TLS_x_rsc_14_0_ARQOS("TLS_x_rsc_14_0_ARQOS")
    , TLS_x_rsc_14_0_ARPROT("TLS_x_rsc_14_0_ARPROT")
    , TLS_x_rsc_14_0_ARCACHE("TLS_x_rsc_14_0_ARCACHE")
    , TLS_x_rsc_14_0_ARLOCK("TLS_x_rsc_14_0_ARLOCK")
    , TLS_x_rsc_14_0_ARBURST("TLS_x_rsc_14_0_ARBURST")
    , TLS_x_rsc_14_0_ARSIZE("TLS_x_rsc_14_0_ARSIZE")
    , TLS_x_rsc_14_0_ARLEN("TLS_x_rsc_14_0_ARLEN")
    , TLS_x_rsc_14_0_ARADDR("TLS_x_rsc_14_0_ARADDR")
    , TLS_x_rsc_14_0_ARID("TLS_x_rsc_14_0_ARID")
    , TLS_x_rsc_14_0_BREADY("TLS_x_rsc_14_0_BREADY")
    , TLS_x_rsc_14_0_BVALID("TLS_x_rsc_14_0_BVALID")
    , TLS_x_rsc_14_0_BUSER("TLS_x_rsc_14_0_BUSER")
    , TLS_x_rsc_14_0_BRESP("TLS_x_rsc_14_0_BRESP")
    , TLS_x_rsc_14_0_BID("TLS_x_rsc_14_0_BID")
    , TLS_x_rsc_14_0_WREADY("TLS_x_rsc_14_0_WREADY")
    , TLS_x_rsc_14_0_WVALID("TLS_x_rsc_14_0_WVALID")
    , TLS_x_rsc_14_0_WUSER("TLS_x_rsc_14_0_WUSER")
    , TLS_x_rsc_14_0_WLAST("TLS_x_rsc_14_0_WLAST")
    , TLS_x_rsc_14_0_WSTRB("TLS_x_rsc_14_0_WSTRB")
    , TLS_x_rsc_14_0_WDATA("TLS_x_rsc_14_0_WDATA")
    , TLS_x_rsc_14_0_AWREADY("TLS_x_rsc_14_0_AWREADY")
    , TLS_x_rsc_14_0_AWVALID("TLS_x_rsc_14_0_AWVALID")
    , TLS_x_rsc_14_0_AWUSER("TLS_x_rsc_14_0_AWUSER")
    , TLS_x_rsc_14_0_AWREGION("TLS_x_rsc_14_0_AWREGION")
    , TLS_x_rsc_14_0_AWQOS("TLS_x_rsc_14_0_AWQOS")
    , TLS_x_rsc_14_0_AWPROT("TLS_x_rsc_14_0_AWPROT")
    , TLS_x_rsc_14_0_AWCACHE("TLS_x_rsc_14_0_AWCACHE")
    , TLS_x_rsc_14_0_AWLOCK("TLS_x_rsc_14_0_AWLOCK")
    , TLS_x_rsc_14_0_AWBURST("TLS_x_rsc_14_0_AWBURST")
    , TLS_x_rsc_14_0_AWSIZE("TLS_x_rsc_14_0_AWSIZE")
    , TLS_x_rsc_14_0_AWLEN("TLS_x_rsc_14_0_AWLEN")
    , TLS_x_rsc_14_0_AWADDR("TLS_x_rsc_14_0_AWADDR")
    , TLS_x_rsc_14_0_AWID("TLS_x_rsc_14_0_AWID")
    , TLS_x_rsc_triosy_14_0_lz("TLS_x_rsc_triosy_14_0_lz")
    , TLS_x_rsc_15_0_s_tdone("TLS_x_rsc_15_0_s_tdone")
    , TLS_x_rsc_15_0_tr_write_done("TLS_x_rsc_15_0_tr_write_done")
    , TLS_x_rsc_15_0_RREADY("TLS_x_rsc_15_0_RREADY")
    , TLS_x_rsc_15_0_RVALID("TLS_x_rsc_15_0_RVALID")
    , TLS_x_rsc_15_0_RUSER("TLS_x_rsc_15_0_RUSER")
    , TLS_x_rsc_15_0_RLAST("TLS_x_rsc_15_0_RLAST")
    , TLS_x_rsc_15_0_RRESP("TLS_x_rsc_15_0_RRESP")
    , TLS_x_rsc_15_0_RDATA("TLS_x_rsc_15_0_RDATA")
    , TLS_x_rsc_15_0_RID("TLS_x_rsc_15_0_RID")
    , TLS_x_rsc_15_0_ARREADY("TLS_x_rsc_15_0_ARREADY")
    , TLS_x_rsc_15_0_ARVALID("TLS_x_rsc_15_0_ARVALID")
    , TLS_x_rsc_15_0_ARUSER("TLS_x_rsc_15_0_ARUSER")
    , TLS_x_rsc_15_0_ARREGION("TLS_x_rsc_15_0_ARREGION")
    , TLS_x_rsc_15_0_ARQOS("TLS_x_rsc_15_0_ARQOS")
    , TLS_x_rsc_15_0_ARPROT("TLS_x_rsc_15_0_ARPROT")
    , TLS_x_rsc_15_0_ARCACHE("TLS_x_rsc_15_0_ARCACHE")
    , TLS_x_rsc_15_0_ARLOCK("TLS_x_rsc_15_0_ARLOCK")
    , TLS_x_rsc_15_0_ARBURST("TLS_x_rsc_15_0_ARBURST")
    , TLS_x_rsc_15_0_ARSIZE("TLS_x_rsc_15_0_ARSIZE")
    , TLS_x_rsc_15_0_ARLEN("TLS_x_rsc_15_0_ARLEN")
    , TLS_x_rsc_15_0_ARADDR("TLS_x_rsc_15_0_ARADDR")
    , TLS_x_rsc_15_0_ARID("TLS_x_rsc_15_0_ARID")
    , TLS_x_rsc_15_0_BREADY("TLS_x_rsc_15_0_BREADY")
    , TLS_x_rsc_15_0_BVALID("TLS_x_rsc_15_0_BVALID")
    , TLS_x_rsc_15_0_BUSER("TLS_x_rsc_15_0_BUSER")
    , TLS_x_rsc_15_0_BRESP("TLS_x_rsc_15_0_BRESP")
    , TLS_x_rsc_15_0_BID("TLS_x_rsc_15_0_BID")
    , TLS_x_rsc_15_0_WREADY("TLS_x_rsc_15_0_WREADY")
    , TLS_x_rsc_15_0_WVALID("TLS_x_rsc_15_0_WVALID")
    , TLS_x_rsc_15_0_WUSER("TLS_x_rsc_15_0_WUSER")
    , TLS_x_rsc_15_0_WLAST("TLS_x_rsc_15_0_WLAST")
    , TLS_x_rsc_15_0_WSTRB("TLS_x_rsc_15_0_WSTRB")
    , TLS_x_rsc_15_0_WDATA("TLS_x_rsc_15_0_WDATA")
    , TLS_x_rsc_15_0_AWREADY("TLS_x_rsc_15_0_AWREADY")
    , TLS_x_rsc_15_0_AWVALID("TLS_x_rsc_15_0_AWVALID")
    , TLS_x_rsc_15_0_AWUSER("TLS_x_rsc_15_0_AWUSER")
    , TLS_x_rsc_15_0_AWREGION("TLS_x_rsc_15_0_AWREGION")
    , TLS_x_rsc_15_0_AWQOS("TLS_x_rsc_15_0_AWQOS")
    , TLS_x_rsc_15_0_AWPROT("TLS_x_rsc_15_0_AWPROT")
    , TLS_x_rsc_15_0_AWCACHE("TLS_x_rsc_15_0_AWCACHE")
    , TLS_x_rsc_15_0_AWLOCK("TLS_x_rsc_15_0_AWLOCK")
    , TLS_x_rsc_15_0_AWBURST("TLS_x_rsc_15_0_AWBURST")
    , TLS_x_rsc_15_0_AWSIZE("TLS_x_rsc_15_0_AWSIZE")
    , TLS_x_rsc_15_0_AWLEN("TLS_x_rsc_15_0_AWLEN")
    , TLS_x_rsc_15_0_AWADDR("TLS_x_rsc_15_0_AWADDR")
    , TLS_x_rsc_15_0_AWID("TLS_x_rsc_15_0_AWID")
    , TLS_x_rsc_triosy_15_0_lz("TLS_x_rsc_triosy_15_0_lz")
    , TLS_x_rsc_16_0_s_tdone("TLS_x_rsc_16_0_s_tdone")
    , TLS_x_rsc_16_0_tr_write_done("TLS_x_rsc_16_0_tr_write_done")
    , TLS_x_rsc_16_0_RREADY("TLS_x_rsc_16_0_RREADY")
    , TLS_x_rsc_16_0_RVALID("TLS_x_rsc_16_0_RVALID")
    , TLS_x_rsc_16_0_RUSER("TLS_x_rsc_16_0_RUSER")
    , TLS_x_rsc_16_0_RLAST("TLS_x_rsc_16_0_RLAST")
    , TLS_x_rsc_16_0_RRESP("TLS_x_rsc_16_0_RRESP")
    , TLS_x_rsc_16_0_RDATA("TLS_x_rsc_16_0_RDATA")
    , TLS_x_rsc_16_0_RID("TLS_x_rsc_16_0_RID")
    , TLS_x_rsc_16_0_ARREADY("TLS_x_rsc_16_0_ARREADY")
    , TLS_x_rsc_16_0_ARVALID("TLS_x_rsc_16_0_ARVALID")
    , TLS_x_rsc_16_0_ARUSER("TLS_x_rsc_16_0_ARUSER")
    , TLS_x_rsc_16_0_ARREGION("TLS_x_rsc_16_0_ARREGION")
    , TLS_x_rsc_16_0_ARQOS("TLS_x_rsc_16_0_ARQOS")
    , TLS_x_rsc_16_0_ARPROT("TLS_x_rsc_16_0_ARPROT")
    , TLS_x_rsc_16_0_ARCACHE("TLS_x_rsc_16_0_ARCACHE")
    , TLS_x_rsc_16_0_ARLOCK("TLS_x_rsc_16_0_ARLOCK")
    , TLS_x_rsc_16_0_ARBURST("TLS_x_rsc_16_0_ARBURST")
    , TLS_x_rsc_16_0_ARSIZE("TLS_x_rsc_16_0_ARSIZE")
    , TLS_x_rsc_16_0_ARLEN("TLS_x_rsc_16_0_ARLEN")
    , TLS_x_rsc_16_0_ARADDR("TLS_x_rsc_16_0_ARADDR")
    , TLS_x_rsc_16_0_ARID("TLS_x_rsc_16_0_ARID")
    , TLS_x_rsc_16_0_BREADY("TLS_x_rsc_16_0_BREADY")
    , TLS_x_rsc_16_0_BVALID("TLS_x_rsc_16_0_BVALID")
    , TLS_x_rsc_16_0_BUSER("TLS_x_rsc_16_0_BUSER")
    , TLS_x_rsc_16_0_BRESP("TLS_x_rsc_16_0_BRESP")
    , TLS_x_rsc_16_0_BID("TLS_x_rsc_16_0_BID")
    , TLS_x_rsc_16_0_WREADY("TLS_x_rsc_16_0_WREADY")
    , TLS_x_rsc_16_0_WVALID("TLS_x_rsc_16_0_WVALID")
    , TLS_x_rsc_16_0_WUSER("TLS_x_rsc_16_0_WUSER")
    , TLS_x_rsc_16_0_WLAST("TLS_x_rsc_16_0_WLAST")
    , TLS_x_rsc_16_0_WSTRB("TLS_x_rsc_16_0_WSTRB")
    , TLS_x_rsc_16_0_WDATA("TLS_x_rsc_16_0_WDATA")
    , TLS_x_rsc_16_0_AWREADY("TLS_x_rsc_16_0_AWREADY")
    , TLS_x_rsc_16_0_AWVALID("TLS_x_rsc_16_0_AWVALID")
    , TLS_x_rsc_16_0_AWUSER("TLS_x_rsc_16_0_AWUSER")
    , TLS_x_rsc_16_0_AWREGION("TLS_x_rsc_16_0_AWREGION")
    , TLS_x_rsc_16_0_AWQOS("TLS_x_rsc_16_0_AWQOS")
    , TLS_x_rsc_16_0_AWPROT("TLS_x_rsc_16_0_AWPROT")
    , TLS_x_rsc_16_0_AWCACHE("TLS_x_rsc_16_0_AWCACHE")
    , TLS_x_rsc_16_0_AWLOCK("TLS_x_rsc_16_0_AWLOCK")
    , TLS_x_rsc_16_0_AWBURST("TLS_x_rsc_16_0_AWBURST")
    , TLS_x_rsc_16_0_AWSIZE("TLS_x_rsc_16_0_AWSIZE")
    , TLS_x_rsc_16_0_AWLEN("TLS_x_rsc_16_0_AWLEN")
    , TLS_x_rsc_16_0_AWADDR("TLS_x_rsc_16_0_AWADDR")
    , TLS_x_rsc_16_0_AWID("TLS_x_rsc_16_0_AWID")
    , TLS_x_rsc_triosy_16_0_lz("TLS_x_rsc_triosy_16_0_lz")
    , TLS_x_rsc_17_0_s_tdone("TLS_x_rsc_17_0_s_tdone")
    , TLS_x_rsc_17_0_tr_write_done("TLS_x_rsc_17_0_tr_write_done")
    , TLS_x_rsc_17_0_RREADY("TLS_x_rsc_17_0_RREADY")
    , TLS_x_rsc_17_0_RVALID("TLS_x_rsc_17_0_RVALID")
    , TLS_x_rsc_17_0_RUSER("TLS_x_rsc_17_0_RUSER")
    , TLS_x_rsc_17_0_RLAST("TLS_x_rsc_17_0_RLAST")
    , TLS_x_rsc_17_0_RRESP("TLS_x_rsc_17_0_RRESP")
    , TLS_x_rsc_17_0_RDATA("TLS_x_rsc_17_0_RDATA")
    , TLS_x_rsc_17_0_RID("TLS_x_rsc_17_0_RID")
    , TLS_x_rsc_17_0_ARREADY("TLS_x_rsc_17_0_ARREADY")
    , TLS_x_rsc_17_0_ARVALID("TLS_x_rsc_17_0_ARVALID")
    , TLS_x_rsc_17_0_ARUSER("TLS_x_rsc_17_0_ARUSER")
    , TLS_x_rsc_17_0_ARREGION("TLS_x_rsc_17_0_ARREGION")
    , TLS_x_rsc_17_0_ARQOS("TLS_x_rsc_17_0_ARQOS")
    , TLS_x_rsc_17_0_ARPROT("TLS_x_rsc_17_0_ARPROT")
    , TLS_x_rsc_17_0_ARCACHE("TLS_x_rsc_17_0_ARCACHE")
    , TLS_x_rsc_17_0_ARLOCK("TLS_x_rsc_17_0_ARLOCK")
    , TLS_x_rsc_17_0_ARBURST("TLS_x_rsc_17_0_ARBURST")
    , TLS_x_rsc_17_0_ARSIZE("TLS_x_rsc_17_0_ARSIZE")
    , TLS_x_rsc_17_0_ARLEN("TLS_x_rsc_17_0_ARLEN")
    , TLS_x_rsc_17_0_ARADDR("TLS_x_rsc_17_0_ARADDR")
    , TLS_x_rsc_17_0_ARID("TLS_x_rsc_17_0_ARID")
    , TLS_x_rsc_17_0_BREADY("TLS_x_rsc_17_0_BREADY")
    , TLS_x_rsc_17_0_BVALID("TLS_x_rsc_17_0_BVALID")
    , TLS_x_rsc_17_0_BUSER("TLS_x_rsc_17_0_BUSER")
    , TLS_x_rsc_17_0_BRESP("TLS_x_rsc_17_0_BRESP")
    , TLS_x_rsc_17_0_BID("TLS_x_rsc_17_0_BID")
    , TLS_x_rsc_17_0_WREADY("TLS_x_rsc_17_0_WREADY")
    , TLS_x_rsc_17_0_WVALID("TLS_x_rsc_17_0_WVALID")
    , TLS_x_rsc_17_0_WUSER("TLS_x_rsc_17_0_WUSER")
    , TLS_x_rsc_17_0_WLAST("TLS_x_rsc_17_0_WLAST")
    , TLS_x_rsc_17_0_WSTRB("TLS_x_rsc_17_0_WSTRB")
    , TLS_x_rsc_17_0_WDATA("TLS_x_rsc_17_0_WDATA")
    , TLS_x_rsc_17_0_AWREADY("TLS_x_rsc_17_0_AWREADY")
    , TLS_x_rsc_17_0_AWVALID("TLS_x_rsc_17_0_AWVALID")
    , TLS_x_rsc_17_0_AWUSER("TLS_x_rsc_17_0_AWUSER")
    , TLS_x_rsc_17_0_AWREGION("TLS_x_rsc_17_0_AWREGION")
    , TLS_x_rsc_17_0_AWQOS("TLS_x_rsc_17_0_AWQOS")
    , TLS_x_rsc_17_0_AWPROT("TLS_x_rsc_17_0_AWPROT")
    , TLS_x_rsc_17_0_AWCACHE("TLS_x_rsc_17_0_AWCACHE")
    , TLS_x_rsc_17_0_AWLOCK("TLS_x_rsc_17_0_AWLOCK")
    , TLS_x_rsc_17_0_AWBURST("TLS_x_rsc_17_0_AWBURST")
    , TLS_x_rsc_17_0_AWSIZE("TLS_x_rsc_17_0_AWSIZE")
    , TLS_x_rsc_17_0_AWLEN("TLS_x_rsc_17_0_AWLEN")
    , TLS_x_rsc_17_0_AWADDR("TLS_x_rsc_17_0_AWADDR")
    , TLS_x_rsc_17_0_AWID("TLS_x_rsc_17_0_AWID")
    , TLS_x_rsc_triosy_17_0_lz("TLS_x_rsc_triosy_17_0_lz")
    , TLS_x_rsc_18_0_s_tdone("TLS_x_rsc_18_0_s_tdone")
    , TLS_x_rsc_18_0_tr_write_done("TLS_x_rsc_18_0_tr_write_done")
    , TLS_x_rsc_18_0_RREADY("TLS_x_rsc_18_0_RREADY")
    , TLS_x_rsc_18_0_RVALID("TLS_x_rsc_18_0_RVALID")
    , TLS_x_rsc_18_0_RUSER("TLS_x_rsc_18_0_RUSER")
    , TLS_x_rsc_18_0_RLAST("TLS_x_rsc_18_0_RLAST")
    , TLS_x_rsc_18_0_RRESP("TLS_x_rsc_18_0_RRESP")
    , TLS_x_rsc_18_0_RDATA("TLS_x_rsc_18_0_RDATA")
    , TLS_x_rsc_18_0_RID("TLS_x_rsc_18_0_RID")
    , TLS_x_rsc_18_0_ARREADY("TLS_x_rsc_18_0_ARREADY")
    , TLS_x_rsc_18_0_ARVALID("TLS_x_rsc_18_0_ARVALID")
    , TLS_x_rsc_18_0_ARUSER("TLS_x_rsc_18_0_ARUSER")
    , TLS_x_rsc_18_0_ARREGION("TLS_x_rsc_18_0_ARREGION")
    , TLS_x_rsc_18_0_ARQOS("TLS_x_rsc_18_0_ARQOS")
    , TLS_x_rsc_18_0_ARPROT("TLS_x_rsc_18_0_ARPROT")
    , TLS_x_rsc_18_0_ARCACHE("TLS_x_rsc_18_0_ARCACHE")
    , TLS_x_rsc_18_0_ARLOCK("TLS_x_rsc_18_0_ARLOCK")
    , TLS_x_rsc_18_0_ARBURST("TLS_x_rsc_18_0_ARBURST")
    , TLS_x_rsc_18_0_ARSIZE("TLS_x_rsc_18_0_ARSIZE")
    , TLS_x_rsc_18_0_ARLEN("TLS_x_rsc_18_0_ARLEN")
    , TLS_x_rsc_18_0_ARADDR("TLS_x_rsc_18_0_ARADDR")
    , TLS_x_rsc_18_0_ARID("TLS_x_rsc_18_0_ARID")
    , TLS_x_rsc_18_0_BREADY("TLS_x_rsc_18_0_BREADY")
    , TLS_x_rsc_18_0_BVALID("TLS_x_rsc_18_0_BVALID")
    , TLS_x_rsc_18_0_BUSER("TLS_x_rsc_18_0_BUSER")
    , TLS_x_rsc_18_0_BRESP("TLS_x_rsc_18_0_BRESP")
    , TLS_x_rsc_18_0_BID("TLS_x_rsc_18_0_BID")
    , TLS_x_rsc_18_0_WREADY("TLS_x_rsc_18_0_WREADY")
    , TLS_x_rsc_18_0_WVALID("TLS_x_rsc_18_0_WVALID")
    , TLS_x_rsc_18_0_WUSER("TLS_x_rsc_18_0_WUSER")
    , TLS_x_rsc_18_0_WLAST("TLS_x_rsc_18_0_WLAST")
    , TLS_x_rsc_18_0_WSTRB("TLS_x_rsc_18_0_WSTRB")
    , TLS_x_rsc_18_0_WDATA("TLS_x_rsc_18_0_WDATA")
    , TLS_x_rsc_18_0_AWREADY("TLS_x_rsc_18_0_AWREADY")
    , TLS_x_rsc_18_0_AWVALID("TLS_x_rsc_18_0_AWVALID")
    , TLS_x_rsc_18_0_AWUSER("TLS_x_rsc_18_0_AWUSER")
    , TLS_x_rsc_18_0_AWREGION("TLS_x_rsc_18_0_AWREGION")
    , TLS_x_rsc_18_0_AWQOS("TLS_x_rsc_18_0_AWQOS")
    , TLS_x_rsc_18_0_AWPROT("TLS_x_rsc_18_0_AWPROT")
    , TLS_x_rsc_18_0_AWCACHE("TLS_x_rsc_18_0_AWCACHE")
    , TLS_x_rsc_18_0_AWLOCK("TLS_x_rsc_18_0_AWLOCK")
    , TLS_x_rsc_18_0_AWBURST("TLS_x_rsc_18_0_AWBURST")
    , TLS_x_rsc_18_0_AWSIZE("TLS_x_rsc_18_0_AWSIZE")
    , TLS_x_rsc_18_0_AWLEN("TLS_x_rsc_18_0_AWLEN")
    , TLS_x_rsc_18_0_AWADDR("TLS_x_rsc_18_0_AWADDR")
    , TLS_x_rsc_18_0_AWID("TLS_x_rsc_18_0_AWID")
    , TLS_x_rsc_triosy_18_0_lz("TLS_x_rsc_triosy_18_0_lz")
    , TLS_x_rsc_19_0_s_tdone("TLS_x_rsc_19_0_s_tdone")
    , TLS_x_rsc_19_0_tr_write_done("TLS_x_rsc_19_0_tr_write_done")
    , TLS_x_rsc_19_0_RREADY("TLS_x_rsc_19_0_RREADY")
    , TLS_x_rsc_19_0_RVALID("TLS_x_rsc_19_0_RVALID")
    , TLS_x_rsc_19_0_RUSER("TLS_x_rsc_19_0_RUSER")
    , TLS_x_rsc_19_0_RLAST("TLS_x_rsc_19_0_RLAST")
    , TLS_x_rsc_19_0_RRESP("TLS_x_rsc_19_0_RRESP")
    , TLS_x_rsc_19_0_RDATA("TLS_x_rsc_19_0_RDATA")
    , TLS_x_rsc_19_0_RID("TLS_x_rsc_19_0_RID")
    , TLS_x_rsc_19_0_ARREADY("TLS_x_rsc_19_0_ARREADY")
    , TLS_x_rsc_19_0_ARVALID("TLS_x_rsc_19_0_ARVALID")
    , TLS_x_rsc_19_0_ARUSER("TLS_x_rsc_19_0_ARUSER")
    , TLS_x_rsc_19_0_ARREGION("TLS_x_rsc_19_0_ARREGION")
    , TLS_x_rsc_19_0_ARQOS("TLS_x_rsc_19_0_ARQOS")
    , TLS_x_rsc_19_0_ARPROT("TLS_x_rsc_19_0_ARPROT")
    , TLS_x_rsc_19_0_ARCACHE("TLS_x_rsc_19_0_ARCACHE")
    , TLS_x_rsc_19_0_ARLOCK("TLS_x_rsc_19_0_ARLOCK")
    , TLS_x_rsc_19_0_ARBURST("TLS_x_rsc_19_0_ARBURST")
    , TLS_x_rsc_19_0_ARSIZE("TLS_x_rsc_19_0_ARSIZE")
    , TLS_x_rsc_19_0_ARLEN("TLS_x_rsc_19_0_ARLEN")
    , TLS_x_rsc_19_0_ARADDR("TLS_x_rsc_19_0_ARADDR")
    , TLS_x_rsc_19_0_ARID("TLS_x_rsc_19_0_ARID")
    , TLS_x_rsc_19_0_BREADY("TLS_x_rsc_19_0_BREADY")
    , TLS_x_rsc_19_0_BVALID("TLS_x_rsc_19_0_BVALID")
    , TLS_x_rsc_19_0_BUSER("TLS_x_rsc_19_0_BUSER")
    , TLS_x_rsc_19_0_BRESP("TLS_x_rsc_19_0_BRESP")
    , TLS_x_rsc_19_0_BID("TLS_x_rsc_19_0_BID")
    , TLS_x_rsc_19_0_WREADY("TLS_x_rsc_19_0_WREADY")
    , TLS_x_rsc_19_0_WVALID("TLS_x_rsc_19_0_WVALID")
    , TLS_x_rsc_19_0_WUSER("TLS_x_rsc_19_0_WUSER")
    , TLS_x_rsc_19_0_WLAST("TLS_x_rsc_19_0_WLAST")
    , TLS_x_rsc_19_0_WSTRB("TLS_x_rsc_19_0_WSTRB")
    , TLS_x_rsc_19_0_WDATA("TLS_x_rsc_19_0_WDATA")
    , TLS_x_rsc_19_0_AWREADY("TLS_x_rsc_19_0_AWREADY")
    , TLS_x_rsc_19_0_AWVALID("TLS_x_rsc_19_0_AWVALID")
    , TLS_x_rsc_19_0_AWUSER("TLS_x_rsc_19_0_AWUSER")
    , TLS_x_rsc_19_0_AWREGION("TLS_x_rsc_19_0_AWREGION")
    , TLS_x_rsc_19_0_AWQOS("TLS_x_rsc_19_0_AWQOS")
    , TLS_x_rsc_19_0_AWPROT("TLS_x_rsc_19_0_AWPROT")
    , TLS_x_rsc_19_0_AWCACHE("TLS_x_rsc_19_0_AWCACHE")
    , TLS_x_rsc_19_0_AWLOCK("TLS_x_rsc_19_0_AWLOCK")
    , TLS_x_rsc_19_0_AWBURST("TLS_x_rsc_19_0_AWBURST")
    , TLS_x_rsc_19_0_AWSIZE("TLS_x_rsc_19_0_AWSIZE")
    , TLS_x_rsc_19_0_AWLEN("TLS_x_rsc_19_0_AWLEN")
    , TLS_x_rsc_19_0_AWADDR("TLS_x_rsc_19_0_AWADDR")
    , TLS_x_rsc_19_0_AWID("TLS_x_rsc_19_0_AWID")
    , TLS_x_rsc_triosy_19_0_lz("TLS_x_rsc_triosy_19_0_lz")
    , TLS_x_rsc_20_0_s_tdone("TLS_x_rsc_20_0_s_tdone")
    , TLS_x_rsc_20_0_tr_write_done("TLS_x_rsc_20_0_tr_write_done")
    , TLS_x_rsc_20_0_RREADY("TLS_x_rsc_20_0_RREADY")
    , TLS_x_rsc_20_0_RVALID("TLS_x_rsc_20_0_RVALID")
    , TLS_x_rsc_20_0_RUSER("TLS_x_rsc_20_0_RUSER")
    , TLS_x_rsc_20_0_RLAST("TLS_x_rsc_20_0_RLAST")
    , TLS_x_rsc_20_0_RRESP("TLS_x_rsc_20_0_RRESP")
    , TLS_x_rsc_20_0_RDATA("TLS_x_rsc_20_0_RDATA")
    , TLS_x_rsc_20_0_RID("TLS_x_rsc_20_0_RID")
    , TLS_x_rsc_20_0_ARREADY("TLS_x_rsc_20_0_ARREADY")
    , TLS_x_rsc_20_0_ARVALID("TLS_x_rsc_20_0_ARVALID")
    , TLS_x_rsc_20_0_ARUSER("TLS_x_rsc_20_0_ARUSER")
    , TLS_x_rsc_20_0_ARREGION("TLS_x_rsc_20_0_ARREGION")
    , TLS_x_rsc_20_0_ARQOS("TLS_x_rsc_20_0_ARQOS")
    , TLS_x_rsc_20_0_ARPROT("TLS_x_rsc_20_0_ARPROT")
    , TLS_x_rsc_20_0_ARCACHE("TLS_x_rsc_20_0_ARCACHE")
    , TLS_x_rsc_20_0_ARLOCK("TLS_x_rsc_20_0_ARLOCK")
    , TLS_x_rsc_20_0_ARBURST("TLS_x_rsc_20_0_ARBURST")
    , TLS_x_rsc_20_0_ARSIZE("TLS_x_rsc_20_0_ARSIZE")
    , TLS_x_rsc_20_0_ARLEN("TLS_x_rsc_20_0_ARLEN")
    , TLS_x_rsc_20_0_ARADDR("TLS_x_rsc_20_0_ARADDR")
    , TLS_x_rsc_20_0_ARID("TLS_x_rsc_20_0_ARID")
    , TLS_x_rsc_20_0_BREADY("TLS_x_rsc_20_0_BREADY")
    , TLS_x_rsc_20_0_BVALID("TLS_x_rsc_20_0_BVALID")
    , TLS_x_rsc_20_0_BUSER("TLS_x_rsc_20_0_BUSER")
    , TLS_x_rsc_20_0_BRESP("TLS_x_rsc_20_0_BRESP")
    , TLS_x_rsc_20_0_BID("TLS_x_rsc_20_0_BID")
    , TLS_x_rsc_20_0_WREADY("TLS_x_rsc_20_0_WREADY")
    , TLS_x_rsc_20_0_WVALID("TLS_x_rsc_20_0_WVALID")
    , TLS_x_rsc_20_0_WUSER("TLS_x_rsc_20_0_WUSER")
    , TLS_x_rsc_20_0_WLAST("TLS_x_rsc_20_0_WLAST")
    , TLS_x_rsc_20_0_WSTRB("TLS_x_rsc_20_0_WSTRB")
    , TLS_x_rsc_20_0_WDATA("TLS_x_rsc_20_0_WDATA")
    , TLS_x_rsc_20_0_AWREADY("TLS_x_rsc_20_0_AWREADY")
    , TLS_x_rsc_20_0_AWVALID("TLS_x_rsc_20_0_AWVALID")
    , TLS_x_rsc_20_0_AWUSER("TLS_x_rsc_20_0_AWUSER")
    , TLS_x_rsc_20_0_AWREGION("TLS_x_rsc_20_0_AWREGION")
    , TLS_x_rsc_20_0_AWQOS("TLS_x_rsc_20_0_AWQOS")
    , TLS_x_rsc_20_0_AWPROT("TLS_x_rsc_20_0_AWPROT")
    , TLS_x_rsc_20_0_AWCACHE("TLS_x_rsc_20_0_AWCACHE")
    , TLS_x_rsc_20_0_AWLOCK("TLS_x_rsc_20_0_AWLOCK")
    , TLS_x_rsc_20_0_AWBURST("TLS_x_rsc_20_0_AWBURST")
    , TLS_x_rsc_20_0_AWSIZE("TLS_x_rsc_20_0_AWSIZE")
    , TLS_x_rsc_20_0_AWLEN("TLS_x_rsc_20_0_AWLEN")
    , TLS_x_rsc_20_0_AWADDR("TLS_x_rsc_20_0_AWADDR")
    , TLS_x_rsc_20_0_AWID("TLS_x_rsc_20_0_AWID")
    , TLS_x_rsc_triosy_20_0_lz("TLS_x_rsc_triosy_20_0_lz")
    , TLS_x_rsc_21_0_s_tdone("TLS_x_rsc_21_0_s_tdone")
    , TLS_x_rsc_21_0_tr_write_done("TLS_x_rsc_21_0_tr_write_done")
    , TLS_x_rsc_21_0_RREADY("TLS_x_rsc_21_0_RREADY")
    , TLS_x_rsc_21_0_RVALID("TLS_x_rsc_21_0_RVALID")
    , TLS_x_rsc_21_0_RUSER("TLS_x_rsc_21_0_RUSER")
    , TLS_x_rsc_21_0_RLAST("TLS_x_rsc_21_0_RLAST")
    , TLS_x_rsc_21_0_RRESP("TLS_x_rsc_21_0_RRESP")
    , TLS_x_rsc_21_0_RDATA("TLS_x_rsc_21_0_RDATA")
    , TLS_x_rsc_21_0_RID("TLS_x_rsc_21_0_RID")
    , TLS_x_rsc_21_0_ARREADY("TLS_x_rsc_21_0_ARREADY")
    , TLS_x_rsc_21_0_ARVALID("TLS_x_rsc_21_0_ARVALID")
    , TLS_x_rsc_21_0_ARUSER("TLS_x_rsc_21_0_ARUSER")
    , TLS_x_rsc_21_0_ARREGION("TLS_x_rsc_21_0_ARREGION")
    , TLS_x_rsc_21_0_ARQOS("TLS_x_rsc_21_0_ARQOS")
    , TLS_x_rsc_21_0_ARPROT("TLS_x_rsc_21_0_ARPROT")
    , TLS_x_rsc_21_0_ARCACHE("TLS_x_rsc_21_0_ARCACHE")
    , TLS_x_rsc_21_0_ARLOCK("TLS_x_rsc_21_0_ARLOCK")
    , TLS_x_rsc_21_0_ARBURST("TLS_x_rsc_21_0_ARBURST")
    , TLS_x_rsc_21_0_ARSIZE("TLS_x_rsc_21_0_ARSIZE")
    , TLS_x_rsc_21_0_ARLEN("TLS_x_rsc_21_0_ARLEN")
    , TLS_x_rsc_21_0_ARADDR("TLS_x_rsc_21_0_ARADDR")
    , TLS_x_rsc_21_0_ARID("TLS_x_rsc_21_0_ARID")
    , TLS_x_rsc_21_0_BREADY("TLS_x_rsc_21_0_BREADY")
    , TLS_x_rsc_21_0_BVALID("TLS_x_rsc_21_0_BVALID")
    , TLS_x_rsc_21_0_BUSER("TLS_x_rsc_21_0_BUSER")
    , TLS_x_rsc_21_0_BRESP("TLS_x_rsc_21_0_BRESP")
    , TLS_x_rsc_21_0_BID("TLS_x_rsc_21_0_BID")
    , TLS_x_rsc_21_0_WREADY("TLS_x_rsc_21_0_WREADY")
    , TLS_x_rsc_21_0_WVALID("TLS_x_rsc_21_0_WVALID")
    , TLS_x_rsc_21_0_WUSER("TLS_x_rsc_21_0_WUSER")
    , TLS_x_rsc_21_0_WLAST("TLS_x_rsc_21_0_WLAST")
    , TLS_x_rsc_21_0_WSTRB("TLS_x_rsc_21_0_WSTRB")
    , TLS_x_rsc_21_0_WDATA("TLS_x_rsc_21_0_WDATA")
    , TLS_x_rsc_21_0_AWREADY("TLS_x_rsc_21_0_AWREADY")
    , TLS_x_rsc_21_0_AWVALID("TLS_x_rsc_21_0_AWVALID")
    , TLS_x_rsc_21_0_AWUSER("TLS_x_rsc_21_0_AWUSER")
    , TLS_x_rsc_21_0_AWREGION("TLS_x_rsc_21_0_AWREGION")
    , TLS_x_rsc_21_0_AWQOS("TLS_x_rsc_21_0_AWQOS")
    , TLS_x_rsc_21_0_AWPROT("TLS_x_rsc_21_0_AWPROT")
    , TLS_x_rsc_21_0_AWCACHE("TLS_x_rsc_21_0_AWCACHE")
    , TLS_x_rsc_21_0_AWLOCK("TLS_x_rsc_21_0_AWLOCK")
    , TLS_x_rsc_21_0_AWBURST("TLS_x_rsc_21_0_AWBURST")
    , TLS_x_rsc_21_0_AWSIZE("TLS_x_rsc_21_0_AWSIZE")
    , TLS_x_rsc_21_0_AWLEN("TLS_x_rsc_21_0_AWLEN")
    , TLS_x_rsc_21_0_AWADDR("TLS_x_rsc_21_0_AWADDR")
    , TLS_x_rsc_21_0_AWID("TLS_x_rsc_21_0_AWID")
    , TLS_x_rsc_triosy_21_0_lz("TLS_x_rsc_triosy_21_0_lz")
    , TLS_x_rsc_22_0_s_tdone("TLS_x_rsc_22_0_s_tdone")
    , TLS_x_rsc_22_0_tr_write_done("TLS_x_rsc_22_0_tr_write_done")
    , TLS_x_rsc_22_0_RREADY("TLS_x_rsc_22_0_RREADY")
    , TLS_x_rsc_22_0_RVALID("TLS_x_rsc_22_0_RVALID")
    , TLS_x_rsc_22_0_RUSER("TLS_x_rsc_22_0_RUSER")
    , TLS_x_rsc_22_0_RLAST("TLS_x_rsc_22_0_RLAST")
    , TLS_x_rsc_22_0_RRESP("TLS_x_rsc_22_0_RRESP")
    , TLS_x_rsc_22_0_RDATA("TLS_x_rsc_22_0_RDATA")
    , TLS_x_rsc_22_0_RID("TLS_x_rsc_22_0_RID")
    , TLS_x_rsc_22_0_ARREADY("TLS_x_rsc_22_0_ARREADY")
    , TLS_x_rsc_22_0_ARVALID("TLS_x_rsc_22_0_ARVALID")
    , TLS_x_rsc_22_0_ARUSER("TLS_x_rsc_22_0_ARUSER")
    , TLS_x_rsc_22_0_ARREGION("TLS_x_rsc_22_0_ARREGION")
    , TLS_x_rsc_22_0_ARQOS("TLS_x_rsc_22_0_ARQOS")
    , TLS_x_rsc_22_0_ARPROT("TLS_x_rsc_22_0_ARPROT")
    , TLS_x_rsc_22_0_ARCACHE("TLS_x_rsc_22_0_ARCACHE")
    , TLS_x_rsc_22_0_ARLOCK("TLS_x_rsc_22_0_ARLOCK")
    , TLS_x_rsc_22_0_ARBURST("TLS_x_rsc_22_0_ARBURST")
    , TLS_x_rsc_22_0_ARSIZE("TLS_x_rsc_22_0_ARSIZE")
    , TLS_x_rsc_22_0_ARLEN("TLS_x_rsc_22_0_ARLEN")
    , TLS_x_rsc_22_0_ARADDR("TLS_x_rsc_22_0_ARADDR")
    , TLS_x_rsc_22_0_ARID("TLS_x_rsc_22_0_ARID")
    , TLS_x_rsc_22_0_BREADY("TLS_x_rsc_22_0_BREADY")
    , TLS_x_rsc_22_0_BVALID("TLS_x_rsc_22_0_BVALID")
    , TLS_x_rsc_22_0_BUSER("TLS_x_rsc_22_0_BUSER")
    , TLS_x_rsc_22_0_BRESP("TLS_x_rsc_22_0_BRESP")
    , TLS_x_rsc_22_0_BID("TLS_x_rsc_22_0_BID")
    , TLS_x_rsc_22_0_WREADY("TLS_x_rsc_22_0_WREADY")
    , TLS_x_rsc_22_0_WVALID("TLS_x_rsc_22_0_WVALID")
    , TLS_x_rsc_22_0_WUSER("TLS_x_rsc_22_0_WUSER")
    , TLS_x_rsc_22_0_WLAST("TLS_x_rsc_22_0_WLAST")
    , TLS_x_rsc_22_0_WSTRB("TLS_x_rsc_22_0_WSTRB")
    , TLS_x_rsc_22_0_WDATA("TLS_x_rsc_22_0_WDATA")
    , TLS_x_rsc_22_0_AWREADY("TLS_x_rsc_22_0_AWREADY")
    , TLS_x_rsc_22_0_AWVALID("TLS_x_rsc_22_0_AWVALID")
    , TLS_x_rsc_22_0_AWUSER("TLS_x_rsc_22_0_AWUSER")
    , TLS_x_rsc_22_0_AWREGION("TLS_x_rsc_22_0_AWREGION")
    , TLS_x_rsc_22_0_AWQOS("TLS_x_rsc_22_0_AWQOS")
    , TLS_x_rsc_22_0_AWPROT("TLS_x_rsc_22_0_AWPROT")
    , TLS_x_rsc_22_0_AWCACHE("TLS_x_rsc_22_0_AWCACHE")
    , TLS_x_rsc_22_0_AWLOCK("TLS_x_rsc_22_0_AWLOCK")
    , TLS_x_rsc_22_0_AWBURST("TLS_x_rsc_22_0_AWBURST")
    , TLS_x_rsc_22_0_AWSIZE("TLS_x_rsc_22_0_AWSIZE")
    , TLS_x_rsc_22_0_AWLEN("TLS_x_rsc_22_0_AWLEN")
    , TLS_x_rsc_22_0_AWADDR("TLS_x_rsc_22_0_AWADDR")
    , TLS_x_rsc_22_0_AWID("TLS_x_rsc_22_0_AWID")
    , TLS_x_rsc_triosy_22_0_lz("TLS_x_rsc_triosy_22_0_lz")
    , TLS_x_rsc_23_0_s_tdone("TLS_x_rsc_23_0_s_tdone")
    , TLS_x_rsc_23_0_tr_write_done("TLS_x_rsc_23_0_tr_write_done")
    , TLS_x_rsc_23_0_RREADY("TLS_x_rsc_23_0_RREADY")
    , TLS_x_rsc_23_0_RVALID("TLS_x_rsc_23_0_RVALID")
    , TLS_x_rsc_23_0_RUSER("TLS_x_rsc_23_0_RUSER")
    , TLS_x_rsc_23_0_RLAST("TLS_x_rsc_23_0_RLAST")
    , TLS_x_rsc_23_0_RRESP("TLS_x_rsc_23_0_RRESP")
    , TLS_x_rsc_23_0_RDATA("TLS_x_rsc_23_0_RDATA")
    , TLS_x_rsc_23_0_RID("TLS_x_rsc_23_0_RID")
    , TLS_x_rsc_23_0_ARREADY("TLS_x_rsc_23_0_ARREADY")
    , TLS_x_rsc_23_0_ARVALID("TLS_x_rsc_23_0_ARVALID")
    , TLS_x_rsc_23_0_ARUSER("TLS_x_rsc_23_0_ARUSER")
    , TLS_x_rsc_23_0_ARREGION("TLS_x_rsc_23_0_ARREGION")
    , TLS_x_rsc_23_0_ARQOS("TLS_x_rsc_23_0_ARQOS")
    , TLS_x_rsc_23_0_ARPROT("TLS_x_rsc_23_0_ARPROT")
    , TLS_x_rsc_23_0_ARCACHE("TLS_x_rsc_23_0_ARCACHE")
    , TLS_x_rsc_23_0_ARLOCK("TLS_x_rsc_23_0_ARLOCK")
    , TLS_x_rsc_23_0_ARBURST("TLS_x_rsc_23_0_ARBURST")
    , TLS_x_rsc_23_0_ARSIZE("TLS_x_rsc_23_0_ARSIZE")
    , TLS_x_rsc_23_0_ARLEN("TLS_x_rsc_23_0_ARLEN")
    , TLS_x_rsc_23_0_ARADDR("TLS_x_rsc_23_0_ARADDR")
    , TLS_x_rsc_23_0_ARID("TLS_x_rsc_23_0_ARID")
    , TLS_x_rsc_23_0_BREADY("TLS_x_rsc_23_0_BREADY")
    , TLS_x_rsc_23_0_BVALID("TLS_x_rsc_23_0_BVALID")
    , TLS_x_rsc_23_0_BUSER("TLS_x_rsc_23_0_BUSER")
    , TLS_x_rsc_23_0_BRESP("TLS_x_rsc_23_0_BRESP")
    , TLS_x_rsc_23_0_BID("TLS_x_rsc_23_0_BID")
    , TLS_x_rsc_23_0_WREADY("TLS_x_rsc_23_0_WREADY")
    , TLS_x_rsc_23_0_WVALID("TLS_x_rsc_23_0_WVALID")
    , TLS_x_rsc_23_0_WUSER("TLS_x_rsc_23_0_WUSER")
    , TLS_x_rsc_23_0_WLAST("TLS_x_rsc_23_0_WLAST")
    , TLS_x_rsc_23_0_WSTRB("TLS_x_rsc_23_0_WSTRB")
    , TLS_x_rsc_23_0_WDATA("TLS_x_rsc_23_0_WDATA")
    , TLS_x_rsc_23_0_AWREADY("TLS_x_rsc_23_0_AWREADY")
    , TLS_x_rsc_23_0_AWVALID("TLS_x_rsc_23_0_AWVALID")
    , TLS_x_rsc_23_0_AWUSER("TLS_x_rsc_23_0_AWUSER")
    , TLS_x_rsc_23_0_AWREGION("TLS_x_rsc_23_0_AWREGION")
    , TLS_x_rsc_23_0_AWQOS("TLS_x_rsc_23_0_AWQOS")
    , TLS_x_rsc_23_0_AWPROT("TLS_x_rsc_23_0_AWPROT")
    , TLS_x_rsc_23_0_AWCACHE("TLS_x_rsc_23_0_AWCACHE")
    , TLS_x_rsc_23_0_AWLOCK("TLS_x_rsc_23_0_AWLOCK")
    , TLS_x_rsc_23_0_AWBURST("TLS_x_rsc_23_0_AWBURST")
    , TLS_x_rsc_23_0_AWSIZE("TLS_x_rsc_23_0_AWSIZE")
    , TLS_x_rsc_23_0_AWLEN("TLS_x_rsc_23_0_AWLEN")
    , TLS_x_rsc_23_0_AWADDR("TLS_x_rsc_23_0_AWADDR")
    , TLS_x_rsc_23_0_AWID("TLS_x_rsc_23_0_AWID")
    , TLS_x_rsc_triosy_23_0_lz("TLS_x_rsc_triosy_23_0_lz")
    , TLS_x_rsc_24_0_s_tdone("TLS_x_rsc_24_0_s_tdone")
    , TLS_x_rsc_24_0_tr_write_done("TLS_x_rsc_24_0_tr_write_done")
    , TLS_x_rsc_24_0_RREADY("TLS_x_rsc_24_0_RREADY")
    , TLS_x_rsc_24_0_RVALID("TLS_x_rsc_24_0_RVALID")
    , TLS_x_rsc_24_0_RUSER("TLS_x_rsc_24_0_RUSER")
    , TLS_x_rsc_24_0_RLAST("TLS_x_rsc_24_0_RLAST")
    , TLS_x_rsc_24_0_RRESP("TLS_x_rsc_24_0_RRESP")
    , TLS_x_rsc_24_0_RDATA("TLS_x_rsc_24_0_RDATA")
    , TLS_x_rsc_24_0_RID("TLS_x_rsc_24_0_RID")
    , TLS_x_rsc_24_0_ARREADY("TLS_x_rsc_24_0_ARREADY")
    , TLS_x_rsc_24_0_ARVALID("TLS_x_rsc_24_0_ARVALID")
    , TLS_x_rsc_24_0_ARUSER("TLS_x_rsc_24_0_ARUSER")
    , TLS_x_rsc_24_0_ARREGION("TLS_x_rsc_24_0_ARREGION")
    , TLS_x_rsc_24_0_ARQOS("TLS_x_rsc_24_0_ARQOS")
    , TLS_x_rsc_24_0_ARPROT("TLS_x_rsc_24_0_ARPROT")
    , TLS_x_rsc_24_0_ARCACHE("TLS_x_rsc_24_0_ARCACHE")
    , TLS_x_rsc_24_0_ARLOCK("TLS_x_rsc_24_0_ARLOCK")
    , TLS_x_rsc_24_0_ARBURST("TLS_x_rsc_24_0_ARBURST")
    , TLS_x_rsc_24_0_ARSIZE("TLS_x_rsc_24_0_ARSIZE")
    , TLS_x_rsc_24_0_ARLEN("TLS_x_rsc_24_0_ARLEN")
    , TLS_x_rsc_24_0_ARADDR("TLS_x_rsc_24_0_ARADDR")
    , TLS_x_rsc_24_0_ARID("TLS_x_rsc_24_0_ARID")
    , TLS_x_rsc_24_0_BREADY("TLS_x_rsc_24_0_BREADY")
    , TLS_x_rsc_24_0_BVALID("TLS_x_rsc_24_0_BVALID")
    , TLS_x_rsc_24_0_BUSER("TLS_x_rsc_24_0_BUSER")
    , TLS_x_rsc_24_0_BRESP("TLS_x_rsc_24_0_BRESP")
    , TLS_x_rsc_24_0_BID("TLS_x_rsc_24_0_BID")
    , TLS_x_rsc_24_0_WREADY("TLS_x_rsc_24_0_WREADY")
    , TLS_x_rsc_24_0_WVALID("TLS_x_rsc_24_0_WVALID")
    , TLS_x_rsc_24_0_WUSER("TLS_x_rsc_24_0_WUSER")
    , TLS_x_rsc_24_0_WLAST("TLS_x_rsc_24_0_WLAST")
    , TLS_x_rsc_24_0_WSTRB("TLS_x_rsc_24_0_WSTRB")
    , TLS_x_rsc_24_0_WDATA("TLS_x_rsc_24_0_WDATA")
    , TLS_x_rsc_24_0_AWREADY("TLS_x_rsc_24_0_AWREADY")
    , TLS_x_rsc_24_0_AWVALID("TLS_x_rsc_24_0_AWVALID")
    , TLS_x_rsc_24_0_AWUSER("TLS_x_rsc_24_0_AWUSER")
    , TLS_x_rsc_24_0_AWREGION("TLS_x_rsc_24_0_AWREGION")
    , TLS_x_rsc_24_0_AWQOS("TLS_x_rsc_24_0_AWQOS")
    , TLS_x_rsc_24_0_AWPROT("TLS_x_rsc_24_0_AWPROT")
    , TLS_x_rsc_24_0_AWCACHE("TLS_x_rsc_24_0_AWCACHE")
    , TLS_x_rsc_24_0_AWLOCK("TLS_x_rsc_24_0_AWLOCK")
    , TLS_x_rsc_24_0_AWBURST("TLS_x_rsc_24_0_AWBURST")
    , TLS_x_rsc_24_0_AWSIZE("TLS_x_rsc_24_0_AWSIZE")
    , TLS_x_rsc_24_0_AWLEN("TLS_x_rsc_24_0_AWLEN")
    , TLS_x_rsc_24_0_AWADDR("TLS_x_rsc_24_0_AWADDR")
    , TLS_x_rsc_24_0_AWID("TLS_x_rsc_24_0_AWID")
    , TLS_x_rsc_triosy_24_0_lz("TLS_x_rsc_triosy_24_0_lz")
    , TLS_x_rsc_25_0_s_tdone("TLS_x_rsc_25_0_s_tdone")
    , TLS_x_rsc_25_0_tr_write_done("TLS_x_rsc_25_0_tr_write_done")
    , TLS_x_rsc_25_0_RREADY("TLS_x_rsc_25_0_RREADY")
    , TLS_x_rsc_25_0_RVALID("TLS_x_rsc_25_0_RVALID")
    , TLS_x_rsc_25_0_RUSER("TLS_x_rsc_25_0_RUSER")
    , TLS_x_rsc_25_0_RLAST("TLS_x_rsc_25_0_RLAST")
    , TLS_x_rsc_25_0_RRESP("TLS_x_rsc_25_0_RRESP")
    , TLS_x_rsc_25_0_RDATA("TLS_x_rsc_25_0_RDATA")
    , TLS_x_rsc_25_0_RID("TLS_x_rsc_25_0_RID")
    , TLS_x_rsc_25_0_ARREADY("TLS_x_rsc_25_0_ARREADY")
    , TLS_x_rsc_25_0_ARVALID("TLS_x_rsc_25_0_ARVALID")
    , TLS_x_rsc_25_0_ARUSER("TLS_x_rsc_25_0_ARUSER")
    , TLS_x_rsc_25_0_ARREGION("TLS_x_rsc_25_0_ARREGION")
    , TLS_x_rsc_25_0_ARQOS("TLS_x_rsc_25_0_ARQOS")
    , TLS_x_rsc_25_0_ARPROT("TLS_x_rsc_25_0_ARPROT")
    , TLS_x_rsc_25_0_ARCACHE("TLS_x_rsc_25_0_ARCACHE")
    , TLS_x_rsc_25_0_ARLOCK("TLS_x_rsc_25_0_ARLOCK")
    , TLS_x_rsc_25_0_ARBURST("TLS_x_rsc_25_0_ARBURST")
    , TLS_x_rsc_25_0_ARSIZE("TLS_x_rsc_25_0_ARSIZE")
    , TLS_x_rsc_25_0_ARLEN("TLS_x_rsc_25_0_ARLEN")
    , TLS_x_rsc_25_0_ARADDR("TLS_x_rsc_25_0_ARADDR")
    , TLS_x_rsc_25_0_ARID("TLS_x_rsc_25_0_ARID")
    , TLS_x_rsc_25_0_BREADY("TLS_x_rsc_25_0_BREADY")
    , TLS_x_rsc_25_0_BVALID("TLS_x_rsc_25_0_BVALID")
    , TLS_x_rsc_25_0_BUSER("TLS_x_rsc_25_0_BUSER")
    , TLS_x_rsc_25_0_BRESP("TLS_x_rsc_25_0_BRESP")
    , TLS_x_rsc_25_0_BID("TLS_x_rsc_25_0_BID")
    , TLS_x_rsc_25_0_WREADY("TLS_x_rsc_25_0_WREADY")
    , TLS_x_rsc_25_0_WVALID("TLS_x_rsc_25_0_WVALID")
    , TLS_x_rsc_25_0_WUSER("TLS_x_rsc_25_0_WUSER")
    , TLS_x_rsc_25_0_WLAST("TLS_x_rsc_25_0_WLAST")
    , TLS_x_rsc_25_0_WSTRB("TLS_x_rsc_25_0_WSTRB")
    , TLS_x_rsc_25_0_WDATA("TLS_x_rsc_25_0_WDATA")
    , TLS_x_rsc_25_0_AWREADY("TLS_x_rsc_25_0_AWREADY")
    , TLS_x_rsc_25_0_AWVALID("TLS_x_rsc_25_0_AWVALID")
    , TLS_x_rsc_25_0_AWUSER("TLS_x_rsc_25_0_AWUSER")
    , TLS_x_rsc_25_0_AWREGION("TLS_x_rsc_25_0_AWREGION")
    , TLS_x_rsc_25_0_AWQOS("TLS_x_rsc_25_0_AWQOS")
    , TLS_x_rsc_25_0_AWPROT("TLS_x_rsc_25_0_AWPROT")
    , TLS_x_rsc_25_0_AWCACHE("TLS_x_rsc_25_0_AWCACHE")
    , TLS_x_rsc_25_0_AWLOCK("TLS_x_rsc_25_0_AWLOCK")
    , TLS_x_rsc_25_0_AWBURST("TLS_x_rsc_25_0_AWBURST")
    , TLS_x_rsc_25_0_AWSIZE("TLS_x_rsc_25_0_AWSIZE")
    , TLS_x_rsc_25_0_AWLEN("TLS_x_rsc_25_0_AWLEN")
    , TLS_x_rsc_25_0_AWADDR("TLS_x_rsc_25_0_AWADDR")
    , TLS_x_rsc_25_0_AWID("TLS_x_rsc_25_0_AWID")
    , TLS_x_rsc_triosy_25_0_lz("TLS_x_rsc_triosy_25_0_lz")
    , TLS_x_rsc_26_0_s_tdone("TLS_x_rsc_26_0_s_tdone")
    , TLS_x_rsc_26_0_tr_write_done("TLS_x_rsc_26_0_tr_write_done")
    , TLS_x_rsc_26_0_RREADY("TLS_x_rsc_26_0_RREADY")
    , TLS_x_rsc_26_0_RVALID("TLS_x_rsc_26_0_RVALID")
    , TLS_x_rsc_26_0_RUSER("TLS_x_rsc_26_0_RUSER")
    , TLS_x_rsc_26_0_RLAST("TLS_x_rsc_26_0_RLAST")
    , TLS_x_rsc_26_0_RRESP("TLS_x_rsc_26_0_RRESP")
    , TLS_x_rsc_26_0_RDATA("TLS_x_rsc_26_0_RDATA")
    , TLS_x_rsc_26_0_RID("TLS_x_rsc_26_0_RID")
    , TLS_x_rsc_26_0_ARREADY("TLS_x_rsc_26_0_ARREADY")
    , TLS_x_rsc_26_0_ARVALID("TLS_x_rsc_26_0_ARVALID")
    , TLS_x_rsc_26_0_ARUSER("TLS_x_rsc_26_0_ARUSER")
    , TLS_x_rsc_26_0_ARREGION("TLS_x_rsc_26_0_ARREGION")
    , TLS_x_rsc_26_0_ARQOS("TLS_x_rsc_26_0_ARQOS")
    , TLS_x_rsc_26_0_ARPROT("TLS_x_rsc_26_0_ARPROT")
    , TLS_x_rsc_26_0_ARCACHE("TLS_x_rsc_26_0_ARCACHE")
    , TLS_x_rsc_26_0_ARLOCK("TLS_x_rsc_26_0_ARLOCK")
    , TLS_x_rsc_26_0_ARBURST("TLS_x_rsc_26_0_ARBURST")
    , TLS_x_rsc_26_0_ARSIZE("TLS_x_rsc_26_0_ARSIZE")
    , TLS_x_rsc_26_0_ARLEN("TLS_x_rsc_26_0_ARLEN")
    , TLS_x_rsc_26_0_ARADDR("TLS_x_rsc_26_0_ARADDR")
    , TLS_x_rsc_26_0_ARID("TLS_x_rsc_26_0_ARID")
    , TLS_x_rsc_26_0_BREADY("TLS_x_rsc_26_0_BREADY")
    , TLS_x_rsc_26_0_BVALID("TLS_x_rsc_26_0_BVALID")
    , TLS_x_rsc_26_0_BUSER("TLS_x_rsc_26_0_BUSER")
    , TLS_x_rsc_26_0_BRESP("TLS_x_rsc_26_0_BRESP")
    , TLS_x_rsc_26_0_BID("TLS_x_rsc_26_0_BID")
    , TLS_x_rsc_26_0_WREADY("TLS_x_rsc_26_0_WREADY")
    , TLS_x_rsc_26_0_WVALID("TLS_x_rsc_26_0_WVALID")
    , TLS_x_rsc_26_0_WUSER("TLS_x_rsc_26_0_WUSER")
    , TLS_x_rsc_26_0_WLAST("TLS_x_rsc_26_0_WLAST")
    , TLS_x_rsc_26_0_WSTRB("TLS_x_rsc_26_0_WSTRB")
    , TLS_x_rsc_26_0_WDATA("TLS_x_rsc_26_0_WDATA")
    , TLS_x_rsc_26_0_AWREADY("TLS_x_rsc_26_0_AWREADY")
    , TLS_x_rsc_26_0_AWVALID("TLS_x_rsc_26_0_AWVALID")
    , TLS_x_rsc_26_0_AWUSER("TLS_x_rsc_26_0_AWUSER")
    , TLS_x_rsc_26_0_AWREGION("TLS_x_rsc_26_0_AWREGION")
    , TLS_x_rsc_26_0_AWQOS("TLS_x_rsc_26_0_AWQOS")
    , TLS_x_rsc_26_0_AWPROT("TLS_x_rsc_26_0_AWPROT")
    , TLS_x_rsc_26_0_AWCACHE("TLS_x_rsc_26_0_AWCACHE")
    , TLS_x_rsc_26_0_AWLOCK("TLS_x_rsc_26_0_AWLOCK")
    , TLS_x_rsc_26_0_AWBURST("TLS_x_rsc_26_0_AWBURST")
    , TLS_x_rsc_26_0_AWSIZE("TLS_x_rsc_26_0_AWSIZE")
    , TLS_x_rsc_26_0_AWLEN("TLS_x_rsc_26_0_AWLEN")
    , TLS_x_rsc_26_0_AWADDR("TLS_x_rsc_26_0_AWADDR")
    , TLS_x_rsc_26_0_AWID("TLS_x_rsc_26_0_AWID")
    , TLS_x_rsc_triosy_26_0_lz("TLS_x_rsc_triosy_26_0_lz")
    , TLS_x_rsc_27_0_s_tdone("TLS_x_rsc_27_0_s_tdone")
    , TLS_x_rsc_27_0_tr_write_done("TLS_x_rsc_27_0_tr_write_done")
    , TLS_x_rsc_27_0_RREADY("TLS_x_rsc_27_0_RREADY")
    , TLS_x_rsc_27_0_RVALID("TLS_x_rsc_27_0_RVALID")
    , TLS_x_rsc_27_0_RUSER("TLS_x_rsc_27_0_RUSER")
    , TLS_x_rsc_27_0_RLAST("TLS_x_rsc_27_0_RLAST")
    , TLS_x_rsc_27_0_RRESP("TLS_x_rsc_27_0_RRESP")
    , TLS_x_rsc_27_0_RDATA("TLS_x_rsc_27_0_RDATA")
    , TLS_x_rsc_27_0_RID("TLS_x_rsc_27_0_RID")
    , TLS_x_rsc_27_0_ARREADY("TLS_x_rsc_27_0_ARREADY")
    , TLS_x_rsc_27_0_ARVALID("TLS_x_rsc_27_0_ARVALID")
    , TLS_x_rsc_27_0_ARUSER("TLS_x_rsc_27_0_ARUSER")
    , TLS_x_rsc_27_0_ARREGION("TLS_x_rsc_27_0_ARREGION")
    , TLS_x_rsc_27_0_ARQOS("TLS_x_rsc_27_0_ARQOS")
    , TLS_x_rsc_27_0_ARPROT("TLS_x_rsc_27_0_ARPROT")
    , TLS_x_rsc_27_0_ARCACHE("TLS_x_rsc_27_0_ARCACHE")
    , TLS_x_rsc_27_0_ARLOCK("TLS_x_rsc_27_0_ARLOCK")
    , TLS_x_rsc_27_0_ARBURST("TLS_x_rsc_27_0_ARBURST")
    , TLS_x_rsc_27_0_ARSIZE("TLS_x_rsc_27_0_ARSIZE")
    , TLS_x_rsc_27_0_ARLEN("TLS_x_rsc_27_0_ARLEN")
    , TLS_x_rsc_27_0_ARADDR("TLS_x_rsc_27_0_ARADDR")
    , TLS_x_rsc_27_0_ARID("TLS_x_rsc_27_0_ARID")
    , TLS_x_rsc_27_0_BREADY("TLS_x_rsc_27_0_BREADY")
    , TLS_x_rsc_27_0_BVALID("TLS_x_rsc_27_0_BVALID")
    , TLS_x_rsc_27_0_BUSER("TLS_x_rsc_27_0_BUSER")
    , TLS_x_rsc_27_0_BRESP("TLS_x_rsc_27_0_BRESP")
    , TLS_x_rsc_27_0_BID("TLS_x_rsc_27_0_BID")
    , TLS_x_rsc_27_0_WREADY("TLS_x_rsc_27_0_WREADY")
    , TLS_x_rsc_27_0_WVALID("TLS_x_rsc_27_0_WVALID")
    , TLS_x_rsc_27_0_WUSER("TLS_x_rsc_27_0_WUSER")
    , TLS_x_rsc_27_0_WLAST("TLS_x_rsc_27_0_WLAST")
    , TLS_x_rsc_27_0_WSTRB("TLS_x_rsc_27_0_WSTRB")
    , TLS_x_rsc_27_0_WDATA("TLS_x_rsc_27_0_WDATA")
    , TLS_x_rsc_27_0_AWREADY("TLS_x_rsc_27_0_AWREADY")
    , TLS_x_rsc_27_0_AWVALID("TLS_x_rsc_27_0_AWVALID")
    , TLS_x_rsc_27_0_AWUSER("TLS_x_rsc_27_0_AWUSER")
    , TLS_x_rsc_27_0_AWREGION("TLS_x_rsc_27_0_AWREGION")
    , TLS_x_rsc_27_0_AWQOS("TLS_x_rsc_27_0_AWQOS")
    , TLS_x_rsc_27_0_AWPROT("TLS_x_rsc_27_0_AWPROT")
    , TLS_x_rsc_27_0_AWCACHE("TLS_x_rsc_27_0_AWCACHE")
    , TLS_x_rsc_27_0_AWLOCK("TLS_x_rsc_27_0_AWLOCK")
    , TLS_x_rsc_27_0_AWBURST("TLS_x_rsc_27_0_AWBURST")
    , TLS_x_rsc_27_0_AWSIZE("TLS_x_rsc_27_0_AWSIZE")
    , TLS_x_rsc_27_0_AWLEN("TLS_x_rsc_27_0_AWLEN")
    , TLS_x_rsc_27_0_AWADDR("TLS_x_rsc_27_0_AWADDR")
    , TLS_x_rsc_27_0_AWID("TLS_x_rsc_27_0_AWID")
    , TLS_x_rsc_triosy_27_0_lz("TLS_x_rsc_triosy_27_0_lz")
    , TLS_x_rsc_28_0_s_tdone("TLS_x_rsc_28_0_s_tdone")
    , TLS_x_rsc_28_0_tr_write_done("TLS_x_rsc_28_0_tr_write_done")
    , TLS_x_rsc_28_0_RREADY("TLS_x_rsc_28_0_RREADY")
    , TLS_x_rsc_28_0_RVALID("TLS_x_rsc_28_0_RVALID")
    , TLS_x_rsc_28_0_RUSER("TLS_x_rsc_28_0_RUSER")
    , TLS_x_rsc_28_0_RLAST("TLS_x_rsc_28_0_RLAST")
    , TLS_x_rsc_28_0_RRESP("TLS_x_rsc_28_0_RRESP")
    , TLS_x_rsc_28_0_RDATA("TLS_x_rsc_28_0_RDATA")
    , TLS_x_rsc_28_0_RID("TLS_x_rsc_28_0_RID")
    , TLS_x_rsc_28_0_ARREADY("TLS_x_rsc_28_0_ARREADY")
    , TLS_x_rsc_28_0_ARVALID("TLS_x_rsc_28_0_ARVALID")
    , TLS_x_rsc_28_0_ARUSER("TLS_x_rsc_28_0_ARUSER")
    , TLS_x_rsc_28_0_ARREGION("TLS_x_rsc_28_0_ARREGION")
    , TLS_x_rsc_28_0_ARQOS("TLS_x_rsc_28_0_ARQOS")
    , TLS_x_rsc_28_0_ARPROT("TLS_x_rsc_28_0_ARPROT")
    , TLS_x_rsc_28_0_ARCACHE("TLS_x_rsc_28_0_ARCACHE")
    , TLS_x_rsc_28_0_ARLOCK("TLS_x_rsc_28_0_ARLOCK")
    , TLS_x_rsc_28_0_ARBURST("TLS_x_rsc_28_0_ARBURST")
    , TLS_x_rsc_28_0_ARSIZE("TLS_x_rsc_28_0_ARSIZE")
    , TLS_x_rsc_28_0_ARLEN("TLS_x_rsc_28_0_ARLEN")
    , TLS_x_rsc_28_0_ARADDR("TLS_x_rsc_28_0_ARADDR")
    , TLS_x_rsc_28_0_ARID("TLS_x_rsc_28_0_ARID")
    , TLS_x_rsc_28_0_BREADY("TLS_x_rsc_28_0_BREADY")
    , TLS_x_rsc_28_0_BVALID("TLS_x_rsc_28_0_BVALID")
    , TLS_x_rsc_28_0_BUSER("TLS_x_rsc_28_0_BUSER")
    , TLS_x_rsc_28_0_BRESP("TLS_x_rsc_28_0_BRESP")
    , TLS_x_rsc_28_0_BID("TLS_x_rsc_28_0_BID")
    , TLS_x_rsc_28_0_WREADY("TLS_x_rsc_28_0_WREADY")
    , TLS_x_rsc_28_0_WVALID("TLS_x_rsc_28_0_WVALID")
    , TLS_x_rsc_28_0_WUSER("TLS_x_rsc_28_0_WUSER")
    , TLS_x_rsc_28_0_WLAST("TLS_x_rsc_28_0_WLAST")
    , TLS_x_rsc_28_0_WSTRB("TLS_x_rsc_28_0_WSTRB")
    , TLS_x_rsc_28_0_WDATA("TLS_x_rsc_28_0_WDATA")
    , TLS_x_rsc_28_0_AWREADY("TLS_x_rsc_28_0_AWREADY")
    , TLS_x_rsc_28_0_AWVALID("TLS_x_rsc_28_0_AWVALID")
    , TLS_x_rsc_28_0_AWUSER("TLS_x_rsc_28_0_AWUSER")
    , TLS_x_rsc_28_0_AWREGION("TLS_x_rsc_28_0_AWREGION")
    , TLS_x_rsc_28_0_AWQOS("TLS_x_rsc_28_0_AWQOS")
    , TLS_x_rsc_28_0_AWPROT("TLS_x_rsc_28_0_AWPROT")
    , TLS_x_rsc_28_0_AWCACHE("TLS_x_rsc_28_0_AWCACHE")
    , TLS_x_rsc_28_0_AWLOCK("TLS_x_rsc_28_0_AWLOCK")
    , TLS_x_rsc_28_0_AWBURST("TLS_x_rsc_28_0_AWBURST")
    , TLS_x_rsc_28_0_AWSIZE("TLS_x_rsc_28_0_AWSIZE")
    , TLS_x_rsc_28_0_AWLEN("TLS_x_rsc_28_0_AWLEN")
    , TLS_x_rsc_28_0_AWADDR("TLS_x_rsc_28_0_AWADDR")
    , TLS_x_rsc_28_0_AWID("TLS_x_rsc_28_0_AWID")
    , TLS_x_rsc_triosy_28_0_lz("TLS_x_rsc_triosy_28_0_lz")
    , TLS_x_rsc_29_0_s_tdone("TLS_x_rsc_29_0_s_tdone")
    , TLS_x_rsc_29_0_tr_write_done("TLS_x_rsc_29_0_tr_write_done")
    , TLS_x_rsc_29_0_RREADY("TLS_x_rsc_29_0_RREADY")
    , TLS_x_rsc_29_0_RVALID("TLS_x_rsc_29_0_RVALID")
    , TLS_x_rsc_29_0_RUSER("TLS_x_rsc_29_0_RUSER")
    , TLS_x_rsc_29_0_RLAST("TLS_x_rsc_29_0_RLAST")
    , TLS_x_rsc_29_0_RRESP("TLS_x_rsc_29_0_RRESP")
    , TLS_x_rsc_29_0_RDATA("TLS_x_rsc_29_0_RDATA")
    , TLS_x_rsc_29_0_RID("TLS_x_rsc_29_0_RID")
    , TLS_x_rsc_29_0_ARREADY("TLS_x_rsc_29_0_ARREADY")
    , TLS_x_rsc_29_0_ARVALID("TLS_x_rsc_29_0_ARVALID")
    , TLS_x_rsc_29_0_ARUSER("TLS_x_rsc_29_0_ARUSER")
    , TLS_x_rsc_29_0_ARREGION("TLS_x_rsc_29_0_ARREGION")
    , TLS_x_rsc_29_0_ARQOS("TLS_x_rsc_29_0_ARQOS")
    , TLS_x_rsc_29_0_ARPROT("TLS_x_rsc_29_0_ARPROT")
    , TLS_x_rsc_29_0_ARCACHE("TLS_x_rsc_29_0_ARCACHE")
    , TLS_x_rsc_29_0_ARLOCK("TLS_x_rsc_29_0_ARLOCK")
    , TLS_x_rsc_29_0_ARBURST("TLS_x_rsc_29_0_ARBURST")
    , TLS_x_rsc_29_0_ARSIZE("TLS_x_rsc_29_0_ARSIZE")
    , TLS_x_rsc_29_0_ARLEN("TLS_x_rsc_29_0_ARLEN")
    , TLS_x_rsc_29_0_ARADDR("TLS_x_rsc_29_0_ARADDR")
    , TLS_x_rsc_29_0_ARID("TLS_x_rsc_29_0_ARID")
    , TLS_x_rsc_29_0_BREADY("TLS_x_rsc_29_0_BREADY")
    , TLS_x_rsc_29_0_BVALID("TLS_x_rsc_29_0_BVALID")
    , TLS_x_rsc_29_0_BUSER("TLS_x_rsc_29_0_BUSER")
    , TLS_x_rsc_29_0_BRESP("TLS_x_rsc_29_0_BRESP")
    , TLS_x_rsc_29_0_BID("TLS_x_rsc_29_0_BID")
    , TLS_x_rsc_29_0_WREADY("TLS_x_rsc_29_0_WREADY")
    , TLS_x_rsc_29_0_WVALID("TLS_x_rsc_29_0_WVALID")
    , TLS_x_rsc_29_0_WUSER("TLS_x_rsc_29_0_WUSER")
    , TLS_x_rsc_29_0_WLAST("TLS_x_rsc_29_0_WLAST")
    , TLS_x_rsc_29_0_WSTRB("TLS_x_rsc_29_0_WSTRB")
    , TLS_x_rsc_29_0_WDATA("TLS_x_rsc_29_0_WDATA")
    , TLS_x_rsc_29_0_AWREADY("TLS_x_rsc_29_0_AWREADY")
    , TLS_x_rsc_29_0_AWVALID("TLS_x_rsc_29_0_AWVALID")
    , TLS_x_rsc_29_0_AWUSER("TLS_x_rsc_29_0_AWUSER")
    , TLS_x_rsc_29_0_AWREGION("TLS_x_rsc_29_0_AWREGION")
    , TLS_x_rsc_29_0_AWQOS("TLS_x_rsc_29_0_AWQOS")
    , TLS_x_rsc_29_0_AWPROT("TLS_x_rsc_29_0_AWPROT")
    , TLS_x_rsc_29_0_AWCACHE("TLS_x_rsc_29_0_AWCACHE")
    , TLS_x_rsc_29_0_AWLOCK("TLS_x_rsc_29_0_AWLOCK")
    , TLS_x_rsc_29_0_AWBURST("TLS_x_rsc_29_0_AWBURST")
    , TLS_x_rsc_29_0_AWSIZE("TLS_x_rsc_29_0_AWSIZE")
    , TLS_x_rsc_29_0_AWLEN("TLS_x_rsc_29_0_AWLEN")
    , TLS_x_rsc_29_0_AWADDR("TLS_x_rsc_29_0_AWADDR")
    , TLS_x_rsc_29_0_AWID("TLS_x_rsc_29_0_AWID")
    , TLS_x_rsc_triosy_29_0_lz("TLS_x_rsc_triosy_29_0_lz")
    , TLS_x_rsc_30_0_s_tdone("TLS_x_rsc_30_0_s_tdone")
    , TLS_x_rsc_30_0_tr_write_done("TLS_x_rsc_30_0_tr_write_done")
    , TLS_x_rsc_30_0_RREADY("TLS_x_rsc_30_0_RREADY")
    , TLS_x_rsc_30_0_RVALID("TLS_x_rsc_30_0_RVALID")
    , TLS_x_rsc_30_0_RUSER("TLS_x_rsc_30_0_RUSER")
    , TLS_x_rsc_30_0_RLAST("TLS_x_rsc_30_0_RLAST")
    , TLS_x_rsc_30_0_RRESP("TLS_x_rsc_30_0_RRESP")
    , TLS_x_rsc_30_0_RDATA("TLS_x_rsc_30_0_RDATA")
    , TLS_x_rsc_30_0_RID("TLS_x_rsc_30_0_RID")
    , TLS_x_rsc_30_0_ARREADY("TLS_x_rsc_30_0_ARREADY")
    , TLS_x_rsc_30_0_ARVALID("TLS_x_rsc_30_0_ARVALID")
    , TLS_x_rsc_30_0_ARUSER("TLS_x_rsc_30_0_ARUSER")
    , TLS_x_rsc_30_0_ARREGION("TLS_x_rsc_30_0_ARREGION")
    , TLS_x_rsc_30_0_ARQOS("TLS_x_rsc_30_0_ARQOS")
    , TLS_x_rsc_30_0_ARPROT("TLS_x_rsc_30_0_ARPROT")
    , TLS_x_rsc_30_0_ARCACHE("TLS_x_rsc_30_0_ARCACHE")
    , TLS_x_rsc_30_0_ARLOCK("TLS_x_rsc_30_0_ARLOCK")
    , TLS_x_rsc_30_0_ARBURST("TLS_x_rsc_30_0_ARBURST")
    , TLS_x_rsc_30_0_ARSIZE("TLS_x_rsc_30_0_ARSIZE")
    , TLS_x_rsc_30_0_ARLEN("TLS_x_rsc_30_0_ARLEN")
    , TLS_x_rsc_30_0_ARADDR("TLS_x_rsc_30_0_ARADDR")
    , TLS_x_rsc_30_0_ARID("TLS_x_rsc_30_0_ARID")
    , TLS_x_rsc_30_0_BREADY("TLS_x_rsc_30_0_BREADY")
    , TLS_x_rsc_30_0_BVALID("TLS_x_rsc_30_0_BVALID")
    , TLS_x_rsc_30_0_BUSER("TLS_x_rsc_30_0_BUSER")
    , TLS_x_rsc_30_0_BRESP("TLS_x_rsc_30_0_BRESP")
    , TLS_x_rsc_30_0_BID("TLS_x_rsc_30_0_BID")
    , TLS_x_rsc_30_0_WREADY("TLS_x_rsc_30_0_WREADY")
    , TLS_x_rsc_30_0_WVALID("TLS_x_rsc_30_0_WVALID")
    , TLS_x_rsc_30_0_WUSER("TLS_x_rsc_30_0_WUSER")
    , TLS_x_rsc_30_0_WLAST("TLS_x_rsc_30_0_WLAST")
    , TLS_x_rsc_30_0_WSTRB("TLS_x_rsc_30_0_WSTRB")
    , TLS_x_rsc_30_0_WDATA("TLS_x_rsc_30_0_WDATA")
    , TLS_x_rsc_30_0_AWREADY("TLS_x_rsc_30_0_AWREADY")
    , TLS_x_rsc_30_0_AWVALID("TLS_x_rsc_30_0_AWVALID")
    , TLS_x_rsc_30_0_AWUSER("TLS_x_rsc_30_0_AWUSER")
    , TLS_x_rsc_30_0_AWREGION("TLS_x_rsc_30_0_AWREGION")
    , TLS_x_rsc_30_0_AWQOS("TLS_x_rsc_30_0_AWQOS")
    , TLS_x_rsc_30_0_AWPROT("TLS_x_rsc_30_0_AWPROT")
    , TLS_x_rsc_30_0_AWCACHE("TLS_x_rsc_30_0_AWCACHE")
    , TLS_x_rsc_30_0_AWLOCK("TLS_x_rsc_30_0_AWLOCK")
    , TLS_x_rsc_30_0_AWBURST("TLS_x_rsc_30_0_AWBURST")
    , TLS_x_rsc_30_0_AWSIZE("TLS_x_rsc_30_0_AWSIZE")
    , TLS_x_rsc_30_0_AWLEN("TLS_x_rsc_30_0_AWLEN")
    , TLS_x_rsc_30_0_AWADDR("TLS_x_rsc_30_0_AWADDR")
    , TLS_x_rsc_30_0_AWID("TLS_x_rsc_30_0_AWID")
    , TLS_x_rsc_triosy_30_0_lz("TLS_x_rsc_triosy_30_0_lz")
    , TLS_x_rsc_31_0_s_tdone("TLS_x_rsc_31_0_s_tdone")
    , TLS_x_rsc_31_0_tr_write_done("TLS_x_rsc_31_0_tr_write_done")
    , TLS_x_rsc_31_0_RREADY("TLS_x_rsc_31_0_RREADY")
    , TLS_x_rsc_31_0_RVALID("TLS_x_rsc_31_0_RVALID")
    , TLS_x_rsc_31_0_RUSER("TLS_x_rsc_31_0_RUSER")
    , TLS_x_rsc_31_0_RLAST("TLS_x_rsc_31_0_RLAST")
    , TLS_x_rsc_31_0_RRESP("TLS_x_rsc_31_0_RRESP")
    , TLS_x_rsc_31_0_RDATA("TLS_x_rsc_31_0_RDATA")
    , TLS_x_rsc_31_0_RID("TLS_x_rsc_31_0_RID")
    , TLS_x_rsc_31_0_ARREADY("TLS_x_rsc_31_0_ARREADY")
    , TLS_x_rsc_31_0_ARVALID("TLS_x_rsc_31_0_ARVALID")
    , TLS_x_rsc_31_0_ARUSER("TLS_x_rsc_31_0_ARUSER")
    , TLS_x_rsc_31_0_ARREGION("TLS_x_rsc_31_0_ARREGION")
    , TLS_x_rsc_31_0_ARQOS("TLS_x_rsc_31_0_ARQOS")
    , TLS_x_rsc_31_0_ARPROT("TLS_x_rsc_31_0_ARPROT")
    , TLS_x_rsc_31_0_ARCACHE("TLS_x_rsc_31_0_ARCACHE")
    , TLS_x_rsc_31_0_ARLOCK("TLS_x_rsc_31_0_ARLOCK")
    , TLS_x_rsc_31_0_ARBURST("TLS_x_rsc_31_0_ARBURST")
    , TLS_x_rsc_31_0_ARSIZE("TLS_x_rsc_31_0_ARSIZE")
    , TLS_x_rsc_31_0_ARLEN("TLS_x_rsc_31_0_ARLEN")
    , TLS_x_rsc_31_0_ARADDR("TLS_x_rsc_31_0_ARADDR")
    , TLS_x_rsc_31_0_ARID("TLS_x_rsc_31_0_ARID")
    , TLS_x_rsc_31_0_BREADY("TLS_x_rsc_31_0_BREADY")
    , TLS_x_rsc_31_0_BVALID("TLS_x_rsc_31_0_BVALID")
    , TLS_x_rsc_31_0_BUSER("TLS_x_rsc_31_0_BUSER")
    , TLS_x_rsc_31_0_BRESP("TLS_x_rsc_31_0_BRESP")
    , TLS_x_rsc_31_0_BID("TLS_x_rsc_31_0_BID")
    , TLS_x_rsc_31_0_WREADY("TLS_x_rsc_31_0_WREADY")
    , TLS_x_rsc_31_0_WVALID("TLS_x_rsc_31_0_WVALID")
    , TLS_x_rsc_31_0_WUSER("TLS_x_rsc_31_0_WUSER")
    , TLS_x_rsc_31_0_WLAST("TLS_x_rsc_31_0_WLAST")
    , TLS_x_rsc_31_0_WSTRB("TLS_x_rsc_31_0_WSTRB")
    , TLS_x_rsc_31_0_WDATA("TLS_x_rsc_31_0_WDATA")
    , TLS_x_rsc_31_0_AWREADY("TLS_x_rsc_31_0_AWREADY")
    , TLS_x_rsc_31_0_AWVALID("TLS_x_rsc_31_0_AWVALID")
    , TLS_x_rsc_31_0_AWUSER("TLS_x_rsc_31_0_AWUSER")
    , TLS_x_rsc_31_0_AWREGION("TLS_x_rsc_31_0_AWREGION")
    , TLS_x_rsc_31_0_AWQOS("TLS_x_rsc_31_0_AWQOS")
    , TLS_x_rsc_31_0_AWPROT("TLS_x_rsc_31_0_AWPROT")
    , TLS_x_rsc_31_0_AWCACHE("TLS_x_rsc_31_0_AWCACHE")
    , TLS_x_rsc_31_0_AWLOCK("TLS_x_rsc_31_0_AWLOCK")
    , TLS_x_rsc_31_0_AWBURST("TLS_x_rsc_31_0_AWBURST")
    , TLS_x_rsc_31_0_AWSIZE("TLS_x_rsc_31_0_AWSIZE")
    , TLS_x_rsc_31_0_AWLEN("TLS_x_rsc_31_0_AWLEN")
    , TLS_x_rsc_31_0_AWADDR("TLS_x_rsc_31_0_AWADDR")
    , TLS_x_rsc_31_0_AWID("TLS_x_rsc_31_0_AWID")
    , TLS_x_rsc_triosy_31_0_lz("TLS_x_rsc_triosy_31_0_lz")
    , TLS_m_rsc_dat("TLS_m_rsc_dat")
    , TLS_m_rsc_triosy_lz("TLS_m_rsc_triosy_lz")
    , TLS_twiddle_rsc_adrb("TLS_twiddle_rsc_adrb")
    , TLS_twiddle_rsc_qb("TLS_twiddle_rsc_qb")
    , TLS_twiddle_rsc_triosy_lz("TLS_twiddle_rsc_triosy_lz")
    , TLS_twiddle_h_rsc_adrb("TLS_twiddle_h_rsc_adrb")
    , TLS_twiddle_h_rsc_qb("TLS_twiddle_h_rsc_qb")
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
    , CCS_ADAPTOR_TLS_x_rsc_0_0_AWID("CCS_ADAPTOR_TLS_x_rsc_0_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_0_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_0_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_0_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_0_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_0_0_ARID("CCS_ADAPTOR_TLS_x_rsc_0_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_0_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_0_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RUSER")
    , x_rsc_0__0__INST("x_rsc_0__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_1_0_AWID("CCS_ADAPTOR_TLS_x_rsc_1_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_1_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_1_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_1_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_1_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_1_0_ARID("CCS_ADAPTOR_TLS_x_rsc_1_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_1_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_1_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RUSER")
    , x_rsc_1__0__INST("x_rsc_1__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_2_0_AWID("CCS_ADAPTOR_TLS_x_rsc_2_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_2_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_2_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_2_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_2_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_2_0_ARID("CCS_ADAPTOR_TLS_x_rsc_2_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_2_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_2_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RUSER")
    , x_rsc_2__0__INST("x_rsc_2__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_3_0_AWID("CCS_ADAPTOR_TLS_x_rsc_3_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_3_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_3_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_3_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_3_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_3_0_ARID("CCS_ADAPTOR_TLS_x_rsc_3_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_3_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_3_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RUSER")
    , x_rsc_3__0__INST("x_rsc_3__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_4_0_AWID("CCS_ADAPTOR_TLS_x_rsc_4_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_4_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_4_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_4_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_4_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_4_0_ARID("CCS_ADAPTOR_TLS_x_rsc_4_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_4_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_4_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RUSER")
    , x_rsc_4__0__INST("x_rsc_4__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_5_0_AWID("CCS_ADAPTOR_TLS_x_rsc_5_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_5_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_5_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_5_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_5_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_5_0_ARID("CCS_ADAPTOR_TLS_x_rsc_5_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_5_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_5_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RUSER")
    , x_rsc_5__0__INST("x_rsc_5__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_6_0_AWID("CCS_ADAPTOR_TLS_x_rsc_6_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_6_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_6_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_6_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_6_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_6_0_ARID("CCS_ADAPTOR_TLS_x_rsc_6_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_6_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_6_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RUSER")
    , x_rsc_6__0__INST("x_rsc_6__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_7_0_AWID("CCS_ADAPTOR_TLS_x_rsc_7_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_7_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_7_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_7_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_7_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_7_0_ARID("CCS_ADAPTOR_TLS_x_rsc_7_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_7_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_7_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RUSER")
    , x_rsc_7__0__INST("x_rsc_7__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_8_0_AWID("CCS_ADAPTOR_TLS_x_rsc_8_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_8_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_8_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_8_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_8_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_8_0_ARID("CCS_ADAPTOR_TLS_x_rsc_8_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_8_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_8_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RUSER")
    , x_rsc_8__0__INST("x_rsc_8__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_9_0_AWID("CCS_ADAPTOR_TLS_x_rsc_9_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_9_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_9_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_9_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_9_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_9_0_ARID("CCS_ADAPTOR_TLS_x_rsc_9_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_9_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_9_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RUSER")
    , x_rsc_9__0__INST("x_rsc_9__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_10_0_AWID("CCS_ADAPTOR_TLS_x_rsc_10_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_10_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_10_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_10_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_10_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_10_0_ARID("CCS_ADAPTOR_TLS_x_rsc_10_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_10_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_10_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RUSER")
    , x_rsc_10__0__INST("x_rsc_10__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_11_0_AWID("CCS_ADAPTOR_TLS_x_rsc_11_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_11_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_11_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_11_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_11_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_11_0_ARID("CCS_ADAPTOR_TLS_x_rsc_11_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_11_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_11_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RUSER")
    , x_rsc_11__0__INST("x_rsc_11__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_12_0_AWID("CCS_ADAPTOR_TLS_x_rsc_12_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_12_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_12_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_12_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_12_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_12_0_ARID("CCS_ADAPTOR_TLS_x_rsc_12_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_12_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_12_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RUSER")
    , x_rsc_12__0__INST("x_rsc_12__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_13_0_AWID("CCS_ADAPTOR_TLS_x_rsc_13_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_13_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_13_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_13_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_13_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_13_0_ARID("CCS_ADAPTOR_TLS_x_rsc_13_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_13_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_13_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RUSER")
    , x_rsc_13__0__INST("x_rsc_13__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_14_0_AWID("CCS_ADAPTOR_TLS_x_rsc_14_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_14_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_14_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_14_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_14_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_14_0_ARID("CCS_ADAPTOR_TLS_x_rsc_14_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_14_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_14_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RUSER")
    , x_rsc_14__0__INST("x_rsc_14__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_15_0_AWID("CCS_ADAPTOR_TLS_x_rsc_15_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_15_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_15_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_15_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_15_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_15_0_ARID("CCS_ADAPTOR_TLS_x_rsc_15_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_15_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_15_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RUSER")
    , x_rsc_15__0__INST("x_rsc_15__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_16_0_AWID("CCS_ADAPTOR_TLS_x_rsc_16_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_16_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_16_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_16_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_16_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_16_0_ARID("CCS_ADAPTOR_TLS_x_rsc_16_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_16_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_16_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RUSER")
    , x_rsc_16__0__INST("x_rsc_16__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_17_0_AWID("CCS_ADAPTOR_TLS_x_rsc_17_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_17_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_17_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_17_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_17_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_17_0_ARID("CCS_ADAPTOR_TLS_x_rsc_17_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_17_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_17_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RUSER")
    , x_rsc_17__0__INST("x_rsc_17__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_18_0_AWID("CCS_ADAPTOR_TLS_x_rsc_18_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_18_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_18_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_18_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_18_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_18_0_ARID("CCS_ADAPTOR_TLS_x_rsc_18_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_18_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_18_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RUSER")
    , x_rsc_18__0__INST("x_rsc_18__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_19_0_AWID("CCS_ADAPTOR_TLS_x_rsc_19_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_19_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_19_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_19_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_19_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_19_0_ARID("CCS_ADAPTOR_TLS_x_rsc_19_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_19_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_19_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RUSER")
    , x_rsc_19__0__INST("x_rsc_19__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_20_0_AWID("CCS_ADAPTOR_TLS_x_rsc_20_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_20_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_20_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_20_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_20_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_20_0_ARID("CCS_ADAPTOR_TLS_x_rsc_20_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_20_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_20_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RUSER")
    , x_rsc_20__0__INST("x_rsc_20__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_21_0_AWID("CCS_ADAPTOR_TLS_x_rsc_21_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_21_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_21_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_21_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_21_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_21_0_ARID("CCS_ADAPTOR_TLS_x_rsc_21_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_21_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_21_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RUSER")
    , x_rsc_21__0__INST("x_rsc_21__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_22_0_AWID("CCS_ADAPTOR_TLS_x_rsc_22_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_22_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_22_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_22_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_22_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_22_0_ARID("CCS_ADAPTOR_TLS_x_rsc_22_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_22_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_22_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RUSER")
    , x_rsc_22__0__INST("x_rsc_22__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_23_0_AWID("CCS_ADAPTOR_TLS_x_rsc_23_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_23_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_23_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_23_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_23_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_23_0_ARID("CCS_ADAPTOR_TLS_x_rsc_23_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_23_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_23_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RUSER")
    , x_rsc_23__0__INST("x_rsc_23__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_24_0_AWID("CCS_ADAPTOR_TLS_x_rsc_24_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_24_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_24_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_24_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_24_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_24_0_ARID("CCS_ADAPTOR_TLS_x_rsc_24_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_24_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_24_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RUSER")
    , x_rsc_24__0__INST("x_rsc_24__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_25_0_AWID("CCS_ADAPTOR_TLS_x_rsc_25_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_25_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_25_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_25_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_25_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_25_0_ARID("CCS_ADAPTOR_TLS_x_rsc_25_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_25_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_25_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RUSER")
    , x_rsc_25__0__INST("x_rsc_25__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_26_0_AWID("CCS_ADAPTOR_TLS_x_rsc_26_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_26_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_26_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_26_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_26_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_26_0_ARID("CCS_ADAPTOR_TLS_x_rsc_26_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_26_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_26_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RUSER")
    , x_rsc_26__0__INST("x_rsc_26__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_27_0_AWID("CCS_ADAPTOR_TLS_x_rsc_27_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_27_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_27_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_27_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_27_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_27_0_ARID("CCS_ADAPTOR_TLS_x_rsc_27_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_27_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_27_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RUSER")
    , x_rsc_27__0__INST("x_rsc_27__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_28_0_AWID("CCS_ADAPTOR_TLS_x_rsc_28_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_28_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_28_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_28_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_28_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_28_0_ARID("CCS_ADAPTOR_TLS_x_rsc_28_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_28_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_28_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RUSER")
    , x_rsc_28__0__INST("x_rsc_28__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_29_0_AWID("CCS_ADAPTOR_TLS_x_rsc_29_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_29_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_29_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_29_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_29_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_29_0_ARID("CCS_ADAPTOR_TLS_x_rsc_29_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_29_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_29_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RUSER")
    , x_rsc_29__0__INST("x_rsc_29__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_30_0_AWID("CCS_ADAPTOR_TLS_x_rsc_30_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_30_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_30_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_30_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_30_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_30_0_ARID("CCS_ADAPTOR_TLS_x_rsc_30_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_30_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_30_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RUSER")
    , x_rsc_30__0__INST("x_rsc_30__0_", true)
    , CCS_ADAPTOR_TLS_x_rsc_31_0_AWID("CCS_ADAPTOR_TLS_x_rsc_31_0_AWID")
    , CCS_ADAPTOR_TLS_x_rsc_31_0_AWUSER("CCS_ADAPTOR_TLS_x_rsc_31_0_AWUSER")
    , CCS_ADAPTOR_TLS_x_rsc_31_0_WUSER("CCS_ADAPTOR_TLS_x_rsc_31_0_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BUSER")
    , CCS_ADAPTOR_TLS_x_rsc_31_0_ARID("CCS_ADAPTOR_TLS_x_rsc_31_0_ARID")
    , CCS_ADAPTOR_TLS_x_rsc_31_0_ARUSER("CCS_ADAPTOR_TLS_x_rsc_31_0_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RID("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RUSER")
    , x_rsc_31__0__INST("x_rsc_31__0_", true)
    , m_rsc_INST("m_rsc", true)
    , TLS_twiddle_rsc_adra("TLS_twiddle_rsc_adra")
    , TLS_twiddle_rsc_da("TLS_twiddle_rsc_da")
    , TLS_twiddle_rsc_qa("TLS_twiddle_rsc_qa")
    , TLS_twiddle_rsc_wea("TLS_twiddle_rsc_wea")
    , twiddle_rsc_INST("twiddle_rsc", true)
    , TLS_twiddle_h_rsc_adra("TLS_twiddle_h_rsc_adra")
    , TLS_twiddle_h_rsc_da("TLS_twiddle_h_rsc_da")
    , TLS_twiddle_h_rsc_qa("TLS_twiddle_h_rsc_qa")
    , TLS_twiddle_h_rsc_wea("TLS_twiddle_h_rsc_wea")
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
    , trios_monitor_x_rsc_triosy_0_0_lz_INST("trios_monitor_x_rsc_triosy_0_0_lz_INST")
    , trios_monitor_x_rsc_triosy_1_0_lz_INST("trios_monitor_x_rsc_triosy_1_0_lz_INST")
    , trios_monitor_x_rsc_triosy_2_0_lz_INST("trios_monitor_x_rsc_triosy_2_0_lz_INST")
    , trios_monitor_x_rsc_triosy_3_0_lz_INST("trios_monitor_x_rsc_triosy_3_0_lz_INST")
    , trios_monitor_x_rsc_triosy_4_0_lz_INST("trios_monitor_x_rsc_triosy_4_0_lz_INST")
    , trios_monitor_x_rsc_triosy_5_0_lz_INST("trios_monitor_x_rsc_triosy_5_0_lz_INST")
    , trios_monitor_x_rsc_triosy_6_0_lz_INST("trios_monitor_x_rsc_triosy_6_0_lz_INST")
    , trios_monitor_x_rsc_triosy_7_0_lz_INST("trios_monitor_x_rsc_triosy_7_0_lz_INST")
    , trios_monitor_x_rsc_triosy_8_0_lz_INST("trios_monitor_x_rsc_triosy_8_0_lz_INST")
    , trios_monitor_x_rsc_triosy_9_0_lz_INST("trios_monitor_x_rsc_triosy_9_0_lz_INST")
    , trios_monitor_x_rsc_triosy_10_0_lz_INST("trios_monitor_x_rsc_triosy_10_0_lz_INST")
    , trios_monitor_x_rsc_triosy_11_0_lz_INST("trios_monitor_x_rsc_triosy_11_0_lz_INST")
    , trios_monitor_x_rsc_triosy_12_0_lz_INST("trios_monitor_x_rsc_triosy_12_0_lz_INST")
    , trios_monitor_x_rsc_triosy_13_0_lz_INST("trios_monitor_x_rsc_triosy_13_0_lz_INST")
    , trios_monitor_x_rsc_triosy_14_0_lz_INST("trios_monitor_x_rsc_triosy_14_0_lz_INST")
    , trios_monitor_x_rsc_triosy_15_0_lz_INST("trios_monitor_x_rsc_triosy_15_0_lz_INST")
    , trios_monitor_x_rsc_triosy_16_0_lz_INST("trios_monitor_x_rsc_triosy_16_0_lz_INST")
    , trios_monitor_x_rsc_triosy_17_0_lz_INST("trios_monitor_x_rsc_triosy_17_0_lz_INST")
    , trios_monitor_x_rsc_triosy_18_0_lz_INST("trios_monitor_x_rsc_triosy_18_0_lz_INST")
    , trios_monitor_x_rsc_triosy_19_0_lz_INST("trios_monitor_x_rsc_triosy_19_0_lz_INST")
    , trios_monitor_x_rsc_triosy_20_0_lz_INST("trios_monitor_x_rsc_triosy_20_0_lz_INST")
    , trios_monitor_x_rsc_triosy_21_0_lz_INST("trios_monitor_x_rsc_triosy_21_0_lz_INST")
    , trios_monitor_x_rsc_triosy_22_0_lz_INST("trios_monitor_x_rsc_triosy_22_0_lz_INST")
    , trios_monitor_x_rsc_triosy_23_0_lz_INST("trios_monitor_x_rsc_triosy_23_0_lz_INST")
    , trios_monitor_x_rsc_triosy_24_0_lz_INST("trios_monitor_x_rsc_triosy_24_0_lz_INST")
    , trios_monitor_x_rsc_triosy_25_0_lz_INST("trios_monitor_x_rsc_triosy_25_0_lz_INST")
    , trios_monitor_x_rsc_triosy_26_0_lz_INST("trios_monitor_x_rsc_triosy_26_0_lz_INST")
    , trios_monitor_x_rsc_triosy_27_0_lz_INST("trios_monitor_x_rsc_triosy_27_0_lz_INST")
    , trios_monitor_x_rsc_triosy_28_0_lz_INST("trios_monitor_x_rsc_triosy_28_0_lz_INST")
    , trios_monitor_x_rsc_triosy_29_0_lz_INST("trios_monitor_x_rsc_triosy_29_0_lz_INST")
    , trios_monitor_x_rsc_triosy_30_0_lz_INST("trios_monitor_x_rsc_triosy_30_0_lz_INST")
    , trios_monitor_x_rsc_triosy_31_0_lz_INST("trios_monitor_x_rsc_triosy_31_0_lz_INST")
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
    , sync_generator_INST("sync_generator", true, false, false, false, 38538, 38538, 0)
    , catapult_monitor_INST("Monitor", clk, true, 38538LL, 38538LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    hybrid_INST.clk(clk);
    hybrid_INST.rst(TLS_rst);
    hybrid_INST.x_rsc_0_0_s_tdone(TLS_x_rsc_0_0_s_tdone);
    hybrid_INST.x_rsc_0_0_tr_write_done(TLS_x_rsc_0_0_tr_write_done);
    hybrid_INST.x_rsc_0_0_RREADY(TLS_x_rsc_0_0_RREADY);
    hybrid_INST.x_rsc_0_0_RVALID(TLS_x_rsc_0_0_RVALID);
    hybrid_INST.x_rsc_0_0_RUSER(TLS_x_rsc_0_0_RUSER);
    hybrid_INST.x_rsc_0_0_RLAST(TLS_x_rsc_0_0_RLAST);
    hybrid_INST.x_rsc_0_0_RRESP(TLS_x_rsc_0_0_RRESP);
    hybrid_INST.x_rsc_0_0_RDATA(TLS_x_rsc_0_0_RDATA);
    hybrid_INST.x_rsc_0_0_RID(TLS_x_rsc_0_0_RID);
    hybrid_INST.x_rsc_0_0_ARREADY(TLS_x_rsc_0_0_ARREADY);
    hybrid_INST.x_rsc_0_0_ARVALID(TLS_x_rsc_0_0_ARVALID);
    hybrid_INST.x_rsc_0_0_ARUSER(TLS_x_rsc_0_0_ARUSER);
    hybrid_INST.x_rsc_0_0_ARREGION(TLS_x_rsc_0_0_ARREGION);
    hybrid_INST.x_rsc_0_0_ARQOS(TLS_x_rsc_0_0_ARQOS);
    hybrid_INST.x_rsc_0_0_ARPROT(TLS_x_rsc_0_0_ARPROT);
    hybrid_INST.x_rsc_0_0_ARCACHE(TLS_x_rsc_0_0_ARCACHE);
    hybrid_INST.x_rsc_0_0_ARLOCK(TLS_x_rsc_0_0_ARLOCK);
    hybrid_INST.x_rsc_0_0_ARBURST(TLS_x_rsc_0_0_ARBURST);
    hybrid_INST.x_rsc_0_0_ARSIZE(TLS_x_rsc_0_0_ARSIZE);
    hybrid_INST.x_rsc_0_0_ARLEN(TLS_x_rsc_0_0_ARLEN);
    hybrid_INST.x_rsc_0_0_ARADDR(TLS_x_rsc_0_0_ARADDR);
    hybrid_INST.x_rsc_0_0_ARID(TLS_x_rsc_0_0_ARID);
    hybrid_INST.x_rsc_0_0_BREADY(TLS_x_rsc_0_0_BREADY);
    hybrid_INST.x_rsc_0_0_BVALID(TLS_x_rsc_0_0_BVALID);
    hybrid_INST.x_rsc_0_0_BUSER(TLS_x_rsc_0_0_BUSER);
    hybrid_INST.x_rsc_0_0_BRESP(TLS_x_rsc_0_0_BRESP);
    hybrid_INST.x_rsc_0_0_BID(TLS_x_rsc_0_0_BID);
    hybrid_INST.x_rsc_0_0_WREADY(TLS_x_rsc_0_0_WREADY);
    hybrid_INST.x_rsc_0_0_WVALID(TLS_x_rsc_0_0_WVALID);
    hybrid_INST.x_rsc_0_0_WUSER(TLS_x_rsc_0_0_WUSER);
    hybrid_INST.x_rsc_0_0_WLAST(TLS_x_rsc_0_0_WLAST);
    hybrid_INST.x_rsc_0_0_WSTRB(TLS_x_rsc_0_0_WSTRB);
    hybrid_INST.x_rsc_0_0_WDATA(TLS_x_rsc_0_0_WDATA);
    hybrid_INST.x_rsc_0_0_AWREADY(TLS_x_rsc_0_0_AWREADY);
    hybrid_INST.x_rsc_0_0_AWVALID(TLS_x_rsc_0_0_AWVALID);
    hybrid_INST.x_rsc_0_0_AWUSER(TLS_x_rsc_0_0_AWUSER);
    hybrid_INST.x_rsc_0_0_AWREGION(TLS_x_rsc_0_0_AWREGION);
    hybrid_INST.x_rsc_0_0_AWQOS(TLS_x_rsc_0_0_AWQOS);
    hybrid_INST.x_rsc_0_0_AWPROT(TLS_x_rsc_0_0_AWPROT);
    hybrid_INST.x_rsc_0_0_AWCACHE(TLS_x_rsc_0_0_AWCACHE);
    hybrid_INST.x_rsc_0_0_AWLOCK(TLS_x_rsc_0_0_AWLOCK);
    hybrid_INST.x_rsc_0_0_AWBURST(TLS_x_rsc_0_0_AWBURST);
    hybrid_INST.x_rsc_0_0_AWSIZE(TLS_x_rsc_0_0_AWSIZE);
    hybrid_INST.x_rsc_0_0_AWLEN(TLS_x_rsc_0_0_AWLEN);
    hybrid_INST.x_rsc_0_0_AWADDR(TLS_x_rsc_0_0_AWADDR);
    hybrid_INST.x_rsc_0_0_AWID(TLS_x_rsc_0_0_AWID);
    hybrid_INST.x_rsc_triosy_0_0_lz(TLS_x_rsc_triosy_0_0_lz);
    hybrid_INST.x_rsc_1_0_s_tdone(TLS_x_rsc_1_0_s_tdone);
    hybrid_INST.x_rsc_1_0_tr_write_done(TLS_x_rsc_1_0_tr_write_done);
    hybrid_INST.x_rsc_1_0_RREADY(TLS_x_rsc_1_0_RREADY);
    hybrid_INST.x_rsc_1_0_RVALID(TLS_x_rsc_1_0_RVALID);
    hybrid_INST.x_rsc_1_0_RUSER(TLS_x_rsc_1_0_RUSER);
    hybrid_INST.x_rsc_1_0_RLAST(TLS_x_rsc_1_0_RLAST);
    hybrid_INST.x_rsc_1_0_RRESP(TLS_x_rsc_1_0_RRESP);
    hybrid_INST.x_rsc_1_0_RDATA(TLS_x_rsc_1_0_RDATA);
    hybrid_INST.x_rsc_1_0_RID(TLS_x_rsc_1_0_RID);
    hybrid_INST.x_rsc_1_0_ARREADY(TLS_x_rsc_1_0_ARREADY);
    hybrid_INST.x_rsc_1_0_ARVALID(TLS_x_rsc_1_0_ARVALID);
    hybrid_INST.x_rsc_1_0_ARUSER(TLS_x_rsc_1_0_ARUSER);
    hybrid_INST.x_rsc_1_0_ARREGION(TLS_x_rsc_1_0_ARREGION);
    hybrid_INST.x_rsc_1_0_ARQOS(TLS_x_rsc_1_0_ARQOS);
    hybrid_INST.x_rsc_1_0_ARPROT(TLS_x_rsc_1_0_ARPROT);
    hybrid_INST.x_rsc_1_0_ARCACHE(TLS_x_rsc_1_0_ARCACHE);
    hybrid_INST.x_rsc_1_0_ARLOCK(TLS_x_rsc_1_0_ARLOCK);
    hybrid_INST.x_rsc_1_0_ARBURST(TLS_x_rsc_1_0_ARBURST);
    hybrid_INST.x_rsc_1_0_ARSIZE(TLS_x_rsc_1_0_ARSIZE);
    hybrid_INST.x_rsc_1_0_ARLEN(TLS_x_rsc_1_0_ARLEN);
    hybrid_INST.x_rsc_1_0_ARADDR(TLS_x_rsc_1_0_ARADDR);
    hybrid_INST.x_rsc_1_0_ARID(TLS_x_rsc_1_0_ARID);
    hybrid_INST.x_rsc_1_0_BREADY(TLS_x_rsc_1_0_BREADY);
    hybrid_INST.x_rsc_1_0_BVALID(TLS_x_rsc_1_0_BVALID);
    hybrid_INST.x_rsc_1_0_BUSER(TLS_x_rsc_1_0_BUSER);
    hybrid_INST.x_rsc_1_0_BRESP(TLS_x_rsc_1_0_BRESP);
    hybrid_INST.x_rsc_1_0_BID(TLS_x_rsc_1_0_BID);
    hybrid_INST.x_rsc_1_0_WREADY(TLS_x_rsc_1_0_WREADY);
    hybrid_INST.x_rsc_1_0_WVALID(TLS_x_rsc_1_0_WVALID);
    hybrid_INST.x_rsc_1_0_WUSER(TLS_x_rsc_1_0_WUSER);
    hybrid_INST.x_rsc_1_0_WLAST(TLS_x_rsc_1_0_WLAST);
    hybrid_INST.x_rsc_1_0_WSTRB(TLS_x_rsc_1_0_WSTRB);
    hybrid_INST.x_rsc_1_0_WDATA(TLS_x_rsc_1_0_WDATA);
    hybrid_INST.x_rsc_1_0_AWREADY(TLS_x_rsc_1_0_AWREADY);
    hybrid_INST.x_rsc_1_0_AWVALID(TLS_x_rsc_1_0_AWVALID);
    hybrid_INST.x_rsc_1_0_AWUSER(TLS_x_rsc_1_0_AWUSER);
    hybrid_INST.x_rsc_1_0_AWREGION(TLS_x_rsc_1_0_AWREGION);
    hybrid_INST.x_rsc_1_0_AWQOS(TLS_x_rsc_1_0_AWQOS);
    hybrid_INST.x_rsc_1_0_AWPROT(TLS_x_rsc_1_0_AWPROT);
    hybrid_INST.x_rsc_1_0_AWCACHE(TLS_x_rsc_1_0_AWCACHE);
    hybrid_INST.x_rsc_1_0_AWLOCK(TLS_x_rsc_1_0_AWLOCK);
    hybrid_INST.x_rsc_1_0_AWBURST(TLS_x_rsc_1_0_AWBURST);
    hybrid_INST.x_rsc_1_0_AWSIZE(TLS_x_rsc_1_0_AWSIZE);
    hybrid_INST.x_rsc_1_0_AWLEN(TLS_x_rsc_1_0_AWLEN);
    hybrid_INST.x_rsc_1_0_AWADDR(TLS_x_rsc_1_0_AWADDR);
    hybrid_INST.x_rsc_1_0_AWID(TLS_x_rsc_1_0_AWID);
    hybrid_INST.x_rsc_triosy_1_0_lz(TLS_x_rsc_triosy_1_0_lz);
    hybrid_INST.x_rsc_2_0_s_tdone(TLS_x_rsc_2_0_s_tdone);
    hybrid_INST.x_rsc_2_0_tr_write_done(TLS_x_rsc_2_0_tr_write_done);
    hybrid_INST.x_rsc_2_0_RREADY(TLS_x_rsc_2_0_RREADY);
    hybrid_INST.x_rsc_2_0_RVALID(TLS_x_rsc_2_0_RVALID);
    hybrid_INST.x_rsc_2_0_RUSER(TLS_x_rsc_2_0_RUSER);
    hybrid_INST.x_rsc_2_0_RLAST(TLS_x_rsc_2_0_RLAST);
    hybrid_INST.x_rsc_2_0_RRESP(TLS_x_rsc_2_0_RRESP);
    hybrid_INST.x_rsc_2_0_RDATA(TLS_x_rsc_2_0_RDATA);
    hybrid_INST.x_rsc_2_0_RID(TLS_x_rsc_2_0_RID);
    hybrid_INST.x_rsc_2_0_ARREADY(TLS_x_rsc_2_0_ARREADY);
    hybrid_INST.x_rsc_2_0_ARVALID(TLS_x_rsc_2_0_ARVALID);
    hybrid_INST.x_rsc_2_0_ARUSER(TLS_x_rsc_2_0_ARUSER);
    hybrid_INST.x_rsc_2_0_ARREGION(TLS_x_rsc_2_0_ARREGION);
    hybrid_INST.x_rsc_2_0_ARQOS(TLS_x_rsc_2_0_ARQOS);
    hybrid_INST.x_rsc_2_0_ARPROT(TLS_x_rsc_2_0_ARPROT);
    hybrid_INST.x_rsc_2_0_ARCACHE(TLS_x_rsc_2_0_ARCACHE);
    hybrid_INST.x_rsc_2_0_ARLOCK(TLS_x_rsc_2_0_ARLOCK);
    hybrid_INST.x_rsc_2_0_ARBURST(TLS_x_rsc_2_0_ARBURST);
    hybrid_INST.x_rsc_2_0_ARSIZE(TLS_x_rsc_2_0_ARSIZE);
    hybrid_INST.x_rsc_2_0_ARLEN(TLS_x_rsc_2_0_ARLEN);
    hybrid_INST.x_rsc_2_0_ARADDR(TLS_x_rsc_2_0_ARADDR);
    hybrid_INST.x_rsc_2_0_ARID(TLS_x_rsc_2_0_ARID);
    hybrid_INST.x_rsc_2_0_BREADY(TLS_x_rsc_2_0_BREADY);
    hybrid_INST.x_rsc_2_0_BVALID(TLS_x_rsc_2_0_BVALID);
    hybrid_INST.x_rsc_2_0_BUSER(TLS_x_rsc_2_0_BUSER);
    hybrid_INST.x_rsc_2_0_BRESP(TLS_x_rsc_2_0_BRESP);
    hybrid_INST.x_rsc_2_0_BID(TLS_x_rsc_2_0_BID);
    hybrid_INST.x_rsc_2_0_WREADY(TLS_x_rsc_2_0_WREADY);
    hybrid_INST.x_rsc_2_0_WVALID(TLS_x_rsc_2_0_WVALID);
    hybrid_INST.x_rsc_2_0_WUSER(TLS_x_rsc_2_0_WUSER);
    hybrid_INST.x_rsc_2_0_WLAST(TLS_x_rsc_2_0_WLAST);
    hybrid_INST.x_rsc_2_0_WSTRB(TLS_x_rsc_2_0_WSTRB);
    hybrid_INST.x_rsc_2_0_WDATA(TLS_x_rsc_2_0_WDATA);
    hybrid_INST.x_rsc_2_0_AWREADY(TLS_x_rsc_2_0_AWREADY);
    hybrid_INST.x_rsc_2_0_AWVALID(TLS_x_rsc_2_0_AWVALID);
    hybrid_INST.x_rsc_2_0_AWUSER(TLS_x_rsc_2_0_AWUSER);
    hybrid_INST.x_rsc_2_0_AWREGION(TLS_x_rsc_2_0_AWREGION);
    hybrid_INST.x_rsc_2_0_AWQOS(TLS_x_rsc_2_0_AWQOS);
    hybrid_INST.x_rsc_2_0_AWPROT(TLS_x_rsc_2_0_AWPROT);
    hybrid_INST.x_rsc_2_0_AWCACHE(TLS_x_rsc_2_0_AWCACHE);
    hybrid_INST.x_rsc_2_0_AWLOCK(TLS_x_rsc_2_0_AWLOCK);
    hybrid_INST.x_rsc_2_0_AWBURST(TLS_x_rsc_2_0_AWBURST);
    hybrid_INST.x_rsc_2_0_AWSIZE(TLS_x_rsc_2_0_AWSIZE);
    hybrid_INST.x_rsc_2_0_AWLEN(TLS_x_rsc_2_0_AWLEN);
    hybrid_INST.x_rsc_2_0_AWADDR(TLS_x_rsc_2_0_AWADDR);
    hybrid_INST.x_rsc_2_0_AWID(TLS_x_rsc_2_0_AWID);
    hybrid_INST.x_rsc_triosy_2_0_lz(TLS_x_rsc_triosy_2_0_lz);
    hybrid_INST.x_rsc_3_0_s_tdone(TLS_x_rsc_3_0_s_tdone);
    hybrid_INST.x_rsc_3_0_tr_write_done(TLS_x_rsc_3_0_tr_write_done);
    hybrid_INST.x_rsc_3_0_RREADY(TLS_x_rsc_3_0_RREADY);
    hybrid_INST.x_rsc_3_0_RVALID(TLS_x_rsc_3_0_RVALID);
    hybrid_INST.x_rsc_3_0_RUSER(TLS_x_rsc_3_0_RUSER);
    hybrid_INST.x_rsc_3_0_RLAST(TLS_x_rsc_3_0_RLAST);
    hybrid_INST.x_rsc_3_0_RRESP(TLS_x_rsc_3_0_RRESP);
    hybrid_INST.x_rsc_3_0_RDATA(TLS_x_rsc_3_0_RDATA);
    hybrid_INST.x_rsc_3_0_RID(TLS_x_rsc_3_0_RID);
    hybrid_INST.x_rsc_3_0_ARREADY(TLS_x_rsc_3_0_ARREADY);
    hybrid_INST.x_rsc_3_0_ARVALID(TLS_x_rsc_3_0_ARVALID);
    hybrid_INST.x_rsc_3_0_ARUSER(TLS_x_rsc_3_0_ARUSER);
    hybrid_INST.x_rsc_3_0_ARREGION(TLS_x_rsc_3_0_ARREGION);
    hybrid_INST.x_rsc_3_0_ARQOS(TLS_x_rsc_3_0_ARQOS);
    hybrid_INST.x_rsc_3_0_ARPROT(TLS_x_rsc_3_0_ARPROT);
    hybrid_INST.x_rsc_3_0_ARCACHE(TLS_x_rsc_3_0_ARCACHE);
    hybrid_INST.x_rsc_3_0_ARLOCK(TLS_x_rsc_3_0_ARLOCK);
    hybrid_INST.x_rsc_3_0_ARBURST(TLS_x_rsc_3_0_ARBURST);
    hybrid_INST.x_rsc_3_0_ARSIZE(TLS_x_rsc_3_0_ARSIZE);
    hybrid_INST.x_rsc_3_0_ARLEN(TLS_x_rsc_3_0_ARLEN);
    hybrid_INST.x_rsc_3_0_ARADDR(TLS_x_rsc_3_0_ARADDR);
    hybrid_INST.x_rsc_3_0_ARID(TLS_x_rsc_3_0_ARID);
    hybrid_INST.x_rsc_3_0_BREADY(TLS_x_rsc_3_0_BREADY);
    hybrid_INST.x_rsc_3_0_BVALID(TLS_x_rsc_3_0_BVALID);
    hybrid_INST.x_rsc_3_0_BUSER(TLS_x_rsc_3_0_BUSER);
    hybrid_INST.x_rsc_3_0_BRESP(TLS_x_rsc_3_0_BRESP);
    hybrid_INST.x_rsc_3_0_BID(TLS_x_rsc_3_0_BID);
    hybrid_INST.x_rsc_3_0_WREADY(TLS_x_rsc_3_0_WREADY);
    hybrid_INST.x_rsc_3_0_WVALID(TLS_x_rsc_3_0_WVALID);
    hybrid_INST.x_rsc_3_0_WUSER(TLS_x_rsc_3_0_WUSER);
    hybrid_INST.x_rsc_3_0_WLAST(TLS_x_rsc_3_0_WLAST);
    hybrid_INST.x_rsc_3_0_WSTRB(TLS_x_rsc_3_0_WSTRB);
    hybrid_INST.x_rsc_3_0_WDATA(TLS_x_rsc_3_0_WDATA);
    hybrid_INST.x_rsc_3_0_AWREADY(TLS_x_rsc_3_0_AWREADY);
    hybrid_INST.x_rsc_3_0_AWVALID(TLS_x_rsc_3_0_AWVALID);
    hybrid_INST.x_rsc_3_0_AWUSER(TLS_x_rsc_3_0_AWUSER);
    hybrid_INST.x_rsc_3_0_AWREGION(TLS_x_rsc_3_0_AWREGION);
    hybrid_INST.x_rsc_3_0_AWQOS(TLS_x_rsc_3_0_AWQOS);
    hybrid_INST.x_rsc_3_0_AWPROT(TLS_x_rsc_3_0_AWPROT);
    hybrid_INST.x_rsc_3_0_AWCACHE(TLS_x_rsc_3_0_AWCACHE);
    hybrid_INST.x_rsc_3_0_AWLOCK(TLS_x_rsc_3_0_AWLOCK);
    hybrid_INST.x_rsc_3_0_AWBURST(TLS_x_rsc_3_0_AWBURST);
    hybrid_INST.x_rsc_3_0_AWSIZE(TLS_x_rsc_3_0_AWSIZE);
    hybrid_INST.x_rsc_3_0_AWLEN(TLS_x_rsc_3_0_AWLEN);
    hybrid_INST.x_rsc_3_0_AWADDR(TLS_x_rsc_3_0_AWADDR);
    hybrid_INST.x_rsc_3_0_AWID(TLS_x_rsc_3_0_AWID);
    hybrid_INST.x_rsc_triosy_3_0_lz(TLS_x_rsc_triosy_3_0_lz);
    hybrid_INST.x_rsc_4_0_s_tdone(TLS_x_rsc_4_0_s_tdone);
    hybrid_INST.x_rsc_4_0_tr_write_done(TLS_x_rsc_4_0_tr_write_done);
    hybrid_INST.x_rsc_4_0_RREADY(TLS_x_rsc_4_0_RREADY);
    hybrid_INST.x_rsc_4_0_RVALID(TLS_x_rsc_4_0_RVALID);
    hybrid_INST.x_rsc_4_0_RUSER(TLS_x_rsc_4_0_RUSER);
    hybrid_INST.x_rsc_4_0_RLAST(TLS_x_rsc_4_0_RLAST);
    hybrid_INST.x_rsc_4_0_RRESP(TLS_x_rsc_4_0_RRESP);
    hybrid_INST.x_rsc_4_0_RDATA(TLS_x_rsc_4_0_RDATA);
    hybrid_INST.x_rsc_4_0_RID(TLS_x_rsc_4_0_RID);
    hybrid_INST.x_rsc_4_0_ARREADY(TLS_x_rsc_4_0_ARREADY);
    hybrid_INST.x_rsc_4_0_ARVALID(TLS_x_rsc_4_0_ARVALID);
    hybrid_INST.x_rsc_4_0_ARUSER(TLS_x_rsc_4_0_ARUSER);
    hybrid_INST.x_rsc_4_0_ARREGION(TLS_x_rsc_4_0_ARREGION);
    hybrid_INST.x_rsc_4_0_ARQOS(TLS_x_rsc_4_0_ARQOS);
    hybrid_INST.x_rsc_4_0_ARPROT(TLS_x_rsc_4_0_ARPROT);
    hybrid_INST.x_rsc_4_0_ARCACHE(TLS_x_rsc_4_0_ARCACHE);
    hybrid_INST.x_rsc_4_0_ARLOCK(TLS_x_rsc_4_0_ARLOCK);
    hybrid_INST.x_rsc_4_0_ARBURST(TLS_x_rsc_4_0_ARBURST);
    hybrid_INST.x_rsc_4_0_ARSIZE(TLS_x_rsc_4_0_ARSIZE);
    hybrid_INST.x_rsc_4_0_ARLEN(TLS_x_rsc_4_0_ARLEN);
    hybrid_INST.x_rsc_4_0_ARADDR(TLS_x_rsc_4_0_ARADDR);
    hybrid_INST.x_rsc_4_0_ARID(TLS_x_rsc_4_0_ARID);
    hybrid_INST.x_rsc_4_0_BREADY(TLS_x_rsc_4_0_BREADY);
    hybrid_INST.x_rsc_4_0_BVALID(TLS_x_rsc_4_0_BVALID);
    hybrid_INST.x_rsc_4_0_BUSER(TLS_x_rsc_4_0_BUSER);
    hybrid_INST.x_rsc_4_0_BRESP(TLS_x_rsc_4_0_BRESP);
    hybrid_INST.x_rsc_4_0_BID(TLS_x_rsc_4_0_BID);
    hybrid_INST.x_rsc_4_0_WREADY(TLS_x_rsc_4_0_WREADY);
    hybrid_INST.x_rsc_4_0_WVALID(TLS_x_rsc_4_0_WVALID);
    hybrid_INST.x_rsc_4_0_WUSER(TLS_x_rsc_4_0_WUSER);
    hybrid_INST.x_rsc_4_0_WLAST(TLS_x_rsc_4_0_WLAST);
    hybrid_INST.x_rsc_4_0_WSTRB(TLS_x_rsc_4_0_WSTRB);
    hybrid_INST.x_rsc_4_0_WDATA(TLS_x_rsc_4_0_WDATA);
    hybrid_INST.x_rsc_4_0_AWREADY(TLS_x_rsc_4_0_AWREADY);
    hybrid_INST.x_rsc_4_0_AWVALID(TLS_x_rsc_4_0_AWVALID);
    hybrid_INST.x_rsc_4_0_AWUSER(TLS_x_rsc_4_0_AWUSER);
    hybrid_INST.x_rsc_4_0_AWREGION(TLS_x_rsc_4_0_AWREGION);
    hybrid_INST.x_rsc_4_0_AWQOS(TLS_x_rsc_4_0_AWQOS);
    hybrid_INST.x_rsc_4_0_AWPROT(TLS_x_rsc_4_0_AWPROT);
    hybrid_INST.x_rsc_4_0_AWCACHE(TLS_x_rsc_4_0_AWCACHE);
    hybrid_INST.x_rsc_4_0_AWLOCK(TLS_x_rsc_4_0_AWLOCK);
    hybrid_INST.x_rsc_4_0_AWBURST(TLS_x_rsc_4_0_AWBURST);
    hybrid_INST.x_rsc_4_0_AWSIZE(TLS_x_rsc_4_0_AWSIZE);
    hybrid_INST.x_rsc_4_0_AWLEN(TLS_x_rsc_4_0_AWLEN);
    hybrid_INST.x_rsc_4_0_AWADDR(TLS_x_rsc_4_0_AWADDR);
    hybrid_INST.x_rsc_4_0_AWID(TLS_x_rsc_4_0_AWID);
    hybrid_INST.x_rsc_triosy_4_0_lz(TLS_x_rsc_triosy_4_0_lz);
    hybrid_INST.x_rsc_5_0_s_tdone(TLS_x_rsc_5_0_s_tdone);
    hybrid_INST.x_rsc_5_0_tr_write_done(TLS_x_rsc_5_0_tr_write_done);
    hybrid_INST.x_rsc_5_0_RREADY(TLS_x_rsc_5_0_RREADY);
    hybrid_INST.x_rsc_5_0_RVALID(TLS_x_rsc_5_0_RVALID);
    hybrid_INST.x_rsc_5_0_RUSER(TLS_x_rsc_5_0_RUSER);
    hybrid_INST.x_rsc_5_0_RLAST(TLS_x_rsc_5_0_RLAST);
    hybrid_INST.x_rsc_5_0_RRESP(TLS_x_rsc_5_0_RRESP);
    hybrid_INST.x_rsc_5_0_RDATA(TLS_x_rsc_5_0_RDATA);
    hybrid_INST.x_rsc_5_0_RID(TLS_x_rsc_5_0_RID);
    hybrid_INST.x_rsc_5_0_ARREADY(TLS_x_rsc_5_0_ARREADY);
    hybrid_INST.x_rsc_5_0_ARVALID(TLS_x_rsc_5_0_ARVALID);
    hybrid_INST.x_rsc_5_0_ARUSER(TLS_x_rsc_5_0_ARUSER);
    hybrid_INST.x_rsc_5_0_ARREGION(TLS_x_rsc_5_0_ARREGION);
    hybrid_INST.x_rsc_5_0_ARQOS(TLS_x_rsc_5_0_ARQOS);
    hybrid_INST.x_rsc_5_0_ARPROT(TLS_x_rsc_5_0_ARPROT);
    hybrid_INST.x_rsc_5_0_ARCACHE(TLS_x_rsc_5_0_ARCACHE);
    hybrid_INST.x_rsc_5_0_ARLOCK(TLS_x_rsc_5_0_ARLOCK);
    hybrid_INST.x_rsc_5_0_ARBURST(TLS_x_rsc_5_0_ARBURST);
    hybrid_INST.x_rsc_5_0_ARSIZE(TLS_x_rsc_5_0_ARSIZE);
    hybrid_INST.x_rsc_5_0_ARLEN(TLS_x_rsc_5_0_ARLEN);
    hybrid_INST.x_rsc_5_0_ARADDR(TLS_x_rsc_5_0_ARADDR);
    hybrid_INST.x_rsc_5_0_ARID(TLS_x_rsc_5_0_ARID);
    hybrid_INST.x_rsc_5_0_BREADY(TLS_x_rsc_5_0_BREADY);
    hybrid_INST.x_rsc_5_0_BVALID(TLS_x_rsc_5_0_BVALID);
    hybrid_INST.x_rsc_5_0_BUSER(TLS_x_rsc_5_0_BUSER);
    hybrid_INST.x_rsc_5_0_BRESP(TLS_x_rsc_5_0_BRESP);
    hybrid_INST.x_rsc_5_0_BID(TLS_x_rsc_5_0_BID);
    hybrid_INST.x_rsc_5_0_WREADY(TLS_x_rsc_5_0_WREADY);
    hybrid_INST.x_rsc_5_0_WVALID(TLS_x_rsc_5_0_WVALID);
    hybrid_INST.x_rsc_5_0_WUSER(TLS_x_rsc_5_0_WUSER);
    hybrid_INST.x_rsc_5_0_WLAST(TLS_x_rsc_5_0_WLAST);
    hybrid_INST.x_rsc_5_0_WSTRB(TLS_x_rsc_5_0_WSTRB);
    hybrid_INST.x_rsc_5_0_WDATA(TLS_x_rsc_5_0_WDATA);
    hybrid_INST.x_rsc_5_0_AWREADY(TLS_x_rsc_5_0_AWREADY);
    hybrid_INST.x_rsc_5_0_AWVALID(TLS_x_rsc_5_0_AWVALID);
    hybrid_INST.x_rsc_5_0_AWUSER(TLS_x_rsc_5_0_AWUSER);
    hybrid_INST.x_rsc_5_0_AWREGION(TLS_x_rsc_5_0_AWREGION);
    hybrid_INST.x_rsc_5_0_AWQOS(TLS_x_rsc_5_0_AWQOS);
    hybrid_INST.x_rsc_5_0_AWPROT(TLS_x_rsc_5_0_AWPROT);
    hybrid_INST.x_rsc_5_0_AWCACHE(TLS_x_rsc_5_0_AWCACHE);
    hybrid_INST.x_rsc_5_0_AWLOCK(TLS_x_rsc_5_0_AWLOCK);
    hybrid_INST.x_rsc_5_0_AWBURST(TLS_x_rsc_5_0_AWBURST);
    hybrid_INST.x_rsc_5_0_AWSIZE(TLS_x_rsc_5_0_AWSIZE);
    hybrid_INST.x_rsc_5_0_AWLEN(TLS_x_rsc_5_0_AWLEN);
    hybrid_INST.x_rsc_5_0_AWADDR(TLS_x_rsc_5_0_AWADDR);
    hybrid_INST.x_rsc_5_0_AWID(TLS_x_rsc_5_0_AWID);
    hybrid_INST.x_rsc_triosy_5_0_lz(TLS_x_rsc_triosy_5_0_lz);
    hybrid_INST.x_rsc_6_0_s_tdone(TLS_x_rsc_6_0_s_tdone);
    hybrid_INST.x_rsc_6_0_tr_write_done(TLS_x_rsc_6_0_tr_write_done);
    hybrid_INST.x_rsc_6_0_RREADY(TLS_x_rsc_6_0_RREADY);
    hybrid_INST.x_rsc_6_0_RVALID(TLS_x_rsc_6_0_RVALID);
    hybrid_INST.x_rsc_6_0_RUSER(TLS_x_rsc_6_0_RUSER);
    hybrid_INST.x_rsc_6_0_RLAST(TLS_x_rsc_6_0_RLAST);
    hybrid_INST.x_rsc_6_0_RRESP(TLS_x_rsc_6_0_RRESP);
    hybrid_INST.x_rsc_6_0_RDATA(TLS_x_rsc_6_0_RDATA);
    hybrid_INST.x_rsc_6_0_RID(TLS_x_rsc_6_0_RID);
    hybrid_INST.x_rsc_6_0_ARREADY(TLS_x_rsc_6_0_ARREADY);
    hybrid_INST.x_rsc_6_0_ARVALID(TLS_x_rsc_6_0_ARVALID);
    hybrid_INST.x_rsc_6_0_ARUSER(TLS_x_rsc_6_0_ARUSER);
    hybrid_INST.x_rsc_6_0_ARREGION(TLS_x_rsc_6_0_ARREGION);
    hybrid_INST.x_rsc_6_0_ARQOS(TLS_x_rsc_6_0_ARQOS);
    hybrid_INST.x_rsc_6_0_ARPROT(TLS_x_rsc_6_0_ARPROT);
    hybrid_INST.x_rsc_6_0_ARCACHE(TLS_x_rsc_6_0_ARCACHE);
    hybrid_INST.x_rsc_6_0_ARLOCK(TLS_x_rsc_6_0_ARLOCK);
    hybrid_INST.x_rsc_6_0_ARBURST(TLS_x_rsc_6_0_ARBURST);
    hybrid_INST.x_rsc_6_0_ARSIZE(TLS_x_rsc_6_0_ARSIZE);
    hybrid_INST.x_rsc_6_0_ARLEN(TLS_x_rsc_6_0_ARLEN);
    hybrid_INST.x_rsc_6_0_ARADDR(TLS_x_rsc_6_0_ARADDR);
    hybrid_INST.x_rsc_6_0_ARID(TLS_x_rsc_6_0_ARID);
    hybrid_INST.x_rsc_6_0_BREADY(TLS_x_rsc_6_0_BREADY);
    hybrid_INST.x_rsc_6_0_BVALID(TLS_x_rsc_6_0_BVALID);
    hybrid_INST.x_rsc_6_0_BUSER(TLS_x_rsc_6_0_BUSER);
    hybrid_INST.x_rsc_6_0_BRESP(TLS_x_rsc_6_0_BRESP);
    hybrid_INST.x_rsc_6_0_BID(TLS_x_rsc_6_0_BID);
    hybrid_INST.x_rsc_6_0_WREADY(TLS_x_rsc_6_0_WREADY);
    hybrid_INST.x_rsc_6_0_WVALID(TLS_x_rsc_6_0_WVALID);
    hybrid_INST.x_rsc_6_0_WUSER(TLS_x_rsc_6_0_WUSER);
    hybrid_INST.x_rsc_6_0_WLAST(TLS_x_rsc_6_0_WLAST);
    hybrid_INST.x_rsc_6_0_WSTRB(TLS_x_rsc_6_0_WSTRB);
    hybrid_INST.x_rsc_6_0_WDATA(TLS_x_rsc_6_0_WDATA);
    hybrid_INST.x_rsc_6_0_AWREADY(TLS_x_rsc_6_0_AWREADY);
    hybrid_INST.x_rsc_6_0_AWVALID(TLS_x_rsc_6_0_AWVALID);
    hybrid_INST.x_rsc_6_0_AWUSER(TLS_x_rsc_6_0_AWUSER);
    hybrid_INST.x_rsc_6_0_AWREGION(TLS_x_rsc_6_0_AWREGION);
    hybrid_INST.x_rsc_6_0_AWQOS(TLS_x_rsc_6_0_AWQOS);
    hybrid_INST.x_rsc_6_0_AWPROT(TLS_x_rsc_6_0_AWPROT);
    hybrid_INST.x_rsc_6_0_AWCACHE(TLS_x_rsc_6_0_AWCACHE);
    hybrid_INST.x_rsc_6_0_AWLOCK(TLS_x_rsc_6_0_AWLOCK);
    hybrid_INST.x_rsc_6_0_AWBURST(TLS_x_rsc_6_0_AWBURST);
    hybrid_INST.x_rsc_6_0_AWSIZE(TLS_x_rsc_6_0_AWSIZE);
    hybrid_INST.x_rsc_6_0_AWLEN(TLS_x_rsc_6_0_AWLEN);
    hybrid_INST.x_rsc_6_0_AWADDR(TLS_x_rsc_6_0_AWADDR);
    hybrid_INST.x_rsc_6_0_AWID(TLS_x_rsc_6_0_AWID);
    hybrid_INST.x_rsc_triosy_6_0_lz(TLS_x_rsc_triosy_6_0_lz);
    hybrid_INST.x_rsc_7_0_s_tdone(TLS_x_rsc_7_0_s_tdone);
    hybrid_INST.x_rsc_7_0_tr_write_done(TLS_x_rsc_7_0_tr_write_done);
    hybrid_INST.x_rsc_7_0_RREADY(TLS_x_rsc_7_0_RREADY);
    hybrid_INST.x_rsc_7_0_RVALID(TLS_x_rsc_7_0_RVALID);
    hybrid_INST.x_rsc_7_0_RUSER(TLS_x_rsc_7_0_RUSER);
    hybrid_INST.x_rsc_7_0_RLAST(TLS_x_rsc_7_0_RLAST);
    hybrid_INST.x_rsc_7_0_RRESP(TLS_x_rsc_7_0_RRESP);
    hybrid_INST.x_rsc_7_0_RDATA(TLS_x_rsc_7_0_RDATA);
    hybrid_INST.x_rsc_7_0_RID(TLS_x_rsc_7_0_RID);
    hybrid_INST.x_rsc_7_0_ARREADY(TLS_x_rsc_7_0_ARREADY);
    hybrid_INST.x_rsc_7_0_ARVALID(TLS_x_rsc_7_0_ARVALID);
    hybrid_INST.x_rsc_7_0_ARUSER(TLS_x_rsc_7_0_ARUSER);
    hybrid_INST.x_rsc_7_0_ARREGION(TLS_x_rsc_7_0_ARREGION);
    hybrid_INST.x_rsc_7_0_ARQOS(TLS_x_rsc_7_0_ARQOS);
    hybrid_INST.x_rsc_7_0_ARPROT(TLS_x_rsc_7_0_ARPROT);
    hybrid_INST.x_rsc_7_0_ARCACHE(TLS_x_rsc_7_0_ARCACHE);
    hybrid_INST.x_rsc_7_0_ARLOCK(TLS_x_rsc_7_0_ARLOCK);
    hybrid_INST.x_rsc_7_0_ARBURST(TLS_x_rsc_7_0_ARBURST);
    hybrid_INST.x_rsc_7_0_ARSIZE(TLS_x_rsc_7_0_ARSIZE);
    hybrid_INST.x_rsc_7_0_ARLEN(TLS_x_rsc_7_0_ARLEN);
    hybrid_INST.x_rsc_7_0_ARADDR(TLS_x_rsc_7_0_ARADDR);
    hybrid_INST.x_rsc_7_0_ARID(TLS_x_rsc_7_0_ARID);
    hybrid_INST.x_rsc_7_0_BREADY(TLS_x_rsc_7_0_BREADY);
    hybrid_INST.x_rsc_7_0_BVALID(TLS_x_rsc_7_0_BVALID);
    hybrid_INST.x_rsc_7_0_BUSER(TLS_x_rsc_7_0_BUSER);
    hybrid_INST.x_rsc_7_0_BRESP(TLS_x_rsc_7_0_BRESP);
    hybrid_INST.x_rsc_7_0_BID(TLS_x_rsc_7_0_BID);
    hybrid_INST.x_rsc_7_0_WREADY(TLS_x_rsc_7_0_WREADY);
    hybrid_INST.x_rsc_7_0_WVALID(TLS_x_rsc_7_0_WVALID);
    hybrid_INST.x_rsc_7_0_WUSER(TLS_x_rsc_7_0_WUSER);
    hybrid_INST.x_rsc_7_0_WLAST(TLS_x_rsc_7_0_WLAST);
    hybrid_INST.x_rsc_7_0_WSTRB(TLS_x_rsc_7_0_WSTRB);
    hybrid_INST.x_rsc_7_0_WDATA(TLS_x_rsc_7_0_WDATA);
    hybrid_INST.x_rsc_7_0_AWREADY(TLS_x_rsc_7_0_AWREADY);
    hybrid_INST.x_rsc_7_0_AWVALID(TLS_x_rsc_7_0_AWVALID);
    hybrid_INST.x_rsc_7_0_AWUSER(TLS_x_rsc_7_0_AWUSER);
    hybrid_INST.x_rsc_7_0_AWREGION(TLS_x_rsc_7_0_AWREGION);
    hybrid_INST.x_rsc_7_0_AWQOS(TLS_x_rsc_7_0_AWQOS);
    hybrid_INST.x_rsc_7_0_AWPROT(TLS_x_rsc_7_0_AWPROT);
    hybrid_INST.x_rsc_7_0_AWCACHE(TLS_x_rsc_7_0_AWCACHE);
    hybrid_INST.x_rsc_7_0_AWLOCK(TLS_x_rsc_7_0_AWLOCK);
    hybrid_INST.x_rsc_7_0_AWBURST(TLS_x_rsc_7_0_AWBURST);
    hybrid_INST.x_rsc_7_0_AWSIZE(TLS_x_rsc_7_0_AWSIZE);
    hybrid_INST.x_rsc_7_0_AWLEN(TLS_x_rsc_7_0_AWLEN);
    hybrid_INST.x_rsc_7_0_AWADDR(TLS_x_rsc_7_0_AWADDR);
    hybrid_INST.x_rsc_7_0_AWID(TLS_x_rsc_7_0_AWID);
    hybrid_INST.x_rsc_triosy_7_0_lz(TLS_x_rsc_triosy_7_0_lz);
    hybrid_INST.x_rsc_8_0_s_tdone(TLS_x_rsc_8_0_s_tdone);
    hybrid_INST.x_rsc_8_0_tr_write_done(TLS_x_rsc_8_0_tr_write_done);
    hybrid_INST.x_rsc_8_0_RREADY(TLS_x_rsc_8_0_RREADY);
    hybrid_INST.x_rsc_8_0_RVALID(TLS_x_rsc_8_0_RVALID);
    hybrid_INST.x_rsc_8_0_RUSER(TLS_x_rsc_8_0_RUSER);
    hybrid_INST.x_rsc_8_0_RLAST(TLS_x_rsc_8_0_RLAST);
    hybrid_INST.x_rsc_8_0_RRESP(TLS_x_rsc_8_0_RRESP);
    hybrid_INST.x_rsc_8_0_RDATA(TLS_x_rsc_8_0_RDATA);
    hybrid_INST.x_rsc_8_0_RID(TLS_x_rsc_8_0_RID);
    hybrid_INST.x_rsc_8_0_ARREADY(TLS_x_rsc_8_0_ARREADY);
    hybrid_INST.x_rsc_8_0_ARVALID(TLS_x_rsc_8_0_ARVALID);
    hybrid_INST.x_rsc_8_0_ARUSER(TLS_x_rsc_8_0_ARUSER);
    hybrid_INST.x_rsc_8_0_ARREGION(TLS_x_rsc_8_0_ARREGION);
    hybrid_INST.x_rsc_8_0_ARQOS(TLS_x_rsc_8_0_ARQOS);
    hybrid_INST.x_rsc_8_0_ARPROT(TLS_x_rsc_8_0_ARPROT);
    hybrid_INST.x_rsc_8_0_ARCACHE(TLS_x_rsc_8_0_ARCACHE);
    hybrid_INST.x_rsc_8_0_ARLOCK(TLS_x_rsc_8_0_ARLOCK);
    hybrid_INST.x_rsc_8_0_ARBURST(TLS_x_rsc_8_0_ARBURST);
    hybrid_INST.x_rsc_8_0_ARSIZE(TLS_x_rsc_8_0_ARSIZE);
    hybrid_INST.x_rsc_8_0_ARLEN(TLS_x_rsc_8_0_ARLEN);
    hybrid_INST.x_rsc_8_0_ARADDR(TLS_x_rsc_8_0_ARADDR);
    hybrid_INST.x_rsc_8_0_ARID(TLS_x_rsc_8_0_ARID);
    hybrid_INST.x_rsc_8_0_BREADY(TLS_x_rsc_8_0_BREADY);
    hybrid_INST.x_rsc_8_0_BVALID(TLS_x_rsc_8_0_BVALID);
    hybrid_INST.x_rsc_8_0_BUSER(TLS_x_rsc_8_0_BUSER);
    hybrid_INST.x_rsc_8_0_BRESP(TLS_x_rsc_8_0_BRESP);
    hybrid_INST.x_rsc_8_0_BID(TLS_x_rsc_8_0_BID);
    hybrid_INST.x_rsc_8_0_WREADY(TLS_x_rsc_8_0_WREADY);
    hybrid_INST.x_rsc_8_0_WVALID(TLS_x_rsc_8_0_WVALID);
    hybrid_INST.x_rsc_8_0_WUSER(TLS_x_rsc_8_0_WUSER);
    hybrid_INST.x_rsc_8_0_WLAST(TLS_x_rsc_8_0_WLAST);
    hybrid_INST.x_rsc_8_0_WSTRB(TLS_x_rsc_8_0_WSTRB);
    hybrid_INST.x_rsc_8_0_WDATA(TLS_x_rsc_8_0_WDATA);
    hybrid_INST.x_rsc_8_0_AWREADY(TLS_x_rsc_8_0_AWREADY);
    hybrid_INST.x_rsc_8_0_AWVALID(TLS_x_rsc_8_0_AWVALID);
    hybrid_INST.x_rsc_8_0_AWUSER(TLS_x_rsc_8_0_AWUSER);
    hybrid_INST.x_rsc_8_0_AWREGION(TLS_x_rsc_8_0_AWREGION);
    hybrid_INST.x_rsc_8_0_AWQOS(TLS_x_rsc_8_0_AWQOS);
    hybrid_INST.x_rsc_8_0_AWPROT(TLS_x_rsc_8_0_AWPROT);
    hybrid_INST.x_rsc_8_0_AWCACHE(TLS_x_rsc_8_0_AWCACHE);
    hybrid_INST.x_rsc_8_0_AWLOCK(TLS_x_rsc_8_0_AWLOCK);
    hybrid_INST.x_rsc_8_0_AWBURST(TLS_x_rsc_8_0_AWBURST);
    hybrid_INST.x_rsc_8_0_AWSIZE(TLS_x_rsc_8_0_AWSIZE);
    hybrid_INST.x_rsc_8_0_AWLEN(TLS_x_rsc_8_0_AWLEN);
    hybrid_INST.x_rsc_8_0_AWADDR(TLS_x_rsc_8_0_AWADDR);
    hybrid_INST.x_rsc_8_0_AWID(TLS_x_rsc_8_0_AWID);
    hybrid_INST.x_rsc_triosy_8_0_lz(TLS_x_rsc_triosy_8_0_lz);
    hybrid_INST.x_rsc_9_0_s_tdone(TLS_x_rsc_9_0_s_tdone);
    hybrid_INST.x_rsc_9_0_tr_write_done(TLS_x_rsc_9_0_tr_write_done);
    hybrid_INST.x_rsc_9_0_RREADY(TLS_x_rsc_9_0_RREADY);
    hybrid_INST.x_rsc_9_0_RVALID(TLS_x_rsc_9_0_RVALID);
    hybrid_INST.x_rsc_9_0_RUSER(TLS_x_rsc_9_0_RUSER);
    hybrid_INST.x_rsc_9_0_RLAST(TLS_x_rsc_9_0_RLAST);
    hybrid_INST.x_rsc_9_0_RRESP(TLS_x_rsc_9_0_RRESP);
    hybrid_INST.x_rsc_9_0_RDATA(TLS_x_rsc_9_0_RDATA);
    hybrid_INST.x_rsc_9_0_RID(TLS_x_rsc_9_0_RID);
    hybrid_INST.x_rsc_9_0_ARREADY(TLS_x_rsc_9_0_ARREADY);
    hybrid_INST.x_rsc_9_0_ARVALID(TLS_x_rsc_9_0_ARVALID);
    hybrid_INST.x_rsc_9_0_ARUSER(TLS_x_rsc_9_0_ARUSER);
    hybrid_INST.x_rsc_9_0_ARREGION(TLS_x_rsc_9_0_ARREGION);
    hybrid_INST.x_rsc_9_0_ARQOS(TLS_x_rsc_9_0_ARQOS);
    hybrid_INST.x_rsc_9_0_ARPROT(TLS_x_rsc_9_0_ARPROT);
    hybrid_INST.x_rsc_9_0_ARCACHE(TLS_x_rsc_9_0_ARCACHE);
    hybrid_INST.x_rsc_9_0_ARLOCK(TLS_x_rsc_9_0_ARLOCK);
    hybrid_INST.x_rsc_9_0_ARBURST(TLS_x_rsc_9_0_ARBURST);
    hybrid_INST.x_rsc_9_0_ARSIZE(TLS_x_rsc_9_0_ARSIZE);
    hybrid_INST.x_rsc_9_0_ARLEN(TLS_x_rsc_9_0_ARLEN);
    hybrid_INST.x_rsc_9_0_ARADDR(TLS_x_rsc_9_0_ARADDR);
    hybrid_INST.x_rsc_9_0_ARID(TLS_x_rsc_9_0_ARID);
    hybrid_INST.x_rsc_9_0_BREADY(TLS_x_rsc_9_0_BREADY);
    hybrid_INST.x_rsc_9_0_BVALID(TLS_x_rsc_9_0_BVALID);
    hybrid_INST.x_rsc_9_0_BUSER(TLS_x_rsc_9_0_BUSER);
    hybrid_INST.x_rsc_9_0_BRESP(TLS_x_rsc_9_0_BRESP);
    hybrid_INST.x_rsc_9_0_BID(TLS_x_rsc_9_0_BID);
    hybrid_INST.x_rsc_9_0_WREADY(TLS_x_rsc_9_0_WREADY);
    hybrid_INST.x_rsc_9_0_WVALID(TLS_x_rsc_9_0_WVALID);
    hybrid_INST.x_rsc_9_0_WUSER(TLS_x_rsc_9_0_WUSER);
    hybrid_INST.x_rsc_9_0_WLAST(TLS_x_rsc_9_0_WLAST);
    hybrid_INST.x_rsc_9_0_WSTRB(TLS_x_rsc_9_0_WSTRB);
    hybrid_INST.x_rsc_9_0_WDATA(TLS_x_rsc_9_0_WDATA);
    hybrid_INST.x_rsc_9_0_AWREADY(TLS_x_rsc_9_0_AWREADY);
    hybrid_INST.x_rsc_9_0_AWVALID(TLS_x_rsc_9_0_AWVALID);
    hybrid_INST.x_rsc_9_0_AWUSER(TLS_x_rsc_9_0_AWUSER);
    hybrid_INST.x_rsc_9_0_AWREGION(TLS_x_rsc_9_0_AWREGION);
    hybrid_INST.x_rsc_9_0_AWQOS(TLS_x_rsc_9_0_AWQOS);
    hybrid_INST.x_rsc_9_0_AWPROT(TLS_x_rsc_9_0_AWPROT);
    hybrid_INST.x_rsc_9_0_AWCACHE(TLS_x_rsc_9_0_AWCACHE);
    hybrid_INST.x_rsc_9_0_AWLOCK(TLS_x_rsc_9_0_AWLOCK);
    hybrid_INST.x_rsc_9_0_AWBURST(TLS_x_rsc_9_0_AWBURST);
    hybrid_INST.x_rsc_9_0_AWSIZE(TLS_x_rsc_9_0_AWSIZE);
    hybrid_INST.x_rsc_9_0_AWLEN(TLS_x_rsc_9_0_AWLEN);
    hybrid_INST.x_rsc_9_0_AWADDR(TLS_x_rsc_9_0_AWADDR);
    hybrid_INST.x_rsc_9_0_AWID(TLS_x_rsc_9_0_AWID);
    hybrid_INST.x_rsc_triosy_9_0_lz(TLS_x_rsc_triosy_9_0_lz);
    hybrid_INST.x_rsc_10_0_s_tdone(TLS_x_rsc_10_0_s_tdone);
    hybrid_INST.x_rsc_10_0_tr_write_done(TLS_x_rsc_10_0_tr_write_done);
    hybrid_INST.x_rsc_10_0_RREADY(TLS_x_rsc_10_0_RREADY);
    hybrid_INST.x_rsc_10_0_RVALID(TLS_x_rsc_10_0_RVALID);
    hybrid_INST.x_rsc_10_0_RUSER(TLS_x_rsc_10_0_RUSER);
    hybrid_INST.x_rsc_10_0_RLAST(TLS_x_rsc_10_0_RLAST);
    hybrid_INST.x_rsc_10_0_RRESP(TLS_x_rsc_10_0_RRESP);
    hybrid_INST.x_rsc_10_0_RDATA(TLS_x_rsc_10_0_RDATA);
    hybrid_INST.x_rsc_10_0_RID(TLS_x_rsc_10_0_RID);
    hybrid_INST.x_rsc_10_0_ARREADY(TLS_x_rsc_10_0_ARREADY);
    hybrid_INST.x_rsc_10_0_ARVALID(TLS_x_rsc_10_0_ARVALID);
    hybrid_INST.x_rsc_10_0_ARUSER(TLS_x_rsc_10_0_ARUSER);
    hybrid_INST.x_rsc_10_0_ARREGION(TLS_x_rsc_10_0_ARREGION);
    hybrid_INST.x_rsc_10_0_ARQOS(TLS_x_rsc_10_0_ARQOS);
    hybrid_INST.x_rsc_10_0_ARPROT(TLS_x_rsc_10_0_ARPROT);
    hybrid_INST.x_rsc_10_0_ARCACHE(TLS_x_rsc_10_0_ARCACHE);
    hybrid_INST.x_rsc_10_0_ARLOCK(TLS_x_rsc_10_0_ARLOCK);
    hybrid_INST.x_rsc_10_0_ARBURST(TLS_x_rsc_10_0_ARBURST);
    hybrid_INST.x_rsc_10_0_ARSIZE(TLS_x_rsc_10_0_ARSIZE);
    hybrid_INST.x_rsc_10_0_ARLEN(TLS_x_rsc_10_0_ARLEN);
    hybrid_INST.x_rsc_10_0_ARADDR(TLS_x_rsc_10_0_ARADDR);
    hybrid_INST.x_rsc_10_0_ARID(TLS_x_rsc_10_0_ARID);
    hybrid_INST.x_rsc_10_0_BREADY(TLS_x_rsc_10_0_BREADY);
    hybrid_INST.x_rsc_10_0_BVALID(TLS_x_rsc_10_0_BVALID);
    hybrid_INST.x_rsc_10_0_BUSER(TLS_x_rsc_10_0_BUSER);
    hybrid_INST.x_rsc_10_0_BRESP(TLS_x_rsc_10_0_BRESP);
    hybrid_INST.x_rsc_10_0_BID(TLS_x_rsc_10_0_BID);
    hybrid_INST.x_rsc_10_0_WREADY(TLS_x_rsc_10_0_WREADY);
    hybrid_INST.x_rsc_10_0_WVALID(TLS_x_rsc_10_0_WVALID);
    hybrid_INST.x_rsc_10_0_WUSER(TLS_x_rsc_10_0_WUSER);
    hybrid_INST.x_rsc_10_0_WLAST(TLS_x_rsc_10_0_WLAST);
    hybrid_INST.x_rsc_10_0_WSTRB(TLS_x_rsc_10_0_WSTRB);
    hybrid_INST.x_rsc_10_0_WDATA(TLS_x_rsc_10_0_WDATA);
    hybrid_INST.x_rsc_10_0_AWREADY(TLS_x_rsc_10_0_AWREADY);
    hybrid_INST.x_rsc_10_0_AWVALID(TLS_x_rsc_10_0_AWVALID);
    hybrid_INST.x_rsc_10_0_AWUSER(TLS_x_rsc_10_0_AWUSER);
    hybrid_INST.x_rsc_10_0_AWREGION(TLS_x_rsc_10_0_AWREGION);
    hybrid_INST.x_rsc_10_0_AWQOS(TLS_x_rsc_10_0_AWQOS);
    hybrid_INST.x_rsc_10_0_AWPROT(TLS_x_rsc_10_0_AWPROT);
    hybrid_INST.x_rsc_10_0_AWCACHE(TLS_x_rsc_10_0_AWCACHE);
    hybrid_INST.x_rsc_10_0_AWLOCK(TLS_x_rsc_10_0_AWLOCK);
    hybrid_INST.x_rsc_10_0_AWBURST(TLS_x_rsc_10_0_AWBURST);
    hybrid_INST.x_rsc_10_0_AWSIZE(TLS_x_rsc_10_0_AWSIZE);
    hybrid_INST.x_rsc_10_0_AWLEN(TLS_x_rsc_10_0_AWLEN);
    hybrid_INST.x_rsc_10_0_AWADDR(TLS_x_rsc_10_0_AWADDR);
    hybrid_INST.x_rsc_10_0_AWID(TLS_x_rsc_10_0_AWID);
    hybrid_INST.x_rsc_triosy_10_0_lz(TLS_x_rsc_triosy_10_0_lz);
    hybrid_INST.x_rsc_11_0_s_tdone(TLS_x_rsc_11_0_s_tdone);
    hybrid_INST.x_rsc_11_0_tr_write_done(TLS_x_rsc_11_0_tr_write_done);
    hybrid_INST.x_rsc_11_0_RREADY(TLS_x_rsc_11_0_RREADY);
    hybrid_INST.x_rsc_11_0_RVALID(TLS_x_rsc_11_0_RVALID);
    hybrid_INST.x_rsc_11_0_RUSER(TLS_x_rsc_11_0_RUSER);
    hybrid_INST.x_rsc_11_0_RLAST(TLS_x_rsc_11_0_RLAST);
    hybrid_INST.x_rsc_11_0_RRESP(TLS_x_rsc_11_0_RRESP);
    hybrid_INST.x_rsc_11_0_RDATA(TLS_x_rsc_11_0_RDATA);
    hybrid_INST.x_rsc_11_0_RID(TLS_x_rsc_11_0_RID);
    hybrid_INST.x_rsc_11_0_ARREADY(TLS_x_rsc_11_0_ARREADY);
    hybrid_INST.x_rsc_11_0_ARVALID(TLS_x_rsc_11_0_ARVALID);
    hybrid_INST.x_rsc_11_0_ARUSER(TLS_x_rsc_11_0_ARUSER);
    hybrid_INST.x_rsc_11_0_ARREGION(TLS_x_rsc_11_0_ARREGION);
    hybrid_INST.x_rsc_11_0_ARQOS(TLS_x_rsc_11_0_ARQOS);
    hybrid_INST.x_rsc_11_0_ARPROT(TLS_x_rsc_11_0_ARPROT);
    hybrid_INST.x_rsc_11_0_ARCACHE(TLS_x_rsc_11_0_ARCACHE);
    hybrid_INST.x_rsc_11_0_ARLOCK(TLS_x_rsc_11_0_ARLOCK);
    hybrid_INST.x_rsc_11_0_ARBURST(TLS_x_rsc_11_0_ARBURST);
    hybrid_INST.x_rsc_11_0_ARSIZE(TLS_x_rsc_11_0_ARSIZE);
    hybrid_INST.x_rsc_11_0_ARLEN(TLS_x_rsc_11_0_ARLEN);
    hybrid_INST.x_rsc_11_0_ARADDR(TLS_x_rsc_11_0_ARADDR);
    hybrid_INST.x_rsc_11_0_ARID(TLS_x_rsc_11_0_ARID);
    hybrid_INST.x_rsc_11_0_BREADY(TLS_x_rsc_11_0_BREADY);
    hybrid_INST.x_rsc_11_0_BVALID(TLS_x_rsc_11_0_BVALID);
    hybrid_INST.x_rsc_11_0_BUSER(TLS_x_rsc_11_0_BUSER);
    hybrid_INST.x_rsc_11_0_BRESP(TLS_x_rsc_11_0_BRESP);
    hybrid_INST.x_rsc_11_0_BID(TLS_x_rsc_11_0_BID);
    hybrid_INST.x_rsc_11_0_WREADY(TLS_x_rsc_11_0_WREADY);
    hybrid_INST.x_rsc_11_0_WVALID(TLS_x_rsc_11_0_WVALID);
    hybrid_INST.x_rsc_11_0_WUSER(TLS_x_rsc_11_0_WUSER);
    hybrid_INST.x_rsc_11_0_WLAST(TLS_x_rsc_11_0_WLAST);
    hybrid_INST.x_rsc_11_0_WSTRB(TLS_x_rsc_11_0_WSTRB);
    hybrid_INST.x_rsc_11_0_WDATA(TLS_x_rsc_11_0_WDATA);
    hybrid_INST.x_rsc_11_0_AWREADY(TLS_x_rsc_11_0_AWREADY);
    hybrid_INST.x_rsc_11_0_AWVALID(TLS_x_rsc_11_0_AWVALID);
    hybrid_INST.x_rsc_11_0_AWUSER(TLS_x_rsc_11_0_AWUSER);
    hybrid_INST.x_rsc_11_0_AWREGION(TLS_x_rsc_11_0_AWREGION);
    hybrid_INST.x_rsc_11_0_AWQOS(TLS_x_rsc_11_0_AWQOS);
    hybrid_INST.x_rsc_11_0_AWPROT(TLS_x_rsc_11_0_AWPROT);
    hybrid_INST.x_rsc_11_0_AWCACHE(TLS_x_rsc_11_0_AWCACHE);
    hybrid_INST.x_rsc_11_0_AWLOCK(TLS_x_rsc_11_0_AWLOCK);
    hybrid_INST.x_rsc_11_0_AWBURST(TLS_x_rsc_11_0_AWBURST);
    hybrid_INST.x_rsc_11_0_AWSIZE(TLS_x_rsc_11_0_AWSIZE);
    hybrid_INST.x_rsc_11_0_AWLEN(TLS_x_rsc_11_0_AWLEN);
    hybrid_INST.x_rsc_11_0_AWADDR(TLS_x_rsc_11_0_AWADDR);
    hybrid_INST.x_rsc_11_0_AWID(TLS_x_rsc_11_0_AWID);
    hybrid_INST.x_rsc_triosy_11_0_lz(TLS_x_rsc_triosy_11_0_lz);
    hybrid_INST.x_rsc_12_0_s_tdone(TLS_x_rsc_12_0_s_tdone);
    hybrid_INST.x_rsc_12_0_tr_write_done(TLS_x_rsc_12_0_tr_write_done);
    hybrid_INST.x_rsc_12_0_RREADY(TLS_x_rsc_12_0_RREADY);
    hybrid_INST.x_rsc_12_0_RVALID(TLS_x_rsc_12_0_RVALID);
    hybrid_INST.x_rsc_12_0_RUSER(TLS_x_rsc_12_0_RUSER);
    hybrid_INST.x_rsc_12_0_RLAST(TLS_x_rsc_12_0_RLAST);
    hybrid_INST.x_rsc_12_0_RRESP(TLS_x_rsc_12_0_RRESP);
    hybrid_INST.x_rsc_12_0_RDATA(TLS_x_rsc_12_0_RDATA);
    hybrid_INST.x_rsc_12_0_RID(TLS_x_rsc_12_0_RID);
    hybrid_INST.x_rsc_12_0_ARREADY(TLS_x_rsc_12_0_ARREADY);
    hybrid_INST.x_rsc_12_0_ARVALID(TLS_x_rsc_12_0_ARVALID);
    hybrid_INST.x_rsc_12_0_ARUSER(TLS_x_rsc_12_0_ARUSER);
    hybrid_INST.x_rsc_12_0_ARREGION(TLS_x_rsc_12_0_ARREGION);
    hybrid_INST.x_rsc_12_0_ARQOS(TLS_x_rsc_12_0_ARQOS);
    hybrid_INST.x_rsc_12_0_ARPROT(TLS_x_rsc_12_0_ARPROT);
    hybrid_INST.x_rsc_12_0_ARCACHE(TLS_x_rsc_12_0_ARCACHE);
    hybrid_INST.x_rsc_12_0_ARLOCK(TLS_x_rsc_12_0_ARLOCK);
    hybrid_INST.x_rsc_12_0_ARBURST(TLS_x_rsc_12_0_ARBURST);
    hybrid_INST.x_rsc_12_0_ARSIZE(TLS_x_rsc_12_0_ARSIZE);
    hybrid_INST.x_rsc_12_0_ARLEN(TLS_x_rsc_12_0_ARLEN);
    hybrid_INST.x_rsc_12_0_ARADDR(TLS_x_rsc_12_0_ARADDR);
    hybrid_INST.x_rsc_12_0_ARID(TLS_x_rsc_12_0_ARID);
    hybrid_INST.x_rsc_12_0_BREADY(TLS_x_rsc_12_0_BREADY);
    hybrid_INST.x_rsc_12_0_BVALID(TLS_x_rsc_12_0_BVALID);
    hybrid_INST.x_rsc_12_0_BUSER(TLS_x_rsc_12_0_BUSER);
    hybrid_INST.x_rsc_12_0_BRESP(TLS_x_rsc_12_0_BRESP);
    hybrid_INST.x_rsc_12_0_BID(TLS_x_rsc_12_0_BID);
    hybrid_INST.x_rsc_12_0_WREADY(TLS_x_rsc_12_0_WREADY);
    hybrid_INST.x_rsc_12_0_WVALID(TLS_x_rsc_12_0_WVALID);
    hybrid_INST.x_rsc_12_0_WUSER(TLS_x_rsc_12_0_WUSER);
    hybrid_INST.x_rsc_12_0_WLAST(TLS_x_rsc_12_0_WLAST);
    hybrid_INST.x_rsc_12_0_WSTRB(TLS_x_rsc_12_0_WSTRB);
    hybrid_INST.x_rsc_12_0_WDATA(TLS_x_rsc_12_0_WDATA);
    hybrid_INST.x_rsc_12_0_AWREADY(TLS_x_rsc_12_0_AWREADY);
    hybrid_INST.x_rsc_12_0_AWVALID(TLS_x_rsc_12_0_AWVALID);
    hybrid_INST.x_rsc_12_0_AWUSER(TLS_x_rsc_12_0_AWUSER);
    hybrid_INST.x_rsc_12_0_AWREGION(TLS_x_rsc_12_0_AWREGION);
    hybrid_INST.x_rsc_12_0_AWQOS(TLS_x_rsc_12_0_AWQOS);
    hybrid_INST.x_rsc_12_0_AWPROT(TLS_x_rsc_12_0_AWPROT);
    hybrid_INST.x_rsc_12_0_AWCACHE(TLS_x_rsc_12_0_AWCACHE);
    hybrid_INST.x_rsc_12_0_AWLOCK(TLS_x_rsc_12_0_AWLOCK);
    hybrid_INST.x_rsc_12_0_AWBURST(TLS_x_rsc_12_0_AWBURST);
    hybrid_INST.x_rsc_12_0_AWSIZE(TLS_x_rsc_12_0_AWSIZE);
    hybrid_INST.x_rsc_12_0_AWLEN(TLS_x_rsc_12_0_AWLEN);
    hybrid_INST.x_rsc_12_0_AWADDR(TLS_x_rsc_12_0_AWADDR);
    hybrid_INST.x_rsc_12_0_AWID(TLS_x_rsc_12_0_AWID);
    hybrid_INST.x_rsc_triosy_12_0_lz(TLS_x_rsc_triosy_12_0_lz);
    hybrid_INST.x_rsc_13_0_s_tdone(TLS_x_rsc_13_0_s_tdone);
    hybrid_INST.x_rsc_13_0_tr_write_done(TLS_x_rsc_13_0_tr_write_done);
    hybrid_INST.x_rsc_13_0_RREADY(TLS_x_rsc_13_0_RREADY);
    hybrid_INST.x_rsc_13_0_RVALID(TLS_x_rsc_13_0_RVALID);
    hybrid_INST.x_rsc_13_0_RUSER(TLS_x_rsc_13_0_RUSER);
    hybrid_INST.x_rsc_13_0_RLAST(TLS_x_rsc_13_0_RLAST);
    hybrid_INST.x_rsc_13_0_RRESP(TLS_x_rsc_13_0_RRESP);
    hybrid_INST.x_rsc_13_0_RDATA(TLS_x_rsc_13_0_RDATA);
    hybrid_INST.x_rsc_13_0_RID(TLS_x_rsc_13_0_RID);
    hybrid_INST.x_rsc_13_0_ARREADY(TLS_x_rsc_13_0_ARREADY);
    hybrid_INST.x_rsc_13_0_ARVALID(TLS_x_rsc_13_0_ARVALID);
    hybrid_INST.x_rsc_13_0_ARUSER(TLS_x_rsc_13_0_ARUSER);
    hybrid_INST.x_rsc_13_0_ARREGION(TLS_x_rsc_13_0_ARREGION);
    hybrid_INST.x_rsc_13_0_ARQOS(TLS_x_rsc_13_0_ARQOS);
    hybrid_INST.x_rsc_13_0_ARPROT(TLS_x_rsc_13_0_ARPROT);
    hybrid_INST.x_rsc_13_0_ARCACHE(TLS_x_rsc_13_0_ARCACHE);
    hybrid_INST.x_rsc_13_0_ARLOCK(TLS_x_rsc_13_0_ARLOCK);
    hybrid_INST.x_rsc_13_0_ARBURST(TLS_x_rsc_13_0_ARBURST);
    hybrid_INST.x_rsc_13_0_ARSIZE(TLS_x_rsc_13_0_ARSIZE);
    hybrid_INST.x_rsc_13_0_ARLEN(TLS_x_rsc_13_0_ARLEN);
    hybrid_INST.x_rsc_13_0_ARADDR(TLS_x_rsc_13_0_ARADDR);
    hybrid_INST.x_rsc_13_0_ARID(TLS_x_rsc_13_0_ARID);
    hybrid_INST.x_rsc_13_0_BREADY(TLS_x_rsc_13_0_BREADY);
    hybrid_INST.x_rsc_13_0_BVALID(TLS_x_rsc_13_0_BVALID);
    hybrid_INST.x_rsc_13_0_BUSER(TLS_x_rsc_13_0_BUSER);
    hybrid_INST.x_rsc_13_0_BRESP(TLS_x_rsc_13_0_BRESP);
    hybrid_INST.x_rsc_13_0_BID(TLS_x_rsc_13_0_BID);
    hybrid_INST.x_rsc_13_0_WREADY(TLS_x_rsc_13_0_WREADY);
    hybrid_INST.x_rsc_13_0_WVALID(TLS_x_rsc_13_0_WVALID);
    hybrid_INST.x_rsc_13_0_WUSER(TLS_x_rsc_13_0_WUSER);
    hybrid_INST.x_rsc_13_0_WLAST(TLS_x_rsc_13_0_WLAST);
    hybrid_INST.x_rsc_13_0_WSTRB(TLS_x_rsc_13_0_WSTRB);
    hybrid_INST.x_rsc_13_0_WDATA(TLS_x_rsc_13_0_WDATA);
    hybrid_INST.x_rsc_13_0_AWREADY(TLS_x_rsc_13_0_AWREADY);
    hybrid_INST.x_rsc_13_0_AWVALID(TLS_x_rsc_13_0_AWVALID);
    hybrid_INST.x_rsc_13_0_AWUSER(TLS_x_rsc_13_0_AWUSER);
    hybrid_INST.x_rsc_13_0_AWREGION(TLS_x_rsc_13_0_AWREGION);
    hybrid_INST.x_rsc_13_0_AWQOS(TLS_x_rsc_13_0_AWQOS);
    hybrid_INST.x_rsc_13_0_AWPROT(TLS_x_rsc_13_0_AWPROT);
    hybrid_INST.x_rsc_13_0_AWCACHE(TLS_x_rsc_13_0_AWCACHE);
    hybrid_INST.x_rsc_13_0_AWLOCK(TLS_x_rsc_13_0_AWLOCK);
    hybrid_INST.x_rsc_13_0_AWBURST(TLS_x_rsc_13_0_AWBURST);
    hybrid_INST.x_rsc_13_0_AWSIZE(TLS_x_rsc_13_0_AWSIZE);
    hybrid_INST.x_rsc_13_0_AWLEN(TLS_x_rsc_13_0_AWLEN);
    hybrid_INST.x_rsc_13_0_AWADDR(TLS_x_rsc_13_0_AWADDR);
    hybrid_INST.x_rsc_13_0_AWID(TLS_x_rsc_13_0_AWID);
    hybrid_INST.x_rsc_triosy_13_0_lz(TLS_x_rsc_triosy_13_0_lz);
    hybrid_INST.x_rsc_14_0_s_tdone(TLS_x_rsc_14_0_s_tdone);
    hybrid_INST.x_rsc_14_0_tr_write_done(TLS_x_rsc_14_0_tr_write_done);
    hybrid_INST.x_rsc_14_0_RREADY(TLS_x_rsc_14_0_RREADY);
    hybrid_INST.x_rsc_14_0_RVALID(TLS_x_rsc_14_0_RVALID);
    hybrid_INST.x_rsc_14_0_RUSER(TLS_x_rsc_14_0_RUSER);
    hybrid_INST.x_rsc_14_0_RLAST(TLS_x_rsc_14_0_RLAST);
    hybrid_INST.x_rsc_14_0_RRESP(TLS_x_rsc_14_0_RRESP);
    hybrid_INST.x_rsc_14_0_RDATA(TLS_x_rsc_14_0_RDATA);
    hybrid_INST.x_rsc_14_0_RID(TLS_x_rsc_14_0_RID);
    hybrid_INST.x_rsc_14_0_ARREADY(TLS_x_rsc_14_0_ARREADY);
    hybrid_INST.x_rsc_14_0_ARVALID(TLS_x_rsc_14_0_ARVALID);
    hybrid_INST.x_rsc_14_0_ARUSER(TLS_x_rsc_14_0_ARUSER);
    hybrid_INST.x_rsc_14_0_ARREGION(TLS_x_rsc_14_0_ARREGION);
    hybrid_INST.x_rsc_14_0_ARQOS(TLS_x_rsc_14_0_ARQOS);
    hybrid_INST.x_rsc_14_0_ARPROT(TLS_x_rsc_14_0_ARPROT);
    hybrid_INST.x_rsc_14_0_ARCACHE(TLS_x_rsc_14_0_ARCACHE);
    hybrid_INST.x_rsc_14_0_ARLOCK(TLS_x_rsc_14_0_ARLOCK);
    hybrid_INST.x_rsc_14_0_ARBURST(TLS_x_rsc_14_0_ARBURST);
    hybrid_INST.x_rsc_14_0_ARSIZE(TLS_x_rsc_14_0_ARSIZE);
    hybrid_INST.x_rsc_14_0_ARLEN(TLS_x_rsc_14_0_ARLEN);
    hybrid_INST.x_rsc_14_0_ARADDR(TLS_x_rsc_14_0_ARADDR);
    hybrid_INST.x_rsc_14_0_ARID(TLS_x_rsc_14_0_ARID);
    hybrid_INST.x_rsc_14_0_BREADY(TLS_x_rsc_14_0_BREADY);
    hybrid_INST.x_rsc_14_0_BVALID(TLS_x_rsc_14_0_BVALID);
    hybrid_INST.x_rsc_14_0_BUSER(TLS_x_rsc_14_0_BUSER);
    hybrid_INST.x_rsc_14_0_BRESP(TLS_x_rsc_14_0_BRESP);
    hybrid_INST.x_rsc_14_0_BID(TLS_x_rsc_14_0_BID);
    hybrid_INST.x_rsc_14_0_WREADY(TLS_x_rsc_14_0_WREADY);
    hybrid_INST.x_rsc_14_0_WVALID(TLS_x_rsc_14_0_WVALID);
    hybrid_INST.x_rsc_14_0_WUSER(TLS_x_rsc_14_0_WUSER);
    hybrid_INST.x_rsc_14_0_WLAST(TLS_x_rsc_14_0_WLAST);
    hybrid_INST.x_rsc_14_0_WSTRB(TLS_x_rsc_14_0_WSTRB);
    hybrid_INST.x_rsc_14_0_WDATA(TLS_x_rsc_14_0_WDATA);
    hybrid_INST.x_rsc_14_0_AWREADY(TLS_x_rsc_14_0_AWREADY);
    hybrid_INST.x_rsc_14_0_AWVALID(TLS_x_rsc_14_0_AWVALID);
    hybrid_INST.x_rsc_14_0_AWUSER(TLS_x_rsc_14_0_AWUSER);
    hybrid_INST.x_rsc_14_0_AWREGION(TLS_x_rsc_14_0_AWREGION);
    hybrid_INST.x_rsc_14_0_AWQOS(TLS_x_rsc_14_0_AWQOS);
    hybrid_INST.x_rsc_14_0_AWPROT(TLS_x_rsc_14_0_AWPROT);
    hybrid_INST.x_rsc_14_0_AWCACHE(TLS_x_rsc_14_0_AWCACHE);
    hybrid_INST.x_rsc_14_0_AWLOCK(TLS_x_rsc_14_0_AWLOCK);
    hybrid_INST.x_rsc_14_0_AWBURST(TLS_x_rsc_14_0_AWBURST);
    hybrid_INST.x_rsc_14_0_AWSIZE(TLS_x_rsc_14_0_AWSIZE);
    hybrid_INST.x_rsc_14_0_AWLEN(TLS_x_rsc_14_0_AWLEN);
    hybrid_INST.x_rsc_14_0_AWADDR(TLS_x_rsc_14_0_AWADDR);
    hybrid_INST.x_rsc_14_0_AWID(TLS_x_rsc_14_0_AWID);
    hybrid_INST.x_rsc_triosy_14_0_lz(TLS_x_rsc_triosy_14_0_lz);
    hybrid_INST.x_rsc_15_0_s_tdone(TLS_x_rsc_15_0_s_tdone);
    hybrid_INST.x_rsc_15_0_tr_write_done(TLS_x_rsc_15_0_tr_write_done);
    hybrid_INST.x_rsc_15_0_RREADY(TLS_x_rsc_15_0_RREADY);
    hybrid_INST.x_rsc_15_0_RVALID(TLS_x_rsc_15_0_RVALID);
    hybrid_INST.x_rsc_15_0_RUSER(TLS_x_rsc_15_0_RUSER);
    hybrid_INST.x_rsc_15_0_RLAST(TLS_x_rsc_15_0_RLAST);
    hybrid_INST.x_rsc_15_0_RRESP(TLS_x_rsc_15_0_RRESP);
    hybrid_INST.x_rsc_15_0_RDATA(TLS_x_rsc_15_0_RDATA);
    hybrid_INST.x_rsc_15_0_RID(TLS_x_rsc_15_0_RID);
    hybrid_INST.x_rsc_15_0_ARREADY(TLS_x_rsc_15_0_ARREADY);
    hybrid_INST.x_rsc_15_0_ARVALID(TLS_x_rsc_15_0_ARVALID);
    hybrid_INST.x_rsc_15_0_ARUSER(TLS_x_rsc_15_0_ARUSER);
    hybrid_INST.x_rsc_15_0_ARREGION(TLS_x_rsc_15_0_ARREGION);
    hybrid_INST.x_rsc_15_0_ARQOS(TLS_x_rsc_15_0_ARQOS);
    hybrid_INST.x_rsc_15_0_ARPROT(TLS_x_rsc_15_0_ARPROT);
    hybrid_INST.x_rsc_15_0_ARCACHE(TLS_x_rsc_15_0_ARCACHE);
    hybrid_INST.x_rsc_15_0_ARLOCK(TLS_x_rsc_15_0_ARLOCK);
    hybrid_INST.x_rsc_15_0_ARBURST(TLS_x_rsc_15_0_ARBURST);
    hybrid_INST.x_rsc_15_0_ARSIZE(TLS_x_rsc_15_0_ARSIZE);
    hybrid_INST.x_rsc_15_0_ARLEN(TLS_x_rsc_15_0_ARLEN);
    hybrid_INST.x_rsc_15_0_ARADDR(TLS_x_rsc_15_0_ARADDR);
    hybrid_INST.x_rsc_15_0_ARID(TLS_x_rsc_15_0_ARID);
    hybrid_INST.x_rsc_15_0_BREADY(TLS_x_rsc_15_0_BREADY);
    hybrid_INST.x_rsc_15_0_BVALID(TLS_x_rsc_15_0_BVALID);
    hybrid_INST.x_rsc_15_0_BUSER(TLS_x_rsc_15_0_BUSER);
    hybrid_INST.x_rsc_15_0_BRESP(TLS_x_rsc_15_0_BRESP);
    hybrid_INST.x_rsc_15_0_BID(TLS_x_rsc_15_0_BID);
    hybrid_INST.x_rsc_15_0_WREADY(TLS_x_rsc_15_0_WREADY);
    hybrid_INST.x_rsc_15_0_WVALID(TLS_x_rsc_15_0_WVALID);
    hybrid_INST.x_rsc_15_0_WUSER(TLS_x_rsc_15_0_WUSER);
    hybrid_INST.x_rsc_15_0_WLAST(TLS_x_rsc_15_0_WLAST);
    hybrid_INST.x_rsc_15_0_WSTRB(TLS_x_rsc_15_0_WSTRB);
    hybrid_INST.x_rsc_15_0_WDATA(TLS_x_rsc_15_0_WDATA);
    hybrid_INST.x_rsc_15_0_AWREADY(TLS_x_rsc_15_0_AWREADY);
    hybrid_INST.x_rsc_15_0_AWVALID(TLS_x_rsc_15_0_AWVALID);
    hybrid_INST.x_rsc_15_0_AWUSER(TLS_x_rsc_15_0_AWUSER);
    hybrid_INST.x_rsc_15_0_AWREGION(TLS_x_rsc_15_0_AWREGION);
    hybrid_INST.x_rsc_15_0_AWQOS(TLS_x_rsc_15_0_AWQOS);
    hybrid_INST.x_rsc_15_0_AWPROT(TLS_x_rsc_15_0_AWPROT);
    hybrid_INST.x_rsc_15_0_AWCACHE(TLS_x_rsc_15_0_AWCACHE);
    hybrid_INST.x_rsc_15_0_AWLOCK(TLS_x_rsc_15_0_AWLOCK);
    hybrid_INST.x_rsc_15_0_AWBURST(TLS_x_rsc_15_0_AWBURST);
    hybrid_INST.x_rsc_15_0_AWSIZE(TLS_x_rsc_15_0_AWSIZE);
    hybrid_INST.x_rsc_15_0_AWLEN(TLS_x_rsc_15_0_AWLEN);
    hybrid_INST.x_rsc_15_0_AWADDR(TLS_x_rsc_15_0_AWADDR);
    hybrid_INST.x_rsc_15_0_AWID(TLS_x_rsc_15_0_AWID);
    hybrid_INST.x_rsc_triosy_15_0_lz(TLS_x_rsc_triosy_15_0_lz);
    hybrid_INST.x_rsc_16_0_s_tdone(TLS_x_rsc_16_0_s_tdone);
    hybrid_INST.x_rsc_16_0_tr_write_done(TLS_x_rsc_16_0_tr_write_done);
    hybrid_INST.x_rsc_16_0_RREADY(TLS_x_rsc_16_0_RREADY);
    hybrid_INST.x_rsc_16_0_RVALID(TLS_x_rsc_16_0_RVALID);
    hybrid_INST.x_rsc_16_0_RUSER(TLS_x_rsc_16_0_RUSER);
    hybrid_INST.x_rsc_16_0_RLAST(TLS_x_rsc_16_0_RLAST);
    hybrid_INST.x_rsc_16_0_RRESP(TLS_x_rsc_16_0_RRESP);
    hybrid_INST.x_rsc_16_0_RDATA(TLS_x_rsc_16_0_RDATA);
    hybrid_INST.x_rsc_16_0_RID(TLS_x_rsc_16_0_RID);
    hybrid_INST.x_rsc_16_0_ARREADY(TLS_x_rsc_16_0_ARREADY);
    hybrid_INST.x_rsc_16_0_ARVALID(TLS_x_rsc_16_0_ARVALID);
    hybrid_INST.x_rsc_16_0_ARUSER(TLS_x_rsc_16_0_ARUSER);
    hybrid_INST.x_rsc_16_0_ARREGION(TLS_x_rsc_16_0_ARREGION);
    hybrid_INST.x_rsc_16_0_ARQOS(TLS_x_rsc_16_0_ARQOS);
    hybrid_INST.x_rsc_16_0_ARPROT(TLS_x_rsc_16_0_ARPROT);
    hybrid_INST.x_rsc_16_0_ARCACHE(TLS_x_rsc_16_0_ARCACHE);
    hybrid_INST.x_rsc_16_0_ARLOCK(TLS_x_rsc_16_0_ARLOCK);
    hybrid_INST.x_rsc_16_0_ARBURST(TLS_x_rsc_16_0_ARBURST);
    hybrid_INST.x_rsc_16_0_ARSIZE(TLS_x_rsc_16_0_ARSIZE);
    hybrid_INST.x_rsc_16_0_ARLEN(TLS_x_rsc_16_0_ARLEN);
    hybrid_INST.x_rsc_16_0_ARADDR(TLS_x_rsc_16_0_ARADDR);
    hybrid_INST.x_rsc_16_0_ARID(TLS_x_rsc_16_0_ARID);
    hybrid_INST.x_rsc_16_0_BREADY(TLS_x_rsc_16_0_BREADY);
    hybrid_INST.x_rsc_16_0_BVALID(TLS_x_rsc_16_0_BVALID);
    hybrid_INST.x_rsc_16_0_BUSER(TLS_x_rsc_16_0_BUSER);
    hybrid_INST.x_rsc_16_0_BRESP(TLS_x_rsc_16_0_BRESP);
    hybrid_INST.x_rsc_16_0_BID(TLS_x_rsc_16_0_BID);
    hybrid_INST.x_rsc_16_0_WREADY(TLS_x_rsc_16_0_WREADY);
    hybrid_INST.x_rsc_16_0_WVALID(TLS_x_rsc_16_0_WVALID);
    hybrid_INST.x_rsc_16_0_WUSER(TLS_x_rsc_16_0_WUSER);
    hybrid_INST.x_rsc_16_0_WLAST(TLS_x_rsc_16_0_WLAST);
    hybrid_INST.x_rsc_16_0_WSTRB(TLS_x_rsc_16_0_WSTRB);
    hybrid_INST.x_rsc_16_0_WDATA(TLS_x_rsc_16_0_WDATA);
    hybrid_INST.x_rsc_16_0_AWREADY(TLS_x_rsc_16_0_AWREADY);
    hybrid_INST.x_rsc_16_0_AWVALID(TLS_x_rsc_16_0_AWVALID);
    hybrid_INST.x_rsc_16_0_AWUSER(TLS_x_rsc_16_0_AWUSER);
    hybrid_INST.x_rsc_16_0_AWREGION(TLS_x_rsc_16_0_AWREGION);
    hybrid_INST.x_rsc_16_0_AWQOS(TLS_x_rsc_16_0_AWQOS);
    hybrid_INST.x_rsc_16_0_AWPROT(TLS_x_rsc_16_0_AWPROT);
    hybrid_INST.x_rsc_16_0_AWCACHE(TLS_x_rsc_16_0_AWCACHE);
    hybrid_INST.x_rsc_16_0_AWLOCK(TLS_x_rsc_16_0_AWLOCK);
    hybrid_INST.x_rsc_16_0_AWBURST(TLS_x_rsc_16_0_AWBURST);
    hybrid_INST.x_rsc_16_0_AWSIZE(TLS_x_rsc_16_0_AWSIZE);
    hybrid_INST.x_rsc_16_0_AWLEN(TLS_x_rsc_16_0_AWLEN);
    hybrid_INST.x_rsc_16_0_AWADDR(TLS_x_rsc_16_0_AWADDR);
    hybrid_INST.x_rsc_16_0_AWID(TLS_x_rsc_16_0_AWID);
    hybrid_INST.x_rsc_triosy_16_0_lz(TLS_x_rsc_triosy_16_0_lz);
    hybrid_INST.x_rsc_17_0_s_tdone(TLS_x_rsc_17_0_s_tdone);
    hybrid_INST.x_rsc_17_0_tr_write_done(TLS_x_rsc_17_0_tr_write_done);
    hybrid_INST.x_rsc_17_0_RREADY(TLS_x_rsc_17_0_RREADY);
    hybrid_INST.x_rsc_17_0_RVALID(TLS_x_rsc_17_0_RVALID);
    hybrid_INST.x_rsc_17_0_RUSER(TLS_x_rsc_17_0_RUSER);
    hybrid_INST.x_rsc_17_0_RLAST(TLS_x_rsc_17_0_RLAST);
    hybrid_INST.x_rsc_17_0_RRESP(TLS_x_rsc_17_0_RRESP);
    hybrid_INST.x_rsc_17_0_RDATA(TLS_x_rsc_17_0_RDATA);
    hybrid_INST.x_rsc_17_0_RID(TLS_x_rsc_17_0_RID);
    hybrid_INST.x_rsc_17_0_ARREADY(TLS_x_rsc_17_0_ARREADY);
    hybrid_INST.x_rsc_17_0_ARVALID(TLS_x_rsc_17_0_ARVALID);
    hybrid_INST.x_rsc_17_0_ARUSER(TLS_x_rsc_17_0_ARUSER);
    hybrid_INST.x_rsc_17_0_ARREGION(TLS_x_rsc_17_0_ARREGION);
    hybrid_INST.x_rsc_17_0_ARQOS(TLS_x_rsc_17_0_ARQOS);
    hybrid_INST.x_rsc_17_0_ARPROT(TLS_x_rsc_17_0_ARPROT);
    hybrid_INST.x_rsc_17_0_ARCACHE(TLS_x_rsc_17_0_ARCACHE);
    hybrid_INST.x_rsc_17_0_ARLOCK(TLS_x_rsc_17_0_ARLOCK);
    hybrid_INST.x_rsc_17_0_ARBURST(TLS_x_rsc_17_0_ARBURST);
    hybrid_INST.x_rsc_17_0_ARSIZE(TLS_x_rsc_17_0_ARSIZE);
    hybrid_INST.x_rsc_17_0_ARLEN(TLS_x_rsc_17_0_ARLEN);
    hybrid_INST.x_rsc_17_0_ARADDR(TLS_x_rsc_17_0_ARADDR);
    hybrid_INST.x_rsc_17_0_ARID(TLS_x_rsc_17_0_ARID);
    hybrid_INST.x_rsc_17_0_BREADY(TLS_x_rsc_17_0_BREADY);
    hybrid_INST.x_rsc_17_0_BVALID(TLS_x_rsc_17_0_BVALID);
    hybrid_INST.x_rsc_17_0_BUSER(TLS_x_rsc_17_0_BUSER);
    hybrid_INST.x_rsc_17_0_BRESP(TLS_x_rsc_17_0_BRESP);
    hybrid_INST.x_rsc_17_0_BID(TLS_x_rsc_17_0_BID);
    hybrid_INST.x_rsc_17_0_WREADY(TLS_x_rsc_17_0_WREADY);
    hybrid_INST.x_rsc_17_0_WVALID(TLS_x_rsc_17_0_WVALID);
    hybrid_INST.x_rsc_17_0_WUSER(TLS_x_rsc_17_0_WUSER);
    hybrid_INST.x_rsc_17_0_WLAST(TLS_x_rsc_17_0_WLAST);
    hybrid_INST.x_rsc_17_0_WSTRB(TLS_x_rsc_17_0_WSTRB);
    hybrid_INST.x_rsc_17_0_WDATA(TLS_x_rsc_17_0_WDATA);
    hybrid_INST.x_rsc_17_0_AWREADY(TLS_x_rsc_17_0_AWREADY);
    hybrid_INST.x_rsc_17_0_AWVALID(TLS_x_rsc_17_0_AWVALID);
    hybrid_INST.x_rsc_17_0_AWUSER(TLS_x_rsc_17_0_AWUSER);
    hybrid_INST.x_rsc_17_0_AWREGION(TLS_x_rsc_17_0_AWREGION);
    hybrid_INST.x_rsc_17_0_AWQOS(TLS_x_rsc_17_0_AWQOS);
    hybrid_INST.x_rsc_17_0_AWPROT(TLS_x_rsc_17_0_AWPROT);
    hybrid_INST.x_rsc_17_0_AWCACHE(TLS_x_rsc_17_0_AWCACHE);
    hybrid_INST.x_rsc_17_0_AWLOCK(TLS_x_rsc_17_0_AWLOCK);
    hybrid_INST.x_rsc_17_0_AWBURST(TLS_x_rsc_17_0_AWBURST);
    hybrid_INST.x_rsc_17_0_AWSIZE(TLS_x_rsc_17_0_AWSIZE);
    hybrid_INST.x_rsc_17_0_AWLEN(TLS_x_rsc_17_0_AWLEN);
    hybrid_INST.x_rsc_17_0_AWADDR(TLS_x_rsc_17_0_AWADDR);
    hybrid_INST.x_rsc_17_0_AWID(TLS_x_rsc_17_0_AWID);
    hybrid_INST.x_rsc_triosy_17_0_lz(TLS_x_rsc_triosy_17_0_lz);
    hybrid_INST.x_rsc_18_0_s_tdone(TLS_x_rsc_18_0_s_tdone);
    hybrid_INST.x_rsc_18_0_tr_write_done(TLS_x_rsc_18_0_tr_write_done);
    hybrid_INST.x_rsc_18_0_RREADY(TLS_x_rsc_18_0_RREADY);
    hybrid_INST.x_rsc_18_0_RVALID(TLS_x_rsc_18_0_RVALID);
    hybrid_INST.x_rsc_18_0_RUSER(TLS_x_rsc_18_0_RUSER);
    hybrid_INST.x_rsc_18_0_RLAST(TLS_x_rsc_18_0_RLAST);
    hybrid_INST.x_rsc_18_0_RRESP(TLS_x_rsc_18_0_RRESP);
    hybrid_INST.x_rsc_18_0_RDATA(TLS_x_rsc_18_0_RDATA);
    hybrid_INST.x_rsc_18_0_RID(TLS_x_rsc_18_0_RID);
    hybrid_INST.x_rsc_18_0_ARREADY(TLS_x_rsc_18_0_ARREADY);
    hybrid_INST.x_rsc_18_0_ARVALID(TLS_x_rsc_18_0_ARVALID);
    hybrid_INST.x_rsc_18_0_ARUSER(TLS_x_rsc_18_0_ARUSER);
    hybrid_INST.x_rsc_18_0_ARREGION(TLS_x_rsc_18_0_ARREGION);
    hybrid_INST.x_rsc_18_0_ARQOS(TLS_x_rsc_18_0_ARQOS);
    hybrid_INST.x_rsc_18_0_ARPROT(TLS_x_rsc_18_0_ARPROT);
    hybrid_INST.x_rsc_18_0_ARCACHE(TLS_x_rsc_18_0_ARCACHE);
    hybrid_INST.x_rsc_18_0_ARLOCK(TLS_x_rsc_18_0_ARLOCK);
    hybrid_INST.x_rsc_18_0_ARBURST(TLS_x_rsc_18_0_ARBURST);
    hybrid_INST.x_rsc_18_0_ARSIZE(TLS_x_rsc_18_0_ARSIZE);
    hybrid_INST.x_rsc_18_0_ARLEN(TLS_x_rsc_18_0_ARLEN);
    hybrid_INST.x_rsc_18_0_ARADDR(TLS_x_rsc_18_0_ARADDR);
    hybrid_INST.x_rsc_18_0_ARID(TLS_x_rsc_18_0_ARID);
    hybrid_INST.x_rsc_18_0_BREADY(TLS_x_rsc_18_0_BREADY);
    hybrid_INST.x_rsc_18_0_BVALID(TLS_x_rsc_18_0_BVALID);
    hybrid_INST.x_rsc_18_0_BUSER(TLS_x_rsc_18_0_BUSER);
    hybrid_INST.x_rsc_18_0_BRESP(TLS_x_rsc_18_0_BRESP);
    hybrid_INST.x_rsc_18_0_BID(TLS_x_rsc_18_0_BID);
    hybrid_INST.x_rsc_18_0_WREADY(TLS_x_rsc_18_0_WREADY);
    hybrid_INST.x_rsc_18_0_WVALID(TLS_x_rsc_18_0_WVALID);
    hybrid_INST.x_rsc_18_0_WUSER(TLS_x_rsc_18_0_WUSER);
    hybrid_INST.x_rsc_18_0_WLAST(TLS_x_rsc_18_0_WLAST);
    hybrid_INST.x_rsc_18_0_WSTRB(TLS_x_rsc_18_0_WSTRB);
    hybrid_INST.x_rsc_18_0_WDATA(TLS_x_rsc_18_0_WDATA);
    hybrid_INST.x_rsc_18_0_AWREADY(TLS_x_rsc_18_0_AWREADY);
    hybrid_INST.x_rsc_18_0_AWVALID(TLS_x_rsc_18_0_AWVALID);
    hybrid_INST.x_rsc_18_0_AWUSER(TLS_x_rsc_18_0_AWUSER);
    hybrid_INST.x_rsc_18_0_AWREGION(TLS_x_rsc_18_0_AWREGION);
    hybrid_INST.x_rsc_18_0_AWQOS(TLS_x_rsc_18_0_AWQOS);
    hybrid_INST.x_rsc_18_0_AWPROT(TLS_x_rsc_18_0_AWPROT);
    hybrid_INST.x_rsc_18_0_AWCACHE(TLS_x_rsc_18_0_AWCACHE);
    hybrid_INST.x_rsc_18_0_AWLOCK(TLS_x_rsc_18_0_AWLOCK);
    hybrid_INST.x_rsc_18_0_AWBURST(TLS_x_rsc_18_0_AWBURST);
    hybrid_INST.x_rsc_18_0_AWSIZE(TLS_x_rsc_18_0_AWSIZE);
    hybrid_INST.x_rsc_18_0_AWLEN(TLS_x_rsc_18_0_AWLEN);
    hybrid_INST.x_rsc_18_0_AWADDR(TLS_x_rsc_18_0_AWADDR);
    hybrid_INST.x_rsc_18_0_AWID(TLS_x_rsc_18_0_AWID);
    hybrid_INST.x_rsc_triosy_18_0_lz(TLS_x_rsc_triosy_18_0_lz);
    hybrid_INST.x_rsc_19_0_s_tdone(TLS_x_rsc_19_0_s_tdone);
    hybrid_INST.x_rsc_19_0_tr_write_done(TLS_x_rsc_19_0_tr_write_done);
    hybrid_INST.x_rsc_19_0_RREADY(TLS_x_rsc_19_0_RREADY);
    hybrid_INST.x_rsc_19_0_RVALID(TLS_x_rsc_19_0_RVALID);
    hybrid_INST.x_rsc_19_0_RUSER(TLS_x_rsc_19_0_RUSER);
    hybrid_INST.x_rsc_19_0_RLAST(TLS_x_rsc_19_0_RLAST);
    hybrid_INST.x_rsc_19_0_RRESP(TLS_x_rsc_19_0_RRESP);
    hybrid_INST.x_rsc_19_0_RDATA(TLS_x_rsc_19_0_RDATA);
    hybrid_INST.x_rsc_19_0_RID(TLS_x_rsc_19_0_RID);
    hybrid_INST.x_rsc_19_0_ARREADY(TLS_x_rsc_19_0_ARREADY);
    hybrid_INST.x_rsc_19_0_ARVALID(TLS_x_rsc_19_0_ARVALID);
    hybrid_INST.x_rsc_19_0_ARUSER(TLS_x_rsc_19_0_ARUSER);
    hybrid_INST.x_rsc_19_0_ARREGION(TLS_x_rsc_19_0_ARREGION);
    hybrid_INST.x_rsc_19_0_ARQOS(TLS_x_rsc_19_0_ARQOS);
    hybrid_INST.x_rsc_19_0_ARPROT(TLS_x_rsc_19_0_ARPROT);
    hybrid_INST.x_rsc_19_0_ARCACHE(TLS_x_rsc_19_0_ARCACHE);
    hybrid_INST.x_rsc_19_0_ARLOCK(TLS_x_rsc_19_0_ARLOCK);
    hybrid_INST.x_rsc_19_0_ARBURST(TLS_x_rsc_19_0_ARBURST);
    hybrid_INST.x_rsc_19_0_ARSIZE(TLS_x_rsc_19_0_ARSIZE);
    hybrid_INST.x_rsc_19_0_ARLEN(TLS_x_rsc_19_0_ARLEN);
    hybrid_INST.x_rsc_19_0_ARADDR(TLS_x_rsc_19_0_ARADDR);
    hybrid_INST.x_rsc_19_0_ARID(TLS_x_rsc_19_0_ARID);
    hybrid_INST.x_rsc_19_0_BREADY(TLS_x_rsc_19_0_BREADY);
    hybrid_INST.x_rsc_19_0_BVALID(TLS_x_rsc_19_0_BVALID);
    hybrid_INST.x_rsc_19_0_BUSER(TLS_x_rsc_19_0_BUSER);
    hybrid_INST.x_rsc_19_0_BRESP(TLS_x_rsc_19_0_BRESP);
    hybrid_INST.x_rsc_19_0_BID(TLS_x_rsc_19_0_BID);
    hybrid_INST.x_rsc_19_0_WREADY(TLS_x_rsc_19_0_WREADY);
    hybrid_INST.x_rsc_19_0_WVALID(TLS_x_rsc_19_0_WVALID);
    hybrid_INST.x_rsc_19_0_WUSER(TLS_x_rsc_19_0_WUSER);
    hybrid_INST.x_rsc_19_0_WLAST(TLS_x_rsc_19_0_WLAST);
    hybrid_INST.x_rsc_19_0_WSTRB(TLS_x_rsc_19_0_WSTRB);
    hybrid_INST.x_rsc_19_0_WDATA(TLS_x_rsc_19_0_WDATA);
    hybrid_INST.x_rsc_19_0_AWREADY(TLS_x_rsc_19_0_AWREADY);
    hybrid_INST.x_rsc_19_0_AWVALID(TLS_x_rsc_19_0_AWVALID);
    hybrid_INST.x_rsc_19_0_AWUSER(TLS_x_rsc_19_0_AWUSER);
    hybrid_INST.x_rsc_19_0_AWREGION(TLS_x_rsc_19_0_AWREGION);
    hybrid_INST.x_rsc_19_0_AWQOS(TLS_x_rsc_19_0_AWQOS);
    hybrid_INST.x_rsc_19_0_AWPROT(TLS_x_rsc_19_0_AWPROT);
    hybrid_INST.x_rsc_19_0_AWCACHE(TLS_x_rsc_19_0_AWCACHE);
    hybrid_INST.x_rsc_19_0_AWLOCK(TLS_x_rsc_19_0_AWLOCK);
    hybrid_INST.x_rsc_19_0_AWBURST(TLS_x_rsc_19_0_AWBURST);
    hybrid_INST.x_rsc_19_0_AWSIZE(TLS_x_rsc_19_0_AWSIZE);
    hybrid_INST.x_rsc_19_0_AWLEN(TLS_x_rsc_19_0_AWLEN);
    hybrid_INST.x_rsc_19_0_AWADDR(TLS_x_rsc_19_0_AWADDR);
    hybrid_INST.x_rsc_19_0_AWID(TLS_x_rsc_19_0_AWID);
    hybrid_INST.x_rsc_triosy_19_0_lz(TLS_x_rsc_triosy_19_0_lz);
    hybrid_INST.x_rsc_20_0_s_tdone(TLS_x_rsc_20_0_s_tdone);
    hybrid_INST.x_rsc_20_0_tr_write_done(TLS_x_rsc_20_0_tr_write_done);
    hybrid_INST.x_rsc_20_0_RREADY(TLS_x_rsc_20_0_RREADY);
    hybrid_INST.x_rsc_20_0_RVALID(TLS_x_rsc_20_0_RVALID);
    hybrid_INST.x_rsc_20_0_RUSER(TLS_x_rsc_20_0_RUSER);
    hybrid_INST.x_rsc_20_0_RLAST(TLS_x_rsc_20_0_RLAST);
    hybrid_INST.x_rsc_20_0_RRESP(TLS_x_rsc_20_0_RRESP);
    hybrid_INST.x_rsc_20_0_RDATA(TLS_x_rsc_20_0_RDATA);
    hybrid_INST.x_rsc_20_0_RID(TLS_x_rsc_20_0_RID);
    hybrid_INST.x_rsc_20_0_ARREADY(TLS_x_rsc_20_0_ARREADY);
    hybrid_INST.x_rsc_20_0_ARVALID(TLS_x_rsc_20_0_ARVALID);
    hybrid_INST.x_rsc_20_0_ARUSER(TLS_x_rsc_20_0_ARUSER);
    hybrid_INST.x_rsc_20_0_ARREGION(TLS_x_rsc_20_0_ARREGION);
    hybrid_INST.x_rsc_20_0_ARQOS(TLS_x_rsc_20_0_ARQOS);
    hybrid_INST.x_rsc_20_0_ARPROT(TLS_x_rsc_20_0_ARPROT);
    hybrid_INST.x_rsc_20_0_ARCACHE(TLS_x_rsc_20_0_ARCACHE);
    hybrid_INST.x_rsc_20_0_ARLOCK(TLS_x_rsc_20_0_ARLOCK);
    hybrid_INST.x_rsc_20_0_ARBURST(TLS_x_rsc_20_0_ARBURST);
    hybrid_INST.x_rsc_20_0_ARSIZE(TLS_x_rsc_20_0_ARSIZE);
    hybrid_INST.x_rsc_20_0_ARLEN(TLS_x_rsc_20_0_ARLEN);
    hybrid_INST.x_rsc_20_0_ARADDR(TLS_x_rsc_20_0_ARADDR);
    hybrid_INST.x_rsc_20_0_ARID(TLS_x_rsc_20_0_ARID);
    hybrid_INST.x_rsc_20_0_BREADY(TLS_x_rsc_20_0_BREADY);
    hybrid_INST.x_rsc_20_0_BVALID(TLS_x_rsc_20_0_BVALID);
    hybrid_INST.x_rsc_20_0_BUSER(TLS_x_rsc_20_0_BUSER);
    hybrid_INST.x_rsc_20_0_BRESP(TLS_x_rsc_20_0_BRESP);
    hybrid_INST.x_rsc_20_0_BID(TLS_x_rsc_20_0_BID);
    hybrid_INST.x_rsc_20_0_WREADY(TLS_x_rsc_20_0_WREADY);
    hybrid_INST.x_rsc_20_0_WVALID(TLS_x_rsc_20_0_WVALID);
    hybrid_INST.x_rsc_20_0_WUSER(TLS_x_rsc_20_0_WUSER);
    hybrid_INST.x_rsc_20_0_WLAST(TLS_x_rsc_20_0_WLAST);
    hybrid_INST.x_rsc_20_0_WSTRB(TLS_x_rsc_20_0_WSTRB);
    hybrid_INST.x_rsc_20_0_WDATA(TLS_x_rsc_20_0_WDATA);
    hybrid_INST.x_rsc_20_0_AWREADY(TLS_x_rsc_20_0_AWREADY);
    hybrid_INST.x_rsc_20_0_AWVALID(TLS_x_rsc_20_0_AWVALID);
    hybrid_INST.x_rsc_20_0_AWUSER(TLS_x_rsc_20_0_AWUSER);
    hybrid_INST.x_rsc_20_0_AWREGION(TLS_x_rsc_20_0_AWREGION);
    hybrid_INST.x_rsc_20_0_AWQOS(TLS_x_rsc_20_0_AWQOS);
    hybrid_INST.x_rsc_20_0_AWPROT(TLS_x_rsc_20_0_AWPROT);
    hybrid_INST.x_rsc_20_0_AWCACHE(TLS_x_rsc_20_0_AWCACHE);
    hybrid_INST.x_rsc_20_0_AWLOCK(TLS_x_rsc_20_0_AWLOCK);
    hybrid_INST.x_rsc_20_0_AWBURST(TLS_x_rsc_20_0_AWBURST);
    hybrid_INST.x_rsc_20_0_AWSIZE(TLS_x_rsc_20_0_AWSIZE);
    hybrid_INST.x_rsc_20_0_AWLEN(TLS_x_rsc_20_0_AWLEN);
    hybrid_INST.x_rsc_20_0_AWADDR(TLS_x_rsc_20_0_AWADDR);
    hybrid_INST.x_rsc_20_0_AWID(TLS_x_rsc_20_0_AWID);
    hybrid_INST.x_rsc_triosy_20_0_lz(TLS_x_rsc_triosy_20_0_lz);
    hybrid_INST.x_rsc_21_0_s_tdone(TLS_x_rsc_21_0_s_tdone);
    hybrid_INST.x_rsc_21_0_tr_write_done(TLS_x_rsc_21_0_tr_write_done);
    hybrid_INST.x_rsc_21_0_RREADY(TLS_x_rsc_21_0_RREADY);
    hybrid_INST.x_rsc_21_0_RVALID(TLS_x_rsc_21_0_RVALID);
    hybrid_INST.x_rsc_21_0_RUSER(TLS_x_rsc_21_0_RUSER);
    hybrid_INST.x_rsc_21_0_RLAST(TLS_x_rsc_21_0_RLAST);
    hybrid_INST.x_rsc_21_0_RRESP(TLS_x_rsc_21_0_RRESP);
    hybrid_INST.x_rsc_21_0_RDATA(TLS_x_rsc_21_0_RDATA);
    hybrid_INST.x_rsc_21_0_RID(TLS_x_rsc_21_0_RID);
    hybrid_INST.x_rsc_21_0_ARREADY(TLS_x_rsc_21_0_ARREADY);
    hybrid_INST.x_rsc_21_0_ARVALID(TLS_x_rsc_21_0_ARVALID);
    hybrid_INST.x_rsc_21_0_ARUSER(TLS_x_rsc_21_0_ARUSER);
    hybrid_INST.x_rsc_21_0_ARREGION(TLS_x_rsc_21_0_ARREGION);
    hybrid_INST.x_rsc_21_0_ARQOS(TLS_x_rsc_21_0_ARQOS);
    hybrid_INST.x_rsc_21_0_ARPROT(TLS_x_rsc_21_0_ARPROT);
    hybrid_INST.x_rsc_21_0_ARCACHE(TLS_x_rsc_21_0_ARCACHE);
    hybrid_INST.x_rsc_21_0_ARLOCK(TLS_x_rsc_21_0_ARLOCK);
    hybrid_INST.x_rsc_21_0_ARBURST(TLS_x_rsc_21_0_ARBURST);
    hybrid_INST.x_rsc_21_0_ARSIZE(TLS_x_rsc_21_0_ARSIZE);
    hybrid_INST.x_rsc_21_0_ARLEN(TLS_x_rsc_21_0_ARLEN);
    hybrid_INST.x_rsc_21_0_ARADDR(TLS_x_rsc_21_0_ARADDR);
    hybrid_INST.x_rsc_21_0_ARID(TLS_x_rsc_21_0_ARID);
    hybrid_INST.x_rsc_21_0_BREADY(TLS_x_rsc_21_0_BREADY);
    hybrid_INST.x_rsc_21_0_BVALID(TLS_x_rsc_21_0_BVALID);
    hybrid_INST.x_rsc_21_0_BUSER(TLS_x_rsc_21_0_BUSER);
    hybrid_INST.x_rsc_21_0_BRESP(TLS_x_rsc_21_0_BRESP);
    hybrid_INST.x_rsc_21_0_BID(TLS_x_rsc_21_0_BID);
    hybrid_INST.x_rsc_21_0_WREADY(TLS_x_rsc_21_0_WREADY);
    hybrid_INST.x_rsc_21_0_WVALID(TLS_x_rsc_21_0_WVALID);
    hybrid_INST.x_rsc_21_0_WUSER(TLS_x_rsc_21_0_WUSER);
    hybrid_INST.x_rsc_21_0_WLAST(TLS_x_rsc_21_0_WLAST);
    hybrid_INST.x_rsc_21_0_WSTRB(TLS_x_rsc_21_0_WSTRB);
    hybrid_INST.x_rsc_21_0_WDATA(TLS_x_rsc_21_0_WDATA);
    hybrid_INST.x_rsc_21_0_AWREADY(TLS_x_rsc_21_0_AWREADY);
    hybrid_INST.x_rsc_21_0_AWVALID(TLS_x_rsc_21_0_AWVALID);
    hybrid_INST.x_rsc_21_0_AWUSER(TLS_x_rsc_21_0_AWUSER);
    hybrid_INST.x_rsc_21_0_AWREGION(TLS_x_rsc_21_0_AWREGION);
    hybrid_INST.x_rsc_21_0_AWQOS(TLS_x_rsc_21_0_AWQOS);
    hybrid_INST.x_rsc_21_0_AWPROT(TLS_x_rsc_21_0_AWPROT);
    hybrid_INST.x_rsc_21_0_AWCACHE(TLS_x_rsc_21_0_AWCACHE);
    hybrid_INST.x_rsc_21_0_AWLOCK(TLS_x_rsc_21_0_AWLOCK);
    hybrid_INST.x_rsc_21_0_AWBURST(TLS_x_rsc_21_0_AWBURST);
    hybrid_INST.x_rsc_21_0_AWSIZE(TLS_x_rsc_21_0_AWSIZE);
    hybrid_INST.x_rsc_21_0_AWLEN(TLS_x_rsc_21_0_AWLEN);
    hybrid_INST.x_rsc_21_0_AWADDR(TLS_x_rsc_21_0_AWADDR);
    hybrid_INST.x_rsc_21_0_AWID(TLS_x_rsc_21_0_AWID);
    hybrid_INST.x_rsc_triosy_21_0_lz(TLS_x_rsc_triosy_21_0_lz);
    hybrid_INST.x_rsc_22_0_s_tdone(TLS_x_rsc_22_0_s_tdone);
    hybrid_INST.x_rsc_22_0_tr_write_done(TLS_x_rsc_22_0_tr_write_done);
    hybrid_INST.x_rsc_22_0_RREADY(TLS_x_rsc_22_0_RREADY);
    hybrid_INST.x_rsc_22_0_RVALID(TLS_x_rsc_22_0_RVALID);
    hybrid_INST.x_rsc_22_0_RUSER(TLS_x_rsc_22_0_RUSER);
    hybrid_INST.x_rsc_22_0_RLAST(TLS_x_rsc_22_0_RLAST);
    hybrid_INST.x_rsc_22_0_RRESP(TLS_x_rsc_22_0_RRESP);
    hybrid_INST.x_rsc_22_0_RDATA(TLS_x_rsc_22_0_RDATA);
    hybrid_INST.x_rsc_22_0_RID(TLS_x_rsc_22_0_RID);
    hybrid_INST.x_rsc_22_0_ARREADY(TLS_x_rsc_22_0_ARREADY);
    hybrid_INST.x_rsc_22_0_ARVALID(TLS_x_rsc_22_0_ARVALID);
    hybrid_INST.x_rsc_22_0_ARUSER(TLS_x_rsc_22_0_ARUSER);
    hybrid_INST.x_rsc_22_0_ARREGION(TLS_x_rsc_22_0_ARREGION);
    hybrid_INST.x_rsc_22_0_ARQOS(TLS_x_rsc_22_0_ARQOS);
    hybrid_INST.x_rsc_22_0_ARPROT(TLS_x_rsc_22_0_ARPROT);
    hybrid_INST.x_rsc_22_0_ARCACHE(TLS_x_rsc_22_0_ARCACHE);
    hybrid_INST.x_rsc_22_0_ARLOCK(TLS_x_rsc_22_0_ARLOCK);
    hybrid_INST.x_rsc_22_0_ARBURST(TLS_x_rsc_22_0_ARBURST);
    hybrid_INST.x_rsc_22_0_ARSIZE(TLS_x_rsc_22_0_ARSIZE);
    hybrid_INST.x_rsc_22_0_ARLEN(TLS_x_rsc_22_0_ARLEN);
    hybrid_INST.x_rsc_22_0_ARADDR(TLS_x_rsc_22_0_ARADDR);
    hybrid_INST.x_rsc_22_0_ARID(TLS_x_rsc_22_0_ARID);
    hybrid_INST.x_rsc_22_0_BREADY(TLS_x_rsc_22_0_BREADY);
    hybrid_INST.x_rsc_22_0_BVALID(TLS_x_rsc_22_0_BVALID);
    hybrid_INST.x_rsc_22_0_BUSER(TLS_x_rsc_22_0_BUSER);
    hybrid_INST.x_rsc_22_0_BRESP(TLS_x_rsc_22_0_BRESP);
    hybrid_INST.x_rsc_22_0_BID(TLS_x_rsc_22_0_BID);
    hybrid_INST.x_rsc_22_0_WREADY(TLS_x_rsc_22_0_WREADY);
    hybrid_INST.x_rsc_22_0_WVALID(TLS_x_rsc_22_0_WVALID);
    hybrid_INST.x_rsc_22_0_WUSER(TLS_x_rsc_22_0_WUSER);
    hybrid_INST.x_rsc_22_0_WLAST(TLS_x_rsc_22_0_WLAST);
    hybrid_INST.x_rsc_22_0_WSTRB(TLS_x_rsc_22_0_WSTRB);
    hybrid_INST.x_rsc_22_0_WDATA(TLS_x_rsc_22_0_WDATA);
    hybrid_INST.x_rsc_22_0_AWREADY(TLS_x_rsc_22_0_AWREADY);
    hybrid_INST.x_rsc_22_0_AWVALID(TLS_x_rsc_22_0_AWVALID);
    hybrid_INST.x_rsc_22_0_AWUSER(TLS_x_rsc_22_0_AWUSER);
    hybrid_INST.x_rsc_22_0_AWREGION(TLS_x_rsc_22_0_AWREGION);
    hybrid_INST.x_rsc_22_0_AWQOS(TLS_x_rsc_22_0_AWQOS);
    hybrid_INST.x_rsc_22_0_AWPROT(TLS_x_rsc_22_0_AWPROT);
    hybrid_INST.x_rsc_22_0_AWCACHE(TLS_x_rsc_22_0_AWCACHE);
    hybrid_INST.x_rsc_22_0_AWLOCK(TLS_x_rsc_22_0_AWLOCK);
    hybrid_INST.x_rsc_22_0_AWBURST(TLS_x_rsc_22_0_AWBURST);
    hybrid_INST.x_rsc_22_0_AWSIZE(TLS_x_rsc_22_0_AWSIZE);
    hybrid_INST.x_rsc_22_0_AWLEN(TLS_x_rsc_22_0_AWLEN);
    hybrid_INST.x_rsc_22_0_AWADDR(TLS_x_rsc_22_0_AWADDR);
    hybrid_INST.x_rsc_22_0_AWID(TLS_x_rsc_22_0_AWID);
    hybrid_INST.x_rsc_triosy_22_0_lz(TLS_x_rsc_triosy_22_0_lz);
    hybrid_INST.x_rsc_23_0_s_tdone(TLS_x_rsc_23_0_s_tdone);
    hybrid_INST.x_rsc_23_0_tr_write_done(TLS_x_rsc_23_0_tr_write_done);
    hybrid_INST.x_rsc_23_0_RREADY(TLS_x_rsc_23_0_RREADY);
    hybrid_INST.x_rsc_23_0_RVALID(TLS_x_rsc_23_0_RVALID);
    hybrid_INST.x_rsc_23_0_RUSER(TLS_x_rsc_23_0_RUSER);
    hybrid_INST.x_rsc_23_0_RLAST(TLS_x_rsc_23_0_RLAST);
    hybrid_INST.x_rsc_23_0_RRESP(TLS_x_rsc_23_0_RRESP);
    hybrid_INST.x_rsc_23_0_RDATA(TLS_x_rsc_23_0_RDATA);
    hybrid_INST.x_rsc_23_0_RID(TLS_x_rsc_23_0_RID);
    hybrid_INST.x_rsc_23_0_ARREADY(TLS_x_rsc_23_0_ARREADY);
    hybrid_INST.x_rsc_23_0_ARVALID(TLS_x_rsc_23_0_ARVALID);
    hybrid_INST.x_rsc_23_0_ARUSER(TLS_x_rsc_23_0_ARUSER);
    hybrid_INST.x_rsc_23_0_ARREGION(TLS_x_rsc_23_0_ARREGION);
    hybrid_INST.x_rsc_23_0_ARQOS(TLS_x_rsc_23_0_ARQOS);
    hybrid_INST.x_rsc_23_0_ARPROT(TLS_x_rsc_23_0_ARPROT);
    hybrid_INST.x_rsc_23_0_ARCACHE(TLS_x_rsc_23_0_ARCACHE);
    hybrid_INST.x_rsc_23_0_ARLOCK(TLS_x_rsc_23_0_ARLOCK);
    hybrid_INST.x_rsc_23_0_ARBURST(TLS_x_rsc_23_0_ARBURST);
    hybrid_INST.x_rsc_23_0_ARSIZE(TLS_x_rsc_23_0_ARSIZE);
    hybrid_INST.x_rsc_23_0_ARLEN(TLS_x_rsc_23_0_ARLEN);
    hybrid_INST.x_rsc_23_0_ARADDR(TLS_x_rsc_23_0_ARADDR);
    hybrid_INST.x_rsc_23_0_ARID(TLS_x_rsc_23_0_ARID);
    hybrid_INST.x_rsc_23_0_BREADY(TLS_x_rsc_23_0_BREADY);
    hybrid_INST.x_rsc_23_0_BVALID(TLS_x_rsc_23_0_BVALID);
    hybrid_INST.x_rsc_23_0_BUSER(TLS_x_rsc_23_0_BUSER);
    hybrid_INST.x_rsc_23_0_BRESP(TLS_x_rsc_23_0_BRESP);
    hybrid_INST.x_rsc_23_0_BID(TLS_x_rsc_23_0_BID);
    hybrid_INST.x_rsc_23_0_WREADY(TLS_x_rsc_23_0_WREADY);
    hybrid_INST.x_rsc_23_0_WVALID(TLS_x_rsc_23_0_WVALID);
    hybrid_INST.x_rsc_23_0_WUSER(TLS_x_rsc_23_0_WUSER);
    hybrid_INST.x_rsc_23_0_WLAST(TLS_x_rsc_23_0_WLAST);
    hybrid_INST.x_rsc_23_0_WSTRB(TLS_x_rsc_23_0_WSTRB);
    hybrid_INST.x_rsc_23_0_WDATA(TLS_x_rsc_23_0_WDATA);
    hybrid_INST.x_rsc_23_0_AWREADY(TLS_x_rsc_23_0_AWREADY);
    hybrid_INST.x_rsc_23_0_AWVALID(TLS_x_rsc_23_0_AWVALID);
    hybrid_INST.x_rsc_23_0_AWUSER(TLS_x_rsc_23_0_AWUSER);
    hybrid_INST.x_rsc_23_0_AWREGION(TLS_x_rsc_23_0_AWREGION);
    hybrid_INST.x_rsc_23_0_AWQOS(TLS_x_rsc_23_0_AWQOS);
    hybrid_INST.x_rsc_23_0_AWPROT(TLS_x_rsc_23_0_AWPROT);
    hybrid_INST.x_rsc_23_0_AWCACHE(TLS_x_rsc_23_0_AWCACHE);
    hybrid_INST.x_rsc_23_0_AWLOCK(TLS_x_rsc_23_0_AWLOCK);
    hybrid_INST.x_rsc_23_0_AWBURST(TLS_x_rsc_23_0_AWBURST);
    hybrid_INST.x_rsc_23_0_AWSIZE(TLS_x_rsc_23_0_AWSIZE);
    hybrid_INST.x_rsc_23_0_AWLEN(TLS_x_rsc_23_0_AWLEN);
    hybrid_INST.x_rsc_23_0_AWADDR(TLS_x_rsc_23_0_AWADDR);
    hybrid_INST.x_rsc_23_0_AWID(TLS_x_rsc_23_0_AWID);
    hybrid_INST.x_rsc_triosy_23_0_lz(TLS_x_rsc_triosy_23_0_lz);
    hybrid_INST.x_rsc_24_0_s_tdone(TLS_x_rsc_24_0_s_tdone);
    hybrid_INST.x_rsc_24_0_tr_write_done(TLS_x_rsc_24_0_tr_write_done);
    hybrid_INST.x_rsc_24_0_RREADY(TLS_x_rsc_24_0_RREADY);
    hybrid_INST.x_rsc_24_0_RVALID(TLS_x_rsc_24_0_RVALID);
    hybrid_INST.x_rsc_24_0_RUSER(TLS_x_rsc_24_0_RUSER);
    hybrid_INST.x_rsc_24_0_RLAST(TLS_x_rsc_24_0_RLAST);
    hybrid_INST.x_rsc_24_0_RRESP(TLS_x_rsc_24_0_RRESP);
    hybrid_INST.x_rsc_24_0_RDATA(TLS_x_rsc_24_0_RDATA);
    hybrid_INST.x_rsc_24_0_RID(TLS_x_rsc_24_0_RID);
    hybrid_INST.x_rsc_24_0_ARREADY(TLS_x_rsc_24_0_ARREADY);
    hybrid_INST.x_rsc_24_0_ARVALID(TLS_x_rsc_24_0_ARVALID);
    hybrid_INST.x_rsc_24_0_ARUSER(TLS_x_rsc_24_0_ARUSER);
    hybrid_INST.x_rsc_24_0_ARREGION(TLS_x_rsc_24_0_ARREGION);
    hybrid_INST.x_rsc_24_0_ARQOS(TLS_x_rsc_24_0_ARQOS);
    hybrid_INST.x_rsc_24_0_ARPROT(TLS_x_rsc_24_0_ARPROT);
    hybrid_INST.x_rsc_24_0_ARCACHE(TLS_x_rsc_24_0_ARCACHE);
    hybrid_INST.x_rsc_24_0_ARLOCK(TLS_x_rsc_24_0_ARLOCK);
    hybrid_INST.x_rsc_24_0_ARBURST(TLS_x_rsc_24_0_ARBURST);
    hybrid_INST.x_rsc_24_0_ARSIZE(TLS_x_rsc_24_0_ARSIZE);
    hybrid_INST.x_rsc_24_0_ARLEN(TLS_x_rsc_24_0_ARLEN);
    hybrid_INST.x_rsc_24_0_ARADDR(TLS_x_rsc_24_0_ARADDR);
    hybrid_INST.x_rsc_24_0_ARID(TLS_x_rsc_24_0_ARID);
    hybrid_INST.x_rsc_24_0_BREADY(TLS_x_rsc_24_0_BREADY);
    hybrid_INST.x_rsc_24_0_BVALID(TLS_x_rsc_24_0_BVALID);
    hybrid_INST.x_rsc_24_0_BUSER(TLS_x_rsc_24_0_BUSER);
    hybrid_INST.x_rsc_24_0_BRESP(TLS_x_rsc_24_0_BRESP);
    hybrid_INST.x_rsc_24_0_BID(TLS_x_rsc_24_0_BID);
    hybrid_INST.x_rsc_24_0_WREADY(TLS_x_rsc_24_0_WREADY);
    hybrid_INST.x_rsc_24_0_WVALID(TLS_x_rsc_24_0_WVALID);
    hybrid_INST.x_rsc_24_0_WUSER(TLS_x_rsc_24_0_WUSER);
    hybrid_INST.x_rsc_24_0_WLAST(TLS_x_rsc_24_0_WLAST);
    hybrid_INST.x_rsc_24_0_WSTRB(TLS_x_rsc_24_0_WSTRB);
    hybrid_INST.x_rsc_24_0_WDATA(TLS_x_rsc_24_0_WDATA);
    hybrid_INST.x_rsc_24_0_AWREADY(TLS_x_rsc_24_0_AWREADY);
    hybrid_INST.x_rsc_24_0_AWVALID(TLS_x_rsc_24_0_AWVALID);
    hybrid_INST.x_rsc_24_0_AWUSER(TLS_x_rsc_24_0_AWUSER);
    hybrid_INST.x_rsc_24_0_AWREGION(TLS_x_rsc_24_0_AWREGION);
    hybrid_INST.x_rsc_24_0_AWQOS(TLS_x_rsc_24_0_AWQOS);
    hybrid_INST.x_rsc_24_0_AWPROT(TLS_x_rsc_24_0_AWPROT);
    hybrid_INST.x_rsc_24_0_AWCACHE(TLS_x_rsc_24_0_AWCACHE);
    hybrid_INST.x_rsc_24_0_AWLOCK(TLS_x_rsc_24_0_AWLOCK);
    hybrid_INST.x_rsc_24_0_AWBURST(TLS_x_rsc_24_0_AWBURST);
    hybrid_INST.x_rsc_24_0_AWSIZE(TLS_x_rsc_24_0_AWSIZE);
    hybrid_INST.x_rsc_24_0_AWLEN(TLS_x_rsc_24_0_AWLEN);
    hybrid_INST.x_rsc_24_0_AWADDR(TLS_x_rsc_24_0_AWADDR);
    hybrid_INST.x_rsc_24_0_AWID(TLS_x_rsc_24_0_AWID);
    hybrid_INST.x_rsc_triosy_24_0_lz(TLS_x_rsc_triosy_24_0_lz);
    hybrid_INST.x_rsc_25_0_s_tdone(TLS_x_rsc_25_0_s_tdone);
    hybrid_INST.x_rsc_25_0_tr_write_done(TLS_x_rsc_25_0_tr_write_done);
    hybrid_INST.x_rsc_25_0_RREADY(TLS_x_rsc_25_0_RREADY);
    hybrid_INST.x_rsc_25_0_RVALID(TLS_x_rsc_25_0_RVALID);
    hybrid_INST.x_rsc_25_0_RUSER(TLS_x_rsc_25_0_RUSER);
    hybrid_INST.x_rsc_25_0_RLAST(TLS_x_rsc_25_0_RLAST);
    hybrid_INST.x_rsc_25_0_RRESP(TLS_x_rsc_25_0_RRESP);
    hybrid_INST.x_rsc_25_0_RDATA(TLS_x_rsc_25_0_RDATA);
    hybrid_INST.x_rsc_25_0_RID(TLS_x_rsc_25_0_RID);
    hybrid_INST.x_rsc_25_0_ARREADY(TLS_x_rsc_25_0_ARREADY);
    hybrid_INST.x_rsc_25_0_ARVALID(TLS_x_rsc_25_0_ARVALID);
    hybrid_INST.x_rsc_25_0_ARUSER(TLS_x_rsc_25_0_ARUSER);
    hybrid_INST.x_rsc_25_0_ARREGION(TLS_x_rsc_25_0_ARREGION);
    hybrid_INST.x_rsc_25_0_ARQOS(TLS_x_rsc_25_0_ARQOS);
    hybrid_INST.x_rsc_25_0_ARPROT(TLS_x_rsc_25_0_ARPROT);
    hybrid_INST.x_rsc_25_0_ARCACHE(TLS_x_rsc_25_0_ARCACHE);
    hybrid_INST.x_rsc_25_0_ARLOCK(TLS_x_rsc_25_0_ARLOCK);
    hybrid_INST.x_rsc_25_0_ARBURST(TLS_x_rsc_25_0_ARBURST);
    hybrid_INST.x_rsc_25_0_ARSIZE(TLS_x_rsc_25_0_ARSIZE);
    hybrid_INST.x_rsc_25_0_ARLEN(TLS_x_rsc_25_0_ARLEN);
    hybrid_INST.x_rsc_25_0_ARADDR(TLS_x_rsc_25_0_ARADDR);
    hybrid_INST.x_rsc_25_0_ARID(TLS_x_rsc_25_0_ARID);
    hybrid_INST.x_rsc_25_0_BREADY(TLS_x_rsc_25_0_BREADY);
    hybrid_INST.x_rsc_25_0_BVALID(TLS_x_rsc_25_0_BVALID);
    hybrid_INST.x_rsc_25_0_BUSER(TLS_x_rsc_25_0_BUSER);
    hybrid_INST.x_rsc_25_0_BRESP(TLS_x_rsc_25_0_BRESP);
    hybrid_INST.x_rsc_25_0_BID(TLS_x_rsc_25_0_BID);
    hybrid_INST.x_rsc_25_0_WREADY(TLS_x_rsc_25_0_WREADY);
    hybrid_INST.x_rsc_25_0_WVALID(TLS_x_rsc_25_0_WVALID);
    hybrid_INST.x_rsc_25_0_WUSER(TLS_x_rsc_25_0_WUSER);
    hybrid_INST.x_rsc_25_0_WLAST(TLS_x_rsc_25_0_WLAST);
    hybrid_INST.x_rsc_25_0_WSTRB(TLS_x_rsc_25_0_WSTRB);
    hybrid_INST.x_rsc_25_0_WDATA(TLS_x_rsc_25_0_WDATA);
    hybrid_INST.x_rsc_25_0_AWREADY(TLS_x_rsc_25_0_AWREADY);
    hybrid_INST.x_rsc_25_0_AWVALID(TLS_x_rsc_25_0_AWVALID);
    hybrid_INST.x_rsc_25_0_AWUSER(TLS_x_rsc_25_0_AWUSER);
    hybrid_INST.x_rsc_25_0_AWREGION(TLS_x_rsc_25_0_AWREGION);
    hybrid_INST.x_rsc_25_0_AWQOS(TLS_x_rsc_25_0_AWQOS);
    hybrid_INST.x_rsc_25_0_AWPROT(TLS_x_rsc_25_0_AWPROT);
    hybrid_INST.x_rsc_25_0_AWCACHE(TLS_x_rsc_25_0_AWCACHE);
    hybrid_INST.x_rsc_25_0_AWLOCK(TLS_x_rsc_25_0_AWLOCK);
    hybrid_INST.x_rsc_25_0_AWBURST(TLS_x_rsc_25_0_AWBURST);
    hybrid_INST.x_rsc_25_0_AWSIZE(TLS_x_rsc_25_0_AWSIZE);
    hybrid_INST.x_rsc_25_0_AWLEN(TLS_x_rsc_25_0_AWLEN);
    hybrid_INST.x_rsc_25_0_AWADDR(TLS_x_rsc_25_0_AWADDR);
    hybrid_INST.x_rsc_25_0_AWID(TLS_x_rsc_25_0_AWID);
    hybrid_INST.x_rsc_triosy_25_0_lz(TLS_x_rsc_triosy_25_0_lz);
    hybrid_INST.x_rsc_26_0_s_tdone(TLS_x_rsc_26_0_s_tdone);
    hybrid_INST.x_rsc_26_0_tr_write_done(TLS_x_rsc_26_0_tr_write_done);
    hybrid_INST.x_rsc_26_0_RREADY(TLS_x_rsc_26_0_RREADY);
    hybrid_INST.x_rsc_26_0_RVALID(TLS_x_rsc_26_0_RVALID);
    hybrid_INST.x_rsc_26_0_RUSER(TLS_x_rsc_26_0_RUSER);
    hybrid_INST.x_rsc_26_0_RLAST(TLS_x_rsc_26_0_RLAST);
    hybrid_INST.x_rsc_26_0_RRESP(TLS_x_rsc_26_0_RRESP);
    hybrid_INST.x_rsc_26_0_RDATA(TLS_x_rsc_26_0_RDATA);
    hybrid_INST.x_rsc_26_0_RID(TLS_x_rsc_26_0_RID);
    hybrid_INST.x_rsc_26_0_ARREADY(TLS_x_rsc_26_0_ARREADY);
    hybrid_INST.x_rsc_26_0_ARVALID(TLS_x_rsc_26_0_ARVALID);
    hybrid_INST.x_rsc_26_0_ARUSER(TLS_x_rsc_26_0_ARUSER);
    hybrid_INST.x_rsc_26_0_ARREGION(TLS_x_rsc_26_0_ARREGION);
    hybrid_INST.x_rsc_26_0_ARQOS(TLS_x_rsc_26_0_ARQOS);
    hybrid_INST.x_rsc_26_0_ARPROT(TLS_x_rsc_26_0_ARPROT);
    hybrid_INST.x_rsc_26_0_ARCACHE(TLS_x_rsc_26_0_ARCACHE);
    hybrid_INST.x_rsc_26_0_ARLOCK(TLS_x_rsc_26_0_ARLOCK);
    hybrid_INST.x_rsc_26_0_ARBURST(TLS_x_rsc_26_0_ARBURST);
    hybrid_INST.x_rsc_26_0_ARSIZE(TLS_x_rsc_26_0_ARSIZE);
    hybrid_INST.x_rsc_26_0_ARLEN(TLS_x_rsc_26_0_ARLEN);
    hybrid_INST.x_rsc_26_0_ARADDR(TLS_x_rsc_26_0_ARADDR);
    hybrid_INST.x_rsc_26_0_ARID(TLS_x_rsc_26_0_ARID);
    hybrid_INST.x_rsc_26_0_BREADY(TLS_x_rsc_26_0_BREADY);
    hybrid_INST.x_rsc_26_0_BVALID(TLS_x_rsc_26_0_BVALID);
    hybrid_INST.x_rsc_26_0_BUSER(TLS_x_rsc_26_0_BUSER);
    hybrid_INST.x_rsc_26_0_BRESP(TLS_x_rsc_26_0_BRESP);
    hybrid_INST.x_rsc_26_0_BID(TLS_x_rsc_26_0_BID);
    hybrid_INST.x_rsc_26_0_WREADY(TLS_x_rsc_26_0_WREADY);
    hybrid_INST.x_rsc_26_0_WVALID(TLS_x_rsc_26_0_WVALID);
    hybrid_INST.x_rsc_26_0_WUSER(TLS_x_rsc_26_0_WUSER);
    hybrid_INST.x_rsc_26_0_WLAST(TLS_x_rsc_26_0_WLAST);
    hybrid_INST.x_rsc_26_0_WSTRB(TLS_x_rsc_26_0_WSTRB);
    hybrid_INST.x_rsc_26_0_WDATA(TLS_x_rsc_26_0_WDATA);
    hybrid_INST.x_rsc_26_0_AWREADY(TLS_x_rsc_26_0_AWREADY);
    hybrid_INST.x_rsc_26_0_AWVALID(TLS_x_rsc_26_0_AWVALID);
    hybrid_INST.x_rsc_26_0_AWUSER(TLS_x_rsc_26_0_AWUSER);
    hybrid_INST.x_rsc_26_0_AWREGION(TLS_x_rsc_26_0_AWREGION);
    hybrid_INST.x_rsc_26_0_AWQOS(TLS_x_rsc_26_0_AWQOS);
    hybrid_INST.x_rsc_26_0_AWPROT(TLS_x_rsc_26_0_AWPROT);
    hybrid_INST.x_rsc_26_0_AWCACHE(TLS_x_rsc_26_0_AWCACHE);
    hybrid_INST.x_rsc_26_0_AWLOCK(TLS_x_rsc_26_0_AWLOCK);
    hybrid_INST.x_rsc_26_0_AWBURST(TLS_x_rsc_26_0_AWBURST);
    hybrid_INST.x_rsc_26_0_AWSIZE(TLS_x_rsc_26_0_AWSIZE);
    hybrid_INST.x_rsc_26_0_AWLEN(TLS_x_rsc_26_0_AWLEN);
    hybrid_INST.x_rsc_26_0_AWADDR(TLS_x_rsc_26_0_AWADDR);
    hybrid_INST.x_rsc_26_0_AWID(TLS_x_rsc_26_0_AWID);
    hybrid_INST.x_rsc_triosy_26_0_lz(TLS_x_rsc_triosy_26_0_lz);
    hybrid_INST.x_rsc_27_0_s_tdone(TLS_x_rsc_27_0_s_tdone);
    hybrid_INST.x_rsc_27_0_tr_write_done(TLS_x_rsc_27_0_tr_write_done);
    hybrid_INST.x_rsc_27_0_RREADY(TLS_x_rsc_27_0_RREADY);
    hybrid_INST.x_rsc_27_0_RVALID(TLS_x_rsc_27_0_RVALID);
    hybrid_INST.x_rsc_27_0_RUSER(TLS_x_rsc_27_0_RUSER);
    hybrid_INST.x_rsc_27_0_RLAST(TLS_x_rsc_27_0_RLAST);
    hybrid_INST.x_rsc_27_0_RRESP(TLS_x_rsc_27_0_RRESP);
    hybrid_INST.x_rsc_27_0_RDATA(TLS_x_rsc_27_0_RDATA);
    hybrid_INST.x_rsc_27_0_RID(TLS_x_rsc_27_0_RID);
    hybrid_INST.x_rsc_27_0_ARREADY(TLS_x_rsc_27_0_ARREADY);
    hybrid_INST.x_rsc_27_0_ARVALID(TLS_x_rsc_27_0_ARVALID);
    hybrid_INST.x_rsc_27_0_ARUSER(TLS_x_rsc_27_0_ARUSER);
    hybrid_INST.x_rsc_27_0_ARREGION(TLS_x_rsc_27_0_ARREGION);
    hybrid_INST.x_rsc_27_0_ARQOS(TLS_x_rsc_27_0_ARQOS);
    hybrid_INST.x_rsc_27_0_ARPROT(TLS_x_rsc_27_0_ARPROT);
    hybrid_INST.x_rsc_27_0_ARCACHE(TLS_x_rsc_27_0_ARCACHE);
    hybrid_INST.x_rsc_27_0_ARLOCK(TLS_x_rsc_27_0_ARLOCK);
    hybrid_INST.x_rsc_27_0_ARBURST(TLS_x_rsc_27_0_ARBURST);
    hybrid_INST.x_rsc_27_0_ARSIZE(TLS_x_rsc_27_0_ARSIZE);
    hybrid_INST.x_rsc_27_0_ARLEN(TLS_x_rsc_27_0_ARLEN);
    hybrid_INST.x_rsc_27_0_ARADDR(TLS_x_rsc_27_0_ARADDR);
    hybrid_INST.x_rsc_27_0_ARID(TLS_x_rsc_27_0_ARID);
    hybrid_INST.x_rsc_27_0_BREADY(TLS_x_rsc_27_0_BREADY);
    hybrid_INST.x_rsc_27_0_BVALID(TLS_x_rsc_27_0_BVALID);
    hybrid_INST.x_rsc_27_0_BUSER(TLS_x_rsc_27_0_BUSER);
    hybrid_INST.x_rsc_27_0_BRESP(TLS_x_rsc_27_0_BRESP);
    hybrid_INST.x_rsc_27_0_BID(TLS_x_rsc_27_0_BID);
    hybrid_INST.x_rsc_27_0_WREADY(TLS_x_rsc_27_0_WREADY);
    hybrid_INST.x_rsc_27_0_WVALID(TLS_x_rsc_27_0_WVALID);
    hybrid_INST.x_rsc_27_0_WUSER(TLS_x_rsc_27_0_WUSER);
    hybrid_INST.x_rsc_27_0_WLAST(TLS_x_rsc_27_0_WLAST);
    hybrid_INST.x_rsc_27_0_WSTRB(TLS_x_rsc_27_0_WSTRB);
    hybrid_INST.x_rsc_27_0_WDATA(TLS_x_rsc_27_0_WDATA);
    hybrid_INST.x_rsc_27_0_AWREADY(TLS_x_rsc_27_0_AWREADY);
    hybrid_INST.x_rsc_27_0_AWVALID(TLS_x_rsc_27_0_AWVALID);
    hybrid_INST.x_rsc_27_0_AWUSER(TLS_x_rsc_27_0_AWUSER);
    hybrid_INST.x_rsc_27_0_AWREGION(TLS_x_rsc_27_0_AWREGION);
    hybrid_INST.x_rsc_27_0_AWQOS(TLS_x_rsc_27_0_AWQOS);
    hybrid_INST.x_rsc_27_0_AWPROT(TLS_x_rsc_27_0_AWPROT);
    hybrid_INST.x_rsc_27_0_AWCACHE(TLS_x_rsc_27_0_AWCACHE);
    hybrid_INST.x_rsc_27_0_AWLOCK(TLS_x_rsc_27_0_AWLOCK);
    hybrid_INST.x_rsc_27_0_AWBURST(TLS_x_rsc_27_0_AWBURST);
    hybrid_INST.x_rsc_27_0_AWSIZE(TLS_x_rsc_27_0_AWSIZE);
    hybrid_INST.x_rsc_27_0_AWLEN(TLS_x_rsc_27_0_AWLEN);
    hybrid_INST.x_rsc_27_0_AWADDR(TLS_x_rsc_27_0_AWADDR);
    hybrid_INST.x_rsc_27_0_AWID(TLS_x_rsc_27_0_AWID);
    hybrid_INST.x_rsc_triosy_27_0_lz(TLS_x_rsc_triosy_27_0_lz);
    hybrid_INST.x_rsc_28_0_s_tdone(TLS_x_rsc_28_0_s_tdone);
    hybrid_INST.x_rsc_28_0_tr_write_done(TLS_x_rsc_28_0_tr_write_done);
    hybrid_INST.x_rsc_28_0_RREADY(TLS_x_rsc_28_0_RREADY);
    hybrid_INST.x_rsc_28_0_RVALID(TLS_x_rsc_28_0_RVALID);
    hybrid_INST.x_rsc_28_0_RUSER(TLS_x_rsc_28_0_RUSER);
    hybrid_INST.x_rsc_28_0_RLAST(TLS_x_rsc_28_0_RLAST);
    hybrid_INST.x_rsc_28_0_RRESP(TLS_x_rsc_28_0_RRESP);
    hybrid_INST.x_rsc_28_0_RDATA(TLS_x_rsc_28_0_RDATA);
    hybrid_INST.x_rsc_28_0_RID(TLS_x_rsc_28_0_RID);
    hybrid_INST.x_rsc_28_0_ARREADY(TLS_x_rsc_28_0_ARREADY);
    hybrid_INST.x_rsc_28_0_ARVALID(TLS_x_rsc_28_0_ARVALID);
    hybrid_INST.x_rsc_28_0_ARUSER(TLS_x_rsc_28_0_ARUSER);
    hybrid_INST.x_rsc_28_0_ARREGION(TLS_x_rsc_28_0_ARREGION);
    hybrid_INST.x_rsc_28_0_ARQOS(TLS_x_rsc_28_0_ARQOS);
    hybrid_INST.x_rsc_28_0_ARPROT(TLS_x_rsc_28_0_ARPROT);
    hybrid_INST.x_rsc_28_0_ARCACHE(TLS_x_rsc_28_0_ARCACHE);
    hybrid_INST.x_rsc_28_0_ARLOCK(TLS_x_rsc_28_0_ARLOCK);
    hybrid_INST.x_rsc_28_0_ARBURST(TLS_x_rsc_28_0_ARBURST);
    hybrid_INST.x_rsc_28_0_ARSIZE(TLS_x_rsc_28_0_ARSIZE);
    hybrid_INST.x_rsc_28_0_ARLEN(TLS_x_rsc_28_0_ARLEN);
    hybrid_INST.x_rsc_28_0_ARADDR(TLS_x_rsc_28_0_ARADDR);
    hybrid_INST.x_rsc_28_0_ARID(TLS_x_rsc_28_0_ARID);
    hybrid_INST.x_rsc_28_0_BREADY(TLS_x_rsc_28_0_BREADY);
    hybrid_INST.x_rsc_28_0_BVALID(TLS_x_rsc_28_0_BVALID);
    hybrid_INST.x_rsc_28_0_BUSER(TLS_x_rsc_28_0_BUSER);
    hybrid_INST.x_rsc_28_0_BRESP(TLS_x_rsc_28_0_BRESP);
    hybrid_INST.x_rsc_28_0_BID(TLS_x_rsc_28_0_BID);
    hybrid_INST.x_rsc_28_0_WREADY(TLS_x_rsc_28_0_WREADY);
    hybrid_INST.x_rsc_28_0_WVALID(TLS_x_rsc_28_0_WVALID);
    hybrid_INST.x_rsc_28_0_WUSER(TLS_x_rsc_28_0_WUSER);
    hybrid_INST.x_rsc_28_0_WLAST(TLS_x_rsc_28_0_WLAST);
    hybrid_INST.x_rsc_28_0_WSTRB(TLS_x_rsc_28_0_WSTRB);
    hybrid_INST.x_rsc_28_0_WDATA(TLS_x_rsc_28_0_WDATA);
    hybrid_INST.x_rsc_28_0_AWREADY(TLS_x_rsc_28_0_AWREADY);
    hybrid_INST.x_rsc_28_0_AWVALID(TLS_x_rsc_28_0_AWVALID);
    hybrid_INST.x_rsc_28_0_AWUSER(TLS_x_rsc_28_0_AWUSER);
    hybrid_INST.x_rsc_28_0_AWREGION(TLS_x_rsc_28_0_AWREGION);
    hybrid_INST.x_rsc_28_0_AWQOS(TLS_x_rsc_28_0_AWQOS);
    hybrid_INST.x_rsc_28_0_AWPROT(TLS_x_rsc_28_0_AWPROT);
    hybrid_INST.x_rsc_28_0_AWCACHE(TLS_x_rsc_28_0_AWCACHE);
    hybrid_INST.x_rsc_28_0_AWLOCK(TLS_x_rsc_28_0_AWLOCK);
    hybrid_INST.x_rsc_28_0_AWBURST(TLS_x_rsc_28_0_AWBURST);
    hybrid_INST.x_rsc_28_0_AWSIZE(TLS_x_rsc_28_0_AWSIZE);
    hybrid_INST.x_rsc_28_0_AWLEN(TLS_x_rsc_28_0_AWLEN);
    hybrid_INST.x_rsc_28_0_AWADDR(TLS_x_rsc_28_0_AWADDR);
    hybrid_INST.x_rsc_28_0_AWID(TLS_x_rsc_28_0_AWID);
    hybrid_INST.x_rsc_triosy_28_0_lz(TLS_x_rsc_triosy_28_0_lz);
    hybrid_INST.x_rsc_29_0_s_tdone(TLS_x_rsc_29_0_s_tdone);
    hybrid_INST.x_rsc_29_0_tr_write_done(TLS_x_rsc_29_0_tr_write_done);
    hybrid_INST.x_rsc_29_0_RREADY(TLS_x_rsc_29_0_RREADY);
    hybrid_INST.x_rsc_29_0_RVALID(TLS_x_rsc_29_0_RVALID);
    hybrid_INST.x_rsc_29_0_RUSER(TLS_x_rsc_29_0_RUSER);
    hybrid_INST.x_rsc_29_0_RLAST(TLS_x_rsc_29_0_RLAST);
    hybrid_INST.x_rsc_29_0_RRESP(TLS_x_rsc_29_0_RRESP);
    hybrid_INST.x_rsc_29_0_RDATA(TLS_x_rsc_29_0_RDATA);
    hybrid_INST.x_rsc_29_0_RID(TLS_x_rsc_29_0_RID);
    hybrid_INST.x_rsc_29_0_ARREADY(TLS_x_rsc_29_0_ARREADY);
    hybrid_INST.x_rsc_29_0_ARVALID(TLS_x_rsc_29_0_ARVALID);
    hybrid_INST.x_rsc_29_0_ARUSER(TLS_x_rsc_29_0_ARUSER);
    hybrid_INST.x_rsc_29_0_ARREGION(TLS_x_rsc_29_0_ARREGION);
    hybrid_INST.x_rsc_29_0_ARQOS(TLS_x_rsc_29_0_ARQOS);
    hybrid_INST.x_rsc_29_0_ARPROT(TLS_x_rsc_29_0_ARPROT);
    hybrid_INST.x_rsc_29_0_ARCACHE(TLS_x_rsc_29_0_ARCACHE);
    hybrid_INST.x_rsc_29_0_ARLOCK(TLS_x_rsc_29_0_ARLOCK);
    hybrid_INST.x_rsc_29_0_ARBURST(TLS_x_rsc_29_0_ARBURST);
    hybrid_INST.x_rsc_29_0_ARSIZE(TLS_x_rsc_29_0_ARSIZE);
    hybrid_INST.x_rsc_29_0_ARLEN(TLS_x_rsc_29_0_ARLEN);
    hybrid_INST.x_rsc_29_0_ARADDR(TLS_x_rsc_29_0_ARADDR);
    hybrid_INST.x_rsc_29_0_ARID(TLS_x_rsc_29_0_ARID);
    hybrid_INST.x_rsc_29_0_BREADY(TLS_x_rsc_29_0_BREADY);
    hybrid_INST.x_rsc_29_0_BVALID(TLS_x_rsc_29_0_BVALID);
    hybrid_INST.x_rsc_29_0_BUSER(TLS_x_rsc_29_0_BUSER);
    hybrid_INST.x_rsc_29_0_BRESP(TLS_x_rsc_29_0_BRESP);
    hybrid_INST.x_rsc_29_0_BID(TLS_x_rsc_29_0_BID);
    hybrid_INST.x_rsc_29_0_WREADY(TLS_x_rsc_29_0_WREADY);
    hybrid_INST.x_rsc_29_0_WVALID(TLS_x_rsc_29_0_WVALID);
    hybrid_INST.x_rsc_29_0_WUSER(TLS_x_rsc_29_0_WUSER);
    hybrid_INST.x_rsc_29_0_WLAST(TLS_x_rsc_29_0_WLAST);
    hybrid_INST.x_rsc_29_0_WSTRB(TLS_x_rsc_29_0_WSTRB);
    hybrid_INST.x_rsc_29_0_WDATA(TLS_x_rsc_29_0_WDATA);
    hybrid_INST.x_rsc_29_0_AWREADY(TLS_x_rsc_29_0_AWREADY);
    hybrid_INST.x_rsc_29_0_AWVALID(TLS_x_rsc_29_0_AWVALID);
    hybrid_INST.x_rsc_29_0_AWUSER(TLS_x_rsc_29_0_AWUSER);
    hybrid_INST.x_rsc_29_0_AWREGION(TLS_x_rsc_29_0_AWREGION);
    hybrid_INST.x_rsc_29_0_AWQOS(TLS_x_rsc_29_0_AWQOS);
    hybrid_INST.x_rsc_29_0_AWPROT(TLS_x_rsc_29_0_AWPROT);
    hybrid_INST.x_rsc_29_0_AWCACHE(TLS_x_rsc_29_0_AWCACHE);
    hybrid_INST.x_rsc_29_0_AWLOCK(TLS_x_rsc_29_0_AWLOCK);
    hybrid_INST.x_rsc_29_0_AWBURST(TLS_x_rsc_29_0_AWBURST);
    hybrid_INST.x_rsc_29_0_AWSIZE(TLS_x_rsc_29_0_AWSIZE);
    hybrid_INST.x_rsc_29_0_AWLEN(TLS_x_rsc_29_0_AWLEN);
    hybrid_INST.x_rsc_29_0_AWADDR(TLS_x_rsc_29_0_AWADDR);
    hybrid_INST.x_rsc_29_0_AWID(TLS_x_rsc_29_0_AWID);
    hybrid_INST.x_rsc_triosy_29_0_lz(TLS_x_rsc_triosy_29_0_lz);
    hybrid_INST.x_rsc_30_0_s_tdone(TLS_x_rsc_30_0_s_tdone);
    hybrid_INST.x_rsc_30_0_tr_write_done(TLS_x_rsc_30_0_tr_write_done);
    hybrid_INST.x_rsc_30_0_RREADY(TLS_x_rsc_30_0_RREADY);
    hybrid_INST.x_rsc_30_0_RVALID(TLS_x_rsc_30_0_RVALID);
    hybrid_INST.x_rsc_30_0_RUSER(TLS_x_rsc_30_0_RUSER);
    hybrid_INST.x_rsc_30_0_RLAST(TLS_x_rsc_30_0_RLAST);
    hybrid_INST.x_rsc_30_0_RRESP(TLS_x_rsc_30_0_RRESP);
    hybrid_INST.x_rsc_30_0_RDATA(TLS_x_rsc_30_0_RDATA);
    hybrid_INST.x_rsc_30_0_RID(TLS_x_rsc_30_0_RID);
    hybrid_INST.x_rsc_30_0_ARREADY(TLS_x_rsc_30_0_ARREADY);
    hybrid_INST.x_rsc_30_0_ARVALID(TLS_x_rsc_30_0_ARVALID);
    hybrid_INST.x_rsc_30_0_ARUSER(TLS_x_rsc_30_0_ARUSER);
    hybrid_INST.x_rsc_30_0_ARREGION(TLS_x_rsc_30_0_ARREGION);
    hybrid_INST.x_rsc_30_0_ARQOS(TLS_x_rsc_30_0_ARQOS);
    hybrid_INST.x_rsc_30_0_ARPROT(TLS_x_rsc_30_0_ARPROT);
    hybrid_INST.x_rsc_30_0_ARCACHE(TLS_x_rsc_30_0_ARCACHE);
    hybrid_INST.x_rsc_30_0_ARLOCK(TLS_x_rsc_30_0_ARLOCK);
    hybrid_INST.x_rsc_30_0_ARBURST(TLS_x_rsc_30_0_ARBURST);
    hybrid_INST.x_rsc_30_0_ARSIZE(TLS_x_rsc_30_0_ARSIZE);
    hybrid_INST.x_rsc_30_0_ARLEN(TLS_x_rsc_30_0_ARLEN);
    hybrid_INST.x_rsc_30_0_ARADDR(TLS_x_rsc_30_0_ARADDR);
    hybrid_INST.x_rsc_30_0_ARID(TLS_x_rsc_30_0_ARID);
    hybrid_INST.x_rsc_30_0_BREADY(TLS_x_rsc_30_0_BREADY);
    hybrid_INST.x_rsc_30_0_BVALID(TLS_x_rsc_30_0_BVALID);
    hybrid_INST.x_rsc_30_0_BUSER(TLS_x_rsc_30_0_BUSER);
    hybrid_INST.x_rsc_30_0_BRESP(TLS_x_rsc_30_0_BRESP);
    hybrid_INST.x_rsc_30_0_BID(TLS_x_rsc_30_0_BID);
    hybrid_INST.x_rsc_30_0_WREADY(TLS_x_rsc_30_0_WREADY);
    hybrid_INST.x_rsc_30_0_WVALID(TLS_x_rsc_30_0_WVALID);
    hybrid_INST.x_rsc_30_0_WUSER(TLS_x_rsc_30_0_WUSER);
    hybrid_INST.x_rsc_30_0_WLAST(TLS_x_rsc_30_0_WLAST);
    hybrid_INST.x_rsc_30_0_WSTRB(TLS_x_rsc_30_0_WSTRB);
    hybrid_INST.x_rsc_30_0_WDATA(TLS_x_rsc_30_0_WDATA);
    hybrid_INST.x_rsc_30_0_AWREADY(TLS_x_rsc_30_0_AWREADY);
    hybrid_INST.x_rsc_30_0_AWVALID(TLS_x_rsc_30_0_AWVALID);
    hybrid_INST.x_rsc_30_0_AWUSER(TLS_x_rsc_30_0_AWUSER);
    hybrid_INST.x_rsc_30_0_AWREGION(TLS_x_rsc_30_0_AWREGION);
    hybrid_INST.x_rsc_30_0_AWQOS(TLS_x_rsc_30_0_AWQOS);
    hybrid_INST.x_rsc_30_0_AWPROT(TLS_x_rsc_30_0_AWPROT);
    hybrid_INST.x_rsc_30_0_AWCACHE(TLS_x_rsc_30_0_AWCACHE);
    hybrid_INST.x_rsc_30_0_AWLOCK(TLS_x_rsc_30_0_AWLOCK);
    hybrid_INST.x_rsc_30_0_AWBURST(TLS_x_rsc_30_0_AWBURST);
    hybrid_INST.x_rsc_30_0_AWSIZE(TLS_x_rsc_30_0_AWSIZE);
    hybrid_INST.x_rsc_30_0_AWLEN(TLS_x_rsc_30_0_AWLEN);
    hybrid_INST.x_rsc_30_0_AWADDR(TLS_x_rsc_30_0_AWADDR);
    hybrid_INST.x_rsc_30_0_AWID(TLS_x_rsc_30_0_AWID);
    hybrid_INST.x_rsc_triosy_30_0_lz(TLS_x_rsc_triosy_30_0_lz);
    hybrid_INST.x_rsc_31_0_s_tdone(TLS_x_rsc_31_0_s_tdone);
    hybrid_INST.x_rsc_31_0_tr_write_done(TLS_x_rsc_31_0_tr_write_done);
    hybrid_INST.x_rsc_31_0_RREADY(TLS_x_rsc_31_0_RREADY);
    hybrid_INST.x_rsc_31_0_RVALID(TLS_x_rsc_31_0_RVALID);
    hybrid_INST.x_rsc_31_0_RUSER(TLS_x_rsc_31_0_RUSER);
    hybrid_INST.x_rsc_31_0_RLAST(TLS_x_rsc_31_0_RLAST);
    hybrid_INST.x_rsc_31_0_RRESP(TLS_x_rsc_31_0_RRESP);
    hybrid_INST.x_rsc_31_0_RDATA(TLS_x_rsc_31_0_RDATA);
    hybrid_INST.x_rsc_31_0_RID(TLS_x_rsc_31_0_RID);
    hybrid_INST.x_rsc_31_0_ARREADY(TLS_x_rsc_31_0_ARREADY);
    hybrid_INST.x_rsc_31_0_ARVALID(TLS_x_rsc_31_0_ARVALID);
    hybrid_INST.x_rsc_31_0_ARUSER(TLS_x_rsc_31_0_ARUSER);
    hybrid_INST.x_rsc_31_0_ARREGION(TLS_x_rsc_31_0_ARREGION);
    hybrid_INST.x_rsc_31_0_ARQOS(TLS_x_rsc_31_0_ARQOS);
    hybrid_INST.x_rsc_31_0_ARPROT(TLS_x_rsc_31_0_ARPROT);
    hybrid_INST.x_rsc_31_0_ARCACHE(TLS_x_rsc_31_0_ARCACHE);
    hybrid_INST.x_rsc_31_0_ARLOCK(TLS_x_rsc_31_0_ARLOCK);
    hybrid_INST.x_rsc_31_0_ARBURST(TLS_x_rsc_31_0_ARBURST);
    hybrid_INST.x_rsc_31_0_ARSIZE(TLS_x_rsc_31_0_ARSIZE);
    hybrid_INST.x_rsc_31_0_ARLEN(TLS_x_rsc_31_0_ARLEN);
    hybrid_INST.x_rsc_31_0_ARADDR(TLS_x_rsc_31_0_ARADDR);
    hybrid_INST.x_rsc_31_0_ARID(TLS_x_rsc_31_0_ARID);
    hybrid_INST.x_rsc_31_0_BREADY(TLS_x_rsc_31_0_BREADY);
    hybrid_INST.x_rsc_31_0_BVALID(TLS_x_rsc_31_0_BVALID);
    hybrid_INST.x_rsc_31_0_BUSER(TLS_x_rsc_31_0_BUSER);
    hybrid_INST.x_rsc_31_0_BRESP(TLS_x_rsc_31_0_BRESP);
    hybrid_INST.x_rsc_31_0_BID(TLS_x_rsc_31_0_BID);
    hybrid_INST.x_rsc_31_0_WREADY(TLS_x_rsc_31_0_WREADY);
    hybrid_INST.x_rsc_31_0_WVALID(TLS_x_rsc_31_0_WVALID);
    hybrid_INST.x_rsc_31_0_WUSER(TLS_x_rsc_31_0_WUSER);
    hybrid_INST.x_rsc_31_0_WLAST(TLS_x_rsc_31_0_WLAST);
    hybrid_INST.x_rsc_31_0_WSTRB(TLS_x_rsc_31_0_WSTRB);
    hybrid_INST.x_rsc_31_0_WDATA(TLS_x_rsc_31_0_WDATA);
    hybrid_INST.x_rsc_31_0_AWREADY(TLS_x_rsc_31_0_AWREADY);
    hybrid_INST.x_rsc_31_0_AWVALID(TLS_x_rsc_31_0_AWVALID);
    hybrid_INST.x_rsc_31_0_AWUSER(TLS_x_rsc_31_0_AWUSER);
    hybrid_INST.x_rsc_31_0_AWREGION(TLS_x_rsc_31_0_AWREGION);
    hybrid_INST.x_rsc_31_0_AWQOS(TLS_x_rsc_31_0_AWQOS);
    hybrid_INST.x_rsc_31_0_AWPROT(TLS_x_rsc_31_0_AWPROT);
    hybrid_INST.x_rsc_31_0_AWCACHE(TLS_x_rsc_31_0_AWCACHE);
    hybrid_INST.x_rsc_31_0_AWLOCK(TLS_x_rsc_31_0_AWLOCK);
    hybrid_INST.x_rsc_31_0_AWBURST(TLS_x_rsc_31_0_AWBURST);
    hybrid_INST.x_rsc_31_0_AWSIZE(TLS_x_rsc_31_0_AWSIZE);
    hybrid_INST.x_rsc_31_0_AWLEN(TLS_x_rsc_31_0_AWLEN);
    hybrid_INST.x_rsc_31_0_AWADDR(TLS_x_rsc_31_0_AWADDR);
    hybrid_INST.x_rsc_31_0_AWID(TLS_x_rsc_31_0_AWID);
    hybrid_INST.x_rsc_triosy_31_0_lz(TLS_x_rsc_triosy_31_0_lz);
    hybrid_INST.m_rsc_dat(TLS_m_rsc_dat);
    hybrid_INST.m_rsc_triosy_lz(TLS_m_rsc_triosy_lz);
    hybrid_INST.twiddle_rsc_adrb(TLS_twiddle_rsc_adrb);
    hybrid_INST.twiddle_rsc_qb(TLS_twiddle_rsc_qb);
    hybrid_INST.twiddle_rsc_triosy_lz(TLS_twiddle_rsc_triosy_lz);
    hybrid_INST.twiddle_h_rsc_adrb(TLS_twiddle_h_rsc_adrb);
    hybrid_INST.twiddle_h_rsc_qb(TLS_twiddle_h_rsc_qb);
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

    CCS_ADAPTOR_TLS_x_rsc_0_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_0_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_0_0_AWID.outSCALAR(TLS_x_rsc_0_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_0_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_0_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_0_0_AWUSER.outSCALAR(TLS_x_rsc_0_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_0_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_0_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_0_0_WUSER.outSCALAR(TLS_x_rsc_0_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BID.inSCALAR(TLS_x_rsc_0_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_0_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BUSER.inSCALAR(TLS_x_rsc_0_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_0_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_0_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_0_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_0_0_ARID.outSCALAR(TLS_x_rsc_0_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_0_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_0_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_0_0_ARUSER.outSCALAR(TLS_x_rsc_0_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RID.inSCALAR(TLS_x_rsc_0_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_0_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RUSER.inSCALAR(TLS_x_rsc_0_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_0_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_0_0_RUSER);

    x_rsc_0__0__INST.ACLK(clk);
    x_rsc_0__0__INST.ARESETn(rst);
    x_rsc_0__0__INST.AWID(CCS_ADAPTOR_x_rsc_0_0_AWID);
    x_rsc_0__0__INST.AWADDR(TLS_x_rsc_0_0_AWADDR);
    x_rsc_0__0__INST.AWLEN(TLS_x_rsc_0_0_AWLEN);
    x_rsc_0__0__INST.AWSIZE(TLS_x_rsc_0_0_AWSIZE);
    x_rsc_0__0__INST.AWBURST(TLS_x_rsc_0_0_AWBURST);
    x_rsc_0__0__INST.AWLOCK(TLS_x_rsc_0_0_AWLOCK);
    x_rsc_0__0__INST.AWCACHE(TLS_x_rsc_0_0_AWCACHE);
    x_rsc_0__0__INST.AWPROT(TLS_x_rsc_0_0_AWPROT);
    x_rsc_0__0__INST.AWQOS(TLS_x_rsc_0_0_AWQOS);
    x_rsc_0__0__INST.AWREGION(TLS_x_rsc_0_0_AWREGION);
    x_rsc_0__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_0_0_AWUSER);
    x_rsc_0__0__INST.AWVALID(TLS_x_rsc_0_0_AWVALID);
    x_rsc_0__0__INST.AWREADY(TLS_x_rsc_0_0_AWREADY);
    x_rsc_0__0__INST.WDATA(TLS_x_rsc_0_0_WDATA);
    x_rsc_0__0__INST.WSTRB(TLS_x_rsc_0_0_WSTRB);
    x_rsc_0__0__INST.WLAST(TLS_x_rsc_0_0_WLAST);
    x_rsc_0__0__INST.WUSER(CCS_ADAPTOR_x_rsc_0_0_WUSER);
    x_rsc_0__0__INST.WVALID(TLS_x_rsc_0_0_WVALID);
    x_rsc_0__0__INST.WREADY(TLS_x_rsc_0_0_WREADY);
    x_rsc_0__0__INST.BID(CCS_ADAPTOR_x_rsc_0_0_BID);
    x_rsc_0__0__INST.BRESP(TLS_x_rsc_0_0_BRESP);
    x_rsc_0__0__INST.BUSER(CCS_ADAPTOR_x_rsc_0_0_BUSER);
    x_rsc_0__0__INST.BVALID(TLS_x_rsc_0_0_BVALID);
    x_rsc_0__0__INST.BREADY(TLS_x_rsc_0_0_BREADY);
    x_rsc_0__0__INST.ARID(CCS_ADAPTOR_x_rsc_0_0_ARID);
    x_rsc_0__0__INST.ARADDR(TLS_x_rsc_0_0_ARADDR);
    x_rsc_0__0__INST.ARLEN(TLS_x_rsc_0_0_ARLEN);
    x_rsc_0__0__INST.ARSIZE(TLS_x_rsc_0_0_ARSIZE);
    x_rsc_0__0__INST.ARBURST(TLS_x_rsc_0_0_ARBURST);
    x_rsc_0__0__INST.ARLOCK(TLS_x_rsc_0_0_ARLOCK);
    x_rsc_0__0__INST.ARCACHE(TLS_x_rsc_0_0_ARCACHE);
    x_rsc_0__0__INST.ARPROT(TLS_x_rsc_0_0_ARPROT);
    x_rsc_0__0__INST.ARQOS(TLS_x_rsc_0_0_ARQOS);
    x_rsc_0__0__INST.ARREGION(TLS_x_rsc_0_0_ARREGION);
    x_rsc_0__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_0_0_ARUSER);
    x_rsc_0__0__INST.ARVALID(TLS_x_rsc_0_0_ARVALID);
    x_rsc_0__0__INST.ARREADY(TLS_x_rsc_0_0_ARREADY);
    x_rsc_0__0__INST.RID(CCS_ADAPTOR_x_rsc_0_0_RID);
    x_rsc_0__0__INST.RDATA(TLS_x_rsc_0_0_RDATA);
    x_rsc_0__0__INST.RRESP(TLS_x_rsc_0_0_RRESP);
    x_rsc_0__0__INST.RLAST(TLS_x_rsc_0_0_RLAST);
    x_rsc_0__0__INST.RUSER(CCS_ADAPTOR_x_rsc_0_0_RUSER);
    x_rsc_0__0__INST.RVALID(TLS_x_rsc_0_0_RVALID);
    x_rsc_0__0__INST.RREADY(TLS_x_rsc_0_0_RREADY);
    x_rsc_0__0__INST.tr_write_done(TLS_x_rsc_0_0_tr_write_done);
    x_rsc_0__0__INST.s_tdone(TLS_x_rsc_0_0_s_tdone);
    x_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_74)));

    CCS_ADAPTOR_TLS_x_rsc_1_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_1_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_1_0_AWID.outSCALAR(TLS_x_rsc_1_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_1_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_1_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_1_0_AWUSER.outSCALAR(TLS_x_rsc_1_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_1_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_1_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_1_0_WUSER.outSCALAR(TLS_x_rsc_1_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BID.inSCALAR(TLS_x_rsc_1_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_1_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BUSER.inSCALAR(TLS_x_rsc_1_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_1_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_1_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_1_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_1_0_ARID.outSCALAR(TLS_x_rsc_1_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_1_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_1_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_1_0_ARUSER.outSCALAR(TLS_x_rsc_1_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RID.inSCALAR(TLS_x_rsc_1_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_1_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RUSER.inSCALAR(TLS_x_rsc_1_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_1_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_1_0_RUSER);

    x_rsc_1__0__INST.ACLK(clk);
    x_rsc_1__0__INST.ARESETn(rst);
    x_rsc_1__0__INST.AWID(CCS_ADAPTOR_x_rsc_1_0_AWID);
    x_rsc_1__0__INST.AWADDR(TLS_x_rsc_1_0_AWADDR);
    x_rsc_1__0__INST.AWLEN(TLS_x_rsc_1_0_AWLEN);
    x_rsc_1__0__INST.AWSIZE(TLS_x_rsc_1_0_AWSIZE);
    x_rsc_1__0__INST.AWBURST(TLS_x_rsc_1_0_AWBURST);
    x_rsc_1__0__INST.AWLOCK(TLS_x_rsc_1_0_AWLOCK);
    x_rsc_1__0__INST.AWCACHE(TLS_x_rsc_1_0_AWCACHE);
    x_rsc_1__0__INST.AWPROT(TLS_x_rsc_1_0_AWPROT);
    x_rsc_1__0__INST.AWQOS(TLS_x_rsc_1_0_AWQOS);
    x_rsc_1__0__INST.AWREGION(TLS_x_rsc_1_0_AWREGION);
    x_rsc_1__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_1_0_AWUSER);
    x_rsc_1__0__INST.AWVALID(TLS_x_rsc_1_0_AWVALID);
    x_rsc_1__0__INST.AWREADY(TLS_x_rsc_1_0_AWREADY);
    x_rsc_1__0__INST.WDATA(TLS_x_rsc_1_0_WDATA);
    x_rsc_1__0__INST.WSTRB(TLS_x_rsc_1_0_WSTRB);
    x_rsc_1__0__INST.WLAST(TLS_x_rsc_1_0_WLAST);
    x_rsc_1__0__INST.WUSER(CCS_ADAPTOR_x_rsc_1_0_WUSER);
    x_rsc_1__0__INST.WVALID(TLS_x_rsc_1_0_WVALID);
    x_rsc_1__0__INST.WREADY(TLS_x_rsc_1_0_WREADY);
    x_rsc_1__0__INST.BID(CCS_ADAPTOR_x_rsc_1_0_BID);
    x_rsc_1__0__INST.BRESP(TLS_x_rsc_1_0_BRESP);
    x_rsc_1__0__INST.BUSER(CCS_ADAPTOR_x_rsc_1_0_BUSER);
    x_rsc_1__0__INST.BVALID(TLS_x_rsc_1_0_BVALID);
    x_rsc_1__0__INST.BREADY(TLS_x_rsc_1_0_BREADY);
    x_rsc_1__0__INST.ARID(CCS_ADAPTOR_x_rsc_1_0_ARID);
    x_rsc_1__0__INST.ARADDR(TLS_x_rsc_1_0_ARADDR);
    x_rsc_1__0__INST.ARLEN(TLS_x_rsc_1_0_ARLEN);
    x_rsc_1__0__INST.ARSIZE(TLS_x_rsc_1_0_ARSIZE);
    x_rsc_1__0__INST.ARBURST(TLS_x_rsc_1_0_ARBURST);
    x_rsc_1__0__INST.ARLOCK(TLS_x_rsc_1_0_ARLOCK);
    x_rsc_1__0__INST.ARCACHE(TLS_x_rsc_1_0_ARCACHE);
    x_rsc_1__0__INST.ARPROT(TLS_x_rsc_1_0_ARPROT);
    x_rsc_1__0__INST.ARQOS(TLS_x_rsc_1_0_ARQOS);
    x_rsc_1__0__INST.ARREGION(TLS_x_rsc_1_0_ARREGION);
    x_rsc_1__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_1_0_ARUSER);
    x_rsc_1__0__INST.ARVALID(TLS_x_rsc_1_0_ARVALID);
    x_rsc_1__0__INST.ARREADY(TLS_x_rsc_1_0_ARREADY);
    x_rsc_1__0__INST.RID(CCS_ADAPTOR_x_rsc_1_0_RID);
    x_rsc_1__0__INST.RDATA(TLS_x_rsc_1_0_RDATA);
    x_rsc_1__0__INST.RRESP(TLS_x_rsc_1_0_RRESP);
    x_rsc_1__0__INST.RLAST(TLS_x_rsc_1_0_RLAST);
    x_rsc_1__0__INST.RUSER(CCS_ADAPTOR_x_rsc_1_0_RUSER);
    x_rsc_1__0__INST.RVALID(TLS_x_rsc_1_0_RVALID);
    x_rsc_1__0__INST.RREADY(TLS_x_rsc_1_0_RREADY);
    x_rsc_1__0__INST.tr_write_done(TLS_x_rsc_1_0_tr_write_done);
    x_rsc_1__0__INST.s_tdone(TLS_x_rsc_1_0_s_tdone);
    x_rsc_1__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_75)));

    CCS_ADAPTOR_TLS_x_rsc_2_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_2_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_2_0_AWID.outSCALAR(TLS_x_rsc_2_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_2_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_2_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_2_0_AWUSER.outSCALAR(TLS_x_rsc_2_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_2_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_2_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_2_0_WUSER.outSCALAR(TLS_x_rsc_2_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BID.inSCALAR(TLS_x_rsc_2_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_2_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BUSER.inSCALAR(TLS_x_rsc_2_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_2_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_2_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_2_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_2_0_ARID.outSCALAR(TLS_x_rsc_2_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_2_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_2_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_2_0_ARUSER.outSCALAR(TLS_x_rsc_2_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RID.inSCALAR(TLS_x_rsc_2_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_2_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RUSER.inSCALAR(TLS_x_rsc_2_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_2_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_2_0_RUSER);

    x_rsc_2__0__INST.ACLK(clk);
    x_rsc_2__0__INST.ARESETn(rst);
    x_rsc_2__0__INST.AWID(CCS_ADAPTOR_x_rsc_2_0_AWID);
    x_rsc_2__0__INST.AWADDR(TLS_x_rsc_2_0_AWADDR);
    x_rsc_2__0__INST.AWLEN(TLS_x_rsc_2_0_AWLEN);
    x_rsc_2__0__INST.AWSIZE(TLS_x_rsc_2_0_AWSIZE);
    x_rsc_2__0__INST.AWBURST(TLS_x_rsc_2_0_AWBURST);
    x_rsc_2__0__INST.AWLOCK(TLS_x_rsc_2_0_AWLOCK);
    x_rsc_2__0__INST.AWCACHE(TLS_x_rsc_2_0_AWCACHE);
    x_rsc_2__0__INST.AWPROT(TLS_x_rsc_2_0_AWPROT);
    x_rsc_2__0__INST.AWQOS(TLS_x_rsc_2_0_AWQOS);
    x_rsc_2__0__INST.AWREGION(TLS_x_rsc_2_0_AWREGION);
    x_rsc_2__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_2_0_AWUSER);
    x_rsc_2__0__INST.AWVALID(TLS_x_rsc_2_0_AWVALID);
    x_rsc_2__0__INST.AWREADY(TLS_x_rsc_2_0_AWREADY);
    x_rsc_2__0__INST.WDATA(TLS_x_rsc_2_0_WDATA);
    x_rsc_2__0__INST.WSTRB(TLS_x_rsc_2_0_WSTRB);
    x_rsc_2__0__INST.WLAST(TLS_x_rsc_2_0_WLAST);
    x_rsc_2__0__INST.WUSER(CCS_ADAPTOR_x_rsc_2_0_WUSER);
    x_rsc_2__0__INST.WVALID(TLS_x_rsc_2_0_WVALID);
    x_rsc_2__0__INST.WREADY(TLS_x_rsc_2_0_WREADY);
    x_rsc_2__0__INST.BID(CCS_ADAPTOR_x_rsc_2_0_BID);
    x_rsc_2__0__INST.BRESP(TLS_x_rsc_2_0_BRESP);
    x_rsc_2__0__INST.BUSER(CCS_ADAPTOR_x_rsc_2_0_BUSER);
    x_rsc_2__0__INST.BVALID(TLS_x_rsc_2_0_BVALID);
    x_rsc_2__0__INST.BREADY(TLS_x_rsc_2_0_BREADY);
    x_rsc_2__0__INST.ARID(CCS_ADAPTOR_x_rsc_2_0_ARID);
    x_rsc_2__0__INST.ARADDR(TLS_x_rsc_2_0_ARADDR);
    x_rsc_2__0__INST.ARLEN(TLS_x_rsc_2_0_ARLEN);
    x_rsc_2__0__INST.ARSIZE(TLS_x_rsc_2_0_ARSIZE);
    x_rsc_2__0__INST.ARBURST(TLS_x_rsc_2_0_ARBURST);
    x_rsc_2__0__INST.ARLOCK(TLS_x_rsc_2_0_ARLOCK);
    x_rsc_2__0__INST.ARCACHE(TLS_x_rsc_2_0_ARCACHE);
    x_rsc_2__0__INST.ARPROT(TLS_x_rsc_2_0_ARPROT);
    x_rsc_2__0__INST.ARQOS(TLS_x_rsc_2_0_ARQOS);
    x_rsc_2__0__INST.ARREGION(TLS_x_rsc_2_0_ARREGION);
    x_rsc_2__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_2_0_ARUSER);
    x_rsc_2__0__INST.ARVALID(TLS_x_rsc_2_0_ARVALID);
    x_rsc_2__0__INST.ARREADY(TLS_x_rsc_2_0_ARREADY);
    x_rsc_2__0__INST.RID(CCS_ADAPTOR_x_rsc_2_0_RID);
    x_rsc_2__0__INST.RDATA(TLS_x_rsc_2_0_RDATA);
    x_rsc_2__0__INST.RRESP(TLS_x_rsc_2_0_RRESP);
    x_rsc_2__0__INST.RLAST(TLS_x_rsc_2_0_RLAST);
    x_rsc_2__0__INST.RUSER(CCS_ADAPTOR_x_rsc_2_0_RUSER);
    x_rsc_2__0__INST.RVALID(TLS_x_rsc_2_0_RVALID);
    x_rsc_2__0__INST.RREADY(TLS_x_rsc_2_0_RREADY);
    x_rsc_2__0__INST.tr_write_done(TLS_x_rsc_2_0_tr_write_done);
    x_rsc_2__0__INST.s_tdone(TLS_x_rsc_2_0_s_tdone);
    x_rsc_2__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_76)));

    CCS_ADAPTOR_TLS_x_rsc_3_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_3_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_3_0_AWID.outSCALAR(TLS_x_rsc_3_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_3_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_3_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_3_0_AWUSER.outSCALAR(TLS_x_rsc_3_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_3_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_3_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_3_0_WUSER.outSCALAR(TLS_x_rsc_3_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BID.inSCALAR(TLS_x_rsc_3_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_3_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BUSER.inSCALAR(TLS_x_rsc_3_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_3_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_3_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_3_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_3_0_ARID.outSCALAR(TLS_x_rsc_3_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_3_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_3_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_3_0_ARUSER.outSCALAR(TLS_x_rsc_3_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RID.inSCALAR(TLS_x_rsc_3_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_3_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RUSER.inSCALAR(TLS_x_rsc_3_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_3_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_3_0_RUSER);

    x_rsc_3__0__INST.ACLK(clk);
    x_rsc_3__0__INST.ARESETn(rst);
    x_rsc_3__0__INST.AWID(CCS_ADAPTOR_x_rsc_3_0_AWID);
    x_rsc_3__0__INST.AWADDR(TLS_x_rsc_3_0_AWADDR);
    x_rsc_3__0__INST.AWLEN(TLS_x_rsc_3_0_AWLEN);
    x_rsc_3__0__INST.AWSIZE(TLS_x_rsc_3_0_AWSIZE);
    x_rsc_3__0__INST.AWBURST(TLS_x_rsc_3_0_AWBURST);
    x_rsc_3__0__INST.AWLOCK(TLS_x_rsc_3_0_AWLOCK);
    x_rsc_3__0__INST.AWCACHE(TLS_x_rsc_3_0_AWCACHE);
    x_rsc_3__0__INST.AWPROT(TLS_x_rsc_3_0_AWPROT);
    x_rsc_3__0__INST.AWQOS(TLS_x_rsc_3_0_AWQOS);
    x_rsc_3__0__INST.AWREGION(TLS_x_rsc_3_0_AWREGION);
    x_rsc_3__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_3_0_AWUSER);
    x_rsc_3__0__INST.AWVALID(TLS_x_rsc_3_0_AWVALID);
    x_rsc_3__0__INST.AWREADY(TLS_x_rsc_3_0_AWREADY);
    x_rsc_3__0__INST.WDATA(TLS_x_rsc_3_0_WDATA);
    x_rsc_3__0__INST.WSTRB(TLS_x_rsc_3_0_WSTRB);
    x_rsc_3__0__INST.WLAST(TLS_x_rsc_3_0_WLAST);
    x_rsc_3__0__INST.WUSER(CCS_ADAPTOR_x_rsc_3_0_WUSER);
    x_rsc_3__0__INST.WVALID(TLS_x_rsc_3_0_WVALID);
    x_rsc_3__0__INST.WREADY(TLS_x_rsc_3_0_WREADY);
    x_rsc_3__0__INST.BID(CCS_ADAPTOR_x_rsc_3_0_BID);
    x_rsc_3__0__INST.BRESP(TLS_x_rsc_3_0_BRESP);
    x_rsc_3__0__INST.BUSER(CCS_ADAPTOR_x_rsc_3_0_BUSER);
    x_rsc_3__0__INST.BVALID(TLS_x_rsc_3_0_BVALID);
    x_rsc_3__0__INST.BREADY(TLS_x_rsc_3_0_BREADY);
    x_rsc_3__0__INST.ARID(CCS_ADAPTOR_x_rsc_3_0_ARID);
    x_rsc_3__0__INST.ARADDR(TLS_x_rsc_3_0_ARADDR);
    x_rsc_3__0__INST.ARLEN(TLS_x_rsc_3_0_ARLEN);
    x_rsc_3__0__INST.ARSIZE(TLS_x_rsc_3_0_ARSIZE);
    x_rsc_3__0__INST.ARBURST(TLS_x_rsc_3_0_ARBURST);
    x_rsc_3__0__INST.ARLOCK(TLS_x_rsc_3_0_ARLOCK);
    x_rsc_3__0__INST.ARCACHE(TLS_x_rsc_3_0_ARCACHE);
    x_rsc_3__0__INST.ARPROT(TLS_x_rsc_3_0_ARPROT);
    x_rsc_3__0__INST.ARQOS(TLS_x_rsc_3_0_ARQOS);
    x_rsc_3__0__INST.ARREGION(TLS_x_rsc_3_0_ARREGION);
    x_rsc_3__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_3_0_ARUSER);
    x_rsc_3__0__INST.ARVALID(TLS_x_rsc_3_0_ARVALID);
    x_rsc_3__0__INST.ARREADY(TLS_x_rsc_3_0_ARREADY);
    x_rsc_3__0__INST.RID(CCS_ADAPTOR_x_rsc_3_0_RID);
    x_rsc_3__0__INST.RDATA(TLS_x_rsc_3_0_RDATA);
    x_rsc_3__0__INST.RRESP(TLS_x_rsc_3_0_RRESP);
    x_rsc_3__0__INST.RLAST(TLS_x_rsc_3_0_RLAST);
    x_rsc_3__0__INST.RUSER(CCS_ADAPTOR_x_rsc_3_0_RUSER);
    x_rsc_3__0__INST.RVALID(TLS_x_rsc_3_0_RVALID);
    x_rsc_3__0__INST.RREADY(TLS_x_rsc_3_0_RREADY);
    x_rsc_3__0__INST.tr_write_done(TLS_x_rsc_3_0_tr_write_done);
    x_rsc_3__0__INST.s_tdone(TLS_x_rsc_3_0_s_tdone);
    x_rsc_3__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_77)));

    CCS_ADAPTOR_TLS_x_rsc_4_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_4_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_4_0_AWID.outSCALAR(TLS_x_rsc_4_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_4_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_4_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_4_0_AWUSER.outSCALAR(TLS_x_rsc_4_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_4_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_4_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_4_0_WUSER.outSCALAR(TLS_x_rsc_4_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BID.inSCALAR(TLS_x_rsc_4_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_4_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BUSER.inSCALAR(TLS_x_rsc_4_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_4_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_4_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_4_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_4_0_ARID.outSCALAR(TLS_x_rsc_4_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_4_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_4_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_4_0_ARUSER.outSCALAR(TLS_x_rsc_4_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RID.inSCALAR(TLS_x_rsc_4_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_4_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RUSER.inSCALAR(TLS_x_rsc_4_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_4_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_4_0_RUSER);

    x_rsc_4__0__INST.ACLK(clk);
    x_rsc_4__0__INST.ARESETn(rst);
    x_rsc_4__0__INST.AWID(CCS_ADAPTOR_x_rsc_4_0_AWID);
    x_rsc_4__0__INST.AWADDR(TLS_x_rsc_4_0_AWADDR);
    x_rsc_4__0__INST.AWLEN(TLS_x_rsc_4_0_AWLEN);
    x_rsc_4__0__INST.AWSIZE(TLS_x_rsc_4_0_AWSIZE);
    x_rsc_4__0__INST.AWBURST(TLS_x_rsc_4_0_AWBURST);
    x_rsc_4__0__INST.AWLOCK(TLS_x_rsc_4_0_AWLOCK);
    x_rsc_4__0__INST.AWCACHE(TLS_x_rsc_4_0_AWCACHE);
    x_rsc_4__0__INST.AWPROT(TLS_x_rsc_4_0_AWPROT);
    x_rsc_4__0__INST.AWQOS(TLS_x_rsc_4_0_AWQOS);
    x_rsc_4__0__INST.AWREGION(TLS_x_rsc_4_0_AWREGION);
    x_rsc_4__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_4_0_AWUSER);
    x_rsc_4__0__INST.AWVALID(TLS_x_rsc_4_0_AWVALID);
    x_rsc_4__0__INST.AWREADY(TLS_x_rsc_4_0_AWREADY);
    x_rsc_4__0__INST.WDATA(TLS_x_rsc_4_0_WDATA);
    x_rsc_4__0__INST.WSTRB(TLS_x_rsc_4_0_WSTRB);
    x_rsc_4__0__INST.WLAST(TLS_x_rsc_4_0_WLAST);
    x_rsc_4__0__INST.WUSER(CCS_ADAPTOR_x_rsc_4_0_WUSER);
    x_rsc_4__0__INST.WVALID(TLS_x_rsc_4_0_WVALID);
    x_rsc_4__0__INST.WREADY(TLS_x_rsc_4_0_WREADY);
    x_rsc_4__0__INST.BID(CCS_ADAPTOR_x_rsc_4_0_BID);
    x_rsc_4__0__INST.BRESP(TLS_x_rsc_4_0_BRESP);
    x_rsc_4__0__INST.BUSER(CCS_ADAPTOR_x_rsc_4_0_BUSER);
    x_rsc_4__0__INST.BVALID(TLS_x_rsc_4_0_BVALID);
    x_rsc_4__0__INST.BREADY(TLS_x_rsc_4_0_BREADY);
    x_rsc_4__0__INST.ARID(CCS_ADAPTOR_x_rsc_4_0_ARID);
    x_rsc_4__0__INST.ARADDR(TLS_x_rsc_4_0_ARADDR);
    x_rsc_4__0__INST.ARLEN(TLS_x_rsc_4_0_ARLEN);
    x_rsc_4__0__INST.ARSIZE(TLS_x_rsc_4_0_ARSIZE);
    x_rsc_4__0__INST.ARBURST(TLS_x_rsc_4_0_ARBURST);
    x_rsc_4__0__INST.ARLOCK(TLS_x_rsc_4_0_ARLOCK);
    x_rsc_4__0__INST.ARCACHE(TLS_x_rsc_4_0_ARCACHE);
    x_rsc_4__0__INST.ARPROT(TLS_x_rsc_4_0_ARPROT);
    x_rsc_4__0__INST.ARQOS(TLS_x_rsc_4_0_ARQOS);
    x_rsc_4__0__INST.ARREGION(TLS_x_rsc_4_0_ARREGION);
    x_rsc_4__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_4_0_ARUSER);
    x_rsc_4__0__INST.ARVALID(TLS_x_rsc_4_0_ARVALID);
    x_rsc_4__0__INST.ARREADY(TLS_x_rsc_4_0_ARREADY);
    x_rsc_4__0__INST.RID(CCS_ADAPTOR_x_rsc_4_0_RID);
    x_rsc_4__0__INST.RDATA(TLS_x_rsc_4_0_RDATA);
    x_rsc_4__0__INST.RRESP(TLS_x_rsc_4_0_RRESP);
    x_rsc_4__0__INST.RLAST(TLS_x_rsc_4_0_RLAST);
    x_rsc_4__0__INST.RUSER(CCS_ADAPTOR_x_rsc_4_0_RUSER);
    x_rsc_4__0__INST.RVALID(TLS_x_rsc_4_0_RVALID);
    x_rsc_4__0__INST.RREADY(TLS_x_rsc_4_0_RREADY);
    x_rsc_4__0__INST.tr_write_done(TLS_x_rsc_4_0_tr_write_done);
    x_rsc_4__0__INST.s_tdone(TLS_x_rsc_4_0_s_tdone);
    x_rsc_4__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_78)));

    CCS_ADAPTOR_TLS_x_rsc_5_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_5_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_5_0_AWID.outSCALAR(TLS_x_rsc_5_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_5_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_5_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_5_0_AWUSER.outSCALAR(TLS_x_rsc_5_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_5_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_5_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_5_0_WUSER.outSCALAR(TLS_x_rsc_5_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BID.inSCALAR(TLS_x_rsc_5_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_5_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BUSER.inSCALAR(TLS_x_rsc_5_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_5_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_5_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_5_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_5_0_ARID.outSCALAR(TLS_x_rsc_5_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_5_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_5_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_5_0_ARUSER.outSCALAR(TLS_x_rsc_5_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RID.inSCALAR(TLS_x_rsc_5_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_5_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RUSER.inSCALAR(TLS_x_rsc_5_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_5_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_5_0_RUSER);

    x_rsc_5__0__INST.ACLK(clk);
    x_rsc_5__0__INST.ARESETn(rst);
    x_rsc_5__0__INST.AWID(CCS_ADAPTOR_x_rsc_5_0_AWID);
    x_rsc_5__0__INST.AWADDR(TLS_x_rsc_5_0_AWADDR);
    x_rsc_5__0__INST.AWLEN(TLS_x_rsc_5_0_AWLEN);
    x_rsc_5__0__INST.AWSIZE(TLS_x_rsc_5_0_AWSIZE);
    x_rsc_5__0__INST.AWBURST(TLS_x_rsc_5_0_AWBURST);
    x_rsc_5__0__INST.AWLOCK(TLS_x_rsc_5_0_AWLOCK);
    x_rsc_5__0__INST.AWCACHE(TLS_x_rsc_5_0_AWCACHE);
    x_rsc_5__0__INST.AWPROT(TLS_x_rsc_5_0_AWPROT);
    x_rsc_5__0__INST.AWQOS(TLS_x_rsc_5_0_AWQOS);
    x_rsc_5__0__INST.AWREGION(TLS_x_rsc_5_0_AWREGION);
    x_rsc_5__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_5_0_AWUSER);
    x_rsc_5__0__INST.AWVALID(TLS_x_rsc_5_0_AWVALID);
    x_rsc_5__0__INST.AWREADY(TLS_x_rsc_5_0_AWREADY);
    x_rsc_5__0__INST.WDATA(TLS_x_rsc_5_0_WDATA);
    x_rsc_5__0__INST.WSTRB(TLS_x_rsc_5_0_WSTRB);
    x_rsc_5__0__INST.WLAST(TLS_x_rsc_5_0_WLAST);
    x_rsc_5__0__INST.WUSER(CCS_ADAPTOR_x_rsc_5_0_WUSER);
    x_rsc_5__0__INST.WVALID(TLS_x_rsc_5_0_WVALID);
    x_rsc_5__0__INST.WREADY(TLS_x_rsc_5_0_WREADY);
    x_rsc_5__0__INST.BID(CCS_ADAPTOR_x_rsc_5_0_BID);
    x_rsc_5__0__INST.BRESP(TLS_x_rsc_5_0_BRESP);
    x_rsc_5__0__INST.BUSER(CCS_ADAPTOR_x_rsc_5_0_BUSER);
    x_rsc_5__0__INST.BVALID(TLS_x_rsc_5_0_BVALID);
    x_rsc_5__0__INST.BREADY(TLS_x_rsc_5_0_BREADY);
    x_rsc_5__0__INST.ARID(CCS_ADAPTOR_x_rsc_5_0_ARID);
    x_rsc_5__0__INST.ARADDR(TLS_x_rsc_5_0_ARADDR);
    x_rsc_5__0__INST.ARLEN(TLS_x_rsc_5_0_ARLEN);
    x_rsc_5__0__INST.ARSIZE(TLS_x_rsc_5_0_ARSIZE);
    x_rsc_5__0__INST.ARBURST(TLS_x_rsc_5_0_ARBURST);
    x_rsc_5__0__INST.ARLOCK(TLS_x_rsc_5_0_ARLOCK);
    x_rsc_5__0__INST.ARCACHE(TLS_x_rsc_5_0_ARCACHE);
    x_rsc_5__0__INST.ARPROT(TLS_x_rsc_5_0_ARPROT);
    x_rsc_5__0__INST.ARQOS(TLS_x_rsc_5_0_ARQOS);
    x_rsc_5__0__INST.ARREGION(TLS_x_rsc_5_0_ARREGION);
    x_rsc_5__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_5_0_ARUSER);
    x_rsc_5__0__INST.ARVALID(TLS_x_rsc_5_0_ARVALID);
    x_rsc_5__0__INST.ARREADY(TLS_x_rsc_5_0_ARREADY);
    x_rsc_5__0__INST.RID(CCS_ADAPTOR_x_rsc_5_0_RID);
    x_rsc_5__0__INST.RDATA(TLS_x_rsc_5_0_RDATA);
    x_rsc_5__0__INST.RRESP(TLS_x_rsc_5_0_RRESP);
    x_rsc_5__0__INST.RLAST(TLS_x_rsc_5_0_RLAST);
    x_rsc_5__0__INST.RUSER(CCS_ADAPTOR_x_rsc_5_0_RUSER);
    x_rsc_5__0__INST.RVALID(TLS_x_rsc_5_0_RVALID);
    x_rsc_5__0__INST.RREADY(TLS_x_rsc_5_0_RREADY);
    x_rsc_5__0__INST.tr_write_done(TLS_x_rsc_5_0_tr_write_done);
    x_rsc_5__0__INST.s_tdone(TLS_x_rsc_5_0_s_tdone);
    x_rsc_5__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_79)));

    CCS_ADAPTOR_TLS_x_rsc_6_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_6_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_6_0_AWID.outSCALAR(TLS_x_rsc_6_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_6_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_6_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_6_0_AWUSER.outSCALAR(TLS_x_rsc_6_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_6_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_6_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_6_0_WUSER.outSCALAR(TLS_x_rsc_6_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BID.inSCALAR(TLS_x_rsc_6_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_6_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BUSER.inSCALAR(TLS_x_rsc_6_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_6_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_6_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_6_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_6_0_ARID.outSCALAR(TLS_x_rsc_6_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_6_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_6_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_6_0_ARUSER.outSCALAR(TLS_x_rsc_6_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RID.inSCALAR(TLS_x_rsc_6_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_6_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RUSER.inSCALAR(TLS_x_rsc_6_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_6_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_6_0_RUSER);

    x_rsc_6__0__INST.ACLK(clk);
    x_rsc_6__0__INST.ARESETn(rst);
    x_rsc_6__0__INST.AWID(CCS_ADAPTOR_x_rsc_6_0_AWID);
    x_rsc_6__0__INST.AWADDR(TLS_x_rsc_6_0_AWADDR);
    x_rsc_6__0__INST.AWLEN(TLS_x_rsc_6_0_AWLEN);
    x_rsc_6__0__INST.AWSIZE(TLS_x_rsc_6_0_AWSIZE);
    x_rsc_6__0__INST.AWBURST(TLS_x_rsc_6_0_AWBURST);
    x_rsc_6__0__INST.AWLOCK(TLS_x_rsc_6_0_AWLOCK);
    x_rsc_6__0__INST.AWCACHE(TLS_x_rsc_6_0_AWCACHE);
    x_rsc_6__0__INST.AWPROT(TLS_x_rsc_6_0_AWPROT);
    x_rsc_6__0__INST.AWQOS(TLS_x_rsc_6_0_AWQOS);
    x_rsc_6__0__INST.AWREGION(TLS_x_rsc_6_0_AWREGION);
    x_rsc_6__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_6_0_AWUSER);
    x_rsc_6__0__INST.AWVALID(TLS_x_rsc_6_0_AWVALID);
    x_rsc_6__0__INST.AWREADY(TLS_x_rsc_6_0_AWREADY);
    x_rsc_6__0__INST.WDATA(TLS_x_rsc_6_0_WDATA);
    x_rsc_6__0__INST.WSTRB(TLS_x_rsc_6_0_WSTRB);
    x_rsc_6__0__INST.WLAST(TLS_x_rsc_6_0_WLAST);
    x_rsc_6__0__INST.WUSER(CCS_ADAPTOR_x_rsc_6_0_WUSER);
    x_rsc_6__0__INST.WVALID(TLS_x_rsc_6_0_WVALID);
    x_rsc_6__0__INST.WREADY(TLS_x_rsc_6_0_WREADY);
    x_rsc_6__0__INST.BID(CCS_ADAPTOR_x_rsc_6_0_BID);
    x_rsc_6__0__INST.BRESP(TLS_x_rsc_6_0_BRESP);
    x_rsc_6__0__INST.BUSER(CCS_ADAPTOR_x_rsc_6_0_BUSER);
    x_rsc_6__0__INST.BVALID(TLS_x_rsc_6_0_BVALID);
    x_rsc_6__0__INST.BREADY(TLS_x_rsc_6_0_BREADY);
    x_rsc_6__0__INST.ARID(CCS_ADAPTOR_x_rsc_6_0_ARID);
    x_rsc_6__0__INST.ARADDR(TLS_x_rsc_6_0_ARADDR);
    x_rsc_6__0__INST.ARLEN(TLS_x_rsc_6_0_ARLEN);
    x_rsc_6__0__INST.ARSIZE(TLS_x_rsc_6_0_ARSIZE);
    x_rsc_6__0__INST.ARBURST(TLS_x_rsc_6_0_ARBURST);
    x_rsc_6__0__INST.ARLOCK(TLS_x_rsc_6_0_ARLOCK);
    x_rsc_6__0__INST.ARCACHE(TLS_x_rsc_6_0_ARCACHE);
    x_rsc_6__0__INST.ARPROT(TLS_x_rsc_6_0_ARPROT);
    x_rsc_6__0__INST.ARQOS(TLS_x_rsc_6_0_ARQOS);
    x_rsc_6__0__INST.ARREGION(TLS_x_rsc_6_0_ARREGION);
    x_rsc_6__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_6_0_ARUSER);
    x_rsc_6__0__INST.ARVALID(TLS_x_rsc_6_0_ARVALID);
    x_rsc_6__0__INST.ARREADY(TLS_x_rsc_6_0_ARREADY);
    x_rsc_6__0__INST.RID(CCS_ADAPTOR_x_rsc_6_0_RID);
    x_rsc_6__0__INST.RDATA(TLS_x_rsc_6_0_RDATA);
    x_rsc_6__0__INST.RRESP(TLS_x_rsc_6_0_RRESP);
    x_rsc_6__0__INST.RLAST(TLS_x_rsc_6_0_RLAST);
    x_rsc_6__0__INST.RUSER(CCS_ADAPTOR_x_rsc_6_0_RUSER);
    x_rsc_6__0__INST.RVALID(TLS_x_rsc_6_0_RVALID);
    x_rsc_6__0__INST.RREADY(TLS_x_rsc_6_0_RREADY);
    x_rsc_6__0__INST.tr_write_done(TLS_x_rsc_6_0_tr_write_done);
    x_rsc_6__0__INST.s_tdone(TLS_x_rsc_6_0_s_tdone);
    x_rsc_6__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_80)));

    CCS_ADAPTOR_TLS_x_rsc_7_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_7_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_7_0_AWID.outSCALAR(TLS_x_rsc_7_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_7_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_7_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_7_0_AWUSER.outSCALAR(TLS_x_rsc_7_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_7_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_7_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_7_0_WUSER.outSCALAR(TLS_x_rsc_7_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BID.inSCALAR(TLS_x_rsc_7_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_7_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BUSER.inSCALAR(TLS_x_rsc_7_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_7_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_7_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_7_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_7_0_ARID.outSCALAR(TLS_x_rsc_7_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_7_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_7_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_7_0_ARUSER.outSCALAR(TLS_x_rsc_7_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RID.inSCALAR(TLS_x_rsc_7_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_7_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RUSER.inSCALAR(TLS_x_rsc_7_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_7_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_7_0_RUSER);

    x_rsc_7__0__INST.ACLK(clk);
    x_rsc_7__0__INST.ARESETn(rst);
    x_rsc_7__0__INST.AWID(CCS_ADAPTOR_x_rsc_7_0_AWID);
    x_rsc_7__0__INST.AWADDR(TLS_x_rsc_7_0_AWADDR);
    x_rsc_7__0__INST.AWLEN(TLS_x_rsc_7_0_AWLEN);
    x_rsc_7__0__INST.AWSIZE(TLS_x_rsc_7_0_AWSIZE);
    x_rsc_7__0__INST.AWBURST(TLS_x_rsc_7_0_AWBURST);
    x_rsc_7__0__INST.AWLOCK(TLS_x_rsc_7_0_AWLOCK);
    x_rsc_7__0__INST.AWCACHE(TLS_x_rsc_7_0_AWCACHE);
    x_rsc_7__0__INST.AWPROT(TLS_x_rsc_7_0_AWPROT);
    x_rsc_7__0__INST.AWQOS(TLS_x_rsc_7_0_AWQOS);
    x_rsc_7__0__INST.AWREGION(TLS_x_rsc_7_0_AWREGION);
    x_rsc_7__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_7_0_AWUSER);
    x_rsc_7__0__INST.AWVALID(TLS_x_rsc_7_0_AWVALID);
    x_rsc_7__0__INST.AWREADY(TLS_x_rsc_7_0_AWREADY);
    x_rsc_7__0__INST.WDATA(TLS_x_rsc_7_0_WDATA);
    x_rsc_7__0__INST.WSTRB(TLS_x_rsc_7_0_WSTRB);
    x_rsc_7__0__INST.WLAST(TLS_x_rsc_7_0_WLAST);
    x_rsc_7__0__INST.WUSER(CCS_ADAPTOR_x_rsc_7_0_WUSER);
    x_rsc_7__0__INST.WVALID(TLS_x_rsc_7_0_WVALID);
    x_rsc_7__0__INST.WREADY(TLS_x_rsc_7_0_WREADY);
    x_rsc_7__0__INST.BID(CCS_ADAPTOR_x_rsc_7_0_BID);
    x_rsc_7__0__INST.BRESP(TLS_x_rsc_7_0_BRESP);
    x_rsc_7__0__INST.BUSER(CCS_ADAPTOR_x_rsc_7_0_BUSER);
    x_rsc_7__0__INST.BVALID(TLS_x_rsc_7_0_BVALID);
    x_rsc_7__0__INST.BREADY(TLS_x_rsc_7_0_BREADY);
    x_rsc_7__0__INST.ARID(CCS_ADAPTOR_x_rsc_7_0_ARID);
    x_rsc_7__0__INST.ARADDR(TLS_x_rsc_7_0_ARADDR);
    x_rsc_7__0__INST.ARLEN(TLS_x_rsc_7_0_ARLEN);
    x_rsc_7__0__INST.ARSIZE(TLS_x_rsc_7_0_ARSIZE);
    x_rsc_7__0__INST.ARBURST(TLS_x_rsc_7_0_ARBURST);
    x_rsc_7__0__INST.ARLOCK(TLS_x_rsc_7_0_ARLOCK);
    x_rsc_7__0__INST.ARCACHE(TLS_x_rsc_7_0_ARCACHE);
    x_rsc_7__0__INST.ARPROT(TLS_x_rsc_7_0_ARPROT);
    x_rsc_7__0__INST.ARQOS(TLS_x_rsc_7_0_ARQOS);
    x_rsc_7__0__INST.ARREGION(TLS_x_rsc_7_0_ARREGION);
    x_rsc_7__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_7_0_ARUSER);
    x_rsc_7__0__INST.ARVALID(TLS_x_rsc_7_0_ARVALID);
    x_rsc_7__0__INST.ARREADY(TLS_x_rsc_7_0_ARREADY);
    x_rsc_7__0__INST.RID(CCS_ADAPTOR_x_rsc_7_0_RID);
    x_rsc_7__0__INST.RDATA(TLS_x_rsc_7_0_RDATA);
    x_rsc_7__0__INST.RRESP(TLS_x_rsc_7_0_RRESP);
    x_rsc_7__0__INST.RLAST(TLS_x_rsc_7_0_RLAST);
    x_rsc_7__0__INST.RUSER(CCS_ADAPTOR_x_rsc_7_0_RUSER);
    x_rsc_7__0__INST.RVALID(TLS_x_rsc_7_0_RVALID);
    x_rsc_7__0__INST.RREADY(TLS_x_rsc_7_0_RREADY);
    x_rsc_7__0__INST.tr_write_done(TLS_x_rsc_7_0_tr_write_done);
    x_rsc_7__0__INST.s_tdone(TLS_x_rsc_7_0_s_tdone);
    x_rsc_7__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_81)));

    CCS_ADAPTOR_TLS_x_rsc_8_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_8_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_8_0_AWID.outSCALAR(TLS_x_rsc_8_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_8_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_8_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_8_0_AWUSER.outSCALAR(TLS_x_rsc_8_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_8_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_8_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_8_0_WUSER.outSCALAR(TLS_x_rsc_8_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BID.inSCALAR(TLS_x_rsc_8_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_8_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BUSER.inSCALAR(TLS_x_rsc_8_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_8_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_8_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_8_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_8_0_ARID.outSCALAR(TLS_x_rsc_8_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_8_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_8_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_8_0_ARUSER.outSCALAR(TLS_x_rsc_8_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RID.inSCALAR(TLS_x_rsc_8_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_8_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RUSER.inSCALAR(TLS_x_rsc_8_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_8_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_8_0_RUSER);

    x_rsc_8__0__INST.ACLK(clk);
    x_rsc_8__0__INST.ARESETn(rst);
    x_rsc_8__0__INST.AWID(CCS_ADAPTOR_x_rsc_8_0_AWID);
    x_rsc_8__0__INST.AWADDR(TLS_x_rsc_8_0_AWADDR);
    x_rsc_8__0__INST.AWLEN(TLS_x_rsc_8_0_AWLEN);
    x_rsc_8__0__INST.AWSIZE(TLS_x_rsc_8_0_AWSIZE);
    x_rsc_8__0__INST.AWBURST(TLS_x_rsc_8_0_AWBURST);
    x_rsc_8__0__INST.AWLOCK(TLS_x_rsc_8_0_AWLOCK);
    x_rsc_8__0__INST.AWCACHE(TLS_x_rsc_8_0_AWCACHE);
    x_rsc_8__0__INST.AWPROT(TLS_x_rsc_8_0_AWPROT);
    x_rsc_8__0__INST.AWQOS(TLS_x_rsc_8_0_AWQOS);
    x_rsc_8__0__INST.AWREGION(TLS_x_rsc_8_0_AWREGION);
    x_rsc_8__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_8_0_AWUSER);
    x_rsc_8__0__INST.AWVALID(TLS_x_rsc_8_0_AWVALID);
    x_rsc_8__0__INST.AWREADY(TLS_x_rsc_8_0_AWREADY);
    x_rsc_8__0__INST.WDATA(TLS_x_rsc_8_0_WDATA);
    x_rsc_8__0__INST.WSTRB(TLS_x_rsc_8_0_WSTRB);
    x_rsc_8__0__INST.WLAST(TLS_x_rsc_8_0_WLAST);
    x_rsc_8__0__INST.WUSER(CCS_ADAPTOR_x_rsc_8_0_WUSER);
    x_rsc_8__0__INST.WVALID(TLS_x_rsc_8_0_WVALID);
    x_rsc_8__0__INST.WREADY(TLS_x_rsc_8_0_WREADY);
    x_rsc_8__0__INST.BID(CCS_ADAPTOR_x_rsc_8_0_BID);
    x_rsc_8__0__INST.BRESP(TLS_x_rsc_8_0_BRESP);
    x_rsc_8__0__INST.BUSER(CCS_ADAPTOR_x_rsc_8_0_BUSER);
    x_rsc_8__0__INST.BVALID(TLS_x_rsc_8_0_BVALID);
    x_rsc_8__0__INST.BREADY(TLS_x_rsc_8_0_BREADY);
    x_rsc_8__0__INST.ARID(CCS_ADAPTOR_x_rsc_8_0_ARID);
    x_rsc_8__0__INST.ARADDR(TLS_x_rsc_8_0_ARADDR);
    x_rsc_8__0__INST.ARLEN(TLS_x_rsc_8_0_ARLEN);
    x_rsc_8__0__INST.ARSIZE(TLS_x_rsc_8_0_ARSIZE);
    x_rsc_8__0__INST.ARBURST(TLS_x_rsc_8_0_ARBURST);
    x_rsc_8__0__INST.ARLOCK(TLS_x_rsc_8_0_ARLOCK);
    x_rsc_8__0__INST.ARCACHE(TLS_x_rsc_8_0_ARCACHE);
    x_rsc_8__0__INST.ARPROT(TLS_x_rsc_8_0_ARPROT);
    x_rsc_8__0__INST.ARQOS(TLS_x_rsc_8_0_ARQOS);
    x_rsc_8__0__INST.ARREGION(TLS_x_rsc_8_0_ARREGION);
    x_rsc_8__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_8_0_ARUSER);
    x_rsc_8__0__INST.ARVALID(TLS_x_rsc_8_0_ARVALID);
    x_rsc_8__0__INST.ARREADY(TLS_x_rsc_8_0_ARREADY);
    x_rsc_8__0__INST.RID(CCS_ADAPTOR_x_rsc_8_0_RID);
    x_rsc_8__0__INST.RDATA(TLS_x_rsc_8_0_RDATA);
    x_rsc_8__0__INST.RRESP(TLS_x_rsc_8_0_RRESP);
    x_rsc_8__0__INST.RLAST(TLS_x_rsc_8_0_RLAST);
    x_rsc_8__0__INST.RUSER(CCS_ADAPTOR_x_rsc_8_0_RUSER);
    x_rsc_8__0__INST.RVALID(TLS_x_rsc_8_0_RVALID);
    x_rsc_8__0__INST.RREADY(TLS_x_rsc_8_0_RREADY);
    x_rsc_8__0__INST.tr_write_done(TLS_x_rsc_8_0_tr_write_done);
    x_rsc_8__0__INST.s_tdone(TLS_x_rsc_8_0_s_tdone);
    x_rsc_8__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_82)));

    CCS_ADAPTOR_TLS_x_rsc_9_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_9_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_9_0_AWID.outSCALAR(TLS_x_rsc_9_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_9_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_9_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_9_0_AWUSER.outSCALAR(TLS_x_rsc_9_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_9_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_9_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_9_0_WUSER.outSCALAR(TLS_x_rsc_9_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BID.inSCALAR(TLS_x_rsc_9_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_9_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BUSER.inSCALAR(TLS_x_rsc_9_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_9_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_9_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_9_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_9_0_ARID.outSCALAR(TLS_x_rsc_9_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_9_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_9_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_9_0_ARUSER.outSCALAR(TLS_x_rsc_9_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RID.inSCALAR(TLS_x_rsc_9_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_9_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RUSER.inSCALAR(TLS_x_rsc_9_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_9_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_9_0_RUSER);

    x_rsc_9__0__INST.ACLK(clk);
    x_rsc_9__0__INST.ARESETn(rst);
    x_rsc_9__0__INST.AWID(CCS_ADAPTOR_x_rsc_9_0_AWID);
    x_rsc_9__0__INST.AWADDR(TLS_x_rsc_9_0_AWADDR);
    x_rsc_9__0__INST.AWLEN(TLS_x_rsc_9_0_AWLEN);
    x_rsc_9__0__INST.AWSIZE(TLS_x_rsc_9_0_AWSIZE);
    x_rsc_9__0__INST.AWBURST(TLS_x_rsc_9_0_AWBURST);
    x_rsc_9__0__INST.AWLOCK(TLS_x_rsc_9_0_AWLOCK);
    x_rsc_9__0__INST.AWCACHE(TLS_x_rsc_9_0_AWCACHE);
    x_rsc_9__0__INST.AWPROT(TLS_x_rsc_9_0_AWPROT);
    x_rsc_9__0__INST.AWQOS(TLS_x_rsc_9_0_AWQOS);
    x_rsc_9__0__INST.AWREGION(TLS_x_rsc_9_0_AWREGION);
    x_rsc_9__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_9_0_AWUSER);
    x_rsc_9__0__INST.AWVALID(TLS_x_rsc_9_0_AWVALID);
    x_rsc_9__0__INST.AWREADY(TLS_x_rsc_9_0_AWREADY);
    x_rsc_9__0__INST.WDATA(TLS_x_rsc_9_0_WDATA);
    x_rsc_9__0__INST.WSTRB(TLS_x_rsc_9_0_WSTRB);
    x_rsc_9__0__INST.WLAST(TLS_x_rsc_9_0_WLAST);
    x_rsc_9__0__INST.WUSER(CCS_ADAPTOR_x_rsc_9_0_WUSER);
    x_rsc_9__0__INST.WVALID(TLS_x_rsc_9_0_WVALID);
    x_rsc_9__0__INST.WREADY(TLS_x_rsc_9_0_WREADY);
    x_rsc_9__0__INST.BID(CCS_ADAPTOR_x_rsc_9_0_BID);
    x_rsc_9__0__INST.BRESP(TLS_x_rsc_9_0_BRESP);
    x_rsc_9__0__INST.BUSER(CCS_ADAPTOR_x_rsc_9_0_BUSER);
    x_rsc_9__0__INST.BVALID(TLS_x_rsc_9_0_BVALID);
    x_rsc_9__0__INST.BREADY(TLS_x_rsc_9_0_BREADY);
    x_rsc_9__0__INST.ARID(CCS_ADAPTOR_x_rsc_9_0_ARID);
    x_rsc_9__0__INST.ARADDR(TLS_x_rsc_9_0_ARADDR);
    x_rsc_9__0__INST.ARLEN(TLS_x_rsc_9_0_ARLEN);
    x_rsc_9__0__INST.ARSIZE(TLS_x_rsc_9_0_ARSIZE);
    x_rsc_9__0__INST.ARBURST(TLS_x_rsc_9_0_ARBURST);
    x_rsc_9__0__INST.ARLOCK(TLS_x_rsc_9_0_ARLOCK);
    x_rsc_9__0__INST.ARCACHE(TLS_x_rsc_9_0_ARCACHE);
    x_rsc_9__0__INST.ARPROT(TLS_x_rsc_9_0_ARPROT);
    x_rsc_9__0__INST.ARQOS(TLS_x_rsc_9_0_ARQOS);
    x_rsc_9__0__INST.ARREGION(TLS_x_rsc_9_0_ARREGION);
    x_rsc_9__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_9_0_ARUSER);
    x_rsc_9__0__INST.ARVALID(TLS_x_rsc_9_0_ARVALID);
    x_rsc_9__0__INST.ARREADY(TLS_x_rsc_9_0_ARREADY);
    x_rsc_9__0__INST.RID(CCS_ADAPTOR_x_rsc_9_0_RID);
    x_rsc_9__0__INST.RDATA(TLS_x_rsc_9_0_RDATA);
    x_rsc_9__0__INST.RRESP(TLS_x_rsc_9_0_RRESP);
    x_rsc_9__0__INST.RLAST(TLS_x_rsc_9_0_RLAST);
    x_rsc_9__0__INST.RUSER(CCS_ADAPTOR_x_rsc_9_0_RUSER);
    x_rsc_9__0__INST.RVALID(TLS_x_rsc_9_0_RVALID);
    x_rsc_9__0__INST.RREADY(TLS_x_rsc_9_0_RREADY);
    x_rsc_9__0__INST.tr_write_done(TLS_x_rsc_9_0_tr_write_done);
    x_rsc_9__0__INST.s_tdone(TLS_x_rsc_9_0_s_tdone);
    x_rsc_9__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_83)));

    CCS_ADAPTOR_TLS_x_rsc_10_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_10_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_10_0_AWID.outSCALAR(TLS_x_rsc_10_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_10_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_10_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_10_0_AWUSER.outSCALAR(TLS_x_rsc_10_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_10_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_10_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_10_0_WUSER.outSCALAR(TLS_x_rsc_10_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BID.inSCALAR(TLS_x_rsc_10_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_10_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BUSER.inSCALAR(TLS_x_rsc_10_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_10_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_10_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_10_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_10_0_ARID.outSCALAR(TLS_x_rsc_10_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_10_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_10_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_10_0_ARUSER.outSCALAR(TLS_x_rsc_10_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RID.inSCALAR(TLS_x_rsc_10_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_10_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RUSER.inSCALAR(TLS_x_rsc_10_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_10_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_10_0_RUSER);

    x_rsc_10__0__INST.ACLK(clk);
    x_rsc_10__0__INST.ARESETn(rst);
    x_rsc_10__0__INST.AWID(CCS_ADAPTOR_x_rsc_10_0_AWID);
    x_rsc_10__0__INST.AWADDR(TLS_x_rsc_10_0_AWADDR);
    x_rsc_10__0__INST.AWLEN(TLS_x_rsc_10_0_AWLEN);
    x_rsc_10__0__INST.AWSIZE(TLS_x_rsc_10_0_AWSIZE);
    x_rsc_10__0__INST.AWBURST(TLS_x_rsc_10_0_AWBURST);
    x_rsc_10__0__INST.AWLOCK(TLS_x_rsc_10_0_AWLOCK);
    x_rsc_10__0__INST.AWCACHE(TLS_x_rsc_10_0_AWCACHE);
    x_rsc_10__0__INST.AWPROT(TLS_x_rsc_10_0_AWPROT);
    x_rsc_10__0__INST.AWQOS(TLS_x_rsc_10_0_AWQOS);
    x_rsc_10__0__INST.AWREGION(TLS_x_rsc_10_0_AWREGION);
    x_rsc_10__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_10_0_AWUSER);
    x_rsc_10__0__INST.AWVALID(TLS_x_rsc_10_0_AWVALID);
    x_rsc_10__0__INST.AWREADY(TLS_x_rsc_10_0_AWREADY);
    x_rsc_10__0__INST.WDATA(TLS_x_rsc_10_0_WDATA);
    x_rsc_10__0__INST.WSTRB(TLS_x_rsc_10_0_WSTRB);
    x_rsc_10__0__INST.WLAST(TLS_x_rsc_10_0_WLAST);
    x_rsc_10__0__INST.WUSER(CCS_ADAPTOR_x_rsc_10_0_WUSER);
    x_rsc_10__0__INST.WVALID(TLS_x_rsc_10_0_WVALID);
    x_rsc_10__0__INST.WREADY(TLS_x_rsc_10_0_WREADY);
    x_rsc_10__0__INST.BID(CCS_ADAPTOR_x_rsc_10_0_BID);
    x_rsc_10__0__INST.BRESP(TLS_x_rsc_10_0_BRESP);
    x_rsc_10__0__INST.BUSER(CCS_ADAPTOR_x_rsc_10_0_BUSER);
    x_rsc_10__0__INST.BVALID(TLS_x_rsc_10_0_BVALID);
    x_rsc_10__0__INST.BREADY(TLS_x_rsc_10_0_BREADY);
    x_rsc_10__0__INST.ARID(CCS_ADAPTOR_x_rsc_10_0_ARID);
    x_rsc_10__0__INST.ARADDR(TLS_x_rsc_10_0_ARADDR);
    x_rsc_10__0__INST.ARLEN(TLS_x_rsc_10_0_ARLEN);
    x_rsc_10__0__INST.ARSIZE(TLS_x_rsc_10_0_ARSIZE);
    x_rsc_10__0__INST.ARBURST(TLS_x_rsc_10_0_ARBURST);
    x_rsc_10__0__INST.ARLOCK(TLS_x_rsc_10_0_ARLOCK);
    x_rsc_10__0__INST.ARCACHE(TLS_x_rsc_10_0_ARCACHE);
    x_rsc_10__0__INST.ARPROT(TLS_x_rsc_10_0_ARPROT);
    x_rsc_10__0__INST.ARQOS(TLS_x_rsc_10_0_ARQOS);
    x_rsc_10__0__INST.ARREGION(TLS_x_rsc_10_0_ARREGION);
    x_rsc_10__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_10_0_ARUSER);
    x_rsc_10__0__INST.ARVALID(TLS_x_rsc_10_0_ARVALID);
    x_rsc_10__0__INST.ARREADY(TLS_x_rsc_10_0_ARREADY);
    x_rsc_10__0__INST.RID(CCS_ADAPTOR_x_rsc_10_0_RID);
    x_rsc_10__0__INST.RDATA(TLS_x_rsc_10_0_RDATA);
    x_rsc_10__0__INST.RRESP(TLS_x_rsc_10_0_RRESP);
    x_rsc_10__0__INST.RLAST(TLS_x_rsc_10_0_RLAST);
    x_rsc_10__0__INST.RUSER(CCS_ADAPTOR_x_rsc_10_0_RUSER);
    x_rsc_10__0__INST.RVALID(TLS_x_rsc_10_0_RVALID);
    x_rsc_10__0__INST.RREADY(TLS_x_rsc_10_0_RREADY);
    x_rsc_10__0__INST.tr_write_done(TLS_x_rsc_10_0_tr_write_done);
    x_rsc_10__0__INST.s_tdone(TLS_x_rsc_10_0_s_tdone);
    x_rsc_10__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_84)));

    CCS_ADAPTOR_TLS_x_rsc_11_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_11_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_11_0_AWID.outSCALAR(TLS_x_rsc_11_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_11_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_11_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_11_0_AWUSER.outSCALAR(TLS_x_rsc_11_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_11_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_11_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_11_0_WUSER.outSCALAR(TLS_x_rsc_11_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BID.inSCALAR(TLS_x_rsc_11_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_11_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BUSER.inSCALAR(TLS_x_rsc_11_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_11_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_11_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_11_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_11_0_ARID.outSCALAR(TLS_x_rsc_11_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_11_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_11_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_11_0_ARUSER.outSCALAR(TLS_x_rsc_11_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RID.inSCALAR(TLS_x_rsc_11_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_11_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RUSER.inSCALAR(TLS_x_rsc_11_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_11_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_11_0_RUSER);

    x_rsc_11__0__INST.ACLK(clk);
    x_rsc_11__0__INST.ARESETn(rst);
    x_rsc_11__0__INST.AWID(CCS_ADAPTOR_x_rsc_11_0_AWID);
    x_rsc_11__0__INST.AWADDR(TLS_x_rsc_11_0_AWADDR);
    x_rsc_11__0__INST.AWLEN(TLS_x_rsc_11_0_AWLEN);
    x_rsc_11__0__INST.AWSIZE(TLS_x_rsc_11_0_AWSIZE);
    x_rsc_11__0__INST.AWBURST(TLS_x_rsc_11_0_AWBURST);
    x_rsc_11__0__INST.AWLOCK(TLS_x_rsc_11_0_AWLOCK);
    x_rsc_11__0__INST.AWCACHE(TLS_x_rsc_11_0_AWCACHE);
    x_rsc_11__0__INST.AWPROT(TLS_x_rsc_11_0_AWPROT);
    x_rsc_11__0__INST.AWQOS(TLS_x_rsc_11_0_AWQOS);
    x_rsc_11__0__INST.AWREGION(TLS_x_rsc_11_0_AWREGION);
    x_rsc_11__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_11_0_AWUSER);
    x_rsc_11__0__INST.AWVALID(TLS_x_rsc_11_0_AWVALID);
    x_rsc_11__0__INST.AWREADY(TLS_x_rsc_11_0_AWREADY);
    x_rsc_11__0__INST.WDATA(TLS_x_rsc_11_0_WDATA);
    x_rsc_11__0__INST.WSTRB(TLS_x_rsc_11_0_WSTRB);
    x_rsc_11__0__INST.WLAST(TLS_x_rsc_11_0_WLAST);
    x_rsc_11__0__INST.WUSER(CCS_ADAPTOR_x_rsc_11_0_WUSER);
    x_rsc_11__0__INST.WVALID(TLS_x_rsc_11_0_WVALID);
    x_rsc_11__0__INST.WREADY(TLS_x_rsc_11_0_WREADY);
    x_rsc_11__0__INST.BID(CCS_ADAPTOR_x_rsc_11_0_BID);
    x_rsc_11__0__INST.BRESP(TLS_x_rsc_11_0_BRESP);
    x_rsc_11__0__INST.BUSER(CCS_ADAPTOR_x_rsc_11_0_BUSER);
    x_rsc_11__0__INST.BVALID(TLS_x_rsc_11_0_BVALID);
    x_rsc_11__0__INST.BREADY(TLS_x_rsc_11_0_BREADY);
    x_rsc_11__0__INST.ARID(CCS_ADAPTOR_x_rsc_11_0_ARID);
    x_rsc_11__0__INST.ARADDR(TLS_x_rsc_11_0_ARADDR);
    x_rsc_11__0__INST.ARLEN(TLS_x_rsc_11_0_ARLEN);
    x_rsc_11__0__INST.ARSIZE(TLS_x_rsc_11_0_ARSIZE);
    x_rsc_11__0__INST.ARBURST(TLS_x_rsc_11_0_ARBURST);
    x_rsc_11__0__INST.ARLOCK(TLS_x_rsc_11_0_ARLOCK);
    x_rsc_11__0__INST.ARCACHE(TLS_x_rsc_11_0_ARCACHE);
    x_rsc_11__0__INST.ARPROT(TLS_x_rsc_11_0_ARPROT);
    x_rsc_11__0__INST.ARQOS(TLS_x_rsc_11_0_ARQOS);
    x_rsc_11__0__INST.ARREGION(TLS_x_rsc_11_0_ARREGION);
    x_rsc_11__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_11_0_ARUSER);
    x_rsc_11__0__INST.ARVALID(TLS_x_rsc_11_0_ARVALID);
    x_rsc_11__0__INST.ARREADY(TLS_x_rsc_11_0_ARREADY);
    x_rsc_11__0__INST.RID(CCS_ADAPTOR_x_rsc_11_0_RID);
    x_rsc_11__0__INST.RDATA(TLS_x_rsc_11_0_RDATA);
    x_rsc_11__0__INST.RRESP(TLS_x_rsc_11_0_RRESP);
    x_rsc_11__0__INST.RLAST(TLS_x_rsc_11_0_RLAST);
    x_rsc_11__0__INST.RUSER(CCS_ADAPTOR_x_rsc_11_0_RUSER);
    x_rsc_11__0__INST.RVALID(TLS_x_rsc_11_0_RVALID);
    x_rsc_11__0__INST.RREADY(TLS_x_rsc_11_0_RREADY);
    x_rsc_11__0__INST.tr_write_done(TLS_x_rsc_11_0_tr_write_done);
    x_rsc_11__0__INST.s_tdone(TLS_x_rsc_11_0_s_tdone);
    x_rsc_11__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_85)));

    CCS_ADAPTOR_TLS_x_rsc_12_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_12_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_12_0_AWID.outSCALAR(TLS_x_rsc_12_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_12_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_12_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_12_0_AWUSER.outSCALAR(TLS_x_rsc_12_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_12_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_12_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_12_0_WUSER.outSCALAR(TLS_x_rsc_12_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BID.inSCALAR(TLS_x_rsc_12_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_12_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BUSER.inSCALAR(TLS_x_rsc_12_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_12_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_12_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_12_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_12_0_ARID.outSCALAR(TLS_x_rsc_12_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_12_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_12_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_12_0_ARUSER.outSCALAR(TLS_x_rsc_12_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RID.inSCALAR(TLS_x_rsc_12_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_12_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RUSER.inSCALAR(TLS_x_rsc_12_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_12_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_12_0_RUSER);

    x_rsc_12__0__INST.ACLK(clk);
    x_rsc_12__0__INST.ARESETn(rst);
    x_rsc_12__0__INST.AWID(CCS_ADAPTOR_x_rsc_12_0_AWID);
    x_rsc_12__0__INST.AWADDR(TLS_x_rsc_12_0_AWADDR);
    x_rsc_12__0__INST.AWLEN(TLS_x_rsc_12_0_AWLEN);
    x_rsc_12__0__INST.AWSIZE(TLS_x_rsc_12_0_AWSIZE);
    x_rsc_12__0__INST.AWBURST(TLS_x_rsc_12_0_AWBURST);
    x_rsc_12__0__INST.AWLOCK(TLS_x_rsc_12_0_AWLOCK);
    x_rsc_12__0__INST.AWCACHE(TLS_x_rsc_12_0_AWCACHE);
    x_rsc_12__0__INST.AWPROT(TLS_x_rsc_12_0_AWPROT);
    x_rsc_12__0__INST.AWQOS(TLS_x_rsc_12_0_AWQOS);
    x_rsc_12__0__INST.AWREGION(TLS_x_rsc_12_0_AWREGION);
    x_rsc_12__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_12_0_AWUSER);
    x_rsc_12__0__INST.AWVALID(TLS_x_rsc_12_0_AWVALID);
    x_rsc_12__0__INST.AWREADY(TLS_x_rsc_12_0_AWREADY);
    x_rsc_12__0__INST.WDATA(TLS_x_rsc_12_0_WDATA);
    x_rsc_12__0__INST.WSTRB(TLS_x_rsc_12_0_WSTRB);
    x_rsc_12__0__INST.WLAST(TLS_x_rsc_12_0_WLAST);
    x_rsc_12__0__INST.WUSER(CCS_ADAPTOR_x_rsc_12_0_WUSER);
    x_rsc_12__0__INST.WVALID(TLS_x_rsc_12_0_WVALID);
    x_rsc_12__0__INST.WREADY(TLS_x_rsc_12_0_WREADY);
    x_rsc_12__0__INST.BID(CCS_ADAPTOR_x_rsc_12_0_BID);
    x_rsc_12__0__INST.BRESP(TLS_x_rsc_12_0_BRESP);
    x_rsc_12__0__INST.BUSER(CCS_ADAPTOR_x_rsc_12_0_BUSER);
    x_rsc_12__0__INST.BVALID(TLS_x_rsc_12_0_BVALID);
    x_rsc_12__0__INST.BREADY(TLS_x_rsc_12_0_BREADY);
    x_rsc_12__0__INST.ARID(CCS_ADAPTOR_x_rsc_12_0_ARID);
    x_rsc_12__0__INST.ARADDR(TLS_x_rsc_12_0_ARADDR);
    x_rsc_12__0__INST.ARLEN(TLS_x_rsc_12_0_ARLEN);
    x_rsc_12__0__INST.ARSIZE(TLS_x_rsc_12_0_ARSIZE);
    x_rsc_12__0__INST.ARBURST(TLS_x_rsc_12_0_ARBURST);
    x_rsc_12__0__INST.ARLOCK(TLS_x_rsc_12_0_ARLOCK);
    x_rsc_12__0__INST.ARCACHE(TLS_x_rsc_12_0_ARCACHE);
    x_rsc_12__0__INST.ARPROT(TLS_x_rsc_12_0_ARPROT);
    x_rsc_12__0__INST.ARQOS(TLS_x_rsc_12_0_ARQOS);
    x_rsc_12__0__INST.ARREGION(TLS_x_rsc_12_0_ARREGION);
    x_rsc_12__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_12_0_ARUSER);
    x_rsc_12__0__INST.ARVALID(TLS_x_rsc_12_0_ARVALID);
    x_rsc_12__0__INST.ARREADY(TLS_x_rsc_12_0_ARREADY);
    x_rsc_12__0__INST.RID(CCS_ADAPTOR_x_rsc_12_0_RID);
    x_rsc_12__0__INST.RDATA(TLS_x_rsc_12_0_RDATA);
    x_rsc_12__0__INST.RRESP(TLS_x_rsc_12_0_RRESP);
    x_rsc_12__0__INST.RLAST(TLS_x_rsc_12_0_RLAST);
    x_rsc_12__0__INST.RUSER(CCS_ADAPTOR_x_rsc_12_0_RUSER);
    x_rsc_12__0__INST.RVALID(TLS_x_rsc_12_0_RVALID);
    x_rsc_12__0__INST.RREADY(TLS_x_rsc_12_0_RREADY);
    x_rsc_12__0__INST.tr_write_done(TLS_x_rsc_12_0_tr_write_done);
    x_rsc_12__0__INST.s_tdone(TLS_x_rsc_12_0_s_tdone);
    x_rsc_12__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_86)));

    CCS_ADAPTOR_TLS_x_rsc_13_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_13_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_13_0_AWID.outSCALAR(TLS_x_rsc_13_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_13_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_13_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_13_0_AWUSER.outSCALAR(TLS_x_rsc_13_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_13_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_13_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_13_0_WUSER.outSCALAR(TLS_x_rsc_13_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BID.inSCALAR(TLS_x_rsc_13_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_13_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BUSER.inSCALAR(TLS_x_rsc_13_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_13_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_13_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_13_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_13_0_ARID.outSCALAR(TLS_x_rsc_13_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_13_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_13_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_13_0_ARUSER.outSCALAR(TLS_x_rsc_13_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RID.inSCALAR(TLS_x_rsc_13_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_13_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RUSER.inSCALAR(TLS_x_rsc_13_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_13_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_13_0_RUSER);

    x_rsc_13__0__INST.ACLK(clk);
    x_rsc_13__0__INST.ARESETn(rst);
    x_rsc_13__0__INST.AWID(CCS_ADAPTOR_x_rsc_13_0_AWID);
    x_rsc_13__0__INST.AWADDR(TLS_x_rsc_13_0_AWADDR);
    x_rsc_13__0__INST.AWLEN(TLS_x_rsc_13_0_AWLEN);
    x_rsc_13__0__INST.AWSIZE(TLS_x_rsc_13_0_AWSIZE);
    x_rsc_13__0__INST.AWBURST(TLS_x_rsc_13_0_AWBURST);
    x_rsc_13__0__INST.AWLOCK(TLS_x_rsc_13_0_AWLOCK);
    x_rsc_13__0__INST.AWCACHE(TLS_x_rsc_13_0_AWCACHE);
    x_rsc_13__0__INST.AWPROT(TLS_x_rsc_13_0_AWPROT);
    x_rsc_13__0__INST.AWQOS(TLS_x_rsc_13_0_AWQOS);
    x_rsc_13__0__INST.AWREGION(TLS_x_rsc_13_0_AWREGION);
    x_rsc_13__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_13_0_AWUSER);
    x_rsc_13__0__INST.AWVALID(TLS_x_rsc_13_0_AWVALID);
    x_rsc_13__0__INST.AWREADY(TLS_x_rsc_13_0_AWREADY);
    x_rsc_13__0__INST.WDATA(TLS_x_rsc_13_0_WDATA);
    x_rsc_13__0__INST.WSTRB(TLS_x_rsc_13_0_WSTRB);
    x_rsc_13__0__INST.WLAST(TLS_x_rsc_13_0_WLAST);
    x_rsc_13__0__INST.WUSER(CCS_ADAPTOR_x_rsc_13_0_WUSER);
    x_rsc_13__0__INST.WVALID(TLS_x_rsc_13_0_WVALID);
    x_rsc_13__0__INST.WREADY(TLS_x_rsc_13_0_WREADY);
    x_rsc_13__0__INST.BID(CCS_ADAPTOR_x_rsc_13_0_BID);
    x_rsc_13__0__INST.BRESP(TLS_x_rsc_13_0_BRESP);
    x_rsc_13__0__INST.BUSER(CCS_ADAPTOR_x_rsc_13_0_BUSER);
    x_rsc_13__0__INST.BVALID(TLS_x_rsc_13_0_BVALID);
    x_rsc_13__0__INST.BREADY(TLS_x_rsc_13_0_BREADY);
    x_rsc_13__0__INST.ARID(CCS_ADAPTOR_x_rsc_13_0_ARID);
    x_rsc_13__0__INST.ARADDR(TLS_x_rsc_13_0_ARADDR);
    x_rsc_13__0__INST.ARLEN(TLS_x_rsc_13_0_ARLEN);
    x_rsc_13__0__INST.ARSIZE(TLS_x_rsc_13_0_ARSIZE);
    x_rsc_13__0__INST.ARBURST(TLS_x_rsc_13_0_ARBURST);
    x_rsc_13__0__INST.ARLOCK(TLS_x_rsc_13_0_ARLOCK);
    x_rsc_13__0__INST.ARCACHE(TLS_x_rsc_13_0_ARCACHE);
    x_rsc_13__0__INST.ARPROT(TLS_x_rsc_13_0_ARPROT);
    x_rsc_13__0__INST.ARQOS(TLS_x_rsc_13_0_ARQOS);
    x_rsc_13__0__INST.ARREGION(TLS_x_rsc_13_0_ARREGION);
    x_rsc_13__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_13_0_ARUSER);
    x_rsc_13__0__INST.ARVALID(TLS_x_rsc_13_0_ARVALID);
    x_rsc_13__0__INST.ARREADY(TLS_x_rsc_13_0_ARREADY);
    x_rsc_13__0__INST.RID(CCS_ADAPTOR_x_rsc_13_0_RID);
    x_rsc_13__0__INST.RDATA(TLS_x_rsc_13_0_RDATA);
    x_rsc_13__0__INST.RRESP(TLS_x_rsc_13_0_RRESP);
    x_rsc_13__0__INST.RLAST(TLS_x_rsc_13_0_RLAST);
    x_rsc_13__0__INST.RUSER(CCS_ADAPTOR_x_rsc_13_0_RUSER);
    x_rsc_13__0__INST.RVALID(TLS_x_rsc_13_0_RVALID);
    x_rsc_13__0__INST.RREADY(TLS_x_rsc_13_0_RREADY);
    x_rsc_13__0__INST.tr_write_done(TLS_x_rsc_13_0_tr_write_done);
    x_rsc_13__0__INST.s_tdone(TLS_x_rsc_13_0_s_tdone);
    x_rsc_13__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_87)));

    CCS_ADAPTOR_TLS_x_rsc_14_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_14_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_14_0_AWID.outSCALAR(TLS_x_rsc_14_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_14_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_14_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_14_0_AWUSER.outSCALAR(TLS_x_rsc_14_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_14_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_14_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_14_0_WUSER.outSCALAR(TLS_x_rsc_14_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BID.inSCALAR(TLS_x_rsc_14_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_14_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BUSER.inSCALAR(TLS_x_rsc_14_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_14_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_14_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_14_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_14_0_ARID.outSCALAR(TLS_x_rsc_14_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_14_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_14_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_14_0_ARUSER.outSCALAR(TLS_x_rsc_14_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RID.inSCALAR(TLS_x_rsc_14_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_14_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RUSER.inSCALAR(TLS_x_rsc_14_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_14_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_14_0_RUSER);

    x_rsc_14__0__INST.ACLK(clk);
    x_rsc_14__0__INST.ARESETn(rst);
    x_rsc_14__0__INST.AWID(CCS_ADAPTOR_x_rsc_14_0_AWID);
    x_rsc_14__0__INST.AWADDR(TLS_x_rsc_14_0_AWADDR);
    x_rsc_14__0__INST.AWLEN(TLS_x_rsc_14_0_AWLEN);
    x_rsc_14__0__INST.AWSIZE(TLS_x_rsc_14_0_AWSIZE);
    x_rsc_14__0__INST.AWBURST(TLS_x_rsc_14_0_AWBURST);
    x_rsc_14__0__INST.AWLOCK(TLS_x_rsc_14_0_AWLOCK);
    x_rsc_14__0__INST.AWCACHE(TLS_x_rsc_14_0_AWCACHE);
    x_rsc_14__0__INST.AWPROT(TLS_x_rsc_14_0_AWPROT);
    x_rsc_14__0__INST.AWQOS(TLS_x_rsc_14_0_AWQOS);
    x_rsc_14__0__INST.AWREGION(TLS_x_rsc_14_0_AWREGION);
    x_rsc_14__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_14_0_AWUSER);
    x_rsc_14__0__INST.AWVALID(TLS_x_rsc_14_0_AWVALID);
    x_rsc_14__0__INST.AWREADY(TLS_x_rsc_14_0_AWREADY);
    x_rsc_14__0__INST.WDATA(TLS_x_rsc_14_0_WDATA);
    x_rsc_14__0__INST.WSTRB(TLS_x_rsc_14_0_WSTRB);
    x_rsc_14__0__INST.WLAST(TLS_x_rsc_14_0_WLAST);
    x_rsc_14__0__INST.WUSER(CCS_ADAPTOR_x_rsc_14_0_WUSER);
    x_rsc_14__0__INST.WVALID(TLS_x_rsc_14_0_WVALID);
    x_rsc_14__0__INST.WREADY(TLS_x_rsc_14_0_WREADY);
    x_rsc_14__0__INST.BID(CCS_ADAPTOR_x_rsc_14_0_BID);
    x_rsc_14__0__INST.BRESP(TLS_x_rsc_14_0_BRESP);
    x_rsc_14__0__INST.BUSER(CCS_ADAPTOR_x_rsc_14_0_BUSER);
    x_rsc_14__0__INST.BVALID(TLS_x_rsc_14_0_BVALID);
    x_rsc_14__0__INST.BREADY(TLS_x_rsc_14_0_BREADY);
    x_rsc_14__0__INST.ARID(CCS_ADAPTOR_x_rsc_14_0_ARID);
    x_rsc_14__0__INST.ARADDR(TLS_x_rsc_14_0_ARADDR);
    x_rsc_14__0__INST.ARLEN(TLS_x_rsc_14_0_ARLEN);
    x_rsc_14__0__INST.ARSIZE(TLS_x_rsc_14_0_ARSIZE);
    x_rsc_14__0__INST.ARBURST(TLS_x_rsc_14_0_ARBURST);
    x_rsc_14__0__INST.ARLOCK(TLS_x_rsc_14_0_ARLOCK);
    x_rsc_14__0__INST.ARCACHE(TLS_x_rsc_14_0_ARCACHE);
    x_rsc_14__0__INST.ARPROT(TLS_x_rsc_14_0_ARPROT);
    x_rsc_14__0__INST.ARQOS(TLS_x_rsc_14_0_ARQOS);
    x_rsc_14__0__INST.ARREGION(TLS_x_rsc_14_0_ARREGION);
    x_rsc_14__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_14_0_ARUSER);
    x_rsc_14__0__INST.ARVALID(TLS_x_rsc_14_0_ARVALID);
    x_rsc_14__0__INST.ARREADY(TLS_x_rsc_14_0_ARREADY);
    x_rsc_14__0__INST.RID(CCS_ADAPTOR_x_rsc_14_0_RID);
    x_rsc_14__0__INST.RDATA(TLS_x_rsc_14_0_RDATA);
    x_rsc_14__0__INST.RRESP(TLS_x_rsc_14_0_RRESP);
    x_rsc_14__0__INST.RLAST(TLS_x_rsc_14_0_RLAST);
    x_rsc_14__0__INST.RUSER(CCS_ADAPTOR_x_rsc_14_0_RUSER);
    x_rsc_14__0__INST.RVALID(TLS_x_rsc_14_0_RVALID);
    x_rsc_14__0__INST.RREADY(TLS_x_rsc_14_0_RREADY);
    x_rsc_14__0__INST.tr_write_done(TLS_x_rsc_14_0_tr_write_done);
    x_rsc_14__0__INST.s_tdone(TLS_x_rsc_14_0_s_tdone);
    x_rsc_14__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_88)));

    CCS_ADAPTOR_TLS_x_rsc_15_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_15_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_15_0_AWID.outSCALAR(TLS_x_rsc_15_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_15_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_15_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_15_0_AWUSER.outSCALAR(TLS_x_rsc_15_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_15_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_15_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_15_0_WUSER.outSCALAR(TLS_x_rsc_15_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BID.inSCALAR(TLS_x_rsc_15_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_15_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BUSER.inSCALAR(TLS_x_rsc_15_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_15_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_15_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_15_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_15_0_ARID.outSCALAR(TLS_x_rsc_15_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_15_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_15_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_15_0_ARUSER.outSCALAR(TLS_x_rsc_15_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RID.inSCALAR(TLS_x_rsc_15_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_15_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RUSER.inSCALAR(TLS_x_rsc_15_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_15_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_15_0_RUSER);

    x_rsc_15__0__INST.ACLK(clk);
    x_rsc_15__0__INST.ARESETn(rst);
    x_rsc_15__0__INST.AWID(CCS_ADAPTOR_x_rsc_15_0_AWID);
    x_rsc_15__0__INST.AWADDR(TLS_x_rsc_15_0_AWADDR);
    x_rsc_15__0__INST.AWLEN(TLS_x_rsc_15_0_AWLEN);
    x_rsc_15__0__INST.AWSIZE(TLS_x_rsc_15_0_AWSIZE);
    x_rsc_15__0__INST.AWBURST(TLS_x_rsc_15_0_AWBURST);
    x_rsc_15__0__INST.AWLOCK(TLS_x_rsc_15_0_AWLOCK);
    x_rsc_15__0__INST.AWCACHE(TLS_x_rsc_15_0_AWCACHE);
    x_rsc_15__0__INST.AWPROT(TLS_x_rsc_15_0_AWPROT);
    x_rsc_15__0__INST.AWQOS(TLS_x_rsc_15_0_AWQOS);
    x_rsc_15__0__INST.AWREGION(TLS_x_rsc_15_0_AWREGION);
    x_rsc_15__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_15_0_AWUSER);
    x_rsc_15__0__INST.AWVALID(TLS_x_rsc_15_0_AWVALID);
    x_rsc_15__0__INST.AWREADY(TLS_x_rsc_15_0_AWREADY);
    x_rsc_15__0__INST.WDATA(TLS_x_rsc_15_0_WDATA);
    x_rsc_15__0__INST.WSTRB(TLS_x_rsc_15_0_WSTRB);
    x_rsc_15__0__INST.WLAST(TLS_x_rsc_15_0_WLAST);
    x_rsc_15__0__INST.WUSER(CCS_ADAPTOR_x_rsc_15_0_WUSER);
    x_rsc_15__0__INST.WVALID(TLS_x_rsc_15_0_WVALID);
    x_rsc_15__0__INST.WREADY(TLS_x_rsc_15_0_WREADY);
    x_rsc_15__0__INST.BID(CCS_ADAPTOR_x_rsc_15_0_BID);
    x_rsc_15__0__INST.BRESP(TLS_x_rsc_15_0_BRESP);
    x_rsc_15__0__INST.BUSER(CCS_ADAPTOR_x_rsc_15_0_BUSER);
    x_rsc_15__0__INST.BVALID(TLS_x_rsc_15_0_BVALID);
    x_rsc_15__0__INST.BREADY(TLS_x_rsc_15_0_BREADY);
    x_rsc_15__0__INST.ARID(CCS_ADAPTOR_x_rsc_15_0_ARID);
    x_rsc_15__0__INST.ARADDR(TLS_x_rsc_15_0_ARADDR);
    x_rsc_15__0__INST.ARLEN(TLS_x_rsc_15_0_ARLEN);
    x_rsc_15__0__INST.ARSIZE(TLS_x_rsc_15_0_ARSIZE);
    x_rsc_15__0__INST.ARBURST(TLS_x_rsc_15_0_ARBURST);
    x_rsc_15__0__INST.ARLOCK(TLS_x_rsc_15_0_ARLOCK);
    x_rsc_15__0__INST.ARCACHE(TLS_x_rsc_15_0_ARCACHE);
    x_rsc_15__0__INST.ARPROT(TLS_x_rsc_15_0_ARPROT);
    x_rsc_15__0__INST.ARQOS(TLS_x_rsc_15_0_ARQOS);
    x_rsc_15__0__INST.ARREGION(TLS_x_rsc_15_0_ARREGION);
    x_rsc_15__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_15_0_ARUSER);
    x_rsc_15__0__INST.ARVALID(TLS_x_rsc_15_0_ARVALID);
    x_rsc_15__0__INST.ARREADY(TLS_x_rsc_15_0_ARREADY);
    x_rsc_15__0__INST.RID(CCS_ADAPTOR_x_rsc_15_0_RID);
    x_rsc_15__0__INST.RDATA(TLS_x_rsc_15_0_RDATA);
    x_rsc_15__0__INST.RRESP(TLS_x_rsc_15_0_RRESP);
    x_rsc_15__0__INST.RLAST(TLS_x_rsc_15_0_RLAST);
    x_rsc_15__0__INST.RUSER(CCS_ADAPTOR_x_rsc_15_0_RUSER);
    x_rsc_15__0__INST.RVALID(TLS_x_rsc_15_0_RVALID);
    x_rsc_15__0__INST.RREADY(TLS_x_rsc_15_0_RREADY);
    x_rsc_15__0__INST.tr_write_done(TLS_x_rsc_15_0_tr_write_done);
    x_rsc_15__0__INST.s_tdone(TLS_x_rsc_15_0_s_tdone);
    x_rsc_15__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_89)));

    CCS_ADAPTOR_TLS_x_rsc_16_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_16_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_16_0_AWID.outSCALAR(TLS_x_rsc_16_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_16_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_16_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_16_0_AWUSER.outSCALAR(TLS_x_rsc_16_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_16_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_16_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_16_0_WUSER.outSCALAR(TLS_x_rsc_16_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BID.inSCALAR(TLS_x_rsc_16_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_16_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BUSER.inSCALAR(TLS_x_rsc_16_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_16_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_16_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_16_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_16_0_ARID.outSCALAR(TLS_x_rsc_16_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_16_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_16_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_16_0_ARUSER.outSCALAR(TLS_x_rsc_16_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RID.inSCALAR(TLS_x_rsc_16_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_16_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RUSER.inSCALAR(TLS_x_rsc_16_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_16_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_16_0_RUSER);

    x_rsc_16__0__INST.ACLK(clk);
    x_rsc_16__0__INST.ARESETn(rst);
    x_rsc_16__0__INST.AWID(CCS_ADAPTOR_x_rsc_16_0_AWID);
    x_rsc_16__0__INST.AWADDR(TLS_x_rsc_16_0_AWADDR);
    x_rsc_16__0__INST.AWLEN(TLS_x_rsc_16_0_AWLEN);
    x_rsc_16__0__INST.AWSIZE(TLS_x_rsc_16_0_AWSIZE);
    x_rsc_16__0__INST.AWBURST(TLS_x_rsc_16_0_AWBURST);
    x_rsc_16__0__INST.AWLOCK(TLS_x_rsc_16_0_AWLOCK);
    x_rsc_16__0__INST.AWCACHE(TLS_x_rsc_16_0_AWCACHE);
    x_rsc_16__0__INST.AWPROT(TLS_x_rsc_16_0_AWPROT);
    x_rsc_16__0__INST.AWQOS(TLS_x_rsc_16_0_AWQOS);
    x_rsc_16__0__INST.AWREGION(TLS_x_rsc_16_0_AWREGION);
    x_rsc_16__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_16_0_AWUSER);
    x_rsc_16__0__INST.AWVALID(TLS_x_rsc_16_0_AWVALID);
    x_rsc_16__0__INST.AWREADY(TLS_x_rsc_16_0_AWREADY);
    x_rsc_16__0__INST.WDATA(TLS_x_rsc_16_0_WDATA);
    x_rsc_16__0__INST.WSTRB(TLS_x_rsc_16_0_WSTRB);
    x_rsc_16__0__INST.WLAST(TLS_x_rsc_16_0_WLAST);
    x_rsc_16__0__INST.WUSER(CCS_ADAPTOR_x_rsc_16_0_WUSER);
    x_rsc_16__0__INST.WVALID(TLS_x_rsc_16_0_WVALID);
    x_rsc_16__0__INST.WREADY(TLS_x_rsc_16_0_WREADY);
    x_rsc_16__0__INST.BID(CCS_ADAPTOR_x_rsc_16_0_BID);
    x_rsc_16__0__INST.BRESP(TLS_x_rsc_16_0_BRESP);
    x_rsc_16__0__INST.BUSER(CCS_ADAPTOR_x_rsc_16_0_BUSER);
    x_rsc_16__0__INST.BVALID(TLS_x_rsc_16_0_BVALID);
    x_rsc_16__0__INST.BREADY(TLS_x_rsc_16_0_BREADY);
    x_rsc_16__0__INST.ARID(CCS_ADAPTOR_x_rsc_16_0_ARID);
    x_rsc_16__0__INST.ARADDR(TLS_x_rsc_16_0_ARADDR);
    x_rsc_16__0__INST.ARLEN(TLS_x_rsc_16_0_ARLEN);
    x_rsc_16__0__INST.ARSIZE(TLS_x_rsc_16_0_ARSIZE);
    x_rsc_16__0__INST.ARBURST(TLS_x_rsc_16_0_ARBURST);
    x_rsc_16__0__INST.ARLOCK(TLS_x_rsc_16_0_ARLOCK);
    x_rsc_16__0__INST.ARCACHE(TLS_x_rsc_16_0_ARCACHE);
    x_rsc_16__0__INST.ARPROT(TLS_x_rsc_16_0_ARPROT);
    x_rsc_16__0__INST.ARQOS(TLS_x_rsc_16_0_ARQOS);
    x_rsc_16__0__INST.ARREGION(TLS_x_rsc_16_0_ARREGION);
    x_rsc_16__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_16_0_ARUSER);
    x_rsc_16__0__INST.ARVALID(TLS_x_rsc_16_0_ARVALID);
    x_rsc_16__0__INST.ARREADY(TLS_x_rsc_16_0_ARREADY);
    x_rsc_16__0__INST.RID(CCS_ADAPTOR_x_rsc_16_0_RID);
    x_rsc_16__0__INST.RDATA(TLS_x_rsc_16_0_RDATA);
    x_rsc_16__0__INST.RRESP(TLS_x_rsc_16_0_RRESP);
    x_rsc_16__0__INST.RLAST(TLS_x_rsc_16_0_RLAST);
    x_rsc_16__0__INST.RUSER(CCS_ADAPTOR_x_rsc_16_0_RUSER);
    x_rsc_16__0__INST.RVALID(TLS_x_rsc_16_0_RVALID);
    x_rsc_16__0__INST.RREADY(TLS_x_rsc_16_0_RREADY);
    x_rsc_16__0__INST.tr_write_done(TLS_x_rsc_16_0_tr_write_done);
    x_rsc_16__0__INST.s_tdone(TLS_x_rsc_16_0_s_tdone);
    x_rsc_16__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_90)));

    CCS_ADAPTOR_TLS_x_rsc_17_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_17_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_17_0_AWID.outSCALAR(TLS_x_rsc_17_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_17_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_17_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_17_0_AWUSER.outSCALAR(TLS_x_rsc_17_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_17_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_17_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_17_0_WUSER.outSCALAR(TLS_x_rsc_17_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BID.inSCALAR(TLS_x_rsc_17_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_17_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BUSER.inSCALAR(TLS_x_rsc_17_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_17_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_17_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_17_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_17_0_ARID.outSCALAR(TLS_x_rsc_17_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_17_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_17_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_17_0_ARUSER.outSCALAR(TLS_x_rsc_17_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RID.inSCALAR(TLS_x_rsc_17_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_17_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RUSER.inSCALAR(TLS_x_rsc_17_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_17_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_17_0_RUSER);

    x_rsc_17__0__INST.ACLK(clk);
    x_rsc_17__0__INST.ARESETn(rst);
    x_rsc_17__0__INST.AWID(CCS_ADAPTOR_x_rsc_17_0_AWID);
    x_rsc_17__0__INST.AWADDR(TLS_x_rsc_17_0_AWADDR);
    x_rsc_17__0__INST.AWLEN(TLS_x_rsc_17_0_AWLEN);
    x_rsc_17__0__INST.AWSIZE(TLS_x_rsc_17_0_AWSIZE);
    x_rsc_17__0__INST.AWBURST(TLS_x_rsc_17_0_AWBURST);
    x_rsc_17__0__INST.AWLOCK(TLS_x_rsc_17_0_AWLOCK);
    x_rsc_17__0__INST.AWCACHE(TLS_x_rsc_17_0_AWCACHE);
    x_rsc_17__0__INST.AWPROT(TLS_x_rsc_17_0_AWPROT);
    x_rsc_17__0__INST.AWQOS(TLS_x_rsc_17_0_AWQOS);
    x_rsc_17__0__INST.AWREGION(TLS_x_rsc_17_0_AWREGION);
    x_rsc_17__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_17_0_AWUSER);
    x_rsc_17__0__INST.AWVALID(TLS_x_rsc_17_0_AWVALID);
    x_rsc_17__0__INST.AWREADY(TLS_x_rsc_17_0_AWREADY);
    x_rsc_17__0__INST.WDATA(TLS_x_rsc_17_0_WDATA);
    x_rsc_17__0__INST.WSTRB(TLS_x_rsc_17_0_WSTRB);
    x_rsc_17__0__INST.WLAST(TLS_x_rsc_17_0_WLAST);
    x_rsc_17__0__INST.WUSER(CCS_ADAPTOR_x_rsc_17_0_WUSER);
    x_rsc_17__0__INST.WVALID(TLS_x_rsc_17_0_WVALID);
    x_rsc_17__0__INST.WREADY(TLS_x_rsc_17_0_WREADY);
    x_rsc_17__0__INST.BID(CCS_ADAPTOR_x_rsc_17_0_BID);
    x_rsc_17__0__INST.BRESP(TLS_x_rsc_17_0_BRESP);
    x_rsc_17__0__INST.BUSER(CCS_ADAPTOR_x_rsc_17_0_BUSER);
    x_rsc_17__0__INST.BVALID(TLS_x_rsc_17_0_BVALID);
    x_rsc_17__0__INST.BREADY(TLS_x_rsc_17_0_BREADY);
    x_rsc_17__0__INST.ARID(CCS_ADAPTOR_x_rsc_17_0_ARID);
    x_rsc_17__0__INST.ARADDR(TLS_x_rsc_17_0_ARADDR);
    x_rsc_17__0__INST.ARLEN(TLS_x_rsc_17_0_ARLEN);
    x_rsc_17__0__INST.ARSIZE(TLS_x_rsc_17_0_ARSIZE);
    x_rsc_17__0__INST.ARBURST(TLS_x_rsc_17_0_ARBURST);
    x_rsc_17__0__INST.ARLOCK(TLS_x_rsc_17_0_ARLOCK);
    x_rsc_17__0__INST.ARCACHE(TLS_x_rsc_17_0_ARCACHE);
    x_rsc_17__0__INST.ARPROT(TLS_x_rsc_17_0_ARPROT);
    x_rsc_17__0__INST.ARQOS(TLS_x_rsc_17_0_ARQOS);
    x_rsc_17__0__INST.ARREGION(TLS_x_rsc_17_0_ARREGION);
    x_rsc_17__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_17_0_ARUSER);
    x_rsc_17__0__INST.ARVALID(TLS_x_rsc_17_0_ARVALID);
    x_rsc_17__0__INST.ARREADY(TLS_x_rsc_17_0_ARREADY);
    x_rsc_17__0__INST.RID(CCS_ADAPTOR_x_rsc_17_0_RID);
    x_rsc_17__0__INST.RDATA(TLS_x_rsc_17_0_RDATA);
    x_rsc_17__0__INST.RRESP(TLS_x_rsc_17_0_RRESP);
    x_rsc_17__0__INST.RLAST(TLS_x_rsc_17_0_RLAST);
    x_rsc_17__0__INST.RUSER(CCS_ADAPTOR_x_rsc_17_0_RUSER);
    x_rsc_17__0__INST.RVALID(TLS_x_rsc_17_0_RVALID);
    x_rsc_17__0__INST.RREADY(TLS_x_rsc_17_0_RREADY);
    x_rsc_17__0__INST.tr_write_done(TLS_x_rsc_17_0_tr_write_done);
    x_rsc_17__0__INST.s_tdone(TLS_x_rsc_17_0_s_tdone);
    x_rsc_17__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_91)));

    CCS_ADAPTOR_TLS_x_rsc_18_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_18_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_18_0_AWID.outSCALAR(TLS_x_rsc_18_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_18_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_18_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_18_0_AWUSER.outSCALAR(TLS_x_rsc_18_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_18_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_18_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_18_0_WUSER.outSCALAR(TLS_x_rsc_18_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BID.inSCALAR(TLS_x_rsc_18_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_18_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BUSER.inSCALAR(TLS_x_rsc_18_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_18_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_18_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_18_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_18_0_ARID.outSCALAR(TLS_x_rsc_18_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_18_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_18_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_18_0_ARUSER.outSCALAR(TLS_x_rsc_18_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RID.inSCALAR(TLS_x_rsc_18_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_18_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RUSER.inSCALAR(TLS_x_rsc_18_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_18_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_18_0_RUSER);

    x_rsc_18__0__INST.ACLK(clk);
    x_rsc_18__0__INST.ARESETn(rst);
    x_rsc_18__0__INST.AWID(CCS_ADAPTOR_x_rsc_18_0_AWID);
    x_rsc_18__0__INST.AWADDR(TLS_x_rsc_18_0_AWADDR);
    x_rsc_18__0__INST.AWLEN(TLS_x_rsc_18_0_AWLEN);
    x_rsc_18__0__INST.AWSIZE(TLS_x_rsc_18_0_AWSIZE);
    x_rsc_18__0__INST.AWBURST(TLS_x_rsc_18_0_AWBURST);
    x_rsc_18__0__INST.AWLOCK(TLS_x_rsc_18_0_AWLOCK);
    x_rsc_18__0__INST.AWCACHE(TLS_x_rsc_18_0_AWCACHE);
    x_rsc_18__0__INST.AWPROT(TLS_x_rsc_18_0_AWPROT);
    x_rsc_18__0__INST.AWQOS(TLS_x_rsc_18_0_AWQOS);
    x_rsc_18__0__INST.AWREGION(TLS_x_rsc_18_0_AWREGION);
    x_rsc_18__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_18_0_AWUSER);
    x_rsc_18__0__INST.AWVALID(TLS_x_rsc_18_0_AWVALID);
    x_rsc_18__0__INST.AWREADY(TLS_x_rsc_18_0_AWREADY);
    x_rsc_18__0__INST.WDATA(TLS_x_rsc_18_0_WDATA);
    x_rsc_18__0__INST.WSTRB(TLS_x_rsc_18_0_WSTRB);
    x_rsc_18__0__INST.WLAST(TLS_x_rsc_18_0_WLAST);
    x_rsc_18__0__INST.WUSER(CCS_ADAPTOR_x_rsc_18_0_WUSER);
    x_rsc_18__0__INST.WVALID(TLS_x_rsc_18_0_WVALID);
    x_rsc_18__0__INST.WREADY(TLS_x_rsc_18_0_WREADY);
    x_rsc_18__0__INST.BID(CCS_ADAPTOR_x_rsc_18_0_BID);
    x_rsc_18__0__INST.BRESP(TLS_x_rsc_18_0_BRESP);
    x_rsc_18__0__INST.BUSER(CCS_ADAPTOR_x_rsc_18_0_BUSER);
    x_rsc_18__0__INST.BVALID(TLS_x_rsc_18_0_BVALID);
    x_rsc_18__0__INST.BREADY(TLS_x_rsc_18_0_BREADY);
    x_rsc_18__0__INST.ARID(CCS_ADAPTOR_x_rsc_18_0_ARID);
    x_rsc_18__0__INST.ARADDR(TLS_x_rsc_18_0_ARADDR);
    x_rsc_18__0__INST.ARLEN(TLS_x_rsc_18_0_ARLEN);
    x_rsc_18__0__INST.ARSIZE(TLS_x_rsc_18_0_ARSIZE);
    x_rsc_18__0__INST.ARBURST(TLS_x_rsc_18_0_ARBURST);
    x_rsc_18__0__INST.ARLOCK(TLS_x_rsc_18_0_ARLOCK);
    x_rsc_18__0__INST.ARCACHE(TLS_x_rsc_18_0_ARCACHE);
    x_rsc_18__0__INST.ARPROT(TLS_x_rsc_18_0_ARPROT);
    x_rsc_18__0__INST.ARQOS(TLS_x_rsc_18_0_ARQOS);
    x_rsc_18__0__INST.ARREGION(TLS_x_rsc_18_0_ARREGION);
    x_rsc_18__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_18_0_ARUSER);
    x_rsc_18__0__INST.ARVALID(TLS_x_rsc_18_0_ARVALID);
    x_rsc_18__0__INST.ARREADY(TLS_x_rsc_18_0_ARREADY);
    x_rsc_18__0__INST.RID(CCS_ADAPTOR_x_rsc_18_0_RID);
    x_rsc_18__0__INST.RDATA(TLS_x_rsc_18_0_RDATA);
    x_rsc_18__0__INST.RRESP(TLS_x_rsc_18_0_RRESP);
    x_rsc_18__0__INST.RLAST(TLS_x_rsc_18_0_RLAST);
    x_rsc_18__0__INST.RUSER(CCS_ADAPTOR_x_rsc_18_0_RUSER);
    x_rsc_18__0__INST.RVALID(TLS_x_rsc_18_0_RVALID);
    x_rsc_18__0__INST.RREADY(TLS_x_rsc_18_0_RREADY);
    x_rsc_18__0__INST.tr_write_done(TLS_x_rsc_18_0_tr_write_done);
    x_rsc_18__0__INST.s_tdone(TLS_x_rsc_18_0_s_tdone);
    x_rsc_18__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_92)));

    CCS_ADAPTOR_TLS_x_rsc_19_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_19_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_19_0_AWID.outSCALAR(TLS_x_rsc_19_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_19_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_19_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_19_0_AWUSER.outSCALAR(TLS_x_rsc_19_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_19_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_19_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_19_0_WUSER.outSCALAR(TLS_x_rsc_19_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BID.inSCALAR(TLS_x_rsc_19_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_19_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BUSER.inSCALAR(TLS_x_rsc_19_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_19_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_19_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_19_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_19_0_ARID.outSCALAR(TLS_x_rsc_19_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_19_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_19_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_19_0_ARUSER.outSCALAR(TLS_x_rsc_19_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RID.inSCALAR(TLS_x_rsc_19_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_19_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RUSER.inSCALAR(TLS_x_rsc_19_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_19_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_19_0_RUSER);

    x_rsc_19__0__INST.ACLK(clk);
    x_rsc_19__0__INST.ARESETn(rst);
    x_rsc_19__0__INST.AWID(CCS_ADAPTOR_x_rsc_19_0_AWID);
    x_rsc_19__0__INST.AWADDR(TLS_x_rsc_19_0_AWADDR);
    x_rsc_19__0__INST.AWLEN(TLS_x_rsc_19_0_AWLEN);
    x_rsc_19__0__INST.AWSIZE(TLS_x_rsc_19_0_AWSIZE);
    x_rsc_19__0__INST.AWBURST(TLS_x_rsc_19_0_AWBURST);
    x_rsc_19__0__INST.AWLOCK(TLS_x_rsc_19_0_AWLOCK);
    x_rsc_19__0__INST.AWCACHE(TLS_x_rsc_19_0_AWCACHE);
    x_rsc_19__0__INST.AWPROT(TLS_x_rsc_19_0_AWPROT);
    x_rsc_19__0__INST.AWQOS(TLS_x_rsc_19_0_AWQOS);
    x_rsc_19__0__INST.AWREGION(TLS_x_rsc_19_0_AWREGION);
    x_rsc_19__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_19_0_AWUSER);
    x_rsc_19__0__INST.AWVALID(TLS_x_rsc_19_0_AWVALID);
    x_rsc_19__0__INST.AWREADY(TLS_x_rsc_19_0_AWREADY);
    x_rsc_19__0__INST.WDATA(TLS_x_rsc_19_0_WDATA);
    x_rsc_19__0__INST.WSTRB(TLS_x_rsc_19_0_WSTRB);
    x_rsc_19__0__INST.WLAST(TLS_x_rsc_19_0_WLAST);
    x_rsc_19__0__INST.WUSER(CCS_ADAPTOR_x_rsc_19_0_WUSER);
    x_rsc_19__0__INST.WVALID(TLS_x_rsc_19_0_WVALID);
    x_rsc_19__0__INST.WREADY(TLS_x_rsc_19_0_WREADY);
    x_rsc_19__0__INST.BID(CCS_ADAPTOR_x_rsc_19_0_BID);
    x_rsc_19__0__INST.BRESP(TLS_x_rsc_19_0_BRESP);
    x_rsc_19__0__INST.BUSER(CCS_ADAPTOR_x_rsc_19_0_BUSER);
    x_rsc_19__0__INST.BVALID(TLS_x_rsc_19_0_BVALID);
    x_rsc_19__0__INST.BREADY(TLS_x_rsc_19_0_BREADY);
    x_rsc_19__0__INST.ARID(CCS_ADAPTOR_x_rsc_19_0_ARID);
    x_rsc_19__0__INST.ARADDR(TLS_x_rsc_19_0_ARADDR);
    x_rsc_19__0__INST.ARLEN(TLS_x_rsc_19_0_ARLEN);
    x_rsc_19__0__INST.ARSIZE(TLS_x_rsc_19_0_ARSIZE);
    x_rsc_19__0__INST.ARBURST(TLS_x_rsc_19_0_ARBURST);
    x_rsc_19__0__INST.ARLOCK(TLS_x_rsc_19_0_ARLOCK);
    x_rsc_19__0__INST.ARCACHE(TLS_x_rsc_19_0_ARCACHE);
    x_rsc_19__0__INST.ARPROT(TLS_x_rsc_19_0_ARPROT);
    x_rsc_19__0__INST.ARQOS(TLS_x_rsc_19_0_ARQOS);
    x_rsc_19__0__INST.ARREGION(TLS_x_rsc_19_0_ARREGION);
    x_rsc_19__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_19_0_ARUSER);
    x_rsc_19__0__INST.ARVALID(TLS_x_rsc_19_0_ARVALID);
    x_rsc_19__0__INST.ARREADY(TLS_x_rsc_19_0_ARREADY);
    x_rsc_19__0__INST.RID(CCS_ADAPTOR_x_rsc_19_0_RID);
    x_rsc_19__0__INST.RDATA(TLS_x_rsc_19_0_RDATA);
    x_rsc_19__0__INST.RRESP(TLS_x_rsc_19_0_RRESP);
    x_rsc_19__0__INST.RLAST(TLS_x_rsc_19_0_RLAST);
    x_rsc_19__0__INST.RUSER(CCS_ADAPTOR_x_rsc_19_0_RUSER);
    x_rsc_19__0__INST.RVALID(TLS_x_rsc_19_0_RVALID);
    x_rsc_19__0__INST.RREADY(TLS_x_rsc_19_0_RREADY);
    x_rsc_19__0__INST.tr_write_done(TLS_x_rsc_19_0_tr_write_done);
    x_rsc_19__0__INST.s_tdone(TLS_x_rsc_19_0_s_tdone);
    x_rsc_19__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_93)));

    CCS_ADAPTOR_TLS_x_rsc_20_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_20_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_20_0_AWID.outSCALAR(TLS_x_rsc_20_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_20_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_20_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_20_0_AWUSER.outSCALAR(TLS_x_rsc_20_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_20_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_20_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_20_0_WUSER.outSCALAR(TLS_x_rsc_20_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BID.inSCALAR(TLS_x_rsc_20_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_20_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BUSER.inSCALAR(TLS_x_rsc_20_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_20_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_20_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_20_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_20_0_ARID.outSCALAR(TLS_x_rsc_20_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_20_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_20_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_20_0_ARUSER.outSCALAR(TLS_x_rsc_20_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RID.inSCALAR(TLS_x_rsc_20_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_20_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RUSER.inSCALAR(TLS_x_rsc_20_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_20_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_20_0_RUSER);

    x_rsc_20__0__INST.ACLK(clk);
    x_rsc_20__0__INST.ARESETn(rst);
    x_rsc_20__0__INST.AWID(CCS_ADAPTOR_x_rsc_20_0_AWID);
    x_rsc_20__0__INST.AWADDR(TLS_x_rsc_20_0_AWADDR);
    x_rsc_20__0__INST.AWLEN(TLS_x_rsc_20_0_AWLEN);
    x_rsc_20__0__INST.AWSIZE(TLS_x_rsc_20_0_AWSIZE);
    x_rsc_20__0__INST.AWBURST(TLS_x_rsc_20_0_AWBURST);
    x_rsc_20__0__INST.AWLOCK(TLS_x_rsc_20_0_AWLOCK);
    x_rsc_20__0__INST.AWCACHE(TLS_x_rsc_20_0_AWCACHE);
    x_rsc_20__0__INST.AWPROT(TLS_x_rsc_20_0_AWPROT);
    x_rsc_20__0__INST.AWQOS(TLS_x_rsc_20_0_AWQOS);
    x_rsc_20__0__INST.AWREGION(TLS_x_rsc_20_0_AWREGION);
    x_rsc_20__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_20_0_AWUSER);
    x_rsc_20__0__INST.AWVALID(TLS_x_rsc_20_0_AWVALID);
    x_rsc_20__0__INST.AWREADY(TLS_x_rsc_20_0_AWREADY);
    x_rsc_20__0__INST.WDATA(TLS_x_rsc_20_0_WDATA);
    x_rsc_20__0__INST.WSTRB(TLS_x_rsc_20_0_WSTRB);
    x_rsc_20__0__INST.WLAST(TLS_x_rsc_20_0_WLAST);
    x_rsc_20__0__INST.WUSER(CCS_ADAPTOR_x_rsc_20_0_WUSER);
    x_rsc_20__0__INST.WVALID(TLS_x_rsc_20_0_WVALID);
    x_rsc_20__0__INST.WREADY(TLS_x_rsc_20_0_WREADY);
    x_rsc_20__0__INST.BID(CCS_ADAPTOR_x_rsc_20_0_BID);
    x_rsc_20__0__INST.BRESP(TLS_x_rsc_20_0_BRESP);
    x_rsc_20__0__INST.BUSER(CCS_ADAPTOR_x_rsc_20_0_BUSER);
    x_rsc_20__0__INST.BVALID(TLS_x_rsc_20_0_BVALID);
    x_rsc_20__0__INST.BREADY(TLS_x_rsc_20_0_BREADY);
    x_rsc_20__0__INST.ARID(CCS_ADAPTOR_x_rsc_20_0_ARID);
    x_rsc_20__0__INST.ARADDR(TLS_x_rsc_20_0_ARADDR);
    x_rsc_20__0__INST.ARLEN(TLS_x_rsc_20_0_ARLEN);
    x_rsc_20__0__INST.ARSIZE(TLS_x_rsc_20_0_ARSIZE);
    x_rsc_20__0__INST.ARBURST(TLS_x_rsc_20_0_ARBURST);
    x_rsc_20__0__INST.ARLOCK(TLS_x_rsc_20_0_ARLOCK);
    x_rsc_20__0__INST.ARCACHE(TLS_x_rsc_20_0_ARCACHE);
    x_rsc_20__0__INST.ARPROT(TLS_x_rsc_20_0_ARPROT);
    x_rsc_20__0__INST.ARQOS(TLS_x_rsc_20_0_ARQOS);
    x_rsc_20__0__INST.ARREGION(TLS_x_rsc_20_0_ARREGION);
    x_rsc_20__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_20_0_ARUSER);
    x_rsc_20__0__INST.ARVALID(TLS_x_rsc_20_0_ARVALID);
    x_rsc_20__0__INST.ARREADY(TLS_x_rsc_20_0_ARREADY);
    x_rsc_20__0__INST.RID(CCS_ADAPTOR_x_rsc_20_0_RID);
    x_rsc_20__0__INST.RDATA(TLS_x_rsc_20_0_RDATA);
    x_rsc_20__0__INST.RRESP(TLS_x_rsc_20_0_RRESP);
    x_rsc_20__0__INST.RLAST(TLS_x_rsc_20_0_RLAST);
    x_rsc_20__0__INST.RUSER(CCS_ADAPTOR_x_rsc_20_0_RUSER);
    x_rsc_20__0__INST.RVALID(TLS_x_rsc_20_0_RVALID);
    x_rsc_20__0__INST.RREADY(TLS_x_rsc_20_0_RREADY);
    x_rsc_20__0__INST.tr_write_done(TLS_x_rsc_20_0_tr_write_done);
    x_rsc_20__0__INST.s_tdone(TLS_x_rsc_20_0_s_tdone);
    x_rsc_20__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_94)));

    CCS_ADAPTOR_TLS_x_rsc_21_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_21_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_21_0_AWID.outSCALAR(TLS_x_rsc_21_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_21_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_21_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_21_0_AWUSER.outSCALAR(TLS_x_rsc_21_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_21_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_21_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_21_0_WUSER.outSCALAR(TLS_x_rsc_21_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BID.inSCALAR(TLS_x_rsc_21_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_21_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BUSER.inSCALAR(TLS_x_rsc_21_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_21_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_21_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_21_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_21_0_ARID.outSCALAR(TLS_x_rsc_21_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_21_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_21_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_21_0_ARUSER.outSCALAR(TLS_x_rsc_21_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RID.inSCALAR(TLS_x_rsc_21_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_21_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RUSER.inSCALAR(TLS_x_rsc_21_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_21_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_21_0_RUSER);

    x_rsc_21__0__INST.ACLK(clk);
    x_rsc_21__0__INST.ARESETn(rst);
    x_rsc_21__0__INST.AWID(CCS_ADAPTOR_x_rsc_21_0_AWID);
    x_rsc_21__0__INST.AWADDR(TLS_x_rsc_21_0_AWADDR);
    x_rsc_21__0__INST.AWLEN(TLS_x_rsc_21_0_AWLEN);
    x_rsc_21__0__INST.AWSIZE(TLS_x_rsc_21_0_AWSIZE);
    x_rsc_21__0__INST.AWBURST(TLS_x_rsc_21_0_AWBURST);
    x_rsc_21__0__INST.AWLOCK(TLS_x_rsc_21_0_AWLOCK);
    x_rsc_21__0__INST.AWCACHE(TLS_x_rsc_21_0_AWCACHE);
    x_rsc_21__0__INST.AWPROT(TLS_x_rsc_21_0_AWPROT);
    x_rsc_21__0__INST.AWQOS(TLS_x_rsc_21_0_AWQOS);
    x_rsc_21__0__INST.AWREGION(TLS_x_rsc_21_0_AWREGION);
    x_rsc_21__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_21_0_AWUSER);
    x_rsc_21__0__INST.AWVALID(TLS_x_rsc_21_0_AWVALID);
    x_rsc_21__0__INST.AWREADY(TLS_x_rsc_21_0_AWREADY);
    x_rsc_21__0__INST.WDATA(TLS_x_rsc_21_0_WDATA);
    x_rsc_21__0__INST.WSTRB(TLS_x_rsc_21_0_WSTRB);
    x_rsc_21__0__INST.WLAST(TLS_x_rsc_21_0_WLAST);
    x_rsc_21__0__INST.WUSER(CCS_ADAPTOR_x_rsc_21_0_WUSER);
    x_rsc_21__0__INST.WVALID(TLS_x_rsc_21_0_WVALID);
    x_rsc_21__0__INST.WREADY(TLS_x_rsc_21_0_WREADY);
    x_rsc_21__0__INST.BID(CCS_ADAPTOR_x_rsc_21_0_BID);
    x_rsc_21__0__INST.BRESP(TLS_x_rsc_21_0_BRESP);
    x_rsc_21__0__INST.BUSER(CCS_ADAPTOR_x_rsc_21_0_BUSER);
    x_rsc_21__0__INST.BVALID(TLS_x_rsc_21_0_BVALID);
    x_rsc_21__0__INST.BREADY(TLS_x_rsc_21_0_BREADY);
    x_rsc_21__0__INST.ARID(CCS_ADAPTOR_x_rsc_21_0_ARID);
    x_rsc_21__0__INST.ARADDR(TLS_x_rsc_21_0_ARADDR);
    x_rsc_21__0__INST.ARLEN(TLS_x_rsc_21_0_ARLEN);
    x_rsc_21__0__INST.ARSIZE(TLS_x_rsc_21_0_ARSIZE);
    x_rsc_21__0__INST.ARBURST(TLS_x_rsc_21_0_ARBURST);
    x_rsc_21__0__INST.ARLOCK(TLS_x_rsc_21_0_ARLOCK);
    x_rsc_21__0__INST.ARCACHE(TLS_x_rsc_21_0_ARCACHE);
    x_rsc_21__0__INST.ARPROT(TLS_x_rsc_21_0_ARPROT);
    x_rsc_21__0__INST.ARQOS(TLS_x_rsc_21_0_ARQOS);
    x_rsc_21__0__INST.ARREGION(TLS_x_rsc_21_0_ARREGION);
    x_rsc_21__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_21_0_ARUSER);
    x_rsc_21__0__INST.ARVALID(TLS_x_rsc_21_0_ARVALID);
    x_rsc_21__0__INST.ARREADY(TLS_x_rsc_21_0_ARREADY);
    x_rsc_21__0__INST.RID(CCS_ADAPTOR_x_rsc_21_0_RID);
    x_rsc_21__0__INST.RDATA(TLS_x_rsc_21_0_RDATA);
    x_rsc_21__0__INST.RRESP(TLS_x_rsc_21_0_RRESP);
    x_rsc_21__0__INST.RLAST(TLS_x_rsc_21_0_RLAST);
    x_rsc_21__0__INST.RUSER(CCS_ADAPTOR_x_rsc_21_0_RUSER);
    x_rsc_21__0__INST.RVALID(TLS_x_rsc_21_0_RVALID);
    x_rsc_21__0__INST.RREADY(TLS_x_rsc_21_0_RREADY);
    x_rsc_21__0__INST.tr_write_done(TLS_x_rsc_21_0_tr_write_done);
    x_rsc_21__0__INST.s_tdone(TLS_x_rsc_21_0_s_tdone);
    x_rsc_21__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_95)));

    CCS_ADAPTOR_TLS_x_rsc_22_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_22_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_22_0_AWID.outSCALAR(TLS_x_rsc_22_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_22_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_22_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_22_0_AWUSER.outSCALAR(TLS_x_rsc_22_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_22_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_22_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_22_0_WUSER.outSCALAR(TLS_x_rsc_22_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BID.inSCALAR(TLS_x_rsc_22_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_22_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BUSER.inSCALAR(TLS_x_rsc_22_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_22_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_22_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_22_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_22_0_ARID.outSCALAR(TLS_x_rsc_22_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_22_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_22_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_22_0_ARUSER.outSCALAR(TLS_x_rsc_22_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RID.inSCALAR(TLS_x_rsc_22_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_22_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RUSER.inSCALAR(TLS_x_rsc_22_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_22_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_22_0_RUSER);

    x_rsc_22__0__INST.ACLK(clk);
    x_rsc_22__0__INST.ARESETn(rst);
    x_rsc_22__0__INST.AWID(CCS_ADAPTOR_x_rsc_22_0_AWID);
    x_rsc_22__0__INST.AWADDR(TLS_x_rsc_22_0_AWADDR);
    x_rsc_22__0__INST.AWLEN(TLS_x_rsc_22_0_AWLEN);
    x_rsc_22__0__INST.AWSIZE(TLS_x_rsc_22_0_AWSIZE);
    x_rsc_22__0__INST.AWBURST(TLS_x_rsc_22_0_AWBURST);
    x_rsc_22__0__INST.AWLOCK(TLS_x_rsc_22_0_AWLOCK);
    x_rsc_22__0__INST.AWCACHE(TLS_x_rsc_22_0_AWCACHE);
    x_rsc_22__0__INST.AWPROT(TLS_x_rsc_22_0_AWPROT);
    x_rsc_22__0__INST.AWQOS(TLS_x_rsc_22_0_AWQOS);
    x_rsc_22__0__INST.AWREGION(TLS_x_rsc_22_0_AWREGION);
    x_rsc_22__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_22_0_AWUSER);
    x_rsc_22__0__INST.AWVALID(TLS_x_rsc_22_0_AWVALID);
    x_rsc_22__0__INST.AWREADY(TLS_x_rsc_22_0_AWREADY);
    x_rsc_22__0__INST.WDATA(TLS_x_rsc_22_0_WDATA);
    x_rsc_22__0__INST.WSTRB(TLS_x_rsc_22_0_WSTRB);
    x_rsc_22__0__INST.WLAST(TLS_x_rsc_22_0_WLAST);
    x_rsc_22__0__INST.WUSER(CCS_ADAPTOR_x_rsc_22_0_WUSER);
    x_rsc_22__0__INST.WVALID(TLS_x_rsc_22_0_WVALID);
    x_rsc_22__0__INST.WREADY(TLS_x_rsc_22_0_WREADY);
    x_rsc_22__0__INST.BID(CCS_ADAPTOR_x_rsc_22_0_BID);
    x_rsc_22__0__INST.BRESP(TLS_x_rsc_22_0_BRESP);
    x_rsc_22__0__INST.BUSER(CCS_ADAPTOR_x_rsc_22_0_BUSER);
    x_rsc_22__0__INST.BVALID(TLS_x_rsc_22_0_BVALID);
    x_rsc_22__0__INST.BREADY(TLS_x_rsc_22_0_BREADY);
    x_rsc_22__0__INST.ARID(CCS_ADAPTOR_x_rsc_22_0_ARID);
    x_rsc_22__0__INST.ARADDR(TLS_x_rsc_22_0_ARADDR);
    x_rsc_22__0__INST.ARLEN(TLS_x_rsc_22_0_ARLEN);
    x_rsc_22__0__INST.ARSIZE(TLS_x_rsc_22_0_ARSIZE);
    x_rsc_22__0__INST.ARBURST(TLS_x_rsc_22_0_ARBURST);
    x_rsc_22__0__INST.ARLOCK(TLS_x_rsc_22_0_ARLOCK);
    x_rsc_22__0__INST.ARCACHE(TLS_x_rsc_22_0_ARCACHE);
    x_rsc_22__0__INST.ARPROT(TLS_x_rsc_22_0_ARPROT);
    x_rsc_22__0__INST.ARQOS(TLS_x_rsc_22_0_ARQOS);
    x_rsc_22__0__INST.ARREGION(TLS_x_rsc_22_0_ARREGION);
    x_rsc_22__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_22_0_ARUSER);
    x_rsc_22__0__INST.ARVALID(TLS_x_rsc_22_0_ARVALID);
    x_rsc_22__0__INST.ARREADY(TLS_x_rsc_22_0_ARREADY);
    x_rsc_22__0__INST.RID(CCS_ADAPTOR_x_rsc_22_0_RID);
    x_rsc_22__0__INST.RDATA(TLS_x_rsc_22_0_RDATA);
    x_rsc_22__0__INST.RRESP(TLS_x_rsc_22_0_RRESP);
    x_rsc_22__0__INST.RLAST(TLS_x_rsc_22_0_RLAST);
    x_rsc_22__0__INST.RUSER(CCS_ADAPTOR_x_rsc_22_0_RUSER);
    x_rsc_22__0__INST.RVALID(TLS_x_rsc_22_0_RVALID);
    x_rsc_22__0__INST.RREADY(TLS_x_rsc_22_0_RREADY);
    x_rsc_22__0__INST.tr_write_done(TLS_x_rsc_22_0_tr_write_done);
    x_rsc_22__0__INST.s_tdone(TLS_x_rsc_22_0_s_tdone);
    x_rsc_22__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_96)));

    CCS_ADAPTOR_TLS_x_rsc_23_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_23_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_23_0_AWID.outSCALAR(TLS_x_rsc_23_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_23_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_23_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_23_0_AWUSER.outSCALAR(TLS_x_rsc_23_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_23_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_23_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_23_0_WUSER.outSCALAR(TLS_x_rsc_23_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BID.inSCALAR(TLS_x_rsc_23_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_23_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BUSER.inSCALAR(TLS_x_rsc_23_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_23_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_23_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_23_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_23_0_ARID.outSCALAR(TLS_x_rsc_23_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_23_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_23_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_23_0_ARUSER.outSCALAR(TLS_x_rsc_23_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RID.inSCALAR(TLS_x_rsc_23_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_23_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RUSER.inSCALAR(TLS_x_rsc_23_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_23_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_23_0_RUSER);

    x_rsc_23__0__INST.ACLK(clk);
    x_rsc_23__0__INST.ARESETn(rst);
    x_rsc_23__0__INST.AWID(CCS_ADAPTOR_x_rsc_23_0_AWID);
    x_rsc_23__0__INST.AWADDR(TLS_x_rsc_23_0_AWADDR);
    x_rsc_23__0__INST.AWLEN(TLS_x_rsc_23_0_AWLEN);
    x_rsc_23__0__INST.AWSIZE(TLS_x_rsc_23_0_AWSIZE);
    x_rsc_23__0__INST.AWBURST(TLS_x_rsc_23_0_AWBURST);
    x_rsc_23__0__INST.AWLOCK(TLS_x_rsc_23_0_AWLOCK);
    x_rsc_23__0__INST.AWCACHE(TLS_x_rsc_23_0_AWCACHE);
    x_rsc_23__0__INST.AWPROT(TLS_x_rsc_23_0_AWPROT);
    x_rsc_23__0__INST.AWQOS(TLS_x_rsc_23_0_AWQOS);
    x_rsc_23__0__INST.AWREGION(TLS_x_rsc_23_0_AWREGION);
    x_rsc_23__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_23_0_AWUSER);
    x_rsc_23__0__INST.AWVALID(TLS_x_rsc_23_0_AWVALID);
    x_rsc_23__0__INST.AWREADY(TLS_x_rsc_23_0_AWREADY);
    x_rsc_23__0__INST.WDATA(TLS_x_rsc_23_0_WDATA);
    x_rsc_23__0__INST.WSTRB(TLS_x_rsc_23_0_WSTRB);
    x_rsc_23__0__INST.WLAST(TLS_x_rsc_23_0_WLAST);
    x_rsc_23__0__INST.WUSER(CCS_ADAPTOR_x_rsc_23_0_WUSER);
    x_rsc_23__0__INST.WVALID(TLS_x_rsc_23_0_WVALID);
    x_rsc_23__0__INST.WREADY(TLS_x_rsc_23_0_WREADY);
    x_rsc_23__0__INST.BID(CCS_ADAPTOR_x_rsc_23_0_BID);
    x_rsc_23__0__INST.BRESP(TLS_x_rsc_23_0_BRESP);
    x_rsc_23__0__INST.BUSER(CCS_ADAPTOR_x_rsc_23_0_BUSER);
    x_rsc_23__0__INST.BVALID(TLS_x_rsc_23_0_BVALID);
    x_rsc_23__0__INST.BREADY(TLS_x_rsc_23_0_BREADY);
    x_rsc_23__0__INST.ARID(CCS_ADAPTOR_x_rsc_23_0_ARID);
    x_rsc_23__0__INST.ARADDR(TLS_x_rsc_23_0_ARADDR);
    x_rsc_23__0__INST.ARLEN(TLS_x_rsc_23_0_ARLEN);
    x_rsc_23__0__INST.ARSIZE(TLS_x_rsc_23_0_ARSIZE);
    x_rsc_23__0__INST.ARBURST(TLS_x_rsc_23_0_ARBURST);
    x_rsc_23__0__INST.ARLOCK(TLS_x_rsc_23_0_ARLOCK);
    x_rsc_23__0__INST.ARCACHE(TLS_x_rsc_23_0_ARCACHE);
    x_rsc_23__0__INST.ARPROT(TLS_x_rsc_23_0_ARPROT);
    x_rsc_23__0__INST.ARQOS(TLS_x_rsc_23_0_ARQOS);
    x_rsc_23__0__INST.ARREGION(TLS_x_rsc_23_0_ARREGION);
    x_rsc_23__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_23_0_ARUSER);
    x_rsc_23__0__INST.ARVALID(TLS_x_rsc_23_0_ARVALID);
    x_rsc_23__0__INST.ARREADY(TLS_x_rsc_23_0_ARREADY);
    x_rsc_23__0__INST.RID(CCS_ADAPTOR_x_rsc_23_0_RID);
    x_rsc_23__0__INST.RDATA(TLS_x_rsc_23_0_RDATA);
    x_rsc_23__0__INST.RRESP(TLS_x_rsc_23_0_RRESP);
    x_rsc_23__0__INST.RLAST(TLS_x_rsc_23_0_RLAST);
    x_rsc_23__0__INST.RUSER(CCS_ADAPTOR_x_rsc_23_0_RUSER);
    x_rsc_23__0__INST.RVALID(TLS_x_rsc_23_0_RVALID);
    x_rsc_23__0__INST.RREADY(TLS_x_rsc_23_0_RREADY);
    x_rsc_23__0__INST.tr_write_done(TLS_x_rsc_23_0_tr_write_done);
    x_rsc_23__0__INST.s_tdone(TLS_x_rsc_23_0_s_tdone);
    x_rsc_23__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_97)));

    CCS_ADAPTOR_TLS_x_rsc_24_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_24_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_24_0_AWID.outSCALAR(TLS_x_rsc_24_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_24_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_24_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_24_0_AWUSER.outSCALAR(TLS_x_rsc_24_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_24_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_24_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_24_0_WUSER.outSCALAR(TLS_x_rsc_24_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BID.inSCALAR(TLS_x_rsc_24_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_24_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BUSER.inSCALAR(TLS_x_rsc_24_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_24_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_24_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_24_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_24_0_ARID.outSCALAR(TLS_x_rsc_24_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_24_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_24_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_24_0_ARUSER.outSCALAR(TLS_x_rsc_24_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RID.inSCALAR(TLS_x_rsc_24_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_24_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RUSER.inSCALAR(TLS_x_rsc_24_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_24_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_24_0_RUSER);

    x_rsc_24__0__INST.ACLK(clk);
    x_rsc_24__0__INST.ARESETn(rst);
    x_rsc_24__0__INST.AWID(CCS_ADAPTOR_x_rsc_24_0_AWID);
    x_rsc_24__0__INST.AWADDR(TLS_x_rsc_24_0_AWADDR);
    x_rsc_24__0__INST.AWLEN(TLS_x_rsc_24_0_AWLEN);
    x_rsc_24__0__INST.AWSIZE(TLS_x_rsc_24_0_AWSIZE);
    x_rsc_24__0__INST.AWBURST(TLS_x_rsc_24_0_AWBURST);
    x_rsc_24__0__INST.AWLOCK(TLS_x_rsc_24_0_AWLOCK);
    x_rsc_24__0__INST.AWCACHE(TLS_x_rsc_24_0_AWCACHE);
    x_rsc_24__0__INST.AWPROT(TLS_x_rsc_24_0_AWPROT);
    x_rsc_24__0__INST.AWQOS(TLS_x_rsc_24_0_AWQOS);
    x_rsc_24__0__INST.AWREGION(TLS_x_rsc_24_0_AWREGION);
    x_rsc_24__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_24_0_AWUSER);
    x_rsc_24__0__INST.AWVALID(TLS_x_rsc_24_0_AWVALID);
    x_rsc_24__0__INST.AWREADY(TLS_x_rsc_24_0_AWREADY);
    x_rsc_24__0__INST.WDATA(TLS_x_rsc_24_0_WDATA);
    x_rsc_24__0__INST.WSTRB(TLS_x_rsc_24_0_WSTRB);
    x_rsc_24__0__INST.WLAST(TLS_x_rsc_24_0_WLAST);
    x_rsc_24__0__INST.WUSER(CCS_ADAPTOR_x_rsc_24_0_WUSER);
    x_rsc_24__0__INST.WVALID(TLS_x_rsc_24_0_WVALID);
    x_rsc_24__0__INST.WREADY(TLS_x_rsc_24_0_WREADY);
    x_rsc_24__0__INST.BID(CCS_ADAPTOR_x_rsc_24_0_BID);
    x_rsc_24__0__INST.BRESP(TLS_x_rsc_24_0_BRESP);
    x_rsc_24__0__INST.BUSER(CCS_ADAPTOR_x_rsc_24_0_BUSER);
    x_rsc_24__0__INST.BVALID(TLS_x_rsc_24_0_BVALID);
    x_rsc_24__0__INST.BREADY(TLS_x_rsc_24_0_BREADY);
    x_rsc_24__0__INST.ARID(CCS_ADAPTOR_x_rsc_24_0_ARID);
    x_rsc_24__0__INST.ARADDR(TLS_x_rsc_24_0_ARADDR);
    x_rsc_24__0__INST.ARLEN(TLS_x_rsc_24_0_ARLEN);
    x_rsc_24__0__INST.ARSIZE(TLS_x_rsc_24_0_ARSIZE);
    x_rsc_24__0__INST.ARBURST(TLS_x_rsc_24_0_ARBURST);
    x_rsc_24__0__INST.ARLOCK(TLS_x_rsc_24_0_ARLOCK);
    x_rsc_24__0__INST.ARCACHE(TLS_x_rsc_24_0_ARCACHE);
    x_rsc_24__0__INST.ARPROT(TLS_x_rsc_24_0_ARPROT);
    x_rsc_24__0__INST.ARQOS(TLS_x_rsc_24_0_ARQOS);
    x_rsc_24__0__INST.ARREGION(TLS_x_rsc_24_0_ARREGION);
    x_rsc_24__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_24_0_ARUSER);
    x_rsc_24__0__INST.ARVALID(TLS_x_rsc_24_0_ARVALID);
    x_rsc_24__0__INST.ARREADY(TLS_x_rsc_24_0_ARREADY);
    x_rsc_24__0__INST.RID(CCS_ADAPTOR_x_rsc_24_0_RID);
    x_rsc_24__0__INST.RDATA(TLS_x_rsc_24_0_RDATA);
    x_rsc_24__0__INST.RRESP(TLS_x_rsc_24_0_RRESP);
    x_rsc_24__0__INST.RLAST(TLS_x_rsc_24_0_RLAST);
    x_rsc_24__0__INST.RUSER(CCS_ADAPTOR_x_rsc_24_0_RUSER);
    x_rsc_24__0__INST.RVALID(TLS_x_rsc_24_0_RVALID);
    x_rsc_24__0__INST.RREADY(TLS_x_rsc_24_0_RREADY);
    x_rsc_24__0__INST.tr_write_done(TLS_x_rsc_24_0_tr_write_done);
    x_rsc_24__0__INST.s_tdone(TLS_x_rsc_24_0_s_tdone);
    x_rsc_24__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_98)));

    CCS_ADAPTOR_TLS_x_rsc_25_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_25_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_25_0_AWID.outSCALAR(TLS_x_rsc_25_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_25_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_25_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_25_0_AWUSER.outSCALAR(TLS_x_rsc_25_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_25_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_25_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_25_0_WUSER.outSCALAR(TLS_x_rsc_25_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BID.inSCALAR(TLS_x_rsc_25_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_25_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BUSER.inSCALAR(TLS_x_rsc_25_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_25_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_25_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_25_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_25_0_ARID.outSCALAR(TLS_x_rsc_25_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_25_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_25_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_25_0_ARUSER.outSCALAR(TLS_x_rsc_25_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RID.inSCALAR(TLS_x_rsc_25_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_25_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RUSER.inSCALAR(TLS_x_rsc_25_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_25_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_25_0_RUSER);

    x_rsc_25__0__INST.ACLK(clk);
    x_rsc_25__0__INST.ARESETn(rst);
    x_rsc_25__0__INST.AWID(CCS_ADAPTOR_x_rsc_25_0_AWID);
    x_rsc_25__0__INST.AWADDR(TLS_x_rsc_25_0_AWADDR);
    x_rsc_25__0__INST.AWLEN(TLS_x_rsc_25_0_AWLEN);
    x_rsc_25__0__INST.AWSIZE(TLS_x_rsc_25_0_AWSIZE);
    x_rsc_25__0__INST.AWBURST(TLS_x_rsc_25_0_AWBURST);
    x_rsc_25__0__INST.AWLOCK(TLS_x_rsc_25_0_AWLOCK);
    x_rsc_25__0__INST.AWCACHE(TLS_x_rsc_25_0_AWCACHE);
    x_rsc_25__0__INST.AWPROT(TLS_x_rsc_25_0_AWPROT);
    x_rsc_25__0__INST.AWQOS(TLS_x_rsc_25_0_AWQOS);
    x_rsc_25__0__INST.AWREGION(TLS_x_rsc_25_0_AWREGION);
    x_rsc_25__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_25_0_AWUSER);
    x_rsc_25__0__INST.AWVALID(TLS_x_rsc_25_0_AWVALID);
    x_rsc_25__0__INST.AWREADY(TLS_x_rsc_25_0_AWREADY);
    x_rsc_25__0__INST.WDATA(TLS_x_rsc_25_0_WDATA);
    x_rsc_25__0__INST.WSTRB(TLS_x_rsc_25_0_WSTRB);
    x_rsc_25__0__INST.WLAST(TLS_x_rsc_25_0_WLAST);
    x_rsc_25__0__INST.WUSER(CCS_ADAPTOR_x_rsc_25_0_WUSER);
    x_rsc_25__0__INST.WVALID(TLS_x_rsc_25_0_WVALID);
    x_rsc_25__0__INST.WREADY(TLS_x_rsc_25_0_WREADY);
    x_rsc_25__0__INST.BID(CCS_ADAPTOR_x_rsc_25_0_BID);
    x_rsc_25__0__INST.BRESP(TLS_x_rsc_25_0_BRESP);
    x_rsc_25__0__INST.BUSER(CCS_ADAPTOR_x_rsc_25_0_BUSER);
    x_rsc_25__0__INST.BVALID(TLS_x_rsc_25_0_BVALID);
    x_rsc_25__0__INST.BREADY(TLS_x_rsc_25_0_BREADY);
    x_rsc_25__0__INST.ARID(CCS_ADAPTOR_x_rsc_25_0_ARID);
    x_rsc_25__0__INST.ARADDR(TLS_x_rsc_25_0_ARADDR);
    x_rsc_25__0__INST.ARLEN(TLS_x_rsc_25_0_ARLEN);
    x_rsc_25__0__INST.ARSIZE(TLS_x_rsc_25_0_ARSIZE);
    x_rsc_25__0__INST.ARBURST(TLS_x_rsc_25_0_ARBURST);
    x_rsc_25__0__INST.ARLOCK(TLS_x_rsc_25_0_ARLOCK);
    x_rsc_25__0__INST.ARCACHE(TLS_x_rsc_25_0_ARCACHE);
    x_rsc_25__0__INST.ARPROT(TLS_x_rsc_25_0_ARPROT);
    x_rsc_25__0__INST.ARQOS(TLS_x_rsc_25_0_ARQOS);
    x_rsc_25__0__INST.ARREGION(TLS_x_rsc_25_0_ARREGION);
    x_rsc_25__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_25_0_ARUSER);
    x_rsc_25__0__INST.ARVALID(TLS_x_rsc_25_0_ARVALID);
    x_rsc_25__0__INST.ARREADY(TLS_x_rsc_25_0_ARREADY);
    x_rsc_25__0__INST.RID(CCS_ADAPTOR_x_rsc_25_0_RID);
    x_rsc_25__0__INST.RDATA(TLS_x_rsc_25_0_RDATA);
    x_rsc_25__0__INST.RRESP(TLS_x_rsc_25_0_RRESP);
    x_rsc_25__0__INST.RLAST(TLS_x_rsc_25_0_RLAST);
    x_rsc_25__0__INST.RUSER(CCS_ADAPTOR_x_rsc_25_0_RUSER);
    x_rsc_25__0__INST.RVALID(TLS_x_rsc_25_0_RVALID);
    x_rsc_25__0__INST.RREADY(TLS_x_rsc_25_0_RREADY);
    x_rsc_25__0__INST.tr_write_done(TLS_x_rsc_25_0_tr_write_done);
    x_rsc_25__0__INST.s_tdone(TLS_x_rsc_25_0_s_tdone);
    x_rsc_25__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_99)));

    CCS_ADAPTOR_TLS_x_rsc_26_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_26_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_26_0_AWID.outSCALAR(TLS_x_rsc_26_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_26_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_26_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_26_0_AWUSER.outSCALAR(TLS_x_rsc_26_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_26_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_26_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_26_0_WUSER.outSCALAR(TLS_x_rsc_26_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BID.inSCALAR(TLS_x_rsc_26_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_26_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BUSER.inSCALAR(TLS_x_rsc_26_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_26_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_26_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_26_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_26_0_ARID.outSCALAR(TLS_x_rsc_26_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_26_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_26_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_26_0_ARUSER.outSCALAR(TLS_x_rsc_26_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RID.inSCALAR(TLS_x_rsc_26_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_26_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RUSER.inSCALAR(TLS_x_rsc_26_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_26_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_26_0_RUSER);

    x_rsc_26__0__INST.ACLK(clk);
    x_rsc_26__0__INST.ARESETn(rst);
    x_rsc_26__0__INST.AWID(CCS_ADAPTOR_x_rsc_26_0_AWID);
    x_rsc_26__0__INST.AWADDR(TLS_x_rsc_26_0_AWADDR);
    x_rsc_26__0__INST.AWLEN(TLS_x_rsc_26_0_AWLEN);
    x_rsc_26__0__INST.AWSIZE(TLS_x_rsc_26_0_AWSIZE);
    x_rsc_26__0__INST.AWBURST(TLS_x_rsc_26_0_AWBURST);
    x_rsc_26__0__INST.AWLOCK(TLS_x_rsc_26_0_AWLOCK);
    x_rsc_26__0__INST.AWCACHE(TLS_x_rsc_26_0_AWCACHE);
    x_rsc_26__0__INST.AWPROT(TLS_x_rsc_26_0_AWPROT);
    x_rsc_26__0__INST.AWQOS(TLS_x_rsc_26_0_AWQOS);
    x_rsc_26__0__INST.AWREGION(TLS_x_rsc_26_0_AWREGION);
    x_rsc_26__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_26_0_AWUSER);
    x_rsc_26__0__INST.AWVALID(TLS_x_rsc_26_0_AWVALID);
    x_rsc_26__0__INST.AWREADY(TLS_x_rsc_26_0_AWREADY);
    x_rsc_26__0__INST.WDATA(TLS_x_rsc_26_0_WDATA);
    x_rsc_26__0__INST.WSTRB(TLS_x_rsc_26_0_WSTRB);
    x_rsc_26__0__INST.WLAST(TLS_x_rsc_26_0_WLAST);
    x_rsc_26__0__INST.WUSER(CCS_ADAPTOR_x_rsc_26_0_WUSER);
    x_rsc_26__0__INST.WVALID(TLS_x_rsc_26_0_WVALID);
    x_rsc_26__0__INST.WREADY(TLS_x_rsc_26_0_WREADY);
    x_rsc_26__0__INST.BID(CCS_ADAPTOR_x_rsc_26_0_BID);
    x_rsc_26__0__INST.BRESP(TLS_x_rsc_26_0_BRESP);
    x_rsc_26__0__INST.BUSER(CCS_ADAPTOR_x_rsc_26_0_BUSER);
    x_rsc_26__0__INST.BVALID(TLS_x_rsc_26_0_BVALID);
    x_rsc_26__0__INST.BREADY(TLS_x_rsc_26_0_BREADY);
    x_rsc_26__0__INST.ARID(CCS_ADAPTOR_x_rsc_26_0_ARID);
    x_rsc_26__0__INST.ARADDR(TLS_x_rsc_26_0_ARADDR);
    x_rsc_26__0__INST.ARLEN(TLS_x_rsc_26_0_ARLEN);
    x_rsc_26__0__INST.ARSIZE(TLS_x_rsc_26_0_ARSIZE);
    x_rsc_26__0__INST.ARBURST(TLS_x_rsc_26_0_ARBURST);
    x_rsc_26__0__INST.ARLOCK(TLS_x_rsc_26_0_ARLOCK);
    x_rsc_26__0__INST.ARCACHE(TLS_x_rsc_26_0_ARCACHE);
    x_rsc_26__0__INST.ARPROT(TLS_x_rsc_26_0_ARPROT);
    x_rsc_26__0__INST.ARQOS(TLS_x_rsc_26_0_ARQOS);
    x_rsc_26__0__INST.ARREGION(TLS_x_rsc_26_0_ARREGION);
    x_rsc_26__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_26_0_ARUSER);
    x_rsc_26__0__INST.ARVALID(TLS_x_rsc_26_0_ARVALID);
    x_rsc_26__0__INST.ARREADY(TLS_x_rsc_26_0_ARREADY);
    x_rsc_26__0__INST.RID(CCS_ADAPTOR_x_rsc_26_0_RID);
    x_rsc_26__0__INST.RDATA(TLS_x_rsc_26_0_RDATA);
    x_rsc_26__0__INST.RRESP(TLS_x_rsc_26_0_RRESP);
    x_rsc_26__0__INST.RLAST(TLS_x_rsc_26_0_RLAST);
    x_rsc_26__0__INST.RUSER(CCS_ADAPTOR_x_rsc_26_0_RUSER);
    x_rsc_26__0__INST.RVALID(TLS_x_rsc_26_0_RVALID);
    x_rsc_26__0__INST.RREADY(TLS_x_rsc_26_0_RREADY);
    x_rsc_26__0__INST.tr_write_done(TLS_x_rsc_26_0_tr_write_done);
    x_rsc_26__0__INST.s_tdone(TLS_x_rsc_26_0_s_tdone);
    x_rsc_26__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_100)));

    CCS_ADAPTOR_TLS_x_rsc_27_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_27_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_27_0_AWID.outSCALAR(TLS_x_rsc_27_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_27_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_27_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_27_0_AWUSER.outSCALAR(TLS_x_rsc_27_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_27_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_27_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_27_0_WUSER.outSCALAR(TLS_x_rsc_27_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BID.inSCALAR(TLS_x_rsc_27_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_27_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BUSER.inSCALAR(TLS_x_rsc_27_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_27_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_27_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_27_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_27_0_ARID.outSCALAR(TLS_x_rsc_27_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_27_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_27_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_27_0_ARUSER.outSCALAR(TLS_x_rsc_27_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RID.inSCALAR(TLS_x_rsc_27_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_27_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RUSER.inSCALAR(TLS_x_rsc_27_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_27_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_27_0_RUSER);

    x_rsc_27__0__INST.ACLK(clk);
    x_rsc_27__0__INST.ARESETn(rst);
    x_rsc_27__0__INST.AWID(CCS_ADAPTOR_x_rsc_27_0_AWID);
    x_rsc_27__0__INST.AWADDR(TLS_x_rsc_27_0_AWADDR);
    x_rsc_27__0__INST.AWLEN(TLS_x_rsc_27_0_AWLEN);
    x_rsc_27__0__INST.AWSIZE(TLS_x_rsc_27_0_AWSIZE);
    x_rsc_27__0__INST.AWBURST(TLS_x_rsc_27_0_AWBURST);
    x_rsc_27__0__INST.AWLOCK(TLS_x_rsc_27_0_AWLOCK);
    x_rsc_27__0__INST.AWCACHE(TLS_x_rsc_27_0_AWCACHE);
    x_rsc_27__0__INST.AWPROT(TLS_x_rsc_27_0_AWPROT);
    x_rsc_27__0__INST.AWQOS(TLS_x_rsc_27_0_AWQOS);
    x_rsc_27__0__INST.AWREGION(TLS_x_rsc_27_0_AWREGION);
    x_rsc_27__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_27_0_AWUSER);
    x_rsc_27__0__INST.AWVALID(TLS_x_rsc_27_0_AWVALID);
    x_rsc_27__0__INST.AWREADY(TLS_x_rsc_27_0_AWREADY);
    x_rsc_27__0__INST.WDATA(TLS_x_rsc_27_0_WDATA);
    x_rsc_27__0__INST.WSTRB(TLS_x_rsc_27_0_WSTRB);
    x_rsc_27__0__INST.WLAST(TLS_x_rsc_27_0_WLAST);
    x_rsc_27__0__INST.WUSER(CCS_ADAPTOR_x_rsc_27_0_WUSER);
    x_rsc_27__0__INST.WVALID(TLS_x_rsc_27_0_WVALID);
    x_rsc_27__0__INST.WREADY(TLS_x_rsc_27_0_WREADY);
    x_rsc_27__0__INST.BID(CCS_ADAPTOR_x_rsc_27_0_BID);
    x_rsc_27__0__INST.BRESP(TLS_x_rsc_27_0_BRESP);
    x_rsc_27__0__INST.BUSER(CCS_ADAPTOR_x_rsc_27_0_BUSER);
    x_rsc_27__0__INST.BVALID(TLS_x_rsc_27_0_BVALID);
    x_rsc_27__0__INST.BREADY(TLS_x_rsc_27_0_BREADY);
    x_rsc_27__0__INST.ARID(CCS_ADAPTOR_x_rsc_27_0_ARID);
    x_rsc_27__0__INST.ARADDR(TLS_x_rsc_27_0_ARADDR);
    x_rsc_27__0__INST.ARLEN(TLS_x_rsc_27_0_ARLEN);
    x_rsc_27__0__INST.ARSIZE(TLS_x_rsc_27_0_ARSIZE);
    x_rsc_27__0__INST.ARBURST(TLS_x_rsc_27_0_ARBURST);
    x_rsc_27__0__INST.ARLOCK(TLS_x_rsc_27_0_ARLOCK);
    x_rsc_27__0__INST.ARCACHE(TLS_x_rsc_27_0_ARCACHE);
    x_rsc_27__0__INST.ARPROT(TLS_x_rsc_27_0_ARPROT);
    x_rsc_27__0__INST.ARQOS(TLS_x_rsc_27_0_ARQOS);
    x_rsc_27__0__INST.ARREGION(TLS_x_rsc_27_0_ARREGION);
    x_rsc_27__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_27_0_ARUSER);
    x_rsc_27__0__INST.ARVALID(TLS_x_rsc_27_0_ARVALID);
    x_rsc_27__0__INST.ARREADY(TLS_x_rsc_27_0_ARREADY);
    x_rsc_27__0__INST.RID(CCS_ADAPTOR_x_rsc_27_0_RID);
    x_rsc_27__0__INST.RDATA(TLS_x_rsc_27_0_RDATA);
    x_rsc_27__0__INST.RRESP(TLS_x_rsc_27_0_RRESP);
    x_rsc_27__0__INST.RLAST(TLS_x_rsc_27_0_RLAST);
    x_rsc_27__0__INST.RUSER(CCS_ADAPTOR_x_rsc_27_0_RUSER);
    x_rsc_27__0__INST.RVALID(TLS_x_rsc_27_0_RVALID);
    x_rsc_27__0__INST.RREADY(TLS_x_rsc_27_0_RREADY);
    x_rsc_27__0__INST.tr_write_done(TLS_x_rsc_27_0_tr_write_done);
    x_rsc_27__0__INST.s_tdone(TLS_x_rsc_27_0_s_tdone);
    x_rsc_27__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_101)));

    CCS_ADAPTOR_TLS_x_rsc_28_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_28_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_28_0_AWID.outSCALAR(TLS_x_rsc_28_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_28_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_28_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_28_0_AWUSER.outSCALAR(TLS_x_rsc_28_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_28_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_28_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_28_0_WUSER.outSCALAR(TLS_x_rsc_28_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BID.inSCALAR(TLS_x_rsc_28_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_28_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BUSER.inSCALAR(TLS_x_rsc_28_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_28_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_28_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_28_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_28_0_ARID.outSCALAR(TLS_x_rsc_28_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_28_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_28_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_28_0_ARUSER.outSCALAR(TLS_x_rsc_28_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RID.inSCALAR(TLS_x_rsc_28_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_28_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RUSER.inSCALAR(TLS_x_rsc_28_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_28_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_28_0_RUSER);

    x_rsc_28__0__INST.ACLK(clk);
    x_rsc_28__0__INST.ARESETn(rst);
    x_rsc_28__0__INST.AWID(CCS_ADAPTOR_x_rsc_28_0_AWID);
    x_rsc_28__0__INST.AWADDR(TLS_x_rsc_28_0_AWADDR);
    x_rsc_28__0__INST.AWLEN(TLS_x_rsc_28_0_AWLEN);
    x_rsc_28__0__INST.AWSIZE(TLS_x_rsc_28_0_AWSIZE);
    x_rsc_28__0__INST.AWBURST(TLS_x_rsc_28_0_AWBURST);
    x_rsc_28__0__INST.AWLOCK(TLS_x_rsc_28_0_AWLOCK);
    x_rsc_28__0__INST.AWCACHE(TLS_x_rsc_28_0_AWCACHE);
    x_rsc_28__0__INST.AWPROT(TLS_x_rsc_28_0_AWPROT);
    x_rsc_28__0__INST.AWQOS(TLS_x_rsc_28_0_AWQOS);
    x_rsc_28__0__INST.AWREGION(TLS_x_rsc_28_0_AWREGION);
    x_rsc_28__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_28_0_AWUSER);
    x_rsc_28__0__INST.AWVALID(TLS_x_rsc_28_0_AWVALID);
    x_rsc_28__0__INST.AWREADY(TLS_x_rsc_28_0_AWREADY);
    x_rsc_28__0__INST.WDATA(TLS_x_rsc_28_0_WDATA);
    x_rsc_28__0__INST.WSTRB(TLS_x_rsc_28_0_WSTRB);
    x_rsc_28__0__INST.WLAST(TLS_x_rsc_28_0_WLAST);
    x_rsc_28__0__INST.WUSER(CCS_ADAPTOR_x_rsc_28_0_WUSER);
    x_rsc_28__0__INST.WVALID(TLS_x_rsc_28_0_WVALID);
    x_rsc_28__0__INST.WREADY(TLS_x_rsc_28_0_WREADY);
    x_rsc_28__0__INST.BID(CCS_ADAPTOR_x_rsc_28_0_BID);
    x_rsc_28__0__INST.BRESP(TLS_x_rsc_28_0_BRESP);
    x_rsc_28__0__INST.BUSER(CCS_ADAPTOR_x_rsc_28_0_BUSER);
    x_rsc_28__0__INST.BVALID(TLS_x_rsc_28_0_BVALID);
    x_rsc_28__0__INST.BREADY(TLS_x_rsc_28_0_BREADY);
    x_rsc_28__0__INST.ARID(CCS_ADAPTOR_x_rsc_28_0_ARID);
    x_rsc_28__0__INST.ARADDR(TLS_x_rsc_28_0_ARADDR);
    x_rsc_28__0__INST.ARLEN(TLS_x_rsc_28_0_ARLEN);
    x_rsc_28__0__INST.ARSIZE(TLS_x_rsc_28_0_ARSIZE);
    x_rsc_28__0__INST.ARBURST(TLS_x_rsc_28_0_ARBURST);
    x_rsc_28__0__INST.ARLOCK(TLS_x_rsc_28_0_ARLOCK);
    x_rsc_28__0__INST.ARCACHE(TLS_x_rsc_28_0_ARCACHE);
    x_rsc_28__0__INST.ARPROT(TLS_x_rsc_28_0_ARPROT);
    x_rsc_28__0__INST.ARQOS(TLS_x_rsc_28_0_ARQOS);
    x_rsc_28__0__INST.ARREGION(TLS_x_rsc_28_0_ARREGION);
    x_rsc_28__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_28_0_ARUSER);
    x_rsc_28__0__INST.ARVALID(TLS_x_rsc_28_0_ARVALID);
    x_rsc_28__0__INST.ARREADY(TLS_x_rsc_28_0_ARREADY);
    x_rsc_28__0__INST.RID(CCS_ADAPTOR_x_rsc_28_0_RID);
    x_rsc_28__0__INST.RDATA(TLS_x_rsc_28_0_RDATA);
    x_rsc_28__0__INST.RRESP(TLS_x_rsc_28_0_RRESP);
    x_rsc_28__0__INST.RLAST(TLS_x_rsc_28_0_RLAST);
    x_rsc_28__0__INST.RUSER(CCS_ADAPTOR_x_rsc_28_0_RUSER);
    x_rsc_28__0__INST.RVALID(TLS_x_rsc_28_0_RVALID);
    x_rsc_28__0__INST.RREADY(TLS_x_rsc_28_0_RREADY);
    x_rsc_28__0__INST.tr_write_done(TLS_x_rsc_28_0_tr_write_done);
    x_rsc_28__0__INST.s_tdone(TLS_x_rsc_28_0_s_tdone);
    x_rsc_28__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_102)));

    CCS_ADAPTOR_TLS_x_rsc_29_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_29_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_29_0_AWID.outSCALAR(TLS_x_rsc_29_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_29_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_29_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_29_0_AWUSER.outSCALAR(TLS_x_rsc_29_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_29_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_29_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_29_0_WUSER.outSCALAR(TLS_x_rsc_29_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BID.inSCALAR(TLS_x_rsc_29_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_29_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BUSER.inSCALAR(TLS_x_rsc_29_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_29_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_29_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_29_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_29_0_ARID.outSCALAR(TLS_x_rsc_29_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_29_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_29_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_29_0_ARUSER.outSCALAR(TLS_x_rsc_29_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RID.inSCALAR(TLS_x_rsc_29_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_29_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RUSER.inSCALAR(TLS_x_rsc_29_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_29_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_29_0_RUSER);

    x_rsc_29__0__INST.ACLK(clk);
    x_rsc_29__0__INST.ARESETn(rst);
    x_rsc_29__0__INST.AWID(CCS_ADAPTOR_x_rsc_29_0_AWID);
    x_rsc_29__0__INST.AWADDR(TLS_x_rsc_29_0_AWADDR);
    x_rsc_29__0__INST.AWLEN(TLS_x_rsc_29_0_AWLEN);
    x_rsc_29__0__INST.AWSIZE(TLS_x_rsc_29_0_AWSIZE);
    x_rsc_29__0__INST.AWBURST(TLS_x_rsc_29_0_AWBURST);
    x_rsc_29__0__INST.AWLOCK(TLS_x_rsc_29_0_AWLOCK);
    x_rsc_29__0__INST.AWCACHE(TLS_x_rsc_29_0_AWCACHE);
    x_rsc_29__0__INST.AWPROT(TLS_x_rsc_29_0_AWPROT);
    x_rsc_29__0__INST.AWQOS(TLS_x_rsc_29_0_AWQOS);
    x_rsc_29__0__INST.AWREGION(TLS_x_rsc_29_0_AWREGION);
    x_rsc_29__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_29_0_AWUSER);
    x_rsc_29__0__INST.AWVALID(TLS_x_rsc_29_0_AWVALID);
    x_rsc_29__0__INST.AWREADY(TLS_x_rsc_29_0_AWREADY);
    x_rsc_29__0__INST.WDATA(TLS_x_rsc_29_0_WDATA);
    x_rsc_29__0__INST.WSTRB(TLS_x_rsc_29_0_WSTRB);
    x_rsc_29__0__INST.WLAST(TLS_x_rsc_29_0_WLAST);
    x_rsc_29__0__INST.WUSER(CCS_ADAPTOR_x_rsc_29_0_WUSER);
    x_rsc_29__0__INST.WVALID(TLS_x_rsc_29_0_WVALID);
    x_rsc_29__0__INST.WREADY(TLS_x_rsc_29_0_WREADY);
    x_rsc_29__0__INST.BID(CCS_ADAPTOR_x_rsc_29_0_BID);
    x_rsc_29__0__INST.BRESP(TLS_x_rsc_29_0_BRESP);
    x_rsc_29__0__INST.BUSER(CCS_ADAPTOR_x_rsc_29_0_BUSER);
    x_rsc_29__0__INST.BVALID(TLS_x_rsc_29_0_BVALID);
    x_rsc_29__0__INST.BREADY(TLS_x_rsc_29_0_BREADY);
    x_rsc_29__0__INST.ARID(CCS_ADAPTOR_x_rsc_29_0_ARID);
    x_rsc_29__0__INST.ARADDR(TLS_x_rsc_29_0_ARADDR);
    x_rsc_29__0__INST.ARLEN(TLS_x_rsc_29_0_ARLEN);
    x_rsc_29__0__INST.ARSIZE(TLS_x_rsc_29_0_ARSIZE);
    x_rsc_29__0__INST.ARBURST(TLS_x_rsc_29_0_ARBURST);
    x_rsc_29__0__INST.ARLOCK(TLS_x_rsc_29_0_ARLOCK);
    x_rsc_29__0__INST.ARCACHE(TLS_x_rsc_29_0_ARCACHE);
    x_rsc_29__0__INST.ARPROT(TLS_x_rsc_29_0_ARPROT);
    x_rsc_29__0__INST.ARQOS(TLS_x_rsc_29_0_ARQOS);
    x_rsc_29__0__INST.ARREGION(TLS_x_rsc_29_0_ARREGION);
    x_rsc_29__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_29_0_ARUSER);
    x_rsc_29__0__INST.ARVALID(TLS_x_rsc_29_0_ARVALID);
    x_rsc_29__0__INST.ARREADY(TLS_x_rsc_29_0_ARREADY);
    x_rsc_29__0__INST.RID(CCS_ADAPTOR_x_rsc_29_0_RID);
    x_rsc_29__0__INST.RDATA(TLS_x_rsc_29_0_RDATA);
    x_rsc_29__0__INST.RRESP(TLS_x_rsc_29_0_RRESP);
    x_rsc_29__0__INST.RLAST(TLS_x_rsc_29_0_RLAST);
    x_rsc_29__0__INST.RUSER(CCS_ADAPTOR_x_rsc_29_0_RUSER);
    x_rsc_29__0__INST.RVALID(TLS_x_rsc_29_0_RVALID);
    x_rsc_29__0__INST.RREADY(TLS_x_rsc_29_0_RREADY);
    x_rsc_29__0__INST.tr_write_done(TLS_x_rsc_29_0_tr_write_done);
    x_rsc_29__0__INST.s_tdone(TLS_x_rsc_29_0_s_tdone);
    x_rsc_29__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_103)));

    CCS_ADAPTOR_TLS_x_rsc_30_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_30_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_30_0_AWID.outSCALAR(TLS_x_rsc_30_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_30_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_30_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_30_0_AWUSER.outSCALAR(TLS_x_rsc_30_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_30_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_30_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_30_0_WUSER.outSCALAR(TLS_x_rsc_30_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BID.inSCALAR(TLS_x_rsc_30_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_30_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BUSER.inSCALAR(TLS_x_rsc_30_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_30_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_30_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_30_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_30_0_ARID.outSCALAR(TLS_x_rsc_30_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_30_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_30_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_30_0_ARUSER.outSCALAR(TLS_x_rsc_30_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RID.inSCALAR(TLS_x_rsc_30_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_30_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RUSER.inSCALAR(TLS_x_rsc_30_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_30_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_30_0_RUSER);

    x_rsc_30__0__INST.ACLK(clk);
    x_rsc_30__0__INST.ARESETn(rst);
    x_rsc_30__0__INST.AWID(CCS_ADAPTOR_x_rsc_30_0_AWID);
    x_rsc_30__0__INST.AWADDR(TLS_x_rsc_30_0_AWADDR);
    x_rsc_30__0__INST.AWLEN(TLS_x_rsc_30_0_AWLEN);
    x_rsc_30__0__INST.AWSIZE(TLS_x_rsc_30_0_AWSIZE);
    x_rsc_30__0__INST.AWBURST(TLS_x_rsc_30_0_AWBURST);
    x_rsc_30__0__INST.AWLOCK(TLS_x_rsc_30_0_AWLOCK);
    x_rsc_30__0__INST.AWCACHE(TLS_x_rsc_30_0_AWCACHE);
    x_rsc_30__0__INST.AWPROT(TLS_x_rsc_30_0_AWPROT);
    x_rsc_30__0__INST.AWQOS(TLS_x_rsc_30_0_AWQOS);
    x_rsc_30__0__INST.AWREGION(TLS_x_rsc_30_0_AWREGION);
    x_rsc_30__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_30_0_AWUSER);
    x_rsc_30__0__INST.AWVALID(TLS_x_rsc_30_0_AWVALID);
    x_rsc_30__0__INST.AWREADY(TLS_x_rsc_30_0_AWREADY);
    x_rsc_30__0__INST.WDATA(TLS_x_rsc_30_0_WDATA);
    x_rsc_30__0__INST.WSTRB(TLS_x_rsc_30_0_WSTRB);
    x_rsc_30__0__INST.WLAST(TLS_x_rsc_30_0_WLAST);
    x_rsc_30__0__INST.WUSER(CCS_ADAPTOR_x_rsc_30_0_WUSER);
    x_rsc_30__0__INST.WVALID(TLS_x_rsc_30_0_WVALID);
    x_rsc_30__0__INST.WREADY(TLS_x_rsc_30_0_WREADY);
    x_rsc_30__0__INST.BID(CCS_ADAPTOR_x_rsc_30_0_BID);
    x_rsc_30__0__INST.BRESP(TLS_x_rsc_30_0_BRESP);
    x_rsc_30__0__INST.BUSER(CCS_ADAPTOR_x_rsc_30_0_BUSER);
    x_rsc_30__0__INST.BVALID(TLS_x_rsc_30_0_BVALID);
    x_rsc_30__0__INST.BREADY(TLS_x_rsc_30_0_BREADY);
    x_rsc_30__0__INST.ARID(CCS_ADAPTOR_x_rsc_30_0_ARID);
    x_rsc_30__0__INST.ARADDR(TLS_x_rsc_30_0_ARADDR);
    x_rsc_30__0__INST.ARLEN(TLS_x_rsc_30_0_ARLEN);
    x_rsc_30__0__INST.ARSIZE(TLS_x_rsc_30_0_ARSIZE);
    x_rsc_30__0__INST.ARBURST(TLS_x_rsc_30_0_ARBURST);
    x_rsc_30__0__INST.ARLOCK(TLS_x_rsc_30_0_ARLOCK);
    x_rsc_30__0__INST.ARCACHE(TLS_x_rsc_30_0_ARCACHE);
    x_rsc_30__0__INST.ARPROT(TLS_x_rsc_30_0_ARPROT);
    x_rsc_30__0__INST.ARQOS(TLS_x_rsc_30_0_ARQOS);
    x_rsc_30__0__INST.ARREGION(TLS_x_rsc_30_0_ARREGION);
    x_rsc_30__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_30_0_ARUSER);
    x_rsc_30__0__INST.ARVALID(TLS_x_rsc_30_0_ARVALID);
    x_rsc_30__0__INST.ARREADY(TLS_x_rsc_30_0_ARREADY);
    x_rsc_30__0__INST.RID(CCS_ADAPTOR_x_rsc_30_0_RID);
    x_rsc_30__0__INST.RDATA(TLS_x_rsc_30_0_RDATA);
    x_rsc_30__0__INST.RRESP(TLS_x_rsc_30_0_RRESP);
    x_rsc_30__0__INST.RLAST(TLS_x_rsc_30_0_RLAST);
    x_rsc_30__0__INST.RUSER(CCS_ADAPTOR_x_rsc_30_0_RUSER);
    x_rsc_30__0__INST.RVALID(TLS_x_rsc_30_0_RVALID);
    x_rsc_30__0__INST.RREADY(TLS_x_rsc_30_0_RREADY);
    x_rsc_30__0__INST.tr_write_done(TLS_x_rsc_30_0_tr_write_done);
    x_rsc_30__0__INST.s_tdone(TLS_x_rsc_30_0_s_tdone);
    x_rsc_30__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_104)));

    CCS_ADAPTOR_TLS_x_rsc_31_0_AWID.inVECTOR(CCS_ADAPTOR_x_rsc_31_0_AWID);
    CCS_ADAPTOR_TLS_x_rsc_31_0_AWID.outSCALAR(TLS_x_rsc_31_0_AWID);

    CCS_ADAPTOR_TLS_x_rsc_31_0_AWUSER.inVECTOR(CCS_ADAPTOR_x_rsc_31_0_AWUSER);
    CCS_ADAPTOR_TLS_x_rsc_31_0_AWUSER.outSCALAR(TLS_x_rsc_31_0_AWUSER);

    CCS_ADAPTOR_TLS_x_rsc_31_0_WUSER.inVECTOR(CCS_ADAPTOR_x_rsc_31_0_WUSER);
    CCS_ADAPTOR_TLS_x_rsc_31_0_WUSER.outSCALAR(TLS_x_rsc_31_0_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BID.inSCALAR(TLS_x_rsc_31_0_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BID.outVECTOR(CCS_ADAPTOR_x_rsc_31_0_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BUSER.inSCALAR(TLS_x_rsc_31_0_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_BUSER.outVECTOR(CCS_ADAPTOR_x_rsc_31_0_BUSER);

    CCS_ADAPTOR_TLS_x_rsc_31_0_ARID.inVECTOR(CCS_ADAPTOR_x_rsc_31_0_ARID);
    CCS_ADAPTOR_TLS_x_rsc_31_0_ARID.outSCALAR(TLS_x_rsc_31_0_ARID);

    CCS_ADAPTOR_TLS_x_rsc_31_0_ARUSER.inVECTOR(CCS_ADAPTOR_x_rsc_31_0_ARUSER);
    CCS_ADAPTOR_TLS_x_rsc_31_0_ARUSER.outSCALAR(TLS_x_rsc_31_0_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RID.inSCALAR(TLS_x_rsc_31_0_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RID.outVECTOR(CCS_ADAPTOR_x_rsc_31_0_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RUSER.inSCALAR(TLS_x_rsc_31_0_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_x_rsc_31_0_RUSER.outVECTOR(CCS_ADAPTOR_x_rsc_31_0_RUSER);

    x_rsc_31__0__INST.ACLK(clk);
    x_rsc_31__0__INST.ARESETn(rst);
    x_rsc_31__0__INST.AWID(CCS_ADAPTOR_x_rsc_31_0_AWID);
    x_rsc_31__0__INST.AWADDR(TLS_x_rsc_31_0_AWADDR);
    x_rsc_31__0__INST.AWLEN(TLS_x_rsc_31_0_AWLEN);
    x_rsc_31__0__INST.AWSIZE(TLS_x_rsc_31_0_AWSIZE);
    x_rsc_31__0__INST.AWBURST(TLS_x_rsc_31_0_AWBURST);
    x_rsc_31__0__INST.AWLOCK(TLS_x_rsc_31_0_AWLOCK);
    x_rsc_31__0__INST.AWCACHE(TLS_x_rsc_31_0_AWCACHE);
    x_rsc_31__0__INST.AWPROT(TLS_x_rsc_31_0_AWPROT);
    x_rsc_31__0__INST.AWQOS(TLS_x_rsc_31_0_AWQOS);
    x_rsc_31__0__INST.AWREGION(TLS_x_rsc_31_0_AWREGION);
    x_rsc_31__0__INST.AWUSER(CCS_ADAPTOR_x_rsc_31_0_AWUSER);
    x_rsc_31__0__INST.AWVALID(TLS_x_rsc_31_0_AWVALID);
    x_rsc_31__0__INST.AWREADY(TLS_x_rsc_31_0_AWREADY);
    x_rsc_31__0__INST.WDATA(TLS_x_rsc_31_0_WDATA);
    x_rsc_31__0__INST.WSTRB(TLS_x_rsc_31_0_WSTRB);
    x_rsc_31__0__INST.WLAST(TLS_x_rsc_31_0_WLAST);
    x_rsc_31__0__INST.WUSER(CCS_ADAPTOR_x_rsc_31_0_WUSER);
    x_rsc_31__0__INST.WVALID(TLS_x_rsc_31_0_WVALID);
    x_rsc_31__0__INST.WREADY(TLS_x_rsc_31_0_WREADY);
    x_rsc_31__0__INST.BID(CCS_ADAPTOR_x_rsc_31_0_BID);
    x_rsc_31__0__INST.BRESP(TLS_x_rsc_31_0_BRESP);
    x_rsc_31__0__INST.BUSER(CCS_ADAPTOR_x_rsc_31_0_BUSER);
    x_rsc_31__0__INST.BVALID(TLS_x_rsc_31_0_BVALID);
    x_rsc_31__0__INST.BREADY(TLS_x_rsc_31_0_BREADY);
    x_rsc_31__0__INST.ARID(CCS_ADAPTOR_x_rsc_31_0_ARID);
    x_rsc_31__0__INST.ARADDR(TLS_x_rsc_31_0_ARADDR);
    x_rsc_31__0__INST.ARLEN(TLS_x_rsc_31_0_ARLEN);
    x_rsc_31__0__INST.ARSIZE(TLS_x_rsc_31_0_ARSIZE);
    x_rsc_31__0__INST.ARBURST(TLS_x_rsc_31_0_ARBURST);
    x_rsc_31__0__INST.ARLOCK(TLS_x_rsc_31_0_ARLOCK);
    x_rsc_31__0__INST.ARCACHE(TLS_x_rsc_31_0_ARCACHE);
    x_rsc_31__0__INST.ARPROT(TLS_x_rsc_31_0_ARPROT);
    x_rsc_31__0__INST.ARQOS(TLS_x_rsc_31_0_ARQOS);
    x_rsc_31__0__INST.ARREGION(TLS_x_rsc_31_0_ARREGION);
    x_rsc_31__0__INST.ARUSER(CCS_ADAPTOR_x_rsc_31_0_ARUSER);
    x_rsc_31__0__INST.ARVALID(TLS_x_rsc_31_0_ARVALID);
    x_rsc_31__0__INST.ARREADY(TLS_x_rsc_31_0_ARREADY);
    x_rsc_31__0__INST.RID(CCS_ADAPTOR_x_rsc_31_0_RID);
    x_rsc_31__0__INST.RDATA(TLS_x_rsc_31_0_RDATA);
    x_rsc_31__0__INST.RRESP(TLS_x_rsc_31_0_RRESP);
    x_rsc_31__0__INST.RLAST(TLS_x_rsc_31_0_RLAST);
    x_rsc_31__0__INST.RUSER(CCS_ADAPTOR_x_rsc_31_0_RUSER);
    x_rsc_31__0__INST.RVALID(TLS_x_rsc_31_0_RVALID);
    x_rsc_31__0__INST.RREADY(TLS_x_rsc_31_0_RREADY);
    x_rsc_31__0__INST.tr_write_done(TLS_x_rsc_31_0_tr_write_done);
    x_rsc_31__0__INST.s_tdone(TLS_x_rsc_31_0_s_tdone);
    x_rsc_31__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_105)));

    m_rsc_INST.dat(TLS_m_rsc_dat);
    m_rsc_INST.clk(clk);
    m_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    twiddle_rsc_INST.qb(TLS_twiddle_rsc_qb);
    twiddle_rsc_INST.adrb(TLS_twiddle_rsc_adrb);
    twiddle_rsc_INST.clk(clk);
    twiddle_rsc_INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_INST.adra(TLS_twiddle_rsc_adra);
    twiddle_rsc_INST.da(TLS_twiddle_rsc_da);
    twiddle_rsc_INST.qa(TLS_twiddle_rsc_qa);
    twiddle_rsc_INST.wea(TLS_twiddle_rsc_wea);
    twiddle_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    twiddle_h_rsc_INST.qb(TLS_twiddle_h_rsc_qb);
    twiddle_h_rsc_INST.adrb(TLS_twiddle_h_rsc_adrb);
    twiddle_h_rsc_INST.clk(clk);
    twiddle_h_rsc_INST.clken(SIG_SC_LOGIC_1);
    twiddle_h_rsc_INST.adra(TLS_twiddle_h_rsc_adra);
    twiddle_h_rsc_INST.da(TLS_twiddle_h_rsc_da);
    twiddle_h_rsc_INST.qa(TLS_twiddle_h_rsc_qa);
    twiddle_h_rsc_INST.wea(TLS_twiddle_h_rsc_wea);
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

    trios_monitor_x_rsc_triosy_0_0_lz_INST.trios(TLS_x_rsc_triosy_0_0_lz);
    trios_monitor_x_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_1_0_lz_INST.trios(TLS_x_rsc_triosy_1_0_lz);
    trios_monitor_x_rsc_triosy_1_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_2_0_lz_INST.trios(TLS_x_rsc_triosy_2_0_lz);
    trios_monitor_x_rsc_triosy_2_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_3_0_lz_INST.trios(TLS_x_rsc_triosy_3_0_lz);
    trios_monitor_x_rsc_triosy_3_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_4_0_lz_INST.trios(TLS_x_rsc_triosy_4_0_lz);
    trios_monitor_x_rsc_triosy_4_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_5_0_lz_INST.trios(TLS_x_rsc_triosy_5_0_lz);
    trios_monitor_x_rsc_triosy_5_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_6_0_lz_INST.trios(TLS_x_rsc_triosy_6_0_lz);
    trios_monitor_x_rsc_triosy_6_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_7_0_lz_INST.trios(TLS_x_rsc_triosy_7_0_lz);
    trios_monitor_x_rsc_triosy_7_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_8_0_lz_INST.trios(TLS_x_rsc_triosy_8_0_lz);
    trios_monitor_x_rsc_triosy_8_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_9_0_lz_INST.trios(TLS_x_rsc_triosy_9_0_lz);
    trios_monitor_x_rsc_triosy_9_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_10_0_lz_INST.trios(TLS_x_rsc_triosy_10_0_lz);
    trios_monitor_x_rsc_triosy_10_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_11_0_lz_INST.trios(TLS_x_rsc_triosy_11_0_lz);
    trios_monitor_x_rsc_triosy_11_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_12_0_lz_INST.trios(TLS_x_rsc_triosy_12_0_lz);
    trios_monitor_x_rsc_triosy_12_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_13_0_lz_INST.trios(TLS_x_rsc_triosy_13_0_lz);
    trios_monitor_x_rsc_triosy_13_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_14_0_lz_INST.trios(TLS_x_rsc_triosy_14_0_lz);
    trios_monitor_x_rsc_triosy_14_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_15_0_lz_INST.trios(TLS_x_rsc_triosy_15_0_lz);
    trios_monitor_x_rsc_triosy_15_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_16_0_lz_INST.trios(TLS_x_rsc_triosy_16_0_lz);
    trios_monitor_x_rsc_triosy_16_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_17_0_lz_INST.trios(TLS_x_rsc_triosy_17_0_lz);
    trios_monitor_x_rsc_triosy_17_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_18_0_lz_INST.trios(TLS_x_rsc_triosy_18_0_lz);
    trios_monitor_x_rsc_triosy_18_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_19_0_lz_INST.trios(TLS_x_rsc_triosy_19_0_lz);
    trios_monitor_x_rsc_triosy_19_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_20_0_lz_INST.trios(TLS_x_rsc_triosy_20_0_lz);
    trios_monitor_x_rsc_triosy_20_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_21_0_lz_INST.trios(TLS_x_rsc_triosy_21_0_lz);
    trios_monitor_x_rsc_triosy_21_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_22_0_lz_INST.trios(TLS_x_rsc_triosy_22_0_lz);
    trios_monitor_x_rsc_triosy_22_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_23_0_lz_INST.trios(TLS_x_rsc_triosy_23_0_lz);
    trios_monitor_x_rsc_triosy_23_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_24_0_lz_INST.trios(TLS_x_rsc_triosy_24_0_lz);
    trios_monitor_x_rsc_triosy_24_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_25_0_lz_INST.trios(TLS_x_rsc_triosy_25_0_lz);
    trios_monitor_x_rsc_triosy_25_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_26_0_lz_INST.trios(TLS_x_rsc_triosy_26_0_lz);
    trios_monitor_x_rsc_triosy_26_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_27_0_lz_INST.trios(TLS_x_rsc_triosy_27_0_lz);
    trios_monitor_x_rsc_triosy_27_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_28_0_lz_INST.trios(TLS_x_rsc_triosy_28_0_lz);
    trios_monitor_x_rsc_triosy_28_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_29_0_lz_INST.trios(TLS_x_rsc_triosy_29_0_lz);
    trios_monitor_x_rsc_triosy_29_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_30_0_lz_INST.trios(TLS_x_rsc_triosy_30_0_lz);
    trios_monitor_x_rsc_triosy_30_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_x_rsc_triosy_31_0_lz_INST.trios(TLS_x_rsc_triosy_31_0_lz);
    trios_monitor_x_rsc_triosy_31_0_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_x.in_fifo(TLS_in_fifo_x);
    transactor_x.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_x);
    transactor_x.out_fifo(TLS_out_fifo_x);
    transactor_x.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_x);
    transactor_x.bind_clk(clk, true, rst);
    transactor_x.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_x.register_block(&x_rsc_0__0__INST, x_rsc_0__0__INST.basename(), TLS_x_rsc_triosy_0_0_lz, 0, 31,
        1);
    transactor_x.register_block(&x_rsc_1__0__INST, x_rsc_1__0__INST.basename(), TLS_x_rsc_triosy_1_0_lz, 32, 63,
        1);
    transactor_x.register_block(&x_rsc_2__0__INST, x_rsc_2__0__INST.basename(), TLS_x_rsc_triosy_2_0_lz, 64, 95,
        1);
    transactor_x.register_block(&x_rsc_3__0__INST, x_rsc_3__0__INST.basename(), TLS_x_rsc_triosy_3_0_lz, 96, 127,
        1);
    transactor_x.register_block(&x_rsc_4__0__INST, x_rsc_4__0__INST.basename(), TLS_x_rsc_triosy_4_0_lz, 128, 159,
        1);
    transactor_x.register_block(&x_rsc_5__0__INST, x_rsc_5__0__INST.basename(), TLS_x_rsc_triosy_5_0_lz, 160, 191,
        1);
    transactor_x.register_block(&x_rsc_6__0__INST, x_rsc_6__0__INST.basename(), TLS_x_rsc_triosy_6_0_lz, 192, 223,
        1);
    transactor_x.register_block(&x_rsc_7__0__INST, x_rsc_7__0__INST.basename(), TLS_x_rsc_triosy_7_0_lz, 224, 255,
        1);
    transactor_x.register_block(&x_rsc_8__0__INST, x_rsc_8__0__INST.basename(), TLS_x_rsc_triosy_8_0_lz, 256, 287,
        1);
    transactor_x.register_block(&x_rsc_9__0__INST, x_rsc_9__0__INST.basename(), TLS_x_rsc_triosy_9_0_lz, 288, 319,
        1);
    transactor_x.register_block(&x_rsc_10__0__INST, x_rsc_10__0__INST.basename(), TLS_x_rsc_triosy_10_0_lz, 320,
        351, 1);
    transactor_x.register_block(&x_rsc_11__0__INST, x_rsc_11__0__INST.basename(), TLS_x_rsc_triosy_11_0_lz, 352,
        383, 1);
    transactor_x.register_block(&x_rsc_12__0__INST, x_rsc_12__0__INST.basename(), TLS_x_rsc_triosy_12_0_lz, 384,
        415, 1);
    transactor_x.register_block(&x_rsc_13__0__INST, x_rsc_13__0__INST.basename(), TLS_x_rsc_triosy_13_0_lz, 416,
        447, 1);
    transactor_x.register_block(&x_rsc_14__0__INST, x_rsc_14__0__INST.basename(), TLS_x_rsc_triosy_14_0_lz, 448,
        479, 1);
    transactor_x.register_block(&x_rsc_15__0__INST, x_rsc_15__0__INST.basename(), TLS_x_rsc_triosy_15_0_lz, 480,
        511, 1);
    transactor_x.register_block(&x_rsc_16__0__INST, x_rsc_16__0__INST.basename(), TLS_x_rsc_triosy_16_0_lz, 512,
        543, 1);
    transactor_x.register_block(&x_rsc_17__0__INST, x_rsc_17__0__INST.basename(), TLS_x_rsc_triosy_17_0_lz, 544,
        575, 1);
    transactor_x.register_block(&x_rsc_18__0__INST, x_rsc_18__0__INST.basename(), TLS_x_rsc_triosy_18_0_lz, 576,
        607, 1);
    transactor_x.register_block(&x_rsc_19__0__INST, x_rsc_19__0__INST.basename(), TLS_x_rsc_triosy_19_0_lz, 608,
        639, 1);
    transactor_x.register_block(&x_rsc_20__0__INST, x_rsc_20__0__INST.basename(), TLS_x_rsc_triosy_20_0_lz, 640,
        671, 1);
    transactor_x.register_block(&x_rsc_21__0__INST, x_rsc_21__0__INST.basename(), TLS_x_rsc_triosy_21_0_lz, 672,
        703, 1);
    transactor_x.register_block(&x_rsc_22__0__INST, x_rsc_22__0__INST.basename(), TLS_x_rsc_triosy_22_0_lz, 704,
        735, 1);
    transactor_x.register_block(&x_rsc_23__0__INST, x_rsc_23__0__INST.basename(), TLS_x_rsc_triosy_23_0_lz, 736,
        767, 1);
    transactor_x.register_block(&x_rsc_24__0__INST, x_rsc_24__0__INST.basename(), TLS_x_rsc_triosy_24_0_lz, 768,
        799, 1);
    transactor_x.register_block(&x_rsc_25__0__INST, x_rsc_25__0__INST.basename(), TLS_x_rsc_triosy_25_0_lz, 800,
        831, 1);
    transactor_x.register_block(&x_rsc_26__0__INST, x_rsc_26__0__INST.basename(), TLS_x_rsc_triosy_26_0_lz, 832,
        863, 1);
    transactor_x.register_block(&x_rsc_27__0__INST, x_rsc_27__0__INST.basename(), TLS_x_rsc_triosy_27_0_lz, 864,
        895, 1);
    transactor_x.register_block(&x_rsc_28__0__INST, x_rsc_28__0__INST.basename(), TLS_x_rsc_triosy_28_0_lz, 896,
        927, 1);
    transactor_x.register_block(&x_rsc_29__0__INST, x_rsc_29__0__INST.basename(), TLS_x_rsc_triosy_29_0_lz, 928,
        959, 1);
    transactor_x.register_block(&x_rsc_30__0__INST, x_rsc_30__0__INST.basename(), TLS_x_rsc_triosy_30_0_lz, 960,
        991, 1);
    transactor_x.register_block(&x_rsc_31__0__INST, x_rsc_31__0__INST.basename(), TLS_x_rsc_triosy_31_0_lz, 992,
        1023, 1);

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
  x_rsc_0__0__INST.clear();
  x_rsc_1__0__INST.clear();
  x_rsc_2__0__INST.clear();
  x_rsc_3__0__INST.clear();
  x_rsc_4__0__INST.clear();
  x_rsc_5__0__INST.clear();
  x_rsc_6__0__INST.clear();
  x_rsc_7__0__INST.clear();
  x_rsc_8__0__INST.clear();
  x_rsc_9__0__INST.clear();
  x_rsc_10__0__INST.clear();
  x_rsc_11__0__INST.clear();
  x_rsc_12__0__INST.clear();
  x_rsc_13__0__INST.clear();
  x_rsc_14__0__INST.clear();
  x_rsc_15__0__INST.clear();
  x_rsc_16__0__INST.clear();
  x_rsc_17__0__INST.clear();
  x_rsc_18__0__INST.clear();
  x_rsc_19__0__INST.clear();
  x_rsc_20__0__INST.clear();
  x_rsc_21__0__INST.clear();
  x_rsc_22__0__INST.clear();
  x_rsc_23__0__INST.clear();
  x_rsc_24__0__INST.clear();
  x_rsc_25__0__INST.clear();
  x_rsc_26__0__INST.clear();
  x_rsc_27__0__INST.clear();
  x_rsc_28__0__INST.clear();
  x_rsc_29__0__INST.clear();
  x_rsc_30__0__INST.clear();
  x_rsc_31__0__INST.clear();
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
    generate_reset_event.notify(110.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(110.000000 , SC_NS);
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
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_0_0_i_inst/hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst/x_rsc_0_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_0_0_i_inst/hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst/x_rsc_0_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_0_0_i_inst/hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst/x_rsc_0_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst_x_rsc_0_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_0_0_i_inst/hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_ctrl_inst/x_rsc_0_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_dp_inst_x_rsc_0_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_0_0_i_inst/hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_dp_inst/x_rsc_0_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_0_0_i_inst_hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_dp_inst_x_rsc_0_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_0_0_i_inst/hybrid_core_x_rsc_0_0_i_x_rsc_0_0_wait_dp_inst/x_rsc_0_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_1_0_i_inst/hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst/x_rsc_1_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_1_0_i_inst/hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst/x_rsc_1_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_1_0_i_inst/hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst/x_rsc_1_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst_x_rsc_1_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_1_0_i_inst/hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_ctrl_inst/x_rsc_1_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_dp_inst_x_rsc_1_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_1_0_i_inst/hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_dp_inst/x_rsc_1_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_1_0_i_inst_hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_dp_inst_x_rsc_1_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_1_0_i_inst/hybrid_core_x_rsc_1_0_i_x_rsc_1_0_wait_dp_inst/x_rsc_1_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_2_0_i_inst/hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst/x_rsc_2_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_2_0_i_inst/hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst/x_rsc_2_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_2_0_i_inst/hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst/x_rsc_2_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst_x_rsc_2_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_2_0_i_inst/hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_ctrl_inst/x_rsc_2_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_dp_inst_x_rsc_2_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_2_0_i_inst/hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_dp_inst/x_rsc_2_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_2_0_i_inst_hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_dp_inst_x_rsc_2_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_2_0_i_inst/hybrid_core_x_rsc_2_0_i_x_rsc_2_0_wait_dp_inst/x_rsc_2_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_3_0_i_inst/hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst/x_rsc_3_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_3_0_i_inst/hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst/x_rsc_3_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_3_0_i_inst/hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst/x_rsc_3_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst_x_rsc_3_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_3_0_i_inst/hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_ctrl_inst/x_rsc_3_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_dp_inst_x_rsc_3_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_3_0_i_inst/hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_dp_inst/x_rsc_3_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_3_0_i_inst_hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_dp_inst_x_rsc_3_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_3_0_i_inst/hybrid_core_x_rsc_3_0_i_x_rsc_3_0_wait_dp_inst/x_rsc_3_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_4_0_i_inst/hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst/x_rsc_4_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_4_0_i_inst/hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst/x_rsc_4_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_4_0_i_inst/hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst/x_rsc_4_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst_x_rsc_4_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_4_0_i_inst/hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_ctrl_inst/x_rsc_4_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_dp_inst_x_rsc_4_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_4_0_i_inst/hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_dp_inst/x_rsc_4_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_4_0_i_inst_hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_dp_inst_x_rsc_4_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_4_0_i_inst/hybrid_core_x_rsc_4_0_i_x_rsc_4_0_wait_dp_inst/x_rsc_4_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_5_0_i_inst/hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst/x_rsc_5_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_5_0_i_inst/hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst/x_rsc_5_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_5_0_i_inst/hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst/x_rsc_5_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst_x_rsc_5_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_5_0_i_inst/hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_ctrl_inst/x_rsc_5_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_dp_inst_x_rsc_5_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_5_0_i_inst/hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_dp_inst/x_rsc_5_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_5_0_i_inst_hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_dp_inst_x_rsc_5_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_5_0_i_inst/hybrid_core_x_rsc_5_0_i_x_rsc_5_0_wait_dp_inst/x_rsc_5_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_6_0_i_inst/hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst/x_rsc_6_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_6_0_i_inst/hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst/x_rsc_6_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_6_0_i_inst/hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst/x_rsc_6_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst_x_rsc_6_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_6_0_i_inst/hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_ctrl_inst/x_rsc_6_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_dp_inst_x_rsc_6_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_6_0_i_inst/hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_dp_inst/x_rsc_6_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_6_0_i_inst_hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_dp_inst_x_rsc_6_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_6_0_i_inst/hybrid_core_x_rsc_6_0_i_x_rsc_6_0_wait_dp_inst/x_rsc_6_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_7_0_i_inst/hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst/x_rsc_7_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_7_0_i_inst/hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst/x_rsc_7_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_7_0_i_inst/hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst/x_rsc_7_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst_x_rsc_7_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_7_0_i_inst/hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_ctrl_inst/x_rsc_7_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_dp_inst_x_rsc_7_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_7_0_i_inst/hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_dp_inst/x_rsc_7_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_7_0_i_inst_hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_dp_inst_x_rsc_7_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_7_0_i_inst/hybrid_core_x_rsc_7_0_i_x_rsc_7_0_wait_dp_inst/x_rsc_7_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_8_0_i_inst/hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst/x_rsc_8_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_8_0_i_inst/hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst/x_rsc_8_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_8_0_i_inst/hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst/x_rsc_8_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst_x_rsc_8_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_8_0_i_inst/hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_ctrl_inst/x_rsc_8_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_dp_inst_x_rsc_8_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_8_0_i_inst/hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_dp_inst/x_rsc_8_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_8_0_i_inst_hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_dp_inst_x_rsc_8_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_8_0_i_inst/hybrid_core_x_rsc_8_0_i_x_rsc_8_0_wait_dp_inst/x_rsc_8_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_9_0_i_inst/hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst/x_rsc_9_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_9_0_i_inst/hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst/x_rsc_9_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_9_0_i_inst/hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst/x_rsc_9_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst_x_rsc_9_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_9_0_i_inst/hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_ctrl_inst/x_rsc_9_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_dp_inst_x_rsc_9_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_9_0_i_inst/hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_dp_inst/x_rsc_9_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_9_0_i_inst_hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_dp_inst_x_rsc_9_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_9_0_i_inst/hybrid_core_x_rsc_9_0_i_x_rsc_9_0_wait_dp_inst/x_rsc_9_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_10_0_i_inst/hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst/x_rsc_10_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_10_0_i_inst/hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst/x_rsc_10_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_10_0_i_inst/hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst/x_rsc_10_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst_x_rsc_10_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_10_0_i_inst/hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_ctrl_inst/x_rsc_10_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_dp_inst_x_rsc_10_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_10_0_i_inst/hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_dp_inst/x_rsc_10_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_10_0_i_inst_hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_dp_inst_x_rsc_10_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_10_0_i_inst/hybrid_core_x_rsc_10_0_i_x_rsc_10_0_wait_dp_inst/x_rsc_10_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_11_0_i_inst/hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst/x_rsc_11_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_11_0_i_inst/hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst/x_rsc_11_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_11_0_i_inst/hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst/x_rsc_11_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst_x_rsc_11_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_11_0_i_inst/hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_ctrl_inst/x_rsc_11_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_dp_inst_x_rsc_11_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_11_0_i_inst/hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_dp_inst/x_rsc_11_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_11_0_i_inst_hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_dp_inst_x_rsc_11_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_11_0_i_inst/hybrid_core_x_rsc_11_0_i_x_rsc_11_0_wait_dp_inst/x_rsc_11_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_12_0_i_inst/hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst/x_rsc_12_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_12_0_i_inst/hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst/x_rsc_12_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_12_0_i_inst/hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst/x_rsc_12_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst_x_rsc_12_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_12_0_i_inst/hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_ctrl_inst/x_rsc_12_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_dp_inst_x_rsc_12_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_12_0_i_inst/hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_dp_inst/x_rsc_12_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_12_0_i_inst_hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_dp_inst_x_rsc_12_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_12_0_i_inst/hybrid_core_x_rsc_12_0_i_x_rsc_12_0_wait_dp_inst/x_rsc_12_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_13_0_i_inst/hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst/x_rsc_13_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_13_0_i_inst/hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst/x_rsc_13_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_13_0_i_inst/hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst/x_rsc_13_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst_x_rsc_13_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_13_0_i_inst/hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_ctrl_inst/x_rsc_13_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_dp_inst_x_rsc_13_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_13_0_i_inst/hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_dp_inst/x_rsc_13_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_13_0_i_inst_hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_dp_inst_x_rsc_13_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_13_0_i_inst/hybrid_core_x_rsc_13_0_i_x_rsc_13_0_wait_dp_inst/x_rsc_13_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_14_0_i_inst/hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst/x_rsc_14_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_14_0_i_inst/hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst/x_rsc_14_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_14_0_i_inst/hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst/x_rsc_14_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst_x_rsc_14_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_14_0_i_inst/hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_ctrl_inst/x_rsc_14_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_dp_inst_x_rsc_14_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_14_0_i_inst/hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_dp_inst/x_rsc_14_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_14_0_i_inst_hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_dp_inst_x_rsc_14_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_14_0_i_inst/hybrid_core_x_rsc_14_0_i_x_rsc_14_0_wait_dp_inst/x_rsc_14_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_15_0_i_inst/hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst/x_rsc_15_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_15_0_i_inst/hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst/x_rsc_15_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_15_0_i_inst/hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst/x_rsc_15_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst_x_rsc_15_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_15_0_i_inst/hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_ctrl_inst/x_rsc_15_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_dp_inst_x_rsc_15_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_15_0_i_inst/hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_dp_inst/x_rsc_15_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_15_0_i_inst_hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_dp_inst_x_rsc_15_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_15_0_i_inst/hybrid_core_x_rsc_15_0_i_x_rsc_15_0_wait_dp_inst/x_rsc_15_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_16_0_i_inst/hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst/x_rsc_16_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_16_0_i_inst/hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst/x_rsc_16_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_16_0_i_inst/hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst/x_rsc_16_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst_x_rsc_16_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_16_0_i_inst/hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_ctrl_inst/x_rsc_16_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_dp_inst_x_rsc_16_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_16_0_i_inst/hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_dp_inst/x_rsc_16_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_16_0_i_inst_hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_dp_inst_x_rsc_16_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_16_0_i_inst/hybrid_core_x_rsc_16_0_i_x_rsc_16_0_wait_dp_inst/x_rsc_16_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_17_0_i_inst/hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst/x_rsc_17_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_17_0_i_inst/hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst/x_rsc_17_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_17_0_i_inst/hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst/x_rsc_17_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst_x_rsc_17_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_17_0_i_inst/hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_ctrl_inst/x_rsc_17_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_dp_inst_x_rsc_17_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_17_0_i_inst/hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_dp_inst/x_rsc_17_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_17_0_i_inst_hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_dp_inst_x_rsc_17_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_17_0_i_inst/hybrid_core_x_rsc_17_0_i_x_rsc_17_0_wait_dp_inst/x_rsc_17_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_18_0_i_inst/hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst/x_rsc_18_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_18_0_i_inst/hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst/x_rsc_18_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_18_0_i_inst/hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst/x_rsc_18_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst_x_rsc_18_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_18_0_i_inst/hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_ctrl_inst/x_rsc_18_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_dp_inst_x_rsc_18_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_18_0_i_inst/hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_dp_inst/x_rsc_18_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_18_0_i_inst_hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_dp_inst_x_rsc_18_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_18_0_i_inst/hybrid_core_x_rsc_18_0_i_x_rsc_18_0_wait_dp_inst/x_rsc_18_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_19_0_i_inst/hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst/x_rsc_19_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_19_0_i_inst/hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst/x_rsc_19_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_19_0_i_inst/hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst/x_rsc_19_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst_x_rsc_19_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_19_0_i_inst/hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_ctrl_inst/x_rsc_19_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_dp_inst_x_rsc_19_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_19_0_i_inst/hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_dp_inst/x_rsc_19_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_19_0_i_inst_hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_dp_inst_x_rsc_19_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_19_0_i_inst/hybrid_core_x_rsc_19_0_i_x_rsc_19_0_wait_dp_inst/x_rsc_19_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_20_0_i_inst/hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst/x_rsc_20_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_20_0_i_inst/hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst/x_rsc_20_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_20_0_i_inst/hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst/x_rsc_20_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst_x_rsc_20_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_20_0_i_inst/hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_ctrl_inst/x_rsc_20_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_dp_inst_x_rsc_20_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_20_0_i_inst/hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_dp_inst/x_rsc_20_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_20_0_i_inst_hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_dp_inst_x_rsc_20_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_20_0_i_inst/hybrid_core_x_rsc_20_0_i_x_rsc_20_0_wait_dp_inst/x_rsc_20_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_21_0_i_inst/hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst/x_rsc_21_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_21_0_i_inst/hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst/x_rsc_21_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_21_0_i_inst/hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst/x_rsc_21_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst_x_rsc_21_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_21_0_i_inst/hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_ctrl_inst/x_rsc_21_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_dp_inst_x_rsc_21_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_21_0_i_inst/hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_dp_inst/x_rsc_21_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_21_0_i_inst_hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_dp_inst_x_rsc_21_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_21_0_i_inst/hybrid_core_x_rsc_21_0_i_x_rsc_21_0_wait_dp_inst/x_rsc_21_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_22_0_i_inst/hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst/x_rsc_22_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_22_0_i_inst/hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst/x_rsc_22_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_22_0_i_inst/hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst/x_rsc_22_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst_x_rsc_22_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_22_0_i_inst/hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_ctrl_inst/x_rsc_22_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_dp_inst_x_rsc_22_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_22_0_i_inst/hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_dp_inst/x_rsc_22_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_22_0_i_inst_hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_dp_inst_x_rsc_22_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_22_0_i_inst/hybrid_core_x_rsc_22_0_i_x_rsc_22_0_wait_dp_inst/x_rsc_22_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_23_0_i_inst/hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst/x_rsc_23_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_23_0_i_inst/hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst/x_rsc_23_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_23_0_i_inst/hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst/x_rsc_23_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst_x_rsc_23_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_23_0_i_inst/hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_ctrl_inst/x_rsc_23_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_dp_inst_x_rsc_23_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_23_0_i_inst/hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_dp_inst/x_rsc_23_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_23_0_i_inst_hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_dp_inst_x_rsc_23_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_23_0_i_inst/hybrid_core_x_rsc_23_0_i_x_rsc_23_0_wait_dp_inst/x_rsc_23_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_24_0_i_inst/hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst/x_rsc_24_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_24_0_i_inst/hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst/x_rsc_24_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_24_0_i_inst/hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst/x_rsc_24_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst_x_rsc_24_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_24_0_i_inst/hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_ctrl_inst/x_rsc_24_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_dp_inst_x_rsc_24_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_24_0_i_inst/hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_dp_inst/x_rsc_24_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_24_0_i_inst_hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_dp_inst_x_rsc_24_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_24_0_i_inst/hybrid_core_x_rsc_24_0_i_x_rsc_24_0_wait_dp_inst/x_rsc_24_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_25_0_i_inst/hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst/x_rsc_25_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_25_0_i_inst/hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst/x_rsc_25_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_25_0_i_inst/hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst/x_rsc_25_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst_x_rsc_25_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_25_0_i_inst/hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_ctrl_inst/x_rsc_25_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_dp_inst_x_rsc_25_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_25_0_i_inst/hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_dp_inst/x_rsc_25_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_25_0_i_inst_hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_dp_inst_x_rsc_25_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_25_0_i_inst/hybrid_core_x_rsc_25_0_i_x_rsc_25_0_wait_dp_inst/x_rsc_25_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_26_0_i_inst/hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst/x_rsc_26_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_26_0_i_inst/hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst/x_rsc_26_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_26_0_i_inst/hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst/x_rsc_26_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst_x_rsc_26_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_26_0_i_inst/hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_ctrl_inst/x_rsc_26_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_dp_inst_x_rsc_26_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_26_0_i_inst/hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_dp_inst/x_rsc_26_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_26_0_i_inst_hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_dp_inst_x_rsc_26_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_26_0_i_inst/hybrid_core_x_rsc_26_0_i_x_rsc_26_0_wait_dp_inst/x_rsc_26_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_27_0_i_inst/hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst/x_rsc_27_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_27_0_i_inst/hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst/x_rsc_27_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_27_0_i_inst/hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst/x_rsc_27_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst_x_rsc_27_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_27_0_i_inst/hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_ctrl_inst/x_rsc_27_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_dp_inst_x_rsc_27_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_27_0_i_inst/hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_dp_inst/x_rsc_27_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_27_0_i_inst_hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_dp_inst_x_rsc_27_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_27_0_i_inst/hybrid_core_x_rsc_27_0_i_x_rsc_27_0_wait_dp_inst/x_rsc_27_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_28_0_i_inst/hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst/x_rsc_28_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_28_0_i_inst/hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst/x_rsc_28_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_28_0_i_inst/hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst/x_rsc_28_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst_x_rsc_28_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_28_0_i_inst/hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_ctrl_inst/x_rsc_28_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_dp_inst_x_rsc_28_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_28_0_i_inst/hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_dp_inst/x_rsc_28_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_28_0_i_inst_hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_dp_inst_x_rsc_28_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_28_0_i_inst/hybrid_core_x_rsc_28_0_i_x_rsc_28_0_wait_dp_inst/x_rsc_28_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_29_0_i_inst/hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst/x_rsc_29_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_29_0_i_inst/hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst/x_rsc_29_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_29_0_i_inst/hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst/x_rsc_29_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst_x_rsc_29_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_29_0_i_inst/hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_ctrl_inst/x_rsc_29_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_dp_inst_x_rsc_29_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_29_0_i_inst/hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_dp_inst/x_rsc_29_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_29_0_i_inst_hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_dp_inst_x_rsc_29_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_29_0_i_inst/hybrid_core_x_rsc_29_0_i_x_rsc_29_0_wait_dp_inst/x_rsc_29_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_30_0_i_inst/hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst/x_rsc_30_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_30_0_i_inst/hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst/x_rsc_30_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_30_0_i_inst/hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst/x_rsc_30_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst_x_rsc_30_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_30_0_i_inst/hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_ctrl_inst/x_rsc_30_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_dp_inst_x_rsc_30_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_30_0_i_inst/hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_dp_inst/x_rsc_30_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_30_0_i_inst_hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_dp_inst_x_rsc_30_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_30_0_i_inst/hybrid_core_x_rsc_30_0_i_x_rsc_30_0_wait_dp_inst/x_rsc_30_0_i_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_re_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_31_0_i_inst/hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst/x_rsc_31_0_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_we_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_31_0_i_inst/hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst/x_rsc_31_0_i_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_rrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_31_0_i_inst/hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst/x_rsc_31_0_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst_x_rsc_31_0_i_s_wrdy,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_31_0_i_inst/hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_ctrl_inst/x_rsc_31_0_i_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_dp_inst_x_rsc_31_0_i_s_raddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_31_0_i_inst/hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_dp_inst/x_rsc_31_0_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_hybrid_core_inst_hybrid_core_x_rsc_31_0_i_inst_hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_dp_inst_x_rsc_31_0_i_s_waddr_core_sct,
      /scverify_top/rtl/hybrid_core_inst/hybrid_core_x_rsc_31_0_i_inst/hybrid_core_x_rsc_31_0_i_x_rsc_31_0_wait_dp_inst/x_rsc_31_0_i_s_waddr_core_sct);
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
