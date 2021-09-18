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
#define TOP_HDL_ENTITY peaseNTT
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
extern double __scv_hold_time_RSCID_39;
extern double __scv_hold_time_RSCID_40;
extern double __scv_hold_time_RSCID_41;
extern double __scv_hold_time_RSCID_42;
extern double __scv_hold_time_RSCID_43;
extern double __scv_hold_time_RSCID_44;
extern double __scv_hold_time_RSCID_45;
extern double __scv_hold_time_RSCID_46;
extern double __scv_hold_time_RSCID_47;
extern double __scv_hold_time_RSCID_48;
extern double __scv_hold_time_RSCID_49;
extern double __scv_hold_time_RSCID_50;
extern double __scv_hold_time_RSCID_51;
extern double __scv_hold_time_RSCID_52;
extern double __scv_hold_time_RSCID_53;
extern double __scv_hold_time_RSCID_54;
extern double __scv_hold_time_RSCID_55;
extern double __scv_hold_time_RSCID_56;
extern double __scv_hold_time_RSCID_57;
extern double __scv_hold_time_RSCID_58;
extern double __scv_hold_time_RSCID_59;
extern double __scv_hold_time_RSCID_60;
extern double __scv_hold_time_RSCID_61;
extern double __scv_hold_time_RSCID_62;
extern double __scv_hold_time_RSCID_63;
extern double __scv_hold_time_RSCID_64;
extern double __scv_hold_time_RSCID_65;
extern double __scv_hold_time_RSCID_66;
extern double __scv_hold_time_RSCID_67;
extern double __scv_hold_time_RSCID_68;
extern double __scv_hold_time_RSCID_69;
extern double __scv_hold_time_RSCID_70;
extern double __scv_hold_time_RSCID_71;
extern double __scv_hold_time_RSCID_72;
extern double __scv_hold_time_RSCID_73;
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
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
double __scv_hold_time_RSCID_39 = 0;
double __scv_hold_time_RSCID_40 = 0;
double __scv_hold_time_RSCID_41 = 0;
double __scv_hold_time_RSCID_42 = 0;
double __scv_hold_time_RSCID_43 = 0;
double __scv_hold_time_RSCID_44 = 0;
double __scv_hold_time_RSCID_45 = 0;
double __scv_hold_time_RSCID_46 = 0;
double __scv_hold_time_RSCID_47 = 0;
double __scv_hold_time_RSCID_48 = 0;
double __scv_hold_time_RSCID_49 = 0;
double __scv_hold_time_RSCID_50 = 0;
double __scv_hold_time_RSCID_51 = 0;
double __scv_hold_time_RSCID_52 = 0;
double __scv_hold_time_RSCID_53 = 0;
double __scv_hold_time_RSCID_54 = 0;
double __scv_hold_time_RSCID_55 = 0;
double __scv_hold_time_RSCID_56 = 0;
double __scv_hold_time_RSCID_57 = 0;
double __scv_hold_time_RSCID_58 = 0;
double __scv_hold_time_RSCID_59 = 0;
double __scv_hold_time_RSCID_60 = 0;
double __scv_hold_time_RSCID_61 = 0;
double __scv_hold_time_RSCID_62 = 0;
double __scv_hold_time_RSCID_63 = 0;
double __scv_hold_time_RSCID_64 = 0;
double __scv_hold_time_RSCID_65 = 0;
double __scv_hold_time_RSCID_66 = 0;
double __scv_hold_time_RSCID_67 = 0;
double __scv_hold_time_RSCID_68 = 0;
double __scv_hold_time_RSCID_69 = 0;
double __scv_hold_time_RSCID_70 = 0;
double __scv_hold_time_RSCID_71 = 0;
double __scv_hold_time_RSCID_72 = 0;
double __scv_hold_time_RSCID_73 = 0;
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
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_4_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_4_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_4_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_4_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_4_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_5_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_5_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_5_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_5_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_5_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_6_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_6_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_6_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_6_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_6_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_7_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_7_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_7_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_7_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_7_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_8_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_8_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_8_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_8_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_8_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_8_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_8_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_8_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_9_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_9_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_9_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_9_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_9_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_9_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_9_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_9_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_10_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_10_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_10_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_10_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_10_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_10_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_10_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_10_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_11_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_11_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_11_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_11_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_11_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_11_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_11_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_11_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_12_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_12_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_12_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_12_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_12_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_12_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_12_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_12_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_13_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_13_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_13_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_13_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_13_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_13_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_13_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_13_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_14_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_14_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_14_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_14_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_14_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_14_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_14_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_14_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_15_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_15_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_15_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_15_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_15_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_15_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_15_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_15_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_16_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_16_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_16_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_16_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_16_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_16_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_16_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_16_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_16_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_17_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_17_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_17_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_17_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_17_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_17_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_17_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_17_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_17_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_18_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_18_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_18_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_18_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_18_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_18_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_18_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_18_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_18_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_19_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_19_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_19_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_19_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_19_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_19_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_19_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_19_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_19_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_20_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_20_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_20_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_20_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_20_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_20_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_20_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_20_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_20_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_21_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_21_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_21_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_21_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_21_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_21_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_21_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_21_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_21_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_22_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_22_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_22_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_22_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_22_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_22_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_22_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_22_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_22_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_23_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_23_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_23_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_23_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_23_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_23_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_23_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_23_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_23_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_24_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_24_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_24_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_24_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_24_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_24_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_24_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_24_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_24_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_25_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_25_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_25_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_25_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_25_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_25_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_25_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_25_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_25_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_26_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_26_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_26_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_26_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_26_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_26_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_26_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_26_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_26_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_27_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_27_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_27_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_27_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_27_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_27_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_27_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_27_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_27_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_28_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_28_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_28_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_28_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_28_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_28_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_28_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_28_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_28_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_29_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_29_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_29_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_29_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_29_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_29_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_29_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_29_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_29_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_30_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_30_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_30_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_30_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_30_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_30_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_30_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_30_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_30_lz;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_31_adra;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_31_da;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_31_wea;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_31_qa;
  sc_signal<sc_lv<8> >                                                         TLS_xt_rsc_0_31_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_31_db;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_0_31_web;
  sc_signal<sc_lv<32> >                                                        TLS_xt_rsc_0_31_qb;
  sc_signal<sc_logic>                                                          TLS_xt_rsc_triosy_0_31_lz;
  sc_signal<sc_lv<32> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<32> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_0_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_0_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_0_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_0_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_1_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_1_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_1_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_1_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_2_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_2_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_2_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_2_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_3_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_3_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_3_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_3_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_4_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_4_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_4_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_4_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_4_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_4_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_4_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_4_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_5_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_5_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_5_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_5_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_5_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_5_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_5_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_5_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_6_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_6_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_6_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_6_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_6_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_6_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_6_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_6_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_7_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_7_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_7_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_7_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_7_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_7_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_7_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_7_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_8_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_8_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_8_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_8_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_8_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_8_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_8_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_8_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_9_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_9_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_9_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_9_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_9_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_9_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_9_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_9_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_10_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_10_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_10_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_10_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_10_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_10_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_10_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_10_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_11_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_11_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_11_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_11_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_11_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_11_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_11_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_11_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_12_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_12_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_12_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_12_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_12_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_12_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_12_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_12_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_13_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_13_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_13_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_13_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_13_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_13_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_13_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_13_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_14_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_14_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_14_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_14_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_14_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_14_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_14_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_14_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_15_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_15_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_15_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_15_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_rsc_0_15_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_15_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_0_15_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_rsc_0_15_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_0_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_0_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_0_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_0_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_1_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_1_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_1_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_1_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_2_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_2_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_2_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_2_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_3_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_3_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_3_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_3_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_4_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_4_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_4_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_4_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_4_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_4_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_4_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_4_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_5_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_5_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_5_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_5_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_5_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_5_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_5_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_5_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_6_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_6_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_6_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_6_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_6_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_6_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_6_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_6_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_7_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_7_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_7_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_7_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_7_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_7_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_7_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_7_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_8_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_8_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_8_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_8_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_8_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_8_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_8_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_8_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_9_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_9_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_9_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_9_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_9_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_9_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_9_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_9_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_10_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_10_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_10_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_10_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_10_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_10_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_10_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_10_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_11_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_11_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_11_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_11_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_11_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_11_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_11_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_11_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_12_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_12_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_12_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_12_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_12_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_12_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_12_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_12_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_13_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_13_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_13_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_13_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_13_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_13_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_13_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_13_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_14_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_14_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_14_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_14_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_14_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_14_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_14_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_14_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_15_adra;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_15_da;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_15_wea;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_15_qa;
  sc_signal<sc_lv<8> >                                                         TLS_twiddle_h_rsc_0_15_adrb;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_15_db;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_0_15_web;
  sc_signal<sc_lv<32> >                                                        TLS_twiddle_h_rsc_0_15_qb;
  sc_signal<sc_logic>                                                          TLS_twiddle_h_rsc_triosy_0_15_lz;
  ccs_DUT_wrapper                                                              peaseNTT_INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__0__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__1__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__2__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__3__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__4__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__5__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__6__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__7__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__8__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__9__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__10__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__11__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__12__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__13__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__14__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__15__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__16__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__17__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__18__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__19__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__20__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__21__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__22__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__23__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__24__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__25__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__26__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__27__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__28__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__29__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__30__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    xt_rsc_0__31__INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,32 >                                                   r_rsc_INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__0__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__1__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__2__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__3__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__4__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__5__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__6__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__7__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__8__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__9__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__10__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__11__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__12__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__13__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__14__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_rsc_0__15__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__0__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__1__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__2__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__3__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__4__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__5__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__6__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__7__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__8__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__9__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__10__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__11__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__12__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__13__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__14__INST;
  BLOCK_DPRAM_RBW_DUAL_trans_rsc<8,32,256 >                                    twiddle_h_rsc_0__15__INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,4096> >                TLS_in_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_xt;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,4096> >                TLS_out_fifo_xt;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_xt;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_3_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_4_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_5_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_6_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_7_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_8_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_9_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_10_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_11_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_12_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_13_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_14_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_15_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_16_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_17_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_18_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_19_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_20_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_21_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_22_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_23_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_24_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_25_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_26_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_27_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_28_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_29_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_30_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_xt_rsc_triosy_0_31_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,4096>,32,false>  transactor_xt;
  tlm::tlm_fifo<ac_int<32, false > >                                           TLS_in_fifo_p;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_p;
  mc_trios_input_monitor                                                       trios_monitor_p_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                             transactor_p;
  tlm::tlm_fifo<ac_int<32, false > >                                           TLS_in_fifo_r;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_r;
  mc_trios_input_monitor                                                       trios_monitor_r_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                             transactor_r;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,4096> >                TLS_in_fifo_twiddle;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_0_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_1_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_2_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_3_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_4_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_5_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_6_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_7_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_8_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_9_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_10_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_11_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_12_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_13_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_14_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_15_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,4096>,32,false>  transactor_twiddle;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,4096> >                TLS_in_fifo_twiddle_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_twiddle_h;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_4_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_5_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_6_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_7_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_8_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_9_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_10_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_11_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_12_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_13_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_14_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_h_rsc_triosy_0_15_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,4096>,32,false>  transactor_twiddle_h;
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
    , TLS_xt_rsc_0_8_adra("TLS_xt_rsc_0_8_adra")
    , TLS_xt_rsc_0_8_da("TLS_xt_rsc_0_8_da")
    , TLS_xt_rsc_0_8_wea("TLS_xt_rsc_0_8_wea")
    , TLS_xt_rsc_0_8_qa("TLS_xt_rsc_0_8_qa")
    , TLS_xt_rsc_0_8_adrb("TLS_xt_rsc_0_8_adrb")
    , TLS_xt_rsc_0_8_db("TLS_xt_rsc_0_8_db")
    , TLS_xt_rsc_0_8_web("TLS_xt_rsc_0_8_web")
    , TLS_xt_rsc_0_8_qb("TLS_xt_rsc_0_8_qb")
    , TLS_xt_rsc_triosy_0_8_lz("TLS_xt_rsc_triosy_0_8_lz")
    , TLS_xt_rsc_0_9_adra("TLS_xt_rsc_0_9_adra")
    , TLS_xt_rsc_0_9_da("TLS_xt_rsc_0_9_da")
    , TLS_xt_rsc_0_9_wea("TLS_xt_rsc_0_9_wea")
    , TLS_xt_rsc_0_9_qa("TLS_xt_rsc_0_9_qa")
    , TLS_xt_rsc_0_9_adrb("TLS_xt_rsc_0_9_adrb")
    , TLS_xt_rsc_0_9_db("TLS_xt_rsc_0_9_db")
    , TLS_xt_rsc_0_9_web("TLS_xt_rsc_0_9_web")
    , TLS_xt_rsc_0_9_qb("TLS_xt_rsc_0_9_qb")
    , TLS_xt_rsc_triosy_0_9_lz("TLS_xt_rsc_triosy_0_9_lz")
    , TLS_xt_rsc_0_10_adra("TLS_xt_rsc_0_10_adra")
    , TLS_xt_rsc_0_10_da("TLS_xt_rsc_0_10_da")
    , TLS_xt_rsc_0_10_wea("TLS_xt_rsc_0_10_wea")
    , TLS_xt_rsc_0_10_qa("TLS_xt_rsc_0_10_qa")
    , TLS_xt_rsc_0_10_adrb("TLS_xt_rsc_0_10_adrb")
    , TLS_xt_rsc_0_10_db("TLS_xt_rsc_0_10_db")
    , TLS_xt_rsc_0_10_web("TLS_xt_rsc_0_10_web")
    , TLS_xt_rsc_0_10_qb("TLS_xt_rsc_0_10_qb")
    , TLS_xt_rsc_triosy_0_10_lz("TLS_xt_rsc_triosy_0_10_lz")
    , TLS_xt_rsc_0_11_adra("TLS_xt_rsc_0_11_adra")
    , TLS_xt_rsc_0_11_da("TLS_xt_rsc_0_11_da")
    , TLS_xt_rsc_0_11_wea("TLS_xt_rsc_0_11_wea")
    , TLS_xt_rsc_0_11_qa("TLS_xt_rsc_0_11_qa")
    , TLS_xt_rsc_0_11_adrb("TLS_xt_rsc_0_11_adrb")
    , TLS_xt_rsc_0_11_db("TLS_xt_rsc_0_11_db")
    , TLS_xt_rsc_0_11_web("TLS_xt_rsc_0_11_web")
    , TLS_xt_rsc_0_11_qb("TLS_xt_rsc_0_11_qb")
    , TLS_xt_rsc_triosy_0_11_lz("TLS_xt_rsc_triosy_0_11_lz")
    , TLS_xt_rsc_0_12_adra("TLS_xt_rsc_0_12_adra")
    , TLS_xt_rsc_0_12_da("TLS_xt_rsc_0_12_da")
    , TLS_xt_rsc_0_12_wea("TLS_xt_rsc_0_12_wea")
    , TLS_xt_rsc_0_12_qa("TLS_xt_rsc_0_12_qa")
    , TLS_xt_rsc_0_12_adrb("TLS_xt_rsc_0_12_adrb")
    , TLS_xt_rsc_0_12_db("TLS_xt_rsc_0_12_db")
    , TLS_xt_rsc_0_12_web("TLS_xt_rsc_0_12_web")
    , TLS_xt_rsc_0_12_qb("TLS_xt_rsc_0_12_qb")
    , TLS_xt_rsc_triosy_0_12_lz("TLS_xt_rsc_triosy_0_12_lz")
    , TLS_xt_rsc_0_13_adra("TLS_xt_rsc_0_13_adra")
    , TLS_xt_rsc_0_13_da("TLS_xt_rsc_0_13_da")
    , TLS_xt_rsc_0_13_wea("TLS_xt_rsc_0_13_wea")
    , TLS_xt_rsc_0_13_qa("TLS_xt_rsc_0_13_qa")
    , TLS_xt_rsc_0_13_adrb("TLS_xt_rsc_0_13_adrb")
    , TLS_xt_rsc_0_13_db("TLS_xt_rsc_0_13_db")
    , TLS_xt_rsc_0_13_web("TLS_xt_rsc_0_13_web")
    , TLS_xt_rsc_0_13_qb("TLS_xt_rsc_0_13_qb")
    , TLS_xt_rsc_triosy_0_13_lz("TLS_xt_rsc_triosy_0_13_lz")
    , TLS_xt_rsc_0_14_adra("TLS_xt_rsc_0_14_adra")
    , TLS_xt_rsc_0_14_da("TLS_xt_rsc_0_14_da")
    , TLS_xt_rsc_0_14_wea("TLS_xt_rsc_0_14_wea")
    , TLS_xt_rsc_0_14_qa("TLS_xt_rsc_0_14_qa")
    , TLS_xt_rsc_0_14_adrb("TLS_xt_rsc_0_14_adrb")
    , TLS_xt_rsc_0_14_db("TLS_xt_rsc_0_14_db")
    , TLS_xt_rsc_0_14_web("TLS_xt_rsc_0_14_web")
    , TLS_xt_rsc_0_14_qb("TLS_xt_rsc_0_14_qb")
    , TLS_xt_rsc_triosy_0_14_lz("TLS_xt_rsc_triosy_0_14_lz")
    , TLS_xt_rsc_0_15_adra("TLS_xt_rsc_0_15_adra")
    , TLS_xt_rsc_0_15_da("TLS_xt_rsc_0_15_da")
    , TLS_xt_rsc_0_15_wea("TLS_xt_rsc_0_15_wea")
    , TLS_xt_rsc_0_15_qa("TLS_xt_rsc_0_15_qa")
    , TLS_xt_rsc_0_15_adrb("TLS_xt_rsc_0_15_adrb")
    , TLS_xt_rsc_0_15_db("TLS_xt_rsc_0_15_db")
    , TLS_xt_rsc_0_15_web("TLS_xt_rsc_0_15_web")
    , TLS_xt_rsc_0_15_qb("TLS_xt_rsc_0_15_qb")
    , TLS_xt_rsc_triosy_0_15_lz("TLS_xt_rsc_triosy_0_15_lz")
    , TLS_xt_rsc_0_16_adra("TLS_xt_rsc_0_16_adra")
    , TLS_xt_rsc_0_16_da("TLS_xt_rsc_0_16_da")
    , TLS_xt_rsc_0_16_wea("TLS_xt_rsc_0_16_wea")
    , TLS_xt_rsc_0_16_qa("TLS_xt_rsc_0_16_qa")
    , TLS_xt_rsc_0_16_adrb("TLS_xt_rsc_0_16_adrb")
    , TLS_xt_rsc_0_16_db("TLS_xt_rsc_0_16_db")
    , TLS_xt_rsc_0_16_web("TLS_xt_rsc_0_16_web")
    , TLS_xt_rsc_0_16_qb("TLS_xt_rsc_0_16_qb")
    , TLS_xt_rsc_triosy_0_16_lz("TLS_xt_rsc_triosy_0_16_lz")
    , TLS_xt_rsc_0_17_adra("TLS_xt_rsc_0_17_adra")
    , TLS_xt_rsc_0_17_da("TLS_xt_rsc_0_17_da")
    , TLS_xt_rsc_0_17_wea("TLS_xt_rsc_0_17_wea")
    , TLS_xt_rsc_0_17_qa("TLS_xt_rsc_0_17_qa")
    , TLS_xt_rsc_0_17_adrb("TLS_xt_rsc_0_17_adrb")
    , TLS_xt_rsc_0_17_db("TLS_xt_rsc_0_17_db")
    , TLS_xt_rsc_0_17_web("TLS_xt_rsc_0_17_web")
    , TLS_xt_rsc_0_17_qb("TLS_xt_rsc_0_17_qb")
    , TLS_xt_rsc_triosy_0_17_lz("TLS_xt_rsc_triosy_0_17_lz")
    , TLS_xt_rsc_0_18_adra("TLS_xt_rsc_0_18_adra")
    , TLS_xt_rsc_0_18_da("TLS_xt_rsc_0_18_da")
    , TLS_xt_rsc_0_18_wea("TLS_xt_rsc_0_18_wea")
    , TLS_xt_rsc_0_18_qa("TLS_xt_rsc_0_18_qa")
    , TLS_xt_rsc_0_18_adrb("TLS_xt_rsc_0_18_adrb")
    , TLS_xt_rsc_0_18_db("TLS_xt_rsc_0_18_db")
    , TLS_xt_rsc_0_18_web("TLS_xt_rsc_0_18_web")
    , TLS_xt_rsc_0_18_qb("TLS_xt_rsc_0_18_qb")
    , TLS_xt_rsc_triosy_0_18_lz("TLS_xt_rsc_triosy_0_18_lz")
    , TLS_xt_rsc_0_19_adra("TLS_xt_rsc_0_19_adra")
    , TLS_xt_rsc_0_19_da("TLS_xt_rsc_0_19_da")
    , TLS_xt_rsc_0_19_wea("TLS_xt_rsc_0_19_wea")
    , TLS_xt_rsc_0_19_qa("TLS_xt_rsc_0_19_qa")
    , TLS_xt_rsc_0_19_adrb("TLS_xt_rsc_0_19_adrb")
    , TLS_xt_rsc_0_19_db("TLS_xt_rsc_0_19_db")
    , TLS_xt_rsc_0_19_web("TLS_xt_rsc_0_19_web")
    , TLS_xt_rsc_0_19_qb("TLS_xt_rsc_0_19_qb")
    , TLS_xt_rsc_triosy_0_19_lz("TLS_xt_rsc_triosy_0_19_lz")
    , TLS_xt_rsc_0_20_adra("TLS_xt_rsc_0_20_adra")
    , TLS_xt_rsc_0_20_da("TLS_xt_rsc_0_20_da")
    , TLS_xt_rsc_0_20_wea("TLS_xt_rsc_0_20_wea")
    , TLS_xt_rsc_0_20_qa("TLS_xt_rsc_0_20_qa")
    , TLS_xt_rsc_0_20_adrb("TLS_xt_rsc_0_20_adrb")
    , TLS_xt_rsc_0_20_db("TLS_xt_rsc_0_20_db")
    , TLS_xt_rsc_0_20_web("TLS_xt_rsc_0_20_web")
    , TLS_xt_rsc_0_20_qb("TLS_xt_rsc_0_20_qb")
    , TLS_xt_rsc_triosy_0_20_lz("TLS_xt_rsc_triosy_0_20_lz")
    , TLS_xt_rsc_0_21_adra("TLS_xt_rsc_0_21_adra")
    , TLS_xt_rsc_0_21_da("TLS_xt_rsc_0_21_da")
    , TLS_xt_rsc_0_21_wea("TLS_xt_rsc_0_21_wea")
    , TLS_xt_rsc_0_21_qa("TLS_xt_rsc_0_21_qa")
    , TLS_xt_rsc_0_21_adrb("TLS_xt_rsc_0_21_adrb")
    , TLS_xt_rsc_0_21_db("TLS_xt_rsc_0_21_db")
    , TLS_xt_rsc_0_21_web("TLS_xt_rsc_0_21_web")
    , TLS_xt_rsc_0_21_qb("TLS_xt_rsc_0_21_qb")
    , TLS_xt_rsc_triosy_0_21_lz("TLS_xt_rsc_triosy_0_21_lz")
    , TLS_xt_rsc_0_22_adra("TLS_xt_rsc_0_22_adra")
    , TLS_xt_rsc_0_22_da("TLS_xt_rsc_0_22_da")
    , TLS_xt_rsc_0_22_wea("TLS_xt_rsc_0_22_wea")
    , TLS_xt_rsc_0_22_qa("TLS_xt_rsc_0_22_qa")
    , TLS_xt_rsc_0_22_adrb("TLS_xt_rsc_0_22_adrb")
    , TLS_xt_rsc_0_22_db("TLS_xt_rsc_0_22_db")
    , TLS_xt_rsc_0_22_web("TLS_xt_rsc_0_22_web")
    , TLS_xt_rsc_0_22_qb("TLS_xt_rsc_0_22_qb")
    , TLS_xt_rsc_triosy_0_22_lz("TLS_xt_rsc_triosy_0_22_lz")
    , TLS_xt_rsc_0_23_adra("TLS_xt_rsc_0_23_adra")
    , TLS_xt_rsc_0_23_da("TLS_xt_rsc_0_23_da")
    , TLS_xt_rsc_0_23_wea("TLS_xt_rsc_0_23_wea")
    , TLS_xt_rsc_0_23_qa("TLS_xt_rsc_0_23_qa")
    , TLS_xt_rsc_0_23_adrb("TLS_xt_rsc_0_23_adrb")
    , TLS_xt_rsc_0_23_db("TLS_xt_rsc_0_23_db")
    , TLS_xt_rsc_0_23_web("TLS_xt_rsc_0_23_web")
    , TLS_xt_rsc_0_23_qb("TLS_xt_rsc_0_23_qb")
    , TLS_xt_rsc_triosy_0_23_lz("TLS_xt_rsc_triosy_0_23_lz")
    , TLS_xt_rsc_0_24_adra("TLS_xt_rsc_0_24_adra")
    , TLS_xt_rsc_0_24_da("TLS_xt_rsc_0_24_da")
    , TLS_xt_rsc_0_24_wea("TLS_xt_rsc_0_24_wea")
    , TLS_xt_rsc_0_24_qa("TLS_xt_rsc_0_24_qa")
    , TLS_xt_rsc_0_24_adrb("TLS_xt_rsc_0_24_adrb")
    , TLS_xt_rsc_0_24_db("TLS_xt_rsc_0_24_db")
    , TLS_xt_rsc_0_24_web("TLS_xt_rsc_0_24_web")
    , TLS_xt_rsc_0_24_qb("TLS_xt_rsc_0_24_qb")
    , TLS_xt_rsc_triosy_0_24_lz("TLS_xt_rsc_triosy_0_24_lz")
    , TLS_xt_rsc_0_25_adra("TLS_xt_rsc_0_25_adra")
    , TLS_xt_rsc_0_25_da("TLS_xt_rsc_0_25_da")
    , TLS_xt_rsc_0_25_wea("TLS_xt_rsc_0_25_wea")
    , TLS_xt_rsc_0_25_qa("TLS_xt_rsc_0_25_qa")
    , TLS_xt_rsc_0_25_adrb("TLS_xt_rsc_0_25_adrb")
    , TLS_xt_rsc_0_25_db("TLS_xt_rsc_0_25_db")
    , TLS_xt_rsc_0_25_web("TLS_xt_rsc_0_25_web")
    , TLS_xt_rsc_0_25_qb("TLS_xt_rsc_0_25_qb")
    , TLS_xt_rsc_triosy_0_25_lz("TLS_xt_rsc_triosy_0_25_lz")
    , TLS_xt_rsc_0_26_adra("TLS_xt_rsc_0_26_adra")
    , TLS_xt_rsc_0_26_da("TLS_xt_rsc_0_26_da")
    , TLS_xt_rsc_0_26_wea("TLS_xt_rsc_0_26_wea")
    , TLS_xt_rsc_0_26_qa("TLS_xt_rsc_0_26_qa")
    , TLS_xt_rsc_0_26_adrb("TLS_xt_rsc_0_26_adrb")
    , TLS_xt_rsc_0_26_db("TLS_xt_rsc_0_26_db")
    , TLS_xt_rsc_0_26_web("TLS_xt_rsc_0_26_web")
    , TLS_xt_rsc_0_26_qb("TLS_xt_rsc_0_26_qb")
    , TLS_xt_rsc_triosy_0_26_lz("TLS_xt_rsc_triosy_0_26_lz")
    , TLS_xt_rsc_0_27_adra("TLS_xt_rsc_0_27_adra")
    , TLS_xt_rsc_0_27_da("TLS_xt_rsc_0_27_da")
    , TLS_xt_rsc_0_27_wea("TLS_xt_rsc_0_27_wea")
    , TLS_xt_rsc_0_27_qa("TLS_xt_rsc_0_27_qa")
    , TLS_xt_rsc_0_27_adrb("TLS_xt_rsc_0_27_adrb")
    , TLS_xt_rsc_0_27_db("TLS_xt_rsc_0_27_db")
    , TLS_xt_rsc_0_27_web("TLS_xt_rsc_0_27_web")
    , TLS_xt_rsc_0_27_qb("TLS_xt_rsc_0_27_qb")
    , TLS_xt_rsc_triosy_0_27_lz("TLS_xt_rsc_triosy_0_27_lz")
    , TLS_xt_rsc_0_28_adra("TLS_xt_rsc_0_28_adra")
    , TLS_xt_rsc_0_28_da("TLS_xt_rsc_0_28_da")
    , TLS_xt_rsc_0_28_wea("TLS_xt_rsc_0_28_wea")
    , TLS_xt_rsc_0_28_qa("TLS_xt_rsc_0_28_qa")
    , TLS_xt_rsc_0_28_adrb("TLS_xt_rsc_0_28_adrb")
    , TLS_xt_rsc_0_28_db("TLS_xt_rsc_0_28_db")
    , TLS_xt_rsc_0_28_web("TLS_xt_rsc_0_28_web")
    , TLS_xt_rsc_0_28_qb("TLS_xt_rsc_0_28_qb")
    , TLS_xt_rsc_triosy_0_28_lz("TLS_xt_rsc_triosy_0_28_lz")
    , TLS_xt_rsc_0_29_adra("TLS_xt_rsc_0_29_adra")
    , TLS_xt_rsc_0_29_da("TLS_xt_rsc_0_29_da")
    , TLS_xt_rsc_0_29_wea("TLS_xt_rsc_0_29_wea")
    , TLS_xt_rsc_0_29_qa("TLS_xt_rsc_0_29_qa")
    , TLS_xt_rsc_0_29_adrb("TLS_xt_rsc_0_29_adrb")
    , TLS_xt_rsc_0_29_db("TLS_xt_rsc_0_29_db")
    , TLS_xt_rsc_0_29_web("TLS_xt_rsc_0_29_web")
    , TLS_xt_rsc_0_29_qb("TLS_xt_rsc_0_29_qb")
    , TLS_xt_rsc_triosy_0_29_lz("TLS_xt_rsc_triosy_0_29_lz")
    , TLS_xt_rsc_0_30_adra("TLS_xt_rsc_0_30_adra")
    , TLS_xt_rsc_0_30_da("TLS_xt_rsc_0_30_da")
    , TLS_xt_rsc_0_30_wea("TLS_xt_rsc_0_30_wea")
    , TLS_xt_rsc_0_30_qa("TLS_xt_rsc_0_30_qa")
    , TLS_xt_rsc_0_30_adrb("TLS_xt_rsc_0_30_adrb")
    , TLS_xt_rsc_0_30_db("TLS_xt_rsc_0_30_db")
    , TLS_xt_rsc_0_30_web("TLS_xt_rsc_0_30_web")
    , TLS_xt_rsc_0_30_qb("TLS_xt_rsc_0_30_qb")
    , TLS_xt_rsc_triosy_0_30_lz("TLS_xt_rsc_triosy_0_30_lz")
    , TLS_xt_rsc_0_31_adra("TLS_xt_rsc_0_31_adra")
    , TLS_xt_rsc_0_31_da("TLS_xt_rsc_0_31_da")
    , TLS_xt_rsc_0_31_wea("TLS_xt_rsc_0_31_wea")
    , TLS_xt_rsc_0_31_qa("TLS_xt_rsc_0_31_qa")
    , TLS_xt_rsc_0_31_adrb("TLS_xt_rsc_0_31_adrb")
    , TLS_xt_rsc_0_31_db("TLS_xt_rsc_0_31_db")
    , TLS_xt_rsc_0_31_web("TLS_xt_rsc_0_31_web")
    , TLS_xt_rsc_0_31_qb("TLS_xt_rsc_0_31_qb")
    , TLS_xt_rsc_triosy_0_31_lz("TLS_xt_rsc_triosy_0_31_lz")
    , TLS_p_rsc_dat("TLS_p_rsc_dat")
    , TLS_p_rsc_triosy_lz("TLS_p_rsc_triosy_lz")
    , TLS_r_rsc_dat("TLS_r_rsc_dat")
    , TLS_r_rsc_triosy_lz("TLS_r_rsc_triosy_lz")
    , TLS_twiddle_rsc_0_0_adra("TLS_twiddle_rsc_0_0_adra")
    , TLS_twiddle_rsc_0_0_da("TLS_twiddle_rsc_0_0_da")
    , TLS_twiddle_rsc_0_0_wea("TLS_twiddle_rsc_0_0_wea")
    , TLS_twiddle_rsc_0_0_qa("TLS_twiddle_rsc_0_0_qa")
    , TLS_twiddle_rsc_0_0_adrb("TLS_twiddle_rsc_0_0_adrb")
    , TLS_twiddle_rsc_0_0_db("TLS_twiddle_rsc_0_0_db")
    , TLS_twiddle_rsc_0_0_web("TLS_twiddle_rsc_0_0_web")
    , TLS_twiddle_rsc_0_0_qb("TLS_twiddle_rsc_0_0_qb")
    , TLS_twiddle_rsc_triosy_0_0_lz("TLS_twiddle_rsc_triosy_0_0_lz")
    , TLS_twiddle_rsc_0_1_adra("TLS_twiddle_rsc_0_1_adra")
    , TLS_twiddle_rsc_0_1_da("TLS_twiddle_rsc_0_1_da")
    , TLS_twiddle_rsc_0_1_wea("TLS_twiddle_rsc_0_1_wea")
    , TLS_twiddle_rsc_0_1_qa("TLS_twiddle_rsc_0_1_qa")
    , TLS_twiddle_rsc_0_1_adrb("TLS_twiddle_rsc_0_1_adrb")
    , TLS_twiddle_rsc_0_1_db("TLS_twiddle_rsc_0_1_db")
    , TLS_twiddle_rsc_0_1_web("TLS_twiddle_rsc_0_1_web")
    , TLS_twiddle_rsc_0_1_qb("TLS_twiddle_rsc_0_1_qb")
    , TLS_twiddle_rsc_triosy_0_1_lz("TLS_twiddle_rsc_triosy_0_1_lz")
    , TLS_twiddle_rsc_0_2_adra("TLS_twiddle_rsc_0_2_adra")
    , TLS_twiddle_rsc_0_2_da("TLS_twiddle_rsc_0_2_da")
    , TLS_twiddle_rsc_0_2_wea("TLS_twiddle_rsc_0_2_wea")
    , TLS_twiddle_rsc_0_2_qa("TLS_twiddle_rsc_0_2_qa")
    , TLS_twiddle_rsc_0_2_adrb("TLS_twiddle_rsc_0_2_adrb")
    , TLS_twiddle_rsc_0_2_db("TLS_twiddle_rsc_0_2_db")
    , TLS_twiddle_rsc_0_2_web("TLS_twiddle_rsc_0_2_web")
    , TLS_twiddle_rsc_0_2_qb("TLS_twiddle_rsc_0_2_qb")
    , TLS_twiddle_rsc_triosy_0_2_lz("TLS_twiddle_rsc_triosy_0_2_lz")
    , TLS_twiddle_rsc_0_3_adra("TLS_twiddle_rsc_0_3_adra")
    , TLS_twiddle_rsc_0_3_da("TLS_twiddle_rsc_0_3_da")
    , TLS_twiddle_rsc_0_3_wea("TLS_twiddle_rsc_0_3_wea")
    , TLS_twiddle_rsc_0_3_qa("TLS_twiddle_rsc_0_3_qa")
    , TLS_twiddle_rsc_0_3_adrb("TLS_twiddle_rsc_0_3_adrb")
    , TLS_twiddle_rsc_0_3_db("TLS_twiddle_rsc_0_3_db")
    , TLS_twiddle_rsc_0_3_web("TLS_twiddle_rsc_0_3_web")
    , TLS_twiddle_rsc_0_3_qb("TLS_twiddle_rsc_0_3_qb")
    , TLS_twiddle_rsc_triosy_0_3_lz("TLS_twiddle_rsc_triosy_0_3_lz")
    , TLS_twiddle_rsc_0_4_adra("TLS_twiddle_rsc_0_4_adra")
    , TLS_twiddle_rsc_0_4_da("TLS_twiddle_rsc_0_4_da")
    , TLS_twiddle_rsc_0_4_wea("TLS_twiddle_rsc_0_4_wea")
    , TLS_twiddle_rsc_0_4_qa("TLS_twiddle_rsc_0_4_qa")
    , TLS_twiddle_rsc_0_4_adrb("TLS_twiddle_rsc_0_4_adrb")
    , TLS_twiddle_rsc_0_4_db("TLS_twiddle_rsc_0_4_db")
    , TLS_twiddle_rsc_0_4_web("TLS_twiddle_rsc_0_4_web")
    , TLS_twiddle_rsc_0_4_qb("TLS_twiddle_rsc_0_4_qb")
    , TLS_twiddle_rsc_triosy_0_4_lz("TLS_twiddle_rsc_triosy_0_4_lz")
    , TLS_twiddle_rsc_0_5_adra("TLS_twiddle_rsc_0_5_adra")
    , TLS_twiddle_rsc_0_5_da("TLS_twiddle_rsc_0_5_da")
    , TLS_twiddle_rsc_0_5_wea("TLS_twiddle_rsc_0_5_wea")
    , TLS_twiddle_rsc_0_5_qa("TLS_twiddle_rsc_0_5_qa")
    , TLS_twiddle_rsc_0_5_adrb("TLS_twiddle_rsc_0_5_adrb")
    , TLS_twiddle_rsc_0_5_db("TLS_twiddle_rsc_0_5_db")
    , TLS_twiddle_rsc_0_5_web("TLS_twiddle_rsc_0_5_web")
    , TLS_twiddle_rsc_0_5_qb("TLS_twiddle_rsc_0_5_qb")
    , TLS_twiddle_rsc_triosy_0_5_lz("TLS_twiddle_rsc_triosy_0_5_lz")
    , TLS_twiddle_rsc_0_6_adra("TLS_twiddle_rsc_0_6_adra")
    , TLS_twiddle_rsc_0_6_da("TLS_twiddle_rsc_0_6_da")
    , TLS_twiddle_rsc_0_6_wea("TLS_twiddle_rsc_0_6_wea")
    , TLS_twiddle_rsc_0_6_qa("TLS_twiddle_rsc_0_6_qa")
    , TLS_twiddle_rsc_0_6_adrb("TLS_twiddle_rsc_0_6_adrb")
    , TLS_twiddle_rsc_0_6_db("TLS_twiddle_rsc_0_6_db")
    , TLS_twiddle_rsc_0_6_web("TLS_twiddle_rsc_0_6_web")
    , TLS_twiddle_rsc_0_6_qb("TLS_twiddle_rsc_0_6_qb")
    , TLS_twiddle_rsc_triosy_0_6_lz("TLS_twiddle_rsc_triosy_0_6_lz")
    , TLS_twiddle_rsc_0_7_adra("TLS_twiddle_rsc_0_7_adra")
    , TLS_twiddle_rsc_0_7_da("TLS_twiddle_rsc_0_7_da")
    , TLS_twiddle_rsc_0_7_wea("TLS_twiddle_rsc_0_7_wea")
    , TLS_twiddle_rsc_0_7_qa("TLS_twiddle_rsc_0_7_qa")
    , TLS_twiddle_rsc_0_7_adrb("TLS_twiddle_rsc_0_7_adrb")
    , TLS_twiddle_rsc_0_7_db("TLS_twiddle_rsc_0_7_db")
    , TLS_twiddle_rsc_0_7_web("TLS_twiddle_rsc_0_7_web")
    , TLS_twiddle_rsc_0_7_qb("TLS_twiddle_rsc_0_7_qb")
    , TLS_twiddle_rsc_triosy_0_7_lz("TLS_twiddle_rsc_triosy_0_7_lz")
    , TLS_twiddle_rsc_0_8_adra("TLS_twiddle_rsc_0_8_adra")
    , TLS_twiddle_rsc_0_8_da("TLS_twiddle_rsc_0_8_da")
    , TLS_twiddle_rsc_0_8_wea("TLS_twiddle_rsc_0_8_wea")
    , TLS_twiddle_rsc_0_8_qa("TLS_twiddle_rsc_0_8_qa")
    , TLS_twiddle_rsc_0_8_adrb("TLS_twiddle_rsc_0_8_adrb")
    , TLS_twiddle_rsc_0_8_db("TLS_twiddle_rsc_0_8_db")
    , TLS_twiddle_rsc_0_8_web("TLS_twiddle_rsc_0_8_web")
    , TLS_twiddle_rsc_0_8_qb("TLS_twiddle_rsc_0_8_qb")
    , TLS_twiddle_rsc_triosy_0_8_lz("TLS_twiddle_rsc_triosy_0_8_lz")
    , TLS_twiddle_rsc_0_9_adra("TLS_twiddle_rsc_0_9_adra")
    , TLS_twiddle_rsc_0_9_da("TLS_twiddle_rsc_0_9_da")
    , TLS_twiddle_rsc_0_9_wea("TLS_twiddle_rsc_0_9_wea")
    , TLS_twiddle_rsc_0_9_qa("TLS_twiddle_rsc_0_9_qa")
    , TLS_twiddle_rsc_0_9_adrb("TLS_twiddle_rsc_0_9_adrb")
    , TLS_twiddle_rsc_0_9_db("TLS_twiddle_rsc_0_9_db")
    , TLS_twiddle_rsc_0_9_web("TLS_twiddle_rsc_0_9_web")
    , TLS_twiddle_rsc_0_9_qb("TLS_twiddle_rsc_0_9_qb")
    , TLS_twiddle_rsc_triosy_0_9_lz("TLS_twiddle_rsc_triosy_0_9_lz")
    , TLS_twiddle_rsc_0_10_adra("TLS_twiddle_rsc_0_10_adra")
    , TLS_twiddle_rsc_0_10_da("TLS_twiddle_rsc_0_10_da")
    , TLS_twiddle_rsc_0_10_wea("TLS_twiddle_rsc_0_10_wea")
    , TLS_twiddle_rsc_0_10_qa("TLS_twiddle_rsc_0_10_qa")
    , TLS_twiddle_rsc_0_10_adrb("TLS_twiddle_rsc_0_10_adrb")
    , TLS_twiddle_rsc_0_10_db("TLS_twiddle_rsc_0_10_db")
    , TLS_twiddle_rsc_0_10_web("TLS_twiddle_rsc_0_10_web")
    , TLS_twiddle_rsc_0_10_qb("TLS_twiddle_rsc_0_10_qb")
    , TLS_twiddle_rsc_triosy_0_10_lz("TLS_twiddle_rsc_triosy_0_10_lz")
    , TLS_twiddle_rsc_0_11_adra("TLS_twiddle_rsc_0_11_adra")
    , TLS_twiddle_rsc_0_11_da("TLS_twiddle_rsc_0_11_da")
    , TLS_twiddle_rsc_0_11_wea("TLS_twiddle_rsc_0_11_wea")
    , TLS_twiddle_rsc_0_11_qa("TLS_twiddle_rsc_0_11_qa")
    , TLS_twiddle_rsc_0_11_adrb("TLS_twiddle_rsc_0_11_adrb")
    , TLS_twiddle_rsc_0_11_db("TLS_twiddle_rsc_0_11_db")
    , TLS_twiddle_rsc_0_11_web("TLS_twiddle_rsc_0_11_web")
    , TLS_twiddle_rsc_0_11_qb("TLS_twiddle_rsc_0_11_qb")
    , TLS_twiddle_rsc_triosy_0_11_lz("TLS_twiddle_rsc_triosy_0_11_lz")
    , TLS_twiddle_rsc_0_12_adra("TLS_twiddle_rsc_0_12_adra")
    , TLS_twiddle_rsc_0_12_da("TLS_twiddle_rsc_0_12_da")
    , TLS_twiddle_rsc_0_12_wea("TLS_twiddle_rsc_0_12_wea")
    , TLS_twiddle_rsc_0_12_qa("TLS_twiddle_rsc_0_12_qa")
    , TLS_twiddle_rsc_0_12_adrb("TLS_twiddle_rsc_0_12_adrb")
    , TLS_twiddle_rsc_0_12_db("TLS_twiddle_rsc_0_12_db")
    , TLS_twiddle_rsc_0_12_web("TLS_twiddle_rsc_0_12_web")
    , TLS_twiddle_rsc_0_12_qb("TLS_twiddle_rsc_0_12_qb")
    , TLS_twiddle_rsc_triosy_0_12_lz("TLS_twiddle_rsc_triosy_0_12_lz")
    , TLS_twiddle_rsc_0_13_adra("TLS_twiddle_rsc_0_13_adra")
    , TLS_twiddle_rsc_0_13_da("TLS_twiddle_rsc_0_13_da")
    , TLS_twiddle_rsc_0_13_wea("TLS_twiddle_rsc_0_13_wea")
    , TLS_twiddle_rsc_0_13_qa("TLS_twiddle_rsc_0_13_qa")
    , TLS_twiddle_rsc_0_13_adrb("TLS_twiddle_rsc_0_13_adrb")
    , TLS_twiddle_rsc_0_13_db("TLS_twiddle_rsc_0_13_db")
    , TLS_twiddle_rsc_0_13_web("TLS_twiddle_rsc_0_13_web")
    , TLS_twiddle_rsc_0_13_qb("TLS_twiddle_rsc_0_13_qb")
    , TLS_twiddle_rsc_triosy_0_13_lz("TLS_twiddle_rsc_triosy_0_13_lz")
    , TLS_twiddle_rsc_0_14_adra("TLS_twiddle_rsc_0_14_adra")
    , TLS_twiddle_rsc_0_14_da("TLS_twiddle_rsc_0_14_da")
    , TLS_twiddle_rsc_0_14_wea("TLS_twiddle_rsc_0_14_wea")
    , TLS_twiddle_rsc_0_14_qa("TLS_twiddle_rsc_0_14_qa")
    , TLS_twiddle_rsc_0_14_adrb("TLS_twiddle_rsc_0_14_adrb")
    , TLS_twiddle_rsc_0_14_db("TLS_twiddle_rsc_0_14_db")
    , TLS_twiddle_rsc_0_14_web("TLS_twiddle_rsc_0_14_web")
    , TLS_twiddle_rsc_0_14_qb("TLS_twiddle_rsc_0_14_qb")
    , TLS_twiddle_rsc_triosy_0_14_lz("TLS_twiddle_rsc_triosy_0_14_lz")
    , TLS_twiddle_rsc_0_15_adra("TLS_twiddle_rsc_0_15_adra")
    , TLS_twiddle_rsc_0_15_da("TLS_twiddle_rsc_0_15_da")
    , TLS_twiddle_rsc_0_15_wea("TLS_twiddle_rsc_0_15_wea")
    , TLS_twiddle_rsc_0_15_qa("TLS_twiddle_rsc_0_15_qa")
    , TLS_twiddle_rsc_0_15_adrb("TLS_twiddle_rsc_0_15_adrb")
    , TLS_twiddle_rsc_0_15_db("TLS_twiddle_rsc_0_15_db")
    , TLS_twiddle_rsc_0_15_web("TLS_twiddle_rsc_0_15_web")
    , TLS_twiddle_rsc_0_15_qb("TLS_twiddle_rsc_0_15_qb")
    , TLS_twiddle_rsc_triosy_0_15_lz("TLS_twiddle_rsc_triosy_0_15_lz")
    , TLS_twiddle_h_rsc_0_0_adra("TLS_twiddle_h_rsc_0_0_adra")
    , TLS_twiddle_h_rsc_0_0_da("TLS_twiddle_h_rsc_0_0_da")
    , TLS_twiddle_h_rsc_0_0_wea("TLS_twiddle_h_rsc_0_0_wea")
    , TLS_twiddle_h_rsc_0_0_qa("TLS_twiddle_h_rsc_0_0_qa")
    , TLS_twiddle_h_rsc_0_0_adrb("TLS_twiddle_h_rsc_0_0_adrb")
    , TLS_twiddle_h_rsc_0_0_db("TLS_twiddle_h_rsc_0_0_db")
    , TLS_twiddle_h_rsc_0_0_web("TLS_twiddle_h_rsc_0_0_web")
    , TLS_twiddle_h_rsc_0_0_qb("TLS_twiddle_h_rsc_0_0_qb")
    , TLS_twiddle_h_rsc_triosy_0_0_lz("TLS_twiddle_h_rsc_triosy_0_0_lz")
    , TLS_twiddle_h_rsc_0_1_adra("TLS_twiddle_h_rsc_0_1_adra")
    , TLS_twiddle_h_rsc_0_1_da("TLS_twiddle_h_rsc_0_1_da")
    , TLS_twiddle_h_rsc_0_1_wea("TLS_twiddle_h_rsc_0_1_wea")
    , TLS_twiddle_h_rsc_0_1_qa("TLS_twiddle_h_rsc_0_1_qa")
    , TLS_twiddle_h_rsc_0_1_adrb("TLS_twiddle_h_rsc_0_1_adrb")
    , TLS_twiddle_h_rsc_0_1_db("TLS_twiddle_h_rsc_0_1_db")
    , TLS_twiddle_h_rsc_0_1_web("TLS_twiddle_h_rsc_0_1_web")
    , TLS_twiddle_h_rsc_0_1_qb("TLS_twiddle_h_rsc_0_1_qb")
    , TLS_twiddle_h_rsc_triosy_0_1_lz("TLS_twiddle_h_rsc_triosy_0_1_lz")
    , TLS_twiddle_h_rsc_0_2_adra("TLS_twiddle_h_rsc_0_2_adra")
    , TLS_twiddle_h_rsc_0_2_da("TLS_twiddle_h_rsc_0_2_da")
    , TLS_twiddle_h_rsc_0_2_wea("TLS_twiddle_h_rsc_0_2_wea")
    , TLS_twiddle_h_rsc_0_2_qa("TLS_twiddle_h_rsc_0_2_qa")
    , TLS_twiddle_h_rsc_0_2_adrb("TLS_twiddle_h_rsc_0_2_adrb")
    , TLS_twiddle_h_rsc_0_2_db("TLS_twiddle_h_rsc_0_2_db")
    , TLS_twiddle_h_rsc_0_2_web("TLS_twiddle_h_rsc_0_2_web")
    , TLS_twiddle_h_rsc_0_2_qb("TLS_twiddle_h_rsc_0_2_qb")
    , TLS_twiddle_h_rsc_triosy_0_2_lz("TLS_twiddle_h_rsc_triosy_0_2_lz")
    , TLS_twiddle_h_rsc_0_3_adra("TLS_twiddle_h_rsc_0_3_adra")
    , TLS_twiddle_h_rsc_0_3_da("TLS_twiddle_h_rsc_0_3_da")
    , TLS_twiddle_h_rsc_0_3_wea("TLS_twiddle_h_rsc_0_3_wea")
    , TLS_twiddle_h_rsc_0_3_qa("TLS_twiddle_h_rsc_0_3_qa")
    , TLS_twiddle_h_rsc_0_3_adrb("TLS_twiddle_h_rsc_0_3_adrb")
    , TLS_twiddle_h_rsc_0_3_db("TLS_twiddle_h_rsc_0_3_db")
    , TLS_twiddle_h_rsc_0_3_web("TLS_twiddle_h_rsc_0_3_web")
    , TLS_twiddle_h_rsc_0_3_qb("TLS_twiddle_h_rsc_0_3_qb")
    , TLS_twiddle_h_rsc_triosy_0_3_lz("TLS_twiddle_h_rsc_triosy_0_3_lz")
    , TLS_twiddle_h_rsc_0_4_adra("TLS_twiddle_h_rsc_0_4_adra")
    , TLS_twiddle_h_rsc_0_4_da("TLS_twiddle_h_rsc_0_4_da")
    , TLS_twiddle_h_rsc_0_4_wea("TLS_twiddle_h_rsc_0_4_wea")
    , TLS_twiddle_h_rsc_0_4_qa("TLS_twiddle_h_rsc_0_4_qa")
    , TLS_twiddle_h_rsc_0_4_adrb("TLS_twiddle_h_rsc_0_4_adrb")
    , TLS_twiddle_h_rsc_0_4_db("TLS_twiddle_h_rsc_0_4_db")
    , TLS_twiddle_h_rsc_0_4_web("TLS_twiddle_h_rsc_0_4_web")
    , TLS_twiddle_h_rsc_0_4_qb("TLS_twiddle_h_rsc_0_4_qb")
    , TLS_twiddle_h_rsc_triosy_0_4_lz("TLS_twiddle_h_rsc_triosy_0_4_lz")
    , TLS_twiddle_h_rsc_0_5_adra("TLS_twiddle_h_rsc_0_5_adra")
    , TLS_twiddle_h_rsc_0_5_da("TLS_twiddle_h_rsc_0_5_da")
    , TLS_twiddle_h_rsc_0_5_wea("TLS_twiddle_h_rsc_0_5_wea")
    , TLS_twiddle_h_rsc_0_5_qa("TLS_twiddle_h_rsc_0_5_qa")
    , TLS_twiddle_h_rsc_0_5_adrb("TLS_twiddle_h_rsc_0_5_adrb")
    , TLS_twiddle_h_rsc_0_5_db("TLS_twiddle_h_rsc_0_5_db")
    , TLS_twiddle_h_rsc_0_5_web("TLS_twiddle_h_rsc_0_5_web")
    , TLS_twiddle_h_rsc_0_5_qb("TLS_twiddle_h_rsc_0_5_qb")
    , TLS_twiddle_h_rsc_triosy_0_5_lz("TLS_twiddle_h_rsc_triosy_0_5_lz")
    , TLS_twiddle_h_rsc_0_6_adra("TLS_twiddle_h_rsc_0_6_adra")
    , TLS_twiddle_h_rsc_0_6_da("TLS_twiddle_h_rsc_0_6_da")
    , TLS_twiddle_h_rsc_0_6_wea("TLS_twiddle_h_rsc_0_6_wea")
    , TLS_twiddle_h_rsc_0_6_qa("TLS_twiddle_h_rsc_0_6_qa")
    , TLS_twiddle_h_rsc_0_6_adrb("TLS_twiddle_h_rsc_0_6_adrb")
    , TLS_twiddle_h_rsc_0_6_db("TLS_twiddle_h_rsc_0_6_db")
    , TLS_twiddle_h_rsc_0_6_web("TLS_twiddle_h_rsc_0_6_web")
    , TLS_twiddle_h_rsc_0_6_qb("TLS_twiddle_h_rsc_0_6_qb")
    , TLS_twiddle_h_rsc_triosy_0_6_lz("TLS_twiddle_h_rsc_triosy_0_6_lz")
    , TLS_twiddle_h_rsc_0_7_adra("TLS_twiddle_h_rsc_0_7_adra")
    , TLS_twiddle_h_rsc_0_7_da("TLS_twiddle_h_rsc_0_7_da")
    , TLS_twiddle_h_rsc_0_7_wea("TLS_twiddle_h_rsc_0_7_wea")
    , TLS_twiddle_h_rsc_0_7_qa("TLS_twiddle_h_rsc_0_7_qa")
    , TLS_twiddle_h_rsc_0_7_adrb("TLS_twiddle_h_rsc_0_7_adrb")
    , TLS_twiddle_h_rsc_0_7_db("TLS_twiddle_h_rsc_0_7_db")
    , TLS_twiddle_h_rsc_0_7_web("TLS_twiddle_h_rsc_0_7_web")
    , TLS_twiddle_h_rsc_0_7_qb("TLS_twiddle_h_rsc_0_7_qb")
    , TLS_twiddle_h_rsc_triosy_0_7_lz("TLS_twiddle_h_rsc_triosy_0_7_lz")
    , TLS_twiddle_h_rsc_0_8_adra("TLS_twiddle_h_rsc_0_8_adra")
    , TLS_twiddle_h_rsc_0_8_da("TLS_twiddle_h_rsc_0_8_da")
    , TLS_twiddle_h_rsc_0_8_wea("TLS_twiddle_h_rsc_0_8_wea")
    , TLS_twiddle_h_rsc_0_8_qa("TLS_twiddle_h_rsc_0_8_qa")
    , TLS_twiddle_h_rsc_0_8_adrb("TLS_twiddle_h_rsc_0_8_adrb")
    , TLS_twiddle_h_rsc_0_8_db("TLS_twiddle_h_rsc_0_8_db")
    , TLS_twiddle_h_rsc_0_8_web("TLS_twiddle_h_rsc_0_8_web")
    , TLS_twiddle_h_rsc_0_8_qb("TLS_twiddle_h_rsc_0_8_qb")
    , TLS_twiddle_h_rsc_triosy_0_8_lz("TLS_twiddle_h_rsc_triosy_0_8_lz")
    , TLS_twiddle_h_rsc_0_9_adra("TLS_twiddle_h_rsc_0_9_adra")
    , TLS_twiddle_h_rsc_0_9_da("TLS_twiddle_h_rsc_0_9_da")
    , TLS_twiddle_h_rsc_0_9_wea("TLS_twiddle_h_rsc_0_9_wea")
    , TLS_twiddle_h_rsc_0_9_qa("TLS_twiddle_h_rsc_0_9_qa")
    , TLS_twiddle_h_rsc_0_9_adrb("TLS_twiddle_h_rsc_0_9_adrb")
    , TLS_twiddle_h_rsc_0_9_db("TLS_twiddle_h_rsc_0_9_db")
    , TLS_twiddle_h_rsc_0_9_web("TLS_twiddle_h_rsc_0_9_web")
    , TLS_twiddle_h_rsc_0_9_qb("TLS_twiddle_h_rsc_0_9_qb")
    , TLS_twiddle_h_rsc_triosy_0_9_lz("TLS_twiddle_h_rsc_triosy_0_9_lz")
    , TLS_twiddle_h_rsc_0_10_adra("TLS_twiddle_h_rsc_0_10_adra")
    , TLS_twiddle_h_rsc_0_10_da("TLS_twiddle_h_rsc_0_10_da")
    , TLS_twiddle_h_rsc_0_10_wea("TLS_twiddle_h_rsc_0_10_wea")
    , TLS_twiddle_h_rsc_0_10_qa("TLS_twiddle_h_rsc_0_10_qa")
    , TLS_twiddle_h_rsc_0_10_adrb("TLS_twiddle_h_rsc_0_10_adrb")
    , TLS_twiddle_h_rsc_0_10_db("TLS_twiddle_h_rsc_0_10_db")
    , TLS_twiddle_h_rsc_0_10_web("TLS_twiddle_h_rsc_0_10_web")
    , TLS_twiddle_h_rsc_0_10_qb("TLS_twiddle_h_rsc_0_10_qb")
    , TLS_twiddle_h_rsc_triosy_0_10_lz("TLS_twiddle_h_rsc_triosy_0_10_lz")
    , TLS_twiddle_h_rsc_0_11_adra("TLS_twiddle_h_rsc_0_11_adra")
    , TLS_twiddle_h_rsc_0_11_da("TLS_twiddle_h_rsc_0_11_da")
    , TLS_twiddle_h_rsc_0_11_wea("TLS_twiddle_h_rsc_0_11_wea")
    , TLS_twiddle_h_rsc_0_11_qa("TLS_twiddle_h_rsc_0_11_qa")
    , TLS_twiddle_h_rsc_0_11_adrb("TLS_twiddle_h_rsc_0_11_adrb")
    , TLS_twiddle_h_rsc_0_11_db("TLS_twiddle_h_rsc_0_11_db")
    , TLS_twiddle_h_rsc_0_11_web("TLS_twiddle_h_rsc_0_11_web")
    , TLS_twiddle_h_rsc_0_11_qb("TLS_twiddle_h_rsc_0_11_qb")
    , TLS_twiddle_h_rsc_triosy_0_11_lz("TLS_twiddle_h_rsc_triosy_0_11_lz")
    , TLS_twiddle_h_rsc_0_12_adra("TLS_twiddle_h_rsc_0_12_adra")
    , TLS_twiddle_h_rsc_0_12_da("TLS_twiddle_h_rsc_0_12_da")
    , TLS_twiddle_h_rsc_0_12_wea("TLS_twiddle_h_rsc_0_12_wea")
    , TLS_twiddle_h_rsc_0_12_qa("TLS_twiddle_h_rsc_0_12_qa")
    , TLS_twiddle_h_rsc_0_12_adrb("TLS_twiddle_h_rsc_0_12_adrb")
    , TLS_twiddle_h_rsc_0_12_db("TLS_twiddle_h_rsc_0_12_db")
    , TLS_twiddle_h_rsc_0_12_web("TLS_twiddle_h_rsc_0_12_web")
    , TLS_twiddle_h_rsc_0_12_qb("TLS_twiddle_h_rsc_0_12_qb")
    , TLS_twiddle_h_rsc_triosy_0_12_lz("TLS_twiddle_h_rsc_triosy_0_12_lz")
    , TLS_twiddle_h_rsc_0_13_adra("TLS_twiddle_h_rsc_0_13_adra")
    , TLS_twiddle_h_rsc_0_13_da("TLS_twiddle_h_rsc_0_13_da")
    , TLS_twiddle_h_rsc_0_13_wea("TLS_twiddle_h_rsc_0_13_wea")
    , TLS_twiddle_h_rsc_0_13_qa("TLS_twiddle_h_rsc_0_13_qa")
    , TLS_twiddle_h_rsc_0_13_adrb("TLS_twiddle_h_rsc_0_13_adrb")
    , TLS_twiddle_h_rsc_0_13_db("TLS_twiddle_h_rsc_0_13_db")
    , TLS_twiddle_h_rsc_0_13_web("TLS_twiddle_h_rsc_0_13_web")
    , TLS_twiddle_h_rsc_0_13_qb("TLS_twiddle_h_rsc_0_13_qb")
    , TLS_twiddle_h_rsc_triosy_0_13_lz("TLS_twiddle_h_rsc_triosy_0_13_lz")
    , TLS_twiddle_h_rsc_0_14_adra("TLS_twiddle_h_rsc_0_14_adra")
    , TLS_twiddle_h_rsc_0_14_da("TLS_twiddle_h_rsc_0_14_da")
    , TLS_twiddle_h_rsc_0_14_wea("TLS_twiddle_h_rsc_0_14_wea")
    , TLS_twiddle_h_rsc_0_14_qa("TLS_twiddle_h_rsc_0_14_qa")
    , TLS_twiddle_h_rsc_0_14_adrb("TLS_twiddle_h_rsc_0_14_adrb")
    , TLS_twiddle_h_rsc_0_14_db("TLS_twiddle_h_rsc_0_14_db")
    , TLS_twiddle_h_rsc_0_14_web("TLS_twiddle_h_rsc_0_14_web")
    , TLS_twiddle_h_rsc_0_14_qb("TLS_twiddle_h_rsc_0_14_qb")
    , TLS_twiddle_h_rsc_triosy_0_14_lz("TLS_twiddle_h_rsc_triosy_0_14_lz")
    , TLS_twiddle_h_rsc_0_15_adra("TLS_twiddle_h_rsc_0_15_adra")
    , TLS_twiddle_h_rsc_0_15_da("TLS_twiddle_h_rsc_0_15_da")
    , TLS_twiddle_h_rsc_0_15_wea("TLS_twiddle_h_rsc_0_15_wea")
    , TLS_twiddle_h_rsc_0_15_qa("TLS_twiddle_h_rsc_0_15_qa")
    , TLS_twiddle_h_rsc_0_15_adrb("TLS_twiddle_h_rsc_0_15_adrb")
    , TLS_twiddle_h_rsc_0_15_db("TLS_twiddle_h_rsc_0_15_db")
    , TLS_twiddle_h_rsc_0_15_web("TLS_twiddle_h_rsc_0_15_web")
    , TLS_twiddle_h_rsc_0_15_qb("TLS_twiddle_h_rsc_0_15_qb")
    , TLS_twiddle_h_rsc_triosy_0_15_lz("TLS_twiddle_h_rsc_triosy_0_15_lz")
    , peaseNTT_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , xt_rsc_0__0__INST("xt_rsc_0__0_", true)
    , xt_rsc_0__1__INST("xt_rsc_0__1_", true)
    , xt_rsc_0__2__INST("xt_rsc_0__2_", true)
    , xt_rsc_0__3__INST("xt_rsc_0__3_", true)
    , xt_rsc_0__4__INST("xt_rsc_0__4_", true)
    , xt_rsc_0__5__INST("xt_rsc_0__5_", true)
    , xt_rsc_0__6__INST("xt_rsc_0__6_", true)
    , xt_rsc_0__7__INST("xt_rsc_0__7_", true)
    , xt_rsc_0__8__INST("xt_rsc_0__8_", true)
    , xt_rsc_0__9__INST("xt_rsc_0__9_", true)
    , xt_rsc_0__10__INST("xt_rsc_0__10_", true)
    , xt_rsc_0__11__INST("xt_rsc_0__11_", true)
    , xt_rsc_0__12__INST("xt_rsc_0__12_", true)
    , xt_rsc_0__13__INST("xt_rsc_0__13_", true)
    , xt_rsc_0__14__INST("xt_rsc_0__14_", true)
    , xt_rsc_0__15__INST("xt_rsc_0__15_", true)
    , xt_rsc_0__16__INST("xt_rsc_0__16_", true)
    , xt_rsc_0__17__INST("xt_rsc_0__17_", true)
    , xt_rsc_0__18__INST("xt_rsc_0__18_", true)
    , xt_rsc_0__19__INST("xt_rsc_0__19_", true)
    , xt_rsc_0__20__INST("xt_rsc_0__20_", true)
    , xt_rsc_0__21__INST("xt_rsc_0__21_", true)
    , xt_rsc_0__22__INST("xt_rsc_0__22_", true)
    , xt_rsc_0__23__INST("xt_rsc_0__23_", true)
    , xt_rsc_0__24__INST("xt_rsc_0__24_", true)
    , xt_rsc_0__25__INST("xt_rsc_0__25_", true)
    , xt_rsc_0__26__INST("xt_rsc_0__26_", true)
    , xt_rsc_0__27__INST("xt_rsc_0__27_", true)
    , xt_rsc_0__28__INST("xt_rsc_0__28_", true)
    , xt_rsc_0__29__INST("xt_rsc_0__29_", true)
    , xt_rsc_0__30__INST("xt_rsc_0__30_", true)
    , xt_rsc_0__31__INST("xt_rsc_0__31_", true)
    , p_rsc_INST("p_rsc", true)
    , r_rsc_INST("r_rsc", true)
    , twiddle_rsc_0__0__INST("twiddle_rsc_0__0_", true)
    , twiddle_rsc_0__1__INST("twiddle_rsc_0__1_", true)
    , twiddle_rsc_0__2__INST("twiddle_rsc_0__2_", true)
    , twiddle_rsc_0__3__INST("twiddle_rsc_0__3_", true)
    , twiddle_rsc_0__4__INST("twiddle_rsc_0__4_", true)
    , twiddle_rsc_0__5__INST("twiddle_rsc_0__5_", true)
    , twiddle_rsc_0__6__INST("twiddle_rsc_0__6_", true)
    , twiddle_rsc_0__7__INST("twiddle_rsc_0__7_", true)
    , twiddle_rsc_0__8__INST("twiddle_rsc_0__8_", true)
    , twiddle_rsc_0__9__INST("twiddle_rsc_0__9_", true)
    , twiddle_rsc_0__10__INST("twiddle_rsc_0__10_", true)
    , twiddle_rsc_0__11__INST("twiddle_rsc_0__11_", true)
    , twiddle_rsc_0__12__INST("twiddle_rsc_0__12_", true)
    , twiddle_rsc_0__13__INST("twiddle_rsc_0__13_", true)
    , twiddle_rsc_0__14__INST("twiddle_rsc_0__14_", true)
    , twiddle_rsc_0__15__INST("twiddle_rsc_0__15_", true)
    , twiddle_h_rsc_0__0__INST("twiddle_h_rsc_0__0_", true)
    , twiddle_h_rsc_0__1__INST("twiddle_h_rsc_0__1_", true)
    , twiddle_h_rsc_0__2__INST("twiddle_h_rsc_0__2_", true)
    , twiddle_h_rsc_0__3__INST("twiddle_h_rsc_0__3_", true)
    , twiddle_h_rsc_0__4__INST("twiddle_h_rsc_0__4_", true)
    , twiddle_h_rsc_0__5__INST("twiddle_h_rsc_0__5_", true)
    , twiddle_h_rsc_0__6__INST("twiddle_h_rsc_0__6_", true)
    , twiddle_h_rsc_0__7__INST("twiddle_h_rsc_0__7_", true)
    , twiddle_h_rsc_0__8__INST("twiddle_h_rsc_0__8_", true)
    , twiddle_h_rsc_0__9__INST("twiddle_h_rsc_0__9_", true)
    , twiddle_h_rsc_0__10__INST("twiddle_h_rsc_0__10_", true)
    , twiddle_h_rsc_0__11__INST("twiddle_h_rsc_0__11_", true)
    , twiddle_h_rsc_0__12__INST("twiddle_h_rsc_0__12_", true)
    , twiddle_h_rsc_0__13__INST("twiddle_h_rsc_0__13_", true)
    , twiddle_h_rsc_0__14__INST("twiddle_h_rsc_0__14_", true)
    , twiddle_h_rsc_0__15__INST("twiddle_h_rsc_0__15_", true)
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
    , trios_monitor_xt_rsc_triosy_0_8_lz_INST("trios_monitor_xt_rsc_triosy_0_8_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_9_lz_INST("trios_monitor_xt_rsc_triosy_0_9_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_10_lz_INST("trios_monitor_xt_rsc_triosy_0_10_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_11_lz_INST("trios_monitor_xt_rsc_triosy_0_11_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_12_lz_INST("trios_monitor_xt_rsc_triosy_0_12_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_13_lz_INST("trios_monitor_xt_rsc_triosy_0_13_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_14_lz_INST("trios_monitor_xt_rsc_triosy_0_14_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_15_lz_INST("trios_monitor_xt_rsc_triosy_0_15_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_16_lz_INST("trios_monitor_xt_rsc_triosy_0_16_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_17_lz_INST("trios_monitor_xt_rsc_triosy_0_17_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_18_lz_INST("trios_monitor_xt_rsc_triosy_0_18_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_19_lz_INST("trios_monitor_xt_rsc_triosy_0_19_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_20_lz_INST("trios_monitor_xt_rsc_triosy_0_20_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_21_lz_INST("trios_monitor_xt_rsc_triosy_0_21_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_22_lz_INST("trios_monitor_xt_rsc_triosy_0_22_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_23_lz_INST("trios_monitor_xt_rsc_triosy_0_23_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_24_lz_INST("trios_monitor_xt_rsc_triosy_0_24_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_25_lz_INST("trios_monitor_xt_rsc_triosy_0_25_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_26_lz_INST("trios_monitor_xt_rsc_triosy_0_26_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_27_lz_INST("trios_monitor_xt_rsc_triosy_0_27_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_28_lz_INST("trios_monitor_xt_rsc_triosy_0_28_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_29_lz_INST("trios_monitor_xt_rsc_triosy_0_29_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_30_lz_INST("trios_monitor_xt_rsc_triosy_0_30_lz_INST")
    , trios_monitor_xt_rsc_triosy_0_31_lz_INST("trios_monitor_xt_rsc_triosy_0_31_lz_INST")
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
    , trios_monitor_twiddle_rsc_triosy_0_4_lz_INST("trios_monitor_twiddle_rsc_triosy_0_4_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_5_lz_INST("trios_monitor_twiddle_rsc_triosy_0_5_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_6_lz_INST("trios_monitor_twiddle_rsc_triosy_0_6_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_7_lz_INST("trios_monitor_twiddle_rsc_triosy_0_7_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_8_lz_INST("trios_monitor_twiddle_rsc_triosy_0_8_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_9_lz_INST("trios_monitor_twiddle_rsc_triosy_0_9_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_10_lz_INST("trios_monitor_twiddle_rsc_triosy_0_10_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_11_lz_INST("trios_monitor_twiddle_rsc_triosy_0_11_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_12_lz_INST("trios_monitor_twiddle_rsc_triosy_0_12_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_13_lz_INST("trios_monitor_twiddle_rsc_triosy_0_13_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_14_lz_INST("trios_monitor_twiddle_rsc_triosy_0_14_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_15_lz_INST("trios_monitor_twiddle_rsc_triosy_0_15_lz_INST")
    , transactor_twiddle("transactor_twiddle", 0, 32, 0)
    , TLS_in_fifo_twiddle_h("TLS_in_fifo_twiddle_h", -1)
    , TLS_in_wait_ctrl_fifo_twiddle_h("TLS_in_wait_ctrl_fifo_twiddle_h", -1)
    , trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_4_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_4_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_5_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_5_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_6_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_6_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_7_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_7_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_8_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_8_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_9_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_9_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_10_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_10_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_11_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_11_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_12_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_12_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_13_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_13_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_14_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_14_lz_INST")
    , trios_monitor_twiddle_h_rsc_triosy_0_15_lz_INST("trios_monitor_twiddle_h_rsc_triosy_0_15_lz_INST")
    , transactor_twiddle_h("transactor_twiddle_h", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 1674, 1674, 0)
    , catapult_monitor_INST("Monitor", clk, true, 1674LL, 1674LL)
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
    peaseNTT_INST.xt_rsc_0_8_adra(TLS_xt_rsc_0_8_adra);
    peaseNTT_INST.xt_rsc_0_8_da(TLS_xt_rsc_0_8_da);
    peaseNTT_INST.xt_rsc_0_8_wea(TLS_xt_rsc_0_8_wea);
    peaseNTT_INST.xt_rsc_0_8_qa(TLS_xt_rsc_0_8_qa);
    peaseNTT_INST.xt_rsc_0_8_adrb(TLS_xt_rsc_0_8_adrb);
    peaseNTT_INST.xt_rsc_0_8_db(TLS_xt_rsc_0_8_db);
    peaseNTT_INST.xt_rsc_0_8_web(TLS_xt_rsc_0_8_web);
    peaseNTT_INST.xt_rsc_0_8_qb(TLS_xt_rsc_0_8_qb);
    peaseNTT_INST.xt_rsc_triosy_0_8_lz(TLS_xt_rsc_triosy_0_8_lz);
    peaseNTT_INST.xt_rsc_0_9_adra(TLS_xt_rsc_0_9_adra);
    peaseNTT_INST.xt_rsc_0_9_da(TLS_xt_rsc_0_9_da);
    peaseNTT_INST.xt_rsc_0_9_wea(TLS_xt_rsc_0_9_wea);
    peaseNTT_INST.xt_rsc_0_9_qa(TLS_xt_rsc_0_9_qa);
    peaseNTT_INST.xt_rsc_0_9_adrb(TLS_xt_rsc_0_9_adrb);
    peaseNTT_INST.xt_rsc_0_9_db(TLS_xt_rsc_0_9_db);
    peaseNTT_INST.xt_rsc_0_9_web(TLS_xt_rsc_0_9_web);
    peaseNTT_INST.xt_rsc_0_9_qb(TLS_xt_rsc_0_9_qb);
    peaseNTT_INST.xt_rsc_triosy_0_9_lz(TLS_xt_rsc_triosy_0_9_lz);
    peaseNTT_INST.xt_rsc_0_10_adra(TLS_xt_rsc_0_10_adra);
    peaseNTT_INST.xt_rsc_0_10_da(TLS_xt_rsc_0_10_da);
    peaseNTT_INST.xt_rsc_0_10_wea(TLS_xt_rsc_0_10_wea);
    peaseNTT_INST.xt_rsc_0_10_qa(TLS_xt_rsc_0_10_qa);
    peaseNTT_INST.xt_rsc_0_10_adrb(TLS_xt_rsc_0_10_adrb);
    peaseNTT_INST.xt_rsc_0_10_db(TLS_xt_rsc_0_10_db);
    peaseNTT_INST.xt_rsc_0_10_web(TLS_xt_rsc_0_10_web);
    peaseNTT_INST.xt_rsc_0_10_qb(TLS_xt_rsc_0_10_qb);
    peaseNTT_INST.xt_rsc_triosy_0_10_lz(TLS_xt_rsc_triosy_0_10_lz);
    peaseNTT_INST.xt_rsc_0_11_adra(TLS_xt_rsc_0_11_adra);
    peaseNTT_INST.xt_rsc_0_11_da(TLS_xt_rsc_0_11_da);
    peaseNTT_INST.xt_rsc_0_11_wea(TLS_xt_rsc_0_11_wea);
    peaseNTT_INST.xt_rsc_0_11_qa(TLS_xt_rsc_0_11_qa);
    peaseNTT_INST.xt_rsc_0_11_adrb(TLS_xt_rsc_0_11_adrb);
    peaseNTT_INST.xt_rsc_0_11_db(TLS_xt_rsc_0_11_db);
    peaseNTT_INST.xt_rsc_0_11_web(TLS_xt_rsc_0_11_web);
    peaseNTT_INST.xt_rsc_0_11_qb(TLS_xt_rsc_0_11_qb);
    peaseNTT_INST.xt_rsc_triosy_0_11_lz(TLS_xt_rsc_triosy_0_11_lz);
    peaseNTT_INST.xt_rsc_0_12_adra(TLS_xt_rsc_0_12_adra);
    peaseNTT_INST.xt_rsc_0_12_da(TLS_xt_rsc_0_12_da);
    peaseNTT_INST.xt_rsc_0_12_wea(TLS_xt_rsc_0_12_wea);
    peaseNTT_INST.xt_rsc_0_12_qa(TLS_xt_rsc_0_12_qa);
    peaseNTT_INST.xt_rsc_0_12_adrb(TLS_xt_rsc_0_12_adrb);
    peaseNTT_INST.xt_rsc_0_12_db(TLS_xt_rsc_0_12_db);
    peaseNTT_INST.xt_rsc_0_12_web(TLS_xt_rsc_0_12_web);
    peaseNTT_INST.xt_rsc_0_12_qb(TLS_xt_rsc_0_12_qb);
    peaseNTT_INST.xt_rsc_triosy_0_12_lz(TLS_xt_rsc_triosy_0_12_lz);
    peaseNTT_INST.xt_rsc_0_13_adra(TLS_xt_rsc_0_13_adra);
    peaseNTT_INST.xt_rsc_0_13_da(TLS_xt_rsc_0_13_da);
    peaseNTT_INST.xt_rsc_0_13_wea(TLS_xt_rsc_0_13_wea);
    peaseNTT_INST.xt_rsc_0_13_qa(TLS_xt_rsc_0_13_qa);
    peaseNTT_INST.xt_rsc_0_13_adrb(TLS_xt_rsc_0_13_adrb);
    peaseNTT_INST.xt_rsc_0_13_db(TLS_xt_rsc_0_13_db);
    peaseNTT_INST.xt_rsc_0_13_web(TLS_xt_rsc_0_13_web);
    peaseNTT_INST.xt_rsc_0_13_qb(TLS_xt_rsc_0_13_qb);
    peaseNTT_INST.xt_rsc_triosy_0_13_lz(TLS_xt_rsc_triosy_0_13_lz);
    peaseNTT_INST.xt_rsc_0_14_adra(TLS_xt_rsc_0_14_adra);
    peaseNTT_INST.xt_rsc_0_14_da(TLS_xt_rsc_0_14_da);
    peaseNTT_INST.xt_rsc_0_14_wea(TLS_xt_rsc_0_14_wea);
    peaseNTT_INST.xt_rsc_0_14_qa(TLS_xt_rsc_0_14_qa);
    peaseNTT_INST.xt_rsc_0_14_adrb(TLS_xt_rsc_0_14_adrb);
    peaseNTT_INST.xt_rsc_0_14_db(TLS_xt_rsc_0_14_db);
    peaseNTT_INST.xt_rsc_0_14_web(TLS_xt_rsc_0_14_web);
    peaseNTT_INST.xt_rsc_0_14_qb(TLS_xt_rsc_0_14_qb);
    peaseNTT_INST.xt_rsc_triosy_0_14_lz(TLS_xt_rsc_triosy_0_14_lz);
    peaseNTT_INST.xt_rsc_0_15_adra(TLS_xt_rsc_0_15_adra);
    peaseNTT_INST.xt_rsc_0_15_da(TLS_xt_rsc_0_15_da);
    peaseNTT_INST.xt_rsc_0_15_wea(TLS_xt_rsc_0_15_wea);
    peaseNTT_INST.xt_rsc_0_15_qa(TLS_xt_rsc_0_15_qa);
    peaseNTT_INST.xt_rsc_0_15_adrb(TLS_xt_rsc_0_15_adrb);
    peaseNTT_INST.xt_rsc_0_15_db(TLS_xt_rsc_0_15_db);
    peaseNTT_INST.xt_rsc_0_15_web(TLS_xt_rsc_0_15_web);
    peaseNTT_INST.xt_rsc_0_15_qb(TLS_xt_rsc_0_15_qb);
    peaseNTT_INST.xt_rsc_triosy_0_15_lz(TLS_xt_rsc_triosy_0_15_lz);
    peaseNTT_INST.xt_rsc_0_16_adra(TLS_xt_rsc_0_16_adra);
    peaseNTT_INST.xt_rsc_0_16_da(TLS_xt_rsc_0_16_da);
    peaseNTT_INST.xt_rsc_0_16_wea(TLS_xt_rsc_0_16_wea);
    peaseNTT_INST.xt_rsc_0_16_qa(TLS_xt_rsc_0_16_qa);
    peaseNTT_INST.xt_rsc_0_16_adrb(TLS_xt_rsc_0_16_adrb);
    peaseNTT_INST.xt_rsc_0_16_db(TLS_xt_rsc_0_16_db);
    peaseNTT_INST.xt_rsc_0_16_web(TLS_xt_rsc_0_16_web);
    peaseNTT_INST.xt_rsc_0_16_qb(TLS_xt_rsc_0_16_qb);
    peaseNTT_INST.xt_rsc_triosy_0_16_lz(TLS_xt_rsc_triosy_0_16_lz);
    peaseNTT_INST.xt_rsc_0_17_adra(TLS_xt_rsc_0_17_adra);
    peaseNTT_INST.xt_rsc_0_17_da(TLS_xt_rsc_0_17_da);
    peaseNTT_INST.xt_rsc_0_17_wea(TLS_xt_rsc_0_17_wea);
    peaseNTT_INST.xt_rsc_0_17_qa(TLS_xt_rsc_0_17_qa);
    peaseNTT_INST.xt_rsc_0_17_adrb(TLS_xt_rsc_0_17_adrb);
    peaseNTT_INST.xt_rsc_0_17_db(TLS_xt_rsc_0_17_db);
    peaseNTT_INST.xt_rsc_0_17_web(TLS_xt_rsc_0_17_web);
    peaseNTT_INST.xt_rsc_0_17_qb(TLS_xt_rsc_0_17_qb);
    peaseNTT_INST.xt_rsc_triosy_0_17_lz(TLS_xt_rsc_triosy_0_17_lz);
    peaseNTT_INST.xt_rsc_0_18_adra(TLS_xt_rsc_0_18_adra);
    peaseNTT_INST.xt_rsc_0_18_da(TLS_xt_rsc_0_18_da);
    peaseNTT_INST.xt_rsc_0_18_wea(TLS_xt_rsc_0_18_wea);
    peaseNTT_INST.xt_rsc_0_18_qa(TLS_xt_rsc_0_18_qa);
    peaseNTT_INST.xt_rsc_0_18_adrb(TLS_xt_rsc_0_18_adrb);
    peaseNTT_INST.xt_rsc_0_18_db(TLS_xt_rsc_0_18_db);
    peaseNTT_INST.xt_rsc_0_18_web(TLS_xt_rsc_0_18_web);
    peaseNTT_INST.xt_rsc_0_18_qb(TLS_xt_rsc_0_18_qb);
    peaseNTT_INST.xt_rsc_triosy_0_18_lz(TLS_xt_rsc_triosy_0_18_lz);
    peaseNTT_INST.xt_rsc_0_19_adra(TLS_xt_rsc_0_19_adra);
    peaseNTT_INST.xt_rsc_0_19_da(TLS_xt_rsc_0_19_da);
    peaseNTT_INST.xt_rsc_0_19_wea(TLS_xt_rsc_0_19_wea);
    peaseNTT_INST.xt_rsc_0_19_qa(TLS_xt_rsc_0_19_qa);
    peaseNTT_INST.xt_rsc_0_19_adrb(TLS_xt_rsc_0_19_adrb);
    peaseNTT_INST.xt_rsc_0_19_db(TLS_xt_rsc_0_19_db);
    peaseNTT_INST.xt_rsc_0_19_web(TLS_xt_rsc_0_19_web);
    peaseNTT_INST.xt_rsc_0_19_qb(TLS_xt_rsc_0_19_qb);
    peaseNTT_INST.xt_rsc_triosy_0_19_lz(TLS_xt_rsc_triosy_0_19_lz);
    peaseNTT_INST.xt_rsc_0_20_adra(TLS_xt_rsc_0_20_adra);
    peaseNTT_INST.xt_rsc_0_20_da(TLS_xt_rsc_0_20_da);
    peaseNTT_INST.xt_rsc_0_20_wea(TLS_xt_rsc_0_20_wea);
    peaseNTT_INST.xt_rsc_0_20_qa(TLS_xt_rsc_0_20_qa);
    peaseNTT_INST.xt_rsc_0_20_adrb(TLS_xt_rsc_0_20_adrb);
    peaseNTT_INST.xt_rsc_0_20_db(TLS_xt_rsc_0_20_db);
    peaseNTT_INST.xt_rsc_0_20_web(TLS_xt_rsc_0_20_web);
    peaseNTT_INST.xt_rsc_0_20_qb(TLS_xt_rsc_0_20_qb);
    peaseNTT_INST.xt_rsc_triosy_0_20_lz(TLS_xt_rsc_triosy_0_20_lz);
    peaseNTT_INST.xt_rsc_0_21_adra(TLS_xt_rsc_0_21_adra);
    peaseNTT_INST.xt_rsc_0_21_da(TLS_xt_rsc_0_21_da);
    peaseNTT_INST.xt_rsc_0_21_wea(TLS_xt_rsc_0_21_wea);
    peaseNTT_INST.xt_rsc_0_21_qa(TLS_xt_rsc_0_21_qa);
    peaseNTT_INST.xt_rsc_0_21_adrb(TLS_xt_rsc_0_21_adrb);
    peaseNTT_INST.xt_rsc_0_21_db(TLS_xt_rsc_0_21_db);
    peaseNTT_INST.xt_rsc_0_21_web(TLS_xt_rsc_0_21_web);
    peaseNTT_INST.xt_rsc_0_21_qb(TLS_xt_rsc_0_21_qb);
    peaseNTT_INST.xt_rsc_triosy_0_21_lz(TLS_xt_rsc_triosy_0_21_lz);
    peaseNTT_INST.xt_rsc_0_22_adra(TLS_xt_rsc_0_22_adra);
    peaseNTT_INST.xt_rsc_0_22_da(TLS_xt_rsc_0_22_da);
    peaseNTT_INST.xt_rsc_0_22_wea(TLS_xt_rsc_0_22_wea);
    peaseNTT_INST.xt_rsc_0_22_qa(TLS_xt_rsc_0_22_qa);
    peaseNTT_INST.xt_rsc_0_22_adrb(TLS_xt_rsc_0_22_adrb);
    peaseNTT_INST.xt_rsc_0_22_db(TLS_xt_rsc_0_22_db);
    peaseNTT_INST.xt_rsc_0_22_web(TLS_xt_rsc_0_22_web);
    peaseNTT_INST.xt_rsc_0_22_qb(TLS_xt_rsc_0_22_qb);
    peaseNTT_INST.xt_rsc_triosy_0_22_lz(TLS_xt_rsc_triosy_0_22_lz);
    peaseNTT_INST.xt_rsc_0_23_adra(TLS_xt_rsc_0_23_adra);
    peaseNTT_INST.xt_rsc_0_23_da(TLS_xt_rsc_0_23_da);
    peaseNTT_INST.xt_rsc_0_23_wea(TLS_xt_rsc_0_23_wea);
    peaseNTT_INST.xt_rsc_0_23_qa(TLS_xt_rsc_0_23_qa);
    peaseNTT_INST.xt_rsc_0_23_adrb(TLS_xt_rsc_0_23_adrb);
    peaseNTT_INST.xt_rsc_0_23_db(TLS_xt_rsc_0_23_db);
    peaseNTT_INST.xt_rsc_0_23_web(TLS_xt_rsc_0_23_web);
    peaseNTT_INST.xt_rsc_0_23_qb(TLS_xt_rsc_0_23_qb);
    peaseNTT_INST.xt_rsc_triosy_0_23_lz(TLS_xt_rsc_triosy_0_23_lz);
    peaseNTT_INST.xt_rsc_0_24_adra(TLS_xt_rsc_0_24_adra);
    peaseNTT_INST.xt_rsc_0_24_da(TLS_xt_rsc_0_24_da);
    peaseNTT_INST.xt_rsc_0_24_wea(TLS_xt_rsc_0_24_wea);
    peaseNTT_INST.xt_rsc_0_24_qa(TLS_xt_rsc_0_24_qa);
    peaseNTT_INST.xt_rsc_0_24_adrb(TLS_xt_rsc_0_24_adrb);
    peaseNTT_INST.xt_rsc_0_24_db(TLS_xt_rsc_0_24_db);
    peaseNTT_INST.xt_rsc_0_24_web(TLS_xt_rsc_0_24_web);
    peaseNTT_INST.xt_rsc_0_24_qb(TLS_xt_rsc_0_24_qb);
    peaseNTT_INST.xt_rsc_triosy_0_24_lz(TLS_xt_rsc_triosy_0_24_lz);
    peaseNTT_INST.xt_rsc_0_25_adra(TLS_xt_rsc_0_25_adra);
    peaseNTT_INST.xt_rsc_0_25_da(TLS_xt_rsc_0_25_da);
    peaseNTT_INST.xt_rsc_0_25_wea(TLS_xt_rsc_0_25_wea);
    peaseNTT_INST.xt_rsc_0_25_qa(TLS_xt_rsc_0_25_qa);
    peaseNTT_INST.xt_rsc_0_25_adrb(TLS_xt_rsc_0_25_adrb);
    peaseNTT_INST.xt_rsc_0_25_db(TLS_xt_rsc_0_25_db);
    peaseNTT_INST.xt_rsc_0_25_web(TLS_xt_rsc_0_25_web);
    peaseNTT_INST.xt_rsc_0_25_qb(TLS_xt_rsc_0_25_qb);
    peaseNTT_INST.xt_rsc_triosy_0_25_lz(TLS_xt_rsc_triosy_0_25_lz);
    peaseNTT_INST.xt_rsc_0_26_adra(TLS_xt_rsc_0_26_adra);
    peaseNTT_INST.xt_rsc_0_26_da(TLS_xt_rsc_0_26_da);
    peaseNTT_INST.xt_rsc_0_26_wea(TLS_xt_rsc_0_26_wea);
    peaseNTT_INST.xt_rsc_0_26_qa(TLS_xt_rsc_0_26_qa);
    peaseNTT_INST.xt_rsc_0_26_adrb(TLS_xt_rsc_0_26_adrb);
    peaseNTT_INST.xt_rsc_0_26_db(TLS_xt_rsc_0_26_db);
    peaseNTT_INST.xt_rsc_0_26_web(TLS_xt_rsc_0_26_web);
    peaseNTT_INST.xt_rsc_0_26_qb(TLS_xt_rsc_0_26_qb);
    peaseNTT_INST.xt_rsc_triosy_0_26_lz(TLS_xt_rsc_triosy_0_26_lz);
    peaseNTT_INST.xt_rsc_0_27_adra(TLS_xt_rsc_0_27_adra);
    peaseNTT_INST.xt_rsc_0_27_da(TLS_xt_rsc_0_27_da);
    peaseNTT_INST.xt_rsc_0_27_wea(TLS_xt_rsc_0_27_wea);
    peaseNTT_INST.xt_rsc_0_27_qa(TLS_xt_rsc_0_27_qa);
    peaseNTT_INST.xt_rsc_0_27_adrb(TLS_xt_rsc_0_27_adrb);
    peaseNTT_INST.xt_rsc_0_27_db(TLS_xt_rsc_0_27_db);
    peaseNTT_INST.xt_rsc_0_27_web(TLS_xt_rsc_0_27_web);
    peaseNTT_INST.xt_rsc_0_27_qb(TLS_xt_rsc_0_27_qb);
    peaseNTT_INST.xt_rsc_triosy_0_27_lz(TLS_xt_rsc_triosy_0_27_lz);
    peaseNTT_INST.xt_rsc_0_28_adra(TLS_xt_rsc_0_28_adra);
    peaseNTT_INST.xt_rsc_0_28_da(TLS_xt_rsc_0_28_da);
    peaseNTT_INST.xt_rsc_0_28_wea(TLS_xt_rsc_0_28_wea);
    peaseNTT_INST.xt_rsc_0_28_qa(TLS_xt_rsc_0_28_qa);
    peaseNTT_INST.xt_rsc_0_28_adrb(TLS_xt_rsc_0_28_adrb);
    peaseNTT_INST.xt_rsc_0_28_db(TLS_xt_rsc_0_28_db);
    peaseNTT_INST.xt_rsc_0_28_web(TLS_xt_rsc_0_28_web);
    peaseNTT_INST.xt_rsc_0_28_qb(TLS_xt_rsc_0_28_qb);
    peaseNTT_INST.xt_rsc_triosy_0_28_lz(TLS_xt_rsc_triosy_0_28_lz);
    peaseNTT_INST.xt_rsc_0_29_adra(TLS_xt_rsc_0_29_adra);
    peaseNTT_INST.xt_rsc_0_29_da(TLS_xt_rsc_0_29_da);
    peaseNTT_INST.xt_rsc_0_29_wea(TLS_xt_rsc_0_29_wea);
    peaseNTT_INST.xt_rsc_0_29_qa(TLS_xt_rsc_0_29_qa);
    peaseNTT_INST.xt_rsc_0_29_adrb(TLS_xt_rsc_0_29_adrb);
    peaseNTT_INST.xt_rsc_0_29_db(TLS_xt_rsc_0_29_db);
    peaseNTT_INST.xt_rsc_0_29_web(TLS_xt_rsc_0_29_web);
    peaseNTT_INST.xt_rsc_0_29_qb(TLS_xt_rsc_0_29_qb);
    peaseNTT_INST.xt_rsc_triosy_0_29_lz(TLS_xt_rsc_triosy_0_29_lz);
    peaseNTT_INST.xt_rsc_0_30_adra(TLS_xt_rsc_0_30_adra);
    peaseNTT_INST.xt_rsc_0_30_da(TLS_xt_rsc_0_30_da);
    peaseNTT_INST.xt_rsc_0_30_wea(TLS_xt_rsc_0_30_wea);
    peaseNTT_INST.xt_rsc_0_30_qa(TLS_xt_rsc_0_30_qa);
    peaseNTT_INST.xt_rsc_0_30_adrb(TLS_xt_rsc_0_30_adrb);
    peaseNTT_INST.xt_rsc_0_30_db(TLS_xt_rsc_0_30_db);
    peaseNTT_INST.xt_rsc_0_30_web(TLS_xt_rsc_0_30_web);
    peaseNTT_INST.xt_rsc_0_30_qb(TLS_xt_rsc_0_30_qb);
    peaseNTT_INST.xt_rsc_triosy_0_30_lz(TLS_xt_rsc_triosy_0_30_lz);
    peaseNTT_INST.xt_rsc_0_31_adra(TLS_xt_rsc_0_31_adra);
    peaseNTT_INST.xt_rsc_0_31_da(TLS_xt_rsc_0_31_da);
    peaseNTT_INST.xt_rsc_0_31_wea(TLS_xt_rsc_0_31_wea);
    peaseNTT_INST.xt_rsc_0_31_qa(TLS_xt_rsc_0_31_qa);
    peaseNTT_INST.xt_rsc_0_31_adrb(TLS_xt_rsc_0_31_adrb);
    peaseNTT_INST.xt_rsc_0_31_db(TLS_xt_rsc_0_31_db);
    peaseNTT_INST.xt_rsc_0_31_web(TLS_xt_rsc_0_31_web);
    peaseNTT_INST.xt_rsc_0_31_qb(TLS_xt_rsc_0_31_qb);
    peaseNTT_INST.xt_rsc_triosy_0_31_lz(TLS_xt_rsc_triosy_0_31_lz);
    peaseNTT_INST.p_rsc_dat(TLS_p_rsc_dat);
    peaseNTT_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    peaseNTT_INST.r_rsc_dat(TLS_r_rsc_dat);
    peaseNTT_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);
    peaseNTT_INST.twiddle_rsc_0_0_adra(TLS_twiddle_rsc_0_0_adra);
    peaseNTT_INST.twiddle_rsc_0_0_da(TLS_twiddle_rsc_0_0_da);
    peaseNTT_INST.twiddle_rsc_0_0_wea(TLS_twiddle_rsc_0_0_wea);
    peaseNTT_INST.twiddle_rsc_0_0_qa(TLS_twiddle_rsc_0_0_qa);
    peaseNTT_INST.twiddle_rsc_0_0_adrb(TLS_twiddle_rsc_0_0_adrb);
    peaseNTT_INST.twiddle_rsc_0_0_db(TLS_twiddle_rsc_0_0_db);
    peaseNTT_INST.twiddle_rsc_0_0_web(TLS_twiddle_rsc_0_0_web);
    peaseNTT_INST.twiddle_rsc_0_0_qb(TLS_twiddle_rsc_0_0_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_0_lz(TLS_twiddle_rsc_triosy_0_0_lz);
    peaseNTT_INST.twiddle_rsc_0_1_adra(TLS_twiddle_rsc_0_1_adra);
    peaseNTT_INST.twiddle_rsc_0_1_da(TLS_twiddle_rsc_0_1_da);
    peaseNTT_INST.twiddle_rsc_0_1_wea(TLS_twiddle_rsc_0_1_wea);
    peaseNTT_INST.twiddle_rsc_0_1_qa(TLS_twiddle_rsc_0_1_qa);
    peaseNTT_INST.twiddle_rsc_0_1_adrb(TLS_twiddle_rsc_0_1_adrb);
    peaseNTT_INST.twiddle_rsc_0_1_db(TLS_twiddle_rsc_0_1_db);
    peaseNTT_INST.twiddle_rsc_0_1_web(TLS_twiddle_rsc_0_1_web);
    peaseNTT_INST.twiddle_rsc_0_1_qb(TLS_twiddle_rsc_0_1_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_1_lz(TLS_twiddle_rsc_triosy_0_1_lz);
    peaseNTT_INST.twiddle_rsc_0_2_adra(TLS_twiddle_rsc_0_2_adra);
    peaseNTT_INST.twiddle_rsc_0_2_da(TLS_twiddle_rsc_0_2_da);
    peaseNTT_INST.twiddle_rsc_0_2_wea(TLS_twiddle_rsc_0_2_wea);
    peaseNTT_INST.twiddle_rsc_0_2_qa(TLS_twiddle_rsc_0_2_qa);
    peaseNTT_INST.twiddle_rsc_0_2_adrb(TLS_twiddle_rsc_0_2_adrb);
    peaseNTT_INST.twiddle_rsc_0_2_db(TLS_twiddle_rsc_0_2_db);
    peaseNTT_INST.twiddle_rsc_0_2_web(TLS_twiddle_rsc_0_2_web);
    peaseNTT_INST.twiddle_rsc_0_2_qb(TLS_twiddle_rsc_0_2_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_2_lz(TLS_twiddle_rsc_triosy_0_2_lz);
    peaseNTT_INST.twiddle_rsc_0_3_adra(TLS_twiddle_rsc_0_3_adra);
    peaseNTT_INST.twiddle_rsc_0_3_da(TLS_twiddle_rsc_0_3_da);
    peaseNTT_INST.twiddle_rsc_0_3_wea(TLS_twiddle_rsc_0_3_wea);
    peaseNTT_INST.twiddle_rsc_0_3_qa(TLS_twiddle_rsc_0_3_qa);
    peaseNTT_INST.twiddle_rsc_0_3_adrb(TLS_twiddle_rsc_0_3_adrb);
    peaseNTT_INST.twiddle_rsc_0_3_db(TLS_twiddle_rsc_0_3_db);
    peaseNTT_INST.twiddle_rsc_0_3_web(TLS_twiddle_rsc_0_3_web);
    peaseNTT_INST.twiddle_rsc_0_3_qb(TLS_twiddle_rsc_0_3_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_3_lz(TLS_twiddle_rsc_triosy_0_3_lz);
    peaseNTT_INST.twiddle_rsc_0_4_adra(TLS_twiddle_rsc_0_4_adra);
    peaseNTT_INST.twiddle_rsc_0_4_da(TLS_twiddle_rsc_0_4_da);
    peaseNTT_INST.twiddle_rsc_0_4_wea(TLS_twiddle_rsc_0_4_wea);
    peaseNTT_INST.twiddle_rsc_0_4_qa(TLS_twiddle_rsc_0_4_qa);
    peaseNTT_INST.twiddle_rsc_0_4_adrb(TLS_twiddle_rsc_0_4_adrb);
    peaseNTT_INST.twiddle_rsc_0_4_db(TLS_twiddle_rsc_0_4_db);
    peaseNTT_INST.twiddle_rsc_0_4_web(TLS_twiddle_rsc_0_4_web);
    peaseNTT_INST.twiddle_rsc_0_4_qb(TLS_twiddle_rsc_0_4_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_4_lz(TLS_twiddle_rsc_triosy_0_4_lz);
    peaseNTT_INST.twiddle_rsc_0_5_adra(TLS_twiddle_rsc_0_5_adra);
    peaseNTT_INST.twiddle_rsc_0_5_da(TLS_twiddle_rsc_0_5_da);
    peaseNTT_INST.twiddle_rsc_0_5_wea(TLS_twiddle_rsc_0_5_wea);
    peaseNTT_INST.twiddle_rsc_0_5_qa(TLS_twiddle_rsc_0_5_qa);
    peaseNTT_INST.twiddle_rsc_0_5_adrb(TLS_twiddle_rsc_0_5_adrb);
    peaseNTT_INST.twiddle_rsc_0_5_db(TLS_twiddle_rsc_0_5_db);
    peaseNTT_INST.twiddle_rsc_0_5_web(TLS_twiddle_rsc_0_5_web);
    peaseNTT_INST.twiddle_rsc_0_5_qb(TLS_twiddle_rsc_0_5_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_5_lz(TLS_twiddle_rsc_triosy_0_5_lz);
    peaseNTT_INST.twiddle_rsc_0_6_adra(TLS_twiddle_rsc_0_6_adra);
    peaseNTT_INST.twiddle_rsc_0_6_da(TLS_twiddle_rsc_0_6_da);
    peaseNTT_INST.twiddle_rsc_0_6_wea(TLS_twiddle_rsc_0_6_wea);
    peaseNTT_INST.twiddle_rsc_0_6_qa(TLS_twiddle_rsc_0_6_qa);
    peaseNTT_INST.twiddle_rsc_0_6_adrb(TLS_twiddle_rsc_0_6_adrb);
    peaseNTT_INST.twiddle_rsc_0_6_db(TLS_twiddle_rsc_0_6_db);
    peaseNTT_INST.twiddle_rsc_0_6_web(TLS_twiddle_rsc_0_6_web);
    peaseNTT_INST.twiddle_rsc_0_6_qb(TLS_twiddle_rsc_0_6_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_6_lz(TLS_twiddle_rsc_triosy_0_6_lz);
    peaseNTT_INST.twiddle_rsc_0_7_adra(TLS_twiddle_rsc_0_7_adra);
    peaseNTT_INST.twiddle_rsc_0_7_da(TLS_twiddle_rsc_0_7_da);
    peaseNTT_INST.twiddle_rsc_0_7_wea(TLS_twiddle_rsc_0_7_wea);
    peaseNTT_INST.twiddle_rsc_0_7_qa(TLS_twiddle_rsc_0_7_qa);
    peaseNTT_INST.twiddle_rsc_0_7_adrb(TLS_twiddle_rsc_0_7_adrb);
    peaseNTT_INST.twiddle_rsc_0_7_db(TLS_twiddle_rsc_0_7_db);
    peaseNTT_INST.twiddle_rsc_0_7_web(TLS_twiddle_rsc_0_7_web);
    peaseNTT_INST.twiddle_rsc_0_7_qb(TLS_twiddle_rsc_0_7_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_7_lz(TLS_twiddle_rsc_triosy_0_7_lz);
    peaseNTT_INST.twiddle_rsc_0_8_adra(TLS_twiddle_rsc_0_8_adra);
    peaseNTT_INST.twiddle_rsc_0_8_da(TLS_twiddle_rsc_0_8_da);
    peaseNTT_INST.twiddle_rsc_0_8_wea(TLS_twiddle_rsc_0_8_wea);
    peaseNTT_INST.twiddle_rsc_0_8_qa(TLS_twiddle_rsc_0_8_qa);
    peaseNTT_INST.twiddle_rsc_0_8_adrb(TLS_twiddle_rsc_0_8_adrb);
    peaseNTT_INST.twiddle_rsc_0_8_db(TLS_twiddle_rsc_0_8_db);
    peaseNTT_INST.twiddle_rsc_0_8_web(TLS_twiddle_rsc_0_8_web);
    peaseNTT_INST.twiddle_rsc_0_8_qb(TLS_twiddle_rsc_0_8_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_8_lz(TLS_twiddle_rsc_triosy_0_8_lz);
    peaseNTT_INST.twiddle_rsc_0_9_adra(TLS_twiddle_rsc_0_9_adra);
    peaseNTT_INST.twiddle_rsc_0_9_da(TLS_twiddle_rsc_0_9_da);
    peaseNTT_INST.twiddle_rsc_0_9_wea(TLS_twiddle_rsc_0_9_wea);
    peaseNTT_INST.twiddle_rsc_0_9_qa(TLS_twiddle_rsc_0_9_qa);
    peaseNTT_INST.twiddle_rsc_0_9_adrb(TLS_twiddle_rsc_0_9_adrb);
    peaseNTT_INST.twiddle_rsc_0_9_db(TLS_twiddle_rsc_0_9_db);
    peaseNTT_INST.twiddle_rsc_0_9_web(TLS_twiddle_rsc_0_9_web);
    peaseNTT_INST.twiddle_rsc_0_9_qb(TLS_twiddle_rsc_0_9_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_9_lz(TLS_twiddle_rsc_triosy_0_9_lz);
    peaseNTT_INST.twiddle_rsc_0_10_adra(TLS_twiddle_rsc_0_10_adra);
    peaseNTT_INST.twiddle_rsc_0_10_da(TLS_twiddle_rsc_0_10_da);
    peaseNTT_INST.twiddle_rsc_0_10_wea(TLS_twiddle_rsc_0_10_wea);
    peaseNTT_INST.twiddle_rsc_0_10_qa(TLS_twiddle_rsc_0_10_qa);
    peaseNTT_INST.twiddle_rsc_0_10_adrb(TLS_twiddle_rsc_0_10_adrb);
    peaseNTT_INST.twiddle_rsc_0_10_db(TLS_twiddle_rsc_0_10_db);
    peaseNTT_INST.twiddle_rsc_0_10_web(TLS_twiddle_rsc_0_10_web);
    peaseNTT_INST.twiddle_rsc_0_10_qb(TLS_twiddle_rsc_0_10_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_10_lz(TLS_twiddle_rsc_triosy_0_10_lz);
    peaseNTT_INST.twiddle_rsc_0_11_adra(TLS_twiddle_rsc_0_11_adra);
    peaseNTT_INST.twiddle_rsc_0_11_da(TLS_twiddle_rsc_0_11_da);
    peaseNTT_INST.twiddle_rsc_0_11_wea(TLS_twiddle_rsc_0_11_wea);
    peaseNTT_INST.twiddle_rsc_0_11_qa(TLS_twiddle_rsc_0_11_qa);
    peaseNTT_INST.twiddle_rsc_0_11_adrb(TLS_twiddle_rsc_0_11_adrb);
    peaseNTT_INST.twiddle_rsc_0_11_db(TLS_twiddle_rsc_0_11_db);
    peaseNTT_INST.twiddle_rsc_0_11_web(TLS_twiddle_rsc_0_11_web);
    peaseNTT_INST.twiddle_rsc_0_11_qb(TLS_twiddle_rsc_0_11_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_11_lz(TLS_twiddle_rsc_triosy_0_11_lz);
    peaseNTT_INST.twiddle_rsc_0_12_adra(TLS_twiddle_rsc_0_12_adra);
    peaseNTT_INST.twiddle_rsc_0_12_da(TLS_twiddle_rsc_0_12_da);
    peaseNTT_INST.twiddle_rsc_0_12_wea(TLS_twiddle_rsc_0_12_wea);
    peaseNTT_INST.twiddle_rsc_0_12_qa(TLS_twiddle_rsc_0_12_qa);
    peaseNTT_INST.twiddle_rsc_0_12_adrb(TLS_twiddle_rsc_0_12_adrb);
    peaseNTT_INST.twiddle_rsc_0_12_db(TLS_twiddle_rsc_0_12_db);
    peaseNTT_INST.twiddle_rsc_0_12_web(TLS_twiddle_rsc_0_12_web);
    peaseNTT_INST.twiddle_rsc_0_12_qb(TLS_twiddle_rsc_0_12_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_12_lz(TLS_twiddle_rsc_triosy_0_12_lz);
    peaseNTT_INST.twiddle_rsc_0_13_adra(TLS_twiddle_rsc_0_13_adra);
    peaseNTT_INST.twiddle_rsc_0_13_da(TLS_twiddle_rsc_0_13_da);
    peaseNTT_INST.twiddle_rsc_0_13_wea(TLS_twiddle_rsc_0_13_wea);
    peaseNTT_INST.twiddle_rsc_0_13_qa(TLS_twiddle_rsc_0_13_qa);
    peaseNTT_INST.twiddle_rsc_0_13_adrb(TLS_twiddle_rsc_0_13_adrb);
    peaseNTT_INST.twiddle_rsc_0_13_db(TLS_twiddle_rsc_0_13_db);
    peaseNTT_INST.twiddle_rsc_0_13_web(TLS_twiddle_rsc_0_13_web);
    peaseNTT_INST.twiddle_rsc_0_13_qb(TLS_twiddle_rsc_0_13_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_13_lz(TLS_twiddle_rsc_triosy_0_13_lz);
    peaseNTT_INST.twiddle_rsc_0_14_adra(TLS_twiddle_rsc_0_14_adra);
    peaseNTT_INST.twiddle_rsc_0_14_da(TLS_twiddle_rsc_0_14_da);
    peaseNTT_INST.twiddle_rsc_0_14_wea(TLS_twiddle_rsc_0_14_wea);
    peaseNTT_INST.twiddle_rsc_0_14_qa(TLS_twiddle_rsc_0_14_qa);
    peaseNTT_INST.twiddle_rsc_0_14_adrb(TLS_twiddle_rsc_0_14_adrb);
    peaseNTT_INST.twiddle_rsc_0_14_db(TLS_twiddle_rsc_0_14_db);
    peaseNTT_INST.twiddle_rsc_0_14_web(TLS_twiddle_rsc_0_14_web);
    peaseNTT_INST.twiddle_rsc_0_14_qb(TLS_twiddle_rsc_0_14_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_14_lz(TLS_twiddle_rsc_triosy_0_14_lz);
    peaseNTT_INST.twiddle_rsc_0_15_adra(TLS_twiddle_rsc_0_15_adra);
    peaseNTT_INST.twiddle_rsc_0_15_da(TLS_twiddle_rsc_0_15_da);
    peaseNTT_INST.twiddle_rsc_0_15_wea(TLS_twiddle_rsc_0_15_wea);
    peaseNTT_INST.twiddle_rsc_0_15_qa(TLS_twiddle_rsc_0_15_qa);
    peaseNTT_INST.twiddle_rsc_0_15_adrb(TLS_twiddle_rsc_0_15_adrb);
    peaseNTT_INST.twiddle_rsc_0_15_db(TLS_twiddle_rsc_0_15_db);
    peaseNTT_INST.twiddle_rsc_0_15_web(TLS_twiddle_rsc_0_15_web);
    peaseNTT_INST.twiddle_rsc_0_15_qb(TLS_twiddle_rsc_0_15_qb);
    peaseNTT_INST.twiddle_rsc_triosy_0_15_lz(TLS_twiddle_rsc_triosy_0_15_lz);
    peaseNTT_INST.twiddle_h_rsc_0_0_adra(TLS_twiddle_h_rsc_0_0_adra);
    peaseNTT_INST.twiddle_h_rsc_0_0_da(TLS_twiddle_h_rsc_0_0_da);
    peaseNTT_INST.twiddle_h_rsc_0_0_wea(TLS_twiddle_h_rsc_0_0_wea);
    peaseNTT_INST.twiddle_h_rsc_0_0_qa(TLS_twiddle_h_rsc_0_0_qa);
    peaseNTT_INST.twiddle_h_rsc_0_0_adrb(TLS_twiddle_h_rsc_0_0_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_0_db(TLS_twiddle_h_rsc_0_0_db);
    peaseNTT_INST.twiddle_h_rsc_0_0_web(TLS_twiddle_h_rsc_0_0_web);
    peaseNTT_INST.twiddle_h_rsc_0_0_qb(TLS_twiddle_h_rsc_0_0_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_0_lz(TLS_twiddle_h_rsc_triosy_0_0_lz);
    peaseNTT_INST.twiddle_h_rsc_0_1_adra(TLS_twiddle_h_rsc_0_1_adra);
    peaseNTT_INST.twiddle_h_rsc_0_1_da(TLS_twiddle_h_rsc_0_1_da);
    peaseNTT_INST.twiddle_h_rsc_0_1_wea(TLS_twiddle_h_rsc_0_1_wea);
    peaseNTT_INST.twiddle_h_rsc_0_1_qa(TLS_twiddle_h_rsc_0_1_qa);
    peaseNTT_INST.twiddle_h_rsc_0_1_adrb(TLS_twiddle_h_rsc_0_1_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_1_db(TLS_twiddle_h_rsc_0_1_db);
    peaseNTT_INST.twiddle_h_rsc_0_1_web(TLS_twiddle_h_rsc_0_1_web);
    peaseNTT_INST.twiddle_h_rsc_0_1_qb(TLS_twiddle_h_rsc_0_1_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_1_lz(TLS_twiddle_h_rsc_triosy_0_1_lz);
    peaseNTT_INST.twiddle_h_rsc_0_2_adra(TLS_twiddle_h_rsc_0_2_adra);
    peaseNTT_INST.twiddle_h_rsc_0_2_da(TLS_twiddle_h_rsc_0_2_da);
    peaseNTT_INST.twiddle_h_rsc_0_2_wea(TLS_twiddle_h_rsc_0_2_wea);
    peaseNTT_INST.twiddle_h_rsc_0_2_qa(TLS_twiddle_h_rsc_0_2_qa);
    peaseNTT_INST.twiddle_h_rsc_0_2_adrb(TLS_twiddle_h_rsc_0_2_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_2_db(TLS_twiddle_h_rsc_0_2_db);
    peaseNTT_INST.twiddle_h_rsc_0_2_web(TLS_twiddle_h_rsc_0_2_web);
    peaseNTT_INST.twiddle_h_rsc_0_2_qb(TLS_twiddle_h_rsc_0_2_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_2_lz(TLS_twiddle_h_rsc_triosy_0_2_lz);
    peaseNTT_INST.twiddle_h_rsc_0_3_adra(TLS_twiddle_h_rsc_0_3_adra);
    peaseNTT_INST.twiddle_h_rsc_0_3_da(TLS_twiddle_h_rsc_0_3_da);
    peaseNTT_INST.twiddle_h_rsc_0_3_wea(TLS_twiddle_h_rsc_0_3_wea);
    peaseNTT_INST.twiddle_h_rsc_0_3_qa(TLS_twiddle_h_rsc_0_3_qa);
    peaseNTT_INST.twiddle_h_rsc_0_3_adrb(TLS_twiddle_h_rsc_0_3_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_3_db(TLS_twiddle_h_rsc_0_3_db);
    peaseNTT_INST.twiddle_h_rsc_0_3_web(TLS_twiddle_h_rsc_0_3_web);
    peaseNTT_INST.twiddle_h_rsc_0_3_qb(TLS_twiddle_h_rsc_0_3_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_3_lz(TLS_twiddle_h_rsc_triosy_0_3_lz);
    peaseNTT_INST.twiddle_h_rsc_0_4_adra(TLS_twiddle_h_rsc_0_4_adra);
    peaseNTT_INST.twiddle_h_rsc_0_4_da(TLS_twiddle_h_rsc_0_4_da);
    peaseNTT_INST.twiddle_h_rsc_0_4_wea(TLS_twiddle_h_rsc_0_4_wea);
    peaseNTT_INST.twiddle_h_rsc_0_4_qa(TLS_twiddle_h_rsc_0_4_qa);
    peaseNTT_INST.twiddle_h_rsc_0_4_adrb(TLS_twiddle_h_rsc_0_4_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_4_db(TLS_twiddle_h_rsc_0_4_db);
    peaseNTT_INST.twiddle_h_rsc_0_4_web(TLS_twiddle_h_rsc_0_4_web);
    peaseNTT_INST.twiddle_h_rsc_0_4_qb(TLS_twiddle_h_rsc_0_4_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_4_lz(TLS_twiddle_h_rsc_triosy_0_4_lz);
    peaseNTT_INST.twiddle_h_rsc_0_5_adra(TLS_twiddle_h_rsc_0_5_adra);
    peaseNTT_INST.twiddle_h_rsc_0_5_da(TLS_twiddle_h_rsc_0_5_da);
    peaseNTT_INST.twiddle_h_rsc_0_5_wea(TLS_twiddle_h_rsc_0_5_wea);
    peaseNTT_INST.twiddle_h_rsc_0_5_qa(TLS_twiddle_h_rsc_0_5_qa);
    peaseNTT_INST.twiddle_h_rsc_0_5_adrb(TLS_twiddle_h_rsc_0_5_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_5_db(TLS_twiddle_h_rsc_0_5_db);
    peaseNTT_INST.twiddle_h_rsc_0_5_web(TLS_twiddle_h_rsc_0_5_web);
    peaseNTT_INST.twiddle_h_rsc_0_5_qb(TLS_twiddle_h_rsc_0_5_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_5_lz(TLS_twiddle_h_rsc_triosy_0_5_lz);
    peaseNTT_INST.twiddle_h_rsc_0_6_adra(TLS_twiddle_h_rsc_0_6_adra);
    peaseNTT_INST.twiddle_h_rsc_0_6_da(TLS_twiddle_h_rsc_0_6_da);
    peaseNTT_INST.twiddle_h_rsc_0_6_wea(TLS_twiddle_h_rsc_0_6_wea);
    peaseNTT_INST.twiddle_h_rsc_0_6_qa(TLS_twiddle_h_rsc_0_6_qa);
    peaseNTT_INST.twiddle_h_rsc_0_6_adrb(TLS_twiddle_h_rsc_0_6_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_6_db(TLS_twiddle_h_rsc_0_6_db);
    peaseNTT_INST.twiddle_h_rsc_0_6_web(TLS_twiddle_h_rsc_0_6_web);
    peaseNTT_INST.twiddle_h_rsc_0_6_qb(TLS_twiddle_h_rsc_0_6_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_6_lz(TLS_twiddle_h_rsc_triosy_0_6_lz);
    peaseNTT_INST.twiddle_h_rsc_0_7_adra(TLS_twiddle_h_rsc_0_7_adra);
    peaseNTT_INST.twiddle_h_rsc_0_7_da(TLS_twiddle_h_rsc_0_7_da);
    peaseNTT_INST.twiddle_h_rsc_0_7_wea(TLS_twiddle_h_rsc_0_7_wea);
    peaseNTT_INST.twiddle_h_rsc_0_7_qa(TLS_twiddle_h_rsc_0_7_qa);
    peaseNTT_INST.twiddle_h_rsc_0_7_adrb(TLS_twiddle_h_rsc_0_7_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_7_db(TLS_twiddle_h_rsc_0_7_db);
    peaseNTT_INST.twiddle_h_rsc_0_7_web(TLS_twiddle_h_rsc_0_7_web);
    peaseNTT_INST.twiddle_h_rsc_0_7_qb(TLS_twiddle_h_rsc_0_7_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_7_lz(TLS_twiddle_h_rsc_triosy_0_7_lz);
    peaseNTT_INST.twiddle_h_rsc_0_8_adra(TLS_twiddle_h_rsc_0_8_adra);
    peaseNTT_INST.twiddle_h_rsc_0_8_da(TLS_twiddle_h_rsc_0_8_da);
    peaseNTT_INST.twiddle_h_rsc_0_8_wea(TLS_twiddle_h_rsc_0_8_wea);
    peaseNTT_INST.twiddle_h_rsc_0_8_qa(TLS_twiddle_h_rsc_0_8_qa);
    peaseNTT_INST.twiddle_h_rsc_0_8_adrb(TLS_twiddle_h_rsc_0_8_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_8_db(TLS_twiddle_h_rsc_0_8_db);
    peaseNTT_INST.twiddle_h_rsc_0_8_web(TLS_twiddle_h_rsc_0_8_web);
    peaseNTT_INST.twiddle_h_rsc_0_8_qb(TLS_twiddle_h_rsc_0_8_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_8_lz(TLS_twiddle_h_rsc_triosy_0_8_lz);
    peaseNTT_INST.twiddle_h_rsc_0_9_adra(TLS_twiddle_h_rsc_0_9_adra);
    peaseNTT_INST.twiddle_h_rsc_0_9_da(TLS_twiddle_h_rsc_0_9_da);
    peaseNTT_INST.twiddle_h_rsc_0_9_wea(TLS_twiddle_h_rsc_0_9_wea);
    peaseNTT_INST.twiddle_h_rsc_0_9_qa(TLS_twiddle_h_rsc_0_9_qa);
    peaseNTT_INST.twiddle_h_rsc_0_9_adrb(TLS_twiddle_h_rsc_0_9_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_9_db(TLS_twiddle_h_rsc_0_9_db);
    peaseNTT_INST.twiddle_h_rsc_0_9_web(TLS_twiddle_h_rsc_0_9_web);
    peaseNTT_INST.twiddle_h_rsc_0_9_qb(TLS_twiddle_h_rsc_0_9_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_9_lz(TLS_twiddle_h_rsc_triosy_0_9_lz);
    peaseNTT_INST.twiddle_h_rsc_0_10_adra(TLS_twiddle_h_rsc_0_10_adra);
    peaseNTT_INST.twiddle_h_rsc_0_10_da(TLS_twiddle_h_rsc_0_10_da);
    peaseNTT_INST.twiddle_h_rsc_0_10_wea(TLS_twiddle_h_rsc_0_10_wea);
    peaseNTT_INST.twiddle_h_rsc_0_10_qa(TLS_twiddle_h_rsc_0_10_qa);
    peaseNTT_INST.twiddle_h_rsc_0_10_adrb(TLS_twiddle_h_rsc_0_10_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_10_db(TLS_twiddle_h_rsc_0_10_db);
    peaseNTT_INST.twiddle_h_rsc_0_10_web(TLS_twiddle_h_rsc_0_10_web);
    peaseNTT_INST.twiddle_h_rsc_0_10_qb(TLS_twiddle_h_rsc_0_10_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_10_lz(TLS_twiddle_h_rsc_triosy_0_10_lz);
    peaseNTT_INST.twiddle_h_rsc_0_11_adra(TLS_twiddle_h_rsc_0_11_adra);
    peaseNTT_INST.twiddle_h_rsc_0_11_da(TLS_twiddle_h_rsc_0_11_da);
    peaseNTT_INST.twiddle_h_rsc_0_11_wea(TLS_twiddle_h_rsc_0_11_wea);
    peaseNTT_INST.twiddle_h_rsc_0_11_qa(TLS_twiddle_h_rsc_0_11_qa);
    peaseNTT_INST.twiddle_h_rsc_0_11_adrb(TLS_twiddle_h_rsc_0_11_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_11_db(TLS_twiddle_h_rsc_0_11_db);
    peaseNTT_INST.twiddle_h_rsc_0_11_web(TLS_twiddle_h_rsc_0_11_web);
    peaseNTT_INST.twiddle_h_rsc_0_11_qb(TLS_twiddle_h_rsc_0_11_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_11_lz(TLS_twiddle_h_rsc_triosy_0_11_lz);
    peaseNTT_INST.twiddle_h_rsc_0_12_adra(TLS_twiddle_h_rsc_0_12_adra);
    peaseNTT_INST.twiddle_h_rsc_0_12_da(TLS_twiddle_h_rsc_0_12_da);
    peaseNTT_INST.twiddle_h_rsc_0_12_wea(TLS_twiddle_h_rsc_0_12_wea);
    peaseNTT_INST.twiddle_h_rsc_0_12_qa(TLS_twiddle_h_rsc_0_12_qa);
    peaseNTT_INST.twiddle_h_rsc_0_12_adrb(TLS_twiddle_h_rsc_0_12_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_12_db(TLS_twiddle_h_rsc_0_12_db);
    peaseNTT_INST.twiddle_h_rsc_0_12_web(TLS_twiddle_h_rsc_0_12_web);
    peaseNTT_INST.twiddle_h_rsc_0_12_qb(TLS_twiddle_h_rsc_0_12_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_12_lz(TLS_twiddle_h_rsc_triosy_0_12_lz);
    peaseNTT_INST.twiddle_h_rsc_0_13_adra(TLS_twiddle_h_rsc_0_13_adra);
    peaseNTT_INST.twiddle_h_rsc_0_13_da(TLS_twiddle_h_rsc_0_13_da);
    peaseNTT_INST.twiddle_h_rsc_0_13_wea(TLS_twiddle_h_rsc_0_13_wea);
    peaseNTT_INST.twiddle_h_rsc_0_13_qa(TLS_twiddle_h_rsc_0_13_qa);
    peaseNTT_INST.twiddle_h_rsc_0_13_adrb(TLS_twiddle_h_rsc_0_13_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_13_db(TLS_twiddle_h_rsc_0_13_db);
    peaseNTT_INST.twiddle_h_rsc_0_13_web(TLS_twiddle_h_rsc_0_13_web);
    peaseNTT_INST.twiddle_h_rsc_0_13_qb(TLS_twiddle_h_rsc_0_13_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_13_lz(TLS_twiddle_h_rsc_triosy_0_13_lz);
    peaseNTT_INST.twiddle_h_rsc_0_14_adra(TLS_twiddle_h_rsc_0_14_adra);
    peaseNTT_INST.twiddle_h_rsc_0_14_da(TLS_twiddle_h_rsc_0_14_da);
    peaseNTT_INST.twiddle_h_rsc_0_14_wea(TLS_twiddle_h_rsc_0_14_wea);
    peaseNTT_INST.twiddle_h_rsc_0_14_qa(TLS_twiddle_h_rsc_0_14_qa);
    peaseNTT_INST.twiddle_h_rsc_0_14_adrb(TLS_twiddle_h_rsc_0_14_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_14_db(TLS_twiddle_h_rsc_0_14_db);
    peaseNTT_INST.twiddle_h_rsc_0_14_web(TLS_twiddle_h_rsc_0_14_web);
    peaseNTT_INST.twiddle_h_rsc_0_14_qb(TLS_twiddle_h_rsc_0_14_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_14_lz(TLS_twiddle_h_rsc_triosy_0_14_lz);
    peaseNTT_INST.twiddle_h_rsc_0_15_adra(TLS_twiddle_h_rsc_0_15_adra);
    peaseNTT_INST.twiddle_h_rsc_0_15_da(TLS_twiddle_h_rsc_0_15_da);
    peaseNTT_INST.twiddle_h_rsc_0_15_wea(TLS_twiddle_h_rsc_0_15_wea);
    peaseNTT_INST.twiddle_h_rsc_0_15_qa(TLS_twiddle_h_rsc_0_15_qa);
    peaseNTT_INST.twiddle_h_rsc_0_15_adrb(TLS_twiddle_h_rsc_0_15_adrb);
    peaseNTT_INST.twiddle_h_rsc_0_15_db(TLS_twiddle_h_rsc_0_15_db);
    peaseNTT_INST.twiddle_h_rsc_0_15_web(TLS_twiddle_h_rsc_0_15_web);
    peaseNTT_INST.twiddle_h_rsc_0_15_qb(TLS_twiddle_h_rsc_0_15_qb);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_15_lz(TLS_twiddle_h_rsc_triosy_0_15_lz);

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
    xt_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_39)));

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
    xt_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_40)));

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
    xt_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_41)));

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
    xt_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_42)));

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
    xt_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_43)));

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
    xt_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_44)));

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
    xt_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_45)));

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
    xt_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_46)));

    xt_rsc_0__8__INST.qb(TLS_xt_rsc_0_8_qb);
    xt_rsc_0__8__INST.web(TLS_xt_rsc_0_8_web);
    xt_rsc_0__8__INST.db(TLS_xt_rsc_0_8_db);
    xt_rsc_0__8__INST.adrb(TLS_xt_rsc_0_8_adrb);
    xt_rsc_0__8__INST.qa(TLS_xt_rsc_0_8_qa);
    xt_rsc_0__8__INST.wea(TLS_xt_rsc_0_8_wea);
    xt_rsc_0__8__INST.da(TLS_xt_rsc_0_8_da);
    xt_rsc_0__8__INST.adra(TLS_xt_rsc_0_8_adra);
    xt_rsc_0__8__INST.clka(clk);
    xt_rsc_0__8__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__8__INST.clkb(clk);
    xt_rsc_0__8__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_47)));

    xt_rsc_0__9__INST.qb(TLS_xt_rsc_0_9_qb);
    xt_rsc_0__9__INST.web(TLS_xt_rsc_0_9_web);
    xt_rsc_0__9__INST.db(TLS_xt_rsc_0_9_db);
    xt_rsc_0__9__INST.adrb(TLS_xt_rsc_0_9_adrb);
    xt_rsc_0__9__INST.qa(TLS_xt_rsc_0_9_qa);
    xt_rsc_0__9__INST.wea(TLS_xt_rsc_0_9_wea);
    xt_rsc_0__9__INST.da(TLS_xt_rsc_0_9_da);
    xt_rsc_0__9__INST.adra(TLS_xt_rsc_0_9_adra);
    xt_rsc_0__9__INST.clka(clk);
    xt_rsc_0__9__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__9__INST.clkb(clk);
    xt_rsc_0__9__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_48)));

    xt_rsc_0__10__INST.qb(TLS_xt_rsc_0_10_qb);
    xt_rsc_0__10__INST.web(TLS_xt_rsc_0_10_web);
    xt_rsc_0__10__INST.db(TLS_xt_rsc_0_10_db);
    xt_rsc_0__10__INST.adrb(TLS_xt_rsc_0_10_adrb);
    xt_rsc_0__10__INST.qa(TLS_xt_rsc_0_10_qa);
    xt_rsc_0__10__INST.wea(TLS_xt_rsc_0_10_wea);
    xt_rsc_0__10__INST.da(TLS_xt_rsc_0_10_da);
    xt_rsc_0__10__INST.adra(TLS_xt_rsc_0_10_adra);
    xt_rsc_0__10__INST.clka(clk);
    xt_rsc_0__10__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__10__INST.clkb(clk);
    xt_rsc_0__10__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_49)));

    xt_rsc_0__11__INST.qb(TLS_xt_rsc_0_11_qb);
    xt_rsc_0__11__INST.web(TLS_xt_rsc_0_11_web);
    xt_rsc_0__11__INST.db(TLS_xt_rsc_0_11_db);
    xt_rsc_0__11__INST.adrb(TLS_xt_rsc_0_11_adrb);
    xt_rsc_0__11__INST.qa(TLS_xt_rsc_0_11_qa);
    xt_rsc_0__11__INST.wea(TLS_xt_rsc_0_11_wea);
    xt_rsc_0__11__INST.da(TLS_xt_rsc_0_11_da);
    xt_rsc_0__11__INST.adra(TLS_xt_rsc_0_11_adra);
    xt_rsc_0__11__INST.clka(clk);
    xt_rsc_0__11__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__11__INST.clkb(clk);
    xt_rsc_0__11__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_50)));

    xt_rsc_0__12__INST.qb(TLS_xt_rsc_0_12_qb);
    xt_rsc_0__12__INST.web(TLS_xt_rsc_0_12_web);
    xt_rsc_0__12__INST.db(TLS_xt_rsc_0_12_db);
    xt_rsc_0__12__INST.adrb(TLS_xt_rsc_0_12_adrb);
    xt_rsc_0__12__INST.qa(TLS_xt_rsc_0_12_qa);
    xt_rsc_0__12__INST.wea(TLS_xt_rsc_0_12_wea);
    xt_rsc_0__12__INST.da(TLS_xt_rsc_0_12_da);
    xt_rsc_0__12__INST.adra(TLS_xt_rsc_0_12_adra);
    xt_rsc_0__12__INST.clka(clk);
    xt_rsc_0__12__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__12__INST.clkb(clk);
    xt_rsc_0__12__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_51)));

    xt_rsc_0__13__INST.qb(TLS_xt_rsc_0_13_qb);
    xt_rsc_0__13__INST.web(TLS_xt_rsc_0_13_web);
    xt_rsc_0__13__INST.db(TLS_xt_rsc_0_13_db);
    xt_rsc_0__13__INST.adrb(TLS_xt_rsc_0_13_adrb);
    xt_rsc_0__13__INST.qa(TLS_xt_rsc_0_13_qa);
    xt_rsc_0__13__INST.wea(TLS_xt_rsc_0_13_wea);
    xt_rsc_0__13__INST.da(TLS_xt_rsc_0_13_da);
    xt_rsc_0__13__INST.adra(TLS_xt_rsc_0_13_adra);
    xt_rsc_0__13__INST.clka(clk);
    xt_rsc_0__13__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__13__INST.clkb(clk);
    xt_rsc_0__13__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_52)));

    xt_rsc_0__14__INST.qb(TLS_xt_rsc_0_14_qb);
    xt_rsc_0__14__INST.web(TLS_xt_rsc_0_14_web);
    xt_rsc_0__14__INST.db(TLS_xt_rsc_0_14_db);
    xt_rsc_0__14__INST.adrb(TLS_xt_rsc_0_14_adrb);
    xt_rsc_0__14__INST.qa(TLS_xt_rsc_0_14_qa);
    xt_rsc_0__14__INST.wea(TLS_xt_rsc_0_14_wea);
    xt_rsc_0__14__INST.da(TLS_xt_rsc_0_14_da);
    xt_rsc_0__14__INST.adra(TLS_xt_rsc_0_14_adra);
    xt_rsc_0__14__INST.clka(clk);
    xt_rsc_0__14__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__14__INST.clkb(clk);
    xt_rsc_0__14__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_53)));

    xt_rsc_0__15__INST.qb(TLS_xt_rsc_0_15_qb);
    xt_rsc_0__15__INST.web(TLS_xt_rsc_0_15_web);
    xt_rsc_0__15__INST.db(TLS_xt_rsc_0_15_db);
    xt_rsc_0__15__INST.adrb(TLS_xt_rsc_0_15_adrb);
    xt_rsc_0__15__INST.qa(TLS_xt_rsc_0_15_qa);
    xt_rsc_0__15__INST.wea(TLS_xt_rsc_0_15_wea);
    xt_rsc_0__15__INST.da(TLS_xt_rsc_0_15_da);
    xt_rsc_0__15__INST.adra(TLS_xt_rsc_0_15_adra);
    xt_rsc_0__15__INST.clka(clk);
    xt_rsc_0__15__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__15__INST.clkb(clk);
    xt_rsc_0__15__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_54)));

    xt_rsc_0__16__INST.qb(TLS_xt_rsc_0_16_qb);
    xt_rsc_0__16__INST.web(TLS_xt_rsc_0_16_web);
    xt_rsc_0__16__INST.db(TLS_xt_rsc_0_16_db);
    xt_rsc_0__16__INST.adrb(TLS_xt_rsc_0_16_adrb);
    xt_rsc_0__16__INST.qa(TLS_xt_rsc_0_16_qa);
    xt_rsc_0__16__INST.wea(TLS_xt_rsc_0_16_wea);
    xt_rsc_0__16__INST.da(TLS_xt_rsc_0_16_da);
    xt_rsc_0__16__INST.adra(TLS_xt_rsc_0_16_adra);
    xt_rsc_0__16__INST.clka(clk);
    xt_rsc_0__16__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__16__INST.clkb(clk);
    xt_rsc_0__16__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__16__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_55)));

    xt_rsc_0__17__INST.qb(TLS_xt_rsc_0_17_qb);
    xt_rsc_0__17__INST.web(TLS_xt_rsc_0_17_web);
    xt_rsc_0__17__INST.db(TLS_xt_rsc_0_17_db);
    xt_rsc_0__17__INST.adrb(TLS_xt_rsc_0_17_adrb);
    xt_rsc_0__17__INST.qa(TLS_xt_rsc_0_17_qa);
    xt_rsc_0__17__INST.wea(TLS_xt_rsc_0_17_wea);
    xt_rsc_0__17__INST.da(TLS_xt_rsc_0_17_da);
    xt_rsc_0__17__INST.adra(TLS_xt_rsc_0_17_adra);
    xt_rsc_0__17__INST.clka(clk);
    xt_rsc_0__17__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__17__INST.clkb(clk);
    xt_rsc_0__17__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__17__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_56)));

    xt_rsc_0__18__INST.qb(TLS_xt_rsc_0_18_qb);
    xt_rsc_0__18__INST.web(TLS_xt_rsc_0_18_web);
    xt_rsc_0__18__INST.db(TLS_xt_rsc_0_18_db);
    xt_rsc_0__18__INST.adrb(TLS_xt_rsc_0_18_adrb);
    xt_rsc_0__18__INST.qa(TLS_xt_rsc_0_18_qa);
    xt_rsc_0__18__INST.wea(TLS_xt_rsc_0_18_wea);
    xt_rsc_0__18__INST.da(TLS_xt_rsc_0_18_da);
    xt_rsc_0__18__INST.adra(TLS_xt_rsc_0_18_adra);
    xt_rsc_0__18__INST.clka(clk);
    xt_rsc_0__18__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__18__INST.clkb(clk);
    xt_rsc_0__18__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__18__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_57)));

    xt_rsc_0__19__INST.qb(TLS_xt_rsc_0_19_qb);
    xt_rsc_0__19__INST.web(TLS_xt_rsc_0_19_web);
    xt_rsc_0__19__INST.db(TLS_xt_rsc_0_19_db);
    xt_rsc_0__19__INST.adrb(TLS_xt_rsc_0_19_adrb);
    xt_rsc_0__19__INST.qa(TLS_xt_rsc_0_19_qa);
    xt_rsc_0__19__INST.wea(TLS_xt_rsc_0_19_wea);
    xt_rsc_0__19__INST.da(TLS_xt_rsc_0_19_da);
    xt_rsc_0__19__INST.adra(TLS_xt_rsc_0_19_adra);
    xt_rsc_0__19__INST.clka(clk);
    xt_rsc_0__19__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__19__INST.clkb(clk);
    xt_rsc_0__19__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__19__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_58)));

    xt_rsc_0__20__INST.qb(TLS_xt_rsc_0_20_qb);
    xt_rsc_0__20__INST.web(TLS_xt_rsc_0_20_web);
    xt_rsc_0__20__INST.db(TLS_xt_rsc_0_20_db);
    xt_rsc_0__20__INST.adrb(TLS_xt_rsc_0_20_adrb);
    xt_rsc_0__20__INST.qa(TLS_xt_rsc_0_20_qa);
    xt_rsc_0__20__INST.wea(TLS_xt_rsc_0_20_wea);
    xt_rsc_0__20__INST.da(TLS_xt_rsc_0_20_da);
    xt_rsc_0__20__INST.adra(TLS_xt_rsc_0_20_adra);
    xt_rsc_0__20__INST.clka(clk);
    xt_rsc_0__20__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__20__INST.clkb(clk);
    xt_rsc_0__20__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__20__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_59)));

    xt_rsc_0__21__INST.qb(TLS_xt_rsc_0_21_qb);
    xt_rsc_0__21__INST.web(TLS_xt_rsc_0_21_web);
    xt_rsc_0__21__INST.db(TLS_xt_rsc_0_21_db);
    xt_rsc_0__21__INST.adrb(TLS_xt_rsc_0_21_adrb);
    xt_rsc_0__21__INST.qa(TLS_xt_rsc_0_21_qa);
    xt_rsc_0__21__INST.wea(TLS_xt_rsc_0_21_wea);
    xt_rsc_0__21__INST.da(TLS_xt_rsc_0_21_da);
    xt_rsc_0__21__INST.adra(TLS_xt_rsc_0_21_adra);
    xt_rsc_0__21__INST.clka(clk);
    xt_rsc_0__21__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__21__INST.clkb(clk);
    xt_rsc_0__21__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__21__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_60)));

    xt_rsc_0__22__INST.qb(TLS_xt_rsc_0_22_qb);
    xt_rsc_0__22__INST.web(TLS_xt_rsc_0_22_web);
    xt_rsc_0__22__INST.db(TLS_xt_rsc_0_22_db);
    xt_rsc_0__22__INST.adrb(TLS_xt_rsc_0_22_adrb);
    xt_rsc_0__22__INST.qa(TLS_xt_rsc_0_22_qa);
    xt_rsc_0__22__INST.wea(TLS_xt_rsc_0_22_wea);
    xt_rsc_0__22__INST.da(TLS_xt_rsc_0_22_da);
    xt_rsc_0__22__INST.adra(TLS_xt_rsc_0_22_adra);
    xt_rsc_0__22__INST.clka(clk);
    xt_rsc_0__22__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__22__INST.clkb(clk);
    xt_rsc_0__22__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__22__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_61)));

    xt_rsc_0__23__INST.qb(TLS_xt_rsc_0_23_qb);
    xt_rsc_0__23__INST.web(TLS_xt_rsc_0_23_web);
    xt_rsc_0__23__INST.db(TLS_xt_rsc_0_23_db);
    xt_rsc_0__23__INST.adrb(TLS_xt_rsc_0_23_adrb);
    xt_rsc_0__23__INST.qa(TLS_xt_rsc_0_23_qa);
    xt_rsc_0__23__INST.wea(TLS_xt_rsc_0_23_wea);
    xt_rsc_0__23__INST.da(TLS_xt_rsc_0_23_da);
    xt_rsc_0__23__INST.adra(TLS_xt_rsc_0_23_adra);
    xt_rsc_0__23__INST.clka(clk);
    xt_rsc_0__23__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__23__INST.clkb(clk);
    xt_rsc_0__23__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__23__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_62)));

    xt_rsc_0__24__INST.qb(TLS_xt_rsc_0_24_qb);
    xt_rsc_0__24__INST.web(TLS_xt_rsc_0_24_web);
    xt_rsc_0__24__INST.db(TLS_xt_rsc_0_24_db);
    xt_rsc_0__24__INST.adrb(TLS_xt_rsc_0_24_adrb);
    xt_rsc_0__24__INST.qa(TLS_xt_rsc_0_24_qa);
    xt_rsc_0__24__INST.wea(TLS_xt_rsc_0_24_wea);
    xt_rsc_0__24__INST.da(TLS_xt_rsc_0_24_da);
    xt_rsc_0__24__INST.adra(TLS_xt_rsc_0_24_adra);
    xt_rsc_0__24__INST.clka(clk);
    xt_rsc_0__24__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__24__INST.clkb(clk);
    xt_rsc_0__24__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__24__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_63)));

    xt_rsc_0__25__INST.qb(TLS_xt_rsc_0_25_qb);
    xt_rsc_0__25__INST.web(TLS_xt_rsc_0_25_web);
    xt_rsc_0__25__INST.db(TLS_xt_rsc_0_25_db);
    xt_rsc_0__25__INST.adrb(TLS_xt_rsc_0_25_adrb);
    xt_rsc_0__25__INST.qa(TLS_xt_rsc_0_25_qa);
    xt_rsc_0__25__INST.wea(TLS_xt_rsc_0_25_wea);
    xt_rsc_0__25__INST.da(TLS_xt_rsc_0_25_da);
    xt_rsc_0__25__INST.adra(TLS_xt_rsc_0_25_adra);
    xt_rsc_0__25__INST.clka(clk);
    xt_rsc_0__25__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__25__INST.clkb(clk);
    xt_rsc_0__25__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__25__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_64)));

    xt_rsc_0__26__INST.qb(TLS_xt_rsc_0_26_qb);
    xt_rsc_0__26__INST.web(TLS_xt_rsc_0_26_web);
    xt_rsc_0__26__INST.db(TLS_xt_rsc_0_26_db);
    xt_rsc_0__26__INST.adrb(TLS_xt_rsc_0_26_adrb);
    xt_rsc_0__26__INST.qa(TLS_xt_rsc_0_26_qa);
    xt_rsc_0__26__INST.wea(TLS_xt_rsc_0_26_wea);
    xt_rsc_0__26__INST.da(TLS_xt_rsc_0_26_da);
    xt_rsc_0__26__INST.adra(TLS_xt_rsc_0_26_adra);
    xt_rsc_0__26__INST.clka(clk);
    xt_rsc_0__26__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__26__INST.clkb(clk);
    xt_rsc_0__26__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__26__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_65)));

    xt_rsc_0__27__INST.qb(TLS_xt_rsc_0_27_qb);
    xt_rsc_0__27__INST.web(TLS_xt_rsc_0_27_web);
    xt_rsc_0__27__INST.db(TLS_xt_rsc_0_27_db);
    xt_rsc_0__27__INST.adrb(TLS_xt_rsc_0_27_adrb);
    xt_rsc_0__27__INST.qa(TLS_xt_rsc_0_27_qa);
    xt_rsc_0__27__INST.wea(TLS_xt_rsc_0_27_wea);
    xt_rsc_0__27__INST.da(TLS_xt_rsc_0_27_da);
    xt_rsc_0__27__INST.adra(TLS_xt_rsc_0_27_adra);
    xt_rsc_0__27__INST.clka(clk);
    xt_rsc_0__27__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__27__INST.clkb(clk);
    xt_rsc_0__27__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__27__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_66)));

    xt_rsc_0__28__INST.qb(TLS_xt_rsc_0_28_qb);
    xt_rsc_0__28__INST.web(TLS_xt_rsc_0_28_web);
    xt_rsc_0__28__INST.db(TLS_xt_rsc_0_28_db);
    xt_rsc_0__28__INST.adrb(TLS_xt_rsc_0_28_adrb);
    xt_rsc_0__28__INST.qa(TLS_xt_rsc_0_28_qa);
    xt_rsc_0__28__INST.wea(TLS_xt_rsc_0_28_wea);
    xt_rsc_0__28__INST.da(TLS_xt_rsc_0_28_da);
    xt_rsc_0__28__INST.adra(TLS_xt_rsc_0_28_adra);
    xt_rsc_0__28__INST.clka(clk);
    xt_rsc_0__28__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__28__INST.clkb(clk);
    xt_rsc_0__28__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__28__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_67)));

    xt_rsc_0__29__INST.qb(TLS_xt_rsc_0_29_qb);
    xt_rsc_0__29__INST.web(TLS_xt_rsc_0_29_web);
    xt_rsc_0__29__INST.db(TLS_xt_rsc_0_29_db);
    xt_rsc_0__29__INST.adrb(TLS_xt_rsc_0_29_adrb);
    xt_rsc_0__29__INST.qa(TLS_xt_rsc_0_29_qa);
    xt_rsc_0__29__INST.wea(TLS_xt_rsc_0_29_wea);
    xt_rsc_0__29__INST.da(TLS_xt_rsc_0_29_da);
    xt_rsc_0__29__INST.adra(TLS_xt_rsc_0_29_adra);
    xt_rsc_0__29__INST.clka(clk);
    xt_rsc_0__29__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__29__INST.clkb(clk);
    xt_rsc_0__29__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__29__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_68)));

    xt_rsc_0__30__INST.qb(TLS_xt_rsc_0_30_qb);
    xt_rsc_0__30__INST.web(TLS_xt_rsc_0_30_web);
    xt_rsc_0__30__INST.db(TLS_xt_rsc_0_30_db);
    xt_rsc_0__30__INST.adrb(TLS_xt_rsc_0_30_adrb);
    xt_rsc_0__30__INST.qa(TLS_xt_rsc_0_30_qa);
    xt_rsc_0__30__INST.wea(TLS_xt_rsc_0_30_wea);
    xt_rsc_0__30__INST.da(TLS_xt_rsc_0_30_da);
    xt_rsc_0__30__INST.adra(TLS_xt_rsc_0_30_adra);
    xt_rsc_0__30__INST.clka(clk);
    xt_rsc_0__30__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__30__INST.clkb(clk);
    xt_rsc_0__30__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__30__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_69)));

    xt_rsc_0__31__INST.qb(TLS_xt_rsc_0_31_qb);
    xt_rsc_0__31__INST.web(TLS_xt_rsc_0_31_web);
    xt_rsc_0__31__INST.db(TLS_xt_rsc_0_31_db);
    xt_rsc_0__31__INST.adrb(TLS_xt_rsc_0_31_adrb);
    xt_rsc_0__31__INST.qa(TLS_xt_rsc_0_31_qa);
    xt_rsc_0__31__INST.wea(TLS_xt_rsc_0_31_wea);
    xt_rsc_0__31__INST.da(TLS_xt_rsc_0_31_da);
    xt_rsc_0__31__INST.adra(TLS_xt_rsc_0_31_adra);
    xt_rsc_0__31__INST.clka(clk);
    xt_rsc_0__31__INST.clka_en(SIG_SC_LOGIC_1);
    xt_rsc_0__31__INST.clkb(clk);
    xt_rsc_0__31__INST.clkb_en(SIG_SC_LOGIC_1);
    xt_rsc_0__31__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_70)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    twiddle_rsc_0__0__INST.qb(TLS_twiddle_rsc_0_0_qb);
    twiddle_rsc_0__0__INST.web(TLS_twiddle_rsc_0_0_web);
    twiddle_rsc_0__0__INST.db(TLS_twiddle_rsc_0_0_db);
    twiddle_rsc_0__0__INST.adrb(TLS_twiddle_rsc_0_0_adrb);
    twiddle_rsc_0__0__INST.qa(TLS_twiddle_rsc_0_0_qa);
    twiddle_rsc_0__0__INST.wea(TLS_twiddle_rsc_0_0_wea);
    twiddle_rsc_0__0__INST.da(TLS_twiddle_rsc_0_0_da);
    twiddle_rsc_0__0__INST.adra(TLS_twiddle_rsc_0_0_adra);
    twiddle_rsc_0__0__INST.clka(clk);
    twiddle_rsc_0__0__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__0__INST.clkb(clk);
    twiddle_rsc_0__0__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_71)));

    twiddle_rsc_0__1__INST.qb(TLS_twiddle_rsc_0_1_qb);
    twiddle_rsc_0__1__INST.web(TLS_twiddle_rsc_0_1_web);
    twiddle_rsc_0__1__INST.db(TLS_twiddle_rsc_0_1_db);
    twiddle_rsc_0__1__INST.adrb(TLS_twiddle_rsc_0_1_adrb);
    twiddle_rsc_0__1__INST.qa(TLS_twiddle_rsc_0_1_qa);
    twiddle_rsc_0__1__INST.wea(TLS_twiddle_rsc_0_1_wea);
    twiddle_rsc_0__1__INST.da(TLS_twiddle_rsc_0_1_da);
    twiddle_rsc_0__1__INST.adra(TLS_twiddle_rsc_0_1_adra);
    twiddle_rsc_0__1__INST.clka(clk);
    twiddle_rsc_0__1__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__1__INST.clkb(clk);
    twiddle_rsc_0__1__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_72)));

    twiddle_rsc_0__2__INST.qb(TLS_twiddle_rsc_0_2_qb);
    twiddle_rsc_0__2__INST.web(TLS_twiddle_rsc_0_2_web);
    twiddle_rsc_0__2__INST.db(TLS_twiddle_rsc_0_2_db);
    twiddle_rsc_0__2__INST.adrb(TLS_twiddle_rsc_0_2_adrb);
    twiddle_rsc_0__2__INST.qa(TLS_twiddle_rsc_0_2_qa);
    twiddle_rsc_0__2__INST.wea(TLS_twiddle_rsc_0_2_wea);
    twiddle_rsc_0__2__INST.da(TLS_twiddle_rsc_0_2_da);
    twiddle_rsc_0__2__INST.adra(TLS_twiddle_rsc_0_2_adra);
    twiddle_rsc_0__2__INST.clka(clk);
    twiddle_rsc_0__2__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__2__INST.clkb(clk);
    twiddle_rsc_0__2__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_73)));

    twiddle_rsc_0__3__INST.qb(TLS_twiddle_rsc_0_3_qb);
    twiddle_rsc_0__3__INST.web(TLS_twiddle_rsc_0_3_web);
    twiddle_rsc_0__3__INST.db(TLS_twiddle_rsc_0_3_db);
    twiddle_rsc_0__3__INST.adrb(TLS_twiddle_rsc_0_3_adrb);
    twiddle_rsc_0__3__INST.qa(TLS_twiddle_rsc_0_3_qa);
    twiddle_rsc_0__3__INST.wea(TLS_twiddle_rsc_0_3_wea);
    twiddle_rsc_0__3__INST.da(TLS_twiddle_rsc_0_3_da);
    twiddle_rsc_0__3__INST.adra(TLS_twiddle_rsc_0_3_adra);
    twiddle_rsc_0__3__INST.clka(clk);
    twiddle_rsc_0__3__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__3__INST.clkb(clk);
    twiddle_rsc_0__3__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_74)));

    twiddle_rsc_0__4__INST.qb(TLS_twiddle_rsc_0_4_qb);
    twiddle_rsc_0__4__INST.web(TLS_twiddle_rsc_0_4_web);
    twiddle_rsc_0__4__INST.db(TLS_twiddle_rsc_0_4_db);
    twiddle_rsc_0__4__INST.adrb(TLS_twiddle_rsc_0_4_adrb);
    twiddle_rsc_0__4__INST.qa(TLS_twiddle_rsc_0_4_qa);
    twiddle_rsc_0__4__INST.wea(TLS_twiddle_rsc_0_4_wea);
    twiddle_rsc_0__4__INST.da(TLS_twiddle_rsc_0_4_da);
    twiddle_rsc_0__4__INST.adra(TLS_twiddle_rsc_0_4_adra);
    twiddle_rsc_0__4__INST.clka(clk);
    twiddle_rsc_0__4__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__4__INST.clkb(clk);
    twiddle_rsc_0__4__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_75)));

    twiddle_rsc_0__5__INST.qb(TLS_twiddle_rsc_0_5_qb);
    twiddle_rsc_0__5__INST.web(TLS_twiddle_rsc_0_5_web);
    twiddle_rsc_0__5__INST.db(TLS_twiddle_rsc_0_5_db);
    twiddle_rsc_0__5__INST.adrb(TLS_twiddle_rsc_0_5_adrb);
    twiddle_rsc_0__5__INST.qa(TLS_twiddle_rsc_0_5_qa);
    twiddle_rsc_0__5__INST.wea(TLS_twiddle_rsc_0_5_wea);
    twiddle_rsc_0__5__INST.da(TLS_twiddle_rsc_0_5_da);
    twiddle_rsc_0__5__INST.adra(TLS_twiddle_rsc_0_5_adra);
    twiddle_rsc_0__5__INST.clka(clk);
    twiddle_rsc_0__5__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__5__INST.clkb(clk);
    twiddle_rsc_0__5__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_76)));

    twiddle_rsc_0__6__INST.qb(TLS_twiddle_rsc_0_6_qb);
    twiddle_rsc_0__6__INST.web(TLS_twiddle_rsc_0_6_web);
    twiddle_rsc_0__6__INST.db(TLS_twiddle_rsc_0_6_db);
    twiddle_rsc_0__6__INST.adrb(TLS_twiddle_rsc_0_6_adrb);
    twiddle_rsc_0__6__INST.qa(TLS_twiddle_rsc_0_6_qa);
    twiddle_rsc_0__6__INST.wea(TLS_twiddle_rsc_0_6_wea);
    twiddle_rsc_0__6__INST.da(TLS_twiddle_rsc_0_6_da);
    twiddle_rsc_0__6__INST.adra(TLS_twiddle_rsc_0_6_adra);
    twiddle_rsc_0__6__INST.clka(clk);
    twiddle_rsc_0__6__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__6__INST.clkb(clk);
    twiddle_rsc_0__6__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_77)));

    twiddle_rsc_0__7__INST.qb(TLS_twiddle_rsc_0_7_qb);
    twiddle_rsc_0__7__INST.web(TLS_twiddle_rsc_0_7_web);
    twiddle_rsc_0__7__INST.db(TLS_twiddle_rsc_0_7_db);
    twiddle_rsc_0__7__INST.adrb(TLS_twiddle_rsc_0_7_adrb);
    twiddle_rsc_0__7__INST.qa(TLS_twiddle_rsc_0_7_qa);
    twiddle_rsc_0__7__INST.wea(TLS_twiddle_rsc_0_7_wea);
    twiddle_rsc_0__7__INST.da(TLS_twiddle_rsc_0_7_da);
    twiddle_rsc_0__7__INST.adra(TLS_twiddle_rsc_0_7_adra);
    twiddle_rsc_0__7__INST.clka(clk);
    twiddle_rsc_0__7__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__7__INST.clkb(clk);
    twiddle_rsc_0__7__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_78)));

    twiddle_rsc_0__8__INST.qb(TLS_twiddle_rsc_0_8_qb);
    twiddle_rsc_0__8__INST.web(TLS_twiddle_rsc_0_8_web);
    twiddle_rsc_0__8__INST.db(TLS_twiddle_rsc_0_8_db);
    twiddle_rsc_0__8__INST.adrb(TLS_twiddle_rsc_0_8_adrb);
    twiddle_rsc_0__8__INST.qa(TLS_twiddle_rsc_0_8_qa);
    twiddle_rsc_0__8__INST.wea(TLS_twiddle_rsc_0_8_wea);
    twiddle_rsc_0__8__INST.da(TLS_twiddle_rsc_0_8_da);
    twiddle_rsc_0__8__INST.adra(TLS_twiddle_rsc_0_8_adra);
    twiddle_rsc_0__8__INST.clka(clk);
    twiddle_rsc_0__8__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__8__INST.clkb(clk);
    twiddle_rsc_0__8__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_79)));

    twiddle_rsc_0__9__INST.qb(TLS_twiddle_rsc_0_9_qb);
    twiddle_rsc_0__9__INST.web(TLS_twiddle_rsc_0_9_web);
    twiddle_rsc_0__9__INST.db(TLS_twiddle_rsc_0_9_db);
    twiddle_rsc_0__9__INST.adrb(TLS_twiddle_rsc_0_9_adrb);
    twiddle_rsc_0__9__INST.qa(TLS_twiddle_rsc_0_9_qa);
    twiddle_rsc_0__9__INST.wea(TLS_twiddle_rsc_0_9_wea);
    twiddle_rsc_0__9__INST.da(TLS_twiddle_rsc_0_9_da);
    twiddle_rsc_0__9__INST.adra(TLS_twiddle_rsc_0_9_adra);
    twiddle_rsc_0__9__INST.clka(clk);
    twiddle_rsc_0__9__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__9__INST.clkb(clk);
    twiddle_rsc_0__9__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_80)));

    twiddle_rsc_0__10__INST.qb(TLS_twiddle_rsc_0_10_qb);
    twiddle_rsc_0__10__INST.web(TLS_twiddle_rsc_0_10_web);
    twiddle_rsc_0__10__INST.db(TLS_twiddle_rsc_0_10_db);
    twiddle_rsc_0__10__INST.adrb(TLS_twiddle_rsc_0_10_adrb);
    twiddle_rsc_0__10__INST.qa(TLS_twiddle_rsc_0_10_qa);
    twiddle_rsc_0__10__INST.wea(TLS_twiddle_rsc_0_10_wea);
    twiddle_rsc_0__10__INST.da(TLS_twiddle_rsc_0_10_da);
    twiddle_rsc_0__10__INST.adra(TLS_twiddle_rsc_0_10_adra);
    twiddle_rsc_0__10__INST.clka(clk);
    twiddle_rsc_0__10__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__10__INST.clkb(clk);
    twiddle_rsc_0__10__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_81)));

    twiddle_rsc_0__11__INST.qb(TLS_twiddle_rsc_0_11_qb);
    twiddle_rsc_0__11__INST.web(TLS_twiddle_rsc_0_11_web);
    twiddle_rsc_0__11__INST.db(TLS_twiddle_rsc_0_11_db);
    twiddle_rsc_0__11__INST.adrb(TLS_twiddle_rsc_0_11_adrb);
    twiddle_rsc_0__11__INST.qa(TLS_twiddle_rsc_0_11_qa);
    twiddle_rsc_0__11__INST.wea(TLS_twiddle_rsc_0_11_wea);
    twiddle_rsc_0__11__INST.da(TLS_twiddle_rsc_0_11_da);
    twiddle_rsc_0__11__INST.adra(TLS_twiddle_rsc_0_11_adra);
    twiddle_rsc_0__11__INST.clka(clk);
    twiddle_rsc_0__11__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__11__INST.clkb(clk);
    twiddle_rsc_0__11__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_82)));

    twiddle_rsc_0__12__INST.qb(TLS_twiddle_rsc_0_12_qb);
    twiddle_rsc_0__12__INST.web(TLS_twiddle_rsc_0_12_web);
    twiddle_rsc_0__12__INST.db(TLS_twiddle_rsc_0_12_db);
    twiddle_rsc_0__12__INST.adrb(TLS_twiddle_rsc_0_12_adrb);
    twiddle_rsc_0__12__INST.qa(TLS_twiddle_rsc_0_12_qa);
    twiddle_rsc_0__12__INST.wea(TLS_twiddle_rsc_0_12_wea);
    twiddle_rsc_0__12__INST.da(TLS_twiddle_rsc_0_12_da);
    twiddle_rsc_0__12__INST.adra(TLS_twiddle_rsc_0_12_adra);
    twiddle_rsc_0__12__INST.clka(clk);
    twiddle_rsc_0__12__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__12__INST.clkb(clk);
    twiddle_rsc_0__12__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_83)));

    twiddle_rsc_0__13__INST.qb(TLS_twiddle_rsc_0_13_qb);
    twiddle_rsc_0__13__INST.web(TLS_twiddle_rsc_0_13_web);
    twiddle_rsc_0__13__INST.db(TLS_twiddle_rsc_0_13_db);
    twiddle_rsc_0__13__INST.adrb(TLS_twiddle_rsc_0_13_adrb);
    twiddle_rsc_0__13__INST.qa(TLS_twiddle_rsc_0_13_qa);
    twiddle_rsc_0__13__INST.wea(TLS_twiddle_rsc_0_13_wea);
    twiddle_rsc_0__13__INST.da(TLS_twiddle_rsc_0_13_da);
    twiddle_rsc_0__13__INST.adra(TLS_twiddle_rsc_0_13_adra);
    twiddle_rsc_0__13__INST.clka(clk);
    twiddle_rsc_0__13__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__13__INST.clkb(clk);
    twiddle_rsc_0__13__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_84)));

    twiddle_rsc_0__14__INST.qb(TLS_twiddle_rsc_0_14_qb);
    twiddle_rsc_0__14__INST.web(TLS_twiddle_rsc_0_14_web);
    twiddle_rsc_0__14__INST.db(TLS_twiddle_rsc_0_14_db);
    twiddle_rsc_0__14__INST.adrb(TLS_twiddle_rsc_0_14_adrb);
    twiddle_rsc_0__14__INST.qa(TLS_twiddle_rsc_0_14_qa);
    twiddle_rsc_0__14__INST.wea(TLS_twiddle_rsc_0_14_wea);
    twiddle_rsc_0__14__INST.da(TLS_twiddle_rsc_0_14_da);
    twiddle_rsc_0__14__INST.adra(TLS_twiddle_rsc_0_14_adra);
    twiddle_rsc_0__14__INST.clka(clk);
    twiddle_rsc_0__14__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__14__INST.clkb(clk);
    twiddle_rsc_0__14__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_85)));

    twiddle_rsc_0__15__INST.qb(TLS_twiddle_rsc_0_15_qb);
    twiddle_rsc_0__15__INST.web(TLS_twiddle_rsc_0_15_web);
    twiddle_rsc_0__15__INST.db(TLS_twiddle_rsc_0_15_db);
    twiddle_rsc_0__15__INST.adrb(TLS_twiddle_rsc_0_15_adrb);
    twiddle_rsc_0__15__INST.qa(TLS_twiddle_rsc_0_15_qa);
    twiddle_rsc_0__15__INST.wea(TLS_twiddle_rsc_0_15_wea);
    twiddle_rsc_0__15__INST.da(TLS_twiddle_rsc_0_15_da);
    twiddle_rsc_0__15__INST.adra(TLS_twiddle_rsc_0_15_adra);
    twiddle_rsc_0__15__INST.clka(clk);
    twiddle_rsc_0__15__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__15__INST.clkb(clk);
    twiddle_rsc_0__15__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_86)));

    twiddle_h_rsc_0__0__INST.qb(TLS_twiddle_h_rsc_0_0_qb);
    twiddle_h_rsc_0__0__INST.web(TLS_twiddle_h_rsc_0_0_web);
    twiddle_h_rsc_0__0__INST.db(TLS_twiddle_h_rsc_0_0_db);
    twiddle_h_rsc_0__0__INST.adrb(TLS_twiddle_h_rsc_0_0_adrb);
    twiddle_h_rsc_0__0__INST.qa(TLS_twiddle_h_rsc_0_0_qa);
    twiddle_h_rsc_0__0__INST.wea(TLS_twiddle_h_rsc_0_0_wea);
    twiddle_h_rsc_0__0__INST.da(TLS_twiddle_h_rsc_0_0_da);
    twiddle_h_rsc_0__0__INST.adra(TLS_twiddle_h_rsc_0_0_adra);
    twiddle_h_rsc_0__0__INST.clka(clk);
    twiddle_h_rsc_0__0__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__0__INST.clkb(clk);
    twiddle_h_rsc_0__0__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_87)));

    twiddle_h_rsc_0__1__INST.qb(TLS_twiddle_h_rsc_0_1_qb);
    twiddle_h_rsc_0__1__INST.web(TLS_twiddle_h_rsc_0_1_web);
    twiddle_h_rsc_0__1__INST.db(TLS_twiddle_h_rsc_0_1_db);
    twiddle_h_rsc_0__1__INST.adrb(TLS_twiddle_h_rsc_0_1_adrb);
    twiddle_h_rsc_0__1__INST.qa(TLS_twiddle_h_rsc_0_1_qa);
    twiddle_h_rsc_0__1__INST.wea(TLS_twiddle_h_rsc_0_1_wea);
    twiddle_h_rsc_0__1__INST.da(TLS_twiddle_h_rsc_0_1_da);
    twiddle_h_rsc_0__1__INST.adra(TLS_twiddle_h_rsc_0_1_adra);
    twiddle_h_rsc_0__1__INST.clka(clk);
    twiddle_h_rsc_0__1__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__1__INST.clkb(clk);
    twiddle_h_rsc_0__1__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_88)));

    twiddle_h_rsc_0__2__INST.qb(TLS_twiddle_h_rsc_0_2_qb);
    twiddle_h_rsc_0__2__INST.web(TLS_twiddle_h_rsc_0_2_web);
    twiddle_h_rsc_0__2__INST.db(TLS_twiddle_h_rsc_0_2_db);
    twiddle_h_rsc_0__2__INST.adrb(TLS_twiddle_h_rsc_0_2_adrb);
    twiddle_h_rsc_0__2__INST.qa(TLS_twiddle_h_rsc_0_2_qa);
    twiddle_h_rsc_0__2__INST.wea(TLS_twiddle_h_rsc_0_2_wea);
    twiddle_h_rsc_0__2__INST.da(TLS_twiddle_h_rsc_0_2_da);
    twiddle_h_rsc_0__2__INST.adra(TLS_twiddle_h_rsc_0_2_adra);
    twiddle_h_rsc_0__2__INST.clka(clk);
    twiddle_h_rsc_0__2__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__2__INST.clkb(clk);
    twiddle_h_rsc_0__2__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_89)));

    twiddle_h_rsc_0__3__INST.qb(TLS_twiddle_h_rsc_0_3_qb);
    twiddle_h_rsc_0__3__INST.web(TLS_twiddle_h_rsc_0_3_web);
    twiddle_h_rsc_0__3__INST.db(TLS_twiddle_h_rsc_0_3_db);
    twiddle_h_rsc_0__3__INST.adrb(TLS_twiddle_h_rsc_0_3_adrb);
    twiddle_h_rsc_0__3__INST.qa(TLS_twiddle_h_rsc_0_3_qa);
    twiddle_h_rsc_0__3__INST.wea(TLS_twiddle_h_rsc_0_3_wea);
    twiddle_h_rsc_0__3__INST.da(TLS_twiddle_h_rsc_0_3_da);
    twiddle_h_rsc_0__3__INST.adra(TLS_twiddle_h_rsc_0_3_adra);
    twiddle_h_rsc_0__3__INST.clka(clk);
    twiddle_h_rsc_0__3__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__3__INST.clkb(clk);
    twiddle_h_rsc_0__3__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_90)));

    twiddle_h_rsc_0__4__INST.qb(TLS_twiddle_h_rsc_0_4_qb);
    twiddle_h_rsc_0__4__INST.web(TLS_twiddle_h_rsc_0_4_web);
    twiddle_h_rsc_0__4__INST.db(TLS_twiddle_h_rsc_0_4_db);
    twiddle_h_rsc_0__4__INST.adrb(TLS_twiddle_h_rsc_0_4_adrb);
    twiddle_h_rsc_0__4__INST.qa(TLS_twiddle_h_rsc_0_4_qa);
    twiddle_h_rsc_0__4__INST.wea(TLS_twiddle_h_rsc_0_4_wea);
    twiddle_h_rsc_0__4__INST.da(TLS_twiddle_h_rsc_0_4_da);
    twiddle_h_rsc_0__4__INST.adra(TLS_twiddle_h_rsc_0_4_adra);
    twiddle_h_rsc_0__4__INST.clka(clk);
    twiddle_h_rsc_0__4__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__4__INST.clkb(clk);
    twiddle_h_rsc_0__4__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_91)));

    twiddle_h_rsc_0__5__INST.qb(TLS_twiddle_h_rsc_0_5_qb);
    twiddle_h_rsc_0__5__INST.web(TLS_twiddle_h_rsc_0_5_web);
    twiddle_h_rsc_0__5__INST.db(TLS_twiddle_h_rsc_0_5_db);
    twiddle_h_rsc_0__5__INST.adrb(TLS_twiddle_h_rsc_0_5_adrb);
    twiddle_h_rsc_0__5__INST.qa(TLS_twiddle_h_rsc_0_5_qa);
    twiddle_h_rsc_0__5__INST.wea(TLS_twiddle_h_rsc_0_5_wea);
    twiddle_h_rsc_0__5__INST.da(TLS_twiddle_h_rsc_0_5_da);
    twiddle_h_rsc_0__5__INST.adra(TLS_twiddle_h_rsc_0_5_adra);
    twiddle_h_rsc_0__5__INST.clka(clk);
    twiddle_h_rsc_0__5__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__5__INST.clkb(clk);
    twiddle_h_rsc_0__5__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_92)));

    twiddle_h_rsc_0__6__INST.qb(TLS_twiddle_h_rsc_0_6_qb);
    twiddle_h_rsc_0__6__INST.web(TLS_twiddle_h_rsc_0_6_web);
    twiddle_h_rsc_0__6__INST.db(TLS_twiddle_h_rsc_0_6_db);
    twiddle_h_rsc_0__6__INST.adrb(TLS_twiddle_h_rsc_0_6_adrb);
    twiddle_h_rsc_0__6__INST.qa(TLS_twiddle_h_rsc_0_6_qa);
    twiddle_h_rsc_0__6__INST.wea(TLS_twiddle_h_rsc_0_6_wea);
    twiddle_h_rsc_0__6__INST.da(TLS_twiddle_h_rsc_0_6_da);
    twiddle_h_rsc_0__6__INST.adra(TLS_twiddle_h_rsc_0_6_adra);
    twiddle_h_rsc_0__6__INST.clka(clk);
    twiddle_h_rsc_0__6__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__6__INST.clkb(clk);
    twiddle_h_rsc_0__6__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_93)));

    twiddle_h_rsc_0__7__INST.qb(TLS_twiddle_h_rsc_0_7_qb);
    twiddle_h_rsc_0__7__INST.web(TLS_twiddle_h_rsc_0_7_web);
    twiddle_h_rsc_0__7__INST.db(TLS_twiddle_h_rsc_0_7_db);
    twiddle_h_rsc_0__7__INST.adrb(TLS_twiddle_h_rsc_0_7_adrb);
    twiddle_h_rsc_0__7__INST.qa(TLS_twiddle_h_rsc_0_7_qa);
    twiddle_h_rsc_0__7__INST.wea(TLS_twiddle_h_rsc_0_7_wea);
    twiddle_h_rsc_0__7__INST.da(TLS_twiddle_h_rsc_0_7_da);
    twiddle_h_rsc_0__7__INST.adra(TLS_twiddle_h_rsc_0_7_adra);
    twiddle_h_rsc_0__7__INST.clka(clk);
    twiddle_h_rsc_0__7__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__7__INST.clkb(clk);
    twiddle_h_rsc_0__7__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_94)));

    twiddle_h_rsc_0__8__INST.qb(TLS_twiddle_h_rsc_0_8_qb);
    twiddle_h_rsc_0__8__INST.web(TLS_twiddle_h_rsc_0_8_web);
    twiddle_h_rsc_0__8__INST.db(TLS_twiddle_h_rsc_0_8_db);
    twiddle_h_rsc_0__8__INST.adrb(TLS_twiddle_h_rsc_0_8_adrb);
    twiddle_h_rsc_0__8__INST.qa(TLS_twiddle_h_rsc_0_8_qa);
    twiddle_h_rsc_0__8__INST.wea(TLS_twiddle_h_rsc_0_8_wea);
    twiddle_h_rsc_0__8__INST.da(TLS_twiddle_h_rsc_0_8_da);
    twiddle_h_rsc_0__8__INST.adra(TLS_twiddle_h_rsc_0_8_adra);
    twiddle_h_rsc_0__8__INST.clka(clk);
    twiddle_h_rsc_0__8__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__8__INST.clkb(clk);
    twiddle_h_rsc_0__8__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_95)));

    twiddle_h_rsc_0__9__INST.qb(TLS_twiddle_h_rsc_0_9_qb);
    twiddle_h_rsc_0__9__INST.web(TLS_twiddle_h_rsc_0_9_web);
    twiddle_h_rsc_0__9__INST.db(TLS_twiddle_h_rsc_0_9_db);
    twiddle_h_rsc_0__9__INST.adrb(TLS_twiddle_h_rsc_0_9_adrb);
    twiddle_h_rsc_0__9__INST.qa(TLS_twiddle_h_rsc_0_9_qa);
    twiddle_h_rsc_0__9__INST.wea(TLS_twiddle_h_rsc_0_9_wea);
    twiddle_h_rsc_0__9__INST.da(TLS_twiddle_h_rsc_0_9_da);
    twiddle_h_rsc_0__9__INST.adra(TLS_twiddle_h_rsc_0_9_adra);
    twiddle_h_rsc_0__9__INST.clka(clk);
    twiddle_h_rsc_0__9__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__9__INST.clkb(clk);
    twiddle_h_rsc_0__9__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_96)));

    twiddle_h_rsc_0__10__INST.qb(TLS_twiddle_h_rsc_0_10_qb);
    twiddle_h_rsc_0__10__INST.web(TLS_twiddle_h_rsc_0_10_web);
    twiddle_h_rsc_0__10__INST.db(TLS_twiddle_h_rsc_0_10_db);
    twiddle_h_rsc_0__10__INST.adrb(TLS_twiddle_h_rsc_0_10_adrb);
    twiddle_h_rsc_0__10__INST.qa(TLS_twiddle_h_rsc_0_10_qa);
    twiddle_h_rsc_0__10__INST.wea(TLS_twiddle_h_rsc_0_10_wea);
    twiddle_h_rsc_0__10__INST.da(TLS_twiddle_h_rsc_0_10_da);
    twiddle_h_rsc_0__10__INST.adra(TLS_twiddle_h_rsc_0_10_adra);
    twiddle_h_rsc_0__10__INST.clka(clk);
    twiddle_h_rsc_0__10__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__10__INST.clkb(clk);
    twiddle_h_rsc_0__10__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_97)));

    twiddle_h_rsc_0__11__INST.qb(TLS_twiddle_h_rsc_0_11_qb);
    twiddle_h_rsc_0__11__INST.web(TLS_twiddle_h_rsc_0_11_web);
    twiddle_h_rsc_0__11__INST.db(TLS_twiddle_h_rsc_0_11_db);
    twiddle_h_rsc_0__11__INST.adrb(TLS_twiddle_h_rsc_0_11_adrb);
    twiddle_h_rsc_0__11__INST.qa(TLS_twiddle_h_rsc_0_11_qa);
    twiddle_h_rsc_0__11__INST.wea(TLS_twiddle_h_rsc_0_11_wea);
    twiddle_h_rsc_0__11__INST.da(TLS_twiddle_h_rsc_0_11_da);
    twiddle_h_rsc_0__11__INST.adra(TLS_twiddle_h_rsc_0_11_adra);
    twiddle_h_rsc_0__11__INST.clka(clk);
    twiddle_h_rsc_0__11__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__11__INST.clkb(clk);
    twiddle_h_rsc_0__11__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_98)));

    twiddle_h_rsc_0__12__INST.qb(TLS_twiddle_h_rsc_0_12_qb);
    twiddle_h_rsc_0__12__INST.web(TLS_twiddle_h_rsc_0_12_web);
    twiddle_h_rsc_0__12__INST.db(TLS_twiddle_h_rsc_0_12_db);
    twiddle_h_rsc_0__12__INST.adrb(TLS_twiddle_h_rsc_0_12_adrb);
    twiddle_h_rsc_0__12__INST.qa(TLS_twiddle_h_rsc_0_12_qa);
    twiddle_h_rsc_0__12__INST.wea(TLS_twiddle_h_rsc_0_12_wea);
    twiddle_h_rsc_0__12__INST.da(TLS_twiddle_h_rsc_0_12_da);
    twiddle_h_rsc_0__12__INST.adra(TLS_twiddle_h_rsc_0_12_adra);
    twiddle_h_rsc_0__12__INST.clka(clk);
    twiddle_h_rsc_0__12__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__12__INST.clkb(clk);
    twiddle_h_rsc_0__12__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_99)));

    twiddle_h_rsc_0__13__INST.qb(TLS_twiddle_h_rsc_0_13_qb);
    twiddle_h_rsc_0__13__INST.web(TLS_twiddle_h_rsc_0_13_web);
    twiddle_h_rsc_0__13__INST.db(TLS_twiddle_h_rsc_0_13_db);
    twiddle_h_rsc_0__13__INST.adrb(TLS_twiddle_h_rsc_0_13_adrb);
    twiddle_h_rsc_0__13__INST.qa(TLS_twiddle_h_rsc_0_13_qa);
    twiddle_h_rsc_0__13__INST.wea(TLS_twiddle_h_rsc_0_13_wea);
    twiddle_h_rsc_0__13__INST.da(TLS_twiddle_h_rsc_0_13_da);
    twiddle_h_rsc_0__13__INST.adra(TLS_twiddle_h_rsc_0_13_adra);
    twiddle_h_rsc_0__13__INST.clka(clk);
    twiddle_h_rsc_0__13__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__13__INST.clkb(clk);
    twiddle_h_rsc_0__13__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_100)));

    twiddle_h_rsc_0__14__INST.qb(TLS_twiddle_h_rsc_0_14_qb);
    twiddle_h_rsc_0__14__INST.web(TLS_twiddle_h_rsc_0_14_web);
    twiddle_h_rsc_0__14__INST.db(TLS_twiddle_h_rsc_0_14_db);
    twiddle_h_rsc_0__14__INST.adrb(TLS_twiddle_h_rsc_0_14_adrb);
    twiddle_h_rsc_0__14__INST.qa(TLS_twiddle_h_rsc_0_14_qa);
    twiddle_h_rsc_0__14__INST.wea(TLS_twiddle_h_rsc_0_14_wea);
    twiddle_h_rsc_0__14__INST.da(TLS_twiddle_h_rsc_0_14_da);
    twiddle_h_rsc_0__14__INST.adra(TLS_twiddle_h_rsc_0_14_adra);
    twiddle_h_rsc_0__14__INST.clka(clk);
    twiddle_h_rsc_0__14__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__14__INST.clkb(clk);
    twiddle_h_rsc_0__14__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_101)));

    twiddle_h_rsc_0__15__INST.qb(TLS_twiddle_h_rsc_0_15_qb);
    twiddle_h_rsc_0__15__INST.web(TLS_twiddle_h_rsc_0_15_web);
    twiddle_h_rsc_0__15__INST.db(TLS_twiddle_h_rsc_0_15_db);
    twiddle_h_rsc_0__15__INST.adrb(TLS_twiddle_h_rsc_0_15_adrb);
    twiddle_h_rsc_0__15__INST.qa(TLS_twiddle_h_rsc_0_15_qa);
    twiddle_h_rsc_0__15__INST.wea(TLS_twiddle_h_rsc_0_15_wea);
    twiddle_h_rsc_0__15__INST.da(TLS_twiddle_h_rsc_0_15_da);
    twiddle_h_rsc_0__15__INST.adra(TLS_twiddle_h_rsc_0_15_adra);
    twiddle_h_rsc_0__15__INST.clka(clk);
    twiddle_h_rsc_0__15__INST.clka_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__15__INST.clkb(clk);
    twiddle_h_rsc_0__15__INST.clkb_en(SIG_SC_LOGIC_1);
    twiddle_h_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_102)));

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

    trios_monitor_xt_rsc_triosy_0_8_lz_INST.trios(TLS_xt_rsc_triosy_0_8_lz);
    trios_monitor_xt_rsc_triosy_0_8_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_9_lz_INST.trios(TLS_xt_rsc_triosy_0_9_lz);
    trios_monitor_xt_rsc_triosy_0_9_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_10_lz_INST.trios(TLS_xt_rsc_triosy_0_10_lz);
    trios_monitor_xt_rsc_triosy_0_10_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_11_lz_INST.trios(TLS_xt_rsc_triosy_0_11_lz);
    trios_monitor_xt_rsc_triosy_0_11_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_12_lz_INST.trios(TLS_xt_rsc_triosy_0_12_lz);
    trios_monitor_xt_rsc_triosy_0_12_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_13_lz_INST.trios(TLS_xt_rsc_triosy_0_13_lz);
    trios_monitor_xt_rsc_triosy_0_13_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_14_lz_INST.trios(TLS_xt_rsc_triosy_0_14_lz);
    trios_monitor_xt_rsc_triosy_0_14_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_15_lz_INST.trios(TLS_xt_rsc_triosy_0_15_lz);
    trios_monitor_xt_rsc_triosy_0_15_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_16_lz_INST.trios(TLS_xt_rsc_triosy_0_16_lz);
    trios_monitor_xt_rsc_triosy_0_16_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_17_lz_INST.trios(TLS_xt_rsc_triosy_0_17_lz);
    trios_monitor_xt_rsc_triosy_0_17_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_18_lz_INST.trios(TLS_xt_rsc_triosy_0_18_lz);
    trios_monitor_xt_rsc_triosy_0_18_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_19_lz_INST.trios(TLS_xt_rsc_triosy_0_19_lz);
    trios_monitor_xt_rsc_triosy_0_19_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_20_lz_INST.trios(TLS_xt_rsc_triosy_0_20_lz);
    trios_monitor_xt_rsc_triosy_0_20_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_21_lz_INST.trios(TLS_xt_rsc_triosy_0_21_lz);
    trios_monitor_xt_rsc_triosy_0_21_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_22_lz_INST.trios(TLS_xt_rsc_triosy_0_22_lz);
    trios_monitor_xt_rsc_triosy_0_22_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_23_lz_INST.trios(TLS_xt_rsc_triosy_0_23_lz);
    trios_monitor_xt_rsc_triosy_0_23_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_24_lz_INST.trios(TLS_xt_rsc_triosy_0_24_lz);
    trios_monitor_xt_rsc_triosy_0_24_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_25_lz_INST.trios(TLS_xt_rsc_triosy_0_25_lz);
    trios_monitor_xt_rsc_triosy_0_25_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_26_lz_INST.trios(TLS_xt_rsc_triosy_0_26_lz);
    trios_monitor_xt_rsc_triosy_0_26_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_27_lz_INST.trios(TLS_xt_rsc_triosy_0_27_lz);
    trios_monitor_xt_rsc_triosy_0_27_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_28_lz_INST.trios(TLS_xt_rsc_triosy_0_28_lz);
    trios_monitor_xt_rsc_triosy_0_28_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_29_lz_INST.trios(TLS_xt_rsc_triosy_0_29_lz);
    trios_monitor_xt_rsc_triosy_0_29_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_30_lz_INST.trios(TLS_xt_rsc_triosy_0_30_lz);
    trios_monitor_xt_rsc_triosy_0_30_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_0_31_lz_INST.trios(TLS_xt_rsc_triosy_0_31_lz);
    trios_monitor_xt_rsc_triosy_0_31_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_xt.in_fifo(TLS_in_fifo_xt);
    transactor_xt.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_xt);
    transactor_xt.out_fifo(TLS_out_fifo_xt);
    transactor_xt.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_xt);
    transactor_xt.bind_clk(clk, true, rst);
    transactor_xt.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_xt.register_block(&xt_rsc_0__0__INST, xt_rsc_0__0__INST.basename(), TLS_xt_rsc_triosy_0_0_lz, 0,
        4064, 32);
    transactor_xt.register_block(&xt_rsc_0__1__INST, xt_rsc_0__1__INST.basename(), TLS_xt_rsc_triosy_0_1_lz, 1,
        4065, 32);
    transactor_xt.register_block(&xt_rsc_0__2__INST, xt_rsc_0__2__INST.basename(), TLS_xt_rsc_triosy_0_2_lz, 2,
        4066, 32);
    transactor_xt.register_block(&xt_rsc_0__3__INST, xt_rsc_0__3__INST.basename(), TLS_xt_rsc_triosy_0_3_lz, 3,
        4067, 32);
    transactor_xt.register_block(&xt_rsc_0__4__INST, xt_rsc_0__4__INST.basename(), TLS_xt_rsc_triosy_0_4_lz, 4,
        4068, 32);
    transactor_xt.register_block(&xt_rsc_0__5__INST, xt_rsc_0__5__INST.basename(), TLS_xt_rsc_triosy_0_5_lz, 5,
        4069, 32);
    transactor_xt.register_block(&xt_rsc_0__6__INST, xt_rsc_0__6__INST.basename(), TLS_xt_rsc_triosy_0_6_lz, 6,
        4070, 32);
    transactor_xt.register_block(&xt_rsc_0__7__INST, xt_rsc_0__7__INST.basename(), TLS_xt_rsc_triosy_0_7_lz, 7,
        4071, 32);
    transactor_xt.register_block(&xt_rsc_0__8__INST, xt_rsc_0__8__INST.basename(), TLS_xt_rsc_triosy_0_8_lz, 8,
        4072, 32);
    transactor_xt.register_block(&xt_rsc_0__9__INST, xt_rsc_0__9__INST.basename(), TLS_xt_rsc_triosy_0_9_lz, 9,
        4073, 32);
    transactor_xt.register_block(&xt_rsc_0__10__INST, xt_rsc_0__10__INST.basename(), TLS_xt_rsc_triosy_0_10_lz,
        10, 4074, 32);
    transactor_xt.register_block(&xt_rsc_0__11__INST, xt_rsc_0__11__INST.basename(), TLS_xt_rsc_triosy_0_11_lz,
        11, 4075, 32);
    transactor_xt.register_block(&xt_rsc_0__12__INST, xt_rsc_0__12__INST.basename(), TLS_xt_rsc_triosy_0_12_lz,
        12, 4076, 32);
    transactor_xt.register_block(&xt_rsc_0__13__INST, xt_rsc_0__13__INST.basename(), TLS_xt_rsc_triosy_0_13_lz,
        13, 4077, 32);
    transactor_xt.register_block(&xt_rsc_0__14__INST, xt_rsc_0__14__INST.basename(), TLS_xt_rsc_triosy_0_14_lz,
        14, 4078, 32);
    transactor_xt.register_block(&xt_rsc_0__15__INST, xt_rsc_0__15__INST.basename(), TLS_xt_rsc_triosy_0_15_lz,
        15, 4079, 32);
    transactor_xt.register_block(&xt_rsc_0__16__INST, xt_rsc_0__16__INST.basename(), TLS_xt_rsc_triosy_0_16_lz,
        16, 4080, 32);
    transactor_xt.register_block(&xt_rsc_0__17__INST, xt_rsc_0__17__INST.basename(), TLS_xt_rsc_triosy_0_17_lz,
        17, 4081, 32);
    transactor_xt.register_block(&xt_rsc_0__18__INST, xt_rsc_0__18__INST.basename(), TLS_xt_rsc_triosy_0_18_lz,
        18, 4082, 32);
    transactor_xt.register_block(&xt_rsc_0__19__INST, xt_rsc_0__19__INST.basename(), TLS_xt_rsc_triosy_0_19_lz,
        19, 4083, 32);
    transactor_xt.register_block(&xt_rsc_0__20__INST, xt_rsc_0__20__INST.basename(), TLS_xt_rsc_triosy_0_20_lz,
        20, 4084, 32);
    transactor_xt.register_block(&xt_rsc_0__21__INST, xt_rsc_0__21__INST.basename(), TLS_xt_rsc_triosy_0_21_lz,
        21, 4085, 32);
    transactor_xt.register_block(&xt_rsc_0__22__INST, xt_rsc_0__22__INST.basename(), TLS_xt_rsc_triosy_0_22_lz,
        22, 4086, 32);
    transactor_xt.register_block(&xt_rsc_0__23__INST, xt_rsc_0__23__INST.basename(), TLS_xt_rsc_triosy_0_23_lz,
        23, 4087, 32);
    transactor_xt.register_block(&xt_rsc_0__24__INST, xt_rsc_0__24__INST.basename(), TLS_xt_rsc_triosy_0_24_lz,
        24, 4088, 32);
    transactor_xt.register_block(&xt_rsc_0__25__INST, xt_rsc_0__25__INST.basename(), TLS_xt_rsc_triosy_0_25_lz,
        25, 4089, 32);
    transactor_xt.register_block(&xt_rsc_0__26__INST, xt_rsc_0__26__INST.basename(), TLS_xt_rsc_triosy_0_26_lz,
        26, 4090, 32);
    transactor_xt.register_block(&xt_rsc_0__27__INST, xt_rsc_0__27__INST.basename(), TLS_xt_rsc_triosy_0_27_lz,
        27, 4091, 32);
    transactor_xt.register_block(&xt_rsc_0__28__INST, xt_rsc_0__28__INST.basename(), TLS_xt_rsc_triosy_0_28_lz,
        28, 4092, 32);
    transactor_xt.register_block(&xt_rsc_0__29__INST, xt_rsc_0__29__INST.basename(), TLS_xt_rsc_triosy_0_29_lz,
        29, 4093, 32);
    transactor_xt.register_block(&xt_rsc_0__30__INST, xt_rsc_0__30__INST.basename(), TLS_xt_rsc_triosy_0_30_lz,
        30, 4094, 32);
    transactor_xt.register_block(&xt_rsc_0__31__INST, xt_rsc_0__31__INST.basename(), TLS_xt_rsc_triosy_0_31_lz,
        31, 4095, 32);

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

    trios_monitor_twiddle_rsc_triosy_0_4_lz_INST.trios(TLS_twiddle_rsc_triosy_0_4_lz);
    trios_monitor_twiddle_rsc_triosy_0_4_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_5_lz_INST.trios(TLS_twiddle_rsc_triosy_0_5_lz);
    trios_monitor_twiddle_rsc_triosy_0_5_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_6_lz_INST.trios(TLS_twiddle_rsc_triosy_0_6_lz);
    trios_monitor_twiddle_rsc_triosy_0_6_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_7_lz_INST.trios(TLS_twiddle_rsc_triosy_0_7_lz);
    trios_monitor_twiddle_rsc_triosy_0_7_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_8_lz_INST.trios(TLS_twiddle_rsc_triosy_0_8_lz);
    trios_monitor_twiddle_rsc_triosy_0_8_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_9_lz_INST.trios(TLS_twiddle_rsc_triosy_0_9_lz);
    trios_monitor_twiddle_rsc_triosy_0_9_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_10_lz_INST.trios(TLS_twiddle_rsc_triosy_0_10_lz);
    trios_monitor_twiddle_rsc_triosy_0_10_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_11_lz_INST.trios(TLS_twiddle_rsc_triosy_0_11_lz);
    trios_monitor_twiddle_rsc_triosy_0_11_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_12_lz_INST.trios(TLS_twiddle_rsc_triosy_0_12_lz);
    trios_monitor_twiddle_rsc_triosy_0_12_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_13_lz_INST.trios(TLS_twiddle_rsc_triosy_0_13_lz);
    trios_monitor_twiddle_rsc_triosy_0_13_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_14_lz_INST.trios(TLS_twiddle_rsc_triosy_0_14_lz);
    trios_monitor_twiddle_rsc_triosy_0_14_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_15_lz_INST.trios(TLS_twiddle_rsc_triosy_0_15_lz);
    trios_monitor_twiddle_rsc_triosy_0_15_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_0__0__INST, twiddle_rsc_0__0__INST.basename(), TLS_twiddle_rsc_triosy_0_0_lz,
        0, 4080, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__1__INST, twiddle_rsc_0__1__INST.basename(), TLS_twiddle_rsc_triosy_0_1_lz,
        1, 4081, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__2__INST, twiddle_rsc_0__2__INST.basename(), TLS_twiddle_rsc_triosy_0_2_lz,
        2, 4082, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__3__INST, twiddle_rsc_0__3__INST.basename(), TLS_twiddle_rsc_triosy_0_3_lz,
        3, 4083, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__4__INST, twiddle_rsc_0__4__INST.basename(), TLS_twiddle_rsc_triosy_0_4_lz,
        4, 4084, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__5__INST, twiddle_rsc_0__5__INST.basename(), TLS_twiddle_rsc_triosy_0_5_lz,
        5, 4085, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__6__INST, twiddle_rsc_0__6__INST.basename(), TLS_twiddle_rsc_triosy_0_6_lz,
        6, 4086, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__7__INST, twiddle_rsc_0__7__INST.basename(), TLS_twiddle_rsc_triosy_0_7_lz,
        7, 4087, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__8__INST, twiddle_rsc_0__8__INST.basename(), TLS_twiddle_rsc_triosy_0_8_lz,
        8, 4088, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__9__INST, twiddle_rsc_0__9__INST.basename(), TLS_twiddle_rsc_triosy_0_9_lz,
        9, 4089, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__10__INST, twiddle_rsc_0__10__INST.basename(), TLS_twiddle_rsc_triosy_0_10_lz,
        10, 4090, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__11__INST, twiddle_rsc_0__11__INST.basename(), TLS_twiddle_rsc_triosy_0_11_lz,
        11, 4091, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__12__INST, twiddle_rsc_0__12__INST.basename(), TLS_twiddle_rsc_triosy_0_12_lz,
        12, 4092, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__13__INST, twiddle_rsc_0__13__INST.basename(), TLS_twiddle_rsc_triosy_0_13_lz,
        13, 4093, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__14__INST, twiddle_rsc_0__14__INST.basename(), TLS_twiddle_rsc_triosy_0_14_lz,
        14, 4094, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__15__INST, twiddle_rsc_0__15__INST.basename(), TLS_twiddle_rsc_triosy_0_15_lz,
        15, 4095, 16);

    trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_0_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_1_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_2_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_3_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_4_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_4_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_4_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_5_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_5_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_5_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_6_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_6_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_6_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_7_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_7_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_7_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_8_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_8_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_8_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_9_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_9_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_9_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_10_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_10_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_10_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_11_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_11_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_11_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_12_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_12_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_12_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_13_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_13_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_13_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_14_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_14_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_14_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_h_rsc_triosy_0_15_lz_INST.trios(TLS_twiddle_h_rsc_triosy_0_15_lz);
    trios_monitor_twiddle_h_rsc_triosy_0_15_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle_h.in_fifo(TLS_in_fifo_twiddle_h);
    transactor_twiddle_h.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle_h);
    transactor_twiddle_h.bind_clk(clk, true, rst);
    transactor_twiddle_h.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__0__INST, twiddle_h_rsc_0__0__INST.basename(), TLS_twiddle_h_rsc_triosy_0_0_lz,
        0, 4080, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__1__INST, twiddle_h_rsc_0__1__INST.basename(), TLS_twiddle_h_rsc_triosy_0_1_lz,
        1, 4081, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__2__INST, twiddle_h_rsc_0__2__INST.basename(), TLS_twiddle_h_rsc_triosy_0_2_lz,
        2, 4082, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__3__INST, twiddle_h_rsc_0__3__INST.basename(), TLS_twiddle_h_rsc_triosy_0_3_lz,
        3, 4083, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__4__INST, twiddle_h_rsc_0__4__INST.basename(), TLS_twiddle_h_rsc_triosy_0_4_lz,
        4, 4084, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__5__INST, twiddle_h_rsc_0__5__INST.basename(), TLS_twiddle_h_rsc_triosy_0_5_lz,
        5, 4085, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__6__INST, twiddle_h_rsc_0__6__INST.basename(), TLS_twiddle_h_rsc_triosy_0_6_lz,
        6, 4086, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__7__INST, twiddle_h_rsc_0__7__INST.basename(), TLS_twiddle_h_rsc_triosy_0_7_lz,
        7, 4087, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__8__INST, twiddle_h_rsc_0__8__INST.basename(), TLS_twiddle_h_rsc_triosy_0_8_lz,
        8, 4088, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__9__INST, twiddle_h_rsc_0__9__INST.basename(), TLS_twiddle_h_rsc_triosy_0_9_lz,
        9, 4089, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__10__INST, twiddle_h_rsc_0__10__INST.basename(), TLS_twiddle_h_rsc_triosy_0_10_lz,
        10, 4090, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__11__INST, twiddle_h_rsc_0__11__INST.basename(), TLS_twiddle_h_rsc_triosy_0_11_lz,
        11, 4091, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__12__INST, twiddle_h_rsc_0__12__INST.basename(), TLS_twiddle_h_rsc_triosy_0_12_lz,
        12, 4092, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__13__INST, twiddle_h_rsc_0__13__INST.basename(), TLS_twiddle_h_rsc_triosy_0_13_lz,
        13, 4093, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__14__INST, twiddle_h_rsc_0__14__INST.basename(), TLS_twiddle_h_rsc_triosy_0_14_lz,
        14, 4094, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__15__INST, twiddle_h_rsc_0__15__INST.basename(), TLS_twiddle_h_rsc_triosy_0_15_lz,
        15, 4095, 16);

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
  xt_rsc_0__8__INST.clear();
  xt_rsc_0__9__INST.clear();
  xt_rsc_0__10__INST.clear();
  xt_rsc_0__11__INST.clear();
  xt_rsc_0__12__INST.clear();
  xt_rsc_0__13__INST.clear();
  xt_rsc_0__14__INST.clear();
  xt_rsc_0__15__INST.clear();
  xt_rsc_0__16__INST.clear();
  xt_rsc_0__17__INST.clear();
  xt_rsc_0__18__INST.clear();
  xt_rsc_0__19__INST.clear();
  xt_rsc_0__20__INST.clear();
  xt_rsc_0__21__INST.clear();
  xt_rsc_0__22__INST.clear();
  xt_rsc_0__23__INST.clear();
  xt_rsc_0__24__INST.clear();
  xt_rsc_0__25__INST.clear();
  xt_rsc_0__26__INST.clear();
  xt_rsc_0__27__INST.clear();
  xt_rsc_0__28__INST.clear();
  xt_rsc_0__29__INST.clear();
  xt_rsc_0__30__INST.clear();
  xt_rsc_0__31__INST.clear();
  p_rsc_INST.clear();
  r_rsc_INST.clear();
  twiddle_rsc_0__0__INST.clear();
  twiddle_rsc_0__1__INST.clear();
  twiddle_rsc_0__2__INST.clear();
  twiddle_rsc_0__3__INST.clear();
  twiddle_rsc_0__4__INST.clear();
  twiddle_rsc_0__5__INST.clear();
  twiddle_rsc_0__6__INST.clear();
  twiddle_rsc_0__7__INST.clear();
  twiddle_rsc_0__8__INST.clear();
  twiddle_rsc_0__9__INST.clear();
  twiddle_rsc_0__10__INST.clear();
  twiddle_rsc_0__11__INST.clear();
  twiddle_rsc_0__12__INST.clear();
  twiddle_rsc_0__13__INST.clear();
  twiddle_rsc_0__14__INST.clear();
  twiddle_rsc_0__15__INST.clear();
  twiddle_h_rsc_0__0__INST.clear();
  twiddle_h_rsc_0__1__INST.clear();
  twiddle_h_rsc_0__2__INST.clear();
  twiddle_h_rsc_0__3__INST.clear();
  twiddle_h_rsc_0__4__INST.clear();
  twiddle_h_rsc_0__5__INST.clear();
  twiddle_h_rsc_0__6__INST.clear();
  twiddle_h_rsc_0__7__INST.clear();
  twiddle_h_rsc_0__8__INST.clear();
  twiddle_h_rsc_0__9__INST.clear();
  twiddle_h_rsc_0__10__INST.clear();
  twiddle_h_rsc_0__11__INST.clear();
  twiddle_h_rsc_0__12__INST.clear();
  twiddle_h_rsc_0__13__INST.clear();
  twiddle_h_rsc_0__14__INST.clear();
  twiddle_h_rsc_0__15__INST.clear();
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
