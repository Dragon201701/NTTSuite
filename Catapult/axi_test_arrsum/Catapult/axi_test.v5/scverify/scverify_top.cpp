#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
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
#define TOP_HDL_ENTITY axi_test
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
  sc_signal<sc_logic>                                                        rst;
  sc_signal<sc_logic>                                                        rst_n;
  sc_signal<sc_logic>                                                        SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                        SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                        TLS_design_is_idle;
  sc_signal<bool>                                                            TLS_design_is_idle_reg;
  sc_clock                                                                   clk;
  mc_programmable_reset                                                      rst_driver;
  sc_signal<sc_logic>                                                        TLS_rst;
  sc_signal<sc_logic>                                                        TLS_run_rsc_rdy;
  sc_signal<sc_logic>                                                        TLS_run_rsc_vld;
  sc_signal<sc_lv<4> >                                                       TLS_a_rsc_adra;
  sc_signal<sc_lv<32> >                                                      TLS_a_rsc_da;
  sc_signal<sc_logic>                                                        TLS_a_rsc_wea;
  sc_signal<sc_lv<32> >                                                      TLS_a_rsc_qa;
  sc_signal<sc_lv<4> >                                                       TLS_a_rsc_adrb;
  sc_signal<sc_lv<32> >                                                      TLS_a_rsc_db;
  sc_signal<sc_logic>                                                        TLS_a_rsc_web;
  sc_signal<sc_lv<32> >                                                      TLS_a_rsc_qb;
  sc_signal<sc_logic>                                                        TLS_a_rsc_triosy_lz;
  sc_signal<sc_lv<32> >                                                      TLS_arrsum_rsc_dat;
  sc_signal<sc_logic>                                                        TLS_arrsum_rsc_triosy_lz;
  sc_signal<sc_logic>                                                        TLS_complete_rsc_rdy;
  sc_signal<sc_logic>                                                        TLS_complete_rsc_vld;
  ccs_DUT_wrapper                                                            axi_test_INST;
  ccs_sync_in_wait_trans_rsc_v1                                              run_rsc_INST;
  ccs_sync_out_wait_trans_rsc_v1                                             complete_rsc_INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<4,32,16 >                                   a_rsc_INST;
  ccs_out_trans_rsc_v1<1,32 >                                                arrsum_rsc_INST;
  tlm::tlm_fifo<bool >                                                       TLS_in_fifo_run;
  tlm::tlm_fifo<mc_wait_ctrl>                                                TLS_in_wait_ctrl_fifo_run;
  tlm::tlm_fifo<int>                                                         TLS_in_fifo_run_sizecount;
  sc_signal<sc_logic>                                                        TLS_run_rsc_trdone;
  mc_channel_input_transactor<bool,1,false>                                  transactor_run;
  tlm::tlm_fifo<bool >                                                       TLS_out_fifo_complete;
  tlm::tlm_fifo<mc_wait_ctrl>                                                TLS_out_wait_ctrl_fifo_complete;
  sc_signal<sc_logic>                                                        TLS_complete_rsc_trdone;
  mc_output_transactor<bool,1,false>                                         transactor_complete;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16> >                TLS_in_fifo_a;
  tlm::tlm_fifo<mc_wait_ctrl>                                                TLS_in_wait_ctrl_fifo_a;
  mc_trios_input_monitor                                                     trios_monitor_a_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16>,32,false>  transactor_a;
  tlm::tlm_fifo<ac_int<32, false > >                                         TLS_out_fifo_arrsum;
  tlm::tlm_fifo<mc_wait_ctrl>                                                TLS_out_wait_ctrl_fifo_arrsum;
  mc_trios_output_monitor                                                    trios_monitor_arrsum_rsc_triosy_lz_INST;
  mc_output_transactor<ac_int<32, false >,32,false>                          transactor_arrsum;
  mc_testbench                                                               testbench_INST;
  sc_signal<sc_logic>                                                        catapult_start;
  sc_signal<sc_logic>                                                        catapult_done;
  sc_signal<sc_logic>                                                        catapult_ready;
  sc_signal<sc_logic>                                                        in_sync;
  sc_signal<sc_logic>                                                        out_sync;
  sc_signal<sc_logic>                                                        inout_sync;
  sc_signal<unsigned>                                                        wait_for_init;
  sync_generator                                                             sync_generator_INST;
  catapult_monitor                                                           catapult_monitor_INST;
  ccs_probe_monitor                                                         *ccs_probe_monitor_INST;
  sc_event                                                                   generate_reset_event;
  sc_event                                                                   deadlock_event;
  sc_signal<sc_logic>                                                        deadlocked;
  sc_signal<sc_logic>                                                        maxsimtime;
  sc_event                                                                   max_sim_time_event;
  sc_signal<sc_logic>                                                        OFS_axi_test_core_inst_axi_test_core_complete_rsci_inst_axi_test_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_ivld_core_sct;
  sc_signal<sc_logic>                                                        OFS_axi_test_core_inst_axi_test_core_complete_rsci_inst_axi_test_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_irdy;
  sc_signal<sc_logic>                                                        OFS_run_rsc_vld;
  sc_signal<sc_logic>                                                        OFS_complete_rsc_rdy;
  sc_signal<sc_logic>                                                        TLS_enable_stalls;
  sc_signal<unsigned short>                                                  TLS_stall_coverage;

  void TLS_rst_method();
  void drive_TLS_run_rsc_trdone();
  void drive_TLS_complete_rsc_trdone();
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
    , TLS_run_rsc_rdy("TLS_run_rsc_rdy")
    , TLS_run_rsc_vld("TLS_run_rsc_vld")
    , TLS_a_rsc_adra("TLS_a_rsc_adra")
    , TLS_a_rsc_da("TLS_a_rsc_da")
    , TLS_a_rsc_wea("TLS_a_rsc_wea")
    , TLS_a_rsc_qa("TLS_a_rsc_qa")
    , TLS_a_rsc_adrb("TLS_a_rsc_adrb")
    , TLS_a_rsc_db("TLS_a_rsc_db")
    , TLS_a_rsc_web("TLS_a_rsc_web")
    , TLS_a_rsc_qb("TLS_a_rsc_qb")
    , TLS_a_rsc_triosy_lz("TLS_a_rsc_triosy_lz")
    , TLS_arrsum_rsc_dat("TLS_arrsum_rsc_dat")
    , TLS_arrsum_rsc_triosy_lz("TLS_arrsum_rsc_triosy_lz")
    , TLS_complete_rsc_rdy("TLS_complete_rsc_rdy")
    , TLS_complete_rsc_vld("TLS_complete_rsc_vld")
    , axi_test_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , run_rsc_INST("run_rsc", true)
    , complete_rsc_INST("complete_rsc", true)
    , a_rsc_INST("a_rsc", true)
    , arrsum_rsc_INST("arrsum_rsc", true)
    , TLS_in_fifo_run("TLS_in_fifo_run", -1)
    , TLS_in_wait_ctrl_fifo_run("TLS_in_wait_ctrl_fifo_run", -1)
    , TLS_in_fifo_run_sizecount("TLS_in_fifo_run_sizecount", 1)
    , TLS_run_rsc_trdone("TLS_run_rsc_trdone")
    , transactor_run("transactor_run", 0, 1, 0)
    , TLS_out_fifo_complete("TLS_out_fifo_complete", -1)
    , TLS_out_wait_ctrl_fifo_complete("TLS_out_wait_ctrl_fifo_complete", -1)
    , TLS_complete_rsc_trdone("TLS_complete_rsc_trdone")
    , transactor_complete("transactor_complete", 0, 1, 0)
    , TLS_in_fifo_a("TLS_in_fifo_a", -1)
    , TLS_in_wait_ctrl_fifo_a("TLS_in_wait_ctrl_fifo_a", -1)
    , trios_monitor_a_rsc_triosy_lz_INST("trios_monitor_a_rsc_triosy_lz_INST")
    , transactor_a("transactor_a", 0, 32, 0)
    , TLS_out_fifo_arrsum("TLS_out_fifo_arrsum", -1)
    , TLS_out_wait_ctrl_fifo_arrsum("TLS_out_wait_ctrl_fifo_arrsum", -1)
    , trios_monitor_arrsum_rsc_triosy_lz_INST("trios_monitor_arrsum_rsc_triosy_lz_INST")
    , transactor_arrsum("transactor_arrsum", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 37, 37, 0)
    , catapult_monitor_INST("Monitor", clk, true, 37LL, 36LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    axi_test_INST.clk(clk);
    axi_test_INST.rst(TLS_rst);
    axi_test_INST.run_rsc_rdy(TLS_run_rsc_rdy);
    axi_test_INST.run_rsc_vld(TLS_run_rsc_vld);
    axi_test_INST.a_rsc_adra(TLS_a_rsc_adra);
    axi_test_INST.a_rsc_da(TLS_a_rsc_da);
    axi_test_INST.a_rsc_wea(TLS_a_rsc_wea);
    axi_test_INST.a_rsc_qa(TLS_a_rsc_qa);
    axi_test_INST.a_rsc_adrb(TLS_a_rsc_adrb);
    axi_test_INST.a_rsc_db(TLS_a_rsc_db);
    axi_test_INST.a_rsc_web(TLS_a_rsc_web);
    axi_test_INST.a_rsc_qb(TLS_a_rsc_qb);
    axi_test_INST.a_rsc_triosy_lz(TLS_a_rsc_triosy_lz);
    axi_test_INST.arrsum_rsc_dat(TLS_arrsum_rsc_dat);
    axi_test_INST.arrsum_rsc_triosy_lz(TLS_arrsum_rsc_triosy_lz);
    axi_test_INST.complete_rsc_rdy(TLS_complete_rsc_rdy);
    axi_test_INST.complete_rsc_vld(TLS_complete_rsc_vld);

    run_rsc_INST.vld(TLS_run_rsc_vld);
    run_rsc_INST.rdy(TLS_run_rsc_rdy);
    run_rsc_INST.clk(clk);
    run_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    complete_rsc_INST.vld(TLS_complete_rsc_vld);
    complete_rsc_INST.rdy(TLS_complete_rsc_rdy);
    complete_rsc_INST.clk(clk);
    complete_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_4)));

    a_rsc_INST.qb(TLS_a_rsc_qb);
    a_rsc_INST.web(TLS_a_rsc_web);
    a_rsc_INST.db(TLS_a_rsc_db);
    a_rsc_INST.adrb(TLS_a_rsc_adrb);
    a_rsc_INST.qa(TLS_a_rsc_qa);
    a_rsc_INST.wea(TLS_a_rsc_wea);
    a_rsc_INST.da(TLS_a_rsc_da);
    a_rsc_INST.adra(TLS_a_rsc_adra);
    a_rsc_INST.clka(clk);
    a_rsc_INST.clka_en(SIG_SC_LOGIC_1);
    a_rsc_INST.clkb(clk);
    a_rsc_INST.clkb_en(SIG_SC_LOGIC_1);
    a_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    arrsum_rsc_INST.dat(TLS_arrsum_rsc_dat);
    arrsum_rsc_INST.clk(clk);
    arrsum_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    transactor_run.in_fifo(TLS_in_fifo_run);
    transactor_run.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_run);
    transactor_run.sizecount_fifo(TLS_in_fifo_run_sizecount);
    transactor_run.bind_clk(clk, true, rst);
    transactor_run.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_run.register_block(&run_rsc_INST, run_rsc_INST.basename(), TLS_run_rsc_trdone, 0, 0, 1);

    transactor_complete.out_fifo(TLS_out_fifo_complete);
    transactor_complete.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_complete);
    transactor_complete.bind_clk(clk, true, rst);
    transactor_complete.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_complete.register_block(&complete_rsc_INST, complete_rsc_INST.basename(), TLS_complete_rsc_trdone,
        0, 0, 1);

    trios_monitor_a_rsc_triosy_lz_INST.trios(TLS_a_rsc_triosy_lz);
    trios_monitor_a_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_a.in_fifo(TLS_in_fifo_a);
    transactor_a.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_a);
    transactor_a.bind_clk(clk, true, rst);
    transactor_a.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_a.register_block(&a_rsc_INST, a_rsc_INST.basename(), TLS_a_rsc_triosy_lz, 0, 15, 1);

    trios_monitor_arrsum_rsc_triosy_lz_INST.trios(TLS_arrsum_rsc_triosy_lz);
    trios_monitor_arrsum_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_arrsum.out_fifo(TLS_out_fifo_arrsum);
    transactor_arrsum.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_arrsum);
    transactor_arrsum.bind_clk(clk, true, rst);
    transactor_arrsum.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_arrsum.register_block(&arrsum_rsc_INST, arrsum_rsc_INST.basename(), TLS_arrsum_rsc_triosy_lz, 0,
        0, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_run(TLS_in_fifo_run);
    testbench_INST.ccs_wait_ctrl_run(TLS_in_wait_ctrl_fifo_run);
    testbench_INST.ccs_sizecount_run(TLS_in_fifo_run_sizecount);
    testbench_INST.ccs_complete(TLS_out_fifo_complete);
    testbench_INST.ccs_wait_ctrl_complete(TLS_out_wait_ctrl_fifo_complete);
    testbench_INST.ccs_a(TLS_in_fifo_a);
    testbench_INST.ccs_wait_ctrl_a(TLS_in_wait_ctrl_fifo_a);
    testbench_INST.ccs_arrsum(TLS_out_fifo_arrsum);
    testbench_INST.ccs_wait_ctrl_arrsum(TLS_out_wait_ctrl_fifo_arrsum);
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

    SC_METHOD(drive_TLS_run_rsc_trdone);
      sensitive << TLS_run_rsc_rdy;
      sensitive << TLS_run_rsc_vld;
      sensitive << rst;

    SC_METHOD(drive_TLS_complete_rsc_trdone);
      sensitive << TLS_complete_rsc_vld;
      sensitive << TLS_complete_rsc_rdy;

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
  a_rsc_INST.clear();
  arrsum_rsc_INST.clear();
}

