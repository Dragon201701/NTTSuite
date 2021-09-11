#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_lite_slave_direct_trans_rsc.h"
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_lite_slave_sync_trans_rsc.h"
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_slave_mem_trans_rsc.h"
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
#define TOP_HDL_ENTITY inPlaceNTT_DIF_precomp
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_12;
extern double __scv_hold_time_RSCID_13;
extern double __scv_hold_time_RSCID_14;
extern double __scv_hold_time_RSCID_15;
extern double __scv_hold_time_RSCID_16;
extern double __scv_hold_time_RSCID_17;
extern double __scv_hold_time_RSCID_18;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_12 = 0;
double __scv_hold_time_RSCID_13 = 0;
double __scv_hold_time_RSCID_14 = 0;
double __scv_hold_time_RSCID_15 = 0;
double __scv_hold_time_RSCID_16 = 0;
double __scv_hold_time_RSCID_17 = 0;
double __scv_hold_time_RSCID_18 = 0;
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
  sc_signal<sc_logic>                                                          TLS_run_rsc_triosy;
  sc_signal<sc_logic>                                                          TLS_run_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_run_rsc_RVALID;
  sc_signal<sc_lv<2> >                                                         TLS_run_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_run_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_run_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_run_rsc_ARVALID;
  sc_signal<sc_lv<12> >                                                        TLS_run_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_run_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_run_rsc_BVALID;
  sc_signal<sc_lv<2> >                                                         TLS_run_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_run_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_run_rsc_WVALID;
  sc_signal<sc_lv<4> >                                                         TLS_run_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_run_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_run_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_run_rsc_AWVALID;
  sc_signal<sc_lv<12> >                                                        TLS_run_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_vec_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_vec_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_ARVALID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                         TLS_vec_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_ARCACHE;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_vec_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                         TLS_vec_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_ARLEN;
  sc_signal<sc_lv<12> >                                                        TLS_vec_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_ARID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_BVALID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                         TLS_vec_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_BID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_WVALID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_WUSER;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_vec_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_AWVALID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                         TLS_vec_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_AWCACHE;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                         TLS_vec_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                         TLS_vec_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_AWLEN;
  sc_signal<sc_lv<12> >                                                        TLS_vec_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_AWID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_p_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_p_rsc_RVALID;
  sc_signal<sc_lv<2> >                                                         TLS_p_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_p_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_p_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_p_rsc_ARVALID;
  sc_signal<sc_lv<12> >                                                        TLS_p_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_p_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_p_rsc_BVALID;
  sc_signal<sc_lv<2> >                                                         TLS_p_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_p_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_p_rsc_WVALID;
  sc_signal<sc_lv<4> >                                                         TLS_p_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_p_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_p_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_p_rsc_AWVALID;
  sc_signal<sc_lv<12> >                                                        TLS_p_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_r_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_r_rsc_RVALID;
  sc_signal<sc_lv<2> >                                                         TLS_r_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_r_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_r_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_r_rsc_ARVALID;
  sc_signal<sc_lv<12> >                                                        TLS_r_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_r_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_r_rsc_BVALID;
  sc_signal<sc_lv<2> >                                                         TLS_r_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_r_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_r_rsc_WVALID;
  sc_signal<sc_lv<4> >                                                         TLS_r_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_r_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_r_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_r_rsc_AWVALID;
  sc_signal<sc_lv<12> >                                                        TLS_r_rsc_AWADDR;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
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
  sc_signal<sc_logic>                                                          TLS_complete_rsc_triosy;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_RVALID;
  sc_signal<sc_lv<2> >                                                         TLS_complete_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                        TLS_complete_rsc_RDATA;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_ARREADY;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_ARVALID;
  sc_signal<sc_lv<12> >                                                        TLS_complete_rsc_ARADDR;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_BREADY;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_BVALID;
  sc_signal<sc_lv<2> >                                                         TLS_complete_rsc_BRESP;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_WREADY;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_WVALID;
  sc_signal<sc_lv<4> >                                                         TLS_complete_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                        TLS_complete_rsc_WDATA;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_AWREADY;
  sc_signal<sc_logic>                                                          TLS_complete_rsc_AWVALID;
  sc_signal<sc_lv<12> >                                                        TLS_complete_rsc_AWADDR;
  ccs_DUT_wrapper                                                              inPlaceNTT_DIF_precomp_INST;
  ccs_axi4_lite_slave_insync_trans_rsc<0,12,32,0 >                             run_rsc_INST;
  ccs_axi4_lite_slave_outsync_trans_rsc<0,12,32,0 >                            complete_rsc_INST;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_vec_rsc_AWID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_vec_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_vec_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_vec_rsc_ARID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                               CCS_ADAPTOR_TLS_vec_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RID;
  sc_signal<sc_lv<1> >                                                         CCS_ADAPTOR_vec_rsc_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                               CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                vec_rsc_INST;
  ccs_axi4_lite_slave_indirect_trans_rsc<32,0,12,32,0 >                        p_rsc_INST;
  ccs_axi4_lite_slave_indirect_trans_rsc<32,0,12,32,0 >                        r_rsc_INST;
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
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                twiddle_rsc_INST;
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
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                twiddle_h_rsc_INST;
  tlm::tlm_fifo<bool >                                                         TLS_in_fifo_run;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_run;
  tlm::tlm_fifo<int>                                                           TLS_in_fifo_run_sizecount;
  mc_channel_input_transactor<bool,1,false>                                    transactor_run;
  tlm::tlm_fifo<bool >                                                         TLS_out_fifo_complete;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_complete;
  mc_output_transactor<bool,1,false>                                           transactor_complete;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_vec;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_out_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_vec;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_vec;
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
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,1024>,32,false>  transactor_twiddle;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,1024> >                TLS_in_fifo_twiddle_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle_h;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_lz_INST;
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
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_staller_inst_core_wen;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_irdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_ivld_core_sct;
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
    , TLS_run_rsc_triosy("TLS_run_rsc_triosy")
    , TLS_run_rsc_RREADY("TLS_run_rsc_RREADY")
    , TLS_run_rsc_RVALID("TLS_run_rsc_RVALID")
    , TLS_run_rsc_RRESP("TLS_run_rsc_RRESP")
    , TLS_run_rsc_RDATA("TLS_run_rsc_RDATA")
    , TLS_run_rsc_ARREADY("TLS_run_rsc_ARREADY")
    , TLS_run_rsc_ARVALID("TLS_run_rsc_ARVALID")
    , TLS_run_rsc_ARADDR("TLS_run_rsc_ARADDR")
    , TLS_run_rsc_BREADY("TLS_run_rsc_BREADY")
    , TLS_run_rsc_BVALID("TLS_run_rsc_BVALID")
    , TLS_run_rsc_BRESP("TLS_run_rsc_BRESP")
    , TLS_run_rsc_WREADY("TLS_run_rsc_WREADY")
    , TLS_run_rsc_WVALID("TLS_run_rsc_WVALID")
    , TLS_run_rsc_WSTRB("TLS_run_rsc_WSTRB")
    , TLS_run_rsc_WDATA("TLS_run_rsc_WDATA")
    , TLS_run_rsc_AWREADY("TLS_run_rsc_AWREADY")
    , TLS_run_rsc_AWVALID("TLS_run_rsc_AWVALID")
    , TLS_run_rsc_AWADDR("TLS_run_rsc_AWADDR")
    , TLS_vec_rsc_s_tdone("TLS_vec_rsc_s_tdone")
    , TLS_vec_rsc_tr_write_done("TLS_vec_rsc_tr_write_done")
    , TLS_vec_rsc_RREADY("TLS_vec_rsc_RREADY")
    , TLS_vec_rsc_RVALID("TLS_vec_rsc_RVALID")
    , TLS_vec_rsc_RUSER("TLS_vec_rsc_RUSER")
    , TLS_vec_rsc_RLAST("TLS_vec_rsc_RLAST")
    , TLS_vec_rsc_RRESP("TLS_vec_rsc_RRESP")
    , TLS_vec_rsc_RDATA("TLS_vec_rsc_RDATA")
    , TLS_vec_rsc_RID("TLS_vec_rsc_RID")
    , TLS_vec_rsc_ARREADY("TLS_vec_rsc_ARREADY")
    , TLS_vec_rsc_ARVALID("TLS_vec_rsc_ARVALID")
    , TLS_vec_rsc_ARUSER("TLS_vec_rsc_ARUSER")
    , TLS_vec_rsc_ARREGION("TLS_vec_rsc_ARREGION")
    , TLS_vec_rsc_ARQOS("TLS_vec_rsc_ARQOS")
    , TLS_vec_rsc_ARPROT("TLS_vec_rsc_ARPROT")
    , TLS_vec_rsc_ARCACHE("TLS_vec_rsc_ARCACHE")
    , TLS_vec_rsc_ARLOCK("TLS_vec_rsc_ARLOCK")
    , TLS_vec_rsc_ARBURST("TLS_vec_rsc_ARBURST")
    , TLS_vec_rsc_ARSIZE("TLS_vec_rsc_ARSIZE")
    , TLS_vec_rsc_ARLEN("TLS_vec_rsc_ARLEN")
    , TLS_vec_rsc_ARADDR("TLS_vec_rsc_ARADDR")
    , TLS_vec_rsc_ARID("TLS_vec_rsc_ARID")
    , TLS_vec_rsc_BREADY("TLS_vec_rsc_BREADY")
    , TLS_vec_rsc_BVALID("TLS_vec_rsc_BVALID")
    , TLS_vec_rsc_BUSER("TLS_vec_rsc_BUSER")
    , TLS_vec_rsc_BRESP("TLS_vec_rsc_BRESP")
    , TLS_vec_rsc_BID("TLS_vec_rsc_BID")
    , TLS_vec_rsc_WREADY("TLS_vec_rsc_WREADY")
    , TLS_vec_rsc_WVALID("TLS_vec_rsc_WVALID")
    , TLS_vec_rsc_WUSER("TLS_vec_rsc_WUSER")
    , TLS_vec_rsc_WLAST("TLS_vec_rsc_WLAST")
    , TLS_vec_rsc_WSTRB("TLS_vec_rsc_WSTRB")
    , TLS_vec_rsc_WDATA("TLS_vec_rsc_WDATA")
    , TLS_vec_rsc_AWREADY("TLS_vec_rsc_AWREADY")
    , TLS_vec_rsc_AWVALID("TLS_vec_rsc_AWVALID")
    , TLS_vec_rsc_AWUSER("TLS_vec_rsc_AWUSER")
    , TLS_vec_rsc_AWREGION("TLS_vec_rsc_AWREGION")
    , TLS_vec_rsc_AWQOS("TLS_vec_rsc_AWQOS")
    , TLS_vec_rsc_AWPROT("TLS_vec_rsc_AWPROT")
    , TLS_vec_rsc_AWCACHE("TLS_vec_rsc_AWCACHE")
    , TLS_vec_rsc_AWLOCK("TLS_vec_rsc_AWLOCK")
    , TLS_vec_rsc_AWBURST("TLS_vec_rsc_AWBURST")
    , TLS_vec_rsc_AWSIZE("TLS_vec_rsc_AWSIZE")
    , TLS_vec_rsc_AWLEN("TLS_vec_rsc_AWLEN")
    , TLS_vec_rsc_AWADDR("TLS_vec_rsc_AWADDR")
    , TLS_vec_rsc_AWID("TLS_vec_rsc_AWID")
    , TLS_vec_rsc_triosy_lz("TLS_vec_rsc_triosy_lz")
    , TLS_p_rsc_RREADY("TLS_p_rsc_RREADY")
    , TLS_p_rsc_RVALID("TLS_p_rsc_RVALID")
    , TLS_p_rsc_RRESP("TLS_p_rsc_RRESP")
    , TLS_p_rsc_RDATA("TLS_p_rsc_RDATA")
    , TLS_p_rsc_ARREADY("TLS_p_rsc_ARREADY")
    , TLS_p_rsc_ARVALID("TLS_p_rsc_ARVALID")
    , TLS_p_rsc_ARADDR("TLS_p_rsc_ARADDR")
    , TLS_p_rsc_BREADY("TLS_p_rsc_BREADY")
    , TLS_p_rsc_BVALID("TLS_p_rsc_BVALID")
    , TLS_p_rsc_BRESP("TLS_p_rsc_BRESP")
    , TLS_p_rsc_WREADY("TLS_p_rsc_WREADY")
    , TLS_p_rsc_WVALID("TLS_p_rsc_WVALID")
    , TLS_p_rsc_WSTRB("TLS_p_rsc_WSTRB")
    , TLS_p_rsc_WDATA("TLS_p_rsc_WDATA")
    , TLS_p_rsc_AWREADY("TLS_p_rsc_AWREADY")
    , TLS_p_rsc_AWVALID("TLS_p_rsc_AWVALID")
    , TLS_p_rsc_AWADDR("TLS_p_rsc_AWADDR")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_r_rsc_RREADY("TLS_r_rsc_RREADY")
    , TLS_r_rsc_RVALID("TLS_r_rsc_RVALID")
    , TLS_r_rsc_RRESP("TLS_r_rsc_RRESP")
    , TLS_r_rsc_RDATA("TLS_r_rsc_RDATA")
    , TLS_r_rsc_ARREADY("TLS_r_rsc_ARREADY")
    , TLS_r_rsc_ARVALID("TLS_r_rsc_ARVALID")
    , TLS_r_rsc_ARADDR("TLS_r_rsc_ARADDR")
    , TLS_r_rsc_BREADY("TLS_r_rsc_BREADY")
    , TLS_r_rsc_BVALID("TLS_r_rsc_BVALID")
    , TLS_r_rsc_BRESP("TLS_r_rsc_BRESP")
    , TLS_r_rsc_WREADY("TLS_r_rsc_WREADY")
    , TLS_r_rsc_WVALID("TLS_r_rsc_WVALID")
    , TLS_r_rsc_WSTRB("TLS_r_rsc_WSTRB")
    , TLS_r_rsc_WDATA("TLS_r_rsc_WDATA")
    , TLS_r_rsc_AWREADY("TLS_r_rsc_AWREADY")
    , TLS_r_rsc_AWVALID("TLS_r_rsc_AWVALID")
    , TLS_r_rsc_AWADDR("TLS_r_rsc_AWADDR")
    , TLS_r_rsc_triosy_lz("TLS_r_rsc_triosy_lz")
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
    , TLS_complete_rsc_triosy("TLS_complete_rsc_triosy")
    , TLS_complete_rsc_RREADY("TLS_complete_rsc_RREADY")
    , TLS_complete_rsc_RVALID("TLS_complete_rsc_RVALID")
    , TLS_complete_rsc_RRESP("TLS_complete_rsc_RRESP")
    , TLS_complete_rsc_RDATA("TLS_complete_rsc_RDATA")
    , TLS_complete_rsc_ARREADY("TLS_complete_rsc_ARREADY")
    , TLS_complete_rsc_ARVALID("TLS_complete_rsc_ARVALID")
    , TLS_complete_rsc_ARADDR("TLS_complete_rsc_ARADDR")
    , TLS_complete_rsc_BREADY("TLS_complete_rsc_BREADY")
    , TLS_complete_rsc_BVALID("TLS_complete_rsc_BVALID")
    , TLS_complete_rsc_BRESP("TLS_complete_rsc_BRESP")
    , TLS_complete_rsc_WREADY("TLS_complete_rsc_WREADY")
    , TLS_complete_rsc_WVALID("TLS_complete_rsc_WVALID")
    , TLS_complete_rsc_WSTRB("TLS_complete_rsc_WSTRB")
    , TLS_complete_rsc_WDATA("TLS_complete_rsc_WDATA")
    , TLS_complete_rsc_AWREADY("TLS_complete_rsc_AWREADY")
    , TLS_complete_rsc_AWVALID("TLS_complete_rsc_AWVALID")
    , TLS_complete_rsc_AWADDR("TLS_complete_rsc_AWADDR")
    , inPlaceNTT_DIF_precomp_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , run_rsc_INST("run_rsc", true)
    , complete_rsc_INST("complete_rsc", true)
    , CCS_ADAPTOR_TLS_vec_rsc_AWID("CCS_ADAPTOR_TLS_vec_rsc_AWID")
    , CCS_ADAPTOR_TLS_vec_rsc_AWUSER("CCS_ADAPTOR_TLS_vec_rsc_AWUSER")
    , CCS_ADAPTOR_TLS_vec_rsc_WUSER("CCS_ADAPTOR_TLS_vec_rsc_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BID("CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BUSER")
    , CCS_ADAPTOR_TLS_vec_rsc_ARID("CCS_ADAPTOR_TLS_vec_rsc_ARID")
    , CCS_ADAPTOR_TLS_vec_rsc_ARUSER("CCS_ADAPTOR_TLS_vec_rsc_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RID("CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RUSER")
    , vec_rsc_INST("vec_rsc", true)
    , p_rsc_INST("p_rsc", true)
    , r_rsc_INST("r_rsc", true)
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
    , TLS_in_fifo_run("TLS_in_fifo_run", -1)
    , TLS_in_wait_ctrl_fifo_run("TLS_in_wait_ctrl_fifo_run", -1)
    , TLS_in_fifo_run_sizecount("TLS_in_fifo_run_sizecount", 1)
    , transactor_run("transactor_run", 0, 1, 0)
    , TLS_out_fifo_complete("TLS_out_fifo_complete", -1)
    , TLS_out_wait_ctrl_fifo_complete("TLS_out_wait_ctrl_fifo_complete", -1)
    , transactor_complete("transactor_complete", 0, 1, 0)
    , TLS_in_fifo_vec("TLS_in_fifo_vec", -1)
    , TLS_in_wait_ctrl_fifo_vec("TLS_in_wait_ctrl_fifo_vec", -1)
    , TLS_out_fifo_vec("TLS_out_fifo_vec", -1)
    , TLS_out_wait_ctrl_fifo_vec("TLS_out_wait_ctrl_fifo_vec", -1)
    , trios_monitor_vec_rsc_triosy_lz_INST("trios_monitor_vec_rsc_triosy_lz_INST")
    , transactor_vec("transactor_vec", 0, 32, 0)
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
    , sync_generator_INST("sync_generator", true, false, false, false, 133274, 133274, 0)
    , catapult_monitor_INST("Monitor", clk, true, 133274LL, 133273LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    inPlaceNTT_DIF_precomp_INST.clk(clk);
    inPlaceNTT_DIF_precomp_INST.rst(TLS_rst);
    inPlaceNTT_DIF_precomp_INST.run_rsc_triosy(TLS_run_rsc_triosy);
    inPlaceNTT_DIF_precomp_INST.run_rsc_RREADY(TLS_run_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.run_rsc_RVALID(TLS_run_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.run_rsc_RRESP(TLS_run_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.run_rsc_RDATA(TLS_run_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.run_rsc_ARREADY(TLS_run_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.run_rsc_ARVALID(TLS_run_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.run_rsc_ARADDR(TLS_run_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.run_rsc_BREADY(TLS_run_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.run_rsc_BVALID(TLS_run_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.run_rsc_BRESP(TLS_run_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.run_rsc_WREADY(TLS_run_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.run_rsc_WVALID(TLS_run_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.run_rsc_WSTRB(TLS_run_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.run_rsc_WDATA(TLS_run_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.run_rsc_AWREADY(TLS_run_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.run_rsc_AWVALID(TLS_run_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.run_rsc_AWADDR(TLS_run_rsc_AWADDR);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_s_tdone(TLS_vec_rsc_s_tdone);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_tr_write_done(TLS_vec_rsc_tr_write_done);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RREADY(TLS_vec_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RVALID(TLS_vec_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RUSER(TLS_vec_rsc_RUSER);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RLAST(TLS_vec_rsc_RLAST);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RRESP(TLS_vec_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RDATA(TLS_vec_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_RID(TLS_vec_rsc_RID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARREADY(TLS_vec_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARVALID(TLS_vec_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARUSER(TLS_vec_rsc_ARUSER);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARREGION(TLS_vec_rsc_ARREGION);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARQOS(TLS_vec_rsc_ARQOS);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARPROT(TLS_vec_rsc_ARPROT);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARCACHE(TLS_vec_rsc_ARCACHE);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARLOCK(TLS_vec_rsc_ARLOCK);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARBURST(TLS_vec_rsc_ARBURST);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARSIZE(TLS_vec_rsc_ARSIZE);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARLEN(TLS_vec_rsc_ARLEN);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARADDR(TLS_vec_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_ARID(TLS_vec_rsc_ARID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_BREADY(TLS_vec_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_BVALID(TLS_vec_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_BUSER(TLS_vec_rsc_BUSER);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_BRESP(TLS_vec_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_BID(TLS_vec_rsc_BID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_WREADY(TLS_vec_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_WVALID(TLS_vec_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_WUSER(TLS_vec_rsc_WUSER);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_WLAST(TLS_vec_rsc_WLAST);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_WSTRB(TLS_vec_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_WDATA(TLS_vec_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWREADY(TLS_vec_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWVALID(TLS_vec_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWUSER(TLS_vec_rsc_AWUSER);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWREGION(TLS_vec_rsc_AWREGION);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWQOS(TLS_vec_rsc_AWQOS);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWPROT(TLS_vec_rsc_AWPROT);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWCACHE(TLS_vec_rsc_AWCACHE);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWLOCK(TLS_vec_rsc_AWLOCK);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWBURST(TLS_vec_rsc_AWBURST);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWSIZE(TLS_vec_rsc_AWSIZE);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWLEN(TLS_vec_rsc_AWLEN);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWADDR(TLS_vec_rsc_AWADDR);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_AWID(TLS_vec_rsc_AWID);
    inPlaceNTT_DIF_precomp_INST.vec_rsc_triosy_lz(TLS_vec_rsc_triosy_lz);
    inPlaceNTT_DIF_precomp_INST.p_rsc_RREADY(TLS_p_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.p_rsc_RVALID(TLS_p_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.p_rsc_RRESP(TLS_p_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.p_rsc_RDATA(TLS_p_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.p_rsc_ARREADY(TLS_p_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.p_rsc_ARVALID(TLS_p_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.p_rsc_ARADDR(TLS_p_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.p_rsc_BREADY(TLS_p_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.p_rsc_BVALID(TLS_p_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.p_rsc_BRESP(TLS_p_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.p_rsc_WREADY(TLS_p_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.p_rsc_WVALID(TLS_p_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.p_rsc_WSTRB(TLS_p_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.p_rsc_WDATA(TLS_p_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.p_rsc_AWREADY(TLS_p_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.p_rsc_AWVALID(TLS_p_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.p_rsc_AWADDR(TLS_p_rsc_AWADDR);
    inPlaceNTT_DIF_precomp_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    inPlaceNTT_DIF_precomp_INST.r_rsc_RREADY(TLS_r_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.r_rsc_RVALID(TLS_r_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.r_rsc_RRESP(TLS_r_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.r_rsc_RDATA(TLS_r_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.r_rsc_ARREADY(TLS_r_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.r_rsc_ARVALID(TLS_r_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.r_rsc_ARADDR(TLS_r_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.r_rsc_BREADY(TLS_r_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.r_rsc_BVALID(TLS_r_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.r_rsc_BRESP(TLS_r_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.r_rsc_WREADY(TLS_r_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.r_rsc_WVALID(TLS_r_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.r_rsc_WSTRB(TLS_r_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.r_rsc_WDATA(TLS_r_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.r_rsc_AWREADY(TLS_r_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.r_rsc_AWVALID(TLS_r_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.r_rsc_AWADDR(TLS_r_rsc_AWADDR);
    inPlaceNTT_DIF_precomp_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_s_tdone(TLS_twiddle_rsc_s_tdone);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_tr_write_done(TLS_twiddle_rsc_tr_write_done);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RREADY(TLS_twiddle_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RVALID(TLS_twiddle_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RUSER(TLS_twiddle_rsc_RUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RLAST(TLS_twiddle_rsc_RLAST);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RRESP(TLS_twiddle_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RDATA(TLS_twiddle_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_RID(TLS_twiddle_rsc_RID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARREADY(TLS_twiddle_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARVALID(TLS_twiddle_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARUSER(TLS_twiddle_rsc_ARUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARREGION(TLS_twiddle_rsc_ARREGION);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARQOS(TLS_twiddle_rsc_ARQOS);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARPROT(TLS_twiddle_rsc_ARPROT);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARCACHE(TLS_twiddle_rsc_ARCACHE);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARLOCK(TLS_twiddle_rsc_ARLOCK);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARBURST(TLS_twiddle_rsc_ARBURST);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARSIZE(TLS_twiddle_rsc_ARSIZE);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARLEN(TLS_twiddle_rsc_ARLEN);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARADDR(TLS_twiddle_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_ARID(TLS_twiddle_rsc_ARID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_BREADY(TLS_twiddle_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_BVALID(TLS_twiddle_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_BUSER(TLS_twiddle_rsc_BUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_BRESP(TLS_twiddle_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_BID(TLS_twiddle_rsc_BID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_WREADY(TLS_twiddle_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_WVALID(TLS_twiddle_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_WUSER(TLS_twiddle_rsc_WUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_WLAST(TLS_twiddle_rsc_WLAST);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_WSTRB(TLS_twiddle_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_WDATA(TLS_twiddle_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWREADY(TLS_twiddle_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWVALID(TLS_twiddle_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWUSER(TLS_twiddle_rsc_AWUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWREGION(TLS_twiddle_rsc_AWREGION);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWQOS(TLS_twiddle_rsc_AWQOS);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWPROT(TLS_twiddle_rsc_AWPROT);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWCACHE(TLS_twiddle_rsc_AWCACHE);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWLOCK(TLS_twiddle_rsc_AWLOCK);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWBURST(TLS_twiddle_rsc_AWBURST);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWSIZE(TLS_twiddle_rsc_AWSIZE);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWLEN(TLS_twiddle_rsc_AWLEN);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWADDR(TLS_twiddle_rsc_AWADDR);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_AWID(TLS_twiddle_rsc_AWID);
    inPlaceNTT_DIF_precomp_INST.twiddle_rsc_triosy_lz(TLS_twiddle_rsc_triosy_lz);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_s_tdone(TLS_twiddle_h_rsc_s_tdone);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_tr_write_done(TLS_twiddle_h_rsc_tr_write_done);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RREADY(TLS_twiddle_h_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RVALID(TLS_twiddle_h_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RUSER(TLS_twiddle_h_rsc_RUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RLAST(TLS_twiddle_h_rsc_RLAST);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RRESP(TLS_twiddle_h_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RDATA(TLS_twiddle_h_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_RID(TLS_twiddle_h_rsc_RID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARREADY(TLS_twiddle_h_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARVALID(TLS_twiddle_h_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARUSER(TLS_twiddle_h_rsc_ARUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARREGION(TLS_twiddle_h_rsc_ARREGION);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARQOS(TLS_twiddle_h_rsc_ARQOS);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARPROT(TLS_twiddle_h_rsc_ARPROT);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARCACHE(TLS_twiddle_h_rsc_ARCACHE);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARLOCK(TLS_twiddle_h_rsc_ARLOCK);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARBURST(TLS_twiddle_h_rsc_ARBURST);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARSIZE(TLS_twiddle_h_rsc_ARSIZE);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARLEN(TLS_twiddle_h_rsc_ARLEN);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARADDR(TLS_twiddle_h_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_ARID(TLS_twiddle_h_rsc_ARID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_BREADY(TLS_twiddle_h_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_BVALID(TLS_twiddle_h_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_BUSER(TLS_twiddle_h_rsc_BUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_BRESP(TLS_twiddle_h_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_BID(TLS_twiddle_h_rsc_BID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_WREADY(TLS_twiddle_h_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_WVALID(TLS_twiddle_h_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_WUSER(TLS_twiddle_h_rsc_WUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_WLAST(TLS_twiddle_h_rsc_WLAST);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_WSTRB(TLS_twiddle_h_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_WDATA(TLS_twiddle_h_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWREADY(TLS_twiddle_h_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWVALID(TLS_twiddle_h_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWUSER(TLS_twiddle_h_rsc_AWUSER);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWREGION(TLS_twiddle_h_rsc_AWREGION);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWQOS(TLS_twiddle_h_rsc_AWQOS);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWPROT(TLS_twiddle_h_rsc_AWPROT);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWCACHE(TLS_twiddle_h_rsc_AWCACHE);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWLOCK(TLS_twiddle_h_rsc_AWLOCK);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWBURST(TLS_twiddle_h_rsc_AWBURST);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWSIZE(TLS_twiddle_h_rsc_AWSIZE);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWLEN(TLS_twiddle_h_rsc_AWLEN);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWADDR(TLS_twiddle_h_rsc_AWADDR);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_AWID(TLS_twiddle_h_rsc_AWID);
    inPlaceNTT_DIF_precomp_INST.twiddle_h_rsc_triosy_lz(TLS_twiddle_h_rsc_triosy_lz);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_triosy(TLS_complete_rsc_triosy);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_RREADY(TLS_complete_rsc_RREADY);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_RVALID(TLS_complete_rsc_RVALID);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_RRESP(TLS_complete_rsc_RRESP);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_RDATA(TLS_complete_rsc_RDATA);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_ARREADY(TLS_complete_rsc_ARREADY);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_ARVALID(TLS_complete_rsc_ARVALID);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_ARADDR(TLS_complete_rsc_ARADDR);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_BREADY(TLS_complete_rsc_BREADY);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_BVALID(TLS_complete_rsc_BVALID);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_BRESP(TLS_complete_rsc_BRESP);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_WREADY(TLS_complete_rsc_WREADY);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_WVALID(TLS_complete_rsc_WVALID);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_WSTRB(TLS_complete_rsc_WSTRB);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_WDATA(TLS_complete_rsc_WDATA);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_AWREADY(TLS_complete_rsc_AWREADY);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_AWVALID(TLS_complete_rsc_AWVALID);
    inPlaceNTT_DIF_precomp_INST.complete_rsc_AWADDR(TLS_complete_rsc_AWADDR);

    run_rsc_INST.ACLK(clk);
    run_rsc_INST.ARESETn(rst);
    run_rsc_INST.AWADDR(TLS_run_rsc_AWADDR);
    run_rsc_INST.AWVALID(TLS_run_rsc_AWVALID);
    run_rsc_INST.AWREADY(TLS_run_rsc_AWREADY);
    run_rsc_INST.WDATA(TLS_run_rsc_WDATA);
    run_rsc_INST.WSTRB(TLS_run_rsc_WSTRB);
    run_rsc_INST.WVALID(TLS_run_rsc_WVALID);
    run_rsc_INST.WREADY(TLS_run_rsc_WREADY);
    run_rsc_INST.BRESP(TLS_run_rsc_BRESP);
    run_rsc_INST.BVALID(TLS_run_rsc_BVALID);
    run_rsc_INST.BREADY(TLS_run_rsc_BREADY);
    run_rsc_INST.ARADDR(TLS_run_rsc_ARADDR);
    run_rsc_INST.ARVALID(TLS_run_rsc_ARVALID);
    run_rsc_INST.ARREADY(TLS_run_rsc_ARREADY);
    run_rsc_INST.RDATA(TLS_run_rsc_RDATA);
    run_rsc_INST.RRESP(TLS_run_rsc_RRESP);
    run_rsc_INST.RVALID(TLS_run_rsc_RVALID);
    run_rsc_INST.RREADY(TLS_run_rsc_RREADY);
    run_rsc_INST.triosy(TLS_run_rsc_triosy);
    run_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_12)));

    complete_rsc_INST.ACLK(clk);
    complete_rsc_INST.ARESETn(rst);
    complete_rsc_INST.AWADDR(TLS_complete_rsc_AWADDR);
    complete_rsc_INST.AWVALID(TLS_complete_rsc_AWVALID);
    complete_rsc_INST.AWREADY(TLS_complete_rsc_AWREADY);
    complete_rsc_INST.WDATA(TLS_complete_rsc_WDATA);
    complete_rsc_INST.WSTRB(TLS_complete_rsc_WSTRB);
    complete_rsc_INST.WVALID(TLS_complete_rsc_WVALID);
    complete_rsc_INST.WREADY(TLS_complete_rsc_WREADY);
    complete_rsc_INST.BRESP(TLS_complete_rsc_BRESP);
    complete_rsc_INST.BVALID(TLS_complete_rsc_BVALID);
    complete_rsc_INST.BREADY(TLS_complete_rsc_BREADY);
    complete_rsc_INST.ARADDR(TLS_complete_rsc_ARADDR);
    complete_rsc_INST.ARVALID(TLS_complete_rsc_ARVALID);
    complete_rsc_INST.ARREADY(TLS_complete_rsc_ARREADY);
    complete_rsc_INST.RDATA(TLS_complete_rsc_RDATA);
    complete_rsc_INST.RRESP(TLS_complete_rsc_RRESP);
    complete_rsc_INST.RVALID(TLS_complete_rsc_RVALID);
    complete_rsc_INST.RREADY(TLS_complete_rsc_RREADY);
    complete_rsc_INST.triosy(TLS_complete_rsc_triosy);
    complete_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_18)));

    CCS_ADAPTOR_TLS_vec_rsc_AWID.inVECTOR(CCS_ADAPTOR_vec_rsc_AWID);
    CCS_ADAPTOR_TLS_vec_rsc_AWID.outSCALAR(TLS_vec_rsc_AWID);

    CCS_ADAPTOR_TLS_vec_rsc_AWUSER.inVECTOR(CCS_ADAPTOR_vec_rsc_AWUSER);
    CCS_ADAPTOR_TLS_vec_rsc_AWUSER.outSCALAR(TLS_vec_rsc_AWUSER);

    CCS_ADAPTOR_TLS_vec_rsc_WUSER.inVECTOR(CCS_ADAPTOR_vec_rsc_WUSER);
    CCS_ADAPTOR_TLS_vec_rsc_WUSER.outSCALAR(TLS_vec_rsc_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BID.inSCALAR(TLS_vec_rsc_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BID.outVECTOR(CCS_ADAPTOR_vec_rsc_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BUSER.inSCALAR(TLS_vec_rsc_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_BUSER.outVECTOR(CCS_ADAPTOR_vec_rsc_BUSER);

    CCS_ADAPTOR_TLS_vec_rsc_ARID.inVECTOR(CCS_ADAPTOR_vec_rsc_ARID);
    CCS_ADAPTOR_TLS_vec_rsc_ARID.outSCALAR(TLS_vec_rsc_ARID);

    CCS_ADAPTOR_TLS_vec_rsc_ARUSER.inVECTOR(CCS_ADAPTOR_vec_rsc_ARUSER);
    CCS_ADAPTOR_TLS_vec_rsc_ARUSER.outSCALAR(TLS_vec_rsc_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RID.inSCALAR(TLS_vec_rsc_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RID.outVECTOR(CCS_ADAPTOR_vec_rsc_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RUSER.inSCALAR(TLS_vec_rsc_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_vec_rsc_RUSER.outVECTOR(CCS_ADAPTOR_vec_rsc_RUSER);

    vec_rsc_INST.ACLK(clk);
    vec_rsc_INST.ARESETn(rst);
    vec_rsc_INST.AWID(CCS_ADAPTOR_vec_rsc_AWID);
    vec_rsc_INST.AWADDR(TLS_vec_rsc_AWADDR);
    vec_rsc_INST.AWLEN(TLS_vec_rsc_AWLEN);
    vec_rsc_INST.AWSIZE(TLS_vec_rsc_AWSIZE);
    vec_rsc_INST.AWBURST(TLS_vec_rsc_AWBURST);
    vec_rsc_INST.AWLOCK(TLS_vec_rsc_AWLOCK);
    vec_rsc_INST.AWCACHE(TLS_vec_rsc_AWCACHE);
    vec_rsc_INST.AWPROT(TLS_vec_rsc_AWPROT);
    vec_rsc_INST.AWQOS(TLS_vec_rsc_AWQOS);
    vec_rsc_INST.AWREGION(TLS_vec_rsc_AWREGION);
    vec_rsc_INST.AWUSER(CCS_ADAPTOR_vec_rsc_AWUSER);
    vec_rsc_INST.AWVALID(TLS_vec_rsc_AWVALID);
    vec_rsc_INST.AWREADY(TLS_vec_rsc_AWREADY);
    vec_rsc_INST.WDATA(TLS_vec_rsc_WDATA);
    vec_rsc_INST.WSTRB(TLS_vec_rsc_WSTRB);
    vec_rsc_INST.WLAST(TLS_vec_rsc_WLAST);
    vec_rsc_INST.WUSER(CCS_ADAPTOR_vec_rsc_WUSER);
    vec_rsc_INST.WVALID(TLS_vec_rsc_WVALID);
    vec_rsc_INST.WREADY(TLS_vec_rsc_WREADY);
    vec_rsc_INST.BID(CCS_ADAPTOR_vec_rsc_BID);
    vec_rsc_INST.BRESP(TLS_vec_rsc_BRESP);
    vec_rsc_INST.BUSER(CCS_ADAPTOR_vec_rsc_BUSER);
    vec_rsc_INST.BVALID(TLS_vec_rsc_BVALID);
    vec_rsc_INST.BREADY(TLS_vec_rsc_BREADY);
    vec_rsc_INST.ARID(CCS_ADAPTOR_vec_rsc_ARID);
    vec_rsc_INST.ARADDR(TLS_vec_rsc_ARADDR);
    vec_rsc_INST.ARLEN(TLS_vec_rsc_ARLEN);
    vec_rsc_INST.ARSIZE(TLS_vec_rsc_ARSIZE);
    vec_rsc_INST.ARBURST(TLS_vec_rsc_ARBURST);
    vec_rsc_INST.ARLOCK(TLS_vec_rsc_ARLOCK);
    vec_rsc_INST.ARCACHE(TLS_vec_rsc_ARCACHE);
    vec_rsc_INST.ARPROT(TLS_vec_rsc_ARPROT);
    vec_rsc_INST.ARQOS(TLS_vec_rsc_ARQOS);
    vec_rsc_INST.ARREGION(TLS_vec_rsc_ARREGION);
    vec_rsc_INST.ARUSER(CCS_ADAPTOR_vec_rsc_ARUSER);
    vec_rsc_INST.ARVALID(TLS_vec_rsc_ARVALID);
    vec_rsc_INST.ARREADY(TLS_vec_rsc_ARREADY);
    vec_rsc_INST.RID(CCS_ADAPTOR_vec_rsc_RID);
    vec_rsc_INST.RDATA(TLS_vec_rsc_RDATA);
    vec_rsc_INST.RRESP(TLS_vec_rsc_RRESP);
    vec_rsc_INST.RLAST(TLS_vec_rsc_RLAST);
    vec_rsc_INST.RUSER(CCS_ADAPTOR_vec_rsc_RUSER);
    vec_rsc_INST.RVALID(TLS_vec_rsc_RVALID);
    vec_rsc_INST.RREADY(TLS_vec_rsc_RREADY);
    vec_rsc_INST.tr_write_done(TLS_vec_rsc_tr_write_done);
    vec_rsc_INST.s_tdone(TLS_vec_rsc_s_tdone);
    vec_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_13)));

    p_rsc_INST.ACLK(clk);
    p_rsc_INST.ARESETn(rst);
    p_rsc_INST.AWADDR(TLS_p_rsc_AWADDR);
    p_rsc_INST.AWVALID(TLS_p_rsc_AWVALID);
    p_rsc_INST.AWREADY(TLS_p_rsc_AWREADY);
    p_rsc_INST.WDATA(TLS_p_rsc_WDATA);
    p_rsc_INST.WSTRB(TLS_p_rsc_WSTRB);
    p_rsc_INST.WVALID(TLS_p_rsc_WVALID);
    p_rsc_INST.WREADY(TLS_p_rsc_WREADY);
    p_rsc_INST.BRESP(TLS_p_rsc_BRESP);
    p_rsc_INST.BVALID(TLS_p_rsc_BVALID);
    p_rsc_INST.BREADY(TLS_p_rsc_BREADY);
    p_rsc_INST.ARADDR(TLS_p_rsc_ARADDR);
    p_rsc_INST.ARVALID(TLS_p_rsc_ARVALID);
    p_rsc_INST.ARREADY(TLS_p_rsc_ARREADY);
    p_rsc_INST.RDATA(TLS_p_rsc_RDATA);
    p_rsc_INST.RRESP(TLS_p_rsc_RRESP);
    p_rsc_INST.RVALID(TLS_p_rsc_RVALID);
    p_rsc_INST.RREADY(TLS_p_rsc_RREADY);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_14)));

    r_rsc_INST.ACLK(clk);
    r_rsc_INST.ARESETn(rst);
    r_rsc_INST.AWADDR(TLS_r_rsc_AWADDR);
    r_rsc_INST.AWVALID(TLS_r_rsc_AWVALID);
    r_rsc_INST.AWREADY(TLS_r_rsc_AWREADY);
    r_rsc_INST.WDATA(TLS_r_rsc_WDATA);
    r_rsc_INST.WSTRB(TLS_r_rsc_WSTRB);
    r_rsc_INST.WVALID(TLS_r_rsc_WVALID);
    r_rsc_INST.WREADY(TLS_r_rsc_WREADY);
    r_rsc_INST.BRESP(TLS_r_rsc_BRESP);
    r_rsc_INST.BVALID(TLS_r_rsc_BVALID);
    r_rsc_INST.BREADY(TLS_r_rsc_BREADY);
    r_rsc_INST.ARADDR(TLS_r_rsc_ARADDR);
    r_rsc_INST.ARVALID(TLS_r_rsc_ARVALID);
    r_rsc_INST.ARREADY(TLS_r_rsc_ARREADY);
    r_rsc_INST.RDATA(TLS_r_rsc_RDATA);
    r_rsc_INST.RRESP(TLS_r_rsc_RRESP);
    r_rsc_INST.RVALID(TLS_r_rsc_RVALID);
    r_rsc_INST.RREADY(TLS_r_rsc_RREADY);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_15)));

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
    twiddle_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_16)));

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
    twiddle_h_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_17)));

    transactor_run.in_fifo(TLS_in_fifo_run);
    transactor_run.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_run);
    transactor_run.sizecount_fifo(TLS_in_fifo_run_sizecount);
    transactor_run.bind_clk(clk, true, rst);
    transactor_run.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_run.register_block(&run_rsc_INST, run_rsc_INST.basename(), TLS_run_rsc_triosy, 0, 0, 1);

    transactor_complete.out_fifo(TLS_out_fifo_complete);
    transactor_complete.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_complete);
    transactor_complete.bind_clk(clk, true, rst);
    transactor_complete.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_complete.register_block(&complete_rsc_INST, complete_rsc_INST.basename(), TLS_complete_rsc_triosy,
        0, 0, 1);

    trios_monitor_vec_rsc_triosy_lz_INST.trios(TLS_vec_rsc_triosy_lz);
    trios_monitor_vec_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_vec.in_fifo(TLS_in_fifo_vec);
    transactor_vec.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_vec);
    transactor_vec.out_fifo(TLS_out_fifo_vec);
    transactor_vec.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_vec);
    transactor_vec.bind_clk(clk, true, rst);
    transactor_vec.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_vec.register_block(&vec_rsc_INST, vec_rsc_INST.basename(), TLS_vec_rsc_triosy_lz, 0, 1023, 1);

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

    trios_monitor_twiddle_rsc_triosy_lz_INST.trios(TLS_twiddle_rsc_triosy_lz);
    trios_monitor_twiddle_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_INST, twiddle_rsc_INST.basename(), TLS_twiddle_rsc_triosy_lz,
        0, 1023, 1);

    trios_monitor_twiddle_h_rsc_triosy_lz_INST.trios(TLS_twiddle_h_rsc_triosy_lz);
    trios_monitor_twiddle_h_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle_h.in_fifo(TLS_in_fifo_twiddle_h);
    transactor_twiddle_h.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle_h);
    transactor_twiddle_h.bind_clk(clk, true, rst);
    transactor_twiddle_h.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle_h.register_block(&twiddle_h_rsc_INST, twiddle_h_rsc_INST.basename(), TLS_twiddle_h_rsc_triosy_lz,
        0, 1023, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_run(TLS_in_fifo_run);
    testbench_INST.ccs_wait_ctrl_run(TLS_in_wait_ctrl_fifo_run);
    testbench_INST.ccs_sizecount_run(TLS_in_fifo_run_sizecount);
    testbench_INST.ccs_complete(TLS_out_fifo_complete);
    testbench_INST.ccs_wait_ctrl_complete(TLS_out_wait_ctrl_fifo_complete);
    testbench_INST.ccs_vec_IN(TLS_in_fifo_vec);
    testbench_INST.ccs_wait_ctrl_vec_IN(TLS_in_wait_ctrl_fifo_vec);
    testbench_INST.ccs_vec(TLS_out_fifo_vec);
    testbench_INST.ccs_wait_ctrl_vec(TLS_out_wait_ctrl_fifo_vec);
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
  run_rsc_INST.clear();
  complete_rsc_INST.clear();
  vec_rsc_INST.clear();
  p_rsc_INST.clear();
  r_rsc_INST.clear();
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
    transactor_run.set_auto_wait_limit(l);
    transactor_complete.set_auto_wait_limit(l);
    transactor_vec.set_auto_wait_limit(l);
    transactor_p.set_auto_wait_limit(l);
    transactor_r.set_auto_wait_limit(l);
    transactor_twiddle.set_auto_wait_limit(l);
    transactor_twiddle_h.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_run_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_complete_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_vec_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_p_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_r_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_h_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_run_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_complete_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_vec_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_p_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_r_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_h_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_run_count = -1;
  static int transactor_complete_count = -1;
  static int transactor_vec_count = -1;
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
    debug("transactor_run",transactor_run_flags,transactor_run_count);
    debug("transactor_complete",transactor_complete_flags,transactor_complete_count);
    debug("transactor_vec",transactor_vec_flags,transactor_vec_count);
    debug("transactor_p",transactor_p_flags,transactor_p_count);
    debug("transactor_r",transactor_r_flags,transactor_r_count);
    debug("transactor_twiddle",transactor_twiddle_flags,transactor_twiddle_count);
    debug("transactor_twiddle_h",transactor_twiddle_h_flags,transactor_twiddle_h_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_run") == 0)
    xlator_p = &transactor_run;
  if (strcmp(varname,"transactor_complete") == 0)
    xlator_p = &transactor_complete;
  if (strcmp(varname,"transactor_vec") == 0)
    xlator_p = &transactor_vec;
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
      transactor_run.reset_streams();
      transactor_complete.reset_streams();
      transactor_vec.reset_streams();
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
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_staller_inst_core_wen,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_staller_inst/core_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_re_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_we_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_rrdy,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_wrdy,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_raddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst/vec_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_inst_inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_waddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_inst/inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst/vec_rsci_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_re_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst/inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst/twiddle_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_rrdy,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst/inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst/twiddle_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_twiddle_rsci_inst/inPlaceNTT_DIF_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst/twiddle_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_re_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst/inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst/twiddle_h_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_s_rrdy,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst/inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst/twiddle_h_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_inst/inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_irdy,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_complete_rsci_inst/inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst/complete_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIF_precomp_core_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_inst_inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_ivld_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIF_precomp_core_inst/inPlaceNTT_DIF_precomp_core_complete_rsci_inst/inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst/complete_rsci_ivld_core_sct);
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
