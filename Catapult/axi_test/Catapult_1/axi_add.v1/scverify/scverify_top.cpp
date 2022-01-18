#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_trans_rsc.h"
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
#define TOP_HDL_ENTITY axi_add
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_1;
extern double __scv_hold_time_RSCID_2;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_1 = 0;
double __scv_hold_time_RSCID_2 = 0;
#endif

class scverify_top : public sc_module
{
public:
  sc_signal<sc_logic>                                                         rst;
  sc_signal<sc_logic>                                                         rst_n;
  sc_signal<sc_logic>                                                         SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                         SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                         TLS_design_is_idle;
  sc_signal<bool>                                                             TLS_design_is_idle_reg;
  sc_clock                                                                    clk;
  mc_programmable_reset                                                       rst_driver;
  sc_signal<sc_logic>                                                         TLS_rst;
  sc_signal<sc_lv<3> >                                                        TLS_a_rsc_m_wstate;
  sc_signal<sc_logic>                                                         TLS_a_rsc_m_wCaughtUp;
  sc_signal<sc_logic>                                                         TLS_a_rsc_RREADY;
  sc_signal<sc_logic>                                                         TLS_a_rsc_RVALID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_RUSER;
  sc_signal<sc_logic>                                                         TLS_a_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                        TLS_a_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                       TLS_a_rsc_RDATA;
  sc_signal<sc_logic>                                                         TLS_a_rsc_RID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_ARREADY;
  sc_signal<sc_logic>                                                         TLS_a_rsc_ARVALID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                        TLS_a_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_ARCACHE;
  sc_signal<sc_logic>                                                         TLS_a_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                        TLS_a_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                        TLS_a_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                        TLS_a_rsc_ARLEN;
  sc_signal<sc_lv<32> >                                                       TLS_a_rsc_ARADDR;
  sc_signal<sc_logic>                                                         TLS_a_rsc_ARID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_BREADY;
  sc_signal<sc_logic>                                                         TLS_a_rsc_BVALID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                        TLS_a_rsc_BRESP;
  sc_signal<sc_logic>                                                         TLS_a_rsc_BID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_WREADY;
  sc_signal<sc_logic>                                                         TLS_a_rsc_WVALID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_WUSER;
  sc_signal<sc_logic>                                                         TLS_a_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                       TLS_a_rsc_WDATA;
  sc_signal<sc_logic>                                                         TLS_a_rsc_AWREADY;
  sc_signal<sc_logic>                                                         TLS_a_rsc_AWVALID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                        TLS_a_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                        TLS_a_rsc_AWCACHE;
  sc_signal<sc_logic>                                                         TLS_a_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                        TLS_a_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                        TLS_a_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                        TLS_a_rsc_AWLEN;
  sc_signal<sc_lv<32> >                                                       TLS_a_rsc_AWADDR;
  sc_signal<sc_logic>                                                         TLS_a_rsc_AWID;
  sc_signal<sc_logic>                                                         TLS_a_rsc_triosy_lz;
  sc_signal<sc_lv<3> >                                                        TLS_b_rsc_m_wstate;
  sc_signal<sc_logic>                                                         TLS_b_rsc_m_wCaughtUp;
  sc_signal<sc_logic>                                                         TLS_b_rsc_RREADY;
  sc_signal<sc_logic>                                                         TLS_b_rsc_RVALID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_RUSER;
  sc_signal<sc_logic>                                                         TLS_b_rsc_RLAST;
  sc_signal<sc_lv<2> >                                                        TLS_b_rsc_RRESP;
  sc_signal<sc_lv<32> >                                                       TLS_b_rsc_RDATA;
  sc_signal<sc_logic>                                                         TLS_b_rsc_RID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_ARREADY;
  sc_signal<sc_logic>                                                         TLS_b_rsc_ARVALID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_ARUSER;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_ARREGION;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_ARQOS;
  sc_signal<sc_lv<3> >                                                        TLS_b_rsc_ARPROT;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_ARCACHE;
  sc_signal<sc_logic>                                                         TLS_b_rsc_ARLOCK;
  sc_signal<sc_lv<2> >                                                        TLS_b_rsc_ARBURST;
  sc_signal<sc_lv<3> >                                                        TLS_b_rsc_ARSIZE;
  sc_signal<sc_lv<8> >                                                        TLS_b_rsc_ARLEN;
  sc_signal<sc_lv<32> >                                                       TLS_b_rsc_ARADDR;
  sc_signal<sc_logic>                                                         TLS_b_rsc_ARID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_BREADY;
  sc_signal<sc_logic>                                                         TLS_b_rsc_BVALID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_BUSER;
  sc_signal<sc_lv<2> >                                                        TLS_b_rsc_BRESP;
  sc_signal<sc_logic>                                                         TLS_b_rsc_BID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_WREADY;
  sc_signal<sc_logic>                                                         TLS_b_rsc_WVALID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_WUSER;
  sc_signal<sc_logic>                                                         TLS_b_rsc_WLAST;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_WSTRB;
  sc_signal<sc_lv<32> >                                                       TLS_b_rsc_WDATA;
  sc_signal<sc_logic>                                                         TLS_b_rsc_AWREADY;
  sc_signal<sc_logic>                                                         TLS_b_rsc_AWVALID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_AWUSER;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_AWREGION;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_AWQOS;
  sc_signal<sc_lv<3> >                                                        TLS_b_rsc_AWPROT;
  sc_signal<sc_lv<4> >                                                        TLS_b_rsc_AWCACHE;
  sc_signal<sc_logic>                                                         TLS_b_rsc_AWLOCK;
  sc_signal<sc_lv<2> >                                                        TLS_b_rsc_AWBURST;
  sc_signal<sc_lv<3> >                                                        TLS_b_rsc_AWSIZE;
  sc_signal<sc_lv<8> >                                                        TLS_b_rsc_AWLEN;
  sc_signal<sc_lv<32> >                                                       TLS_b_rsc_AWADDR;
  sc_signal<sc_logic>                                                         TLS_b_rsc_AWID;
  sc_signal<sc_logic>                                                         TLS_b_rsc_triosy_lz;
  ccs_DUT_wrapper                                                             axi_add_INST;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_AWID;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_AWUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_WUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_BID;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_a_rsc_BID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_BUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_a_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_ARID;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_ARUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_RID;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_a_rsc_RID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_a_rsc_RUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_a_rsc_RUSER;
  ccs_axi4_master_trans_rsc<16,32,32,4,0,0,0,32,32,1,1,1,0,0,0,0 >            a_rsc_INST;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_AWID;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_AWUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_WUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_WUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_BID;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_b_rsc_BID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_BUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_b_rsc_BUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_ARID;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_ARUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                              CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARUSER;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_RID;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_b_rsc_RID;
  sc_signal<sc_lv<1> >                                                        CCS_ADAPTOR_b_rsc_RUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                              CCS_ADAPTOR_TLS_b_rsc_RUSER;
  ccs_axi4_master_trans_rsc<16,32,32,4,0,0,0,32,32,1,1,1,0,0,0,0 >            b_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16> >                 TLS_in_fifo_a;
  tlm::tlm_fifo<mc_wait_ctrl>                                                 TLS_in_wait_ctrl_fifo_a;
  mc_trios_input_monitor                                                      trios_monitor_a_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16>,32,false>   transactor_a;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16> >                 TLS_out_fifo_b;
  tlm::tlm_fifo<mc_wait_ctrl>                                                 TLS_out_wait_ctrl_fifo_b;
  mc_trios_output_monitor                                                     trios_monitor_b_rsc_triosy_lz_INST;
  mc_output_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16>,32,false>  transactor_b;
  mc_testbench                                                                testbench_INST;
  sc_signal<sc_logic>                                                         catapult_start;
  sc_signal<sc_logic>                                                         catapult_done;
  sc_signal<sc_logic>                                                         catapult_ready;
  sc_signal<sc_logic>                                                         in_sync;
  sc_signal<sc_logic>                                                         out_sync;
  sc_signal<sc_logic>                                                         inout_sync;
  sc_signal<unsigned>                                                         wait_for_init;
  sync_generator                                                              sync_generator_INST;
  catapult_monitor                                                            catapult_monitor_INST;
  ccs_probe_monitor                                                          *ccs_probe_monitor_INST;
  sc_event                                                                    generate_reset_event;
  sc_event                                                                    deadlock_event;
  sc_signal<sc_logic>                                                         deadlocked;
  sc_signal<sc_logic>                                                         maxsimtime;
  sc_event                                                                    max_sim_time_event;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_staller_inst_core_wen;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_a_rsci_inst_axi_add_core_a_rsci_a_rsc_wait_ctrl_inst_a_rsci_m_re_core_sct;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_a_rsci_inst_axi_add_core_a_rsci_a_rsc_wait_ctrl_inst_a_rsci_m_rrdy;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_a_rsci_inst_axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr_core_sct;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_b_rsci_inst_axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr_core_sct;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_b_rsci_inst_axi_add_core_b_rsci_b_rsc_wait_ctrl_inst_b_rsci_m_we_core_sct;
  sc_signal<sc_logic>                                                         OFS_axi_add_core_inst_axi_add_core_b_rsci_inst_axi_add_core_b_rsci_b_rsc_wait_ctrl_inst_b_rsci_m_wrdy;
  sc_signal<sc_logic>                                                         TLS_enable_stalls;
  sc_signal<unsigned short>                                                   TLS_stall_coverage;

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
    , CCS_CLK_CTOR(clk, "clk", 10, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 120.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_a_rsc_m_wstate("TLS_a_rsc_m_wstate")
    , TLS_a_rsc_m_wCaughtUp("TLS_a_rsc_m_wCaughtUp")
    , TLS_a_rsc_RREADY("TLS_a_rsc_RREADY")
    , TLS_a_rsc_RVALID("TLS_a_rsc_RVALID")
    , TLS_a_rsc_RUSER("TLS_a_rsc_RUSER")
    , TLS_a_rsc_RLAST("TLS_a_rsc_RLAST")
    , TLS_a_rsc_RRESP("TLS_a_rsc_RRESP")
    , TLS_a_rsc_RDATA("TLS_a_rsc_RDATA")
    , TLS_a_rsc_RID("TLS_a_rsc_RID")
    , TLS_a_rsc_ARREADY("TLS_a_rsc_ARREADY")
    , TLS_a_rsc_ARVALID("TLS_a_rsc_ARVALID")
    , TLS_a_rsc_ARUSER("TLS_a_rsc_ARUSER")
    , TLS_a_rsc_ARREGION("TLS_a_rsc_ARREGION")
    , TLS_a_rsc_ARQOS("TLS_a_rsc_ARQOS")
    , TLS_a_rsc_ARPROT("TLS_a_rsc_ARPROT")
    , TLS_a_rsc_ARCACHE("TLS_a_rsc_ARCACHE")
    , TLS_a_rsc_ARLOCK("TLS_a_rsc_ARLOCK")
    , TLS_a_rsc_ARBURST("TLS_a_rsc_ARBURST")
    , TLS_a_rsc_ARSIZE("TLS_a_rsc_ARSIZE")
    , TLS_a_rsc_ARLEN("TLS_a_rsc_ARLEN")
    , TLS_a_rsc_ARADDR("TLS_a_rsc_ARADDR")
    , TLS_a_rsc_ARID("TLS_a_rsc_ARID")
    , TLS_a_rsc_BREADY("TLS_a_rsc_BREADY")
    , TLS_a_rsc_BVALID("TLS_a_rsc_BVALID")
    , TLS_a_rsc_BUSER("TLS_a_rsc_BUSER")
    , TLS_a_rsc_BRESP("TLS_a_rsc_BRESP")
    , TLS_a_rsc_BID("TLS_a_rsc_BID")
    , TLS_a_rsc_WREADY("TLS_a_rsc_WREADY")
    , TLS_a_rsc_WVALID("TLS_a_rsc_WVALID")
    , TLS_a_rsc_WUSER("TLS_a_rsc_WUSER")
    , TLS_a_rsc_WLAST("TLS_a_rsc_WLAST")
    , TLS_a_rsc_WSTRB("TLS_a_rsc_WSTRB")
    , TLS_a_rsc_WDATA("TLS_a_rsc_WDATA")
    , TLS_a_rsc_AWREADY("TLS_a_rsc_AWREADY")
    , TLS_a_rsc_AWVALID("TLS_a_rsc_AWVALID")
    , TLS_a_rsc_AWUSER("TLS_a_rsc_AWUSER")
    , TLS_a_rsc_AWREGION("TLS_a_rsc_AWREGION")
    , TLS_a_rsc_AWQOS("TLS_a_rsc_AWQOS")
    , TLS_a_rsc_AWPROT("TLS_a_rsc_AWPROT")
    , TLS_a_rsc_AWCACHE("TLS_a_rsc_AWCACHE")
    , TLS_a_rsc_AWLOCK("TLS_a_rsc_AWLOCK")
    , TLS_a_rsc_AWBURST("TLS_a_rsc_AWBURST")
    , TLS_a_rsc_AWSIZE("TLS_a_rsc_AWSIZE")
    , TLS_a_rsc_AWLEN("TLS_a_rsc_AWLEN")
    , TLS_a_rsc_AWADDR("TLS_a_rsc_AWADDR")
    , TLS_a_rsc_AWID("TLS_a_rsc_AWID")
    , TLS_a_rsc_triosy_lz("TLS_a_rsc_triosy_lz")
    , TLS_b_rsc_m_wstate("TLS_b_rsc_m_wstate")
    , TLS_b_rsc_m_wCaughtUp("TLS_b_rsc_m_wCaughtUp")
    , TLS_b_rsc_RREADY("TLS_b_rsc_RREADY")
    , TLS_b_rsc_RVALID("TLS_b_rsc_RVALID")
    , TLS_b_rsc_RUSER("TLS_b_rsc_RUSER")
    , TLS_b_rsc_RLAST("TLS_b_rsc_RLAST")
    , TLS_b_rsc_RRESP("TLS_b_rsc_RRESP")
    , TLS_b_rsc_RDATA("TLS_b_rsc_RDATA")
    , TLS_b_rsc_RID("TLS_b_rsc_RID")
    , TLS_b_rsc_ARREADY("TLS_b_rsc_ARREADY")
    , TLS_b_rsc_ARVALID("TLS_b_rsc_ARVALID")
    , TLS_b_rsc_ARUSER("TLS_b_rsc_ARUSER")
    , TLS_b_rsc_ARREGION("TLS_b_rsc_ARREGION")
    , TLS_b_rsc_ARQOS("TLS_b_rsc_ARQOS")
    , TLS_b_rsc_ARPROT("TLS_b_rsc_ARPROT")
    , TLS_b_rsc_ARCACHE("TLS_b_rsc_ARCACHE")
    , TLS_b_rsc_ARLOCK("TLS_b_rsc_ARLOCK")
    , TLS_b_rsc_ARBURST("TLS_b_rsc_ARBURST")
    , TLS_b_rsc_ARSIZE("TLS_b_rsc_ARSIZE")
    , TLS_b_rsc_ARLEN("TLS_b_rsc_ARLEN")
    , TLS_b_rsc_ARADDR("TLS_b_rsc_ARADDR")
    , TLS_b_rsc_ARID("TLS_b_rsc_ARID")
    , TLS_b_rsc_BREADY("TLS_b_rsc_BREADY")
    , TLS_b_rsc_BVALID("TLS_b_rsc_BVALID")
    , TLS_b_rsc_BUSER("TLS_b_rsc_BUSER")
    , TLS_b_rsc_BRESP("TLS_b_rsc_BRESP")
    , TLS_b_rsc_BID("TLS_b_rsc_BID")
    , TLS_b_rsc_WREADY("TLS_b_rsc_WREADY")
    , TLS_b_rsc_WVALID("TLS_b_rsc_WVALID")
    , TLS_b_rsc_WUSER("TLS_b_rsc_WUSER")
    , TLS_b_rsc_WLAST("TLS_b_rsc_WLAST")
    , TLS_b_rsc_WSTRB("TLS_b_rsc_WSTRB")
    , TLS_b_rsc_WDATA("TLS_b_rsc_WDATA")
    , TLS_b_rsc_AWREADY("TLS_b_rsc_AWREADY")
    , TLS_b_rsc_AWVALID("TLS_b_rsc_AWVALID")
    , TLS_b_rsc_AWUSER("TLS_b_rsc_AWUSER")
    , TLS_b_rsc_AWREGION("TLS_b_rsc_AWREGION")
    , TLS_b_rsc_AWQOS("TLS_b_rsc_AWQOS")
    , TLS_b_rsc_AWPROT("TLS_b_rsc_AWPROT")
    , TLS_b_rsc_AWCACHE("TLS_b_rsc_AWCACHE")
    , TLS_b_rsc_AWLOCK("TLS_b_rsc_AWLOCK")
    , TLS_b_rsc_AWBURST("TLS_b_rsc_AWBURST")
    , TLS_b_rsc_AWSIZE("TLS_b_rsc_AWSIZE")
    , TLS_b_rsc_AWLEN("TLS_b_rsc_AWLEN")
    , TLS_b_rsc_AWADDR("TLS_b_rsc_AWADDR")
    , TLS_b_rsc_AWID("TLS_b_rsc_AWID")
    , TLS_b_rsc_triosy_lz("TLS_b_rsc_triosy_lz")
    , axi_add_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWID("CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWID")
    , CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWUSER("CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_WUSER("CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_WUSER")
    , CCS_ADAPTOR_TLS_a_rsc_BID("CCS_ADAPTOR_TLS_a_rsc_BID")
    , CCS_ADAPTOR_TLS_a_rsc_BUSER("CCS_ADAPTOR_TLS_a_rsc_BUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARID("CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARID")
    , CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARUSER("CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARUSER")
    , CCS_ADAPTOR_TLS_a_rsc_RID("CCS_ADAPTOR_TLS_a_rsc_RID")
    , CCS_ADAPTOR_TLS_a_rsc_RUSER("CCS_ADAPTOR_TLS_a_rsc_RUSER")
    , a_rsc_INST("a_rsc", true)
    , CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWID("CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWID")
    , CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWUSER("CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_WUSER("CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_WUSER")
    , CCS_ADAPTOR_TLS_b_rsc_BID("CCS_ADAPTOR_TLS_b_rsc_BID")
    , CCS_ADAPTOR_TLS_b_rsc_BUSER("CCS_ADAPTOR_TLS_b_rsc_BUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARID("CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARID")
    , CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARUSER("CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARUSER")
    , CCS_ADAPTOR_TLS_b_rsc_RID("CCS_ADAPTOR_TLS_b_rsc_RID")
    , CCS_ADAPTOR_TLS_b_rsc_RUSER("CCS_ADAPTOR_TLS_b_rsc_RUSER")
    , b_rsc_INST("b_rsc", true)
    , TLS_in_fifo_a("TLS_in_fifo_a", -1)
    , TLS_in_wait_ctrl_fifo_a("TLS_in_wait_ctrl_fifo_a", -1)
    , trios_monitor_a_rsc_triosy_lz_INST("trios_monitor_a_rsc_triosy_lz_INST")
    , transactor_a("transactor_a", 0, 32, 0)
    , TLS_out_fifo_b("TLS_out_fifo_b", -1)
    , TLS_out_wait_ctrl_fifo_b("TLS_out_wait_ctrl_fifo_b", -1)
    , trios_monitor_b_rsc_triosy_lz_INST("trios_monitor_b_rsc_triosy_lz_INST")
    , transactor_b("transactor_b", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 34, 34, 0)
    , catapult_monitor_INST("Monitor", clk, true, 34LL, 34LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    axi_add_INST.clk(clk);
    axi_add_INST.rst(TLS_rst);
    axi_add_INST.a_rsc_m_wstate(TLS_a_rsc_m_wstate);
    axi_add_INST.a_rsc_m_wCaughtUp(TLS_a_rsc_m_wCaughtUp);
    axi_add_INST.a_rsc_RREADY(TLS_a_rsc_RREADY);
    axi_add_INST.a_rsc_RVALID(TLS_a_rsc_RVALID);
    axi_add_INST.a_rsc_RUSER(TLS_a_rsc_RUSER);
    axi_add_INST.a_rsc_RLAST(TLS_a_rsc_RLAST);
    axi_add_INST.a_rsc_RRESP(TLS_a_rsc_RRESP);
    axi_add_INST.a_rsc_RDATA(TLS_a_rsc_RDATA);
    axi_add_INST.a_rsc_RID(TLS_a_rsc_RID);
    axi_add_INST.a_rsc_ARREADY(TLS_a_rsc_ARREADY);
    axi_add_INST.a_rsc_ARVALID(TLS_a_rsc_ARVALID);
    axi_add_INST.a_rsc_ARUSER(TLS_a_rsc_ARUSER);
    axi_add_INST.a_rsc_ARREGION(TLS_a_rsc_ARREGION);
    axi_add_INST.a_rsc_ARQOS(TLS_a_rsc_ARQOS);
    axi_add_INST.a_rsc_ARPROT(TLS_a_rsc_ARPROT);
    axi_add_INST.a_rsc_ARCACHE(TLS_a_rsc_ARCACHE);
    axi_add_INST.a_rsc_ARLOCK(TLS_a_rsc_ARLOCK);
    axi_add_INST.a_rsc_ARBURST(TLS_a_rsc_ARBURST);
    axi_add_INST.a_rsc_ARSIZE(TLS_a_rsc_ARSIZE);
    axi_add_INST.a_rsc_ARLEN(TLS_a_rsc_ARLEN);
    axi_add_INST.a_rsc_ARADDR(TLS_a_rsc_ARADDR);
    axi_add_INST.a_rsc_ARID(TLS_a_rsc_ARID);
    axi_add_INST.a_rsc_BREADY(TLS_a_rsc_BREADY);
    axi_add_INST.a_rsc_BVALID(TLS_a_rsc_BVALID);
    axi_add_INST.a_rsc_BUSER(TLS_a_rsc_BUSER);
    axi_add_INST.a_rsc_BRESP(TLS_a_rsc_BRESP);
    axi_add_INST.a_rsc_BID(TLS_a_rsc_BID);
    axi_add_INST.a_rsc_WREADY(TLS_a_rsc_WREADY);
    axi_add_INST.a_rsc_WVALID(TLS_a_rsc_WVALID);
    axi_add_INST.a_rsc_WUSER(TLS_a_rsc_WUSER);
    axi_add_INST.a_rsc_WLAST(TLS_a_rsc_WLAST);
    axi_add_INST.a_rsc_WSTRB(TLS_a_rsc_WSTRB);
    axi_add_INST.a_rsc_WDATA(TLS_a_rsc_WDATA);
    axi_add_INST.a_rsc_AWREADY(TLS_a_rsc_AWREADY);
    axi_add_INST.a_rsc_AWVALID(TLS_a_rsc_AWVALID);
    axi_add_INST.a_rsc_AWUSER(TLS_a_rsc_AWUSER);
    axi_add_INST.a_rsc_AWREGION(TLS_a_rsc_AWREGION);
    axi_add_INST.a_rsc_AWQOS(TLS_a_rsc_AWQOS);
    axi_add_INST.a_rsc_AWPROT(TLS_a_rsc_AWPROT);
    axi_add_INST.a_rsc_AWCACHE(TLS_a_rsc_AWCACHE);
    axi_add_INST.a_rsc_AWLOCK(TLS_a_rsc_AWLOCK);
    axi_add_INST.a_rsc_AWBURST(TLS_a_rsc_AWBURST);
    axi_add_INST.a_rsc_AWSIZE(TLS_a_rsc_AWSIZE);
    axi_add_INST.a_rsc_AWLEN(TLS_a_rsc_AWLEN);
    axi_add_INST.a_rsc_AWADDR(TLS_a_rsc_AWADDR);
    axi_add_INST.a_rsc_AWID(TLS_a_rsc_AWID);
    axi_add_INST.a_rsc_triosy_lz(TLS_a_rsc_triosy_lz);
    axi_add_INST.b_rsc_m_wstate(TLS_b_rsc_m_wstate);
    axi_add_INST.b_rsc_m_wCaughtUp(TLS_b_rsc_m_wCaughtUp);
    axi_add_INST.b_rsc_RREADY(TLS_b_rsc_RREADY);
    axi_add_INST.b_rsc_RVALID(TLS_b_rsc_RVALID);
    axi_add_INST.b_rsc_RUSER(TLS_b_rsc_RUSER);
    axi_add_INST.b_rsc_RLAST(TLS_b_rsc_RLAST);
    axi_add_INST.b_rsc_RRESP(TLS_b_rsc_RRESP);
    axi_add_INST.b_rsc_RDATA(TLS_b_rsc_RDATA);
    axi_add_INST.b_rsc_RID(TLS_b_rsc_RID);
    axi_add_INST.b_rsc_ARREADY(TLS_b_rsc_ARREADY);
    axi_add_INST.b_rsc_ARVALID(TLS_b_rsc_ARVALID);
    axi_add_INST.b_rsc_ARUSER(TLS_b_rsc_ARUSER);
    axi_add_INST.b_rsc_ARREGION(TLS_b_rsc_ARREGION);
    axi_add_INST.b_rsc_ARQOS(TLS_b_rsc_ARQOS);
    axi_add_INST.b_rsc_ARPROT(TLS_b_rsc_ARPROT);
    axi_add_INST.b_rsc_ARCACHE(TLS_b_rsc_ARCACHE);
    axi_add_INST.b_rsc_ARLOCK(TLS_b_rsc_ARLOCK);
    axi_add_INST.b_rsc_ARBURST(TLS_b_rsc_ARBURST);
    axi_add_INST.b_rsc_ARSIZE(TLS_b_rsc_ARSIZE);
    axi_add_INST.b_rsc_ARLEN(TLS_b_rsc_ARLEN);
    axi_add_INST.b_rsc_ARADDR(TLS_b_rsc_ARADDR);
    axi_add_INST.b_rsc_ARID(TLS_b_rsc_ARID);
    axi_add_INST.b_rsc_BREADY(TLS_b_rsc_BREADY);
    axi_add_INST.b_rsc_BVALID(TLS_b_rsc_BVALID);
    axi_add_INST.b_rsc_BUSER(TLS_b_rsc_BUSER);
    axi_add_INST.b_rsc_BRESP(TLS_b_rsc_BRESP);
    axi_add_INST.b_rsc_BID(TLS_b_rsc_BID);
    axi_add_INST.b_rsc_WREADY(TLS_b_rsc_WREADY);
    axi_add_INST.b_rsc_WVALID(TLS_b_rsc_WVALID);
    axi_add_INST.b_rsc_WUSER(TLS_b_rsc_WUSER);
    axi_add_INST.b_rsc_WLAST(TLS_b_rsc_WLAST);
    axi_add_INST.b_rsc_WSTRB(TLS_b_rsc_WSTRB);
    axi_add_INST.b_rsc_WDATA(TLS_b_rsc_WDATA);
    axi_add_INST.b_rsc_AWREADY(TLS_b_rsc_AWREADY);
    axi_add_INST.b_rsc_AWVALID(TLS_b_rsc_AWVALID);
    axi_add_INST.b_rsc_AWUSER(TLS_b_rsc_AWUSER);
    axi_add_INST.b_rsc_AWREGION(TLS_b_rsc_AWREGION);
    axi_add_INST.b_rsc_AWQOS(TLS_b_rsc_AWQOS);
    axi_add_INST.b_rsc_AWPROT(TLS_b_rsc_AWPROT);
    axi_add_INST.b_rsc_AWCACHE(TLS_b_rsc_AWCACHE);
    axi_add_INST.b_rsc_AWLOCK(TLS_b_rsc_AWLOCK);
    axi_add_INST.b_rsc_AWBURST(TLS_b_rsc_AWBURST);
    axi_add_INST.b_rsc_AWSIZE(TLS_b_rsc_AWSIZE);
    axi_add_INST.b_rsc_AWLEN(TLS_b_rsc_AWLEN);
    axi_add_INST.b_rsc_AWADDR(TLS_b_rsc_AWADDR);
    axi_add_INST.b_rsc_AWID(TLS_b_rsc_AWID);
    axi_add_INST.b_rsc_triosy_lz(TLS_b_rsc_triosy_lz);

    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWID.inSCALAR(TLS_a_rsc_AWID);
    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWID.outVECTOR(CCS_ADAPTOR_a_rsc_AWID);

    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWUSER.inSCALAR(TLS_a_rsc_AWUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_AWUSER.outVECTOR(CCS_ADAPTOR_a_rsc_AWUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_WUSER.inSCALAR(TLS_a_rsc_WUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_WUSER.outVECTOR(CCS_ADAPTOR_a_rsc_WUSER);

    CCS_ADAPTOR_TLS_a_rsc_BID.inVECTOR(CCS_ADAPTOR_a_rsc_BID);
    CCS_ADAPTOR_TLS_a_rsc_BID.outSCALAR(TLS_a_rsc_BID);

    CCS_ADAPTOR_TLS_a_rsc_BUSER.inVECTOR(CCS_ADAPTOR_a_rsc_BUSER);
    CCS_ADAPTOR_TLS_a_rsc_BUSER.outSCALAR(TLS_a_rsc_BUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARID.inSCALAR(TLS_a_rsc_ARID);
    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARID.outVECTOR(CCS_ADAPTOR_a_rsc_ARID);

    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARUSER.inSCALAR(TLS_a_rsc_ARUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_a_rsc_ARUSER.outVECTOR(CCS_ADAPTOR_a_rsc_ARUSER);

    CCS_ADAPTOR_TLS_a_rsc_RID.inVECTOR(CCS_ADAPTOR_a_rsc_RID);
    CCS_ADAPTOR_TLS_a_rsc_RID.outSCALAR(TLS_a_rsc_RID);

    CCS_ADAPTOR_TLS_a_rsc_RUSER.inVECTOR(CCS_ADAPTOR_a_rsc_RUSER);
    CCS_ADAPTOR_TLS_a_rsc_RUSER.outSCALAR(TLS_a_rsc_RUSER);

    a_rsc_INST.ACLK(clk);
    a_rsc_INST.ARESETn(rst);
    a_rsc_INST.AWID(CCS_ADAPTOR_a_rsc_AWID);
    a_rsc_INST.AWADDR(TLS_a_rsc_AWADDR);
    a_rsc_INST.AWLEN(TLS_a_rsc_AWLEN);
    a_rsc_INST.AWSIZE(TLS_a_rsc_AWSIZE);
    a_rsc_INST.AWBURST(TLS_a_rsc_AWBURST);
    a_rsc_INST.AWLOCK(TLS_a_rsc_AWLOCK);
    a_rsc_INST.AWCACHE(TLS_a_rsc_AWCACHE);
    a_rsc_INST.AWPROT(TLS_a_rsc_AWPROT);
    a_rsc_INST.AWQOS(TLS_a_rsc_AWQOS);
    a_rsc_INST.AWREGION(TLS_a_rsc_AWREGION);
    a_rsc_INST.AWUSER(CCS_ADAPTOR_a_rsc_AWUSER);
    a_rsc_INST.AWVALID(TLS_a_rsc_AWVALID);
    a_rsc_INST.AWREADY(TLS_a_rsc_AWREADY);
    a_rsc_INST.WDATA(TLS_a_rsc_WDATA);
    a_rsc_INST.WSTRB(TLS_a_rsc_WSTRB);
    a_rsc_INST.WLAST(TLS_a_rsc_WLAST);
    a_rsc_INST.WUSER(CCS_ADAPTOR_a_rsc_WUSER);
    a_rsc_INST.WVALID(TLS_a_rsc_WVALID);
    a_rsc_INST.WREADY(TLS_a_rsc_WREADY);
    a_rsc_INST.BID(CCS_ADAPTOR_a_rsc_BID);
    a_rsc_INST.BRESP(TLS_a_rsc_BRESP);
    a_rsc_INST.BUSER(CCS_ADAPTOR_a_rsc_BUSER);
    a_rsc_INST.BVALID(TLS_a_rsc_BVALID);
    a_rsc_INST.BREADY(TLS_a_rsc_BREADY);
    a_rsc_INST.ARID(CCS_ADAPTOR_a_rsc_ARID);
    a_rsc_INST.ARADDR(TLS_a_rsc_ARADDR);
    a_rsc_INST.ARLEN(TLS_a_rsc_ARLEN);
    a_rsc_INST.ARSIZE(TLS_a_rsc_ARSIZE);
    a_rsc_INST.ARBURST(TLS_a_rsc_ARBURST);
    a_rsc_INST.ARLOCK(TLS_a_rsc_ARLOCK);
    a_rsc_INST.ARCACHE(TLS_a_rsc_ARCACHE);
    a_rsc_INST.ARPROT(TLS_a_rsc_ARPROT);
    a_rsc_INST.ARQOS(TLS_a_rsc_ARQOS);
    a_rsc_INST.ARREGION(TLS_a_rsc_ARREGION);
    a_rsc_INST.ARUSER(CCS_ADAPTOR_a_rsc_ARUSER);
    a_rsc_INST.ARVALID(TLS_a_rsc_ARVALID);
    a_rsc_INST.ARREADY(TLS_a_rsc_ARREADY);
    a_rsc_INST.RID(CCS_ADAPTOR_a_rsc_RID);
    a_rsc_INST.RDATA(TLS_a_rsc_RDATA);
    a_rsc_INST.RRESP(TLS_a_rsc_RRESP);
    a_rsc_INST.RLAST(TLS_a_rsc_RLAST);
    a_rsc_INST.RUSER(CCS_ADAPTOR_a_rsc_RUSER);
    a_rsc_INST.RVALID(TLS_a_rsc_RVALID);
    a_rsc_INST.RREADY(TLS_a_rsc_RREADY);
    a_rsc_INST.m_wCaughtUp(TLS_a_rsc_m_wCaughtUp);
    a_rsc_INST.m_wstate(TLS_a_rsc_m_wstate);
    a_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWID.inSCALAR(TLS_b_rsc_AWID);
    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWID.outVECTOR(CCS_ADAPTOR_b_rsc_AWID);

    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWUSER.inSCALAR(TLS_b_rsc_AWUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_AWUSER.outVECTOR(CCS_ADAPTOR_b_rsc_AWUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_WUSER.inSCALAR(TLS_b_rsc_WUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_WUSER.outVECTOR(CCS_ADAPTOR_b_rsc_WUSER);

    CCS_ADAPTOR_TLS_b_rsc_BID.inVECTOR(CCS_ADAPTOR_b_rsc_BID);
    CCS_ADAPTOR_TLS_b_rsc_BID.outSCALAR(TLS_b_rsc_BID);

    CCS_ADAPTOR_TLS_b_rsc_BUSER.inVECTOR(CCS_ADAPTOR_b_rsc_BUSER);
    CCS_ADAPTOR_TLS_b_rsc_BUSER.outSCALAR(TLS_b_rsc_BUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARID.inSCALAR(TLS_b_rsc_ARID);
    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARID.outVECTOR(CCS_ADAPTOR_b_rsc_ARID);

    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARUSER.inSCALAR(TLS_b_rsc_ARUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_b_rsc_ARUSER.outVECTOR(CCS_ADAPTOR_b_rsc_ARUSER);

    CCS_ADAPTOR_TLS_b_rsc_RID.inVECTOR(CCS_ADAPTOR_b_rsc_RID);
    CCS_ADAPTOR_TLS_b_rsc_RID.outSCALAR(TLS_b_rsc_RID);

    CCS_ADAPTOR_TLS_b_rsc_RUSER.inVECTOR(CCS_ADAPTOR_b_rsc_RUSER);
    CCS_ADAPTOR_TLS_b_rsc_RUSER.outSCALAR(TLS_b_rsc_RUSER);

    b_rsc_INST.ACLK(clk);
    b_rsc_INST.ARESETn(rst);
    b_rsc_INST.AWID(CCS_ADAPTOR_b_rsc_AWID);
    b_rsc_INST.AWADDR(TLS_b_rsc_AWADDR);
    b_rsc_INST.AWLEN(TLS_b_rsc_AWLEN);
    b_rsc_INST.AWSIZE(TLS_b_rsc_AWSIZE);
    b_rsc_INST.AWBURST(TLS_b_rsc_AWBURST);
    b_rsc_INST.AWLOCK(TLS_b_rsc_AWLOCK);
    b_rsc_INST.AWCACHE(TLS_b_rsc_AWCACHE);
    b_rsc_INST.AWPROT(TLS_b_rsc_AWPROT);
    b_rsc_INST.AWQOS(TLS_b_rsc_AWQOS);
    b_rsc_INST.AWREGION(TLS_b_rsc_AWREGION);
    b_rsc_INST.AWUSER(CCS_ADAPTOR_b_rsc_AWUSER);
    b_rsc_INST.AWVALID(TLS_b_rsc_AWVALID);
    b_rsc_INST.AWREADY(TLS_b_rsc_AWREADY);
    b_rsc_INST.WDATA(TLS_b_rsc_WDATA);
    b_rsc_INST.WSTRB(TLS_b_rsc_WSTRB);
    b_rsc_INST.WLAST(TLS_b_rsc_WLAST);
    b_rsc_INST.WUSER(CCS_ADAPTOR_b_rsc_WUSER);
    b_rsc_INST.WVALID(TLS_b_rsc_WVALID);
    b_rsc_INST.WREADY(TLS_b_rsc_WREADY);
    b_rsc_INST.BID(CCS_ADAPTOR_b_rsc_BID);
    b_rsc_INST.BRESP(TLS_b_rsc_BRESP);
    b_rsc_INST.BUSER(CCS_ADAPTOR_b_rsc_BUSER);
    b_rsc_INST.BVALID(TLS_b_rsc_BVALID);
    b_rsc_INST.BREADY(TLS_b_rsc_BREADY);
    b_rsc_INST.ARID(CCS_ADAPTOR_b_rsc_ARID);
    b_rsc_INST.ARADDR(TLS_b_rsc_ARADDR);
    b_rsc_INST.ARLEN(TLS_b_rsc_ARLEN);
    b_rsc_INST.ARSIZE(TLS_b_rsc_ARSIZE);
    b_rsc_INST.ARBURST(TLS_b_rsc_ARBURST);
    b_rsc_INST.ARLOCK(TLS_b_rsc_ARLOCK);
    b_rsc_INST.ARCACHE(TLS_b_rsc_ARCACHE);
    b_rsc_INST.ARPROT(TLS_b_rsc_ARPROT);
    b_rsc_INST.ARQOS(TLS_b_rsc_ARQOS);
    b_rsc_INST.ARREGION(TLS_b_rsc_ARREGION);
    b_rsc_INST.ARUSER(CCS_ADAPTOR_b_rsc_ARUSER);
    b_rsc_INST.ARVALID(TLS_b_rsc_ARVALID);
    b_rsc_INST.ARREADY(TLS_b_rsc_ARREADY);
    b_rsc_INST.RID(CCS_ADAPTOR_b_rsc_RID);
    b_rsc_INST.RDATA(TLS_b_rsc_RDATA);
    b_rsc_INST.RRESP(TLS_b_rsc_RRESP);
    b_rsc_INST.RLAST(TLS_b_rsc_RLAST);
    b_rsc_INST.RUSER(CCS_ADAPTOR_b_rsc_RUSER);
    b_rsc_INST.RVALID(TLS_b_rsc_RVALID);
    b_rsc_INST.RREADY(TLS_b_rsc_RREADY);
    b_rsc_INST.m_wCaughtUp(TLS_b_rsc_m_wCaughtUp);
    b_rsc_INST.m_wstate(TLS_b_rsc_m_wstate);
    b_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    trios_monitor_a_rsc_triosy_lz_INST.trios(TLS_a_rsc_triosy_lz);
    trios_monitor_a_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_a.in_fifo(TLS_in_fifo_a);
    transactor_a.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_a);
    transactor_a.bind_clk(clk, true, rst);
    transactor_a.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_a.register_block(&a_rsc_INST, a_rsc_INST.basename(), TLS_a_rsc_triosy_lz, 0, 15, 1);

    trios_monitor_b_rsc_triosy_lz_INST.trios(TLS_b_rsc_triosy_lz);
    trios_monitor_b_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_b.out_fifo(TLS_out_fifo_b);
    transactor_b.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_b);
    transactor_b.bind_clk(clk, true, rst);
    transactor_b.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_b.register_block(&b_rsc_INST, b_rsc_INST.basename(), TLS_b_rsc_triosy_lz, 0, 15, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_a(TLS_in_fifo_a);
    testbench_INST.ccs_wait_ctrl_a(TLS_in_wait_ctrl_fifo_a);
    testbench_INST.ccs_b(TLS_out_fifo_b);
    testbench_INST.ccs_wait_ctrl_b(TLS_out_wait_ctrl_fifo_b);
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
  a_rsc_INST.clear();
  b_rsc_INST.clear();
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
    transactor_a.set_auto_wait_limit(l);
    transactor_b.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_a_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_b_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_a_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_b_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_a_count = -1;
  static int transactor_b_count = -1;

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
    debug("transactor_a",transactor_a_flags,transactor_a_count);
    debug("transactor_b",transactor_b_flags,transactor_b_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_a") == 0)
    xlator_p = &transactor_a;
  if (strcmp(varname,"transactor_b") == 0)
    xlator_p = &transactor_b;
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
      transactor_a.reset_streams();
      transactor_b.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_staller_inst_core_wen, /scverify_top/rtl/axi_add_core_inst/axi_add_core_staller_inst/core_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_a_rsci_inst_axi_add_core_a_rsci_a_rsc_wait_ctrl_inst_a_rsci_m_re_core_sct,
      /scverify_top/rtl/axi_add_core_inst/axi_add_core_a_rsci_inst/axi_add_core_a_rsci_a_rsc_wait_ctrl_inst/a_rsci_m_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_a_rsci_inst_axi_add_core_a_rsci_a_rsc_wait_ctrl_inst_a_rsci_m_rrdy,
      /scverify_top/rtl/axi_add_core_inst/axi_add_core_a_rsci_inst/axi_add_core_a_rsci_a_rsc_wait_ctrl_inst/a_rsci_m_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_a_rsci_inst_axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr_core_sct,
      /scverify_top/rtl/axi_add_core_inst/axi_add_core_a_rsci_inst/axi_add_core_a_rsci_a_rsc_wait_dp_inst/a_rsci_m_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_b_rsci_inst_axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr_core_sct,
      /scverify_top/rtl/axi_add_core_inst/axi_add_core_b_rsci_inst/axi_add_core_b_rsci_b_rsc_wait_dp_inst/b_rsci_m_waddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_b_rsci_inst_axi_add_core_b_rsci_b_rsc_wait_ctrl_inst_b_rsci_m_we_core_sct,
      /scverify_top/rtl/axi_add_core_inst/axi_add_core_b_rsci_inst/axi_add_core_b_rsci_b_rsc_wait_ctrl_inst/b_rsci_m_we_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_add_core_inst_axi_add_core_b_rsci_inst_axi_add_core_b_rsci_b_rsc_wait_ctrl_inst_b_rsci_m_wrdy,
      /scverify_top/rtl/axi_add_core_inst/axi_add_core_b_rsci_inst/axi_add_core_b_rsci_b_rsc_wait_ctrl_inst/b_rsci_m_wrdy);
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