void scverify_top::drive_TLS_run_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_run_rsc_rdy.read()!= SC_LOGIC_1); }
  TLS_run_rsc_trdone.write(TLS_run_rsc_rdy.read() & TLS_run_rsc_vld.read() & ~rst.read());
}

void scverify_top::drive_TLS_complete_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_complete_rsc_vld.read()!= SC_LOGIC_1); }
  TLS_complete_rsc_trdone.write(TLS_complete_rsc_vld.read() & TLS_complete_rsc_rdy.read());
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
    transactor_a.set_auto_wait_limit(l);
    transactor_arrsum.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_run_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_complete_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_a_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_arrsum_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_run_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_complete_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_a_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_arrsum_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_run_count = -1;
  static int transactor_complete_count = -1;
  static int transactor_a_count = -1;
  static int transactor_arrsum_count = -1;

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
    debug("transactor_a",transactor_a_flags,transactor_a_count);
    debug("transactor_arrsum",transactor_arrsum_flags,transactor_arrsum_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_run") == 0)
    xlator_p = &transactor_run;
  if (strcmp(varname,"transactor_complete") == 0)
    xlator_p = &transactor_complete;
  if (strcmp(varname,"transactor_a") == 0)
    xlator_p = &transactor_a;
  if (strcmp(varname,"transactor_arrsum") == 0)
    xlator_p = &transactor_arrsum;
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
      transactor_run.reset_streams();
      transactor_complete.reset_streams();
      transactor_a.reset_streams();
      transactor_arrsum.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_test_core_inst_axi_test_core_complete_rsci_inst_axi_test_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_ivld_core_sct,
      /scverify_top/rtl/axi_test_core_inst/axi_test_core_complete_rsci_inst/axi_test_core_complete_rsci_complete_wait_ctrl_inst/complete_rsci_ivld_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_axi_test_core_inst_axi_test_core_complete_rsci_inst_axi_test_core_complete_rsci_complete_wait_ctrl_inst_complete_rsci_irdy,
      /scverify_top/rtl/axi_test_core_inst/axi_test_core_complete_rsci_inst/axi_test_core_complete_rsci_complete_wait_ctrl_inst/complete_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_run_rsc_vld, /scverify_top/rtl/run_rsc_vld);
  OBSERVE_FOREIGN_SIGNAL(OFS_complete_rsc_rdy, /scverify_top/rtl/complete_rsc_rdy);
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
