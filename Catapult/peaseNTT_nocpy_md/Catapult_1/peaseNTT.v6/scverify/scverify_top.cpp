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
#define TOP_HDL_ENTITY peaseNTT
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
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
extern double __scv_hold_time_RSCID_137;
extern double __scv_hold_time_RSCID_138;
extern double __scv_hold_time_RSCID_139;
extern double __scv_hold_time_RSCID_140;
extern double __scv_hold_time_RSCID_141;
extern double __scv_hold_time_RSCID_142;
extern double __scv_hold_time_RSCID_143;
extern double __scv_hold_time_RSCID_144;
extern double __scv_hold_time_RSCID_145;
extern double __scv_hold_time_RSCID_146;
extern double __scv_hold_time_RSCID_147;
extern double __scv_hold_time_RSCID_148;
extern double __scv_hold_time_RSCID_149;
extern double __scv_hold_time_RSCID_150;
extern double __scv_hold_time_RSCID_151;
extern double __scv_hold_time_RSCID_152;
extern double __scv_hold_time_RSCID_153;
extern double __scv_hold_time_RSCID_154;
extern double __scv_hold_time_RSCID_155;
extern double __scv_hold_time_RSCID_156;
extern double __scv_hold_time_RSCID_157;
extern double __scv_hold_time_RSCID_158;
extern double __scv_hold_time_RSCID_159;
extern double __scv_hold_time_RSCID_160;
extern double __scv_hold_time_RSCID_161;
extern double __scv_hold_time_RSCID_162;
extern double __scv_hold_time_RSCID_163;
extern double __scv_hold_time_RSCID_164;
extern double __scv_hold_time_RSCID_165;
extern double __scv_hold_time_RSCID_166;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
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
double __scv_hold_time_RSCID_137 = 0;
double __scv_hold_time_RSCID_138 = 0;
double __scv_hold_time_RSCID_139 = 0;
double __scv_hold_time_RSCID_140 = 0;
double __scv_hold_time_RSCID_141 = 0;
double __scv_hold_time_RSCID_142 = 0;
double __scv_hold_time_RSCID_143 = 0;
double __scv_hold_time_RSCID_144 = 0;
double __scv_hold_time_RSCID_145 = 0;
double __scv_hold_time_RSCID_146 = 0;
double __scv_hold_time_RSCID_147 = 0;
double __scv_hold_time_RSCID_148 = 0;
double __scv_hold_time_RSCID_149 = 0;
double __scv_hold_time_RSCID_150 = 0;
double __scv_hold_time_RSCID_151 = 0;
double __scv_hold_time_RSCID_152 = 0;
double __scv_hold_time_RSCID_153 = 0;
double __scv_hold_time_RSCID_154 = 0;
double __scv_hold_time_RSCID_155 = 0;
double __scv_hold_time_RSCID_156 = 0;
double __scv_hold_time_RSCID_157 = 0;
double __scv_hold_time_RSCID_158 = 0;
double __scv_hold_time_RSCID_159 = 0;
double __scv_hold_time_RSCID_160 = 0;
double __scv_hold_time_RSCID_161 = 0;
double __scv_hold_time_RSCID_162 = 0;
double __scv_hold_time_RSCID_163 = 0;
double __scv_hold_time_RSCID_164 = 0;
double __scv_hold_time_RSCID_165 = 0;
double __scv_hold_time_RSCID_166 = 0;
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
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_0_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_0_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_0_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_0_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_1_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_1_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_1_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_1_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_2_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_2_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_2_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_2_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_3_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_3_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_3_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_3_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_4_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_4_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_4_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_4_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_5_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_5_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_5_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_5_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_6_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_6_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_6_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_6_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_7_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_7_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_7_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_7_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_8_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_8_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_8_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_8_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_9_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_9_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_9_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_9_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_10_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_10_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_10_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_10_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_11_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_11_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_11_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_11_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_12_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_12_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_12_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_12_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_13_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_13_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_13_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_13_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_14_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_14_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_14_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_14_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_15_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_15_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_15_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_15_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_16_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_16_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_16_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_16_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_16_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_17_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_17_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_17_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_17_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_17_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_18_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_18_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_18_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_18_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_18_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_19_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_19_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_19_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_19_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_19_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_20_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_20_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_20_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_20_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_20_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_21_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_21_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_21_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_21_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_21_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_22_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_22_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_22_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_22_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_22_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_23_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_23_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_23_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_23_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_23_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_24_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_24_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_24_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_24_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_24_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_25_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_25_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_25_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_25_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_25_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_26_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_26_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_26_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_26_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_26_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_27_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_27_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_27_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_27_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_27_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_28_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_28_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_28_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_28_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_28_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_29_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_29_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_29_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_29_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_29_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_30_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_30_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_30_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_30_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_30_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0_31_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_31_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_0_31_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0_31_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_0_31_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_0_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_0_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_0_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_0_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_0_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_1_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_1_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_1_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_1_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_1_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_2_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_2_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_2_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_2_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_2_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_3_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_3_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_3_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_3_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_3_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_4_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_4_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_4_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_4_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_4_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_5_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_5_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_5_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_5_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_5_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_6_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_6_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_6_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_6_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_6_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_7_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_7_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_7_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_7_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_7_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_8_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_8_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_8_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_8_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_8_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_9_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_9_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_9_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_9_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_9_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_10_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_10_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_10_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_10_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_10_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_11_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_11_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_11_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_11_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_11_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_12_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_12_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_12_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_12_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_12_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_13_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_13_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_13_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_13_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_13_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_14_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_14_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_14_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_14_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_14_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_15_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_15_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_15_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_15_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_15_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_16_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_16_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_16_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_16_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_16_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_17_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_17_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_17_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_17_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_17_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_18_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_18_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_18_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_18_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_18_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_19_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_19_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_19_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_19_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_19_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_20_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_20_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_20_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_20_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_20_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_21_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_21_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_21_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_21_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_21_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_22_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_22_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_22_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_22_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_22_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_23_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_23_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_23_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_23_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_23_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_24_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_24_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_24_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_24_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_24_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_25_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_25_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_25_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_25_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_25_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_26_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_26_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_26_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_26_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_26_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_27_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_27_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_27_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_27_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_27_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_28_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_28_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_28_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_28_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_28_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_29_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_29_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_29_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_29_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_29_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_30_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_30_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_30_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_30_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_30_lz;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1_31_adra;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_31_da;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_1_31_wea;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1_31_qa;
  sc_signal<sc_logic>                                                           TLS_xt_rsc_triosy_1_31_lz;
  sc_signal<sc_lv<32> >                                                         TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                           TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<32> >                                                         TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                           TLS_r_rsc_triosy_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_0_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_0_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_0_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_0_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_0_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_0_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_0_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_0_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_0_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_0_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_0_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_0_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_0_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_0_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_0_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_1_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_1_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_1_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_1_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_1_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_1_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_1_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_1_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_1_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_1_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_1_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_1_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_1_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_1_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_1_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_1_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_1_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_2_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_2_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_2_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_2_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_2_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_2_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_2_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_2_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_2_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_2_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_2_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_2_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_2_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_2_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_2_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_2_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_2_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_3_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_3_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_3_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_3_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_3_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_3_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_3_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_3_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_3_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_3_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_3_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_3_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_3_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_3_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_3_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_3_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_3_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_4_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_4_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_4_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_4_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_4_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_4_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_4_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_4_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_4_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_4_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_4_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_4_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_4_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_4_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_4_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_4_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_4_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_5_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_5_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_5_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_5_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_5_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_5_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_5_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_5_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_5_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_5_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_5_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_5_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_5_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_5_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_5_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_5_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_5_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_6_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_6_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_6_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_6_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_6_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_6_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_6_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_6_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_6_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_6_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_6_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_6_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_6_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_6_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_6_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_6_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_6_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_7_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_7_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_7_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_7_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_7_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_7_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_7_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_7_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_7_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_7_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_7_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_7_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_7_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_7_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_7_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_7_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_7_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_8_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_8_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_8_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_8_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_8_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_8_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_8_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_8_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_8_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_8_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_8_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_8_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_8_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_8_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_8_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_8_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_8_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_9_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_9_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_9_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_9_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_9_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_9_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_9_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_9_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_9_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_9_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_9_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_9_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_9_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_9_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_9_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_9_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_9_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_10_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_10_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_10_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_10_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_10_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_10_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_10_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_10_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_10_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_10_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_10_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_10_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_10_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_10_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_10_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_10_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_10_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_11_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_11_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_11_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_11_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_11_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_11_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_11_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_11_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_11_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_11_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_11_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_11_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_11_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_11_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_11_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_11_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_11_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_12_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_12_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_12_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_12_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_12_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_12_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_12_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_12_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_12_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_12_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_12_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_12_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_12_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_12_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_12_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_12_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_12_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_13_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_13_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_13_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_13_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_13_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_13_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_13_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_13_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_13_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_13_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_13_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_13_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_13_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_13_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_13_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_13_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_13_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_14_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_14_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_14_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_14_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_14_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_14_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_14_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_14_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_14_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_14_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_14_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_14_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_14_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_14_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_14_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_14_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_14_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_15_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_15_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_15_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_15_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_15_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_15_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_15_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_15_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_rsc_0_15_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_15_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_rsc_0_15_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_rsc_0_15_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_rsc_0_15_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_rsc_0_15_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_rsc_0_15_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_0_15_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_rsc_triosy_0_15_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_0_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_0_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_0_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_0_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_0_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_0_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_0_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_0_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_0_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_0_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_0_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_0_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_0_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_0_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_0_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_0_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_0_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_1_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_1_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_1_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_1_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_1_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_1_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_1_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_1_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_1_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_1_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_1_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_1_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_1_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_1_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_1_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_1_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_1_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_2_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_2_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_2_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_2_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_2_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_2_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_2_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_2_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_2_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_2_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_2_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_2_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_2_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_2_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_2_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_2_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_2_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_3_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_3_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_3_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_3_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_3_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_3_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_3_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_3_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_3_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_3_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_3_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_3_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_3_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_3_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_3_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_3_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_3_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_4_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_4_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_4_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_4_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_4_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_4_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_4_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_4_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_4_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_4_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_4_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_4_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_4_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_4_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_4_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_4_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_4_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_5_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_5_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_5_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_5_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_5_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_5_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_5_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_5_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_5_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_5_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_5_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_5_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_5_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_5_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_5_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_5_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_5_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_6_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_6_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_6_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_6_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_6_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_6_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_6_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_6_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_6_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_6_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_6_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_6_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_6_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_6_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_6_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_6_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_6_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_7_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_7_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_7_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_7_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_7_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_7_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_7_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_7_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_7_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_7_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_7_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_7_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_7_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_7_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_7_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_7_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_7_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_8_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_8_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_8_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_8_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_8_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_8_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_8_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_8_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_8_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_8_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_8_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_8_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_8_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_8_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_8_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_8_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_8_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_9_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_9_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_9_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_9_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_9_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_9_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_9_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_9_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_9_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_9_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_9_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_9_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_9_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_9_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_9_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_9_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_9_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_10_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_10_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_10_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_10_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_10_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_10_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_10_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_10_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_10_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_10_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_10_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_10_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_10_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_10_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_10_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_10_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_10_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_11_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_11_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_11_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_11_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_11_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_11_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_11_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_11_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_11_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_11_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_11_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_11_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_11_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_11_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_11_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_11_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_11_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_12_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_12_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_12_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_12_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_12_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_12_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_12_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_12_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_12_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_12_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_12_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_12_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_12_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_12_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_12_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_12_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_12_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_13_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_13_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_13_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_13_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_13_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_13_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_13_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_13_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_13_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_13_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_13_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_13_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_13_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_13_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_13_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_13_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_13_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_14_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_14_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_14_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_14_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_14_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_14_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_14_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_14_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_14_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_14_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_14_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_14_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_14_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_14_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_14_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_14_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_14_lz;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_s_tdone;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_tr_write_done;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_RREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_RVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_RUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_RLAST;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_15_RRESP;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_15_RDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_RID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_ARREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_ARVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_ARUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_ARREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_ARQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_15_ARPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_ARCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_ARLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_15_ARBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_15_ARSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_15_ARLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_15_ARADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_ARID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_BREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_BVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_BUSER;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_15_BRESP;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_BID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_WREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_WVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_WUSER;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_WLAST;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_WSTRB;
  sc_signal<sc_lv<32> >                                                         TLS_twiddle_h_rsc_0_15_WDATA;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_AWREADY;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_AWVALID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_AWUSER;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_AWREGION;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_AWQOS;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_15_AWPROT;
  sc_signal<sc_lv<4> >                                                          TLS_twiddle_h_rsc_0_15_AWCACHE;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_AWLOCK;
  sc_signal<sc_lv<2> >                                                          TLS_twiddle_h_rsc_0_15_AWBURST;
  sc_signal<sc_lv<3> >                                                          TLS_twiddle_h_rsc_0_15_AWSIZE;
  sc_signal<sc_lv<8> >                                                          TLS_twiddle_h_rsc_0_15_AWLEN;
  sc_signal<sc_lv<12> >                                                         TLS_twiddle_h_rsc_0_15_AWADDR;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_0_15_AWID;
  sc_signal<sc_logic>                                                           TLS_twiddle_h_rsc_triosy_0_15_lz;
  ccs_DUT_wrapper                                                               peaseNTT_INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__0__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__0__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__0__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__1__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__1__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__1__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__2__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__2__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__2__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__3__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__3__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__3__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__4__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__4__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__4__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__5__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__5__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__5__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__6__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__6__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__6__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__7__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__7__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__7__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__8__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__8__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__8__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__9__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__9__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__9__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__10__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__10__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__10__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__11__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__11__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__11__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__12__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__12__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__12__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__13__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__13__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__13__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__14__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__14__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__14__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__15__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__15__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__15__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__16__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__16__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__16__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__17__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__17__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__17__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__18__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__18__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__18__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__19__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__19__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__19__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__20__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__20__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__20__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__21__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__21__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__21__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__22__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__22__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__22__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__23__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__23__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__23__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__24__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__24__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__24__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__25__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__25__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__25__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__26__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__26__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__26__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__27__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__27__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__27__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__28__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__28__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__28__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__29__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__29__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__29__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__30__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__30__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__30__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_0__31__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_0__31__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_0__31__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__0__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__0__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__0__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__1__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__1__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__1__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__2__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__2__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__2__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__3__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__3__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__3__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__4__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__4__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__4__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__5__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__5__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__5__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__6__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__6__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__6__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__7__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__7__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__7__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__8__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__8__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__8__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__9__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__9__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__9__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__10__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__10__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__10__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__11__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__11__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__11__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__12__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__12__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__12__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__13__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__13__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__13__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__14__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__14__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__14__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__15__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__15__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__15__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__16__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__16__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__16__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__17__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__17__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__17__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__18__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__18__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__18__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__19__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__19__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__19__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__20__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__20__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__20__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__21__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__21__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__21__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__22__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__22__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__22__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__23__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__23__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__23__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__24__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__24__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__24__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__25__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__25__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__25__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__26__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__26__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__26__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__27__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__27__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__27__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__28__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__28__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__28__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__29__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__29__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__29__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__30__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__30__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__30__INST;
  sc_signal<sc_lv<8> >                                                          TLS_xt_rsc_1__31__adrb;
  sc_signal<sc_lv<32> >                                                         TLS_xt_rsc_1__31__qb;
  BLOCK_2R1W_RBW_trans_rsc<8,32,256 >                                           xt_rsc_1__31__INST;
  ccs_in_trans_rsc_v1<1,32 >                                                    p_rsc_INST;
  ccs_in_trans_rsc_v1<1,32 >                                                    r_rsc_INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_0_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_0_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_0_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__0__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_1_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_1_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_1_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_1_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_1_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__1__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_2_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_2_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_2_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_2_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_2_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__2__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_3_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_3_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_3_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_3_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_3_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__3__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_4_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_4_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__4__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_5_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_5_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__5__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_6_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_6_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__6__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_7_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_7_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__7__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_8_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_8_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__8__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_9_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_9_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__9__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_10_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_10_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__10__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_11_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_11_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__11__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_12_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_12_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__12__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_13_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_13_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__13__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_14_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_14_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__14__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_15_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_rsc_0_15_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_rsc_0__15__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_0_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_0_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__0__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_1_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_1_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__1__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_2_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_2_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__2__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_3_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_3_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__3__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__4__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__5__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__6__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__7__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__8__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__9__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__10__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__11__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__12__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__13__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__14__INST;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_AWID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_AWUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_WUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_WUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_BID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_ARID;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_ARUSER;
  ccs_sc_lv1_to_sc_logic_adapter                                                CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARUSER;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_RID;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RID;
  sc_signal<sc_lv<1> >                                                          CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER;
  ccs_sc_logic_to_sc_lv1_adapter                                                CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER;
  ccs_axi4_slave_mem_trans_rsc<1024,32,32,0,0,12,32,1,1,1,0,0 >                 twiddle_h_rsc_0__15__INST;
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
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_8_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_9_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_10_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_11_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_12_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_13_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_14_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_15_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_16_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_17_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_18_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_19_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_20_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_21_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_22_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_23_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_24_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_25_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_26_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_27_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_28_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_29_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_30_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_0_31_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_0_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_1_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_2_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_3_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_4_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_5_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_6_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_7_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_8_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_9_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_10_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_11_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_12_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_13_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_14_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_15_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_16_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_17_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_18_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_19_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_20_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_21_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_22_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_23_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_24_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_25_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_26_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_27_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_28_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_29_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_30_lz_INST;
  mc_trios_inout_monitor                                                        trios_monitor_xt_rsc_triosy_1_31_lz_INST;
  mc_inout_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16384>,32,false>  transactor_xt;
  tlm::tlm_fifo<ac_int<32, false > >                                            TLS_in_fifo_p;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_p;
  mc_trios_input_monitor                                                        trios_monitor_p_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                              transactor_p;
  tlm::tlm_fifo<ac_int<32, false > >                                            TLS_in_fifo_r;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_r;
  mc_trios_input_monitor                                                        trios_monitor_r_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<32, false >,32,false>                              transactor_r;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16384> >                TLS_in_fifo_twiddle;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_twiddle;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_0_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_1_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_2_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_3_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_4_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_5_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_6_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_7_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_8_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_9_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_10_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_11_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_12_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_13_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_14_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_rsc_triosy_0_15_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_int<32, false >,16384>,32,false>  transactor_twiddle;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<32, false >,16384> >                TLS_in_fifo_twiddle_h;
  tlm::tlm_fifo<mc_wait_ctrl>                                                   TLS_in_wait_ctrl_fifo_twiddle_h;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_0_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_1_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_2_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_3_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_4_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_5_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_6_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_7_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_8_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_9_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_10_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_11_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_12_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_13_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_14_lz_INST;
  mc_trios_input_monitor                                                        trios_monitor_twiddle_h_rsc_triosy_0_15_lz_INST;
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
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_staller_inst_core_wen;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_0_i_inst_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_1_i_inst_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_2_i_inst_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_3_i_inst_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_4_i_inst_peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_ctrl_inst_twiddle_rsc_0_4_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_4_i_inst_peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_ctrl_inst_twiddle_rsc_0_4_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_4_i_inst_peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_dp_inst_twiddle_rsc_0_4_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_5_i_inst_peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_ctrl_inst_twiddle_rsc_0_5_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_5_i_inst_peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_ctrl_inst_twiddle_rsc_0_5_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_5_i_inst_peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_dp_inst_twiddle_rsc_0_5_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_6_i_inst_peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_ctrl_inst_twiddle_rsc_0_6_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_6_i_inst_peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_ctrl_inst_twiddle_rsc_0_6_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_6_i_inst_peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_dp_inst_twiddle_rsc_0_6_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_7_i_inst_peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_ctrl_inst_twiddle_rsc_0_7_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_7_i_inst_peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_ctrl_inst_twiddle_rsc_0_7_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_7_i_inst_peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_dp_inst_twiddle_rsc_0_7_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_8_i_inst_peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_ctrl_inst_twiddle_rsc_0_8_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_8_i_inst_peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_ctrl_inst_twiddle_rsc_0_8_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_8_i_inst_peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_dp_inst_twiddle_rsc_0_8_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_9_i_inst_peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_ctrl_inst_twiddle_rsc_0_9_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_9_i_inst_peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_ctrl_inst_twiddle_rsc_0_9_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_9_i_inst_peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_dp_inst_twiddle_rsc_0_9_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_10_i_inst_peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_ctrl_inst_twiddle_rsc_0_10_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_10_i_inst_peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_ctrl_inst_twiddle_rsc_0_10_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_10_i_inst_peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_dp_inst_twiddle_rsc_0_10_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_11_i_inst_peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_ctrl_inst_twiddle_rsc_0_11_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_11_i_inst_peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_ctrl_inst_twiddle_rsc_0_11_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_11_i_inst_peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_dp_inst_twiddle_rsc_0_11_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_12_i_inst_peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_ctrl_inst_twiddle_rsc_0_12_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_12_i_inst_peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_ctrl_inst_twiddle_rsc_0_12_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_12_i_inst_peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_dp_inst_twiddle_rsc_0_12_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_13_i_inst_peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_ctrl_inst_twiddle_rsc_0_13_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_13_i_inst_peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_ctrl_inst_twiddle_rsc_0_13_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_13_i_inst_peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_dp_inst_twiddle_rsc_0_13_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_14_i_inst_peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_ctrl_inst_twiddle_rsc_0_14_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_14_i_inst_peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_ctrl_inst_twiddle_rsc_0_14_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_14_i_inst_peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_dp_inst_twiddle_rsc_0_14_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_15_i_inst_peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_ctrl_inst_twiddle_rsc_0_15_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_15_i_inst_peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_ctrl_inst_twiddle_rsc_0_15_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_15_i_inst_peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_dp_inst_twiddle_rsc_0_15_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_ctrl_inst_twiddle_h_rsc_0_4_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_ctrl_inst_twiddle_h_rsc_0_4_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_dp_inst_twiddle_h_rsc_0_4_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_ctrl_inst_twiddle_h_rsc_0_5_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_ctrl_inst_twiddle_h_rsc_0_5_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_dp_inst_twiddle_h_rsc_0_5_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_ctrl_inst_twiddle_h_rsc_0_6_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_ctrl_inst_twiddle_h_rsc_0_6_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_dp_inst_twiddle_h_rsc_0_6_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_ctrl_inst_twiddle_h_rsc_0_7_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_ctrl_inst_twiddle_h_rsc_0_7_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_dp_inst_twiddle_h_rsc_0_7_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_ctrl_inst_twiddle_h_rsc_0_8_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_ctrl_inst_twiddle_h_rsc_0_8_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_dp_inst_twiddle_h_rsc_0_8_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_ctrl_inst_twiddle_h_rsc_0_9_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_ctrl_inst_twiddle_h_rsc_0_9_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_dp_inst_twiddle_h_rsc_0_9_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_ctrl_inst_twiddle_h_rsc_0_10_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_ctrl_inst_twiddle_h_rsc_0_10_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_dp_inst_twiddle_h_rsc_0_10_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_ctrl_inst_twiddle_h_rsc_0_11_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_ctrl_inst_twiddle_h_rsc_0_11_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_dp_inst_twiddle_h_rsc_0_11_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_ctrl_inst_twiddle_h_rsc_0_12_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_ctrl_inst_twiddle_h_rsc_0_12_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_dp_inst_twiddle_h_rsc_0_12_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_ctrl_inst_twiddle_h_rsc_0_13_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_ctrl_inst_twiddle_h_rsc_0_13_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_dp_inst_twiddle_h_rsc_0_13_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_ctrl_inst_twiddle_h_rsc_0_14_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_ctrl_inst_twiddle_h_rsc_0_14_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_dp_inst_twiddle_h_rsc_0_14_i_s_raddr_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_ctrl_inst_twiddle_h_rsc_0_15_i_s_re_core_sct;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_ctrl_inst_twiddle_h_rsc_0_15_i_s_rrdy;
  sc_signal<sc_logic>                                                           OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_dp_inst_twiddle_h_rsc_0_15_i_s_raddr_core_sct;
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
    , CCS_CLK_CTOR(clk, "clk", 5.1, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 112.199997, false)
    , TLS_rst("TLS_rst")
    , TLS_xt_rsc_0_0_adra("TLS_xt_rsc_0_0_adra")
    , TLS_xt_rsc_0_0_da("TLS_xt_rsc_0_0_da")
    , TLS_xt_rsc_0_0_wea("TLS_xt_rsc_0_0_wea")
    , TLS_xt_rsc_0_0_qa("TLS_xt_rsc_0_0_qa")
    , TLS_xt_rsc_triosy_0_0_lz("TLS_xt_rsc_triosy_0_0_lz")
    , TLS_xt_rsc_0_1_adra("TLS_xt_rsc_0_1_adra")
    , TLS_xt_rsc_0_1_da("TLS_xt_rsc_0_1_da")
    , TLS_xt_rsc_0_1_wea("TLS_xt_rsc_0_1_wea")
    , TLS_xt_rsc_0_1_qa("TLS_xt_rsc_0_1_qa")
    , TLS_xt_rsc_triosy_0_1_lz("TLS_xt_rsc_triosy_0_1_lz")
    , TLS_xt_rsc_0_2_adra("TLS_xt_rsc_0_2_adra")
    , TLS_xt_rsc_0_2_da("TLS_xt_rsc_0_2_da")
    , TLS_xt_rsc_0_2_wea("TLS_xt_rsc_0_2_wea")
    , TLS_xt_rsc_0_2_qa("TLS_xt_rsc_0_2_qa")
    , TLS_xt_rsc_triosy_0_2_lz("TLS_xt_rsc_triosy_0_2_lz")
    , TLS_xt_rsc_0_3_adra("TLS_xt_rsc_0_3_adra")
    , TLS_xt_rsc_0_3_da("TLS_xt_rsc_0_3_da")
    , TLS_xt_rsc_0_3_wea("TLS_xt_rsc_0_3_wea")
    , TLS_xt_rsc_0_3_qa("TLS_xt_rsc_0_3_qa")
    , TLS_xt_rsc_triosy_0_3_lz("TLS_xt_rsc_triosy_0_3_lz")
    , TLS_xt_rsc_0_4_adra("TLS_xt_rsc_0_4_adra")
    , TLS_xt_rsc_0_4_da("TLS_xt_rsc_0_4_da")
    , TLS_xt_rsc_0_4_wea("TLS_xt_rsc_0_4_wea")
    , TLS_xt_rsc_0_4_qa("TLS_xt_rsc_0_4_qa")
    , TLS_xt_rsc_triosy_0_4_lz("TLS_xt_rsc_triosy_0_4_lz")
    , TLS_xt_rsc_0_5_adra("TLS_xt_rsc_0_5_adra")
    , TLS_xt_rsc_0_5_da("TLS_xt_rsc_0_5_da")
    , TLS_xt_rsc_0_5_wea("TLS_xt_rsc_0_5_wea")
    , TLS_xt_rsc_0_5_qa("TLS_xt_rsc_0_5_qa")
    , TLS_xt_rsc_triosy_0_5_lz("TLS_xt_rsc_triosy_0_5_lz")
    , TLS_xt_rsc_0_6_adra("TLS_xt_rsc_0_6_adra")
    , TLS_xt_rsc_0_6_da("TLS_xt_rsc_0_6_da")
    , TLS_xt_rsc_0_6_wea("TLS_xt_rsc_0_6_wea")
    , TLS_xt_rsc_0_6_qa("TLS_xt_rsc_0_6_qa")
    , TLS_xt_rsc_triosy_0_6_lz("TLS_xt_rsc_triosy_0_6_lz")
    , TLS_xt_rsc_0_7_adra("TLS_xt_rsc_0_7_adra")
    , TLS_xt_rsc_0_7_da("TLS_xt_rsc_0_7_da")
    , TLS_xt_rsc_0_7_wea("TLS_xt_rsc_0_7_wea")
    , TLS_xt_rsc_0_7_qa("TLS_xt_rsc_0_7_qa")
    , TLS_xt_rsc_triosy_0_7_lz("TLS_xt_rsc_triosy_0_7_lz")
    , TLS_xt_rsc_0_8_adra("TLS_xt_rsc_0_8_adra")
    , TLS_xt_rsc_0_8_da("TLS_xt_rsc_0_8_da")
    , TLS_xt_rsc_0_8_wea("TLS_xt_rsc_0_8_wea")
    , TLS_xt_rsc_0_8_qa("TLS_xt_rsc_0_8_qa")
    , TLS_xt_rsc_triosy_0_8_lz("TLS_xt_rsc_triosy_0_8_lz")
    , TLS_xt_rsc_0_9_adra("TLS_xt_rsc_0_9_adra")
    , TLS_xt_rsc_0_9_da("TLS_xt_rsc_0_9_da")
    , TLS_xt_rsc_0_9_wea("TLS_xt_rsc_0_9_wea")
    , TLS_xt_rsc_0_9_qa("TLS_xt_rsc_0_9_qa")
    , TLS_xt_rsc_triosy_0_9_lz("TLS_xt_rsc_triosy_0_9_lz")
    , TLS_xt_rsc_0_10_adra("TLS_xt_rsc_0_10_adra")
    , TLS_xt_rsc_0_10_da("TLS_xt_rsc_0_10_da")
    , TLS_xt_rsc_0_10_wea("TLS_xt_rsc_0_10_wea")
    , TLS_xt_rsc_0_10_qa("TLS_xt_rsc_0_10_qa")
    , TLS_xt_rsc_triosy_0_10_lz("TLS_xt_rsc_triosy_0_10_lz")
    , TLS_xt_rsc_0_11_adra("TLS_xt_rsc_0_11_adra")
    , TLS_xt_rsc_0_11_da("TLS_xt_rsc_0_11_da")
    , TLS_xt_rsc_0_11_wea("TLS_xt_rsc_0_11_wea")
    , TLS_xt_rsc_0_11_qa("TLS_xt_rsc_0_11_qa")
    , TLS_xt_rsc_triosy_0_11_lz("TLS_xt_rsc_triosy_0_11_lz")
    , TLS_xt_rsc_0_12_adra("TLS_xt_rsc_0_12_adra")
    , TLS_xt_rsc_0_12_da("TLS_xt_rsc_0_12_da")
    , TLS_xt_rsc_0_12_wea("TLS_xt_rsc_0_12_wea")
    , TLS_xt_rsc_0_12_qa("TLS_xt_rsc_0_12_qa")
    , TLS_xt_rsc_triosy_0_12_lz("TLS_xt_rsc_triosy_0_12_lz")
    , TLS_xt_rsc_0_13_adra("TLS_xt_rsc_0_13_adra")
    , TLS_xt_rsc_0_13_da("TLS_xt_rsc_0_13_da")
    , TLS_xt_rsc_0_13_wea("TLS_xt_rsc_0_13_wea")
    , TLS_xt_rsc_0_13_qa("TLS_xt_rsc_0_13_qa")
    , TLS_xt_rsc_triosy_0_13_lz("TLS_xt_rsc_triosy_0_13_lz")
    , TLS_xt_rsc_0_14_adra("TLS_xt_rsc_0_14_adra")
    , TLS_xt_rsc_0_14_da("TLS_xt_rsc_0_14_da")
    , TLS_xt_rsc_0_14_wea("TLS_xt_rsc_0_14_wea")
    , TLS_xt_rsc_0_14_qa("TLS_xt_rsc_0_14_qa")
    , TLS_xt_rsc_triosy_0_14_lz("TLS_xt_rsc_triosy_0_14_lz")
    , TLS_xt_rsc_0_15_adra("TLS_xt_rsc_0_15_adra")
    , TLS_xt_rsc_0_15_da("TLS_xt_rsc_0_15_da")
    , TLS_xt_rsc_0_15_wea("TLS_xt_rsc_0_15_wea")
    , TLS_xt_rsc_0_15_qa("TLS_xt_rsc_0_15_qa")
    , TLS_xt_rsc_triosy_0_15_lz("TLS_xt_rsc_triosy_0_15_lz")
    , TLS_xt_rsc_0_16_adra("TLS_xt_rsc_0_16_adra")
    , TLS_xt_rsc_0_16_da("TLS_xt_rsc_0_16_da")
    , TLS_xt_rsc_0_16_wea("TLS_xt_rsc_0_16_wea")
    , TLS_xt_rsc_0_16_qa("TLS_xt_rsc_0_16_qa")
    , TLS_xt_rsc_triosy_0_16_lz("TLS_xt_rsc_triosy_0_16_lz")
    , TLS_xt_rsc_0_17_adra("TLS_xt_rsc_0_17_adra")
    , TLS_xt_rsc_0_17_da("TLS_xt_rsc_0_17_da")
    , TLS_xt_rsc_0_17_wea("TLS_xt_rsc_0_17_wea")
    , TLS_xt_rsc_0_17_qa("TLS_xt_rsc_0_17_qa")
    , TLS_xt_rsc_triosy_0_17_lz("TLS_xt_rsc_triosy_0_17_lz")
    , TLS_xt_rsc_0_18_adra("TLS_xt_rsc_0_18_adra")
    , TLS_xt_rsc_0_18_da("TLS_xt_rsc_0_18_da")
    , TLS_xt_rsc_0_18_wea("TLS_xt_rsc_0_18_wea")
    , TLS_xt_rsc_0_18_qa("TLS_xt_rsc_0_18_qa")
    , TLS_xt_rsc_triosy_0_18_lz("TLS_xt_rsc_triosy_0_18_lz")
    , TLS_xt_rsc_0_19_adra("TLS_xt_rsc_0_19_adra")
    , TLS_xt_rsc_0_19_da("TLS_xt_rsc_0_19_da")
    , TLS_xt_rsc_0_19_wea("TLS_xt_rsc_0_19_wea")
    , TLS_xt_rsc_0_19_qa("TLS_xt_rsc_0_19_qa")
    , TLS_xt_rsc_triosy_0_19_lz("TLS_xt_rsc_triosy_0_19_lz")
    , TLS_xt_rsc_0_20_adra("TLS_xt_rsc_0_20_adra")
    , TLS_xt_rsc_0_20_da("TLS_xt_rsc_0_20_da")
    , TLS_xt_rsc_0_20_wea("TLS_xt_rsc_0_20_wea")
    , TLS_xt_rsc_0_20_qa("TLS_xt_rsc_0_20_qa")
    , TLS_xt_rsc_triosy_0_20_lz("TLS_xt_rsc_triosy_0_20_lz")
    , TLS_xt_rsc_0_21_adra("TLS_xt_rsc_0_21_adra")
    , TLS_xt_rsc_0_21_da("TLS_xt_rsc_0_21_da")
    , TLS_xt_rsc_0_21_wea("TLS_xt_rsc_0_21_wea")
    , TLS_xt_rsc_0_21_qa("TLS_xt_rsc_0_21_qa")
    , TLS_xt_rsc_triosy_0_21_lz("TLS_xt_rsc_triosy_0_21_lz")
    , TLS_xt_rsc_0_22_adra("TLS_xt_rsc_0_22_adra")
    , TLS_xt_rsc_0_22_da("TLS_xt_rsc_0_22_da")
    , TLS_xt_rsc_0_22_wea("TLS_xt_rsc_0_22_wea")
    , TLS_xt_rsc_0_22_qa("TLS_xt_rsc_0_22_qa")
    , TLS_xt_rsc_triosy_0_22_lz("TLS_xt_rsc_triosy_0_22_lz")
    , TLS_xt_rsc_0_23_adra("TLS_xt_rsc_0_23_adra")
    , TLS_xt_rsc_0_23_da("TLS_xt_rsc_0_23_da")
    , TLS_xt_rsc_0_23_wea("TLS_xt_rsc_0_23_wea")
    , TLS_xt_rsc_0_23_qa("TLS_xt_rsc_0_23_qa")
    , TLS_xt_rsc_triosy_0_23_lz("TLS_xt_rsc_triosy_0_23_lz")
    , TLS_xt_rsc_0_24_adra("TLS_xt_rsc_0_24_adra")
    , TLS_xt_rsc_0_24_da("TLS_xt_rsc_0_24_da")
    , TLS_xt_rsc_0_24_wea("TLS_xt_rsc_0_24_wea")
    , TLS_xt_rsc_0_24_qa("TLS_xt_rsc_0_24_qa")
    , TLS_xt_rsc_triosy_0_24_lz("TLS_xt_rsc_triosy_0_24_lz")
    , TLS_xt_rsc_0_25_adra("TLS_xt_rsc_0_25_adra")
    , TLS_xt_rsc_0_25_da("TLS_xt_rsc_0_25_da")
    , TLS_xt_rsc_0_25_wea("TLS_xt_rsc_0_25_wea")
    , TLS_xt_rsc_0_25_qa("TLS_xt_rsc_0_25_qa")
    , TLS_xt_rsc_triosy_0_25_lz("TLS_xt_rsc_triosy_0_25_lz")
    , TLS_xt_rsc_0_26_adra("TLS_xt_rsc_0_26_adra")
    , TLS_xt_rsc_0_26_da("TLS_xt_rsc_0_26_da")
    , TLS_xt_rsc_0_26_wea("TLS_xt_rsc_0_26_wea")
    , TLS_xt_rsc_0_26_qa("TLS_xt_rsc_0_26_qa")
    , TLS_xt_rsc_triosy_0_26_lz("TLS_xt_rsc_triosy_0_26_lz")
    , TLS_xt_rsc_0_27_adra("TLS_xt_rsc_0_27_adra")
    , TLS_xt_rsc_0_27_da("TLS_xt_rsc_0_27_da")
    , TLS_xt_rsc_0_27_wea("TLS_xt_rsc_0_27_wea")
    , TLS_xt_rsc_0_27_qa("TLS_xt_rsc_0_27_qa")
    , TLS_xt_rsc_triosy_0_27_lz("TLS_xt_rsc_triosy_0_27_lz")
    , TLS_xt_rsc_0_28_adra("TLS_xt_rsc_0_28_adra")
    , TLS_xt_rsc_0_28_da("TLS_xt_rsc_0_28_da")
    , TLS_xt_rsc_0_28_wea("TLS_xt_rsc_0_28_wea")
    , TLS_xt_rsc_0_28_qa("TLS_xt_rsc_0_28_qa")
    , TLS_xt_rsc_triosy_0_28_lz("TLS_xt_rsc_triosy_0_28_lz")
    , TLS_xt_rsc_0_29_adra("TLS_xt_rsc_0_29_adra")
    , TLS_xt_rsc_0_29_da("TLS_xt_rsc_0_29_da")
    , TLS_xt_rsc_0_29_wea("TLS_xt_rsc_0_29_wea")
    , TLS_xt_rsc_0_29_qa("TLS_xt_rsc_0_29_qa")
    , TLS_xt_rsc_triosy_0_29_lz("TLS_xt_rsc_triosy_0_29_lz")
    , TLS_xt_rsc_0_30_adra("TLS_xt_rsc_0_30_adra")
    , TLS_xt_rsc_0_30_da("TLS_xt_rsc_0_30_da")
    , TLS_xt_rsc_0_30_wea("TLS_xt_rsc_0_30_wea")
    , TLS_xt_rsc_0_30_qa("TLS_xt_rsc_0_30_qa")
    , TLS_xt_rsc_triosy_0_30_lz("TLS_xt_rsc_triosy_0_30_lz")
    , TLS_xt_rsc_0_31_adra("TLS_xt_rsc_0_31_adra")
    , TLS_xt_rsc_0_31_da("TLS_xt_rsc_0_31_da")
    , TLS_xt_rsc_0_31_wea("TLS_xt_rsc_0_31_wea")
    , TLS_xt_rsc_0_31_qa("TLS_xt_rsc_0_31_qa")
    , TLS_xt_rsc_triosy_0_31_lz("TLS_xt_rsc_triosy_0_31_lz")
    , TLS_xt_rsc_1_0_adra("TLS_xt_rsc_1_0_adra")
    , TLS_xt_rsc_1_0_da("TLS_xt_rsc_1_0_da")
    , TLS_xt_rsc_1_0_wea("TLS_xt_rsc_1_0_wea")
    , TLS_xt_rsc_1_0_qa("TLS_xt_rsc_1_0_qa")
    , TLS_xt_rsc_triosy_1_0_lz("TLS_xt_rsc_triosy_1_0_lz")
    , TLS_xt_rsc_1_1_adra("TLS_xt_rsc_1_1_adra")
    , TLS_xt_rsc_1_1_da("TLS_xt_rsc_1_1_da")
    , TLS_xt_rsc_1_1_wea("TLS_xt_rsc_1_1_wea")
    , TLS_xt_rsc_1_1_qa("TLS_xt_rsc_1_1_qa")
    , TLS_xt_rsc_triosy_1_1_lz("TLS_xt_rsc_triosy_1_1_lz")
    , TLS_xt_rsc_1_2_adra("TLS_xt_rsc_1_2_adra")
    , TLS_xt_rsc_1_2_da("TLS_xt_rsc_1_2_da")
    , TLS_xt_rsc_1_2_wea("TLS_xt_rsc_1_2_wea")
    , TLS_xt_rsc_1_2_qa("TLS_xt_rsc_1_2_qa")
    , TLS_xt_rsc_triosy_1_2_lz("TLS_xt_rsc_triosy_1_2_lz")
    , TLS_xt_rsc_1_3_adra("TLS_xt_rsc_1_3_adra")
    , TLS_xt_rsc_1_3_da("TLS_xt_rsc_1_3_da")
    , TLS_xt_rsc_1_3_wea("TLS_xt_rsc_1_3_wea")
    , TLS_xt_rsc_1_3_qa("TLS_xt_rsc_1_3_qa")
    , TLS_xt_rsc_triosy_1_3_lz("TLS_xt_rsc_triosy_1_3_lz")
    , TLS_xt_rsc_1_4_adra("TLS_xt_rsc_1_4_adra")
    , TLS_xt_rsc_1_4_da("TLS_xt_rsc_1_4_da")
    , TLS_xt_rsc_1_4_wea("TLS_xt_rsc_1_4_wea")
    , TLS_xt_rsc_1_4_qa("TLS_xt_rsc_1_4_qa")
    , TLS_xt_rsc_triosy_1_4_lz("TLS_xt_rsc_triosy_1_4_lz")
    , TLS_xt_rsc_1_5_adra("TLS_xt_rsc_1_5_adra")
    , TLS_xt_rsc_1_5_da("TLS_xt_rsc_1_5_da")
    , TLS_xt_rsc_1_5_wea("TLS_xt_rsc_1_5_wea")
    , TLS_xt_rsc_1_5_qa("TLS_xt_rsc_1_5_qa")
    , TLS_xt_rsc_triosy_1_5_lz("TLS_xt_rsc_triosy_1_5_lz")
    , TLS_xt_rsc_1_6_adra("TLS_xt_rsc_1_6_adra")
    , TLS_xt_rsc_1_6_da("TLS_xt_rsc_1_6_da")
    , TLS_xt_rsc_1_6_wea("TLS_xt_rsc_1_6_wea")
    , TLS_xt_rsc_1_6_qa("TLS_xt_rsc_1_6_qa")
    , TLS_xt_rsc_triosy_1_6_lz("TLS_xt_rsc_triosy_1_6_lz")
    , TLS_xt_rsc_1_7_adra("TLS_xt_rsc_1_7_adra")
    , TLS_xt_rsc_1_7_da("TLS_xt_rsc_1_7_da")
    , TLS_xt_rsc_1_7_wea("TLS_xt_rsc_1_7_wea")
    , TLS_xt_rsc_1_7_qa("TLS_xt_rsc_1_7_qa")
    , TLS_xt_rsc_triosy_1_7_lz("TLS_xt_rsc_triosy_1_7_lz")
    , TLS_xt_rsc_1_8_adra("TLS_xt_rsc_1_8_adra")
    , TLS_xt_rsc_1_8_da("TLS_xt_rsc_1_8_da")
    , TLS_xt_rsc_1_8_wea("TLS_xt_rsc_1_8_wea")
    , TLS_xt_rsc_1_8_qa("TLS_xt_rsc_1_8_qa")
    , TLS_xt_rsc_triosy_1_8_lz("TLS_xt_rsc_triosy_1_8_lz")
    , TLS_xt_rsc_1_9_adra("TLS_xt_rsc_1_9_adra")
    , TLS_xt_rsc_1_9_da("TLS_xt_rsc_1_9_da")
    , TLS_xt_rsc_1_9_wea("TLS_xt_rsc_1_9_wea")
    , TLS_xt_rsc_1_9_qa("TLS_xt_rsc_1_9_qa")
    , TLS_xt_rsc_triosy_1_9_lz("TLS_xt_rsc_triosy_1_9_lz")
    , TLS_xt_rsc_1_10_adra("TLS_xt_rsc_1_10_adra")
    , TLS_xt_rsc_1_10_da("TLS_xt_rsc_1_10_da")
    , TLS_xt_rsc_1_10_wea("TLS_xt_rsc_1_10_wea")
    , TLS_xt_rsc_1_10_qa("TLS_xt_rsc_1_10_qa")
    , TLS_xt_rsc_triosy_1_10_lz("TLS_xt_rsc_triosy_1_10_lz")
    , TLS_xt_rsc_1_11_adra("TLS_xt_rsc_1_11_adra")
    , TLS_xt_rsc_1_11_da("TLS_xt_rsc_1_11_da")
    , TLS_xt_rsc_1_11_wea("TLS_xt_rsc_1_11_wea")
    , TLS_xt_rsc_1_11_qa("TLS_xt_rsc_1_11_qa")
    , TLS_xt_rsc_triosy_1_11_lz("TLS_xt_rsc_triosy_1_11_lz")
    , TLS_xt_rsc_1_12_adra("TLS_xt_rsc_1_12_adra")
    , TLS_xt_rsc_1_12_da("TLS_xt_rsc_1_12_da")
    , TLS_xt_rsc_1_12_wea("TLS_xt_rsc_1_12_wea")
    , TLS_xt_rsc_1_12_qa("TLS_xt_rsc_1_12_qa")
    , TLS_xt_rsc_triosy_1_12_lz("TLS_xt_rsc_triosy_1_12_lz")
    , TLS_xt_rsc_1_13_adra("TLS_xt_rsc_1_13_adra")
    , TLS_xt_rsc_1_13_da("TLS_xt_rsc_1_13_da")
    , TLS_xt_rsc_1_13_wea("TLS_xt_rsc_1_13_wea")
    , TLS_xt_rsc_1_13_qa("TLS_xt_rsc_1_13_qa")
    , TLS_xt_rsc_triosy_1_13_lz("TLS_xt_rsc_triosy_1_13_lz")
    , TLS_xt_rsc_1_14_adra("TLS_xt_rsc_1_14_adra")
    , TLS_xt_rsc_1_14_da("TLS_xt_rsc_1_14_da")
    , TLS_xt_rsc_1_14_wea("TLS_xt_rsc_1_14_wea")
    , TLS_xt_rsc_1_14_qa("TLS_xt_rsc_1_14_qa")
    , TLS_xt_rsc_triosy_1_14_lz("TLS_xt_rsc_triosy_1_14_lz")
    , TLS_xt_rsc_1_15_adra("TLS_xt_rsc_1_15_adra")
    , TLS_xt_rsc_1_15_da("TLS_xt_rsc_1_15_da")
    , TLS_xt_rsc_1_15_wea("TLS_xt_rsc_1_15_wea")
    , TLS_xt_rsc_1_15_qa("TLS_xt_rsc_1_15_qa")
    , TLS_xt_rsc_triosy_1_15_lz("TLS_xt_rsc_triosy_1_15_lz")
    , TLS_xt_rsc_1_16_adra("TLS_xt_rsc_1_16_adra")
    , TLS_xt_rsc_1_16_da("TLS_xt_rsc_1_16_da")
    , TLS_xt_rsc_1_16_wea("TLS_xt_rsc_1_16_wea")
    , TLS_xt_rsc_1_16_qa("TLS_xt_rsc_1_16_qa")
    , TLS_xt_rsc_triosy_1_16_lz("TLS_xt_rsc_triosy_1_16_lz")
    , TLS_xt_rsc_1_17_adra("TLS_xt_rsc_1_17_adra")
    , TLS_xt_rsc_1_17_da("TLS_xt_rsc_1_17_da")
    , TLS_xt_rsc_1_17_wea("TLS_xt_rsc_1_17_wea")
    , TLS_xt_rsc_1_17_qa("TLS_xt_rsc_1_17_qa")
    , TLS_xt_rsc_triosy_1_17_lz("TLS_xt_rsc_triosy_1_17_lz")
    , TLS_xt_rsc_1_18_adra("TLS_xt_rsc_1_18_adra")
    , TLS_xt_rsc_1_18_da("TLS_xt_rsc_1_18_da")
    , TLS_xt_rsc_1_18_wea("TLS_xt_rsc_1_18_wea")
    , TLS_xt_rsc_1_18_qa("TLS_xt_rsc_1_18_qa")
    , TLS_xt_rsc_triosy_1_18_lz("TLS_xt_rsc_triosy_1_18_lz")
    , TLS_xt_rsc_1_19_adra("TLS_xt_rsc_1_19_adra")
    , TLS_xt_rsc_1_19_da("TLS_xt_rsc_1_19_da")
    , TLS_xt_rsc_1_19_wea("TLS_xt_rsc_1_19_wea")
    , TLS_xt_rsc_1_19_qa("TLS_xt_rsc_1_19_qa")
    , TLS_xt_rsc_triosy_1_19_lz("TLS_xt_rsc_triosy_1_19_lz")
    , TLS_xt_rsc_1_20_adra("TLS_xt_rsc_1_20_adra")
    , TLS_xt_rsc_1_20_da("TLS_xt_rsc_1_20_da")
    , TLS_xt_rsc_1_20_wea("TLS_xt_rsc_1_20_wea")
    , TLS_xt_rsc_1_20_qa("TLS_xt_rsc_1_20_qa")
    , TLS_xt_rsc_triosy_1_20_lz("TLS_xt_rsc_triosy_1_20_lz")
    , TLS_xt_rsc_1_21_adra("TLS_xt_rsc_1_21_adra")
    , TLS_xt_rsc_1_21_da("TLS_xt_rsc_1_21_da")
    , TLS_xt_rsc_1_21_wea("TLS_xt_rsc_1_21_wea")
    , TLS_xt_rsc_1_21_qa("TLS_xt_rsc_1_21_qa")
    , TLS_xt_rsc_triosy_1_21_lz("TLS_xt_rsc_triosy_1_21_lz")
    , TLS_xt_rsc_1_22_adra("TLS_xt_rsc_1_22_adra")
    , TLS_xt_rsc_1_22_da("TLS_xt_rsc_1_22_da")
    , TLS_xt_rsc_1_22_wea("TLS_xt_rsc_1_22_wea")
    , TLS_xt_rsc_1_22_qa("TLS_xt_rsc_1_22_qa")
    , TLS_xt_rsc_triosy_1_22_lz("TLS_xt_rsc_triosy_1_22_lz")
    , TLS_xt_rsc_1_23_adra("TLS_xt_rsc_1_23_adra")
    , TLS_xt_rsc_1_23_da("TLS_xt_rsc_1_23_da")
    , TLS_xt_rsc_1_23_wea("TLS_xt_rsc_1_23_wea")
    , TLS_xt_rsc_1_23_qa("TLS_xt_rsc_1_23_qa")
    , TLS_xt_rsc_triosy_1_23_lz("TLS_xt_rsc_triosy_1_23_lz")
    , TLS_xt_rsc_1_24_adra("TLS_xt_rsc_1_24_adra")
    , TLS_xt_rsc_1_24_da("TLS_xt_rsc_1_24_da")
    , TLS_xt_rsc_1_24_wea("TLS_xt_rsc_1_24_wea")
    , TLS_xt_rsc_1_24_qa("TLS_xt_rsc_1_24_qa")
    , TLS_xt_rsc_triosy_1_24_lz("TLS_xt_rsc_triosy_1_24_lz")
    , TLS_xt_rsc_1_25_adra("TLS_xt_rsc_1_25_adra")
    , TLS_xt_rsc_1_25_da("TLS_xt_rsc_1_25_da")
    , TLS_xt_rsc_1_25_wea("TLS_xt_rsc_1_25_wea")
    , TLS_xt_rsc_1_25_qa("TLS_xt_rsc_1_25_qa")
    , TLS_xt_rsc_triosy_1_25_lz("TLS_xt_rsc_triosy_1_25_lz")
    , TLS_xt_rsc_1_26_adra("TLS_xt_rsc_1_26_adra")
    , TLS_xt_rsc_1_26_da("TLS_xt_rsc_1_26_da")
    , TLS_xt_rsc_1_26_wea("TLS_xt_rsc_1_26_wea")
    , TLS_xt_rsc_1_26_qa("TLS_xt_rsc_1_26_qa")
    , TLS_xt_rsc_triosy_1_26_lz("TLS_xt_rsc_triosy_1_26_lz")
    , TLS_xt_rsc_1_27_adra("TLS_xt_rsc_1_27_adra")
    , TLS_xt_rsc_1_27_da("TLS_xt_rsc_1_27_da")
    , TLS_xt_rsc_1_27_wea("TLS_xt_rsc_1_27_wea")
    , TLS_xt_rsc_1_27_qa("TLS_xt_rsc_1_27_qa")
    , TLS_xt_rsc_triosy_1_27_lz("TLS_xt_rsc_triosy_1_27_lz")
    , TLS_xt_rsc_1_28_adra("TLS_xt_rsc_1_28_adra")
    , TLS_xt_rsc_1_28_da("TLS_xt_rsc_1_28_da")
    , TLS_xt_rsc_1_28_wea("TLS_xt_rsc_1_28_wea")
    , TLS_xt_rsc_1_28_qa("TLS_xt_rsc_1_28_qa")
    , TLS_xt_rsc_triosy_1_28_lz("TLS_xt_rsc_triosy_1_28_lz")
    , TLS_xt_rsc_1_29_adra("TLS_xt_rsc_1_29_adra")
    , TLS_xt_rsc_1_29_da("TLS_xt_rsc_1_29_da")
    , TLS_xt_rsc_1_29_wea("TLS_xt_rsc_1_29_wea")
    , TLS_xt_rsc_1_29_qa("TLS_xt_rsc_1_29_qa")
    , TLS_xt_rsc_triosy_1_29_lz("TLS_xt_rsc_triosy_1_29_lz")
    , TLS_xt_rsc_1_30_adra("TLS_xt_rsc_1_30_adra")
    , TLS_xt_rsc_1_30_da("TLS_xt_rsc_1_30_da")
    , TLS_xt_rsc_1_30_wea("TLS_xt_rsc_1_30_wea")
    , TLS_xt_rsc_1_30_qa("TLS_xt_rsc_1_30_qa")
    , TLS_xt_rsc_triosy_1_30_lz("TLS_xt_rsc_triosy_1_30_lz")
    , TLS_xt_rsc_1_31_adra("TLS_xt_rsc_1_31_adra")
    , TLS_xt_rsc_1_31_da("TLS_xt_rsc_1_31_da")
    , TLS_xt_rsc_1_31_wea("TLS_xt_rsc_1_31_wea")
    , TLS_xt_rsc_1_31_qa("TLS_xt_rsc_1_31_qa")
    , TLS_xt_rsc_triosy_1_31_lz("TLS_xt_rsc_triosy_1_31_lz")
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
    , TLS_twiddle_rsc_0_4_s_tdone("TLS_twiddle_rsc_0_4_s_tdone")
    , TLS_twiddle_rsc_0_4_tr_write_done("TLS_twiddle_rsc_0_4_tr_write_done")
    , TLS_twiddle_rsc_0_4_RREADY("TLS_twiddle_rsc_0_4_RREADY")
    , TLS_twiddle_rsc_0_4_RVALID("TLS_twiddle_rsc_0_4_RVALID")
    , TLS_twiddle_rsc_0_4_RUSER("TLS_twiddle_rsc_0_4_RUSER")
    , TLS_twiddle_rsc_0_4_RLAST("TLS_twiddle_rsc_0_4_RLAST")
    , TLS_twiddle_rsc_0_4_RRESP("TLS_twiddle_rsc_0_4_RRESP")
    , TLS_twiddle_rsc_0_4_RDATA("TLS_twiddle_rsc_0_4_RDATA")
    , TLS_twiddle_rsc_0_4_RID("TLS_twiddle_rsc_0_4_RID")
    , TLS_twiddle_rsc_0_4_ARREADY("TLS_twiddle_rsc_0_4_ARREADY")
    , TLS_twiddle_rsc_0_4_ARVALID("TLS_twiddle_rsc_0_4_ARVALID")
    , TLS_twiddle_rsc_0_4_ARUSER("TLS_twiddle_rsc_0_4_ARUSER")
    , TLS_twiddle_rsc_0_4_ARREGION("TLS_twiddle_rsc_0_4_ARREGION")
    , TLS_twiddle_rsc_0_4_ARQOS("TLS_twiddle_rsc_0_4_ARQOS")
    , TLS_twiddle_rsc_0_4_ARPROT("TLS_twiddle_rsc_0_4_ARPROT")
    , TLS_twiddle_rsc_0_4_ARCACHE("TLS_twiddle_rsc_0_4_ARCACHE")
    , TLS_twiddle_rsc_0_4_ARLOCK("TLS_twiddle_rsc_0_4_ARLOCK")
    , TLS_twiddle_rsc_0_4_ARBURST("TLS_twiddle_rsc_0_4_ARBURST")
    , TLS_twiddle_rsc_0_4_ARSIZE("TLS_twiddle_rsc_0_4_ARSIZE")
    , TLS_twiddle_rsc_0_4_ARLEN("TLS_twiddle_rsc_0_4_ARLEN")
    , TLS_twiddle_rsc_0_4_ARADDR("TLS_twiddle_rsc_0_4_ARADDR")
    , TLS_twiddle_rsc_0_4_ARID("TLS_twiddle_rsc_0_4_ARID")
    , TLS_twiddle_rsc_0_4_BREADY("TLS_twiddle_rsc_0_4_BREADY")
    , TLS_twiddle_rsc_0_4_BVALID("TLS_twiddle_rsc_0_4_BVALID")
    , TLS_twiddle_rsc_0_4_BUSER("TLS_twiddle_rsc_0_4_BUSER")
    , TLS_twiddle_rsc_0_4_BRESP("TLS_twiddle_rsc_0_4_BRESP")
    , TLS_twiddle_rsc_0_4_BID("TLS_twiddle_rsc_0_4_BID")
    , TLS_twiddle_rsc_0_4_WREADY("TLS_twiddle_rsc_0_4_WREADY")
    , TLS_twiddle_rsc_0_4_WVALID("TLS_twiddle_rsc_0_4_WVALID")
    , TLS_twiddle_rsc_0_4_WUSER("TLS_twiddle_rsc_0_4_WUSER")
    , TLS_twiddle_rsc_0_4_WLAST("TLS_twiddle_rsc_0_4_WLAST")
    , TLS_twiddle_rsc_0_4_WSTRB("TLS_twiddle_rsc_0_4_WSTRB")
    , TLS_twiddle_rsc_0_4_WDATA("TLS_twiddle_rsc_0_4_WDATA")
    , TLS_twiddle_rsc_0_4_AWREADY("TLS_twiddle_rsc_0_4_AWREADY")
    , TLS_twiddle_rsc_0_4_AWVALID("TLS_twiddle_rsc_0_4_AWVALID")
    , TLS_twiddle_rsc_0_4_AWUSER("TLS_twiddle_rsc_0_4_AWUSER")
    , TLS_twiddle_rsc_0_4_AWREGION("TLS_twiddle_rsc_0_4_AWREGION")
    , TLS_twiddle_rsc_0_4_AWQOS("TLS_twiddle_rsc_0_4_AWQOS")
    , TLS_twiddle_rsc_0_4_AWPROT("TLS_twiddle_rsc_0_4_AWPROT")
    , TLS_twiddle_rsc_0_4_AWCACHE("TLS_twiddle_rsc_0_4_AWCACHE")
    , TLS_twiddle_rsc_0_4_AWLOCK("TLS_twiddle_rsc_0_4_AWLOCK")
    , TLS_twiddle_rsc_0_4_AWBURST("TLS_twiddle_rsc_0_4_AWBURST")
    , TLS_twiddle_rsc_0_4_AWSIZE("TLS_twiddle_rsc_0_4_AWSIZE")
    , TLS_twiddle_rsc_0_4_AWLEN("TLS_twiddle_rsc_0_4_AWLEN")
    , TLS_twiddle_rsc_0_4_AWADDR("TLS_twiddle_rsc_0_4_AWADDR")
    , TLS_twiddle_rsc_0_4_AWID("TLS_twiddle_rsc_0_4_AWID")
    , TLS_twiddle_rsc_triosy_0_4_lz("TLS_twiddle_rsc_triosy_0_4_lz")
    , TLS_twiddle_rsc_0_5_s_tdone("TLS_twiddle_rsc_0_5_s_tdone")
    , TLS_twiddle_rsc_0_5_tr_write_done("TLS_twiddle_rsc_0_5_tr_write_done")
    , TLS_twiddle_rsc_0_5_RREADY("TLS_twiddle_rsc_0_5_RREADY")
    , TLS_twiddle_rsc_0_5_RVALID("TLS_twiddle_rsc_0_5_RVALID")
    , TLS_twiddle_rsc_0_5_RUSER("TLS_twiddle_rsc_0_5_RUSER")
    , TLS_twiddle_rsc_0_5_RLAST("TLS_twiddle_rsc_0_5_RLAST")
    , TLS_twiddle_rsc_0_5_RRESP("TLS_twiddle_rsc_0_5_RRESP")
    , TLS_twiddle_rsc_0_5_RDATA("TLS_twiddle_rsc_0_5_RDATA")
    , TLS_twiddle_rsc_0_5_RID("TLS_twiddle_rsc_0_5_RID")
    , TLS_twiddle_rsc_0_5_ARREADY("TLS_twiddle_rsc_0_5_ARREADY")
    , TLS_twiddle_rsc_0_5_ARVALID("TLS_twiddle_rsc_0_5_ARVALID")
    , TLS_twiddle_rsc_0_5_ARUSER("TLS_twiddle_rsc_0_5_ARUSER")
    , TLS_twiddle_rsc_0_5_ARREGION("TLS_twiddle_rsc_0_5_ARREGION")
    , TLS_twiddle_rsc_0_5_ARQOS("TLS_twiddle_rsc_0_5_ARQOS")
    , TLS_twiddle_rsc_0_5_ARPROT("TLS_twiddle_rsc_0_5_ARPROT")
    , TLS_twiddle_rsc_0_5_ARCACHE("TLS_twiddle_rsc_0_5_ARCACHE")
    , TLS_twiddle_rsc_0_5_ARLOCK("TLS_twiddle_rsc_0_5_ARLOCK")
    , TLS_twiddle_rsc_0_5_ARBURST("TLS_twiddle_rsc_0_5_ARBURST")
    , TLS_twiddle_rsc_0_5_ARSIZE("TLS_twiddle_rsc_0_5_ARSIZE")
    , TLS_twiddle_rsc_0_5_ARLEN("TLS_twiddle_rsc_0_5_ARLEN")
    , TLS_twiddle_rsc_0_5_ARADDR("TLS_twiddle_rsc_0_5_ARADDR")
    , TLS_twiddle_rsc_0_5_ARID("TLS_twiddle_rsc_0_5_ARID")
    , TLS_twiddle_rsc_0_5_BREADY("TLS_twiddle_rsc_0_5_BREADY")
    , TLS_twiddle_rsc_0_5_BVALID("TLS_twiddle_rsc_0_5_BVALID")
    , TLS_twiddle_rsc_0_5_BUSER("TLS_twiddle_rsc_0_5_BUSER")
    , TLS_twiddle_rsc_0_5_BRESP("TLS_twiddle_rsc_0_5_BRESP")
    , TLS_twiddle_rsc_0_5_BID("TLS_twiddle_rsc_0_5_BID")
    , TLS_twiddle_rsc_0_5_WREADY("TLS_twiddle_rsc_0_5_WREADY")
    , TLS_twiddle_rsc_0_5_WVALID("TLS_twiddle_rsc_0_5_WVALID")
    , TLS_twiddle_rsc_0_5_WUSER("TLS_twiddle_rsc_0_5_WUSER")
    , TLS_twiddle_rsc_0_5_WLAST("TLS_twiddle_rsc_0_5_WLAST")
    , TLS_twiddle_rsc_0_5_WSTRB("TLS_twiddle_rsc_0_5_WSTRB")
    , TLS_twiddle_rsc_0_5_WDATA("TLS_twiddle_rsc_0_5_WDATA")
    , TLS_twiddle_rsc_0_5_AWREADY("TLS_twiddle_rsc_0_5_AWREADY")
    , TLS_twiddle_rsc_0_5_AWVALID("TLS_twiddle_rsc_0_5_AWVALID")
    , TLS_twiddle_rsc_0_5_AWUSER("TLS_twiddle_rsc_0_5_AWUSER")
    , TLS_twiddle_rsc_0_5_AWREGION("TLS_twiddle_rsc_0_5_AWREGION")
    , TLS_twiddle_rsc_0_5_AWQOS("TLS_twiddle_rsc_0_5_AWQOS")
    , TLS_twiddle_rsc_0_5_AWPROT("TLS_twiddle_rsc_0_5_AWPROT")
    , TLS_twiddle_rsc_0_5_AWCACHE("TLS_twiddle_rsc_0_5_AWCACHE")
    , TLS_twiddle_rsc_0_5_AWLOCK("TLS_twiddle_rsc_0_5_AWLOCK")
    , TLS_twiddle_rsc_0_5_AWBURST("TLS_twiddle_rsc_0_5_AWBURST")
    , TLS_twiddle_rsc_0_5_AWSIZE("TLS_twiddle_rsc_0_5_AWSIZE")
    , TLS_twiddle_rsc_0_5_AWLEN("TLS_twiddle_rsc_0_5_AWLEN")
    , TLS_twiddle_rsc_0_5_AWADDR("TLS_twiddle_rsc_0_5_AWADDR")
    , TLS_twiddle_rsc_0_5_AWID("TLS_twiddle_rsc_0_5_AWID")
    , TLS_twiddle_rsc_triosy_0_5_lz("TLS_twiddle_rsc_triosy_0_5_lz")
    , TLS_twiddle_rsc_0_6_s_tdone("TLS_twiddle_rsc_0_6_s_tdone")
    , TLS_twiddle_rsc_0_6_tr_write_done("TLS_twiddle_rsc_0_6_tr_write_done")
    , TLS_twiddle_rsc_0_6_RREADY("TLS_twiddle_rsc_0_6_RREADY")
    , TLS_twiddle_rsc_0_6_RVALID("TLS_twiddle_rsc_0_6_RVALID")
    , TLS_twiddle_rsc_0_6_RUSER("TLS_twiddle_rsc_0_6_RUSER")
    , TLS_twiddle_rsc_0_6_RLAST("TLS_twiddle_rsc_0_6_RLAST")
    , TLS_twiddle_rsc_0_6_RRESP("TLS_twiddle_rsc_0_6_RRESP")
    , TLS_twiddle_rsc_0_6_RDATA("TLS_twiddle_rsc_0_6_RDATA")
    , TLS_twiddle_rsc_0_6_RID("TLS_twiddle_rsc_0_6_RID")
    , TLS_twiddle_rsc_0_6_ARREADY("TLS_twiddle_rsc_0_6_ARREADY")
    , TLS_twiddle_rsc_0_6_ARVALID("TLS_twiddle_rsc_0_6_ARVALID")
    , TLS_twiddle_rsc_0_6_ARUSER("TLS_twiddle_rsc_0_6_ARUSER")
    , TLS_twiddle_rsc_0_6_ARREGION("TLS_twiddle_rsc_0_6_ARREGION")
    , TLS_twiddle_rsc_0_6_ARQOS("TLS_twiddle_rsc_0_6_ARQOS")
    , TLS_twiddle_rsc_0_6_ARPROT("TLS_twiddle_rsc_0_6_ARPROT")
    , TLS_twiddle_rsc_0_6_ARCACHE("TLS_twiddle_rsc_0_6_ARCACHE")
    , TLS_twiddle_rsc_0_6_ARLOCK("TLS_twiddle_rsc_0_6_ARLOCK")
    , TLS_twiddle_rsc_0_6_ARBURST("TLS_twiddle_rsc_0_6_ARBURST")
    , TLS_twiddle_rsc_0_6_ARSIZE("TLS_twiddle_rsc_0_6_ARSIZE")
    , TLS_twiddle_rsc_0_6_ARLEN("TLS_twiddle_rsc_0_6_ARLEN")
    , TLS_twiddle_rsc_0_6_ARADDR("TLS_twiddle_rsc_0_6_ARADDR")
    , TLS_twiddle_rsc_0_6_ARID("TLS_twiddle_rsc_0_6_ARID")
    , TLS_twiddle_rsc_0_6_BREADY("TLS_twiddle_rsc_0_6_BREADY")
    , TLS_twiddle_rsc_0_6_BVALID("TLS_twiddle_rsc_0_6_BVALID")
    , TLS_twiddle_rsc_0_6_BUSER("TLS_twiddle_rsc_0_6_BUSER")
    , TLS_twiddle_rsc_0_6_BRESP("TLS_twiddle_rsc_0_6_BRESP")
    , TLS_twiddle_rsc_0_6_BID("TLS_twiddle_rsc_0_6_BID")
    , TLS_twiddle_rsc_0_6_WREADY("TLS_twiddle_rsc_0_6_WREADY")
    , TLS_twiddle_rsc_0_6_WVALID("TLS_twiddle_rsc_0_6_WVALID")
    , TLS_twiddle_rsc_0_6_WUSER("TLS_twiddle_rsc_0_6_WUSER")
    , TLS_twiddle_rsc_0_6_WLAST("TLS_twiddle_rsc_0_6_WLAST")
    , TLS_twiddle_rsc_0_6_WSTRB("TLS_twiddle_rsc_0_6_WSTRB")
    , TLS_twiddle_rsc_0_6_WDATA("TLS_twiddle_rsc_0_6_WDATA")
    , TLS_twiddle_rsc_0_6_AWREADY("TLS_twiddle_rsc_0_6_AWREADY")
    , TLS_twiddle_rsc_0_6_AWVALID("TLS_twiddle_rsc_0_6_AWVALID")
    , TLS_twiddle_rsc_0_6_AWUSER("TLS_twiddle_rsc_0_6_AWUSER")
    , TLS_twiddle_rsc_0_6_AWREGION("TLS_twiddle_rsc_0_6_AWREGION")
    , TLS_twiddle_rsc_0_6_AWQOS("TLS_twiddle_rsc_0_6_AWQOS")
    , TLS_twiddle_rsc_0_6_AWPROT("TLS_twiddle_rsc_0_6_AWPROT")
    , TLS_twiddle_rsc_0_6_AWCACHE("TLS_twiddle_rsc_0_6_AWCACHE")
    , TLS_twiddle_rsc_0_6_AWLOCK("TLS_twiddle_rsc_0_6_AWLOCK")
    , TLS_twiddle_rsc_0_6_AWBURST("TLS_twiddle_rsc_0_6_AWBURST")
    , TLS_twiddle_rsc_0_6_AWSIZE("TLS_twiddle_rsc_0_6_AWSIZE")
    , TLS_twiddle_rsc_0_6_AWLEN("TLS_twiddle_rsc_0_6_AWLEN")
    , TLS_twiddle_rsc_0_6_AWADDR("TLS_twiddle_rsc_0_6_AWADDR")
    , TLS_twiddle_rsc_0_6_AWID("TLS_twiddle_rsc_0_6_AWID")
    , TLS_twiddle_rsc_triosy_0_6_lz("TLS_twiddle_rsc_triosy_0_6_lz")
    , TLS_twiddle_rsc_0_7_s_tdone("TLS_twiddle_rsc_0_7_s_tdone")
    , TLS_twiddle_rsc_0_7_tr_write_done("TLS_twiddle_rsc_0_7_tr_write_done")
    , TLS_twiddle_rsc_0_7_RREADY("TLS_twiddle_rsc_0_7_RREADY")
    , TLS_twiddle_rsc_0_7_RVALID("TLS_twiddle_rsc_0_7_RVALID")
    , TLS_twiddle_rsc_0_7_RUSER("TLS_twiddle_rsc_0_7_RUSER")
    , TLS_twiddle_rsc_0_7_RLAST("TLS_twiddle_rsc_0_7_RLAST")
    , TLS_twiddle_rsc_0_7_RRESP("TLS_twiddle_rsc_0_7_RRESP")
    , TLS_twiddle_rsc_0_7_RDATA("TLS_twiddle_rsc_0_7_RDATA")
    , TLS_twiddle_rsc_0_7_RID("TLS_twiddle_rsc_0_7_RID")
    , TLS_twiddle_rsc_0_7_ARREADY("TLS_twiddle_rsc_0_7_ARREADY")
    , TLS_twiddle_rsc_0_7_ARVALID("TLS_twiddle_rsc_0_7_ARVALID")
    , TLS_twiddle_rsc_0_7_ARUSER("TLS_twiddle_rsc_0_7_ARUSER")
    , TLS_twiddle_rsc_0_7_ARREGION("TLS_twiddle_rsc_0_7_ARREGION")
    , TLS_twiddle_rsc_0_7_ARQOS("TLS_twiddle_rsc_0_7_ARQOS")
    , TLS_twiddle_rsc_0_7_ARPROT("TLS_twiddle_rsc_0_7_ARPROT")
    , TLS_twiddle_rsc_0_7_ARCACHE("TLS_twiddle_rsc_0_7_ARCACHE")
    , TLS_twiddle_rsc_0_7_ARLOCK("TLS_twiddle_rsc_0_7_ARLOCK")
    , TLS_twiddle_rsc_0_7_ARBURST("TLS_twiddle_rsc_0_7_ARBURST")
    , TLS_twiddle_rsc_0_7_ARSIZE("TLS_twiddle_rsc_0_7_ARSIZE")
    , TLS_twiddle_rsc_0_7_ARLEN("TLS_twiddle_rsc_0_7_ARLEN")
    , TLS_twiddle_rsc_0_7_ARADDR("TLS_twiddle_rsc_0_7_ARADDR")
    , TLS_twiddle_rsc_0_7_ARID("TLS_twiddle_rsc_0_7_ARID")
    , TLS_twiddle_rsc_0_7_BREADY("TLS_twiddle_rsc_0_7_BREADY")
    , TLS_twiddle_rsc_0_7_BVALID("TLS_twiddle_rsc_0_7_BVALID")
    , TLS_twiddle_rsc_0_7_BUSER("TLS_twiddle_rsc_0_7_BUSER")
    , TLS_twiddle_rsc_0_7_BRESP("TLS_twiddle_rsc_0_7_BRESP")
    , TLS_twiddle_rsc_0_7_BID("TLS_twiddle_rsc_0_7_BID")
    , TLS_twiddle_rsc_0_7_WREADY("TLS_twiddle_rsc_0_7_WREADY")
    , TLS_twiddle_rsc_0_7_WVALID("TLS_twiddle_rsc_0_7_WVALID")
    , TLS_twiddle_rsc_0_7_WUSER("TLS_twiddle_rsc_0_7_WUSER")
    , TLS_twiddle_rsc_0_7_WLAST("TLS_twiddle_rsc_0_7_WLAST")
    , TLS_twiddle_rsc_0_7_WSTRB("TLS_twiddle_rsc_0_7_WSTRB")
    , TLS_twiddle_rsc_0_7_WDATA("TLS_twiddle_rsc_0_7_WDATA")
    , TLS_twiddle_rsc_0_7_AWREADY("TLS_twiddle_rsc_0_7_AWREADY")
    , TLS_twiddle_rsc_0_7_AWVALID("TLS_twiddle_rsc_0_7_AWVALID")
    , TLS_twiddle_rsc_0_7_AWUSER("TLS_twiddle_rsc_0_7_AWUSER")
    , TLS_twiddle_rsc_0_7_AWREGION("TLS_twiddle_rsc_0_7_AWREGION")
    , TLS_twiddle_rsc_0_7_AWQOS("TLS_twiddle_rsc_0_7_AWQOS")
    , TLS_twiddle_rsc_0_7_AWPROT("TLS_twiddle_rsc_0_7_AWPROT")
    , TLS_twiddle_rsc_0_7_AWCACHE("TLS_twiddle_rsc_0_7_AWCACHE")
    , TLS_twiddle_rsc_0_7_AWLOCK("TLS_twiddle_rsc_0_7_AWLOCK")
    , TLS_twiddle_rsc_0_7_AWBURST("TLS_twiddle_rsc_0_7_AWBURST")
    , TLS_twiddle_rsc_0_7_AWSIZE("TLS_twiddle_rsc_0_7_AWSIZE")
    , TLS_twiddle_rsc_0_7_AWLEN("TLS_twiddle_rsc_0_7_AWLEN")
    , TLS_twiddle_rsc_0_7_AWADDR("TLS_twiddle_rsc_0_7_AWADDR")
    , TLS_twiddle_rsc_0_7_AWID("TLS_twiddle_rsc_0_7_AWID")
    , TLS_twiddle_rsc_triosy_0_7_lz("TLS_twiddle_rsc_triosy_0_7_lz")
    , TLS_twiddle_rsc_0_8_s_tdone("TLS_twiddle_rsc_0_8_s_tdone")
    , TLS_twiddle_rsc_0_8_tr_write_done("TLS_twiddle_rsc_0_8_tr_write_done")
    , TLS_twiddle_rsc_0_8_RREADY("TLS_twiddle_rsc_0_8_RREADY")
    , TLS_twiddle_rsc_0_8_RVALID("TLS_twiddle_rsc_0_8_RVALID")
    , TLS_twiddle_rsc_0_8_RUSER("TLS_twiddle_rsc_0_8_RUSER")
    , TLS_twiddle_rsc_0_8_RLAST("TLS_twiddle_rsc_0_8_RLAST")
    , TLS_twiddle_rsc_0_8_RRESP("TLS_twiddle_rsc_0_8_RRESP")
    , TLS_twiddle_rsc_0_8_RDATA("TLS_twiddle_rsc_0_8_RDATA")
    , TLS_twiddle_rsc_0_8_RID("TLS_twiddle_rsc_0_8_RID")
    , TLS_twiddle_rsc_0_8_ARREADY("TLS_twiddle_rsc_0_8_ARREADY")
    , TLS_twiddle_rsc_0_8_ARVALID("TLS_twiddle_rsc_0_8_ARVALID")
    , TLS_twiddle_rsc_0_8_ARUSER("TLS_twiddle_rsc_0_8_ARUSER")
    , TLS_twiddle_rsc_0_8_ARREGION("TLS_twiddle_rsc_0_8_ARREGION")
    , TLS_twiddle_rsc_0_8_ARQOS("TLS_twiddle_rsc_0_8_ARQOS")
    , TLS_twiddle_rsc_0_8_ARPROT("TLS_twiddle_rsc_0_8_ARPROT")
    , TLS_twiddle_rsc_0_8_ARCACHE("TLS_twiddle_rsc_0_8_ARCACHE")
    , TLS_twiddle_rsc_0_8_ARLOCK("TLS_twiddle_rsc_0_8_ARLOCK")
    , TLS_twiddle_rsc_0_8_ARBURST("TLS_twiddle_rsc_0_8_ARBURST")
    , TLS_twiddle_rsc_0_8_ARSIZE("TLS_twiddle_rsc_0_8_ARSIZE")
    , TLS_twiddle_rsc_0_8_ARLEN("TLS_twiddle_rsc_0_8_ARLEN")
    , TLS_twiddle_rsc_0_8_ARADDR("TLS_twiddle_rsc_0_8_ARADDR")
    , TLS_twiddle_rsc_0_8_ARID("TLS_twiddle_rsc_0_8_ARID")
    , TLS_twiddle_rsc_0_8_BREADY("TLS_twiddle_rsc_0_8_BREADY")
    , TLS_twiddle_rsc_0_8_BVALID("TLS_twiddle_rsc_0_8_BVALID")
    , TLS_twiddle_rsc_0_8_BUSER("TLS_twiddle_rsc_0_8_BUSER")
    , TLS_twiddle_rsc_0_8_BRESP("TLS_twiddle_rsc_0_8_BRESP")
    , TLS_twiddle_rsc_0_8_BID("TLS_twiddle_rsc_0_8_BID")
    , TLS_twiddle_rsc_0_8_WREADY("TLS_twiddle_rsc_0_8_WREADY")
    , TLS_twiddle_rsc_0_8_WVALID("TLS_twiddle_rsc_0_8_WVALID")
    , TLS_twiddle_rsc_0_8_WUSER("TLS_twiddle_rsc_0_8_WUSER")
    , TLS_twiddle_rsc_0_8_WLAST("TLS_twiddle_rsc_0_8_WLAST")
    , TLS_twiddle_rsc_0_8_WSTRB("TLS_twiddle_rsc_0_8_WSTRB")
    , TLS_twiddle_rsc_0_8_WDATA("TLS_twiddle_rsc_0_8_WDATA")
    , TLS_twiddle_rsc_0_8_AWREADY("TLS_twiddle_rsc_0_8_AWREADY")
    , TLS_twiddle_rsc_0_8_AWVALID("TLS_twiddle_rsc_0_8_AWVALID")
    , TLS_twiddle_rsc_0_8_AWUSER("TLS_twiddle_rsc_0_8_AWUSER")
    , TLS_twiddle_rsc_0_8_AWREGION("TLS_twiddle_rsc_0_8_AWREGION")
    , TLS_twiddle_rsc_0_8_AWQOS("TLS_twiddle_rsc_0_8_AWQOS")
    , TLS_twiddle_rsc_0_8_AWPROT("TLS_twiddle_rsc_0_8_AWPROT")
    , TLS_twiddle_rsc_0_8_AWCACHE("TLS_twiddle_rsc_0_8_AWCACHE")
    , TLS_twiddle_rsc_0_8_AWLOCK("TLS_twiddle_rsc_0_8_AWLOCK")
    , TLS_twiddle_rsc_0_8_AWBURST("TLS_twiddle_rsc_0_8_AWBURST")
    , TLS_twiddle_rsc_0_8_AWSIZE("TLS_twiddle_rsc_0_8_AWSIZE")
    , TLS_twiddle_rsc_0_8_AWLEN("TLS_twiddle_rsc_0_8_AWLEN")
    , TLS_twiddle_rsc_0_8_AWADDR("TLS_twiddle_rsc_0_8_AWADDR")
    , TLS_twiddle_rsc_0_8_AWID("TLS_twiddle_rsc_0_8_AWID")
    , TLS_twiddle_rsc_triosy_0_8_lz("TLS_twiddle_rsc_triosy_0_8_lz")
    , TLS_twiddle_rsc_0_9_s_tdone("TLS_twiddle_rsc_0_9_s_tdone")
    , TLS_twiddle_rsc_0_9_tr_write_done("TLS_twiddle_rsc_0_9_tr_write_done")
    , TLS_twiddle_rsc_0_9_RREADY("TLS_twiddle_rsc_0_9_RREADY")
    , TLS_twiddle_rsc_0_9_RVALID("TLS_twiddle_rsc_0_9_RVALID")
    , TLS_twiddle_rsc_0_9_RUSER("TLS_twiddle_rsc_0_9_RUSER")
    , TLS_twiddle_rsc_0_9_RLAST("TLS_twiddle_rsc_0_9_RLAST")
    , TLS_twiddle_rsc_0_9_RRESP("TLS_twiddle_rsc_0_9_RRESP")
    , TLS_twiddle_rsc_0_9_RDATA("TLS_twiddle_rsc_0_9_RDATA")
    , TLS_twiddle_rsc_0_9_RID("TLS_twiddle_rsc_0_9_RID")
    , TLS_twiddle_rsc_0_9_ARREADY("TLS_twiddle_rsc_0_9_ARREADY")
    , TLS_twiddle_rsc_0_9_ARVALID("TLS_twiddle_rsc_0_9_ARVALID")
    , TLS_twiddle_rsc_0_9_ARUSER("TLS_twiddle_rsc_0_9_ARUSER")
    , TLS_twiddle_rsc_0_9_ARREGION("TLS_twiddle_rsc_0_9_ARREGION")
    , TLS_twiddle_rsc_0_9_ARQOS("TLS_twiddle_rsc_0_9_ARQOS")
    , TLS_twiddle_rsc_0_9_ARPROT("TLS_twiddle_rsc_0_9_ARPROT")
    , TLS_twiddle_rsc_0_9_ARCACHE("TLS_twiddle_rsc_0_9_ARCACHE")
    , TLS_twiddle_rsc_0_9_ARLOCK("TLS_twiddle_rsc_0_9_ARLOCK")
    , TLS_twiddle_rsc_0_9_ARBURST("TLS_twiddle_rsc_0_9_ARBURST")
    , TLS_twiddle_rsc_0_9_ARSIZE("TLS_twiddle_rsc_0_9_ARSIZE")
    , TLS_twiddle_rsc_0_9_ARLEN("TLS_twiddle_rsc_0_9_ARLEN")
    , TLS_twiddle_rsc_0_9_ARADDR("TLS_twiddle_rsc_0_9_ARADDR")
    , TLS_twiddle_rsc_0_9_ARID("TLS_twiddle_rsc_0_9_ARID")
    , TLS_twiddle_rsc_0_9_BREADY("TLS_twiddle_rsc_0_9_BREADY")
    , TLS_twiddle_rsc_0_9_BVALID("TLS_twiddle_rsc_0_9_BVALID")
    , TLS_twiddle_rsc_0_9_BUSER("TLS_twiddle_rsc_0_9_BUSER")
    , TLS_twiddle_rsc_0_9_BRESP("TLS_twiddle_rsc_0_9_BRESP")
    , TLS_twiddle_rsc_0_9_BID("TLS_twiddle_rsc_0_9_BID")
    , TLS_twiddle_rsc_0_9_WREADY("TLS_twiddle_rsc_0_9_WREADY")
    , TLS_twiddle_rsc_0_9_WVALID("TLS_twiddle_rsc_0_9_WVALID")
    , TLS_twiddle_rsc_0_9_WUSER("TLS_twiddle_rsc_0_9_WUSER")
    , TLS_twiddle_rsc_0_9_WLAST("TLS_twiddle_rsc_0_9_WLAST")
    , TLS_twiddle_rsc_0_9_WSTRB("TLS_twiddle_rsc_0_9_WSTRB")
    , TLS_twiddle_rsc_0_9_WDATA("TLS_twiddle_rsc_0_9_WDATA")
    , TLS_twiddle_rsc_0_9_AWREADY("TLS_twiddle_rsc_0_9_AWREADY")
    , TLS_twiddle_rsc_0_9_AWVALID("TLS_twiddle_rsc_0_9_AWVALID")
    , TLS_twiddle_rsc_0_9_AWUSER("TLS_twiddle_rsc_0_9_AWUSER")
    , TLS_twiddle_rsc_0_9_AWREGION("TLS_twiddle_rsc_0_9_AWREGION")
    , TLS_twiddle_rsc_0_9_AWQOS("TLS_twiddle_rsc_0_9_AWQOS")
    , TLS_twiddle_rsc_0_9_AWPROT("TLS_twiddle_rsc_0_9_AWPROT")
    , TLS_twiddle_rsc_0_9_AWCACHE("TLS_twiddle_rsc_0_9_AWCACHE")
    , TLS_twiddle_rsc_0_9_AWLOCK("TLS_twiddle_rsc_0_9_AWLOCK")
    , TLS_twiddle_rsc_0_9_AWBURST("TLS_twiddle_rsc_0_9_AWBURST")
    , TLS_twiddle_rsc_0_9_AWSIZE("TLS_twiddle_rsc_0_9_AWSIZE")
    , TLS_twiddle_rsc_0_9_AWLEN("TLS_twiddle_rsc_0_9_AWLEN")
    , TLS_twiddle_rsc_0_9_AWADDR("TLS_twiddle_rsc_0_9_AWADDR")
    , TLS_twiddle_rsc_0_9_AWID("TLS_twiddle_rsc_0_9_AWID")
    , TLS_twiddle_rsc_triosy_0_9_lz("TLS_twiddle_rsc_triosy_0_9_lz")
    , TLS_twiddle_rsc_0_10_s_tdone("TLS_twiddle_rsc_0_10_s_tdone")
    , TLS_twiddle_rsc_0_10_tr_write_done("TLS_twiddle_rsc_0_10_tr_write_done")
    , TLS_twiddle_rsc_0_10_RREADY("TLS_twiddle_rsc_0_10_RREADY")
    , TLS_twiddle_rsc_0_10_RVALID("TLS_twiddle_rsc_0_10_RVALID")
    , TLS_twiddle_rsc_0_10_RUSER("TLS_twiddle_rsc_0_10_RUSER")
    , TLS_twiddle_rsc_0_10_RLAST("TLS_twiddle_rsc_0_10_RLAST")
    , TLS_twiddle_rsc_0_10_RRESP("TLS_twiddle_rsc_0_10_RRESP")
    , TLS_twiddle_rsc_0_10_RDATA("TLS_twiddle_rsc_0_10_RDATA")
    , TLS_twiddle_rsc_0_10_RID("TLS_twiddle_rsc_0_10_RID")
    , TLS_twiddle_rsc_0_10_ARREADY("TLS_twiddle_rsc_0_10_ARREADY")
    , TLS_twiddle_rsc_0_10_ARVALID("TLS_twiddle_rsc_0_10_ARVALID")
    , TLS_twiddle_rsc_0_10_ARUSER("TLS_twiddle_rsc_0_10_ARUSER")
    , TLS_twiddle_rsc_0_10_ARREGION("TLS_twiddle_rsc_0_10_ARREGION")
    , TLS_twiddle_rsc_0_10_ARQOS("TLS_twiddle_rsc_0_10_ARQOS")
    , TLS_twiddle_rsc_0_10_ARPROT("TLS_twiddle_rsc_0_10_ARPROT")
    , TLS_twiddle_rsc_0_10_ARCACHE("TLS_twiddle_rsc_0_10_ARCACHE")
    , TLS_twiddle_rsc_0_10_ARLOCK("TLS_twiddle_rsc_0_10_ARLOCK")
    , TLS_twiddle_rsc_0_10_ARBURST("TLS_twiddle_rsc_0_10_ARBURST")
    , TLS_twiddle_rsc_0_10_ARSIZE("TLS_twiddle_rsc_0_10_ARSIZE")
    , TLS_twiddle_rsc_0_10_ARLEN("TLS_twiddle_rsc_0_10_ARLEN")
    , TLS_twiddle_rsc_0_10_ARADDR("TLS_twiddle_rsc_0_10_ARADDR")
    , TLS_twiddle_rsc_0_10_ARID("TLS_twiddle_rsc_0_10_ARID")
    , TLS_twiddle_rsc_0_10_BREADY("TLS_twiddle_rsc_0_10_BREADY")
    , TLS_twiddle_rsc_0_10_BVALID("TLS_twiddle_rsc_0_10_BVALID")
    , TLS_twiddle_rsc_0_10_BUSER("TLS_twiddle_rsc_0_10_BUSER")
    , TLS_twiddle_rsc_0_10_BRESP("TLS_twiddle_rsc_0_10_BRESP")
    , TLS_twiddle_rsc_0_10_BID("TLS_twiddle_rsc_0_10_BID")
    , TLS_twiddle_rsc_0_10_WREADY("TLS_twiddle_rsc_0_10_WREADY")
    , TLS_twiddle_rsc_0_10_WVALID("TLS_twiddle_rsc_0_10_WVALID")
    , TLS_twiddle_rsc_0_10_WUSER("TLS_twiddle_rsc_0_10_WUSER")
    , TLS_twiddle_rsc_0_10_WLAST("TLS_twiddle_rsc_0_10_WLAST")
    , TLS_twiddle_rsc_0_10_WSTRB("TLS_twiddle_rsc_0_10_WSTRB")
    , TLS_twiddle_rsc_0_10_WDATA("TLS_twiddle_rsc_0_10_WDATA")
    , TLS_twiddle_rsc_0_10_AWREADY("TLS_twiddle_rsc_0_10_AWREADY")
    , TLS_twiddle_rsc_0_10_AWVALID("TLS_twiddle_rsc_0_10_AWVALID")
    , TLS_twiddle_rsc_0_10_AWUSER("TLS_twiddle_rsc_0_10_AWUSER")
    , TLS_twiddle_rsc_0_10_AWREGION("TLS_twiddle_rsc_0_10_AWREGION")
    , TLS_twiddle_rsc_0_10_AWQOS("TLS_twiddle_rsc_0_10_AWQOS")
    , TLS_twiddle_rsc_0_10_AWPROT("TLS_twiddle_rsc_0_10_AWPROT")
    , TLS_twiddle_rsc_0_10_AWCACHE("TLS_twiddle_rsc_0_10_AWCACHE")
    , TLS_twiddle_rsc_0_10_AWLOCK("TLS_twiddle_rsc_0_10_AWLOCK")
    , TLS_twiddle_rsc_0_10_AWBURST("TLS_twiddle_rsc_0_10_AWBURST")
    , TLS_twiddle_rsc_0_10_AWSIZE("TLS_twiddle_rsc_0_10_AWSIZE")
    , TLS_twiddle_rsc_0_10_AWLEN("TLS_twiddle_rsc_0_10_AWLEN")
    , TLS_twiddle_rsc_0_10_AWADDR("TLS_twiddle_rsc_0_10_AWADDR")
    , TLS_twiddle_rsc_0_10_AWID("TLS_twiddle_rsc_0_10_AWID")
    , TLS_twiddle_rsc_triosy_0_10_lz("TLS_twiddle_rsc_triosy_0_10_lz")
    , TLS_twiddle_rsc_0_11_s_tdone("TLS_twiddle_rsc_0_11_s_tdone")
    , TLS_twiddle_rsc_0_11_tr_write_done("TLS_twiddle_rsc_0_11_tr_write_done")
    , TLS_twiddle_rsc_0_11_RREADY("TLS_twiddle_rsc_0_11_RREADY")
    , TLS_twiddle_rsc_0_11_RVALID("TLS_twiddle_rsc_0_11_RVALID")
    , TLS_twiddle_rsc_0_11_RUSER("TLS_twiddle_rsc_0_11_RUSER")
    , TLS_twiddle_rsc_0_11_RLAST("TLS_twiddle_rsc_0_11_RLAST")
    , TLS_twiddle_rsc_0_11_RRESP("TLS_twiddle_rsc_0_11_RRESP")
    , TLS_twiddle_rsc_0_11_RDATA("TLS_twiddle_rsc_0_11_RDATA")
    , TLS_twiddle_rsc_0_11_RID("TLS_twiddle_rsc_0_11_RID")
    , TLS_twiddle_rsc_0_11_ARREADY("TLS_twiddle_rsc_0_11_ARREADY")
    , TLS_twiddle_rsc_0_11_ARVALID("TLS_twiddle_rsc_0_11_ARVALID")
    , TLS_twiddle_rsc_0_11_ARUSER("TLS_twiddle_rsc_0_11_ARUSER")
    , TLS_twiddle_rsc_0_11_ARREGION("TLS_twiddle_rsc_0_11_ARREGION")
    , TLS_twiddle_rsc_0_11_ARQOS("TLS_twiddle_rsc_0_11_ARQOS")
    , TLS_twiddle_rsc_0_11_ARPROT("TLS_twiddle_rsc_0_11_ARPROT")
    , TLS_twiddle_rsc_0_11_ARCACHE("TLS_twiddle_rsc_0_11_ARCACHE")
    , TLS_twiddle_rsc_0_11_ARLOCK("TLS_twiddle_rsc_0_11_ARLOCK")
    , TLS_twiddle_rsc_0_11_ARBURST("TLS_twiddle_rsc_0_11_ARBURST")
    , TLS_twiddle_rsc_0_11_ARSIZE("TLS_twiddle_rsc_0_11_ARSIZE")
    , TLS_twiddle_rsc_0_11_ARLEN("TLS_twiddle_rsc_0_11_ARLEN")
    , TLS_twiddle_rsc_0_11_ARADDR("TLS_twiddle_rsc_0_11_ARADDR")
    , TLS_twiddle_rsc_0_11_ARID("TLS_twiddle_rsc_0_11_ARID")
    , TLS_twiddle_rsc_0_11_BREADY("TLS_twiddle_rsc_0_11_BREADY")
    , TLS_twiddle_rsc_0_11_BVALID("TLS_twiddle_rsc_0_11_BVALID")
    , TLS_twiddle_rsc_0_11_BUSER("TLS_twiddle_rsc_0_11_BUSER")
    , TLS_twiddle_rsc_0_11_BRESP("TLS_twiddle_rsc_0_11_BRESP")
    , TLS_twiddle_rsc_0_11_BID("TLS_twiddle_rsc_0_11_BID")
    , TLS_twiddle_rsc_0_11_WREADY("TLS_twiddle_rsc_0_11_WREADY")
    , TLS_twiddle_rsc_0_11_WVALID("TLS_twiddle_rsc_0_11_WVALID")
    , TLS_twiddle_rsc_0_11_WUSER("TLS_twiddle_rsc_0_11_WUSER")
    , TLS_twiddle_rsc_0_11_WLAST("TLS_twiddle_rsc_0_11_WLAST")
    , TLS_twiddle_rsc_0_11_WSTRB("TLS_twiddle_rsc_0_11_WSTRB")
    , TLS_twiddle_rsc_0_11_WDATA("TLS_twiddle_rsc_0_11_WDATA")
    , TLS_twiddle_rsc_0_11_AWREADY("TLS_twiddle_rsc_0_11_AWREADY")
    , TLS_twiddle_rsc_0_11_AWVALID("TLS_twiddle_rsc_0_11_AWVALID")
    , TLS_twiddle_rsc_0_11_AWUSER("TLS_twiddle_rsc_0_11_AWUSER")
    , TLS_twiddle_rsc_0_11_AWREGION("TLS_twiddle_rsc_0_11_AWREGION")
    , TLS_twiddle_rsc_0_11_AWQOS("TLS_twiddle_rsc_0_11_AWQOS")
    , TLS_twiddle_rsc_0_11_AWPROT("TLS_twiddle_rsc_0_11_AWPROT")
    , TLS_twiddle_rsc_0_11_AWCACHE("TLS_twiddle_rsc_0_11_AWCACHE")
    , TLS_twiddle_rsc_0_11_AWLOCK("TLS_twiddle_rsc_0_11_AWLOCK")
    , TLS_twiddle_rsc_0_11_AWBURST("TLS_twiddle_rsc_0_11_AWBURST")
    , TLS_twiddle_rsc_0_11_AWSIZE("TLS_twiddle_rsc_0_11_AWSIZE")
    , TLS_twiddle_rsc_0_11_AWLEN("TLS_twiddle_rsc_0_11_AWLEN")
    , TLS_twiddle_rsc_0_11_AWADDR("TLS_twiddle_rsc_0_11_AWADDR")
    , TLS_twiddle_rsc_0_11_AWID("TLS_twiddle_rsc_0_11_AWID")
    , TLS_twiddle_rsc_triosy_0_11_lz("TLS_twiddle_rsc_triosy_0_11_lz")
    , TLS_twiddle_rsc_0_12_s_tdone("TLS_twiddle_rsc_0_12_s_tdone")
    , TLS_twiddle_rsc_0_12_tr_write_done("TLS_twiddle_rsc_0_12_tr_write_done")
    , TLS_twiddle_rsc_0_12_RREADY("TLS_twiddle_rsc_0_12_RREADY")
    , TLS_twiddle_rsc_0_12_RVALID("TLS_twiddle_rsc_0_12_RVALID")
    , TLS_twiddle_rsc_0_12_RUSER("TLS_twiddle_rsc_0_12_RUSER")
    , TLS_twiddle_rsc_0_12_RLAST("TLS_twiddle_rsc_0_12_RLAST")
    , TLS_twiddle_rsc_0_12_RRESP("TLS_twiddle_rsc_0_12_RRESP")
    , TLS_twiddle_rsc_0_12_RDATA("TLS_twiddle_rsc_0_12_RDATA")
    , TLS_twiddle_rsc_0_12_RID("TLS_twiddle_rsc_0_12_RID")
    , TLS_twiddle_rsc_0_12_ARREADY("TLS_twiddle_rsc_0_12_ARREADY")
    , TLS_twiddle_rsc_0_12_ARVALID("TLS_twiddle_rsc_0_12_ARVALID")
    , TLS_twiddle_rsc_0_12_ARUSER("TLS_twiddle_rsc_0_12_ARUSER")
    , TLS_twiddle_rsc_0_12_ARREGION("TLS_twiddle_rsc_0_12_ARREGION")
    , TLS_twiddle_rsc_0_12_ARQOS("TLS_twiddle_rsc_0_12_ARQOS")
    , TLS_twiddle_rsc_0_12_ARPROT("TLS_twiddle_rsc_0_12_ARPROT")
    , TLS_twiddle_rsc_0_12_ARCACHE("TLS_twiddle_rsc_0_12_ARCACHE")
    , TLS_twiddle_rsc_0_12_ARLOCK("TLS_twiddle_rsc_0_12_ARLOCK")
    , TLS_twiddle_rsc_0_12_ARBURST("TLS_twiddle_rsc_0_12_ARBURST")
    , TLS_twiddle_rsc_0_12_ARSIZE("TLS_twiddle_rsc_0_12_ARSIZE")
    , TLS_twiddle_rsc_0_12_ARLEN("TLS_twiddle_rsc_0_12_ARLEN")
    , TLS_twiddle_rsc_0_12_ARADDR("TLS_twiddle_rsc_0_12_ARADDR")
    , TLS_twiddle_rsc_0_12_ARID("TLS_twiddle_rsc_0_12_ARID")
    , TLS_twiddle_rsc_0_12_BREADY("TLS_twiddle_rsc_0_12_BREADY")
    , TLS_twiddle_rsc_0_12_BVALID("TLS_twiddle_rsc_0_12_BVALID")
    , TLS_twiddle_rsc_0_12_BUSER("TLS_twiddle_rsc_0_12_BUSER")
    , TLS_twiddle_rsc_0_12_BRESP("TLS_twiddle_rsc_0_12_BRESP")
    , TLS_twiddle_rsc_0_12_BID("TLS_twiddle_rsc_0_12_BID")
    , TLS_twiddle_rsc_0_12_WREADY("TLS_twiddle_rsc_0_12_WREADY")
    , TLS_twiddle_rsc_0_12_WVALID("TLS_twiddle_rsc_0_12_WVALID")
    , TLS_twiddle_rsc_0_12_WUSER("TLS_twiddle_rsc_0_12_WUSER")
    , TLS_twiddle_rsc_0_12_WLAST("TLS_twiddle_rsc_0_12_WLAST")
    , TLS_twiddle_rsc_0_12_WSTRB("TLS_twiddle_rsc_0_12_WSTRB")
    , TLS_twiddle_rsc_0_12_WDATA("TLS_twiddle_rsc_0_12_WDATA")
    , TLS_twiddle_rsc_0_12_AWREADY("TLS_twiddle_rsc_0_12_AWREADY")
    , TLS_twiddle_rsc_0_12_AWVALID("TLS_twiddle_rsc_0_12_AWVALID")
    , TLS_twiddle_rsc_0_12_AWUSER("TLS_twiddle_rsc_0_12_AWUSER")
    , TLS_twiddle_rsc_0_12_AWREGION("TLS_twiddle_rsc_0_12_AWREGION")
    , TLS_twiddle_rsc_0_12_AWQOS("TLS_twiddle_rsc_0_12_AWQOS")
    , TLS_twiddle_rsc_0_12_AWPROT("TLS_twiddle_rsc_0_12_AWPROT")
    , TLS_twiddle_rsc_0_12_AWCACHE("TLS_twiddle_rsc_0_12_AWCACHE")
    , TLS_twiddle_rsc_0_12_AWLOCK("TLS_twiddle_rsc_0_12_AWLOCK")
    , TLS_twiddle_rsc_0_12_AWBURST("TLS_twiddle_rsc_0_12_AWBURST")
    , TLS_twiddle_rsc_0_12_AWSIZE("TLS_twiddle_rsc_0_12_AWSIZE")
    , TLS_twiddle_rsc_0_12_AWLEN("TLS_twiddle_rsc_0_12_AWLEN")
    , TLS_twiddle_rsc_0_12_AWADDR("TLS_twiddle_rsc_0_12_AWADDR")
    , TLS_twiddle_rsc_0_12_AWID("TLS_twiddle_rsc_0_12_AWID")
    , TLS_twiddle_rsc_triosy_0_12_lz("TLS_twiddle_rsc_triosy_0_12_lz")
    , TLS_twiddle_rsc_0_13_s_tdone("TLS_twiddle_rsc_0_13_s_tdone")
    , TLS_twiddle_rsc_0_13_tr_write_done("TLS_twiddle_rsc_0_13_tr_write_done")
    , TLS_twiddle_rsc_0_13_RREADY("TLS_twiddle_rsc_0_13_RREADY")
    , TLS_twiddle_rsc_0_13_RVALID("TLS_twiddle_rsc_0_13_RVALID")
    , TLS_twiddle_rsc_0_13_RUSER("TLS_twiddle_rsc_0_13_RUSER")
    , TLS_twiddle_rsc_0_13_RLAST("TLS_twiddle_rsc_0_13_RLAST")
    , TLS_twiddle_rsc_0_13_RRESP("TLS_twiddle_rsc_0_13_RRESP")
    , TLS_twiddle_rsc_0_13_RDATA("TLS_twiddle_rsc_0_13_RDATA")
    , TLS_twiddle_rsc_0_13_RID("TLS_twiddle_rsc_0_13_RID")
    , TLS_twiddle_rsc_0_13_ARREADY("TLS_twiddle_rsc_0_13_ARREADY")
    , TLS_twiddle_rsc_0_13_ARVALID("TLS_twiddle_rsc_0_13_ARVALID")
    , TLS_twiddle_rsc_0_13_ARUSER("TLS_twiddle_rsc_0_13_ARUSER")
    , TLS_twiddle_rsc_0_13_ARREGION("TLS_twiddle_rsc_0_13_ARREGION")
    , TLS_twiddle_rsc_0_13_ARQOS("TLS_twiddle_rsc_0_13_ARQOS")
    , TLS_twiddle_rsc_0_13_ARPROT("TLS_twiddle_rsc_0_13_ARPROT")
    , TLS_twiddle_rsc_0_13_ARCACHE("TLS_twiddle_rsc_0_13_ARCACHE")
    , TLS_twiddle_rsc_0_13_ARLOCK("TLS_twiddle_rsc_0_13_ARLOCK")
    , TLS_twiddle_rsc_0_13_ARBURST("TLS_twiddle_rsc_0_13_ARBURST")
    , TLS_twiddle_rsc_0_13_ARSIZE("TLS_twiddle_rsc_0_13_ARSIZE")
    , TLS_twiddle_rsc_0_13_ARLEN("TLS_twiddle_rsc_0_13_ARLEN")
    , TLS_twiddle_rsc_0_13_ARADDR("TLS_twiddle_rsc_0_13_ARADDR")
    , TLS_twiddle_rsc_0_13_ARID("TLS_twiddle_rsc_0_13_ARID")
    , TLS_twiddle_rsc_0_13_BREADY("TLS_twiddle_rsc_0_13_BREADY")
    , TLS_twiddle_rsc_0_13_BVALID("TLS_twiddle_rsc_0_13_BVALID")
    , TLS_twiddle_rsc_0_13_BUSER("TLS_twiddle_rsc_0_13_BUSER")
    , TLS_twiddle_rsc_0_13_BRESP("TLS_twiddle_rsc_0_13_BRESP")
    , TLS_twiddle_rsc_0_13_BID("TLS_twiddle_rsc_0_13_BID")
    , TLS_twiddle_rsc_0_13_WREADY("TLS_twiddle_rsc_0_13_WREADY")
    , TLS_twiddle_rsc_0_13_WVALID("TLS_twiddle_rsc_0_13_WVALID")
    , TLS_twiddle_rsc_0_13_WUSER("TLS_twiddle_rsc_0_13_WUSER")
    , TLS_twiddle_rsc_0_13_WLAST("TLS_twiddle_rsc_0_13_WLAST")
    , TLS_twiddle_rsc_0_13_WSTRB("TLS_twiddle_rsc_0_13_WSTRB")
    , TLS_twiddle_rsc_0_13_WDATA("TLS_twiddle_rsc_0_13_WDATA")
    , TLS_twiddle_rsc_0_13_AWREADY("TLS_twiddle_rsc_0_13_AWREADY")
    , TLS_twiddle_rsc_0_13_AWVALID("TLS_twiddle_rsc_0_13_AWVALID")
    , TLS_twiddle_rsc_0_13_AWUSER("TLS_twiddle_rsc_0_13_AWUSER")
    , TLS_twiddle_rsc_0_13_AWREGION("TLS_twiddle_rsc_0_13_AWREGION")
    , TLS_twiddle_rsc_0_13_AWQOS("TLS_twiddle_rsc_0_13_AWQOS")
    , TLS_twiddle_rsc_0_13_AWPROT("TLS_twiddle_rsc_0_13_AWPROT")
    , TLS_twiddle_rsc_0_13_AWCACHE("TLS_twiddle_rsc_0_13_AWCACHE")
    , TLS_twiddle_rsc_0_13_AWLOCK("TLS_twiddle_rsc_0_13_AWLOCK")
    , TLS_twiddle_rsc_0_13_AWBURST("TLS_twiddle_rsc_0_13_AWBURST")
    , TLS_twiddle_rsc_0_13_AWSIZE("TLS_twiddle_rsc_0_13_AWSIZE")
    , TLS_twiddle_rsc_0_13_AWLEN("TLS_twiddle_rsc_0_13_AWLEN")
    , TLS_twiddle_rsc_0_13_AWADDR("TLS_twiddle_rsc_0_13_AWADDR")
    , TLS_twiddle_rsc_0_13_AWID("TLS_twiddle_rsc_0_13_AWID")
    , TLS_twiddle_rsc_triosy_0_13_lz("TLS_twiddle_rsc_triosy_0_13_lz")
    , TLS_twiddle_rsc_0_14_s_tdone("TLS_twiddle_rsc_0_14_s_tdone")
    , TLS_twiddle_rsc_0_14_tr_write_done("TLS_twiddle_rsc_0_14_tr_write_done")
    , TLS_twiddle_rsc_0_14_RREADY("TLS_twiddle_rsc_0_14_RREADY")
    , TLS_twiddle_rsc_0_14_RVALID("TLS_twiddle_rsc_0_14_RVALID")
    , TLS_twiddle_rsc_0_14_RUSER("TLS_twiddle_rsc_0_14_RUSER")
    , TLS_twiddle_rsc_0_14_RLAST("TLS_twiddle_rsc_0_14_RLAST")
    , TLS_twiddle_rsc_0_14_RRESP("TLS_twiddle_rsc_0_14_RRESP")
    , TLS_twiddle_rsc_0_14_RDATA("TLS_twiddle_rsc_0_14_RDATA")
    , TLS_twiddle_rsc_0_14_RID("TLS_twiddle_rsc_0_14_RID")
    , TLS_twiddle_rsc_0_14_ARREADY("TLS_twiddle_rsc_0_14_ARREADY")
    , TLS_twiddle_rsc_0_14_ARVALID("TLS_twiddle_rsc_0_14_ARVALID")
    , TLS_twiddle_rsc_0_14_ARUSER("TLS_twiddle_rsc_0_14_ARUSER")
    , TLS_twiddle_rsc_0_14_ARREGION("TLS_twiddle_rsc_0_14_ARREGION")
    , TLS_twiddle_rsc_0_14_ARQOS("TLS_twiddle_rsc_0_14_ARQOS")
    , TLS_twiddle_rsc_0_14_ARPROT("TLS_twiddle_rsc_0_14_ARPROT")
    , TLS_twiddle_rsc_0_14_ARCACHE("TLS_twiddle_rsc_0_14_ARCACHE")
    , TLS_twiddle_rsc_0_14_ARLOCK("TLS_twiddle_rsc_0_14_ARLOCK")
    , TLS_twiddle_rsc_0_14_ARBURST("TLS_twiddle_rsc_0_14_ARBURST")
    , TLS_twiddle_rsc_0_14_ARSIZE("TLS_twiddle_rsc_0_14_ARSIZE")
    , TLS_twiddle_rsc_0_14_ARLEN("TLS_twiddle_rsc_0_14_ARLEN")
    , TLS_twiddle_rsc_0_14_ARADDR("TLS_twiddle_rsc_0_14_ARADDR")
    , TLS_twiddle_rsc_0_14_ARID("TLS_twiddle_rsc_0_14_ARID")
    , TLS_twiddle_rsc_0_14_BREADY("TLS_twiddle_rsc_0_14_BREADY")
    , TLS_twiddle_rsc_0_14_BVALID("TLS_twiddle_rsc_0_14_BVALID")
    , TLS_twiddle_rsc_0_14_BUSER("TLS_twiddle_rsc_0_14_BUSER")
    , TLS_twiddle_rsc_0_14_BRESP("TLS_twiddle_rsc_0_14_BRESP")
    , TLS_twiddle_rsc_0_14_BID("TLS_twiddle_rsc_0_14_BID")
    , TLS_twiddle_rsc_0_14_WREADY("TLS_twiddle_rsc_0_14_WREADY")
    , TLS_twiddle_rsc_0_14_WVALID("TLS_twiddle_rsc_0_14_WVALID")
    , TLS_twiddle_rsc_0_14_WUSER("TLS_twiddle_rsc_0_14_WUSER")
    , TLS_twiddle_rsc_0_14_WLAST("TLS_twiddle_rsc_0_14_WLAST")
    , TLS_twiddle_rsc_0_14_WSTRB("TLS_twiddle_rsc_0_14_WSTRB")
    , TLS_twiddle_rsc_0_14_WDATA("TLS_twiddle_rsc_0_14_WDATA")
    , TLS_twiddle_rsc_0_14_AWREADY("TLS_twiddle_rsc_0_14_AWREADY")
    , TLS_twiddle_rsc_0_14_AWVALID("TLS_twiddle_rsc_0_14_AWVALID")
    , TLS_twiddle_rsc_0_14_AWUSER("TLS_twiddle_rsc_0_14_AWUSER")
    , TLS_twiddle_rsc_0_14_AWREGION("TLS_twiddle_rsc_0_14_AWREGION")
    , TLS_twiddle_rsc_0_14_AWQOS("TLS_twiddle_rsc_0_14_AWQOS")
    , TLS_twiddle_rsc_0_14_AWPROT("TLS_twiddle_rsc_0_14_AWPROT")
    , TLS_twiddle_rsc_0_14_AWCACHE("TLS_twiddle_rsc_0_14_AWCACHE")
    , TLS_twiddle_rsc_0_14_AWLOCK("TLS_twiddle_rsc_0_14_AWLOCK")
    , TLS_twiddle_rsc_0_14_AWBURST("TLS_twiddle_rsc_0_14_AWBURST")
    , TLS_twiddle_rsc_0_14_AWSIZE("TLS_twiddle_rsc_0_14_AWSIZE")
    , TLS_twiddle_rsc_0_14_AWLEN("TLS_twiddle_rsc_0_14_AWLEN")
    , TLS_twiddle_rsc_0_14_AWADDR("TLS_twiddle_rsc_0_14_AWADDR")
    , TLS_twiddle_rsc_0_14_AWID("TLS_twiddle_rsc_0_14_AWID")
    , TLS_twiddle_rsc_triosy_0_14_lz("TLS_twiddle_rsc_triosy_0_14_lz")
    , TLS_twiddle_rsc_0_15_s_tdone("TLS_twiddle_rsc_0_15_s_tdone")
    , TLS_twiddle_rsc_0_15_tr_write_done("TLS_twiddle_rsc_0_15_tr_write_done")
    , TLS_twiddle_rsc_0_15_RREADY("TLS_twiddle_rsc_0_15_RREADY")
    , TLS_twiddle_rsc_0_15_RVALID("TLS_twiddle_rsc_0_15_RVALID")
    , TLS_twiddle_rsc_0_15_RUSER("TLS_twiddle_rsc_0_15_RUSER")
    , TLS_twiddle_rsc_0_15_RLAST("TLS_twiddle_rsc_0_15_RLAST")
    , TLS_twiddle_rsc_0_15_RRESP("TLS_twiddle_rsc_0_15_RRESP")
    , TLS_twiddle_rsc_0_15_RDATA("TLS_twiddle_rsc_0_15_RDATA")
    , TLS_twiddle_rsc_0_15_RID("TLS_twiddle_rsc_0_15_RID")
    , TLS_twiddle_rsc_0_15_ARREADY("TLS_twiddle_rsc_0_15_ARREADY")
    , TLS_twiddle_rsc_0_15_ARVALID("TLS_twiddle_rsc_0_15_ARVALID")
    , TLS_twiddle_rsc_0_15_ARUSER("TLS_twiddle_rsc_0_15_ARUSER")
    , TLS_twiddle_rsc_0_15_ARREGION("TLS_twiddle_rsc_0_15_ARREGION")
    , TLS_twiddle_rsc_0_15_ARQOS("TLS_twiddle_rsc_0_15_ARQOS")
    , TLS_twiddle_rsc_0_15_ARPROT("TLS_twiddle_rsc_0_15_ARPROT")
    , TLS_twiddle_rsc_0_15_ARCACHE("TLS_twiddle_rsc_0_15_ARCACHE")
    , TLS_twiddle_rsc_0_15_ARLOCK("TLS_twiddle_rsc_0_15_ARLOCK")
    , TLS_twiddle_rsc_0_15_ARBURST("TLS_twiddle_rsc_0_15_ARBURST")
    , TLS_twiddle_rsc_0_15_ARSIZE("TLS_twiddle_rsc_0_15_ARSIZE")
    , TLS_twiddle_rsc_0_15_ARLEN("TLS_twiddle_rsc_0_15_ARLEN")
    , TLS_twiddle_rsc_0_15_ARADDR("TLS_twiddle_rsc_0_15_ARADDR")
    , TLS_twiddle_rsc_0_15_ARID("TLS_twiddle_rsc_0_15_ARID")
    , TLS_twiddle_rsc_0_15_BREADY("TLS_twiddle_rsc_0_15_BREADY")
    , TLS_twiddle_rsc_0_15_BVALID("TLS_twiddle_rsc_0_15_BVALID")
    , TLS_twiddle_rsc_0_15_BUSER("TLS_twiddle_rsc_0_15_BUSER")
    , TLS_twiddle_rsc_0_15_BRESP("TLS_twiddle_rsc_0_15_BRESP")
    , TLS_twiddle_rsc_0_15_BID("TLS_twiddle_rsc_0_15_BID")
    , TLS_twiddle_rsc_0_15_WREADY("TLS_twiddle_rsc_0_15_WREADY")
    , TLS_twiddle_rsc_0_15_WVALID("TLS_twiddle_rsc_0_15_WVALID")
    , TLS_twiddle_rsc_0_15_WUSER("TLS_twiddle_rsc_0_15_WUSER")
    , TLS_twiddle_rsc_0_15_WLAST("TLS_twiddle_rsc_0_15_WLAST")
    , TLS_twiddle_rsc_0_15_WSTRB("TLS_twiddle_rsc_0_15_WSTRB")
    , TLS_twiddle_rsc_0_15_WDATA("TLS_twiddle_rsc_0_15_WDATA")
    , TLS_twiddle_rsc_0_15_AWREADY("TLS_twiddle_rsc_0_15_AWREADY")
    , TLS_twiddle_rsc_0_15_AWVALID("TLS_twiddle_rsc_0_15_AWVALID")
    , TLS_twiddle_rsc_0_15_AWUSER("TLS_twiddle_rsc_0_15_AWUSER")
    , TLS_twiddle_rsc_0_15_AWREGION("TLS_twiddle_rsc_0_15_AWREGION")
    , TLS_twiddle_rsc_0_15_AWQOS("TLS_twiddle_rsc_0_15_AWQOS")
    , TLS_twiddle_rsc_0_15_AWPROT("TLS_twiddle_rsc_0_15_AWPROT")
    , TLS_twiddle_rsc_0_15_AWCACHE("TLS_twiddle_rsc_0_15_AWCACHE")
    , TLS_twiddle_rsc_0_15_AWLOCK("TLS_twiddle_rsc_0_15_AWLOCK")
    , TLS_twiddle_rsc_0_15_AWBURST("TLS_twiddle_rsc_0_15_AWBURST")
    , TLS_twiddle_rsc_0_15_AWSIZE("TLS_twiddle_rsc_0_15_AWSIZE")
    , TLS_twiddle_rsc_0_15_AWLEN("TLS_twiddle_rsc_0_15_AWLEN")
    , TLS_twiddle_rsc_0_15_AWADDR("TLS_twiddle_rsc_0_15_AWADDR")
    , TLS_twiddle_rsc_0_15_AWID("TLS_twiddle_rsc_0_15_AWID")
    , TLS_twiddle_rsc_triosy_0_15_lz("TLS_twiddle_rsc_triosy_0_15_lz")
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
    , TLS_twiddle_h_rsc_0_4_s_tdone("TLS_twiddle_h_rsc_0_4_s_tdone")
    , TLS_twiddle_h_rsc_0_4_tr_write_done("TLS_twiddle_h_rsc_0_4_tr_write_done")
    , TLS_twiddle_h_rsc_0_4_RREADY("TLS_twiddle_h_rsc_0_4_RREADY")
    , TLS_twiddle_h_rsc_0_4_RVALID("TLS_twiddle_h_rsc_0_4_RVALID")
    , TLS_twiddle_h_rsc_0_4_RUSER("TLS_twiddle_h_rsc_0_4_RUSER")
    , TLS_twiddle_h_rsc_0_4_RLAST("TLS_twiddle_h_rsc_0_4_RLAST")
    , TLS_twiddle_h_rsc_0_4_RRESP("TLS_twiddle_h_rsc_0_4_RRESP")
    , TLS_twiddle_h_rsc_0_4_RDATA("TLS_twiddle_h_rsc_0_4_RDATA")
    , TLS_twiddle_h_rsc_0_4_RID("TLS_twiddle_h_rsc_0_4_RID")
    , TLS_twiddle_h_rsc_0_4_ARREADY("TLS_twiddle_h_rsc_0_4_ARREADY")
    , TLS_twiddle_h_rsc_0_4_ARVALID("TLS_twiddle_h_rsc_0_4_ARVALID")
    , TLS_twiddle_h_rsc_0_4_ARUSER("TLS_twiddle_h_rsc_0_4_ARUSER")
    , TLS_twiddle_h_rsc_0_4_ARREGION("TLS_twiddle_h_rsc_0_4_ARREGION")
    , TLS_twiddle_h_rsc_0_4_ARQOS("TLS_twiddle_h_rsc_0_4_ARQOS")
    , TLS_twiddle_h_rsc_0_4_ARPROT("TLS_twiddle_h_rsc_0_4_ARPROT")
    , TLS_twiddle_h_rsc_0_4_ARCACHE("TLS_twiddle_h_rsc_0_4_ARCACHE")
    , TLS_twiddle_h_rsc_0_4_ARLOCK("TLS_twiddle_h_rsc_0_4_ARLOCK")
    , TLS_twiddle_h_rsc_0_4_ARBURST("TLS_twiddle_h_rsc_0_4_ARBURST")
    , TLS_twiddle_h_rsc_0_4_ARSIZE("TLS_twiddle_h_rsc_0_4_ARSIZE")
    , TLS_twiddle_h_rsc_0_4_ARLEN("TLS_twiddle_h_rsc_0_4_ARLEN")
    , TLS_twiddle_h_rsc_0_4_ARADDR("TLS_twiddle_h_rsc_0_4_ARADDR")
    , TLS_twiddle_h_rsc_0_4_ARID("TLS_twiddle_h_rsc_0_4_ARID")
    , TLS_twiddle_h_rsc_0_4_BREADY("TLS_twiddle_h_rsc_0_4_BREADY")
    , TLS_twiddle_h_rsc_0_4_BVALID("TLS_twiddle_h_rsc_0_4_BVALID")
    , TLS_twiddle_h_rsc_0_4_BUSER("TLS_twiddle_h_rsc_0_4_BUSER")
    , TLS_twiddle_h_rsc_0_4_BRESP("TLS_twiddle_h_rsc_0_4_BRESP")
    , TLS_twiddle_h_rsc_0_4_BID("TLS_twiddle_h_rsc_0_4_BID")
    , TLS_twiddle_h_rsc_0_4_WREADY("TLS_twiddle_h_rsc_0_4_WREADY")
    , TLS_twiddle_h_rsc_0_4_WVALID("TLS_twiddle_h_rsc_0_4_WVALID")
    , TLS_twiddle_h_rsc_0_4_WUSER("TLS_twiddle_h_rsc_0_4_WUSER")
    , TLS_twiddle_h_rsc_0_4_WLAST("TLS_twiddle_h_rsc_0_4_WLAST")
    , TLS_twiddle_h_rsc_0_4_WSTRB("TLS_twiddle_h_rsc_0_4_WSTRB")
    , TLS_twiddle_h_rsc_0_4_WDATA("TLS_twiddle_h_rsc_0_4_WDATA")
    , TLS_twiddle_h_rsc_0_4_AWREADY("TLS_twiddle_h_rsc_0_4_AWREADY")
    , TLS_twiddle_h_rsc_0_4_AWVALID("TLS_twiddle_h_rsc_0_4_AWVALID")
    , TLS_twiddle_h_rsc_0_4_AWUSER("TLS_twiddle_h_rsc_0_4_AWUSER")
    , TLS_twiddle_h_rsc_0_4_AWREGION("TLS_twiddle_h_rsc_0_4_AWREGION")
    , TLS_twiddle_h_rsc_0_4_AWQOS("TLS_twiddle_h_rsc_0_4_AWQOS")
    , TLS_twiddle_h_rsc_0_4_AWPROT("TLS_twiddle_h_rsc_0_4_AWPROT")
    , TLS_twiddle_h_rsc_0_4_AWCACHE("TLS_twiddle_h_rsc_0_4_AWCACHE")
    , TLS_twiddle_h_rsc_0_4_AWLOCK("TLS_twiddle_h_rsc_0_4_AWLOCK")
    , TLS_twiddle_h_rsc_0_4_AWBURST("TLS_twiddle_h_rsc_0_4_AWBURST")
    , TLS_twiddle_h_rsc_0_4_AWSIZE("TLS_twiddle_h_rsc_0_4_AWSIZE")
    , TLS_twiddle_h_rsc_0_4_AWLEN("TLS_twiddle_h_rsc_0_4_AWLEN")
    , TLS_twiddle_h_rsc_0_4_AWADDR("TLS_twiddle_h_rsc_0_4_AWADDR")
    , TLS_twiddle_h_rsc_0_4_AWID("TLS_twiddle_h_rsc_0_4_AWID")
    , TLS_twiddle_h_rsc_triosy_0_4_lz("TLS_twiddle_h_rsc_triosy_0_4_lz")
    , TLS_twiddle_h_rsc_0_5_s_tdone("TLS_twiddle_h_rsc_0_5_s_tdone")
    , TLS_twiddle_h_rsc_0_5_tr_write_done("TLS_twiddle_h_rsc_0_5_tr_write_done")
    , TLS_twiddle_h_rsc_0_5_RREADY("TLS_twiddle_h_rsc_0_5_RREADY")
    , TLS_twiddle_h_rsc_0_5_RVALID("TLS_twiddle_h_rsc_0_5_RVALID")
    , TLS_twiddle_h_rsc_0_5_RUSER("TLS_twiddle_h_rsc_0_5_RUSER")
    , TLS_twiddle_h_rsc_0_5_RLAST("TLS_twiddle_h_rsc_0_5_RLAST")
    , TLS_twiddle_h_rsc_0_5_RRESP("TLS_twiddle_h_rsc_0_5_RRESP")
    , TLS_twiddle_h_rsc_0_5_RDATA("TLS_twiddle_h_rsc_0_5_RDATA")
    , TLS_twiddle_h_rsc_0_5_RID("TLS_twiddle_h_rsc_0_5_RID")
    , TLS_twiddle_h_rsc_0_5_ARREADY("TLS_twiddle_h_rsc_0_5_ARREADY")
    , TLS_twiddle_h_rsc_0_5_ARVALID("TLS_twiddle_h_rsc_0_5_ARVALID")
    , TLS_twiddle_h_rsc_0_5_ARUSER("TLS_twiddle_h_rsc_0_5_ARUSER")
    , TLS_twiddle_h_rsc_0_5_ARREGION("TLS_twiddle_h_rsc_0_5_ARREGION")
    , TLS_twiddle_h_rsc_0_5_ARQOS("TLS_twiddle_h_rsc_0_5_ARQOS")
    , TLS_twiddle_h_rsc_0_5_ARPROT("TLS_twiddle_h_rsc_0_5_ARPROT")
    , TLS_twiddle_h_rsc_0_5_ARCACHE("TLS_twiddle_h_rsc_0_5_ARCACHE")
    , TLS_twiddle_h_rsc_0_5_ARLOCK("TLS_twiddle_h_rsc_0_5_ARLOCK")
    , TLS_twiddle_h_rsc_0_5_ARBURST("TLS_twiddle_h_rsc_0_5_ARBURST")
    , TLS_twiddle_h_rsc_0_5_ARSIZE("TLS_twiddle_h_rsc_0_5_ARSIZE")
    , TLS_twiddle_h_rsc_0_5_ARLEN("TLS_twiddle_h_rsc_0_5_ARLEN")
    , TLS_twiddle_h_rsc_0_5_ARADDR("TLS_twiddle_h_rsc_0_5_ARADDR")
    , TLS_twiddle_h_rsc_0_5_ARID("TLS_twiddle_h_rsc_0_5_ARID")
    , TLS_twiddle_h_rsc_0_5_BREADY("TLS_twiddle_h_rsc_0_5_BREADY")
    , TLS_twiddle_h_rsc_0_5_BVALID("TLS_twiddle_h_rsc_0_5_BVALID")
    , TLS_twiddle_h_rsc_0_5_BUSER("TLS_twiddle_h_rsc_0_5_BUSER")
    , TLS_twiddle_h_rsc_0_5_BRESP("TLS_twiddle_h_rsc_0_5_BRESP")
    , TLS_twiddle_h_rsc_0_5_BID("TLS_twiddle_h_rsc_0_5_BID")
    , TLS_twiddle_h_rsc_0_5_WREADY("TLS_twiddle_h_rsc_0_5_WREADY")
    , TLS_twiddle_h_rsc_0_5_WVALID("TLS_twiddle_h_rsc_0_5_WVALID")
    , TLS_twiddle_h_rsc_0_5_WUSER("TLS_twiddle_h_rsc_0_5_WUSER")
    , TLS_twiddle_h_rsc_0_5_WLAST("TLS_twiddle_h_rsc_0_5_WLAST")
    , TLS_twiddle_h_rsc_0_5_WSTRB("TLS_twiddle_h_rsc_0_5_WSTRB")
    , TLS_twiddle_h_rsc_0_5_WDATA("TLS_twiddle_h_rsc_0_5_WDATA")
    , TLS_twiddle_h_rsc_0_5_AWREADY("TLS_twiddle_h_rsc_0_5_AWREADY")
    , TLS_twiddle_h_rsc_0_5_AWVALID("TLS_twiddle_h_rsc_0_5_AWVALID")
    , TLS_twiddle_h_rsc_0_5_AWUSER("TLS_twiddle_h_rsc_0_5_AWUSER")
    , TLS_twiddle_h_rsc_0_5_AWREGION("TLS_twiddle_h_rsc_0_5_AWREGION")
    , TLS_twiddle_h_rsc_0_5_AWQOS("TLS_twiddle_h_rsc_0_5_AWQOS")
    , TLS_twiddle_h_rsc_0_5_AWPROT("TLS_twiddle_h_rsc_0_5_AWPROT")
    , TLS_twiddle_h_rsc_0_5_AWCACHE("TLS_twiddle_h_rsc_0_5_AWCACHE")
    , TLS_twiddle_h_rsc_0_5_AWLOCK("TLS_twiddle_h_rsc_0_5_AWLOCK")
    , TLS_twiddle_h_rsc_0_5_AWBURST("TLS_twiddle_h_rsc_0_5_AWBURST")
    , TLS_twiddle_h_rsc_0_5_AWSIZE("TLS_twiddle_h_rsc_0_5_AWSIZE")
    , TLS_twiddle_h_rsc_0_5_AWLEN("TLS_twiddle_h_rsc_0_5_AWLEN")
    , TLS_twiddle_h_rsc_0_5_AWADDR("TLS_twiddle_h_rsc_0_5_AWADDR")
    , TLS_twiddle_h_rsc_0_5_AWID("TLS_twiddle_h_rsc_0_5_AWID")
    , TLS_twiddle_h_rsc_triosy_0_5_lz("TLS_twiddle_h_rsc_triosy_0_5_lz")
    , TLS_twiddle_h_rsc_0_6_s_tdone("TLS_twiddle_h_rsc_0_6_s_tdone")
    , TLS_twiddle_h_rsc_0_6_tr_write_done("TLS_twiddle_h_rsc_0_6_tr_write_done")
    , TLS_twiddle_h_rsc_0_6_RREADY("TLS_twiddle_h_rsc_0_6_RREADY")
    , TLS_twiddle_h_rsc_0_6_RVALID("TLS_twiddle_h_rsc_0_6_RVALID")
    , TLS_twiddle_h_rsc_0_6_RUSER("TLS_twiddle_h_rsc_0_6_RUSER")
    , TLS_twiddle_h_rsc_0_6_RLAST("TLS_twiddle_h_rsc_0_6_RLAST")
    , TLS_twiddle_h_rsc_0_6_RRESP("TLS_twiddle_h_rsc_0_6_RRESP")
    , TLS_twiddle_h_rsc_0_6_RDATA("TLS_twiddle_h_rsc_0_6_RDATA")
    , TLS_twiddle_h_rsc_0_6_RID("TLS_twiddle_h_rsc_0_6_RID")
    , TLS_twiddle_h_rsc_0_6_ARREADY("TLS_twiddle_h_rsc_0_6_ARREADY")
    , TLS_twiddle_h_rsc_0_6_ARVALID("TLS_twiddle_h_rsc_0_6_ARVALID")
    , TLS_twiddle_h_rsc_0_6_ARUSER("TLS_twiddle_h_rsc_0_6_ARUSER")
    , TLS_twiddle_h_rsc_0_6_ARREGION("TLS_twiddle_h_rsc_0_6_ARREGION")
    , TLS_twiddle_h_rsc_0_6_ARQOS("TLS_twiddle_h_rsc_0_6_ARQOS")
    , TLS_twiddle_h_rsc_0_6_ARPROT("TLS_twiddle_h_rsc_0_6_ARPROT")
    , TLS_twiddle_h_rsc_0_6_ARCACHE("TLS_twiddle_h_rsc_0_6_ARCACHE")
    , TLS_twiddle_h_rsc_0_6_ARLOCK("TLS_twiddle_h_rsc_0_6_ARLOCK")
    , TLS_twiddle_h_rsc_0_6_ARBURST("TLS_twiddle_h_rsc_0_6_ARBURST")
    , TLS_twiddle_h_rsc_0_6_ARSIZE("TLS_twiddle_h_rsc_0_6_ARSIZE")
    , TLS_twiddle_h_rsc_0_6_ARLEN("TLS_twiddle_h_rsc_0_6_ARLEN")
    , TLS_twiddle_h_rsc_0_6_ARADDR("TLS_twiddle_h_rsc_0_6_ARADDR")
    , TLS_twiddle_h_rsc_0_6_ARID("TLS_twiddle_h_rsc_0_6_ARID")
    , TLS_twiddle_h_rsc_0_6_BREADY("TLS_twiddle_h_rsc_0_6_BREADY")
    , TLS_twiddle_h_rsc_0_6_BVALID("TLS_twiddle_h_rsc_0_6_BVALID")
    , TLS_twiddle_h_rsc_0_6_BUSER("TLS_twiddle_h_rsc_0_6_BUSER")
    , TLS_twiddle_h_rsc_0_6_BRESP("TLS_twiddle_h_rsc_0_6_BRESP")
    , TLS_twiddle_h_rsc_0_6_BID("TLS_twiddle_h_rsc_0_6_BID")
    , TLS_twiddle_h_rsc_0_6_WREADY("TLS_twiddle_h_rsc_0_6_WREADY")
    , TLS_twiddle_h_rsc_0_6_WVALID("TLS_twiddle_h_rsc_0_6_WVALID")
    , TLS_twiddle_h_rsc_0_6_WUSER("TLS_twiddle_h_rsc_0_6_WUSER")
    , TLS_twiddle_h_rsc_0_6_WLAST("TLS_twiddle_h_rsc_0_6_WLAST")
    , TLS_twiddle_h_rsc_0_6_WSTRB("TLS_twiddle_h_rsc_0_6_WSTRB")
    , TLS_twiddle_h_rsc_0_6_WDATA("TLS_twiddle_h_rsc_0_6_WDATA")
    , TLS_twiddle_h_rsc_0_6_AWREADY("TLS_twiddle_h_rsc_0_6_AWREADY")
    , TLS_twiddle_h_rsc_0_6_AWVALID("TLS_twiddle_h_rsc_0_6_AWVALID")
    , TLS_twiddle_h_rsc_0_6_AWUSER("TLS_twiddle_h_rsc_0_6_AWUSER")
    , TLS_twiddle_h_rsc_0_6_AWREGION("TLS_twiddle_h_rsc_0_6_AWREGION")
    , TLS_twiddle_h_rsc_0_6_AWQOS("TLS_twiddle_h_rsc_0_6_AWQOS")
    , TLS_twiddle_h_rsc_0_6_AWPROT("TLS_twiddle_h_rsc_0_6_AWPROT")
    , TLS_twiddle_h_rsc_0_6_AWCACHE("TLS_twiddle_h_rsc_0_6_AWCACHE")
    , TLS_twiddle_h_rsc_0_6_AWLOCK("TLS_twiddle_h_rsc_0_6_AWLOCK")
    , TLS_twiddle_h_rsc_0_6_AWBURST("TLS_twiddle_h_rsc_0_6_AWBURST")
    , TLS_twiddle_h_rsc_0_6_AWSIZE("TLS_twiddle_h_rsc_0_6_AWSIZE")
    , TLS_twiddle_h_rsc_0_6_AWLEN("TLS_twiddle_h_rsc_0_6_AWLEN")
    , TLS_twiddle_h_rsc_0_6_AWADDR("TLS_twiddle_h_rsc_0_6_AWADDR")
    , TLS_twiddle_h_rsc_0_6_AWID("TLS_twiddle_h_rsc_0_6_AWID")
    , TLS_twiddle_h_rsc_triosy_0_6_lz("TLS_twiddle_h_rsc_triosy_0_6_lz")
    , TLS_twiddle_h_rsc_0_7_s_tdone("TLS_twiddle_h_rsc_0_7_s_tdone")
    , TLS_twiddle_h_rsc_0_7_tr_write_done("TLS_twiddle_h_rsc_0_7_tr_write_done")
    , TLS_twiddle_h_rsc_0_7_RREADY("TLS_twiddle_h_rsc_0_7_RREADY")
    , TLS_twiddle_h_rsc_0_7_RVALID("TLS_twiddle_h_rsc_0_7_RVALID")
    , TLS_twiddle_h_rsc_0_7_RUSER("TLS_twiddle_h_rsc_0_7_RUSER")
    , TLS_twiddle_h_rsc_0_7_RLAST("TLS_twiddle_h_rsc_0_7_RLAST")
    , TLS_twiddle_h_rsc_0_7_RRESP("TLS_twiddle_h_rsc_0_7_RRESP")
    , TLS_twiddle_h_rsc_0_7_RDATA("TLS_twiddle_h_rsc_0_7_RDATA")
    , TLS_twiddle_h_rsc_0_7_RID("TLS_twiddle_h_rsc_0_7_RID")
    , TLS_twiddle_h_rsc_0_7_ARREADY("TLS_twiddle_h_rsc_0_7_ARREADY")
    , TLS_twiddle_h_rsc_0_7_ARVALID("TLS_twiddle_h_rsc_0_7_ARVALID")
    , TLS_twiddle_h_rsc_0_7_ARUSER("TLS_twiddle_h_rsc_0_7_ARUSER")
    , TLS_twiddle_h_rsc_0_7_ARREGION("TLS_twiddle_h_rsc_0_7_ARREGION")
    , TLS_twiddle_h_rsc_0_7_ARQOS("TLS_twiddle_h_rsc_0_7_ARQOS")
    , TLS_twiddle_h_rsc_0_7_ARPROT("TLS_twiddle_h_rsc_0_7_ARPROT")
    , TLS_twiddle_h_rsc_0_7_ARCACHE("TLS_twiddle_h_rsc_0_7_ARCACHE")
    , TLS_twiddle_h_rsc_0_7_ARLOCK("TLS_twiddle_h_rsc_0_7_ARLOCK")
    , TLS_twiddle_h_rsc_0_7_ARBURST("TLS_twiddle_h_rsc_0_7_ARBURST")
    , TLS_twiddle_h_rsc_0_7_ARSIZE("TLS_twiddle_h_rsc_0_7_ARSIZE")
    , TLS_twiddle_h_rsc_0_7_ARLEN("TLS_twiddle_h_rsc_0_7_ARLEN")
    , TLS_twiddle_h_rsc_0_7_ARADDR("TLS_twiddle_h_rsc_0_7_ARADDR")
    , TLS_twiddle_h_rsc_0_7_ARID("TLS_twiddle_h_rsc_0_7_ARID")
    , TLS_twiddle_h_rsc_0_7_BREADY("TLS_twiddle_h_rsc_0_7_BREADY")
    , TLS_twiddle_h_rsc_0_7_BVALID("TLS_twiddle_h_rsc_0_7_BVALID")
    , TLS_twiddle_h_rsc_0_7_BUSER("TLS_twiddle_h_rsc_0_7_BUSER")
    , TLS_twiddle_h_rsc_0_7_BRESP("TLS_twiddle_h_rsc_0_7_BRESP")
    , TLS_twiddle_h_rsc_0_7_BID("TLS_twiddle_h_rsc_0_7_BID")
    , TLS_twiddle_h_rsc_0_7_WREADY("TLS_twiddle_h_rsc_0_7_WREADY")
    , TLS_twiddle_h_rsc_0_7_WVALID("TLS_twiddle_h_rsc_0_7_WVALID")
    , TLS_twiddle_h_rsc_0_7_WUSER("TLS_twiddle_h_rsc_0_7_WUSER")
    , TLS_twiddle_h_rsc_0_7_WLAST("TLS_twiddle_h_rsc_0_7_WLAST")
    , TLS_twiddle_h_rsc_0_7_WSTRB("TLS_twiddle_h_rsc_0_7_WSTRB")
    , TLS_twiddle_h_rsc_0_7_WDATA("TLS_twiddle_h_rsc_0_7_WDATA")
    , TLS_twiddle_h_rsc_0_7_AWREADY("TLS_twiddle_h_rsc_0_7_AWREADY")
    , TLS_twiddle_h_rsc_0_7_AWVALID("TLS_twiddle_h_rsc_0_7_AWVALID")
    , TLS_twiddle_h_rsc_0_7_AWUSER("TLS_twiddle_h_rsc_0_7_AWUSER")
    , TLS_twiddle_h_rsc_0_7_AWREGION("TLS_twiddle_h_rsc_0_7_AWREGION")
    , TLS_twiddle_h_rsc_0_7_AWQOS("TLS_twiddle_h_rsc_0_7_AWQOS")
    , TLS_twiddle_h_rsc_0_7_AWPROT("TLS_twiddle_h_rsc_0_7_AWPROT")
    , TLS_twiddle_h_rsc_0_7_AWCACHE("TLS_twiddle_h_rsc_0_7_AWCACHE")
    , TLS_twiddle_h_rsc_0_7_AWLOCK("TLS_twiddle_h_rsc_0_7_AWLOCK")
    , TLS_twiddle_h_rsc_0_7_AWBURST("TLS_twiddle_h_rsc_0_7_AWBURST")
    , TLS_twiddle_h_rsc_0_7_AWSIZE("TLS_twiddle_h_rsc_0_7_AWSIZE")
    , TLS_twiddle_h_rsc_0_7_AWLEN("TLS_twiddle_h_rsc_0_7_AWLEN")
    , TLS_twiddle_h_rsc_0_7_AWADDR("TLS_twiddle_h_rsc_0_7_AWADDR")
    , TLS_twiddle_h_rsc_0_7_AWID("TLS_twiddle_h_rsc_0_7_AWID")
    , TLS_twiddle_h_rsc_triosy_0_7_lz("TLS_twiddle_h_rsc_triosy_0_7_lz")
    , TLS_twiddle_h_rsc_0_8_s_tdone("TLS_twiddle_h_rsc_0_8_s_tdone")
    , TLS_twiddle_h_rsc_0_8_tr_write_done("TLS_twiddle_h_rsc_0_8_tr_write_done")
    , TLS_twiddle_h_rsc_0_8_RREADY("TLS_twiddle_h_rsc_0_8_RREADY")
    , TLS_twiddle_h_rsc_0_8_RVALID("TLS_twiddle_h_rsc_0_8_RVALID")
    , TLS_twiddle_h_rsc_0_8_RUSER("TLS_twiddle_h_rsc_0_8_RUSER")
    , TLS_twiddle_h_rsc_0_8_RLAST("TLS_twiddle_h_rsc_0_8_RLAST")
    , TLS_twiddle_h_rsc_0_8_RRESP("TLS_twiddle_h_rsc_0_8_RRESP")
    , TLS_twiddle_h_rsc_0_8_RDATA("TLS_twiddle_h_rsc_0_8_RDATA")
    , TLS_twiddle_h_rsc_0_8_RID("TLS_twiddle_h_rsc_0_8_RID")
    , TLS_twiddle_h_rsc_0_8_ARREADY("TLS_twiddle_h_rsc_0_8_ARREADY")
    , TLS_twiddle_h_rsc_0_8_ARVALID("TLS_twiddle_h_rsc_0_8_ARVALID")
    , TLS_twiddle_h_rsc_0_8_ARUSER("TLS_twiddle_h_rsc_0_8_ARUSER")
    , TLS_twiddle_h_rsc_0_8_ARREGION("TLS_twiddle_h_rsc_0_8_ARREGION")
    , TLS_twiddle_h_rsc_0_8_ARQOS("TLS_twiddle_h_rsc_0_8_ARQOS")
    , TLS_twiddle_h_rsc_0_8_ARPROT("TLS_twiddle_h_rsc_0_8_ARPROT")
    , TLS_twiddle_h_rsc_0_8_ARCACHE("TLS_twiddle_h_rsc_0_8_ARCACHE")
    , TLS_twiddle_h_rsc_0_8_ARLOCK("TLS_twiddle_h_rsc_0_8_ARLOCK")
    , TLS_twiddle_h_rsc_0_8_ARBURST("TLS_twiddle_h_rsc_0_8_ARBURST")
    , TLS_twiddle_h_rsc_0_8_ARSIZE("TLS_twiddle_h_rsc_0_8_ARSIZE")
    , TLS_twiddle_h_rsc_0_8_ARLEN("TLS_twiddle_h_rsc_0_8_ARLEN")
    , TLS_twiddle_h_rsc_0_8_ARADDR("TLS_twiddle_h_rsc_0_8_ARADDR")
    , TLS_twiddle_h_rsc_0_8_ARID("TLS_twiddle_h_rsc_0_8_ARID")
    , TLS_twiddle_h_rsc_0_8_BREADY("TLS_twiddle_h_rsc_0_8_BREADY")
    , TLS_twiddle_h_rsc_0_8_BVALID("TLS_twiddle_h_rsc_0_8_BVALID")
    , TLS_twiddle_h_rsc_0_8_BUSER("TLS_twiddle_h_rsc_0_8_BUSER")
    , TLS_twiddle_h_rsc_0_8_BRESP("TLS_twiddle_h_rsc_0_8_BRESP")
    , TLS_twiddle_h_rsc_0_8_BID("TLS_twiddle_h_rsc_0_8_BID")
    , TLS_twiddle_h_rsc_0_8_WREADY("TLS_twiddle_h_rsc_0_8_WREADY")
    , TLS_twiddle_h_rsc_0_8_WVALID("TLS_twiddle_h_rsc_0_8_WVALID")
    , TLS_twiddle_h_rsc_0_8_WUSER("TLS_twiddle_h_rsc_0_8_WUSER")
    , TLS_twiddle_h_rsc_0_8_WLAST("TLS_twiddle_h_rsc_0_8_WLAST")
    , TLS_twiddle_h_rsc_0_8_WSTRB("TLS_twiddle_h_rsc_0_8_WSTRB")
    , TLS_twiddle_h_rsc_0_8_WDATA("TLS_twiddle_h_rsc_0_8_WDATA")
    , TLS_twiddle_h_rsc_0_8_AWREADY("TLS_twiddle_h_rsc_0_8_AWREADY")
    , TLS_twiddle_h_rsc_0_8_AWVALID("TLS_twiddle_h_rsc_0_8_AWVALID")
    , TLS_twiddle_h_rsc_0_8_AWUSER("TLS_twiddle_h_rsc_0_8_AWUSER")
    , TLS_twiddle_h_rsc_0_8_AWREGION("TLS_twiddle_h_rsc_0_8_AWREGION")
    , TLS_twiddle_h_rsc_0_8_AWQOS("TLS_twiddle_h_rsc_0_8_AWQOS")
    , TLS_twiddle_h_rsc_0_8_AWPROT("TLS_twiddle_h_rsc_0_8_AWPROT")
    , TLS_twiddle_h_rsc_0_8_AWCACHE("TLS_twiddle_h_rsc_0_8_AWCACHE")
    , TLS_twiddle_h_rsc_0_8_AWLOCK("TLS_twiddle_h_rsc_0_8_AWLOCK")
    , TLS_twiddle_h_rsc_0_8_AWBURST("TLS_twiddle_h_rsc_0_8_AWBURST")
    , TLS_twiddle_h_rsc_0_8_AWSIZE("TLS_twiddle_h_rsc_0_8_AWSIZE")
    , TLS_twiddle_h_rsc_0_8_AWLEN("TLS_twiddle_h_rsc_0_8_AWLEN")
    , TLS_twiddle_h_rsc_0_8_AWADDR("TLS_twiddle_h_rsc_0_8_AWADDR")
    , TLS_twiddle_h_rsc_0_8_AWID("TLS_twiddle_h_rsc_0_8_AWID")
    , TLS_twiddle_h_rsc_triosy_0_8_lz("TLS_twiddle_h_rsc_triosy_0_8_lz")
    , TLS_twiddle_h_rsc_0_9_s_tdone("TLS_twiddle_h_rsc_0_9_s_tdone")
    , TLS_twiddle_h_rsc_0_9_tr_write_done("TLS_twiddle_h_rsc_0_9_tr_write_done")
    , TLS_twiddle_h_rsc_0_9_RREADY("TLS_twiddle_h_rsc_0_9_RREADY")
    , TLS_twiddle_h_rsc_0_9_RVALID("TLS_twiddle_h_rsc_0_9_RVALID")
    , TLS_twiddle_h_rsc_0_9_RUSER("TLS_twiddle_h_rsc_0_9_RUSER")
    , TLS_twiddle_h_rsc_0_9_RLAST("TLS_twiddle_h_rsc_0_9_RLAST")
    , TLS_twiddle_h_rsc_0_9_RRESP("TLS_twiddle_h_rsc_0_9_RRESP")
    , TLS_twiddle_h_rsc_0_9_RDATA("TLS_twiddle_h_rsc_0_9_RDATA")
    , TLS_twiddle_h_rsc_0_9_RID("TLS_twiddle_h_rsc_0_9_RID")
    , TLS_twiddle_h_rsc_0_9_ARREADY("TLS_twiddle_h_rsc_0_9_ARREADY")
    , TLS_twiddle_h_rsc_0_9_ARVALID("TLS_twiddle_h_rsc_0_9_ARVALID")
    , TLS_twiddle_h_rsc_0_9_ARUSER("TLS_twiddle_h_rsc_0_9_ARUSER")
    , TLS_twiddle_h_rsc_0_9_ARREGION("TLS_twiddle_h_rsc_0_9_ARREGION")
    , TLS_twiddle_h_rsc_0_9_ARQOS("TLS_twiddle_h_rsc_0_9_ARQOS")
    , TLS_twiddle_h_rsc_0_9_ARPROT("TLS_twiddle_h_rsc_0_9_ARPROT")
    , TLS_twiddle_h_rsc_0_9_ARCACHE("TLS_twiddle_h_rsc_0_9_ARCACHE")
    , TLS_twiddle_h_rsc_0_9_ARLOCK("TLS_twiddle_h_rsc_0_9_ARLOCK")
    , TLS_twiddle_h_rsc_0_9_ARBURST("TLS_twiddle_h_rsc_0_9_ARBURST")
    , TLS_twiddle_h_rsc_0_9_ARSIZE("TLS_twiddle_h_rsc_0_9_ARSIZE")
    , TLS_twiddle_h_rsc_0_9_ARLEN("TLS_twiddle_h_rsc_0_9_ARLEN")
    , TLS_twiddle_h_rsc_0_9_ARADDR("TLS_twiddle_h_rsc_0_9_ARADDR")
    , TLS_twiddle_h_rsc_0_9_ARID("TLS_twiddle_h_rsc_0_9_ARID")
    , TLS_twiddle_h_rsc_0_9_BREADY("TLS_twiddle_h_rsc_0_9_BREADY")
    , TLS_twiddle_h_rsc_0_9_BVALID("TLS_twiddle_h_rsc_0_9_BVALID")
    , TLS_twiddle_h_rsc_0_9_BUSER("TLS_twiddle_h_rsc_0_9_BUSER")
    , TLS_twiddle_h_rsc_0_9_BRESP("TLS_twiddle_h_rsc_0_9_BRESP")
    , TLS_twiddle_h_rsc_0_9_BID("TLS_twiddle_h_rsc_0_9_BID")
    , TLS_twiddle_h_rsc_0_9_WREADY("TLS_twiddle_h_rsc_0_9_WREADY")
    , TLS_twiddle_h_rsc_0_9_WVALID("TLS_twiddle_h_rsc_0_9_WVALID")
    , TLS_twiddle_h_rsc_0_9_WUSER("TLS_twiddle_h_rsc_0_9_WUSER")
    , TLS_twiddle_h_rsc_0_9_WLAST("TLS_twiddle_h_rsc_0_9_WLAST")
    , TLS_twiddle_h_rsc_0_9_WSTRB("TLS_twiddle_h_rsc_0_9_WSTRB")
    , TLS_twiddle_h_rsc_0_9_WDATA("TLS_twiddle_h_rsc_0_9_WDATA")
    , TLS_twiddle_h_rsc_0_9_AWREADY("TLS_twiddle_h_rsc_0_9_AWREADY")
    , TLS_twiddle_h_rsc_0_9_AWVALID("TLS_twiddle_h_rsc_0_9_AWVALID")
    , TLS_twiddle_h_rsc_0_9_AWUSER("TLS_twiddle_h_rsc_0_9_AWUSER")
    , TLS_twiddle_h_rsc_0_9_AWREGION("TLS_twiddle_h_rsc_0_9_AWREGION")
    , TLS_twiddle_h_rsc_0_9_AWQOS("TLS_twiddle_h_rsc_0_9_AWQOS")
    , TLS_twiddle_h_rsc_0_9_AWPROT("TLS_twiddle_h_rsc_0_9_AWPROT")
    , TLS_twiddle_h_rsc_0_9_AWCACHE("TLS_twiddle_h_rsc_0_9_AWCACHE")
    , TLS_twiddle_h_rsc_0_9_AWLOCK("TLS_twiddle_h_rsc_0_9_AWLOCK")
    , TLS_twiddle_h_rsc_0_9_AWBURST("TLS_twiddle_h_rsc_0_9_AWBURST")
    , TLS_twiddle_h_rsc_0_9_AWSIZE("TLS_twiddle_h_rsc_0_9_AWSIZE")
    , TLS_twiddle_h_rsc_0_9_AWLEN("TLS_twiddle_h_rsc_0_9_AWLEN")
    , TLS_twiddle_h_rsc_0_9_AWADDR("TLS_twiddle_h_rsc_0_9_AWADDR")
    , TLS_twiddle_h_rsc_0_9_AWID("TLS_twiddle_h_rsc_0_9_AWID")
    , TLS_twiddle_h_rsc_triosy_0_9_lz("TLS_twiddle_h_rsc_triosy_0_9_lz")
    , TLS_twiddle_h_rsc_0_10_s_tdone("TLS_twiddle_h_rsc_0_10_s_tdone")
    , TLS_twiddle_h_rsc_0_10_tr_write_done("TLS_twiddle_h_rsc_0_10_tr_write_done")
    , TLS_twiddle_h_rsc_0_10_RREADY("TLS_twiddle_h_rsc_0_10_RREADY")
    , TLS_twiddle_h_rsc_0_10_RVALID("TLS_twiddle_h_rsc_0_10_RVALID")
    , TLS_twiddle_h_rsc_0_10_RUSER("TLS_twiddle_h_rsc_0_10_RUSER")
    , TLS_twiddle_h_rsc_0_10_RLAST("TLS_twiddle_h_rsc_0_10_RLAST")
    , TLS_twiddle_h_rsc_0_10_RRESP("TLS_twiddle_h_rsc_0_10_RRESP")
    , TLS_twiddle_h_rsc_0_10_RDATA("TLS_twiddle_h_rsc_0_10_RDATA")
    , TLS_twiddle_h_rsc_0_10_RID("TLS_twiddle_h_rsc_0_10_RID")
    , TLS_twiddle_h_rsc_0_10_ARREADY("TLS_twiddle_h_rsc_0_10_ARREADY")
    , TLS_twiddle_h_rsc_0_10_ARVALID("TLS_twiddle_h_rsc_0_10_ARVALID")
    , TLS_twiddle_h_rsc_0_10_ARUSER("TLS_twiddle_h_rsc_0_10_ARUSER")
    , TLS_twiddle_h_rsc_0_10_ARREGION("TLS_twiddle_h_rsc_0_10_ARREGION")
    , TLS_twiddle_h_rsc_0_10_ARQOS("TLS_twiddle_h_rsc_0_10_ARQOS")
    , TLS_twiddle_h_rsc_0_10_ARPROT("TLS_twiddle_h_rsc_0_10_ARPROT")
    , TLS_twiddle_h_rsc_0_10_ARCACHE("TLS_twiddle_h_rsc_0_10_ARCACHE")
    , TLS_twiddle_h_rsc_0_10_ARLOCK("TLS_twiddle_h_rsc_0_10_ARLOCK")
    , TLS_twiddle_h_rsc_0_10_ARBURST("TLS_twiddle_h_rsc_0_10_ARBURST")
    , TLS_twiddle_h_rsc_0_10_ARSIZE("TLS_twiddle_h_rsc_0_10_ARSIZE")
    , TLS_twiddle_h_rsc_0_10_ARLEN("TLS_twiddle_h_rsc_0_10_ARLEN")
    , TLS_twiddle_h_rsc_0_10_ARADDR("TLS_twiddle_h_rsc_0_10_ARADDR")
    , TLS_twiddle_h_rsc_0_10_ARID("TLS_twiddle_h_rsc_0_10_ARID")
    , TLS_twiddle_h_rsc_0_10_BREADY("TLS_twiddle_h_rsc_0_10_BREADY")
    , TLS_twiddle_h_rsc_0_10_BVALID("TLS_twiddle_h_rsc_0_10_BVALID")
    , TLS_twiddle_h_rsc_0_10_BUSER("TLS_twiddle_h_rsc_0_10_BUSER")
    , TLS_twiddle_h_rsc_0_10_BRESP("TLS_twiddle_h_rsc_0_10_BRESP")
    , TLS_twiddle_h_rsc_0_10_BID("TLS_twiddle_h_rsc_0_10_BID")
    , TLS_twiddle_h_rsc_0_10_WREADY("TLS_twiddle_h_rsc_0_10_WREADY")
    , TLS_twiddle_h_rsc_0_10_WVALID("TLS_twiddle_h_rsc_0_10_WVALID")
    , TLS_twiddle_h_rsc_0_10_WUSER("TLS_twiddle_h_rsc_0_10_WUSER")
    , TLS_twiddle_h_rsc_0_10_WLAST("TLS_twiddle_h_rsc_0_10_WLAST")
    , TLS_twiddle_h_rsc_0_10_WSTRB("TLS_twiddle_h_rsc_0_10_WSTRB")
    , TLS_twiddle_h_rsc_0_10_WDATA("TLS_twiddle_h_rsc_0_10_WDATA")
    , TLS_twiddle_h_rsc_0_10_AWREADY("TLS_twiddle_h_rsc_0_10_AWREADY")
    , TLS_twiddle_h_rsc_0_10_AWVALID("TLS_twiddle_h_rsc_0_10_AWVALID")
    , TLS_twiddle_h_rsc_0_10_AWUSER("TLS_twiddle_h_rsc_0_10_AWUSER")
    , TLS_twiddle_h_rsc_0_10_AWREGION("TLS_twiddle_h_rsc_0_10_AWREGION")
    , TLS_twiddle_h_rsc_0_10_AWQOS("TLS_twiddle_h_rsc_0_10_AWQOS")
    , TLS_twiddle_h_rsc_0_10_AWPROT("TLS_twiddle_h_rsc_0_10_AWPROT")
    , TLS_twiddle_h_rsc_0_10_AWCACHE("TLS_twiddle_h_rsc_0_10_AWCACHE")
    , TLS_twiddle_h_rsc_0_10_AWLOCK("TLS_twiddle_h_rsc_0_10_AWLOCK")
    , TLS_twiddle_h_rsc_0_10_AWBURST("TLS_twiddle_h_rsc_0_10_AWBURST")
    , TLS_twiddle_h_rsc_0_10_AWSIZE("TLS_twiddle_h_rsc_0_10_AWSIZE")
    , TLS_twiddle_h_rsc_0_10_AWLEN("TLS_twiddle_h_rsc_0_10_AWLEN")
    , TLS_twiddle_h_rsc_0_10_AWADDR("TLS_twiddle_h_rsc_0_10_AWADDR")
    , TLS_twiddle_h_rsc_0_10_AWID("TLS_twiddle_h_rsc_0_10_AWID")
    , TLS_twiddle_h_rsc_triosy_0_10_lz("TLS_twiddle_h_rsc_triosy_0_10_lz")
    , TLS_twiddle_h_rsc_0_11_s_tdone("TLS_twiddle_h_rsc_0_11_s_tdone")
    , TLS_twiddle_h_rsc_0_11_tr_write_done("TLS_twiddle_h_rsc_0_11_tr_write_done")
    , TLS_twiddle_h_rsc_0_11_RREADY("TLS_twiddle_h_rsc_0_11_RREADY")
    , TLS_twiddle_h_rsc_0_11_RVALID("TLS_twiddle_h_rsc_0_11_RVALID")
    , TLS_twiddle_h_rsc_0_11_RUSER("TLS_twiddle_h_rsc_0_11_RUSER")
    , TLS_twiddle_h_rsc_0_11_RLAST("TLS_twiddle_h_rsc_0_11_RLAST")
    , TLS_twiddle_h_rsc_0_11_RRESP("TLS_twiddle_h_rsc_0_11_RRESP")
    , TLS_twiddle_h_rsc_0_11_RDATA("TLS_twiddle_h_rsc_0_11_RDATA")
    , TLS_twiddle_h_rsc_0_11_RID("TLS_twiddle_h_rsc_0_11_RID")
    , TLS_twiddle_h_rsc_0_11_ARREADY("TLS_twiddle_h_rsc_0_11_ARREADY")
    , TLS_twiddle_h_rsc_0_11_ARVALID("TLS_twiddle_h_rsc_0_11_ARVALID")
    , TLS_twiddle_h_rsc_0_11_ARUSER("TLS_twiddle_h_rsc_0_11_ARUSER")
    , TLS_twiddle_h_rsc_0_11_ARREGION("TLS_twiddle_h_rsc_0_11_ARREGION")
    , TLS_twiddle_h_rsc_0_11_ARQOS("TLS_twiddle_h_rsc_0_11_ARQOS")
    , TLS_twiddle_h_rsc_0_11_ARPROT("TLS_twiddle_h_rsc_0_11_ARPROT")
    , TLS_twiddle_h_rsc_0_11_ARCACHE("TLS_twiddle_h_rsc_0_11_ARCACHE")
    , TLS_twiddle_h_rsc_0_11_ARLOCK("TLS_twiddle_h_rsc_0_11_ARLOCK")
    , TLS_twiddle_h_rsc_0_11_ARBURST("TLS_twiddle_h_rsc_0_11_ARBURST")
    , TLS_twiddle_h_rsc_0_11_ARSIZE("TLS_twiddle_h_rsc_0_11_ARSIZE")
    , TLS_twiddle_h_rsc_0_11_ARLEN("TLS_twiddle_h_rsc_0_11_ARLEN")
    , TLS_twiddle_h_rsc_0_11_ARADDR("TLS_twiddle_h_rsc_0_11_ARADDR")
    , TLS_twiddle_h_rsc_0_11_ARID("TLS_twiddle_h_rsc_0_11_ARID")
    , TLS_twiddle_h_rsc_0_11_BREADY("TLS_twiddle_h_rsc_0_11_BREADY")
    , TLS_twiddle_h_rsc_0_11_BVALID("TLS_twiddle_h_rsc_0_11_BVALID")
    , TLS_twiddle_h_rsc_0_11_BUSER("TLS_twiddle_h_rsc_0_11_BUSER")
    , TLS_twiddle_h_rsc_0_11_BRESP("TLS_twiddle_h_rsc_0_11_BRESP")
    , TLS_twiddle_h_rsc_0_11_BID("TLS_twiddle_h_rsc_0_11_BID")
    , TLS_twiddle_h_rsc_0_11_WREADY("TLS_twiddle_h_rsc_0_11_WREADY")
    , TLS_twiddle_h_rsc_0_11_WVALID("TLS_twiddle_h_rsc_0_11_WVALID")
    , TLS_twiddle_h_rsc_0_11_WUSER("TLS_twiddle_h_rsc_0_11_WUSER")
    , TLS_twiddle_h_rsc_0_11_WLAST("TLS_twiddle_h_rsc_0_11_WLAST")
    , TLS_twiddle_h_rsc_0_11_WSTRB("TLS_twiddle_h_rsc_0_11_WSTRB")
    , TLS_twiddle_h_rsc_0_11_WDATA("TLS_twiddle_h_rsc_0_11_WDATA")
    , TLS_twiddle_h_rsc_0_11_AWREADY("TLS_twiddle_h_rsc_0_11_AWREADY")
    , TLS_twiddle_h_rsc_0_11_AWVALID("TLS_twiddle_h_rsc_0_11_AWVALID")
    , TLS_twiddle_h_rsc_0_11_AWUSER("TLS_twiddle_h_rsc_0_11_AWUSER")
    , TLS_twiddle_h_rsc_0_11_AWREGION("TLS_twiddle_h_rsc_0_11_AWREGION")
    , TLS_twiddle_h_rsc_0_11_AWQOS("TLS_twiddle_h_rsc_0_11_AWQOS")
    , TLS_twiddle_h_rsc_0_11_AWPROT("TLS_twiddle_h_rsc_0_11_AWPROT")
    , TLS_twiddle_h_rsc_0_11_AWCACHE("TLS_twiddle_h_rsc_0_11_AWCACHE")
    , TLS_twiddle_h_rsc_0_11_AWLOCK("TLS_twiddle_h_rsc_0_11_AWLOCK")
    , TLS_twiddle_h_rsc_0_11_AWBURST("TLS_twiddle_h_rsc_0_11_AWBURST")
    , TLS_twiddle_h_rsc_0_11_AWSIZE("TLS_twiddle_h_rsc_0_11_AWSIZE")
    , TLS_twiddle_h_rsc_0_11_AWLEN("TLS_twiddle_h_rsc_0_11_AWLEN")
    , TLS_twiddle_h_rsc_0_11_AWADDR("TLS_twiddle_h_rsc_0_11_AWADDR")
    , TLS_twiddle_h_rsc_0_11_AWID("TLS_twiddle_h_rsc_0_11_AWID")
    , TLS_twiddle_h_rsc_triosy_0_11_lz("TLS_twiddle_h_rsc_triosy_0_11_lz")
    , TLS_twiddle_h_rsc_0_12_s_tdone("TLS_twiddle_h_rsc_0_12_s_tdone")
    , TLS_twiddle_h_rsc_0_12_tr_write_done("TLS_twiddle_h_rsc_0_12_tr_write_done")
    , TLS_twiddle_h_rsc_0_12_RREADY("TLS_twiddle_h_rsc_0_12_RREADY")
    , TLS_twiddle_h_rsc_0_12_RVALID("TLS_twiddle_h_rsc_0_12_RVALID")
    , TLS_twiddle_h_rsc_0_12_RUSER("TLS_twiddle_h_rsc_0_12_RUSER")
    , TLS_twiddle_h_rsc_0_12_RLAST("TLS_twiddle_h_rsc_0_12_RLAST")
    , TLS_twiddle_h_rsc_0_12_RRESP("TLS_twiddle_h_rsc_0_12_RRESP")
    , TLS_twiddle_h_rsc_0_12_RDATA("TLS_twiddle_h_rsc_0_12_RDATA")
    , TLS_twiddle_h_rsc_0_12_RID("TLS_twiddle_h_rsc_0_12_RID")
    , TLS_twiddle_h_rsc_0_12_ARREADY("TLS_twiddle_h_rsc_0_12_ARREADY")
    , TLS_twiddle_h_rsc_0_12_ARVALID("TLS_twiddle_h_rsc_0_12_ARVALID")
    , TLS_twiddle_h_rsc_0_12_ARUSER("TLS_twiddle_h_rsc_0_12_ARUSER")
    , TLS_twiddle_h_rsc_0_12_ARREGION("TLS_twiddle_h_rsc_0_12_ARREGION")
    , TLS_twiddle_h_rsc_0_12_ARQOS("TLS_twiddle_h_rsc_0_12_ARQOS")
    , TLS_twiddle_h_rsc_0_12_ARPROT("TLS_twiddle_h_rsc_0_12_ARPROT")
    , TLS_twiddle_h_rsc_0_12_ARCACHE("TLS_twiddle_h_rsc_0_12_ARCACHE")
    , TLS_twiddle_h_rsc_0_12_ARLOCK("TLS_twiddle_h_rsc_0_12_ARLOCK")
    , TLS_twiddle_h_rsc_0_12_ARBURST("TLS_twiddle_h_rsc_0_12_ARBURST")
    , TLS_twiddle_h_rsc_0_12_ARSIZE("TLS_twiddle_h_rsc_0_12_ARSIZE")
    , TLS_twiddle_h_rsc_0_12_ARLEN("TLS_twiddle_h_rsc_0_12_ARLEN")
    , TLS_twiddle_h_rsc_0_12_ARADDR("TLS_twiddle_h_rsc_0_12_ARADDR")
    , TLS_twiddle_h_rsc_0_12_ARID("TLS_twiddle_h_rsc_0_12_ARID")
    , TLS_twiddle_h_rsc_0_12_BREADY("TLS_twiddle_h_rsc_0_12_BREADY")
    , TLS_twiddle_h_rsc_0_12_BVALID("TLS_twiddle_h_rsc_0_12_BVALID")
    , TLS_twiddle_h_rsc_0_12_BUSER("TLS_twiddle_h_rsc_0_12_BUSER")
    , TLS_twiddle_h_rsc_0_12_BRESP("TLS_twiddle_h_rsc_0_12_BRESP")
    , TLS_twiddle_h_rsc_0_12_BID("TLS_twiddle_h_rsc_0_12_BID")
    , TLS_twiddle_h_rsc_0_12_WREADY("TLS_twiddle_h_rsc_0_12_WREADY")
    , TLS_twiddle_h_rsc_0_12_WVALID("TLS_twiddle_h_rsc_0_12_WVALID")
    , TLS_twiddle_h_rsc_0_12_WUSER("TLS_twiddle_h_rsc_0_12_WUSER")
    , TLS_twiddle_h_rsc_0_12_WLAST("TLS_twiddle_h_rsc_0_12_WLAST")
    , TLS_twiddle_h_rsc_0_12_WSTRB("TLS_twiddle_h_rsc_0_12_WSTRB")
    , TLS_twiddle_h_rsc_0_12_WDATA("TLS_twiddle_h_rsc_0_12_WDATA")
    , TLS_twiddle_h_rsc_0_12_AWREADY("TLS_twiddle_h_rsc_0_12_AWREADY")
    , TLS_twiddle_h_rsc_0_12_AWVALID("TLS_twiddle_h_rsc_0_12_AWVALID")
    , TLS_twiddle_h_rsc_0_12_AWUSER("TLS_twiddle_h_rsc_0_12_AWUSER")
    , TLS_twiddle_h_rsc_0_12_AWREGION("TLS_twiddle_h_rsc_0_12_AWREGION")
    , TLS_twiddle_h_rsc_0_12_AWQOS("TLS_twiddle_h_rsc_0_12_AWQOS")
    , TLS_twiddle_h_rsc_0_12_AWPROT("TLS_twiddle_h_rsc_0_12_AWPROT")
    , TLS_twiddle_h_rsc_0_12_AWCACHE("TLS_twiddle_h_rsc_0_12_AWCACHE")
    , TLS_twiddle_h_rsc_0_12_AWLOCK("TLS_twiddle_h_rsc_0_12_AWLOCK")
    , TLS_twiddle_h_rsc_0_12_AWBURST("TLS_twiddle_h_rsc_0_12_AWBURST")
    , TLS_twiddle_h_rsc_0_12_AWSIZE("TLS_twiddle_h_rsc_0_12_AWSIZE")
    , TLS_twiddle_h_rsc_0_12_AWLEN("TLS_twiddle_h_rsc_0_12_AWLEN")
    , TLS_twiddle_h_rsc_0_12_AWADDR("TLS_twiddle_h_rsc_0_12_AWADDR")
    , TLS_twiddle_h_rsc_0_12_AWID("TLS_twiddle_h_rsc_0_12_AWID")
    , TLS_twiddle_h_rsc_triosy_0_12_lz("TLS_twiddle_h_rsc_triosy_0_12_lz")
    , TLS_twiddle_h_rsc_0_13_s_tdone("TLS_twiddle_h_rsc_0_13_s_tdone")
    , TLS_twiddle_h_rsc_0_13_tr_write_done("TLS_twiddle_h_rsc_0_13_tr_write_done")
    , TLS_twiddle_h_rsc_0_13_RREADY("TLS_twiddle_h_rsc_0_13_RREADY")
    , TLS_twiddle_h_rsc_0_13_RVALID("TLS_twiddle_h_rsc_0_13_RVALID")
    , TLS_twiddle_h_rsc_0_13_RUSER("TLS_twiddle_h_rsc_0_13_RUSER")
    , TLS_twiddle_h_rsc_0_13_RLAST("TLS_twiddle_h_rsc_0_13_RLAST")
    , TLS_twiddle_h_rsc_0_13_RRESP("TLS_twiddle_h_rsc_0_13_RRESP")
    , TLS_twiddle_h_rsc_0_13_RDATA("TLS_twiddle_h_rsc_0_13_RDATA")
    , TLS_twiddle_h_rsc_0_13_RID("TLS_twiddle_h_rsc_0_13_RID")
    , TLS_twiddle_h_rsc_0_13_ARREADY("TLS_twiddle_h_rsc_0_13_ARREADY")
    , TLS_twiddle_h_rsc_0_13_ARVALID("TLS_twiddle_h_rsc_0_13_ARVALID")
    , TLS_twiddle_h_rsc_0_13_ARUSER("TLS_twiddle_h_rsc_0_13_ARUSER")
    , TLS_twiddle_h_rsc_0_13_ARREGION("TLS_twiddle_h_rsc_0_13_ARREGION")
    , TLS_twiddle_h_rsc_0_13_ARQOS("TLS_twiddle_h_rsc_0_13_ARQOS")
    , TLS_twiddle_h_rsc_0_13_ARPROT("TLS_twiddle_h_rsc_0_13_ARPROT")
    , TLS_twiddle_h_rsc_0_13_ARCACHE("TLS_twiddle_h_rsc_0_13_ARCACHE")
    , TLS_twiddle_h_rsc_0_13_ARLOCK("TLS_twiddle_h_rsc_0_13_ARLOCK")
    , TLS_twiddle_h_rsc_0_13_ARBURST("TLS_twiddle_h_rsc_0_13_ARBURST")
    , TLS_twiddle_h_rsc_0_13_ARSIZE("TLS_twiddle_h_rsc_0_13_ARSIZE")
    , TLS_twiddle_h_rsc_0_13_ARLEN("TLS_twiddle_h_rsc_0_13_ARLEN")
    , TLS_twiddle_h_rsc_0_13_ARADDR("TLS_twiddle_h_rsc_0_13_ARADDR")
    , TLS_twiddle_h_rsc_0_13_ARID("TLS_twiddle_h_rsc_0_13_ARID")
    , TLS_twiddle_h_rsc_0_13_BREADY("TLS_twiddle_h_rsc_0_13_BREADY")
    , TLS_twiddle_h_rsc_0_13_BVALID("TLS_twiddle_h_rsc_0_13_BVALID")
    , TLS_twiddle_h_rsc_0_13_BUSER("TLS_twiddle_h_rsc_0_13_BUSER")
    , TLS_twiddle_h_rsc_0_13_BRESP("TLS_twiddle_h_rsc_0_13_BRESP")
    , TLS_twiddle_h_rsc_0_13_BID("TLS_twiddle_h_rsc_0_13_BID")
    , TLS_twiddle_h_rsc_0_13_WREADY("TLS_twiddle_h_rsc_0_13_WREADY")
    , TLS_twiddle_h_rsc_0_13_WVALID("TLS_twiddle_h_rsc_0_13_WVALID")
    , TLS_twiddle_h_rsc_0_13_WUSER("TLS_twiddle_h_rsc_0_13_WUSER")
    , TLS_twiddle_h_rsc_0_13_WLAST("TLS_twiddle_h_rsc_0_13_WLAST")
    , TLS_twiddle_h_rsc_0_13_WSTRB("TLS_twiddle_h_rsc_0_13_WSTRB")
    , TLS_twiddle_h_rsc_0_13_WDATA("TLS_twiddle_h_rsc_0_13_WDATA")
    , TLS_twiddle_h_rsc_0_13_AWREADY("TLS_twiddle_h_rsc_0_13_AWREADY")
    , TLS_twiddle_h_rsc_0_13_AWVALID("TLS_twiddle_h_rsc_0_13_AWVALID")
    , TLS_twiddle_h_rsc_0_13_AWUSER("TLS_twiddle_h_rsc_0_13_AWUSER")
    , TLS_twiddle_h_rsc_0_13_AWREGION("TLS_twiddle_h_rsc_0_13_AWREGION")
    , TLS_twiddle_h_rsc_0_13_AWQOS("TLS_twiddle_h_rsc_0_13_AWQOS")
    , TLS_twiddle_h_rsc_0_13_AWPROT("TLS_twiddle_h_rsc_0_13_AWPROT")
    , TLS_twiddle_h_rsc_0_13_AWCACHE("TLS_twiddle_h_rsc_0_13_AWCACHE")
    , TLS_twiddle_h_rsc_0_13_AWLOCK("TLS_twiddle_h_rsc_0_13_AWLOCK")
    , TLS_twiddle_h_rsc_0_13_AWBURST("TLS_twiddle_h_rsc_0_13_AWBURST")
    , TLS_twiddle_h_rsc_0_13_AWSIZE("TLS_twiddle_h_rsc_0_13_AWSIZE")
    , TLS_twiddle_h_rsc_0_13_AWLEN("TLS_twiddle_h_rsc_0_13_AWLEN")
    , TLS_twiddle_h_rsc_0_13_AWADDR("TLS_twiddle_h_rsc_0_13_AWADDR")
    , TLS_twiddle_h_rsc_0_13_AWID("TLS_twiddle_h_rsc_0_13_AWID")
    , TLS_twiddle_h_rsc_triosy_0_13_lz("TLS_twiddle_h_rsc_triosy_0_13_lz")
    , TLS_twiddle_h_rsc_0_14_s_tdone("TLS_twiddle_h_rsc_0_14_s_tdone")
    , TLS_twiddle_h_rsc_0_14_tr_write_done("TLS_twiddle_h_rsc_0_14_tr_write_done")
    , TLS_twiddle_h_rsc_0_14_RREADY("TLS_twiddle_h_rsc_0_14_RREADY")
    , TLS_twiddle_h_rsc_0_14_RVALID("TLS_twiddle_h_rsc_0_14_RVALID")
    , TLS_twiddle_h_rsc_0_14_RUSER("TLS_twiddle_h_rsc_0_14_RUSER")
    , TLS_twiddle_h_rsc_0_14_RLAST("TLS_twiddle_h_rsc_0_14_RLAST")
    , TLS_twiddle_h_rsc_0_14_RRESP("TLS_twiddle_h_rsc_0_14_RRESP")
    , TLS_twiddle_h_rsc_0_14_RDATA("TLS_twiddle_h_rsc_0_14_RDATA")
    , TLS_twiddle_h_rsc_0_14_RID("TLS_twiddle_h_rsc_0_14_RID")
    , TLS_twiddle_h_rsc_0_14_ARREADY("TLS_twiddle_h_rsc_0_14_ARREADY")
    , TLS_twiddle_h_rsc_0_14_ARVALID("TLS_twiddle_h_rsc_0_14_ARVALID")
    , TLS_twiddle_h_rsc_0_14_ARUSER("TLS_twiddle_h_rsc_0_14_ARUSER")
    , TLS_twiddle_h_rsc_0_14_ARREGION("TLS_twiddle_h_rsc_0_14_ARREGION")
    , TLS_twiddle_h_rsc_0_14_ARQOS("TLS_twiddle_h_rsc_0_14_ARQOS")
    , TLS_twiddle_h_rsc_0_14_ARPROT("TLS_twiddle_h_rsc_0_14_ARPROT")
    , TLS_twiddle_h_rsc_0_14_ARCACHE("TLS_twiddle_h_rsc_0_14_ARCACHE")
    , TLS_twiddle_h_rsc_0_14_ARLOCK("TLS_twiddle_h_rsc_0_14_ARLOCK")
    , TLS_twiddle_h_rsc_0_14_ARBURST("TLS_twiddle_h_rsc_0_14_ARBURST")
    , TLS_twiddle_h_rsc_0_14_ARSIZE("TLS_twiddle_h_rsc_0_14_ARSIZE")
    , TLS_twiddle_h_rsc_0_14_ARLEN("TLS_twiddle_h_rsc_0_14_ARLEN")
    , TLS_twiddle_h_rsc_0_14_ARADDR("TLS_twiddle_h_rsc_0_14_ARADDR")
    , TLS_twiddle_h_rsc_0_14_ARID("TLS_twiddle_h_rsc_0_14_ARID")
    , TLS_twiddle_h_rsc_0_14_BREADY("TLS_twiddle_h_rsc_0_14_BREADY")
    , TLS_twiddle_h_rsc_0_14_BVALID("TLS_twiddle_h_rsc_0_14_BVALID")
    , TLS_twiddle_h_rsc_0_14_BUSER("TLS_twiddle_h_rsc_0_14_BUSER")
    , TLS_twiddle_h_rsc_0_14_BRESP("TLS_twiddle_h_rsc_0_14_BRESP")
    , TLS_twiddle_h_rsc_0_14_BID("TLS_twiddle_h_rsc_0_14_BID")
    , TLS_twiddle_h_rsc_0_14_WREADY("TLS_twiddle_h_rsc_0_14_WREADY")
    , TLS_twiddle_h_rsc_0_14_WVALID("TLS_twiddle_h_rsc_0_14_WVALID")
    , TLS_twiddle_h_rsc_0_14_WUSER("TLS_twiddle_h_rsc_0_14_WUSER")
    , TLS_twiddle_h_rsc_0_14_WLAST("TLS_twiddle_h_rsc_0_14_WLAST")
    , TLS_twiddle_h_rsc_0_14_WSTRB("TLS_twiddle_h_rsc_0_14_WSTRB")
    , TLS_twiddle_h_rsc_0_14_WDATA("TLS_twiddle_h_rsc_0_14_WDATA")
    , TLS_twiddle_h_rsc_0_14_AWREADY("TLS_twiddle_h_rsc_0_14_AWREADY")
    , TLS_twiddle_h_rsc_0_14_AWVALID("TLS_twiddle_h_rsc_0_14_AWVALID")
    , TLS_twiddle_h_rsc_0_14_AWUSER("TLS_twiddle_h_rsc_0_14_AWUSER")
    , TLS_twiddle_h_rsc_0_14_AWREGION("TLS_twiddle_h_rsc_0_14_AWREGION")
    , TLS_twiddle_h_rsc_0_14_AWQOS("TLS_twiddle_h_rsc_0_14_AWQOS")
    , TLS_twiddle_h_rsc_0_14_AWPROT("TLS_twiddle_h_rsc_0_14_AWPROT")
    , TLS_twiddle_h_rsc_0_14_AWCACHE("TLS_twiddle_h_rsc_0_14_AWCACHE")
    , TLS_twiddle_h_rsc_0_14_AWLOCK("TLS_twiddle_h_rsc_0_14_AWLOCK")
    , TLS_twiddle_h_rsc_0_14_AWBURST("TLS_twiddle_h_rsc_0_14_AWBURST")
    , TLS_twiddle_h_rsc_0_14_AWSIZE("TLS_twiddle_h_rsc_0_14_AWSIZE")
    , TLS_twiddle_h_rsc_0_14_AWLEN("TLS_twiddle_h_rsc_0_14_AWLEN")
    , TLS_twiddle_h_rsc_0_14_AWADDR("TLS_twiddle_h_rsc_0_14_AWADDR")
    , TLS_twiddle_h_rsc_0_14_AWID("TLS_twiddle_h_rsc_0_14_AWID")
    , TLS_twiddle_h_rsc_triosy_0_14_lz("TLS_twiddle_h_rsc_triosy_0_14_lz")
    , TLS_twiddle_h_rsc_0_15_s_tdone("TLS_twiddle_h_rsc_0_15_s_tdone")
    , TLS_twiddle_h_rsc_0_15_tr_write_done("TLS_twiddle_h_rsc_0_15_tr_write_done")
    , TLS_twiddle_h_rsc_0_15_RREADY("TLS_twiddle_h_rsc_0_15_RREADY")
    , TLS_twiddle_h_rsc_0_15_RVALID("TLS_twiddle_h_rsc_0_15_RVALID")
    , TLS_twiddle_h_rsc_0_15_RUSER("TLS_twiddle_h_rsc_0_15_RUSER")
    , TLS_twiddle_h_rsc_0_15_RLAST("TLS_twiddle_h_rsc_0_15_RLAST")
    , TLS_twiddle_h_rsc_0_15_RRESP("TLS_twiddle_h_rsc_0_15_RRESP")
    , TLS_twiddle_h_rsc_0_15_RDATA("TLS_twiddle_h_rsc_0_15_RDATA")
    , TLS_twiddle_h_rsc_0_15_RID("TLS_twiddle_h_rsc_0_15_RID")
    , TLS_twiddle_h_rsc_0_15_ARREADY("TLS_twiddle_h_rsc_0_15_ARREADY")
    , TLS_twiddle_h_rsc_0_15_ARVALID("TLS_twiddle_h_rsc_0_15_ARVALID")
    , TLS_twiddle_h_rsc_0_15_ARUSER("TLS_twiddle_h_rsc_0_15_ARUSER")
    , TLS_twiddle_h_rsc_0_15_ARREGION("TLS_twiddle_h_rsc_0_15_ARREGION")
    , TLS_twiddle_h_rsc_0_15_ARQOS("TLS_twiddle_h_rsc_0_15_ARQOS")
    , TLS_twiddle_h_rsc_0_15_ARPROT("TLS_twiddle_h_rsc_0_15_ARPROT")
    , TLS_twiddle_h_rsc_0_15_ARCACHE("TLS_twiddle_h_rsc_0_15_ARCACHE")
    , TLS_twiddle_h_rsc_0_15_ARLOCK("TLS_twiddle_h_rsc_0_15_ARLOCK")
    , TLS_twiddle_h_rsc_0_15_ARBURST("TLS_twiddle_h_rsc_0_15_ARBURST")
    , TLS_twiddle_h_rsc_0_15_ARSIZE("TLS_twiddle_h_rsc_0_15_ARSIZE")
    , TLS_twiddle_h_rsc_0_15_ARLEN("TLS_twiddle_h_rsc_0_15_ARLEN")
    , TLS_twiddle_h_rsc_0_15_ARADDR("TLS_twiddle_h_rsc_0_15_ARADDR")
    , TLS_twiddle_h_rsc_0_15_ARID("TLS_twiddle_h_rsc_0_15_ARID")
    , TLS_twiddle_h_rsc_0_15_BREADY("TLS_twiddle_h_rsc_0_15_BREADY")
    , TLS_twiddle_h_rsc_0_15_BVALID("TLS_twiddle_h_rsc_0_15_BVALID")
    , TLS_twiddle_h_rsc_0_15_BUSER("TLS_twiddle_h_rsc_0_15_BUSER")
    , TLS_twiddle_h_rsc_0_15_BRESP("TLS_twiddle_h_rsc_0_15_BRESP")
    , TLS_twiddle_h_rsc_0_15_BID("TLS_twiddle_h_rsc_0_15_BID")
    , TLS_twiddle_h_rsc_0_15_WREADY("TLS_twiddle_h_rsc_0_15_WREADY")
    , TLS_twiddle_h_rsc_0_15_WVALID("TLS_twiddle_h_rsc_0_15_WVALID")
    , TLS_twiddle_h_rsc_0_15_WUSER("TLS_twiddle_h_rsc_0_15_WUSER")
    , TLS_twiddle_h_rsc_0_15_WLAST("TLS_twiddle_h_rsc_0_15_WLAST")
    , TLS_twiddle_h_rsc_0_15_WSTRB("TLS_twiddle_h_rsc_0_15_WSTRB")
    , TLS_twiddle_h_rsc_0_15_WDATA("TLS_twiddle_h_rsc_0_15_WDATA")
    , TLS_twiddle_h_rsc_0_15_AWREADY("TLS_twiddle_h_rsc_0_15_AWREADY")
    , TLS_twiddle_h_rsc_0_15_AWVALID("TLS_twiddle_h_rsc_0_15_AWVALID")
    , TLS_twiddle_h_rsc_0_15_AWUSER("TLS_twiddle_h_rsc_0_15_AWUSER")
    , TLS_twiddle_h_rsc_0_15_AWREGION("TLS_twiddle_h_rsc_0_15_AWREGION")
    , TLS_twiddle_h_rsc_0_15_AWQOS("TLS_twiddle_h_rsc_0_15_AWQOS")
    , TLS_twiddle_h_rsc_0_15_AWPROT("TLS_twiddle_h_rsc_0_15_AWPROT")
    , TLS_twiddle_h_rsc_0_15_AWCACHE("TLS_twiddle_h_rsc_0_15_AWCACHE")
    , TLS_twiddle_h_rsc_0_15_AWLOCK("TLS_twiddle_h_rsc_0_15_AWLOCK")
    , TLS_twiddle_h_rsc_0_15_AWBURST("TLS_twiddle_h_rsc_0_15_AWBURST")
    , TLS_twiddle_h_rsc_0_15_AWSIZE("TLS_twiddle_h_rsc_0_15_AWSIZE")
    , TLS_twiddle_h_rsc_0_15_AWLEN("TLS_twiddle_h_rsc_0_15_AWLEN")
    , TLS_twiddle_h_rsc_0_15_AWADDR("TLS_twiddle_h_rsc_0_15_AWADDR")
    , TLS_twiddle_h_rsc_0_15_AWID("TLS_twiddle_h_rsc_0_15_AWID")
    , TLS_twiddle_h_rsc_triosy_0_15_lz("TLS_twiddle_h_rsc_triosy_0_15_lz")
    , peaseNTT_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , TLS_xt_rsc_0__0__adrb("TLS_xt_rsc_0__0__adrb")
    , TLS_xt_rsc_0__0__qb("TLS_xt_rsc_0__0__qb")
    , xt_rsc_0__0__INST("xt_rsc_0__0_", true)
    , TLS_xt_rsc_0__1__adrb("TLS_xt_rsc_0__1__adrb")
    , TLS_xt_rsc_0__1__qb("TLS_xt_rsc_0__1__qb")
    , xt_rsc_0__1__INST("xt_rsc_0__1_", true)
    , TLS_xt_rsc_0__2__adrb("TLS_xt_rsc_0__2__adrb")
    , TLS_xt_rsc_0__2__qb("TLS_xt_rsc_0__2__qb")
    , xt_rsc_0__2__INST("xt_rsc_0__2_", true)
    , TLS_xt_rsc_0__3__adrb("TLS_xt_rsc_0__3__adrb")
    , TLS_xt_rsc_0__3__qb("TLS_xt_rsc_0__3__qb")
    , xt_rsc_0__3__INST("xt_rsc_0__3_", true)
    , TLS_xt_rsc_0__4__adrb("TLS_xt_rsc_0__4__adrb")
    , TLS_xt_rsc_0__4__qb("TLS_xt_rsc_0__4__qb")
    , xt_rsc_0__4__INST("xt_rsc_0__4_", true)
    , TLS_xt_rsc_0__5__adrb("TLS_xt_rsc_0__5__adrb")
    , TLS_xt_rsc_0__5__qb("TLS_xt_rsc_0__5__qb")
    , xt_rsc_0__5__INST("xt_rsc_0__5_", true)
    , TLS_xt_rsc_0__6__adrb("TLS_xt_rsc_0__6__adrb")
    , TLS_xt_rsc_0__6__qb("TLS_xt_rsc_0__6__qb")
    , xt_rsc_0__6__INST("xt_rsc_0__6_", true)
    , TLS_xt_rsc_0__7__adrb("TLS_xt_rsc_0__7__adrb")
    , TLS_xt_rsc_0__7__qb("TLS_xt_rsc_0__7__qb")
    , xt_rsc_0__7__INST("xt_rsc_0__7_", true)
    , TLS_xt_rsc_0__8__adrb("TLS_xt_rsc_0__8__adrb")
    , TLS_xt_rsc_0__8__qb("TLS_xt_rsc_0__8__qb")
    , xt_rsc_0__8__INST("xt_rsc_0__8_", true)
    , TLS_xt_rsc_0__9__adrb("TLS_xt_rsc_0__9__adrb")
    , TLS_xt_rsc_0__9__qb("TLS_xt_rsc_0__9__qb")
    , xt_rsc_0__9__INST("xt_rsc_0__9_", true)
    , TLS_xt_rsc_0__10__adrb("TLS_xt_rsc_0__10__adrb")
    , TLS_xt_rsc_0__10__qb("TLS_xt_rsc_0__10__qb")
    , xt_rsc_0__10__INST("xt_rsc_0__10_", true)
    , TLS_xt_rsc_0__11__adrb("TLS_xt_rsc_0__11__adrb")
    , TLS_xt_rsc_0__11__qb("TLS_xt_rsc_0__11__qb")
    , xt_rsc_0__11__INST("xt_rsc_0__11_", true)
    , TLS_xt_rsc_0__12__adrb("TLS_xt_rsc_0__12__adrb")
    , TLS_xt_rsc_0__12__qb("TLS_xt_rsc_0__12__qb")
    , xt_rsc_0__12__INST("xt_rsc_0__12_", true)
    , TLS_xt_rsc_0__13__adrb("TLS_xt_rsc_0__13__adrb")
    , TLS_xt_rsc_0__13__qb("TLS_xt_rsc_0__13__qb")
    , xt_rsc_0__13__INST("xt_rsc_0__13_", true)
    , TLS_xt_rsc_0__14__adrb("TLS_xt_rsc_0__14__adrb")
    , TLS_xt_rsc_0__14__qb("TLS_xt_rsc_0__14__qb")
    , xt_rsc_0__14__INST("xt_rsc_0__14_", true)
    , TLS_xt_rsc_0__15__adrb("TLS_xt_rsc_0__15__adrb")
    , TLS_xt_rsc_0__15__qb("TLS_xt_rsc_0__15__qb")
    , xt_rsc_0__15__INST("xt_rsc_0__15_", true)
    , TLS_xt_rsc_0__16__adrb("TLS_xt_rsc_0__16__adrb")
    , TLS_xt_rsc_0__16__qb("TLS_xt_rsc_0__16__qb")
    , xt_rsc_0__16__INST("xt_rsc_0__16_", true)
    , TLS_xt_rsc_0__17__adrb("TLS_xt_rsc_0__17__adrb")
    , TLS_xt_rsc_0__17__qb("TLS_xt_rsc_0__17__qb")
    , xt_rsc_0__17__INST("xt_rsc_0__17_", true)
    , TLS_xt_rsc_0__18__adrb("TLS_xt_rsc_0__18__adrb")
    , TLS_xt_rsc_0__18__qb("TLS_xt_rsc_0__18__qb")
    , xt_rsc_0__18__INST("xt_rsc_0__18_", true)
    , TLS_xt_rsc_0__19__adrb("TLS_xt_rsc_0__19__adrb")
    , TLS_xt_rsc_0__19__qb("TLS_xt_rsc_0__19__qb")
    , xt_rsc_0__19__INST("xt_rsc_0__19_", true)
    , TLS_xt_rsc_0__20__adrb("TLS_xt_rsc_0__20__adrb")
    , TLS_xt_rsc_0__20__qb("TLS_xt_rsc_0__20__qb")
    , xt_rsc_0__20__INST("xt_rsc_0__20_", true)
    , TLS_xt_rsc_0__21__adrb("TLS_xt_rsc_0__21__adrb")
    , TLS_xt_rsc_0__21__qb("TLS_xt_rsc_0__21__qb")
    , xt_rsc_0__21__INST("xt_rsc_0__21_", true)
    , TLS_xt_rsc_0__22__adrb("TLS_xt_rsc_0__22__adrb")
    , TLS_xt_rsc_0__22__qb("TLS_xt_rsc_0__22__qb")
    , xt_rsc_0__22__INST("xt_rsc_0__22_", true)
    , TLS_xt_rsc_0__23__adrb("TLS_xt_rsc_0__23__adrb")
    , TLS_xt_rsc_0__23__qb("TLS_xt_rsc_0__23__qb")
    , xt_rsc_0__23__INST("xt_rsc_0__23_", true)
    , TLS_xt_rsc_0__24__adrb("TLS_xt_rsc_0__24__adrb")
    , TLS_xt_rsc_0__24__qb("TLS_xt_rsc_0__24__qb")
    , xt_rsc_0__24__INST("xt_rsc_0__24_", true)
    , TLS_xt_rsc_0__25__adrb("TLS_xt_rsc_0__25__adrb")
    , TLS_xt_rsc_0__25__qb("TLS_xt_rsc_0__25__qb")
    , xt_rsc_0__25__INST("xt_rsc_0__25_", true)
    , TLS_xt_rsc_0__26__adrb("TLS_xt_rsc_0__26__adrb")
    , TLS_xt_rsc_0__26__qb("TLS_xt_rsc_0__26__qb")
    , xt_rsc_0__26__INST("xt_rsc_0__26_", true)
    , TLS_xt_rsc_0__27__adrb("TLS_xt_rsc_0__27__adrb")
    , TLS_xt_rsc_0__27__qb("TLS_xt_rsc_0__27__qb")
    , xt_rsc_0__27__INST("xt_rsc_0__27_", true)
    , TLS_xt_rsc_0__28__adrb("TLS_xt_rsc_0__28__adrb")
    , TLS_xt_rsc_0__28__qb("TLS_xt_rsc_0__28__qb")
    , xt_rsc_0__28__INST("xt_rsc_0__28_", true)
    , TLS_xt_rsc_0__29__adrb("TLS_xt_rsc_0__29__adrb")
    , TLS_xt_rsc_0__29__qb("TLS_xt_rsc_0__29__qb")
    , xt_rsc_0__29__INST("xt_rsc_0__29_", true)
    , TLS_xt_rsc_0__30__adrb("TLS_xt_rsc_0__30__adrb")
    , TLS_xt_rsc_0__30__qb("TLS_xt_rsc_0__30__qb")
    , xt_rsc_0__30__INST("xt_rsc_0__30_", true)
    , TLS_xt_rsc_0__31__adrb("TLS_xt_rsc_0__31__adrb")
    , TLS_xt_rsc_0__31__qb("TLS_xt_rsc_0__31__qb")
    , xt_rsc_0__31__INST("xt_rsc_0__31_", true)
    , TLS_xt_rsc_1__0__adrb("TLS_xt_rsc_1__0__adrb")
    , TLS_xt_rsc_1__0__qb("TLS_xt_rsc_1__0__qb")
    , xt_rsc_1__0__INST("xt_rsc_1__0_", true)
    , TLS_xt_rsc_1__1__adrb("TLS_xt_rsc_1__1__adrb")
    , TLS_xt_rsc_1__1__qb("TLS_xt_rsc_1__1__qb")
    , xt_rsc_1__1__INST("xt_rsc_1__1_", true)
    , TLS_xt_rsc_1__2__adrb("TLS_xt_rsc_1__2__adrb")
    , TLS_xt_rsc_1__2__qb("TLS_xt_rsc_1__2__qb")
    , xt_rsc_1__2__INST("xt_rsc_1__2_", true)
    , TLS_xt_rsc_1__3__adrb("TLS_xt_rsc_1__3__adrb")
    , TLS_xt_rsc_1__3__qb("TLS_xt_rsc_1__3__qb")
    , xt_rsc_1__3__INST("xt_rsc_1__3_", true)
    , TLS_xt_rsc_1__4__adrb("TLS_xt_rsc_1__4__adrb")
    , TLS_xt_rsc_1__4__qb("TLS_xt_rsc_1__4__qb")
    , xt_rsc_1__4__INST("xt_rsc_1__4_", true)
    , TLS_xt_rsc_1__5__adrb("TLS_xt_rsc_1__5__adrb")
    , TLS_xt_rsc_1__5__qb("TLS_xt_rsc_1__5__qb")
    , xt_rsc_1__5__INST("xt_rsc_1__5_", true)
    , TLS_xt_rsc_1__6__adrb("TLS_xt_rsc_1__6__adrb")
    , TLS_xt_rsc_1__6__qb("TLS_xt_rsc_1__6__qb")
    , xt_rsc_1__6__INST("xt_rsc_1__6_", true)
    , TLS_xt_rsc_1__7__adrb("TLS_xt_rsc_1__7__adrb")
    , TLS_xt_rsc_1__7__qb("TLS_xt_rsc_1__7__qb")
    , xt_rsc_1__7__INST("xt_rsc_1__7_", true)
    , TLS_xt_rsc_1__8__adrb("TLS_xt_rsc_1__8__adrb")
    , TLS_xt_rsc_1__8__qb("TLS_xt_rsc_1__8__qb")
    , xt_rsc_1__8__INST("xt_rsc_1__8_", true)
    , TLS_xt_rsc_1__9__adrb("TLS_xt_rsc_1__9__adrb")
    , TLS_xt_rsc_1__9__qb("TLS_xt_rsc_1__9__qb")
    , xt_rsc_1__9__INST("xt_rsc_1__9_", true)
    , TLS_xt_rsc_1__10__adrb("TLS_xt_rsc_1__10__adrb")
    , TLS_xt_rsc_1__10__qb("TLS_xt_rsc_1__10__qb")
    , xt_rsc_1__10__INST("xt_rsc_1__10_", true)
    , TLS_xt_rsc_1__11__adrb("TLS_xt_rsc_1__11__adrb")
    , TLS_xt_rsc_1__11__qb("TLS_xt_rsc_1__11__qb")
    , xt_rsc_1__11__INST("xt_rsc_1__11_", true)
    , TLS_xt_rsc_1__12__adrb("TLS_xt_rsc_1__12__adrb")
    , TLS_xt_rsc_1__12__qb("TLS_xt_rsc_1__12__qb")
    , xt_rsc_1__12__INST("xt_rsc_1__12_", true)
    , TLS_xt_rsc_1__13__adrb("TLS_xt_rsc_1__13__adrb")
    , TLS_xt_rsc_1__13__qb("TLS_xt_rsc_1__13__qb")
    , xt_rsc_1__13__INST("xt_rsc_1__13_", true)
    , TLS_xt_rsc_1__14__adrb("TLS_xt_rsc_1__14__adrb")
    , TLS_xt_rsc_1__14__qb("TLS_xt_rsc_1__14__qb")
    , xt_rsc_1__14__INST("xt_rsc_1__14_", true)
    , TLS_xt_rsc_1__15__adrb("TLS_xt_rsc_1__15__adrb")
    , TLS_xt_rsc_1__15__qb("TLS_xt_rsc_1__15__qb")
    , xt_rsc_1__15__INST("xt_rsc_1__15_", true)
    , TLS_xt_rsc_1__16__adrb("TLS_xt_rsc_1__16__adrb")
    , TLS_xt_rsc_1__16__qb("TLS_xt_rsc_1__16__qb")
    , xt_rsc_1__16__INST("xt_rsc_1__16_", true)
    , TLS_xt_rsc_1__17__adrb("TLS_xt_rsc_1__17__adrb")
    , TLS_xt_rsc_1__17__qb("TLS_xt_rsc_1__17__qb")
    , xt_rsc_1__17__INST("xt_rsc_1__17_", true)
    , TLS_xt_rsc_1__18__adrb("TLS_xt_rsc_1__18__adrb")
    , TLS_xt_rsc_1__18__qb("TLS_xt_rsc_1__18__qb")
    , xt_rsc_1__18__INST("xt_rsc_1__18_", true)
    , TLS_xt_rsc_1__19__adrb("TLS_xt_rsc_1__19__adrb")
    , TLS_xt_rsc_1__19__qb("TLS_xt_rsc_1__19__qb")
    , xt_rsc_1__19__INST("xt_rsc_1__19_", true)
    , TLS_xt_rsc_1__20__adrb("TLS_xt_rsc_1__20__adrb")
    , TLS_xt_rsc_1__20__qb("TLS_xt_rsc_1__20__qb")
    , xt_rsc_1__20__INST("xt_rsc_1__20_", true)
    , TLS_xt_rsc_1__21__adrb("TLS_xt_rsc_1__21__adrb")
    , TLS_xt_rsc_1__21__qb("TLS_xt_rsc_1__21__qb")
    , xt_rsc_1__21__INST("xt_rsc_1__21_", true)
    , TLS_xt_rsc_1__22__adrb("TLS_xt_rsc_1__22__adrb")
    , TLS_xt_rsc_1__22__qb("TLS_xt_rsc_1__22__qb")
    , xt_rsc_1__22__INST("xt_rsc_1__22_", true)
    , TLS_xt_rsc_1__23__adrb("TLS_xt_rsc_1__23__adrb")
    , TLS_xt_rsc_1__23__qb("TLS_xt_rsc_1__23__qb")
    , xt_rsc_1__23__INST("xt_rsc_1__23_", true)
    , TLS_xt_rsc_1__24__adrb("TLS_xt_rsc_1__24__adrb")
    , TLS_xt_rsc_1__24__qb("TLS_xt_rsc_1__24__qb")
    , xt_rsc_1__24__INST("xt_rsc_1__24_", true)
    , TLS_xt_rsc_1__25__adrb("TLS_xt_rsc_1__25__adrb")
    , TLS_xt_rsc_1__25__qb("TLS_xt_rsc_1__25__qb")
    , xt_rsc_1__25__INST("xt_rsc_1__25_", true)
    , TLS_xt_rsc_1__26__adrb("TLS_xt_rsc_1__26__adrb")
    , TLS_xt_rsc_1__26__qb("TLS_xt_rsc_1__26__qb")
    , xt_rsc_1__26__INST("xt_rsc_1__26_", true)
    , TLS_xt_rsc_1__27__adrb("TLS_xt_rsc_1__27__adrb")
    , TLS_xt_rsc_1__27__qb("TLS_xt_rsc_1__27__qb")
    , xt_rsc_1__27__INST("xt_rsc_1__27_", true)
    , TLS_xt_rsc_1__28__adrb("TLS_xt_rsc_1__28__adrb")
    , TLS_xt_rsc_1__28__qb("TLS_xt_rsc_1__28__qb")
    , xt_rsc_1__28__INST("xt_rsc_1__28_", true)
    , TLS_xt_rsc_1__29__adrb("TLS_xt_rsc_1__29__adrb")
    , TLS_xt_rsc_1__29__qb("TLS_xt_rsc_1__29__qb")
    , xt_rsc_1__29__INST("xt_rsc_1__29_", true)
    , TLS_xt_rsc_1__30__adrb("TLS_xt_rsc_1__30__adrb")
    , TLS_xt_rsc_1__30__qb("TLS_xt_rsc_1__30__qb")
    , xt_rsc_1__30__INST("xt_rsc_1__30_", true)
    , TLS_xt_rsc_1__31__adrb("TLS_xt_rsc_1__31__adrb")
    , TLS_xt_rsc_1__31__qb("TLS_xt_rsc_1__31__qb")
    , xt_rsc_1__31__INST("xt_rsc_1__31_", true)
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
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_4_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_4_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RUSER")
    , twiddle_rsc_0__4__INST("twiddle_rsc_0__4_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_5_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_5_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RUSER")
    , twiddle_rsc_0__5__INST("twiddle_rsc_0__5_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_6_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_6_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RUSER")
    , twiddle_rsc_0__6__INST("twiddle_rsc_0__6_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_7_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_7_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RUSER")
    , twiddle_rsc_0__7__INST("twiddle_rsc_0__7_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_8_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_8_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RUSER")
    , twiddle_rsc_0__8__INST("twiddle_rsc_0__8_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_9_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_9_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RUSER")
    , twiddle_rsc_0__9__INST("twiddle_rsc_0__9_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_10_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_10_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RUSER")
    , twiddle_rsc_0__10__INST("twiddle_rsc_0__10_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_11_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_11_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RUSER")
    , twiddle_rsc_0__11__INST("twiddle_rsc_0__11_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_12_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_12_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RUSER")
    , twiddle_rsc_0__12__INST("twiddle_rsc_0__12_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_13_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_13_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RUSER")
    , twiddle_rsc_0__13__INST("twiddle_rsc_0__13_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_14_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_14_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RUSER")
    , twiddle_rsc_0__14__INST("twiddle_rsc_0__14_", true)
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWID("CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_15_WUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_15_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARID("CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARID")
    , CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARUSER("CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RUSER")
    , twiddle_rsc_0__15__INST("twiddle_rsc_0__15_", true)
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
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER")
    , twiddle_h_rsc_0__4__INST("twiddle_h_rsc_0__4_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER")
    , twiddle_h_rsc_0__5__INST("twiddle_h_rsc_0__5_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER")
    , twiddle_h_rsc_0__6__INST("twiddle_h_rsc_0__6_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER")
    , twiddle_h_rsc_0__7__INST("twiddle_h_rsc_0__7_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER")
    , twiddle_h_rsc_0__8__INST("twiddle_h_rsc_0__8_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER")
    , twiddle_h_rsc_0__9__INST("twiddle_h_rsc_0__9_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER")
    , twiddle_h_rsc_0__10__INST("twiddle_h_rsc_0__10_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER")
    , twiddle_h_rsc_0__11__INST("twiddle_h_rsc_0__11_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER")
    , twiddle_h_rsc_0__12__INST("twiddle_h_rsc_0__12_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER")
    , twiddle_h_rsc_0__13__INST("twiddle_h_rsc_0__13_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER")
    , twiddle_h_rsc_0__14__INST("twiddle_h_rsc_0__14_", true)
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_WUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_WUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARID("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARID")
    , CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARUSER("CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARUSER")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RID("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RID")
    , CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER("CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER")
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
    , trios_monitor_xt_rsc_triosy_1_0_lz_INST("trios_monitor_xt_rsc_triosy_1_0_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_1_lz_INST("trios_monitor_xt_rsc_triosy_1_1_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_2_lz_INST("trios_monitor_xt_rsc_triosy_1_2_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_3_lz_INST("trios_monitor_xt_rsc_triosy_1_3_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_4_lz_INST("trios_monitor_xt_rsc_triosy_1_4_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_5_lz_INST("trios_monitor_xt_rsc_triosy_1_5_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_6_lz_INST("trios_monitor_xt_rsc_triosy_1_6_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_7_lz_INST("trios_monitor_xt_rsc_triosy_1_7_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_8_lz_INST("trios_monitor_xt_rsc_triosy_1_8_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_9_lz_INST("trios_monitor_xt_rsc_triosy_1_9_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_10_lz_INST("trios_monitor_xt_rsc_triosy_1_10_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_11_lz_INST("trios_monitor_xt_rsc_triosy_1_11_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_12_lz_INST("trios_monitor_xt_rsc_triosy_1_12_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_13_lz_INST("trios_monitor_xt_rsc_triosy_1_13_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_14_lz_INST("trios_monitor_xt_rsc_triosy_1_14_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_15_lz_INST("trios_monitor_xt_rsc_triosy_1_15_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_16_lz_INST("trios_monitor_xt_rsc_triosy_1_16_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_17_lz_INST("trios_monitor_xt_rsc_triosy_1_17_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_18_lz_INST("trios_monitor_xt_rsc_triosy_1_18_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_19_lz_INST("trios_monitor_xt_rsc_triosy_1_19_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_20_lz_INST("trios_monitor_xt_rsc_triosy_1_20_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_21_lz_INST("trios_monitor_xt_rsc_triosy_1_21_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_22_lz_INST("trios_monitor_xt_rsc_triosy_1_22_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_23_lz_INST("trios_monitor_xt_rsc_triosy_1_23_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_24_lz_INST("trios_monitor_xt_rsc_triosy_1_24_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_25_lz_INST("trios_monitor_xt_rsc_triosy_1_25_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_26_lz_INST("trios_monitor_xt_rsc_triosy_1_26_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_27_lz_INST("trios_monitor_xt_rsc_triosy_1_27_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_28_lz_INST("trios_monitor_xt_rsc_triosy_1_28_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_29_lz_INST("trios_monitor_xt_rsc_triosy_1_29_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_30_lz_INST("trios_monitor_xt_rsc_triosy_1_30_lz_INST")
    , trios_monitor_xt_rsc_triosy_1_31_lz_INST("trios_monitor_xt_rsc_triosy_1_31_lz_INST")
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
    , sync_generator_INST("sync_generator", true, false, false, false, 7357, 7357, 0)
    , catapult_monitor_INST("Monitor", clk, true, 7357LL, 7357LL)
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
    peaseNTT_INST.xt_rsc_triosy_0_0_lz(TLS_xt_rsc_triosy_0_0_lz);
    peaseNTT_INST.xt_rsc_0_1_adra(TLS_xt_rsc_0_1_adra);
    peaseNTT_INST.xt_rsc_0_1_da(TLS_xt_rsc_0_1_da);
    peaseNTT_INST.xt_rsc_0_1_wea(TLS_xt_rsc_0_1_wea);
    peaseNTT_INST.xt_rsc_0_1_qa(TLS_xt_rsc_0_1_qa);
    peaseNTT_INST.xt_rsc_triosy_0_1_lz(TLS_xt_rsc_triosy_0_1_lz);
    peaseNTT_INST.xt_rsc_0_2_adra(TLS_xt_rsc_0_2_adra);
    peaseNTT_INST.xt_rsc_0_2_da(TLS_xt_rsc_0_2_da);
    peaseNTT_INST.xt_rsc_0_2_wea(TLS_xt_rsc_0_2_wea);
    peaseNTT_INST.xt_rsc_0_2_qa(TLS_xt_rsc_0_2_qa);
    peaseNTT_INST.xt_rsc_triosy_0_2_lz(TLS_xt_rsc_triosy_0_2_lz);
    peaseNTT_INST.xt_rsc_0_3_adra(TLS_xt_rsc_0_3_adra);
    peaseNTT_INST.xt_rsc_0_3_da(TLS_xt_rsc_0_3_da);
    peaseNTT_INST.xt_rsc_0_3_wea(TLS_xt_rsc_0_3_wea);
    peaseNTT_INST.xt_rsc_0_3_qa(TLS_xt_rsc_0_3_qa);
    peaseNTT_INST.xt_rsc_triosy_0_3_lz(TLS_xt_rsc_triosy_0_3_lz);
    peaseNTT_INST.xt_rsc_0_4_adra(TLS_xt_rsc_0_4_adra);
    peaseNTT_INST.xt_rsc_0_4_da(TLS_xt_rsc_0_4_da);
    peaseNTT_INST.xt_rsc_0_4_wea(TLS_xt_rsc_0_4_wea);
    peaseNTT_INST.xt_rsc_0_4_qa(TLS_xt_rsc_0_4_qa);
    peaseNTT_INST.xt_rsc_triosy_0_4_lz(TLS_xt_rsc_triosy_0_4_lz);
    peaseNTT_INST.xt_rsc_0_5_adra(TLS_xt_rsc_0_5_adra);
    peaseNTT_INST.xt_rsc_0_5_da(TLS_xt_rsc_0_5_da);
    peaseNTT_INST.xt_rsc_0_5_wea(TLS_xt_rsc_0_5_wea);
    peaseNTT_INST.xt_rsc_0_5_qa(TLS_xt_rsc_0_5_qa);
    peaseNTT_INST.xt_rsc_triosy_0_5_lz(TLS_xt_rsc_triosy_0_5_lz);
    peaseNTT_INST.xt_rsc_0_6_adra(TLS_xt_rsc_0_6_adra);
    peaseNTT_INST.xt_rsc_0_6_da(TLS_xt_rsc_0_6_da);
    peaseNTT_INST.xt_rsc_0_6_wea(TLS_xt_rsc_0_6_wea);
    peaseNTT_INST.xt_rsc_0_6_qa(TLS_xt_rsc_0_6_qa);
    peaseNTT_INST.xt_rsc_triosy_0_6_lz(TLS_xt_rsc_triosy_0_6_lz);
    peaseNTT_INST.xt_rsc_0_7_adra(TLS_xt_rsc_0_7_adra);
    peaseNTT_INST.xt_rsc_0_7_da(TLS_xt_rsc_0_7_da);
    peaseNTT_INST.xt_rsc_0_7_wea(TLS_xt_rsc_0_7_wea);
    peaseNTT_INST.xt_rsc_0_7_qa(TLS_xt_rsc_0_7_qa);
    peaseNTT_INST.xt_rsc_triosy_0_7_lz(TLS_xt_rsc_triosy_0_7_lz);
    peaseNTT_INST.xt_rsc_0_8_adra(TLS_xt_rsc_0_8_adra);
    peaseNTT_INST.xt_rsc_0_8_da(TLS_xt_rsc_0_8_da);
    peaseNTT_INST.xt_rsc_0_8_wea(TLS_xt_rsc_0_8_wea);
    peaseNTT_INST.xt_rsc_0_8_qa(TLS_xt_rsc_0_8_qa);
    peaseNTT_INST.xt_rsc_triosy_0_8_lz(TLS_xt_rsc_triosy_0_8_lz);
    peaseNTT_INST.xt_rsc_0_9_adra(TLS_xt_rsc_0_9_adra);
    peaseNTT_INST.xt_rsc_0_9_da(TLS_xt_rsc_0_9_da);
    peaseNTT_INST.xt_rsc_0_9_wea(TLS_xt_rsc_0_9_wea);
    peaseNTT_INST.xt_rsc_0_9_qa(TLS_xt_rsc_0_9_qa);
    peaseNTT_INST.xt_rsc_triosy_0_9_lz(TLS_xt_rsc_triosy_0_9_lz);
    peaseNTT_INST.xt_rsc_0_10_adra(TLS_xt_rsc_0_10_adra);
    peaseNTT_INST.xt_rsc_0_10_da(TLS_xt_rsc_0_10_da);
    peaseNTT_INST.xt_rsc_0_10_wea(TLS_xt_rsc_0_10_wea);
    peaseNTT_INST.xt_rsc_0_10_qa(TLS_xt_rsc_0_10_qa);
    peaseNTT_INST.xt_rsc_triosy_0_10_lz(TLS_xt_rsc_triosy_0_10_lz);
    peaseNTT_INST.xt_rsc_0_11_adra(TLS_xt_rsc_0_11_adra);
    peaseNTT_INST.xt_rsc_0_11_da(TLS_xt_rsc_0_11_da);
    peaseNTT_INST.xt_rsc_0_11_wea(TLS_xt_rsc_0_11_wea);
    peaseNTT_INST.xt_rsc_0_11_qa(TLS_xt_rsc_0_11_qa);
    peaseNTT_INST.xt_rsc_triosy_0_11_lz(TLS_xt_rsc_triosy_0_11_lz);
    peaseNTT_INST.xt_rsc_0_12_adra(TLS_xt_rsc_0_12_adra);
    peaseNTT_INST.xt_rsc_0_12_da(TLS_xt_rsc_0_12_da);
    peaseNTT_INST.xt_rsc_0_12_wea(TLS_xt_rsc_0_12_wea);
    peaseNTT_INST.xt_rsc_0_12_qa(TLS_xt_rsc_0_12_qa);
    peaseNTT_INST.xt_rsc_triosy_0_12_lz(TLS_xt_rsc_triosy_0_12_lz);
    peaseNTT_INST.xt_rsc_0_13_adra(TLS_xt_rsc_0_13_adra);
    peaseNTT_INST.xt_rsc_0_13_da(TLS_xt_rsc_0_13_da);
    peaseNTT_INST.xt_rsc_0_13_wea(TLS_xt_rsc_0_13_wea);
    peaseNTT_INST.xt_rsc_0_13_qa(TLS_xt_rsc_0_13_qa);
    peaseNTT_INST.xt_rsc_triosy_0_13_lz(TLS_xt_rsc_triosy_0_13_lz);
    peaseNTT_INST.xt_rsc_0_14_adra(TLS_xt_rsc_0_14_adra);
    peaseNTT_INST.xt_rsc_0_14_da(TLS_xt_rsc_0_14_da);
    peaseNTT_INST.xt_rsc_0_14_wea(TLS_xt_rsc_0_14_wea);
    peaseNTT_INST.xt_rsc_0_14_qa(TLS_xt_rsc_0_14_qa);
    peaseNTT_INST.xt_rsc_triosy_0_14_lz(TLS_xt_rsc_triosy_0_14_lz);
    peaseNTT_INST.xt_rsc_0_15_adra(TLS_xt_rsc_0_15_adra);
    peaseNTT_INST.xt_rsc_0_15_da(TLS_xt_rsc_0_15_da);
    peaseNTT_INST.xt_rsc_0_15_wea(TLS_xt_rsc_0_15_wea);
    peaseNTT_INST.xt_rsc_0_15_qa(TLS_xt_rsc_0_15_qa);
    peaseNTT_INST.xt_rsc_triosy_0_15_lz(TLS_xt_rsc_triosy_0_15_lz);
    peaseNTT_INST.xt_rsc_0_16_adra(TLS_xt_rsc_0_16_adra);
    peaseNTT_INST.xt_rsc_0_16_da(TLS_xt_rsc_0_16_da);
    peaseNTT_INST.xt_rsc_0_16_wea(TLS_xt_rsc_0_16_wea);
    peaseNTT_INST.xt_rsc_0_16_qa(TLS_xt_rsc_0_16_qa);
    peaseNTT_INST.xt_rsc_triosy_0_16_lz(TLS_xt_rsc_triosy_0_16_lz);
    peaseNTT_INST.xt_rsc_0_17_adra(TLS_xt_rsc_0_17_adra);
    peaseNTT_INST.xt_rsc_0_17_da(TLS_xt_rsc_0_17_da);
    peaseNTT_INST.xt_rsc_0_17_wea(TLS_xt_rsc_0_17_wea);
    peaseNTT_INST.xt_rsc_0_17_qa(TLS_xt_rsc_0_17_qa);
    peaseNTT_INST.xt_rsc_triosy_0_17_lz(TLS_xt_rsc_triosy_0_17_lz);
    peaseNTT_INST.xt_rsc_0_18_adra(TLS_xt_rsc_0_18_adra);
    peaseNTT_INST.xt_rsc_0_18_da(TLS_xt_rsc_0_18_da);
    peaseNTT_INST.xt_rsc_0_18_wea(TLS_xt_rsc_0_18_wea);
    peaseNTT_INST.xt_rsc_0_18_qa(TLS_xt_rsc_0_18_qa);
    peaseNTT_INST.xt_rsc_triosy_0_18_lz(TLS_xt_rsc_triosy_0_18_lz);
    peaseNTT_INST.xt_rsc_0_19_adra(TLS_xt_rsc_0_19_adra);
    peaseNTT_INST.xt_rsc_0_19_da(TLS_xt_rsc_0_19_da);
    peaseNTT_INST.xt_rsc_0_19_wea(TLS_xt_rsc_0_19_wea);
    peaseNTT_INST.xt_rsc_0_19_qa(TLS_xt_rsc_0_19_qa);
    peaseNTT_INST.xt_rsc_triosy_0_19_lz(TLS_xt_rsc_triosy_0_19_lz);
    peaseNTT_INST.xt_rsc_0_20_adra(TLS_xt_rsc_0_20_adra);
    peaseNTT_INST.xt_rsc_0_20_da(TLS_xt_rsc_0_20_da);
    peaseNTT_INST.xt_rsc_0_20_wea(TLS_xt_rsc_0_20_wea);
    peaseNTT_INST.xt_rsc_0_20_qa(TLS_xt_rsc_0_20_qa);
    peaseNTT_INST.xt_rsc_triosy_0_20_lz(TLS_xt_rsc_triosy_0_20_lz);
    peaseNTT_INST.xt_rsc_0_21_adra(TLS_xt_rsc_0_21_adra);
    peaseNTT_INST.xt_rsc_0_21_da(TLS_xt_rsc_0_21_da);
    peaseNTT_INST.xt_rsc_0_21_wea(TLS_xt_rsc_0_21_wea);
    peaseNTT_INST.xt_rsc_0_21_qa(TLS_xt_rsc_0_21_qa);
    peaseNTT_INST.xt_rsc_triosy_0_21_lz(TLS_xt_rsc_triosy_0_21_lz);
    peaseNTT_INST.xt_rsc_0_22_adra(TLS_xt_rsc_0_22_adra);
    peaseNTT_INST.xt_rsc_0_22_da(TLS_xt_rsc_0_22_da);
    peaseNTT_INST.xt_rsc_0_22_wea(TLS_xt_rsc_0_22_wea);
    peaseNTT_INST.xt_rsc_0_22_qa(TLS_xt_rsc_0_22_qa);
    peaseNTT_INST.xt_rsc_triosy_0_22_lz(TLS_xt_rsc_triosy_0_22_lz);
    peaseNTT_INST.xt_rsc_0_23_adra(TLS_xt_rsc_0_23_adra);
    peaseNTT_INST.xt_rsc_0_23_da(TLS_xt_rsc_0_23_da);
    peaseNTT_INST.xt_rsc_0_23_wea(TLS_xt_rsc_0_23_wea);
    peaseNTT_INST.xt_rsc_0_23_qa(TLS_xt_rsc_0_23_qa);
    peaseNTT_INST.xt_rsc_triosy_0_23_lz(TLS_xt_rsc_triosy_0_23_lz);
    peaseNTT_INST.xt_rsc_0_24_adra(TLS_xt_rsc_0_24_adra);
    peaseNTT_INST.xt_rsc_0_24_da(TLS_xt_rsc_0_24_da);
    peaseNTT_INST.xt_rsc_0_24_wea(TLS_xt_rsc_0_24_wea);
    peaseNTT_INST.xt_rsc_0_24_qa(TLS_xt_rsc_0_24_qa);
    peaseNTT_INST.xt_rsc_triosy_0_24_lz(TLS_xt_rsc_triosy_0_24_lz);
    peaseNTT_INST.xt_rsc_0_25_adra(TLS_xt_rsc_0_25_adra);
    peaseNTT_INST.xt_rsc_0_25_da(TLS_xt_rsc_0_25_da);
    peaseNTT_INST.xt_rsc_0_25_wea(TLS_xt_rsc_0_25_wea);
    peaseNTT_INST.xt_rsc_0_25_qa(TLS_xt_rsc_0_25_qa);
    peaseNTT_INST.xt_rsc_triosy_0_25_lz(TLS_xt_rsc_triosy_0_25_lz);
    peaseNTT_INST.xt_rsc_0_26_adra(TLS_xt_rsc_0_26_adra);
    peaseNTT_INST.xt_rsc_0_26_da(TLS_xt_rsc_0_26_da);
    peaseNTT_INST.xt_rsc_0_26_wea(TLS_xt_rsc_0_26_wea);
    peaseNTT_INST.xt_rsc_0_26_qa(TLS_xt_rsc_0_26_qa);
    peaseNTT_INST.xt_rsc_triosy_0_26_lz(TLS_xt_rsc_triosy_0_26_lz);
    peaseNTT_INST.xt_rsc_0_27_adra(TLS_xt_rsc_0_27_adra);
    peaseNTT_INST.xt_rsc_0_27_da(TLS_xt_rsc_0_27_da);
    peaseNTT_INST.xt_rsc_0_27_wea(TLS_xt_rsc_0_27_wea);
    peaseNTT_INST.xt_rsc_0_27_qa(TLS_xt_rsc_0_27_qa);
    peaseNTT_INST.xt_rsc_triosy_0_27_lz(TLS_xt_rsc_triosy_0_27_lz);
    peaseNTT_INST.xt_rsc_0_28_adra(TLS_xt_rsc_0_28_adra);
    peaseNTT_INST.xt_rsc_0_28_da(TLS_xt_rsc_0_28_da);
    peaseNTT_INST.xt_rsc_0_28_wea(TLS_xt_rsc_0_28_wea);
    peaseNTT_INST.xt_rsc_0_28_qa(TLS_xt_rsc_0_28_qa);
    peaseNTT_INST.xt_rsc_triosy_0_28_lz(TLS_xt_rsc_triosy_0_28_lz);
    peaseNTT_INST.xt_rsc_0_29_adra(TLS_xt_rsc_0_29_adra);
    peaseNTT_INST.xt_rsc_0_29_da(TLS_xt_rsc_0_29_da);
    peaseNTT_INST.xt_rsc_0_29_wea(TLS_xt_rsc_0_29_wea);
    peaseNTT_INST.xt_rsc_0_29_qa(TLS_xt_rsc_0_29_qa);
    peaseNTT_INST.xt_rsc_triosy_0_29_lz(TLS_xt_rsc_triosy_0_29_lz);
    peaseNTT_INST.xt_rsc_0_30_adra(TLS_xt_rsc_0_30_adra);
    peaseNTT_INST.xt_rsc_0_30_da(TLS_xt_rsc_0_30_da);
    peaseNTT_INST.xt_rsc_0_30_wea(TLS_xt_rsc_0_30_wea);
    peaseNTT_INST.xt_rsc_0_30_qa(TLS_xt_rsc_0_30_qa);
    peaseNTT_INST.xt_rsc_triosy_0_30_lz(TLS_xt_rsc_triosy_0_30_lz);
    peaseNTT_INST.xt_rsc_0_31_adra(TLS_xt_rsc_0_31_adra);
    peaseNTT_INST.xt_rsc_0_31_da(TLS_xt_rsc_0_31_da);
    peaseNTT_INST.xt_rsc_0_31_wea(TLS_xt_rsc_0_31_wea);
    peaseNTT_INST.xt_rsc_0_31_qa(TLS_xt_rsc_0_31_qa);
    peaseNTT_INST.xt_rsc_triosy_0_31_lz(TLS_xt_rsc_triosy_0_31_lz);
    peaseNTT_INST.xt_rsc_1_0_adra(TLS_xt_rsc_1_0_adra);
    peaseNTT_INST.xt_rsc_1_0_da(TLS_xt_rsc_1_0_da);
    peaseNTT_INST.xt_rsc_1_0_wea(TLS_xt_rsc_1_0_wea);
    peaseNTT_INST.xt_rsc_1_0_qa(TLS_xt_rsc_1_0_qa);
    peaseNTT_INST.xt_rsc_triosy_1_0_lz(TLS_xt_rsc_triosy_1_0_lz);
    peaseNTT_INST.xt_rsc_1_1_adra(TLS_xt_rsc_1_1_adra);
    peaseNTT_INST.xt_rsc_1_1_da(TLS_xt_rsc_1_1_da);
    peaseNTT_INST.xt_rsc_1_1_wea(TLS_xt_rsc_1_1_wea);
    peaseNTT_INST.xt_rsc_1_1_qa(TLS_xt_rsc_1_1_qa);
    peaseNTT_INST.xt_rsc_triosy_1_1_lz(TLS_xt_rsc_triosy_1_1_lz);
    peaseNTT_INST.xt_rsc_1_2_adra(TLS_xt_rsc_1_2_adra);
    peaseNTT_INST.xt_rsc_1_2_da(TLS_xt_rsc_1_2_da);
    peaseNTT_INST.xt_rsc_1_2_wea(TLS_xt_rsc_1_2_wea);
    peaseNTT_INST.xt_rsc_1_2_qa(TLS_xt_rsc_1_2_qa);
    peaseNTT_INST.xt_rsc_triosy_1_2_lz(TLS_xt_rsc_triosy_1_2_lz);
    peaseNTT_INST.xt_rsc_1_3_adra(TLS_xt_rsc_1_3_adra);
    peaseNTT_INST.xt_rsc_1_3_da(TLS_xt_rsc_1_3_da);
    peaseNTT_INST.xt_rsc_1_3_wea(TLS_xt_rsc_1_3_wea);
    peaseNTT_INST.xt_rsc_1_3_qa(TLS_xt_rsc_1_3_qa);
    peaseNTT_INST.xt_rsc_triosy_1_3_lz(TLS_xt_rsc_triosy_1_3_lz);
    peaseNTT_INST.xt_rsc_1_4_adra(TLS_xt_rsc_1_4_adra);
    peaseNTT_INST.xt_rsc_1_4_da(TLS_xt_rsc_1_4_da);
    peaseNTT_INST.xt_rsc_1_4_wea(TLS_xt_rsc_1_4_wea);
    peaseNTT_INST.xt_rsc_1_4_qa(TLS_xt_rsc_1_4_qa);
    peaseNTT_INST.xt_rsc_triosy_1_4_lz(TLS_xt_rsc_triosy_1_4_lz);
    peaseNTT_INST.xt_rsc_1_5_adra(TLS_xt_rsc_1_5_adra);
    peaseNTT_INST.xt_rsc_1_5_da(TLS_xt_rsc_1_5_da);
    peaseNTT_INST.xt_rsc_1_5_wea(TLS_xt_rsc_1_5_wea);
    peaseNTT_INST.xt_rsc_1_5_qa(TLS_xt_rsc_1_5_qa);
    peaseNTT_INST.xt_rsc_triosy_1_5_lz(TLS_xt_rsc_triosy_1_5_lz);
    peaseNTT_INST.xt_rsc_1_6_adra(TLS_xt_rsc_1_6_adra);
    peaseNTT_INST.xt_rsc_1_6_da(TLS_xt_rsc_1_6_da);
    peaseNTT_INST.xt_rsc_1_6_wea(TLS_xt_rsc_1_6_wea);
    peaseNTT_INST.xt_rsc_1_6_qa(TLS_xt_rsc_1_6_qa);
    peaseNTT_INST.xt_rsc_triosy_1_6_lz(TLS_xt_rsc_triosy_1_6_lz);
    peaseNTT_INST.xt_rsc_1_7_adra(TLS_xt_rsc_1_7_adra);
    peaseNTT_INST.xt_rsc_1_7_da(TLS_xt_rsc_1_7_da);
    peaseNTT_INST.xt_rsc_1_7_wea(TLS_xt_rsc_1_7_wea);
    peaseNTT_INST.xt_rsc_1_7_qa(TLS_xt_rsc_1_7_qa);
    peaseNTT_INST.xt_rsc_triosy_1_7_lz(TLS_xt_rsc_triosy_1_7_lz);
    peaseNTT_INST.xt_rsc_1_8_adra(TLS_xt_rsc_1_8_adra);
    peaseNTT_INST.xt_rsc_1_8_da(TLS_xt_rsc_1_8_da);
    peaseNTT_INST.xt_rsc_1_8_wea(TLS_xt_rsc_1_8_wea);
    peaseNTT_INST.xt_rsc_1_8_qa(TLS_xt_rsc_1_8_qa);
    peaseNTT_INST.xt_rsc_triosy_1_8_lz(TLS_xt_rsc_triosy_1_8_lz);
    peaseNTT_INST.xt_rsc_1_9_adra(TLS_xt_rsc_1_9_adra);
    peaseNTT_INST.xt_rsc_1_9_da(TLS_xt_rsc_1_9_da);
    peaseNTT_INST.xt_rsc_1_9_wea(TLS_xt_rsc_1_9_wea);
    peaseNTT_INST.xt_rsc_1_9_qa(TLS_xt_rsc_1_9_qa);
    peaseNTT_INST.xt_rsc_triosy_1_9_lz(TLS_xt_rsc_triosy_1_9_lz);
    peaseNTT_INST.xt_rsc_1_10_adra(TLS_xt_rsc_1_10_adra);
    peaseNTT_INST.xt_rsc_1_10_da(TLS_xt_rsc_1_10_da);
    peaseNTT_INST.xt_rsc_1_10_wea(TLS_xt_rsc_1_10_wea);
    peaseNTT_INST.xt_rsc_1_10_qa(TLS_xt_rsc_1_10_qa);
    peaseNTT_INST.xt_rsc_triosy_1_10_lz(TLS_xt_rsc_triosy_1_10_lz);
    peaseNTT_INST.xt_rsc_1_11_adra(TLS_xt_rsc_1_11_adra);
    peaseNTT_INST.xt_rsc_1_11_da(TLS_xt_rsc_1_11_da);
    peaseNTT_INST.xt_rsc_1_11_wea(TLS_xt_rsc_1_11_wea);
    peaseNTT_INST.xt_rsc_1_11_qa(TLS_xt_rsc_1_11_qa);
    peaseNTT_INST.xt_rsc_triosy_1_11_lz(TLS_xt_rsc_triosy_1_11_lz);
    peaseNTT_INST.xt_rsc_1_12_adra(TLS_xt_rsc_1_12_adra);
    peaseNTT_INST.xt_rsc_1_12_da(TLS_xt_rsc_1_12_da);
    peaseNTT_INST.xt_rsc_1_12_wea(TLS_xt_rsc_1_12_wea);
    peaseNTT_INST.xt_rsc_1_12_qa(TLS_xt_rsc_1_12_qa);
    peaseNTT_INST.xt_rsc_triosy_1_12_lz(TLS_xt_rsc_triosy_1_12_lz);
    peaseNTT_INST.xt_rsc_1_13_adra(TLS_xt_rsc_1_13_adra);
    peaseNTT_INST.xt_rsc_1_13_da(TLS_xt_rsc_1_13_da);
    peaseNTT_INST.xt_rsc_1_13_wea(TLS_xt_rsc_1_13_wea);
    peaseNTT_INST.xt_rsc_1_13_qa(TLS_xt_rsc_1_13_qa);
    peaseNTT_INST.xt_rsc_triosy_1_13_lz(TLS_xt_rsc_triosy_1_13_lz);
    peaseNTT_INST.xt_rsc_1_14_adra(TLS_xt_rsc_1_14_adra);
    peaseNTT_INST.xt_rsc_1_14_da(TLS_xt_rsc_1_14_da);
    peaseNTT_INST.xt_rsc_1_14_wea(TLS_xt_rsc_1_14_wea);
    peaseNTT_INST.xt_rsc_1_14_qa(TLS_xt_rsc_1_14_qa);
    peaseNTT_INST.xt_rsc_triosy_1_14_lz(TLS_xt_rsc_triosy_1_14_lz);
    peaseNTT_INST.xt_rsc_1_15_adra(TLS_xt_rsc_1_15_adra);
    peaseNTT_INST.xt_rsc_1_15_da(TLS_xt_rsc_1_15_da);
    peaseNTT_INST.xt_rsc_1_15_wea(TLS_xt_rsc_1_15_wea);
    peaseNTT_INST.xt_rsc_1_15_qa(TLS_xt_rsc_1_15_qa);
    peaseNTT_INST.xt_rsc_triosy_1_15_lz(TLS_xt_rsc_triosy_1_15_lz);
    peaseNTT_INST.xt_rsc_1_16_adra(TLS_xt_rsc_1_16_adra);
    peaseNTT_INST.xt_rsc_1_16_da(TLS_xt_rsc_1_16_da);
    peaseNTT_INST.xt_rsc_1_16_wea(TLS_xt_rsc_1_16_wea);
    peaseNTT_INST.xt_rsc_1_16_qa(TLS_xt_rsc_1_16_qa);
    peaseNTT_INST.xt_rsc_triosy_1_16_lz(TLS_xt_rsc_triosy_1_16_lz);
    peaseNTT_INST.xt_rsc_1_17_adra(TLS_xt_rsc_1_17_adra);
    peaseNTT_INST.xt_rsc_1_17_da(TLS_xt_rsc_1_17_da);
    peaseNTT_INST.xt_rsc_1_17_wea(TLS_xt_rsc_1_17_wea);
    peaseNTT_INST.xt_rsc_1_17_qa(TLS_xt_rsc_1_17_qa);
    peaseNTT_INST.xt_rsc_triosy_1_17_lz(TLS_xt_rsc_triosy_1_17_lz);
    peaseNTT_INST.xt_rsc_1_18_adra(TLS_xt_rsc_1_18_adra);
    peaseNTT_INST.xt_rsc_1_18_da(TLS_xt_rsc_1_18_da);
    peaseNTT_INST.xt_rsc_1_18_wea(TLS_xt_rsc_1_18_wea);
    peaseNTT_INST.xt_rsc_1_18_qa(TLS_xt_rsc_1_18_qa);
    peaseNTT_INST.xt_rsc_triosy_1_18_lz(TLS_xt_rsc_triosy_1_18_lz);
    peaseNTT_INST.xt_rsc_1_19_adra(TLS_xt_rsc_1_19_adra);
    peaseNTT_INST.xt_rsc_1_19_da(TLS_xt_rsc_1_19_da);
    peaseNTT_INST.xt_rsc_1_19_wea(TLS_xt_rsc_1_19_wea);
    peaseNTT_INST.xt_rsc_1_19_qa(TLS_xt_rsc_1_19_qa);
    peaseNTT_INST.xt_rsc_triosy_1_19_lz(TLS_xt_rsc_triosy_1_19_lz);
    peaseNTT_INST.xt_rsc_1_20_adra(TLS_xt_rsc_1_20_adra);
    peaseNTT_INST.xt_rsc_1_20_da(TLS_xt_rsc_1_20_da);
    peaseNTT_INST.xt_rsc_1_20_wea(TLS_xt_rsc_1_20_wea);
    peaseNTT_INST.xt_rsc_1_20_qa(TLS_xt_rsc_1_20_qa);
    peaseNTT_INST.xt_rsc_triosy_1_20_lz(TLS_xt_rsc_triosy_1_20_lz);
    peaseNTT_INST.xt_rsc_1_21_adra(TLS_xt_rsc_1_21_adra);
    peaseNTT_INST.xt_rsc_1_21_da(TLS_xt_rsc_1_21_da);
    peaseNTT_INST.xt_rsc_1_21_wea(TLS_xt_rsc_1_21_wea);
    peaseNTT_INST.xt_rsc_1_21_qa(TLS_xt_rsc_1_21_qa);
    peaseNTT_INST.xt_rsc_triosy_1_21_lz(TLS_xt_rsc_triosy_1_21_lz);
    peaseNTT_INST.xt_rsc_1_22_adra(TLS_xt_rsc_1_22_adra);
    peaseNTT_INST.xt_rsc_1_22_da(TLS_xt_rsc_1_22_da);
    peaseNTT_INST.xt_rsc_1_22_wea(TLS_xt_rsc_1_22_wea);
    peaseNTT_INST.xt_rsc_1_22_qa(TLS_xt_rsc_1_22_qa);
    peaseNTT_INST.xt_rsc_triosy_1_22_lz(TLS_xt_rsc_triosy_1_22_lz);
    peaseNTT_INST.xt_rsc_1_23_adra(TLS_xt_rsc_1_23_adra);
    peaseNTT_INST.xt_rsc_1_23_da(TLS_xt_rsc_1_23_da);
    peaseNTT_INST.xt_rsc_1_23_wea(TLS_xt_rsc_1_23_wea);
    peaseNTT_INST.xt_rsc_1_23_qa(TLS_xt_rsc_1_23_qa);
    peaseNTT_INST.xt_rsc_triosy_1_23_lz(TLS_xt_rsc_triosy_1_23_lz);
    peaseNTT_INST.xt_rsc_1_24_adra(TLS_xt_rsc_1_24_adra);
    peaseNTT_INST.xt_rsc_1_24_da(TLS_xt_rsc_1_24_da);
    peaseNTT_INST.xt_rsc_1_24_wea(TLS_xt_rsc_1_24_wea);
    peaseNTT_INST.xt_rsc_1_24_qa(TLS_xt_rsc_1_24_qa);
    peaseNTT_INST.xt_rsc_triosy_1_24_lz(TLS_xt_rsc_triosy_1_24_lz);
    peaseNTT_INST.xt_rsc_1_25_adra(TLS_xt_rsc_1_25_adra);
    peaseNTT_INST.xt_rsc_1_25_da(TLS_xt_rsc_1_25_da);
    peaseNTT_INST.xt_rsc_1_25_wea(TLS_xt_rsc_1_25_wea);
    peaseNTT_INST.xt_rsc_1_25_qa(TLS_xt_rsc_1_25_qa);
    peaseNTT_INST.xt_rsc_triosy_1_25_lz(TLS_xt_rsc_triosy_1_25_lz);
    peaseNTT_INST.xt_rsc_1_26_adra(TLS_xt_rsc_1_26_adra);
    peaseNTT_INST.xt_rsc_1_26_da(TLS_xt_rsc_1_26_da);
    peaseNTT_INST.xt_rsc_1_26_wea(TLS_xt_rsc_1_26_wea);
    peaseNTT_INST.xt_rsc_1_26_qa(TLS_xt_rsc_1_26_qa);
    peaseNTT_INST.xt_rsc_triosy_1_26_lz(TLS_xt_rsc_triosy_1_26_lz);
    peaseNTT_INST.xt_rsc_1_27_adra(TLS_xt_rsc_1_27_adra);
    peaseNTT_INST.xt_rsc_1_27_da(TLS_xt_rsc_1_27_da);
    peaseNTT_INST.xt_rsc_1_27_wea(TLS_xt_rsc_1_27_wea);
    peaseNTT_INST.xt_rsc_1_27_qa(TLS_xt_rsc_1_27_qa);
    peaseNTT_INST.xt_rsc_triosy_1_27_lz(TLS_xt_rsc_triosy_1_27_lz);
    peaseNTT_INST.xt_rsc_1_28_adra(TLS_xt_rsc_1_28_adra);
    peaseNTT_INST.xt_rsc_1_28_da(TLS_xt_rsc_1_28_da);
    peaseNTT_INST.xt_rsc_1_28_wea(TLS_xt_rsc_1_28_wea);
    peaseNTT_INST.xt_rsc_1_28_qa(TLS_xt_rsc_1_28_qa);
    peaseNTT_INST.xt_rsc_triosy_1_28_lz(TLS_xt_rsc_triosy_1_28_lz);
    peaseNTT_INST.xt_rsc_1_29_adra(TLS_xt_rsc_1_29_adra);
    peaseNTT_INST.xt_rsc_1_29_da(TLS_xt_rsc_1_29_da);
    peaseNTT_INST.xt_rsc_1_29_wea(TLS_xt_rsc_1_29_wea);
    peaseNTT_INST.xt_rsc_1_29_qa(TLS_xt_rsc_1_29_qa);
    peaseNTT_INST.xt_rsc_triosy_1_29_lz(TLS_xt_rsc_triosy_1_29_lz);
    peaseNTT_INST.xt_rsc_1_30_adra(TLS_xt_rsc_1_30_adra);
    peaseNTT_INST.xt_rsc_1_30_da(TLS_xt_rsc_1_30_da);
    peaseNTT_INST.xt_rsc_1_30_wea(TLS_xt_rsc_1_30_wea);
    peaseNTT_INST.xt_rsc_1_30_qa(TLS_xt_rsc_1_30_qa);
    peaseNTT_INST.xt_rsc_triosy_1_30_lz(TLS_xt_rsc_triosy_1_30_lz);
    peaseNTT_INST.xt_rsc_1_31_adra(TLS_xt_rsc_1_31_adra);
    peaseNTT_INST.xt_rsc_1_31_da(TLS_xt_rsc_1_31_da);
    peaseNTT_INST.xt_rsc_1_31_wea(TLS_xt_rsc_1_31_wea);
    peaseNTT_INST.xt_rsc_1_31_qa(TLS_xt_rsc_1_31_qa);
    peaseNTT_INST.xt_rsc_triosy_1_31_lz(TLS_xt_rsc_triosy_1_31_lz);
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
    peaseNTT_INST.twiddle_rsc_0_4_s_tdone(TLS_twiddle_rsc_0_4_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_4_tr_write_done(TLS_twiddle_rsc_0_4_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_4_RREADY(TLS_twiddle_rsc_0_4_RREADY);
    peaseNTT_INST.twiddle_rsc_0_4_RVALID(TLS_twiddle_rsc_0_4_RVALID);
    peaseNTT_INST.twiddle_rsc_0_4_RUSER(TLS_twiddle_rsc_0_4_RUSER);
    peaseNTT_INST.twiddle_rsc_0_4_RLAST(TLS_twiddle_rsc_0_4_RLAST);
    peaseNTT_INST.twiddle_rsc_0_4_RRESP(TLS_twiddle_rsc_0_4_RRESP);
    peaseNTT_INST.twiddle_rsc_0_4_RDATA(TLS_twiddle_rsc_0_4_RDATA);
    peaseNTT_INST.twiddle_rsc_0_4_RID(TLS_twiddle_rsc_0_4_RID);
    peaseNTT_INST.twiddle_rsc_0_4_ARREADY(TLS_twiddle_rsc_0_4_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_4_ARVALID(TLS_twiddle_rsc_0_4_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_4_ARUSER(TLS_twiddle_rsc_0_4_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_4_ARREGION(TLS_twiddle_rsc_0_4_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_4_ARQOS(TLS_twiddle_rsc_0_4_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_4_ARPROT(TLS_twiddle_rsc_0_4_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_4_ARCACHE(TLS_twiddle_rsc_0_4_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_4_ARLOCK(TLS_twiddle_rsc_0_4_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_4_ARBURST(TLS_twiddle_rsc_0_4_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_4_ARSIZE(TLS_twiddle_rsc_0_4_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_4_ARLEN(TLS_twiddle_rsc_0_4_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_4_ARADDR(TLS_twiddle_rsc_0_4_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_4_ARID(TLS_twiddle_rsc_0_4_ARID);
    peaseNTT_INST.twiddle_rsc_0_4_BREADY(TLS_twiddle_rsc_0_4_BREADY);
    peaseNTT_INST.twiddle_rsc_0_4_BVALID(TLS_twiddle_rsc_0_4_BVALID);
    peaseNTT_INST.twiddle_rsc_0_4_BUSER(TLS_twiddle_rsc_0_4_BUSER);
    peaseNTT_INST.twiddle_rsc_0_4_BRESP(TLS_twiddle_rsc_0_4_BRESP);
    peaseNTT_INST.twiddle_rsc_0_4_BID(TLS_twiddle_rsc_0_4_BID);
    peaseNTT_INST.twiddle_rsc_0_4_WREADY(TLS_twiddle_rsc_0_4_WREADY);
    peaseNTT_INST.twiddle_rsc_0_4_WVALID(TLS_twiddle_rsc_0_4_WVALID);
    peaseNTT_INST.twiddle_rsc_0_4_WUSER(TLS_twiddle_rsc_0_4_WUSER);
    peaseNTT_INST.twiddle_rsc_0_4_WLAST(TLS_twiddle_rsc_0_4_WLAST);
    peaseNTT_INST.twiddle_rsc_0_4_WSTRB(TLS_twiddle_rsc_0_4_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_4_WDATA(TLS_twiddle_rsc_0_4_WDATA);
    peaseNTT_INST.twiddle_rsc_0_4_AWREADY(TLS_twiddle_rsc_0_4_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_4_AWVALID(TLS_twiddle_rsc_0_4_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_4_AWUSER(TLS_twiddle_rsc_0_4_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_4_AWREGION(TLS_twiddle_rsc_0_4_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_4_AWQOS(TLS_twiddle_rsc_0_4_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_4_AWPROT(TLS_twiddle_rsc_0_4_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_4_AWCACHE(TLS_twiddle_rsc_0_4_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_4_AWLOCK(TLS_twiddle_rsc_0_4_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_4_AWBURST(TLS_twiddle_rsc_0_4_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_4_AWSIZE(TLS_twiddle_rsc_0_4_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_4_AWLEN(TLS_twiddle_rsc_0_4_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_4_AWADDR(TLS_twiddle_rsc_0_4_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_4_AWID(TLS_twiddle_rsc_0_4_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_4_lz(TLS_twiddle_rsc_triosy_0_4_lz);
    peaseNTT_INST.twiddle_rsc_0_5_s_tdone(TLS_twiddle_rsc_0_5_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_5_tr_write_done(TLS_twiddle_rsc_0_5_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_5_RREADY(TLS_twiddle_rsc_0_5_RREADY);
    peaseNTT_INST.twiddle_rsc_0_5_RVALID(TLS_twiddle_rsc_0_5_RVALID);
    peaseNTT_INST.twiddle_rsc_0_5_RUSER(TLS_twiddle_rsc_0_5_RUSER);
    peaseNTT_INST.twiddle_rsc_0_5_RLAST(TLS_twiddle_rsc_0_5_RLAST);
    peaseNTT_INST.twiddle_rsc_0_5_RRESP(TLS_twiddle_rsc_0_5_RRESP);
    peaseNTT_INST.twiddle_rsc_0_5_RDATA(TLS_twiddle_rsc_0_5_RDATA);
    peaseNTT_INST.twiddle_rsc_0_5_RID(TLS_twiddle_rsc_0_5_RID);
    peaseNTT_INST.twiddle_rsc_0_5_ARREADY(TLS_twiddle_rsc_0_5_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_5_ARVALID(TLS_twiddle_rsc_0_5_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_5_ARUSER(TLS_twiddle_rsc_0_5_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_5_ARREGION(TLS_twiddle_rsc_0_5_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_5_ARQOS(TLS_twiddle_rsc_0_5_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_5_ARPROT(TLS_twiddle_rsc_0_5_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_5_ARCACHE(TLS_twiddle_rsc_0_5_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_5_ARLOCK(TLS_twiddle_rsc_0_5_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_5_ARBURST(TLS_twiddle_rsc_0_5_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_5_ARSIZE(TLS_twiddle_rsc_0_5_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_5_ARLEN(TLS_twiddle_rsc_0_5_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_5_ARADDR(TLS_twiddle_rsc_0_5_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_5_ARID(TLS_twiddle_rsc_0_5_ARID);
    peaseNTT_INST.twiddle_rsc_0_5_BREADY(TLS_twiddle_rsc_0_5_BREADY);
    peaseNTT_INST.twiddle_rsc_0_5_BVALID(TLS_twiddle_rsc_0_5_BVALID);
    peaseNTT_INST.twiddle_rsc_0_5_BUSER(TLS_twiddle_rsc_0_5_BUSER);
    peaseNTT_INST.twiddle_rsc_0_5_BRESP(TLS_twiddle_rsc_0_5_BRESP);
    peaseNTT_INST.twiddle_rsc_0_5_BID(TLS_twiddle_rsc_0_5_BID);
    peaseNTT_INST.twiddle_rsc_0_5_WREADY(TLS_twiddle_rsc_0_5_WREADY);
    peaseNTT_INST.twiddle_rsc_0_5_WVALID(TLS_twiddle_rsc_0_5_WVALID);
    peaseNTT_INST.twiddle_rsc_0_5_WUSER(TLS_twiddle_rsc_0_5_WUSER);
    peaseNTT_INST.twiddle_rsc_0_5_WLAST(TLS_twiddle_rsc_0_5_WLAST);
    peaseNTT_INST.twiddle_rsc_0_5_WSTRB(TLS_twiddle_rsc_0_5_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_5_WDATA(TLS_twiddle_rsc_0_5_WDATA);
    peaseNTT_INST.twiddle_rsc_0_5_AWREADY(TLS_twiddle_rsc_0_5_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_5_AWVALID(TLS_twiddle_rsc_0_5_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_5_AWUSER(TLS_twiddle_rsc_0_5_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_5_AWREGION(TLS_twiddle_rsc_0_5_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_5_AWQOS(TLS_twiddle_rsc_0_5_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_5_AWPROT(TLS_twiddle_rsc_0_5_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_5_AWCACHE(TLS_twiddle_rsc_0_5_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_5_AWLOCK(TLS_twiddle_rsc_0_5_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_5_AWBURST(TLS_twiddle_rsc_0_5_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_5_AWSIZE(TLS_twiddle_rsc_0_5_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_5_AWLEN(TLS_twiddle_rsc_0_5_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_5_AWADDR(TLS_twiddle_rsc_0_5_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_5_AWID(TLS_twiddle_rsc_0_5_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_5_lz(TLS_twiddle_rsc_triosy_0_5_lz);
    peaseNTT_INST.twiddle_rsc_0_6_s_tdone(TLS_twiddle_rsc_0_6_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_6_tr_write_done(TLS_twiddle_rsc_0_6_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_6_RREADY(TLS_twiddle_rsc_0_6_RREADY);
    peaseNTT_INST.twiddle_rsc_0_6_RVALID(TLS_twiddle_rsc_0_6_RVALID);
    peaseNTT_INST.twiddle_rsc_0_6_RUSER(TLS_twiddle_rsc_0_6_RUSER);
    peaseNTT_INST.twiddle_rsc_0_6_RLAST(TLS_twiddle_rsc_0_6_RLAST);
    peaseNTT_INST.twiddle_rsc_0_6_RRESP(TLS_twiddle_rsc_0_6_RRESP);
    peaseNTT_INST.twiddle_rsc_0_6_RDATA(TLS_twiddle_rsc_0_6_RDATA);
    peaseNTT_INST.twiddle_rsc_0_6_RID(TLS_twiddle_rsc_0_6_RID);
    peaseNTT_INST.twiddle_rsc_0_6_ARREADY(TLS_twiddle_rsc_0_6_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_6_ARVALID(TLS_twiddle_rsc_0_6_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_6_ARUSER(TLS_twiddle_rsc_0_6_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_6_ARREGION(TLS_twiddle_rsc_0_6_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_6_ARQOS(TLS_twiddle_rsc_0_6_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_6_ARPROT(TLS_twiddle_rsc_0_6_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_6_ARCACHE(TLS_twiddle_rsc_0_6_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_6_ARLOCK(TLS_twiddle_rsc_0_6_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_6_ARBURST(TLS_twiddle_rsc_0_6_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_6_ARSIZE(TLS_twiddle_rsc_0_6_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_6_ARLEN(TLS_twiddle_rsc_0_6_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_6_ARADDR(TLS_twiddle_rsc_0_6_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_6_ARID(TLS_twiddle_rsc_0_6_ARID);
    peaseNTT_INST.twiddle_rsc_0_6_BREADY(TLS_twiddle_rsc_0_6_BREADY);
    peaseNTT_INST.twiddle_rsc_0_6_BVALID(TLS_twiddle_rsc_0_6_BVALID);
    peaseNTT_INST.twiddle_rsc_0_6_BUSER(TLS_twiddle_rsc_0_6_BUSER);
    peaseNTT_INST.twiddle_rsc_0_6_BRESP(TLS_twiddle_rsc_0_6_BRESP);
    peaseNTT_INST.twiddle_rsc_0_6_BID(TLS_twiddle_rsc_0_6_BID);
    peaseNTT_INST.twiddle_rsc_0_6_WREADY(TLS_twiddle_rsc_0_6_WREADY);
    peaseNTT_INST.twiddle_rsc_0_6_WVALID(TLS_twiddle_rsc_0_6_WVALID);
    peaseNTT_INST.twiddle_rsc_0_6_WUSER(TLS_twiddle_rsc_0_6_WUSER);
    peaseNTT_INST.twiddle_rsc_0_6_WLAST(TLS_twiddle_rsc_0_6_WLAST);
    peaseNTT_INST.twiddle_rsc_0_6_WSTRB(TLS_twiddle_rsc_0_6_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_6_WDATA(TLS_twiddle_rsc_0_6_WDATA);
    peaseNTT_INST.twiddle_rsc_0_6_AWREADY(TLS_twiddle_rsc_0_6_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_6_AWVALID(TLS_twiddle_rsc_0_6_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_6_AWUSER(TLS_twiddle_rsc_0_6_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_6_AWREGION(TLS_twiddle_rsc_0_6_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_6_AWQOS(TLS_twiddle_rsc_0_6_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_6_AWPROT(TLS_twiddle_rsc_0_6_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_6_AWCACHE(TLS_twiddle_rsc_0_6_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_6_AWLOCK(TLS_twiddle_rsc_0_6_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_6_AWBURST(TLS_twiddle_rsc_0_6_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_6_AWSIZE(TLS_twiddle_rsc_0_6_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_6_AWLEN(TLS_twiddle_rsc_0_6_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_6_AWADDR(TLS_twiddle_rsc_0_6_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_6_AWID(TLS_twiddle_rsc_0_6_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_6_lz(TLS_twiddle_rsc_triosy_0_6_lz);
    peaseNTT_INST.twiddle_rsc_0_7_s_tdone(TLS_twiddle_rsc_0_7_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_7_tr_write_done(TLS_twiddle_rsc_0_7_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_7_RREADY(TLS_twiddle_rsc_0_7_RREADY);
    peaseNTT_INST.twiddle_rsc_0_7_RVALID(TLS_twiddle_rsc_0_7_RVALID);
    peaseNTT_INST.twiddle_rsc_0_7_RUSER(TLS_twiddle_rsc_0_7_RUSER);
    peaseNTT_INST.twiddle_rsc_0_7_RLAST(TLS_twiddle_rsc_0_7_RLAST);
    peaseNTT_INST.twiddle_rsc_0_7_RRESP(TLS_twiddle_rsc_0_7_RRESP);
    peaseNTT_INST.twiddle_rsc_0_7_RDATA(TLS_twiddle_rsc_0_7_RDATA);
    peaseNTT_INST.twiddle_rsc_0_7_RID(TLS_twiddle_rsc_0_7_RID);
    peaseNTT_INST.twiddle_rsc_0_7_ARREADY(TLS_twiddle_rsc_0_7_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_7_ARVALID(TLS_twiddle_rsc_0_7_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_7_ARUSER(TLS_twiddle_rsc_0_7_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_7_ARREGION(TLS_twiddle_rsc_0_7_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_7_ARQOS(TLS_twiddle_rsc_0_7_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_7_ARPROT(TLS_twiddle_rsc_0_7_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_7_ARCACHE(TLS_twiddle_rsc_0_7_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_7_ARLOCK(TLS_twiddle_rsc_0_7_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_7_ARBURST(TLS_twiddle_rsc_0_7_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_7_ARSIZE(TLS_twiddle_rsc_0_7_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_7_ARLEN(TLS_twiddle_rsc_0_7_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_7_ARADDR(TLS_twiddle_rsc_0_7_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_7_ARID(TLS_twiddle_rsc_0_7_ARID);
    peaseNTT_INST.twiddle_rsc_0_7_BREADY(TLS_twiddle_rsc_0_7_BREADY);
    peaseNTT_INST.twiddle_rsc_0_7_BVALID(TLS_twiddle_rsc_0_7_BVALID);
    peaseNTT_INST.twiddle_rsc_0_7_BUSER(TLS_twiddle_rsc_0_7_BUSER);
    peaseNTT_INST.twiddle_rsc_0_7_BRESP(TLS_twiddle_rsc_0_7_BRESP);
    peaseNTT_INST.twiddle_rsc_0_7_BID(TLS_twiddle_rsc_0_7_BID);
    peaseNTT_INST.twiddle_rsc_0_7_WREADY(TLS_twiddle_rsc_0_7_WREADY);
    peaseNTT_INST.twiddle_rsc_0_7_WVALID(TLS_twiddle_rsc_0_7_WVALID);
    peaseNTT_INST.twiddle_rsc_0_7_WUSER(TLS_twiddle_rsc_0_7_WUSER);
    peaseNTT_INST.twiddle_rsc_0_7_WLAST(TLS_twiddle_rsc_0_7_WLAST);
    peaseNTT_INST.twiddle_rsc_0_7_WSTRB(TLS_twiddle_rsc_0_7_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_7_WDATA(TLS_twiddle_rsc_0_7_WDATA);
    peaseNTT_INST.twiddle_rsc_0_7_AWREADY(TLS_twiddle_rsc_0_7_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_7_AWVALID(TLS_twiddle_rsc_0_7_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_7_AWUSER(TLS_twiddle_rsc_0_7_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_7_AWREGION(TLS_twiddle_rsc_0_7_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_7_AWQOS(TLS_twiddle_rsc_0_7_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_7_AWPROT(TLS_twiddle_rsc_0_7_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_7_AWCACHE(TLS_twiddle_rsc_0_7_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_7_AWLOCK(TLS_twiddle_rsc_0_7_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_7_AWBURST(TLS_twiddle_rsc_0_7_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_7_AWSIZE(TLS_twiddle_rsc_0_7_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_7_AWLEN(TLS_twiddle_rsc_0_7_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_7_AWADDR(TLS_twiddle_rsc_0_7_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_7_AWID(TLS_twiddle_rsc_0_7_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_7_lz(TLS_twiddle_rsc_triosy_0_7_lz);
    peaseNTT_INST.twiddle_rsc_0_8_s_tdone(TLS_twiddle_rsc_0_8_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_8_tr_write_done(TLS_twiddle_rsc_0_8_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_8_RREADY(TLS_twiddle_rsc_0_8_RREADY);
    peaseNTT_INST.twiddle_rsc_0_8_RVALID(TLS_twiddle_rsc_0_8_RVALID);
    peaseNTT_INST.twiddle_rsc_0_8_RUSER(TLS_twiddle_rsc_0_8_RUSER);
    peaseNTT_INST.twiddle_rsc_0_8_RLAST(TLS_twiddle_rsc_0_8_RLAST);
    peaseNTT_INST.twiddle_rsc_0_8_RRESP(TLS_twiddle_rsc_0_8_RRESP);
    peaseNTT_INST.twiddle_rsc_0_8_RDATA(TLS_twiddle_rsc_0_8_RDATA);
    peaseNTT_INST.twiddle_rsc_0_8_RID(TLS_twiddle_rsc_0_8_RID);
    peaseNTT_INST.twiddle_rsc_0_8_ARREADY(TLS_twiddle_rsc_0_8_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_8_ARVALID(TLS_twiddle_rsc_0_8_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_8_ARUSER(TLS_twiddle_rsc_0_8_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_8_ARREGION(TLS_twiddle_rsc_0_8_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_8_ARQOS(TLS_twiddle_rsc_0_8_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_8_ARPROT(TLS_twiddle_rsc_0_8_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_8_ARCACHE(TLS_twiddle_rsc_0_8_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_8_ARLOCK(TLS_twiddle_rsc_0_8_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_8_ARBURST(TLS_twiddle_rsc_0_8_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_8_ARSIZE(TLS_twiddle_rsc_0_8_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_8_ARLEN(TLS_twiddle_rsc_0_8_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_8_ARADDR(TLS_twiddle_rsc_0_8_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_8_ARID(TLS_twiddle_rsc_0_8_ARID);
    peaseNTT_INST.twiddle_rsc_0_8_BREADY(TLS_twiddle_rsc_0_8_BREADY);
    peaseNTT_INST.twiddle_rsc_0_8_BVALID(TLS_twiddle_rsc_0_8_BVALID);
    peaseNTT_INST.twiddle_rsc_0_8_BUSER(TLS_twiddle_rsc_0_8_BUSER);
    peaseNTT_INST.twiddle_rsc_0_8_BRESP(TLS_twiddle_rsc_0_8_BRESP);
    peaseNTT_INST.twiddle_rsc_0_8_BID(TLS_twiddle_rsc_0_8_BID);
    peaseNTT_INST.twiddle_rsc_0_8_WREADY(TLS_twiddle_rsc_0_8_WREADY);
    peaseNTT_INST.twiddle_rsc_0_8_WVALID(TLS_twiddle_rsc_0_8_WVALID);
    peaseNTT_INST.twiddle_rsc_0_8_WUSER(TLS_twiddle_rsc_0_8_WUSER);
    peaseNTT_INST.twiddle_rsc_0_8_WLAST(TLS_twiddle_rsc_0_8_WLAST);
    peaseNTT_INST.twiddle_rsc_0_8_WSTRB(TLS_twiddle_rsc_0_8_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_8_WDATA(TLS_twiddle_rsc_0_8_WDATA);
    peaseNTT_INST.twiddle_rsc_0_8_AWREADY(TLS_twiddle_rsc_0_8_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_8_AWVALID(TLS_twiddle_rsc_0_8_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_8_AWUSER(TLS_twiddle_rsc_0_8_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_8_AWREGION(TLS_twiddle_rsc_0_8_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_8_AWQOS(TLS_twiddle_rsc_0_8_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_8_AWPROT(TLS_twiddle_rsc_0_8_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_8_AWCACHE(TLS_twiddle_rsc_0_8_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_8_AWLOCK(TLS_twiddle_rsc_0_8_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_8_AWBURST(TLS_twiddle_rsc_0_8_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_8_AWSIZE(TLS_twiddle_rsc_0_8_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_8_AWLEN(TLS_twiddle_rsc_0_8_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_8_AWADDR(TLS_twiddle_rsc_0_8_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_8_AWID(TLS_twiddle_rsc_0_8_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_8_lz(TLS_twiddle_rsc_triosy_0_8_lz);
    peaseNTT_INST.twiddle_rsc_0_9_s_tdone(TLS_twiddle_rsc_0_9_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_9_tr_write_done(TLS_twiddle_rsc_0_9_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_9_RREADY(TLS_twiddle_rsc_0_9_RREADY);
    peaseNTT_INST.twiddle_rsc_0_9_RVALID(TLS_twiddle_rsc_0_9_RVALID);
    peaseNTT_INST.twiddle_rsc_0_9_RUSER(TLS_twiddle_rsc_0_9_RUSER);
    peaseNTT_INST.twiddle_rsc_0_9_RLAST(TLS_twiddle_rsc_0_9_RLAST);
    peaseNTT_INST.twiddle_rsc_0_9_RRESP(TLS_twiddle_rsc_0_9_RRESP);
    peaseNTT_INST.twiddle_rsc_0_9_RDATA(TLS_twiddle_rsc_0_9_RDATA);
    peaseNTT_INST.twiddle_rsc_0_9_RID(TLS_twiddle_rsc_0_9_RID);
    peaseNTT_INST.twiddle_rsc_0_9_ARREADY(TLS_twiddle_rsc_0_9_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_9_ARVALID(TLS_twiddle_rsc_0_9_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_9_ARUSER(TLS_twiddle_rsc_0_9_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_9_ARREGION(TLS_twiddle_rsc_0_9_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_9_ARQOS(TLS_twiddle_rsc_0_9_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_9_ARPROT(TLS_twiddle_rsc_0_9_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_9_ARCACHE(TLS_twiddle_rsc_0_9_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_9_ARLOCK(TLS_twiddle_rsc_0_9_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_9_ARBURST(TLS_twiddle_rsc_0_9_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_9_ARSIZE(TLS_twiddle_rsc_0_9_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_9_ARLEN(TLS_twiddle_rsc_0_9_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_9_ARADDR(TLS_twiddle_rsc_0_9_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_9_ARID(TLS_twiddle_rsc_0_9_ARID);
    peaseNTT_INST.twiddle_rsc_0_9_BREADY(TLS_twiddle_rsc_0_9_BREADY);
    peaseNTT_INST.twiddle_rsc_0_9_BVALID(TLS_twiddle_rsc_0_9_BVALID);
    peaseNTT_INST.twiddle_rsc_0_9_BUSER(TLS_twiddle_rsc_0_9_BUSER);
    peaseNTT_INST.twiddle_rsc_0_9_BRESP(TLS_twiddle_rsc_0_9_BRESP);
    peaseNTT_INST.twiddle_rsc_0_9_BID(TLS_twiddle_rsc_0_9_BID);
    peaseNTT_INST.twiddle_rsc_0_9_WREADY(TLS_twiddle_rsc_0_9_WREADY);
    peaseNTT_INST.twiddle_rsc_0_9_WVALID(TLS_twiddle_rsc_0_9_WVALID);
    peaseNTT_INST.twiddle_rsc_0_9_WUSER(TLS_twiddle_rsc_0_9_WUSER);
    peaseNTT_INST.twiddle_rsc_0_9_WLAST(TLS_twiddle_rsc_0_9_WLAST);
    peaseNTT_INST.twiddle_rsc_0_9_WSTRB(TLS_twiddle_rsc_0_9_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_9_WDATA(TLS_twiddle_rsc_0_9_WDATA);
    peaseNTT_INST.twiddle_rsc_0_9_AWREADY(TLS_twiddle_rsc_0_9_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_9_AWVALID(TLS_twiddle_rsc_0_9_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_9_AWUSER(TLS_twiddle_rsc_0_9_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_9_AWREGION(TLS_twiddle_rsc_0_9_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_9_AWQOS(TLS_twiddle_rsc_0_9_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_9_AWPROT(TLS_twiddle_rsc_0_9_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_9_AWCACHE(TLS_twiddle_rsc_0_9_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_9_AWLOCK(TLS_twiddle_rsc_0_9_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_9_AWBURST(TLS_twiddle_rsc_0_9_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_9_AWSIZE(TLS_twiddle_rsc_0_9_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_9_AWLEN(TLS_twiddle_rsc_0_9_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_9_AWADDR(TLS_twiddle_rsc_0_9_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_9_AWID(TLS_twiddle_rsc_0_9_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_9_lz(TLS_twiddle_rsc_triosy_0_9_lz);
    peaseNTT_INST.twiddle_rsc_0_10_s_tdone(TLS_twiddle_rsc_0_10_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_10_tr_write_done(TLS_twiddle_rsc_0_10_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_10_RREADY(TLS_twiddle_rsc_0_10_RREADY);
    peaseNTT_INST.twiddle_rsc_0_10_RVALID(TLS_twiddle_rsc_0_10_RVALID);
    peaseNTT_INST.twiddle_rsc_0_10_RUSER(TLS_twiddle_rsc_0_10_RUSER);
    peaseNTT_INST.twiddle_rsc_0_10_RLAST(TLS_twiddle_rsc_0_10_RLAST);
    peaseNTT_INST.twiddle_rsc_0_10_RRESP(TLS_twiddle_rsc_0_10_RRESP);
    peaseNTT_INST.twiddle_rsc_0_10_RDATA(TLS_twiddle_rsc_0_10_RDATA);
    peaseNTT_INST.twiddle_rsc_0_10_RID(TLS_twiddle_rsc_0_10_RID);
    peaseNTT_INST.twiddle_rsc_0_10_ARREADY(TLS_twiddle_rsc_0_10_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_10_ARVALID(TLS_twiddle_rsc_0_10_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_10_ARUSER(TLS_twiddle_rsc_0_10_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_10_ARREGION(TLS_twiddle_rsc_0_10_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_10_ARQOS(TLS_twiddle_rsc_0_10_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_10_ARPROT(TLS_twiddle_rsc_0_10_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_10_ARCACHE(TLS_twiddle_rsc_0_10_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_10_ARLOCK(TLS_twiddle_rsc_0_10_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_10_ARBURST(TLS_twiddle_rsc_0_10_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_10_ARSIZE(TLS_twiddle_rsc_0_10_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_10_ARLEN(TLS_twiddle_rsc_0_10_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_10_ARADDR(TLS_twiddle_rsc_0_10_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_10_ARID(TLS_twiddle_rsc_0_10_ARID);
    peaseNTT_INST.twiddle_rsc_0_10_BREADY(TLS_twiddle_rsc_0_10_BREADY);
    peaseNTT_INST.twiddle_rsc_0_10_BVALID(TLS_twiddle_rsc_0_10_BVALID);
    peaseNTT_INST.twiddle_rsc_0_10_BUSER(TLS_twiddle_rsc_0_10_BUSER);
    peaseNTT_INST.twiddle_rsc_0_10_BRESP(TLS_twiddle_rsc_0_10_BRESP);
    peaseNTT_INST.twiddle_rsc_0_10_BID(TLS_twiddle_rsc_0_10_BID);
    peaseNTT_INST.twiddle_rsc_0_10_WREADY(TLS_twiddle_rsc_0_10_WREADY);
    peaseNTT_INST.twiddle_rsc_0_10_WVALID(TLS_twiddle_rsc_0_10_WVALID);
    peaseNTT_INST.twiddle_rsc_0_10_WUSER(TLS_twiddle_rsc_0_10_WUSER);
    peaseNTT_INST.twiddle_rsc_0_10_WLAST(TLS_twiddle_rsc_0_10_WLAST);
    peaseNTT_INST.twiddle_rsc_0_10_WSTRB(TLS_twiddle_rsc_0_10_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_10_WDATA(TLS_twiddle_rsc_0_10_WDATA);
    peaseNTT_INST.twiddle_rsc_0_10_AWREADY(TLS_twiddle_rsc_0_10_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_10_AWVALID(TLS_twiddle_rsc_0_10_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_10_AWUSER(TLS_twiddle_rsc_0_10_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_10_AWREGION(TLS_twiddle_rsc_0_10_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_10_AWQOS(TLS_twiddle_rsc_0_10_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_10_AWPROT(TLS_twiddle_rsc_0_10_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_10_AWCACHE(TLS_twiddle_rsc_0_10_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_10_AWLOCK(TLS_twiddle_rsc_0_10_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_10_AWBURST(TLS_twiddle_rsc_0_10_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_10_AWSIZE(TLS_twiddle_rsc_0_10_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_10_AWLEN(TLS_twiddle_rsc_0_10_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_10_AWADDR(TLS_twiddle_rsc_0_10_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_10_AWID(TLS_twiddle_rsc_0_10_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_10_lz(TLS_twiddle_rsc_triosy_0_10_lz);
    peaseNTT_INST.twiddle_rsc_0_11_s_tdone(TLS_twiddle_rsc_0_11_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_11_tr_write_done(TLS_twiddle_rsc_0_11_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_11_RREADY(TLS_twiddle_rsc_0_11_RREADY);
    peaseNTT_INST.twiddle_rsc_0_11_RVALID(TLS_twiddle_rsc_0_11_RVALID);
    peaseNTT_INST.twiddle_rsc_0_11_RUSER(TLS_twiddle_rsc_0_11_RUSER);
    peaseNTT_INST.twiddle_rsc_0_11_RLAST(TLS_twiddle_rsc_0_11_RLAST);
    peaseNTT_INST.twiddle_rsc_0_11_RRESP(TLS_twiddle_rsc_0_11_RRESP);
    peaseNTT_INST.twiddle_rsc_0_11_RDATA(TLS_twiddle_rsc_0_11_RDATA);
    peaseNTT_INST.twiddle_rsc_0_11_RID(TLS_twiddle_rsc_0_11_RID);
    peaseNTT_INST.twiddle_rsc_0_11_ARREADY(TLS_twiddle_rsc_0_11_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_11_ARVALID(TLS_twiddle_rsc_0_11_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_11_ARUSER(TLS_twiddle_rsc_0_11_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_11_ARREGION(TLS_twiddle_rsc_0_11_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_11_ARQOS(TLS_twiddle_rsc_0_11_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_11_ARPROT(TLS_twiddle_rsc_0_11_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_11_ARCACHE(TLS_twiddle_rsc_0_11_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_11_ARLOCK(TLS_twiddle_rsc_0_11_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_11_ARBURST(TLS_twiddle_rsc_0_11_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_11_ARSIZE(TLS_twiddle_rsc_0_11_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_11_ARLEN(TLS_twiddle_rsc_0_11_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_11_ARADDR(TLS_twiddle_rsc_0_11_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_11_ARID(TLS_twiddle_rsc_0_11_ARID);
    peaseNTT_INST.twiddle_rsc_0_11_BREADY(TLS_twiddle_rsc_0_11_BREADY);
    peaseNTT_INST.twiddle_rsc_0_11_BVALID(TLS_twiddle_rsc_0_11_BVALID);
    peaseNTT_INST.twiddle_rsc_0_11_BUSER(TLS_twiddle_rsc_0_11_BUSER);
    peaseNTT_INST.twiddle_rsc_0_11_BRESP(TLS_twiddle_rsc_0_11_BRESP);
    peaseNTT_INST.twiddle_rsc_0_11_BID(TLS_twiddle_rsc_0_11_BID);
    peaseNTT_INST.twiddle_rsc_0_11_WREADY(TLS_twiddle_rsc_0_11_WREADY);
    peaseNTT_INST.twiddle_rsc_0_11_WVALID(TLS_twiddle_rsc_0_11_WVALID);
    peaseNTT_INST.twiddle_rsc_0_11_WUSER(TLS_twiddle_rsc_0_11_WUSER);
    peaseNTT_INST.twiddle_rsc_0_11_WLAST(TLS_twiddle_rsc_0_11_WLAST);
    peaseNTT_INST.twiddle_rsc_0_11_WSTRB(TLS_twiddle_rsc_0_11_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_11_WDATA(TLS_twiddle_rsc_0_11_WDATA);
    peaseNTT_INST.twiddle_rsc_0_11_AWREADY(TLS_twiddle_rsc_0_11_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_11_AWVALID(TLS_twiddle_rsc_0_11_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_11_AWUSER(TLS_twiddle_rsc_0_11_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_11_AWREGION(TLS_twiddle_rsc_0_11_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_11_AWQOS(TLS_twiddle_rsc_0_11_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_11_AWPROT(TLS_twiddle_rsc_0_11_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_11_AWCACHE(TLS_twiddle_rsc_0_11_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_11_AWLOCK(TLS_twiddle_rsc_0_11_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_11_AWBURST(TLS_twiddle_rsc_0_11_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_11_AWSIZE(TLS_twiddle_rsc_0_11_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_11_AWLEN(TLS_twiddle_rsc_0_11_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_11_AWADDR(TLS_twiddle_rsc_0_11_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_11_AWID(TLS_twiddle_rsc_0_11_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_11_lz(TLS_twiddle_rsc_triosy_0_11_lz);
    peaseNTT_INST.twiddle_rsc_0_12_s_tdone(TLS_twiddle_rsc_0_12_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_12_tr_write_done(TLS_twiddle_rsc_0_12_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_12_RREADY(TLS_twiddle_rsc_0_12_RREADY);
    peaseNTT_INST.twiddle_rsc_0_12_RVALID(TLS_twiddle_rsc_0_12_RVALID);
    peaseNTT_INST.twiddle_rsc_0_12_RUSER(TLS_twiddle_rsc_0_12_RUSER);
    peaseNTT_INST.twiddle_rsc_0_12_RLAST(TLS_twiddle_rsc_0_12_RLAST);
    peaseNTT_INST.twiddle_rsc_0_12_RRESP(TLS_twiddle_rsc_0_12_RRESP);
    peaseNTT_INST.twiddle_rsc_0_12_RDATA(TLS_twiddle_rsc_0_12_RDATA);
    peaseNTT_INST.twiddle_rsc_0_12_RID(TLS_twiddle_rsc_0_12_RID);
    peaseNTT_INST.twiddle_rsc_0_12_ARREADY(TLS_twiddle_rsc_0_12_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_12_ARVALID(TLS_twiddle_rsc_0_12_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_12_ARUSER(TLS_twiddle_rsc_0_12_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_12_ARREGION(TLS_twiddle_rsc_0_12_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_12_ARQOS(TLS_twiddle_rsc_0_12_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_12_ARPROT(TLS_twiddle_rsc_0_12_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_12_ARCACHE(TLS_twiddle_rsc_0_12_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_12_ARLOCK(TLS_twiddle_rsc_0_12_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_12_ARBURST(TLS_twiddle_rsc_0_12_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_12_ARSIZE(TLS_twiddle_rsc_0_12_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_12_ARLEN(TLS_twiddle_rsc_0_12_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_12_ARADDR(TLS_twiddle_rsc_0_12_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_12_ARID(TLS_twiddle_rsc_0_12_ARID);
    peaseNTT_INST.twiddle_rsc_0_12_BREADY(TLS_twiddle_rsc_0_12_BREADY);
    peaseNTT_INST.twiddle_rsc_0_12_BVALID(TLS_twiddle_rsc_0_12_BVALID);
    peaseNTT_INST.twiddle_rsc_0_12_BUSER(TLS_twiddle_rsc_0_12_BUSER);
    peaseNTT_INST.twiddle_rsc_0_12_BRESP(TLS_twiddle_rsc_0_12_BRESP);
    peaseNTT_INST.twiddle_rsc_0_12_BID(TLS_twiddle_rsc_0_12_BID);
    peaseNTT_INST.twiddle_rsc_0_12_WREADY(TLS_twiddle_rsc_0_12_WREADY);
    peaseNTT_INST.twiddle_rsc_0_12_WVALID(TLS_twiddle_rsc_0_12_WVALID);
    peaseNTT_INST.twiddle_rsc_0_12_WUSER(TLS_twiddle_rsc_0_12_WUSER);
    peaseNTT_INST.twiddle_rsc_0_12_WLAST(TLS_twiddle_rsc_0_12_WLAST);
    peaseNTT_INST.twiddle_rsc_0_12_WSTRB(TLS_twiddle_rsc_0_12_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_12_WDATA(TLS_twiddle_rsc_0_12_WDATA);
    peaseNTT_INST.twiddle_rsc_0_12_AWREADY(TLS_twiddle_rsc_0_12_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_12_AWVALID(TLS_twiddle_rsc_0_12_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_12_AWUSER(TLS_twiddle_rsc_0_12_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_12_AWREGION(TLS_twiddle_rsc_0_12_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_12_AWQOS(TLS_twiddle_rsc_0_12_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_12_AWPROT(TLS_twiddle_rsc_0_12_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_12_AWCACHE(TLS_twiddle_rsc_0_12_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_12_AWLOCK(TLS_twiddle_rsc_0_12_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_12_AWBURST(TLS_twiddle_rsc_0_12_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_12_AWSIZE(TLS_twiddle_rsc_0_12_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_12_AWLEN(TLS_twiddle_rsc_0_12_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_12_AWADDR(TLS_twiddle_rsc_0_12_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_12_AWID(TLS_twiddle_rsc_0_12_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_12_lz(TLS_twiddle_rsc_triosy_0_12_lz);
    peaseNTT_INST.twiddle_rsc_0_13_s_tdone(TLS_twiddle_rsc_0_13_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_13_tr_write_done(TLS_twiddle_rsc_0_13_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_13_RREADY(TLS_twiddle_rsc_0_13_RREADY);
    peaseNTT_INST.twiddle_rsc_0_13_RVALID(TLS_twiddle_rsc_0_13_RVALID);
    peaseNTT_INST.twiddle_rsc_0_13_RUSER(TLS_twiddle_rsc_0_13_RUSER);
    peaseNTT_INST.twiddle_rsc_0_13_RLAST(TLS_twiddle_rsc_0_13_RLAST);
    peaseNTT_INST.twiddle_rsc_0_13_RRESP(TLS_twiddle_rsc_0_13_RRESP);
    peaseNTT_INST.twiddle_rsc_0_13_RDATA(TLS_twiddle_rsc_0_13_RDATA);
    peaseNTT_INST.twiddle_rsc_0_13_RID(TLS_twiddle_rsc_0_13_RID);
    peaseNTT_INST.twiddle_rsc_0_13_ARREADY(TLS_twiddle_rsc_0_13_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_13_ARVALID(TLS_twiddle_rsc_0_13_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_13_ARUSER(TLS_twiddle_rsc_0_13_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_13_ARREGION(TLS_twiddle_rsc_0_13_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_13_ARQOS(TLS_twiddle_rsc_0_13_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_13_ARPROT(TLS_twiddle_rsc_0_13_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_13_ARCACHE(TLS_twiddle_rsc_0_13_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_13_ARLOCK(TLS_twiddle_rsc_0_13_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_13_ARBURST(TLS_twiddle_rsc_0_13_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_13_ARSIZE(TLS_twiddle_rsc_0_13_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_13_ARLEN(TLS_twiddle_rsc_0_13_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_13_ARADDR(TLS_twiddle_rsc_0_13_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_13_ARID(TLS_twiddle_rsc_0_13_ARID);
    peaseNTT_INST.twiddle_rsc_0_13_BREADY(TLS_twiddle_rsc_0_13_BREADY);
    peaseNTT_INST.twiddle_rsc_0_13_BVALID(TLS_twiddle_rsc_0_13_BVALID);
    peaseNTT_INST.twiddle_rsc_0_13_BUSER(TLS_twiddle_rsc_0_13_BUSER);
    peaseNTT_INST.twiddle_rsc_0_13_BRESP(TLS_twiddle_rsc_0_13_BRESP);
    peaseNTT_INST.twiddle_rsc_0_13_BID(TLS_twiddle_rsc_0_13_BID);
    peaseNTT_INST.twiddle_rsc_0_13_WREADY(TLS_twiddle_rsc_0_13_WREADY);
    peaseNTT_INST.twiddle_rsc_0_13_WVALID(TLS_twiddle_rsc_0_13_WVALID);
    peaseNTT_INST.twiddle_rsc_0_13_WUSER(TLS_twiddle_rsc_0_13_WUSER);
    peaseNTT_INST.twiddle_rsc_0_13_WLAST(TLS_twiddle_rsc_0_13_WLAST);
    peaseNTT_INST.twiddle_rsc_0_13_WSTRB(TLS_twiddle_rsc_0_13_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_13_WDATA(TLS_twiddle_rsc_0_13_WDATA);
    peaseNTT_INST.twiddle_rsc_0_13_AWREADY(TLS_twiddle_rsc_0_13_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_13_AWVALID(TLS_twiddle_rsc_0_13_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_13_AWUSER(TLS_twiddle_rsc_0_13_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_13_AWREGION(TLS_twiddle_rsc_0_13_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_13_AWQOS(TLS_twiddle_rsc_0_13_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_13_AWPROT(TLS_twiddle_rsc_0_13_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_13_AWCACHE(TLS_twiddle_rsc_0_13_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_13_AWLOCK(TLS_twiddle_rsc_0_13_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_13_AWBURST(TLS_twiddle_rsc_0_13_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_13_AWSIZE(TLS_twiddle_rsc_0_13_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_13_AWLEN(TLS_twiddle_rsc_0_13_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_13_AWADDR(TLS_twiddle_rsc_0_13_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_13_AWID(TLS_twiddle_rsc_0_13_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_13_lz(TLS_twiddle_rsc_triosy_0_13_lz);
    peaseNTT_INST.twiddle_rsc_0_14_s_tdone(TLS_twiddle_rsc_0_14_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_14_tr_write_done(TLS_twiddle_rsc_0_14_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_14_RREADY(TLS_twiddle_rsc_0_14_RREADY);
    peaseNTT_INST.twiddle_rsc_0_14_RVALID(TLS_twiddle_rsc_0_14_RVALID);
    peaseNTT_INST.twiddle_rsc_0_14_RUSER(TLS_twiddle_rsc_0_14_RUSER);
    peaseNTT_INST.twiddle_rsc_0_14_RLAST(TLS_twiddle_rsc_0_14_RLAST);
    peaseNTT_INST.twiddle_rsc_0_14_RRESP(TLS_twiddle_rsc_0_14_RRESP);
    peaseNTT_INST.twiddle_rsc_0_14_RDATA(TLS_twiddle_rsc_0_14_RDATA);
    peaseNTT_INST.twiddle_rsc_0_14_RID(TLS_twiddle_rsc_0_14_RID);
    peaseNTT_INST.twiddle_rsc_0_14_ARREADY(TLS_twiddle_rsc_0_14_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_14_ARVALID(TLS_twiddle_rsc_0_14_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_14_ARUSER(TLS_twiddle_rsc_0_14_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_14_ARREGION(TLS_twiddle_rsc_0_14_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_14_ARQOS(TLS_twiddle_rsc_0_14_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_14_ARPROT(TLS_twiddle_rsc_0_14_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_14_ARCACHE(TLS_twiddle_rsc_0_14_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_14_ARLOCK(TLS_twiddle_rsc_0_14_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_14_ARBURST(TLS_twiddle_rsc_0_14_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_14_ARSIZE(TLS_twiddle_rsc_0_14_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_14_ARLEN(TLS_twiddle_rsc_0_14_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_14_ARADDR(TLS_twiddle_rsc_0_14_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_14_ARID(TLS_twiddle_rsc_0_14_ARID);
    peaseNTT_INST.twiddle_rsc_0_14_BREADY(TLS_twiddle_rsc_0_14_BREADY);
    peaseNTT_INST.twiddle_rsc_0_14_BVALID(TLS_twiddle_rsc_0_14_BVALID);
    peaseNTT_INST.twiddle_rsc_0_14_BUSER(TLS_twiddle_rsc_0_14_BUSER);
    peaseNTT_INST.twiddle_rsc_0_14_BRESP(TLS_twiddle_rsc_0_14_BRESP);
    peaseNTT_INST.twiddle_rsc_0_14_BID(TLS_twiddle_rsc_0_14_BID);
    peaseNTT_INST.twiddle_rsc_0_14_WREADY(TLS_twiddle_rsc_0_14_WREADY);
    peaseNTT_INST.twiddle_rsc_0_14_WVALID(TLS_twiddle_rsc_0_14_WVALID);
    peaseNTT_INST.twiddle_rsc_0_14_WUSER(TLS_twiddle_rsc_0_14_WUSER);
    peaseNTT_INST.twiddle_rsc_0_14_WLAST(TLS_twiddle_rsc_0_14_WLAST);
    peaseNTT_INST.twiddle_rsc_0_14_WSTRB(TLS_twiddle_rsc_0_14_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_14_WDATA(TLS_twiddle_rsc_0_14_WDATA);
    peaseNTT_INST.twiddle_rsc_0_14_AWREADY(TLS_twiddle_rsc_0_14_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_14_AWVALID(TLS_twiddle_rsc_0_14_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_14_AWUSER(TLS_twiddle_rsc_0_14_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_14_AWREGION(TLS_twiddle_rsc_0_14_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_14_AWQOS(TLS_twiddle_rsc_0_14_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_14_AWPROT(TLS_twiddle_rsc_0_14_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_14_AWCACHE(TLS_twiddle_rsc_0_14_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_14_AWLOCK(TLS_twiddle_rsc_0_14_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_14_AWBURST(TLS_twiddle_rsc_0_14_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_14_AWSIZE(TLS_twiddle_rsc_0_14_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_14_AWLEN(TLS_twiddle_rsc_0_14_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_14_AWADDR(TLS_twiddle_rsc_0_14_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_14_AWID(TLS_twiddle_rsc_0_14_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_14_lz(TLS_twiddle_rsc_triosy_0_14_lz);
    peaseNTT_INST.twiddle_rsc_0_15_s_tdone(TLS_twiddle_rsc_0_15_s_tdone);
    peaseNTT_INST.twiddle_rsc_0_15_tr_write_done(TLS_twiddle_rsc_0_15_tr_write_done);
    peaseNTT_INST.twiddle_rsc_0_15_RREADY(TLS_twiddle_rsc_0_15_RREADY);
    peaseNTT_INST.twiddle_rsc_0_15_RVALID(TLS_twiddle_rsc_0_15_RVALID);
    peaseNTT_INST.twiddle_rsc_0_15_RUSER(TLS_twiddle_rsc_0_15_RUSER);
    peaseNTT_INST.twiddle_rsc_0_15_RLAST(TLS_twiddle_rsc_0_15_RLAST);
    peaseNTT_INST.twiddle_rsc_0_15_RRESP(TLS_twiddle_rsc_0_15_RRESP);
    peaseNTT_INST.twiddle_rsc_0_15_RDATA(TLS_twiddle_rsc_0_15_RDATA);
    peaseNTT_INST.twiddle_rsc_0_15_RID(TLS_twiddle_rsc_0_15_RID);
    peaseNTT_INST.twiddle_rsc_0_15_ARREADY(TLS_twiddle_rsc_0_15_ARREADY);
    peaseNTT_INST.twiddle_rsc_0_15_ARVALID(TLS_twiddle_rsc_0_15_ARVALID);
    peaseNTT_INST.twiddle_rsc_0_15_ARUSER(TLS_twiddle_rsc_0_15_ARUSER);
    peaseNTT_INST.twiddle_rsc_0_15_ARREGION(TLS_twiddle_rsc_0_15_ARREGION);
    peaseNTT_INST.twiddle_rsc_0_15_ARQOS(TLS_twiddle_rsc_0_15_ARQOS);
    peaseNTT_INST.twiddle_rsc_0_15_ARPROT(TLS_twiddle_rsc_0_15_ARPROT);
    peaseNTT_INST.twiddle_rsc_0_15_ARCACHE(TLS_twiddle_rsc_0_15_ARCACHE);
    peaseNTT_INST.twiddle_rsc_0_15_ARLOCK(TLS_twiddle_rsc_0_15_ARLOCK);
    peaseNTT_INST.twiddle_rsc_0_15_ARBURST(TLS_twiddle_rsc_0_15_ARBURST);
    peaseNTT_INST.twiddle_rsc_0_15_ARSIZE(TLS_twiddle_rsc_0_15_ARSIZE);
    peaseNTT_INST.twiddle_rsc_0_15_ARLEN(TLS_twiddle_rsc_0_15_ARLEN);
    peaseNTT_INST.twiddle_rsc_0_15_ARADDR(TLS_twiddle_rsc_0_15_ARADDR);
    peaseNTT_INST.twiddle_rsc_0_15_ARID(TLS_twiddle_rsc_0_15_ARID);
    peaseNTT_INST.twiddle_rsc_0_15_BREADY(TLS_twiddle_rsc_0_15_BREADY);
    peaseNTT_INST.twiddle_rsc_0_15_BVALID(TLS_twiddle_rsc_0_15_BVALID);
    peaseNTT_INST.twiddle_rsc_0_15_BUSER(TLS_twiddle_rsc_0_15_BUSER);
    peaseNTT_INST.twiddle_rsc_0_15_BRESP(TLS_twiddle_rsc_0_15_BRESP);
    peaseNTT_INST.twiddle_rsc_0_15_BID(TLS_twiddle_rsc_0_15_BID);
    peaseNTT_INST.twiddle_rsc_0_15_WREADY(TLS_twiddle_rsc_0_15_WREADY);
    peaseNTT_INST.twiddle_rsc_0_15_WVALID(TLS_twiddle_rsc_0_15_WVALID);
    peaseNTT_INST.twiddle_rsc_0_15_WUSER(TLS_twiddle_rsc_0_15_WUSER);
    peaseNTT_INST.twiddle_rsc_0_15_WLAST(TLS_twiddle_rsc_0_15_WLAST);
    peaseNTT_INST.twiddle_rsc_0_15_WSTRB(TLS_twiddle_rsc_0_15_WSTRB);
    peaseNTT_INST.twiddle_rsc_0_15_WDATA(TLS_twiddle_rsc_0_15_WDATA);
    peaseNTT_INST.twiddle_rsc_0_15_AWREADY(TLS_twiddle_rsc_0_15_AWREADY);
    peaseNTT_INST.twiddle_rsc_0_15_AWVALID(TLS_twiddle_rsc_0_15_AWVALID);
    peaseNTT_INST.twiddle_rsc_0_15_AWUSER(TLS_twiddle_rsc_0_15_AWUSER);
    peaseNTT_INST.twiddle_rsc_0_15_AWREGION(TLS_twiddle_rsc_0_15_AWREGION);
    peaseNTT_INST.twiddle_rsc_0_15_AWQOS(TLS_twiddle_rsc_0_15_AWQOS);
    peaseNTT_INST.twiddle_rsc_0_15_AWPROT(TLS_twiddle_rsc_0_15_AWPROT);
    peaseNTT_INST.twiddle_rsc_0_15_AWCACHE(TLS_twiddle_rsc_0_15_AWCACHE);
    peaseNTT_INST.twiddle_rsc_0_15_AWLOCK(TLS_twiddle_rsc_0_15_AWLOCK);
    peaseNTT_INST.twiddle_rsc_0_15_AWBURST(TLS_twiddle_rsc_0_15_AWBURST);
    peaseNTT_INST.twiddle_rsc_0_15_AWSIZE(TLS_twiddle_rsc_0_15_AWSIZE);
    peaseNTT_INST.twiddle_rsc_0_15_AWLEN(TLS_twiddle_rsc_0_15_AWLEN);
    peaseNTT_INST.twiddle_rsc_0_15_AWADDR(TLS_twiddle_rsc_0_15_AWADDR);
    peaseNTT_INST.twiddle_rsc_0_15_AWID(TLS_twiddle_rsc_0_15_AWID);
    peaseNTT_INST.twiddle_rsc_triosy_0_15_lz(TLS_twiddle_rsc_triosy_0_15_lz);
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
    peaseNTT_INST.twiddle_h_rsc_0_4_s_tdone(TLS_twiddle_h_rsc_0_4_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_4_tr_write_done(TLS_twiddle_h_rsc_0_4_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_4_RREADY(TLS_twiddle_h_rsc_0_4_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_4_RVALID(TLS_twiddle_h_rsc_0_4_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_4_RUSER(TLS_twiddle_h_rsc_0_4_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_4_RLAST(TLS_twiddle_h_rsc_0_4_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_4_RRESP(TLS_twiddle_h_rsc_0_4_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_4_RDATA(TLS_twiddle_h_rsc_0_4_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_4_RID(TLS_twiddle_h_rsc_0_4_RID);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARREADY(TLS_twiddle_h_rsc_0_4_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARVALID(TLS_twiddle_h_rsc_0_4_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARUSER(TLS_twiddle_h_rsc_0_4_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARREGION(TLS_twiddle_h_rsc_0_4_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARQOS(TLS_twiddle_h_rsc_0_4_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARPROT(TLS_twiddle_h_rsc_0_4_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARCACHE(TLS_twiddle_h_rsc_0_4_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARLOCK(TLS_twiddle_h_rsc_0_4_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARBURST(TLS_twiddle_h_rsc_0_4_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARSIZE(TLS_twiddle_h_rsc_0_4_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARLEN(TLS_twiddle_h_rsc_0_4_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARADDR(TLS_twiddle_h_rsc_0_4_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_4_ARID(TLS_twiddle_h_rsc_0_4_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_4_BREADY(TLS_twiddle_h_rsc_0_4_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_4_BVALID(TLS_twiddle_h_rsc_0_4_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_4_BUSER(TLS_twiddle_h_rsc_0_4_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_4_BRESP(TLS_twiddle_h_rsc_0_4_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_4_BID(TLS_twiddle_h_rsc_0_4_BID);
    peaseNTT_INST.twiddle_h_rsc_0_4_WREADY(TLS_twiddle_h_rsc_0_4_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_4_WVALID(TLS_twiddle_h_rsc_0_4_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_4_WUSER(TLS_twiddle_h_rsc_0_4_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_4_WLAST(TLS_twiddle_h_rsc_0_4_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_4_WSTRB(TLS_twiddle_h_rsc_0_4_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_4_WDATA(TLS_twiddle_h_rsc_0_4_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWREADY(TLS_twiddle_h_rsc_0_4_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWVALID(TLS_twiddle_h_rsc_0_4_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWUSER(TLS_twiddle_h_rsc_0_4_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWREGION(TLS_twiddle_h_rsc_0_4_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWQOS(TLS_twiddle_h_rsc_0_4_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWPROT(TLS_twiddle_h_rsc_0_4_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWCACHE(TLS_twiddle_h_rsc_0_4_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWLOCK(TLS_twiddle_h_rsc_0_4_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWBURST(TLS_twiddle_h_rsc_0_4_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWSIZE(TLS_twiddle_h_rsc_0_4_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWLEN(TLS_twiddle_h_rsc_0_4_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWADDR(TLS_twiddle_h_rsc_0_4_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_4_AWID(TLS_twiddle_h_rsc_0_4_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_4_lz(TLS_twiddle_h_rsc_triosy_0_4_lz);
    peaseNTT_INST.twiddle_h_rsc_0_5_s_tdone(TLS_twiddle_h_rsc_0_5_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_5_tr_write_done(TLS_twiddle_h_rsc_0_5_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_5_RREADY(TLS_twiddle_h_rsc_0_5_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_5_RVALID(TLS_twiddle_h_rsc_0_5_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_5_RUSER(TLS_twiddle_h_rsc_0_5_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_5_RLAST(TLS_twiddle_h_rsc_0_5_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_5_RRESP(TLS_twiddle_h_rsc_0_5_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_5_RDATA(TLS_twiddle_h_rsc_0_5_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_5_RID(TLS_twiddle_h_rsc_0_5_RID);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARREADY(TLS_twiddle_h_rsc_0_5_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARVALID(TLS_twiddle_h_rsc_0_5_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARUSER(TLS_twiddle_h_rsc_0_5_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARREGION(TLS_twiddle_h_rsc_0_5_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARQOS(TLS_twiddle_h_rsc_0_5_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARPROT(TLS_twiddle_h_rsc_0_5_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARCACHE(TLS_twiddle_h_rsc_0_5_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARLOCK(TLS_twiddle_h_rsc_0_5_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARBURST(TLS_twiddle_h_rsc_0_5_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARSIZE(TLS_twiddle_h_rsc_0_5_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARLEN(TLS_twiddle_h_rsc_0_5_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARADDR(TLS_twiddle_h_rsc_0_5_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_5_ARID(TLS_twiddle_h_rsc_0_5_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_5_BREADY(TLS_twiddle_h_rsc_0_5_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_5_BVALID(TLS_twiddle_h_rsc_0_5_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_5_BUSER(TLS_twiddle_h_rsc_0_5_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_5_BRESP(TLS_twiddle_h_rsc_0_5_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_5_BID(TLS_twiddle_h_rsc_0_5_BID);
    peaseNTT_INST.twiddle_h_rsc_0_5_WREADY(TLS_twiddle_h_rsc_0_5_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_5_WVALID(TLS_twiddle_h_rsc_0_5_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_5_WUSER(TLS_twiddle_h_rsc_0_5_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_5_WLAST(TLS_twiddle_h_rsc_0_5_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_5_WSTRB(TLS_twiddle_h_rsc_0_5_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_5_WDATA(TLS_twiddle_h_rsc_0_5_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWREADY(TLS_twiddle_h_rsc_0_5_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWVALID(TLS_twiddle_h_rsc_0_5_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWUSER(TLS_twiddle_h_rsc_0_5_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWREGION(TLS_twiddle_h_rsc_0_5_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWQOS(TLS_twiddle_h_rsc_0_5_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWPROT(TLS_twiddle_h_rsc_0_5_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWCACHE(TLS_twiddle_h_rsc_0_5_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWLOCK(TLS_twiddle_h_rsc_0_5_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWBURST(TLS_twiddle_h_rsc_0_5_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWSIZE(TLS_twiddle_h_rsc_0_5_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWLEN(TLS_twiddle_h_rsc_0_5_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWADDR(TLS_twiddle_h_rsc_0_5_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_5_AWID(TLS_twiddle_h_rsc_0_5_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_5_lz(TLS_twiddle_h_rsc_triosy_0_5_lz);
    peaseNTT_INST.twiddle_h_rsc_0_6_s_tdone(TLS_twiddle_h_rsc_0_6_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_6_tr_write_done(TLS_twiddle_h_rsc_0_6_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_6_RREADY(TLS_twiddle_h_rsc_0_6_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_6_RVALID(TLS_twiddle_h_rsc_0_6_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_6_RUSER(TLS_twiddle_h_rsc_0_6_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_6_RLAST(TLS_twiddle_h_rsc_0_6_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_6_RRESP(TLS_twiddle_h_rsc_0_6_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_6_RDATA(TLS_twiddle_h_rsc_0_6_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_6_RID(TLS_twiddle_h_rsc_0_6_RID);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARREADY(TLS_twiddle_h_rsc_0_6_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARVALID(TLS_twiddle_h_rsc_0_6_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARUSER(TLS_twiddle_h_rsc_0_6_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARREGION(TLS_twiddle_h_rsc_0_6_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARQOS(TLS_twiddle_h_rsc_0_6_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARPROT(TLS_twiddle_h_rsc_0_6_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARCACHE(TLS_twiddle_h_rsc_0_6_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARLOCK(TLS_twiddle_h_rsc_0_6_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARBURST(TLS_twiddle_h_rsc_0_6_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARSIZE(TLS_twiddle_h_rsc_0_6_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARLEN(TLS_twiddle_h_rsc_0_6_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARADDR(TLS_twiddle_h_rsc_0_6_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_6_ARID(TLS_twiddle_h_rsc_0_6_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_6_BREADY(TLS_twiddle_h_rsc_0_6_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_6_BVALID(TLS_twiddle_h_rsc_0_6_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_6_BUSER(TLS_twiddle_h_rsc_0_6_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_6_BRESP(TLS_twiddle_h_rsc_0_6_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_6_BID(TLS_twiddle_h_rsc_0_6_BID);
    peaseNTT_INST.twiddle_h_rsc_0_6_WREADY(TLS_twiddle_h_rsc_0_6_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_6_WVALID(TLS_twiddle_h_rsc_0_6_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_6_WUSER(TLS_twiddle_h_rsc_0_6_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_6_WLAST(TLS_twiddle_h_rsc_0_6_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_6_WSTRB(TLS_twiddle_h_rsc_0_6_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_6_WDATA(TLS_twiddle_h_rsc_0_6_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWREADY(TLS_twiddle_h_rsc_0_6_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWVALID(TLS_twiddle_h_rsc_0_6_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWUSER(TLS_twiddle_h_rsc_0_6_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWREGION(TLS_twiddle_h_rsc_0_6_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWQOS(TLS_twiddle_h_rsc_0_6_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWPROT(TLS_twiddle_h_rsc_0_6_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWCACHE(TLS_twiddle_h_rsc_0_6_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWLOCK(TLS_twiddle_h_rsc_0_6_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWBURST(TLS_twiddle_h_rsc_0_6_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWSIZE(TLS_twiddle_h_rsc_0_6_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWLEN(TLS_twiddle_h_rsc_0_6_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWADDR(TLS_twiddle_h_rsc_0_6_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_6_AWID(TLS_twiddle_h_rsc_0_6_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_6_lz(TLS_twiddle_h_rsc_triosy_0_6_lz);
    peaseNTT_INST.twiddle_h_rsc_0_7_s_tdone(TLS_twiddle_h_rsc_0_7_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_7_tr_write_done(TLS_twiddle_h_rsc_0_7_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_7_RREADY(TLS_twiddle_h_rsc_0_7_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_7_RVALID(TLS_twiddle_h_rsc_0_7_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_7_RUSER(TLS_twiddle_h_rsc_0_7_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_7_RLAST(TLS_twiddle_h_rsc_0_7_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_7_RRESP(TLS_twiddle_h_rsc_0_7_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_7_RDATA(TLS_twiddle_h_rsc_0_7_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_7_RID(TLS_twiddle_h_rsc_0_7_RID);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARREADY(TLS_twiddle_h_rsc_0_7_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARVALID(TLS_twiddle_h_rsc_0_7_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARUSER(TLS_twiddle_h_rsc_0_7_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARREGION(TLS_twiddle_h_rsc_0_7_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARQOS(TLS_twiddle_h_rsc_0_7_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARPROT(TLS_twiddle_h_rsc_0_7_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARCACHE(TLS_twiddle_h_rsc_0_7_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARLOCK(TLS_twiddle_h_rsc_0_7_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARBURST(TLS_twiddle_h_rsc_0_7_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARSIZE(TLS_twiddle_h_rsc_0_7_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARLEN(TLS_twiddle_h_rsc_0_7_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARADDR(TLS_twiddle_h_rsc_0_7_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_7_ARID(TLS_twiddle_h_rsc_0_7_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_7_BREADY(TLS_twiddle_h_rsc_0_7_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_7_BVALID(TLS_twiddle_h_rsc_0_7_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_7_BUSER(TLS_twiddle_h_rsc_0_7_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_7_BRESP(TLS_twiddle_h_rsc_0_7_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_7_BID(TLS_twiddle_h_rsc_0_7_BID);
    peaseNTT_INST.twiddle_h_rsc_0_7_WREADY(TLS_twiddle_h_rsc_0_7_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_7_WVALID(TLS_twiddle_h_rsc_0_7_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_7_WUSER(TLS_twiddle_h_rsc_0_7_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_7_WLAST(TLS_twiddle_h_rsc_0_7_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_7_WSTRB(TLS_twiddle_h_rsc_0_7_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_7_WDATA(TLS_twiddle_h_rsc_0_7_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWREADY(TLS_twiddle_h_rsc_0_7_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWVALID(TLS_twiddle_h_rsc_0_7_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWUSER(TLS_twiddle_h_rsc_0_7_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWREGION(TLS_twiddle_h_rsc_0_7_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWQOS(TLS_twiddle_h_rsc_0_7_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWPROT(TLS_twiddle_h_rsc_0_7_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWCACHE(TLS_twiddle_h_rsc_0_7_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWLOCK(TLS_twiddle_h_rsc_0_7_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWBURST(TLS_twiddle_h_rsc_0_7_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWSIZE(TLS_twiddle_h_rsc_0_7_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWLEN(TLS_twiddle_h_rsc_0_7_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWADDR(TLS_twiddle_h_rsc_0_7_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_7_AWID(TLS_twiddle_h_rsc_0_7_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_7_lz(TLS_twiddle_h_rsc_triosy_0_7_lz);
    peaseNTT_INST.twiddle_h_rsc_0_8_s_tdone(TLS_twiddle_h_rsc_0_8_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_8_tr_write_done(TLS_twiddle_h_rsc_0_8_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_8_RREADY(TLS_twiddle_h_rsc_0_8_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_8_RVALID(TLS_twiddle_h_rsc_0_8_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_8_RUSER(TLS_twiddle_h_rsc_0_8_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_8_RLAST(TLS_twiddle_h_rsc_0_8_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_8_RRESP(TLS_twiddle_h_rsc_0_8_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_8_RDATA(TLS_twiddle_h_rsc_0_8_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_8_RID(TLS_twiddle_h_rsc_0_8_RID);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARREADY(TLS_twiddle_h_rsc_0_8_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARVALID(TLS_twiddle_h_rsc_0_8_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARUSER(TLS_twiddle_h_rsc_0_8_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARREGION(TLS_twiddle_h_rsc_0_8_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARQOS(TLS_twiddle_h_rsc_0_8_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARPROT(TLS_twiddle_h_rsc_0_8_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARCACHE(TLS_twiddle_h_rsc_0_8_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARLOCK(TLS_twiddle_h_rsc_0_8_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARBURST(TLS_twiddle_h_rsc_0_8_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARSIZE(TLS_twiddle_h_rsc_0_8_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARLEN(TLS_twiddle_h_rsc_0_8_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARADDR(TLS_twiddle_h_rsc_0_8_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_8_ARID(TLS_twiddle_h_rsc_0_8_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_8_BREADY(TLS_twiddle_h_rsc_0_8_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_8_BVALID(TLS_twiddle_h_rsc_0_8_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_8_BUSER(TLS_twiddle_h_rsc_0_8_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_8_BRESP(TLS_twiddle_h_rsc_0_8_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_8_BID(TLS_twiddle_h_rsc_0_8_BID);
    peaseNTT_INST.twiddle_h_rsc_0_8_WREADY(TLS_twiddle_h_rsc_0_8_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_8_WVALID(TLS_twiddle_h_rsc_0_8_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_8_WUSER(TLS_twiddle_h_rsc_0_8_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_8_WLAST(TLS_twiddle_h_rsc_0_8_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_8_WSTRB(TLS_twiddle_h_rsc_0_8_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_8_WDATA(TLS_twiddle_h_rsc_0_8_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWREADY(TLS_twiddle_h_rsc_0_8_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWVALID(TLS_twiddle_h_rsc_0_8_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWUSER(TLS_twiddle_h_rsc_0_8_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWREGION(TLS_twiddle_h_rsc_0_8_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWQOS(TLS_twiddle_h_rsc_0_8_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWPROT(TLS_twiddle_h_rsc_0_8_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWCACHE(TLS_twiddle_h_rsc_0_8_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWLOCK(TLS_twiddle_h_rsc_0_8_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWBURST(TLS_twiddle_h_rsc_0_8_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWSIZE(TLS_twiddle_h_rsc_0_8_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWLEN(TLS_twiddle_h_rsc_0_8_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWADDR(TLS_twiddle_h_rsc_0_8_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_8_AWID(TLS_twiddle_h_rsc_0_8_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_8_lz(TLS_twiddle_h_rsc_triosy_0_8_lz);
    peaseNTT_INST.twiddle_h_rsc_0_9_s_tdone(TLS_twiddle_h_rsc_0_9_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_9_tr_write_done(TLS_twiddle_h_rsc_0_9_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_9_RREADY(TLS_twiddle_h_rsc_0_9_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_9_RVALID(TLS_twiddle_h_rsc_0_9_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_9_RUSER(TLS_twiddle_h_rsc_0_9_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_9_RLAST(TLS_twiddle_h_rsc_0_9_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_9_RRESP(TLS_twiddle_h_rsc_0_9_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_9_RDATA(TLS_twiddle_h_rsc_0_9_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_9_RID(TLS_twiddle_h_rsc_0_9_RID);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARREADY(TLS_twiddle_h_rsc_0_9_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARVALID(TLS_twiddle_h_rsc_0_9_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARUSER(TLS_twiddle_h_rsc_0_9_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARREGION(TLS_twiddle_h_rsc_0_9_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARQOS(TLS_twiddle_h_rsc_0_9_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARPROT(TLS_twiddle_h_rsc_0_9_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARCACHE(TLS_twiddle_h_rsc_0_9_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARLOCK(TLS_twiddle_h_rsc_0_9_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARBURST(TLS_twiddle_h_rsc_0_9_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARSIZE(TLS_twiddle_h_rsc_0_9_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARLEN(TLS_twiddle_h_rsc_0_9_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARADDR(TLS_twiddle_h_rsc_0_9_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_9_ARID(TLS_twiddle_h_rsc_0_9_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_9_BREADY(TLS_twiddle_h_rsc_0_9_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_9_BVALID(TLS_twiddle_h_rsc_0_9_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_9_BUSER(TLS_twiddle_h_rsc_0_9_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_9_BRESP(TLS_twiddle_h_rsc_0_9_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_9_BID(TLS_twiddle_h_rsc_0_9_BID);
    peaseNTT_INST.twiddle_h_rsc_0_9_WREADY(TLS_twiddle_h_rsc_0_9_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_9_WVALID(TLS_twiddle_h_rsc_0_9_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_9_WUSER(TLS_twiddle_h_rsc_0_9_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_9_WLAST(TLS_twiddle_h_rsc_0_9_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_9_WSTRB(TLS_twiddle_h_rsc_0_9_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_9_WDATA(TLS_twiddle_h_rsc_0_9_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWREADY(TLS_twiddle_h_rsc_0_9_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWVALID(TLS_twiddle_h_rsc_0_9_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWUSER(TLS_twiddle_h_rsc_0_9_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWREGION(TLS_twiddle_h_rsc_0_9_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWQOS(TLS_twiddle_h_rsc_0_9_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWPROT(TLS_twiddle_h_rsc_0_9_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWCACHE(TLS_twiddle_h_rsc_0_9_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWLOCK(TLS_twiddle_h_rsc_0_9_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWBURST(TLS_twiddle_h_rsc_0_9_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWSIZE(TLS_twiddle_h_rsc_0_9_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWLEN(TLS_twiddle_h_rsc_0_9_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWADDR(TLS_twiddle_h_rsc_0_9_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_9_AWID(TLS_twiddle_h_rsc_0_9_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_9_lz(TLS_twiddle_h_rsc_triosy_0_9_lz);
    peaseNTT_INST.twiddle_h_rsc_0_10_s_tdone(TLS_twiddle_h_rsc_0_10_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_10_tr_write_done(TLS_twiddle_h_rsc_0_10_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_10_RREADY(TLS_twiddle_h_rsc_0_10_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_10_RVALID(TLS_twiddle_h_rsc_0_10_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_10_RUSER(TLS_twiddle_h_rsc_0_10_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_10_RLAST(TLS_twiddle_h_rsc_0_10_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_10_RRESP(TLS_twiddle_h_rsc_0_10_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_10_RDATA(TLS_twiddle_h_rsc_0_10_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_10_RID(TLS_twiddle_h_rsc_0_10_RID);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARREADY(TLS_twiddle_h_rsc_0_10_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARVALID(TLS_twiddle_h_rsc_0_10_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARUSER(TLS_twiddle_h_rsc_0_10_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARREGION(TLS_twiddle_h_rsc_0_10_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARQOS(TLS_twiddle_h_rsc_0_10_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARPROT(TLS_twiddle_h_rsc_0_10_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARCACHE(TLS_twiddle_h_rsc_0_10_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARLOCK(TLS_twiddle_h_rsc_0_10_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARBURST(TLS_twiddle_h_rsc_0_10_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARSIZE(TLS_twiddle_h_rsc_0_10_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARLEN(TLS_twiddle_h_rsc_0_10_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARADDR(TLS_twiddle_h_rsc_0_10_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_10_ARID(TLS_twiddle_h_rsc_0_10_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_10_BREADY(TLS_twiddle_h_rsc_0_10_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_10_BVALID(TLS_twiddle_h_rsc_0_10_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_10_BUSER(TLS_twiddle_h_rsc_0_10_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_10_BRESP(TLS_twiddle_h_rsc_0_10_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_10_BID(TLS_twiddle_h_rsc_0_10_BID);
    peaseNTT_INST.twiddle_h_rsc_0_10_WREADY(TLS_twiddle_h_rsc_0_10_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_10_WVALID(TLS_twiddle_h_rsc_0_10_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_10_WUSER(TLS_twiddle_h_rsc_0_10_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_10_WLAST(TLS_twiddle_h_rsc_0_10_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_10_WSTRB(TLS_twiddle_h_rsc_0_10_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_10_WDATA(TLS_twiddle_h_rsc_0_10_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWREADY(TLS_twiddle_h_rsc_0_10_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWVALID(TLS_twiddle_h_rsc_0_10_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWUSER(TLS_twiddle_h_rsc_0_10_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWREGION(TLS_twiddle_h_rsc_0_10_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWQOS(TLS_twiddle_h_rsc_0_10_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWPROT(TLS_twiddle_h_rsc_0_10_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWCACHE(TLS_twiddle_h_rsc_0_10_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWLOCK(TLS_twiddle_h_rsc_0_10_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWBURST(TLS_twiddle_h_rsc_0_10_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWSIZE(TLS_twiddle_h_rsc_0_10_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWLEN(TLS_twiddle_h_rsc_0_10_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWADDR(TLS_twiddle_h_rsc_0_10_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_10_AWID(TLS_twiddle_h_rsc_0_10_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_10_lz(TLS_twiddle_h_rsc_triosy_0_10_lz);
    peaseNTT_INST.twiddle_h_rsc_0_11_s_tdone(TLS_twiddle_h_rsc_0_11_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_11_tr_write_done(TLS_twiddle_h_rsc_0_11_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_11_RREADY(TLS_twiddle_h_rsc_0_11_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_11_RVALID(TLS_twiddle_h_rsc_0_11_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_11_RUSER(TLS_twiddle_h_rsc_0_11_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_11_RLAST(TLS_twiddle_h_rsc_0_11_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_11_RRESP(TLS_twiddle_h_rsc_0_11_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_11_RDATA(TLS_twiddle_h_rsc_0_11_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_11_RID(TLS_twiddle_h_rsc_0_11_RID);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARREADY(TLS_twiddle_h_rsc_0_11_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARVALID(TLS_twiddle_h_rsc_0_11_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARUSER(TLS_twiddle_h_rsc_0_11_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARREGION(TLS_twiddle_h_rsc_0_11_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARQOS(TLS_twiddle_h_rsc_0_11_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARPROT(TLS_twiddle_h_rsc_0_11_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARCACHE(TLS_twiddle_h_rsc_0_11_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARLOCK(TLS_twiddle_h_rsc_0_11_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARBURST(TLS_twiddle_h_rsc_0_11_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARSIZE(TLS_twiddle_h_rsc_0_11_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARLEN(TLS_twiddle_h_rsc_0_11_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARADDR(TLS_twiddle_h_rsc_0_11_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_11_ARID(TLS_twiddle_h_rsc_0_11_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_11_BREADY(TLS_twiddle_h_rsc_0_11_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_11_BVALID(TLS_twiddle_h_rsc_0_11_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_11_BUSER(TLS_twiddle_h_rsc_0_11_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_11_BRESP(TLS_twiddle_h_rsc_0_11_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_11_BID(TLS_twiddle_h_rsc_0_11_BID);
    peaseNTT_INST.twiddle_h_rsc_0_11_WREADY(TLS_twiddle_h_rsc_0_11_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_11_WVALID(TLS_twiddle_h_rsc_0_11_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_11_WUSER(TLS_twiddle_h_rsc_0_11_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_11_WLAST(TLS_twiddle_h_rsc_0_11_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_11_WSTRB(TLS_twiddle_h_rsc_0_11_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_11_WDATA(TLS_twiddle_h_rsc_0_11_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWREADY(TLS_twiddle_h_rsc_0_11_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWVALID(TLS_twiddle_h_rsc_0_11_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWUSER(TLS_twiddle_h_rsc_0_11_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWREGION(TLS_twiddle_h_rsc_0_11_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWQOS(TLS_twiddle_h_rsc_0_11_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWPROT(TLS_twiddle_h_rsc_0_11_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWCACHE(TLS_twiddle_h_rsc_0_11_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWLOCK(TLS_twiddle_h_rsc_0_11_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWBURST(TLS_twiddle_h_rsc_0_11_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWSIZE(TLS_twiddle_h_rsc_0_11_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWLEN(TLS_twiddle_h_rsc_0_11_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWADDR(TLS_twiddle_h_rsc_0_11_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_11_AWID(TLS_twiddle_h_rsc_0_11_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_11_lz(TLS_twiddle_h_rsc_triosy_0_11_lz);
    peaseNTT_INST.twiddle_h_rsc_0_12_s_tdone(TLS_twiddle_h_rsc_0_12_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_12_tr_write_done(TLS_twiddle_h_rsc_0_12_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_12_RREADY(TLS_twiddle_h_rsc_0_12_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_12_RVALID(TLS_twiddle_h_rsc_0_12_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_12_RUSER(TLS_twiddle_h_rsc_0_12_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_12_RLAST(TLS_twiddle_h_rsc_0_12_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_12_RRESP(TLS_twiddle_h_rsc_0_12_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_12_RDATA(TLS_twiddle_h_rsc_0_12_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_12_RID(TLS_twiddle_h_rsc_0_12_RID);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARREADY(TLS_twiddle_h_rsc_0_12_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARVALID(TLS_twiddle_h_rsc_0_12_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARUSER(TLS_twiddle_h_rsc_0_12_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARREGION(TLS_twiddle_h_rsc_0_12_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARQOS(TLS_twiddle_h_rsc_0_12_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARPROT(TLS_twiddle_h_rsc_0_12_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARCACHE(TLS_twiddle_h_rsc_0_12_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARLOCK(TLS_twiddle_h_rsc_0_12_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARBURST(TLS_twiddle_h_rsc_0_12_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARSIZE(TLS_twiddle_h_rsc_0_12_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARLEN(TLS_twiddle_h_rsc_0_12_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARADDR(TLS_twiddle_h_rsc_0_12_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_12_ARID(TLS_twiddle_h_rsc_0_12_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_12_BREADY(TLS_twiddle_h_rsc_0_12_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_12_BVALID(TLS_twiddle_h_rsc_0_12_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_12_BUSER(TLS_twiddle_h_rsc_0_12_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_12_BRESP(TLS_twiddle_h_rsc_0_12_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_12_BID(TLS_twiddle_h_rsc_0_12_BID);
    peaseNTT_INST.twiddle_h_rsc_0_12_WREADY(TLS_twiddle_h_rsc_0_12_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_12_WVALID(TLS_twiddle_h_rsc_0_12_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_12_WUSER(TLS_twiddle_h_rsc_0_12_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_12_WLAST(TLS_twiddle_h_rsc_0_12_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_12_WSTRB(TLS_twiddle_h_rsc_0_12_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_12_WDATA(TLS_twiddle_h_rsc_0_12_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWREADY(TLS_twiddle_h_rsc_0_12_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWVALID(TLS_twiddle_h_rsc_0_12_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWUSER(TLS_twiddle_h_rsc_0_12_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWREGION(TLS_twiddle_h_rsc_0_12_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWQOS(TLS_twiddle_h_rsc_0_12_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWPROT(TLS_twiddle_h_rsc_0_12_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWCACHE(TLS_twiddle_h_rsc_0_12_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWLOCK(TLS_twiddle_h_rsc_0_12_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWBURST(TLS_twiddle_h_rsc_0_12_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWSIZE(TLS_twiddle_h_rsc_0_12_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWLEN(TLS_twiddle_h_rsc_0_12_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWADDR(TLS_twiddle_h_rsc_0_12_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_12_AWID(TLS_twiddle_h_rsc_0_12_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_12_lz(TLS_twiddle_h_rsc_triosy_0_12_lz);
    peaseNTT_INST.twiddle_h_rsc_0_13_s_tdone(TLS_twiddle_h_rsc_0_13_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_13_tr_write_done(TLS_twiddle_h_rsc_0_13_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_13_RREADY(TLS_twiddle_h_rsc_0_13_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_13_RVALID(TLS_twiddle_h_rsc_0_13_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_13_RUSER(TLS_twiddle_h_rsc_0_13_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_13_RLAST(TLS_twiddle_h_rsc_0_13_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_13_RRESP(TLS_twiddle_h_rsc_0_13_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_13_RDATA(TLS_twiddle_h_rsc_0_13_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_13_RID(TLS_twiddle_h_rsc_0_13_RID);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARREADY(TLS_twiddle_h_rsc_0_13_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARVALID(TLS_twiddle_h_rsc_0_13_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARUSER(TLS_twiddle_h_rsc_0_13_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARREGION(TLS_twiddle_h_rsc_0_13_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARQOS(TLS_twiddle_h_rsc_0_13_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARPROT(TLS_twiddle_h_rsc_0_13_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARCACHE(TLS_twiddle_h_rsc_0_13_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARLOCK(TLS_twiddle_h_rsc_0_13_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARBURST(TLS_twiddle_h_rsc_0_13_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARSIZE(TLS_twiddle_h_rsc_0_13_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARLEN(TLS_twiddle_h_rsc_0_13_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARADDR(TLS_twiddle_h_rsc_0_13_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_13_ARID(TLS_twiddle_h_rsc_0_13_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_13_BREADY(TLS_twiddle_h_rsc_0_13_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_13_BVALID(TLS_twiddle_h_rsc_0_13_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_13_BUSER(TLS_twiddle_h_rsc_0_13_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_13_BRESP(TLS_twiddle_h_rsc_0_13_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_13_BID(TLS_twiddle_h_rsc_0_13_BID);
    peaseNTT_INST.twiddle_h_rsc_0_13_WREADY(TLS_twiddle_h_rsc_0_13_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_13_WVALID(TLS_twiddle_h_rsc_0_13_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_13_WUSER(TLS_twiddle_h_rsc_0_13_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_13_WLAST(TLS_twiddle_h_rsc_0_13_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_13_WSTRB(TLS_twiddle_h_rsc_0_13_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_13_WDATA(TLS_twiddle_h_rsc_0_13_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWREADY(TLS_twiddle_h_rsc_0_13_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWVALID(TLS_twiddle_h_rsc_0_13_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWUSER(TLS_twiddle_h_rsc_0_13_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWREGION(TLS_twiddle_h_rsc_0_13_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWQOS(TLS_twiddle_h_rsc_0_13_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWPROT(TLS_twiddle_h_rsc_0_13_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWCACHE(TLS_twiddle_h_rsc_0_13_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWLOCK(TLS_twiddle_h_rsc_0_13_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWBURST(TLS_twiddle_h_rsc_0_13_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWSIZE(TLS_twiddle_h_rsc_0_13_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWLEN(TLS_twiddle_h_rsc_0_13_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWADDR(TLS_twiddle_h_rsc_0_13_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_13_AWID(TLS_twiddle_h_rsc_0_13_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_13_lz(TLS_twiddle_h_rsc_triosy_0_13_lz);
    peaseNTT_INST.twiddle_h_rsc_0_14_s_tdone(TLS_twiddle_h_rsc_0_14_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_14_tr_write_done(TLS_twiddle_h_rsc_0_14_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_14_RREADY(TLS_twiddle_h_rsc_0_14_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_14_RVALID(TLS_twiddle_h_rsc_0_14_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_14_RUSER(TLS_twiddle_h_rsc_0_14_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_14_RLAST(TLS_twiddle_h_rsc_0_14_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_14_RRESP(TLS_twiddle_h_rsc_0_14_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_14_RDATA(TLS_twiddle_h_rsc_0_14_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_14_RID(TLS_twiddle_h_rsc_0_14_RID);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARREADY(TLS_twiddle_h_rsc_0_14_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARVALID(TLS_twiddle_h_rsc_0_14_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARUSER(TLS_twiddle_h_rsc_0_14_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARREGION(TLS_twiddle_h_rsc_0_14_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARQOS(TLS_twiddle_h_rsc_0_14_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARPROT(TLS_twiddle_h_rsc_0_14_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARCACHE(TLS_twiddle_h_rsc_0_14_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARLOCK(TLS_twiddle_h_rsc_0_14_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARBURST(TLS_twiddle_h_rsc_0_14_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARSIZE(TLS_twiddle_h_rsc_0_14_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARLEN(TLS_twiddle_h_rsc_0_14_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARADDR(TLS_twiddle_h_rsc_0_14_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_14_ARID(TLS_twiddle_h_rsc_0_14_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_14_BREADY(TLS_twiddle_h_rsc_0_14_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_14_BVALID(TLS_twiddle_h_rsc_0_14_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_14_BUSER(TLS_twiddle_h_rsc_0_14_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_14_BRESP(TLS_twiddle_h_rsc_0_14_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_14_BID(TLS_twiddle_h_rsc_0_14_BID);
    peaseNTT_INST.twiddle_h_rsc_0_14_WREADY(TLS_twiddle_h_rsc_0_14_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_14_WVALID(TLS_twiddle_h_rsc_0_14_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_14_WUSER(TLS_twiddle_h_rsc_0_14_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_14_WLAST(TLS_twiddle_h_rsc_0_14_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_14_WSTRB(TLS_twiddle_h_rsc_0_14_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_14_WDATA(TLS_twiddle_h_rsc_0_14_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWREADY(TLS_twiddle_h_rsc_0_14_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWVALID(TLS_twiddle_h_rsc_0_14_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWUSER(TLS_twiddle_h_rsc_0_14_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWREGION(TLS_twiddle_h_rsc_0_14_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWQOS(TLS_twiddle_h_rsc_0_14_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWPROT(TLS_twiddle_h_rsc_0_14_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWCACHE(TLS_twiddle_h_rsc_0_14_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWLOCK(TLS_twiddle_h_rsc_0_14_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWBURST(TLS_twiddle_h_rsc_0_14_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWSIZE(TLS_twiddle_h_rsc_0_14_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWLEN(TLS_twiddle_h_rsc_0_14_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWADDR(TLS_twiddle_h_rsc_0_14_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_14_AWID(TLS_twiddle_h_rsc_0_14_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_14_lz(TLS_twiddle_h_rsc_triosy_0_14_lz);
    peaseNTT_INST.twiddle_h_rsc_0_15_s_tdone(TLS_twiddle_h_rsc_0_15_s_tdone);
    peaseNTT_INST.twiddle_h_rsc_0_15_tr_write_done(TLS_twiddle_h_rsc_0_15_tr_write_done);
    peaseNTT_INST.twiddle_h_rsc_0_15_RREADY(TLS_twiddle_h_rsc_0_15_RREADY);
    peaseNTT_INST.twiddle_h_rsc_0_15_RVALID(TLS_twiddle_h_rsc_0_15_RVALID);
    peaseNTT_INST.twiddle_h_rsc_0_15_RUSER(TLS_twiddle_h_rsc_0_15_RUSER);
    peaseNTT_INST.twiddle_h_rsc_0_15_RLAST(TLS_twiddle_h_rsc_0_15_RLAST);
    peaseNTT_INST.twiddle_h_rsc_0_15_RRESP(TLS_twiddle_h_rsc_0_15_RRESP);
    peaseNTT_INST.twiddle_h_rsc_0_15_RDATA(TLS_twiddle_h_rsc_0_15_RDATA);
    peaseNTT_INST.twiddle_h_rsc_0_15_RID(TLS_twiddle_h_rsc_0_15_RID);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARREADY(TLS_twiddle_h_rsc_0_15_ARREADY);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARVALID(TLS_twiddle_h_rsc_0_15_ARVALID);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARUSER(TLS_twiddle_h_rsc_0_15_ARUSER);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARREGION(TLS_twiddle_h_rsc_0_15_ARREGION);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARQOS(TLS_twiddle_h_rsc_0_15_ARQOS);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARPROT(TLS_twiddle_h_rsc_0_15_ARPROT);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARCACHE(TLS_twiddle_h_rsc_0_15_ARCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARLOCK(TLS_twiddle_h_rsc_0_15_ARLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARBURST(TLS_twiddle_h_rsc_0_15_ARBURST);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARSIZE(TLS_twiddle_h_rsc_0_15_ARSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARLEN(TLS_twiddle_h_rsc_0_15_ARLEN);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARADDR(TLS_twiddle_h_rsc_0_15_ARADDR);
    peaseNTT_INST.twiddle_h_rsc_0_15_ARID(TLS_twiddle_h_rsc_0_15_ARID);
    peaseNTT_INST.twiddle_h_rsc_0_15_BREADY(TLS_twiddle_h_rsc_0_15_BREADY);
    peaseNTT_INST.twiddle_h_rsc_0_15_BVALID(TLS_twiddle_h_rsc_0_15_BVALID);
    peaseNTT_INST.twiddle_h_rsc_0_15_BUSER(TLS_twiddle_h_rsc_0_15_BUSER);
    peaseNTT_INST.twiddle_h_rsc_0_15_BRESP(TLS_twiddle_h_rsc_0_15_BRESP);
    peaseNTT_INST.twiddle_h_rsc_0_15_BID(TLS_twiddle_h_rsc_0_15_BID);
    peaseNTT_INST.twiddle_h_rsc_0_15_WREADY(TLS_twiddle_h_rsc_0_15_WREADY);
    peaseNTT_INST.twiddle_h_rsc_0_15_WVALID(TLS_twiddle_h_rsc_0_15_WVALID);
    peaseNTT_INST.twiddle_h_rsc_0_15_WUSER(TLS_twiddle_h_rsc_0_15_WUSER);
    peaseNTT_INST.twiddle_h_rsc_0_15_WLAST(TLS_twiddle_h_rsc_0_15_WLAST);
    peaseNTT_INST.twiddle_h_rsc_0_15_WSTRB(TLS_twiddle_h_rsc_0_15_WSTRB);
    peaseNTT_INST.twiddle_h_rsc_0_15_WDATA(TLS_twiddle_h_rsc_0_15_WDATA);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWREADY(TLS_twiddle_h_rsc_0_15_AWREADY);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWVALID(TLS_twiddle_h_rsc_0_15_AWVALID);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWUSER(TLS_twiddle_h_rsc_0_15_AWUSER);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWREGION(TLS_twiddle_h_rsc_0_15_AWREGION);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWQOS(TLS_twiddle_h_rsc_0_15_AWQOS);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWPROT(TLS_twiddle_h_rsc_0_15_AWPROT);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWCACHE(TLS_twiddle_h_rsc_0_15_AWCACHE);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWLOCK(TLS_twiddle_h_rsc_0_15_AWLOCK);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWBURST(TLS_twiddle_h_rsc_0_15_AWBURST);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWSIZE(TLS_twiddle_h_rsc_0_15_AWSIZE);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWLEN(TLS_twiddle_h_rsc_0_15_AWLEN);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWADDR(TLS_twiddle_h_rsc_0_15_AWADDR);
    peaseNTT_INST.twiddle_h_rsc_0_15_AWID(TLS_twiddle_h_rsc_0_15_AWID);
    peaseNTT_INST.twiddle_h_rsc_triosy_0_15_lz(TLS_twiddle_h_rsc_triosy_0_15_lz);

    xt_rsc_0__0__INST.qa(TLS_xt_rsc_0_0_qa);
    xt_rsc_0__0__INST.wea(TLS_xt_rsc_0_0_wea);
    xt_rsc_0__0__INST.da(TLS_xt_rsc_0_0_da);
    xt_rsc_0__0__INST.adra(TLS_xt_rsc_0_0_adra);
    xt_rsc_0__0__INST.clk(clk);
    xt_rsc_0__0__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__0__INST.adrb(TLS_xt_rsc_0__0__adrb);
    xt_rsc_0__0__INST.qb(TLS_xt_rsc_0__0__qb);
    xt_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_71)));

    xt_rsc_0__1__INST.qa(TLS_xt_rsc_0_1_qa);
    xt_rsc_0__1__INST.wea(TLS_xt_rsc_0_1_wea);
    xt_rsc_0__1__INST.da(TLS_xt_rsc_0_1_da);
    xt_rsc_0__1__INST.adra(TLS_xt_rsc_0_1_adra);
    xt_rsc_0__1__INST.clk(clk);
    xt_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__1__INST.adrb(TLS_xt_rsc_0__1__adrb);
    xt_rsc_0__1__INST.qb(TLS_xt_rsc_0__1__qb);
    xt_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_72)));

    xt_rsc_0__2__INST.qa(TLS_xt_rsc_0_2_qa);
    xt_rsc_0__2__INST.wea(TLS_xt_rsc_0_2_wea);
    xt_rsc_0__2__INST.da(TLS_xt_rsc_0_2_da);
    xt_rsc_0__2__INST.adra(TLS_xt_rsc_0_2_adra);
    xt_rsc_0__2__INST.clk(clk);
    xt_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__2__INST.adrb(TLS_xt_rsc_0__2__adrb);
    xt_rsc_0__2__INST.qb(TLS_xt_rsc_0__2__qb);
    xt_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_73)));

    xt_rsc_0__3__INST.qa(TLS_xt_rsc_0_3_qa);
    xt_rsc_0__3__INST.wea(TLS_xt_rsc_0_3_wea);
    xt_rsc_0__3__INST.da(TLS_xt_rsc_0_3_da);
    xt_rsc_0__3__INST.adra(TLS_xt_rsc_0_3_adra);
    xt_rsc_0__3__INST.clk(clk);
    xt_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__3__INST.adrb(TLS_xt_rsc_0__3__adrb);
    xt_rsc_0__3__INST.qb(TLS_xt_rsc_0__3__qb);
    xt_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_74)));

    xt_rsc_0__4__INST.qa(TLS_xt_rsc_0_4_qa);
    xt_rsc_0__4__INST.wea(TLS_xt_rsc_0_4_wea);
    xt_rsc_0__4__INST.da(TLS_xt_rsc_0_4_da);
    xt_rsc_0__4__INST.adra(TLS_xt_rsc_0_4_adra);
    xt_rsc_0__4__INST.clk(clk);
    xt_rsc_0__4__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__4__INST.adrb(TLS_xt_rsc_0__4__adrb);
    xt_rsc_0__4__INST.qb(TLS_xt_rsc_0__4__qb);
    xt_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_75)));

    xt_rsc_0__5__INST.qa(TLS_xt_rsc_0_5_qa);
    xt_rsc_0__5__INST.wea(TLS_xt_rsc_0_5_wea);
    xt_rsc_0__5__INST.da(TLS_xt_rsc_0_5_da);
    xt_rsc_0__5__INST.adra(TLS_xt_rsc_0_5_adra);
    xt_rsc_0__5__INST.clk(clk);
    xt_rsc_0__5__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__5__INST.adrb(TLS_xt_rsc_0__5__adrb);
    xt_rsc_0__5__INST.qb(TLS_xt_rsc_0__5__qb);
    xt_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_76)));

    xt_rsc_0__6__INST.qa(TLS_xt_rsc_0_6_qa);
    xt_rsc_0__6__INST.wea(TLS_xt_rsc_0_6_wea);
    xt_rsc_0__6__INST.da(TLS_xt_rsc_0_6_da);
    xt_rsc_0__6__INST.adra(TLS_xt_rsc_0_6_adra);
    xt_rsc_0__6__INST.clk(clk);
    xt_rsc_0__6__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__6__INST.adrb(TLS_xt_rsc_0__6__adrb);
    xt_rsc_0__6__INST.qb(TLS_xt_rsc_0__6__qb);
    xt_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_77)));

    xt_rsc_0__7__INST.qa(TLS_xt_rsc_0_7_qa);
    xt_rsc_0__7__INST.wea(TLS_xt_rsc_0_7_wea);
    xt_rsc_0__7__INST.da(TLS_xt_rsc_0_7_da);
    xt_rsc_0__7__INST.adra(TLS_xt_rsc_0_7_adra);
    xt_rsc_0__7__INST.clk(clk);
    xt_rsc_0__7__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__7__INST.adrb(TLS_xt_rsc_0__7__adrb);
    xt_rsc_0__7__INST.qb(TLS_xt_rsc_0__7__qb);
    xt_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_78)));

    xt_rsc_0__8__INST.qa(TLS_xt_rsc_0_8_qa);
    xt_rsc_0__8__INST.wea(TLS_xt_rsc_0_8_wea);
    xt_rsc_0__8__INST.da(TLS_xt_rsc_0_8_da);
    xt_rsc_0__8__INST.adra(TLS_xt_rsc_0_8_adra);
    xt_rsc_0__8__INST.clk(clk);
    xt_rsc_0__8__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__8__INST.adrb(TLS_xt_rsc_0__8__adrb);
    xt_rsc_0__8__INST.qb(TLS_xt_rsc_0__8__qb);
    xt_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_79)));

    xt_rsc_0__9__INST.qa(TLS_xt_rsc_0_9_qa);
    xt_rsc_0__9__INST.wea(TLS_xt_rsc_0_9_wea);
    xt_rsc_0__9__INST.da(TLS_xt_rsc_0_9_da);
    xt_rsc_0__9__INST.adra(TLS_xt_rsc_0_9_adra);
    xt_rsc_0__9__INST.clk(clk);
    xt_rsc_0__9__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__9__INST.adrb(TLS_xt_rsc_0__9__adrb);
    xt_rsc_0__9__INST.qb(TLS_xt_rsc_0__9__qb);
    xt_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_80)));

    xt_rsc_0__10__INST.qa(TLS_xt_rsc_0_10_qa);
    xt_rsc_0__10__INST.wea(TLS_xt_rsc_0_10_wea);
    xt_rsc_0__10__INST.da(TLS_xt_rsc_0_10_da);
    xt_rsc_0__10__INST.adra(TLS_xt_rsc_0_10_adra);
    xt_rsc_0__10__INST.clk(clk);
    xt_rsc_0__10__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__10__INST.adrb(TLS_xt_rsc_0__10__adrb);
    xt_rsc_0__10__INST.qb(TLS_xt_rsc_0__10__qb);
    xt_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_81)));

    xt_rsc_0__11__INST.qa(TLS_xt_rsc_0_11_qa);
    xt_rsc_0__11__INST.wea(TLS_xt_rsc_0_11_wea);
    xt_rsc_0__11__INST.da(TLS_xt_rsc_0_11_da);
    xt_rsc_0__11__INST.adra(TLS_xt_rsc_0_11_adra);
    xt_rsc_0__11__INST.clk(clk);
    xt_rsc_0__11__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__11__INST.adrb(TLS_xt_rsc_0__11__adrb);
    xt_rsc_0__11__INST.qb(TLS_xt_rsc_0__11__qb);
    xt_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_82)));

    xt_rsc_0__12__INST.qa(TLS_xt_rsc_0_12_qa);
    xt_rsc_0__12__INST.wea(TLS_xt_rsc_0_12_wea);
    xt_rsc_0__12__INST.da(TLS_xt_rsc_0_12_da);
    xt_rsc_0__12__INST.adra(TLS_xt_rsc_0_12_adra);
    xt_rsc_0__12__INST.clk(clk);
    xt_rsc_0__12__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__12__INST.adrb(TLS_xt_rsc_0__12__adrb);
    xt_rsc_0__12__INST.qb(TLS_xt_rsc_0__12__qb);
    xt_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_83)));

    xt_rsc_0__13__INST.qa(TLS_xt_rsc_0_13_qa);
    xt_rsc_0__13__INST.wea(TLS_xt_rsc_0_13_wea);
    xt_rsc_0__13__INST.da(TLS_xt_rsc_0_13_da);
    xt_rsc_0__13__INST.adra(TLS_xt_rsc_0_13_adra);
    xt_rsc_0__13__INST.clk(clk);
    xt_rsc_0__13__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__13__INST.adrb(TLS_xt_rsc_0__13__adrb);
    xt_rsc_0__13__INST.qb(TLS_xt_rsc_0__13__qb);
    xt_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_84)));

    xt_rsc_0__14__INST.qa(TLS_xt_rsc_0_14_qa);
    xt_rsc_0__14__INST.wea(TLS_xt_rsc_0_14_wea);
    xt_rsc_0__14__INST.da(TLS_xt_rsc_0_14_da);
    xt_rsc_0__14__INST.adra(TLS_xt_rsc_0_14_adra);
    xt_rsc_0__14__INST.clk(clk);
    xt_rsc_0__14__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__14__INST.adrb(TLS_xt_rsc_0__14__adrb);
    xt_rsc_0__14__INST.qb(TLS_xt_rsc_0__14__qb);
    xt_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_85)));

    xt_rsc_0__15__INST.qa(TLS_xt_rsc_0_15_qa);
    xt_rsc_0__15__INST.wea(TLS_xt_rsc_0_15_wea);
    xt_rsc_0__15__INST.da(TLS_xt_rsc_0_15_da);
    xt_rsc_0__15__INST.adra(TLS_xt_rsc_0_15_adra);
    xt_rsc_0__15__INST.clk(clk);
    xt_rsc_0__15__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__15__INST.adrb(TLS_xt_rsc_0__15__adrb);
    xt_rsc_0__15__INST.qb(TLS_xt_rsc_0__15__qb);
    xt_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_86)));

    xt_rsc_0__16__INST.qa(TLS_xt_rsc_0_16_qa);
    xt_rsc_0__16__INST.wea(TLS_xt_rsc_0_16_wea);
    xt_rsc_0__16__INST.da(TLS_xt_rsc_0_16_da);
    xt_rsc_0__16__INST.adra(TLS_xt_rsc_0_16_adra);
    xt_rsc_0__16__INST.clk(clk);
    xt_rsc_0__16__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__16__INST.adrb(TLS_xt_rsc_0__16__adrb);
    xt_rsc_0__16__INST.qb(TLS_xt_rsc_0__16__qb);
    xt_rsc_0__16__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_87)));

    xt_rsc_0__17__INST.qa(TLS_xt_rsc_0_17_qa);
    xt_rsc_0__17__INST.wea(TLS_xt_rsc_0_17_wea);
    xt_rsc_0__17__INST.da(TLS_xt_rsc_0_17_da);
    xt_rsc_0__17__INST.adra(TLS_xt_rsc_0_17_adra);
    xt_rsc_0__17__INST.clk(clk);
    xt_rsc_0__17__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__17__INST.adrb(TLS_xt_rsc_0__17__adrb);
    xt_rsc_0__17__INST.qb(TLS_xt_rsc_0__17__qb);
    xt_rsc_0__17__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_88)));

    xt_rsc_0__18__INST.qa(TLS_xt_rsc_0_18_qa);
    xt_rsc_0__18__INST.wea(TLS_xt_rsc_0_18_wea);
    xt_rsc_0__18__INST.da(TLS_xt_rsc_0_18_da);
    xt_rsc_0__18__INST.adra(TLS_xt_rsc_0_18_adra);
    xt_rsc_0__18__INST.clk(clk);
    xt_rsc_0__18__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__18__INST.adrb(TLS_xt_rsc_0__18__adrb);
    xt_rsc_0__18__INST.qb(TLS_xt_rsc_0__18__qb);
    xt_rsc_0__18__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_89)));

    xt_rsc_0__19__INST.qa(TLS_xt_rsc_0_19_qa);
    xt_rsc_0__19__INST.wea(TLS_xt_rsc_0_19_wea);
    xt_rsc_0__19__INST.da(TLS_xt_rsc_0_19_da);
    xt_rsc_0__19__INST.adra(TLS_xt_rsc_0_19_adra);
    xt_rsc_0__19__INST.clk(clk);
    xt_rsc_0__19__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__19__INST.adrb(TLS_xt_rsc_0__19__adrb);
    xt_rsc_0__19__INST.qb(TLS_xt_rsc_0__19__qb);
    xt_rsc_0__19__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_90)));

    xt_rsc_0__20__INST.qa(TLS_xt_rsc_0_20_qa);
    xt_rsc_0__20__INST.wea(TLS_xt_rsc_0_20_wea);
    xt_rsc_0__20__INST.da(TLS_xt_rsc_0_20_da);
    xt_rsc_0__20__INST.adra(TLS_xt_rsc_0_20_adra);
    xt_rsc_0__20__INST.clk(clk);
    xt_rsc_0__20__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__20__INST.adrb(TLS_xt_rsc_0__20__adrb);
    xt_rsc_0__20__INST.qb(TLS_xt_rsc_0__20__qb);
    xt_rsc_0__20__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_91)));

    xt_rsc_0__21__INST.qa(TLS_xt_rsc_0_21_qa);
    xt_rsc_0__21__INST.wea(TLS_xt_rsc_0_21_wea);
    xt_rsc_0__21__INST.da(TLS_xt_rsc_0_21_da);
    xt_rsc_0__21__INST.adra(TLS_xt_rsc_0_21_adra);
    xt_rsc_0__21__INST.clk(clk);
    xt_rsc_0__21__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__21__INST.adrb(TLS_xt_rsc_0__21__adrb);
    xt_rsc_0__21__INST.qb(TLS_xt_rsc_0__21__qb);
    xt_rsc_0__21__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_92)));

    xt_rsc_0__22__INST.qa(TLS_xt_rsc_0_22_qa);
    xt_rsc_0__22__INST.wea(TLS_xt_rsc_0_22_wea);
    xt_rsc_0__22__INST.da(TLS_xt_rsc_0_22_da);
    xt_rsc_0__22__INST.adra(TLS_xt_rsc_0_22_adra);
    xt_rsc_0__22__INST.clk(clk);
    xt_rsc_0__22__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__22__INST.adrb(TLS_xt_rsc_0__22__adrb);
    xt_rsc_0__22__INST.qb(TLS_xt_rsc_0__22__qb);
    xt_rsc_0__22__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_93)));

    xt_rsc_0__23__INST.qa(TLS_xt_rsc_0_23_qa);
    xt_rsc_0__23__INST.wea(TLS_xt_rsc_0_23_wea);
    xt_rsc_0__23__INST.da(TLS_xt_rsc_0_23_da);
    xt_rsc_0__23__INST.adra(TLS_xt_rsc_0_23_adra);
    xt_rsc_0__23__INST.clk(clk);
    xt_rsc_0__23__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__23__INST.adrb(TLS_xt_rsc_0__23__adrb);
    xt_rsc_0__23__INST.qb(TLS_xt_rsc_0__23__qb);
    xt_rsc_0__23__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_94)));

    xt_rsc_0__24__INST.qa(TLS_xt_rsc_0_24_qa);
    xt_rsc_0__24__INST.wea(TLS_xt_rsc_0_24_wea);
    xt_rsc_0__24__INST.da(TLS_xt_rsc_0_24_da);
    xt_rsc_0__24__INST.adra(TLS_xt_rsc_0_24_adra);
    xt_rsc_0__24__INST.clk(clk);
    xt_rsc_0__24__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__24__INST.adrb(TLS_xt_rsc_0__24__adrb);
    xt_rsc_0__24__INST.qb(TLS_xt_rsc_0__24__qb);
    xt_rsc_0__24__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_95)));

    xt_rsc_0__25__INST.qa(TLS_xt_rsc_0_25_qa);
    xt_rsc_0__25__INST.wea(TLS_xt_rsc_0_25_wea);
    xt_rsc_0__25__INST.da(TLS_xt_rsc_0_25_da);
    xt_rsc_0__25__INST.adra(TLS_xt_rsc_0_25_adra);
    xt_rsc_0__25__INST.clk(clk);
    xt_rsc_0__25__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__25__INST.adrb(TLS_xt_rsc_0__25__adrb);
    xt_rsc_0__25__INST.qb(TLS_xt_rsc_0__25__qb);
    xt_rsc_0__25__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_96)));

    xt_rsc_0__26__INST.qa(TLS_xt_rsc_0_26_qa);
    xt_rsc_0__26__INST.wea(TLS_xt_rsc_0_26_wea);
    xt_rsc_0__26__INST.da(TLS_xt_rsc_0_26_da);
    xt_rsc_0__26__INST.adra(TLS_xt_rsc_0_26_adra);
    xt_rsc_0__26__INST.clk(clk);
    xt_rsc_0__26__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__26__INST.adrb(TLS_xt_rsc_0__26__adrb);
    xt_rsc_0__26__INST.qb(TLS_xt_rsc_0__26__qb);
    xt_rsc_0__26__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_97)));

    xt_rsc_0__27__INST.qa(TLS_xt_rsc_0_27_qa);
    xt_rsc_0__27__INST.wea(TLS_xt_rsc_0_27_wea);
    xt_rsc_0__27__INST.da(TLS_xt_rsc_0_27_da);
    xt_rsc_0__27__INST.adra(TLS_xt_rsc_0_27_adra);
    xt_rsc_0__27__INST.clk(clk);
    xt_rsc_0__27__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__27__INST.adrb(TLS_xt_rsc_0__27__adrb);
    xt_rsc_0__27__INST.qb(TLS_xt_rsc_0__27__qb);
    xt_rsc_0__27__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_98)));

    xt_rsc_0__28__INST.qa(TLS_xt_rsc_0_28_qa);
    xt_rsc_0__28__INST.wea(TLS_xt_rsc_0_28_wea);
    xt_rsc_0__28__INST.da(TLS_xt_rsc_0_28_da);
    xt_rsc_0__28__INST.adra(TLS_xt_rsc_0_28_adra);
    xt_rsc_0__28__INST.clk(clk);
    xt_rsc_0__28__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__28__INST.adrb(TLS_xt_rsc_0__28__adrb);
    xt_rsc_0__28__INST.qb(TLS_xt_rsc_0__28__qb);
    xt_rsc_0__28__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_99)));

    xt_rsc_0__29__INST.qa(TLS_xt_rsc_0_29_qa);
    xt_rsc_0__29__INST.wea(TLS_xt_rsc_0_29_wea);
    xt_rsc_0__29__INST.da(TLS_xt_rsc_0_29_da);
    xt_rsc_0__29__INST.adra(TLS_xt_rsc_0_29_adra);
    xt_rsc_0__29__INST.clk(clk);
    xt_rsc_0__29__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__29__INST.adrb(TLS_xt_rsc_0__29__adrb);
    xt_rsc_0__29__INST.qb(TLS_xt_rsc_0__29__qb);
    xt_rsc_0__29__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_100)));

    xt_rsc_0__30__INST.qa(TLS_xt_rsc_0_30_qa);
    xt_rsc_0__30__INST.wea(TLS_xt_rsc_0_30_wea);
    xt_rsc_0__30__INST.da(TLS_xt_rsc_0_30_da);
    xt_rsc_0__30__INST.adra(TLS_xt_rsc_0_30_adra);
    xt_rsc_0__30__INST.clk(clk);
    xt_rsc_0__30__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__30__INST.adrb(TLS_xt_rsc_0__30__adrb);
    xt_rsc_0__30__INST.qb(TLS_xt_rsc_0__30__qb);
    xt_rsc_0__30__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_101)));

    xt_rsc_0__31__INST.qa(TLS_xt_rsc_0_31_qa);
    xt_rsc_0__31__INST.wea(TLS_xt_rsc_0_31_wea);
    xt_rsc_0__31__INST.da(TLS_xt_rsc_0_31_da);
    xt_rsc_0__31__INST.adra(TLS_xt_rsc_0_31_adra);
    xt_rsc_0__31__INST.clk(clk);
    xt_rsc_0__31__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_0__31__INST.adrb(TLS_xt_rsc_0__31__adrb);
    xt_rsc_0__31__INST.qb(TLS_xt_rsc_0__31__qb);
    xt_rsc_0__31__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_102)));

    xt_rsc_1__0__INST.qa(TLS_xt_rsc_1_0_qa);
    xt_rsc_1__0__INST.wea(TLS_xt_rsc_1_0_wea);
    xt_rsc_1__0__INST.da(TLS_xt_rsc_1_0_da);
    xt_rsc_1__0__INST.adra(TLS_xt_rsc_1_0_adra);
    xt_rsc_1__0__INST.clk(clk);
    xt_rsc_1__0__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__0__INST.adrb(TLS_xt_rsc_1__0__adrb);
    xt_rsc_1__0__INST.qb(TLS_xt_rsc_1__0__qb);
    xt_rsc_1__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_103)));

    xt_rsc_1__1__INST.qa(TLS_xt_rsc_1_1_qa);
    xt_rsc_1__1__INST.wea(TLS_xt_rsc_1_1_wea);
    xt_rsc_1__1__INST.da(TLS_xt_rsc_1_1_da);
    xt_rsc_1__1__INST.adra(TLS_xt_rsc_1_1_adra);
    xt_rsc_1__1__INST.clk(clk);
    xt_rsc_1__1__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__1__INST.adrb(TLS_xt_rsc_1__1__adrb);
    xt_rsc_1__1__INST.qb(TLS_xt_rsc_1__1__qb);
    xt_rsc_1__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_104)));

    xt_rsc_1__2__INST.qa(TLS_xt_rsc_1_2_qa);
    xt_rsc_1__2__INST.wea(TLS_xt_rsc_1_2_wea);
    xt_rsc_1__2__INST.da(TLS_xt_rsc_1_2_da);
    xt_rsc_1__2__INST.adra(TLS_xt_rsc_1_2_adra);
    xt_rsc_1__2__INST.clk(clk);
    xt_rsc_1__2__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__2__INST.adrb(TLS_xt_rsc_1__2__adrb);
    xt_rsc_1__2__INST.qb(TLS_xt_rsc_1__2__qb);
    xt_rsc_1__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_105)));

    xt_rsc_1__3__INST.qa(TLS_xt_rsc_1_3_qa);
    xt_rsc_1__3__INST.wea(TLS_xt_rsc_1_3_wea);
    xt_rsc_1__3__INST.da(TLS_xt_rsc_1_3_da);
    xt_rsc_1__3__INST.adra(TLS_xt_rsc_1_3_adra);
    xt_rsc_1__3__INST.clk(clk);
    xt_rsc_1__3__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__3__INST.adrb(TLS_xt_rsc_1__3__adrb);
    xt_rsc_1__3__INST.qb(TLS_xt_rsc_1__3__qb);
    xt_rsc_1__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_106)));

    xt_rsc_1__4__INST.qa(TLS_xt_rsc_1_4_qa);
    xt_rsc_1__4__INST.wea(TLS_xt_rsc_1_4_wea);
    xt_rsc_1__4__INST.da(TLS_xt_rsc_1_4_da);
    xt_rsc_1__4__INST.adra(TLS_xt_rsc_1_4_adra);
    xt_rsc_1__4__INST.clk(clk);
    xt_rsc_1__4__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__4__INST.adrb(TLS_xt_rsc_1__4__adrb);
    xt_rsc_1__4__INST.qb(TLS_xt_rsc_1__4__qb);
    xt_rsc_1__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_107)));

    xt_rsc_1__5__INST.qa(TLS_xt_rsc_1_5_qa);
    xt_rsc_1__5__INST.wea(TLS_xt_rsc_1_5_wea);
    xt_rsc_1__5__INST.da(TLS_xt_rsc_1_5_da);
    xt_rsc_1__5__INST.adra(TLS_xt_rsc_1_5_adra);
    xt_rsc_1__5__INST.clk(clk);
    xt_rsc_1__5__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__5__INST.adrb(TLS_xt_rsc_1__5__adrb);
    xt_rsc_1__5__INST.qb(TLS_xt_rsc_1__5__qb);
    xt_rsc_1__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_108)));

    xt_rsc_1__6__INST.qa(TLS_xt_rsc_1_6_qa);
    xt_rsc_1__6__INST.wea(TLS_xt_rsc_1_6_wea);
    xt_rsc_1__6__INST.da(TLS_xt_rsc_1_6_da);
    xt_rsc_1__6__INST.adra(TLS_xt_rsc_1_6_adra);
    xt_rsc_1__6__INST.clk(clk);
    xt_rsc_1__6__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__6__INST.adrb(TLS_xt_rsc_1__6__adrb);
    xt_rsc_1__6__INST.qb(TLS_xt_rsc_1__6__qb);
    xt_rsc_1__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_109)));

    xt_rsc_1__7__INST.qa(TLS_xt_rsc_1_7_qa);
    xt_rsc_1__7__INST.wea(TLS_xt_rsc_1_7_wea);
    xt_rsc_1__7__INST.da(TLS_xt_rsc_1_7_da);
    xt_rsc_1__7__INST.adra(TLS_xt_rsc_1_7_adra);
    xt_rsc_1__7__INST.clk(clk);
    xt_rsc_1__7__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__7__INST.adrb(TLS_xt_rsc_1__7__adrb);
    xt_rsc_1__7__INST.qb(TLS_xt_rsc_1__7__qb);
    xt_rsc_1__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_110)));

    xt_rsc_1__8__INST.qa(TLS_xt_rsc_1_8_qa);
    xt_rsc_1__8__INST.wea(TLS_xt_rsc_1_8_wea);
    xt_rsc_1__8__INST.da(TLS_xt_rsc_1_8_da);
    xt_rsc_1__8__INST.adra(TLS_xt_rsc_1_8_adra);
    xt_rsc_1__8__INST.clk(clk);
    xt_rsc_1__8__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__8__INST.adrb(TLS_xt_rsc_1__8__adrb);
    xt_rsc_1__8__INST.qb(TLS_xt_rsc_1__8__qb);
    xt_rsc_1__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_111)));

    xt_rsc_1__9__INST.qa(TLS_xt_rsc_1_9_qa);
    xt_rsc_1__9__INST.wea(TLS_xt_rsc_1_9_wea);
    xt_rsc_1__9__INST.da(TLS_xt_rsc_1_9_da);
    xt_rsc_1__9__INST.adra(TLS_xt_rsc_1_9_adra);
    xt_rsc_1__9__INST.clk(clk);
    xt_rsc_1__9__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__9__INST.adrb(TLS_xt_rsc_1__9__adrb);
    xt_rsc_1__9__INST.qb(TLS_xt_rsc_1__9__qb);
    xt_rsc_1__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_112)));

    xt_rsc_1__10__INST.qa(TLS_xt_rsc_1_10_qa);
    xt_rsc_1__10__INST.wea(TLS_xt_rsc_1_10_wea);
    xt_rsc_1__10__INST.da(TLS_xt_rsc_1_10_da);
    xt_rsc_1__10__INST.adra(TLS_xt_rsc_1_10_adra);
    xt_rsc_1__10__INST.clk(clk);
    xt_rsc_1__10__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__10__INST.adrb(TLS_xt_rsc_1__10__adrb);
    xt_rsc_1__10__INST.qb(TLS_xt_rsc_1__10__qb);
    xt_rsc_1__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_113)));

    xt_rsc_1__11__INST.qa(TLS_xt_rsc_1_11_qa);
    xt_rsc_1__11__INST.wea(TLS_xt_rsc_1_11_wea);
    xt_rsc_1__11__INST.da(TLS_xt_rsc_1_11_da);
    xt_rsc_1__11__INST.adra(TLS_xt_rsc_1_11_adra);
    xt_rsc_1__11__INST.clk(clk);
    xt_rsc_1__11__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__11__INST.adrb(TLS_xt_rsc_1__11__adrb);
    xt_rsc_1__11__INST.qb(TLS_xt_rsc_1__11__qb);
    xt_rsc_1__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_114)));

    xt_rsc_1__12__INST.qa(TLS_xt_rsc_1_12_qa);
    xt_rsc_1__12__INST.wea(TLS_xt_rsc_1_12_wea);
    xt_rsc_1__12__INST.da(TLS_xt_rsc_1_12_da);
    xt_rsc_1__12__INST.adra(TLS_xt_rsc_1_12_adra);
    xt_rsc_1__12__INST.clk(clk);
    xt_rsc_1__12__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__12__INST.adrb(TLS_xt_rsc_1__12__adrb);
    xt_rsc_1__12__INST.qb(TLS_xt_rsc_1__12__qb);
    xt_rsc_1__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_115)));

    xt_rsc_1__13__INST.qa(TLS_xt_rsc_1_13_qa);
    xt_rsc_1__13__INST.wea(TLS_xt_rsc_1_13_wea);
    xt_rsc_1__13__INST.da(TLS_xt_rsc_1_13_da);
    xt_rsc_1__13__INST.adra(TLS_xt_rsc_1_13_adra);
    xt_rsc_1__13__INST.clk(clk);
    xt_rsc_1__13__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__13__INST.adrb(TLS_xt_rsc_1__13__adrb);
    xt_rsc_1__13__INST.qb(TLS_xt_rsc_1__13__qb);
    xt_rsc_1__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_116)));

    xt_rsc_1__14__INST.qa(TLS_xt_rsc_1_14_qa);
    xt_rsc_1__14__INST.wea(TLS_xt_rsc_1_14_wea);
    xt_rsc_1__14__INST.da(TLS_xt_rsc_1_14_da);
    xt_rsc_1__14__INST.adra(TLS_xt_rsc_1_14_adra);
    xt_rsc_1__14__INST.clk(clk);
    xt_rsc_1__14__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__14__INST.adrb(TLS_xt_rsc_1__14__adrb);
    xt_rsc_1__14__INST.qb(TLS_xt_rsc_1__14__qb);
    xt_rsc_1__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_117)));

    xt_rsc_1__15__INST.qa(TLS_xt_rsc_1_15_qa);
    xt_rsc_1__15__INST.wea(TLS_xt_rsc_1_15_wea);
    xt_rsc_1__15__INST.da(TLS_xt_rsc_1_15_da);
    xt_rsc_1__15__INST.adra(TLS_xt_rsc_1_15_adra);
    xt_rsc_1__15__INST.clk(clk);
    xt_rsc_1__15__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__15__INST.adrb(TLS_xt_rsc_1__15__adrb);
    xt_rsc_1__15__INST.qb(TLS_xt_rsc_1__15__qb);
    xt_rsc_1__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_118)));

    xt_rsc_1__16__INST.qa(TLS_xt_rsc_1_16_qa);
    xt_rsc_1__16__INST.wea(TLS_xt_rsc_1_16_wea);
    xt_rsc_1__16__INST.da(TLS_xt_rsc_1_16_da);
    xt_rsc_1__16__INST.adra(TLS_xt_rsc_1_16_adra);
    xt_rsc_1__16__INST.clk(clk);
    xt_rsc_1__16__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__16__INST.adrb(TLS_xt_rsc_1__16__adrb);
    xt_rsc_1__16__INST.qb(TLS_xt_rsc_1__16__qb);
    xt_rsc_1__16__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_119)));

    xt_rsc_1__17__INST.qa(TLS_xt_rsc_1_17_qa);
    xt_rsc_1__17__INST.wea(TLS_xt_rsc_1_17_wea);
    xt_rsc_1__17__INST.da(TLS_xt_rsc_1_17_da);
    xt_rsc_1__17__INST.adra(TLS_xt_rsc_1_17_adra);
    xt_rsc_1__17__INST.clk(clk);
    xt_rsc_1__17__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__17__INST.adrb(TLS_xt_rsc_1__17__adrb);
    xt_rsc_1__17__INST.qb(TLS_xt_rsc_1__17__qb);
    xt_rsc_1__17__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_120)));

    xt_rsc_1__18__INST.qa(TLS_xt_rsc_1_18_qa);
    xt_rsc_1__18__INST.wea(TLS_xt_rsc_1_18_wea);
    xt_rsc_1__18__INST.da(TLS_xt_rsc_1_18_da);
    xt_rsc_1__18__INST.adra(TLS_xt_rsc_1_18_adra);
    xt_rsc_1__18__INST.clk(clk);
    xt_rsc_1__18__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__18__INST.adrb(TLS_xt_rsc_1__18__adrb);
    xt_rsc_1__18__INST.qb(TLS_xt_rsc_1__18__qb);
    xt_rsc_1__18__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_121)));

    xt_rsc_1__19__INST.qa(TLS_xt_rsc_1_19_qa);
    xt_rsc_1__19__INST.wea(TLS_xt_rsc_1_19_wea);
    xt_rsc_1__19__INST.da(TLS_xt_rsc_1_19_da);
    xt_rsc_1__19__INST.adra(TLS_xt_rsc_1_19_adra);
    xt_rsc_1__19__INST.clk(clk);
    xt_rsc_1__19__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__19__INST.adrb(TLS_xt_rsc_1__19__adrb);
    xt_rsc_1__19__INST.qb(TLS_xt_rsc_1__19__qb);
    xt_rsc_1__19__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_122)));

    xt_rsc_1__20__INST.qa(TLS_xt_rsc_1_20_qa);
    xt_rsc_1__20__INST.wea(TLS_xt_rsc_1_20_wea);
    xt_rsc_1__20__INST.da(TLS_xt_rsc_1_20_da);
    xt_rsc_1__20__INST.adra(TLS_xt_rsc_1_20_adra);
    xt_rsc_1__20__INST.clk(clk);
    xt_rsc_1__20__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__20__INST.adrb(TLS_xt_rsc_1__20__adrb);
    xt_rsc_1__20__INST.qb(TLS_xt_rsc_1__20__qb);
    xt_rsc_1__20__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_123)));

    xt_rsc_1__21__INST.qa(TLS_xt_rsc_1_21_qa);
    xt_rsc_1__21__INST.wea(TLS_xt_rsc_1_21_wea);
    xt_rsc_1__21__INST.da(TLS_xt_rsc_1_21_da);
    xt_rsc_1__21__INST.adra(TLS_xt_rsc_1_21_adra);
    xt_rsc_1__21__INST.clk(clk);
    xt_rsc_1__21__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__21__INST.adrb(TLS_xt_rsc_1__21__adrb);
    xt_rsc_1__21__INST.qb(TLS_xt_rsc_1__21__qb);
    xt_rsc_1__21__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_124)));

    xt_rsc_1__22__INST.qa(TLS_xt_rsc_1_22_qa);
    xt_rsc_1__22__INST.wea(TLS_xt_rsc_1_22_wea);
    xt_rsc_1__22__INST.da(TLS_xt_rsc_1_22_da);
    xt_rsc_1__22__INST.adra(TLS_xt_rsc_1_22_adra);
    xt_rsc_1__22__INST.clk(clk);
    xt_rsc_1__22__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__22__INST.adrb(TLS_xt_rsc_1__22__adrb);
    xt_rsc_1__22__INST.qb(TLS_xt_rsc_1__22__qb);
    xt_rsc_1__22__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_125)));

    xt_rsc_1__23__INST.qa(TLS_xt_rsc_1_23_qa);
    xt_rsc_1__23__INST.wea(TLS_xt_rsc_1_23_wea);
    xt_rsc_1__23__INST.da(TLS_xt_rsc_1_23_da);
    xt_rsc_1__23__INST.adra(TLS_xt_rsc_1_23_adra);
    xt_rsc_1__23__INST.clk(clk);
    xt_rsc_1__23__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__23__INST.adrb(TLS_xt_rsc_1__23__adrb);
    xt_rsc_1__23__INST.qb(TLS_xt_rsc_1__23__qb);
    xt_rsc_1__23__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_126)));

    xt_rsc_1__24__INST.qa(TLS_xt_rsc_1_24_qa);
    xt_rsc_1__24__INST.wea(TLS_xt_rsc_1_24_wea);
    xt_rsc_1__24__INST.da(TLS_xt_rsc_1_24_da);
    xt_rsc_1__24__INST.adra(TLS_xt_rsc_1_24_adra);
    xt_rsc_1__24__INST.clk(clk);
    xt_rsc_1__24__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__24__INST.adrb(TLS_xt_rsc_1__24__adrb);
    xt_rsc_1__24__INST.qb(TLS_xt_rsc_1__24__qb);
    xt_rsc_1__24__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_127)));

    xt_rsc_1__25__INST.qa(TLS_xt_rsc_1_25_qa);
    xt_rsc_1__25__INST.wea(TLS_xt_rsc_1_25_wea);
    xt_rsc_1__25__INST.da(TLS_xt_rsc_1_25_da);
    xt_rsc_1__25__INST.adra(TLS_xt_rsc_1_25_adra);
    xt_rsc_1__25__INST.clk(clk);
    xt_rsc_1__25__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__25__INST.adrb(TLS_xt_rsc_1__25__adrb);
    xt_rsc_1__25__INST.qb(TLS_xt_rsc_1__25__qb);
    xt_rsc_1__25__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_128)));

    xt_rsc_1__26__INST.qa(TLS_xt_rsc_1_26_qa);
    xt_rsc_1__26__INST.wea(TLS_xt_rsc_1_26_wea);
    xt_rsc_1__26__INST.da(TLS_xt_rsc_1_26_da);
    xt_rsc_1__26__INST.adra(TLS_xt_rsc_1_26_adra);
    xt_rsc_1__26__INST.clk(clk);
    xt_rsc_1__26__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__26__INST.adrb(TLS_xt_rsc_1__26__adrb);
    xt_rsc_1__26__INST.qb(TLS_xt_rsc_1__26__qb);
    xt_rsc_1__26__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_129)));

    xt_rsc_1__27__INST.qa(TLS_xt_rsc_1_27_qa);
    xt_rsc_1__27__INST.wea(TLS_xt_rsc_1_27_wea);
    xt_rsc_1__27__INST.da(TLS_xt_rsc_1_27_da);
    xt_rsc_1__27__INST.adra(TLS_xt_rsc_1_27_adra);
    xt_rsc_1__27__INST.clk(clk);
    xt_rsc_1__27__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__27__INST.adrb(TLS_xt_rsc_1__27__adrb);
    xt_rsc_1__27__INST.qb(TLS_xt_rsc_1__27__qb);
    xt_rsc_1__27__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_130)));

    xt_rsc_1__28__INST.qa(TLS_xt_rsc_1_28_qa);
    xt_rsc_1__28__INST.wea(TLS_xt_rsc_1_28_wea);
    xt_rsc_1__28__INST.da(TLS_xt_rsc_1_28_da);
    xt_rsc_1__28__INST.adra(TLS_xt_rsc_1_28_adra);
    xt_rsc_1__28__INST.clk(clk);
    xt_rsc_1__28__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__28__INST.adrb(TLS_xt_rsc_1__28__adrb);
    xt_rsc_1__28__INST.qb(TLS_xt_rsc_1__28__qb);
    xt_rsc_1__28__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_131)));

    xt_rsc_1__29__INST.qa(TLS_xt_rsc_1_29_qa);
    xt_rsc_1__29__INST.wea(TLS_xt_rsc_1_29_wea);
    xt_rsc_1__29__INST.da(TLS_xt_rsc_1_29_da);
    xt_rsc_1__29__INST.adra(TLS_xt_rsc_1_29_adra);
    xt_rsc_1__29__INST.clk(clk);
    xt_rsc_1__29__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__29__INST.adrb(TLS_xt_rsc_1__29__adrb);
    xt_rsc_1__29__INST.qb(TLS_xt_rsc_1__29__qb);
    xt_rsc_1__29__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_132)));

    xt_rsc_1__30__INST.qa(TLS_xt_rsc_1_30_qa);
    xt_rsc_1__30__INST.wea(TLS_xt_rsc_1_30_wea);
    xt_rsc_1__30__INST.da(TLS_xt_rsc_1_30_da);
    xt_rsc_1__30__INST.adra(TLS_xt_rsc_1_30_adra);
    xt_rsc_1__30__INST.clk(clk);
    xt_rsc_1__30__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__30__INST.adrb(TLS_xt_rsc_1__30__adrb);
    xt_rsc_1__30__INST.qb(TLS_xt_rsc_1__30__qb);
    xt_rsc_1__30__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_133)));

    xt_rsc_1__31__INST.qa(TLS_xt_rsc_1_31_qa);
    xt_rsc_1__31__INST.wea(TLS_xt_rsc_1_31_wea);
    xt_rsc_1__31__INST.da(TLS_xt_rsc_1_31_da);
    xt_rsc_1__31__INST.adra(TLS_xt_rsc_1_31_adra);
    xt_rsc_1__31__INST.clk(clk);
    xt_rsc_1__31__INST.clken(SIG_SC_LOGIC_1);
    xt_rsc_1__31__INST.adrb(TLS_xt_rsc_1__31__adrb);
    xt_rsc_1__31__INST.qb(TLS_xt_rsc_1__31__qb);
    xt_rsc_1__31__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_134)));

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
    twiddle_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_135)));

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
    twiddle_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_136)));

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
    twiddle_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_137)));

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
    twiddle_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_138)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWID.outSCALAR(TLS_twiddle_rsc_0_4_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_AWUSER.outSCALAR(TLS_twiddle_rsc_0_4_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_WUSER.outSCALAR(TLS_twiddle_rsc_0_4_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BID.inSCALAR(TLS_twiddle_rsc_0_4_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BUSER.inSCALAR(TLS_twiddle_rsc_0_4_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARID.outSCALAR(TLS_twiddle_rsc_0_4_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_4_ARUSER.outSCALAR(TLS_twiddle_rsc_0_4_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RID.inSCALAR(TLS_twiddle_rsc_0_4_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RUSER.inSCALAR(TLS_twiddle_rsc_0_4_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_4_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_4_RUSER);

    twiddle_rsc_0__4__INST.ACLK(clk);
    twiddle_rsc_0__4__INST.ARESETn(rst);
    twiddle_rsc_0__4__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_4_AWID);
    twiddle_rsc_0__4__INST.AWADDR(TLS_twiddle_rsc_0_4_AWADDR);
    twiddle_rsc_0__4__INST.AWLEN(TLS_twiddle_rsc_0_4_AWLEN);
    twiddle_rsc_0__4__INST.AWSIZE(TLS_twiddle_rsc_0_4_AWSIZE);
    twiddle_rsc_0__4__INST.AWBURST(TLS_twiddle_rsc_0_4_AWBURST);
    twiddle_rsc_0__4__INST.AWLOCK(TLS_twiddle_rsc_0_4_AWLOCK);
    twiddle_rsc_0__4__INST.AWCACHE(TLS_twiddle_rsc_0_4_AWCACHE);
    twiddle_rsc_0__4__INST.AWPROT(TLS_twiddle_rsc_0_4_AWPROT);
    twiddle_rsc_0__4__INST.AWQOS(TLS_twiddle_rsc_0_4_AWQOS);
    twiddle_rsc_0__4__INST.AWREGION(TLS_twiddle_rsc_0_4_AWREGION);
    twiddle_rsc_0__4__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_4_AWUSER);
    twiddle_rsc_0__4__INST.AWVALID(TLS_twiddle_rsc_0_4_AWVALID);
    twiddle_rsc_0__4__INST.AWREADY(TLS_twiddle_rsc_0_4_AWREADY);
    twiddle_rsc_0__4__INST.WDATA(TLS_twiddle_rsc_0_4_WDATA);
    twiddle_rsc_0__4__INST.WSTRB(TLS_twiddle_rsc_0_4_WSTRB);
    twiddle_rsc_0__4__INST.WLAST(TLS_twiddle_rsc_0_4_WLAST);
    twiddle_rsc_0__4__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_4_WUSER);
    twiddle_rsc_0__4__INST.WVALID(TLS_twiddle_rsc_0_4_WVALID);
    twiddle_rsc_0__4__INST.WREADY(TLS_twiddle_rsc_0_4_WREADY);
    twiddle_rsc_0__4__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_4_BID);
    twiddle_rsc_0__4__INST.BRESP(TLS_twiddle_rsc_0_4_BRESP);
    twiddle_rsc_0__4__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_4_BUSER);
    twiddle_rsc_0__4__INST.BVALID(TLS_twiddle_rsc_0_4_BVALID);
    twiddle_rsc_0__4__INST.BREADY(TLS_twiddle_rsc_0_4_BREADY);
    twiddle_rsc_0__4__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_4_ARID);
    twiddle_rsc_0__4__INST.ARADDR(TLS_twiddle_rsc_0_4_ARADDR);
    twiddle_rsc_0__4__INST.ARLEN(TLS_twiddle_rsc_0_4_ARLEN);
    twiddle_rsc_0__4__INST.ARSIZE(TLS_twiddle_rsc_0_4_ARSIZE);
    twiddle_rsc_0__4__INST.ARBURST(TLS_twiddle_rsc_0_4_ARBURST);
    twiddle_rsc_0__4__INST.ARLOCK(TLS_twiddle_rsc_0_4_ARLOCK);
    twiddle_rsc_0__4__INST.ARCACHE(TLS_twiddle_rsc_0_4_ARCACHE);
    twiddle_rsc_0__4__INST.ARPROT(TLS_twiddle_rsc_0_4_ARPROT);
    twiddle_rsc_0__4__INST.ARQOS(TLS_twiddle_rsc_0_4_ARQOS);
    twiddle_rsc_0__4__INST.ARREGION(TLS_twiddle_rsc_0_4_ARREGION);
    twiddle_rsc_0__4__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_4_ARUSER);
    twiddle_rsc_0__4__INST.ARVALID(TLS_twiddle_rsc_0_4_ARVALID);
    twiddle_rsc_0__4__INST.ARREADY(TLS_twiddle_rsc_0_4_ARREADY);
    twiddle_rsc_0__4__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_4_RID);
    twiddle_rsc_0__4__INST.RDATA(TLS_twiddle_rsc_0_4_RDATA);
    twiddle_rsc_0__4__INST.RRESP(TLS_twiddle_rsc_0_4_RRESP);
    twiddle_rsc_0__4__INST.RLAST(TLS_twiddle_rsc_0_4_RLAST);
    twiddle_rsc_0__4__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_4_RUSER);
    twiddle_rsc_0__4__INST.RVALID(TLS_twiddle_rsc_0_4_RVALID);
    twiddle_rsc_0__4__INST.RREADY(TLS_twiddle_rsc_0_4_RREADY);
    twiddle_rsc_0__4__INST.tr_write_done(TLS_twiddle_rsc_0_4_tr_write_done);
    twiddle_rsc_0__4__INST.s_tdone(TLS_twiddle_rsc_0_4_s_tdone);
    twiddle_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_139)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWID.outSCALAR(TLS_twiddle_rsc_0_5_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_AWUSER.outSCALAR(TLS_twiddle_rsc_0_5_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_WUSER.outSCALAR(TLS_twiddle_rsc_0_5_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BID.inSCALAR(TLS_twiddle_rsc_0_5_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BUSER.inSCALAR(TLS_twiddle_rsc_0_5_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARID.outSCALAR(TLS_twiddle_rsc_0_5_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_5_ARUSER.outSCALAR(TLS_twiddle_rsc_0_5_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RID.inSCALAR(TLS_twiddle_rsc_0_5_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RUSER.inSCALAR(TLS_twiddle_rsc_0_5_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_5_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_5_RUSER);

    twiddle_rsc_0__5__INST.ACLK(clk);
    twiddle_rsc_0__5__INST.ARESETn(rst);
    twiddle_rsc_0__5__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_5_AWID);
    twiddle_rsc_0__5__INST.AWADDR(TLS_twiddle_rsc_0_5_AWADDR);
    twiddle_rsc_0__5__INST.AWLEN(TLS_twiddle_rsc_0_5_AWLEN);
    twiddle_rsc_0__5__INST.AWSIZE(TLS_twiddle_rsc_0_5_AWSIZE);
    twiddle_rsc_0__5__INST.AWBURST(TLS_twiddle_rsc_0_5_AWBURST);
    twiddle_rsc_0__5__INST.AWLOCK(TLS_twiddle_rsc_0_5_AWLOCK);
    twiddle_rsc_0__5__INST.AWCACHE(TLS_twiddle_rsc_0_5_AWCACHE);
    twiddle_rsc_0__5__INST.AWPROT(TLS_twiddle_rsc_0_5_AWPROT);
    twiddle_rsc_0__5__INST.AWQOS(TLS_twiddle_rsc_0_5_AWQOS);
    twiddle_rsc_0__5__INST.AWREGION(TLS_twiddle_rsc_0_5_AWREGION);
    twiddle_rsc_0__5__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_5_AWUSER);
    twiddle_rsc_0__5__INST.AWVALID(TLS_twiddle_rsc_0_5_AWVALID);
    twiddle_rsc_0__5__INST.AWREADY(TLS_twiddle_rsc_0_5_AWREADY);
    twiddle_rsc_0__5__INST.WDATA(TLS_twiddle_rsc_0_5_WDATA);
    twiddle_rsc_0__5__INST.WSTRB(TLS_twiddle_rsc_0_5_WSTRB);
    twiddle_rsc_0__5__INST.WLAST(TLS_twiddle_rsc_0_5_WLAST);
    twiddle_rsc_0__5__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_5_WUSER);
    twiddle_rsc_0__5__INST.WVALID(TLS_twiddle_rsc_0_5_WVALID);
    twiddle_rsc_0__5__INST.WREADY(TLS_twiddle_rsc_0_5_WREADY);
    twiddle_rsc_0__5__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_5_BID);
    twiddle_rsc_0__5__INST.BRESP(TLS_twiddle_rsc_0_5_BRESP);
    twiddle_rsc_0__5__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_5_BUSER);
    twiddle_rsc_0__5__INST.BVALID(TLS_twiddle_rsc_0_5_BVALID);
    twiddle_rsc_0__5__INST.BREADY(TLS_twiddle_rsc_0_5_BREADY);
    twiddle_rsc_0__5__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_5_ARID);
    twiddle_rsc_0__5__INST.ARADDR(TLS_twiddle_rsc_0_5_ARADDR);
    twiddle_rsc_0__5__INST.ARLEN(TLS_twiddle_rsc_0_5_ARLEN);
    twiddle_rsc_0__5__INST.ARSIZE(TLS_twiddle_rsc_0_5_ARSIZE);
    twiddle_rsc_0__5__INST.ARBURST(TLS_twiddle_rsc_0_5_ARBURST);
    twiddle_rsc_0__5__INST.ARLOCK(TLS_twiddle_rsc_0_5_ARLOCK);
    twiddle_rsc_0__5__INST.ARCACHE(TLS_twiddle_rsc_0_5_ARCACHE);
    twiddle_rsc_0__5__INST.ARPROT(TLS_twiddle_rsc_0_5_ARPROT);
    twiddle_rsc_0__5__INST.ARQOS(TLS_twiddle_rsc_0_5_ARQOS);
    twiddle_rsc_0__5__INST.ARREGION(TLS_twiddle_rsc_0_5_ARREGION);
    twiddle_rsc_0__5__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_5_ARUSER);
    twiddle_rsc_0__5__INST.ARVALID(TLS_twiddle_rsc_0_5_ARVALID);
    twiddle_rsc_0__5__INST.ARREADY(TLS_twiddle_rsc_0_5_ARREADY);
    twiddle_rsc_0__5__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_5_RID);
    twiddle_rsc_0__5__INST.RDATA(TLS_twiddle_rsc_0_5_RDATA);
    twiddle_rsc_0__5__INST.RRESP(TLS_twiddle_rsc_0_5_RRESP);
    twiddle_rsc_0__5__INST.RLAST(TLS_twiddle_rsc_0_5_RLAST);
    twiddle_rsc_0__5__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_5_RUSER);
    twiddle_rsc_0__5__INST.RVALID(TLS_twiddle_rsc_0_5_RVALID);
    twiddle_rsc_0__5__INST.RREADY(TLS_twiddle_rsc_0_5_RREADY);
    twiddle_rsc_0__5__INST.tr_write_done(TLS_twiddle_rsc_0_5_tr_write_done);
    twiddle_rsc_0__5__INST.s_tdone(TLS_twiddle_rsc_0_5_s_tdone);
    twiddle_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_140)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWID.outSCALAR(TLS_twiddle_rsc_0_6_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_AWUSER.outSCALAR(TLS_twiddle_rsc_0_6_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_WUSER.outSCALAR(TLS_twiddle_rsc_0_6_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BID.inSCALAR(TLS_twiddle_rsc_0_6_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BUSER.inSCALAR(TLS_twiddle_rsc_0_6_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARID.outSCALAR(TLS_twiddle_rsc_0_6_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_6_ARUSER.outSCALAR(TLS_twiddle_rsc_0_6_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RID.inSCALAR(TLS_twiddle_rsc_0_6_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RUSER.inSCALAR(TLS_twiddle_rsc_0_6_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_6_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_6_RUSER);

    twiddle_rsc_0__6__INST.ACLK(clk);
    twiddle_rsc_0__6__INST.ARESETn(rst);
    twiddle_rsc_0__6__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_6_AWID);
    twiddle_rsc_0__6__INST.AWADDR(TLS_twiddle_rsc_0_6_AWADDR);
    twiddle_rsc_0__6__INST.AWLEN(TLS_twiddle_rsc_0_6_AWLEN);
    twiddle_rsc_0__6__INST.AWSIZE(TLS_twiddle_rsc_0_6_AWSIZE);
    twiddle_rsc_0__6__INST.AWBURST(TLS_twiddle_rsc_0_6_AWBURST);
    twiddle_rsc_0__6__INST.AWLOCK(TLS_twiddle_rsc_0_6_AWLOCK);
    twiddle_rsc_0__6__INST.AWCACHE(TLS_twiddle_rsc_0_6_AWCACHE);
    twiddle_rsc_0__6__INST.AWPROT(TLS_twiddle_rsc_0_6_AWPROT);
    twiddle_rsc_0__6__INST.AWQOS(TLS_twiddle_rsc_0_6_AWQOS);
    twiddle_rsc_0__6__INST.AWREGION(TLS_twiddle_rsc_0_6_AWREGION);
    twiddle_rsc_0__6__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_6_AWUSER);
    twiddle_rsc_0__6__INST.AWVALID(TLS_twiddle_rsc_0_6_AWVALID);
    twiddle_rsc_0__6__INST.AWREADY(TLS_twiddle_rsc_0_6_AWREADY);
    twiddle_rsc_0__6__INST.WDATA(TLS_twiddle_rsc_0_6_WDATA);
    twiddle_rsc_0__6__INST.WSTRB(TLS_twiddle_rsc_0_6_WSTRB);
    twiddle_rsc_0__6__INST.WLAST(TLS_twiddle_rsc_0_6_WLAST);
    twiddle_rsc_0__6__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_6_WUSER);
    twiddle_rsc_0__6__INST.WVALID(TLS_twiddle_rsc_0_6_WVALID);
    twiddle_rsc_0__6__INST.WREADY(TLS_twiddle_rsc_0_6_WREADY);
    twiddle_rsc_0__6__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_6_BID);
    twiddle_rsc_0__6__INST.BRESP(TLS_twiddle_rsc_0_6_BRESP);
    twiddle_rsc_0__6__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_6_BUSER);
    twiddle_rsc_0__6__INST.BVALID(TLS_twiddle_rsc_0_6_BVALID);
    twiddle_rsc_0__6__INST.BREADY(TLS_twiddle_rsc_0_6_BREADY);
    twiddle_rsc_0__6__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_6_ARID);
    twiddle_rsc_0__6__INST.ARADDR(TLS_twiddle_rsc_0_6_ARADDR);
    twiddle_rsc_0__6__INST.ARLEN(TLS_twiddle_rsc_0_6_ARLEN);
    twiddle_rsc_0__6__INST.ARSIZE(TLS_twiddle_rsc_0_6_ARSIZE);
    twiddle_rsc_0__6__INST.ARBURST(TLS_twiddle_rsc_0_6_ARBURST);
    twiddle_rsc_0__6__INST.ARLOCK(TLS_twiddle_rsc_0_6_ARLOCK);
    twiddle_rsc_0__6__INST.ARCACHE(TLS_twiddle_rsc_0_6_ARCACHE);
    twiddle_rsc_0__6__INST.ARPROT(TLS_twiddle_rsc_0_6_ARPROT);
    twiddle_rsc_0__6__INST.ARQOS(TLS_twiddle_rsc_0_6_ARQOS);
    twiddle_rsc_0__6__INST.ARREGION(TLS_twiddle_rsc_0_6_ARREGION);
    twiddle_rsc_0__6__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_6_ARUSER);
    twiddle_rsc_0__6__INST.ARVALID(TLS_twiddle_rsc_0_6_ARVALID);
    twiddle_rsc_0__6__INST.ARREADY(TLS_twiddle_rsc_0_6_ARREADY);
    twiddle_rsc_0__6__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_6_RID);
    twiddle_rsc_0__6__INST.RDATA(TLS_twiddle_rsc_0_6_RDATA);
    twiddle_rsc_0__6__INST.RRESP(TLS_twiddle_rsc_0_6_RRESP);
    twiddle_rsc_0__6__INST.RLAST(TLS_twiddle_rsc_0_6_RLAST);
    twiddle_rsc_0__6__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_6_RUSER);
    twiddle_rsc_0__6__INST.RVALID(TLS_twiddle_rsc_0_6_RVALID);
    twiddle_rsc_0__6__INST.RREADY(TLS_twiddle_rsc_0_6_RREADY);
    twiddle_rsc_0__6__INST.tr_write_done(TLS_twiddle_rsc_0_6_tr_write_done);
    twiddle_rsc_0__6__INST.s_tdone(TLS_twiddle_rsc_0_6_s_tdone);
    twiddle_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_141)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWID.outSCALAR(TLS_twiddle_rsc_0_7_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_AWUSER.outSCALAR(TLS_twiddle_rsc_0_7_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_WUSER.outSCALAR(TLS_twiddle_rsc_0_7_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BID.inSCALAR(TLS_twiddle_rsc_0_7_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BUSER.inSCALAR(TLS_twiddle_rsc_0_7_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARID.outSCALAR(TLS_twiddle_rsc_0_7_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_7_ARUSER.outSCALAR(TLS_twiddle_rsc_0_7_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RID.inSCALAR(TLS_twiddle_rsc_0_7_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RUSER.inSCALAR(TLS_twiddle_rsc_0_7_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_7_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_7_RUSER);

    twiddle_rsc_0__7__INST.ACLK(clk);
    twiddle_rsc_0__7__INST.ARESETn(rst);
    twiddle_rsc_0__7__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_7_AWID);
    twiddle_rsc_0__7__INST.AWADDR(TLS_twiddle_rsc_0_7_AWADDR);
    twiddle_rsc_0__7__INST.AWLEN(TLS_twiddle_rsc_0_7_AWLEN);
    twiddle_rsc_0__7__INST.AWSIZE(TLS_twiddle_rsc_0_7_AWSIZE);
    twiddle_rsc_0__7__INST.AWBURST(TLS_twiddle_rsc_0_7_AWBURST);
    twiddle_rsc_0__7__INST.AWLOCK(TLS_twiddle_rsc_0_7_AWLOCK);
    twiddle_rsc_0__7__INST.AWCACHE(TLS_twiddle_rsc_0_7_AWCACHE);
    twiddle_rsc_0__7__INST.AWPROT(TLS_twiddle_rsc_0_7_AWPROT);
    twiddle_rsc_0__7__INST.AWQOS(TLS_twiddle_rsc_0_7_AWQOS);
    twiddle_rsc_0__7__INST.AWREGION(TLS_twiddle_rsc_0_7_AWREGION);
    twiddle_rsc_0__7__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_7_AWUSER);
    twiddle_rsc_0__7__INST.AWVALID(TLS_twiddle_rsc_0_7_AWVALID);
    twiddle_rsc_0__7__INST.AWREADY(TLS_twiddle_rsc_0_7_AWREADY);
    twiddle_rsc_0__7__INST.WDATA(TLS_twiddle_rsc_0_7_WDATA);
    twiddle_rsc_0__7__INST.WSTRB(TLS_twiddle_rsc_0_7_WSTRB);
    twiddle_rsc_0__7__INST.WLAST(TLS_twiddle_rsc_0_7_WLAST);
    twiddle_rsc_0__7__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_7_WUSER);
    twiddle_rsc_0__7__INST.WVALID(TLS_twiddle_rsc_0_7_WVALID);
    twiddle_rsc_0__7__INST.WREADY(TLS_twiddle_rsc_0_7_WREADY);
    twiddle_rsc_0__7__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_7_BID);
    twiddle_rsc_0__7__INST.BRESP(TLS_twiddle_rsc_0_7_BRESP);
    twiddle_rsc_0__7__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_7_BUSER);
    twiddle_rsc_0__7__INST.BVALID(TLS_twiddle_rsc_0_7_BVALID);
    twiddle_rsc_0__7__INST.BREADY(TLS_twiddle_rsc_0_7_BREADY);
    twiddle_rsc_0__7__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_7_ARID);
    twiddle_rsc_0__7__INST.ARADDR(TLS_twiddle_rsc_0_7_ARADDR);
    twiddle_rsc_0__7__INST.ARLEN(TLS_twiddle_rsc_0_7_ARLEN);
    twiddle_rsc_0__7__INST.ARSIZE(TLS_twiddle_rsc_0_7_ARSIZE);
    twiddle_rsc_0__7__INST.ARBURST(TLS_twiddle_rsc_0_7_ARBURST);
    twiddle_rsc_0__7__INST.ARLOCK(TLS_twiddle_rsc_0_7_ARLOCK);
    twiddle_rsc_0__7__INST.ARCACHE(TLS_twiddle_rsc_0_7_ARCACHE);
    twiddle_rsc_0__7__INST.ARPROT(TLS_twiddle_rsc_0_7_ARPROT);
    twiddle_rsc_0__7__INST.ARQOS(TLS_twiddle_rsc_0_7_ARQOS);
    twiddle_rsc_0__7__INST.ARREGION(TLS_twiddle_rsc_0_7_ARREGION);
    twiddle_rsc_0__7__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_7_ARUSER);
    twiddle_rsc_0__7__INST.ARVALID(TLS_twiddle_rsc_0_7_ARVALID);
    twiddle_rsc_0__7__INST.ARREADY(TLS_twiddle_rsc_0_7_ARREADY);
    twiddle_rsc_0__7__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_7_RID);
    twiddle_rsc_0__7__INST.RDATA(TLS_twiddle_rsc_0_7_RDATA);
    twiddle_rsc_0__7__INST.RRESP(TLS_twiddle_rsc_0_7_RRESP);
    twiddle_rsc_0__7__INST.RLAST(TLS_twiddle_rsc_0_7_RLAST);
    twiddle_rsc_0__7__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_7_RUSER);
    twiddle_rsc_0__7__INST.RVALID(TLS_twiddle_rsc_0_7_RVALID);
    twiddle_rsc_0__7__INST.RREADY(TLS_twiddle_rsc_0_7_RREADY);
    twiddle_rsc_0__7__INST.tr_write_done(TLS_twiddle_rsc_0_7_tr_write_done);
    twiddle_rsc_0__7__INST.s_tdone(TLS_twiddle_rsc_0_7_s_tdone);
    twiddle_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_142)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWID.outSCALAR(TLS_twiddle_rsc_0_8_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_AWUSER.outSCALAR(TLS_twiddle_rsc_0_8_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_WUSER.outSCALAR(TLS_twiddle_rsc_0_8_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BID.inSCALAR(TLS_twiddle_rsc_0_8_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BUSER.inSCALAR(TLS_twiddle_rsc_0_8_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARID.outSCALAR(TLS_twiddle_rsc_0_8_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_8_ARUSER.outSCALAR(TLS_twiddle_rsc_0_8_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RID.inSCALAR(TLS_twiddle_rsc_0_8_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RUSER.inSCALAR(TLS_twiddle_rsc_0_8_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_8_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_8_RUSER);

    twiddle_rsc_0__8__INST.ACLK(clk);
    twiddle_rsc_0__8__INST.ARESETn(rst);
    twiddle_rsc_0__8__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_8_AWID);
    twiddle_rsc_0__8__INST.AWADDR(TLS_twiddle_rsc_0_8_AWADDR);
    twiddle_rsc_0__8__INST.AWLEN(TLS_twiddle_rsc_0_8_AWLEN);
    twiddle_rsc_0__8__INST.AWSIZE(TLS_twiddle_rsc_0_8_AWSIZE);
    twiddle_rsc_0__8__INST.AWBURST(TLS_twiddle_rsc_0_8_AWBURST);
    twiddle_rsc_0__8__INST.AWLOCK(TLS_twiddle_rsc_0_8_AWLOCK);
    twiddle_rsc_0__8__INST.AWCACHE(TLS_twiddle_rsc_0_8_AWCACHE);
    twiddle_rsc_0__8__INST.AWPROT(TLS_twiddle_rsc_0_8_AWPROT);
    twiddle_rsc_0__8__INST.AWQOS(TLS_twiddle_rsc_0_8_AWQOS);
    twiddle_rsc_0__8__INST.AWREGION(TLS_twiddle_rsc_0_8_AWREGION);
    twiddle_rsc_0__8__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_8_AWUSER);
    twiddle_rsc_0__8__INST.AWVALID(TLS_twiddle_rsc_0_8_AWVALID);
    twiddle_rsc_0__8__INST.AWREADY(TLS_twiddle_rsc_0_8_AWREADY);
    twiddle_rsc_0__8__INST.WDATA(TLS_twiddle_rsc_0_8_WDATA);
    twiddle_rsc_0__8__INST.WSTRB(TLS_twiddle_rsc_0_8_WSTRB);
    twiddle_rsc_0__8__INST.WLAST(TLS_twiddle_rsc_0_8_WLAST);
    twiddle_rsc_0__8__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_8_WUSER);
    twiddle_rsc_0__8__INST.WVALID(TLS_twiddle_rsc_0_8_WVALID);
    twiddle_rsc_0__8__INST.WREADY(TLS_twiddle_rsc_0_8_WREADY);
    twiddle_rsc_0__8__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_8_BID);
    twiddle_rsc_0__8__INST.BRESP(TLS_twiddle_rsc_0_8_BRESP);
    twiddle_rsc_0__8__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_8_BUSER);
    twiddle_rsc_0__8__INST.BVALID(TLS_twiddle_rsc_0_8_BVALID);
    twiddle_rsc_0__8__INST.BREADY(TLS_twiddle_rsc_0_8_BREADY);
    twiddle_rsc_0__8__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_8_ARID);
    twiddle_rsc_0__8__INST.ARADDR(TLS_twiddle_rsc_0_8_ARADDR);
    twiddle_rsc_0__8__INST.ARLEN(TLS_twiddle_rsc_0_8_ARLEN);
    twiddle_rsc_0__8__INST.ARSIZE(TLS_twiddle_rsc_0_8_ARSIZE);
    twiddle_rsc_0__8__INST.ARBURST(TLS_twiddle_rsc_0_8_ARBURST);
    twiddle_rsc_0__8__INST.ARLOCK(TLS_twiddle_rsc_0_8_ARLOCK);
    twiddle_rsc_0__8__INST.ARCACHE(TLS_twiddle_rsc_0_8_ARCACHE);
    twiddle_rsc_0__8__INST.ARPROT(TLS_twiddle_rsc_0_8_ARPROT);
    twiddle_rsc_0__8__INST.ARQOS(TLS_twiddle_rsc_0_8_ARQOS);
    twiddle_rsc_0__8__INST.ARREGION(TLS_twiddle_rsc_0_8_ARREGION);
    twiddle_rsc_0__8__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_8_ARUSER);
    twiddle_rsc_0__8__INST.ARVALID(TLS_twiddle_rsc_0_8_ARVALID);
    twiddle_rsc_0__8__INST.ARREADY(TLS_twiddle_rsc_0_8_ARREADY);
    twiddle_rsc_0__8__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_8_RID);
    twiddle_rsc_0__8__INST.RDATA(TLS_twiddle_rsc_0_8_RDATA);
    twiddle_rsc_0__8__INST.RRESP(TLS_twiddle_rsc_0_8_RRESP);
    twiddle_rsc_0__8__INST.RLAST(TLS_twiddle_rsc_0_8_RLAST);
    twiddle_rsc_0__8__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_8_RUSER);
    twiddle_rsc_0__8__INST.RVALID(TLS_twiddle_rsc_0_8_RVALID);
    twiddle_rsc_0__8__INST.RREADY(TLS_twiddle_rsc_0_8_RREADY);
    twiddle_rsc_0__8__INST.tr_write_done(TLS_twiddle_rsc_0_8_tr_write_done);
    twiddle_rsc_0__8__INST.s_tdone(TLS_twiddle_rsc_0_8_s_tdone);
    twiddle_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_143)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWID.outSCALAR(TLS_twiddle_rsc_0_9_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_AWUSER.outSCALAR(TLS_twiddle_rsc_0_9_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_WUSER.outSCALAR(TLS_twiddle_rsc_0_9_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BID.inSCALAR(TLS_twiddle_rsc_0_9_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BUSER.inSCALAR(TLS_twiddle_rsc_0_9_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARID.outSCALAR(TLS_twiddle_rsc_0_9_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_9_ARUSER.outSCALAR(TLS_twiddle_rsc_0_9_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RID.inSCALAR(TLS_twiddle_rsc_0_9_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RUSER.inSCALAR(TLS_twiddle_rsc_0_9_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_9_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_9_RUSER);

    twiddle_rsc_0__9__INST.ACLK(clk);
    twiddle_rsc_0__9__INST.ARESETn(rst);
    twiddle_rsc_0__9__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_9_AWID);
    twiddle_rsc_0__9__INST.AWADDR(TLS_twiddle_rsc_0_9_AWADDR);
    twiddle_rsc_0__9__INST.AWLEN(TLS_twiddle_rsc_0_9_AWLEN);
    twiddle_rsc_0__9__INST.AWSIZE(TLS_twiddle_rsc_0_9_AWSIZE);
    twiddle_rsc_0__9__INST.AWBURST(TLS_twiddle_rsc_0_9_AWBURST);
    twiddle_rsc_0__9__INST.AWLOCK(TLS_twiddle_rsc_0_9_AWLOCK);
    twiddle_rsc_0__9__INST.AWCACHE(TLS_twiddle_rsc_0_9_AWCACHE);
    twiddle_rsc_0__9__INST.AWPROT(TLS_twiddle_rsc_0_9_AWPROT);
    twiddle_rsc_0__9__INST.AWQOS(TLS_twiddle_rsc_0_9_AWQOS);
    twiddle_rsc_0__9__INST.AWREGION(TLS_twiddle_rsc_0_9_AWREGION);
    twiddle_rsc_0__9__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_9_AWUSER);
    twiddle_rsc_0__9__INST.AWVALID(TLS_twiddle_rsc_0_9_AWVALID);
    twiddle_rsc_0__9__INST.AWREADY(TLS_twiddle_rsc_0_9_AWREADY);
    twiddle_rsc_0__9__INST.WDATA(TLS_twiddle_rsc_0_9_WDATA);
    twiddle_rsc_0__9__INST.WSTRB(TLS_twiddle_rsc_0_9_WSTRB);
    twiddle_rsc_0__9__INST.WLAST(TLS_twiddle_rsc_0_9_WLAST);
    twiddle_rsc_0__9__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_9_WUSER);
    twiddle_rsc_0__9__INST.WVALID(TLS_twiddle_rsc_0_9_WVALID);
    twiddle_rsc_0__9__INST.WREADY(TLS_twiddle_rsc_0_9_WREADY);
    twiddle_rsc_0__9__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_9_BID);
    twiddle_rsc_0__9__INST.BRESP(TLS_twiddle_rsc_0_9_BRESP);
    twiddle_rsc_0__9__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_9_BUSER);
    twiddle_rsc_0__9__INST.BVALID(TLS_twiddle_rsc_0_9_BVALID);
    twiddle_rsc_0__9__INST.BREADY(TLS_twiddle_rsc_0_9_BREADY);
    twiddle_rsc_0__9__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_9_ARID);
    twiddle_rsc_0__9__INST.ARADDR(TLS_twiddle_rsc_0_9_ARADDR);
    twiddle_rsc_0__9__INST.ARLEN(TLS_twiddle_rsc_0_9_ARLEN);
    twiddle_rsc_0__9__INST.ARSIZE(TLS_twiddle_rsc_0_9_ARSIZE);
    twiddle_rsc_0__9__INST.ARBURST(TLS_twiddle_rsc_0_9_ARBURST);
    twiddle_rsc_0__9__INST.ARLOCK(TLS_twiddle_rsc_0_9_ARLOCK);
    twiddle_rsc_0__9__INST.ARCACHE(TLS_twiddle_rsc_0_9_ARCACHE);
    twiddle_rsc_0__9__INST.ARPROT(TLS_twiddle_rsc_0_9_ARPROT);
    twiddle_rsc_0__9__INST.ARQOS(TLS_twiddle_rsc_0_9_ARQOS);
    twiddle_rsc_0__9__INST.ARREGION(TLS_twiddle_rsc_0_9_ARREGION);
    twiddle_rsc_0__9__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_9_ARUSER);
    twiddle_rsc_0__9__INST.ARVALID(TLS_twiddle_rsc_0_9_ARVALID);
    twiddle_rsc_0__9__INST.ARREADY(TLS_twiddle_rsc_0_9_ARREADY);
    twiddle_rsc_0__9__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_9_RID);
    twiddle_rsc_0__9__INST.RDATA(TLS_twiddle_rsc_0_9_RDATA);
    twiddle_rsc_0__9__INST.RRESP(TLS_twiddle_rsc_0_9_RRESP);
    twiddle_rsc_0__9__INST.RLAST(TLS_twiddle_rsc_0_9_RLAST);
    twiddle_rsc_0__9__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_9_RUSER);
    twiddle_rsc_0__9__INST.RVALID(TLS_twiddle_rsc_0_9_RVALID);
    twiddle_rsc_0__9__INST.RREADY(TLS_twiddle_rsc_0_9_RREADY);
    twiddle_rsc_0__9__INST.tr_write_done(TLS_twiddle_rsc_0_9_tr_write_done);
    twiddle_rsc_0__9__INST.s_tdone(TLS_twiddle_rsc_0_9_s_tdone);
    twiddle_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_144)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWID.outSCALAR(TLS_twiddle_rsc_0_10_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_AWUSER.outSCALAR(TLS_twiddle_rsc_0_10_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_WUSER.outSCALAR(TLS_twiddle_rsc_0_10_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BID.inSCALAR(TLS_twiddle_rsc_0_10_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BUSER.inSCALAR(TLS_twiddle_rsc_0_10_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARID.outSCALAR(TLS_twiddle_rsc_0_10_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_10_ARUSER.outSCALAR(TLS_twiddle_rsc_0_10_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RID.inSCALAR(TLS_twiddle_rsc_0_10_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RUSER.inSCALAR(TLS_twiddle_rsc_0_10_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_10_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_10_RUSER);

    twiddle_rsc_0__10__INST.ACLK(clk);
    twiddle_rsc_0__10__INST.ARESETn(rst);
    twiddle_rsc_0__10__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_10_AWID);
    twiddle_rsc_0__10__INST.AWADDR(TLS_twiddle_rsc_0_10_AWADDR);
    twiddle_rsc_0__10__INST.AWLEN(TLS_twiddle_rsc_0_10_AWLEN);
    twiddle_rsc_0__10__INST.AWSIZE(TLS_twiddle_rsc_0_10_AWSIZE);
    twiddle_rsc_0__10__INST.AWBURST(TLS_twiddle_rsc_0_10_AWBURST);
    twiddle_rsc_0__10__INST.AWLOCK(TLS_twiddle_rsc_0_10_AWLOCK);
    twiddle_rsc_0__10__INST.AWCACHE(TLS_twiddle_rsc_0_10_AWCACHE);
    twiddle_rsc_0__10__INST.AWPROT(TLS_twiddle_rsc_0_10_AWPROT);
    twiddle_rsc_0__10__INST.AWQOS(TLS_twiddle_rsc_0_10_AWQOS);
    twiddle_rsc_0__10__INST.AWREGION(TLS_twiddle_rsc_0_10_AWREGION);
    twiddle_rsc_0__10__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_10_AWUSER);
    twiddle_rsc_0__10__INST.AWVALID(TLS_twiddle_rsc_0_10_AWVALID);
    twiddle_rsc_0__10__INST.AWREADY(TLS_twiddle_rsc_0_10_AWREADY);
    twiddle_rsc_0__10__INST.WDATA(TLS_twiddle_rsc_0_10_WDATA);
    twiddle_rsc_0__10__INST.WSTRB(TLS_twiddle_rsc_0_10_WSTRB);
    twiddle_rsc_0__10__INST.WLAST(TLS_twiddle_rsc_0_10_WLAST);
    twiddle_rsc_0__10__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_10_WUSER);
    twiddle_rsc_0__10__INST.WVALID(TLS_twiddle_rsc_0_10_WVALID);
    twiddle_rsc_0__10__INST.WREADY(TLS_twiddle_rsc_0_10_WREADY);
    twiddle_rsc_0__10__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_10_BID);
    twiddle_rsc_0__10__INST.BRESP(TLS_twiddle_rsc_0_10_BRESP);
    twiddle_rsc_0__10__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_10_BUSER);
    twiddle_rsc_0__10__INST.BVALID(TLS_twiddle_rsc_0_10_BVALID);
    twiddle_rsc_0__10__INST.BREADY(TLS_twiddle_rsc_0_10_BREADY);
    twiddle_rsc_0__10__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_10_ARID);
    twiddle_rsc_0__10__INST.ARADDR(TLS_twiddle_rsc_0_10_ARADDR);
    twiddle_rsc_0__10__INST.ARLEN(TLS_twiddle_rsc_0_10_ARLEN);
    twiddle_rsc_0__10__INST.ARSIZE(TLS_twiddle_rsc_0_10_ARSIZE);
    twiddle_rsc_0__10__INST.ARBURST(TLS_twiddle_rsc_0_10_ARBURST);
    twiddle_rsc_0__10__INST.ARLOCK(TLS_twiddle_rsc_0_10_ARLOCK);
    twiddle_rsc_0__10__INST.ARCACHE(TLS_twiddle_rsc_0_10_ARCACHE);
    twiddle_rsc_0__10__INST.ARPROT(TLS_twiddle_rsc_0_10_ARPROT);
    twiddle_rsc_0__10__INST.ARQOS(TLS_twiddle_rsc_0_10_ARQOS);
    twiddle_rsc_0__10__INST.ARREGION(TLS_twiddle_rsc_0_10_ARREGION);
    twiddle_rsc_0__10__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_10_ARUSER);
    twiddle_rsc_0__10__INST.ARVALID(TLS_twiddle_rsc_0_10_ARVALID);
    twiddle_rsc_0__10__INST.ARREADY(TLS_twiddle_rsc_0_10_ARREADY);
    twiddle_rsc_0__10__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_10_RID);
    twiddle_rsc_0__10__INST.RDATA(TLS_twiddle_rsc_0_10_RDATA);
    twiddle_rsc_0__10__INST.RRESP(TLS_twiddle_rsc_0_10_RRESP);
    twiddle_rsc_0__10__INST.RLAST(TLS_twiddle_rsc_0_10_RLAST);
    twiddle_rsc_0__10__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_10_RUSER);
    twiddle_rsc_0__10__INST.RVALID(TLS_twiddle_rsc_0_10_RVALID);
    twiddle_rsc_0__10__INST.RREADY(TLS_twiddle_rsc_0_10_RREADY);
    twiddle_rsc_0__10__INST.tr_write_done(TLS_twiddle_rsc_0_10_tr_write_done);
    twiddle_rsc_0__10__INST.s_tdone(TLS_twiddle_rsc_0_10_s_tdone);
    twiddle_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_145)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWID.outSCALAR(TLS_twiddle_rsc_0_11_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_AWUSER.outSCALAR(TLS_twiddle_rsc_0_11_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_WUSER.outSCALAR(TLS_twiddle_rsc_0_11_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BID.inSCALAR(TLS_twiddle_rsc_0_11_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BUSER.inSCALAR(TLS_twiddle_rsc_0_11_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARID.outSCALAR(TLS_twiddle_rsc_0_11_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_11_ARUSER.outSCALAR(TLS_twiddle_rsc_0_11_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RID.inSCALAR(TLS_twiddle_rsc_0_11_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RUSER.inSCALAR(TLS_twiddle_rsc_0_11_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_11_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_11_RUSER);

    twiddle_rsc_0__11__INST.ACLK(clk);
    twiddle_rsc_0__11__INST.ARESETn(rst);
    twiddle_rsc_0__11__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_11_AWID);
    twiddle_rsc_0__11__INST.AWADDR(TLS_twiddle_rsc_0_11_AWADDR);
    twiddle_rsc_0__11__INST.AWLEN(TLS_twiddle_rsc_0_11_AWLEN);
    twiddle_rsc_0__11__INST.AWSIZE(TLS_twiddle_rsc_0_11_AWSIZE);
    twiddle_rsc_0__11__INST.AWBURST(TLS_twiddle_rsc_0_11_AWBURST);
    twiddle_rsc_0__11__INST.AWLOCK(TLS_twiddle_rsc_0_11_AWLOCK);
    twiddle_rsc_0__11__INST.AWCACHE(TLS_twiddle_rsc_0_11_AWCACHE);
    twiddle_rsc_0__11__INST.AWPROT(TLS_twiddle_rsc_0_11_AWPROT);
    twiddle_rsc_0__11__INST.AWQOS(TLS_twiddle_rsc_0_11_AWQOS);
    twiddle_rsc_0__11__INST.AWREGION(TLS_twiddle_rsc_0_11_AWREGION);
    twiddle_rsc_0__11__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_11_AWUSER);
    twiddle_rsc_0__11__INST.AWVALID(TLS_twiddle_rsc_0_11_AWVALID);
    twiddle_rsc_0__11__INST.AWREADY(TLS_twiddle_rsc_0_11_AWREADY);
    twiddle_rsc_0__11__INST.WDATA(TLS_twiddle_rsc_0_11_WDATA);
    twiddle_rsc_0__11__INST.WSTRB(TLS_twiddle_rsc_0_11_WSTRB);
    twiddle_rsc_0__11__INST.WLAST(TLS_twiddle_rsc_0_11_WLAST);
    twiddle_rsc_0__11__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_11_WUSER);
    twiddle_rsc_0__11__INST.WVALID(TLS_twiddle_rsc_0_11_WVALID);
    twiddle_rsc_0__11__INST.WREADY(TLS_twiddle_rsc_0_11_WREADY);
    twiddle_rsc_0__11__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_11_BID);
    twiddle_rsc_0__11__INST.BRESP(TLS_twiddle_rsc_0_11_BRESP);
    twiddle_rsc_0__11__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_11_BUSER);
    twiddle_rsc_0__11__INST.BVALID(TLS_twiddle_rsc_0_11_BVALID);
    twiddle_rsc_0__11__INST.BREADY(TLS_twiddle_rsc_0_11_BREADY);
    twiddle_rsc_0__11__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_11_ARID);
    twiddle_rsc_0__11__INST.ARADDR(TLS_twiddle_rsc_0_11_ARADDR);
    twiddle_rsc_0__11__INST.ARLEN(TLS_twiddle_rsc_0_11_ARLEN);
    twiddle_rsc_0__11__INST.ARSIZE(TLS_twiddle_rsc_0_11_ARSIZE);
    twiddle_rsc_0__11__INST.ARBURST(TLS_twiddle_rsc_0_11_ARBURST);
    twiddle_rsc_0__11__INST.ARLOCK(TLS_twiddle_rsc_0_11_ARLOCK);
    twiddle_rsc_0__11__INST.ARCACHE(TLS_twiddle_rsc_0_11_ARCACHE);
    twiddle_rsc_0__11__INST.ARPROT(TLS_twiddle_rsc_0_11_ARPROT);
    twiddle_rsc_0__11__INST.ARQOS(TLS_twiddle_rsc_0_11_ARQOS);
    twiddle_rsc_0__11__INST.ARREGION(TLS_twiddle_rsc_0_11_ARREGION);
    twiddle_rsc_0__11__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_11_ARUSER);
    twiddle_rsc_0__11__INST.ARVALID(TLS_twiddle_rsc_0_11_ARVALID);
    twiddle_rsc_0__11__INST.ARREADY(TLS_twiddle_rsc_0_11_ARREADY);
    twiddle_rsc_0__11__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_11_RID);
    twiddle_rsc_0__11__INST.RDATA(TLS_twiddle_rsc_0_11_RDATA);
    twiddle_rsc_0__11__INST.RRESP(TLS_twiddle_rsc_0_11_RRESP);
    twiddle_rsc_0__11__INST.RLAST(TLS_twiddle_rsc_0_11_RLAST);
    twiddle_rsc_0__11__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_11_RUSER);
    twiddle_rsc_0__11__INST.RVALID(TLS_twiddle_rsc_0_11_RVALID);
    twiddle_rsc_0__11__INST.RREADY(TLS_twiddle_rsc_0_11_RREADY);
    twiddle_rsc_0__11__INST.tr_write_done(TLS_twiddle_rsc_0_11_tr_write_done);
    twiddle_rsc_0__11__INST.s_tdone(TLS_twiddle_rsc_0_11_s_tdone);
    twiddle_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_146)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWID.outSCALAR(TLS_twiddle_rsc_0_12_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_AWUSER.outSCALAR(TLS_twiddle_rsc_0_12_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_WUSER.outSCALAR(TLS_twiddle_rsc_0_12_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BID.inSCALAR(TLS_twiddle_rsc_0_12_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BUSER.inSCALAR(TLS_twiddle_rsc_0_12_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARID.outSCALAR(TLS_twiddle_rsc_0_12_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_12_ARUSER.outSCALAR(TLS_twiddle_rsc_0_12_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RID.inSCALAR(TLS_twiddle_rsc_0_12_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RUSER.inSCALAR(TLS_twiddle_rsc_0_12_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_12_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_12_RUSER);

    twiddle_rsc_0__12__INST.ACLK(clk);
    twiddle_rsc_0__12__INST.ARESETn(rst);
    twiddle_rsc_0__12__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_12_AWID);
    twiddle_rsc_0__12__INST.AWADDR(TLS_twiddle_rsc_0_12_AWADDR);
    twiddle_rsc_0__12__INST.AWLEN(TLS_twiddle_rsc_0_12_AWLEN);
    twiddle_rsc_0__12__INST.AWSIZE(TLS_twiddle_rsc_0_12_AWSIZE);
    twiddle_rsc_0__12__INST.AWBURST(TLS_twiddle_rsc_0_12_AWBURST);
    twiddle_rsc_0__12__INST.AWLOCK(TLS_twiddle_rsc_0_12_AWLOCK);
    twiddle_rsc_0__12__INST.AWCACHE(TLS_twiddle_rsc_0_12_AWCACHE);
    twiddle_rsc_0__12__INST.AWPROT(TLS_twiddle_rsc_0_12_AWPROT);
    twiddle_rsc_0__12__INST.AWQOS(TLS_twiddle_rsc_0_12_AWQOS);
    twiddle_rsc_0__12__INST.AWREGION(TLS_twiddle_rsc_0_12_AWREGION);
    twiddle_rsc_0__12__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_12_AWUSER);
    twiddle_rsc_0__12__INST.AWVALID(TLS_twiddle_rsc_0_12_AWVALID);
    twiddle_rsc_0__12__INST.AWREADY(TLS_twiddle_rsc_0_12_AWREADY);
    twiddle_rsc_0__12__INST.WDATA(TLS_twiddle_rsc_0_12_WDATA);
    twiddle_rsc_0__12__INST.WSTRB(TLS_twiddle_rsc_0_12_WSTRB);
    twiddle_rsc_0__12__INST.WLAST(TLS_twiddle_rsc_0_12_WLAST);
    twiddle_rsc_0__12__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_12_WUSER);
    twiddle_rsc_0__12__INST.WVALID(TLS_twiddle_rsc_0_12_WVALID);
    twiddle_rsc_0__12__INST.WREADY(TLS_twiddle_rsc_0_12_WREADY);
    twiddle_rsc_0__12__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_12_BID);
    twiddle_rsc_0__12__INST.BRESP(TLS_twiddle_rsc_0_12_BRESP);
    twiddle_rsc_0__12__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_12_BUSER);
    twiddle_rsc_0__12__INST.BVALID(TLS_twiddle_rsc_0_12_BVALID);
    twiddle_rsc_0__12__INST.BREADY(TLS_twiddle_rsc_0_12_BREADY);
    twiddle_rsc_0__12__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_12_ARID);
    twiddle_rsc_0__12__INST.ARADDR(TLS_twiddle_rsc_0_12_ARADDR);
    twiddle_rsc_0__12__INST.ARLEN(TLS_twiddle_rsc_0_12_ARLEN);
    twiddle_rsc_0__12__INST.ARSIZE(TLS_twiddle_rsc_0_12_ARSIZE);
    twiddle_rsc_0__12__INST.ARBURST(TLS_twiddle_rsc_0_12_ARBURST);
    twiddle_rsc_0__12__INST.ARLOCK(TLS_twiddle_rsc_0_12_ARLOCK);
    twiddle_rsc_0__12__INST.ARCACHE(TLS_twiddle_rsc_0_12_ARCACHE);
    twiddle_rsc_0__12__INST.ARPROT(TLS_twiddle_rsc_0_12_ARPROT);
    twiddle_rsc_0__12__INST.ARQOS(TLS_twiddle_rsc_0_12_ARQOS);
    twiddle_rsc_0__12__INST.ARREGION(TLS_twiddle_rsc_0_12_ARREGION);
    twiddle_rsc_0__12__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_12_ARUSER);
    twiddle_rsc_0__12__INST.ARVALID(TLS_twiddle_rsc_0_12_ARVALID);
    twiddle_rsc_0__12__INST.ARREADY(TLS_twiddle_rsc_0_12_ARREADY);
    twiddle_rsc_0__12__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_12_RID);
    twiddle_rsc_0__12__INST.RDATA(TLS_twiddle_rsc_0_12_RDATA);
    twiddle_rsc_0__12__INST.RRESP(TLS_twiddle_rsc_0_12_RRESP);
    twiddle_rsc_0__12__INST.RLAST(TLS_twiddle_rsc_0_12_RLAST);
    twiddle_rsc_0__12__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_12_RUSER);
    twiddle_rsc_0__12__INST.RVALID(TLS_twiddle_rsc_0_12_RVALID);
    twiddle_rsc_0__12__INST.RREADY(TLS_twiddle_rsc_0_12_RREADY);
    twiddle_rsc_0__12__INST.tr_write_done(TLS_twiddle_rsc_0_12_tr_write_done);
    twiddle_rsc_0__12__INST.s_tdone(TLS_twiddle_rsc_0_12_s_tdone);
    twiddle_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_147)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWID.outSCALAR(TLS_twiddle_rsc_0_13_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_AWUSER.outSCALAR(TLS_twiddle_rsc_0_13_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_WUSER.outSCALAR(TLS_twiddle_rsc_0_13_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BID.inSCALAR(TLS_twiddle_rsc_0_13_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BUSER.inSCALAR(TLS_twiddle_rsc_0_13_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARID.outSCALAR(TLS_twiddle_rsc_0_13_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_13_ARUSER.outSCALAR(TLS_twiddle_rsc_0_13_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RID.inSCALAR(TLS_twiddle_rsc_0_13_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RUSER.inSCALAR(TLS_twiddle_rsc_0_13_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_13_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_13_RUSER);

    twiddle_rsc_0__13__INST.ACLK(clk);
    twiddle_rsc_0__13__INST.ARESETn(rst);
    twiddle_rsc_0__13__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_13_AWID);
    twiddle_rsc_0__13__INST.AWADDR(TLS_twiddle_rsc_0_13_AWADDR);
    twiddle_rsc_0__13__INST.AWLEN(TLS_twiddle_rsc_0_13_AWLEN);
    twiddle_rsc_0__13__INST.AWSIZE(TLS_twiddle_rsc_0_13_AWSIZE);
    twiddle_rsc_0__13__INST.AWBURST(TLS_twiddle_rsc_0_13_AWBURST);
    twiddle_rsc_0__13__INST.AWLOCK(TLS_twiddle_rsc_0_13_AWLOCK);
    twiddle_rsc_0__13__INST.AWCACHE(TLS_twiddle_rsc_0_13_AWCACHE);
    twiddle_rsc_0__13__INST.AWPROT(TLS_twiddle_rsc_0_13_AWPROT);
    twiddle_rsc_0__13__INST.AWQOS(TLS_twiddle_rsc_0_13_AWQOS);
    twiddle_rsc_0__13__INST.AWREGION(TLS_twiddle_rsc_0_13_AWREGION);
    twiddle_rsc_0__13__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_13_AWUSER);
    twiddle_rsc_0__13__INST.AWVALID(TLS_twiddle_rsc_0_13_AWVALID);
    twiddle_rsc_0__13__INST.AWREADY(TLS_twiddle_rsc_0_13_AWREADY);
    twiddle_rsc_0__13__INST.WDATA(TLS_twiddle_rsc_0_13_WDATA);
    twiddle_rsc_0__13__INST.WSTRB(TLS_twiddle_rsc_0_13_WSTRB);
    twiddle_rsc_0__13__INST.WLAST(TLS_twiddle_rsc_0_13_WLAST);
    twiddle_rsc_0__13__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_13_WUSER);
    twiddle_rsc_0__13__INST.WVALID(TLS_twiddle_rsc_0_13_WVALID);
    twiddle_rsc_0__13__INST.WREADY(TLS_twiddle_rsc_0_13_WREADY);
    twiddle_rsc_0__13__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_13_BID);
    twiddle_rsc_0__13__INST.BRESP(TLS_twiddle_rsc_0_13_BRESP);
    twiddle_rsc_0__13__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_13_BUSER);
    twiddle_rsc_0__13__INST.BVALID(TLS_twiddle_rsc_0_13_BVALID);
    twiddle_rsc_0__13__INST.BREADY(TLS_twiddle_rsc_0_13_BREADY);
    twiddle_rsc_0__13__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_13_ARID);
    twiddle_rsc_0__13__INST.ARADDR(TLS_twiddle_rsc_0_13_ARADDR);
    twiddle_rsc_0__13__INST.ARLEN(TLS_twiddle_rsc_0_13_ARLEN);
    twiddle_rsc_0__13__INST.ARSIZE(TLS_twiddle_rsc_0_13_ARSIZE);
    twiddle_rsc_0__13__INST.ARBURST(TLS_twiddle_rsc_0_13_ARBURST);
    twiddle_rsc_0__13__INST.ARLOCK(TLS_twiddle_rsc_0_13_ARLOCK);
    twiddle_rsc_0__13__INST.ARCACHE(TLS_twiddle_rsc_0_13_ARCACHE);
    twiddle_rsc_0__13__INST.ARPROT(TLS_twiddle_rsc_0_13_ARPROT);
    twiddle_rsc_0__13__INST.ARQOS(TLS_twiddle_rsc_0_13_ARQOS);
    twiddle_rsc_0__13__INST.ARREGION(TLS_twiddle_rsc_0_13_ARREGION);
    twiddle_rsc_0__13__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_13_ARUSER);
    twiddle_rsc_0__13__INST.ARVALID(TLS_twiddle_rsc_0_13_ARVALID);
    twiddle_rsc_0__13__INST.ARREADY(TLS_twiddle_rsc_0_13_ARREADY);
    twiddle_rsc_0__13__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_13_RID);
    twiddle_rsc_0__13__INST.RDATA(TLS_twiddle_rsc_0_13_RDATA);
    twiddle_rsc_0__13__INST.RRESP(TLS_twiddle_rsc_0_13_RRESP);
    twiddle_rsc_0__13__INST.RLAST(TLS_twiddle_rsc_0_13_RLAST);
    twiddle_rsc_0__13__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_13_RUSER);
    twiddle_rsc_0__13__INST.RVALID(TLS_twiddle_rsc_0_13_RVALID);
    twiddle_rsc_0__13__INST.RREADY(TLS_twiddle_rsc_0_13_RREADY);
    twiddle_rsc_0__13__INST.tr_write_done(TLS_twiddle_rsc_0_13_tr_write_done);
    twiddle_rsc_0__13__INST.s_tdone(TLS_twiddle_rsc_0_13_s_tdone);
    twiddle_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_148)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWID.outSCALAR(TLS_twiddle_rsc_0_14_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_AWUSER.outSCALAR(TLS_twiddle_rsc_0_14_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_WUSER.outSCALAR(TLS_twiddle_rsc_0_14_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BID.inSCALAR(TLS_twiddle_rsc_0_14_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BUSER.inSCALAR(TLS_twiddle_rsc_0_14_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARID.outSCALAR(TLS_twiddle_rsc_0_14_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_14_ARUSER.outSCALAR(TLS_twiddle_rsc_0_14_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RID.inSCALAR(TLS_twiddle_rsc_0_14_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RUSER.inSCALAR(TLS_twiddle_rsc_0_14_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_14_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_14_RUSER);

    twiddle_rsc_0__14__INST.ACLK(clk);
    twiddle_rsc_0__14__INST.ARESETn(rst);
    twiddle_rsc_0__14__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_14_AWID);
    twiddle_rsc_0__14__INST.AWADDR(TLS_twiddle_rsc_0_14_AWADDR);
    twiddle_rsc_0__14__INST.AWLEN(TLS_twiddle_rsc_0_14_AWLEN);
    twiddle_rsc_0__14__INST.AWSIZE(TLS_twiddle_rsc_0_14_AWSIZE);
    twiddle_rsc_0__14__INST.AWBURST(TLS_twiddle_rsc_0_14_AWBURST);
    twiddle_rsc_0__14__INST.AWLOCK(TLS_twiddle_rsc_0_14_AWLOCK);
    twiddle_rsc_0__14__INST.AWCACHE(TLS_twiddle_rsc_0_14_AWCACHE);
    twiddle_rsc_0__14__INST.AWPROT(TLS_twiddle_rsc_0_14_AWPROT);
    twiddle_rsc_0__14__INST.AWQOS(TLS_twiddle_rsc_0_14_AWQOS);
    twiddle_rsc_0__14__INST.AWREGION(TLS_twiddle_rsc_0_14_AWREGION);
    twiddle_rsc_0__14__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_14_AWUSER);
    twiddle_rsc_0__14__INST.AWVALID(TLS_twiddle_rsc_0_14_AWVALID);
    twiddle_rsc_0__14__INST.AWREADY(TLS_twiddle_rsc_0_14_AWREADY);
    twiddle_rsc_0__14__INST.WDATA(TLS_twiddle_rsc_0_14_WDATA);
    twiddle_rsc_0__14__INST.WSTRB(TLS_twiddle_rsc_0_14_WSTRB);
    twiddle_rsc_0__14__INST.WLAST(TLS_twiddle_rsc_0_14_WLAST);
    twiddle_rsc_0__14__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_14_WUSER);
    twiddle_rsc_0__14__INST.WVALID(TLS_twiddle_rsc_0_14_WVALID);
    twiddle_rsc_0__14__INST.WREADY(TLS_twiddle_rsc_0_14_WREADY);
    twiddle_rsc_0__14__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_14_BID);
    twiddle_rsc_0__14__INST.BRESP(TLS_twiddle_rsc_0_14_BRESP);
    twiddle_rsc_0__14__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_14_BUSER);
    twiddle_rsc_0__14__INST.BVALID(TLS_twiddle_rsc_0_14_BVALID);
    twiddle_rsc_0__14__INST.BREADY(TLS_twiddle_rsc_0_14_BREADY);
    twiddle_rsc_0__14__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_14_ARID);
    twiddle_rsc_0__14__INST.ARADDR(TLS_twiddle_rsc_0_14_ARADDR);
    twiddle_rsc_0__14__INST.ARLEN(TLS_twiddle_rsc_0_14_ARLEN);
    twiddle_rsc_0__14__INST.ARSIZE(TLS_twiddle_rsc_0_14_ARSIZE);
    twiddle_rsc_0__14__INST.ARBURST(TLS_twiddle_rsc_0_14_ARBURST);
    twiddle_rsc_0__14__INST.ARLOCK(TLS_twiddle_rsc_0_14_ARLOCK);
    twiddle_rsc_0__14__INST.ARCACHE(TLS_twiddle_rsc_0_14_ARCACHE);
    twiddle_rsc_0__14__INST.ARPROT(TLS_twiddle_rsc_0_14_ARPROT);
    twiddle_rsc_0__14__INST.ARQOS(TLS_twiddle_rsc_0_14_ARQOS);
    twiddle_rsc_0__14__INST.ARREGION(TLS_twiddle_rsc_0_14_ARREGION);
    twiddle_rsc_0__14__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_14_ARUSER);
    twiddle_rsc_0__14__INST.ARVALID(TLS_twiddle_rsc_0_14_ARVALID);
    twiddle_rsc_0__14__INST.ARREADY(TLS_twiddle_rsc_0_14_ARREADY);
    twiddle_rsc_0__14__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_14_RID);
    twiddle_rsc_0__14__INST.RDATA(TLS_twiddle_rsc_0_14_RDATA);
    twiddle_rsc_0__14__INST.RRESP(TLS_twiddle_rsc_0_14_RRESP);
    twiddle_rsc_0__14__INST.RLAST(TLS_twiddle_rsc_0_14_RLAST);
    twiddle_rsc_0__14__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_14_RUSER);
    twiddle_rsc_0__14__INST.RVALID(TLS_twiddle_rsc_0_14_RVALID);
    twiddle_rsc_0__14__INST.RREADY(TLS_twiddle_rsc_0_14_RREADY);
    twiddle_rsc_0__14__INST.tr_write_done(TLS_twiddle_rsc_0_14_tr_write_done);
    twiddle_rsc_0__14__INST.s_tdone(TLS_twiddle_rsc_0_14_s_tdone);
    twiddle_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_149)));

    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_AWID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWID.outSCALAR(TLS_twiddle_rsc_0_15_AWID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_AWUSER.outSCALAR(TLS_twiddle_rsc_0_15_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_WUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_WUSER.outSCALAR(TLS_twiddle_rsc_0_15_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BID.inSCALAR(TLS_twiddle_rsc_0_15_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BUSER.inSCALAR(TLS_twiddle_rsc_0_15_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_BUSER);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARID.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_ARID);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARID.outSCALAR(TLS_twiddle_rsc_0_15_ARID);

    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_rsc_0_15_ARUSER.outSCALAR(TLS_twiddle_rsc_0_15_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RID.inSCALAR(TLS_twiddle_rsc_0_15_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RID.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RUSER.inSCALAR(TLS_twiddle_rsc_0_15_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_rsc_0_15_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_rsc_0_15_RUSER);

    twiddle_rsc_0__15__INST.ACLK(clk);
    twiddle_rsc_0__15__INST.ARESETn(rst);
    twiddle_rsc_0__15__INST.AWID(CCS_ADAPTOR_twiddle_rsc_0_15_AWID);
    twiddle_rsc_0__15__INST.AWADDR(TLS_twiddle_rsc_0_15_AWADDR);
    twiddle_rsc_0__15__INST.AWLEN(TLS_twiddle_rsc_0_15_AWLEN);
    twiddle_rsc_0__15__INST.AWSIZE(TLS_twiddle_rsc_0_15_AWSIZE);
    twiddle_rsc_0__15__INST.AWBURST(TLS_twiddle_rsc_0_15_AWBURST);
    twiddle_rsc_0__15__INST.AWLOCK(TLS_twiddle_rsc_0_15_AWLOCK);
    twiddle_rsc_0__15__INST.AWCACHE(TLS_twiddle_rsc_0_15_AWCACHE);
    twiddle_rsc_0__15__INST.AWPROT(TLS_twiddle_rsc_0_15_AWPROT);
    twiddle_rsc_0__15__INST.AWQOS(TLS_twiddle_rsc_0_15_AWQOS);
    twiddle_rsc_0__15__INST.AWREGION(TLS_twiddle_rsc_0_15_AWREGION);
    twiddle_rsc_0__15__INST.AWUSER(CCS_ADAPTOR_twiddle_rsc_0_15_AWUSER);
    twiddle_rsc_0__15__INST.AWVALID(TLS_twiddle_rsc_0_15_AWVALID);
    twiddle_rsc_0__15__INST.AWREADY(TLS_twiddle_rsc_0_15_AWREADY);
    twiddle_rsc_0__15__INST.WDATA(TLS_twiddle_rsc_0_15_WDATA);
    twiddle_rsc_0__15__INST.WSTRB(TLS_twiddle_rsc_0_15_WSTRB);
    twiddle_rsc_0__15__INST.WLAST(TLS_twiddle_rsc_0_15_WLAST);
    twiddle_rsc_0__15__INST.WUSER(CCS_ADAPTOR_twiddle_rsc_0_15_WUSER);
    twiddle_rsc_0__15__INST.WVALID(TLS_twiddle_rsc_0_15_WVALID);
    twiddle_rsc_0__15__INST.WREADY(TLS_twiddle_rsc_0_15_WREADY);
    twiddle_rsc_0__15__INST.BID(CCS_ADAPTOR_twiddle_rsc_0_15_BID);
    twiddle_rsc_0__15__INST.BRESP(TLS_twiddle_rsc_0_15_BRESP);
    twiddle_rsc_0__15__INST.BUSER(CCS_ADAPTOR_twiddle_rsc_0_15_BUSER);
    twiddle_rsc_0__15__INST.BVALID(TLS_twiddle_rsc_0_15_BVALID);
    twiddle_rsc_0__15__INST.BREADY(TLS_twiddle_rsc_0_15_BREADY);
    twiddle_rsc_0__15__INST.ARID(CCS_ADAPTOR_twiddle_rsc_0_15_ARID);
    twiddle_rsc_0__15__INST.ARADDR(TLS_twiddle_rsc_0_15_ARADDR);
    twiddle_rsc_0__15__INST.ARLEN(TLS_twiddle_rsc_0_15_ARLEN);
    twiddle_rsc_0__15__INST.ARSIZE(TLS_twiddle_rsc_0_15_ARSIZE);
    twiddle_rsc_0__15__INST.ARBURST(TLS_twiddle_rsc_0_15_ARBURST);
    twiddle_rsc_0__15__INST.ARLOCK(TLS_twiddle_rsc_0_15_ARLOCK);
    twiddle_rsc_0__15__INST.ARCACHE(TLS_twiddle_rsc_0_15_ARCACHE);
    twiddle_rsc_0__15__INST.ARPROT(TLS_twiddle_rsc_0_15_ARPROT);
    twiddle_rsc_0__15__INST.ARQOS(TLS_twiddle_rsc_0_15_ARQOS);
    twiddle_rsc_0__15__INST.ARREGION(TLS_twiddle_rsc_0_15_ARREGION);
    twiddle_rsc_0__15__INST.ARUSER(CCS_ADAPTOR_twiddle_rsc_0_15_ARUSER);
    twiddle_rsc_0__15__INST.ARVALID(TLS_twiddle_rsc_0_15_ARVALID);
    twiddle_rsc_0__15__INST.ARREADY(TLS_twiddle_rsc_0_15_ARREADY);
    twiddle_rsc_0__15__INST.RID(CCS_ADAPTOR_twiddle_rsc_0_15_RID);
    twiddle_rsc_0__15__INST.RDATA(TLS_twiddle_rsc_0_15_RDATA);
    twiddle_rsc_0__15__INST.RRESP(TLS_twiddle_rsc_0_15_RRESP);
    twiddle_rsc_0__15__INST.RLAST(TLS_twiddle_rsc_0_15_RLAST);
    twiddle_rsc_0__15__INST.RUSER(CCS_ADAPTOR_twiddle_rsc_0_15_RUSER);
    twiddle_rsc_0__15__INST.RVALID(TLS_twiddle_rsc_0_15_RVALID);
    twiddle_rsc_0__15__INST.RREADY(TLS_twiddle_rsc_0_15_RREADY);
    twiddle_rsc_0__15__INST.tr_write_done(TLS_twiddle_rsc_0_15_tr_write_done);
    twiddle_rsc_0__15__INST.s_tdone(TLS_twiddle_rsc_0_15_s_tdone);
    twiddle_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_150)));

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
    twiddle_h_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_151)));

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
    twiddle_h_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_152)));

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
    twiddle_h_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_153)));

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
    twiddle_h_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_154)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWID.outSCALAR(TLS_twiddle_h_rsc_0_4_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_4_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_4_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BID.inSCALAR(TLS_twiddle_h_rsc_0_4_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_4_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARID.outSCALAR(TLS_twiddle_h_rsc_0_4_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_4_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_4_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RID.inSCALAR(TLS_twiddle_h_rsc_0_4_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_4_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER);

    twiddle_h_rsc_0__4__INST.ACLK(clk);
    twiddle_h_rsc_0__4__INST.ARESETn(rst);
    twiddle_h_rsc_0__4__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_4_AWID);
    twiddle_h_rsc_0__4__INST.AWADDR(TLS_twiddle_h_rsc_0_4_AWADDR);
    twiddle_h_rsc_0__4__INST.AWLEN(TLS_twiddle_h_rsc_0_4_AWLEN);
    twiddle_h_rsc_0__4__INST.AWSIZE(TLS_twiddle_h_rsc_0_4_AWSIZE);
    twiddle_h_rsc_0__4__INST.AWBURST(TLS_twiddle_h_rsc_0_4_AWBURST);
    twiddle_h_rsc_0__4__INST.AWLOCK(TLS_twiddle_h_rsc_0_4_AWLOCK);
    twiddle_h_rsc_0__4__INST.AWCACHE(TLS_twiddle_h_rsc_0_4_AWCACHE);
    twiddle_h_rsc_0__4__INST.AWPROT(TLS_twiddle_h_rsc_0_4_AWPROT);
    twiddle_h_rsc_0__4__INST.AWQOS(TLS_twiddle_h_rsc_0_4_AWQOS);
    twiddle_h_rsc_0__4__INST.AWREGION(TLS_twiddle_h_rsc_0_4_AWREGION);
    twiddle_h_rsc_0__4__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_4_AWUSER);
    twiddle_h_rsc_0__4__INST.AWVALID(TLS_twiddle_h_rsc_0_4_AWVALID);
    twiddle_h_rsc_0__4__INST.AWREADY(TLS_twiddle_h_rsc_0_4_AWREADY);
    twiddle_h_rsc_0__4__INST.WDATA(TLS_twiddle_h_rsc_0_4_WDATA);
    twiddle_h_rsc_0__4__INST.WSTRB(TLS_twiddle_h_rsc_0_4_WSTRB);
    twiddle_h_rsc_0__4__INST.WLAST(TLS_twiddle_h_rsc_0_4_WLAST);
    twiddle_h_rsc_0__4__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_4_WUSER);
    twiddle_h_rsc_0__4__INST.WVALID(TLS_twiddle_h_rsc_0_4_WVALID);
    twiddle_h_rsc_0__4__INST.WREADY(TLS_twiddle_h_rsc_0_4_WREADY);
    twiddle_h_rsc_0__4__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_4_BID);
    twiddle_h_rsc_0__4__INST.BRESP(TLS_twiddle_h_rsc_0_4_BRESP);
    twiddle_h_rsc_0__4__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_4_BUSER);
    twiddle_h_rsc_0__4__INST.BVALID(TLS_twiddle_h_rsc_0_4_BVALID);
    twiddle_h_rsc_0__4__INST.BREADY(TLS_twiddle_h_rsc_0_4_BREADY);
    twiddle_h_rsc_0__4__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_4_ARID);
    twiddle_h_rsc_0__4__INST.ARADDR(TLS_twiddle_h_rsc_0_4_ARADDR);
    twiddle_h_rsc_0__4__INST.ARLEN(TLS_twiddle_h_rsc_0_4_ARLEN);
    twiddle_h_rsc_0__4__INST.ARSIZE(TLS_twiddle_h_rsc_0_4_ARSIZE);
    twiddle_h_rsc_0__4__INST.ARBURST(TLS_twiddle_h_rsc_0_4_ARBURST);
    twiddle_h_rsc_0__4__INST.ARLOCK(TLS_twiddle_h_rsc_0_4_ARLOCK);
    twiddle_h_rsc_0__4__INST.ARCACHE(TLS_twiddle_h_rsc_0_4_ARCACHE);
    twiddle_h_rsc_0__4__INST.ARPROT(TLS_twiddle_h_rsc_0_4_ARPROT);
    twiddle_h_rsc_0__4__INST.ARQOS(TLS_twiddle_h_rsc_0_4_ARQOS);
    twiddle_h_rsc_0__4__INST.ARREGION(TLS_twiddle_h_rsc_0_4_ARREGION);
    twiddle_h_rsc_0__4__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_4_ARUSER);
    twiddle_h_rsc_0__4__INST.ARVALID(TLS_twiddle_h_rsc_0_4_ARVALID);
    twiddle_h_rsc_0__4__INST.ARREADY(TLS_twiddle_h_rsc_0_4_ARREADY);
    twiddle_h_rsc_0__4__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_4_RID);
    twiddle_h_rsc_0__4__INST.RDATA(TLS_twiddle_h_rsc_0_4_RDATA);
    twiddle_h_rsc_0__4__INST.RRESP(TLS_twiddle_h_rsc_0_4_RRESP);
    twiddle_h_rsc_0__4__INST.RLAST(TLS_twiddle_h_rsc_0_4_RLAST);
    twiddle_h_rsc_0__4__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_4_RUSER);
    twiddle_h_rsc_0__4__INST.RVALID(TLS_twiddle_h_rsc_0_4_RVALID);
    twiddle_h_rsc_0__4__INST.RREADY(TLS_twiddle_h_rsc_0_4_RREADY);
    twiddle_h_rsc_0__4__INST.tr_write_done(TLS_twiddle_h_rsc_0_4_tr_write_done);
    twiddle_h_rsc_0__4__INST.s_tdone(TLS_twiddle_h_rsc_0_4_s_tdone);
    twiddle_h_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_155)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWID.outSCALAR(TLS_twiddle_h_rsc_0_5_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_5_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_5_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BID.inSCALAR(TLS_twiddle_h_rsc_0_5_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_5_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARID.outSCALAR(TLS_twiddle_h_rsc_0_5_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_5_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_5_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RID.inSCALAR(TLS_twiddle_h_rsc_0_5_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_5_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER);

    twiddle_h_rsc_0__5__INST.ACLK(clk);
    twiddle_h_rsc_0__5__INST.ARESETn(rst);
    twiddle_h_rsc_0__5__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_5_AWID);
    twiddle_h_rsc_0__5__INST.AWADDR(TLS_twiddle_h_rsc_0_5_AWADDR);
    twiddle_h_rsc_0__5__INST.AWLEN(TLS_twiddle_h_rsc_0_5_AWLEN);
    twiddle_h_rsc_0__5__INST.AWSIZE(TLS_twiddle_h_rsc_0_5_AWSIZE);
    twiddle_h_rsc_0__5__INST.AWBURST(TLS_twiddle_h_rsc_0_5_AWBURST);
    twiddle_h_rsc_0__5__INST.AWLOCK(TLS_twiddle_h_rsc_0_5_AWLOCK);
    twiddle_h_rsc_0__5__INST.AWCACHE(TLS_twiddle_h_rsc_0_5_AWCACHE);
    twiddle_h_rsc_0__5__INST.AWPROT(TLS_twiddle_h_rsc_0_5_AWPROT);
    twiddle_h_rsc_0__5__INST.AWQOS(TLS_twiddle_h_rsc_0_5_AWQOS);
    twiddle_h_rsc_0__5__INST.AWREGION(TLS_twiddle_h_rsc_0_5_AWREGION);
    twiddle_h_rsc_0__5__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_5_AWUSER);
    twiddle_h_rsc_0__5__INST.AWVALID(TLS_twiddle_h_rsc_0_5_AWVALID);
    twiddle_h_rsc_0__5__INST.AWREADY(TLS_twiddle_h_rsc_0_5_AWREADY);
    twiddle_h_rsc_0__5__INST.WDATA(TLS_twiddle_h_rsc_0_5_WDATA);
    twiddle_h_rsc_0__5__INST.WSTRB(TLS_twiddle_h_rsc_0_5_WSTRB);
    twiddle_h_rsc_0__5__INST.WLAST(TLS_twiddle_h_rsc_0_5_WLAST);
    twiddle_h_rsc_0__5__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_5_WUSER);
    twiddle_h_rsc_0__5__INST.WVALID(TLS_twiddle_h_rsc_0_5_WVALID);
    twiddle_h_rsc_0__5__INST.WREADY(TLS_twiddle_h_rsc_0_5_WREADY);
    twiddle_h_rsc_0__5__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_5_BID);
    twiddle_h_rsc_0__5__INST.BRESP(TLS_twiddle_h_rsc_0_5_BRESP);
    twiddle_h_rsc_0__5__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_5_BUSER);
    twiddle_h_rsc_0__5__INST.BVALID(TLS_twiddle_h_rsc_0_5_BVALID);
    twiddle_h_rsc_0__5__INST.BREADY(TLS_twiddle_h_rsc_0_5_BREADY);
    twiddle_h_rsc_0__5__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_5_ARID);
    twiddle_h_rsc_0__5__INST.ARADDR(TLS_twiddle_h_rsc_0_5_ARADDR);
    twiddle_h_rsc_0__5__INST.ARLEN(TLS_twiddle_h_rsc_0_5_ARLEN);
    twiddle_h_rsc_0__5__INST.ARSIZE(TLS_twiddle_h_rsc_0_5_ARSIZE);
    twiddle_h_rsc_0__5__INST.ARBURST(TLS_twiddle_h_rsc_0_5_ARBURST);
    twiddle_h_rsc_0__5__INST.ARLOCK(TLS_twiddle_h_rsc_0_5_ARLOCK);
    twiddle_h_rsc_0__5__INST.ARCACHE(TLS_twiddle_h_rsc_0_5_ARCACHE);
    twiddle_h_rsc_0__5__INST.ARPROT(TLS_twiddle_h_rsc_0_5_ARPROT);
    twiddle_h_rsc_0__5__INST.ARQOS(TLS_twiddle_h_rsc_0_5_ARQOS);
    twiddle_h_rsc_0__5__INST.ARREGION(TLS_twiddle_h_rsc_0_5_ARREGION);
    twiddle_h_rsc_0__5__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_5_ARUSER);
    twiddle_h_rsc_0__5__INST.ARVALID(TLS_twiddle_h_rsc_0_5_ARVALID);
    twiddle_h_rsc_0__5__INST.ARREADY(TLS_twiddle_h_rsc_0_5_ARREADY);
    twiddle_h_rsc_0__5__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_5_RID);
    twiddle_h_rsc_0__5__INST.RDATA(TLS_twiddle_h_rsc_0_5_RDATA);
    twiddle_h_rsc_0__5__INST.RRESP(TLS_twiddle_h_rsc_0_5_RRESP);
    twiddle_h_rsc_0__5__INST.RLAST(TLS_twiddle_h_rsc_0_5_RLAST);
    twiddle_h_rsc_0__5__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_5_RUSER);
    twiddle_h_rsc_0__5__INST.RVALID(TLS_twiddle_h_rsc_0_5_RVALID);
    twiddle_h_rsc_0__5__INST.RREADY(TLS_twiddle_h_rsc_0_5_RREADY);
    twiddle_h_rsc_0__5__INST.tr_write_done(TLS_twiddle_h_rsc_0_5_tr_write_done);
    twiddle_h_rsc_0__5__INST.s_tdone(TLS_twiddle_h_rsc_0_5_s_tdone);
    twiddle_h_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_156)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWID.outSCALAR(TLS_twiddle_h_rsc_0_6_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_6_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_6_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BID.inSCALAR(TLS_twiddle_h_rsc_0_6_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_6_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARID.outSCALAR(TLS_twiddle_h_rsc_0_6_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_6_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_6_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RID.inSCALAR(TLS_twiddle_h_rsc_0_6_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_6_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER);

    twiddle_h_rsc_0__6__INST.ACLK(clk);
    twiddle_h_rsc_0__6__INST.ARESETn(rst);
    twiddle_h_rsc_0__6__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_6_AWID);
    twiddle_h_rsc_0__6__INST.AWADDR(TLS_twiddle_h_rsc_0_6_AWADDR);
    twiddle_h_rsc_0__6__INST.AWLEN(TLS_twiddle_h_rsc_0_6_AWLEN);
    twiddle_h_rsc_0__6__INST.AWSIZE(TLS_twiddle_h_rsc_0_6_AWSIZE);
    twiddle_h_rsc_0__6__INST.AWBURST(TLS_twiddle_h_rsc_0_6_AWBURST);
    twiddle_h_rsc_0__6__INST.AWLOCK(TLS_twiddle_h_rsc_0_6_AWLOCK);
    twiddle_h_rsc_0__6__INST.AWCACHE(TLS_twiddle_h_rsc_0_6_AWCACHE);
    twiddle_h_rsc_0__6__INST.AWPROT(TLS_twiddle_h_rsc_0_6_AWPROT);
    twiddle_h_rsc_0__6__INST.AWQOS(TLS_twiddle_h_rsc_0_6_AWQOS);
    twiddle_h_rsc_0__6__INST.AWREGION(TLS_twiddle_h_rsc_0_6_AWREGION);
    twiddle_h_rsc_0__6__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_6_AWUSER);
    twiddle_h_rsc_0__6__INST.AWVALID(TLS_twiddle_h_rsc_0_6_AWVALID);
    twiddle_h_rsc_0__6__INST.AWREADY(TLS_twiddle_h_rsc_0_6_AWREADY);
    twiddle_h_rsc_0__6__INST.WDATA(TLS_twiddle_h_rsc_0_6_WDATA);
    twiddle_h_rsc_0__6__INST.WSTRB(TLS_twiddle_h_rsc_0_6_WSTRB);
    twiddle_h_rsc_0__6__INST.WLAST(TLS_twiddle_h_rsc_0_6_WLAST);
    twiddle_h_rsc_0__6__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_6_WUSER);
    twiddle_h_rsc_0__6__INST.WVALID(TLS_twiddle_h_rsc_0_6_WVALID);
    twiddle_h_rsc_0__6__INST.WREADY(TLS_twiddle_h_rsc_0_6_WREADY);
    twiddle_h_rsc_0__6__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_6_BID);
    twiddle_h_rsc_0__6__INST.BRESP(TLS_twiddle_h_rsc_0_6_BRESP);
    twiddle_h_rsc_0__6__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_6_BUSER);
    twiddle_h_rsc_0__6__INST.BVALID(TLS_twiddle_h_rsc_0_6_BVALID);
    twiddle_h_rsc_0__6__INST.BREADY(TLS_twiddle_h_rsc_0_6_BREADY);
    twiddle_h_rsc_0__6__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_6_ARID);
    twiddle_h_rsc_0__6__INST.ARADDR(TLS_twiddle_h_rsc_0_6_ARADDR);
    twiddle_h_rsc_0__6__INST.ARLEN(TLS_twiddle_h_rsc_0_6_ARLEN);
    twiddle_h_rsc_0__6__INST.ARSIZE(TLS_twiddle_h_rsc_0_6_ARSIZE);
    twiddle_h_rsc_0__6__INST.ARBURST(TLS_twiddle_h_rsc_0_6_ARBURST);
    twiddle_h_rsc_0__6__INST.ARLOCK(TLS_twiddle_h_rsc_0_6_ARLOCK);
    twiddle_h_rsc_0__6__INST.ARCACHE(TLS_twiddle_h_rsc_0_6_ARCACHE);
    twiddle_h_rsc_0__6__INST.ARPROT(TLS_twiddle_h_rsc_0_6_ARPROT);
    twiddle_h_rsc_0__6__INST.ARQOS(TLS_twiddle_h_rsc_0_6_ARQOS);
    twiddle_h_rsc_0__6__INST.ARREGION(TLS_twiddle_h_rsc_0_6_ARREGION);
    twiddle_h_rsc_0__6__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_6_ARUSER);
    twiddle_h_rsc_0__6__INST.ARVALID(TLS_twiddle_h_rsc_0_6_ARVALID);
    twiddle_h_rsc_0__6__INST.ARREADY(TLS_twiddle_h_rsc_0_6_ARREADY);
    twiddle_h_rsc_0__6__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_6_RID);
    twiddle_h_rsc_0__6__INST.RDATA(TLS_twiddle_h_rsc_0_6_RDATA);
    twiddle_h_rsc_0__6__INST.RRESP(TLS_twiddle_h_rsc_0_6_RRESP);
    twiddle_h_rsc_0__6__INST.RLAST(TLS_twiddle_h_rsc_0_6_RLAST);
    twiddle_h_rsc_0__6__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_6_RUSER);
    twiddle_h_rsc_0__6__INST.RVALID(TLS_twiddle_h_rsc_0_6_RVALID);
    twiddle_h_rsc_0__6__INST.RREADY(TLS_twiddle_h_rsc_0_6_RREADY);
    twiddle_h_rsc_0__6__INST.tr_write_done(TLS_twiddle_h_rsc_0_6_tr_write_done);
    twiddle_h_rsc_0__6__INST.s_tdone(TLS_twiddle_h_rsc_0_6_s_tdone);
    twiddle_h_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_157)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWID.outSCALAR(TLS_twiddle_h_rsc_0_7_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_7_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_7_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BID.inSCALAR(TLS_twiddle_h_rsc_0_7_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_7_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARID.outSCALAR(TLS_twiddle_h_rsc_0_7_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_7_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_7_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RID.inSCALAR(TLS_twiddle_h_rsc_0_7_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_7_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER);

    twiddle_h_rsc_0__7__INST.ACLK(clk);
    twiddle_h_rsc_0__7__INST.ARESETn(rst);
    twiddle_h_rsc_0__7__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_7_AWID);
    twiddle_h_rsc_0__7__INST.AWADDR(TLS_twiddle_h_rsc_0_7_AWADDR);
    twiddle_h_rsc_0__7__INST.AWLEN(TLS_twiddle_h_rsc_0_7_AWLEN);
    twiddle_h_rsc_0__7__INST.AWSIZE(TLS_twiddle_h_rsc_0_7_AWSIZE);
    twiddle_h_rsc_0__7__INST.AWBURST(TLS_twiddle_h_rsc_0_7_AWBURST);
    twiddle_h_rsc_0__7__INST.AWLOCK(TLS_twiddle_h_rsc_0_7_AWLOCK);
    twiddle_h_rsc_0__7__INST.AWCACHE(TLS_twiddle_h_rsc_0_7_AWCACHE);
    twiddle_h_rsc_0__7__INST.AWPROT(TLS_twiddle_h_rsc_0_7_AWPROT);
    twiddle_h_rsc_0__7__INST.AWQOS(TLS_twiddle_h_rsc_0_7_AWQOS);
    twiddle_h_rsc_0__7__INST.AWREGION(TLS_twiddle_h_rsc_0_7_AWREGION);
    twiddle_h_rsc_0__7__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_7_AWUSER);
    twiddle_h_rsc_0__7__INST.AWVALID(TLS_twiddle_h_rsc_0_7_AWVALID);
    twiddle_h_rsc_0__7__INST.AWREADY(TLS_twiddle_h_rsc_0_7_AWREADY);
    twiddle_h_rsc_0__7__INST.WDATA(TLS_twiddle_h_rsc_0_7_WDATA);
    twiddle_h_rsc_0__7__INST.WSTRB(TLS_twiddle_h_rsc_0_7_WSTRB);
    twiddle_h_rsc_0__7__INST.WLAST(TLS_twiddle_h_rsc_0_7_WLAST);
    twiddle_h_rsc_0__7__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_7_WUSER);
    twiddle_h_rsc_0__7__INST.WVALID(TLS_twiddle_h_rsc_0_7_WVALID);
    twiddle_h_rsc_0__7__INST.WREADY(TLS_twiddle_h_rsc_0_7_WREADY);
    twiddle_h_rsc_0__7__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_7_BID);
    twiddle_h_rsc_0__7__INST.BRESP(TLS_twiddle_h_rsc_0_7_BRESP);
    twiddle_h_rsc_0__7__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_7_BUSER);
    twiddle_h_rsc_0__7__INST.BVALID(TLS_twiddle_h_rsc_0_7_BVALID);
    twiddle_h_rsc_0__7__INST.BREADY(TLS_twiddle_h_rsc_0_7_BREADY);
    twiddle_h_rsc_0__7__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_7_ARID);
    twiddle_h_rsc_0__7__INST.ARADDR(TLS_twiddle_h_rsc_0_7_ARADDR);
    twiddle_h_rsc_0__7__INST.ARLEN(TLS_twiddle_h_rsc_0_7_ARLEN);
    twiddle_h_rsc_0__7__INST.ARSIZE(TLS_twiddle_h_rsc_0_7_ARSIZE);
    twiddle_h_rsc_0__7__INST.ARBURST(TLS_twiddle_h_rsc_0_7_ARBURST);
    twiddle_h_rsc_0__7__INST.ARLOCK(TLS_twiddle_h_rsc_0_7_ARLOCK);
    twiddle_h_rsc_0__7__INST.ARCACHE(TLS_twiddle_h_rsc_0_7_ARCACHE);
    twiddle_h_rsc_0__7__INST.ARPROT(TLS_twiddle_h_rsc_0_7_ARPROT);
    twiddle_h_rsc_0__7__INST.ARQOS(TLS_twiddle_h_rsc_0_7_ARQOS);
    twiddle_h_rsc_0__7__INST.ARREGION(TLS_twiddle_h_rsc_0_7_ARREGION);
    twiddle_h_rsc_0__7__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_7_ARUSER);
    twiddle_h_rsc_0__7__INST.ARVALID(TLS_twiddle_h_rsc_0_7_ARVALID);
    twiddle_h_rsc_0__7__INST.ARREADY(TLS_twiddle_h_rsc_0_7_ARREADY);
    twiddle_h_rsc_0__7__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_7_RID);
    twiddle_h_rsc_0__7__INST.RDATA(TLS_twiddle_h_rsc_0_7_RDATA);
    twiddle_h_rsc_0__7__INST.RRESP(TLS_twiddle_h_rsc_0_7_RRESP);
    twiddle_h_rsc_0__7__INST.RLAST(TLS_twiddle_h_rsc_0_7_RLAST);
    twiddle_h_rsc_0__7__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_7_RUSER);
    twiddle_h_rsc_0__7__INST.RVALID(TLS_twiddle_h_rsc_0_7_RVALID);
    twiddle_h_rsc_0__7__INST.RREADY(TLS_twiddle_h_rsc_0_7_RREADY);
    twiddle_h_rsc_0__7__INST.tr_write_done(TLS_twiddle_h_rsc_0_7_tr_write_done);
    twiddle_h_rsc_0__7__INST.s_tdone(TLS_twiddle_h_rsc_0_7_s_tdone);
    twiddle_h_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_158)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWID.outSCALAR(TLS_twiddle_h_rsc_0_8_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_8_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_8_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BID.inSCALAR(TLS_twiddle_h_rsc_0_8_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_8_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARID.outSCALAR(TLS_twiddle_h_rsc_0_8_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_8_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_8_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RID.inSCALAR(TLS_twiddle_h_rsc_0_8_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_8_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER);

    twiddle_h_rsc_0__8__INST.ACLK(clk);
    twiddle_h_rsc_0__8__INST.ARESETn(rst);
    twiddle_h_rsc_0__8__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_8_AWID);
    twiddle_h_rsc_0__8__INST.AWADDR(TLS_twiddle_h_rsc_0_8_AWADDR);
    twiddle_h_rsc_0__8__INST.AWLEN(TLS_twiddle_h_rsc_0_8_AWLEN);
    twiddle_h_rsc_0__8__INST.AWSIZE(TLS_twiddle_h_rsc_0_8_AWSIZE);
    twiddle_h_rsc_0__8__INST.AWBURST(TLS_twiddle_h_rsc_0_8_AWBURST);
    twiddle_h_rsc_0__8__INST.AWLOCK(TLS_twiddle_h_rsc_0_8_AWLOCK);
    twiddle_h_rsc_0__8__INST.AWCACHE(TLS_twiddle_h_rsc_0_8_AWCACHE);
    twiddle_h_rsc_0__8__INST.AWPROT(TLS_twiddle_h_rsc_0_8_AWPROT);
    twiddle_h_rsc_0__8__INST.AWQOS(TLS_twiddle_h_rsc_0_8_AWQOS);
    twiddle_h_rsc_0__8__INST.AWREGION(TLS_twiddle_h_rsc_0_8_AWREGION);
    twiddle_h_rsc_0__8__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_8_AWUSER);
    twiddle_h_rsc_0__8__INST.AWVALID(TLS_twiddle_h_rsc_0_8_AWVALID);
    twiddle_h_rsc_0__8__INST.AWREADY(TLS_twiddle_h_rsc_0_8_AWREADY);
    twiddle_h_rsc_0__8__INST.WDATA(TLS_twiddle_h_rsc_0_8_WDATA);
    twiddle_h_rsc_0__8__INST.WSTRB(TLS_twiddle_h_rsc_0_8_WSTRB);
    twiddle_h_rsc_0__8__INST.WLAST(TLS_twiddle_h_rsc_0_8_WLAST);
    twiddle_h_rsc_0__8__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_8_WUSER);
    twiddle_h_rsc_0__8__INST.WVALID(TLS_twiddle_h_rsc_0_8_WVALID);
    twiddle_h_rsc_0__8__INST.WREADY(TLS_twiddle_h_rsc_0_8_WREADY);
    twiddle_h_rsc_0__8__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_8_BID);
    twiddle_h_rsc_0__8__INST.BRESP(TLS_twiddle_h_rsc_0_8_BRESP);
    twiddle_h_rsc_0__8__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_8_BUSER);
    twiddle_h_rsc_0__8__INST.BVALID(TLS_twiddle_h_rsc_0_8_BVALID);
    twiddle_h_rsc_0__8__INST.BREADY(TLS_twiddle_h_rsc_0_8_BREADY);
    twiddle_h_rsc_0__8__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_8_ARID);
    twiddle_h_rsc_0__8__INST.ARADDR(TLS_twiddle_h_rsc_0_8_ARADDR);
    twiddle_h_rsc_0__8__INST.ARLEN(TLS_twiddle_h_rsc_0_8_ARLEN);
    twiddle_h_rsc_0__8__INST.ARSIZE(TLS_twiddle_h_rsc_0_8_ARSIZE);
    twiddle_h_rsc_0__8__INST.ARBURST(TLS_twiddle_h_rsc_0_8_ARBURST);
    twiddle_h_rsc_0__8__INST.ARLOCK(TLS_twiddle_h_rsc_0_8_ARLOCK);
    twiddle_h_rsc_0__8__INST.ARCACHE(TLS_twiddle_h_rsc_0_8_ARCACHE);
    twiddle_h_rsc_0__8__INST.ARPROT(TLS_twiddle_h_rsc_0_8_ARPROT);
    twiddle_h_rsc_0__8__INST.ARQOS(TLS_twiddle_h_rsc_0_8_ARQOS);
    twiddle_h_rsc_0__8__INST.ARREGION(TLS_twiddle_h_rsc_0_8_ARREGION);
    twiddle_h_rsc_0__8__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_8_ARUSER);
    twiddle_h_rsc_0__8__INST.ARVALID(TLS_twiddle_h_rsc_0_8_ARVALID);
    twiddle_h_rsc_0__8__INST.ARREADY(TLS_twiddle_h_rsc_0_8_ARREADY);
    twiddle_h_rsc_0__8__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_8_RID);
    twiddle_h_rsc_0__8__INST.RDATA(TLS_twiddle_h_rsc_0_8_RDATA);
    twiddle_h_rsc_0__8__INST.RRESP(TLS_twiddle_h_rsc_0_8_RRESP);
    twiddle_h_rsc_0__8__INST.RLAST(TLS_twiddle_h_rsc_0_8_RLAST);
    twiddle_h_rsc_0__8__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_8_RUSER);
    twiddle_h_rsc_0__8__INST.RVALID(TLS_twiddle_h_rsc_0_8_RVALID);
    twiddle_h_rsc_0__8__INST.RREADY(TLS_twiddle_h_rsc_0_8_RREADY);
    twiddle_h_rsc_0__8__INST.tr_write_done(TLS_twiddle_h_rsc_0_8_tr_write_done);
    twiddle_h_rsc_0__8__INST.s_tdone(TLS_twiddle_h_rsc_0_8_s_tdone);
    twiddle_h_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_159)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWID.outSCALAR(TLS_twiddle_h_rsc_0_9_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_9_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_9_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BID.inSCALAR(TLS_twiddle_h_rsc_0_9_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_9_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARID.outSCALAR(TLS_twiddle_h_rsc_0_9_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_9_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_9_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RID.inSCALAR(TLS_twiddle_h_rsc_0_9_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_9_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER);

    twiddle_h_rsc_0__9__INST.ACLK(clk);
    twiddle_h_rsc_0__9__INST.ARESETn(rst);
    twiddle_h_rsc_0__9__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_9_AWID);
    twiddle_h_rsc_0__9__INST.AWADDR(TLS_twiddle_h_rsc_0_9_AWADDR);
    twiddle_h_rsc_0__9__INST.AWLEN(TLS_twiddle_h_rsc_0_9_AWLEN);
    twiddle_h_rsc_0__9__INST.AWSIZE(TLS_twiddle_h_rsc_0_9_AWSIZE);
    twiddle_h_rsc_0__9__INST.AWBURST(TLS_twiddle_h_rsc_0_9_AWBURST);
    twiddle_h_rsc_0__9__INST.AWLOCK(TLS_twiddle_h_rsc_0_9_AWLOCK);
    twiddle_h_rsc_0__9__INST.AWCACHE(TLS_twiddle_h_rsc_0_9_AWCACHE);
    twiddle_h_rsc_0__9__INST.AWPROT(TLS_twiddle_h_rsc_0_9_AWPROT);
    twiddle_h_rsc_0__9__INST.AWQOS(TLS_twiddle_h_rsc_0_9_AWQOS);
    twiddle_h_rsc_0__9__INST.AWREGION(TLS_twiddle_h_rsc_0_9_AWREGION);
    twiddle_h_rsc_0__9__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_9_AWUSER);
    twiddle_h_rsc_0__9__INST.AWVALID(TLS_twiddle_h_rsc_0_9_AWVALID);
    twiddle_h_rsc_0__9__INST.AWREADY(TLS_twiddle_h_rsc_0_9_AWREADY);
    twiddle_h_rsc_0__9__INST.WDATA(TLS_twiddle_h_rsc_0_9_WDATA);
    twiddle_h_rsc_0__9__INST.WSTRB(TLS_twiddle_h_rsc_0_9_WSTRB);
    twiddle_h_rsc_0__9__INST.WLAST(TLS_twiddle_h_rsc_0_9_WLAST);
    twiddle_h_rsc_0__9__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_9_WUSER);
    twiddle_h_rsc_0__9__INST.WVALID(TLS_twiddle_h_rsc_0_9_WVALID);
    twiddle_h_rsc_0__9__INST.WREADY(TLS_twiddle_h_rsc_0_9_WREADY);
    twiddle_h_rsc_0__9__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_9_BID);
    twiddle_h_rsc_0__9__INST.BRESP(TLS_twiddle_h_rsc_0_9_BRESP);
    twiddle_h_rsc_0__9__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_9_BUSER);
    twiddle_h_rsc_0__9__INST.BVALID(TLS_twiddle_h_rsc_0_9_BVALID);
    twiddle_h_rsc_0__9__INST.BREADY(TLS_twiddle_h_rsc_0_9_BREADY);
    twiddle_h_rsc_0__9__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_9_ARID);
    twiddle_h_rsc_0__9__INST.ARADDR(TLS_twiddle_h_rsc_0_9_ARADDR);
    twiddle_h_rsc_0__9__INST.ARLEN(TLS_twiddle_h_rsc_0_9_ARLEN);
    twiddle_h_rsc_0__9__INST.ARSIZE(TLS_twiddle_h_rsc_0_9_ARSIZE);
    twiddle_h_rsc_0__9__INST.ARBURST(TLS_twiddle_h_rsc_0_9_ARBURST);
    twiddle_h_rsc_0__9__INST.ARLOCK(TLS_twiddle_h_rsc_0_9_ARLOCK);
    twiddle_h_rsc_0__9__INST.ARCACHE(TLS_twiddle_h_rsc_0_9_ARCACHE);
    twiddle_h_rsc_0__9__INST.ARPROT(TLS_twiddle_h_rsc_0_9_ARPROT);
    twiddle_h_rsc_0__9__INST.ARQOS(TLS_twiddle_h_rsc_0_9_ARQOS);
    twiddle_h_rsc_0__9__INST.ARREGION(TLS_twiddle_h_rsc_0_9_ARREGION);
    twiddle_h_rsc_0__9__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_9_ARUSER);
    twiddle_h_rsc_0__9__INST.ARVALID(TLS_twiddle_h_rsc_0_9_ARVALID);
    twiddle_h_rsc_0__9__INST.ARREADY(TLS_twiddle_h_rsc_0_9_ARREADY);
    twiddle_h_rsc_0__9__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_9_RID);
    twiddle_h_rsc_0__9__INST.RDATA(TLS_twiddle_h_rsc_0_9_RDATA);
    twiddle_h_rsc_0__9__INST.RRESP(TLS_twiddle_h_rsc_0_9_RRESP);
    twiddle_h_rsc_0__9__INST.RLAST(TLS_twiddle_h_rsc_0_9_RLAST);
    twiddle_h_rsc_0__9__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_9_RUSER);
    twiddle_h_rsc_0__9__INST.RVALID(TLS_twiddle_h_rsc_0_9_RVALID);
    twiddle_h_rsc_0__9__INST.RREADY(TLS_twiddle_h_rsc_0_9_RREADY);
    twiddle_h_rsc_0__9__INST.tr_write_done(TLS_twiddle_h_rsc_0_9_tr_write_done);
    twiddle_h_rsc_0__9__INST.s_tdone(TLS_twiddle_h_rsc_0_9_s_tdone);
    twiddle_h_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_160)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWID.outSCALAR(TLS_twiddle_h_rsc_0_10_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_10_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_10_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BID.inSCALAR(TLS_twiddle_h_rsc_0_10_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_10_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARID.outSCALAR(TLS_twiddle_h_rsc_0_10_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_10_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_10_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RID.inSCALAR(TLS_twiddle_h_rsc_0_10_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_10_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER);

    twiddle_h_rsc_0__10__INST.ACLK(clk);
    twiddle_h_rsc_0__10__INST.ARESETn(rst);
    twiddle_h_rsc_0__10__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_10_AWID);
    twiddle_h_rsc_0__10__INST.AWADDR(TLS_twiddle_h_rsc_0_10_AWADDR);
    twiddle_h_rsc_0__10__INST.AWLEN(TLS_twiddle_h_rsc_0_10_AWLEN);
    twiddle_h_rsc_0__10__INST.AWSIZE(TLS_twiddle_h_rsc_0_10_AWSIZE);
    twiddle_h_rsc_0__10__INST.AWBURST(TLS_twiddle_h_rsc_0_10_AWBURST);
    twiddle_h_rsc_0__10__INST.AWLOCK(TLS_twiddle_h_rsc_0_10_AWLOCK);
    twiddle_h_rsc_0__10__INST.AWCACHE(TLS_twiddle_h_rsc_0_10_AWCACHE);
    twiddle_h_rsc_0__10__INST.AWPROT(TLS_twiddle_h_rsc_0_10_AWPROT);
    twiddle_h_rsc_0__10__INST.AWQOS(TLS_twiddle_h_rsc_0_10_AWQOS);
    twiddle_h_rsc_0__10__INST.AWREGION(TLS_twiddle_h_rsc_0_10_AWREGION);
    twiddle_h_rsc_0__10__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_10_AWUSER);
    twiddle_h_rsc_0__10__INST.AWVALID(TLS_twiddle_h_rsc_0_10_AWVALID);
    twiddle_h_rsc_0__10__INST.AWREADY(TLS_twiddle_h_rsc_0_10_AWREADY);
    twiddle_h_rsc_0__10__INST.WDATA(TLS_twiddle_h_rsc_0_10_WDATA);
    twiddle_h_rsc_0__10__INST.WSTRB(TLS_twiddle_h_rsc_0_10_WSTRB);
    twiddle_h_rsc_0__10__INST.WLAST(TLS_twiddle_h_rsc_0_10_WLAST);
    twiddle_h_rsc_0__10__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_10_WUSER);
    twiddle_h_rsc_0__10__INST.WVALID(TLS_twiddle_h_rsc_0_10_WVALID);
    twiddle_h_rsc_0__10__INST.WREADY(TLS_twiddle_h_rsc_0_10_WREADY);
    twiddle_h_rsc_0__10__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_10_BID);
    twiddle_h_rsc_0__10__INST.BRESP(TLS_twiddle_h_rsc_0_10_BRESP);
    twiddle_h_rsc_0__10__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_10_BUSER);
    twiddle_h_rsc_0__10__INST.BVALID(TLS_twiddle_h_rsc_0_10_BVALID);
    twiddle_h_rsc_0__10__INST.BREADY(TLS_twiddle_h_rsc_0_10_BREADY);
    twiddle_h_rsc_0__10__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_10_ARID);
    twiddle_h_rsc_0__10__INST.ARADDR(TLS_twiddle_h_rsc_0_10_ARADDR);
    twiddle_h_rsc_0__10__INST.ARLEN(TLS_twiddle_h_rsc_0_10_ARLEN);
    twiddle_h_rsc_0__10__INST.ARSIZE(TLS_twiddle_h_rsc_0_10_ARSIZE);
    twiddle_h_rsc_0__10__INST.ARBURST(TLS_twiddle_h_rsc_0_10_ARBURST);
    twiddle_h_rsc_0__10__INST.ARLOCK(TLS_twiddle_h_rsc_0_10_ARLOCK);
    twiddle_h_rsc_0__10__INST.ARCACHE(TLS_twiddle_h_rsc_0_10_ARCACHE);
    twiddle_h_rsc_0__10__INST.ARPROT(TLS_twiddle_h_rsc_0_10_ARPROT);
    twiddle_h_rsc_0__10__INST.ARQOS(TLS_twiddle_h_rsc_0_10_ARQOS);
    twiddle_h_rsc_0__10__INST.ARREGION(TLS_twiddle_h_rsc_0_10_ARREGION);
    twiddle_h_rsc_0__10__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_10_ARUSER);
    twiddle_h_rsc_0__10__INST.ARVALID(TLS_twiddle_h_rsc_0_10_ARVALID);
    twiddle_h_rsc_0__10__INST.ARREADY(TLS_twiddle_h_rsc_0_10_ARREADY);
    twiddle_h_rsc_0__10__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_10_RID);
    twiddle_h_rsc_0__10__INST.RDATA(TLS_twiddle_h_rsc_0_10_RDATA);
    twiddle_h_rsc_0__10__INST.RRESP(TLS_twiddle_h_rsc_0_10_RRESP);
    twiddle_h_rsc_0__10__INST.RLAST(TLS_twiddle_h_rsc_0_10_RLAST);
    twiddle_h_rsc_0__10__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_10_RUSER);
    twiddle_h_rsc_0__10__INST.RVALID(TLS_twiddle_h_rsc_0_10_RVALID);
    twiddle_h_rsc_0__10__INST.RREADY(TLS_twiddle_h_rsc_0_10_RREADY);
    twiddle_h_rsc_0__10__INST.tr_write_done(TLS_twiddle_h_rsc_0_10_tr_write_done);
    twiddle_h_rsc_0__10__INST.s_tdone(TLS_twiddle_h_rsc_0_10_s_tdone);
    twiddle_h_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_161)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWID.outSCALAR(TLS_twiddle_h_rsc_0_11_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_11_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_11_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BID.inSCALAR(TLS_twiddle_h_rsc_0_11_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_11_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARID.outSCALAR(TLS_twiddle_h_rsc_0_11_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_11_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_11_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RID.inSCALAR(TLS_twiddle_h_rsc_0_11_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_11_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER);

    twiddle_h_rsc_0__11__INST.ACLK(clk);
    twiddle_h_rsc_0__11__INST.ARESETn(rst);
    twiddle_h_rsc_0__11__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_11_AWID);
    twiddle_h_rsc_0__11__INST.AWADDR(TLS_twiddle_h_rsc_0_11_AWADDR);
    twiddle_h_rsc_0__11__INST.AWLEN(TLS_twiddle_h_rsc_0_11_AWLEN);
    twiddle_h_rsc_0__11__INST.AWSIZE(TLS_twiddle_h_rsc_0_11_AWSIZE);
    twiddle_h_rsc_0__11__INST.AWBURST(TLS_twiddle_h_rsc_0_11_AWBURST);
    twiddle_h_rsc_0__11__INST.AWLOCK(TLS_twiddle_h_rsc_0_11_AWLOCK);
    twiddle_h_rsc_0__11__INST.AWCACHE(TLS_twiddle_h_rsc_0_11_AWCACHE);
    twiddle_h_rsc_0__11__INST.AWPROT(TLS_twiddle_h_rsc_0_11_AWPROT);
    twiddle_h_rsc_0__11__INST.AWQOS(TLS_twiddle_h_rsc_0_11_AWQOS);
    twiddle_h_rsc_0__11__INST.AWREGION(TLS_twiddle_h_rsc_0_11_AWREGION);
    twiddle_h_rsc_0__11__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_11_AWUSER);
    twiddle_h_rsc_0__11__INST.AWVALID(TLS_twiddle_h_rsc_0_11_AWVALID);
    twiddle_h_rsc_0__11__INST.AWREADY(TLS_twiddle_h_rsc_0_11_AWREADY);
    twiddle_h_rsc_0__11__INST.WDATA(TLS_twiddle_h_rsc_0_11_WDATA);
    twiddle_h_rsc_0__11__INST.WSTRB(TLS_twiddle_h_rsc_0_11_WSTRB);
    twiddle_h_rsc_0__11__INST.WLAST(TLS_twiddle_h_rsc_0_11_WLAST);
    twiddle_h_rsc_0__11__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_11_WUSER);
    twiddle_h_rsc_0__11__INST.WVALID(TLS_twiddle_h_rsc_0_11_WVALID);
    twiddle_h_rsc_0__11__INST.WREADY(TLS_twiddle_h_rsc_0_11_WREADY);
    twiddle_h_rsc_0__11__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_11_BID);
    twiddle_h_rsc_0__11__INST.BRESP(TLS_twiddle_h_rsc_0_11_BRESP);
    twiddle_h_rsc_0__11__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_11_BUSER);
    twiddle_h_rsc_0__11__INST.BVALID(TLS_twiddle_h_rsc_0_11_BVALID);
    twiddle_h_rsc_0__11__INST.BREADY(TLS_twiddle_h_rsc_0_11_BREADY);
    twiddle_h_rsc_0__11__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_11_ARID);
    twiddle_h_rsc_0__11__INST.ARADDR(TLS_twiddle_h_rsc_0_11_ARADDR);
    twiddle_h_rsc_0__11__INST.ARLEN(TLS_twiddle_h_rsc_0_11_ARLEN);
    twiddle_h_rsc_0__11__INST.ARSIZE(TLS_twiddle_h_rsc_0_11_ARSIZE);
    twiddle_h_rsc_0__11__INST.ARBURST(TLS_twiddle_h_rsc_0_11_ARBURST);
    twiddle_h_rsc_0__11__INST.ARLOCK(TLS_twiddle_h_rsc_0_11_ARLOCK);
    twiddle_h_rsc_0__11__INST.ARCACHE(TLS_twiddle_h_rsc_0_11_ARCACHE);
    twiddle_h_rsc_0__11__INST.ARPROT(TLS_twiddle_h_rsc_0_11_ARPROT);
    twiddle_h_rsc_0__11__INST.ARQOS(TLS_twiddle_h_rsc_0_11_ARQOS);
    twiddle_h_rsc_0__11__INST.ARREGION(TLS_twiddle_h_rsc_0_11_ARREGION);
    twiddle_h_rsc_0__11__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_11_ARUSER);
    twiddle_h_rsc_0__11__INST.ARVALID(TLS_twiddle_h_rsc_0_11_ARVALID);
    twiddle_h_rsc_0__11__INST.ARREADY(TLS_twiddle_h_rsc_0_11_ARREADY);
    twiddle_h_rsc_0__11__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_11_RID);
    twiddle_h_rsc_0__11__INST.RDATA(TLS_twiddle_h_rsc_0_11_RDATA);
    twiddle_h_rsc_0__11__INST.RRESP(TLS_twiddle_h_rsc_0_11_RRESP);
    twiddle_h_rsc_0__11__INST.RLAST(TLS_twiddle_h_rsc_0_11_RLAST);
    twiddle_h_rsc_0__11__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_11_RUSER);
    twiddle_h_rsc_0__11__INST.RVALID(TLS_twiddle_h_rsc_0_11_RVALID);
    twiddle_h_rsc_0__11__INST.RREADY(TLS_twiddle_h_rsc_0_11_RREADY);
    twiddle_h_rsc_0__11__INST.tr_write_done(TLS_twiddle_h_rsc_0_11_tr_write_done);
    twiddle_h_rsc_0__11__INST.s_tdone(TLS_twiddle_h_rsc_0_11_s_tdone);
    twiddle_h_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_162)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWID.outSCALAR(TLS_twiddle_h_rsc_0_12_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_12_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_12_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BID.inSCALAR(TLS_twiddle_h_rsc_0_12_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_12_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARID.outSCALAR(TLS_twiddle_h_rsc_0_12_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_12_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_12_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RID.inSCALAR(TLS_twiddle_h_rsc_0_12_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_12_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER);

    twiddle_h_rsc_0__12__INST.ACLK(clk);
    twiddle_h_rsc_0__12__INST.ARESETn(rst);
    twiddle_h_rsc_0__12__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_12_AWID);
    twiddle_h_rsc_0__12__INST.AWADDR(TLS_twiddle_h_rsc_0_12_AWADDR);
    twiddle_h_rsc_0__12__INST.AWLEN(TLS_twiddle_h_rsc_0_12_AWLEN);
    twiddle_h_rsc_0__12__INST.AWSIZE(TLS_twiddle_h_rsc_0_12_AWSIZE);
    twiddle_h_rsc_0__12__INST.AWBURST(TLS_twiddle_h_rsc_0_12_AWBURST);
    twiddle_h_rsc_0__12__INST.AWLOCK(TLS_twiddle_h_rsc_0_12_AWLOCK);
    twiddle_h_rsc_0__12__INST.AWCACHE(TLS_twiddle_h_rsc_0_12_AWCACHE);
    twiddle_h_rsc_0__12__INST.AWPROT(TLS_twiddle_h_rsc_0_12_AWPROT);
    twiddle_h_rsc_0__12__INST.AWQOS(TLS_twiddle_h_rsc_0_12_AWQOS);
    twiddle_h_rsc_0__12__INST.AWREGION(TLS_twiddle_h_rsc_0_12_AWREGION);
    twiddle_h_rsc_0__12__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_12_AWUSER);
    twiddle_h_rsc_0__12__INST.AWVALID(TLS_twiddle_h_rsc_0_12_AWVALID);
    twiddle_h_rsc_0__12__INST.AWREADY(TLS_twiddle_h_rsc_0_12_AWREADY);
    twiddle_h_rsc_0__12__INST.WDATA(TLS_twiddle_h_rsc_0_12_WDATA);
    twiddle_h_rsc_0__12__INST.WSTRB(TLS_twiddle_h_rsc_0_12_WSTRB);
    twiddle_h_rsc_0__12__INST.WLAST(TLS_twiddle_h_rsc_0_12_WLAST);
    twiddle_h_rsc_0__12__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_12_WUSER);
    twiddle_h_rsc_0__12__INST.WVALID(TLS_twiddle_h_rsc_0_12_WVALID);
    twiddle_h_rsc_0__12__INST.WREADY(TLS_twiddle_h_rsc_0_12_WREADY);
    twiddle_h_rsc_0__12__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_12_BID);
    twiddle_h_rsc_0__12__INST.BRESP(TLS_twiddle_h_rsc_0_12_BRESP);
    twiddle_h_rsc_0__12__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_12_BUSER);
    twiddle_h_rsc_0__12__INST.BVALID(TLS_twiddle_h_rsc_0_12_BVALID);
    twiddle_h_rsc_0__12__INST.BREADY(TLS_twiddle_h_rsc_0_12_BREADY);
    twiddle_h_rsc_0__12__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_12_ARID);
    twiddle_h_rsc_0__12__INST.ARADDR(TLS_twiddle_h_rsc_0_12_ARADDR);
    twiddle_h_rsc_0__12__INST.ARLEN(TLS_twiddle_h_rsc_0_12_ARLEN);
    twiddle_h_rsc_0__12__INST.ARSIZE(TLS_twiddle_h_rsc_0_12_ARSIZE);
    twiddle_h_rsc_0__12__INST.ARBURST(TLS_twiddle_h_rsc_0_12_ARBURST);
    twiddle_h_rsc_0__12__INST.ARLOCK(TLS_twiddle_h_rsc_0_12_ARLOCK);
    twiddle_h_rsc_0__12__INST.ARCACHE(TLS_twiddle_h_rsc_0_12_ARCACHE);
    twiddle_h_rsc_0__12__INST.ARPROT(TLS_twiddle_h_rsc_0_12_ARPROT);
    twiddle_h_rsc_0__12__INST.ARQOS(TLS_twiddle_h_rsc_0_12_ARQOS);
    twiddle_h_rsc_0__12__INST.ARREGION(TLS_twiddle_h_rsc_0_12_ARREGION);
    twiddle_h_rsc_0__12__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_12_ARUSER);
    twiddle_h_rsc_0__12__INST.ARVALID(TLS_twiddle_h_rsc_0_12_ARVALID);
    twiddle_h_rsc_0__12__INST.ARREADY(TLS_twiddle_h_rsc_0_12_ARREADY);
    twiddle_h_rsc_0__12__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_12_RID);
    twiddle_h_rsc_0__12__INST.RDATA(TLS_twiddle_h_rsc_0_12_RDATA);
    twiddle_h_rsc_0__12__INST.RRESP(TLS_twiddle_h_rsc_0_12_RRESP);
    twiddle_h_rsc_0__12__INST.RLAST(TLS_twiddle_h_rsc_0_12_RLAST);
    twiddle_h_rsc_0__12__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_12_RUSER);
    twiddle_h_rsc_0__12__INST.RVALID(TLS_twiddle_h_rsc_0_12_RVALID);
    twiddle_h_rsc_0__12__INST.RREADY(TLS_twiddle_h_rsc_0_12_RREADY);
    twiddle_h_rsc_0__12__INST.tr_write_done(TLS_twiddle_h_rsc_0_12_tr_write_done);
    twiddle_h_rsc_0__12__INST.s_tdone(TLS_twiddle_h_rsc_0_12_s_tdone);
    twiddle_h_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_163)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWID.outSCALAR(TLS_twiddle_h_rsc_0_13_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_13_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_13_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BID.inSCALAR(TLS_twiddle_h_rsc_0_13_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_13_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARID.outSCALAR(TLS_twiddle_h_rsc_0_13_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_13_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_13_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RID.inSCALAR(TLS_twiddle_h_rsc_0_13_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_13_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER);

    twiddle_h_rsc_0__13__INST.ACLK(clk);
    twiddle_h_rsc_0__13__INST.ARESETn(rst);
    twiddle_h_rsc_0__13__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_13_AWID);
    twiddle_h_rsc_0__13__INST.AWADDR(TLS_twiddle_h_rsc_0_13_AWADDR);
    twiddle_h_rsc_0__13__INST.AWLEN(TLS_twiddle_h_rsc_0_13_AWLEN);
    twiddle_h_rsc_0__13__INST.AWSIZE(TLS_twiddle_h_rsc_0_13_AWSIZE);
    twiddle_h_rsc_0__13__INST.AWBURST(TLS_twiddle_h_rsc_0_13_AWBURST);
    twiddle_h_rsc_0__13__INST.AWLOCK(TLS_twiddle_h_rsc_0_13_AWLOCK);
    twiddle_h_rsc_0__13__INST.AWCACHE(TLS_twiddle_h_rsc_0_13_AWCACHE);
    twiddle_h_rsc_0__13__INST.AWPROT(TLS_twiddle_h_rsc_0_13_AWPROT);
    twiddle_h_rsc_0__13__INST.AWQOS(TLS_twiddle_h_rsc_0_13_AWQOS);
    twiddle_h_rsc_0__13__INST.AWREGION(TLS_twiddle_h_rsc_0_13_AWREGION);
    twiddle_h_rsc_0__13__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_13_AWUSER);
    twiddle_h_rsc_0__13__INST.AWVALID(TLS_twiddle_h_rsc_0_13_AWVALID);
    twiddle_h_rsc_0__13__INST.AWREADY(TLS_twiddle_h_rsc_0_13_AWREADY);
    twiddle_h_rsc_0__13__INST.WDATA(TLS_twiddle_h_rsc_0_13_WDATA);
    twiddle_h_rsc_0__13__INST.WSTRB(TLS_twiddle_h_rsc_0_13_WSTRB);
    twiddle_h_rsc_0__13__INST.WLAST(TLS_twiddle_h_rsc_0_13_WLAST);
    twiddle_h_rsc_0__13__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_13_WUSER);
    twiddle_h_rsc_0__13__INST.WVALID(TLS_twiddle_h_rsc_0_13_WVALID);
    twiddle_h_rsc_0__13__INST.WREADY(TLS_twiddle_h_rsc_0_13_WREADY);
    twiddle_h_rsc_0__13__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_13_BID);
    twiddle_h_rsc_0__13__INST.BRESP(TLS_twiddle_h_rsc_0_13_BRESP);
    twiddle_h_rsc_0__13__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_13_BUSER);
    twiddle_h_rsc_0__13__INST.BVALID(TLS_twiddle_h_rsc_0_13_BVALID);
    twiddle_h_rsc_0__13__INST.BREADY(TLS_twiddle_h_rsc_0_13_BREADY);
    twiddle_h_rsc_0__13__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_13_ARID);
    twiddle_h_rsc_0__13__INST.ARADDR(TLS_twiddle_h_rsc_0_13_ARADDR);
    twiddle_h_rsc_0__13__INST.ARLEN(TLS_twiddle_h_rsc_0_13_ARLEN);
    twiddle_h_rsc_0__13__INST.ARSIZE(TLS_twiddle_h_rsc_0_13_ARSIZE);
    twiddle_h_rsc_0__13__INST.ARBURST(TLS_twiddle_h_rsc_0_13_ARBURST);
    twiddle_h_rsc_0__13__INST.ARLOCK(TLS_twiddle_h_rsc_0_13_ARLOCK);
    twiddle_h_rsc_0__13__INST.ARCACHE(TLS_twiddle_h_rsc_0_13_ARCACHE);
    twiddle_h_rsc_0__13__INST.ARPROT(TLS_twiddle_h_rsc_0_13_ARPROT);
    twiddle_h_rsc_0__13__INST.ARQOS(TLS_twiddle_h_rsc_0_13_ARQOS);
    twiddle_h_rsc_0__13__INST.ARREGION(TLS_twiddle_h_rsc_0_13_ARREGION);
    twiddle_h_rsc_0__13__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_13_ARUSER);
    twiddle_h_rsc_0__13__INST.ARVALID(TLS_twiddle_h_rsc_0_13_ARVALID);
    twiddle_h_rsc_0__13__INST.ARREADY(TLS_twiddle_h_rsc_0_13_ARREADY);
    twiddle_h_rsc_0__13__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_13_RID);
    twiddle_h_rsc_0__13__INST.RDATA(TLS_twiddle_h_rsc_0_13_RDATA);
    twiddle_h_rsc_0__13__INST.RRESP(TLS_twiddle_h_rsc_0_13_RRESP);
    twiddle_h_rsc_0__13__INST.RLAST(TLS_twiddle_h_rsc_0_13_RLAST);
    twiddle_h_rsc_0__13__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_13_RUSER);
    twiddle_h_rsc_0__13__INST.RVALID(TLS_twiddle_h_rsc_0_13_RVALID);
    twiddle_h_rsc_0__13__INST.RREADY(TLS_twiddle_h_rsc_0_13_RREADY);
    twiddle_h_rsc_0__13__INST.tr_write_done(TLS_twiddle_h_rsc_0_13_tr_write_done);
    twiddle_h_rsc_0__13__INST.s_tdone(TLS_twiddle_h_rsc_0_13_s_tdone);
    twiddle_h_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_164)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWID.outSCALAR(TLS_twiddle_h_rsc_0_14_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_14_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_14_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BID.inSCALAR(TLS_twiddle_h_rsc_0_14_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_14_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARID.outSCALAR(TLS_twiddle_h_rsc_0_14_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_14_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_14_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RID.inSCALAR(TLS_twiddle_h_rsc_0_14_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_14_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER);

    twiddle_h_rsc_0__14__INST.ACLK(clk);
    twiddle_h_rsc_0__14__INST.ARESETn(rst);
    twiddle_h_rsc_0__14__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_14_AWID);
    twiddle_h_rsc_0__14__INST.AWADDR(TLS_twiddle_h_rsc_0_14_AWADDR);
    twiddle_h_rsc_0__14__INST.AWLEN(TLS_twiddle_h_rsc_0_14_AWLEN);
    twiddle_h_rsc_0__14__INST.AWSIZE(TLS_twiddle_h_rsc_0_14_AWSIZE);
    twiddle_h_rsc_0__14__INST.AWBURST(TLS_twiddle_h_rsc_0_14_AWBURST);
    twiddle_h_rsc_0__14__INST.AWLOCK(TLS_twiddle_h_rsc_0_14_AWLOCK);
    twiddle_h_rsc_0__14__INST.AWCACHE(TLS_twiddle_h_rsc_0_14_AWCACHE);
    twiddle_h_rsc_0__14__INST.AWPROT(TLS_twiddle_h_rsc_0_14_AWPROT);
    twiddle_h_rsc_0__14__INST.AWQOS(TLS_twiddle_h_rsc_0_14_AWQOS);
    twiddle_h_rsc_0__14__INST.AWREGION(TLS_twiddle_h_rsc_0_14_AWREGION);
    twiddle_h_rsc_0__14__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_14_AWUSER);
    twiddle_h_rsc_0__14__INST.AWVALID(TLS_twiddle_h_rsc_0_14_AWVALID);
    twiddle_h_rsc_0__14__INST.AWREADY(TLS_twiddle_h_rsc_0_14_AWREADY);
    twiddle_h_rsc_0__14__INST.WDATA(TLS_twiddle_h_rsc_0_14_WDATA);
    twiddle_h_rsc_0__14__INST.WSTRB(TLS_twiddle_h_rsc_0_14_WSTRB);
    twiddle_h_rsc_0__14__INST.WLAST(TLS_twiddle_h_rsc_0_14_WLAST);
    twiddle_h_rsc_0__14__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_14_WUSER);
    twiddle_h_rsc_0__14__INST.WVALID(TLS_twiddle_h_rsc_0_14_WVALID);
    twiddle_h_rsc_0__14__INST.WREADY(TLS_twiddle_h_rsc_0_14_WREADY);
    twiddle_h_rsc_0__14__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_14_BID);
    twiddle_h_rsc_0__14__INST.BRESP(TLS_twiddle_h_rsc_0_14_BRESP);
    twiddle_h_rsc_0__14__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_14_BUSER);
    twiddle_h_rsc_0__14__INST.BVALID(TLS_twiddle_h_rsc_0_14_BVALID);
    twiddle_h_rsc_0__14__INST.BREADY(TLS_twiddle_h_rsc_0_14_BREADY);
    twiddle_h_rsc_0__14__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_14_ARID);
    twiddle_h_rsc_0__14__INST.ARADDR(TLS_twiddle_h_rsc_0_14_ARADDR);
    twiddle_h_rsc_0__14__INST.ARLEN(TLS_twiddle_h_rsc_0_14_ARLEN);
    twiddle_h_rsc_0__14__INST.ARSIZE(TLS_twiddle_h_rsc_0_14_ARSIZE);
    twiddle_h_rsc_0__14__INST.ARBURST(TLS_twiddle_h_rsc_0_14_ARBURST);
    twiddle_h_rsc_0__14__INST.ARLOCK(TLS_twiddle_h_rsc_0_14_ARLOCK);
    twiddle_h_rsc_0__14__INST.ARCACHE(TLS_twiddle_h_rsc_0_14_ARCACHE);
    twiddle_h_rsc_0__14__INST.ARPROT(TLS_twiddle_h_rsc_0_14_ARPROT);
    twiddle_h_rsc_0__14__INST.ARQOS(TLS_twiddle_h_rsc_0_14_ARQOS);
    twiddle_h_rsc_0__14__INST.ARREGION(TLS_twiddle_h_rsc_0_14_ARREGION);
    twiddle_h_rsc_0__14__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_14_ARUSER);
    twiddle_h_rsc_0__14__INST.ARVALID(TLS_twiddle_h_rsc_0_14_ARVALID);
    twiddle_h_rsc_0__14__INST.ARREADY(TLS_twiddle_h_rsc_0_14_ARREADY);
    twiddle_h_rsc_0__14__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_14_RID);
    twiddle_h_rsc_0__14__INST.RDATA(TLS_twiddle_h_rsc_0_14_RDATA);
    twiddle_h_rsc_0__14__INST.RRESP(TLS_twiddle_h_rsc_0_14_RRESP);
    twiddle_h_rsc_0__14__INST.RLAST(TLS_twiddle_h_rsc_0_14_RLAST);
    twiddle_h_rsc_0__14__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_14_RUSER);
    twiddle_h_rsc_0__14__INST.RVALID(TLS_twiddle_h_rsc_0_14_RVALID);
    twiddle_h_rsc_0__14__INST.RREADY(TLS_twiddle_h_rsc_0_14_RREADY);
    twiddle_h_rsc_0__14__INST.tr_write_done(TLS_twiddle_h_rsc_0_14_tr_write_done);
    twiddle_h_rsc_0__14__INST.s_tdone(TLS_twiddle_h_rsc_0_14_s_tdone);
    twiddle_h_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_165)));

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_AWID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWID.outSCALAR(TLS_twiddle_h_rsc_0_15_AWID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_AWUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_AWUSER.outSCALAR(TLS_twiddle_h_rsc_0_15_AWUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_WUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_WUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_WUSER.outSCALAR(TLS_twiddle_h_rsc_0_15_WUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BID.inSCALAR(TLS_twiddle_h_rsc_0_15_BID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_BID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER.inSCALAR(TLS_twiddle_h_rsc_0_15_BUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARID.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_ARID);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARID.outSCALAR(TLS_twiddle_h_rsc_0_15_ARID);

    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARUSER.inVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_ARUSER);
    CCS_ADAPTOR_TLS_twiddle_h_rsc_0_15_ARUSER.outSCALAR(TLS_twiddle_h_rsc_0_15_ARUSER);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RID.inSCALAR(TLS_twiddle_h_rsc_0_15_RID);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RID.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_RID);

    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER.inSCALAR(TLS_twiddle_h_rsc_0_15_RUSER);
    CCS_ADAPTOR_CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER.outVECTOR(CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER);

    twiddle_h_rsc_0__15__INST.ACLK(clk);
    twiddle_h_rsc_0__15__INST.ARESETn(rst);
    twiddle_h_rsc_0__15__INST.AWID(CCS_ADAPTOR_twiddle_h_rsc_0_15_AWID);
    twiddle_h_rsc_0__15__INST.AWADDR(TLS_twiddle_h_rsc_0_15_AWADDR);
    twiddle_h_rsc_0__15__INST.AWLEN(TLS_twiddle_h_rsc_0_15_AWLEN);
    twiddle_h_rsc_0__15__INST.AWSIZE(TLS_twiddle_h_rsc_0_15_AWSIZE);
    twiddle_h_rsc_0__15__INST.AWBURST(TLS_twiddle_h_rsc_0_15_AWBURST);
    twiddle_h_rsc_0__15__INST.AWLOCK(TLS_twiddle_h_rsc_0_15_AWLOCK);
    twiddle_h_rsc_0__15__INST.AWCACHE(TLS_twiddle_h_rsc_0_15_AWCACHE);
    twiddle_h_rsc_0__15__INST.AWPROT(TLS_twiddle_h_rsc_0_15_AWPROT);
    twiddle_h_rsc_0__15__INST.AWQOS(TLS_twiddle_h_rsc_0_15_AWQOS);
    twiddle_h_rsc_0__15__INST.AWREGION(TLS_twiddle_h_rsc_0_15_AWREGION);
    twiddle_h_rsc_0__15__INST.AWUSER(CCS_ADAPTOR_twiddle_h_rsc_0_15_AWUSER);
    twiddle_h_rsc_0__15__INST.AWVALID(TLS_twiddle_h_rsc_0_15_AWVALID);
    twiddle_h_rsc_0__15__INST.AWREADY(TLS_twiddle_h_rsc_0_15_AWREADY);
    twiddle_h_rsc_0__15__INST.WDATA(TLS_twiddle_h_rsc_0_15_WDATA);
    twiddle_h_rsc_0__15__INST.WSTRB(TLS_twiddle_h_rsc_0_15_WSTRB);
    twiddle_h_rsc_0__15__INST.WLAST(TLS_twiddle_h_rsc_0_15_WLAST);
    twiddle_h_rsc_0__15__INST.WUSER(CCS_ADAPTOR_twiddle_h_rsc_0_15_WUSER);
    twiddle_h_rsc_0__15__INST.WVALID(TLS_twiddle_h_rsc_0_15_WVALID);
    twiddle_h_rsc_0__15__INST.WREADY(TLS_twiddle_h_rsc_0_15_WREADY);
    twiddle_h_rsc_0__15__INST.BID(CCS_ADAPTOR_twiddle_h_rsc_0_15_BID);
    twiddle_h_rsc_0__15__INST.BRESP(TLS_twiddle_h_rsc_0_15_BRESP);
    twiddle_h_rsc_0__15__INST.BUSER(CCS_ADAPTOR_twiddle_h_rsc_0_15_BUSER);
    twiddle_h_rsc_0__15__INST.BVALID(TLS_twiddle_h_rsc_0_15_BVALID);
    twiddle_h_rsc_0__15__INST.BREADY(TLS_twiddle_h_rsc_0_15_BREADY);
    twiddle_h_rsc_0__15__INST.ARID(CCS_ADAPTOR_twiddle_h_rsc_0_15_ARID);
    twiddle_h_rsc_0__15__INST.ARADDR(TLS_twiddle_h_rsc_0_15_ARADDR);
    twiddle_h_rsc_0__15__INST.ARLEN(TLS_twiddle_h_rsc_0_15_ARLEN);
    twiddle_h_rsc_0__15__INST.ARSIZE(TLS_twiddle_h_rsc_0_15_ARSIZE);
    twiddle_h_rsc_0__15__INST.ARBURST(TLS_twiddle_h_rsc_0_15_ARBURST);
    twiddle_h_rsc_0__15__INST.ARLOCK(TLS_twiddle_h_rsc_0_15_ARLOCK);
    twiddle_h_rsc_0__15__INST.ARCACHE(TLS_twiddle_h_rsc_0_15_ARCACHE);
    twiddle_h_rsc_0__15__INST.ARPROT(TLS_twiddle_h_rsc_0_15_ARPROT);
    twiddle_h_rsc_0__15__INST.ARQOS(TLS_twiddle_h_rsc_0_15_ARQOS);
    twiddle_h_rsc_0__15__INST.ARREGION(TLS_twiddle_h_rsc_0_15_ARREGION);
    twiddle_h_rsc_0__15__INST.ARUSER(CCS_ADAPTOR_twiddle_h_rsc_0_15_ARUSER);
    twiddle_h_rsc_0__15__INST.ARVALID(TLS_twiddle_h_rsc_0_15_ARVALID);
    twiddle_h_rsc_0__15__INST.ARREADY(TLS_twiddle_h_rsc_0_15_ARREADY);
    twiddle_h_rsc_0__15__INST.RID(CCS_ADAPTOR_twiddle_h_rsc_0_15_RID);
    twiddle_h_rsc_0__15__INST.RDATA(TLS_twiddle_h_rsc_0_15_RDATA);
    twiddle_h_rsc_0__15__INST.RRESP(TLS_twiddle_h_rsc_0_15_RRESP);
    twiddle_h_rsc_0__15__INST.RLAST(TLS_twiddle_h_rsc_0_15_RLAST);
    twiddle_h_rsc_0__15__INST.RUSER(CCS_ADAPTOR_twiddle_h_rsc_0_15_RUSER);
    twiddle_h_rsc_0__15__INST.RVALID(TLS_twiddle_h_rsc_0_15_RVALID);
    twiddle_h_rsc_0__15__INST.RREADY(TLS_twiddle_h_rsc_0_15_RREADY);
    twiddle_h_rsc_0__15__INST.tr_write_done(TLS_twiddle_h_rsc_0_15_tr_write_done);
    twiddle_h_rsc_0__15__INST.s_tdone(TLS_twiddle_h_rsc_0_15_s_tdone);
    twiddle_h_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_166)));

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

    trios_monitor_xt_rsc_triosy_1_0_lz_INST.trios(TLS_xt_rsc_triosy_1_0_lz);
    trios_monitor_xt_rsc_triosy_1_0_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_1_lz_INST.trios(TLS_xt_rsc_triosy_1_1_lz);
    trios_monitor_xt_rsc_triosy_1_1_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_2_lz_INST.trios(TLS_xt_rsc_triosy_1_2_lz);
    trios_monitor_xt_rsc_triosy_1_2_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_3_lz_INST.trios(TLS_xt_rsc_triosy_1_3_lz);
    trios_monitor_xt_rsc_triosy_1_3_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_4_lz_INST.trios(TLS_xt_rsc_triosy_1_4_lz);
    trios_monitor_xt_rsc_triosy_1_4_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_5_lz_INST.trios(TLS_xt_rsc_triosy_1_5_lz);
    trios_monitor_xt_rsc_triosy_1_5_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_6_lz_INST.trios(TLS_xt_rsc_triosy_1_6_lz);
    trios_monitor_xt_rsc_triosy_1_6_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_7_lz_INST.trios(TLS_xt_rsc_triosy_1_7_lz);
    trios_monitor_xt_rsc_triosy_1_7_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_8_lz_INST.trios(TLS_xt_rsc_triosy_1_8_lz);
    trios_monitor_xt_rsc_triosy_1_8_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_9_lz_INST.trios(TLS_xt_rsc_triosy_1_9_lz);
    trios_monitor_xt_rsc_triosy_1_9_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_10_lz_INST.trios(TLS_xt_rsc_triosy_1_10_lz);
    trios_monitor_xt_rsc_triosy_1_10_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_11_lz_INST.trios(TLS_xt_rsc_triosy_1_11_lz);
    trios_monitor_xt_rsc_triosy_1_11_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_12_lz_INST.trios(TLS_xt_rsc_triosy_1_12_lz);
    trios_monitor_xt_rsc_triosy_1_12_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_13_lz_INST.trios(TLS_xt_rsc_triosy_1_13_lz);
    trios_monitor_xt_rsc_triosy_1_13_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_14_lz_INST.trios(TLS_xt_rsc_triosy_1_14_lz);
    trios_monitor_xt_rsc_triosy_1_14_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_15_lz_INST.trios(TLS_xt_rsc_triosy_1_15_lz);
    trios_monitor_xt_rsc_triosy_1_15_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_16_lz_INST.trios(TLS_xt_rsc_triosy_1_16_lz);
    trios_monitor_xt_rsc_triosy_1_16_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_17_lz_INST.trios(TLS_xt_rsc_triosy_1_17_lz);
    trios_monitor_xt_rsc_triosy_1_17_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_18_lz_INST.trios(TLS_xt_rsc_triosy_1_18_lz);
    trios_monitor_xt_rsc_triosy_1_18_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_19_lz_INST.trios(TLS_xt_rsc_triosy_1_19_lz);
    trios_monitor_xt_rsc_triosy_1_19_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_20_lz_INST.trios(TLS_xt_rsc_triosy_1_20_lz);
    trios_monitor_xt_rsc_triosy_1_20_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_21_lz_INST.trios(TLS_xt_rsc_triosy_1_21_lz);
    trios_monitor_xt_rsc_triosy_1_21_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_22_lz_INST.trios(TLS_xt_rsc_triosy_1_22_lz);
    trios_monitor_xt_rsc_triosy_1_22_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_23_lz_INST.trios(TLS_xt_rsc_triosy_1_23_lz);
    trios_monitor_xt_rsc_triosy_1_23_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_24_lz_INST.trios(TLS_xt_rsc_triosy_1_24_lz);
    trios_monitor_xt_rsc_triosy_1_24_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_25_lz_INST.trios(TLS_xt_rsc_triosy_1_25_lz);
    trios_monitor_xt_rsc_triosy_1_25_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_26_lz_INST.trios(TLS_xt_rsc_triosy_1_26_lz);
    trios_monitor_xt_rsc_triosy_1_26_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_27_lz_INST.trios(TLS_xt_rsc_triosy_1_27_lz);
    trios_monitor_xt_rsc_triosy_1_27_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_28_lz_INST.trios(TLS_xt_rsc_triosy_1_28_lz);
    trios_monitor_xt_rsc_triosy_1_28_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_29_lz_INST.trios(TLS_xt_rsc_triosy_1_29_lz);
    trios_monitor_xt_rsc_triosy_1_29_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_30_lz_INST.trios(TLS_xt_rsc_triosy_1_30_lz);
    trios_monitor_xt_rsc_triosy_1_30_lz_INST.register_mon(&catapult_monitor_INST);

    trios_monitor_xt_rsc_triosy_1_31_lz_INST.trios(TLS_xt_rsc_triosy_1_31_lz);
    trios_monitor_xt_rsc_triosy_1_31_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_xt.in_fifo(TLS_in_fifo_xt);
    transactor_xt.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_xt);
    transactor_xt.out_fifo(TLS_out_fifo_xt);
    transactor_xt.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_xt);
    transactor_xt.bind_clk(clk, true, rst);
    transactor_xt.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_xt.register_block(&xt_rsc_0__0__INST, xt_rsc_0__0__INST.basename(), TLS_xt_rsc_triosy_0_0_lz, 0,
        8160, 32);
    transactor_xt.register_block(&xt_rsc_0__1__INST, xt_rsc_0__1__INST.basename(), TLS_xt_rsc_triosy_0_1_lz, 1,
        8161, 32);
    transactor_xt.register_block(&xt_rsc_0__2__INST, xt_rsc_0__2__INST.basename(), TLS_xt_rsc_triosy_0_2_lz, 2,
        8162, 32);
    transactor_xt.register_block(&xt_rsc_0__3__INST, xt_rsc_0__3__INST.basename(), TLS_xt_rsc_triosy_0_3_lz, 3,
        8163, 32);
    transactor_xt.register_block(&xt_rsc_0__4__INST, xt_rsc_0__4__INST.basename(), TLS_xt_rsc_triosy_0_4_lz, 4,
        8164, 32);
    transactor_xt.register_block(&xt_rsc_0__5__INST, xt_rsc_0__5__INST.basename(), TLS_xt_rsc_triosy_0_5_lz, 5,
        8165, 32);
    transactor_xt.register_block(&xt_rsc_0__6__INST, xt_rsc_0__6__INST.basename(), TLS_xt_rsc_triosy_0_6_lz, 6,
        8166, 32);
    transactor_xt.register_block(&xt_rsc_0__7__INST, xt_rsc_0__7__INST.basename(), TLS_xt_rsc_triosy_0_7_lz, 7,
        8167, 32);
    transactor_xt.register_block(&xt_rsc_0__8__INST, xt_rsc_0__8__INST.basename(), TLS_xt_rsc_triosy_0_8_lz, 8,
        8168, 32);
    transactor_xt.register_block(&xt_rsc_0__9__INST, xt_rsc_0__9__INST.basename(), TLS_xt_rsc_triosy_0_9_lz, 9,
        8169, 32);
    transactor_xt.register_block(&xt_rsc_0__10__INST, xt_rsc_0__10__INST.basename(), TLS_xt_rsc_triosy_0_10_lz,
        10, 8170, 32);
    transactor_xt.register_block(&xt_rsc_0__11__INST, xt_rsc_0__11__INST.basename(), TLS_xt_rsc_triosy_0_11_lz,
        11, 8171, 32);
    transactor_xt.register_block(&xt_rsc_0__12__INST, xt_rsc_0__12__INST.basename(), TLS_xt_rsc_triosy_0_12_lz,
        12, 8172, 32);
    transactor_xt.register_block(&xt_rsc_0__13__INST, xt_rsc_0__13__INST.basename(), TLS_xt_rsc_triosy_0_13_lz,
        13, 8173, 32);
    transactor_xt.register_block(&xt_rsc_0__14__INST, xt_rsc_0__14__INST.basename(), TLS_xt_rsc_triosy_0_14_lz,
        14, 8174, 32);
    transactor_xt.register_block(&xt_rsc_0__15__INST, xt_rsc_0__15__INST.basename(), TLS_xt_rsc_triosy_0_15_lz,
        15, 8175, 32);
    transactor_xt.register_block(&xt_rsc_0__16__INST, xt_rsc_0__16__INST.basename(), TLS_xt_rsc_triosy_0_16_lz,
        16, 8176, 32);
    transactor_xt.register_block(&xt_rsc_0__17__INST, xt_rsc_0__17__INST.basename(), TLS_xt_rsc_triosy_0_17_lz,
        17, 8177, 32);
    transactor_xt.register_block(&xt_rsc_0__18__INST, xt_rsc_0__18__INST.basename(), TLS_xt_rsc_triosy_0_18_lz,
        18, 8178, 32);
    transactor_xt.register_block(&xt_rsc_0__19__INST, xt_rsc_0__19__INST.basename(), TLS_xt_rsc_triosy_0_19_lz,
        19, 8179, 32);
    transactor_xt.register_block(&xt_rsc_0__20__INST, xt_rsc_0__20__INST.basename(), TLS_xt_rsc_triosy_0_20_lz,
        20, 8180, 32);
    transactor_xt.register_block(&xt_rsc_0__21__INST, xt_rsc_0__21__INST.basename(), TLS_xt_rsc_triosy_0_21_lz,
        21, 8181, 32);
    transactor_xt.register_block(&xt_rsc_0__22__INST, xt_rsc_0__22__INST.basename(), TLS_xt_rsc_triosy_0_22_lz,
        22, 8182, 32);
    transactor_xt.register_block(&xt_rsc_0__23__INST, xt_rsc_0__23__INST.basename(), TLS_xt_rsc_triosy_0_23_lz,
        23, 8183, 32);
    transactor_xt.register_block(&xt_rsc_0__24__INST, xt_rsc_0__24__INST.basename(), TLS_xt_rsc_triosy_0_24_lz,
        24, 8184, 32);
    transactor_xt.register_block(&xt_rsc_0__25__INST, xt_rsc_0__25__INST.basename(), TLS_xt_rsc_triosy_0_25_lz,
        25, 8185, 32);
    transactor_xt.register_block(&xt_rsc_0__26__INST, xt_rsc_0__26__INST.basename(), TLS_xt_rsc_triosy_0_26_lz,
        26, 8186, 32);
    transactor_xt.register_block(&xt_rsc_0__27__INST, xt_rsc_0__27__INST.basename(), TLS_xt_rsc_triosy_0_27_lz,
        27, 8187, 32);
    transactor_xt.register_block(&xt_rsc_0__28__INST, xt_rsc_0__28__INST.basename(), TLS_xt_rsc_triosy_0_28_lz,
        28, 8188, 32);
    transactor_xt.register_block(&xt_rsc_0__29__INST, xt_rsc_0__29__INST.basename(), TLS_xt_rsc_triosy_0_29_lz,
        29, 8189, 32);
    transactor_xt.register_block(&xt_rsc_0__30__INST, xt_rsc_0__30__INST.basename(), TLS_xt_rsc_triosy_0_30_lz,
        30, 8190, 32);
    transactor_xt.register_block(&xt_rsc_0__31__INST, xt_rsc_0__31__INST.basename(), TLS_xt_rsc_triosy_0_31_lz,
        31, 8191, 32);
    transactor_xt.register_block(&xt_rsc_1__0__INST, xt_rsc_1__0__INST.basename(), TLS_xt_rsc_triosy_1_0_lz, 8192,
        16352, 32);
    transactor_xt.register_block(&xt_rsc_1__1__INST, xt_rsc_1__1__INST.basename(), TLS_xt_rsc_triosy_1_1_lz, 8193,
        16353, 32);
    transactor_xt.register_block(&xt_rsc_1__2__INST, xt_rsc_1__2__INST.basename(), TLS_xt_rsc_triosy_1_2_lz, 8194,
        16354, 32);
    transactor_xt.register_block(&xt_rsc_1__3__INST, xt_rsc_1__3__INST.basename(), TLS_xt_rsc_triosy_1_3_lz, 8195,
        16355, 32);
    transactor_xt.register_block(&xt_rsc_1__4__INST, xt_rsc_1__4__INST.basename(), TLS_xt_rsc_triosy_1_4_lz, 8196,
        16356, 32);
    transactor_xt.register_block(&xt_rsc_1__5__INST, xt_rsc_1__5__INST.basename(), TLS_xt_rsc_triosy_1_5_lz, 8197,
        16357, 32);
    transactor_xt.register_block(&xt_rsc_1__6__INST, xt_rsc_1__6__INST.basename(), TLS_xt_rsc_triosy_1_6_lz, 8198,
        16358, 32);
    transactor_xt.register_block(&xt_rsc_1__7__INST, xt_rsc_1__7__INST.basename(), TLS_xt_rsc_triosy_1_7_lz, 8199,
        16359, 32);
    transactor_xt.register_block(&xt_rsc_1__8__INST, xt_rsc_1__8__INST.basename(), TLS_xt_rsc_triosy_1_8_lz, 8200,
        16360, 32);
    transactor_xt.register_block(&xt_rsc_1__9__INST, xt_rsc_1__9__INST.basename(), TLS_xt_rsc_triosy_1_9_lz, 8201,
        16361, 32);
    transactor_xt.register_block(&xt_rsc_1__10__INST, xt_rsc_1__10__INST.basename(), TLS_xt_rsc_triosy_1_10_lz,
        8202, 16362, 32);
    transactor_xt.register_block(&xt_rsc_1__11__INST, xt_rsc_1__11__INST.basename(), TLS_xt_rsc_triosy_1_11_lz,
        8203, 16363, 32);
    transactor_xt.register_block(&xt_rsc_1__12__INST, xt_rsc_1__12__INST.basename(), TLS_xt_rsc_triosy_1_12_lz,
        8204, 16364, 32);
    transactor_xt.register_block(&xt_rsc_1__13__INST, xt_rsc_1__13__INST.basename(), TLS_xt_rsc_triosy_1_13_lz,
        8205, 16365, 32);
    transactor_xt.register_block(&xt_rsc_1__14__INST, xt_rsc_1__14__INST.basename(), TLS_xt_rsc_triosy_1_14_lz,
        8206, 16366, 32);
    transactor_xt.register_block(&xt_rsc_1__15__INST, xt_rsc_1__15__INST.basename(), TLS_xt_rsc_triosy_1_15_lz,
        8207, 16367, 32);
    transactor_xt.register_block(&xt_rsc_1__16__INST, xt_rsc_1__16__INST.basename(), TLS_xt_rsc_triosy_1_16_lz,
        8208, 16368, 32);
    transactor_xt.register_block(&xt_rsc_1__17__INST, xt_rsc_1__17__INST.basename(), TLS_xt_rsc_triosy_1_17_lz,
        8209, 16369, 32);
    transactor_xt.register_block(&xt_rsc_1__18__INST, xt_rsc_1__18__INST.basename(), TLS_xt_rsc_triosy_1_18_lz,
        8210, 16370, 32);
    transactor_xt.register_block(&xt_rsc_1__19__INST, xt_rsc_1__19__INST.basename(), TLS_xt_rsc_triosy_1_19_lz,
        8211, 16371, 32);
    transactor_xt.register_block(&xt_rsc_1__20__INST, xt_rsc_1__20__INST.basename(), TLS_xt_rsc_triosy_1_20_lz,
        8212, 16372, 32);
    transactor_xt.register_block(&xt_rsc_1__21__INST, xt_rsc_1__21__INST.basename(), TLS_xt_rsc_triosy_1_21_lz,
        8213, 16373, 32);
    transactor_xt.register_block(&xt_rsc_1__22__INST, xt_rsc_1__22__INST.basename(), TLS_xt_rsc_triosy_1_22_lz,
        8214, 16374, 32);
    transactor_xt.register_block(&xt_rsc_1__23__INST, xt_rsc_1__23__INST.basename(), TLS_xt_rsc_triosy_1_23_lz,
        8215, 16375, 32);
    transactor_xt.register_block(&xt_rsc_1__24__INST, xt_rsc_1__24__INST.basename(), TLS_xt_rsc_triosy_1_24_lz,
        8216, 16376, 32);
    transactor_xt.register_block(&xt_rsc_1__25__INST, xt_rsc_1__25__INST.basename(), TLS_xt_rsc_triosy_1_25_lz,
        8217, 16377, 32);
    transactor_xt.register_block(&xt_rsc_1__26__INST, xt_rsc_1__26__INST.basename(), TLS_xt_rsc_triosy_1_26_lz,
        8218, 16378, 32);
    transactor_xt.register_block(&xt_rsc_1__27__INST, xt_rsc_1__27__INST.basename(), TLS_xt_rsc_triosy_1_27_lz,
        8219, 16379, 32);
    transactor_xt.register_block(&xt_rsc_1__28__INST, xt_rsc_1__28__INST.basename(), TLS_xt_rsc_triosy_1_28_lz,
        8220, 16380, 32);
    transactor_xt.register_block(&xt_rsc_1__29__INST, xt_rsc_1__29__INST.basename(), TLS_xt_rsc_triosy_1_29_lz,
        8221, 16381, 32);
    transactor_xt.register_block(&xt_rsc_1__30__INST, xt_rsc_1__30__INST.basename(), TLS_xt_rsc_triosy_1_30_lz,
        8222, 16382, 32);
    transactor_xt.register_block(&xt_rsc_1__31__INST, xt_rsc_1__31__INST.basename(), TLS_xt_rsc_triosy_1_31_lz,
        8223, 16383, 32);

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
        0, 16368, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__1__INST, twiddle_rsc_0__1__INST.basename(), TLS_twiddle_rsc_triosy_0_1_lz,
        1, 16369, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__2__INST, twiddle_rsc_0__2__INST.basename(), TLS_twiddle_rsc_triosy_0_2_lz,
        2, 16370, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__3__INST, twiddle_rsc_0__3__INST.basename(), TLS_twiddle_rsc_triosy_0_3_lz,
        3, 16371, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__4__INST, twiddle_rsc_0__4__INST.basename(), TLS_twiddle_rsc_triosy_0_4_lz,
        4, 16372, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__5__INST, twiddle_rsc_0__5__INST.basename(), TLS_twiddle_rsc_triosy_0_5_lz,
        5, 16373, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__6__INST, twiddle_rsc_0__6__INST.basename(), TLS_twiddle_rsc_triosy_0_6_lz,
        6, 16374, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__7__INST, twiddle_rsc_0__7__INST.basename(), TLS_twiddle_rsc_triosy_0_7_lz,
        7, 16375, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__8__INST, twiddle_rsc_0__8__INST.basename(), TLS_twiddle_rsc_triosy_0_8_lz,
        8, 16376, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__9__INST, twiddle_rsc_0__9__INST.basename(), TLS_twiddle_rsc_triosy_0_9_lz,
        9, 16377, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__10__INST, twiddle_rsc_0__10__INST.basename(), TLS_twiddle_rsc_triosy_0_10_lz,
        10, 16378, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__11__INST, twiddle_rsc_0__11__INST.basename(), TLS_twiddle_rsc_triosy_0_11_lz,
        11, 16379, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__12__INST, twiddle_rsc_0__12__INST.basename(), TLS_twiddle_rsc_triosy_0_12_lz,
        12, 16380, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__13__INST, twiddle_rsc_0__13__INST.basename(), TLS_twiddle_rsc_triosy_0_13_lz,
        13, 16381, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__14__INST, twiddle_rsc_0__14__INST.basename(), TLS_twiddle_rsc_triosy_0_14_lz,
        14, 16382, 16);
    transactor_twiddle.register_block(&twiddle_rsc_0__15__INST, twiddle_rsc_0__15__INST.basename(), TLS_twiddle_rsc_triosy_0_15_lz,
        15, 16383, 16);

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
        0, 16368, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__1__INST, twiddle_h_rsc_0__1__INST.basename(), TLS_twiddle_h_rsc_triosy_0_1_lz,
        1, 16369, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__2__INST, twiddle_h_rsc_0__2__INST.basename(), TLS_twiddle_h_rsc_triosy_0_2_lz,
        2, 16370, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__3__INST, twiddle_h_rsc_0__3__INST.basename(), TLS_twiddle_h_rsc_triosy_0_3_lz,
        3, 16371, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__4__INST, twiddle_h_rsc_0__4__INST.basename(), TLS_twiddle_h_rsc_triosy_0_4_lz,
        4, 16372, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__5__INST, twiddle_h_rsc_0__5__INST.basename(), TLS_twiddle_h_rsc_triosy_0_5_lz,
        5, 16373, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__6__INST, twiddle_h_rsc_0__6__INST.basename(), TLS_twiddle_h_rsc_triosy_0_6_lz,
        6, 16374, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__7__INST, twiddle_h_rsc_0__7__INST.basename(), TLS_twiddle_h_rsc_triosy_0_7_lz,
        7, 16375, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__8__INST, twiddle_h_rsc_0__8__INST.basename(), TLS_twiddle_h_rsc_triosy_0_8_lz,
        8, 16376, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__9__INST, twiddle_h_rsc_0__9__INST.basename(), TLS_twiddle_h_rsc_triosy_0_9_lz,
        9, 16377, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__10__INST, twiddle_h_rsc_0__10__INST.basename(), TLS_twiddle_h_rsc_triosy_0_10_lz,
        10, 16378, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__11__INST, twiddle_h_rsc_0__11__INST.basename(), TLS_twiddle_h_rsc_triosy_0_11_lz,
        11, 16379, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__12__INST, twiddle_h_rsc_0__12__INST.basename(), TLS_twiddle_h_rsc_triosy_0_12_lz,
        12, 16380, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__13__INST, twiddle_h_rsc_0__13__INST.basename(), TLS_twiddle_h_rsc_triosy_0_13_lz,
        13, 16381, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__14__INST, twiddle_h_rsc_0__14__INST.basename(), TLS_twiddle_h_rsc_triosy_0_14_lz,
        14, 16382, 16);
    transactor_twiddle_h.register_block(&twiddle_h_rsc_0__15__INST, twiddle_h_rsc_0__15__INST.basename(), TLS_twiddle_h_rsc_triosy_0_15_lz,
        15, 16383, 16);

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
  xt_rsc_1__0__INST.clear();
  xt_rsc_1__1__INST.clear();
  xt_rsc_1__2__INST.clear();
  xt_rsc_1__3__INST.clear();
  xt_rsc_1__4__INST.clear();
  xt_rsc_1__5__INST.clear();
  xt_rsc_1__6__INST.clear();
  xt_rsc_1__7__INST.clear();
  xt_rsc_1__8__INST.clear();
  xt_rsc_1__9__INST.clear();
  xt_rsc_1__10__INST.clear();
  xt_rsc_1__11__INST.clear();
  xt_rsc_1__12__INST.clear();
  xt_rsc_1__13__INST.clear();
  xt_rsc_1__14__INST.clear();
  xt_rsc_1__15__INST.clear();
  xt_rsc_1__16__INST.clear();
  xt_rsc_1__17__INST.clear();
  xt_rsc_1__18__INST.clear();
  xt_rsc_1__19__INST.clear();
  xt_rsc_1__20__INST.clear();
  xt_rsc_1__21__INST.clear();
  xt_rsc_1__22__INST.clear();
  xt_rsc_1__23__INST.clear();
  xt_rsc_1__24__INST.clear();
  xt_rsc_1__25__INST.clear();
  xt_rsc_1__26__INST.clear();
  xt_rsc_1__27__INST.clear();
  xt_rsc_1__28__INST.clear();
  xt_rsc_1__29__INST.clear();
  xt_rsc_1__30__INST.clear();
  xt_rsc_1__31__INST.clear();
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
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_4_i_inst_peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_ctrl_inst_twiddle_rsc_0_4_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_4_i_inst/peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_ctrl_inst/twiddle_rsc_0_4_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_4_i_inst_peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_ctrl_inst_twiddle_rsc_0_4_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_4_i_inst/peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_ctrl_inst/twiddle_rsc_0_4_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_4_i_inst_peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_dp_inst_twiddle_rsc_0_4_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_4_i_inst/peaseNTT_core_twiddle_rsc_0_4_i_twiddle_rsc_0_4_wait_dp_inst/twiddle_rsc_0_4_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_5_i_inst_peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_ctrl_inst_twiddle_rsc_0_5_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_5_i_inst/peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_ctrl_inst/twiddle_rsc_0_5_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_5_i_inst_peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_ctrl_inst_twiddle_rsc_0_5_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_5_i_inst/peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_ctrl_inst/twiddle_rsc_0_5_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_5_i_inst_peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_dp_inst_twiddle_rsc_0_5_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_5_i_inst/peaseNTT_core_twiddle_rsc_0_5_i_twiddle_rsc_0_5_wait_dp_inst/twiddle_rsc_0_5_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_6_i_inst_peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_ctrl_inst_twiddle_rsc_0_6_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_6_i_inst/peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_ctrl_inst/twiddle_rsc_0_6_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_6_i_inst_peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_ctrl_inst_twiddle_rsc_0_6_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_6_i_inst/peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_ctrl_inst/twiddle_rsc_0_6_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_6_i_inst_peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_dp_inst_twiddle_rsc_0_6_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_6_i_inst/peaseNTT_core_twiddle_rsc_0_6_i_twiddle_rsc_0_6_wait_dp_inst/twiddle_rsc_0_6_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_7_i_inst_peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_ctrl_inst_twiddle_rsc_0_7_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_7_i_inst/peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_ctrl_inst/twiddle_rsc_0_7_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_7_i_inst_peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_ctrl_inst_twiddle_rsc_0_7_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_7_i_inst/peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_ctrl_inst/twiddle_rsc_0_7_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_7_i_inst_peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_dp_inst_twiddle_rsc_0_7_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_7_i_inst/peaseNTT_core_twiddle_rsc_0_7_i_twiddle_rsc_0_7_wait_dp_inst/twiddle_rsc_0_7_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_8_i_inst_peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_ctrl_inst_twiddle_rsc_0_8_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_8_i_inst/peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_ctrl_inst/twiddle_rsc_0_8_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_8_i_inst_peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_ctrl_inst_twiddle_rsc_0_8_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_8_i_inst/peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_ctrl_inst/twiddle_rsc_0_8_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_8_i_inst_peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_dp_inst_twiddle_rsc_0_8_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_8_i_inst/peaseNTT_core_twiddle_rsc_0_8_i_twiddle_rsc_0_8_wait_dp_inst/twiddle_rsc_0_8_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_9_i_inst_peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_ctrl_inst_twiddle_rsc_0_9_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_9_i_inst/peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_ctrl_inst/twiddle_rsc_0_9_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_9_i_inst_peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_ctrl_inst_twiddle_rsc_0_9_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_9_i_inst/peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_ctrl_inst/twiddle_rsc_0_9_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_9_i_inst_peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_dp_inst_twiddle_rsc_0_9_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_9_i_inst/peaseNTT_core_twiddle_rsc_0_9_i_twiddle_rsc_0_9_wait_dp_inst/twiddle_rsc_0_9_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_10_i_inst_peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_ctrl_inst_twiddle_rsc_0_10_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_10_i_inst/peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_ctrl_inst/twiddle_rsc_0_10_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_10_i_inst_peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_ctrl_inst_twiddle_rsc_0_10_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_10_i_inst/peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_ctrl_inst/twiddle_rsc_0_10_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_10_i_inst_peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_dp_inst_twiddle_rsc_0_10_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_10_i_inst/peaseNTT_core_twiddle_rsc_0_10_i_twiddle_rsc_0_10_wait_dp_inst/twiddle_rsc_0_10_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_11_i_inst_peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_ctrl_inst_twiddle_rsc_0_11_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_11_i_inst/peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_ctrl_inst/twiddle_rsc_0_11_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_11_i_inst_peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_ctrl_inst_twiddle_rsc_0_11_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_11_i_inst/peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_ctrl_inst/twiddle_rsc_0_11_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_11_i_inst_peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_dp_inst_twiddle_rsc_0_11_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_11_i_inst/peaseNTT_core_twiddle_rsc_0_11_i_twiddle_rsc_0_11_wait_dp_inst/twiddle_rsc_0_11_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_12_i_inst_peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_ctrl_inst_twiddle_rsc_0_12_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_12_i_inst/peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_ctrl_inst/twiddle_rsc_0_12_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_12_i_inst_peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_ctrl_inst_twiddle_rsc_0_12_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_12_i_inst/peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_ctrl_inst/twiddle_rsc_0_12_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_12_i_inst_peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_dp_inst_twiddle_rsc_0_12_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_12_i_inst/peaseNTT_core_twiddle_rsc_0_12_i_twiddle_rsc_0_12_wait_dp_inst/twiddle_rsc_0_12_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_13_i_inst_peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_ctrl_inst_twiddle_rsc_0_13_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_13_i_inst/peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_ctrl_inst/twiddle_rsc_0_13_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_13_i_inst_peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_ctrl_inst_twiddle_rsc_0_13_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_13_i_inst/peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_ctrl_inst/twiddle_rsc_0_13_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_13_i_inst_peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_dp_inst_twiddle_rsc_0_13_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_13_i_inst/peaseNTT_core_twiddle_rsc_0_13_i_twiddle_rsc_0_13_wait_dp_inst/twiddle_rsc_0_13_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_14_i_inst_peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_ctrl_inst_twiddle_rsc_0_14_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_14_i_inst/peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_ctrl_inst/twiddle_rsc_0_14_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_14_i_inst_peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_ctrl_inst_twiddle_rsc_0_14_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_14_i_inst/peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_ctrl_inst/twiddle_rsc_0_14_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_14_i_inst_peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_dp_inst_twiddle_rsc_0_14_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_14_i_inst/peaseNTT_core_twiddle_rsc_0_14_i_twiddle_rsc_0_14_wait_dp_inst/twiddle_rsc_0_14_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_15_i_inst_peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_ctrl_inst_twiddle_rsc_0_15_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_15_i_inst/peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_ctrl_inst/twiddle_rsc_0_15_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_15_i_inst_peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_ctrl_inst_twiddle_rsc_0_15_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_15_i_inst/peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_ctrl_inst/twiddle_rsc_0_15_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_rsc_0_15_i_inst_peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_dp_inst_twiddle_rsc_0_15_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_rsc_0_15_i_inst/peaseNTT_core_twiddle_rsc_0_15_i_twiddle_rsc_0_15_wait_dp_inst/twiddle_rsc_0_15_i_s_raddr_core_sct);
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
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_ctrl_inst_twiddle_h_rsc_0_4_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_4_i_inst/peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_ctrl_inst/twiddle_h_rsc_0_4_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_ctrl_inst_twiddle_h_rsc_0_4_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_4_i_inst/peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_ctrl_inst/twiddle_h_rsc_0_4_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_inst_peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_dp_inst_twiddle_h_rsc_0_4_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_4_i_inst/peaseNTT_core_twiddle_h_rsc_0_4_i_twiddle_h_rsc_0_4_wait_dp_inst/twiddle_h_rsc_0_4_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_ctrl_inst_twiddle_h_rsc_0_5_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_5_i_inst/peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_ctrl_inst/twiddle_h_rsc_0_5_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_ctrl_inst_twiddle_h_rsc_0_5_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_5_i_inst/peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_ctrl_inst/twiddle_h_rsc_0_5_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_inst_peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_dp_inst_twiddle_h_rsc_0_5_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_5_i_inst/peaseNTT_core_twiddle_h_rsc_0_5_i_twiddle_h_rsc_0_5_wait_dp_inst/twiddle_h_rsc_0_5_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_ctrl_inst_twiddle_h_rsc_0_6_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_6_i_inst/peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_ctrl_inst/twiddle_h_rsc_0_6_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_ctrl_inst_twiddle_h_rsc_0_6_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_6_i_inst/peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_ctrl_inst/twiddle_h_rsc_0_6_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_inst_peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_dp_inst_twiddle_h_rsc_0_6_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_6_i_inst/peaseNTT_core_twiddle_h_rsc_0_6_i_twiddle_h_rsc_0_6_wait_dp_inst/twiddle_h_rsc_0_6_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_ctrl_inst_twiddle_h_rsc_0_7_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_7_i_inst/peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_ctrl_inst/twiddle_h_rsc_0_7_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_ctrl_inst_twiddle_h_rsc_0_7_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_7_i_inst/peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_ctrl_inst/twiddle_h_rsc_0_7_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_inst_peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_dp_inst_twiddle_h_rsc_0_7_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_7_i_inst/peaseNTT_core_twiddle_h_rsc_0_7_i_twiddle_h_rsc_0_7_wait_dp_inst/twiddle_h_rsc_0_7_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_ctrl_inst_twiddle_h_rsc_0_8_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_8_i_inst/peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_ctrl_inst/twiddle_h_rsc_0_8_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_ctrl_inst_twiddle_h_rsc_0_8_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_8_i_inst/peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_ctrl_inst/twiddle_h_rsc_0_8_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_inst_peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_dp_inst_twiddle_h_rsc_0_8_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_8_i_inst/peaseNTT_core_twiddle_h_rsc_0_8_i_twiddle_h_rsc_0_8_wait_dp_inst/twiddle_h_rsc_0_8_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_ctrl_inst_twiddle_h_rsc_0_9_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_9_i_inst/peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_ctrl_inst/twiddle_h_rsc_0_9_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_ctrl_inst_twiddle_h_rsc_0_9_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_9_i_inst/peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_ctrl_inst/twiddle_h_rsc_0_9_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_inst_peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_dp_inst_twiddle_h_rsc_0_9_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_9_i_inst/peaseNTT_core_twiddle_h_rsc_0_9_i_twiddle_h_rsc_0_9_wait_dp_inst/twiddle_h_rsc_0_9_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_ctrl_inst_twiddle_h_rsc_0_10_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_10_i_inst/peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_ctrl_inst/twiddle_h_rsc_0_10_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_ctrl_inst_twiddle_h_rsc_0_10_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_10_i_inst/peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_ctrl_inst/twiddle_h_rsc_0_10_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_inst_peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_dp_inst_twiddle_h_rsc_0_10_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_10_i_inst/peaseNTT_core_twiddle_h_rsc_0_10_i_twiddle_h_rsc_0_10_wait_dp_inst/twiddle_h_rsc_0_10_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_ctrl_inst_twiddle_h_rsc_0_11_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_11_i_inst/peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_ctrl_inst/twiddle_h_rsc_0_11_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_ctrl_inst_twiddle_h_rsc_0_11_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_11_i_inst/peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_ctrl_inst/twiddle_h_rsc_0_11_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_inst_peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_dp_inst_twiddle_h_rsc_0_11_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_11_i_inst/peaseNTT_core_twiddle_h_rsc_0_11_i_twiddle_h_rsc_0_11_wait_dp_inst/twiddle_h_rsc_0_11_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_ctrl_inst_twiddle_h_rsc_0_12_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_12_i_inst/peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_ctrl_inst/twiddle_h_rsc_0_12_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_ctrl_inst_twiddle_h_rsc_0_12_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_12_i_inst/peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_ctrl_inst/twiddle_h_rsc_0_12_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_inst_peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_dp_inst_twiddle_h_rsc_0_12_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_12_i_inst/peaseNTT_core_twiddle_h_rsc_0_12_i_twiddle_h_rsc_0_12_wait_dp_inst/twiddle_h_rsc_0_12_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_ctrl_inst_twiddle_h_rsc_0_13_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_13_i_inst/peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_ctrl_inst/twiddle_h_rsc_0_13_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_ctrl_inst_twiddle_h_rsc_0_13_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_13_i_inst/peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_ctrl_inst/twiddle_h_rsc_0_13_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_inst_peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_dp_inst_twiddle_h_rsc_0_13_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_13_i_inst/peaseNTT_core_twiddle_h_rsc_0_13_i_twiddle_h_rsc_0_13_wait_dp_inst/twiddle_h_rsc_0_13_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_ctrl_inst_twiddle_h_rsc_0_14_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_14_i_inst/peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_ctrl_inst/twiddle_h_rsc_0_14_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_ctrl_inst_twiddle_h_rsc_0_14_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_14_i_inst/peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_ctrl_inst/twiddle_h_rsc_0_14_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_inst_peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_dp_inst_twiddle_h_rsc_0_14_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_14_i_inst/peaseNTT_core_twiddle_h_rsc_0_14_i_twiddle_h_rsc_0_14_wait_dp_inst/twiddle_h_rsc_0_14_i_s_raddr_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_ctrl_inst_twiddle_h_rsc_0_15_i_s_re_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_15_i_inst/peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_ctrl_inst/twiddle_h_rsc_0_15_i_s_re_core_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_ctrl_inst_twiddle_h_rsc_0_15_i_s_rrdy,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_15_i_inst/peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_ctrl_inst/twiddle_h_rsc_0_15_i_s_rrdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_peaseNTT_core_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_inst_peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_dp_inst_twiddle_h_rsc_0_15_i_s_raddr_core_sct,
      /scverify_top/rtl/peaseNTT_core_inst/peaseNTT_core_twiddle_h_rsc_0_15_i_inst/peaseNTT_core_twiddle_h_rsc_0_15_i_twiddle_h_rsc_0_15_wait_dp_inst/twiddle_h_rsc_0_15_i_s_raddr_core_sct);
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
