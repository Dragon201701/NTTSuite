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
#define TOP_HDL_ENTITY inPlaceNTT_DIT_precomp
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_1;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_4;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_1 = 0;
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_4 = 0;
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
  sc_signal<sc_logic>                                                          TLS_vec_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_vec_rsc_RRESP;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_RDATA;
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
  sc_signal<sc_lv<8> >                                                         TLS_vec_rsc_WSTRB;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_WDATA;
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
  sc_signal<sc_lv<64> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<64> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_s_tdone;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_tr_write_done;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RREADY;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RVALID;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RUSER;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                         TLS_twiddle_rsc_RRESP;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_RDATA;
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
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_WSTRB;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_WDATA;
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
  ccs_DUT_wrapper                                                              inPlaceNTT_DIT_precomp_INST;
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
  ccs_axi4_slave_mem_trans_rsc<1024,64,64,0,0,12,64,1,1,1,0,0 >                vec_rsc_INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   r_rsc_INST;
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
  ccs_axi4_slave_mem_trans_rsc<1024,64,64,0,0,12,64,1,1,1,0,0 >                twiddle_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_in_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_vec;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_out_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_vec;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<64, false >,1024>,64,false>  transactor_vec;
  tlm::tlm_fifo<ac_int<64, false > >                                           TLS_in_fifo_p;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_p;
  mc_trios_input_monitor                                                       trios_monitor_p_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<64, false >,64,false>                             transactor_p;
  tlm::tlm_fifo<ac_int<64, false > >                                           TLS_in_fifo_r;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_r;
  mc_trios_input_monitor                                                       trios_monitor_r_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<64, false >,64,false>                             transactor_r;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_in_fifo_twiddle;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<64, false >,1024>,64,false>  transactor_twiddle;
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
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_staller_inst_core_wen;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_we_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_wrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_raddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_waddr_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_re_core_sct;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_rrdy;
  sc_signal<sc_logic>                                                          OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core_sct;
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
    , TLS_p_rsc_dat("TLS_p_rsc_dat")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_r_rsc_dat("TLS_r_rsc_dat")
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
    , inPlaceNTT_DIT_precomp_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
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
    , TLS_in_fifo_vec("TLS_in_fifo_vec", -1)
    , TLS_in_wait_ctrl_fifo_vec("TLS_in_wait_ctrl_fifo_vec", -1)
    , TLS_out_fifo_vec("TLS_out_fifo_vec", -1)
    , TLS_out_wait_ctrl_fifo_vec("TLS_out_wait_ctrl_fifo_vec", -1)
    , trios_monitor_vec_rsc_triosy_lz_INST("trios_monitor_vec_rsc_triosy_lz_INST")
    , transactor_vec("transactor_vec", 0, 64, 0)
    , TLS_in_fifo_p("TLS_in_fifo_p", -1)
    , TLS_in_wait_ctrl_fifo_p("TLS_in_wait_ctrl_fifo_p", -1)
    , trios_monitor_p_rsc_triosy_lz_INST("trios_monitor_p_rsc_triosy_lz_INST")
    , transactor_p("transactor_p", 0, 64, 0)
    , TLS_in_fifo_r("TLS_in_fifo_r", -1)
    , TLS_in_wait_ctrl_fifo_r("TLS_in_wait_ctrl_fifo_r", -1)
    , trios_monitor_r_rsc_triosy_lz_INST("trios_monitor_r_rsc_triosy_lz_INST")
    , transactor_r("transactor_r", 0, 64, 0)
    , TLS_in_fifo_twiddle("TLS_in_fifo_twiddle", -1)
    , TLS_in_wait_ctrl_fifo_twiddle("TLS_in_wait_ctrl_fifo_twiddle", -1)
    , trios_monitor_twiddle_rsc_triosy_lz_INST("trios_monitor_twiddle_rsc_triosy_lz_INST")
    , transactor_twiddle("transactor_twiddle", 0, 64, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 180092, 180092, 0)
    , catapult_monitor_INST("Monitor", clk, true, 180092LL, 180092LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    inPlaceNTT_DIT_precomp_INST.clk(clk);
    inPlaceNTT_DIT_precomp_INST.rst(TLS_rst);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_s_tdone(TLS_vec_rsc_s_tdone);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_tr_write_done(TLS_vec_rsc_tr_write_done);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RREADY(TLS_vec_rsc_RREADY);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RVALID(TLS_vec_rsc_RVALID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RUSER(TLS_vec_rsc_RUSER);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RLAST(TLS_vec_rsc_RLAST);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RRESP(TLS_vec_rsc_RRESP);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RDATA(TLS_vec_rsc_RDATA);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_RID(TLS_vec_rsc_RID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARREADY(TLS_vec_rsc_ARREADY);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARVALID(TLS_vec_rsc_ARVALID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARUSER(TLS_vec_rsc_ARUSER);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARREGION(TLS_vec_rsc_ARREGION);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARQOS(TLS_vec_rsc_ARQOS);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARPROT(TLS_vec_rsc_ARPROT);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARCACHE(TLS_vec_rsc_ARCACHE);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARLOCK(TLS_vec_rsc_ARLOCK);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARBURST(TLS_vec_rsc_ARBURST);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARSIZE(TLS_vec_rsc_ARSIZE);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARLEN(TLS_vec_rsc_ARLEN);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARADDR(TLS_vec_rsc_ARADDR);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_ARID(TLS_vec_rsc_ARID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_BREADY(TLS_vec_rsc_BREADY);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_BVALID(TLS_vec_rsc_BVALID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_BUSER(TLS_vec_rsc_BUSER);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_BRESP(TLS_vec_rsc_BRESP);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_BID(TLS_vec_rsc_BID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_WREADY(TLS_vec_rsc_WREADY);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_WVALID(TLS_vec_rsc_WVALID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_WUSER(TLS_vec_rsc_WUSER);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_WLAST(TLS_vec_rsc_WLAST);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_WSTRB(TLS_vec_rsc_WSTRB);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_WDATA(TLS_vec_rsc_WDATA);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWREADY(TLS_vec_rsc_AWREADY);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWVALID(TLS_vec_rsc_AWVALID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWUSER(TLS_vec_rsc_AWUSER);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWREGION(TLS_vec_rsc_AWREGION);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWQOS(TLS_vec_rsc_AWQOS);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWPROT(TLS_vec_rsc_AWPROT);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWCACHE(TLS_vec_rsc_AWCACHE);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWLOCK(TLS_vec_rsc_AWLOCK);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWBURST(TLS_vec_rsc_AWBURST);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWSIZE(TLS_vec_rsc_AWSIZE);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWLEN(TLS_vec_rsc_AWLEN);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWADDR(TLS_vec_rsc_AWADDR);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_AWID(TLS_vec_rsc_AWID);
    inPlaceNTT_DIT_precomp_INST.vec_rsc_triosy_lz(TLS_vec_rsc_triosy_lz);
    inPlaceNTT_DIT_precomp_INST.p_rsc_dat(TLS_p_rsc_dat);
    inPlaceNTT_DIT_precomp_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    inPlaceNTT_DIT_precomp_INST.r_rsc_dat(TLS_r_rsc_dat);
    inPlaceNTT_DIT_precomp_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_s_tdone(TLS_twiddle_rsc_s_tdone);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_tr_write_done(TLS_twiddle_rsc_tr_write_done);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RREADY(TLS_twiddle_rsc_RREADY);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RVALID(TLS_twiddle_rsc_RVALID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RUSER(TLS_twiddle_rsc_RUSER);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RLAST(TLS_twiddle_rsc_RLAST);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RRESP(TLS_twiddle_rsc_RRESP);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RDATA(TLS_twiddle_rsc_RDATA);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_RID(TLS_twiddle_rsc_RID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARREADY(TLS_twiddle_rsc_ARREADY);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARVALID(TLS_twiddle_rsc_ARVALID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARUSER(TLS_twiddle_rsc_ARUSER);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARREGION(TLS_twiddle_rsc_ARREGION);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARQOS(TLS_twiddle_rsc_ARQOS);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARPROT(TLS_twiddle_rsc_ARPROT);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARCACHE(TLS_twiddle_rsc_ARCACHE);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARLOCK(TLS_twiddle_rsc_ARLOCK);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARBURST(TLS_twiddle_rsc_ARBURST);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARSIZE(TLS_twiddle_rsc_ARSIZE);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARLEN(TLS_twiddle_rsc_ARLEN);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARADDR(TLS_twiddle_rsc_ARADDR);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_ARID(TLS_twiddle_rsc_ARID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_BREADY(TLS_twiddle_rsc_BREADY);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_BVALID(TLS_twiddle_rsc_BVALID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_BUSER(TLS_twiddle_rsc_BUSER);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_BRESP(TLS_twiddle_rsc_BRESP);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_BID(TLS_twiddle_rsc_BID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_WREADY(TLS_twiddle_rsc_WREADY);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_WVALID(TLS_twiddle_rsc_WVALID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_WUSER(TLS_twiddle_rsc_WUSER);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_WLAST(TLS_twiddle_rsc_WLAST);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_WSTRB(TLS_twiddle_rsc_WSTRB);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_WDATA(TLS_twiddle_rsc_WDATA);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWREADY(TLS_twiddle_rsc_AWREADY);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWVALID(TLS_twiddle_rsc_AWVALID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWUSER(TLS_twiddle_rsc_AWUSER);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWREGION(TLS_twiddle_rsc_AWREGION);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWQOS(TLS_twiddle_rsc_AWQOS);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWPROT(TLS_twiddle_rsc_AWPROT);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWCACHE(TLS_twiddle_rsc_AWCACHE);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWLOCK(TLS_twiddle_rsc_AWLOCK);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWBURST(TLS_twiddle_rsc_AWBURST);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWSIZE(TLS_twiddle_rsc_AWSIZE);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWLEN(TLS_twiddle_rsc_AWLEN);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWADDR(TLS_twiddle_rsc_AWADDR);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_AWID(TLS_twiddle_rsc_AWID);
    inPlaceNTT_DIT_precomp_INST.twiddle_rsc_triosy_lz(TLS_twiddle_rsc_triosy_lz);

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
    vec_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

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
    twiddle_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_4)));

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

    testbench_INST.clk(clk);
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
  vec_rsc_INST.clear();
  p_rsc_INST.clear();
  r_rsc_INST.clear();
  twiddle_rsc_INST.clear();
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
    transactor_twiddle.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_vec_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_p_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_r_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_twiddle_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_vec_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_p_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_r_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_twiddle_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_vec_count = -1;
  static int transactor_p_count = -1;
  static int transactor_r_count = -1;
  static int transactor_twiddle_count = -1;

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
    debug("transactor_twiddle",transactor_twiddle_flags,transactor_twiddle_count);
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
  if (strcmp(varname,"transactor_twiddle") == 0)
    xlator_p = &transactor_twiddle;
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
      transactor_twiddle.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_staller_inst_core_wen,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_staller_inst/core_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_re_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_we_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_rrdy,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst_vec_rsci_s_wrdy,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst/vec_rsci_s_wrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_raddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst/vec_rsci_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_inst_inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst_vec_rsci_s_waddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_inst/inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst/vec_rsci_s_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_re_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst/inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst/twiddle_rsci_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_s_rrdy,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst/inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst/twiddle_rsci_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_inPlaceNTT_DIT_precomp_core_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst_inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core_sct,
      /scverify_top/rtl/inPlaceNTT_DIT_precomp_core_inst/inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst/inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst/twiddle_rsci_s_raddr_core_sct);
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
