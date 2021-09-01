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
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_0_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_0_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_0_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_1_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_1_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_1_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_2_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_2_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_2_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_3_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_3_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_3_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_4_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_4_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_4_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_4_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_5_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_5_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_5_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_5_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_6_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_6_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_6_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_6_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_7_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_7_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_7_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_7_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_8_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_8_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_8_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_8_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_8_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_9_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_9_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_9_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_9_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_9_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_10_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_10_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_10_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_10_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_10_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_11_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_11_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_11_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_11_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_11_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_12_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_12_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_12_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_12_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_12_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_13_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_13_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_13_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_13_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_13_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_14_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_14_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_14_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_14_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_14_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_15_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_15_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_15_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_15_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_15_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_16_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_16_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_16_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_16_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_16_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_16_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_17_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_17_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_17_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_17_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_17_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_17_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_18_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_18_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_18_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_18_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_18_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_18_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_19_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_19_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_19_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_19_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_19_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_19_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_20_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_20_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_20_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_20_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_20_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_20_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_21_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_21_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_21_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_21_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_21_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_21_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_22_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_22_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_22_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_22_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_22_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_22_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_23_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_23_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_23_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_23_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_23_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_23_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_24_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_24_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_24_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_24_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_24_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_24_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_25_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_25_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_25_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_25_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_25_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_25_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_26_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_26_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_26_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_26_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_26_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_26_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_27_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_27_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_27_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_27_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_27_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_27_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_28_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_28_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_28_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_28_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_28_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_28_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_29_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_29_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_29_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_29_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_29_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_29_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_30_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_30_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_30_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_30_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_30_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_30_lz;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_31_wadr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_31_d;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_0_31_we;
  sc_signal<sc_lv<5> >                                                         TLS_vec_rsc_0_31_radr;
  sc_signal<sc_lv<64> >                                                        TLS_vec_rsc_0_31_q;
  sc_signal<sc_logic>                                                          TLS_vec_rsc_triosy_0_31_lz;
  sc_signal<sc_lv<64> >                                                        TLS_p_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_p_rsc_triosy_lz;
  sc_signal<sc_lv<64> >                                                        TLS_r_rsc_dat;
  sc_signal<sc_logic>                                                          TLS_r_rsc_triosy_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_0_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_0_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_0_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_1_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_1_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_1_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_2_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_2_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_2_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_3_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_3_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_3_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_4_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_4_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_4_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_5_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_5_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_5_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_6_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_6_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_6_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_7_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_7_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_7_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_8_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_8_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_8_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_9_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_9_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_9_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_10_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_10_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_10_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_11_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_11_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_11_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_12_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_12_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_12_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_13_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_13_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_13_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_14_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_14_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_14_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_15_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_15_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_15_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_16_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_16_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_16_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_17_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_17_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_17_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_18_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_18_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_18_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_19_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_19_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_19_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_20_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_20_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_20_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_21_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_21_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_21_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_22_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_22_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_22_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_23_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_23_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_23_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_24_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_24_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_24_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_25_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_25_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_25_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_26_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_26_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_26_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_27_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_27_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_27_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_28_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_28_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_28_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_29_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_29_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_29_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_30_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_30_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_30_lz;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0_31_radr;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0_31_q;
  sc_signal<sc_logic>                                                          TLS_twiddle_rsc_triosy_0_31_lz;
  ccs_DUT_wrapper                                                              inPlaceNTT_DIF_INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__0__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__1__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__2__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__3__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__4__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__5__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__6__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__7__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__8__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__9__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__10__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__11__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__12__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__13__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__14__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__15__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__16__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__17__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__18__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__19__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__20__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__21__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__22__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__23__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__24__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__25__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__26__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__27__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__28__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__29__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__30__INST;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           vec_rsc_0__31__INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   p_rsc_INST;
  ccs_in_trans_rsc_v1<1,64 >                                                   r_rsc_INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__0__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__0__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__0__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__0__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__1__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__1__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__1__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__1__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__2__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__2__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__2__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__2__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__3__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__3__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__3__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__3__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__4__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__4__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__4__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__4__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__5__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__5__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__5__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__5__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__6__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__6__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__6__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__6__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__7__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__7__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__7__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__7__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__8__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__8__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__8__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__8__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__9__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__9__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__9__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__9__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__10__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__10__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__10__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__10__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__11__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__11__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__11__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__11__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__12__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__12__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__12__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__12__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__13__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__13__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__13__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__13__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__14__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__14__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__14__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__14__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__15__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__15__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__15__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__15__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__16__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__16__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__16__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__16__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__17__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__17__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__17__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__17__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__18__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__18__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__18__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__18__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__19__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__19__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__19__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__19__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__20__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__20__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__20__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__20__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__21__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__21__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__21__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__21__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__22__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__22__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__22__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__22__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__23__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__23__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__23__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__23__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__24__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__24__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__24__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__24__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__25__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__25__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__25__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__25__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__26__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__26__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__26__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__26__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__27__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__27__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__27__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__27__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__28__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__28__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__28__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__28__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__29__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__29__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__29__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__29__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__30__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__30__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__30__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__30__INST;
  sc_signal<sc_lv<64> >                                                        TLS_twiddle_rsc_0__31__d;
  sc_signal<sc_lv<5> >                                                         TLS_twiddle_rsc_0__31__wadr;
  sc_signal<sc_logic >                                                         TLS_twiddle_rsc_0__31__we;
  BLOCK_1R1W_RBW_trans_rsc<5,64,32 >                                           twiddle_rsc_0__31__INST;
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
    twiddle_rsc_0__0__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_41)));

    twiddle_rsc_0__1__INST.q(TLS_twiddle_rsc_0_1_q);
    twiddle_rsc_0__1__INST.radr(TLS_twiddle_rsc_0_1_radr);
    twiddle_rsc_0__1__INST.clk(clk);
    twiddle_rsc_0__1__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__1__INST.d(TLS_twiddle_rsc_0__1__d);
    twiddle_rsc_0__1__INST.wadr(TLS_twiddle_rsc_0__1__wadr);
    twiddle_rsc_0__1__INST.we(TLS_twiddle_rsc_0__1__we);
    twiddle_rsc_0__1__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_42)));

    twiddle_rsc_0__2__INST.q(TLS_twiddle_rsc_0_2_q);
    twiddle_rsc_0__2__INST.radr(TLS_twiddle_rsc_0_2_radr);
    twiddle_rsc_0__2__INST.clk(clk);
    twiddle_rsc_0__2__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__2__INST.d(TLS_twiddle_rsc_0__2__d);
    twiddle_rsc_0__2__INST.wadr(TLS_twiddle_rsc_0__2__wadr);
    twiddle_rsc_0__2__INST.we(TLS_twiddle_rsc_0__2__we);
    twiddle_rsc_0__2__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_43)));

    twiddle_rsc_0__3__INST.q(TLS_twiddle_rsc_0_3_q);
    twiddle_rsc_0__3__INST.radr(TLS_twiddle_rsc_0_3_radr);
    twiddle_rsc_0__3__INST.clk(clk);
    twiddle_rsc_0__3__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__3__INST.d(TLS_twiddle_rsc_0__3__d);
    twiddle_rsc_0__3__INST.wadr(TLS_twiddle_rsc_0__3__wadr);
    twiddle_rsc_0__3__INST.we(TLS_twiddle_rsc_0__3__we);
    twiddle_rsc_0__3__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_44)));

    twiddle_rsc_0__4__INST.q(TLS_twiddle_rsc_0_4_q);
    twiddle_rsc_0__4__INST.radr(TLS_twiddle_rsc_0_4_radr);
    twiddle_rsc_0__4__INST.clk(clk);
    twiddle_rsc_0__4__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__4__INST.d(TLS_twiddle_rsc_0__4__d);
    twiddle_rsc_0__4__INST.wadr(TLS_twiddle_rsc_0__4__wadr);
    twiddle_rsc_0__4__INST.we(TLS_twiddle_rsc_0__4__we);
    twiddle_rsc_0__4__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_45)));

    twiddle_rsc_0__5__INST.q(TLS_twiddle_rsc_0_5_q);
    twiddle_rsc_0__5__INST.radr(TLS_twiddle_rsc_0_5_radr);
    twiddle_rsc_0__5__INST.clk(clk);
    twiddle_rsc_0__5__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__5__INST.d(TLS_twiddle_rsc_0__5__d);
    twiddle_rsc_0__5__INST.wadr(TLS_twiddle_rsc_0__5__wadr);
    twiddle_rsc_0__5__INST.we(TLS_twiddle_rsc_0__5__we);
    twiddle_rsc_0__5__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_46)));

    twiddle_rsc_0__6__INST.q(TLS_twiddle_rsc_0_6_q);
    twiddle_rsc_0__6__INST.radr(TLS_twiddle_rsc_0_6_radr);
    twiddle_rsc_0__6__INST.clk(clk);
    twiddle_rsc_0__6__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__6__INST.d(TLS_twiddle_rsc_0__6__d);
    twiddle_rsc_0__6__INST.wadr(TLS_twiddle_rsc_0__6__wadr);
    twiddle_rsc_0__6__INST.we(TLS_twiddle_rsc_0__6__we);
    twiddle_rsc_0__6__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_47)));

    twiddle_rsc_0__7__INST.q(TLS_twiddle_rsc_0_7_q);
    twiddle_rsc_0__7__INST.radr(TLS_twiddle_rsc_0_7_radr);
    twiddle_rsc_0__7__INST.clk(clk);
    twiddle_rsc_0__7__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__7__INST.d(TLS_twiddle_rsc_0__7__d);
    twiddle_rsc_0__7__INST.wadr(TLS_twiddle_rsc_0__7__wadr);
    twiddle_rsc_0__7__INST.we(TLS_twiddle_rsc_0__7__we);
    twiddle_rsc_0__7__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_48)));

    twiddle_rsc_0__8__INST.q(TLS_twiddle_rsc_0_8_q);
    twiddle_rsc_0__8__INST.radr(TLS_twiddle_rsc_0_8_radr);
    twiddle_rsc_0__8__INST.clk(clk);
    twiddle_rsc_0__8__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__8__INST.d(TLS_twiddle_rsc_0__8__d);
    twiddle_rsc_0__8__INST.wadr(TLS_twiddle_rsc_0__8__wadr);
    twiddle_rsc_0__8__INST.we(TLS_twiddle_rsc_0__8__we);
    twiddle_rsc_0__8__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_49)));

    twiddle_rsc_0__9__INST.q(TLS_twiddle_rsc_0_9_q);
    twiddle_rsc_0__9__INST.radr(TLS_twiddle_rsc_0_9_radr);
    twiddle_rsc_0__9__INST.clk(clk);
    twiddle_rsc_0__9__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__9__INST.d(TLS_twiddle_rsc_0__9__d);
    twiddle_rsc_0__9__INST.wadr(TLS_twiddle_rsc_0__9__wadr);
    twiddle_rsc_0__9__INST.we(TLS_twiddle_rsc_0__9__we);
    twiddle_rsc_0__9__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_50)));

    twiddle_rsc_0__10__INST.q(TLS_twiddle_rsc_0_10_q);
    twiddle_rsc_0__10__INST.radr(TLS_twiddle_rsc_0_10_radr);
    twiddle_rsc_0__10__INST.clk(clk);
    twiddle_rsc_0__10__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__10__INST.d(TLS_twiddle_rsc_0__10__d);
    twiddle_rsc_0__10__INST.wadr(TLS_twiddle_rsc_0__10__wadr);
    twiddle_rsc_0__10__INST.we(TLS_twiddle_rsc_0__10__we);
    twiddle_rsc_0__10__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_51)));

    twiddle_rsc_0__11__INST.q(TLS_twiddle_rsc_0_11_q);
    twiddle_rsc_0__11__INST.radr(TLS_twiddle_rsc_0_11_radr);
    twiddle_rsc_0__11__INST.clk(clk);
    twiddle_rsc_0__11__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__11__INST.d(TLS_twiddle_rsc_0__11__d);
    twiddle_rsc_0__11__INST.wadr(TLS_twiddle_rsc_0__11__wadr);
    twiddle_rsc_0__11__INST.we(TLS_twiddle_rsc_0__11__we);
    twiddle_rsc_0__11__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_52)));

    twiddle_rsc_0__12__INST.q(TLS_twiddle_rsc_0_12_q);
    twiddle_rsc_0__12__INST.radr(TLS_twiddle_rsc_0_12_radr);
    twiddle_rsc_0__12__INST.clk(clk);
    twiddle_rsc_0__12__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__12__INST.d(TLS_twiddle_rsc_0__12__d);
    twiddle_rsc_0__12__INST.wadr(TLS_twiddle_rsc_0__12__wadr);
    twiddle_rsc_0__12__INST.we(TLS_twiddle_rsc_0__12__we);
    twiddle_rsc_0__12__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_53)));

    twiddle_rsc_0__13__INST.q(TLS_twiddle_rsc_0_13_q);
    twiddle_rsc_0__13__INST.radr(TLS_twiddle_rsc_0_13_radr);
    twiddle_rsc_0__13__INST.clk(clk);
    twiddle_rsc_0__13__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__13__INST.d(TLS_twiddle_rsc_0__13__d);
    twiddle_rsc_0__13__INST.wadr(TLS_twiddle_rsc_0__13__wadr);
    twiddle_rsc_0__13__INST.we(TLS_twiddle_rsc_0__13__we);
    twiddle_rsc_0__13__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_54)));

    twiddle_rsc_0__14__INST.q(TLS_twiddle_rsc_0_14_q);
    twiddle_rsc_0__14__INST.radr(TLS_twiddle_rsc_0_14_radr);
    twiddle_rsc_0__14__INST.clk(clk);
    twiddle_rsc_0__14__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__14__INST.d(TLS_twiddle_rsc_0__14__d);
    twiddle_rsc_0__14__INST.wadr(TLS_twiddle_rsc_0__14__wadr);
    twiddle_rsc_0__14__INST.we(TLS_twiddle_rsc_0__14__we);
    twiddle_rsc_0__14__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_55)));

    twiddle_rsc_0__15__INST.q(TLS_twiddle_rsc_0_15_q);
    twiddle_rsc_0__15__INST.radr(TLS_twiddle_rsc_0_15_radr);
    twiddle_rsc_0__15__INST.clk(clk);
    twiddle_rsc_0__15__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__15__INST.d(TLS_twiddle_rsc_0__15__d);
    twiddle_rsc_0__15__INST.wadr(TLS_twiddle_rsc_0__15__wadr);
    twiddle_rsc_0__15__INST.we(TLS_twiddle_rsc_0__15__we);
    twiddle_rsc_0__15__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_56)));

    twiddle_rsc_0__16__INST.q(TLS_twiddle_rsc_0_16_q);
    twiddle_rsc_0__16__INST.radr(TLS_twiddle_rsc_0_16_radr);
    twiddle_rsc_0__16__INST.clk(clk);
    twiddle_rsc_0__16__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__16__INST.d(TLS_twiddle_rsc_0__16__d);
    twiddle_rsc_0__16__INST.wadr(TLS_twiddle_rsc_0__16__wadr);
    twiddle_rsc_0__16__INST.we(TLS_twiddle_rsc_0__16__we);
    twiddle_rsc_0__16__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_57)));

    twiddle_rsc_0__17__INST.q(TLS_twiddle_rsc_0_17_q);
    twiddle_rsc_0__17__INST.radr(TLS_twiddle_rsc_0_17_radr);
    twiddle_rsc_0__17__INST.clk(clk);
    twiddle_rsc_0__17__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__17__INST.d(TLS_twiddle_rsc_0__17__d);
    twiddle_rsc_0__17__INST.wadr(TLS_twiddle_rsc_0__17__wadr);
    twiddle_rsc_0__17__INST.we(TLS_twiddle_rsc_0__17__we);
    twiddle_rsc_0__17__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_58)));

    twiddle_rsc_0__18__INST.q(TLS_twiddle_rsc_0_18_q);
    twiddle_rsc_0__18__INST.radr(TLS_twiddle_rsc_0_18_radr);
    twiddle_rsc_0__18__INST.clk(clk);
    twiddle_rsc_0__18__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__18__INST.d(TLS_twiddle_rsc_0__18__d);
    twiddle_rsc_0__18__INST.wadr(TLS_twiddle_rsc_0__18__wadr);
    twiddle_rsc_0__18__INST.we(TLS_twiddle_rsc_0__18__we);
    twiddle_rsc_0__18__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_59)));

    twiddle_rsc_0__19__INST.q(TLS_twiddle_rsc_0_19_q);
    twiddle_rsc_0__19__INST.radr(TLS_twiddle_rsc_0_19_radr);
    twiddle_rsc_0__19__INST.clk(clk);
    twiddle_rsc_0__19__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__19__INST.d(TLS_twiddle_rsc_0__19__d);
    twiddle_rsc_0__19__INST.wadr(TLS_twiddle_rsc_0__19__wadr);
    twiddle_rsc_0__19__INST.we(TLS_twiddle_rsc_0__19__we);
    twiddle_rsc_0__19__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_60)));

    twiddle_rsc_0__20__INST.q(TLS_twiddle_rsc_0_20_q);
    twiddle_rsc_0__20__INST.radr(TLS_twiddle_rsc_0_20_radr);
    twiddle_rsc_0__20__INST.clk(clk);
    twiddle_rsc_0__20__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__20__INST.d(TLS_twiddle_rsc_0__20__d);
    twiddle_rsc_0__20__INST.wadr(TLS_twiddle_rsc_0__20__wadr);
    twiddle_rsc_0__20__INST.we(TLS_twiddle_rsc_0__20__we);
    twiddle_rsc_0__20__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_61)));

    twiddle_rsc_0__21__INST.q(TLS_twiddle_rsc_0_21_q);
    twiddle_rsc_0__21__INST.radr(TLS_twiddle_rsc_0_21_radr);
    twiddle_rsc_0__21__INST.clk(clk);
    twiddle_rsc_0__21__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__21__INST.d(TLS_twiddle_rsc_0__21__d);
    twiddle_rsc_0__21__INST.wadr(TLS_twiddle_rsc_0__21__wadr);
    twiddle_rsc_0__21__INST.we(TLS_twiddle_rsc_0__21__we);
    twiddle_rsc_0__21__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_62)));

    twiddle_rsc_0__22__INST.q(TLS_twiddle_rsc_0_22_q);
    twiddle_rsc_0__22__INST.radr(TLS_twiddle_rsc_0_22_radr);
    twiddle_rsc_0__22__INST.clk(clk);
    twiddle_rsc_0__22__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__22__INST.d(TLS_twiddle_rsc_0__22__d);
    twiddle_rsc_0__22__INST.wadr(TLS_twiddle_rsc_0__22__wadr);
    twiddle_rsc_0__22__INST.we(TLS_twiddle_rsc_0__22__we);
    twiddle_rsc_0__22__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_63)));

    twiddle_rsc_0__23__INST.q(TLS_twiddle_rsc_0_23_q);
    twiddle_rsc_0__23__INST.radr(TLS_twiddle_rsc_0_23_radr);
    twiddle_rsc_0__23__INST.clk(clk);
    twiddle_rsc_0__23__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__23__INST.d(TLS_twiddle_rsc_0__23__d);
    twiddle_rsc_0__23__INST.wadr(TLS_twiddle_rsc_0__23__wadr);
    twiddle_rsc_0__23__INST.we(TLS_twiddle_rsc_0__23__we);
    twiddle_rsc_0__23__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_64)));

    twiddle_rsc_0__24__INST.q(TLS_twiddle_rsc_0_24_q);
    twiddle_rsc_0__24__INST.radr(TLS_twiddle_rsc_0_24_radr);
    twiddle_rsc_0__24__INST.clk(clk);
    twiddle_rsc_0__24__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__24__INST.d(TLS_twiddle_rsc_0__24__d);
    twiddle_rsc_0__24__INST.wadr(TLS_twiddle_rsc_0__24__wadr);
    twiddle_rsc_0__24__INST.we(TLS_twiddle_rsc_0__24__we);
    twiddle_rsc_0__24__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_65)));

    twiddle_rsc_0__25__INST.q(TLS_twiddle_rsc_0_25_q);
    twiddle_rsc_0__25__INST.radr(TLS_twiddle_rsc_0_25_radr);
    twiddle_rsc_0__25__INST.clk(clk);
    twiddle_rsc_0__25__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__25__INST.d(TLS_twiddle_rsc_0__25__d);
    twiddle_rsc_0__25__INST.wadr(TLS_twiddle_rsc_0__25__wadr);
    twiddle_rsc_0__25__INST.we(TLS_twiddle_rsc_0__25__we);
    twiddle_rsc_0__25__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_66)));

    twiddle_rsc_0__26__INST.q(TLS_twiddle_rsc_0_26_q);
    twiddle_rsc_0__26__INST.radr(TLS_twiddle_rsc_0_26_radr);
    twiddle_rsc_0__26__INST.clk(clk);
    twiddle_rsc_0__26__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__26__INST.d(TLS_twiddle_rsc_0__26__d);
    twiddle_rsc_0__26__INST.wadr(TLS_twiddle_rsc_0__26__wadr);
    twiddle_rsc_0__26__INST.we(TLS_twiddle_rsc_0__26__we);
    twiddle_rsc_0__26__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_67)));

    twiddle_rsc_0__27__INST.q(TLS_twiddle_rsc_0_27_q);
    twiddle_rsc_0__27__INST.radr(TLS_twiddle_rsc_0_27_radr);
    twiddle_rsc_0__27__INST.clk(clk);
    twiddle_rsc_0__27__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__27__INST.d(TLS_twiddle_rsc_0__27__d);
    twiddle_rsc_0__27__INST.wadr(TLS_twiddle_rsc_0__27__wadr);
    twiddle_rsc_0__27__INST.we(TLS_twiddle_rsc_0__27__we);
    twiddle_rsc_0__27__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_68)));

    twiddle_rsc_0__28__INST.q(TLS_twiddle_rsc_0_28_q);
    twiddle_rsc_0__28__INST.radr(TLS_twiddle_rsc_0_28_radr);
    twiddle_rsc_0__28__INST.clk(clk);
    twiddle_rsc_0__28__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__28__INST.d(TLS_twiddle_rsc_0__28__d);
    twiddle_rsc_0__28__INST.wadr(TLS_twiddle_rsc_0__28__wadr);
    twiddle_rsc_0__28__INST.we(TLS_twiddle_rsc_0__28__we);
    twiddle_rsc_0__28__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_69)));

    twiddle_rsc_0__29__INST.q(TLS_twiddle_rsc_0_29_q);
    twiddle_rsc_0__29__INST.radr(TLS_twiddle_rsc_0_29_radr);
    twiddle_rsc_0__29__INST.clk(clk);
    twiddle_rsc_0__29__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__29__INST.d(TLS_twiddle_rsc_0__29__d);
    twiddle_rsc_0__29__INST.wadr(TLS_twiddle_rsc_0__29__wadr);
    twiddle_rsc_0__29__INST.we(TLS_twiddle_rsc_0__29__we);
    twiddle_rsc_0__29__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_70)));

    twiddle_rsc_0__30__INST.q(TLS_twiddle_rsc_0_30_q);
    twiddle_rsc_0__30__INST.radr(TLS_twiddle_rsc_0_30_radr);
    twiddle_rsc_0__30__INST.clk(clk);
    twiddle_rsc_0__30__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__30__INST.d(TLS_twiddle_rsc_0__30__d);
    twiddle_rsc_0__30__INST.wadr(TLS_twiddle_rsc_0__30__wadr);
    twiddle_rsc_0__30__INST.we(TLS_twiddle_rsc_0__30__we);
    twiddle_rsc_0__30__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_71)));

    twiddle_rsc_0__31__INST.q(TLS_twiddle_rsc_0_31_q);
    twiddle_rsc_0__31__INST.radr(TLS_twiddle_rsc_0_31_radr);
    twiddle_rsc_0__31__INST.clk(clk);
    twiddle_rsc_0__31__INST.clken(SIG_SC_LOGIC_1);
    twiddle_rsc_0__31__INST.d(TLS_twiddle_rsc_0__31__d);
    twiddle_rsc_0__31__INST.wadr(TLS_twiddle_rsc_0__31__wadr);
    twiddle_rsc_0__31__INST.we(TLS_twiddle_rsc_0__31__we);
    twiddle_rsc_0__31__INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_72)));

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

    transactor_vec.in_fifo(TLS_in_fifo_vec);
    transactor_vec.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_vec);
    transactor_vec.out_fifo(TLS_out_fifo_vec);
    transactor_vec.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_vec);
    transactor_vec.bind_clk(clk, true, rst);
    transactor_vec.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_vec.register_block(&vec_rsc_0__0__INST, vec_rsc_0__0__INST.basename(), TLS_vec_rsc_triosy_0_0_lz,
        0, 992, 32);
    transactor_vec.register_block(&vec_rsc_0__1__INST, vec_rsc_0__1__INST.basename(), TLS_vec_rsc_triosy_0_1_lz,
        1, 993, 32);
    transactor_vec.register_block(&vec_rsc_0__2__INST, vec_rsc_0__2__INST.basename(), TLS_vec_rsc_triosy_0_2_lz,
        2, 994, 32);
    transactor_vec.register_block(&vec_rsc_0__3__INST, vec_rsc_0__3__INST.basename(), TLS_vec_rsc_triosy_0_3_lz,
        3, 995, 32);
    transactor_vec.register_block(&vec_rsc_0__4__INST, vec_rsc_0__4__INST.basename(), TLS_vec_rsc_triosy_0_4_lz,
        4, 996, 32);
    transactor_vec.register_block(&vec_rsc_0__5__INST, vec_rsc_0__5__INST.basename(), TLS_vec_rsc_triosy_0_5_lz,
        5, 997, 32);
    transactor_vec.register_block(&vec_rsc_0__6__INST, vec_rsc_0__6__INST.basename(), TLS_vec_rsc_triosy_0_6_lz,
        6, 998, 32);
    transactor_vec.register_block(&vec_rsc_0__7__INST, vec_rsc_0__7__INST.basename(), TLS_vec_rsc_triosy_0_7_lz,
        7, 999, 32);
    transactor_vec.register_block(&vec_rsc_0__8__INST, vec_rsc_0__8__INST.basename(), TLS_vec_rsc_triosy_0_8_lz,
        8, 1000, 32);
    transactor_vec.register_block(&vec_rsc_0__9__INST, vec_rsc_0__9__INST.basename(), TLS_vec_rsc_triosy_0_9_lz,
        9, 1001, 32);
    transactor_vec.register_block(&vec_rsc_0__10__INST, vec_rsc_0__10__INST.basename(), TLS_vec_rsc_triosy_0_10_lz,
        10, 1002, 32);
    transactor_vec.register_block(&vec_rsc_0__11__INST, vec_rsc_0__11__INST.basename(), TLS_vec_rsc_triosy_0_11_lz,
        11, 1003, 32);
    transactor_vec.register_block(&vec_rsc_0__12__INST, vec_rsc_0__12__INST.basename(), TLS_vec_rsc_triosy_0_12_lz,
        12, 1004, 32);
    transactor_vec.register_block(&vec_rsc_0__13__INST, vec_rsc_0__13__INST.basename(), TLS_vec_rsc_triosy_0_13_lz,
        13, 1005, 32);
    transactor_vec.register_block(&vec_rsc_0__14__INST, vec_rsc_0__14__INST.basename(), TLS_vec_rsc_triosy_0_14_lz,
        14, 1006, 32);
    transactor_vec.register_block(&vec_rsc_0__15__INST, vec_rsc_0__15__INST.basename(), TLS_vec_rsc_triosy_0_15_lz,
        15, 1007, 32);
    transactor_vec.register_block(&vec_rsc_0__16__INST, vec_rsc_0__16__INST.basename(), TLS_vec_rsc_triosy_0_16_lz,
        16, 1008, 32);
    transactor_vec.register_block(&vec_rsc_0__17__INST, vec_rsc_0__17__INST.basename(), TLS_vec_rsc_triosy_0_17_lz,
        17, 1009, 32);
    transactor_vec.register_block(&vec_rsc_0__18__INST, vec_rsc_0__18__INST.basename(), TLS_vec_rsc_triosy_0_18_lz,
        18, 1010, 32);
    transactor_vec.register_block(&vec_rsc_0__19__INST, vec_rsc_0__19__INST.basename(), TLS_vec_rsc_triosy_0_19_lz,
        19, 1011, 32);
    transactor_vec.register_block(&vec_rsc_0__20__INST, vec_rsc_0__20__INST.basename(), TLS_vec_rsc_triosy_0_20_lz,
        20, 1012, 32);
    transactor_vec.register_block(&vec_rsc_0__21__INST, vec_rsc_0__21__INST.basename(), TLS_vec_rsc_triosy_0_21_lz,
        21, 1013, 32);
    transactor_vec.register_block(&vec_rsc_0__22__INST, vec_rsc_0__22__INST.basename(), TLS_vec_rsc_triosy_0_22_lz,
        22, 1014, 32);
    transactor_vec.register_block(&vec_rsc_0__23__INST, vec_rsc_0__23__INST.basename(), TLS_vec_rsc_triosy_0_23_lz,
        23, 1015, 32);
    transactor_vec.register_block(&vec_rsc_0__24__INST, vec_rsc_0__24__INST.basename(), TLS_vec_rsc_triosy_0_24_lz,
        24, 1016, 32);
    transactor_vec.register_block(&vec_rsc_0__25__INST, vec_rsc_0__25__INST.basename(), TLS_vec_rsc_triosy_0_25_lz,
        25, 1017, 32);
    transactor_vec.register_block(&vec_rsc_0__26__INST, vec_rsc_0__26__INST.basename(), TLS_vec_rsc_triosy_0_26_lz,
        26, 1018, 32);
    transactor_vec.register_block(&vec_rsc_0__27__INST, vec_rsc_0__27__INST.basename(), TLS_vec_rsc_triosy_0_27_lz,
        27, 1019, 32);
    transactor_vec.register_block(&vec_rsc_0__28__INST, vec_rsc_0__28__INST.basename(), TLS_vec_rsc_triosy_0_28_lz,
        28, 1020, 32);
    transactor_vec.register_block(&vec_rsc_0__29__INST, vec_rsc_0__29__INST.basename(), TLS_vec_rsc_triosy_0_29_lz,
        29, 1021, 32);
    transactor_vec.register_block(&vec_rsc_0__30__INST, vec_rsc_0__30__INST.basename(), TLS_vec_rsc_triosy_0_30_lz,
        30, 1022, 32);
    transactor_vec.register_block(&vec_rsc_0__31__INST, vec_rsc_0__31__INST.basename(), TLS_vec_rsc_triosy_0_31_lz,
        31, 1023, 32);

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

    transactor_twiddle.in_fifo(TLS_in_fifo_twiddle);
    transactor_twiddle.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_twiddle);
    transactor_twiddle.bind_clk(clk, true, rst);
    transactor_twiddle.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_twiddle.register_block(&twiddle_rsc_0__0__INST, twiddle_rsc_0__0__INST.basename(), TLS_twiddle_rsc_triosy_0_0_lz,
        0, 992, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__1__INST, twiddle_rsc_0__1__INST.basename(), TLS_twiddle_rsc_triosy_0_1_lz,
        1, 993, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__2__INST, twiddle_rsc_0__2__INST.basename(), TLS_twiddle_rsc_triosy_0_2_lz,
        2, 994, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__3__INST, twiddle_rsc_0__3__INST.basename(), TLS_twiddle_rsc_triosy_0_3_lz,
        3, 995, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__4__INST, twiddle_rsc_0__4__INST.basename(), TLS_twiddle_rsc_triosy_0_4_lz,
        4, 996, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__5__INST, twiddle_rsc_0__5__INST.basename(), TLS_twiddle_rsc_triosy_0_5_lz,
        5, 997, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__6__INST, twiddle_rsc_0__6__INST.basename(), TLS_twiddle_rsc_triosy_0_6_lz,
        6, 998, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__7__INST, twiddle_rsc_0__7__INST.basename(), TLS_twiddle_rsc_triosy_0_7_lz,
        7, 999, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__8__INST, twiddle_rsc_0__8__INST.basename(), TLS_twiddle_rsc_triosy_0_8_lz,
        8, 1000, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__9__INST, twiddle_rsc_0__9__INST.basename(), TLS_twiddle_rsc_triosy_0_9_lz,
        9, 1001, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__10__INST, twiddle_rsc_0__10__INST.basename(), TLS_twiddle_rsc_triosy_0_10_lz,
        10, 1002, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__11__INST, twiddle_rsc_0__11__INST.basename(), TLS_twiddle_rsc_triosy_0_11_lz,
        11, 1003, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__12__INST, twiddle_rsc_0__12__INST.basename(), TLS_twiddle_rsc_triosy_0_12_lz,
        12, 1004, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__13__INST, twiddle_rsc_0__13__INST.basename(), TLS_twiddle_rsc_triosy_0_13_lz,
        13, 1005, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__14__INST, twiddle_rsc_0__14__INST.basename(), TLS_twiddle_rsc_triosy_0_14_lz,
        14, 1006, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__15__INST, twiddle_rsc_0__15__INST.basename(), TLS_twiddle_rsc_triosy_0_15_lz,
        15, 1007, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__16__INST, twiddle_rsc_0__16__INST.basename(), TLS_twiddle_rsc_triosy_0_16_lz,
        16, 1008, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__17__INST, twiddle_rsc_0__17__INST.basename(), TLS_twiddle_rsc_triosy_0_17_lz,
        17, 1009, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__18__INST, twiddle_rsc_0__18__INST.basename(), TLS_twiddle_rsc_triosy_0_18_lz,
        18, 1010, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__19__INST, twiddle_rsc_0__19__INST.basename(), TLS_twiddle_rsc_triosy_0_19_lz,
        19, 1011, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__20__INST, twiddle_rsc_0__20__INST.basename(), TLS_twiddle_rsc_triosy_0_20_lz,
        20, 1012, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__21__INST, twiddle_rsc_0__21__INST.basename(), TLS_twiddle_rsc_triosy_0_21_lz,
        21, 1013, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__22__INST, twiddle_rsc_0__22__INST.basename(), TLS_twiddle_rsc_triosy_0_22_lz,
        22, 1014, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__23__INST, twiddle_rsc_0__23__INST.basename(), TLS_twiddle_rsc_triosy_0_23_lz,
        23, 1015, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__24__INST, twiddle_rsc_0__24__INST.basename(), TLS_twiddle_rsc_triosy_0_24_lz,
        24, 1016, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__25__INST, twiddle_rsc_0__25__INST.basename(), TLS_twiddle_rsc_triosy_0_25_lz,
        25, 1017, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__26__INST, twiddle_rsc_0__26__INST.basename(), TLS_twiddle_rsc_triosy_0_26_lz,
        26, 1018, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__27__INST, twiddle_rsc_0__27__INST.basename(), TLS_twiddle_rsc_triosy_0_27_lz,
        27, 1019, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__28__INST, twiddle_rsc_0__28__INST.basename(), TLS_twiddle_rsc_triosy_0_28_lz,
        28, 1020, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__29__INST, twiddle_rsc_0__29__INST.basename(), TLS_twiddle_rsc_triosy_0_29_lz,
        29, 1021, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__30__INST, twiddle_rsc_0__30__INST.basename(), TLS_twiddle_rsc_triosy_0_30_lz,
        30, 1022, 32);
    transactor_twiddle.register_block(&twiddle_rsc_0__31__INST, twiddle_rsc_0__31__INST.basename(), TLS_twiddle_rsc_triosy_0_31_lz,
        31, 1023, 32);

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
