#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW_trans_rsc.h"
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
#define TOP_HDL_ENTITY inPlaceNTT_DIF
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_5;
extern double __scv_hold_time_RSCID_6;
extern double __scv_hold_time_RSCID_9;
extern double __scv_hold_time_RSCID_10;
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
extern double __scv_hold_time_RSCID_103;
extern double __scv_hold_time_RSCID_104;
extern double __scv_hold_time_RSCID_105;
extern double __scv_hold_time_RSCID_106;
extern double __scv_hold_time_RSCID_107;
extern double __scv_hold_time_RSCID_108;
extern double __scv_hold_time_RSCID_109;
extern double __scv_hold_time_RSCID_110;
extern double __scv_hold_time_RSCID_111;
extern double __scv_hold_time_RSCID_112;
extern double __scv_hold_time_RSCID_113;
extern double __scv_hold_time_RSCID_114;
extern double __scv_hold_time_RSCID_115;
extern double __scv_hold_time_RSCID_116;
extern double __scv_hold_time_RSCID_117;
extern double __scv_hold_time_RSCID_118;
extern double __scv_hold_time_RSCID_119;
extern double __scv_hold_time_RSCID_120;
extern double __scv_hold_time_RSCID_121;
extern double __scv_hold_time_RSCID_122;
extern double __scv_hold_time_RSCID_123;
extern double __scv_hold_time_RSCID_124;
extern double __scv_hold_time_RSCID_125;
extern double __scv_hold_time_RSCID_126;
extern double __scv_hold_time_RSCID_127;
extern double __scv_hold_time_RSCID_128;
extern double __scv_hold_time_RSCID_129;
extern double __scv_hold_time_RSCID_130;
extern double __scv_hold_time_RSCID_131;
extern double __scv_hold_time_RSCID_132;
extern double __scv_hold_time_RSCID_133;
extern double __scv_hold_time_RSCID_134;
extern double __scv_hold_time_RSCID_135;
extern double __scv_hold_time_RSCID_136;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_5 = 0;
double __scv_hold_time_RSCID_6 = 0;
double __scv_hold_time_RSCID_9 = 0;
double __scv_hold_time_RSCID_10 = 0;
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
double __scv_hold_time_RSCID_103 = 0;
double __scv_hold_time_RSCID_104 = 0;
double __scv_hold_time_RSCID_105 = 0;
double __scv_hold_time_RSCID_106 = 0;
double __scv_hold_time_RSCID_107 = 0;
double __scv_hold_time_RSCID_108 = 0;
double __scv_hold_time_RSCID_109 = 0;
double __scv_hold_time_RSCID_110 = 0;
double __scv_hold_time_RSCID_111 = 0;
double __scv_hold_time_RSCID_112 = 0;
double __scv_hold_time_RSCID_113 = 0;
double __scv_hold_time_RSCID_114 = 0;
double __scv_hold_time_RSCID_115 = 0;
double __scv_hold_time_RSCID_116 = 0;
double __scv_hold_time_RSCID_117 = 0;
double __scv_hold_time_RSCID_118 = 0;
double __scv_hold_time_RSCID_119 = 0;
double __scv_hold_time_RSCID_120 = 0;
double __scv_hold_time_RSCID_121 = 0;
double __scv_hold_time_RSCID_122 = 0;
double __scv_hold_time_RSCID_123 = 0;
double __scv_hold_time_RSCID_124 = 0;
double __scv_hold_time_RSCID_125 = 0;
double __scv_hold_time_RSCID_126 = 0;
double __scv_hold_time_RSCID_127 = 0;
double __scv_hold_time_RSCID_128 = 0;
double __scv_hold_time_RSCID_129 = 0;
double __scv_hold_time_RSCID_130 = 0;
double __scv_hold_time_RSCID_131 = 0;
double __scv_hold_time_RSCID_132 = 0;
double __scv_hold_time_RSCID_133 = 0;
double __scv_hold_time_RSCID_134 = 0;
double __scv_hold_time_RSCID_135 = 0;
double __scv_hold_time_RSCID_136 = 0;
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
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_0_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_0_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_0_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_1_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_1_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_1_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_2_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_2_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_2_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_3_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_3_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_3_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_4_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_4_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_4_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_5_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_5_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_5_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_6_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_6_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_6_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_7_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_7_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_7_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_8_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_8_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_8_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_8_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_8_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_9_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_9_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_9_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_9_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_9_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_10_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_10_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_10_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_10_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_10_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_11_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_11_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_11_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_11_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_11_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_12_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_12_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_12_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_12_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_12_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_13_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_13_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_13_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_13_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_13_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_14_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_14_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_14_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_14_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_14_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_15_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_15_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_15_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_15_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_15_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_16_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_16_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_16_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_16_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_16_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_16_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_17_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_17_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_17_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_17_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_17_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_17_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_18_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_18_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_18_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_18_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_18_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_18_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_19_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_19_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_19_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_19_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_19_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_19_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_20_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_20_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_20_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_20_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_20_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_20_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_21_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_21_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_21_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_21_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_21_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_21_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_22_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_22_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_22_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_22_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_22_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_22_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_23_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_23_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_23_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_23_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_23_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_23_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_24_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_24_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_24_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_24_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_24_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_24_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_25_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_25_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_25_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_25_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_25_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_25_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_26_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_26_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_26_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_26_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_26_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_26_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_27_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_27_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_27_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_27_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_27_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_27_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_28_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_28_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_28_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_28_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_28_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_28_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_29_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_29_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_29_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_29_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_29_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_29_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_30_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_30_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_30_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_30_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_30_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_30_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_31_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_31_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_31_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_31_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_31_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_31_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_32_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_32_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_32_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_32_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_32_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_32_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_33_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_33_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_33_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_33_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_33_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_33_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_34_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_34_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_34_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_34_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_34_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_34_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_35_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_35_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_35_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_35_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_35_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_35_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_36_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_36_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_36_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_36_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_36_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_36_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_37_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_37_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_37_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_37_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_37_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_37_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_38_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_38_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_38_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_38_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_38_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_38_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_39_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_39_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_39_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_39_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_39_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_39_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_40_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_40_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_40_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_40_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_40_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_40_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_41_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_41_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_41_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_41_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_41_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_41_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_42_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_42_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_42_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_42_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_42_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_42_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_43_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_43_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_43_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_43_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_43_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_43_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_44_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_44_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_44_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_44_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_44_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_44_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_45_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_45_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_45_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_45_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_45_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_45_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_46_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_46_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_46_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_46_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_46_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_46_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_47_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_47_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_47_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_47_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_47_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_47_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_48_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_48_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_48_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_48_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_48_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_48_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_49_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_49_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_49_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_49_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_49_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_49_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_50_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_50_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_50_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_50_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_50_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_50_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_51_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_51_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_51_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_51_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_51_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_51_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_52_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_52_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_52_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_52_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_52_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_52_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_53_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_53_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_53_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_53_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_53_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_53_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_54_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_54_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_54_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_54_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_54_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_54_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_55_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_55_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_55_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_55_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_55_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_55_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_56_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_56_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_56_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_56_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_56_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_56_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_57_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_57_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_57_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_57_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_57_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_57_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_58_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_58_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_58_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_58_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_58_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_58_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_59_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_59_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_59_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_59_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_59_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_59_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_60_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_60_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_60_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_60_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_60_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_60_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_61_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_61_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_61_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_61_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_61_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_61_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_62_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_62_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_62_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_62_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_62_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_62_lz;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_63_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_63_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_63_we;
  sc_signal<sc_lv<4> >                                                         TLS_vec_rsc_0_63_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_63_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_63_lz;
  sc_signal<sc_lv<64> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<64> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_0_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_1_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_2_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_3_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_4_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_4_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_5_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_5_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_6_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_6_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_7_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_7_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_8_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_8_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_9_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_9_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_10_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_10_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_11_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_11_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_12_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_12_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_13_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_13_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_14_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_14_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_15_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_15_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_16_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_16_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_16_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_17_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_17_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_17_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_18_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_18_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_18_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_19_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_19_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_19_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_20_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_20_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_20_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_21_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_21_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_21_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_22_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_22_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_22_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_23_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_23_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_23_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_24_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_24_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_24_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_25_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_25_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_25_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_26_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_26_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_26_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_27_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_27_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_27_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_28_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_28_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_28_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_29_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_29_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_29_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_30_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_30_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_30_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_31_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_31_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_31_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_32_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_32_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_32_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_33_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_33_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_33_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_34_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_34_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_34_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_35_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_35_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_35_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_36_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_36_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_36_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_37_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_37_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_37_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_38_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_38_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_38_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_39_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_39_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_39_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_40_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_40_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_40_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_41_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_41_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_41_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_42_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_42_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_42_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_43_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_43_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_43_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_44_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_44_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_44_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_45_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_45_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_45_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_46_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_46_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_46_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_47_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_47_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_47_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_48_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_48_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_48_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_49_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_49_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_49_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_50_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_50_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_50_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_51_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_51_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_51_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_52_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_52_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_52_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_53_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_53_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_53_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_54_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_54_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_54_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_55_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_55_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_55_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_56_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_56_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_56_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_57_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_57_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_57_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_58_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_58_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_58_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_59_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_59_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_59_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_60_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_60_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_60_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_61_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_61_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_61_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_62_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_62_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_62_lz;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0_63_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_63_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_63_lz;
  ccs_DUT_wrapper                                                              inPlaceNTT_DIF_INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__0__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__1__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__2__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__3__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__4__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__5__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__6__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__7__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__8__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__9__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__10__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__11__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__12__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__13__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__14__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__15__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__16__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__17__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__18__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__19__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__20__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__21__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__22__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__23__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__24__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__25__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__26__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__27__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__28__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__29__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__30__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__31__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__32__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__33__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__34__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__35__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__36__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__37__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__38__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__39__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__40__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__41__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__42__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__43__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__44__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__45__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__46__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__47__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__48__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__49__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__50__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__51__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__52__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__53__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__54__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__55__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__56__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__57__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__58__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__59__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__60__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__61__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__62__INST;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           vec_rsc_0__63__INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   r_rsc_INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__0__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__0__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__0__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__0__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__1__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__1__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__1__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__1__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__2__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__2__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__2__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__2__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__3__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__3__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__3__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__3__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__4__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__4__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__4__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__4__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__5__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__5__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__5__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__5__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__6__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__6__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__6__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__6__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__7__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__7__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__7__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__7__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__8__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__8__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__8__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__8__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__9__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__9__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__9__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__9__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__10__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__10__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__10__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__10__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__11__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__11__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__11__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__11__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__12__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__12__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__12__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__12__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__13__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__13__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__13__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__13__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__14__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__14__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__14__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__14__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__15__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__15__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__15__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__15__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__16__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__16__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__16__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__16__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__17__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__17__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__17__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__17__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__18__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__18__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__18__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__18__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__19__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__19__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__19__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__19__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__20__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__20__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__20__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__20__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__21__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__21__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__21__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__21__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__22__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__22__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__22__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__22__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__23__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__23__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__23__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__23__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__24__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__24__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__24__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__24__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__25__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__25__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__25__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__25__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__26__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__26__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__26__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__26__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__27__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__27__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__27__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__27__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__28__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__28__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__28__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__28__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__29__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__29__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__29__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__29__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__30__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__30__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__30__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__30__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__31__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__31__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__31__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__31__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__32__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__32__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__32__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__32__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__33__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__33__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__33__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__33__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__34__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__34__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__34__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__34__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__35__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__35__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__35__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__35__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__36__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__36__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__36__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__36__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__37__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__37__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__37__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__37__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__38__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__38__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__38__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__38__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__39__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__39__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__39__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__39__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__40__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__40__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__40__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__40__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__41__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__41__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__41__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__41__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__42__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__42__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__42__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__42__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__43__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__43__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__43__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__43__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__44__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__44__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__44__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__44__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__45__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__45__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__45__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__45__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__46__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__46__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__46__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__46__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__47__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__47__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__47__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__47__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__48__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__48__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__48__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__48__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__49__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__49__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__49__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__49__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__50__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__50__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__50__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__50__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__51__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__51__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__51__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__51__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__52__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__52__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__52__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__52__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__53__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__53__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__53__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__53__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__54__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__54__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__54__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__54__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__55__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__55__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__55__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__55__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__56__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__56__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__56__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__56__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__57__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__57__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__57__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__57__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__58__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__58__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__58__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__58__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__59__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__59__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__59__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__59__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__60__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__60__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__60__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__60__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__61__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__61__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__61__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__61__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__62__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__62__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__62__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__62__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__63__d;
  sc_signal<sc_lv<4> >                                                         TLS_twiddle_rsc_0__63__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__63__we;
  BLOCK_1R1W_RBW_trans_rsc<4,64,16 >                                           twiddle_rsc_0__63__INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_in_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_in_wait_ctrl_fifo_vec;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<64, false >,1024> >                TLS_out_fifo_vec;
  tlm::tlm_fifo<mc_wait_ctrl>                                                  TLS_out_wait_ctrl_fifo_vec;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_0_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_1_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_2_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_3_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_4_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_5_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_6_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_7_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_8_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_9_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_10_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_11_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_12_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_13_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_14_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_15_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_16_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_17_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_18_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_19_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_20_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_21_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_22_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_23_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_24_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_25_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_26_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_27_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_28_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_29_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_30_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_31_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_32_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_33_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_34_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_35_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_36_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_37_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_38_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_39_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_40_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_41_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_42_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_43_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_44_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_45_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_46_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_47_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_48_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_49_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_50_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_51_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_52_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_53_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_54_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_55_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_56_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_57_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_58_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_59_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_60_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_61_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_62_lz_INST;
  mc_trios_inout_monitor                                                       trios_monitor_vec_rsc_triosy_0_63_lz_INST;
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
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_16_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_17_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_18_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_19_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_20_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_21_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_22_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_23_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_24_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_25_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_26_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_27_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_28_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_29_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_30_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_31_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_32_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_33_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_34_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_35_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_36_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_37_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_38_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_39_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_40_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_41_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_42_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_43_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_44_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_45_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_46_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_47_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_48_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_49_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_50_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_51_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_52_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_53_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_54_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_55_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_56_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_57_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_58_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_59_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_60_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_61_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_62_lz_INST;
  mc_trios_input_monitor                                                       trios_monitor_twiddle_rsc_triosy_0_63_lz_INST;
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
    , TLS_vec_rsc_0_0_wadr("TLS_vec_rsc_0_0_wadr")
    , TLS_vec_rsc_0_0_d("TLS_vec_rsc_0_0_d")
    , TLS_vec_rsc_0_0_we("TLS_vec_rsc_0_0_we")
    , TLS_vec_rsc_0_0_radr("TLS_vec_rsc_0_0_radr")
    , TLS_vec_rsc_0_0_q("TLS_vec_rsc_0_0_q")
    , TLS_vec_rsc_triosy_0_0_lz("TLS_vec_rsc_triosy_0_0_lz")
    , TLS_vec_rsc_0_1_wadr("TLS_vec_rsc_0_1_wadr")
    , TLS_vec_rsc_0_1_d("TLS_vec_rsc_0_1_d")
    , TLS_vec_rsc_0_1_we("TLS_vec_rsc_0_1_we")
    , TLS_vec_rsc_0_1_radr("TLS_vec_rsc_0_1_radr")
    , TLS_vec_rsc_0_1_q("TLS_vec_rsc_0_1_q")
    , TLS_vec_rsc_triosy_0_1_lz("TLS_vec_rsc_triosy_0_1_lz")
    , TLS_vec_rsc_0_2_wadr("TLS_vec_rsc_0_2_wadr")
    , TLS_vec_rsc_0_2_d("TLS_vec_rsc_0_2_d")
    , TLS_vec_rsc_0_2_we("TLS_vec_rsc_0_2_we")
    , TLS_vec_rsc_0_2_radr("TLS_vec_rsc_0_2_radr")
    , TLS_vec_rsc_0_2_q("TLS_vec_rsc_0_2_q")
    , TLS_vec_rsc_triosy_0_2_lz("TLS_vec_rsc_triosy_0_2_lz")
    , TLS_vec_rsc_0_3_wadr("TLS_vec_rsc_0_3_wadr")
    , TLS_vec_rsc_0_3_d("TLS_vec_rsc_0_3_d")
    , TLS_vec_rsc_0_3_we("TLS_vec_rsc_0_3_we")
    , TLS_vec_rsc_0_3_radr("TLS_vec_rsc_0_3_radr")
    , TLS_vec_rsc_0_3_q("TLS_vec_rsc_0_3_q")
    , TLS_vec_rsc_triosy_0_3_lz("TLS_vec_rsc_triosy_0_3_lz")
    , TLS_vec_rsc_0_4_wadr("TLS_vec_rsc_0_4_wadr")
    , TLS_vec_rsc_0_4_d("TLS_vec_rsc_0_4_d")
    , TLS_vec_rsc_0_4_we("TLS_vec_rsc_0_4_we")
    , TLS_vec_rsc_0_4_radr("TLS_vec_rsc_0_4_radr")
    , TLS_vec_rsc_0_4_q("TLS_vec_rsc_0_4_q")
    , TLS_vec_rsc_triosy_0_4_lz("TLS_vec_rsc_triosy_0_4_lz")
    , TLS_vec_rsc_0_5_wadr("TLS_vec_rsc_0_5_wadr")
    , TLS_vec_rsc_0_5_d("TLS_vec_rsc_0_5_d")
    , TLS_vec_rsc_0_5_we("TLS_vec_rsc_0_5_we")
    , TLS_vec_rsc_0_5_radr("TLS_vec_rsc_0_5_radr")
    , TLS_vec_rsc_0_5_q("TLS_vec_rsc_0_5_q")
    , TLS_vec_rsc_triosy_0_5_lz("TLS_vec_rsc_triosy_0_5_lz")
    , TLS_vec_rsc_0_6_wadr("TLS_vec_rsc_0_6_wadr")
    , TLS_vec_rsc_0_6_d("TLS_vec_rsc_0_6_d")
    , TLS_vec_rsc_0_6_we("TLS_vec_rsc_0_6_we")
    , TLS_vec_rsc_0_6_radr("TLS_vec_rsc_0_6_radr")
    , TLS_vec_rsc_0_6_q("TLS_vec_rsc_0_6_q")
    , TLS_vec_rsc_triosy_0_6_lz("TLS_vec_rsc_triosy_0_6_lz")
    , TLS_vec_rsc_0_7_wadr("TLS_vec_rsc_0_7_wadr")
    , TLS_vec_rsc_0_7_d("TLS_vec_rsc_0_7_d")
    , TLS_vec_rsc_0_7_we("TLS_vec_rsc_0_7_we")
    , TLS_vec_rsc_0_7_radr("TLS_vec_rsc_0_7_radr")
    , TLS_vec_rsc_0_7_q("TLS_vec_rsc_0_7_q")
    , TLS_vec_rsc_triosy_0_7_lz("TLS_vec_rsc_triosy_0_7_lz")
    , TLS_vec_rsc_0_8_wadr("TLS_vec_rsc_0_8_wadr")
    , TLS_vec_rsc_0_8_d("TLS_vec_rsc_0_8_d")
    , TLS_vec_rsc_0_8_we("TLS_vec_rsc_0_8_we")
    , TLS_vec_rsc_0_8_radr("TLS_vec_rsc_0_8_radr")
    , TLS_vec_rsc_0_8_q("TLS_vec_rsc_0_8_q")
    , TLS_vec_rsc_triosy_0_8_lz("TLS_vec_rsc_triosy_0_8_lz")
    , TLS_vec_rsc_0_9_wadr("TLS_vec_rsc_0_9_wadr")
    , TLS_vec_rsc_0_9_d("TLS_vec_rsc_0_9_d")
    , TLS_vec_rsc_0_9_we("TLS_vec_rsc_0_9_we")
    , TLS_vec_rsc_0_9_radr("TLS_vec_rsc_0_9_radr")
    , TLS_vec_rsc_0_9_q("TLS_vec_rsc_0_9_q")
    , TLS_vec_rsc_triosy_0_9_lz("TLS_vec_rsc_triosy_0_9_lz")
    , TLS_vec_rsc_0_10_wadr("TLS_vec_rsc_0_10_wadr")
    , TLS_vec_rsc_0_10_d("TLS_vec_rsc_0_10_d")
    , TLS_vec_rsc_0_10_we("TLS_vec_rsc_0_10_we")
    , TLS_vec_rsc_0_10_radr("TLS_vec_rsc_0_10_radr")
    , TLS_vec_rsc_0_10_q("TLS_vec_rsc_0_10_q")
    , TLS_vec_rsc_triosy_0_10_lz("TLS_vec_rsc_triosy_0_10_lz")
    , TLS_vec_rsc_0_11_wadr("TLS_vec_rsc_0_11_wadr")
    , TLS_vec_rsc_0_11_d("TLS_vec_rsc_0_11_d")
    , TLS_vec_rsc_0_11_we("TLS_vec_rsc_0_11_we")
    , TLS_vec_rsc_0_11_radr("TLS_vec_rsc_0_11_radr")
    , TLS_vec_rsc_0_11_q("TLS_vec_rsc_0_11_q")
    , TLS_vec_rsc_triosy_0_11_lz("TLS_vec_rsc_triosy_0_11_lz")
    , TLS_vec_rsc_0_12_wadr("TLS_vec_rsc_0_12_wadr")
    , TLS_vec_rsc_0_12_d("TLS_vec_rsc_0_12_d")
    , TLS_vec_rsc_0_12_we("TLS_vec_rsc_0_12_we")
    , TLS_vec_rsc_0_12_radr("TLS_vec_rsc_0_12_radr")
    , TLS_vec_rsc_0_12_q("TLS_vec_rsc_0_12_q")
    , TLS_vec_rsc_triosy_0_12_lz("TLS_vec_rsc_triosy_0_12_lz")
    , TLS_vec_rsc_0_13_wadr("TLS_vec_rsc_0_13_wadr")
    , TLS_vec_rsc_0_13_d("TLS_vec_rsc_0_13_d")
    , TLS_vec_rsc_0_13_we("TLS_vec_rsc_0_13_we")
    , TLS_vec_rsc_0_13_radr("TLS_vec_rsc_0_13_radr")
    , TLS_vec_rsc_0_13_q("TLS_vec_rsc_0_13_q")
    , TLS_vec_rsc_triosy_0_13_lz("TLS_vec_rsc_triosy_0_13_lz")
    , TLS_vec_rsc_0_14_wadr("TLS_vec_rsc_0_14_wadr")
    , TLS_vec_rsc_0_14_d("TLS_vec_rsc_0_14_d")
    , TLS_vec_rsc_0_14_we("TLS_vec_rsc_0_14_we")
    , TLS_vec_rsc_0_14_radr("TLS_vec_rsc_0_14_radr")
    , TLS_vec_rsc_0_14_q("TLS_vec_rsc_0_14_q")
    , TLS_vec_rsc_triosy_0_14_lz("TLS_vec_rsc_triosy_0_14_lz")
    , TLS_vec_rsc_0_15_wadr("TLS_vec_rsc_0_15_wadr")
    , TLS_vec_rsc_0_15_d("TLS_vec_rsc_0_15_d")
    , TLS_vec_rsc_0_15_we("TLS_vec_rsc_0_15_we")
    , TLS_vec_rsc_0_15_radr("TLS_vec_rsc_0_15_radr")
    , TLS_vec_rsc_0_15_q("TLS_vec_rsc_0_15_q")
    , TLS_vec_rsc_triosy_0_15_lz("TLS_vec_rsc_triosy_0_15_lz")
    , TLS_vec_rsc_0_16_wadr("TLS_vec_rsc_0_16_wadr")
    , TLS_vec_rsc_0_16_d("TLS_vec_rsc_0_16_d")
    , TLS_vec_rsc_0_16_we("TLS_vec_rsc_0_16_we")
    , TLS_vec_rsc_0_16_radr("TLS_vec_rsc_0_16_radr")
    , TLS_vec_rsc_0_16_q("TLS_vec_rsc_0_16_q")
    , TLS_vec_rsc_triosy_0_16_lz("TLS_vec_rsc_triosy_0_16_lz")
    , TLS_vec_rsc_0_17_wadr("TLS_vec_rsc_0_17_wadr")
    , TLS_vec_rsc_0_17_d("TLS_vec_rsc_0_17_d")
    , TLS_vec_rsc_0_17_we("TLS_vec_rsc_0_17_we")
    , TLS_vec_rsc_0_17_radr("TLS_vec_rsc_0_17_radr")
    , TLS_vec_rsc_0_17_q("TLS_vec_rsc_0_17_q")
    , TLS_vec_rsc_triosy_0_17_lz("TLS_vec_rsc_triosy_0_17_lz")
    , TLS_vec_rsc_0_18_wadr("TLS_vec_rsc_0_18_wadr")
    , TLS_vec_rsc_0_18_d("TLS_vec_rsc_0_18_d")
    , TLS_vec_rsc_0_18_we("TLS_vec_rsc_0_18_we")
    , TLS_vec_rsc_0_18_radr("TLS_vec_rsc_0_18_radr")
    , TLS_vec_rsc_0_18_q("TLS_vec_rsc_0_18_q")
    , TLS_vec_rsc_triosy_0_18_lz("TLS_vec_rsc_triosy_0_18_lz")
    , TLS_vec_rsc_0_19_wadr("TLS_vec_rsc_0_19_wadr")
    , TLS_vec_rsc_0_19_d("TLS_vec_rsc_0_19_d")
    , TLS_vec_rsc_0_19_we("TLS_vec_rsc_0_19_we")
    , TLS_vec_rsc_0_19_radr("TLS_vec_rsc_0_19_radr")
    , TLS_vec_rsc_0_19_q("TLS_vec_rsc_0_19_q")
    , TLS_vec_rsc_triosy_0_19_lz("TLS_vec_rsc_triosy_0_19_lz")
    , TLS_vec_rsc_0_20_wadr("TLS_vec_rsc_0_20_wadr")
    , TLS_vec_rsc_0_20_d("TLS_vec_rsc_0_20_d")
    , TLS_vec_rsc_0_20_we("TLS_vec_rsc_0_20_we")
    , TLS_vec_rsc_0_20_radr("TLS_vec_rsc_0_20_radr")
    , TLS_vec_rsc_0_20_q("TLS_vec_rsc_0_20_q")
    , TLS_vec_rsc_triosy_0_20_lz("TLS_vec_rsc_triosy_0_20_lz")
    , TLS_vec_rsc_0_21_wadr("TLS_vec_rsc_0_21_wadr")
    , TLS_vec_rsc_0_21_d("TLS_vec_rsc_0_21_d")
    , TLS_vec_rsc_0_21_we("TLS_vec_rsc_0_21_we")
    , TLS_vec_rsc_0_21_radr("TLS_vec_rsc_0_21_radr")
    , TLS_vec_rsc_0_21_q("TLS_vec_rsc_0_21_q")
    , TLS_vec_rsc_triosy_0_21_lz("TLS_vec_rsc_triosy_0_21_lz")
    , TLS_vec_rsc_0_22_wadr("TLS_vec_rsc_0_22_wadr")
    , TLS_vec_rsc_0_22_d("TLS_vec_rsc_0_22_d")
    , TLS_vec_rsc_0_22_we("TLS_vec_rsc_0_22_we")
    , TLS_vec_rsc_0_22_radr("TLS_vec_rsc_0_22_radr")
    , TLS_vec_rsc_0_22_q("TLS_vec_rsc_0_22_q")
    , TLS_vec_rsc_triosy_0_22_lz("TLS_vec_rsc_triosy_0_22_lz")
    , TLS_vec_rsc_0_23_wadr("TLS_vec_rsc_0_23_wadr")
    , TLS_vec_rsc_0_23_d("TLS_vec_rsc_0_23_d")
    , TLS_vec_rsc_0_23_we("TLS_vec_rsc_0_23_we")
    , TLS_vec_rsc_0_23_radr("TLS_vec_rsc_0_23_radr")
    , TLS_vec_rsc_0_23_q("TLS_vec_rsc_0_23_q")
    , TLS_vec_rsc_triosy_0_23_lz("TLS_vec_rsc_triosy_0_23_lz")
    , TLS_vec_rsc_0_24_wadr("TLS_vec_rsc_0_24_wadr")
    , TLS_vec_rsc_0_24_d("TLS_vec_rsc_0_24_d")
    , TLS_vec_rsc_0_24_we("TLS_vec_rsc_0_24_we")
    , TLS_vec_rsc_0_24_radr("TLS_vec_rsc_0_24_radr")
    , TLS_vec_rsc_0_24_q("TLS_vec_rsc_0_24_q")
    , TLS_vec_rsc_triosy_0_24_lz("TLS_vec_rsc_triosy_0_24_lz")
    , TLS_vec_rsc_0_25_wadr("TLS_vec_rsc_0_25_wadr")
    , TLS_vec_rsc_0_25_d("TLS_vec_rsc_0_25_d")
    , TLS_vec_rsc_0_25_we("TLS_vec_rsc_0_25_we")
    , TLS_vec_rsc_0_25_radr("TLS_vec_rsc_0_25_radr")
    , TLS_vec_rsc_0_25_q("TLS_vec_rsc_0_25_q")
    , TLS_vec_rsc_triosy_0_25_lz("TLS_vec_rsc_triosy_0_25_lz")
    , TLS_vec_rsc_0_26_wadr("TLS_vec_rsc_0_26_wadr")
    , TLS_vec_rsc_0_26_d("TLS_vec_rsc_0_26_d")
    , TLS_vec_rsc_0_26_we("TLS_vec_rsc_0_26_we")
    , TLS_vec_rsc_0_26_radr("TLS_vec_rsc_0_26_radr")
    , TLS_vec_rsc_0_26_q("TLS_vec_rsc_0_26_q")
    , TLS_vec_rsc_triosy_0_26_lz("TLS_vec_rsc_triosy_0_26_lz")
    , TLS_vec_rsc_0_27_wadr("TLS_vec_rsc_0_27_wadr")
    , TLS_vec_rsc_0_27_d("TLS_vec_rsc_0_27_d")
    , TLS_vec_rsc_0_27_we("TLS_vec_rsc_0_27_we")
    , TLS_vec_rsc_0_27_radr("TLS_vec_rsc_0_27_radr")
    , TLS_vec_rsc_0_27_q("TLS_vec_rsc_0_27_q")
    , TLS_vec_rsc_triosy_0_27_lz("TLS_vec_rsc_triosy_0_27_lz")
    , TLS_vec_rsc_0_28_wadr("TLS_vec_rsc_0_28_wadr")
    , TLS_vec_rsc_0_28_d("TLS_vec_rsc_0_28_d")
    , TLS_vec_rsc_0_28_we("TLS_vec_rsc_0_28_we")
    , TLS_vec_rsc_0_28_radr("TLS_vec_rsc_0_28_radr")
    , TLS_vec_rsc_0_28_q("TLS_vec_rsc_0_28_q")
    , TLS_vec_rsc_triosy_0_28_lz("TLS_vec_rsc_triosy_0_28_lz")
    , TLS_vec_rsc_0_29_wadr("TLS_vec_rsc_0_29_wadr")
    , TLS_vec_rsc_0_29_d("TLS_vec_rsc_0_29_d")
    , TLS_vec_rsc_0_29_we("TLS_vec_rsc_0_29_we")
    , TLS_vec_rsc_0_29_radr("TLS_vec_rsc_0_29_radr")
    , TLS_vec_rsc_0_29_q("TLS_vec_rsc_0_29_q")
    , TLS_vec_rsc_triosy_0_29_lz("TLS_vec_rsc_triosy_0_29_lz")
    , TLS_vec_rsc_0_30_wadr("TLS_vec_rsc_0_30_wadr")
    , TLS_vec_rsc_0_30_d("TLS_vec_rsc_0_30_d")
    , TLS_vec_rsc_0_30_we("TLS_vec_rsc_0_30_we")
    , TLS_vec_rsc_0_30_radr("TLS_vec_rsc_0_30_radr")
    , TLS_vec_rsc_0_30_q("TLS_vec_rsc_0_30_q")
    , TLS_vec_rsc_triosy_0_30_lz("TLS_vec_rsc_triosy_0_30_lz")
    , TLS_vec_rsc_0_31_wadr("TLS_vec_rsc_0_31_wadr")
    , TLS_vec_rsc_0_31_d("TLS_vec_rsc_0_31_d")
    , TLS_vec_rsc_0_31_we("TLS_vec_rsc_0_31_we")
    , TLS_vec_rsc_0_31_radr("TLS_vec_rsc_0_31_radr")
    , TLS_vec_rsc_0_31_q("TLS_vec_rsc_0_31_q")
    , TLS_vec_rsc_triosy_0_31_lz("TLS_vec_rsc_triosy_0_31_lz")
    , TLS_vec_rsc_0_32_wadr("TLS_vec_rsc_0_32_wadr")
    , TLS_vec_rsc_0_32_d("TLS_vec_rsc_0_32_d")
    , TLS_vec_rsc_0_32_we("TLS_vec_rsc_0_32_we")
    , TLS_vec_rsc_0_32_radr("TLS_vec_rsc_0_32_radr")
    , TLS_vec_rsc_0_32_q("TLS_vec_rsc_0_32_q")
    , TLS_vec_rsc_triosy_0_32_lz("TLS_vec_rsc_triosy_0_32_lz")
    , TLS_vec_rsc_0_33_wadr("TLS_vec_rsc_0_33_wadr")
    , TLS_vec_rsc_0_33_d("TLS_vec_rsc_0_33_d")
    , TLS_vec_rsc_0_33_we("TLS_vec_rsc_0_33_we")
    , TLS_vec_rsc_0_33_radr("TLS_vec_rsc_0_33_radr")
    , TLS_vec_rsc_0_33_q("TLS_vec_rsc_0_33_q")
    , TLS_vec_rsc_triosy_0_33_lz("TLS_vec_rsc_triosy_0_33_lz")
    , TLS_vec_rsc_0_34_wadr("TLS_vec_rsc_0_34_wadr")
    , TLS_vec_rsc_0_34_d("TLS_vec_rsc_0_34_d")
    , TLS_vec_rsc_0_34_we("TLS_vec_rsc_0_34_we")
    , TLS_vec_rsc_0_34_radr("TLS_vec_rsc_0_34_radr")
    , TLS_vec_rsc_0_34_q("TLS_vec_rsc_0_34_q")
    , TLS_vec_rsc_triosy_0_34_lz("TLS_vec_rsc_triosy_0_34_lz")
    , TLS_vec_rsc_0_35_wadr("TLS_vec_rsc_0_35_wadr")
    , TLS_vec_rsc_0_35_d("TLS_vec_rsc_0_35_d")
    , TLS_vec_rsc_0_35_we("TLS_vec_rsc_0_35_we")
    , TLS_vec_rsc_0_35_radr("TLS_vec_rsc_0_35_radr")
    , TLS_vec_rsc_0_35_q("TLS_vec_rsc_0_35_q")
    , TLS_vec_rsc_triosy_0_35_lz("TLS_vec_rsc_triosy_0_35_lz")
    , TLS_vec_rsc_0_36_wadr("TLS_vec_rsc_0_36_wadr")
    , TLS_vec_rsc_0_36_d("TLS_vec_rsc_0_36_d")
    , TLS_vec_rsc_0_36_we("TLS_vec_rsc_0_36_we")
    , TLS_vec_rsc_0_36_radr("TLS_vec_rsc_0_36_radr")
    , TLS_vec_rsc_0_36_q("TLS_vec_rsc_0_36_q")
    , TLS_vec_rsc_triosy_0_36_lz("TLS_vec_rsc_triosy_0_36_lz")
    , TLS_vec_rsc_0_37_wadr("TLS_vec_rsc_0_37_wadr")
    , TLS_vec_rsc_0_37_d("TLS_vec_rsc_0_37_d")
    , TLS_vec_rsc_0_37_we("TLS_vec_rsc_0_37_we")
    , TLS_vec_rsc_0_37_radr("TLS_vec_rsc_0_37_radr")
    , TLS_vec_rsc_0_37_q("TLS_vec_rsc_0_37_q")
    , TLS_vec_rsc_triosy_0_37_lz("TLS_vec_rsc_triosy_0_37_lz")
    , TLS_vec_rsc_0_38_wadr("TLS_vec_rsc_0_38_wadr")
    , TLS_vec_rsc_0_38_d("TLS_vec_rsc_0_38_d")
    , TLS_vec_rsc_0_38_we("TLS_vec_rsc_0_38_we")
    , TLS_vec_rsc_0_38_radr("TLS_vec_rsc_0_38_radr")
    , TLS_vec_rsc_0_38_q("TLS_vec_rsc_0_38_q")
    , TLS_vec_rsc_triosy_0_38_lz("TLS_vec_rsc_triosy_0_38_lz")
    , TLS_vec_rsc_0_39_wadr("TLS_vec_rsc_0_39_wadr")
    , TLS_vec_rsc_0_39_d("TLS_vec_rsc_0_39_d")
    , TLS_vec_rsc_0_39_we("TLS_vec_rsc_0_39_we")
    , TLS_vec_rsc_0_39_radr("TLS_vec_rsc_0_39_radr")
    , TLS_vec_rsc_0_39_q("TLS_vec_rsc_0_39_q")
    , TLS_vec_rsc_triosy_0_39_lz("TLS_vec_rsc_triosy_0_39_lz")
    , TLS_vec_rsc_0_40_wadr("TLS_vec_rsc_0_40_wadr")
    , TLS_vec_rsc_0_40_d("TLS_vec_rsc_0_40_d")
    , TLS_vec_rsc_0_40_we("TLS_vec_rsc_0_40_we")
    , TLS_vec_rsc_0_40_radr("TLS_vec_rsc_0_40_radr")
    , TLS_vec_rsc_0_40_q("TLS_vec_rsc_0_40_q")
    , TLS_vec_rsc_triosy_0_40_lz("TLS_vec_rsc_triosy_0_40_lz")
    , TLS_vec_rsc_0_41_wadr("TLS_vec_rsc_0_41_wadr")
    , TLS_vec_rsc_0_41_d("TLS_vec_rsc_0_41_d")
    , TLS_vec_rsc_0_41_we("TLS_vec_rsc_0_41_we")
    , TLS_vec_rsc_0_41_radr("TLS_vec_rsc_0_41_radr")
    , TLS_vec_rsc_0_41_q("TLS_vec_rsc_0_41_q")
    , TLS_vec_rsc_triosy_0_41_lz("TLS_vec_rsc_triosy_0_41_lz")
    , TLS_vec_rsc_0_42_wadr("TLS_vec_rsc_0_42_wadr")
    , TLS_vec_rsc_0_42_d("TLS_vec_rsc_0_42_d")
    , TLS_vec_rsc_0_42_we("TLS_vec_rsc_0_42_we")
    , TLS_vec_rsc_0_42_radr("TLS_vec_rsc_0_42_radr")
    , TLS_vec_rsc_0_42_q("TLS_vec_rsc_0_42_q")
    , TLS_vec_rsc_triosy_0_42_lz("TLS_vec_rsc_triosy_0_42_lz")
    , TLS_vec_rsc_0_43_wadr("TLS_vec_rsc_0_43_wadr")
    , TLS_vec_rsc_0_43_d("TLS_vec_rsc_0_43_d")
    , TLS_vec_rsc_0_43_we("TLS_vec_rsc_0_43_we")
    , TLS_vec_rsc_0_43_radr("TLS_vec_rsc_0_43_radr")
    , TLS_vec_rsc_0_43_q("TLS_vec_rsc_0_43_q")
    , TLS_vec_rsc_triosy_0_43_lz("TLS_vec_rsc_triosy_0_43_lz")
    , TLS_vec_rsc_0_44_wadr("TLS_vec_rsc_0_44_wadr")
    , TLS_vec_rsc_0_44_d("TLS_vec_rsc_0_44_d")
    , TLS_vec_rsc_0_44_we("TLS_vec_rsc_0_44_we")
    , TLS_vec_rsc_0_44_radr("TLS_vec_rsc_0_44_radr")
    , TLS_vec_rsc_0_44_q("TLS_vec_rsc_0_44_q")
    , TLS_vec_rsc_triosy_0_44_lz("TLS_vec_rsc_triosy_0_44_lz")
    , TLS_vec_rsc_0_45_wadr("TLS_vec_rsc_0_45_wadr")
    , TLS_vec_rsc_0_45_d("TLS_vec_rsc_0_45_d")
    , TLS_vec_rsc_0_45_we("TLS_vec_rsc_0_45_we")
    , TLS_vec_rsc_0_45_radr("TLS_vec_rsc_0_45_radr")
    , TLS_vec_rsc_0_45_q("TLS_vec_rsc_0_45_q")
    , TLS_vec_rsc_triosy_0_45_lz("TLS_vec_rsc_triosy_0_45_lz")
    , TLS_vec_rsc_0_46_wadr("TLS_vec_rsc_0_46_wadr")
    , TLS_vec_rsc_0_46_d("TLS_vec_rsc_0_46_d")
    , TLS_vec_rsc_0_46_we("TLS_vec_rsc_0_46_we")
    , TLS_vec_rsc_0_46_radr("TLS_vec_rsc_0_46_radr")
    , TLS_vec_rsc_0_46_q("TLS_vec_rsc_0_46_q")
    , TLS_vec_rsc_triosy_0_46_lz("TLS_vec_rsc_triosy_0_46_lz")
    , TLS_vec_rsc_0_47_wadr("TLS_vec_rsc_0_47_wadr")
    , TLS_vec_rsc_0_47_d("TLS_vec_rsc_0_47_d")
    , TLS_vec_rsc_0_47_we("TLS_vec_rsc_0_47_we")
    , TLS_vec_rsc_0_47_radr("TLS_vec_rsc_0_47_radr")
    , TLS_vec_rsc_0_47_q("TLS_vec_rsc_0_47_q")
    , TLS_vec_rsc_triosy_0_47_lz("TLS_vec_rsc_triosy_0_47_lz")
    , TLS_vec_rsc_0_48_wadr("TLS_vec_rsc_0_48_wadr")
    , TLS_vec_rsc_0_48_d("TLS_vec_rsc_0_48_d")
    , TLS_vec_rsc_0_48_we("TLS_vec_rsc_0_48_we")
    , TLS_vec_rsc_0_48_radr("TLS_vec_rsc_0_48_radr")
    , TLS_vec_rsc_0_48_q("TLS_vec_rsc_0_48_q")
    , TLS_vec_rsc_triosy_0_48_lz("TLS_vec_rsc_triosy_0_48_lz")
    , TLS_vec_rsc_0_49_wadr("TLS_vec_rsc_0_49_wadr")
    , TLS_vec_rsc_0_49_d("TLS_vec_rsc_0_49_d")
    , TLS_vec_rsc_0_49_we("TLS_vec_rsc_0_49_we")
    , TLS_vec_rsc_0_49_radr("TLS_vec_rsc_0_49_radr")
    , TLS_vec_rsc_0_49_q("TLS_vec_rsc_0_49_q")
    , TLS_vec_rsc_triosy_0_49_lz("TLS_vec_rsc_triosy_0_49_lz")
    , TLS_vec_rsc_0_50_wadr("TLS_vec_rsc_0_50_wadr")
    , TLS_vec_rsc_0_50_d("TLS_vec_rsc_0_50_d")
    , TLS_vec_rsc_0_50_we("TLS_vec_rsc_0_50_we")
    , TLS_vec_rsc_0_50_radr("TLS_vec_rsc_0_50_radr")
    , TLS_vec_rsc_0_50_q("TLS_vec_rsc_0_50_q")
    , TLS_vec_rsc_triosy_0_50_lz("TLS_vec_rsc_triosy_0_50_lz")
    , TLS_vec_rsc_0_51_wadr("TLS_vec_rsc_0_51_wadr")
    , TLS_vec_rsc_0_51_d("TLS_vec_rsc_0_51_d")
    , TLS_vec_rsc_0_51_we("TLS_vec_rsc_0_51_we")
    , TLS_vec_rsc_0_51_radr("TLS_vec_rsc_0_51_radr")
    , TLS_vec_rsc_0_51_q("TLS_vec_rsc_0_51_q")
    , TLS_vec_rsc_triosy_0_51_lz("TLS_vec_rsc_triosy_0_51_lz")
    , TLS_vec_rsc_0_52_wadr("TLS_vec_rsc_0_52_wadr")
    , TLS_vec_rsc_0_52_d("TLS_vec_rsc_0_52_d")
    , TLS_vec_rsc_0_52_we("TLS_vec_rsc_0_52_we")
    , TLS_vec_rsc_0_52_radr("TLS_vec_rsc_0_52_radr")
    , TLS_vec_rsc_0_52_q("TLS_vec_rsc_0_52_q")
    , TLS_vec_rsc_triosy_0_52_lz("TLS_vec_rsc_triosy_0_52_lz")
    , TLS_vec_rsc_0_53_wadr("TLS_vec_rsc_0_53_wadr")
    , TLS_vec_rsc_0_53_d("TLS_vec_rsc_0_53_d")
    , TLS_vec_rsc_0_53_we("TLS_vec_rsc_0_53_we")
    , TLS_vec_rsc_0_53_radr("TLS_vec_rsc_0_53_radr")
    , TLS_vec_rsc_0_53_q("TLS_vec_rsc_0_53_q")
    , TLS_vec_rsc_triosy_0_53_lz("TLS_vec_rsc_triosy_0_53_lz")
    , TLS_vec_rsc_0_54_wadr("TLS_vec_rsc_0_54_wadr")
    , TLS_vec_rsc_0_54_d("TLS_vec_rsc_0_54_d")
    , TLS_vec_rsc_0_54_we("TLS_vec_rsc_0_54_we")
    , TLS_vec_rsc_0_54_radr("TLS_vec_rsc_0_54_radr")
    , TLS_vec_rsc_0_54_q("TLS_vec_rsc_0_54_q")
    , TLS_vec_rsc_triosy_0_54_lz("TLS_vec_rsc_triosy_0_54_lz")
    , TLS_vec_rsc_0_55_wadr("TLS_vec_rsc_0_55_wadr")
    , TLS_vec_rsc_0_55_d("TLS_vec_rsc_0_55_d")
    , TLS_vec_rsc_0_55_we("TLS_vec_rsc_0_55_we")
    , TLS_vec_rsc_0_55_radr("TLS_vec_rsc_0_55_radr")
    , TLS_vec_rsc_0_55_q("TLS_vec_rsc_0_55_q")
    , TLS_vec_rsc_triosy_0_55_lz("TLS_vec_rsc_triosy_0_55_lz")
    , TLS_vec_rsc_0_56_wadr("TLS_vec_rsc_0_56_wadr")
    , TLS_vec_rsc_0_56_d("TLS_vec_rsc_0_56_d")
    , TLS_vec_rsc_0_56_we("TLS_vec_rsc_0_56_we")
    , TLS_vec_rsc_0_56_radr("TLS_vec_rsc_0_56_radr")
    , TLS_vec_rsc_0_56_q("TLS_vec_rsc_0_56_q")
    , TLS_vec_rsc_triosy_0_56_lz("TLS_vec_rsc_triosy_0_56_lz")
    , TLS_vec_rsc_0_57_wadr("TLS_vec_rsc_0_57_wadr")
    , TLS_vec_rsc_0_57_d("TLS_vec_rsc_0_57_d")
    , TLS_vec_rsc_0_57_we("TLS_vec_rsc_0_57_we")
    , TLS_vec_rsc_0_57_radr("TLS_vec_rsc_0_57_radr")
    , TLS_vec_rsc_0_57_q("TLS_vec_rsc_0_57_q")
    , TLS_vec_rsc_triosy_0_57_lz("TLS_vec_rsc_triosy_0_57_lz")
    , TLS_vec_rsc_0_58_wadr("TLS_vec_rsc_0_58_wadr")
    , TLS_vec_rsc_0_58_d("TLS_vec_rsc_0_58_d")
    , TLS_vec_rsc_0_58_we("TLS_vec_rsc_0_58_we")
    , TLS_vec_rsc_0_58_radr("TLS_vec_rsc_0_58_radr")
    , TLS_vec_rsc_0_58_q("TLS_vec_rsc_0_58_q")
    , TLS_vec_rsc_triosy_0_58_lz("TLS_vec_rsc_triosy_0_58_lz")
    , TLS_vec_rsc_0_59_wadr("TLS_vec_rsc_0_59_wadr")
    , TLS_vec_rsc_0_59_d("TLS_vec_rsc_0_59_d")
    , TLS_vec_rsc_0_59_we("TLS_vec_rsc_0_59_we")
    , TLS_vec_rsc_0_59_radr("TLS_vec_rsc_0_59_radr")
    , TLS_vec_rsc_0_59_q("TLS_vec_rsc_0_59_q")
    , TLS_vec_rsc_triosy_0_59_lz("TLS_vec_rsc_triosy_0_59_lz")
    , TLS_vec_rsc_0_60_wadr("TLS_vec_rsc_0_60_wadr")
    , TLS_vec_rsc_0_60_d("TLS_vec_rsc_0_60_d")
    , TLS_vec_rsc_0_60_we("TLS_vec_rsc_0_60_we")
    , TLS_vec_rsc_0_60_radr("TLS_vec_rsc_0_60_radr")
    , TLS_vec_rsc_0_60_q("TLS_vec_rsc_0_60_q")
    , TLS_vec_rsc_triosy_0_60_lz("TLS_vec_rsc_triosy_0_60_lz")
    , TLS_vec_rsc_0_61_wadr("TLS_vec_rsc_0_61_wadr")
    , TLS_vec_rsc_0_61_d("TLS_vec_rsc_0_61_d")
    , TLS_vec_rsc_0_61_we("TLS_vec_rsc_0_61_we")
    , TLS_vec_rsc_0_61_radr("TLS_vec_rsc_0_61_radr")
    , TLS_vec_rsc_0_61_q("TLS_vec_rsc_0_61_q")
    , TLS_vec_rsc_triosy_0_61_lz("TLS_vec_rsc_triosy_0_61_lz")
    , TLS_vec_rsc_0_62_wadr("TLS_vec_rsc_0_62_wadr")
    , TLS_vec_rsc_0_62_d("TLS_vec_rsc_0_62_d")
    , TLS_vec_rsc_0_62_we("TLS_vec_rsc_0_62_we")
    , TLS_vec_rsc_0_62_radr("TLS_vec_rsc_0_62_radr")
    , TLS_vec_rsc_0_62_q("TLS_vec_rsc_0_62_q")
    , TLS_vec_rsc_triosy_0_62_lz("TLS_vec_rsc_triosy_0_62_lz")
    , TLS_vec_rsc_0_63_wadr("TLS_vec_rsc_0_63_wadr")
    , TLS_vec_rsc_0_63_d("TLS_vec_rsc_0_63_d")
    , TLS_vec_rsc_0_63_we("TLS_vec_rsc_0_63_we")
    , TLS_vec_rsc_0_63_radr("TLS_vec_rsc_0_63_radr")
    , TLS_vec_rsc_0_63_q("TLS_vec_rsc_0_63_q")
    , TLS_vec_rsc_triosy_0_63_lz("TLS_vec_rsc_triosy_0_63_lz")
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
    , TLS_twiddle_rsc_0_4_radr("TLS_twiddle_rsc_0_4_radr")
    , TLS_twiddle_rsc_0_4_q("TLS_twiddle_rsc_0_4_q")
    , TLS_twiddle_rsc_triosy_0_4_lz("TLS_twiddle_rsc_triosy_0_4_lz")
    , TLS_twiddle_rsc_0_5_radr("TLS_twiddle_rsc_0_5_radr")
    , TLS_twiddle_rsc_0_5_q("TLS_twiddle_rsc_0_5_q")
    , TLS_twiddle_rsc_triosy_0_5_lz("TLS_twiddle_rsc_triosy_0_5_lz")
    , TLS_twiddle_rsc_0_6_radr("TLS_twiddle_rsc_0_6_radr")
    , TLS_twiddle_rsc_0_6_q("TLS_twiddle_rsc_0_6_q")
    , TLS_twiddle_rsc_triosy_0_6_lz("TLS_twiddle_rsc_triosy_0_6_lz")
    , TLS_twiddle_rsc_0_7_radr("TLS_twiddle_rsc_0_7_radr")
    , TLS_twiddle_rsc_0_7_q("TLS_twiddle_rsc_0_7_q")
    , TLS_twiddle_rsc_triosy_0_7_lz("TLS_twiddle_rsc_triosy_0_7_lz")
    , TLS_twiddle_rsc_0_8_radr("TLS_twiddle_rsc_0_8_radr")
    , TLS_twiddle_rsc_0_8_q("TLS_twiddle_rsc_0_8_q")
    , TLS_twiddle_rsc_triosy_0_8_lz("TLS_twiddle_rsc_triosy_0_8_lz")
    , TLS_twiddle_rsc_0_9_radr("TLS_twiddle_rsc_0_9_radr")
    , TLS_twiddle_rsc_0_9_q("TLS_twiddle_rsc_0_9_q")
    , TLS_twiddle_rsc_triosy_0_9_lz("TLS_twiddle_rsc_triosy_0_9_lz")
    , TLS_twiddle_rsc_0_10_radr("TLS_twiddle_rsc_0_10_radr")
    , TLS_twiddle_rsc_0_10_q("TLS_twiddle_rsc_0_10_q")
    , TLS_twiddle_rsc_triosy_0_10_lz("TLS_twiddle_rsc_triosy_0_10_lz")
    , TLS_twiddle_rsc_0_11_radr("TLS_twiddle_rsc_0_11_radr")
    , TLS_twiddle_rsc_0_11_q("TLS_twiddle_rsc_0_11_q")
    , TLS_twiddle_rsc_triosy_0_11_lz("TLS_twiddle_rsc_triosy_0_11_lz")
    , TLS_twiddle_rsc_0_12_radr("TLS_twiddle_rsc_0_12_radr")
    , TLS_twiddle_rsc_0_12_q("TLS_twiddle_rsc_0_12_q")
    , TLS_twiddle_rsc_triosy_0_12_lz("TLS_twiddle_rsc_triosy_0_12_lz")
    , TLS_twiddle_rsc_0_13_radr("TLS_twiddle_rsc_0_13_radr")
    , TLS_twiddle_rsc_0_13_q("TLS_twiddle_rsc_0_13_q")
    , TLS_twiddle_rsc_triosy_0_13_lz("TLS_twiddle_rsc_triosy_0_13_lz")
    , TLS_twiddle_rsc_0_14_radr("TLS_twiddle_rsc_0_14_radr")
    , TLS_twiddle_rsc_0_14_q("TLS_twiddle_rsc_0_14_q")
    , TLS_twiddle_rsc_triosy_0_14_lz("TLS_twiddle_rsc_triosy_0_14_lz")
    , TLS_twiddle_rsc_0_15_radr("TLS_twiddle_rsc_0_15_radr")
    , TLS_twiddle_rsc_0_15_q("TLS_twiddle_rsc_0_15_q")
    , TLS_twiddle_rsc_triosy_0_15_lz("TLS_twiddle_rsc_triosy_0_15_lz")
    , TLS_twiddle_rsc_0_16_radr("TLS_twiddle_rsc_0_16_radr")
    , TLS_twiddle_rsc_0_16_q("TLS_twiddle_rsc_0_16_q")
    , TLS_twiddle_rsc_triosy_0_16_lz("TLS_twiddle_rsc_triosy_0_16_lz")
    , TLS_twiddle_rsc_0_17_radr("TLS_twiddle_rsc_0_17_radr")
    , TLS_twiddle_rsc_0_17_q("TLS_twiddle_rsc_0_17_q")
    , TLS_twiddle_rsc_triosy_0_17_lz("TLS_twiddle_rsc_triosy_0_17_lz")
    , TLS_twiddle_rsc_0_18_radr("TLS_twiddle_rsc_0_18_radr")
    , TLS_twiddle_rsc_0_18_q("TLS_twiddle_rsc_0_18_q")
    , TLS_twiddle_rsc_triosy_0_18_lz("TLS_twiddle_rsc_triosy_0_18_lz")
    , TLS_twiddle_rsc_0_19_radr("TLS_twiddle_rsc_0_19_radr")
    , TLS_twiddle_rsc_0_19_q("TLS_twiddle_rsc_0_19_q")
    , TLS_twiddle_rsc_triosy_0_19_lz("TLS_twiddle_rsc_triosy_0_19_lz")
    , TLS_twiddle_rsc_0_20_radr("TLS_twiddle_rsc_0_20_radr")
    , TLS_twiddle_rsc_0_20_q("TLS_twiddle_rsc_0_20_q")
    , TLS_twiddle_rsc_triosy_0_20_lz("TLS_twiddle_rsc_triosy_0_20_lz")
    , TLS_twiddle_rsc_0_21_radr("TLS_twiddle_rsc_0_21_radr")
    , TLS_twiddle_rsc_0_21_q("TLS_twiddle_rsc_0_21_q")
    , TLS_twiddle_rsc_triosy_0_21_lz("TLS_twiddle_rsc_triosy_0_21_lz")
    , TLS_twiddle_rsc_0_22_radr("TLS_twiddle_rsc_0_22_radr")
    , TLS_twiddle_rsc_0_22_q("TLS_twiddle_rsc_0_22_q")
    , TLS_twiddle_rsc_triosy_0_22_lz("TLS_twiddle_rsc_triosy_0_22_lz")
    , TLS_twiddle_rsc_0_23_radr("TLS_twiddle_rsc_0_23_radr")
    , TLS_twiddle_rsc_0_23_q("TLS_twiddle_rsc_0_23_q")
    , TLS_twiddle_rsc_triosy_0_23_lz("TLS_twiddle_rsc_triosy_0_23_lz")
    , TLS_twiddle_rsc_0_24_radr("TLS_twiddle_rsc_0_24_radr")
    , TLS_twiddle_rsc_0_24_q("TLS_twiddle_rsc_0_24_q")
    , TLS_twiddle_rsc_triosy_0_24_lz("TLS_twiddle_rsc_triosy_0_24_lz")
    , TLS_twiddle_rsc_0_25_radr("TLS_twiddle_rsc_0_25_radr")
    , TLS_twiddle_rsc_0_25_q("TLS_twiddle_rsc_0_25_q")
    , TLS_twiddle_rsc_triosy_0_25_lz("TLS_twiddle_rsc_triosy_0_25_lz")
    , TLS_twiddle_rsc_0_26_radr("TLS_twiddle_rsc_0_26_radr")
    , TLS_twiddle_rsc_0_26_q("TLS_twiddle_rsc_0_26_q")
    , TLS_twiddle_rsc_triosy_0_26_lz("TLS_twiddle_rsc_triosy_0_26_lz")
    , TLS_twiddle_rsc_0_27_radr("TLS_twiddle_rsc_0_27_radr")
    , TLS_twiddle_rsc_0_27_q("TLS_twiddle_rsc_0_27_q")
    , TLS_twiddle_rsc_triosy_0_27_lz("TLS_twiddle_rsc_triosy_0_27_lz")
    , TLS_twiddle_rsc_0_28_radr("TLS_twiddle_rsc_0_28_radr")
    , TLS_twiddle_rsc_0_28_q("TLS_twiddle_rsc_0_28_q")
    , TLS_twiddle_rsc_triosy_0_28_lz("TLS_twiddle_rsc_triosy_0_28_lz")
    , TLS_twiddle_rsc_0_29_radr("TLS_twiddle_rsc_0_29_radr")
    , TLS_twiddle_rsc_0_29_q("TLS_twiddle_rsc_0_29_q")
    , TLS_twiddle_rsc_triosy_0_29_lz("TLS_twiddle_rsc_triosy_0_29_lz")
    , TLS_twiddle_rsc_0_30_radr("TLS_twiddle_rsc_0_30_radr")
    , TLS_twiddle_rsc_0_30_q("TLS_twiddle_rsc_0_30_q")
    , TLS_twiddle_rsc_triosy_0_30_lz("TLS_twiddle_rsc_triosy_0_30_lz")
    , TLS_twiddle_rsc_0_31_radr("TLS_twiddle_rsc_0_31_radr")
    , TLS_twiddle_rsc_0_31_q("TLS_twiddle_rsc_0_31_q")
    , TLS_twiddle_rsc_triosy_0_31_lz("TLS_twiddle_rsc_triosy_0_31_lz")
    , TLS_twiddle_rsc_0_32_radr("TLS_twiddle_rsc_0_32_radr")
    , TLS_twiddle_rsc_0_32_q("TLS_twiddle_rsc_0_32_q")
    , TLS_twiddle_rsc_triosy_0_32_lz("TLS_twiddle_rsc_triosy_0_32_lz")
    , TLS_twiddle_rsc_0_33_radr("TLS_twiddle_rsc_0_33_radr")
    , TLS_twiddle_rsc_0_33_q("TLS_twiddle_rsc_0_33_q")
    , TLS_twiddle_rsc_triosy_0_33_lz("TLS_twiddle_rsc_triosy_0_33_lz")
    , TLS_twiddle_rsc_0_34_radr("TLS_twiddle_rsc_0_34_radr")
    , TLS_twiddle_rsc_0_34_q("TLS_twiddle_rsc_0_34_q")
    , TLS_twiddle_rsc_triosy_0_34_lz("TLS_twiddle_rsc_triosy_0_34_lz")
    , TLS_twiddle_rsc_0_35_radr("TLS_twiddle_rsc_0_35_radr")
    , TLS_twiddle_rsc_0_35_q("TLS_twiddle_rsc_0_35_q")
    , TLS_twiddle_rsc_triosy_0_35_lz("TLS_twiddle_rsc_triosy_0_35_lz")
    , TLS_twiddle_rsc_0_36_radr("TLS_twiddle_rsc_0_36_radr")
    , TLS_twiddle_rsc_0_36_q("TLS_twiddle_rsc_0_36_q")
    , TLS_twiddle_rsc_triosy_0_36_lz("TLS_twiddle_rsc_triosy_0_36_lz")
    , TLS_twiddle_rsc_0_37_radr("TLS_twiddle_rsc_0_37_radr")
    , TLS_twiddle_rsc_0_37_q("TLS_twiddle_rsc_0_37_q")
    , TLS_twiddle_rsc_triosy_0_37_lz("TLS_twiddle_rsc_triosy_0_37_lz")
    , TLS_twiddle_rsc_0_38_radr("TLS_twiddle_rsc_0_38_radr")
    , TLS_twiddle_rsc_0_38_q("TLS_twiddle_rsc_0_38_q")
    , TLS_twiddle_rsc_triosy_0_38_lz("TLS_twiddle_rsc_triosy_0_38_lz")
    , TLS_twiddle_rsc_0_39_radr("TLS_twiddle_rsc_0_39_radr")
    , TLS_twiddle_rsc_0_39_q("TLS_twiddle_rsc_0_39_q")
    , TLS_twiddle_rsc_triosy_0_39_lz("TLS_twiddle_rsc_triosy_0_39_lz")
    , TLS_twiddle_rsc_0_40_radr("TLS_twiddle_rsc_0_40_radr")
    , TLS_twiddle_rsc_0_40_q("TLS_twiddle_rsc_0_40_q")
    , TLS_twiddle_rsc_triosy_0_40_lz("TLS_twiddle_rsc_triosy_0_40_lz")
    , TLS_twiddle_rsc_0_41_radr("TLS_twiddle_rsc_0_41_radr")
    , TLS_twiddle_rsc_0_41_q("TLS_twiddle_rsc_0_41_q")
    , TLS_twiddle_rsc_triosy_0_41_lz("TLS_twiddle_rsc_triosy_0_41_lz")
    , TLS_twiddle_rsc_0_42_radr("TLS_twiddle_rsc_0_42_radr")
    , TLS_twiddle_rsc_0_42_q("TLS_twiddle_rsc_0_42_q")
    , TLS_twiddle_rsc_triosy_0_42_lz("TLS_twiddle_rsc_triosy_0_42_lz")
    , TLS_twiddle_rsc_0_43_radr("TLS_twiddle_rsc_0_43_radr")
    , TLS_twiddle_rsc_0_43_q("TLS_twiddle_rsc_0_43_q")
    , TLS_twiddle_rsc_triosy_0_43_lz("TLS_twiddle_rsc_triosy_0_43_lz")
    , TLS_twiddle_rsc_0_44_radr("TLS_twiddle_rsc_0_44_radr")
    , TLS_twiddle_rsc_0_44_q("TLS_twiddle_rsc_0_44_q")
    , TLS_twiddle_rsc_triosy_0_44_lz("TLS_twiddle_rsc_triosy_0_44_lz")
    , TLS_twiddle_rsc_0_45_radr("TLS_twiddle_rsc_0_45_radr")
    , TLS_twiddle_rsc_0_45_q("TLS_twiddle_rsc_0_45_q")
    , TLS_twiddle_rsc_triosy_0_45_lz("TLS_twiddle_rsc_triosy_0_45_lz")
    , TLS_twiddle_rsc_0_46_radr("TLS_twiddle_rsc_0_46_radr")
    , TLS_twiddle_rsc_0_46_q("TLS_twiddle_rsc_0_46_q")
    , TLS_twiddle_rsc_triosy_0_46_lz("TLS_twiddle_rsc_triosy_0_46_lz")
    , TLS_twiddle_rsc_0_47_radr("TLS_twiddle_rsc_0_47_radr")
    , TLS_twiddle_rsc_0_47_q("TLS_twiddle_rsc_0_47_q")
    , TLS_twiddle_rsc_triosy_0_47_lz("TLS_twiddle_rsc_triosy_0_47_lz")
    , TLS_twiddle_rsc_0_48_radr("TLS_twiddle_rsc_0_48_radr")
    , TLS_twiddle_rsc_0_48_q("TLS_twiddle_rsc_0_48_q")
    , TLS_twiddle_rsc_triosy_0_48_lz("TLS_twiddle_rsc_triosy_0_48_lz")
    , TLS_twiddle_rsc_0_49_radr("TLS_twiddle_rsc_0_49_radr")
    , TLS_twiddle_rsc_0_49_q("TLS_twiddle_rsc_0_49_q")
    , TLS_twiddle_rsc_triosy_0_49_lz("TLS_twiddle_rsc_triosy_0_49_lz")
    , TLS_twiddle_rsc_0_50_radr("TLS_twiddle_rsc_0_50_radr")
    , TLS_twiddle_rsc_0_50_q("TLS_twiddle_rsc_0_50_q")
    , TLS_twiddle_rsc_triosy_0_50_lz("TLS_twiddle_rsc_triosy_0_50_lz")
    , TLS_twiddle_rsc_0_51_radr("TLS_twiddle_rsc_0_51_radr")
    , TLS_twiddle_rsc_0_51_q("TLS_twiddle_rsc_0_51_q")
    , TLS_twiddle_rsc_triosy_0_51_lz("TLS_twiddle_rsc_triosy_0_51_lz")
    , TLS_twiddle_rsc_0_52_radr("TLS_twiddle_rsc_0_52_radr")
    , TLS_twiddle_rsc_0_52_q("TLS_twiddle_rsc_0_52_q")
    , TLS_twiddle_rsc_triosy_0_52_lz("TLS_twiddle_rsc_triosy_0_52_lz")
    , TLS_twiddle_rsc_0_53_radr("TLS_twiddle_rsc_0_53_radr")
    , TLS_twiddle_rsc_0_53_q("TLS_twiddle_rsc_0_53_q")
    , TLS_twiddle_rsc_triosy_0_53_lz("TLS_twiddle_rsc_triosy_0_53_lz")
    , TLS_twiddle_rsc_0_54_radr("TLS_twiddle_rsc_0_54_radr")
    , TLS_twiddle_rsc_0_54_q("TLS_twiddle_rsc_0_54_q")
    , TLS_twiddle_rsc_triosy_0_54_lz("TLS_twiddle_rsc_triosy_0_54_lz")
    , TLS_twiddle_rsc_0_55_radr("TLS_twiddle_rsc_0_55_radr")
    , TLS_twiddle_rsc_0_55_q("TLS_twiddle_rsc_0_55_q")
    , TLS_twiddle_rsc_triosy_0_55_lz("TLS_twiddle_rsc_triosy_0_55_lz")
    , TLS_twiddle_rsc_0_56_radr("TLS_twiddle_rsc_0_56_radr")
    , TLS_twiddle_rsc_0_56_q("TLS_twiddle_rsc_0_56_q")
    , TLS_twiddle_rsc_triosy_0_56_lz("TLS_twiddle_rsc_triosy_0_56_lz")
    , TLS_twiddle_rsc_0_57_radr("TLS_twiddle_rsc_0_57_radr")
    , TLS_twiddle_rsc_0_57_q("TLS_twiddle_rsc_0_57_q")
    , TLS_twiddle_rsc_triosy_0_57_lz("TLS_twiddle_rsc_triosy_0_57_lz")
    , TLS_twiddle_rsc_0_58_radr("TLS_twiddle_rsc_0_58_radr")
    , TLS_twiddle_rsc_0_58_q("TLS_twiddle_rsc_0_58_q")
    , TLS_twiddle_rsc_triosy_0_58_lz("TLS_twiddle_rsc_triosy_0_58_lz")
    , TLS_twiddle_rsc_0_59_radr("TLS_twiddle_rsc_0_59_radr")
    , TLS_twiddle_rsc_0_59_q("TLS_twiddle_rsc_0_59_q")
    , TLS_twiddle_rsc_triosy_0_59_lz("TLS_twiddle_rsc_triosy_0_59_lz")
    , TLS_twiddle_rsc_0_60_radr("TLS_twiddle_rsc_0_60_radr")
    , TLS_twiddle_rsc_0_60_q("TLS_twiddle_rsc_0_60_q")
    , TLS_twiddle_rsc_triosy_0_60_lz("TLS_twiddle_rsc_triosy_0_60_lz")
    , TLS_twiddle_rsc_0_61_radr("TLS_twiddle_rsc_0_61_radr")
    , TLS_twiddle_rsc_0_61_q("TLS_twiddle_rsc_0_61_q")
    , TLS_twiddle_rsc_triosy_0_61_lz("TLS_twiddle_rsc_triosy_0_61_lz")
    , TLS_twiddle_rsc_0_62_radr("TLS_twiddle_rsc_0_62_radr")
    , TLS_twiddle_rsc_0_62_q("TLS_twiddle_rsc_0_62_q")
    , TLS_twiddle_rsc_triosy_0_62_lz("TLS_twiddle_rsc_triosy_0_62_lz")
    , TLS_twiddle_rsc_0_63_radr("TLS_twiddle_rsc_0_63_radr")
    , TLS_twiddle_rsc_0_63_q("TLS_twiddle_rsc_0_63_q")
    , TLS_twiddle_rsc_triosy_0_63_lz("TLS_twiddle_rsc_triosy_0_63_lz")
    , inPlaceNTT_DIF_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , vec_rsc_0__0__INST("vec_rsc_0__0_", true)
    , vec_rsc_0__1__INST("vec_rsc_0__1_", true)
    , vec_rsc_0__2__INST("vec_rsc_0__2_", true)
    , vec_rsc_0__3__INST("vec_rsc_0__3_", true)
    , vec_rsc_0__4__INST("vec_rsc_0__4_", true)
    , vec_rsc_0__5__INST("vec_rsc_0__5_", true)
    , vec_rsc_0__6__INST("vec_rsc_0__6_", true)
    , vec_rsc_0__7__INST("vec_rsc_0__7_", true)
    , vec_rsc_0__8__INST("vec_rsc_0__8_", true)
    , vec_rsc_0__9__INST("vec_rsc_0__9_", true)
    , vec_rsc_0__10__INST("vec_rsc_0__10_", true)
    , vec_rsc_0__11__INST("vec_rsc_0__11_", true)
    , vec_rsc_0__12__INST("vec_rsc_0__12_", true)
    , vec_rsc_0__13__INST("vec_rsc_0__13_", true)
    , vec_rsc_0__14__INST("vec_rsc_0__14_", true)
    , vec_rsc_0__15__INST("vec_rsc_0__15_", true)
    , vec_rsc_0__16__INST("vec_rsc_0__16_", true)
    , vec_rsc_0__17__INST("vec_rsc_0__17_", true)
    , vec_rsc_0__18__INST("vec_rsc_0__18_", true)
    , vec_rsc_0__19__INST("vec_rsc_0__19_", true)
    , vec_rsc_0__20__INST("vec_rsc_0__20_", true)
    , vec_rsc_0__21__INST("vec_rsc_0__21_", true)
    , vec_rsc_0__22__INST("vec_rsc_0__22_", true)
    , vec_rsc_0__23__INST("vec_rsc_0__23_", true)
    , vec_rsc_0__24__INST("vec_rsc_0__24_", true)
    , vec_rsc_0__25__INST("vec_rsc_0__25_", true)
    , vec_rsc_0__26__INST("vec_rsc_0__26_", true)
    , vec_rsc_0__27__INST("vec_rsc_0__27_", true)
    , vec_rsc_0__28__INST("vec_rsc_0__28_", true)
    , vec_rsc_0__29__INST("vec_rsc_0__29_", true)
    , vec_rsc_0__30__INST("vec_rsc_0__30_", true)
    , vec_rsc_0__31__INST("vec_rsc_0__31_", true)
    , vec_rsc_0__32__INST("vec_rsc_0__32_", true)
    , vec_rsc_0__33__INST("vec_rsc_0__33_", true)
    , vec_rsc_0__34__INST("vec_rsc_0__34_", true)
    , vec_rsc_0__35__INST("vec_rsc_0__35_", true)
    , vec_rsc_0__36__INST("vec_rsc_0__36_", true)
    , vec_rsc_0__37__INST("vec_rsc_0__37_", true)
    , vec_rsc_0__38__INST("vec_rsc_0__38_", true)
    , vec_rsc_0__39__INST("vec_rsc_0__39_", true)
    , vec_rsc_0__40__INST("vec_rsc_0__40_", true)
    , vec_rsc_0__41__INST("vec_rsc_0__41_", true)
    , vec_rsc_0__42__INST("vec_rsc_0__42_", true)
    , vec_rsc_0__43__INST("vec_rsc_0__43_", true)
    , vec_rsc_0__44__INST("vec_rsc_0__44_", true)
    , vec_rsc_0__45__INST("vec_rsc_0__45_", true)
    , vec_rsc_0__46__INST("vec_rsc_0__46_", true)
    , vec_rsc_0__47__INST("vec_rsc_0__47_", true)
    , vec_rsc_0__48__INST("vec_rsc_0__48_", true)
    , vec_rsc_0__49__INST("vec_rsc_0__49_", true)
    , vec_rsc_0__50__INST("vec_rsc_0__50_", true)
    , vec_rsc_0__51__INST("vec_rsc_0__51_", true)
    , vec_rsc_0__52__INST("vec_rsc_0__52_", true)
    , vec_rsc_0__53__INST("vec_rsc_0__53_", true)
    , vec_rsc_0__54__INST("vec_rsc_0__54_", true)
    , vec_rsc_0__55__INST("vec_rsc_0__55_", true)
    , vec_rsc_0__56__INST("vec_rsc_0__56_", true)
    , vec_rsc_0__57__INST("vec_rsc_0__57_", true)
    , vec_rsc_0__58__INST("vec_rsc_0__58_", true)
    , vec_rsc_0__59__INST("vec_rsc_0__59_", true)
    , vec_rsc_0__60__INST("vec_rsc_0__60_", true)
    , vec_rsc_0__61__INST("vec_rsc_0__61_", true)
    , vec_rsc_0__62__INST("vec_rsc_0__62_", true)
    , vec_rsc_0__63__INST("vec_rsc_0__63_", true)
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
    , TLS_twiddle_rsc_0__4__d("TLS_twiddle_rsc_0__4__d")
    , TLS_twiddle_rsc_0__4__wadr("TLS_twiddle_rsc_0__4__wadr")
    , TLS_twiddle_rsc_0__4__we("TLS_twiddle_rsc_0__4__we")
    , twiddle_rsc_0__4__INST("twiddle_rsc_0__4_", true)
    , TLS_twiddle_rsc_0__5__d("TLS_twiddle_rsc_0__5__d")
    , TLS_twiddle_rsc_0__5__wadr("TLS_twiddle_rsc_0__5__wadr")
    , TLS_twiddle_rsc_0__5__we("TLS_twiddle_rsc_0__5__we")
    , twiddle_rsc_0__5__INST("twiddle_rsc_0__5_", true)
    , TLS_twiddle_rsc_0__6__d("TLS_twiddle_rsc_0__6__d")
    , TLS_twiddle_rsc_0__6__wadr("TLS_twiddle_rsc_0__6__wadr")
    , TLS_twiddle_rsc_0__6__we("TLS_twiddle_rsc_0__6__we")
    , twiddle_rsc_0__6__INST("twiddle_rsc_0__6_", true)
    , TLS_twiddle_rsc_0__7__d("TLS_twiddle_rsc_0__7__d")
    , TLS_twiddle_rsc_0__7__wadr("TLS_twiddle_rsc_0__7__wadr")
    , TLS_twiddle_rsc_0__7__we("TLS_twiddle_rsc_0__7__we")
    , twiddle_rsc_0__7__INST("twiddle_rsc_0__7_", true)
    , TLS_twiddle_rsc_0__8__d("TLS_twiddle_rsc_0__8__d")
    , TLS_twiddle_rsc_0__8__wadr("TLS_twiddle_rsc_0__8__wadr")
    , TLS_twiddle_rsc_0__8__we("TLS_twiddle_rsc_0__8__we")
    , twiddle_rsc_0__8__INST("twiddle_rsc_0__8_", true)
    , TLS_twiddle_rsc_0__9__d("TLS_twiddle_rsc_0__9__d")
    , TLS_twiddle_rsc_0__9__wadr("TLS_twiddle_rsc_0__9__wadr")
    , TLS_twiddle_rsc_0__9__we("TLS_twiddle_rsc_0__9__we")
    , twiddle_rsc_0__9__INST("twiddle_rsc_0__9_", true)
    , TLS_twiddle_rsc_0__10__d("TLS_twiddle_rsc_0__10__d")
    , TLS_twiddle_rsc_0__10__wadr("TLS_twiddle_rsc_0__10__wadr")
    , TLS_twiddle_rsc_0__10__we("TLS_twiddle_rsc_0__10__we")
    , twiddle_rsc_0__10__INST("twiddle_rsc_0__10_", true)
    , TLS_twiddle_rsc_0__11__d("TLS_twiddle_rsc_0__11__d")
    , TLS_twiddle_rsc_0__11__wadr("TLS_twiddle_rsc_0__11__wadr")
    , TLS_twiddle_rsc_0__11__we("TLS_twiddle_rsc_0__11__we")
    , twiddle_rsc_0__11__INST("twiddle_rsc_0__11_", true)
    , TLS_twiddle_rsc_0__12__d("TLS_twiddle_rsc_0__12__d")
    , TLS_twiddle_rsc_0__12__wadr("TLS_twiddle_rsc_0__12__wadr")
    , TLS_twiddle_rsc_0__12__we("TLS_twiddle_rsc_0__12__we")
    , twiddle_rsc_0__12__INST("twiddle_rsc_0__12_", true)
    , TLS_twiddle_rsc_0__13__d("TLS_twiddle_rsc_0__13__d")
    , TLS_twiddle_rsc_0__13__wadr("TLS_twiddle_rsc_0__13__wadr")
    , TLS_twiddle_rsc_0__13__we("TLS_twiddle_rsc_0__13__we")
    , twiddle_rsc_0__13__INST("twiddle_rsc_0__13_", true)
    , TLS_twiddle_rsc_0__14__d("TLS_twiddle_rsc_0__14__d")
    , TLS_twiddle_rsc_0__14__wadr("TLS_twiddle_rsc_0__14__wadr")
    , TLS_twiddle_rsc_0__14__we("TLS_twiddle_rsc_0__14__we")
    , twiddle_rsc_0__14__INST("twiddle_rsc_0__14_", true)
    , TLS_twiddle_rsc_0__15__d("TLS_twiddle_rsc_0__15__d")
    , TLS_twiddle_rsc_0__15__wadr("TLS_twiddle_rsc_0__15__wadr")
    , TLS_twiddle_rsc_0__15__we("TLS_twiddle_rsc_0__15__we")
    , twiddle_rsc_0__15__INST("twiddle_rsc_0__15_", true)
    , TLS_twiddle_rsc_0__16__d("TLS_twiddle_rsc_0__16__d")
    , TLS_twiddle_rsc_0__16__wadr("TLS_twiddle_rsc_0__16__wadr")
    , TLS_twiddle_rsc_0__16__we("TLS_twiddle_rsc_0__16__we")
    , twiddle_rsc_0__16__INST("twiddle_rsc_0__16_", true)
    , TLS_twiddle_rsc_0__17__d("TLS_twiddle_rsc_0__17__d")
    , TLS_twiddle_rsc_0__17__wadr("TLS_twiddle_rsc_0__17__wadr")
    , TLS_twiddle_rsc_0__17__we("TLS_twiddle_rsc_0__17__we")
    , twiddle_rsc_0__17__INST("twiddle_rsc_0__17_", true)
    , TLS_twiddle_rsc_0__18__d("TLS_twiddle_rsc_0__18__d")
    , TLS_twiddle_rsc_0__18__wadr("TLS_twiddle_rsc_0__18__wadr")
    , TLS_twiddle_rsc_0__18__we("TLS_twiddle_rsc_0__18__we")
    , twiddle_rsc_0__18__INST("twiddle_rsc_0__18_", true)
    , TLS_twiddle_rsc_0__19__d("TLS_twiddle_rsc_0__19__d")
    , TLS_twiddle_rsc_0__19__wadr("TLS_twiddle_rsc_0__19__wadr")
    , TLS_twiddle_rsc_0__19__we("TLS_twiddle_rsc_0__19__we")
    , twiddle_rsc_0__19__INST("twiddle_rsc_0__19_", true)
    , TLS_twiddle_rsc_0__20__d("TLS_twiddle_rsc_0__20__d")
    , TLS_twiddle_rsc_0__20__wadr("TLS_twiddle_rsc_0__20__wadr")
    , TLS_twiddle_rsc_0__20__we("TLS_twiddle_rsc_0__20__we")
    , twiddle_rsc_0__20__INST("twiddle_rsc_0__20_", true)
    , TLS_twiddle_rsc_0__21__d("TLS_twiddle_rsc_0__21__d")
    , TLS_twiddle_rsc_0__21__wadr("TLS_twiddle_rsc_0__21__wadr")
    , TLS_twiddle_rsc_0__21__we("TLS_twiddle_rsc_0__21__we")
    , twiddle_rsc_0__21__INST("twiddle_rsc_0__21_", true)
    , TLS_twiddle_rsc_0__22__d("TLS_twiddle_rsc_0__22__d")
    , TLS_twiddle_rsc_0__22__wadr("TLS_twiddle_rsc_0__22__wadr")
    , TLS_twiddle_rsc_0__22__we("TLS_twiddle_rsc_0__22__we")
    , twiddle_rsc_0__22__INST("twiddle_rsc_0__22_", true)
    , TLS_twiddle_rsc_0__23__d("TLS_twiddle_rsc_0__23__d")
    , TLS_twiddle_rsc_0__23__wadr("TLS_twiddle_rsc_0__23__wadr")
    , TLS_twiddle_rsc_0__23__we("TLS_twiddle_rsc_0__23__we")
    , twiddle_rsc_0__23__INST("twiddle_rsc_0__23_", true)
    , TLS_twiddle_rsc_0__24__d("TLS_twiddle_rsc_0__24__d")
    , TLS_twiddle_rsc_0__24__wadr("TLS_twiddle_rsc_0__24__wadr")
    , TLS_twiddle_rsc_0__24__we("TLS_twiddle_rsc_0__24__we")
    , twiddle_rsc_0__24__INST("twiddle_rsc_0__24_", true)
    , TLS_twiddle_rsc_0__25__d("TLS_twiddle_rsc_0__25__d")
    , TLS_twiddle_rsc_0__25__wadr("TLS_twiddle_rsc_0__25__wadr")
    , TLS_twiddle_rsc_0__25__we("TLS_twiddle_rsc_0__25__we")
    , twiddle_rsc_0__25__INST("twiddle_rsc_0__25_", true)
    , TLS_twiddle_rsc_0__26__d("TLS_twiddle_rsc_0__26__d")
    , TLS_twiddle_rsc_0__26__wadr("TLS_twiddle_rsc_0__26__wadr")
    , TLS_twiddle_rsc_0__26__we("TLS_twiddle_rsc_0__26__we")
    , twiddle_rsc_0__26__INST("twiddle_rsc_0__26_", true)
    , TLS_twiddle_rsc_0__27__d("TLS_twiddle_rsc_0__27__d")
    , TLS_twiddle_rsc_0__27__wadr("TLS_twiddle_rsc_0__27__wadr")
    , TLS_twiddle_rsc_0__27__we("TLS_twiddle_rsc_0__27__we")
    , twiddle_rsc_0__27__INST("twiddle_rsc_0__27_", true)
    , TLS_twiddle_rsc_0__28__d("TLS_twiddle_rsc_0__28__d")
    , TLS_twiddle_rsc_0__28__wadr("TLS_twiddle_rsc_0__28__wadr")
    , TLS_twiddle_rsc_0__28__we("TLS_twiddle_rsc_0__28__we")
    , twiddle_rsc_0__28__INST("twiddle_rsc_0__28_", true)
    , TLS_twiddle_rsc_0__29__d("TLS_twiddle_rsc_0__29__d")
    , TLS_twiddle_rsc_0__29__wadr("TLS_twiddle_rsc_0__29__wadr")
    , TLS_twiddle_rsc_0__29__we("TLS_twiddle_rsc_0__29__we")
    , twiddle_rsc_0__29__INST("twiddle_rsc_0__29_", true)
    , TLS_twiddle_rsc_0__30__d("TLS_twiddle_rsc_0__30__d")
    , TLS_twiddle_rsc_0__30__wadr("TLS_twiddle_rsc_0__30__wadr")
    , TLS_twiddle_rsc_0__30__we("TLS_twiddle_rsc_0__30__we")
    , twiddle_rsc_0__30__INST("twiddle_rsc_0__30_", true)
    , TLS_twiddle_rsc_0__31__d("TLS_twiddle_rsc_0__31__d")
    , TLS_twiddle_rsc_0__31__wadr("TLS_twiddle_rsc_0__31__wadr")
    , TLS_twiddle_rsc_0__31__we("TLS_twiddle_rsc_0__31__we")
    , twiddle_rsc_0__31__INST("twiddle_rsc_0__31_", true)
    , TLS_twiddle_rsc_0__32__d("TLS_twiddle_rsc_0__32__d")
    , TLS_twiddle_rsc_0__32__wadr("TLS_twiddle_rsc_0__32__wadr")
    , TLS_twiddle_rsc_0__32__we("TLS_twiddle_rsc_0__32__we")
    , twiddle_rsc_0__32__INST("twiddle_rsc_0__32_", true)
    , TLS_twiddle_rsc_0__33__d("TLS_twiddle_rsc_0__33__d")
    , TLS_twiddle_rsc_0__33__wadr("TLS_twiddle_rsc_0__33__wadr")
    , TLS_twiddle_rsc_0__33__we("TLS_twiddle_rsc_0__33__we")
    , twiddle_rsc_0__33__INST("twiddle_rsc_0__33_", true)
    , TLS_twiddle_rsc_0__34__d("TLS_twiddle_rsc_0__34__d")
    , TLS_twiddle_rsc_0__34__wadr("TLS_twiddle_rsc_0__34__wadr")
    , TLS_twiddle_rsc_0__34__we("TLS_twiddle_rsc_0__34__we")
    , twiddle_rsc_0__34__INST("twiddle_rsc_0__34_", true)
    , TLS_twiddle_rsc_0__35__d("TLS_twiddle_rsc_0__35__d")
    , TLS_twiddle_rsc_0__35__wadr("TLS_twiddle_rsc_0__35__wadr")
    , TLS_twiddle_rsc_0__35__we("TLS_twiddle_rsc_0__35__we")
    , twiddle_rsc_0__35__INST("twiddle_rsc_0__35_", true)
    , TLS_twiddle_rsc_0__36__d("TLS_twiddle_rsc_0__36__d")
    , TLS_twiddle_rsc_0__36__wadr("TLS_twiddle_rsc_0__36__wadr")
    , TLS_twiddle_rsc_0__36__we("TLS_twiddle_rsc_0__36__we")
    , twiddle_rsc_0__36__INST("twiddle_rsc_0__36_", true)
    , TLS_twiddle_rsc_0__37__d("TLS_twiddle_rsc_0__37__d")
    , TLS_twiddle_rsc_0__37__wadr("TLS_twiddle_rsc_0__37__wadr")
    , TLS_twiddle_rsc_0__37__we("TLS_twiddle_rsc_0__37__we")
    , twiddle_rsc_0__37__INST("twiddle_rsc_0__37_", true)
    , TLS_twiddle_rsc_0__38__d("TLS_twiddle_rsc_0__38__d")
    , TLS_twiddle_rsc_0__38__wadr("TLS_twiddle_rsc_0__38__wadr")
    , TLS_twiddle_rsc_0__38__we("TLS_twiddle_rsc_0__38__we")
    , twiddle_rsc_0__38__INST("twiddle_rsc_0__38_", true)
    , TLS_twiddle_rsc_0__39__d("TLS_twiddle_rsc_0__39__d")
    , TLS_twiddle_rsc_0__39__wadr("TLS_twiddle_rsc_0__39__wadr")
    , TLS_twiddle_rsc_0__39__we("TLS_twiddle_rsc_0__39__we")
    , twiddle_rsc_0__39__INST("twiddle_rsc_0__39_", true)
    , TLS_twiddle_rsc_0__40__d("TLS_twiddle_rsc_0__40__d")
    , TLS_twiddle_rsc_0__40__wadr("TLS_twiddle_rsc_0__40__wadr")
    , TLS_twiddle_rsc_0__40__we("TLS_twiddle_rsc_0__40__we")
    , twiddle_rsc_0__40__INST("twiddle_rsc_0__40_", true)
    , TLS_twiddle_rsc_0__41__d("TLS_twiddle_rsc_0__41__d")
    , TLS_twiddle_rsc_0__41__wadr("TLS_twiddle_rsc_0__41__wadr")
    , TLS_twiddle_rsc_0__41__we("TLS_twiddle_rsc_0__41__we")
    , twiddle_rsc_0__41__INST("twiddle_rsc_0__41_", true)
    , TLS_twiddle_rsc_0__42__d("TLS_twiddle_rsc_0__42__d")
    , TLS_twiddle_rsc_0__42__wadr("TLS_twiddle_rsc_0__42__wadr")
    , TLS_twiddle_rsc_0__42__we("TLS_twiddle_rsc_0__42__we")
    , twiddle_rsc_0__42__INST("twiddle_rsc_0__42_", true)
    , TLS_twiddle_rsc_0__43__d("TLS_twiddle_rsc_0__43__d")
    , TLS_twiddle_rsc_0__43__wadr("TLS_twiddle_rsc_0__43__wadr")
    , TLS_twiddle_rsc_0__43__we("TLS_twiddle_rsc_0__43__we")
    , twiddle_rsc_0__43__INST("twiddle_rsc_0__43_", true)
    , TLS_twiddle_rsc_0__44__d("TLS_twiddle_rsc_0__44__d")
    , TLS_twiddle_rsc_0__44__wadr("TLS_twiddle_rsc_0__44__wadr")
    , TLS_twiddle_rsc_0__44__we("TLS_twiddle_rsc_0__44__we")
    , twiddle_rsc_0__44__INST("twiddle_rsc_0__44_", true)
    , TLS_twiddle_rsc_0__45__d("TLS_twiddle_rsc_0__45__d")
    , TLS_twiddle_rsc_0__45__wadr("TLS_twiddle_rsc_0__45__wadr")
    , TLS_twiddle_rsc_0__45__we("TLS_twiddle_rsc_0__45__we")
    , twiddle_rsc_0__45__INST("twiddle_rsc_0__45_", true)
    , TLS_twiddle_rsc_0__46__d("TLS_twiddle_rsc_0__46__d")
    , TLS_twiddle_rsc_0__46__wadr("TLS_twiddle_rsc_0__46__wadr")
    , TLS_twiddle_rsc_0__46__we("TLS_twiddle_rsc_0__46__we")
    , twiddle_rsc_0__46__INST("twiddle_rsc_0__46_", true)
    , TLS_twiddle_rsc_0__47__d("TLS_twiddle_rsc_0__47__d")
    , TLS_twiddle_rsc_0__47__wadr("TLS_twiddle_rsc_0__47__wadr")
    , TLS_twiddle_rsc_0__47__we("TLS_twiddle_rsc_0__47__we")
    , twiddle_rsc_0__47__INST("twiddle_rsc_0__47_", true)
    , TLS_twiddle_rsc_0__48__d("TLS_twiddle_rsc_0__48__d")
    , TLS_twiddle_rsc_0__48__wadr("TLS_twiddle_rsc_0__48__wadr")
    , TLS_twiddle_rsc_0__48__we("TLS_twiddle_rsc_0__48__we")
    , twiddle_rsc_0__48__INST("twiddle_rsc_0__48_", true)
    , TLS_twiddle_rsc_0__49__d("TLS_twiddle_rsc_0__49__d")
    , TLS_twiddle_rsc_0__49__wadr("TLS_twiddle_rsc_0__49__wadr")
    , TLS_twiddle_rsc_0__49__we("TLS_twiddle_rsc_0__49__we")
    , twiddle_rsc_0__49__INST("twiddle_rsc_0__49_", true)
    , TLS_twiddle_rsc_0__50__d("TLS_twiddle_rsc_0__50__d")
    , TLS_twiddle_rsc_0__50__wadr("TLS_twiddle_rsc_0__50__wadr")
    , TLS_twiddle_rsc_0__50__we("TLS_twiddle_rsc_0__50__we")
    , twiddle_rsc_0__50__INST("twiddle_rsc_0__50_", true)
    , TLS_twiddle_rsc_0__51__d("TLS_twiddle_rsc_0__51__d")
    , TLS_twiddle_rsc_0__51__wadr("TLS_twiddle_rsc_0__51__wadr")
    , TLS_twiddle_rsc_0__51__we("TLS_twiddle_rsc_0__51__we")
    , twiddle_rsc_0__51__INST("twiddle_rsc_0__51_", true)
    , TLS_twiddle_rsc_0__52__d("TLS_twiddle_rsc_0__52__d")
    , TLS_twiddle_rsc_0__52__wadr("TLS_twiddle_rsc_0__52__wadr")
    , TLS_twiddle_rsc_0__52__we("TLS_twiddle_rsc_0__52__we")
    , twiddle_rsc_0__52__INST("twiddle_rsc_0__52_", true)
    , TLS_twiddle_rsc_0__53__d("TLS_twiddle_rsc_0__53__d")
    , TLS_twiddle_rsc_0__53__wadr("TLS_twiddle_rsc_0__53__wadr")
    , TLS_twiddle_rsc_0__53__we("TLS_twiddle_rsc_0__53__we")
    , twiddle_rsc_0__53__INST("twiddle_rsc_0__53_", true)
    , TLS_twiddle_rsc_0__54__d("TLS_twiddle_rsc_0__54__d")
    , TLS_twiddle_rsc_0__54__wadr("TLS_twiddle_rsc_0__54__wadr")
    , TLS_twiddle_rsc_0__54__we("TLS_twiddle_rsc_0__54__we")
    , twiddle_rsc_0__54__INST("twiddle_rsc_0__54_", true)
    , TLS_twiddle_rsc_0__55__d("TLS_twiddle_rsc_0__55__d")
    , TLS_twiddle_rsc_0__55__wadr("TLS_twiddle_rsc_0__55__wadr")
    , TLS_twiddle_rsc_0__55__we("TLS_twiddle_rsc_0__55__we")
    , twiddle_rsc_0__55__INST("twiddle_rsc_0__55_", true)
    , TLS_twiddle_rsc_0__56__d("TLS_twiddle_rsc_0__56__d")
    , TLS_twiddle_rsc_0__56__wadr("TLS_twiddle_rsc_0__56__wadr")
    , TLS_twiddle_rsc_0__56__we("TLS_twiddle_rsc_0__56__we")
    , twiddle_rsc_0__56__INST("twiddle_rsc_0__56_", true)
    , TLS_twiddle_rsc_0__57__d("TLS_twiddle_rsc_0__57__d")
    , TLS_twiddle_rsc_0__57__wadr("TLS_twiddle_rsc_0__57__wadr")
    , TLS_twiddle_rsc_0__57__we("TLS_twiddle_rsc_0__57__we")
    , twiddle_rsc_0__57__INST("twiddle_rsc_0__57_", true)
    , TLS_twiddle_rsc_0__58__d("TLS_twiddle_rsc_0__58__d")
    , TLS_twiddle_rsc_0__58__wadr("TLS_twiddle_rsc_0__58__wadr")
    , TLS_twiddle_rsc_0__58__we("TLS_twiddle_rsc_0__58__we")
    , twiddle_rsc_0__58__INST("twiddle_rsc_0__58_", true)
    , TLS_twiddle_rsc_0__59__d("TLS_twiddle_rsc_0__59__d")
    , TLS_twiddle_rsc_0__59__wadr("TLS_twiddle_rsc_0__59__wadr")
    , TLS_twiddle_rsc_0__59__we("TLS_twiddle_rsc_0__59__we")
    , twiddle_rsc_0__59__INST("twiddle_rsc_0__59_", true)
    , TLS_twiddle_rsc_0__60__d("TLS_twiddle_rsc_0__60__d")
    , TLS_twiddle_rsc_0__60__wadr("TLS_twiddle_rsc_0__60__wadr")
    , TLS_twiddle_rsc_0__60__we("TLS_twiddle_rsc_0__60__we")
    , twiddle_rsc_0__60__INST("twiddle_rsc_0__60_", true)
    , TLS_twiddle_rsc_0__61__d("TLS_twiddle_rsc_0__61__d")
    , TLS_twiddle_rsc_0__61__wadr("TLS_twiddle_rsc_0__61__wadr")
    , TLS_twiddle_rsc_0__61__we("TLS_twiddle_rsc_0__61__we")
    , twiddle_rsc_0__61__INST("twiddle_rsc_0__61_", true)
    , TLS_twiddle_rsc_0__62__d("TLS_twiddle_rsc_0__62__d")
    , TLS_twiddle_rsc_0__62__wadr("TLS_twiddle_rsc_0__62__wadr")
    , TLS_twiddle_rsc_0__62__we("TLS_twiddle_rsc_0__62__we")
    , twiddle_rsc_0__62__INST("twiddle_rsc_0__62_", true)
    , TLS_twiddle_rsc_0__63__d("TLS_twiddle_rsc_0__63__d")
    , TLS_twiddle_rsc_0__63__wadr("TLS_twiddle_rsc_0__63__wadr")
    , TLS_twiddle_rsc_0__63__we("TLS_twiddle_rsc_0__63__we")
    , twiddle_rsc_0__63__INST("twiddle_rsc_0__63_", true)
    , TLS_in_fifo_vec("TLS_in_fifo_vec", -1)
    , TLS_in_wait_ctrl_fifo_vec("TLS_in_wait_ctrl_fifo_vec", -1)
    , TLS_out_fifo_vec("TLS_out_fifo_vec", -1)
    , TLS_out_wait_ctrl_fifo_vec("TLS_out_wait_ctrl_fifo_vec", -1)
    , trios_monitor_vec_rsc_triosy_0_0_lz_INST("trios_monitor_vec_rsc_triosy_0_0_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_1_lz_INST("trios_monitor_vec_rsc_triosy_0_1_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_2_lz_INST("trios_monitor_vec_rsc_triosy_0_2_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_3_lz_INST("trios_monitor_vec_rsc_triosy_0_3_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_4_lz_INST("trios_monitor_vec_rsc_triosy_0_4_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_5_lz_INST("trios_monitor_vec_rsc_triosy_0_5_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_6_lz_INST("trios_monitor_vec_rsc_triosy_0_6_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_7_lz_INST("trios_monitor_vec_rsc_triosy_0_7_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_8_lz_INST("trios_monitor_vec_rsc_triosy_0_8_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_9_lz_INST("trios_monitor_vec_rsc_triosy_0_9_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_10_lz_INST("trios_monitor_vec_rsc_triosy_0_10_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_11_lz_INST("trios_monitor_vec_rsc_triosy_0_11_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_12_lz_INST("trios_monitor_vec_rsc_triosy_0_12_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_13_lz_INST("trios_monitor_vec_rsc_triosy_0_13_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_14_lz_INST("trios_monitor_vec_rsc_triosy_0_14_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_15_lz_INST("trios_monitor_vec_rsc_triosy_0_15_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_16_lz_INST("trios_monitor_vec_rsc_triosy_0_16_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_17_lz_INST("trios_monitor_vec_rsc_triosy_0_17_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_18_lz_INST("trios_monitor_vec_rsc_triosy_0_18_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_19_lz_INST("trios_monitor_vec_rsc_triosy_0_19_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_20_lz_INST("trios_monitor_vec_rsc_triosy_0_20_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_21_lz_INST("trios_monitor_vec_rsc_triosy_0_21_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_22_lz_INST("trios_monitor_vec_rsc_triosy_0_22_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_23_lz_INST("trios_monitor_vec_rsc_triosy_0_23_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_24_lz_INST("trios_monitor_vec_rsc_triosy_0_24_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_25_lz_INST("trios_monitor_vec_rsc_triosy_0_25_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_26_lz_INST("trios_monitor_vec_rsc_triosy_0_26_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_27_lz_INST("trios_monitor_vec_rsc_triosy_0_27_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_28_lz_INST("trios_monitor_vec_rsc_triosy_0_28_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_29_lz_INST("trios_monitor_vec_rsc_triosy_0_29_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_30_lz_INST("trios_monitor_vec_rsc_triosy_0_30_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_31_lz_INST("trios_monitor_vec_rsc_triosy_0_31_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_32_lz_INST("trios_monitor_vec_rsc_triosy_0_32_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_33_lz_INST("trios_monitor_vec_rsc_triosy_0_33_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_34_lz_INST("trios_monitor_vec_rsc_triosy_0_34_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_35_lz_INST("trios_monitor_vec_rsc_triosy_0_35_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_36_lz_INST("trios_monitor_vec_rsc_triosy_0_36_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_37_lz_INST("trios_monitor_vec_rsc_triosy_0_37_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_38_lz_INST("trios_monitor_vec_rsc_triosy_0_38_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_39_lz_INST("trios_monitor_vec_rsc_triosy_0_39_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_40_lz_INST("trios_monitor_vec_rsc_triosy_0_40_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_41_lz_INST("trios_monitor_vec_rsc_triosy_0_41_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_42_lz_INST("trios_monitor_vec_rsc_triosy_0_42_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_43_lz_INST("trios_monitor_vec_rsc_triosy_0_43_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_44_lz_INST("trios_monitor_vec_rsc_triosy_0_44_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_45_lz_INST("trios_monitor_vec_rsc_triosy_0_45_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_46_lz_INST("trios_monitor_vec_rsc_triosy_0_46_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_47_lz_INST("trios_monitor_vec_rsc_triosy_0_47_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_48_lz_INST("trios_monitor_vec_rsc_triosy_0_48_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_49_lz_INST("trios_monitor_vec_rsc_triosy_0_49_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_50_lz_INST("trios_monitor_vec_rsc_triosy_0_50_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_51_lz_INST("trios_monitor_vec_rsc_triosy_0_51_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_52_lz_INST("trios_monitor_vec_rsc_triosy_0_52_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_53_lz_INST("trios_monitor_vec_rsc_triosy_0_53_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_54_lz_INST("trios_monitor_vec_rsc_triosy_0_54_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_55_lz_INST("trios_monitor_vec_rsc_triosy_0_55_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_56_lz_INST("trios_monitor_vec_rsc_triosy_0_56_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_57_lz_INST("trios_monitor_vec_rsc_triosy_0_57_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_58_lz_INST("trios_monitor_vec_rsc_triosy_0_58_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_59_lz_INST("trios_monitor_vec_rsc_triosy_0_59_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_60_lz_INST("trios_monitor_vec_rsc_triosy_0_60_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_61_lz_INST("trios_monitor_vec_rsc_triosy_0_61_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_62_lz_INST("trios_monitor_vec_rsc_triosy_0_62_lz_INST")
    , trios_monitor_vec_rsc_triosy_0_63_lz_INST("trios_monitor_vec_rsc_triosy_0_63_lz_INST")
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
    , trios_monitor_twiddle_rsc_triosy_0_16_lz_INST("trios_monitor_twiddle_rsc_triosy_0_16_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_17_lz_INST("trios_monitor_twiddle_rsc_triosy_0_17_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_18_lz_INST("trios_monitor_twiddle_rsc_triosy_0_18_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_19_lz_INST("trios_monitor_twiddle_rsc_triosy_0_19_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_20_lz_INST("trios_monitor_twiddle_rsc_triosy_0_20_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_21_lz_INST("trios_monitor_twiddle_rsc_triosy_0_21_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_22_lz_INST("trios_monitor_twiddle_rsc_triosy_0_22_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_23_lz_INST("trios_monitor_twiddle_rsc_triosy_0_23_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_24_lz_INST("trios_monitor_twiddle_rsc_triosy_0_24_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_25_lz_INST("trios_monitor_twiddle_rsc_triosy_0_25_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_26_lz_INST("trios_monitor_twiddle_rsc_triosy_0_26_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_27_lz_INST("trios_monitor_twiddle_rsc_triosy_0_27_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_28_lz_INST("trios_monitor_twiddle_rsc_triosy_0_28_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_29_lz_INST("trios_monitor_twiddle_rsc_triosy_0_29_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_30_lz_INST("trios_monitor_twiddle_rsc_triosy_0_30_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_31_lz_INST("trios_monitor_twiddle_rsc_triosy_0_31_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_32_lz_INST("trios_monitor_twiddle_rsc_triosy_0_32_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_33_lz_INST("trios_monitor_twiddle_rsc_triosy_0_33_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_34_lz_INST("trios_monitor_twiddle_rsc_triosy_0_34_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_35_lz_INST("trios_monitor_twiddle_rsc_triosy_0_35_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_36_lz_INST("trios_monitor_twiddle_rsc_triosy_0_36_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_37_lz_INST("trios_monitor_twiddle_rsc_triosy_0_37_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_38_lz_INST("trios_monitor_twiddle_rsc_triosy_0_38_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_39_lz_INST("trios_monitor_twiddle_rsc_triosy_0_39_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_40_lz_INST("trios_monitor_twiddle_rsc_triosy_0_40_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_41_lz_INST("trios_monitor_twiddle_rsc_triosy_0_41_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_42_lz_INST("trios_monitor_twiddle_rsc_triosy_0_42_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_43_lz_INST("trios_monitor_twiddle_rsc_triosy_0_43_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_44_lz_INST("trios_monitor_twiddle_rsc_triosy_0_44_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_45_lz_INST("trios_monitor_twiddle_rsc_triosy_0_45_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_46_lz_INST("trios_monitor_twiddle_rsc_triosy_0_46_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_47_lz_INST("trios_monitor_twiddle_rsc_triosy_0_47_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_48_lz_INST("trios_monitor_twiddle_rsc_triosy_0_48_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_49_lz_INST("trios_monitor_twiddle_rsc_triosy_0_49_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_50_lz_INST("trios_monitor_twiddle_rsc_triosy_0_50_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_51_lz_INST("trios_monitor_twiddle_rsc_triosy_0_51_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_52_lz_INST("trios_monitor_twiddle_rsc_triosy_0_52_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_53_lz_INST("trios_monitor_twiddle_rsc_triosy_0_53_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_54_lz_INST("trios_monitor_twiddle_rsc_triosy_0_54_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_55_lz_INST("trios_monitor_twiddle_rsc_triosy_0_55_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_56_lz_INST("trios_monitor_twiddle_rsc_triosy_0_56_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_57_lz_INST("trios_monitor_twiddle_rsc_triosy_0_57_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_58_lz_INST("trios_monitor_twiddle_rsc_triosy_0_58_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_59_lz_INST("trios_monitor_twiddle_rsc_triosy_0_59_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_60_lz_INST("trios_monitor_twiddle_rsc_triosy_0_60_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_61_lz_INST("trios_monitor_twiddle_rsc_triosy_0_61_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_62_lz_INST("trios_monitor_twiddle_rsc_triosy_0_62_lz_INST")
    , trios_monitor_twiddle_rsc_triosy_0_63_lz_INST("trios_monitor_twiddle_rsc_triosy_0_63_lz_INST")
    , transactor_twiddle("transactor_twiddle", 0, 64, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 290282, 290282, 0)
    , catapult_monitor_INST("Monitor", clk, true, 290282LL, 290282LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    inPlaceNTT_DIF_INST.clk(clk);
    inPlaceNTT_DIF_INST.rst(TLS_rst);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_wadr(TLS_vec_rsc_0_0_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_d(TLS_vec_rsc_0_0_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_we(TLS_vec_rsc_0_0_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_radr(TLS_vec_rsc_0_0_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_0_q(TLS_vec_rsc_0_0_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_0_lz(TLS_vec_rsc_triosy_0_0_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_wadr(TLS_vec_rsc_0_1_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_d(TLS_vec_rsc_0_1_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_we(TLS_vec_rsc_0_1_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_radr(TLS_vec_rsc_0_1_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_1_q(TLS_vec_rsc_0_1_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_1_lz(TLS_vec_rsc_triosy_0_1_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_wadr(TLS_vec_rsc_0_2_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_d(TLS_vec_rsc_0_2_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_we(TLS_vec_rsc_0_2_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_radr(TLS_vec_rsc_0_2_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_2_q(TLS_vec_rsc_0_2_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_2_lz(TLS_vec_rsc_triosy_0_2_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_wadr(TLS_vec_rsc_0_3_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_d(TLS_vec_rsc_0_3_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_we(TLS_vec_rsc_0_3_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_radr(TLS_vec_rsc_0_3_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_3_q(TLS_vec_rsc_0_3_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_3_lz(TLS_vec_rsc_triosy_0_3_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_wadr(TLS_vec_rsc_0_4_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_d(TLS_vec_rsc_0_4_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_we(TLS_vec_rsc_0_4_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_radr(TLS_vec_rsc_0_4_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_4_q(TLS_vec_rsc_0_4_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_4_lz(TLS_vec_rsc_triosy_0_4_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_wadr(TLS_vec_rsc_0_5_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_d(TLS_vec_rsc_0_5_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_we(TLS_vec_rsc_0_5_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_radr(TLS_vec_rsc_0_5_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_5_q(TLS_vec_rsc_0_5_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_5_lz(TLS_vec_rsc_triosy_0_5_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_wadr(TLS_vec_rsc_0_6_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_d(TLS_vec_rsc_0_6_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_we(TLS_vec_rsc_0_6_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_radr(TLS_vec_rsc_0_6_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_6_q(TLS_vec_rsc_0_6_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_6_lz(TLS_vec_rsc_triosy_0_6_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_wadr(TLS_vec_rsc_0_7_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_d(TLS_vec_rsc_0_7_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_we(TLS_vec_rsc_0_7_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_radr(TLS_vec_rsc_0_7_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_7_q(TLS_vec_rsc_0_7_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_7_lz(TLS_vec_rsc_triosy_0_7_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_8_wadr(TLS_vec_rsc_0_8_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_8_d(TLS_vec_rsc_0_8_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_8_we(TLS_vec_rsc_0_8_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_8_radr(TLS_vec_rsc_0_8_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_8_q(TLS_vec_rsc_0_8_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_8_lz(TLS_vec_rsc_triosy_0_8_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_9_wadr(TLS_vec_rsc_0_9_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_9_d(TLS_vec_rsc_0_9_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_9_we(TLS_vec_rsc_0_9_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_9_radr(TLS_vec_rsc_0_9_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_9_q(TLS_vec_rsc_0_9_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_9_lz(TLS_vec_rsc_triosy_0_9_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_10_wadr(TLS_vec_rsc_0_10_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_10_d(TLS_vec_rsc_0_10_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_10_we(TLS_vec_rsc_0_10_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_10_radr(TLS_vec_rsc_0_10_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_10_q(TLS_vec_rsc_0_10_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_10_lz(TLS_vec_rsc_triosy_0_10_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_11_wadr(TLS_vec_rsc_0_11_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_11_d(TLS_vec_rsc_0_11_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_11_we(TLS_vec_rsc_0_11_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_11_radr(TLS_vec_rsc_0_11_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_11_q(TLS_vec_rsc_0_11_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_11_lz(TLS_vec_rsc_triosy_0_11_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_12_wadr(TLS_vec_rsc_0_12_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_12_d(TLS_vec_rsc_0_12_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_12_we(TLS_vec_rsc_0_12_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_12_radr(TLS_vec_rsc_0_12_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_12_q(TLS_vec_rsc_0_12_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_12_lz(TLS_vec_rsc_triosy_0_12_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_13_wadr(TLS_vec_rsc_0_13_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_13_d(TLS_vec_rsc_0_13_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_13_we(TLS_vec_rsc_0_13_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_13_radr(TLS_vec_rsc_0_13_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_13_q(TLS_vec_rsc_0_13_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_13_lz(TLS_vec_rsc_triosy_0_13_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_14_wadr(TLS_vec_rsc_0_14_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_14_d(TLS_vec_rsc_0_14_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_14_we(TLS_vec_rsc_0_14_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_14_radr(TLS_vec_rsc_0_14_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_14_q(TLS_vec_rsc_0_14_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_14_lz(TLS_vec_rsc_triosy_0_14_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_15_wadr(TLS_vec_rsc_0_15_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_15_d(TLS_vec_rsc_0_15_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_15_we(TLS_vec_rsc_0_15_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_15_radr(TLS_vec_rsc_0_15_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_15_q(TLS_vec_rsc_0_15_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_15_lz(TLS_vec_rsc_triosy_0_15_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_16_wadr(TLS_vec_rsc_0_16_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_16_d(TLS_vec_rsc_0_16_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_16_we(TLS_vec_rsc_0_16_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_16_radr(TLS_vec_rsc_0_16_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_16_q(TLS_vec_rsc_0_16_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_16_lz(TLS_vec_rsc_triosy_0_16_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_17_wadr(TLS_vec_rsc_0_17_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_17_d(TLS_vec_rsc_0_17_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_17_we(TLS_vec_rsc_0_17_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_17_radr(TLS_vec_rsc_0_17_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_17_q(TLS_vec_rsc_0_17_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_17_lz(TLS_vec_rsc_triosy_0_17_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_18_wadr(TLS_vec_rsc_0_18_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_18_d(TLS_vec_rsc_0_18_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_18_we(TLS_vec_rsc_0_18_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_18_radr(TLS_vec_rsc_0_18_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_18_q(TLS_vec_rsc_0_18_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_18_lz(TLS_vec_rsc_triosy_0_18_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_19_wadr(TLS_vec_rsc_0_19_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_19_d(TLS_vec_rsc_0_19_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_19_we(TLS_vec_rsc_0_19_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_19_radr(TLS_vec_rsc_0_19_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_19_q(TLS_vec_rsc_0_19_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_19_lz(TLS_vec_rsc_triosy_0_19_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_20_wadr(TLS_vec_rsc_0_20_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_20_d(TLS_vec_rsc_0_20_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_20_we(TLS_vec_rsc_0_20_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_20_radr(TLS_vec_rsc_0_20_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_20_q(TLS_vec_rsc_0_20_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_20_lz(TLS_vec_rsc_triosy_0_20_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_21_wadr(TLS_vec_rsc_0_21_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_21_d(TLS_vec_rsc_0_21_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_21_we(TLS_vec_rsc_0_21_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_21_radr(TLS_vec_rsc_0_21_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_21_q(TLS_vec_rsc_0_21_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_21_lz(TLS_vec_rsc_triosy_0_21_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_22_wadr(TLS_vec_rsc_0_22_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_22_d(TLS_vec_rsc_0_22_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_22_we(TLS_vec_rsc_0_22_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_22_radr(TLS_vec_rsc_0_22_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_22_q(TLS_vec_rsc_0_22_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_22_lz(TLS_vec_rsc_triosy_0_22_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_23_wadr(TLS_vec_rsc_0_23_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_23_d(TLS_vec_rsc_0_23_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_23_we(TLS_vec_rsc_0_23_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_23_radr(TLS_vec_rsc_0_23_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_23_q(TLS_vec_rsc_0_23_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_23_lz(TLS_vec_rsc_triosy_0_23_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_24_wadr(TLS_vec_rsc_0_24_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_24_d(TLS_vec_rsc_0_24_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_24_we(TLS_vec_rsc_0_24_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_24_radr(TLS_vec_rsc_0_24_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_24_q(TLS_vec_rsc_0_24_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_24_lz(TLS_vec_rsc_triosy_0_24_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_25_wadr(TLS_vec_rsc_0_25_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_25_d(TLS_vec_rsc_0_25_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_25_we(TLS_vec_rsc_0_25_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_25_radr(TLS_vec_rsc_0_25_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_25_q(TLS_vec_rsc_0_25_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_25_lz(TLS_vec_rsc_triosy_0_25_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_26_wadr(TLS_vec_rsc_0_26_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_26_d(TLS_vec_rsc_0_26_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_26_we(TLS_vec_rsc_0_26_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_26_radr(TLS_vec_rsc_0_26_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_26_q(TLS_vec_rsc_0_26_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_26_lz(TLS_vec_rsc_triosy_0_26_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_27_wadr(TLS_vec_rsc_0_27_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_27_d(TLS_vec_rsc_0_27_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_27_we(TLS_vec_rsc_0_27_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_27_radr(TLS_vec_rsc_0_27_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_27_q(TLS_vec_rsc_0_27_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_27_lz(TLS_vec_rsc_triosy_0_27_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_28_wadr(TLS_vec_rsc_0_28_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_28_d(TLS_vec_rsc_0_28_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_28_we(TLS_vec_rsc_0_28_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_28_radr(TLS_vec_rsc_0_28_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_28_q(TLS_vec_rsc_0_28_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_28_lz(TLS_vec_rsc_triosy_0_28_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_29_wadr(TLS_vec_rsc_0_29_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_29_d(TLS_vec_rsc_0_29_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_29_we(TLS_vec_rsc_0_29_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_29_radr(TLS_vec_rsc_0_29_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_29_q(TLS_vec_rsc_0_29_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_29_lz(TLS_vec_rsc_triosy_0_29_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_30_wadr(TLS_vec_rsc_0_30_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_30_d(TLS_vec_rsc_0_30_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_30_we(TLS_vec_rsc_0_30_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_30_radr(TLS_vec_rsc_0_30_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_30_q(TLS_vec_rsc_0_30_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_30_lz(TLS_vec_rsc_triosy_0_30_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_31_wadr(TLS_vec_rsc_0_31_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_31_d(TLS_vec_rsc_0_31_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_31_we(TLS_vec_rsc_0_31_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_31_radr(TLS_vec_rsc_0_31_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_31_q(TLS_vec_rsc_0_31_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_31_lz(TLS_vec_rsc_triosy_0_31_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_32_wadr(TLS_vec_rsc_0_32_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_32_d(TLS_vec_rsc_0_32_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_32_we(TLS_vec_rsc_0_32_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_32_radr(TLS_vec_rsc_0_32_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_32_q(TLS_vec_rsc_0_32_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_32_lz(TLS_vec_rsc_triosy_0_32_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_33_wadr(TLS_vec_rsc_0_33_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_33_d(TLS_vec_rsc_0_33_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_33_we(TLS_vec_rsc_0_33_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_33_radr(TLS_vec_rsc_0_33_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_33_q(TLS_vec_rsc_0_33_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_33_lz(TLS_vec_rsc_triosy_0_33_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_34_wadr(TLS_vec_rsc_0_34_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_34_d(TLS_vec_rsc_0_34_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_34_we(TLS_vec_rsc_0_34_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_34_radr(TLS_vec_rsc_0_34_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_34_q(TLS_vec_rsc_0_34_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_34_lz(TLS_vec_rsc_triosy_0_34_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_35_wadr(TLS_vec_rsc_0_35_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_35_d(TLS_vec_rsc_0_35_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_35_we(TLS_vec_rsc_0_35_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_35_radr(TLS_vec_rsc_0_35_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_35_q(TLS_vec_rsc_0_35_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_35_lz(TLS_vec_rsc_triosy_0_35_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_36_wadr(TLS_vec_rsc_0_36_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_36_d(TLS_vec_rsc_0_36_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_36_we(TLS_vec_rsc_0_36_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_36_radr(TLS_vec_rsc_0_36_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_36_q(TLS_vec_rsc_0_36_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_36_lz(TLS_vec_rsc_triosy_0_36_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_37_wadr(TLS_vec_rsc_0_37_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_37_d(TLS_vec_rsc_0_37_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_37_we(TLS_vec_rsc_0_37_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_37_radr(TLS_vec_rsc_0_37_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_37_q(TLS_vec_rsc_0_37_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_37_lz(TLS_vec_rsc_triosy_0_37_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_38_wadr(TLS_vec_rsc_0_38_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_38_d(TLS_vec_rsc_0_38_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_38_we(TLS_vec_rsc_0_38_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_38_radr(TLS_vec_rsc_0_38_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_38_q(TLS_vec_rsc_0_38_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_38_lz(TLS_vec_rsc_triosy_0_38_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_39_wadr(TLS_vec_rsc_0_39_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_39_d(TLS_vec_rsc_0_39_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_39_we(TLS_vec_rsc_0_39_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_39_radr(TLS_vec_rsc_0_39_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_39_q(TLS_vec_rsc_0_39_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_39_lz(TLS_vec_rsc_triosy_0_39_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_40_wadr(TLS_vec_rsc_0_40_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_40_d(TLS_vec_rsc_0_40_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_40_we(TLS_vec_rsc_0_40_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_40_radr(TLS_vec_rsc_0_40_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_40_q(TLS_vec_rsc_0_40_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_40_lz(TLS_vec_rsc_triosy_0_40_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_41_wadr(TLS_vec_rsc_0_41_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_41_d(TLS_vec_rsc_0_41_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_41_we(TLS_vec_rsc_0_41_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_41_radr(TLS_vec_rsc_0_41_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_41_q(TLS_vec_rsc_0_41_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_41_lz(TLS_vec_rsc_triosy_0_41_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_42_wadr(TLS_vec_rsc_0_42_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_42_d(TLS_vec_rsc_0_42_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_42_we(TLS_vec_rsc_0_42_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_42_radr(TLS_vec_rsc_0_42_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_42_q(TLS_vec_rsc_0_42_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_42_lz(TLS_vec_rsc_triosy_0_42_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_43_wadr(TLS_vec_rsc_0_43_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_43_d(TLS_vec_rsc_0_43_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_43_we(TLS_vec_rsc_0_43_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_43_radr(TLS_vec_rsc_0_43_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_43_q(TLS_vec_rsc_0_43_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_43_lz(TLS_vec_rsc_triosy_0_43_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_44_wadr(TLS_vec_rsc_0_44_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_44_d(TLS_vec_rsc_0_44_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_44_we(TLS_vec_rsc_0_44_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_44_radr(TLS_vec_rsc_0_44_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_44_q(TLS_vec_rsc_0_44_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_44_lz(TLS_vec_rsc_triosy_0_44_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_45_wadr(TLS_vec_rsc_0_45_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_45_d(TLS_vec_rsc_0_45_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_45_we(TLS_vec_rsc_0_45_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_45_radr(TLS_vec_rsc_0_45_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_45_q(TLS_vec_rsc_0_45_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_45_lz(TLS_vec_rsc_triosy_0_45_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_46_wadr(TLS_vec_rsc_0_46_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_46_d(TLS_vec_rsc_0_46_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_46_we(TLS_vec_rsc_0_46_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_46_radr(TLS_vec_rsc_0_46_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_46_q(TLS_vec_rsc_0_46_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_46_lz(TLS_vec_rsc_triosy_0_46_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_47_wadr(TLS_vec_rsc_0_47_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_47_d(TLS_vec_rsc_0_47_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_47_we(TLS_vec_rsc_0_47_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_47_radr(TLS_vec_rsc_0_47_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_47_q(TLS_vec_rsc_0_47_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_47_lz(TLS_vec_rsc_triosy_0_47_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_48_wadr(TLS_vec_rsc_0_48_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_48_d(TLS_vec_rsc_0_48_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_48_we(TLS_vec_rsc_0_48_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_48_radr(TLS_vec_rsc_0_48_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_48_q(TLS_vec_rsc_0_48_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_48_lz(TLS_vec_rsc_triosy_0_48_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_49_wadr(TLS_vec_rsc_0_49_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_49_d(TLS_vec_rsc_0_49_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_49_we(TLS_vec_rsc_0_49_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_49_radr(TLS_vec_rsc_0_49_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_49_q(TLS_vec_rsc_0_49_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_49_lz(TLS_vec_rsc_triosy_0_49_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_50_wadr(TLS_vec_rsc_0_50_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_50_d(TLS_vec_rsc_0_50_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_50_we(TLS_vec_rsc_0_50_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_50_radr(TLS_vec_rsc_0_50_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_50_q(TLS_vec_rsc_0_50_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_50_lz(TLS_vec_rsc_triosy_0_50_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_51_wadr(TLS_vec_rsc_0_51_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_51_d(TLS_vec_rsc_0_51_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_51_we(TLS_vec_rsc_0_51_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_51_radr(TLS_vec_rsc_0_51_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_51_q(TLS_vec_rsc_0_51_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_51_lz(TLS_vec_rsc_triosy_0_51_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_52_wadr(TLS_vec_rsc_0_52_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_52_d(TLS_vec_rsc_0_52_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_52_we(TLS_vec_rsc_0_52_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_52_radr(TLS_vec_rsc_0_52_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_52_q(TLS_vec_rsc_0_52_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_52_lz(TLS_vec_rsc_triosy_0_52_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_53_wadr(TLS_vec_rsc_0_53_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_53_d(TLS_vec_rsc_0_53_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_53_we(TLS_vec_rsc_0_53_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_53_radr(TLS_vec_rsc_0_53_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_53_q(TLS_vec_rsc_0_53_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_53_lz(TLS_vec_rsc_triosy_0_53_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_54_wadr(TLS_vec_rsc_0_54_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_54_d(TLS_vec_rsc_0_54_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_54_we(TLS_vec_rsc_0_54_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_54_radr(TLS_vec_rsc_0_54_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_54_q(TLS_vec_rsc_0_54_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_54_lz(TLS_vec_rsc_triosy_0_54_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_55_wadr(TLS_vec_rsc_0_55_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_55_d(TLS_vec_rsc_0_55_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_55_we(TLS_vec_rsc_0_55_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_55_radr(TLS_vec_rsc_0_55_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_55_q(TLS_vec_rsc_0_55_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_55_lz(TLS_vec_rsc_triosy_0_55_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_56_wadr(TLS_vec_rsc_0_56_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_56_d(TLS_vec_rsc_0_56_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_56_we(TLS_vec_rsc_0_56_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_56_radr(TLS_vec_rsc_0_56_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_56_q(TLS_vec_rsc_0_56_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_56_lz(TLS_vec_rsc_triosy_0_56_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_57_wadr(TLS_vec_rsc_0_57_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_57_d(TLS_vec_rsc_0_57_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_57_we(TLS_vec_rsc_0_57_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_57_radr(TLS_vec_rsc_0_57_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_57_q(TLS_vec_rsc_0_57_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_57_lz(TLS_vec_rsc_triosy_0_57_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_58_wadr(TLS_vec_rsc_0_58_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_58_d(TLS_vec_rsc_0_58_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_58_we(TLS_vec_rsc_0_58_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_58_radr(TLS_vec_rsc_0_58_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_58_q(TLS_vec_rsc_0_58_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_58_lz(TLS_vec_rsc_triosy_0_58_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_59_wadr(TLS_vec_rsc_0_59_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_59_d(TLS_vec_rsc_0_59_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_59_we(TLS_vec_rsc_0_59_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_59_radr(TLS_vec_rsc_0_59_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_59_q(TLS_vec_rsc_0_59_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_59_lz(TLS_vec_rsc_triosy_0_59_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_60_wadr(TLS_vec_rsc_0_60_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_60_d(TLS_vec_rsc_0_60_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_60_we(TLS_vec_rsc_0_60_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_60_radr(TLS_vec_rsc_0_60_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_60_q(TLS_vec_rsc_0_60_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_60_lz(TLS_vec_rsc_triosy_0_60_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_61_wadr(TLS_vec_rsc_0_61_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_61_d(TLS_vec_rsc_0_61_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_61_we(TLS_vec_rsc_0_61_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_61_radr(TLS_vec_rsc_0_61_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_61_q(TLS_vec_rsc_0_61_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_61_lz(TLS_vec_rsc_triosy_0_61_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_62_wadr(TLS_vec_rsc_0_62_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_62_d(TLS_vec_rsc_0_62_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_62_we(TLS_vec_rsc_0_62_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_62_radr(TLS_vec_rsc_0_62_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_62_q(TLS_vec_rsc_0_62_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_62_lz(TLS_vec_rsc_triosy_0_62_lz);
    inPlaceNTT_DIF_INST.vec_rsc_0_63_wadr(TLS_vec_rsc_0_63_wadr);
    inPlaceNTT_DIF_INST.vec_rsc_0_63_d(TLS_vec_rsc_0_63_d);
    inPlaceNTT_DIF_INST.vec_rsc_0_63_we(TLS_vec_rsc_0_63_we);
    inPlaceNTT_DIF_INST.vec_rsc_0_63_radr(TLS_vec_rsc_0_63_radr);
    inPlaceNTT_DIF_INST.vec_rsc_0_63_q(TLS_vec_rsc_0_63_q);
    inPlaceNTT_DIF_INST.vec_rsc_triosy_0_63_lz(TLS_vec_rsc_triosy_0_63_lz);
    inPlaceNTT_DIF_INST.p_rsc_dat(TLS_p_rsc_dat);
    inPlaceNTT_DIF_INST.p_rsc_triosy_lz(TLS_p_rsc_triosy_lz);
    inPlaceNTT_DIF_INST.r_rsc_dat(TLS_r_rsc_dat);
    inPlaceNTT_DIF_INST.r_rsc_triosy_lz(TLS_r_rsc_triosy_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_0_radr(TLS_twiddle_rsc_0_0_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_0_q(TLS_twiddle_rsc_0_0_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_0_lz(TLS_twiddle_rsc_triosy_0_0_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_1_radr(TLS_twiddle_rsc_0_1_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_1_q(TLS_twiddle_rsc_0_1_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_1_lz(TLS_twiddle_rsc_triosy_0_1_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_2_radr(TLS_twiddle_rsc_0_2_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_2_q(TLS_twiddle_rsc_0_2_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_2_lz(TLS_twiddle_rsc_triosy_0_2_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_3_radr(TLS_twiddle_rsc_0_3_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_3_q(TLS_twiddle_rsc_0_3_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_3_lz(TLS_twiddle_rsc_triosy_0_3_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_4_radr(TLS_twiddle_rsc_0_4_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_4_q(TLS_twiddle_rsc_0_4_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_4_lz(TLS_twiddle_rsc_triosy_0_4_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_5_radr(TLS_twiddle_rsc_0_5_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_5_q(TLS_twiddle_rsc_0_5_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_5_lz(TLS_twiddle_rsc_triosy_0_5_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_6_radr(TLS_twiddle_rsc_0_6_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_6_q(TLS_twiddle_rsc_0_6_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_6_lz(TLS_twiddle_rsc_triosy_0_6_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_7_radr(TLS_twiddle_rsc_0_7_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_7_q(TLS_twiddle_rsc_0_7_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_7_lz(TLS_twiddle_rsc_triosy_0_7_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_8_radr(TLS_twiddle_rsc_0_8_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_8_q(TLS_twiddle_rsc_0_8_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_8_lz(TLS_twiddle_rsc_triosy_0_8_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_9_radr(TLS_twiddle_rsc_0_9_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_9_q(TLS_twiddle_rsc_0_9_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_9_lz(TLS_twiddle_rsc_triosy_0_9_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_10_radr(TLS_twiddle_rsc_0_10_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_10_q(TLS_twiddle_rsc_0_10_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_10_lz(TLS_twiddle_rsc_triosy_0_10_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_11_radr(TLS_twiddle_rsc_0_11_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_11_q(TLS_twiddle_rsc_0_11_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_11_lz(TLS_twiddle_rsc_triosy_0_11_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_12_radr(TLS_twiddle_rsc_0_12_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_12_q(TLS_twiddle_rsc_0_12_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_12_lz(TLS_twiddle_rsc_triosy_0_12_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_13_radr(TLS_twiddle_rsc_0_13_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_13_q(TLS_twiddle_rsc_0_13_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_13_lz(TLS_twiddle_rsc_triosy_0_13_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_14_radr(TLS_twiddle_rsc_0_14_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_14_q(TLS_twiddle_rsc_0_14_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_14_lz(TLS_twiddle_rsc_triosy_0_14_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_15_radr(TLS_twiddle_rsc_0_15_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_15_q(TLS_twiddle_rsc_0_15_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_15_lz(TLS_twiddle_rsc_triosy_0_15_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_16_radr(TLS_twiddle_rsc_0_16_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_16_q(TLS_twiddle_rsc_0_16_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_16_lz(TLS_twiddle_rsc_triosy_0_16_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_17_radr(TLS_twiddle_rsc_0_17_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_17_q(TLS_twiddle_rsc_0_17_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_17_lz(TLS_twiddle_rsc_triosy_0_17_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_18_radr(TLS_twiddle_rsc_0_18_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_18_q(TLS_twiddle_rsc_0_18_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_18_lz(TLS_twiddle_rsc_triosy_0_18_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_19_radr(TLS_twiddle_rsc_0_19_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_19_q(TLS_twiddle_rsc_0_19_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_19_lz(TLS_twiddle_rsc_triosy_0_19_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_20_radr(TLS_twiddle_rsc_0_20_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_20_q(TLS_twiddle_rsc_0_20_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_20_lz(TLS_twiddle_rsc_triosy_0_20_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_21_radr(TLS_twiddle_rsc_0_21_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_21_q(TLS_twiddle_rsc_0_21_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_21_lz(TLS_twiddle_rsc_triosy_0_21_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_22_radr(TLS_twiddle_rsc_0_22_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_22_q(TLS_twiddle_rsc_0_22_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_22_lz(TLS_twiddle_rsc_triosy_0_22_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_23_radr(TLS_twiddle_rsc_0_23_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_23_q(TLS_twiddle_rsc_0_23_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_23_lz(TLS_twiddle_rsc_triosy_0_23_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_24_radr(TLS_twiddle_rsc_0_24_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_24_q(TLS_twiddle_rsc_0_24_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_24_lz(TLS_twiddle_rsc_triosy_0_24_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_25_radr(TLS_twiddle_rsc_0_25_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_25_q(TLS_twiddle_rsc_0_25_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_25_lz(TLS_twiddle_rsc_triosy_0_25_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_26_radr(TLS_twiddle_rsc_0_26_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_26_q(TLS_twiddle_rsc_0_26_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_26_lz(TLS_twiddle_rsc_triosy_0_26_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_27_radr(TLS_twiddle_rsc_0_27_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_27_q(TLS_twiddle_rsc_0_27_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_27_lz(TLS_twiddle_rsc_triosy_0_27_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_28_radr(TLS_twiddle_rsc_0_28_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_28_q(TLS_twiddle_rsc_0_28_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_28_lz(TLS_twiddle_rsc_triosy_0_28_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_29_radr(TLS_twiddle_rsc_0_29_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_29_q(TLS_twiddle_rsc_0_29_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_29_lz(TLS_twiddle_rsc_triosy_0_29_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_30_radr(TLS_twiddle_rsc_0_30_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_30_q(TLS_twiddle_rsc_0_30_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_30_lz(TLS_twiddle_rsc_triosy_0_30_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_31_radr(TLS_twiddle_rsc_0_31_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_31_q(TLS_twiddle_rsc_0_31_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_31_lz(TLS_twiddle_rsc_triosy_0_31_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_32_radr(TLS_twiddle_rsc_0_32_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_32_q(TLS_twiddle_rsc_0_32_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_32_lz(TLS_twiddle_rsc_triosy_0_32_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_33_radr(TLS_twiddle_rsc_0_33_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_33_q(TLS_twiddle_rsc_0_33_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_33_lz(TLS_twiddle_rsc_triosy_0_33_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_34_radr(TLS_twiddle_rsc_0_34_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_34_q(TLS_twiddle_rsc_0_34_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_34_lz(TLS_twiddle_rsc_triosy_0_34_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_35_radr(TLS_twiddle_rsc_0_35_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_35_q(TLS_twiddle_rsc_0_35_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_35_lz(TLS_twiddle_rsc_triosy_0_35_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_36_radr(TLS_twiddle_rsc_0_36_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_36_q(TLS_twiddle_rsc_0_36_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_36_lz(TLS_twiddle_rsc_triosy_0_36_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_37_radr(TLS_twiddle_rsc_0_37_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_37_q(TLS_twiddle_rsc_0_37_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_37_lz(TLS_twiddle_rsc_triosy_0_37_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_38_radr(TLS_twiddle_rsc_0_38_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_38_q(TLS_twiddle_rsc_0_38_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_38_lz(TLS_twiddle_rsc_triosy_0_38_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_39_radr(TLS_twiddle_rsc_0_39_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_39_q(TLS_twiddle_rsc_0_39_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_39_lz(TLS_twiddle_rsc_triosy_0_39_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_40_radr(TLS_twiddle_rsc_0_40_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_40_q(TLS_twiddle_rsc_0_40_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_40_lz(TLS_twiddle_rsc_triosy_0_40_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_41_radr(TLS_twiddle_rsc_0_41_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_41_q(TLS_twiddle_rsc_0_41_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_41_lz(TLS_twiddle_rsc_triosy_0_41_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_42_radr(TLS_twiddle_rsc_0_42_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_42_q(TLS_twiddle_rsc_0_42_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_42_lz(TLS_twiddle_rsc_triosy_0_42_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_43_radr(TLS_twiddle_rsc_0_43_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_43_q(TLS_twiddle_rsc_0_43_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_43_lz(TLS_twiddle_rsc_triosy_0_43_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_44_radr(TLS_twiddle_rsc_0_44_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_44_q(TLS_twiddle_rsc_0_44_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_44_lz(TLS_twiddle_rsc_triosy_0_44_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_45_radr(TLS_twiddle_rsc_0_45_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_45_q(TLS_twiddle_rsc_0_45_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_45_lz(TLS_twiddle_rsc_triosy_0_45_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_46_radr(TLS_twiddle_rsc_0_46_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_46_q(TLS_twiddle_rsc_0_46_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_46_lz(TLS_twiddle_rsc_triosy_0_46_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_47_radr(TLS_twiddle_rsc_0_47_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_47_q(TLS_twiddle_rsc_0_47_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_47_lz(TLS_twiddle_rsc_triosy_0_47_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_48_radr(TLS_twiddle_rsc_0_48_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_48_q(TLS_twiddle_rsc_0_48_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_48_lz(TLS_twiddle_rsc_triosy_0_48_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_49_radr(TLS_twiddle_rsc_0_49_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_49_q(TLS_twiddle_rsc_0_49_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_49_lz(TLS_twiddle_rsc_triosy_0_49_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_50_radr(TLS_twiddle_rsc_0_50_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_50_q(TLS_twiddle_rsc_0_50_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_50_lz(TLS_twiddle_rsc_triosy_0_50_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_51_radr(TLS_twiddle_rsc_0_51_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_51_q(TLS_twiddle_rsc_0_51_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_51_lz(TLS_twiddle_rsc_triosy_0_51_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_52_radr(TLS_twiddle_rsc_0_52_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_52_q(TLS_twiddle_rsc_0_52_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_52_lz(TLS_twiddle_rsc_triosy_0_52_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_53_radr(TLS_twiddle_rsc_0_53_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_53_q(TLS_twiddle_rsc_0_53_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_53_lz(TLS_twiddle_rsc_triosy_0_53_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_54_radr(TLS_twiddle_rsc_0_54_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_54_q(TLS_twiddle_rsc_0_54_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_54_lz(TLS_twiddle_rsc_triosy_0_54_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_55_radr(TLS_twiddle_rsc_0_55_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_55_q(TLS_twiddle_rsc_0_55_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_55_lz(TLS_twiddle_rsc_triosy_0_55_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_56_radr(TLS_twiddle_rsc_0_56_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_56_q(TLS_twiddle_rsc_0_56_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_56_lz(TLS_twiddle_rsc_triosy_0_56_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_57_radr(TLS_twiddle_rsc_0_57_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_57_q(TLS_twiddle_rsc_0_57_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_57_lz(TLS_twiddle_rsc_triosy_0_57_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_58_radr(TLS_twiddle_rsc_0_58_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_58_q(TLS_twiddle_rsc_0_58_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_58_lz(TLS_twiddle_rsc_triosy_0_58_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_59_radr(TLS_twiddle_rsc_0_59_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_59_q(TLS_twiddle_rsc_0_59_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_59_lz(TLS_twiddle_rsc_triosy_0_59_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_60_radr(TLS_twiddle_rsc_0_60_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_60_q(TLS_twiddle_rsc_0_60_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_60_lz(TLS_twiddle_rsc_triosy_0_60_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_61_radr(TLS_twiddle_rsc_0_61_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_61_q(TLS_twiddle_rsc_0_61_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_61_lz(TLS_twiddle_rsc_triosy_0_61_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_62_radr(TLS_twiddle_rsc_0_62_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_62_q(TLS_twiddle_rsc_0_62_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_62_lz(TLS_twiddle_rsc_triosy_0_62_lz);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_63_radr(TLS_twiddle_rsc_0_63_radr);
    inPlaceNTT_DIF_INST.twiddle_rsc_0_63_q(TLS_twiddle_rsc_0_63_q);
    inPlaceNTT_DIF_INST.twiddle_rsc_triosy_0_63_lz(TLS_twiddle_rsc_triosy_0_63_lz);

    vec_rsc_0__0__INST.q(TLS_vec_rsc_0_0_q);
    vec_rsc_0__0__INST.radr(TLS_vec_rsc_0_0_radr);
    vec_rsc_0__0__INST.we(TLS_vec_rsc_0_0_we);
    vec_rsc_0__0__INST.d(TLS_vec_rsc_0_0_d);
    vec_rsc_0__0__INST.wadr(TLS_vec_rsc_0_0_wadr);
    vec_rsc_0__0__INST.clk(clk);
    vec_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_9)));

    vec_rsc_0__1__INST.q(TLS_vec_rsc_0_1_q);
    vec_rsc_0__1__INST.radr(TLS_vec_rsc_0_1_radr);
    vec_rsc_0__1__INST.we(TLS_vec_rsc_0_1_we);
    vec_rsc_0__1__INST.d(TLS_vec_rsc_0_1_d);
    vec_rsc_0__1__INST.wadr(TLS_vec_rsc_0_1_wadr);
    vec_rsc_0__1__INST.clk(clk);
    vec_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_10)));

    vec_rsc_0__2__INST.q(TLS_vec_rsc_0_2_q);
    vec_rsc_0__2__INST.radr(TLS_vec_rsc_0_2_radr);
    vec_rsc_0__2__INST.we(TLS_vec_rsc_0_2_we);
    vec_rsc_0__2__INST.d(TLS_vec_rsc_0_2_d);
    vec_rsc_0__2__INST.wadr(TLS_vec_rsc_0_2_wadr);
    vec_rsc_0__2__INST.clk(clk);
    vec_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_11)));

    vec_rsc_0__3__INST.q(TLS_vec_rsc_0_3_q);
    vec_rsc_0__3__INST.radr(TLS_vec_rsc_0_3_radr);
    vec_rsc_0__3__INST.we(TLS_vec_rsc_0_3_we);
    vec_rsc_0__3__INST.d(TLS_vec_rsc_0_3_d);
    vec_rsc_0__3__INST.wadr(TLS_vec_rsc_0_3_wadr);
    vec_rsc_0__3__INST.clk(clk);
    vec_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_12)));

    vec_rsc_0__4__INST.q(TLS_vec_rsc_0_4_q);
    vec_rsc_0__4__INST.radr(TLS_vec_rsc_0_4_radr);
    vec_rsc_0__4__INST.we(TLS_vec_rsc_0_4_we);
    vec_rsc_0__4__INST.d(TLS_vec_rsc_0_4_d);
    vec_rsc_0__4__INST.wadr(TLS_vec_rsc_0_4_wadr);
    vec_rsc_0__4__INST.clk(clk);
    vec_rsc_0__4__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_13)));

    vec_rsc_0__5__INST.q(TLS_vec_rsc_0_5_q);
    vec_rsc_0__5__INST.radr(TLS_vec_rsc_0_5_radr);
    vec_rsc_0__5__INST.we(TLS_vec_rsc_0_5_we);
    vec_rsc_0__5__INST.d(TLS_vec_rsc_0_5_d);
    vec_rsc_0__5__INST.wadr(TLS_vec_rsc_0_5_wadr);
    vec_rsc_0__5__INST.clk(clk);
    vec_rsc_0__5__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_14)));

    vec_rsc_0__6__INST.q(TLS_vec_rsc_0_6_q);
    vec_rsc_0__6__INST.radr(TLS_vec_rsc_0_6_radr);
    vec_rsc_0__6__INST.we(TLS_vec_rsc_0_6_we);
    vec_rsc_0__6__INST.d(TLS_vec_rsc_0_6_d);
    vec_rsc_0__6__INST.wadr(TLS_vec_rsc_0_6_wadr);
    vec_rsc_0__6__INST.clk(clk);
    vec_rsc_0__6__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_15)));

    vec_rsc_0__7__INST.q(TLS_vec_rsc_0_7_q);
    vec_rsc_0__7__INST.radr(TLS_vec_rsc_0_7_radr);
    vec_rsc_0__7__INST.we(TLS_vec_rsc_0_7_we);
    vec_rsc_0__7__INST.d(TLS_vec_rsc_0_7_d);
    vec_rsc_0__7__INST.wadr(TLS_vec_rsc_0_7_wadr);
    vec_rsc_0__7__INST.clk(clk);
    vec_rsc_0__7__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_16)));

    vec_rsc_0__8__INST.q(TLS_vec_rsc_0_8_q);
    vec_rsc_0__8__INST.radr(TLS_vec_rsc_0_8_radr);
    vec_rsc_0__8__INST.we(TLS_vec_rsc_0_8_we);
    vec_rsc_0__8__INST.d(TLS_vec_rsc_0_8_d);
    vec_rsc_0__8__INST.wadr(TLS_vec_rsc_0_8_wadr);
    vec_rsc_0__8__INST.clk(clk);
    vec_rsc_0__8__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_17)));

    vec_rsc_0__9__INST.q(TLS_vec_rsc_0_9_q);
    vec_rsc_0__9__INST.radr(TLS_vec_rsc_0_9_radr);
    vec_rsc_0__9__INST.we(TLS_vec_rsc_0_9_we);
    vec_rsc_0__9__INST.d(TLS_vec_rsc_0_9_d);
    vec_rsc_0__9__INST.wadr(TLS_vec_rsc_0_9_wadr);
    vec_rsc_0__9__INST.clk(clk);
    vec_rsc_0__9__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_18)));

    vec_rsc_0__10__INST.q(TLS_vec_rsc_0_10_q);
    vec_rsc_0__10__INST.radr(TLS_vec_rsc_0_10_radr);
    vec_rsc_0__10__INST.we(TLS_vec_rsc_0_10_we);
    vec_rsc_0__10__INST.d(TLS_vec_rsc_0_10_d);
    vec_rsc_0__10__INST.wadr(TLS_vec_rsc_0_10_wadr);
    vec_rsc_0__10__INST.clk(clk);
    vec_rsc_0__10__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_19)));

    vec_rsc_0__11__INST.q(TLS_vec_rsc_0_11_q);
    vec_rsc_0__11__INST.radr(TLS_vec_rsc_0_11_radr);
    vec_rsc_0__11__INST.we(TLS_vec_rsc_0_11_we);
    vec_rsc_0__11__INST.d(TLS_vec_rsc_0_11_d);
    vec_rsc_0__11__INST.wadr(TLS_vec_rsc_0_11_wadr);
    vec_rsc_0__11__INST.clk(clk);
    vec_rsc_0__11__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_20)));

    vec_rsc_0__12__INST.q(TLS_vec_rsc_0_12_q);
    vec_rsc_0__12__INST.radr(TLS_vec_rsc_0_12_radr);
    vec_rsc_0__12__INST.we(TLS_vec_rsc_0_12_we);
    vec_rsc_0__12__INST.d(TLS_vec_rsc_0_12_d);
    vec_rsc_0__12__INST.wadr(TLS_vec_rsc_0_12_wadr);
    vec_rsc_0__12__INST.clk(clk);
    vec_rsc_0__12__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_21)));

    vec_rsc_0__13__INST.q(TLS_vec_rsc_0_13_q);
    vec_rsc_0__13__INST.radr(TLS_vec_rsc_0_13_radr);
    vec_rsc_0__13__INST.we(TLS_vec_rsc_0_13_we);
    vec_rsc_0__13__INST.d(TLS_vec_rsc_0_13_d);
    vec_rsc_0__13__INST.wadr(TLS_vec_rsc_0_13_wadr);
    vec_rsc_0__13__INST.clk(clk);
    vec_rsc_0__13__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_22)));

    vec_rsc_0__14__INST.q(TLS_vec_rsc_0_14_q);
    vec_rsc_0__14__INST.radr(TLS_vec_rsc_0_14_radr);
    vec_rsc_0__14__INST.we(TLS_vec_rsc_0_14_we);
    vec_rsc_0__14__INST.d(TLS_vec_rsc_0_14_d);
    vec_rsc_0__14__INST.wadr(TLS_vec_rsc_0_14_wadr);
    vec_rsc_0__14__INST.clk(clk);
    vec_rsc_0__14__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_23)));

    vec_rsc_0__15__INST.q(TLS_vec_rsc_0_15_q);
    vec_rsc_0__15__INST.radr(TLS_vec_rsc_0_15_radr);
    vec_rsc_0__15__INST.we(TLS_vec_rsc_0_15_we);
    vec_rsc_0__15__INST.d(TLS_vec_rsc_0_15_d);
    vec_rsc_0__15__INST.wadr(TLS_vec_rsc_0_15_wadr);
    vec_rsc_0__15__INST.clk(clk);
    vec_rsc_0__15__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_24)));

    vec_rsc_0__16__INST.q(TLS_vec_rsc_0_16_q);
    vec_rsc_0__16__INST.radr(TLS_vec_rsc_0_16_radr);
    vec_rsc_0__16__INST.we(TLS_vec_rsc_0_16_we);
    vec_rsc_0__16__INST.d(TLS_vec_rsc_0_16_d);
    vec_rsc_0__16__INST.wadr(TLS_vec_rsc_0_16_wadr);
    vec_rsc_0__16__INST.clk(clk);
    vec_rsc_0__16__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__16__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_25)));

    vec_rsc_0__17__INST.q(TLS_vec_rsc_0_17_q);
    vec_rsc_0__17__INST.radr(TLS_vec_rsc_0_17_radr);
    vec_rsc_0__17__INST.we(TLS_vec_rsc_0_17_we);
    vec_rsc_0__17__INST.d(TLS_vec_rsc_0_17_d);
    vec_rsc_0__17__INST.wadr(TLS_vec_rsc_0_17_wadr);
    vec_rsc_0__17__INST.clk(clk);
    vec_rsc_0__17__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__17__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_26)));

    vec_rsc_0__18__INST.q(TLS_vec_rsc_0_18_q);
    vec_rsc_0__18__INST.radr(TLS_vec_rsc_0_18_radr);
    vec_rsc_0__18__INST.we(TLS_vec_rsc_0_18_we);
    vec_rsc_0__18__INST.d(TLS_vec_rsc_0_18_d);
    vec_rsc_0__18__INST.wadr(TLS_vec_rsc_0_18_wadr);
    vec_rsc_0__18__INST.clk(clk);
    vec_rsc_0__18__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__18__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_27)));

    vec_rsc_0__19__INST.q(TLS_vec_rsc_0_19_q);
    vec_rsc_0__19__INST.radr(TLS_vec_rsc_0_19_radr);
    vec_rsc_0__19__INST.we(TLS_vec_rsc_0_19_we);
    vec_rsc_0__19__INST.d(TLS_vec_rsc_0_19_d);
    vec_rsc_0__19__INST.wadr(TLS_vec_rsc_0_19_wadr);
    vec_rsc_0__19__INST.clk(clk);
    vec_rsc_0__19__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__19__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_28)));

    vec_rsc_0__20__INST.q(TLS_vec_rsc_0_20_q);
    vec_rsc_0__20__INST.radr(TLS_vec_rsc_0_20_radr);
    vec_rsc_0__20__INST.we(TLS_vec_rsc_0_20_we);
    vec_rsc_0__20__INST.d(TLS_vec_rsc_0_20_d);
    vec_rsc_0__20__INST.wadr(TLS_vec_rsc_0_20_wadr);
    vec_rsc_0__20__INST.clk(clk);
    vec_rsc_0__20__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__20__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_29)));

    vec_rsc_0__21__INST.q(TLS_vec_rsc_0_21_q);
    vec_rsc_0__21__INST.radr(TLS_vec_rsc_0_21_radr);
    vec_rsc_0__21__INST.we(TLS_vec_rsc_0_21_we);
    vec_rsc_0__21__INST.d(TLS_vec_rsc_0_21_d);
    vec_rsc_0__21__INST.wadr(TLS_vec_rsc_0_21_wadr);
    vec_rsc_0__21__INST.clk(clk);
    vec_rsc_0__21__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__21__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_30)));

    vec_rsc_0__22__INST.q(TLS_vec_rsc_0_22_q);
    vec_rsc_0__22__INST.radr(TLS_vec_rsc_0_22_radr);
    vec_rsc_0__22__INST.we(TLS_vec_rsc_0_22_we);
    vec_rsc_0__22__INST.d(TLS_vec_rsc_0_22_d);
    vec_rsc_0__22__INST.wadr(TLS_vec_rsc_0_22_wadr);
    vec_rsc_0__22__INST.clk(clk);
    vec_rsc_0__22__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__22__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_31)));

    vec_rsc_0__23__INST.q(TLS_vec_rsc_0_23_q);
    vec_rsc_0__23__INST.radr(TLS_vec_rsc_0_23_radr);
    vec_rsc_0__23__INST.we(TLS_vec_rsc_0_23_we);
    vec_rsc_0__23__INST.d(TLS_vec_rsc_0_23_d);
    vec_rsc_0__23__INST.wadr(TLS_vec_rsc_0_23_wadr);
    vec_rsc_0__23__INST.clk(clk);
    vec_rsc_0__23__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__23__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_32)));

    vec_rsc_0__24__INST.q(TLS_vec_rsc_0_24_q);
    vec_rsc_0__24__INST.radr(TLS_vec_rsc_0_24_radr);
    vec_rsc_0__24__INST.we(TLS_vec_rsc_0_24_we);
    vec_rsc_0__24__INST.d(TLS_vec_rsc_0_24_d);
    vec_rsc_0__24__INST.wadr(TLS_vec_rsc_0_24_wadr);
    vec_rsc_0__24__INST.clk(clk);
    vec_rsc_0__24__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__24__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_33)));

    vec_rsc_0__25__INST.q(TLS_vec_rsc_0_25_q);
    vec_rsc_0__25__INST.radr(TLS_vec_rsc_0_25_radr);
    vec_rsc_0__25__INST.we(TLS_vec_rsc_0_25_we);
    vec_rsc_0__25__INST.d(TLS_vec_rsc_0_25_d);
    vec_rsc_0__25__INST.wadr(TLS_vec_rsc_0_25_wadr);
    vec_rsc_0__25__INST.clk(clk);
    vec_rsc_0__25__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__25__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_34)));

    vec_rsc_0__26__INST.q(TLS_vec_rsc_0_26_q);
    vec_rsc_0__26__INST.radr(TLS_vec_rsc_0_26_radr);
    vec_rsc_0__26__INST.we(TLS_vec_rsc_0_26_we);
    vec_rsc_0__26__INST.d(TLS_vec_rsc_0_26_d);
    vec_rsc_0__26__INST.wadr(TLS_vec_rsc_0_26_wadr);
    vec_rsc_0__26__INST.clk(clk);
    vec_rsc_0__26__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__26__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_35)));

    vec_rsc_0__27__INST.q(TLS_vec_rsc_0_27_q);
    vec_rsc_0__27__INST.radr(TLS_vec_rsc_0_27_radr);
    vec_rsc_0__27__INST.we(TLS_vec_rsc_0_27_we);
    vec_rsc_0__27__INST.d(TLS_vec_rsc_0_27_d);
    vec_rsc_0__27__INST.wadr(TLS_vec_rsc_0_27_wadr);
    vec_rsc_0__27__INST.clk(clk);
    vec_rsc_0__27__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__27__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_36)));

    vec_rsc_0__28__INST.q(TLS_vec_rsc_0_28_q);
    vec_rsc_0__28__INST.radr(TLS_vec_rsc_0_28_radr);
    vec_rsc_0__28__INST.we(TLS_vec_rsc_0_28_we);
    vec_rsc_0__28__INST.d(TLS_vec_rsc_0_28_d);
    vec_rsc_0__28__INST.wadr(TLS_vec_rsc_0_28_wadr);
    vec_rsc_0__28__INST.clk(clk);
    vec_rsc_0__28__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__28__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_37)));

    vec_rsc_0__29__INST.q(TLS_vec_rsc_0_29_q);
    vec_rsc_0__29__INST.radr(TLS_vec_rsc_0_29_radr);
    vec_rsc_0__29__INST.we(TLS_vec_rsc_0_29_we);
    vec_rsc_0__29__INST.d(TLS_vec_rsc_0_29_d);
    vec_rsc_0__29__INST.wadr(TLS_vec_rsc_0_29_wadr);
    vec_rsc_0__29__INST.clk(clk);
    vec_rsc_0__29__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__29__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_38)));

    vec_rsc_0__30__INST.q(TLS_vec_rsc_0_30_q);
    vec_rsc_0__30__INST.radr(TLS_vec_rsc_0_30_radr);
    vec_rsc_0__30__INST.we(TLS_vec_rsc_0_30_we);
    vec_rsc_0__30__INST.d(TLS_vec_rsc_0_30_d);
    vec_rsc_0__30__INST.wadr(TLS_vec_rsc_0_30_wadr);
    vec_rsc_0__30__INST.clk(clk);
    vec_rsc_0__30__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__30__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_39)));

    vec_rsc_0__31__INST.q(TLS_vec_rsc_0_31_q);
    vec_rsc_0__31__INST.radr(TLS_vec_rsc_0_31_radr);
    vec_rsc_0__31__INST.we(TLS_vec_rsc_0_31_we);
    vec_rsc_0__31__INST.d(TLS_vec_rsc_0_31_d);
    vec_rsc_0__31__INST.wadr(TLS_vec_rsc_0_31_wadr);
    vec_rsc_0__31__INST.clk(clk);
    vec_rsc_0__31__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__31__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_40)));

    vec_rsc_0__32__INST.q(TLS_vec_rsc_0_32_q);
    vec_rsc_0__32__INST.radr(TLS_vec_rsc_0_32_radr);
    vec_rsc_0__32__INST.we(TLS_vec_rsc_0_32_we);
    vec_rsc_0__32__INST.d(TLS_vec_rsc_0_32_d);
    vec_rsc_0__32__INST.wadr(TLS_vec_rsc_0_32_wadr);
    vec_rsc_0__32__INST.clk(clk);
    vec_rsc_0__32__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__32__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_41)));

    vec_rsc_0__33__INST.q(TLS_vec_rsc_0_33_q);
    vec_rsc_0__33__INST.radr(TLS_vec_rsc_0_33_radr);
    vec_rsc_0__33__INST.we(TLS_vec_rsc_0_33_we);
    vec_rsc_0__33__INST.d(TLS_vec_rsc_0_33_d);
    vec_rsc_0__33__INST.wadr(TLS_vec_rsc_0_33_wadr);
    vec_rsc_0__33__INST.clk(clk);
    vec_rsc_0__33__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__33__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_42)));

    vec_rsc_0__34__INST.q(TLS_vec_rsc_0_34_q);
    vec_rsc_0__34__INST.radr(TLS_vec_rsc_0_34_radr);
    vec_rsc_0__34__INST.we(TLS_vec_rsc_0_34_we);
    vec_rsc_0__34__INST.d(TLS_vec_rsc_0_34_d);
    vec_rsc_0__34__INST.wadr(TLS_vec_rsc_0_34_wadr);
    vec_rsc_0__34__INST.clk(clk);
    vec_rsc_0__34__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__34__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_43)));

    vec_rsc_0__35__INST.q(TLS_vec_rsc_0_35_q);
    vec_rsc_0__35__INST.radr(TLS_vec_rsc_0_35_radr);
    vec_rsc_0__35__INST.we(TLS_vec_rsc_0_35_we);
    vec_rsc_0__35__INST.d(TLS_vec_rsc_0_35_d);
    vec_rsc_0__35__INST.wadr(TLS_vec_rsc_0_35_wadr);
    vec_rsc_0__35__INST.clk(clk);
    vec_rsc_0__35__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__35__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_44)));

    vec_rsc_0__36__INST.q(TLS_vec_rsc_0_36_q);
    vec_rsc_0__36__INST.radr(TLS_vec_rsc_0_36_radr);
    vec_rsc_0__36__INST.we(TLS_vec_rsc_0_36_we);
    vec_rsc_0__36__INST.d(TLS_vec_rsc_0_36_d);
    vec_rsc_0__36__INST.wadr(TLS_vec_rsc_0_36_wadr);
    vec_rsc_0__36__INST.clk(clk);
    vec_rsc_0__36__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__36__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_45)));

    vec_rsc_0__37__INST.q(TLS_vec_rsc_0_37_q);
    vec_rsc_0__37__INST.radr(TLS_vec_rsc_0_37_radr);
    vec_rsc_0__37__INST.we(TLS_vec_rsc_0_37_we);
    vec_rsc_0__37__INST.d(TLS_vec_rsc_0_37_d);
    vec_rsc_0__37__INST.wadr(TLS_vec_rsc_0_37_wadr);
    vec_rsc_0__37__INST.clk(clk);
    vec_rsc_0__37__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__37__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_46)));

    vec_rsc_0__38__INST.q(TLS_vec_rsc_0_38_q);
    vec_rsc_0__38__INST.radr(TLS_vec_rsc_0_38_radr);
    vec_rsc_0__38__INST.we(TLS_vec_rsc_0_38_we);
    vec_rsc_0__38__INST.d(TLS_vec_rsc_0_38_d);
    vec_rsc_0__38__INST.wadr(TLS_vec_rsc_0_38_wadr);
    vec_rsc_0__38__INST.clk(clk);
    vec_rsc_0__38__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__38__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_47)));

    vec_rsc_0__39__INST.q(TLS_vec_rsc_0_39_q);
    vec_rsc_0__39__INST.radr(TLS_vec_rsc_0_39_radr);
    vec_rsc_0__39__INST.we(TLS_vec_rsc_0_39_we);
    vec_rsc_0__39__INST.d(TLS_vec_rsc_0_39_d);
    vec_rsc_0__39__INST.wadr(TLS_vec_rsc_0_39_wadr);
    vec_rsc_0__39__INST.clk(clk);
    vec_rsc_0__39__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__39__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_48)));

    vec_rsc_0__40__INST.q(TLS_vec_rsc_0_40_q);
    vec_rsc_0__40__INST.radr(TLS_vec_rsc_0_40_radr);
    vec_rsc_0__40__INST.we(TLS_vec_rsc_0_40_we);
    vec_rsc_0__40__INST.d(TLS_vec_rsc_0_40_d);
    vec_rsc_0__40__INST.wadr(TLS_vec_rsc_0_40_wadr);
    vec_rsc_0__40__INST.clk(clk);
    vec_rsc_0__40__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__40__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_49)));

    vec_rsc_0__41__INST.q(TLS_vec_rsc_0_41_q);
    vec_rsc_0__41__INST.radr(TLS_vec_rsc_0_41_radr);
    vec_rsc_0__41__INST.we(TLS_vec_rsc_0_41_we);
    vec_rsc_0__41__INST.d(TLS_vec_rsc_0_41_d);
    vec_rsc_0__41__INST.wadr(TLS_vec_rsc_0_41_wadr);
    vec_rsc_0__41__INST.clk(clk);
    vec_rsc_0__41__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__41__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_50)));

    vec_rsc_0__42__INST.q(TLS_vec_rsc_0_42_q);
    vec_rsc_0__42__INST.radr(TLS_vec_rsc_0_42_radr);
    vec_rsc_0__42__INST.we(TLS_vec_rsc_0_42_we);
    vec_rsc_0__42__INST.d(TLS_vec_rsc_0_42_d);
    vec_rsc_0__42__INST.wadr(TLS_vec_rsc_0_42_wadr);
    vec_rsc_0__42__INST.clk(clk);
    vec_rsc_0__42__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__42__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_51)));

    vec_rsc_0__43__INST.q(TLS_vec_rsc_0_43_q);
    vec_rsc_0__43__INST.radr(TLS_vec_rsc_0_43_radr);
    vec_rsc_0__43__INST.we(TLS_vec_rsc_0_43_we);
    vec_rsc_0__43__INST.d(TLS_vec_rsc_0_43_d);
    vec_rsc_0__43__INST.wadr(TLS_vec_rsc_0_43_wadr);
    vec_rsc_0__43__INST.clk(clk);
    vec_rsc_0__43__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__43__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_52)));

    vec_rsc_0__44__INST.q(TLS_vec_rsc_0_44_q);
    vec_rsc_0__44__INST.radr(TLS_vec_rsc_0_44_radr);
    vec_rsc_0__44__INST.we(TLS_vec_rsc_0_44_we);
    vec_rsc_0__44__INST.d(TLS_vec_rsc_0_44_d);
    vec_rsc_0__44__INST.wadr(TLS_vec_rsc_0_44_wadr);
    vec_rsc_0__44__INST.clk(clk);
    vec_rsc_0__44__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__44__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_53)));

    vec_rsc_0__45__INST.q(TLS_vec_rsc_0_45_q);
    vec_rsc_0__45__INST.radr(TLS_vec_rsc_0_45_radr);
    vec_rsc_0__45__INST.we(TLS_vec_rsc_0_45_we);
    vec_rsc_0__45__INST.d(TLS_vec_rsc_0_45_d);
    vec_rsc_0__45__INST.wadr(TLS_vec_rsc_0_45_wadr);
    vec_rsc_0__45__INST.clk(clk);
    vec_rsc_0__45__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__45__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_54)));

    vec_rsc_0__46__INST.q(TLS_vec_rsc_0_46_q);
    vec_rsc_0__46__INST.radr(TLS_vec_rsc_0_46_radr);
    vec_rsc_0__46__INST.we(TLS_vec_rsc_0_46_we);
    vec_rsc_0__46__INST.d(TLS_vec_rsc_0_46_d);
    vec_rsc_0__46__INST.wadr(TLS_vec_rsc_0_46_wadr);
    vec_rsc_0__46__INST.clk(clk);
    vec_rsc_0__46__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__46__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_55)));

    vec_rsc_0__47__INST.q(TLS_vec_rsc_0_47_q);
    vec_rsc_0__47__INST.radr(TLS_vec_rsc_0_47_radr);
    vec_rsc_0__47__INST.we(TLS_vec_rsc_0_47_we);
    vec_rsc_0__47__INST.d(TLS_vec_rsc_0_47_d);
    vec_rsc_0__47__INST.wadr(TLS_vec_rsc_0_47_wadr);
    vec_rsc_0__47__INST.clk(clk);
    vec_rsc_0__47__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__47__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_56)));

    vec_rsc_0__48__INST.q(TLS_vec_rsc_0_48_q);
    vec_rsc_0__48__INST.radr(TLS_vec_rsc_0_48_radr);
    vec_rsc_0__48__INST.we(TLS_vec_rsc_0_48_we);
    vec_rsc_0__48__INST.d(TLS_vec_rsc_0_48_d);
    vec_rsc_0__48__INST.wadr(TLS_vec_rsc_0_48_wadr);
    vec_rsc_0__48__INST.clk(clk);
    vec_rsc_0__48__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__48__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_57)));

    vec_rsc_0__49__INST.q(TLS_vec_rsc_0_49_q);
    vec_rsc_0__49__INST.radr(TLS_vec_rsc_0_49_radr);
    vec_rsc_0__49__INST.we(TLS_vec_rsc_0_49_we);
    vec_rsc_0__49__INST.d(TLS_vec_rsc_0_49_d);
    vec_rsc_0__49__INST.wadr(TLS_vec_rsc_0_49_wadr);
    vec_rsc_0__49__INST.clk(clk);
    vec_rsc_0__49__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__49__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_58)));

    vec_rsc_0__50__INST.q(TLS_vec_rsc_0_50_q);
    vec_rsc_0__50__INST.radr(TLS_vec_rsc_0_50_radr);
    vec_rsc_0__50__INST.we(TLS_vec_rsc_0_50_we);
    vec_rsc_0__50__INST.d(TLS_vec_rsc_0_50_d);
    vec_rsc_0__50__INST.wadr(TLS_vec_rsc_0_50_wadr);
    vec_rsc_0__50__INST.clk(clk);
    vec_rsc_0__50__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__50__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_59)));

    vec_rsc_0__51__INST.q(TLS_vec_rsc_0_51_q);
    vec_rsc_0__51__INST.radr(TLS_vec_rsc_0_51_radr);
    vec_rsc_0__51__INST.we(TLS_vec_rsc_0_51_we);
    vec_rsc_0__51__INST.d(TLS_vec_rsc_0_51_d);
    vec_rsc_0__51__INST.wadr(TLS_vec_rsc_0_51_wadr);
    vec_rsc_0__51__INST.clk(clk);
    vec_rsc_0__51__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__51__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_60)));

    vec_rsc_0__52__INST.q(TLS_vec_rsc_0_52_q);
    vec_rsc_0__52__INST.radr(TLS_vec_rsc_0_52_radr);
    vec_rsc_0__52__INST.we(TLS_vec_rsc_0_52_we);
    vec_rsc_0__52__INST.d(TLS_vec_rsc_0_52_d);
    vec_rsc_0__52__INST.wadr(TLS_vec_rsc_0_52_wadr);
    vec_rsc_0__52__INST.clk(clk);
    vec_rsc_0__52__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__52__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_61)));

    vec_rsc_0__53__INST.q(TLS_vec_rsc_0_53_q);
    vec_rsc_0__53__INST.radr(TLS_vec_rsc_0_53_radr);
    vec_rsc_0__53__INST.we(TLS_vec_rsc_0_53_we);
    vec_rsc_0__53__INST.d(TLS_vec_rsc_0_53_d);
    vec_rsc_0__53__INST.wadr(TLS_vec_rsc_0_53_wadr);
    vec_rsc_0__53__INST.clk(clk);
    vec_rsc_0__53__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__53__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_62)));

    vec_rsc_0__54__INST.q(TLS_vec_rsc_0_54_q);
    vec_rsc_0__54__INST.radr(TLS_vec_rsc_0_54_radr);
    vec_rsc_0__54__INST.we(TLS_vec_rsc_0_54_we);
    vec_rsc_0__54__INST.d(TLS_vec_rsc_0_54_d);
    vec_rsc_0__54__INST.wadr(TLS_vec_rsc_0_54_wadr);
    vec_rsc_0__54__INST.clk(clk);
    vec_rsc_0__54__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__54__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_63)));

    vec_rsc_0__55__INST.q(TLS_vec_rsc_0_55_q);
    vec_rsc_0__55__INST.radr(TLS_vec_rsc_0_55_radr);
    vec_rsc_0__55__INST.we(TLS_vec_rsc_0_55_we);
    vec_rsc_0__55__INST.d(TLS_vec_rsc_0_55_d);
    vec_rsc_0__55__INST.wadr(TLS_vec_rsc_0_55_wadr);
    vec_rsc_0__55__INST.clk(clk);
    vec_rsc_0__55__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__55__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_64)));

    vec_rsc_0__56__INST.q(TLS_vec_rsc_0_56_q);
    vec_rsc_0__56__INST.radr(TLS_vec_rsc_0_56_radr);
    vec_rsc_0__56__INST.we(TLS_vec_rsc_0_56_we);
    vec_rsc_0__56__INST.d(TLS_vec_rsc_0_56_d);
    vec_rsc_0__56__INST.wadr(TLS_vec_rsc_0_56_wadr);
    vec_rsc_0__56__INST.clk(clk);
    vec_rsc_0__56__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__56__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_65)));

    vec_rsc_0__57__INST.q(TLS_vec_rsc_0_57_q);
    vec_rsc_0__57__INST.radr(TLS_vec_rsc_0_57_radr);
    vec_rsc_0__57__INST.we(TLS_vec_rsc_0_57_we);
    vec_rsc_0__57__INST.d(TLS_vec_rsc_0_57_d);
    vec_rsc_0__57__INST.wadr(TLS_vec_rsc_0_57_wadr);
    vec_rsc_0__57__INST.clk(clk);
    vec_rsc_0__57__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__57__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_66)));

    vec_rsc_0__58__INST.q(TLS_vec_rsc_0_58_q);
    vec_rsc_0__58__INST.radr(TLS_vec_rsc_0_58_radr);
    vec_rsc_0__58__INST.we(TLS_vec_rsc_0_58_we);
    vec_rsc_0__58__INST.d(TLS_vec_rsc_0_58_d);
    vec_rsc_0__58__INST.wadr(TLS_vec_rsc_0_58_wadr);
    vec_rsc_0__58__INST.clk(clk);
    vec_rsc_0__58__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__58__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_67)));

    vec_rsc_0__59__INST.q(TLS_vec_rsc_0_59_q);
    vec_rsc_0__59__INST.radr(TLS_vec_rsc_0_59_radr);
    vec_rsc_0__59__INST.we(TLS_vec_rsc_0_59_we);
    vec_rsc_0__59__INST.d(TLS_vec_rsc_0_59_d);
    vec_rsc_0__59__INST.wadr(TLS_vec_rsc_0_59_wadr);
    vec_rsc_0__59__INST.clk(clk);
    vec_rsc_0__59__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__59__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_68)));

    vec_rsc_0__60__INST.q(TLS_vec_rsc_0_60_q);
    vec_rsc_0__60__INST.radr(TLS_vec_rsc_0_60_radr);
    vec_rsc_0__60__INST.we(TLS_vec_rsc_0_60_we);
    vec_rsc_0__60__INST.d(TLS_vec_rsc_0_60_d);
    vec_rsc_0__60__INST.wadr(TLS_vec_rsc_0_60_wadr);
    vec_rsc_0__60__INST.clk(clk);
    vec_rsc_0__60__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__60__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_69)));

    vec_rsc_0__61__INST.q(TLS_vec_rsc_0_61_q);
    vec_rsc_0__61__INST.radr(TLS_vec_rsc_0_61_radr);
    vec_rsc_0__61__INST.we(TLS_vec_rsc_0_61_we);
    vec_rsc_0__61__INST.d(TLS_vec_rsc_0_61_d);
    vec_rsc_0__61__INST.wadr(TLS_vec_rsc_0_61_wadr);
    vec_rsc_0__61__INST.clk(clk);
    vec_rsc_0__61__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__61__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_70)));

    vec_rsc_0__62__INST.q(TLS_vec_rsc_0_62_q);
    vec_rsc_0__62__INST.radr(TLS_vec_rsc_0_62_radr);
    vec_rsc_0__62__INST.we(TLS_vec_rsc_0_62_we);
    vec_rsc_0__62__INST.d(TLS_vec_rsc_0_62_d);
    vec_rsc_0__62__INST.wadr(TLS_vec_rsc_0_62_wadr);
    vec_rsc_0__62__INST.clk(clk);
    vec_rsc_0__62__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__62__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_71)));

    vec_rsc_0__63__INST.q(TLS_vec_rsc_0_63_q);
    vec_rsc_0__63__INST.radr(TLS_vec_rsc_0_63_radr);
    vec_rsc_0__63__INST.we(TLS_vec_rsc_0_63_we);
    vec_rsc_0__63__INST.d(TLS_vec_rsc_0_63_d);
    vec_rsc_0__63__INST.wadr(TLS_vec_rsc_0_63_wadr);
    vec_rsc_0__63__INST.clk(clk);
    vec_rsc_0__63__INST.clken(SIG_SC_LOGIC_1);
    vec_rsc_0__63__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_72)));

    p_rsc_INST.dat(TLS_p_rsc_dat);
    p_rsc_INST.clk(clk);
    p_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_5)));

    r_rsc_INST.dat(TLS_r_rsc_dat);
    r_rsc_INST.clk(clk);
    r_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_6)));

    twiddle_rsc_0__0__INST.q(TLS_twiddle_rsc_0_0_q);
    twiddle_rsc_0__0__INST.radr(TLS_twiddle_rsc_0_0_radr);
    twiddle_rsc_0__0__INST.clk(clk);
    twiddle_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__0__INST.d(TLS_twiddle_rsc_0__0__d);
    twiddle_rsc_0__0__INST.wadr(TLS_twiddle_rsc_0__0__wadr);
    twiddle_rsc_0__0__INST.we(TLS_twiddle_rsc_0__0__we);
    twiddle_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_73)));

    twiddle_rsc_0__1__INST.q(TLS_twiddle_rsc_0_1_q);
    twiddle_rsc_0__1__INST.radr(TLS_twiddle_rsc_0_1_radr);
    twiddle_rsc_0__1__INST.clk(clk);
    twiddle_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__1__INST.d(TLS_twiddle_rsc_0__1__d);
    twiddle_rsc_0__1__INST.wadr(TLS_twiddle_rsc_0__1__wadr);
    twiddle_rsc_0__1__INST.we(TLS_twiddle_rsc_0__1__we);
    twiddle_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_74)));

    twiddle_rsc_0__2__INST.q(TLS_twiddle_rsc_0_2_q);
    twiddle_rsc_0__2__INST.radr(TLS_twiddle_rsc_0_2_radr);
    twiddle_rsc_0__2__INST.clk(clk);
    twiddle_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__2__INST.d(TLS_twiddle_rsc_0__2__d);
    twiddle_rsc_0__2__INST.wadr(TLS_twiddle_rsc_0__2__wadr);
    twiddle_rsc_0__2__INST.we(TLS_twiddle_rsc_0__2__we);
    twiddle_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_75)));

    twiddle_rsc_0__3__INST.q(TLS_twiddle_rsc_0_3_q);
    twiddle_rsc_0__3__INST.radr(TLS_twiddle_rsc_0_3_radr);
    twiddle_rsc_0__3__INST.clk(clk);
    twiddle_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__3__INST.d(TLS_twiddle_rsc_0__3__d);
    twiddle_rsc_0__3__INST.wadr(TLS_twiddle_rsc_0__3__wadr);
    twiddle_rsc_0__3__INST.we(TLS_twiddle_rsc_0__3__we);
    twiddle_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_76)));

    twiddle_rsc_0__4__INST.q(TLS_twiddle_rsc_0_4_q);
    twiddle_rsc_0__4__INST.radr(TLS_twiddle_rsc_0_4_radr);
    twiddle_rsc_0__4__INST.clk(clk);
    twiddle_rsc_0__4__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__4__INST.d(TLS_twiddle_rsc_0__4__d);
    twiddle_rsc_0__4__INST.wadr(TLS_twiddle_rsc_0__4__wadr);
    twiddle_rsc_0__4__INST.we(TLS_twiddle_rsc_0__4__we);
    twiddle_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_77)));

    twiddle_rsc_0__5__INST.q(TLS_twiddle_rsc_0_5_q);
    twiddle_rsc_0__5__INST.radr(TLS_twiddle_rsc_0_5_radr);
    twiddle_rsc_0__5__INST.clk(clk);
    twiddle_rsc_0__5__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__5__INST.d(TLS_twiddle_rsc_0__5__d);
    twiddle_rsc_0__5__INST.wadr(TLS_twiddle_rsc_0__5__wadr);
    twiddle_rsc_0__5__INST.we(TLS_twiddle_rsc_0__5__we);
    twiddle_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_78)));

    twiddle_rsc_0__6__INST.q(TLS_twiddle_rsc_0_6_q);
    twiddle_rsc_0__6__INST.radr(TLS_twiddle_rsc_0_6_radr);
    twiddle_rsc_0__6__INST.clk(clk);
    twiddle_rsc_0__6__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__6__INST.d(TLS_twiddle_rsc_0__6__d);
    twiddle_rsc_0__6__INST.wadr(TLS_twiddle_rsc_0__6__wadr);
    twiddle_rsc_0__6__INST.we(TLS_twiddle_rsc_0__6__we);
    twiddle_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_79)));

    twiddle_rsc_0__7__INST.q(TLS_twiddle_rsc_0_7_q);
    twiddle_rsc_0__7__INST.radr(TLS_twiddle_rsc_0_7_radr);
    twiddle_rsc_0__7__INST.clk(clk);
    twiddle_rsc_0__7__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__7__INST.d(TLS_twiddle_rsc_0__7__d);
    twiddle_rsc_0__7__INST.wadr(TLS_twiddle_rsc_0__7__wadr);
    twiddle_rsc_0__7__INST.we(TLS_twiddle_rsc_0__7__we);
    twiddle_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_80)));

    twiddle_rsc_0__8__INST.q(TLS_twiddle_rsc_0_8_q);
    twiddle_rsc_0__8__INST.radr(TLS_twiddle_rsc_0_8_radr);
    twiddle_rsc_0__8__INST.clk(clk);
    twiddle_rsc_0__8__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__8__INST.d(TLS_twiddle_rsc_0__8__d);
    twiddle_rsc_0__8__INST.wadr(TLS_twiddle_rsc_0__8__wadr);
    twiddle_rsc_0__8__INST.we(TLS_twiddle_rsc_0__8__we);
    twiddle_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_81)));

    twiddle_rsc_0__9__INST.q(TLS_twiddle_rsc_0_9_q);
    twiddle_rsc_0__9__INST.radr(TLS_twiddle_rsc_0_9_radr);
    twiddle_rsc_0__9__INST.clk(clk);
    twiddle_rsc_0__9__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__9__INST.d(TLS_twiddle_rsc_0__9__d);
    twiddle_rsc_0__9__INST.wadr(TLS_twiddle_rsc_0__9__wadr);
    twiddle_rsc_0__9__INST.we(TLS_twiddle_rsc_0__9__we);
    twiddle_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_82)));

    twiddle_rsc_0__10__INST.q(TLS_twiddle_rsc_0_10_q);
    twiddle_rsc_0__10__INST.radr(TLS_twiddle_rsc_0_10_radr);
    twiddle_rsc_0__10__INST.clk(clk);
    twiddle_rsc_0__10__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__10__INST.d(TLS_twiddle_rsc_0__10__d);
    twiddle_rsc_0__10__INST.wadr(TLS_twiddle_rsc_0__10__wadr);
    twiddle_rsc_0__10__INST.we(TLS_twiddle_rsc_0__10__we);
    twiddle_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_83)));

    twiddle_rsc_0__11__INST.q(TLS_twiddle_rsc_0_11_q);
    twiddle_rsc_0__11__INST.radr(TLS_twiddle_rsc_0_11_radr);
    twiddle_rsc_0__11__INST.clk(clk);
    twiddle_rsc_0__11__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__11__INST.d(TLS_twiddle_rsc_0__11__d);
    twiddle_rsc_0__11__INST.wadr(TLS_twiddle_rsc_0__11__wadr);
    twiddle_rsc_0__11__INST.we(TLS_twiddle_rsc_0__11__we);
    twiddle_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_84)));

    twiddle_rsc_0__12__INST.q(TLS_twiddle_rsc_0_12_q);
    twiddle_rsc_0__12__INST.radr(TLS_twiddle_rsc_0_12_radr);
    twiddle_rsc_0__12__INST.clk(clk);
    twiddle_rsc_0__12__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__12__INST.d(TLS_twiddle_rsc_0__12__d);
    twiddle_rsc_0__12__INST.wadr(TLS_twiddle_rsc_0__12__wadr);
    twiddle_rsc_0__12__INST.we(TLS_twiddle_rsc_0__12__we);
    twiddle_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_85)));

    twiddle_rsc_0__13__INST.q(TLS_twiddle_rsc_0_13_q);
    twiddle_rsc_0__13__INST.radr(TLS_twiddle_rsc_0_13_radr);
    twiddle_rsc_0__13__INST.clk(clk);
    twiddle_rsc_0__13__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__13__INST.d(TLS_twiddle_rsc_0__13__d);
    twiddle_rsc_0__13__INST.wadr(TLS_twiddle_rsc_0__13__wadr);
    twiddle_rsc_0__13__INST.we(TLS_twiddle_rsc_0__13__we);
    twiddle_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_86)));

    twiddle_rsc_0__14__INST.q(TLS_twiddle_rsc_0_14_q);
    twiddle_rsc_0__14__INST.radr(TLS_twiddle_rsc_0_14_radr);
    twiddle_rsc_0__14__INST.clk(clk);
    twiddle_rsc_0__14__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__14__INST.d(TLS_twiddle_rsc_0__14__d);
    twiddle_rsc_0__14__INST.wadr(TLS_twiddle_rsc_0__14__wadr);
    twiddle_rsc_0__14__INST.we(TLS_twiddle_rsc_0__14__we);
    twiddle_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_87)));

    twiddle_rsc_0__15__INST.q(TLS_twiddle_rsc_0_15_q);
    twiddle_rsc_0__15__INST.radr(TLS_twiddle_rsc_0_15_radr);
    twiddle_rsc_0__15__INST.clk(clk);
    twiddle_rsc_0__15__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__15__INST.d(TLS_twiddle_rsc_0__15__d);
    twiddle_rsc_0__15__INST.wadr(TLS_twiddle_rsc_0__15__wadr);
    twiddle_rsc_0__15__INST.we(TLS_twiddle_rsc_0__15__we);
    twiddle_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_88)));

    twiddle_rsc_0__16__INST.q(TLS_twiddle_rsc_0_16_q);
    twiddle_rsc_0__16__INST.radr(TLS_twiddle_rsc_0_16_radr);
    twiddle_rsc_0__16__INST.clk(clk);
    twiddle_rsc_0__16__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__16__INST.d(TLS_twiddle_rsc_0__16__d);
    twiddle_rsc_0__16__INST.wadr(TLS_twiddle_rsc_0__16__wadr);
    twiddle_rsc_0__16__INST.we(TLS_twiddle_rsc_0__16__we);
    twiddle_rsc_0__16__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_89)));

    twiddle_rsc_0__17__INST.q(TLS_twiddle_rsc_0_17_q);
    twiddle_rsc_0__17__INST.radr(TLS_twiddle_rsc_0_17_radr);
    twiddle_rsc_0__17__INST.clk(clk);
    twiddle_rsc_0__17__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__17__INST.d(TLS_twiddle_rsc_0__17__d);
    twiddle_rsc_0__17__INST.wadr(TLS_twiddle_rsc_0__17__wadr);
    twiddle_rsc_0__17__INST.we(TLS_twiddle_rsc_0__17__we);
    twiddle_rsc_0__17__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_90)));

    twiddle_rsc_0__18__INST.q(TLS_twiddle_rsc_0_18_q);
    twiddle_rsc_0__18__INST.radr(TLS_twiddle_rsc_0_18_radr);
    twiddle_rsc_0__18__INST.clk(clk);
    twiddle_rsc_0__18__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__18__INST.d(TLS_twiddle_rsc_0__18__d);
    twiddle_rsc_0__18__INST.wadr(TLS_twiddle_rsc_0__18__wadr);
    twiddle_rsc_0__18__INST.we(TLS_twiddle_rsc_0__18__we);
    twiddle_rsc_0__18__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_91)));

    twiddle_rsc_0__19__INST.q(TLS_twiddle_rsc_0_19_q);
    twiddle_rsc_0__19__INST.radr(TLS_twiddle_rsc_0_19_radr);
    twiddle_rsc_0__19__INST.clk(clk);
    twiddle_rsc_0__19__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__19__INST.d(TLS_twiddle_rsc_0__19__d);
    twiddle_rsc_0__19__INST.wadr(TLS_twiddle_rsc_0__19__wadr);
    twiddle_rsc_0__19__INST.we(TLS_twiddle_rsc_0__19__we);
    twiddle_rsc_0__19__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_92)));

    twiddle_rsc_0__20__INST.q(TLS_twiddle_rsc_0_20_q);
    twiddle_rsc_0__20__INST.radr(TLS_twiddle_rsc_0_20_radr);
    twiddle_rsc_0__20__INST.clk(clk);
    twiddle_rsc_0__20__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__20__INST.d(TLS_twiddle_rsc_0__20__d);
    twiddle_rsc_0__20__INST.wadr(TLS_twiddle_rsc_0__20__wadr);
    twiddle_rsc_0__20__INST.we(TLS_twiddle_rsc_0__20__we);
    twiddle_rsc_0__20__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_93)));

    twiddle_rsc_0__21__INST.q(TLS_twiddle_rsc_0_21_q);
    twiddle_rsc_0__21__INST.radr(TLS_twiddle_rsc_0_21_radr);
    twiddle_rsc_0__21__INST.clk(clk);
    twiddle_rsc_0__21__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__21__INST.d(TLS_twiddle_rsc_0__21__d);
    twiddle_rsc_0__21__INST.wadr(TLS_twiddle_rsc_0__21__wadr);
    twiddle_rsc_0__21__INST.we(TLS_twiddle_rsc_0__21__we);
    twiddle_rsc_0__21__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_94)));

    twiddle_rsc_0__22__INST.q(TLS_twiddle_rsc_0_22_q);
    twiddle_rsc_0__22__INST.radr(TLS_twiddle_rsc_0_22_radr);
    twiddle_rsc_0__22__INST.clk(clk);
    twiddle_rsc_0__22__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__22__INST.d(TLS_twiddle_rsc_0__22__d);
    twiddle_rsc_0__22__INST.wadr(TLS_twiddle_rsc_0__22__wadr);
    twiddle_rsc_0__22__INST.we(TLS_twiddle_rsc_0__22__we);
    twiddle_rsc_0__22__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_95)));

    twiddle_rsc_0__23__INST.q(TLS_twiddle_rsc_0_23_q);
    twiddle_rsc_0__23__INST.radr(TLS_twiddle_rsc_0_23_radr);
    twiddle_rsc_0__23__INST.clk(clk);
    twiddle_rsc_0__23__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__23__INST.d(TLS_twiddle_rsc_0__23__d);
    twiddle_rsc_0__23__INST.wadr(TLS_twiddle_rsc_0__23__wadr);
    twiddle_rsc_0__23__INST.we(TLS_twiddle_rsc_0__23__we);
    twiddle_rsc_0__23__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_96)));

    twiddle_rsc_0__24__INST.q(TLS_twiddle_rsc_0_24_q);
    twiddle_rsc_0__24__INST.radr(TLS_twiddle_rsc_0_24_radr);
    twiddle_rsc_0__24__INST.clk(clk);
    twiddle_rsc_0__24__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__24__INST.d(TLS_twiddle_rsc_0__24__d);
    twiddle_rsc_0__24__INST.wadr(TLS_twiddle_rsc_0__24__wadr);
    twiddle_rsc_0__24__INST.we(TLS_twiddle_rsc_0__24__we);
    twiddle_rsc_0__24__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_97)));

    twiddle_rsc_0__25__INST.q(TLS_twiddle_rsc_0_25_q);
    twiddle_rsc_0__25__INST.radr(TLS_twiddle_rsc_0_25_radr);
    twiddle_rsc_0__25__INST.clk(clk);
    twiddle_rsc_0__25__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__25__INST.d(TLS_twiddle_rsc_0__25__d);
    twiddle_rsc_0__25__INST.wadr(TLS_twiddle_rsc_0__25__wadr);
    twiddle_rsc_0__25__INST.we(TLS_twiddle_rsc_0__25__we);
    twiddle_rsc_0__25__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_98)));

    twiddle_rsc_0__26__INST.q(TLS_twiddle_rsc_0_26_q);
    twiddle_rsc_0__26__INST.radr(TLS_twiddle_rsc_0_26_radr);
    twiddle_rsc_0__26__INST.clk(clk);
    twiddle_rsc_0__26__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__26__INST.d(TLS_twiddle_rsc_0__26__d);
    twiddle_rsc_0__26__INST.wadr(TLS_twiddle_rsc_0__26__wadr);
    twiddle_rsc_0__26__INST.we(TLS_twiddle_rsc_0__26__we);
    twiddle_rsc_0__26__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_99)));

    twiddle_rsc_0__27__INST.q(TLS_twiddle_rsc_0_27_q);
    twiddle_rsc_0__27__INST.radr(TLS_twiddle_rsc_0_27_radr);
    twiddle_rsc_0__27__INST.clk(clk);
    twiddle_rsc_0__27__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__27__INST.d(TLS_twiddle_rsc_0__27__d);
    twiddle_rsc_0__27__INST.wadr(TLS_twiddle_rsc_0__27__wadr);
    twiddle_rsc_0__27__INST.we(TLS_twiddle_rsc_0__27__we);
    twiddle_rsc_0__27__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_100)));

    twiddle_rsc_0__28__INST.q(TLS_twiddle_rsc_0_28_q);
    twiddle_rsc_0__28__INST.radr(TLS_twiddle_rsc_0_28_radr);
    twiddle_rsc_0__28__INST.clk(clk);
    twiddle_rsc_0__28__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__28__INST.d(TLS_twiddle_rsc_0__28__d);
    twiddle_rsc_0__28__INST.wadr(TLS_twiddle_rsc_0__28__wadr);
    twiddle_rsc_0__28__INST.we(TLS_twiddle_rsc_0__28__we);
    twiddle_rsc_0__28__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_101)));

    twiddle_rsc_0__29__INST.q(TLS_twiddle_rsc_0_29_q);
    twiddle_rsc_0__29__INST.radr(TLS_twiddle_rsc_0_29_radr);
    twiddle_rsc_0__29__INST.clk(clk);
    twiddle_rsc_0__29__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__29__INST.d(TLS_twiddle_rsc_0__29__d);
    twiddle_rsc_0__29__INST.wadr(TLS_twiddle_rsc_0__29__wadr);
    twiddle_rsc_0__29__INST.we(TLS_twiddle_rsc_0__29__we);
    twiddle_rsc_0__29__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_102)));

    twiddle_rsc_0__30__INST.q(TLS_twiddle_rsc_0_30_q);
    twiddle_rsc_0__30__INST.radr(TLS_twiddle_rsc_0_30_radr);
    twiddle_rsc_0__30__INST.clk(clk);
    twiddle_rsc_0__30__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__30__INST.d(TLS_twiddle_rsc_0__30__d);
    twiddle_rsc_0__30__INST.wadr(TLS_twiddle_rsc_0__30__wadr);
    twiddle_rsc_0__30__INST.we(TLS_twiddle_rsc_0__30__we);
    twiddle_rsc_0__30__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_103)));

    twiddle_rsc_0__31__INST.q(TLS_twiddle_rsc_0_31_q);
    twiddle_rsc_0__31__INST.radr(TLS_twiddle_rsc_0_31_radr);
    twiddle_rsc_0__31__INST.clk(clk);
    twiddle_rsc_0__31__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__31__INST.d(TLS_twiddle_rsc_0__31__d);
    twiddle_rsc_0__31__INST.wadr(TLS_twiddle_rsc_0__31__wadr);
    twiddle_rsc_0__31__INST.we(TLS_twiddle_rsc_0__31__we);
    twiddle_rsc_0__31__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_104)));

    twiddle_rsc_0__32__INST.q(TLS_twiddle_rsc_0_32_q);
    twiddle_rsc_0__32__INST.radr(TLS_twiddle_rsc_0_32_radr);
    twiddle_rsc_0__32__INST.clk(clk);
    twiddle_rsc_0__32__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__32__INST.d(TLS_twiddle_rsc_0__32__d);
    twiddle_rsc_0__32__INST.wadr(TLS_twiddle_rsc_0__32__wadr);
    twiddle_rsc_0__32__INST.we(TLS_twiddle_rsc_0__32__we);
    twiddle_rsc_0__32__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_105)));

    twiddle_rsc_0__33__INST.q(TLS_twiddle_rsc_0_33_q);
    twiddle_rsc_0__33__INST.radr(TLS_twiddle_rsc_0_33_radr);
    twiddle_rsc_0__33__INST.clk(clk);
    twiddle_rsc_0__33__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__33__INST.d(TLS_twiddle_rsc_0__33__d);
    twiddle_rsc_0__33__INST.wadr(TLS_twiddle_rsc_0__33__wadr);
    twiddle_rsc_0__33__INST.we(TLS_twiddle_rsc_0__33__we);
    twiddle_rsc_0__33__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_106)));

    twiddle_rsc_0__34__INST.q(TLS_twiddle_rsc_0_34_q);
    twiddle_rsc_0__34__INST.radr(TLS_twiddle_rsc_0_34_radr);
    twiddle_rsc_0__34__INST.clk(clk);
    twiddle_rsc_0__34__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__34__INST.d(TLS_twiddle_rsc_0__34__d);
    twiddle_rsc_0__34__INST.wadr(TLS_twiddle_rsc_0__34__wadr);
    twiddle_rsc_0__34__INST.we(TLS_twiddle_rsc_0__34__we);
    twiddle_rsc_0__34__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_107)));

    twiddle_rsc_0__35__INST.q(TLS_twiddle_rsc_0_35_q);
    twiddle_rsc_0__35__INST.radr(TLS_twiddle_rsc_0_35_radr);
    twiddle_rsc_0__35__INST.clk(clk);
    twiddle_rsc_0__35__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__35__INST.d(TLS_twiddle_rsc_0__35__d);
    twiddle_rsc_0__35__INST.wadr(TLS_twiddle_rsc_0__35__wadr);
    twiddle_rsc_0__35__INST.we(TLS_twiddle_rsc_0__35__we);
    twiddle_rsc_0__35__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_108)));

    twiddle_rsc_0__36__INST.q(TLS_twiddle_rsc_0_36_q);
    twiddle_rsc_0__36__INST.radr(TLS_twiddle_rsc_0_36_radr);
    twiddle_rsc_0__36__INST.clk(clk);
    twiddle_rsc_0__36__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__36__INST.d(TLS_twiddle_rsc_0__36__d);
    twiddle_rsc_0__36__INST.wadr(TLS_twiddle_rsc_0__36__wadr);
    twiddle_rsc_0__36__INST.we(TLS_twiddle_rsc_0__36__we);
    twiddle_rsc_0__36__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_109)));

    twiddle_rsc_0__37__INST.q(TLS_twiddle_rsc_0_37_q);
    twiddle_rsc_0__37__INST.radr(TLS_twiddle_rsc_0_37_radr);
    twiddle_rsc_0__37__INST.clk(clk);
    twiddle_rsc_0__37__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__37__INST.d(TLS_twiddle_rsc_0__37__d);
    twiddle_rsc_0__37__INST.wadr(TLS_twiddle_rsc_0__37__wadr);
    twiddle_rsc_0__37__INST.we(TLS_twiddle_rsc_0__37__we);
    twiddle_rsc_0__37__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_110)));

    twiddle_rsc_0__38__INST.q(TLS_twiddle_rsc_0_38_q);
    twiddle_rsc_0__38__INST.radr(TLS_twiddle_rsc_0_38_radr);
    twiddle_rsc_0__38__INST.clk(clk);
    twiddle_rsc_0__38__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__38__INST.d(TLS_twiddle_rsc_0__38__d);
    twiddle_rsc_0__38__INST.wadr(TLS_twiddle_rsc_0__38__wadr);
    twiddle_rsc_0__38__INST.we(TLS_twiddle_rsc_0__38__we);
    twiddle_rsc_0__38__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_111)));

    twiddle_rsc_0__39__INST.q(TLS_twiddle_rsc_0_39_q);
    twiddle_rsc_0__39__INST.radr(TLS_twiddle_rsc_0_39_radr);
    twiddle_rsc_0__39__INST.clk(clk);
    twiddle_rsc_0__39__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__39__INST.d(TLS_twiddle_rsc_0__39__d);
    twiddle_rsc_0__39__INST.wadr(TLS_twiddle_rsc_0__39__wadr);
    twiddle_rsc_0__39__INST.we(TLS_twiddle_rsc_0__39__we);
    twiddle_rsc_0__39__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_112)));

    twiddle_rsc_0__40__INST.q(TLS_twiddle_rsc_0_40_q);
    twiddle_rsc_0__40__INST.radr(TLS_twiddle_rsc_0_40_radr);
    twiddle_rsc_0__40__INST.clk(clk);
    twiddle_rsc_0__40__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__40__INST.d(TLS_twiddle_rsc_0__40__d);
    twiddle_rsc_0__40__INST.wadr(TLS_twiddle_rsc_0__40__wadr);
    twiddle_rsc_0__40__INST.we(TLS_twiddle_rsc_0__40__we);
    twiddle_rsc_0__40__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_113)));

    twiddle_rsc_0__41__INST.q(TLS_twiddle_rsc_0_41_q);
    twiddle_rsc_0__41__INST.radr(TLS_twiddle_rsc_0_41_radr);
    twiddle_rsc_0__41__INST.clk(clk);
    twiddle_rsc_0__41__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__41__INST.d(TLS_twiddle_rsc_0__41__d);
    twiddle_rsc_0__41__INST.wadr(TLS_twiddle_rsc_0__41__wadr);
    twiddle_rsc_0__41__INST.we(TLS_twiddle_rsc_0__41__we);
    twiddle_rsc_0__41__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_114)));

    twiddle_rsc_0__42__INST.q(TLS_twiddle_rsc_0_42_q);
    twiddle_rsc_0__42__INST.radr(TLS_twiddle_rsc_0_42_radr);
    twiddle_rsc_0__42__INST.clk(clk);
    twiddle_rsc_0__42__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__42__INST.d(TLS_twiddle_rsc_0__42__d);
    twiddle_rsc_0__42__INST.wadr(TLS_twiddle_rsc_0__42__wadr);
    twiddle_rsc_0__42__INST.we(TLS_twiddle_rsc_0__42__we);
    twiddle_rsc_0__42__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_115)));

    twiddle_rsc_0__43__INST.q(TLS_twiddle_rsc_0_43_q);
    twiddle_rsc_0__43__INST.radr(TLS_twiddle_rsc_0_43_radr);
    twiddle_rsc_0__43__INST.clk(clk);
    twiddle_rsc_0__43__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__43__INST.d(TLS_twiddle_rsc_0__43__d);
    twiddle_rsc_0__43__INST.wadr(TLS_twiddle_rsc_0__43__wadr);
    twiddle_rsc_0__43__INST.we(TLS_twiddle_rsc_0__43__we);
    twiddle_rsc_0__43__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_116)));

    twiddle_rsc_0__44__INST.q(TLS_twiddle_rsc_0_44_q);
    twiddle_rsc_0__44__INST.radr(TLS_twiddle_rsc_0_44_radr);
    twiddle_rsc_0__44__INST.clk(clk);
    twiddle_rsc_0__44__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__44__INST.d(TLS_twiddle_rsc_0__44__d);
    twiddle_rsc_0__44__INST.wadr(TLS_twiddle_rsc_0__44__wadr);
    twiddle_rsc_0__44__INST.we(TLS_twiddle_rsc_0__44__we);
    twiddle_rsc_0__44__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_117)));

    twiddle_rsc_0__45__INST.q(TLS_twiddle_rsc_0_45_q);
    twiddle_rsc_0__45__INST.radr(TLS_twiddle_rsc_0_45_radr);
    twiddle_rsc_0__45__INST.clk(clk);
    twiddle_rsc_0__45__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__45__INST.d(TLS_twiddle_rsc_0__45__d);
    twiddle_rsc_0__45__INST.wadr(TLS_twiddle_rsc_0__45__wadr);
    twiddle_rsc_0__45__INST.we(TLS_twiddle_rsc_0__45__we);
    twiddle_rsc_0__45__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_118)));

    twiddle_rsc_0__46__INST.q(TLS_twiddle_rsc_0_46_q);
    twiddle_rsc_0__46__INST.radr(TLS_twiddle_rsc_0_46_radr);
    twiddle_rsc_0__46__INST.clk(clk);
    twiddle_rsc_0__46__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__46__INST.d(TLS_twiddle_rsc_0__46__d);
    twiddle_rsc_0__46__INST.wadr(TLS_twiddle_rsc_0__46__wadr);
    twiddle_rsc_0__46__INST.we(TLS_twiddle_rsc_0__46__we);
    twiddle_rsc_0__46__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_119)));

    twiddle_rsc_0__47__INST.q(TLS_twiddle_rsc_0_47_q);
    twiddle_rsc_0__47__INST.radr(TLS_twiddle_rsc_0_47_radr);
    twiddle_rsc_0__47__INST.clk(clk);
    twiddle_rsc_0__47__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__47__INST.d(TLS_twiddle_rsc_0__47__d);
    twiddle_rsc_0__47__INST.wadr(TLS_twiddle_rsc_0__47__wadr);
    twiddle_rsc_0__47__INST.we(TLS_twiddle_rsc_0__47__we);
    twiddle_rsc_0__47__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_120)));

    twiddle_rsc_0__48__INST.q(TLS_twiddle_rsc_0_48_q);
    twiddle_rsc_0__48__INST.radr(TLS_twiddle_rsc_0_48_radr);
    twiddle_rsc_0__48__INST.clk(clk);
    twiddle_rsc_0__48__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__48__INST.d(TLS_twiddle_rsc_0__48__d);
    twiddle_rsc_0__48__INST.wadr(TLS_twiddle_rsc_0__48__wadr);
    twiddle_rsc_0__48__INST.we(TLS_twiddle_rsc_0__48__we);
    twiddle_rsc_0__48__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_121)));

    twiddle_rsc_0__49__INST.q(TLS_twiddle_rsc_0_49_q);
    twiddle_rsc_0__49__INST.radr(TLS_twiddle_rsc_0_49_radr);
    twiddle_rsc_0__49__INST.clk(clk);
    twiddle_rsc_0__49__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__49__INST.d(TLS_twiddle_rsc_0__49__d);
    twiddle_rsc_0__49__INST.wadr(TLS_twiddle_rsc_0__49__wadr);
    twiddle_rsc_0__49__INST.we(TLS_twiddle_rsc_0__49__we);
    twiddle_rsc_0__49__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_122)));

    twiddle_rsc_0__50__INST.q(TLS_twiddle_rsc_0_50_q);
    twiddle_rsc_0__50__INST.radr(TLS_twiddle_rsc_0_50_radr);
    twiddle_rsc_0__50__INST.clk(clk);
    twiddle_rsc_0__50__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__50__INST.d(TLS_twiddle_rsc_0__50__d);
    twiddle_rsc_0__50__INST.wadr(TLS_twiddle_rsc_0__50__wadr);
    twiddle_rsc_0__50__INST.we(TLS_twiddle_rsc_0__50__we);
    twiddle_rsc_0__50__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_123)));

    twiddle_rsc_0__51__INST.q(TLS_twiddle_rsc_0_51_q);
    twiddle_rsc_0__51__INST.radr(TLS_twiddle_rsc_0_51_radr);
    twiddle_rsc_0__51__INST.clk(clk);
    twiddle_rsc_0__51__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__51__INST.d(TLS_twiddle_rsc_0__51__d);
    twiddle_rsc_0__51__INST.wadr(TLS_twiddle_rsc_0__51__wadr);
    twiddle_rsc_0__51__INST.we(TLS_twiddle_rsc_0__51__we);
    twiddle_rsc_0__51__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_124)));

    twiddle_rsc_0__52__INST.q(TLS_twiddle_rsc_0_52_q);
    twiddle_rsc_0__52__INST.radr(TLS_twiddle_rsc_0_52_radr);
    twiddle_rsc_0__52__INST.clk(clk);
    twiddle_rsc_0__52__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__52__INST.d(TLS_twiddle_rsc_0__52__d);
    twiddle_rsc_0__52__INST.wadr(TLS_twiddle_rsc_0__52__wadr);
    twiddle_rsc_0__52__INST.we(TLS_twiddle_rsc_0__52__we);
    twiddle_rsc_0__52__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_125)));

    twiddle_rsc_0__53__INST.q(TLS_twiddle_rsc_0_53_q);
    twiddle_rsc_0__53__INST.radr(TLS_twiddle_rsc_0_53_radr);
    twiddle_rsc_0__53__INST.clk(clk);
    twiddle_rsc_0__53__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__53__INST.d(TLS_twiddle_rsc_0__53__d);
    twiddle_rsc_0__53__INST.wadr(TLS_twiddle_rsc_0__53__wadr);
    twiddle_rsc_0__53__INST.we(TLS_twiddle_rsc_0__53__we);
    twiddle_rsc_0__53__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_126)));

    twiddle_rsc_0__54__INST.q(TLS_twiddle_rsc_0_54_q);
    twiddle_rsc_0__54__INST.radr(TLS_twiddle_rsc_0_54_radr);
    twiddle_rsc_0__54__INST.clk(clk);
    twiddle_rsc_0__54__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__54__INST.d(TLS_twiddle_rsc_0__54__d);
    twiddle_rsc_0__54__INST.wadr(TLS_twiddle_rsc_0__54__wadr);
    twiddle_rsc_0__54__INST.we(TLS_twiddle_rsc_0__54__we);
    twiddle_rsc_0__54__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_127)));

    twiddle_rsc_0__55__INST.q(TLS_twiddle_rsc_0_55_q);
    twiddle_rsc_0__55__INST.radr(TLS_twiddle_rsc_0_55_radr);
    twiddle_rsc_0__55__INST.clk(clk);
    twiddle_rsc_0__55__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__55__INST.d(TLS_twiddle_rsc_0__55__d);
    twiddle_rsc_0__55__INST.wadr(TLS_twiddle_rsc_0__55__wadr);
    twiddle_rsc_0__55__INST.we(TLS_twiddle_rsc_0__55__we);
    twiddle_rsc_0__55__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_128)));

    twiddle_rsc_0__56__INST.q(TLS_twiddle_rsc_0_56_q);
    twiddle_rsc_0__56__INST.radr(TLS_twiddle_rsc_0_56_radr);
    twiddle_rsc_0__56__INST.clk(clk);
    twiddle_rsc_0__56__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__56__INST.d(TLS_twiddle_rsc_0__56__d);
    twiddle_rsc_0__56__INST.wadr(TLS_twiddle_rsc_0__56__wadr);
    twiddle_rsc_0__56__INST.we(TLS_twiddle_rsc_0__56__we);
    twiddle_rsc_0__56__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_129)));

    twiddle_rsc_0__57__INST.q(TLS_twiddle_rsc_0_57_q);
    twiddle_rsc_0__57__INST.radr(TLS_twiddle_rsc_0_57_radr);
    twiddle_rsc_0__57__INST.clk(clk);
    twiddle_rsc_0__57__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__57__INST.d(TLS_twiddle_rsc_0__57__d);
    twiddle_rsc_0__57__INST.wadr(TLS_twiddle_rsc_0__57__wadr);
    twiddle_rsc_0__57__INST.we(TLS_twiddle_rsc_0__57__we);
    twiddle_rsc_0__57__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_130)));

    twiddle_rsc_0__58__INST.q(TLS_twiddle_rsc_0_58_q);
    twiddle_rsc_0__58__INST.radr(TLS_twiddle_rsc_0_58_radr);
    twiddle_rsc_0__58__INST.clk(clk);
    twiddle_rsc_0__58__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__58__INST.d(TLS_twiddle_rsc_0__58__d);
    twiddle_rsc_0__58__INST.wadr(TLS_twiddle_rsc_0__58__wadr);
    twiddle_rsc_0__58__INST.we(TLS_twiddle_rsc_0__58__we);
    twiddle_rsc_0__58__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_131)));

    twiddle_rsc_0__59__INST.q(TLS_twiddle_rsc_0_59_q);
    twiddle_rsc_0__59__INST.radr(TLS_twiddle_rsc_0_59_radr);
    twiddle_rsc_0__59__INST.clk(clk);
    twiddle_rsc_0__59__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__59__INST.d(TLS_twiddle_rsc_0__59__d);
    twiddle_rsc_0__59__INST.wadr(TLS_twiddle_rsc_0__59__wadr);
    twiddle_rsc_0__59__INST.we(TLS_twiddle_rsc_0__59__we);
    twiddle_rsc_0__59__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_132)));

    twiddle_rsc_0__60__INST.q(TLS_twiddle_rsc_0_60_q);
    twiddle_rsc_0__60__INST.radr(TLS_twiddle_rsc_0_60_radr);
    twiddle_rsc_0__60__INST.clk(clk);
    twiddle_rsc_0__60__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__60__INST.d(TLS_twiddle_rsc_0__60__d);
    twiddle_rsc_0__60__INST.wadr(TLS_twiddle_rsc_0__60__wadr);
    twiddle_rsc_0__60__INST.we(TLS_twiddle_rsc_0__60__we);
    twiddle_rsc_0__60__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_133)));

    twiddle_rsc_0__61__INST.q(TLS_twiddle_rsc_0_61_q);
    twiddle_rsc_0__61__INST.radr(TLS_twiddle_rsc_0_61_radr);
    twiddle_rsc_0__61__INST.clk(clk);
    twiddle_rsc_0__61__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__61__INST.d(TLS_twiddle_rsc_0__61__d);
    twiddle_rsc_0__61__INST.wadr(TLS_twiddle_rsc_0__61__wadr);
    twiddle_rsc_0__61__INST.we(TLS_twiddle_rsc_0__61__we);
    twiddle_rsc_0__61__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_134)));

    twiddle_rsc_0__62__INST.q(TLS_twiddle_rsc_0_62_q);
    twiddle_rsc_0__62__INST.radr(TLS_twiddle_rsc_0_62_radr);
    twiddle_rsc_0__62__INST.clk(clk);
    twiddle_rsc_0__62__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__62__INST.d(TLS_twiddle_rsc_0__62__d);
    twiddle_rsc_0__62__INST.wadr(TLS_twiddle_rsc_0__62__wadr);
    twiddle_rsc_0__62__INST.we(TLS_twiddle_rsc_0__62__we);
    twiddle_rsc_0__62__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_135)));

    twiddle_rsc_0__63__INST.q(TLS_twiddle_rsc_0_63_q);
    twiddle_rsc_0__63__INST.radr(TLS_twiddle_rsc_0_63_radr);
    twiddle_rsc_0__63__INST.clk(clk);
    twiddle_rsc_0__63__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__63__INST.d(TLS_twiddle_rsc_0__63__d);
    twiddle_rsc_0__63__INST.wadr(TLS_twiddle_rsc_0__63__wadr);
    twiddle_rsc_0__63__INST.we(TLS_twiddle_rsc_0__63__we);
    twiddle_rsc_0__63__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_136)));

    trios_monitor_vec_rsc_triosy_0_0_lz_INST.trios(TLS_vec_rsc_triosy_0_0_lz);
    trios_monitor_vec_rsc_triosy_0_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_1_lz_INST.trios(TLS_vec_rsc_triosy_0_1_lz);
    trios_monitor_vec_rsc_triosy_0_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_2_lz_INST.trios(TLS_vec_rsc_triosy_0_2_lz);
    trios_monitor_vec_rsc_triosy_0_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_3_lz_INST.trios(TLS_vec_rsc_triosy_0_3_lz);
    trios_monitor_vec_rsc_triosy_0_3_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_4_lz_INST.trios(TLS_vec_rsc_triosy_0_4_lz);
    trios_monitor_vec_rsc_triosy_0_4_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_5_lz_INST.trios(TLS_vec_rsc_triosy_0_5_lz);
    trios_monitor_vec_rsc_triosy_0_5_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_6_lz_INST.trios(TLS_vec_rsc_triosy_0_6_lz);
    trios_monitor_vec_rsc_triosy_0_6_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_7_lz_INST.trios(TLS_vec_rsc_triosy_0_7_lz);
    trios_monitor_vec_rsc_triosy_0_7_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_8_lz_INST.trios(TLS_vec_rsc_triosy_0_8_lz);
    trios_monitor_vec_rsc_triosy_0_8_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_9_lz_INST.trios(TLS_vec_rsc_triosy_0_9_lz);
    trios_monitor_vec_rsc_triosy_0_9_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_10_lz_INST.trios(TLS_vec_rsc_triosy_0_10_lz);
    trios_monitor_vec_rsc_triosy_0_10_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_11_lz_INST.trios(TLS_vec_rsc_triosy_0_11_lz);
    trios_monitor_vec_rsc_triosy_0_11_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_12_lz_INST.trios(TLS_vec_rsc_triosy_0_12_lz);
    trios_monitor_vec_rsc_triosy_0_12_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_13_lz_INST.trios(TLS_vec_rsc_triosy_0_13_lz);
    trios_monitor_vec_rsc_triosy_0_13_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_14_lz_INST.trios(TLS_vec_rsc_triosy_0_14_lz);
    trios_monitor_vec_rsc_triosy_0_14_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_15_lz_INST.trios(TLS_vec_rsc_triosy_0_15_lz);
    trios_monitor_vec_rsc_triosy_0_15_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_16_lz_INST.trios(TLS_vec_rsc_triosy_0_16_lz);
    trios_monitor_vec_rsc_triosy_0_16_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_17_lz_INST.trios(TLS_vec_rsc_triosy_0_17_lz);
    trios_monitor_vec_rsc_triosy_0_17_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_18_lz_INST.trios(TLS_vec_rsc_triosy_0_18_lz);
    trios_monitor_vec_rsc_triosy_0_18_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_19_lz_INST.trios(TLS_vec_rsc_triosy_0_19_lz);
    trios_monitor_vec_rsc_triosy_0_19_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_20_lz_INST.trios(TLS_vec_rsc_triosy_0_20_lz);
    trios_monitor_vec_rsc_triosy_0_20_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_21_lz_INST.trios(TLS_vec_rsc_triosy_0_21_lz);
    trios_monitor_vec_rsc_triosy_0_21_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_22_lz_INST.trios(TLS_vec_rsc_triosy_0_22_lz);
    trios_monitor_vec_rsc_triosy_0_22_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_23_lz_INST.trios(TLS_vec_rsc_triosy_0_23_lz);
    trios_monitor_vec_rsc_triosy_0_23_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_24_lz_INST.trios(TLS_vec_rsc_triosy_0_24_lz);
    trios_monitor_vec_rsc_triosy_0_24_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_25_lz_INST.trios(TLS_vec_rsc_triosy_0_25_lz);
    trios_monitor_vec_rsc_triosy_0_25_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_26_lz_INST.trios(TLS_vec_rsc_triosy_0_26_lz);
    trios_monitor_vec_rsc_triosy_0_26_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_27_lz_INST.trios(TLS_vec_rsc_triosy_0_27_lz);
    trios_monitor_vec_rsc_triosy_0_27_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_28_lz_INST.trios(TLS_vec_rsc_triosy_0_28_lz);
    trios_monitor_vec_rsc_triosy_0_28_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_29_lz_INST.trios(TLS_vec_rsc_triosy_0_29_lz);
    trios_monitor_vec_rsc_triosy_0_29_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_30_lz_INST.trios(TLS_vec_rsc_triosy_0_30_lz);
    trios_monitor_vec_rsc_triosy_0_30_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_31_lz_INST.trios(TLS_vec_rsc_triosy_0_31_lz);
    trios_monitor_vec_rsc_triosy_0_31_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_32_lz_INST.trios(TLS_vec_rsc_triosy_0_32_lz);
    trios_monitor_vec_rsc_triosy_0_32_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_33_lz_INST.trios(TLS_vec_rsc_triosy_0_33_lz);
    trios_monitor_vec_rsc_triosy_0_33_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_34_lz_INST.trios(TLS_vec_rsc_triosy_0_34_lz);
    trios_monitor_vec_rsc_triosy_0_34_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_35_lz_INST.trios(TLS_vec_rsc_triosy_0_35_lz);
    trios_monitor_vec_rsc_triosy_0_35_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_36_lz_INST.trios(TLS_vec_rsc_triosy_0_36_lz);
    trios_monitor_vec_rsc_triosy_0_36_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_37_lz_INST.trios(TLS_vec_rsc_triosy_0_37_lz);
    trios_monitor_vec_rsc_triosy_0_37_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_38_lz_INST.trios(TLS_vec_rsc_triosy_0_38_lz);
    trios_monitor_vec_rsc_triosy_0_38_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_39_lz_INST.trios(TLS_vec_rsc_triosy_0_39_lz);
    trios_monitor_vec_rsc_triosy_0_39_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_40_lz_INST.trios(TLS_vec_rsc_triosy_0_40_lz);
    trios_monitor_vec_rsc_triosy_0_40_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_41_lz_INST.trios(TLS_vec_rsc_triosy_0_41_lz);
    trios_monitor_vec_rsc_triosy_0_41_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_42_lz_INST.trios(TLS_vec_rsc_triosy_0_42_lz);
    trios_monitor_vec_rsc_triosy_0_42_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_43_lz_INST.trios(TLS_vec_rsc_triosy_0_43_lz);
    trios_monitor_vec_rsc_triosy_0_43_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_44_lz_INST.trios(TLS_vec_rsc_triosy_0_44_lz);
    trios_monitor_vec_rsc_triosy_0_44_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_45_lz_INST.trios(TLS_vec_rsc_triosy_0_45_lz);
    trios_monitor_vec_rsc_triosy_0_45_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_46_lz_INST.trios(TLS_vec_rsc_triosy_0_46_lz);
    trios_monitor_vec_rsc_triosy_0_46_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_47_lz_INST.trios(TLS_vec_rsc_triosy_0_47_lz);
    trios_monitor_vec_rsc_triosy_0_47_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_48_lz_INST.trios(TLS_vec_rsc_triosy_0_48_lz);
    trios_monitor_vec_rsc_triosy_0_48_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_49_lz_INST.trios(TLS_vec_rsc_triosy_0_49_lz);
    trios_monitor_vec_rsc_triosy_0_49_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_50_lz_INST.trios(TLS_vec_rsc_triosy_0_50_lz);
    trios_monitor_vec_rsc_triosy_0_50_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_51_lz_INST.trios(TLS_vec_rsc_triosy_0_51_lz);
    trios_monitor_vec_rsc_triosy_0_51_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_52_lz_INST.trios(TLS_vec_rsc_triosy_0_52_lz);
    trios_monitor_vec_rsc_triosy_0_52_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_53_lz_INST.trios(TLS_vec_rsc_triosy_0_53_lz);
    trios_monitor_vec_rsc_triosy_0_53_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_54_lz_INST.trios(TLS_vec_rsc_triosy_0_54_lz);
    trios_monitor_vec_rsc_triosy_0_54_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_55_lz_INST.trios(TLS_vec_rsc_triosy_0_55_lz);
    trios_monitor_vec_rsc_triosy_0_55_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_56_lz_INST.trios(TLS_vec_rsc_triosy_0_56_lz);
    trios_monitor_vec_rsc_triosy_0_56_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_57_lz_INST.trios(TLS_vec_rsc_triosy_0_57_lz);
    trios_monitor_vec_rsc_triosy_0_57_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_58_lz_INST.trios(TLS_vec_rsc_triosy_0_58_lz);
    trios_monitor_vec_rsc_triosy_0_58_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_59_lz_INST.trios(TLS_vec_rsc_triosy_0_59_lz);
    trios_monitor_vec_rsc_triosy_0_59_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_60_lz_INST.trios(TLS_vec_rsc_triosy_0_60_lz);
    trios_monitor_vec_rsc_triosy_0_60_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_61_lz_INST.trios(TLS_vec_rsc_triosy_0_61_lz);
    trios_monitor_vec_rsc_triosy_0_61_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_62_lz_INST.trios(TLS_vec_rsc_triosy_0_62_lz);
    trios_monitor_vec_rsc_triosy_0_62_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_vec_rsc_triosy_0_63_lz_INST.trios(TLS_vec_rsc_triosy_0_63_lz);
    trios_monitor_vec_rsc_triosy_0_63_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_vec.in_fifo(TLS_in_fifo_vec);
    transactor_vec.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_vec);
    transactor_vec.out_fifo(TLS_out_fifo_vec);
    transactor_vec.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_vec);
    transactor_vec.bind_clk(clk, true, rst);
    transactor_vec.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_vec.register_block(&vec_rsc_0__0__INST, vec_rsc_0__0__INST.basename(), TLS_vec_rsc_triosy_0_0_lz,
        0, 960, 64);
    transactor_vec.register_block(&vec_rsc_0__1__INST, vec_rsc_0__1__INST.basename(), TLS_vec_rsc_triosy_0_1_lz,
        1, 961, 64);
    transactor_vec.register_block(&vec_rsc_0__2__INST, vec_rsc_0__2__INST.basename(), TLS_vec_rsc_triosy_0_2_lz,
        2, 962, 64);
    transactor_vec.register_block(&vec_rsc_0__3__INST, vec_rsc_0__3__INST.basename(), TLS_vec_rsc_triosy_0_3_lz,
        3, 963, 64);
    transactor_vec.register_block(&vec_rsc_0__4__INST, vec_rsc_0__4__INST.basename(), TLS_vec_rsc_triosy_0_4_lz,
        4, 964, 64);
    transactor_vec.register_block(&vec_rsc_0__5__INST, vec_rsc_0__5__INST.basename(), TLS_vec_rsc_triosy_0_5_lz,
        5, 965, 64);
    transactor_vec.register_block(&vec_rsc_0__6__INST, vec_rsc_0__6__INST.basename(), TLS_vec_rsc_triosy_0_6_lz,
        6, 966, 64);
    transactor_vec.register_block(&vec_rsc_0__7__INST, vec_rsc_0__7__INST.basename(), TLS_vec_rsc_triosy_0_7_lz,
        7, 967, 64);
    transactor_vec.register_block(&vec_rsc_0__8__INST, vec_rsc_0__8__INST.basename(), TLS_vec_rsc_triosy_0_8_lz,
        8, 968, 64);
    transactor_vec.register_block(&vec_rsc_0__9__INST, vec_rsc_0__9__INST.basename(), TLS_vec_rsc_triosy_0_9_lz,
        9, 969, 64);
    transactor_vec.register_block(&vec_rsc_0__10__INST, vec_rsc_0__10__INST.basename(), TLS_vec_rsc_triosy_0_10_lz,
        10, 970, 64);
    transactor_vec.register_block(&vec_rsc_0__11__INST, vec_rsc_0__11__INST.basename(), TLS_vec_rsc_triosy_0_11_lz,
        11, 971, 64);
    transactor_vec.register_block(&vec_rsc_0__12__INST, vec_rsc_0__12__INST.basename(), TLS_vec_rsc_triosy_0_12_lz,
        12, 972, 64);
    transactor_vec.register_block(&vec_rsc_0__13__INST, vec_rsc_0__13__INST.basename(), TLS_vec_rsc_triosy_0_13_lz,
        13, 973, 64);
    transactor_vec.register_block(&vec_rsc_0__14__INST, vec_rsc_0__14__INST.basename(), TLS_vec_rsc_triosy_0_14_lz,
        14, 974, 64);
    transactor_vec.register_block(&vec_rsc_0__15__INST, vec_rsc_0__15__INST.basename(), TLS_vec_rsc_triosy_0_15_lz,
        15, 975, 64);
    transactor_vec.register_block(&vec_rsc_0__16__INST, vec_rsc_0__16__INST.basename(), TLS_vec_rsc_triosy_0_16_lz,
        16, 976, 64);
    transactor_vec.register_block(&vec_rsc_0__17__INST, vec_rsc_0__17__INST.basename(), TLS_vec_rsc_triosy_0_17_lz,
        17, 977, 64);
    transactor_vec.register_block(&vec_rsc_0__18__INST, vec_rsc_0__18__INST.basename(), TLS_vec_rsc_triosy_0_18_lz,
        18, 978, 64);
    transactor_vec.register_block(&vec_rsc_0__19__INST, vec_rsc_0__19__INST.basename(), TLS_vec_rsc_triosy_0_19_lz,
        19, 979, 64);
    transactor_vec.register_block(&vec_rsc_0__20__INST, vec_rsc_0__20__INST.basename(), TLS_vec_rsc_triosy_0_20_lz,
        20, 980, 64);
    transactor_vec.register_block(&vec_rsc_0__21__INST, vec_rsc_0__21__INST.basename(), TLS_vec_rsc_triosy_0_21_lz,
        21, 981, 64);
    transactor_vec.register_block(&vec_rsc_0__22__INST, vec_rsc_0__22__INST.basename(), TLS_vec_rsc_triosy_0_22_lz,
        22, 982, 64);
    transactor_vec.register_block(&vec_rsc_0__23__INST, vec_rsc_0__23__INST.basename(), TLS_vec_rsc_triosy_0_23_lz,
        23, 983, 64);
    transactor_vec.register_block(&vec_rsc_0__24__INST, vec_rsc_0__24__INST.basename(), TLS_vec_rsc_triosy_0_24_lz,
        24, 984, 64);
    transactor_vec.register_block(&vec_rsc_0__25__INST, vec_rsc_0__25__INST.basename(), TLS_vec_rsc_triosy_0_25_lz,
        25, 985, 64);
    transactor_vec.register_block(&vec_rsc_0__26__INST, vec_rsc_0__26__INST.basename(), TLS_vec_rsc_triosy_0_26_lz,
        26, 986, 64);
    transactor_vec.register_block(&vec_rsc_0__27__INST, vec_rsc_0__27__INST.basename(), TLS_vec_rsc_triosy_0_27_lz,
        27, 987, 64);
    transactor_vec.register_block(&vec_rsc_0__28__INST, vec_rsc_0__28__INST.basename(), TLS_vec_rsc_triosy_0_28_lz,
        28, 988, 64);
    transactor_vec.register_block(&vec_rsc_0__29__INST, vec_rsc_0__29__INST.basename(), TLS_vec_rsc_triosy_0_29_lz,
        29, 989, 64);
    transactor_vec.register_block(&vec_rsc_0__30__INST, vec_rsc_0__30__INST.basename(), TLS_vec_rsc_triosy_0_30_lz,
        30, 990, 64);
    transactor_vec.register_block(&vec_rsc_0__31__INST, vec_rsc_0__31__INST.basename(), TLS_vec_rsc_triosy_0_31_lz,
        31, 991, 64);
    transactor_vec.register_block(&vec_rsc_0__32__INST, vec_rsc_0__32__INST.basename(), TLS_vec_rsc_triosy_0_32_lz,
        32, 992, 64);
    transactor_vec.register_block(&vec_rsc_0__33__INST, vec_rsc_0__33__INST.basename(), TLS_vec_rsc_triosy_0_33_lz,
        33, 993, 64);
    transactor_vec.register_block(&vec_rsc_0__34__INST, vec_rsc_0__34__INST.basename(), TLS_vec_rsc_triosy_0_34_lz,
        34, 994, 64);
    transactor_vec.register_block(&vec_rsc_0__35__INST, vec_rsc_0__35__INST.basename(), TLS_vec_rsc_triosy_0_35_lz,
        35, 995, 64);
    transactor_vec.register_block(&vec_rsc_0__36__INST, vec_rsc_0__36__INST.basename(), TLS_vec_rsc_triosy_0_36_lz,
        36, 996, 64);
    transactor_vec.register_block(&vec_rsc_0__37__INST, vec_rsc_0__37__INST.basename(), TLS_vec_rsc_triosy_0_37_lz,
        37, 997, 64);
    transactor_vec.register_block(&vec_rsc_0__38__INST, vec_rsc_0__38__INST.basename(), TLS_vec_rsc_triosy_0_38_lz,
        38, 998, 64);
    transactor_vec.register_block(&vec_rsc_0__39__INST, vec_rsc_0__39__INST.basename(), TLS_vec_rsc_triosy_0_39_lz,
        39, 999, 64);
    transactor_vec.register_block(&vec_rsc_0__40__INST, vec_rsc_0__40__INST.basename(), TLS_vec_rsc_triosy_0_40_lz,
        40, 1000, 64);
    transactor_vec.register_block(&vec_rsc_0__41__INST, vec_rsc_0__41__INST.basename(), TLS_vec_rsc_triosy_0_41_lz,
        41, 1001, 64);
    transactor_vec.register_block(&vec_rsc_0__42__INST, vec_rsc_0__42__INST.basename(), TLS_vec_rsc_triosy_0_42_lz,
        42, 1002, 64);
    transactor_vec.register_block(&vec_rsc_0__43__INST, vec_rsc_0__43__INST.basename(), TLS_vec_rsc_triosy_0_43_lz,
        43, 1003, 64);
    transactor_vec.register_block(&vec_rsc_0__44__INST, vec_rsc_0__44__INST.basename(), TLS_vec_rsc_triosy_0_44_lz,
        44, 1004, 64);
    transactor_vec.register_block(&vec_rsc_0__45__INST, vec_rsc_0__45__INST.basename(), TLS_vec_rsc_triosy_0_45_lz,
        45, 1005, 64);
    transactor_vec.register_block(&vec_rsc_0__46__INST, vec_rsc_0__46__INST.basename(), TLS_vec_rsc_triosy_0_46_lz,
        46, 1006, 64);
    transactor_vec.register_block(&vec_rsc_0__47__INST, vec_rsc_0__47__INST.basename(), TLS_vec_rsc_triosy_0_47_lz,
        47, 1007, 64);
    transactor_vec.register_block(&vec_rsc_0__48__INST, vec_rsc_0__48__INST.basename(), TLS_vec_rsc_triosy_0_48_lz,
        48, 1008, 64);
    transactor_vec.register_block(&vec_rsc_0__49__INST, vec_rsc_0__49__INST.basename(), TLS_vec_rsc_triosy_0_49_lz,
        49, 1009, 64);
    transactor_vec.register_block(&vec_rsc_0__50__INST, vec_rsc_0__50__INST.basename(), TLS_vec_rsc_triosy_0_50_lz,
        50, 1010, 64);
    transactor_vec.register_block(&vec_rsc_0__51__INST, vec_rsc_0__51__INST.basename(), TLS_vec_rsc_triosy_0_51_lz,
        51, 1011, 64);
    transactor_vec.register_block(&vec_rsc_0__52__INST, vec_rsc_0__52__INST.basename(), TLS_vec_rsc_triosy_0_52_lz,
        52, 1012, 64);
    transactor_vec.register_block(&vec_rsc_0__53__INST, vec_rsc_0__53__INST.basename(), TLS_vec_rsc_triosy_0_53_lz,
        53, 1013, 64);
    transactor_vec.register_block(&vec_rsc_0__54__INST, vec_rsc_0__54__INST.basename(), TLS_vec_rsc_triosy_0_54_lz,
        54, 1014, 64);
    transactor_vec.register_block(&vec_rsc_0__55__INST, vec_rsc_0__55__INST.basename(), TLS_vec_rsc_triosy_0_55_lz,
        55, 1015, 64);
    transactor_vec.register_block(&vec_rsc_0__56__INST, vec_rsc_0__56__INST.basename(), TLS_vec_rsc_triosy_0_56_lz,
        56, 1016, 64);
    transactor_vec.register_block(&vec_rsc_0__57__INST, vec_rsc_0__57__INST.basename(), TLS_vec_rsc_triosy_0_57_lz,
        57, 1017, 64);
    transactor_vec.register_block(&vec_rsc_0__58__INST, vec_rsc_0__58__INST.basename(), TLS_vec_rsc_triosy_0_58_lz,
        58, 1018, 64);
    transactor_vec.register_block(&vec_rsc_0__59__INST, vec_rsc_0__59__INST.basename(), TLS_vec_rsc_triosy_0_59_lz,
        59, 1019, 64);
    transactor_vec.register_block(&vec_rsc_0__60__INST, vec_rsc_0__60__INST.basename(), TLS_vec_rsc_triosy_0_60_lz,
        60, 1020, 64);
    transactor_vec.register_block(&vec_rsc_0__61__INST, vec_rsc_0__61__INST.basename(), TLS_vec_rsc_triosy_0_61_lz,
        61, 1021, 64);
    transactor_vec.register_block(&vec_rsc_0__62__INST, vec_rsc_0__62__INST.basename(), TLS_vec_rsc_triosy_0_62_lz,
        62, 1022, 64);
    transactor_vec.register_block(&vec_rsc_0__63__INST, vec_rsc_0__63__INST.basename(), TLS_vec_rsc_triosy_0_63_lz,
        63, 1023, 64);

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

    trios_monitor_twiddle_rsc_triosy_0_16_lz_INST.trios(TLS_twiddle_rsc_triosy_0_16_lz);
    trios_monitor_twiddle_rsc_triosy_0_16_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_17_lz_INST.trios(TLS_twiddle_rsc_triosy_0_17_lz);
    trios_monitor_twiddle_rsc_triosy_0_17_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_18_lz_INST.trios(TLS_twiddle_rsc_triosy_0_18_lz);
    trios_monitor_twiddle_rsc_triosy_0_18_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_19_lz_INST.trios(TLS_twiddle_rsc_triosy_0_19_lz);
    trios_monitor_twiddle_rsc_triosy_0_19_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_20_lz_INST.trios(TLS_twiddle_rsc_triosy_0_20_lz);
    trios_monitor_twiddle_rsc_triosy_0_20_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_21_lz_INST.trios(TLS_twiddle_rsc_triosy_0_21_lz);
    trios_monitor_twiddle_rsc_triosy_0_21_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_22_lz_INST.trios(TLS_twiddle_rsc_triosy_0_22_lz);
    trios_monitor_twiddle_rsc_triosy_0_22_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_23_lz_INST.trios(TLS_twiddle_rsc_triosy_0_23_lz);
    trios_monitor_twiddle_rsc_triosy_0_23_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_24_lz_INST.trios(TLS_twiddle_rsc_triosy_0_24_lz);
    trios_monitor_twiddle_rsc_triosy_0_24_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_25_lz_INST.trios(TLS_twiddle_rsc_triosy_0_25_lz);
    trios_monitor_twiddle_rsc_triosy_0_25_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_26_lz_INST.trios(TLS_twiddle_rsc_triosy_0_26_lz);
    trios_monitor_twiddle_rsc_triosy_0_26_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_27_lz_INST.trios(TLS_twiddle_rsc_triosy_0_27_lz);
    trios_monitor_twiddle_rsc_triosy_0_27_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_28_lz_INST.trios(TLS_twiddle_rsc_triosy_0_28_lz);
    trios_monitor_twiddle_rsc_triosy_0_28_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_29_lz_INST.trios(TLS_twiddle_rsc_triosy_0_29_lz);
    trios_monitor_twiddle_rsc_triosy_0_29_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_30_lz_INST.trios(TLS_twiddle_rsc_triosy_0_30_lz);
    trios_monitor_twiddle_rsc_triosy_0_30_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_31_lz_INST.trios(TLS_twiddle_rsc_triosy_0_31_lz);
    trios_monitor_twiddle_rsc_triosy_0_31_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_32_lz_INST.trios(TLS_twiddle_rsc_triosy_0_32_lz);
    trios_monitor_twiddle_rsc_triosy_0_32_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_33_lz_INST.trios(TLS_twiddle_rsc_triosy_0_33_lz);
    trios_monitor_twiddle_rsc_triosy_0_33_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_34_lz_INST.trios(TLS_twiddle_rsc_triosy_0_34_lz);
    trios_monitor_twiddle_rsc_triosy_0_34_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_35_lz_INST.trios(TLS_twiddle_rsc_triosy_0_35_lz);
    trios_monitor_twiddle_rsc_triosy_0_35_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_36_lz_INST.trios(TLS_twiddle_rsc_triosy_0_36_lz);
    trios_monitor_twiddle_rsc_triosy_0_36_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_37_lz_INST.trios(TLS_twiddle_rsc_triosy_0_37_lz);
    trios_monitor_twiddle_rsc_triosy_0_37_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_38_lz_INST.trios(TLS_twiddle_rsc_triosy_0_38_lz);
    trios_monitor_twiddle_rsc_triosy_0_38_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_39_lz_INST.trios(TLS_twiddle_rsc_triosy_0_39_lz);
    trios_monitor_twiddle_rsc_triosy_0_39_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_40_lz_INST.trios(TLS_twiddle_rsc_triosy_0_40_lz);
    trios_monitor_twiddle_rsc_triosy_0_40_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_41_lz_INST.trios(TLS_twiddle_rsc_triosy_0_41_lz);
    trios_monitor_twiddle_rsc_triosy_0_41_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_42_lz_INST.trios(TLS_twiddle_rsc_triosy_0_42_lz);
    trios_monitor_twiddle_rsc_triosy_0_42_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_43_lz_INST.trios(TLS_twiddle_rsc_triosy_0_43_lz);
    trios_monitor_twiddle_rsc_triosy_0_43_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_44_lz_INST.trios(TLS_twiddle_rsc_triosy_0_44_lz);
    trios_monitor_twiddle_rsc_triosy_0_44_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_45_lz_INST.trios(TLS_twiddle_rsc_triosy_0_45_lz);
    trios_monitor_twiddle_rsc_triosy_0_45_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_46_lz_INST.trios(TLS_twiddle_rsc_triosy_0_46_lz);
    trios_monitor_twiddle_rsc_triosy_0_46_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_47_lz_INST.trios(TLS_twiddle_rsc_triosy_0_47_lz);
    trios_monitor_twiddle_rsc_triosy_0_47_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_48_lz_INST.trios(TLS_twiddle_rsc_triosy_0_48_lz);
    trios_monitor_twiddle_rsc_triosy_0_48_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_49_lz_INST.trios(TLS_twiddle_rsc_triosy_0_49_lz);
    trios_monitor_twiddle_rsc_triosy_0_49_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_50_lz_INST.trios(TLS_twiddle_rsc_triosy_0_50_lz);
    trios_monitor_twiddle_rsc_triosy_0_50_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_51_lz_INST.trios(TLS_twiddle_rsc_triosy_0_51_lz);
    trios_monitor_twiddle_rsc_triosy_0_51_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_52_lz_INST.trios(TLS_twiddle_rsc_triosy_0_52_lz);
    trios_monitor_twiddle_rsc_triosy_0_52_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_53_lz_INST.trios(TLS_twiddle_rsc_triosy_0_53_lz);
    trios_monitor_twiddle_rsc_triosy_0_53_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_54_lz_INST.trios(TLS_twiddle_rsc_triosy_0_54_lz);
    trios_monitor_twiddle_rsc_triosy_0_54_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_55_lz_INST.trios(TLS_twiddle_rsc_triosy_0_55_lz);
    trios_monitor_twiddle_rsc_triosy_0_55_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_56_lz_INST.trios(TLS_twiddle_rsc_triosy_0_56_lz);
    trios_monitor_twiddle_rsc_triosy_0_56_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_57_lz_INST.trios(TLS_twiddle_rsc_triosy_0_57_lz);
    trios_monitor_twiddle_rsc_triosy_0_57_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_58_lz_INST.trios(TLS_twiddle_rsc_triosy_0_58_lz);
    trios_monitor_twiddle_rsc_triosy_0_58_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_59_lz_INST.trios(TLS_twiddle_rsc_triosy_0_59_lz);
    trios_monitor_twiddle_rsc_triosy_0_59_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_60_lz_INST.trios(TLS_twiddle_rsc_triosy_0_60_lz);
    trios_monitor_twiddle_rsc_triosy_0_60_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_61_lz_INST.trios(TLS_twiddle_rsc_triosy_0_61_lz);
    trios_monitor_twiddle_rsc_triosy_0_61_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_62_lz_INST.trios(TLS_twiddle_rsc_triosy_0_62_lz);
    trios_monitor_twiddle_rsc_triosy_0_62_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_twiddle_rsc_triosy_0_63_lz_INST.trios(TLS_twiddle_rsc_triosy_0_63_lz);
    trios_monitor_twiddle_rsc_triosy_0_63_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_0__0__INST, twiddle_rsc_0__0__INST.basename(), TLS_twiddle_rsc_triosy_0_0_lz,
        0, 960, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__1__INST, twiddle_rsc_0__1__INST.basename(), TLS_twiddle_rsc_triosy_0_1_lz,
        1, 961, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__2__INST, twiddle_rsc_0__2__INST.basename(), TLS_twiddle_rsc_triosy_0_2_lz,
        2, 962, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__3__INST, twiddle_rsc_0__3__INST.basename(), TLS_twiddle_rsc_triosy_0_3_lz,
        3, 963, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__4__INST, twiddle_rsc_0__4__INST.basename(), TLS_twiddle_rsc_triosy_0_4_lz,
        4, 964, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__5__INST, twiddle_rsc_0__5__INST.basename(), TLS_twiddle_rsc_triosy_0_5_lz,
        5, 965, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__6__INST, twiddle_rsc_0__6__INST.basename(), TLS_twiddle_rsc_triosy_0_6_lz,
        6, 966, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__7__INST, twiddle_rsc_0__7__INST.basename(), TLS_twiddle_rsc_triosy_0_7_lz,
        7, 967, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__8__INST, twiddle_rsc_0__8__INST.basename(), TLS_twiddle_rsc_triosy_0_8_lz,
        8, 968, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__9__INST, twiddle_rsc_0__9__INST.basename(), TLS_twiddle_rsc_triosy_0_9_lz,
        9, 969, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__10__INST, twiddle_rsc_0__10__INST.basename(), TLS_twiddle_rsc_triosy_0_10_lz,
        10, 970, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__11__INST, twiddle_rsc_0__11__INST.basename(), TLS_twiddle_rsc_triosy_0_11_lz,
        11, 971, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__12__INST, twiddle_rsc_0__12__INST.basename(), TLS_twiddle_rsc_triosy_0_12_lz,
        12, 972, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__13__INST, twiddle_rsc_0__13__INST.basename(), TLS_twiddle_rsc_triosy_0_13_lz,
        13, 973, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__14__INST, twiddle_rsc_0__14__INST.basename(), TLS_twiddle_rsc_triosy_0_14_lz,
        14, 974, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__15__INST, twiddle_rsc_0__15__INST.basename(), TLS_twiddle_rsc_triosy_0_15_lz,
        15, 975, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__16__INST, twiddle_rsc_0__16__INST.basename(), TLS_twiddle_rsc_triosy_0_16_lz,
        16, 976, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__17__INST, twiddle_rsc_0__17__INST.basename(), TLS_twiddle_rsc_triosy_0_17_lz,
        17, 977, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__18__INST, twiddle_rsc_0__18__INST.basename(), TLS_twiddle_rsc_triosy_0_18_lz,
        18, 978, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__19__INST, twiddle_rsc_0__19__INST.basename(), TLS_twiddle_rsc_triosy_0_19_lz,
        19, 979, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__20__INST, twiddle_rsc_0__20__INST.basename(), TLS_twiddle_rsc_triosy_0_20_lz,
        20, 980, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__21__INST, twiddle_rsc_0__21__INST.basename(), TLS_twiddle_rsc_triosy_0_21_lz,
        21, 981, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__22__INST, twiddle_rsc_0__22__INST.basename(), TLS_twiddle_rsc_triosy_0_22_lz,
        22, 982, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__23__INST, twiddle_rsc_0__23__INST.basename(), TLS_twiddle_rsc_triosy_0_23_lz,
        23, 983, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__24__INST, twiddle_rsc_0__24__INST.basename(), TLS_twiddle_rsc_triosy_0_24_lz,
        24, 984, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__25__INST, twiddle_rsc_0__25__INST.basename(), TLS_twiddle_rsc_triosy_0_25_lz,
        25, 985, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__26__INST, twiddle_rsc_0__26__INST.basename(), TLS_twiddle_rsc_triosy_0_26_lz,
        26, 986, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__27__INST, twiddle_rsc_0__27__INST.basename(), TLS_twiddle_rsc_triosy_0_27_lz,
        27, 987, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__28__INST, twiddle_rsc_0__28__INST.basename(), TLS_twiddle_rsc_triosy_0_28_lz,
        28, 988, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__29__INST, twiddle_rsc_0__29__INST.basename(), TLS_twiddle_rsc_triosy_0_29_lz,
        29, 989, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__30__INST, twiddle_rsc_0__30__INST.basename(), TLS_twiddle_rsc_triosy_0_30_lz,
        30, 990, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__31__INST, twiddle_rsc_0__31__INST.basename(), TLS_twiddle_rsc_triosy_0_31_lz,
        31, 991, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__32__INST, twiddle_rsc_0__32__INST.basename(), TLS_twiddle_rsc_triosy_0_32_lz,
        32, 992, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__33__INST, twiddle_rsc_0__33__INST.basename(), TLS_twiddle_rsc_triosy_0_33_lz,
        33, 993, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__34__INST, twiddle_rsc_0__34__INST.basename(), TLS_twiddle_rsc_triosy_0_34_lz,
        34, 994, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__35__INST, twiddle_rsc_0__35__INST.basename(), TLS_twiddle_rsc_triosy_0_35_lz,
        35, 995, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__36__INST, twiddle_rsc_0__36__INST.basename(), TLS_twiddle_rsc_triosy_0_36_lz,
        36, 996, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__37__INST, twiddle_rsc_0__37__INST.basename(), TLS_twiddle_rsc_triosy_0_37_lz,
        37, 997, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__38__INST, twiddle_rsc_0__38__INST.basename(), TLS_twiddle_rsc_triosy_0_38_lz,
        38, 998, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__39__INST, twiddle_rsc_0__39__INST.basename(), TLS_twiddle_rsc_triosy_0_39_lz,
        39, 999, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__40__INST, twiddle_rsc_0__40__INST.basename(), TLS_twiddle_rsc_triosy_0_40_lz,
        40, 1000, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__41__INST, twiddle_rsc_0__41__INST.basename(), TLS_twiddle_rsc_triosy_0_41_lz,
        41, 1001, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__42__INST, twiddle_rsc_0__42__INST.basename(), TLS_twiddle_rsc_triosy_0_42_lz,
        42, 1002, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__43__INST, twiddle_rsc_0__43__INST.basename(), TLS_twiddle_rsc_triosy_0_43_lz,
        43, 1003, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__44__INST, twiddle_rsc_0__44__INST.basename(), TLS_twiddle_rsc_triosy_0_44_lz,
        44, 1004, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__45__INST, twiddle_rsc_0__45__INST.basename(), TLS_twiddle_rsc_triosy_0_45_lz,
        45, 1005, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__46__INST, twiddle_rsc_0__46__INST.basename(), TLS_twiddle_rsc_triosy_0_46_lz,
        46, 1006, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__47__INST, twiddle_rsc_0__47__INST.basename(), TLS_twiddle_rsc_triosy_0_47_lz,
        47, 1007, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__48__INST, twiddle_rsc_0__48__INST.basename(), TLS_twiddle_rsc_triosy_0_48_lz,
        48, 1008, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__49__INST, twiddle_rsc_0__49__INST.basename(), TLS_twiddle_rsc_triosy_0_49_lz,
        49, 1009, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__50__INST, twiddle_rsc_0__50__INST.basename(), TLS_twiddle_rsc_triosy_0_50_lz,
        50, 1010, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__51__INST, twiddle_rsc_0__51__INST.basename(), TLS_twiddle_rsc_triosy_0_51_lz,
        51, 1011, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__52__INST, twiddle_rsc_0__52__INST.basename(), TLS_twiddle_rsc_triosy_0_52_lz,
        52, 1012, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__53__INST, twiddle_rsc_0__53__INST.basename(), TLS_twiddle_rsc_triosy_0_53_lz,
        53, 1013, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__54__INST, twiddle_rsc_0__54__INST.basename(), TLS_twiddle_rsc_triosy_0_54_lz,
        54, 1014, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__55__INST, twiddle_rsc_0__55__INST.basename(), TLS_twiddle_rsc_triosy_0_55_lz,
        55, 1015, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__56__INST, twiddle_rsc_0__56__INST.basename(), TLS_twiddle_rsc_triosy_0_56_lz,
        56, 1016, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__57__INST, twiddle_rsc_0__57__INST.basename(), TLS_twiddle_rsc_triosy_0_57_lz,
        57, 1017, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__58__INST, twiddle_rsc_0__58__INST.basename(), TLS_twiddle_rsc_triosy_0_58_lz,
        58, 1018, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__59__INST, twiddle_rsc_0__59__INST.basename(), TLS_twiddle_rsc_triosy_0_59_lz,
        59, 1019, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__60__INST, twiddle_rsc_0__60__INST.basename(), TLS_twiddle_rsc_triosy_0_60_lz,
        60, 1020, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__61__INST, twiddle_rsc_0__61__INST.basename(), TLS_twiddle_rsc_triosy_0_61_lz,
        61, 1021, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__62__INST, twiddle_rsc_0__62__INST.basename(), TLS_twiddle_rsc_triosy_0_62_lz,
        62, 1022, 64);
    transactor_twiddle.register_block(&twiddle_rsc_0__63__INST, twiddle_rsc_0__63__INST.basename(), TLS_twiddle_rsc_triosy_0_63_lz,
        63, 1023, 64);

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
  vec_rsc_0__0__INST.clear();
  vec_rsc_0__1__INST.clear();
  vec_rsc_0__2__INST.clear();
  vec_rsc_0__3__INST.clear();
  vec_rsc_0__4__INST.clear();
  vec_rsc_0__5__INST.clear();
  vec_rsc_0__6__INST.clear();
  vec_rsc_0__7__INST.clear();
  vec_rsc_0__8__INST.clear();
  vec_rsc_0__9__INST.clear();
  vec_rsc_0__10__INST.clear();
  vec_rsc_0__11__INST.clear();
  vec_rsc_0__12__INST.clear();
  vec_rsc_0__13__INST.clear();
  vec_rsc_0__14__INST.clear();
  vec_rsc_0__15__INST.clear();
  vec_rsc_0__16__INST.clear();
  vec_rsc_0__17__INST.clear();
  vec_rsc_0__18__INST.clear();
  vec_rsc_0__19__INST.clear();
  vec_rsc_0__20__INST.clear();
  vec_rsc_0__21__INST.clear();
  vec_rsc_0__22__INST.clear();
  vec_rsc_0__23__INST.clear();
  vec_rsc_0__24__INST.clear();
  vec_rsc_0__25__INST.clear();
  vec_rsc_0__26__INST.clear();
  vec_rsc_0__27__INST.clear();
  vec_rsc_0__28__INST.clear();
  vec_rsc_0__29__INST.clear();
  vec_rsc_0__30__INST.clear();
  vec_rsc_0__31__INST.clear();
  vec_rsc_0__32__INST.clear();
  vec_rsc_0__33__INST.clear();
  vec_rsc_0__34__INST.clear();
  vec_rsc_0__35__INST.clear();
  vec_rsc_0__36__INST.clear();
  vec_rsc_0__37__INST.clear();
  vec_rsc_0__38__INST.clear();
  vec_rsc_0__39__INST.clear();
  vec_rsc_0__40__INST.clear();
  vec_rsc_0__41__INST.clear();
  vec_rsc_0__42__INST.clear();
  vec_rsc_0__43__INST.clear();
  vec_rsc_0__44__INST.clear();
  vec_rsc_0__45__INST.clear();
  vec_rsc_0__46__INST.clear();
  vec_rsc_0__47__INST.clear();
  vec_rsc_0__48__INST.clear();
  vec_rsc_0__49__INST.clear();
  vec_rsc_0__50__INST.clear();
  vec_rsc_0__51__INST.clear();
  vec_rsc_0__52__INST.clear();
  vec_rsc_0__53__INST.clear();
  vec_rsc_0__54__INST.clear();
  vec_rsc_0__55__INST.clear();
  vec_rsc_0__56__INST.clear();
  vec_rsc_0__57__INST.clear();
  vec_rsc_0__58__INST.clear();
  vec_rsc_0__59__INST.clear();
  vec_rsc_0__60__INST.clear();
  vec_rsc_0__61__INST.clear();
  vec_rsc_0__62__INST.clear();
  vec_rsc_0__63__INST.clear();
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
  twiddle_rsc_0__16__INST.clear();
  twiddle_rsc_0__17__INST.clear();
  twiddle_rsc_0__18__INST.clear();
  twiddle_rsc_0__19__INST.clear();
  twiddle_rsc_0__20__INST.clear();
  twiddle_rsc_0__21__INST.clear();
  twiddle_rsc_0__22__INST.clear();
  twiddle_rsc_0__23__INST.clear();
  twiddle_rsc_0__24__INST.clear();
  twiddle_rsc_0__25__INST.clear();
  twiddle_rsc_0__26__INST.clear();
  twiddle_rsc_0__27__INST.clear();
  twiddle_rsc_0__28__INST.clear();
  twiddle_rsc_0__29__INST.clear();
  twiddle_rsc_0__30__INST.clear();
  twiddle_rsc_0__31__INST.clear();
  twiddle_rsc_0__32__INST.clear();
  twiddle_rsc_0__33__INST.clear();
  twiddle_rsc_0__34__INST.clear();
  twiddle_rsc_0__35__INST.clear();
  twiddle_rsc_0__36__INST.clear();
  twiddle_rsc_0__37__INST.clear();
  twiddle_rsc_0__38__INST.clear();
  twiddle_rsc_0__39__INST.clear();
  twiddle_rsc_0__40__INST.clear();
  twiddle_rsc_0__41__INST.clear();
  twiddle_rsc_0__42__INST.clear();
  twiddle_rsc_0__43__INST.clear();
  twiddle_rsc_0__44__INST.clear();
  twiddle_rsc_0__45__INST.clear();
  twiddle_rsc_0__46__INST.clear();
  twiddle_rsc_0__47__INST.clear();
  twiddle_rsc_0__48__INST.clear();
  twiddle_rsc_0__49__INST.clear();
  twiddle_rsc_0__50__INST.clear();
  twiddle_rsc_0__51__INST.clear();
  twiddle_rsc_0__52__INST.clear();
  twiddle_rsc_0__53__INST.clear();
  twiddle_rsc_0__54__INST.clear();
  twiddle_rsc_0__55__INST.clear();
  twiddle_rsc_0__56__INST.clear();
  twiddle_rsc_0__57__INST.clear();
  twiddle_rsc_0__58__INST.clear();
  twiddle_rsc_0__59__INST.clear();
  twiddle_rsc_0__60__INST.clear();
  twiddle_rsc_0__61__INST.clear();
  twiddle_rsc_0__62__INST.clear();
  twiddle_rsc_0__63__INST.clear();
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
