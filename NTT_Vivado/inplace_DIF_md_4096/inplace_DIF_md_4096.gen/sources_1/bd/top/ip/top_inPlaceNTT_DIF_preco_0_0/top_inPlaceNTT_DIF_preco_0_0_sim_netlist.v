// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Sep 16 00:49:23 2021
// Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/NTT_Xilinx/NTT_Vivado/inplace_DIF_md_4096/inplace_DIF_md_4096.gen/sources_1/bd/top/ip/top_inPlaceNTT_DIF_preco_0_0/top_inPlaceNTT_DIF_preco_0_0_sim_netlist.v
// Design      : top_inPlaceNTT_DIF_preco_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_inPlaceNTT_DIF_preco_0_0,inPlaceNTT_DIF_precomp,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "inPlaceNTT_DIF_precomp,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module top_inPlaceNTT_DIF_preco_0_0
   (clk,
    rst,
    run_rsc_rdy,
    run_rsc_vld,
    vec_rsc_adra,
    vec_rsc_da,
    vec_rsc_wea,
    vec_rsc_qa,
    vec_rsc_adrb,
    vec_rsc_db,
    vec_rsc_web,
    vec_rsc_qb,
    vec_rsc_triosy_lz,
    p_rsc_dat,
    p_rsc_triosy_lz,
    r_rsc_dat,
    r_rsc_triosy_lz,
    twiddle_rsc_adra,
    twiddle_rsc_da,
    twiddle_rsc_wea,
    twiddle_rsc_qa,
    twiddle_rsc_adrb,
    twiddle_rsc_db,
    twiddle_rsc_web,
    twiddle_rsc_qb,
    twiddle_rsc_triosy_lz,
    twiddle_h_rsc_adra,
    twiddle_h_rsc_da,
    twiddle_h_rsc_wea,
    twiddle_h_rsc_qa,
    twiddle_h_rsc_adrb,
    twiddle_h_rsc_db,
    twiddle_h_rsc_web,
    twiddle_h_rsc_qb,
    twiddle_h_rsc_triosy_lz,
    complete_rsc_rdy,
    complete_rsc_vld);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [11:0]vec_rsc_adra;
  output [31:0]vec_rsc_da;
  output vec_rsc_wea;
  input [31:0]vec_rsc_qa;
  output [11:0]vec_rsc_adrb;
  output [31:0]vec_rsc_db;
  output vec_rsc_web;
  input [31:0]vec_rsc_qb;
  output vec_rsc_triosy_lz;
  input [31:0]p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0]r_rsc_dat;
  output r_rsc_triosy_lz;
  output [11:0]twiddle_rsc_adra;
  output [31:0]twiddle_rsc_da;
  output twiddle_rsc_wea;
  input [31:0]twiddle_rsc_qa;
  output [11:0]twiddle_rsc_adrb;
  output [31:0]twiddle_rsc_db;
  output twiddle_rsc_web;
  input [31:0]twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [11:0]twiddle_h_rsc_adra;
  output [31:0]twiddle_h_rsc_da;
  output twiddle_h_rsc_wea;
  input [31:0]twiddle_h_rsc_qa;
  output [11:0]twiddle_h_rsc_adrb;
  output [31:0]twiddle_h_rsc_db;
  output twiddle_h_rsc_web;
  input [31:0]twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;

  wire \<const0> ;
  wire clk;
  wire complete_rsc_rdy;
  wire complete_rsc_vld;
  wire inst_n_80;
  wire inst_n_81;
  wire inst_n_82;
  wire inst_n_83;
  wire inst_n_84;
  wire inst_n_85;
  wire inst_n_86;
  wire inst_n_87;
  wire inst_n_88;
  wire inst_n_89;
  wire [31:0]p_rsc_dat;
  wire rst;
  wire run_rsc_rdy;
  wire run_rsc_vld;
  wire [11:0]twiddle_h_rsc_adra;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_4_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_7_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_8_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_9_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_12_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_15_n_0 ;
  wire [11:0]\^twiddle_h_rsc_adrb ;
  wire [31:0]twiddle_h_rsc_qa;
  wire [31:0]twiddle_h_rsc_qb;
  wire [31:0]twiddle_rsc_qa;
  wire [31:0]twiddle_rsc_qb;
  wire [11:0]vec_rsc_adra;
  wire [11:0]vec_rsc_adrb;
  wire [31:0]vec_rsc_da;
  wire [31:0]vec_rsc_qa;
  wire [31:0]vec_rsc_qb;
  wire vec_rsc_triosy_lz;
  wire vec_rsc_wea;

  assign p_rsc_triosy_lz = vec_rsc_triosy_lz;
  assign r_rsc_triosy_lz = vec_rsc_triosy_lz;
  assign twiddle_h_rsc_adrb[11:2] = \^twiddle_h_rsc_adrb [11:2];
  assign twiddle_h_rsc_adrb[1] = \^twiddle_h_rsc_adrb [0];
  assign twiddle_h_rsc_adrb[0] = \^twiddle_h_rsc_adrb [0];
  assign twiddle_h_rsc_da[31] = \<const0> ;
  assign twiddle_h_rsc_da[30] = \<const0> ;
  assign twiddle_h_rsc_da[29] = \<const0> ;
  assign twiddle_h_rsc_da[28] = \<const0> ;
  assign twiddle_h_rsc_da[27] = \<const0> ;
  assign twiddle_h_rsc_da[26] = \<const0> ;
  assign twiddle_h_rsc_da[25] = \<const0> ;
  assign twiddle_h_rsc_da[24] = \<const0> ;
  assign twiddle_h_rsc_da[23] = \<const0> ;
  assign twiddle_h_rsc_da[22] = \<const0> ;
  assign twiddle_h_rsc_da[21] = \<const0> ;
  assign twiddle_h_rsc_da[20] = \<const0> ;
  assign twiddle_h_rsc_da[19] = \<const0> ;
  assign twiddle_h_rsc_da[18] = \<const0> ;
  assign twiddle_h_rsc_da[17] = \<const0> ;
  assign twiddle_h_rsc_da[16] = \<const0> ;
  assign twiddle_h_rsc_da[15] = \<const0> ;
  assign twiddle_h_rsc_da[14] = \<const0> ;
  assign twiddle_h_rsc_da[13] = \<const0> ;
  assign twiddle_h_rsc_da[12] = \<const0> ;
  assign twiddle_h_rsc_da[11] = \<const0> ;
  assign twiddle_h_rsc_da[10] = \<const0> ;
  assign twiddle_h_rsc_da[9] = \<const0> ;
  assign twiddle_h_rsc_da[8] = \<const0> ;
  assign twiddle_h_rsc_da[7] = \<const0> ;
  assign twiddle_h_rsc_da[6] = \<const0> ;
  assign twiddle_h_rsc_da[5] = \<const0> ;
  assign twiddle_h_rsc_da[4] = \<const0> ;
  assign twiddle_h_rsc_da[3] = \<const0> ;
  assign twiddle_h_rsc_da[2] = \<const0> ;
  assign twiddle_h_rsc_da[1] = \<const0> ;
  assign twiddle_h_rsc_da[0] = \<const0> ;
  assign twiddle_h_rsc_db[31] = \<const0> ;
  assign twiddle_h_rsc_db[30] = \<const0> ;
  assign twiddle_h_rsc_db[29] = \<const0> ;
  assign twiddle_h_rsc_db[28] = \<const0> ;
  assign twiddle_h_rsc_db[27] = \<const0> ;
  assign twiddle_h_rsc_db[26] = \<const0> ;
  assign twiddle_h_rsc_db[25] = \<const0> ;
  assign twiddle_h_rsc_db[24] = \<const0> ;
  assign twiddle_h_rsc_db[23] = \<const0> ;
  assign twiddle_h_rsc_db[22] = \<const0> ;
  assign twiddle_h_rsc_db[21] = \<const0> ;
  assign twiddle_h_rsc_db[20] = \<const0> ;
  assign twiddle_h_rsc_db[19] = \<const0> ;
  assign twiddle_h_rsc_db[18] = \<const0> ;
  assign twiddle_h_rsc_db[17] = \<const0> ;
  assign twiddle_h_rsc_db[16] = \<const0> ;
  assign twiddle_h_rsc_db[15] = \<const0> ;
  assign twiddle_h_rsc_db[14] = \<const0> ;
  assign twiddle_h_rsc_db[13] = \<const0> ;
  assign twiddle_h_rsc_db[12] = \<const0> ;
  assign twiddle_h_rsc_db[11] = \<const0> ;
  assign twiddle_h_rsc_db[10] = \<const0> ;
  assign twiddle_h_rsc_db[9] = \<const0> ;
  assign twiddle_h_rsc_db[8] = \<const0> ;
  assign twiddle_h_rsc_db[7] = \<const0> ;
  assign twiddle_h_rsc_db[6] = \<const0> ;
  assign twiddle_h_rsc_db[5] = \<const0> ;
  assign twiddle_h_rsc_db[4] = \<const0> ;
  assign twiddle_h_rsc_db[3] = \<const0> ;
  assign twiddle_h_rsc_db[2] = \<const0> ;
  assign twiddle_h_rsc_db[1] = \<const0> ;
  assign twiddle_h_rsc_db[0] = \<const0> ;
  assign twiddle_h_rsc_triosy_lz = vec_rsc_triosy_lz;
  assign twiddle_h_rsc_wea = \<const0> ;
  assign twiddle_h_rsc_web = \<const0> ;
  assign twiddle_rsc_adra[11:0] = twiddle_h_rsc_adra;
  assign twiddle_rsc_adrb[11:2] = \^twiddle_h_rsc_adrb [11:2];
  assign twiddle_rsc_adrb[1] = \^twiddle_h_rsc_adrb [0];
  assign twiddle_rsc_adrb[0] = \^twiddle_h_rsc_adrb [0];
  assign twiddle_rsc_da[31] = \<const0> ;
  assign twiddle_rsc_da[30] = \<const0> ;
  assign twiddle_rsc_da[29] = \<const0> ;
  assign twiddle_rsc_da[28] = \<const0> ;
  assign twiddle_rsc_da[27] = \<const0> ;
  assign twiddle_rsc_da[26] = \<const0> ;
  assign twiddle_rsc_da[25] = \<const0> ;
  assign twiddle_rsc_da[24] = \<const0> ;
  assign twiddle_rsc_da[23] = \<const0> ;
  assign twiddle_rsc_da[22] = \<const0> ;
  assign twiddle_rsc_da[21] = \<const0> ;
  assign twiddle_rsc_da[20] = \<const0> ;
  assign twiddle_rsc_da[19] = \<const0> ;
  assign twiddle_rsc_da[18] = \<const0> ;
  assign twiddle_rsc_da[17] = \<const0> ;
  assign twiddle_rsc_da[16] = \<const0> ;
  assign twiddle_rsc_da[15] = \<const0> ;
  assign twiddle_rsc_da[14] = \<const0> ;
  assign twiddle_rsc_da[13] = \<const0> ;
  assign twiddle_rsc_da[12] = \<const0> ;
  assign twiddle_rsc_da[11] = \<const0> ;
  assign twiddle_rsc_da[10] = \<const0> ;
  assign twiddle_rsc_da[9] = \<const0> ;
  assign twiddle_rsc_da[8] = \<const0> ;
  assign twiddle_rsc_da[7] = \<const0> ;
  assign twiddle_rsc_da[6] = \<const0> ;
  assign twiddle_rsc_da[5] = \<const0> ;
  assign twiddle_rsc_da[4] = \<const0> ;
  assign twiddle_rsc_da[3] = \<const0> ;
  assign twiddle_rsc_da[2] = \<const0> ;
  assign twiddle_rsc_da[1] = \<const0> ;
  assign twiddle_rsc_da[0] = \<const0> ;
  assign twiddle_rsc_db[31] = \<const0> ;
  assign twiddle_rsc_db[30] = \<const0> ;
  assign twiddle_rsc_db[29] = \<const0> ;
  assign twiddle_rsc_db[28] = \<const0> ;
  assign twiddle_rsc_db[27] = \<const0> ;
  assign twiddle_rsc_db[26] = \<const0> ;
  assign twiddle_rsc_db[25] = \<const0> ;
  assign twiddle_rsc_db[24] = \<const0> ;
  assign twiddle_rsc_db[23] = \<const0> ;
  assign twiddle_rsc_db[22] = \<const0> ;
  assign twiddle_rsc_db[21] = \<const0> ;
  assign twiddle_rsc_db[20] = \<const0> ;
  assign twiddle_rsc_db[19] = \<const0> ;
  assign twiddle_rsc_db[18] = \<const0> ;
  assign twiddle_rsc_db[17] = \<const0> ;
  assign twiddle_rsc_db[16] = \<const0> ;
  assign twiddle_rsc_db[15] = \<const0> ;
  assign twiddle_rsc_db[14] = \<const0> ;
  assign twiddle_rsc_db[13] = \<const0> ;
  assign twiddle_rsc_db[12] = \<const0> ;
  assign twiddle_rsc_db[11] = \<const0> ;
  assign twiddle_rsc_db[10] = \<const0> ;
  assign twiddle_rsc_db[9] = \<const0> ;
  assign twiddle_rsc_db[8] = \<const0> ;
  assign twiddle_rsc_db[7] = \<const0> ;
  assign twiddle_rsc_db[6] = \<const0> ;
  assign twiddle_rsc_db[5] = \<const0> ;
  assign twiddle_rsc_db[4] = \<const0> ;
  assign twiddle_rsc_db[3] = \<const0> ;
  assign twiddle_rsc_db[2] = \<const0> ;
  assign twiddle_rsc_db[1] = \<const0> ;
  assign twiddle_rsc_db[0] = \<const0> ;
  assign twiddle_rsc_triosy_lz = vec_rsc_triosy_lz;
  assign twiddle_rsc_wea = \<const0> ;
  assign twiddle_rsc_web = \<const0> ;
  assign vec_rsc_db[31] = \<const0> ;
  assign vec_rsc_db[30] = \<const0> ;
  assign vec_rsc_db[29] = \<const0> ;
  assign vec_rsc_db[28] = \<const0> ;
  assign vec_rsc_db[27] = \<const0> ;
  assign vec_rsc_db[26] = \<const0> ;
  assign vec_rsc_db[25] = \<const0> ;
  assign vec_rsc_db[24] = \<const0> ;
  assign vec_rsc_db[23] = \<const0> ;
  assign vec_rsc_db[22] = \<const0> ;
  assign vec_rsc_db[21] = \<const0> ;
  assign vec_rsc_db[20] = \<const0> ;
  assign vec_rsc_db[19] = \<const0> ;
  assign vec_rsc_db[18] = \<const0> ;
  assign vec_rsc_db[17] = \<const0> ;
  assign vec_rsc_db[16] = \<const0> ;
  assign vec_rsc_db[15] = \<const0> ;
  assign vec_rsc_db[14] = \<const0> ;
  assign vec_rsc_db[13] = \<const0> ;
  assign vec_rsc_db[12] = \<const0> ;
  assign vec_rsc_db[11] = \<const0> ;
  assign vec_rsc_db[10] = \<const0> ;
  assign vec_rsc_db[9] = \<const0> ;
  assign vec_rsc_db[8] = \<const0> ;
  assign vec_rsc_db[7] = \<const0> ;
  assign vec_rsc_db[6] = \<const0> ;
  assign vec_rsc_db[5] = \<const0> ;
  assign vec_rsc_db[4] = \<const0> ;
  assign vec_rsc_db[3] = \<const0> ;
  assign vec_rsc_db[2] = \<const0> ;
  assign vec_rsc_db[1] = \<const0> ;
  assign vec_rsc_db[0] = \<const0> ;
  assign vec_rsc_web = \<const0> ;
  GND GND
       (.G(\<const0> ));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp inst
       (.\COMP_LOOP_k_12_4_sva_7_0_reg[3] (inst_n_89),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[4] ({inst_n_85,inst_n_86,inst_n_87,inst_n_88}),
        .DI({inst_n_80,inst_n_81,inst_n_82}),
        .O({inst_n_83,inst_n_84}),
        .P(\^twiddle_h_rsc_adrb [11:2]),
        .S({\twiddle_h_rsc_adra[10]_INST_0_i_7_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_8_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_9_n_0 }),
        .clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .p_rsc_dat(p_rsc_dat),
        .reg_complete_rsci_oswt_cse_reg(complete_rsc_vld),
        .rst(rst),
        .run_rsc_rdy(run_rsc_rdy),
        .run_rsc_vld(run_rsc_vld),
        .twiddle_h_rsc_adra(twiddle_h_rsc_adra),
        .\twiddle_h_rsc_adra[11]_INST_0_i_5 (\twiddle_h_rsc_adra[11]_INST_0_i_12_n_0 ),
        .\twiddle_h_rsc_adra[11]_INST_0_i_5_0 (\twiddle_h_rsc_adra[11]_INST_0_i_15_n_0 ),
        .\twiddle_h_rsc_adra[7]_INST_0_i_1 (\twiddle_h_rsc_adra[10]_INST_0_i_4_n_0 ),
        .twiddle_h_rsc_adrb(\^twiddle_h_rsc_adrb [0]),
        .twiddle_h_rsc_qa(twiddle_h_rsc_qa),
        .twiddle_h_rsc_qb(twiddle_h_rsc_qb),
        .twiddle_rsc_qa(twiddle_rsc_qa),
        .twiddle_rsc_qb(twiddle_rsc_qb),
        .vec_rsc_adra(vec_rsc_adra),
        .vec_rsc_adrb(vec_rsc_adrb),
        .vec_rsc_da(vec_rsc_da),
        .vec_rsc_qa(vec_rsc_qa),
        .vec_rsc_qb(vec_rsc_qb),
        .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
        .vec_rsc_wea(vec_rsc_wea));
  LUT2 #(
    .INIT(4'h6)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_4 
       (.I0(inst_n_84),
        .I1(inst_n_85),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_7 
       (.I0(inst_n_80),
        .I1(inst_n_86),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_8 
       (.I0(inst_n_81),
        .I1(inst_n_87),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_9 
       (.I0(inst_n_82),
        .I1(inst_n_88),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_12 
       (.I0(inst_n_83),
        .I1(inst_n_89),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_15 
       (.I0(inst_n_84),
        .I1(inst_n_85),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_15_n_0 ));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp
   (reg_complete_rsci_oswt_cse_reg,
    P,
    vec_rsc_da,
    vec_rsc_adra,
    twiddle_h_rsc_adra,
    vec_rsc_adrb,
    run_rsc_rdy,
    DI,
    O,
    \COMP_LOOP_k_12_4_sva_7_0_reg[4] ,
    \COMP_LOOP_k_12_4_sva_7_0_reg[3] ,
    twiddle_h_rsc_adrb,
    vec_rsc_triosy_lz,
    vec_rsc_wea,
    rst,
    clk,
    run_rsc_vld,
    complete_rsc_rdy,
    vec_rsc_qa,
    vec_rsc_qb,
    twiddle_rsc_qb,
    twiddle_h_rsc_qb,
    \twiddle_h_rsc_adra[7]_INST_0_i_1 ,
    S,
    \twiddle_h_rsc_adra[11]_INST_0_i_5 ,
    \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ,
    p_rsc_dat,
    twiddle_h_rsc_qa,
    twiddle_rsc_qa);
  output reg_complete_rsci_oswt_cse_reg;
  output [9:0]P;
  output [31:0]vec_rsc_da;
  output [11:0]vec_rsc_adra;
  output [11:0]twiddle_h_rsc_adra;
  output [11:0]vec_rsc_adrb;
  output run_rsc_rdy;
  output [2:0]DI;
  output [1:0]O;
  output [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[4] ;
  output [0:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3] ;
  output [0:0]twiddle_h_rsc_adrb;
  output vec_rsc_triosy_lz;
  output vec_rsc_wea;
  input rst;
  input clk;
  input run_rsc_vld;
  input complete_rsc_rdy;
  input [31:0]vec_rsc_qa;
  input [31:0]vec_rsc_qb;
  input [31:0]twiddle_rsc_qb;
  input [31:0]twiddle_h_rsc_qb;
  input [0:0]\twiddle_h_rsc_adra[7]_INST_0_i_1 ;
  input [2:0]S;
  input \twiddle_h_rsc_adra[11]_INST_0_i_5 ;
  input \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ;
  input [31:0]p_rsc_dat;
  input [31:0]twiddle_h_rsc_qa;
  input [31:0]twiddle_rsc_qa;

  wire [3:0]COMP_LOOP_1_twiddle_f_acc_cse_sva;
  wire [10:8]COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[4]_i_1_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[5]_i_1_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[6]_i_1_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ;
  wire [0:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3] ;
  wire [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[4] ;
  wire [2:0]DI;
  wire [1:0]O;
  wire [9:0]P;
  wire [2:0]S;
  wire VEC_LOOP_acc_12_psp_sva_10;
  wire VEC_LOOP_acc_12_psp_sva_10_i_1_n_0;
  wire [11:11]acc_12_nl;
  wire clk;
  wire complete_rsc_rdy;
  wire core_wten;
  wire inPlaceNTT_DIF_precomp_core_inst_n_21;
  wire inPlaceNTT_DIF_precomp_core_inst_n_22;
  wire inPlaceNTT_DIF_precomp_core_inst_n_93;
  wire \inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_bcwt ;
  wire \inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_ivld_bfwt ;
  wire [0:0]p_1_in5_in;
  wire [31:0]p_rsc_dat;
  wire reg_complete_rsci_oswt_cse_reg;
  wire reg_run_rsci_oswt_cse;
  wire rst;
  wire run_ac_sync_tmp_dobj_sva;
  wire run_ac_sync_tmp_dobj_sva_i_1_n_0;
  wire run_rsc_rdy;
  wire run_rsc_vld;
  wire run_rsci_ivld_bfwt_i_1_n_0;
  wire [11:0]twiddle_h_rsc_adra;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ;
  wire [0:0]\twiddle_h_rsc_adra[7]_INST_0_i_1 ;
  wire [0:0]twiddle_h_rsc_adrb;
  wire [31:0]twiddle_h_rsc_qa;
  wire [31:0]twiddle_h_rsc_qb;
  wire [31:0]twiddle_rsc_qa;
  wire [31:0]twiddle_rsc_qb;
  wire [11:0]vec_rsc_adra;
  wire [11:0]vec_rsc_adrb;
  wire [31:0]vec_rsc_da;
  wire [31:0]vec_rsc_qa;
  wire [31:0]vec_rsc_qb;
  wire vec_rsc_triosy_lz;
  wire vec_rsc_wea;

  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_2 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[3]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .I3(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .O(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[10]));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[4]_i_1 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[5]_i_1 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[6]_i_1 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_3 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[8]_i_2 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[3]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .I3(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .O(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[8]));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[9]_i_2 
       (.I0(COMP_LOOP_1_twiddle_f_acc_cse_sva[3]),
        .I1(COMP_LOOP_1_twiddle_f_acc_cse_sva[2]),
        .I2(COMP_LOOP_1_twiddle_f_acc_cse_sva[0]),
        .I3(COMP_LOOP_1_twiddle_f_acc_cse_sva[1]),
        .O(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[9]));
  LUT6 #(
    .INIT(64'hE0FFE0E020002020)) 
    VEC_LOOP_acc_12_psp_sva_10_i_1
       (.I0(acc_12_nl),
        .I1(p_1_in5_in),
        .I2(inPlaceNTT_DIF_precomp_core_inst_n_93),
        .I3(complete_rsc_rdy),
        .I4(reg_complete_rsci_oswt_cse_reg),
        .I5(VEC_LOOP_acc_12_psp_sva_10),
        .O(VEC_LOOP_acc_12_psp_sva_10_i_1_n_0));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core inPlaceNTT_DIF_precomp_core_inst
       (.COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1),
        .\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4]_0 (\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[4]_i_1_n_0 ),
        .\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5]_0 (\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[5]_i_1_n_0 ),
        .\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6]_0 (\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[6]_i_1_n_0 ),
        .\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7]_0 (\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[2]_0 (O),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 (\COMP_LOOP_k_12_4_sva_7_0_reg[3] ),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[4]_0 (\COMP_LOOP_k_12_4_sva_7_0_reg[4] ),
        .DI(DI),
        .O(acc_12_nl),
        .P(P),
        .Q(COMP_LOOP_1_twiddle_f_acc_cse_sva),
        .S(S),
        .VEC_LOOP_acc_12_psp_sva_10(VEC_LOOP_acc_12_psp_sva_10),
        .VEC_LOOP_acc_12_psp_sva_10_reg_0(VEC_LOOP_acc_12_psp_sva_10_i_1_n_0),
        .clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .core_wten(core_wten),
        .p_rsc_dat(p_rsc_dat),
        .reg_complete_rsci_oswt_cse_reg_0(reg_complete_rsci_oswt_cse_reg),
        .reg_run_rsci_oswt_cse(reg_run_rsci_oswt_cse),
        .rst(rst),
        .run_ac_sync_tmp_dobj_sva(run_ac_sync_tmp_dobj_sva),
        .run_ac_sync_tmp_dobj_sva_reg_0(run_ac_sync_tmp_dobj_sva_i_1_n_0),
        .run_rsc_rdy(run_rsc_rdy),
        .run_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_bcwt ),
        .run_rsci_ivld_bfwt(\inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_ivld_bfwt ),
        .run_rsci_ivld_bfwt_reg(run_rsci_ivld_bfwt_i_1_n_0),
        .\state_var_reg_rep[1] (inPlaceNTT_DIF_precomp_core_inst_n_21),
        .\state_var_reg_rep[3] (inPlaceNTT_DIF_precomp_core_inst_n_93),
        .\state_var_reg_rep[6] (inPlaceNTT_DIF_precomp_core_inst_n_22),
        .\state_var_reg_rep[7] (p_1_in5_in),
        .twiddle_h_rsc_adra(twiddle_h_rsc_adra),
        .\twiddle_h_rsc_adra[11]_INST_0_i_5 (\twiddle_h_rsc_adra[11]_INST_0_i_5 ),
        .\twiddle_h_rsc_adra[11]_INST_0_i_5_0 (\twiddle_h_rsc_adra[11]_INST_0_i_5_0 ),
        .\twiddle_h_rsc_adra[7]_INST_0_i_1 (\twiddle_h_rsc_adra[7]_INST_0_i_1 ),
        .twiddle_h_rsc_adrb(twiddle_h_rsc_adrb),
        .twiddle_h_rsc_qa(twiddle_h_rsc_qa),
        .twiddle_h_rsc_qb(twiddle_h_rsc_qb),
        .twiddle_rsc_qa(twiddle_rsc_qa),
        .twiddle_rsc_qb(twiddle_rsc_qb),
        .vec_rsc_adra(vec_rsc_adra),
        .vec_rsc_adrb(vec_rsc_adrb),
        .vec_rsc_da(vec_rsc_da),
        .vec_rsc_qa(vec_rsc_qa),
        .vec_rsc_qb(vec_rsc_qb),
        .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
        .vec_rsc_wea(vec_rsc_wea));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    run_ac_sync_tmp_dobj_sva_i_1
       (.I0(\inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_ivld_bfwt ),
        .I1(\inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_bcwt ),
        .I2(run_rsc_vld),
        .I3(inPlaceNTT_DIF_precomp_core_inst_n_21),
        .I4(inPlaceNTT_DIF_precomp_core_inst_n_22),
        .I5(run_ac_sync_tmp_dobj_sva),
        .O(run_ac_sync_tmp_dobj_sva_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    run_rsci_ivld_bfwt_i_1
       (.I0(run_rsc_vld),
        .I1(reg_run_rsci_oswt_cse),
        .I2(core_wten),
        .I3(\inPlaceNTT_DIF_precomp_core_run_rsci_inst/inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst/run_rsci_ivld_bfwt ),
        .O(run_rsci_ivld_bfwt_i_1_n_0));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core
   (run_rsci_bcwt,
    reg_run_rsci_oswt_cse,
    reg_complete_rsci_oswt_cse_reg_0,
    P,
    core_wten,
    run_rsci_ivld_bfwt,
    VEC_LOOP_acc_12_psp_sva_10,
    run_ac_sync_tmp_dobj_sva,
    Q,
    \state_var_reg_rep[1] ,
    \state_var_reg_rep[6] ,
    vec_rsc_da,
    vec_rsc_adra,
    twiddle_h_rsc_adra,
    vec_rsc_adrb,
    O,
    \state_var_reg_rep[7] ,
    \state_var_reg_rep[3] ,
    run_rsc_rdy,
    DI,
    \COMP_LOOP_k_12_4_sva_7_0_reg[2]_0 ,
    \COMP_LOOP_k_12_4_sva_7_0_reg[4]_0 ,
    \COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ,
    twiddle_h_rsc_adrb,
    vec_rsc_triosy_lz,
    vec_rsc_wea,
    rst,
    clk,
    run_rsci_ivld_bfwt_reg,
    VEC_LOOP_acc_12_psp_sva_10_reg_0,
    run_ac_sync_tmp_dobj_sva_reg_0,
    vec_rsc_qa,
    vec_rsc_qb,
    twiddle_rsc_qb,
    twiddle_h_rsc_qb,
    complete_rsc_rdy,
    \twiddle_h_rsc_adra[7]_INST_0_i_1 ,
    S,
    \twiddle_h_rsc_adra[11]_INST_0_i_5 ,
    \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ,
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7]_0 ,
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6]_0 ,
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5]_0 ,
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4]_0 ,
    COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1,
    p_rsc_dat,
    twiddle_h_rsc_qa,
    twiddle_rsc_qa);
  output run_rsci_bcwt;
  output reg_run_rsci_oswt_cse;
  output reg_complete_rsci_oswt_cse_reg_0;
  output [9:0]P;
  output core_wten;
  output run_rsci_ivld_bfwt;
  output VEC_LOOP_acc_12_psp_sva_10;
  output run_ac_sync_tmp_dobj_sva;
  output [3:0]Q;
  output \state_var_reg_rep[1] ;
  output \state_var_reg_rep[6] ;
  output [31:0]vec_rsc_da;
  output [11:0]vec_rsc_adra;
  output [11:0]twiddle_h_rsc_adra;
  output [11:0]vec_rsc_adrb;
  output [0:0]O;
  output [0:0]\state_var_reg_rep[7] ;
  output \state_var_reg_rep[3] ;
  output run_rsc_rdy;
  output [2:0]DI;
  output [1:0]\COMP_LOOP_k_12_4_sva_7_0_reg[2]_0 ;
  output [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[4]_0 ;
  output [0:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ;
  output [0:0]twiddle_h_rsc_adrb;
  output vec_rsc_triosy_lz;
  output vec_rsc_wea;
  input rst;
  input clk;
  input run_rsci_ivld_bfwt_reg;
  input VEC_LOOP_acc_12_psp_sva_10_reg_0;
  input run_ac_sync_tmp_dobj_sva_reg_0;
  input [31:0]vec_rsc_qa;
  input [31:0]vec_rsc_qb;
  input [31:0]twiddle_rsc_qb;
  input [31:0]twiddle_h_rsc_qb;
  input complete_rsc_rdy;
  input [0:0]\twiddle_h_rsc_adra[7]_INST_0_i_1 ;
  input [2:0]S;
  input \twiddle_h_rsc_adra[11]_INST_0_i_5 ;
  input \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ;
  input \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7]_0 ;
  input \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6]_0 ;
  input \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5]_0 ;
  input \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4]_0 ;
  input [2:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  input [31:0]p_rsc_dat;
  input [31:0]twiddle_h_rsc_qa;
  input [31:0]twiddle_rsc_qa;

  wire COMP_LOOP_1_modulo_add_cmp_n_32;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire COMP_LOOP_1_mult_cmp_n_2;
  wire [31:0]COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire COMP_LOOP_1_twiddle_f_acc_cse_sva0;
  wire \COMP_LOOP_1_twiddle_f_acc_cse_sva[1]_i_1_n_0 ;
  wire [3:2]COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
  wire COMP_LOOP_1_twiddle_f_lshift_rg_n_0;
  wire COMP_LOOP_1_twiddle_f_lshift_rg_n_1;
  wire COMP_LOOP_1_twiddle_f_lshift_rg_n_2;
  wire COMP_LOOP_1_twiddle_f_lshift_rg_n_3;
  wire [11:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  wire COMP_LOOP_2_twiddle_f_lshift_ncse_sva0;
  wire [2:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4]_0 ;
  wire \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5]_0 ;
  wire \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6]_0 ;
  wire \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7]_0 ;
  wire [10:0]COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  wire COMP_LOOP_3_twiddle_f_lshift_ncse_sva0;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]_i_1_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]_i_1_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1_n_0 ;
  wire [9:0]COMP_LOOP_5_twiddle_f_lshift_ncse_sva;
  wire COMP_LOOP_5_twiddle_f_lshift_ncse_sva0;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_11_n_0 ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_9_n_0 ;
  wire COMP_LOOP_9_twiddle_f_mul_psp_sva0;
  wire \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg_n_0_[0] ;
  wire COMP_LOOP_k_12_4_sva_7_0;
  wire COMP_LOOP_k_12_4_sva_7_00;
  wire [1:0]\COMP_LOOP_k_12_4_sva_7_0_reg[2]_0 ;
  wire [0:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ;
  wire [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[4]_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[0] ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[2] ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[3] ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[4] ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[5] ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[6] ;
  wire [31:0]COMP_LOOP_twiddle_f_1_sva;
  wire [31:0]COMP_LOOP_twiddle_f_9_sva;
  wire [31:0]COMP_LOOP_twiddle_help_1_sva;
  wire [31:0]COMP_LOOP_twiddle_help_9_sva;
  wire COMP_LOOP_twiddle_help_and_1_cse;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire [2:0]DI;
  wire [11:0]MUX1HOT_v_12_3_2_return;
  wire [11:0]MUX1HOT_v_12_4_2_return;
  wire MUX_s_1_2_2_return;
  wire [2:2]MUX_v_4_2_2_return;
  wire [8:0]MUX_v_9_2_2_return;
  wire [0:0]O;
  wire [9:0]P;
  wire [3:0]Q;
  wire [2:0]S;
  wire STAGE_LOOP_i_3_0_sva;
  wire STAGE_LOOP_i_3_0_sva0;
  wire [3:1]STAGE_LOOP_i_3_0_sva_2;
  wire [3:0]STAGE_LOOP_i_3_0_sva_reg;
  wire \STAGE_LOOP_lshift_psp_sva[0]_i_1_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva[1]_i_1_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva[2]_i_1_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva[3]_i_1_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva[5]_i_1_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva[6]_i_1_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva[7]_i_2_n_0 ;
  wire \STAGE_LOOP_lshift_psp_sva_reg_n_0_[0] ;
  wire STAGE_LOOP_lshift_rg_n_0;
  wire STAGE_LOOP_lshift_rg_n_1;
  wire VEC_LOOP_acc_10_cse_1_sva0;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[0] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[10] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[11] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[2] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[4] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[5] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[6] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[7] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[8] ;
  wire \VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[9] ;
  wire VEC_LOOP_acc_12_psp_sva_10;
  wire VEC_LOOP_acc_12_psp_sva_10_reg_0;
  wire VEC_LOOP_acc_12_psp_sva_9_00;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[0] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[3] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[4] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[5] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[6] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[7] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[8] ;
  wire \VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[9] ;
  wire VEC_LOOP_acc_1_cse_10_sva;
  wire VEC_LOOP_acc_1_cse_10_sva0;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[0] ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[1] ;
  wire [7:0]VEC_LOOP_acc_psp_sva;
  wire VEC_LOOP_acc_psp_sva0;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[0] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[10] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[11] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[1] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[2] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[3] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[4] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[5] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[6] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[7] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[8] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[9] ;
  wire [8:1]acc_10_nl;
  wire [32:32]acc_13_nl;
  wire and_132_rmff;
  wire clk;
  wire complete_rsc_rdy;
  wire core_wten;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_0;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_1;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_10;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_11;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_137;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_138;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_139;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_140;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_141;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_142;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_143;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_144;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_145;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_146;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_147;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_148;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_149;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_150;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_151;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_152;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_153;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_154;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_155;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_156;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_157;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_158;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_159;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_160;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_161;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_162;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_163;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_164;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_165;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_166;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_167;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_168;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_169;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_170;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_171;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_172;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_173;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_174;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_175;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_176;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_177;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_178;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_179;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_180;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_181;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_182;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_183;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_184;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_185;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_186;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_187;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_188;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_189;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_190;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_191;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_192;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_193;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_194;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_195;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_196;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_197;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_198;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_199;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_2;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_200;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_201;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_202;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_203;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_204;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_205;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_206;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_207;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_208;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_209;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_210;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_211;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_212;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_223;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_228;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_231;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_232;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_233;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_234;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_235;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_236;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_237;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_238;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_239;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_240;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_266;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_267;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_268;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_269;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_271;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_272;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_275;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_276;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_277;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_280;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_281;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_284;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_285;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_287;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_288;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_289;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_290;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_291;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_292;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_293;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_294;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_295;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_296;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_297;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_298;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_3;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_36;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_38;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_4;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_5;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_55;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_56;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_57;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_58;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_59;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_6;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_60;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_61;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_62;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_63;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_64;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_65;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_7;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_8;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_80;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_81;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_82;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_83;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_84;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_85;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_86;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_87;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_88;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_89;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_9;
  wire inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_90;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_10;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_11;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_12;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_3;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_4;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_5;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_6;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_7;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_8;
  wire inPlaceNTT_DIF_precomp_core_staller_inst_n_9;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_10;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_11;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_12;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_13;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_14;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_15;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_16;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_17;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_18;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_19;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_2;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_20;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_21;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_22;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_23;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_24;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_25;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_26;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_27;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_28;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_29;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_3;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_30;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_31;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_32;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_33;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_34;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_35;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_36;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_37;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_38;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_39;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_4;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_40;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_41;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_42;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_43;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_44;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_45;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_46;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_47;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_48;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_49;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_5;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_50;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_51;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_52;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_53;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_54;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_55;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_56;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_57;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_58;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_59;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_6;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_60;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_61;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_62;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_63;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_64;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_65;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_7;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_8;
  wire inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_9;
  wire \inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt ;
  wire \inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt_1 ;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_10;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_11;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_12;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_13;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_14;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_15;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_16;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_17;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_18;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_19;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_2;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_20;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_21;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_22;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_23;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_24;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_25;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_26;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_27;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_28;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_29;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_3;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_30;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_31;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_32;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_33;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_34;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_35;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_36;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_37;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_38;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_39;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_4;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_40;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_41;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_42;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_43;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_44;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_45;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_46;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_47;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_48;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_49;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_5;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_50;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_51;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_52;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_53;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_54;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_55;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_56;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_57;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_58;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_59;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_6;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_60;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_61;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_62;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_63;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_64;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_65;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_7;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_8;
  wire inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_9;
  wire \inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt ;
  wire \inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt_1 ;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_35;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_36;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_37;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_38;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_39;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_40;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_41;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_42;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_43;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_44;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_45;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_46;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_47;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_48;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_49;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_50;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_51;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_52;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_53;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_54;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_55;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_56;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_57;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_58;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_59;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_60;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_61;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_62;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_63;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_64;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_65;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_66;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_67;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_68;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_69;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_70;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_71;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_72;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_73;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_74;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_75;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_76;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_77;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_78;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_79;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_80;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_81;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_82;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_83;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_84;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_85;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_86;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_87;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_88;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_89;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_90;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_91;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_92;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_93;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_94;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_95;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_96;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_97;
  wire inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_98;
  wire \inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt ;
  wire \inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt_1 ;
  wire input_05_in;
  wire input_064_in;
  wire input_08_in;
  wire input_1148_in;
  wire input_210_in;
  wire input_2133_in;
  wire input_25_in;
  wire input_3;
  wire [7:0]input_30_in;
  wire input_323_in;
  wire input_4;
  wire input_412_in;
  wire input_421_in;
  wire [7:0]input_5;
  wire input_6;
  wire input_7;
  wire \mult_core_inst/asn_itm_1 ;
  wire \mult_core_inst/main_stage_0_2 ;
  wire \mult_core_inst/p_and_1_cse ;
  wire [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  wire [1:0]nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  wire nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  wire nl_z_out_1_n_82;
  wire nl_z_out_1_n_83;
  wire nl_z_out_1_n_84;
  wire nl_z_out_1_n_85;
  wire nl_z_out_1_n_86;
  wire nl_z_out_1_n_87;
  wire nl_z_out_1_n_88;
  wire nl_z_out_1_n_89;
  wire nl_z_out_1_n_90;
  wire nl_z_out_1_n_91;
  wire nl_z_out_1_n_92;
  wire nl_z_out_1_n_93;
  wire nl_z_out_1_n_94;
  wire nl_z_out_1_n_95;
  wire nl_z_out_2_i_28_n_0;
  wire nl_z_out_2_i_29_n_0;
  wire nl_z_out_2_i_30_n_0;
  wire nl_z_out_2_i_31_n_0;
  wire nl_z_out_2_i_32_n_0;
  wire nl_z_out_2_i_33_n_0;
  wire nl_z_out_2_i_34_n_0;
  wire nl_z_out_2_i_35_n_0;
  wire nl_z_out_2_i_36_n_0;
  wire nl_z_out_2_n_100;
  wire nl_z_out_2_n_101;
  wire nl_z_out_2_n_105;
  wire nl_z_out_2_n_82;
  wire nl_z_out_2_n_83;
  wire nl_z_out_2_n_84;
  wire nl_z_out_2_n_85;
  wire nl_z_out_2_n_86;
  wire nl_z_out_2_n_87;
  wire nl_z_out_2_n_88;
  wire nl_z_out_2_n_89;
  wire nl_z_out_2_n_90;
  wire nl_z_out_2_n_91;
  wire nl_z_out_2_n_92;
  wire nl_z_out_2_n_93;
  wire nl_z_out_2_n_94;
  wire nl_z_out_2_n_95;
  wire nl_z_out_2_n_96;
  wire nl_z_out_2_n_97;
  wire nl_z_out_2_n_98;
  wire nl_z_out_2_n_99;
  wire [11:0]p_0_in2_in;
  wire p_238_in;
  wire [31:0]p_rsc_dat;
  wire [31:0]p_sva;
  wire p_sva0;
  wire [12:0]readslicef_14_13_1_return;
  wire reg_complete_rsci_oswt_cse0;
  wire reg_complete_rsci_oswt_cse_reg_0;
  wire reg_ensig_cgo_1_cse;
  wire reg_ensig_cgo_cse;
  wire reg_run_rsci_oswt_cse;
  wire reg_twiddle_rsci_oswt_1_cse;
  wire reg_twiddle_rsci_oswt_cse;
  wire reg_vec_rsc_triosy_obj_iswt0_cse;
  wire reg_vec_rsc_triosy_obj_iswt0_cse0;
  wire reg_vec_rsci_oswt_1_cse;
  wire reg_vec_rsci_oswt_cse;
  wire rst;
  wire run_ac_sync_tmp_dobj_sva;
  wire run_ac_sync_tmp_dobj_sva_reg_0;
  wire run_rsc_rdy;
  wire run_rsci_bcwt;
  wire run_rsci_ivld_bfwt;
  wire run_rsci_ivld_bfwt_reg;
  wire sel0_in;
  wire \state_var_reg_rep[1] ;
  wire \state_var_reg_rep[3] ;
  wire \state_var_reg_rep[6] ;
  wire [0:0]\state_var_reg_rep[7] ;
  wire [11:0]twiddle_h_rsc_adra;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ;
  wire [0:0]\twiddle_h_rsc_adra[7]_INST_0_i_1 ;
  wire [0:0]twiddle_h_rsc_adrb;
  wire [31:0]twiddle_h_rsc_qa;
  wire [31:0]twiddle_h_rsc_qb;
  wire [31:0]twiddle_rsc_qa;
  wire [31:0]twiddle_rsc_qb;
  wire [11:0]vec_rsc_adra;
  wire \vec_rsc_adra[11]_INST_0_i_25_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_26_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_27_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_28_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_33_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_34_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_35_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_36_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_1 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_2 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_3 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_4 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_5 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_6 ;
  wire \vec_rsc_adra[11]_INST_0_i_8_n_7 ;
  wire \vec_rsc_adra[7]_INST_0_i_16_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_17_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_18_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_19_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_24_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_25_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_26_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_27_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_1 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_2 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_3 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_4 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_5 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_6 ;
  wire \vec_rsc_adra[7]_INST_0_i_5_n_7 ;
  wire [11:0]vec_rsc_adrb;
  wire \vec_rsc_adrb[0]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_2_n_1 ;
  wire \vec_rsc_adrb[0]_INST_0_i_2_n_2 ;
  wire \vec_rsc_adrb[0]_INST_0_i_2_n_3 ;
  wire \vec_rsc_adrb[0]_INST_0_i_2_n_7 ;
  wire \vec_rsc_adrb[0]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_7_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_8_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_9_n_0 ;
  wire [31:0]vec_rsc_da;
  wire [31:0]vec_rsc_qa;
  wire [31:0]vec_rsc_qb;
  wire vec_rsc_triosy_lz;
  wire vec_rsc_wea;
  wire [7:0]z_out_14;
  wire NLW_nl_z_out_1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_out_1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_out_1_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_out_1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_out_1_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_out_1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_nl_z_out_1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_nl_z_out_1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_out_1_CARRYOUT_UNCONNECTED;
  wire [47:24]NLW_nl_z_out_1_P_UNCONNECTED;
  wire [47:0]NLW_nl_z_out_1_PCOUT_UNCONNECTED;
  wire NLW_nl_z_out_2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_out_2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_out_2_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_out_2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_out_2_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_out_2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_nl_z_out_2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_nl_z_out_2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_out_2_CARRYOUT_UNCONNECTED;
  wire [47:24]NLW_nl_z_out_2_P_UNCONNECTED;
  wire [47:0]NLW_nl_z_out_2_PCOUT_UNCONNECTED;
  wire [3:3]\NLW_vec_rsc_adra[11]_INST_0_i_8_CO_UNCONNECTED ;

  top_inPlaceNTT_DIF_preco_0_0_modulo_add COMP_LOOP_1_modulo_add_cmp
       (.CO(COMP_LOOP_1_modulo_add_cmp_n_32),
        .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .Q(p_sva),
        .clk(clk),
        .nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat),
        .out({inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_67,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_68,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_69,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_70,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_71,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_72,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_73,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_74,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_75,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_76,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_77,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_78,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_79,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_80,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_81,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_82,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_83,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_84,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_85,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_86,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_87,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_88,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_89,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_90,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_91,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_92,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_93,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_94,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_95,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_96,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_97,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_98}),
        .return_rsc_z(COMP_LOOP_1_mult_cmp_return_rsc_z),
        .vec_rsc_da(vec_rsc_da),
        .vec_rsc_da_31_sp_1(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_38));
  top_inPlaceNTT_DIF_preco_0_0_mult COMP_LOOP_1_mult_cmp
       (.B({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_149,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_150,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_151,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_152,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_153,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_154,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_155,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_156,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_157,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_158,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_159,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_160,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_161,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_162,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_163,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_164,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_165}),
        .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .COMP_LOOP_1_mult_cmp_ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .O(acc_13_nl),
        .Q(p_sva),
        .S(COMP_LOOP_1_mult_cmp_n_2),
        .asn_itm_1(\mult_core_inst/asn_itm_1 ),
        .asn_itm_1_reg(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_284),
        .clk(clk),
        .main_stage_0_2(\mult_core_inst/main_stage_0_2 ),
        .main_stage_0_2_reg(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_285),
        .nl_z_mul_itm_1__0({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_181,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_182,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_183,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_184,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_185,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_186,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_187,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_188,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_189,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_190,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_191,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_192,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_193,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_194,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_195,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_196,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_197}),
        .out({inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_35,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_36,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_37,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_38,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_39,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_40,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_41,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_42,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_43,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_44,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_45,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_46,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_47,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_48,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_49,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_50,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_51,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_52,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_53,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_54,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_55,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_56,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_57,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_58,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_59,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_60,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_61,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_62,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_63,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_64,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_65,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_66}),
        .p_and_1_cse(\mult_core_inst/p_and_1_cse ),
        .p_rsc_dat(p_rsc_dat),
        .p_sva0(p_sva0),
        .\return_rsci_d_reg[31] (COMP_LOOP_1_mult_cmp_return_rsc_z),
        .rst(rst),
        .vector__2({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_166,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_167,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_168,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_169,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_170,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_171,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_172,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_173,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_174,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_175,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_176,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_177,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_178,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_179,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_180}),
        .z_mul_itm_1_reg({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_198,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_199,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_200,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_201,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_202,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_203,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_204,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_205,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_206,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_207,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_208,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_209,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_210,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_211,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_212}));
  LUT2 #(
    .INIT(4'h6)) 
    \COMP_LOOP_1_twiddle_f_acc_cse_sva[1]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \COMP_LOOP_1_twiddle_f_acc_cse_sva[2]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[2]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[1]),
        .O(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0[2]));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT4 #(
    .INIT(16'hA955)) 
    \COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_2 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0[3]));
  FDRE \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_1_twiddle_f_acc_cse_sva0),
        .D(STAGE_LOOP_i_3_0_sva_reg[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_1_twiddle_f_acc_cse_sva0),
        .D(\COMP_LOOP_1_twiddle_f_acc_cse_sva[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_1_twiddle_f_acc_cse_sva0),
        .D(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_1_twiddle_f_acc_cse_sva0),
        .D(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0[3]),
        .Q(Q[3]),
        .R(1'b0));
  top_inPlaceNTT_DIF_preco_0_0_mgc_shift_l_v5__parameterized3 COMP_LOOP_1_twiddle_f_lshift_rg
       (.\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_266),
        .\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] (Q[1:0]),
        .MUX_v_4_2_2_return(MUX_v_4_2_2_return),
        .Q(STAGE_LOOP_i_3_0_sva_reg[1:0]),
        .\STAGE_LOOP_i_3_0_sva_reg[0] (COMP_LOOP_1_twiddle_f_lshift_rg_n_0),
        .\STAGE_LOOP_i_3_0_sva_reg[0]_0 (COMP_LOOP_1_twiddle_f_lshift_rg_n_1),
        .\STAGE_LOOP_i_3_0_sva_reg[0]_1 (COMP_LOOP_1_twiddle_f_lshift_rg_n_2),
        .\STAGE_LOOP_i_3_0_sva_reg[0]_2 (COMP_LOOP_1_twiddle_f_lshift_rg_n_3));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[0]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[10]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_269));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_269));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[1]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[2]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[3]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4]_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[4]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5]_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[5]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6]_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[6]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7]_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[8]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_269));
  FDRE \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]_i_1_n_0 ),
        .Q(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[9]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_269));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1_n_0 ));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]_i_1_n_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_277),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]),
        .R(1'b0));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]_i_1_n_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1_n_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1_n_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[4]_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[4]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[5]_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[5]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[6]_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[6]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .D(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[7]_0 ),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_275),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[8]),
        .R(1'b0));
  FDRE \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_276),
        .Q(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'h1E)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_11 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT4 #(
    .INIT(16'h57A8)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_9 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[2]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[3]),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_9_n_0 ));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_267),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[0]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_272),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[1]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_271),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[2]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_268),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[3]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(COMP_LOOP_1_twiddle_f_lshift_rg_n_0),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[4]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(COMP_LOOP_1_twiddle_f_lshift_rg_n_2),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[5]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(COMP_LOOP_1_twiddle_f_lshift_rg_n_3),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[6]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .D(COMP_LOOP_1_twiddle_f_lshift_rg_n_1),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_280),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[8]),
        .R(1'b0));
  FDRE \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_281),
        .Q(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[9]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[0]),
        .Q(\COMP_LOOP_9_twiddle_f_mul_psp_sva_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[1]),
        .Q(input_30_in[0]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[2]),
        .Q(input_30_in[1]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[3]),
        .Q(input_30_in[2]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[4]),
        .Q(input_30_in[3]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[5]),
        .Q(input_30_in[4]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[6]),
        .Q(input_30_in[5]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[7]),
        .Q(input_30_in[6]),
        .R(1'b0));
  FDRE \COMP_LOOP_9_twiddle_f_mul_psp_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .D(MUX_v_9_2_2_return[8]),
        .Q(input_30_in[7]),
        .R(1'b0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[0]),
        .Q(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[0] ),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[1]),
        .Q(input_064_in),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[2]),
        .Q(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[2] ),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[3]),
        .Q(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[3] ),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[4]),
        .Q(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[4] ),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[5]),
        .Q(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[5] ),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[6]),
        .Q(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[6] ),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_k_12_4_sva_7_0_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_00),
        .D(z_out_14[7]),
        .Q(input_05_in),
        .R(COMP_LOOP_k_12_4_sva_7_0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_33),
        .Q(COMP_LOOP_twiddle_f_1_sva[0]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_23),
        .Q(COMP_LOOP_twiddle_f_1_sva[10]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_22),
        .Q(COMP_LOOP_twiddle_f_1_sva[11]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_21),
        .Q(COMP_LOOP_twiddle_f_1_sva[12]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[13] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_20),
        .Q(COMP_LOOP_twiddle_f_1_sva[13]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[14] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_19),
        .Q(COMP_LOOP_twiddle_f_1_sva[14]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[15] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_18),
        .Q(COMP_LOOP_twiddle_f_1_sva[15]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[16] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_17),
        .Q(COMP_LOOP_twiddle_f_1_sva[16]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[17] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_16),
        .Q(COMP_LOOP_twiddle_f_1_sva[17]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[18] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_15),
        .Q(COMP_LOOP_twiddle_f_1_sva[18]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[19] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_14),
        .Q(COMP_LOOP_twiddle_f_1_sva[19]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_32),
        .Q(COMP_LOOP_twiddle_f_1_sva[1]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[20] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_13),
        .Q(COMP_LOOP_twiddle_f_1_sva[20]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[21] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_12),
        .Q(COMP_LOOP_twiddle_f_1_sva[21]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[22] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_11),
        .Q(COMP_LOOP_twiddle_f_1_sva[22]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[23] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_10),
        .Q(COMP_LOOP_twiddle_f_1_sva[23]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[24] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_9),
        .Q(COMP_LOOP_twiddle_f_1_sva[24]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[25] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_8),
        .Q(COMP_LOOP_twiddle_f_1_sva[25]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[26] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_7),
        .Q(COMP_LOOP_twiddle_f_1_sva[26]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[27] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_6),
        .Q(COMP_LOOP_twiddle_f_1_sva[27]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[28] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_5),
        .Q(COMP_LOOP_twiddle_f_1_sva[28]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[29] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_4),
        .Q(COMP_LOOP_twiddle_f_1_sva[29]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_31),
        .Q(COMP_LOOP_twiddle_f_1_sva[2]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[30] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_3),
        .Q(COMP_LOOP_twiddle_f_1_sva[30]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[31] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_2),
        .Q(COMP_LOOP_twiddle_f_1_sva[31]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_30),
        .Q(COMP_LOOP_twiddle_f_1_sva[3]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_29),
        .Q(COMP_LOOP_twiddle_f_1_sva[4]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_28),
        .Q(COMP_LOOP_twiddle_f_1_sva[5]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_27),
        .Q(COMP_LOOP_twiddle_f_1_sva[6]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_26),
        .Q(COMP_LOOP_twiddle_f_1_sva[7]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_25),
        .Q(COMP_LOOP_twiddle_f_1_sva[8]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_1_sva_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_24),
        .Q(COMP_LOOP_twiddle_f_1_sva[9]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_65),
        .Q(COMP_LOOP_twiddle_f_9_sva[0]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_55),
        .Q(COMP_LOOP_twiddle_f_9_sva[10]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_54),
        .Q(COMP_LOOP_twiddle_f_9_sva[11]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_53),
        .Q(COMP_LOOP_twiddle_f_9_sva[12]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[13] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_52),
        .Q(COMP_LOOP_twiddle_f_9_sva[13]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[14] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_51),
        .Q(COMP_LOOP_twiddle_f_9_sva[14]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[15] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_50),
        .Q(COMP_LOOP_twiddle_f_9_sva[15]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[16] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_49),
        .Q(COMP_LOOP_twiddle_f_9_sva[16]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[17] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_48),
        .Q(COMP_LOOP_twiddle_f_9_sva[17]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[18] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_47),
        .Q(COMP_LOOP_twiddle_f_9_sva[18]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[19] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_46),
        .Q(COMP_LOOP_twiddle_f_9_sva[19]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_64),
        .Q(COMP_LOOP_twiddle_f_9_sva[1]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[20] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_45),
        .Q(COMP_LOOP_twiddle_f_9_sva[20]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[21] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_44),
        .Q(COMP_LOOP_twiddle_f_9_sva[21]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[22] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_43),
        .Q(COMP_LOOP_twiddle_f_9_sva[22]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[23] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_42),
        .Q(COMP_LOOP_twiddle_f_9_sva[23]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[24] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_41),
        .Q(COMP_LOOP_twiddle_f_9_sva[24]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[25] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_40),
        .Q(COMP_LOOP_twiddle_f_9_sva[25]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[26] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_39),
        .Q(COMP_LOOP_twiddle_f_9_sva[26]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[27] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_38),
        .Q(COMP_LOOP_twiddle_f_9_sva[27]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[28] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_37),
        .Q(COMP_LOOP_twiddle_f_9_sva[28]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[29] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_36),
        .Q(COMP_LOOP_twiddle_f_9_sva[29]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_63),
        .Q(COMP_LOOP_twiddle_f_9_sva[2]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[30] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_35),
        .Q(COMP_LOOP_twiddle_f_9_sva[30]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[31] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_34),
        .Q(COMP_LOOP_twiddle_f_9_sva[31]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_62),
        .Q(COMP_LOOP_twiddle_f_9_sva[3]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_61),
        .Q(COMP_LOOP_twiddle_f_9_sva[4]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_60),
        .Q(COMP_LOOP_twiddle_f_9_sva[5]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_59),
        .Q(COMP_LOOP_twiddle_f_9_sva[6]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_58),
        .Q(COMP_LOOP_twiddle_f_9_sva[7]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_57),
        .Q(COMP_LOOP_twiddle_f_9_sva[8]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_f_9_sva_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_56),
        .Q(COMP_LOOP_twiddle_f_9_sva[9]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_33),
        .Q(COMP_LOOP_twiddle_help_1_sva[0]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_23),
        .Q(COMP_LOOP_twiddle_help_1_sva[10]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_22),
        .Q(COMP_LOOP_twiddle_help_1_sva[11]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_21),
        .Q(COMP_LOOP_twiddle_help_1_sva[12]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[13] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_20),
        .Q(COMP_LOOP_twiddle_help_1_sva[13]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[14] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_19),
        .Q(COMP_LOOP_twiddle_help_1_sva[14]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[15] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_18),
        .Q(COMP_LOOP_twiddle_help_1_sva[15]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[16] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_17),
        .Q(COMP_LOOP_twiddle_help_1_sva[16]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[17] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_16),
        .Q(COMP_LOOP_twiddle_help_1_sva[17]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[18] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_15),
        .Q(COMP_LOOP_twiddle_help_1_sva[18]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[19] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_14),
        .Q(COMP_LOOP_twiddle_help_1_sva[19]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_32),
        .Q(COMP_LOOP_twiddle_help_1_sva[1]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[20] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_13),
        .Q(COMP_LOOP_twiddle_help_1_sva[20]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[21] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_12),
        .Q(COMP_LOOP_twiddle_help_1_sva[21]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[22] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_11),
        .Q(COMP_LOOP_twiddle_help_1_sva[22]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[23] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_10),
        .Q(COMP_LOOP_twiddle_help_1_sva[23]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[24] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_9),
        .Q(COMP_LOOP_twiddle_help_1_sva[24]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[25] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_8),
        .Q(COMP_LOOP_twiddle_help_1_sva[25]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[26] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_7),
        .Q(COMP_LOOP_twiddle_help_1_sva[26]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[27] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_6),
        .Q(COMP_LOOP_twiddle_help_1_sva[27]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[28] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_5),
        .Q(COMP_LOOP_twiddle_help_1_sva[28]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[29] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_4),
        .Q(COMP_LOOP_twiddle_help_1_sva[29]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_31),
        .Q(COMP_LOOP_twiddle_help_1_sva[2]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[30] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_3),
        .Q(COMP_LOOP_twiddle_help_1_sva[30]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[31] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_2),
        .Q(COMP_LOOP_twiddle_help_1_sva[31]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_30),
        .Q(COMP_LOOP_twiddle_help_1_sva[3]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_29),
        .Q(COMP_LOOP_twiddle_help_1_sva[4]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_28),
        .Q(COMP_LOOP_twiddle_help_1_sva[5]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_27),
        .Q(COMP_LOOP_twiddle_help_1_sva[6]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_26),
        .Q(COMP_LOOP_twiddle_help_1_sva[7]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_25),
        .Q(COMP_LOOP_twiddle_help_1_sva[8]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_1_sva_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_24),
        .Q(COMP_LOOP_twiddle_help_1_sva[9]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_65),
        .Q(COMP_LOOP_twiddle_help_9_sva[0]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_55),
        .Q(COMP_LOOP_twiddle_help_9_sva[10]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_54),
        .Q(COMP_LOOP_twiddle_help_9_sva[11]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_53),
        .Q(COMP_LOOP_twiddle_help_9_sva[12]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[13] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_52),
        .Q(COMP_LOOP_twiddle_help_9_sva[13]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[14] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_51),
        .Q(COMP_LOOP_twiddle_help_9_sva[14]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[15] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_50),
        .Q(COMP_LOOP_twiddle_help_9_sva[15]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[16] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_49),
        .Q(COMP_LOOP_twiddle_help_9_sva[16]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[17] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_48),
        .Q(COMP_LOOP_twiddle_help_9_sva[17]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[18] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_47),
        .Q(COMP_LOOP_twiddle_help_9_sva[18]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[19] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_46),
        .Q(COMP_LOOP_twiddle_help_9_sva[19]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_64),
        .Q(COMP_LOOP_twiddle_help_9_sva[1]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[20] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_45),
        .Q(COMP_LOOP_twiddle_help_9_sva[20]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[21] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_44),
        .Q(COMP_LOOP_twiddle_help_9_sva[21]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[22] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_43),
        .Q(COMP_LOOP_twiddle_help_9_sva[22]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[23] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_42),
        .Q(COMP_LOOP_twiddle_help_9_sva[23]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[24] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_41),
        .Q(COMP_LOOP_twiddle_help_9_sva[24]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[25] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_40),
        .Q(COMP_LOOP_twiddle_help_9_sva[25]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[26] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_39),
        .Q(COMP_LOOP_twiddle_help_9_sva[26]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[27] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_38),
        .Q(COMP_LOOP_twiddle_help_9_sva[27]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[28] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_37),
        .Q(COMP_LOOP_twiddle_help_9_sva[28]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[29] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_36),
        .Q(COMP_LOOP_twiddle_help_9_sva[29]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_63),
        .Q(COMP_LOOP_twiddle_help_9_sva[2]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[30] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_35),
        .Q(COMP_LOOP_twiddle_help_9_sva[30]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[31] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_34),
        .Q(COMP_LOOP_twiddle_help_9_sva[31]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_62),
        .Q(COMP_LOOP_twiddle_help_9_sva[3]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_61),
        .Q(COMP_LOOP_twiddle_help_9_sva[4]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_60),
        .Q(COMP_LOOP_twiddle_help_9_sva[5]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_59),
        .Q(COMP_LOOP_twiddle_help_9_sva[6]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_58),
        .Q(COMP_LOOP_twiddle_help_9_sva[7]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_57),
        .Q(COMP_LOOP_twiddle_help_9_sva[8]),
        .R(1'b0));
  FDRE \COMP_LOOP_twiddle_help_9_sva_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_twiddle_help_and_1_cse),
        .D(inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_56),
        .Q(COMP_LOOP_twiddle_help_9_sva[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \STAGE_LOOP_i_3_0_sva[1]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[0]),
        .O(STAGE_LOOP_i_3_0_sva_2[1]));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \STAGE_LOOP_i_3_0_sva[3]_i_3 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(STAGE_LOOP_i_3_0_sva_2[3]));
  FDRE \STAGE_LOOP_i_3_0_sva_reg[0] 
       (.C(clk),
        .CE(STAGE_LOOP_i_3_0_sva0),
        .D(STAGE_LOOP_lshift_rg_n_1),
        .Q(STAGE_LOOP_i_3_0_sva_reg[0]),
        .R(STAGE_LOOP_i_3_0_sva));
  FDRE \STAGE_LOOP_i_3_0_sva_reg[1] 
       (.C(clk),
        .CE(STAGE_LOOP_i_3_0_sva0),
        .D(STAGE_LOOP_i_3_0_sva_2[1]),
        .Q(STAGE_LOOP_i_3_0_sva_reg[1]),
        .R(STAGE_LOOP_i_3_0_sva));
  FDSE \STAGE_LOOP_i_3_0_sva_reg[2] 
       (.C(clk),
        .CE(STAGE_LOOP_i_3_0_sva0),
        .D(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0[2]),
        .Q(STAGE_LOOP_i_3_0_sva_reg[2]),
        .S(STAGE_LOOP_i_3_0_sva));
  FDSE \STAGE_LOOP_i_3_0_sva_reg[3] 
       (.C(clk),
        .CE(STAGE_LOOP_i_3_0_sva0),
        .D(STAGE_LOOP_i_3_0_sva_2[3]),
        .Q(STAGE_LOOP_i_3_0_sva_reg[3]),
        .S(STAGE_LOOP_i_3_0_sva));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \STAGE_LOOP_lshift_psp_sva[0]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(\STAGE_LOOP_lshift_psp_sva[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \STAGE_LOOP_lshift_psp_sva[1]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(\STAGE_LOOP_lshift_psp_sva[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \STAGE_LOOP_lshift_psp_sva[2]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(\STAGE_LOOP_lshift_psp_sva[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \STAGE_LOOP_lshift_psp_sva[3]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(\STAGE_LOOP_lshift_psp_sva[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \STAGE_LOOP_lshift_psp_sva[5]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[2]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[0]),
        .O(\STAGE_LOOP_lshift_psp_sva[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \STAGE_LOOP_lshift_psp_sva[6]_i_1 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[2]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[1]),
        .O(\STAGE_LOOP_lshift_psp_sva[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \STAGE_LOOP_lshift_psp_sva[7]_i_2 
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[2]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[1]),
        .O(\STAGE_LOOP_lshift_psp_sva[7]_i_2_n_0 ));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[0]_i_1_n_0 ),
        .Q(\STAGE_LOOP_lshift_psp_sva_reg_n_0_[0] ),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[2]_i_1_n_0 ),
        .Q(p_0_in2_in[9]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[3]_i_1_n_0 ),
        .Q(p_0_in2_in[10]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(STAGE_LOOP_lshift_rg_n_0),
        .Q(p_0_in2_in[11]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[1]_i_1_n_0 ),
        .Q(p_0_in2_in[0]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[2]_i_1_n_0 ),
        .Q(p_0_in2_in[1]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[3]_i_1_n_0 ),
        .Q(p_0_in2_in[2]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(STAGE_LOOP_lshift_rg_n_0),
        .Q(p_0_in2_in[3]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[5]_i_1_n_0 ),
        .Q(p_0_in2_in[4]),
        .R(1'b0));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[6]_i_1_n_0 ),
        .Q(p_0_in2_in[5]),
        .R(1'b0));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[7]_i_2_n_0 ),
        .Q(p_0_in2_in[6]),
        .R(1'b0));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[0]_i_1_n_0 ),
        .Q(p_0_in2_in[7]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273));
  FDRE \STAGE_LOOP_lshift_psp_sva_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_k_12_4_sva_7_0),
        .D(\STAGE_LOOP_lshift_psp_sva[1]_i_1_n_0 ),
        .Q(p_0_in2_in[8]),
        .R(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273));
  top_inPlaceNTT_DIF_preco_0_0_mgc_shift_l_v5 STAGE_LOOP_lshift_rg
       (.D(STAGE_LOOP_lshift_rg_n_1),
        .Q(STAGE_LOOP_i_3_0_sva_reg[2:0]),
        .\STAGE_LOOP_i_3_0_sva_reg[2] (STAGE_LOOP_lshift_rg_n_0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[0] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[0]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[10] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[10]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[11] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[11]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[1] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[1]),
        .Q(input_4),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[2] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[2]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[3] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[3]),
        .Q(input_6),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[4] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[4]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[5] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[5]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[6] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[6]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[7] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[7]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[8] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[8]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_10_cse_1_sva_reg[9] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(MUX1HOT_v_12_3_2_return[9]),
        .Q(\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[9] ),
        .R(1'b0));
  FDRE VEC_LOOP_acc_12_psp_sva_10_reg
       (.C(clk),
        .CE(1'b1),
        .D(VEC_LOOP_acc_12_psp_sva_10_reg_0),
        .Q(VEC_LOOP_acc_12_psp_sva_10),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[0] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_240),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[1] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_239),
        .Q(input_25_in),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[2] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_238),
        .Q(input_323_in),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[3] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_237),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[4] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_236),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[5] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_235),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[6] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_234),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[7] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_233),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[8] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_232),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_12_psp_sva_9_0_reg[9] 
       (.C(clk),
        .CE(VEC_LOOP_acc_12_psp_sva_9_00),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_231),
        .Q(\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[9] ),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[0] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_298),
        .Q(\VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[0] ),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[10] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_288),
        .Q(input_5[6]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[11] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_287),
        .Q(input_5[7]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[1] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_297),
        .Q(\VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[1] ),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[2] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_296),
        .Q(input_08_in),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[3] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_295),
        .Q(input_7),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[4] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_294),
        .Q(input_5[0]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[5] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_293),
        .Q(input_5[1]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[6] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_292),
        .Q(input_5[2]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[7] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_291),
        .Q(input_5[3]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[8] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_290),
        .Q(input_5[4]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_1_cse_10_sva_reg[9] 
       (.C(clk),
        .CE(VEC_LOOP_acc_1_cse_10_sva0),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_289),
        .Q(input_5[5]),
        .R(VEC_LOOP_acc_1_cse_10_sva));
  FDRE \VEC_LOOP_acc_psp_sva_reg[0] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[1]),
        .Q(VEC_LOOP_acc_psp_sva[0]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[1] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[2]),
        .Q(VEC_LOOP_acc_psp_sva[1]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[2] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[3]),
        .Q(VEC_LOOP_acc_psp_sva[2]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[3] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[4]),
        .Q(VEC_LOOP_acc_psp_sva[3]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[4] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[5]),
        .Q(VEC_LOOP_acc_psp_sva[4]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[5] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[6]),
        .Q(VEC_LOOP_acc_psp_sva[5]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[6] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[7]),
        .Q(VEC_LOOP_acc_psp_sva[6]),
        .R(1'b0));
  FDRE \VEC_LOOP_acc_psp_sva_reg[7] 
       (.C(clk),
        .CE(VEC_LOOP_acc_psp_sva0),
        .D(acc_10_nl[8]),
        .Q(VEC_LOOP_acc_psp_sva[7]),
        .R(1'b0));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[0] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[0]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[0] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[10] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[10]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[10] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[11] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[11]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[11] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[12] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[12]),
        .Q(sel0_in),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[1] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[1]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[1] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[2] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[2]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[2] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[3] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[3]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[3] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[4] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[4]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[4] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[5] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[5]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[5] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[6] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[6]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[6] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[7] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[7]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[7] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[8] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[8]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[8] ),
        .R(rst));
  FDRE \VEC_LOOP_j_12_0_1_sva_1_reg[9] 
       (.C(clk),
        .CE(VEC_LOOP_acc_10_cse_1_sva0),
        .D(readslicef_14_13_1_return[9]),
        .Q(\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[9] ),
        .R(rst));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_core_fsm inPlaceNTT_DIF_precomp_core_core_fsm_inst
       (.A({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_0,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_1,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_2,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_3,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_4,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_5,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_6,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_7,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_8,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_9,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_10,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_11}),
        .B({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_55,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_56,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_57,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_58,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_59,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_60,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_61,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_62,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_63,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_64,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_65}),
        .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .COMP_LOOP_1_mult_cmp_ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] (MUX_v_4_2_2_return),
        .\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_269),
        .\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_0 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_278),
        .\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_1 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_279),
        .\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_2 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_282),
        .COMP_LOOP_2_twiddle_f_lshift_ncse_sva(COMP_LOOP_2_twiddle_f_lshift_ncse_sva),
        .COMP_LOOP_2_twiddle_f_lshift_ncse_sva0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1),
        .\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] (MUX1HOT_v_12_4_2_return),
        .COMP_LOOP_3_twiddle_f_lshift_ncse_sva(COMP_LOOP_3_twiddle_f_lshift_ncse_sva),
        .COMP_LOOP_3_twiddle_f_lshift_ncse_sva0(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0),
        .\COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[10] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_277),
        .\COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[8] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_275),
        .\COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[9] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_276),
        .COMP_LOOP_5_twiddle_f_lshift_ncse_sva(COMP_LOOP_5_twiddle_f_lshift_ncse_sva),
        .COMP_LOOP_5_twiddle_f_lshift_ncse_sva0(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0] (\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_9_n_0 ),
        .\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0]_0 (\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_11_n_0 ),
        .\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[8] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_280),
        .\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[9] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_281),
        .COMP_LOOP_k_12_4_sva_7_0(COMP_LOOP_k_12_4_sva_7_0),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[2] (\COMP_LOOP_k_12_4_sva_7_0_reg[2]_0 ),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[3] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_145,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_146,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_147,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_148}),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 (\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[4] (\COMP_LOOP_k_12_4_sva_7_0_reg[4]_0 ),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[6] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_137,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_138,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_139,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_140}),
        .\COMP_LOOP_k_12_4_sva_7_0_reg[7] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_80,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_81,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_82,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_83,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_84,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_85,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_86,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_87,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_88,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_89,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_90}),
        .\COMP_LOOP_twiddle_f_1_sva_reg[16] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_181,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_182,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_183,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_184,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_185,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_186,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_187,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_188,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_189,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_190,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_191,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_192,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_193,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_194,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_195,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_196,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_197}),
        .\COMP_LOOP_twiddle_f_1_sva_reg[31] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_198,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_199,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_200,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_201,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_202,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_203,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_204,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_205,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_206,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_207,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_208,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_209,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_210,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_211,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_212}),
        .\COMP_LOOP_twiddle_help_1_sva_reg[16] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_149,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_150,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_151,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_152,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_153,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_154,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_155,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_156,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_157,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_158,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_159,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_160,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_161,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_162,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_163,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_164,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_165}),
        .\COMP_LOOP_twiddle_help_1_sva_reg[31] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_166,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_167,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_168,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_169,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_170,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_171,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_172,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_173,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_174,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_175,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_176,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_177,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_178,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_179,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_180}),
        .D(MUX1HOT_v_12_3_2_return),
        .DI(DI),
        .E(COMP_LOOP_twiddle_help_and_1_cse),
        .\FSM_sequential_state_var_reg[2]_0 (run_ac_sync_tmp_dobj_sva),
        .MUX_s_1_2_2_return(MUX_s_1_2_2_return),
        .O({input_421_in,input_412_in,input_3,\vec_rsc_adrb[0]_INST_0_i_2_n_7 }),
        .P({nl_z_out_2_n_94,nl_z_out_2_n_95,nl_z_out_2_n_96,nl_z_out_2_n_97,nl_z_out_2_n_98,nl_z_out_2_n_99,nl_z_out_2_n_100,nl_z_out_2_n_101,input_1148_in,input_210_in,input_2133_in,nl_z_out_2_n_105}),
        .Q(Q),
        .S({\vec_rsc_adra[7]_INST_0_i_24_n_0 ,\vec_rsc_adra[7]_INST_0_i_25_n_0 ,\vec_rsc_adra[7]_INST_0_i_26_n_0 ,\vec_rsc_adra[7]_INST_0_i_27_n_0 }),
        .SR(STAGE_LOOP_i_3_0_sva),
        .\STAGE_LOOP_i_3_0_sva_reg[0] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_267),
        .\STAGE_LOOP_i_3_0_sva_reg[0]_0 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_268),
        .\STAGE_LOOP_i_3_0_sva_reg[0]_1 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_271),
        .\STAGE_LOOP_i_3_0_sva_reg[0]_2 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_272),
        .\STAGE_LOOP_i_3_0_sva_reg[3] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_273),
        .\STAGE_LOOP_i_3_0_sva_reg[3]_0 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_274),
        .\STAGE_LOOP_lshift_psp_sva_reg[12] (readslicef_14_13_1_return),
        .\STAGE_LOOP_lshift_psp_sva_reg[12]_0 (STAGE_LOOP_i_3_0_sva_reg[3:1]),
        .\STAGE_LOOP_lshift_psp_sva_reg[4] ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_141,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_142,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_143,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_144}),
        .\VEC_LOOP_acc_10_cse_1_sva_reg[11] ({\vec_rsc_adra[11]_INST_0_i_8_n_4 ,\vec_rsc_adra[11]_INST_0_i_8_n_5 ,\vec_rsc_adra[11]_INST_0_i_8_n_6 ,\vec_rsc_adra[11]_INST_0_i_8_n_7 }),
        .\VEC_LOOP_acc_10_cse_1_sva_reg[7] ({\vec_rsc_adra[7]_INST_0_i_5_n_4 ,\vec_rsc_adra[7]_INST_0_i_5_n_5 ,\vec_rsc_adra[7]_INST_0_i_5_n_6 ,\vec_rsc_adra[7]_INST_0_i_5_n_7 }),
        .VEC_LOOP_acc_12_psp_sva_10(VEC_LOOP_acc_12_psp_sva_10),
        .\VEC_LOOP_acc_1_cse_10_sva_reg[10] (O),
        .\VEC_LOOP_j_12_0_1_sva_1_reg[12] (COMP_LOOP_twiddle_help_and_cse),
        .\VEC_LOOP_j_12_0_1_sva_1_reg[3] (\STAGE_LOOP_lshift_psp_sva_reg_n_0_[0] ),
        .acc_10_nl(acc_10_nl),
        .and_132_rmff(and_132_rmff),
        .asn_itm_1(\mult_core_inst/asn_itm_1 ),
        .asn_itm_1_reg(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_284),
        .clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .complete_rsc_rdy_0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .complete_rsc_rdy_1(COMP_LOOP_1_twiddle_f_acc_cse_sva0),
        .complete_rsc_rdy_2(STAGE_LOOP_i_3_0_sva0),
        .main_stage_0_2(\mult_core_inst/main_stage_0_2 ),
        .main_stage_0_2_reg(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_285),
        .nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct),
        .nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff),
        .nl_z_out_1(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]_i_1_n_0 ),
        .nl_z_out_1_0({input_05_in,\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[6] ,\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[5] ,\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[4] ,\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[3] ,\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[2] ,input_064_in,\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[0] }),
        .nl_z_out_1_1(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]_i_1_n_0 ),
        .nl_z_out_2(MUX_v_9_2_2_return),
        .nl_z_out_2_0(nl_z_out_2_i_32_n_0),
        .nl_z_out_2_1(nl_z_out_2_i_36_n_0),
        .nl_z_out_2_2(nl_z_out_2_i_28_n_0),
        .nl_z_out_2_3(nl_z_out_2_i_35_n_0),
        .nl_z_out_2_4(nl_z_out_2_i_34_n_0),
        .nl_z_out_2_5(nl_z_out_2_i_33_n_0),
        .nl_z_out_2_6(nl_z_out_2_i_31_n_0),
        .nl_z_out_2_7(nl_z_out_2_i_30_n_0),
        .nl_z_out_2_8(nl_z_out_2_i_29_n_0),
        .out({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_287,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_288,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_289,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_290,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_291,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_292,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_293,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_294,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_295,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_296,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_297,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_298}),
        .p_0_in2_in(p_0_in2_in),
        .p_238_in(p_238_in),
        .p_and_1_cse(\mult_core_inst/p_and_1_cse ),
        .reg_complete_rsci_oswt_cse0(reg_complete_rsci_oswt_cse0),
        .reg_complete_rsci_oswt_cse_reg(p_sva0),
        .reg_complete_rsci_oswt_cse_reg_0(VEC_LOOP_acc_10_cse_1_sva0),
        .reg_complete_rsci_oswt_cse_reg_1(VEC_LOOP_acc_psp_sva0),
        .reg_complete_rsci_oswt_cse_reg_2(VEC_LOOP_acc_1_cse_10_sva),
        .reg_ensig_cgo_1_cse(reg_ensig_cgo_1_cse),
        .reg_ensig_cgo_cse(reg_ensig_cgo_cse),
        .reg_twiddle_rsci_oswt_cse_reg({sel0_in,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[11] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[10] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[9] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[8] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[7] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[6] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[5] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[4] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[3] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[2] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[1] ,\VEC_LOOP_j_12_0_1_sva_1_reg_n_0_[0] }),
        .reg_vec_rsc_triosy_obj_iswt0_cse0(reg_vec_rsc_triosy_obj_iswt0_cse0),
        .\return_rsci_d_reg[0] (reg_complete_rsci_oswt_cse_reg_0),
        .rst(rst),
        .\state_var_reg_rep[0]_0 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_38),
        .\state_var_reg_rep[1]_0 (\state_var_reg_rep[1] ),
        .\state_var_reg_rep[2]_0 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_223),
        .\state_var_reg_rep[3]_0 (VEC_LOOP_acc_1_cse_10_sva0),
        .\state_var_reg_rep[3]_1 ({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_231,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_232,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_233,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_234,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_235,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_236,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_237,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_238,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_239,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_240}),
        .\state_var_reg_rep[3]_2 (\state_var_reg_rep[3] ),
        .\state_var_reg_rep[4]_0 (COMP_LOOP_9_twiddle_f_mul_psp_sva0),
        .\state_var_reg_rep[4]_1 (VEC_LOOP_acc_12_psp_sva_9_00),
        .\state_var_reg_rep[4]_2 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_228),
        .\state_var_reg_rep[6]_0 (\state_var_reg_rep[6] ),
        .\state_var_reg_rep[6]_1 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_36),
        .\state_var_reg_rep[6]_2 (COMP_LOOP_k_12_4_sva_7_00),
        .\state_var_reg_rep[7]_0 (\state_var_reg_rep[7] ),
        .\state_var_reg_rep[7]_1 (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_266),
        .twiddle_h_rsc_adra(twiddle_h_rsc_adra),
        .\twiddle_h_rsc_adra[11] ({nl_z_out_1_n_94,nl_z_out_1_n_95,P}),
        .\twiddle_h_rsc_adra[11]_INST_0_i_13_0 ({\COMP_LOOP_1_twiddle_f_acc_cse_sva[1]_i_1_n_0 ,STAGE_LOOP_i_3_0_sva_reg[0]}),
        .\twiddle_h_rsc_adra[11]_INST_0_i_5_0 (\twiddle_h_rsc_adra[11]_INST_0_i_5 ),
        .\twiddle_h_rsc_adra[11]_INST_0_i_5_1 (\twiddle_h_rsc_adra[11]_INST_0_i_5_0 ),
        .\twiddle_h_rsc_adra[7]_INST_0_i_1_0 (\twiddle_h_rsc_adra[7]_INST_0_i_1 ),
        .\twiddle_h_rsc_adra[7]_INST_0_i_1_1 (S),
        .twiddle_h_rsc_adrb(twiddle_h_rsc_adrb),
        .vec_rsc_adra(vec_rsc_adra),
        .\vec_rsc_adra[10] ({\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[9] ,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[8] ,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[7] ,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[6] ,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[5] ,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[4] ,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[3] ,input_323_in,input_25_in,\VEC_LOOP_acc_12_psp_sva_9_0_reg_n_0_[0] }),
        .\vec_rsc_adra[11] ({\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[11] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[10] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[9] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[8] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[7] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[6] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[5] ,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[4] ,input_6,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[2] ,input_4,\VEC_LOOP_acc_10_cse_1_sva_reg_n_0_[0] }),
        .\vec_rsc_adra[11]_0 ({input_5,input_7,input_08_in,\VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[1] ,\VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[0] }),
        .\vec_rsc_adra[11]_1 ({input_30_in,\COMP_LOOP_9_twiddle_f_mul_psp_sva_reg_n_0_[0] }),
        .\vec_rsc_adra[11]_2 (VEC_LOOP_acc_psp_sva),
        .\vec_rsc_adra[11]_INST_0_i_8 ({\vec_rsc_adra[11]_INST_0_i_33_n_0 ,\vec_rsc_adra[11]_INST_0_i_34_n_0 ,\vec_rsc_adra[11]_INST_0_i_35_n_0 ,\vec_rsc_adra[11]_INST_0_i_36_n_0 }),
        .vec_rsc_adrb(vec_rsc_adrb),
        .vec_rsc_wea(vec_rsc_wea),
        .vector__2(COMP_LOOP_twiddle_help_1_sva),
        .vector__2_0(COMP_LOOP_twiddle_help_9_sva),
        .z_mul_itm_1_reg(COMP_LOOP_twiddle_f_1_sva),
        .z_mul_itm_1_reg_0(COMP_LOOP_twiddle_f_9_sva),
        .z_out_14(z_out_14));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_run_rsci inPlaceNTT_DIF_precomp_core_run_rsci_inst
       (.clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .reg_run_rsci_oswt_cse(reg_run_rsci_oswt_cse),
        .rst(rst),
        .run_rsci_bcwt(run_rsci_bcwt),
        .run_rsci_bcwt_reg(reg_complete_rsci_oswt_cse_reg_0),
        .run_rsci_bcwt_reg_0(core_wten),
        .run_rsci_ivld_bfwt(run_rsci_ivld_bfwt),
        .run_rsci_ivld_bfwt_reg(run_rsci_ivld_bfwt_reg));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_staller inPlaceNTT_DIF_precomp_core_staller_inst
       (.E(inPlaceNTT_DIF_precomp_core_staller_inst_n_3),
        .clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .core_wten_reg_reg_0(core_wten),
        .core_wten_reg_reg_1(inPlaceNTT_DIF_precomp_core_staller_inst_n_7),
        .core_wten_reg_reg_2(inPlaceNTT_DIF_precomp_core_staller_inst_n_8),
        .core_wten_reg_reg_3(inPlaceNTT_DIF_precomp_core_staller_inst_n_9),
        .core_wten_reg_reg_4(inPlaceNTT_DIF_precomp_core_staller_inst_n_10),
        .core_wten_reg_reg_5(inPlaceNTT_DIF_precomp_core_staller_inst_n_11),
        .core_wten_reg_reg_6(inPlaceNTT_DIF_precomp_core_staller_inst_n_12),
        .reg_run_rsci_oswt_cse(reg_run_rsci_oswt_cse),
        .reg_twiddle_rsci_oswt_1_cse(reg_twiddle_rsci_oswt_1_cse),
        .reg_twiddle_rsci_oswt_1_cse_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_5),
        .reg_twiddle_rsci_oswt_cse(reg_twiddle_rsci_oswt_cse),
        .reg_twiddle_rsci_oswt_cse_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_6),
        .reg_vec_rsc_triosy_obj_iswt0_cse(reg_vec_rsc_triosy_obj_iswt0_cse),
        .reg_vec_rsci_oswt_1_cse(reg_vec_rsci_oswt_1_cse),
        .reg_vec_rsci_oswt_cse(reg_vec_rsci_oswt_cse),
        .reg_vec_rsci_oswt_cse_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_4),
        .rst(rst),
        .run_rsc_rdy(run_rsc_rdy),
        .twiddle_h_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt ),
        .twiddle_h_rsci_bcwt_1(\inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt_1 ),
        .twiddle_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt ),
        .twiddle_rsci_bcwt_1(\inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt_1 ),
        .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
        .vec_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt ),
        .vec_rsci_bcwt_1(\inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt_1 ),
        .vec_rsci_bcwt_reg(reg_complete_rsci_oswt_cse_reg_0));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst
       (.\COMP_LOOP_twiddle_help_1_sva_reg[31] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_228),
        .D({inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_2,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_3,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_4,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_5,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_6,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_7,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_8,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_9,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_10,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_11,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_12,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_13,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_14,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_15,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_16,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_17,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_18,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_19,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_20,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_21,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_22,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_23,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_24,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_25,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_26,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_27,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_28,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_29,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_30,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_31,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_32,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_33}),
        .E(inPlaceNTT_DIF_precomp_core_staller_inst_n_6),
        .clk(clk),
        .rst(rst),
        .twiddle_h_rsc_qa(twiddle_h_rsc_qa),
        .twiddle_h_rsc_qb(twiddle_h_rsc_qb),
        .twiddle_h_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt ),
        .twiddle_h_rsci_bcwt_1(\inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt_1 ),
        .twiddle_h_rsci_bcwt_1_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_8),
        .twiddle_h_rsci_bcwt_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_7),
        .\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31] ({inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_34,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_35,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_36,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_37,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_38,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_39,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_40,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_41,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_42,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_43,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_44,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_45,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_46,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_47,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_48,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_49,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_50,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_51,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_52,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_53,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_54,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_55,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_56,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_57,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_58,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_59,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_60,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_61,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_62,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_63,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_64,inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_n_65}),
        .\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0] (inPlaceNTT_DIF_precomp_core_staller_inst_n_5));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst
       (.\COMP_LOOP_twiddle_f_1_sva_reg[31] (inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_228),
        .D({inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_2,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_3,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_4,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_5,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_6,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_7,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_8,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_9,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_10,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_11,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_12,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_13,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_14,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_15,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_16,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_17,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_18,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_19,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_20,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_21,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_22,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_23,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_24,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_25,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_26,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_27,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_28,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_29,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_30,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_31,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_32,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_33}),
        .E(inPlaceNTT_DIF_precomp_core_staller_inst_n_6),
        .clk(clk),
        .rst(rst),
        .twiddle_rsc_qa(twiddle_rsc_qa),
        .twiddle_rsc_qb(twiddle_rsc_qb),
        .twiddle_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt ),
        .twiddle_rsci_bcwt_1(\inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt_1 ),
        .twiddle_rsci_bcwt_1_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_10),
        .twiddle_rsci_bcwt_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_9),
        .\twiddle_rsci_qa_d_bfwt_31_0_reg[31] ({inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_34,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_35,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_36,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_37,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_38,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_39,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_40,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_41,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_42,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_43,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_44,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_45,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_46,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_47,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_48,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_49,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_50,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_51,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_52,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_53,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_54,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_55,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_56,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_57,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_58,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_59,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_60,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_61,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_62,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_63,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_64,inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_n_65}),
        .\twiddle_rsci_qa_d_bfwt_63_32_reg[31] (inPlaceNTT_DIF_precomp_core_staller_inst_n_5));
  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_vec_rsci_1 inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst
       (.CO(COMP_LOOP_1_modulo_add_cmp_n_32),
        .E(inPlaceNTT_DIF_precomp_core_staller_inst_n_4),
        .O(acc_13_nl),
        .Q(p_sva),
        .S(COMP_LOOP_1_mult_cmp_n_2),
        .clk(clk),
        .nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat),
        .out({inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_35,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_36,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_37,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_38,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_39,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_40,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_41,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_42,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_43,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_44,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_45,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_46,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_47,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_48,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_49,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_50,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_51,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_52,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_53,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_54,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_55,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_56,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_57,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_58,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_59,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_60,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_61,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_62,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_63,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_64,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_65,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_66}),
        .\p_sva_reg[31] ({inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_67,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_68,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_69,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_70,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_71,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_72,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_73,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_74,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_75,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_76,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_77,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_78,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_79,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_80,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_81,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_82,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_83,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_84,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_85,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_86,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_87,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_88,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_89,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_90,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_91,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_92,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_93,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_94,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_95,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_96,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_97,inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_n_98}),
        .rst(rst),
        .vec_rsc_qa(vec_rsc_qa),
        .vec_rsc_qb(vec_rsc_qb),
        .vec_rsci_bcwt(\inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt ),
        .vec_rsci_bcwt_1(\inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt_1 ),
        .vec_rsci_bcwt_1_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_12),
        .vec_rsci_bcwt_reg(inPlaceNTT_DIF_precomp_core_staller_inst_n_11),
        .\vec_rsci_qa_d_bfwt_63_32_reg[31] (inPlaceNTT_DIF_precomp_core_staller_inst_n_3),
        .vector__1_i_20(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_36));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_out_1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,MUX1HOT_v_12_4_2_return}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_nl_z_out_1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_55,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_56,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_57,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_58,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_59,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_60,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_61,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_62,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_63,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_64,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_65,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_out_1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_out_1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_out_1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_out_1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_out_1_OVERFLOW_UNCONNECTED),
        .P({NLW_nl_z_out_1_P_UNCONNECTED[47:24],nl_z_out_1_n_82,nl_z_out_1_n_83,nl_z_out_1_n_84,nl_z_out_1_n_85,nl_z_out_1_n_86,nl_z_out_1_n_87,nl_z_out_1_n_88,nl_z_out_1_n_89,nl_z_out_1_n_90,nl_z_out_1_n_91,nl_z_out_1_n_92,nl_z_out_1_n_93,nl_z_out_1_n_94,nl_z_out_1_n_95,P}),
        .PATTERNBDETECT(NLW_nl_z_out_1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_out_1_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_nl_z_out_1_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_out_1_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_out_2
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_0,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_1,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_2,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_3,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_4,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_5,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_6,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_7,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_8,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_9,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_10,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_11}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_nl_z_out_2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_80,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_81,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_82,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_83,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_84,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_85,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_86,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_87,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_88,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_89,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_90,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_out_2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_out_2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_out_2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_out_2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_out_2_OVERFLOW_UNCONNECTED),
        .P({NLW_nl_z_out_2_P_UNCONNECTED[47:24],nl_z_out_2_n_82,nl_z_out_2_n_83,nl_z_out_2_n_84,nl_z_out_2_n_85,nl_z_out_2_n_86,nl_z_out_2_n_87,nl_z_out_2_n_88,nl_z_out_2_n_89,nl_z_out_2_n_90,nl_z_out_2_n_91,nl_z_out_2_n_92,nl_z_out_2_n_93,nl_z_out_2_n_94,nl_z_out_2_n_95,nl_z_out_2_n_96,nl_z_out_2_n_97,nl_z_out_2_n_98,nl_z_out_2_n_99,nl_z_out_2_n_100,nl_z_out_2_n_101,input_1148_in,input_210_in,input_2133_in,nl_z_out_2_n_105}),
        .PATTERNBDETECT(NLW_nl_z_out_2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_out_2_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_nl_z_out_2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_out_2_UNDERFLOW_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    nl_z_out_2_i_28
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    nl_z_out_2_i_29
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_29_n_0));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    nl_z_out_2_i_30
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_30_n_0));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    nl_z_out_2_i_31
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    nl_z_out_2_i_32
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    nl_z_out_2_i_33
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_33_n_0));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    nl_z_out_2_i_34
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    nl_z_out_2_i_35
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    nl_z_out_2_i_36
       (.I0(STAGE_LOOP_i_3_0_sva_reg[3]),
        .I1(STAGE_LOOP_i_3_0_sva_reg[1]),
        .I2(STAGE_LOOP_i_3_0_sva_reg[0]),
        .I3(STAGE_LOOP_i_3_0_sva_reg[2]),
        .O(nl_z_out_2_i_36_n_0));
  FDRE \p_sva_reg[0] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[0]),
        .Q(p_sva[0]),
        .R(1'b0));
  FDRE \p_sva_reg[10] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[10]),
        .Q(p_sva[10]),
        .R(1'b0));
  FDRE \p_sva_reg[11] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[11]),
        .Q(p_sva[11]),
        .R(1'b0));
  FDRE \p_sva_reg[12] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[12]),
        .Q(p_sva[12]),
        .R(1'b0));
  FDRE \p_sva_reg[13] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[13]),
        .Q(p_sva[13]),
        .R(1'b0));
  FDRE \p_sva_reg[14] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[14]),
        .Q(p_sva[14]),
        .R(1'b0));
  FDRE \p_sva_reg[15] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[15]),
        .Q(p_sva[15]),
        .R(1'b0));
  FDRE \p_sva_reg[16] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[16]),
        .Q(p_sva[16]),
        .R(1'b0));
  FDRE \p_sva_reg[17] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[17]),
        .Q(p_sva[17]),
        .R(1'b0));
  FDRE \p_sva_reg[18] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[18]),
        .Q(p_sva[18]),
        .R(1'b0));
  FDRE \p_sva_reg[19] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[19]),
        .Q(p_sva[19]),
        .R(1'b0));
  FDRE \p_sva_reg[1] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[1]),
        .Q(p_sva[1]),
        .R(1'b0));
  FDRE \p_sva_reg[20] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[20]),
        .Q(p_sva[20]),
        .R(1'b0));
  FDRE \p_sva_reg[21] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[21]),
        .Q(p_sva[21]),
        .R(1'b0));
  FDRE \p_sva_reg[22] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[22]),
        .Q(p_sva[22]),
        .R(1'b0));
  FDRE \p_sva_reg[23] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[23]),
        .Q(p_sva[23]),
        .R(1'b0));
  FDRE \p_sva_reg[24] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[24]),
        .Q(p_sva[24]),
        .R(1'b0));
  FDRE \p_sva_reg[25] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[25]),
        .Q(p_sva[25]),
        .R(1'b0));
  FDRE \p_sva_reg[26] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[26]),
        .Q(p_sva[26]),
        .R(1'b0));
  FDRE \p_sva_reg[27] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[27]),
        .Q(p_sva[27]),
        .R(1'b0));
  FDRE \p_sva_reg[28] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[28]),
        .Q(p_sva[28]),
        .R(1'b0));
  FDRE \p_sva_reg[29] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[29]),
        .Q(p_sva[29]),
        .R(1'b0));
  FDRE \p_sva_reg[2] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[2]),
        .Q(p_sva[2]),
        .R(1'b0));
  FDRE \p_sva_reg[30] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[30]),
        .Q(p_sva[30]),
        .R(1'b0));
  FDRE \p_sva_reg[31] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[31]),
        .Q(p_sva[31]),
        .R(1'b0));
  FDRE \p_sva_reg[3] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[3]),
        .Q(p_sva[3]),
        .R(1'b0));
  FDRE \p_sva_reg[4] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[4]),
        .Q(p_sva[4]),
        .R(1'b0));
  FDRE \p_sva_reg[5] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[5]),
        .Q(p_sva[5]),
        .R(1'b0));
  FDRE \p_sva_reg[6] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[6]),
        .Q(p_sva[6]),
        .R(1'b0));
  FDRE \p_sva_reg[7] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[7]),
        .Q(p_sva[7]),
        .R(1'b0));
  FDRE \p_sva_reg[8] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[8]),
        .Q(p_sva[8]),
        .R(1'b0));
  FDRE \p_sva_reg[9] 
       (.C(clk),
        .CE(p_sva0),
        .D(p_rsc_dat[9]),
        .Q(p_sva[9]),
        .R(1'b0));
  FDRE reg_complete_rsci_oswt_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(reg_complete_rsci_oswt_cse0),
        .Q(reg_complete_rsci_oswt_cse_reg_0),
        .R(rst));
  FDRE reg_ensig_cgo_1_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(and_132_rmff),
        .Q(reg_ensig_cgo_1_cse),
        .R(rst));
  FDRE reg_ensig_cgo_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(MUX_s_1_2_2_return),
        .Q(reg_ensig_cgo_cse),
        .R(rst));
  FDRE reg_run_rsci_oswt_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_223),
        .Q(reg_run_rsci_oswt_cse),
        .R(rst));
  FDRE reg_twiddle_rsci_oswt_1_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1]),
        .Q(reg_twiddle_rsci_oswt_1_cse),
        .R(rst));
  FDRE reg_twiddle_rsci_oswt_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0]),
        .Q(reg_twiddle_rsci_oswt_cse),
        .R(rst));
  FDRE reg_vec_rsc_triosy_obj_iswt0_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(reg_vec_rsc_triosy_obj_iswt0_cse0),
        .Q(reg_vec_rsc_triosy_obj_iswt0_cse),
        .R(rst));
  FDRE reg_vec_rsci_oswt_1_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(p_238_in),
        .Q(reg_vec_rsci_oswt_1_cse),
        .R(rst));
  FDRE reg_vec_rsci_oswt_cse_reg
       (.C(clk),
        .CE(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_26),
        .D(nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff),
        .Q(reg_vec_rsci_oswt_cse),
        .R(rst));
  FDRE run_ac_sync_tmp_dobj_sva_reg
       (.C(clk),
        .CE(1'b1),
        .D(run_ac_sync_tmp_dobj_sva_reg_0),
        .Q(run_ac_sync_tmp_dobj_sva),
        .R(rst));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_25 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_137),
        .I1(input_5[7]),
        .O(\vec_rsc_adra[11]_INST_0_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_26 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_138),
        .I1(input_5[6]),
        .O(\vec_rsc_adra[11]_INST_0_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_27 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_139),
        .I1(input_5[5]),
        .O(\vec_rsc_adra[11]_INST_0_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_28 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_140),
        .I1(input_5[4]),
        .O(\vec_rsc_adra[11]_INST_0_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_33 
       (.I0(input_05_in),
        .I1(p_0_in2_in[11]),
        .O(\vec_rsc_adra[11]_INST_0_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_34 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[6] ),
        .I1(p_0_in2_in[10]),
        .O(\vec_rsc_adra[11]_INST_0_i_34_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_35 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[5] ),
        .I1(p_0_in2_in[9]),
        .O(\vec_rsc_adra[11]_INST_0_i_35_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[11]_INST_0_i_36 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[4] ),
        .I1(p_0_in2_in[8]),
        .O(\vec_rsc_adra[11]_INST_0_i_36_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[11]_INST_0_i_8 
       (.CI(\vec_rsc_adra[7]_INST_0_i_5_n_0 ),
        .CO({\NLW_vec_rsc_adra[11]_INST_0_i_8_CO_UNCONNECTED [3],\vec_rsc_adra[11]_INST_0_i_8_n_1 ,\vec_rsc_adra[11]_INST_0_i_8_n_2 ,\vec_rsc_adra[11]_INST_0_i_8_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_138,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_139,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_140}),
        .O({\vec_rsc_adra[11]_INST_0_i_8_n_4 ,\vec_rsc_adra[11]_INST_0_i_8_n_5 ,\vec_rsc_adra[11]_INST_0_i_8_n_6 ,\vec_rsc_adra[11]_INST_0_i_8_n_7 }),
        .S({\vec_rsc_adra[11]_INST_0_i_25_n_0 ,\vec_rsc_adra[11]_INST_0_i_26_n_0 ,\vec_rsc_adra[11]_INST_0_i_27_n_0 ,\vec_rsc_adra[11]_INST_0_i_28_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_16 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_145),
        .I1(input_5[3]),
        .O(\vec_rsc_adra[7]_INST_0_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_17 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_146),
        .I1(input_5[2]),
        .O(\vec_rsc_adra[7]_INST_0_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_18 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_147),
        .I1(input_5[1]),
        .O(\vec_rsc_adra[7]_INST_0_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_19 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_148),
        .I1(input_5[0]),
        .O(\vec_rsc_adra[7]_INST_0_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_24 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[3] ),
        .I1(p_0_in2_in[7]),
        .O(\vec_rsc_adra[7]_INST_0_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_25 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[2] ),
        .I1(p_0_in2_in[6]),
        .O(\vec_rsc_adra[7]_INST_0_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_26 
       (.I0(input_064_in),
        .I1(p_0_in2_in[5]),
        .O(\vec_rsc_adra[7]_INST_0_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adra[7]_INST_0_i_27 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg_n_0_[0] ),
        .I1(p_0_in2_in[4]),
        .O(\vec_rsc_adra[7]_INST_0_i_27_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[7]_INST_0_i_5 
       (.CI(\vec_rsc_adrb[0]_INST_0_i_2_n_0 ),
        .CO({\vec_rsc_adra[7]_INST_0_i_5_n_0 ,\vec_rsc_adra[7]_INST_0_i_5_n_1 ,\vec_rsc_adra[7]_INST_0_i_5_n_2 ,\vec_rsc_adra[7]_INST_0_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_145,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_146,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_147,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_148}),
        .O({\vec_rsc_adra[7]_INST_0_i_5_n_4 ,\vec_rsc_adra[7]_INST_0_i_5_n_5 ,\vec_rsc_adra[7]_INST_0_i_5_n_6 ,\vec_rsc_adra[7]_INST_0_i_5_n_7 }),
        .S({\vec_rsc_adra[7]_INST_0_i_16_n_0 ,\vec_rsc_adra[7]_INST_0_i_17_n_0 ,\vec_rsc_adra[7]_INST_0_i_18_n_0 ,\vec_rsc_adra[7]_INST_0_i_19_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[0]_INST_0_i_2 
       (.CI(1'b0),
        .CO({\vec_rsc_adrb[0]_INST_0_i_2_n_0 ,\vec_rsc_adrb[0]_INST_0_i_2_n_1 ,\vec_rsc_adrb[0]_INST_0_i_2_n_2 ,\vec_rsc_adrb[0]_INST_0_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_141,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_142,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_143,inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_144}),
        .O({input_421_in,input_412_in,input_3,\vec_rsc_adrb[0]_INST_0_i_2_n_7 }),
        .S({\vec_rsc_adrb[0]_INST_0_i_6_n_0 ,\vec_rsc_adrb[0]_INST_0_i_7_n_0 ,\vec_rsc_adrb[0]_INST_0_i_8_n_0 ,\vec_rsc_adrb[0]_INST_0_i_9_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adrb[0]_INST_0_i_6 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_141),
        .I1(input_7),
        .O(\vec_rsc_adrb[0]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adrb[0]_INST_0_i_7 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_142),
        .I1(input_08_in),
        .O(\vec_rsc_adrb[0]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adrb[0]_INST_0_i_8 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_143),
        .I1(\VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[1] ),
        .O(\vec_rsc_adrb[0]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vec_rsc_adrb[0]_INST_0_i_9 
       (.I0(inPlaceNTT_DIF_precomp_core_core_fsm_inst_n_144),
        .I1(\VEC_LOOP_acc_1_cse_10_sva_reg_n_0_[0] ),
        .O(\vec_rsc_adrb[0]_INST_0_i_9_n_0 ));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_core_fsm" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_core_fsm
   (A,
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] ,
    \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ,
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
    complete_rsc_rdy_0,
    E,
    complete_rsc_rdy_1,
    COMP_LOOP_5_twiddle_f_lshift_ncse_sva0,
    COMP_LOOP_2_twiddle_f_lshift_ncse_sva0,
    COMP_LOOP_3_twiddle_f_lshift_ncse_sva0,
    \state_var_reg_rep[4]_0 ,
    \state_var_reg_rep[1]_0 ,
    reg_vec_rsc_triosy_obj_iswt0_cse0,
    \state_var_reg_rep[6]_0 ,
    \state_var_reg_rep[6]_1 ,
    nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff,
    \state_var_reg_rep[0]_0 ,
    vec_rsc_adra,
    COMP_LOOP_1_mult_cmp_ccs_ccore_en,
    MUX_s_1_2_2_return,
    reg_complete_rsci_oswt_cse_reg,
    \VEC_LOOP_j_12_0_1_sva_1_reg[12] ,
    B,
    nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
    twiddle_h_rsc_adra,
    \COMP_LOOP_k_12_4_sva_7_0_reg[7] ,
    D,
    reg_complete_rsci_oswt_cse_reg_0,
    p_238_in,
    acc_10_nl,
    vec_rsc_adrb,
    \VEC_LOOP_acc_1_cse_10_sva_reg[10] ,
    \state_var_reg_rep[7]_0 ,
    \state_var_reg_rep[4]_1 ,
    reg_complete_rsci_oswt_cse_reg_1,
    z_out_14,
    \COMP_LOOP_k_12_4_sva_7_0_reg[6] ,
    \STAGE_LOOP_lshift_psp_sva_reg[4] ,
    \COMP_LOOP_k_12_4_sva_7_0_reg[3] ,
    \COMP_LOOP_twiddle_help_1_sva_reg[16] ,
    \COMP_LOOP_twiddle_help_1_sva_reg[31] ,
    \COMP_LOOP_twiddle_f_1_sva_reg[16] ,
    \COMP_LOOP_twiddle_f_1_sva_reg[31] ,
    nl_z_out_2,
    reg_complete_rsci_oswt_cse0,
    \state_var_reg_rep[2]_0 ,
    complete_rsc_rdy_2,
    SR,
    \state_var_reg_rep[6]_2 ,
    \state_var_reg_rep[3]_0 ,
    \state_var_reg_rep[4]_2 ,
    reg_complete_rsci_oswt_cse_reg_2,
    COMP_LOOP_k_12_4_sva_7_0,
    \state_var_reg_rep[3]_1 ,
    \state_var_reg_rep[3]_2 ,
    and_132_rmff,
    \STAGE_LOOP_lshift_psp_sva_reg[12] ,
    DI,
    \COMP_LOOP_k_12_4_sva_7_0_reg[2] ,
    \COMP_LOOP_k_12_4_sva_7_0_reg[4] ,
    \COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ,
    \state_var_reg_rep[7]_1 ,
    \STAGE_LOOP_i_3_0_sva_reg[0] ,
    \STAGE_LOOP_i_3_0_sva_reg[0]_0 ,
    \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3] ,
    twiddle_h_rsc_adrb,
    \STAGE_LOOP_i_3_0_sva_reg[0]_1 ,
    \STAGE_LOOP_i_3_0_sva_reg[0]_2 ,
    \STAGE_LOOP_i_3_0_sva_reg[3] ,
    \STAGE_LOOP_i_3_0_sva_reg[3]_0 ,
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[8] ,
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[9] ,
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[10] ,
    \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_0 ,
    \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_1 ,
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[8] ,
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[9] ,
    \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_2 ,
    p_and_1_cse,
    asn_itm_1_reg,
    main_stage_0_2_reg,
    vec_rsc_wea,
    out,
    nl_z_out_2_0,
    COMP_LOOP_2_twiddle_f_lshift_ncse_sva,
    COMP_LOOP_3_twiddle_f_lshift_ncse_sva,
    nl_z_out_2_1,
    nl_z_out_2_2,
    Q,
    nl_z_out_1,
    nl_z_out_1_0,
    reg_ensig_cgo_1_cse,
    \vec_rsc_adra[11] ,
    O,
    \vec_rsc_adra[10] ,
    \vec_rsc_adra[11]_0 ,
    p_0_in2_in,
    reg_ensig_cgo_cse,
    complete_rsc_rdy,
    \return_rsci_d_reg[0] ,
    reg_twiddle_rsci_oswt_cse_reg,
    P,
    \twiddle_h_rsc_adra[11] ,
    \VEC_LOOP_acc_10_cse_1_sva_reg[7] ,
    \VEC_LOOP_acc_10_cse_1_sva_reg[11] ,
    \vec_rsc_adra[11]_1 ,
    VEC_LOOP_acc_12_psp_sva_10,
    \vec_rsc_adra[11]_2 ,
    COMP_LOOP_5_twiddle_f_lshift_ncse_sva,
    nl_z_out_1_1,
    nl_z_out_2_3,
    nl_z_out_2_4,
    nl_z_out_2_5,
    nl_z_out_2_6,
    nl_z_out_2_7,
    nl_z_out_2_8,
    vector__2,
    vector__2_0,
    z_mul_itm_1_reg,
    z_mul_itm_1_reg_0,
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0] ,
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0]_0 ,
    \twiddle_h_rsc_adra[11]_INST_0_i_13_0 ,
    \VEC_LOOP_j_12_0_1_sva_1_reg[3] ,
    \STAGE_LOOP_lshift_psp_sva_reg[12]_0 ,
    S,
    \vec_rsc_adra[11]_INST_0_i_8 ,
    \twiddle_h_rsc_adra[7]_INST_0_i_1_0 ,
    \twiddle_h_rsc_adra[7]_INST_0_i_1_1 ,
    \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ,
    \twiddle_h_rsc_adra[11]_INST_0_i_5_1 ,
    COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1,
    asn_itm_1,
    main_stage_0_2,
    rst,
    clk,
    \FSM_sequential_state_var_reg[2]_0 );
  output [11:0]A;
  output [11:0]\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] ;
  output [0:0]\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ;
  output COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  output complete_rsc_rdy_0;
  output [0:0]E;
  output [0:0]complete_rsc_rdy_1;
  output COMP_LOOP_5_twiddle_f_lshift_ncse_sva0;
  output COMP_LOOP_2_twiddle_f_lshift_ncse_sva0;
  output COMP_LOOP_3_twiddle_f_lshift_ncse_sva0;
  output [0:0]\state_var_reg_rep[4]_0 ;
  output \state_var_reg_rep[1]_0 ;
  output reg_vec_rsc_triosy_obj_iswt0_cse0;
  output \state_var_reg_rep[6]_0 ;
  output \state_var_reg_rep[6]_1 ;
  output nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  output \state_var_reg_rep[0]_0 ;
  output [11:0]vec_rsc_adra;
  output COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  output MUX_s_1_2_2_return;
  output [0:0]reg_complete_rsci_oswt_cse_reg;
  output [0:0]\VEC_LOOP_j_12_0_1_sva_1_reg[12] ;
  output [10:0]B;
  output [1:0]nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output [11:0]twiddle_h_rsc_adra;
  output [10:0]\COMP_LOOP_k_12_4_sva_7_0_reg[7] ;
  output [11:0]D;
  output [0:0]reg_complete_rsci_oswt_cse_reg_0;
  output p_238_in;
  output [7:0]acc_10_nl;
  output [11:0]vec_rsc_adrb;
  output [0:0]\VEC_LOOP_acc_1_cse_10_sva_reg[10] ;
  output \state_var_reg_rep[7]_0 ;
  output [0:0]\state_var_reg_rep[4]_1 ;
  output [0:0]reg_complete_rsci_oswt_cse_reg_1;
  output [7:0]z_out_14;
  output [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[6] ;
  output [3:0]\STAGE_LOOP_lshift_psp_sva_reg[4] ;
  output [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3] ;
  output [16:0]\COMP_LOOP_twiddle_help_1_sva_reg[16] ;
  output [14:0]\COMP_LOOP_twiddle_help_1_sva_reg[31] ;
  output [16:0]\COMP_LOOP_twiddle_f_1_sva_reg[16] ;
  output [14:0]\COMP_LOOP_twiddle_f_1_sva_reg[31] ;
  output [8:0]nl_z_out_2;
  output reg_complete_rsci_oswt_cse0;
  output \state_var_reg_rep[2]_0 ;
  output [0:0]complete_rsc_rdy_2;
  output [0:0]SR;
  output [0:0]\state_var_reg_rep[6]_2 ;
  output [0:0]\state_var_reg_rep[3]_0 ;
  output \state_var_reg_rep[4]_2 ;
  output [0:0]reg_complete_rsci_oswt_cse_reg_2;
  output COMP_LOOP_k_12_4_sva_7_0;
  output [9:0]\state_var_reg_rep[3]_1 ;
  output \state_var_reg_rep[3]_2 ;
  output and_132_rmff;
  output [12:0]\STAGE_LOOP_lshift_psp_sva_reg[12] ;
  output [2:0]DI;
  output [1:0]\COMP_LOOP_k_12_4_sva_7_0_reg[2] ;
  output [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[4] ;
  output [0:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ;
  output \state_var_reg_rep[7]_1 ;
  output \STAGE_LOOP_i_3_0_sva_reg[0] ;
  output \STAGE_LOOP_i_3_0_sva_reg[0]_0 ;
  output \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3] ;
  output [0:0]twiddle_h_rsc_adrb;
  output \STAGE_LOOP_i_3_0_sva_reg[0]_1 ;
  output \STAGE_LOOP_i_3_0_sva_reg[0]_2 ;
  output \STAGE_LOOP_i_3_0_sva_reg[3] ;
  output \STAGE_LOOP_i_3_0_sva_reg[3]_0 ;
  output \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[8] ;
  output \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[9] ;
  output \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[10] ;
  output \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_0 ;
  output \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_1 ;
  output \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[8] ;
  output \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[9] ;
  output \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_2 ;
  output p_and_1_cse;
  output asn_itm_1_reg;
  output main_stage_0_2_reg;
  output vec_rsc_wea;
  output [11:0]out;
  input nl_z_out_2_0;
  input [11:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  input [10:0]COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  input nl_z_out_2_1;
  input nl_z_out_2_2;
  input [3:0]Q;
  input nl_z_out_1;
  input [7:0]nl_z_out_1_0;
  input reg_ensig_cgo_1_cse;
  input [11:0]\vec_rsc_adra[11] ;
  input [3:0]O;
  input [9:0]\vec_rsc_adra[10] ;
  input [11:0]\vec_rsc_adra[11]_0 ;
  input [11:0]p_0_in2_in;
  input reg_ensig_cgo_cse;
  input complete_rsc_rdy;
  input \return_rsci_d_reg[0] ;
  input [12:0]reg_twiddle_rsci_oswt_cse_reg;
  input [11:0]P;
  input [11:0]\twiddle_h_rsc_adra[11] ;
  input [3:0]\VEC_LOOP_acc_10_cse_1_sva_reg[7] ;
  input [3:0]\VEC_LOOP_acc_10_cse_1_sva_reg[11] ;
  input [8:0]\vec_rsc_adra[11]_1 ;
  input VEC_LOOP_acc_12_psp_sva_10;
  input [7:0]\vec_rsc_adra[11]_2 ;
  input [9:0]COMP_LOOP_5_twiddle_f_lshift_ncse_sva;
  input nl_z_out_1_1;
  input nl_z_out_2_3;
  input nl_z_out_2_4;
  input nl_z_out_2_5;
  input nl_z_out_2_6;
  input nl_z_out_2_7;
  input nl_z_out_2_8;
  input [31:0]vector__2;
  input [31:0]vector__2_0;
  input [31:0]z_mul_itm_1_reg;
  input [31:0]z_mul_itm_1_reg_0;
  input \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0] ;
  input \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0]_0 ;
  input [1:0]\twiddle_h_rsc_adra[11]_INST_0_i_13_0 ;
  input \VEC_LOOP_j_12_0_1_sva_1_reg[3] ;
  input [2:0]\STAGE_LOOP_lshift_psp_sva_reg[12]_0 ;
  input [3:0]S;
  input [3:0]\vec_rsc_adra[11]_INST_0_i_8 ;
  input [0:0]\twiddle_h_rsc_adra[7]_INST_0_i_1_0 ;
  input [2:0]\twiddle_h_rsc_adra[7]_INST_0_i_1_1 ;
  input \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ;
  input \twiddle_h_rsc_adra[11]_INST_0_i_5_1 ;
  input [2:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  input asn_itm_1;
  input main_stage_0_2;
  input rst;
  input clk;
  input \FSM_sequential_state_var_reg[2]_0 ;

  wire [11:0]A;
  wire [10:0]B;
  wire [12:12]COMP_LOOP_1_acc_nl;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire \COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_3_n_0 ;
  wire [0:0]\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ;
  wire \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3] ;
  wire \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_0 ;
  wire \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_1 ;
  wire \COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_2 ;
  wire [11:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  wire COMP_LOOP_2_twiddle_f_lshift_ncse_sva0;
  wire \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ;
  wire \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ;
  wire [2:0]COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire [11:0]\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] ;
  wire [10:0]COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  wire COMP_LOOP_3_twiddle_f_lshift_ncse_sva0;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_3_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[10] ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[8] ;
  wire \COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[9] ;
  wire [9:0]COMP_LOOP_5_twiddle_f_lshift_ncse_sva;
  wire COMP_LOOP_5_twiddle_f_lshift_ncse_sva0;
  wire COMP_LOOP_5_twiddle_f_lshift_ncse_sva4;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10_n_0 ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0] ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0]_0 ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[8] ;
  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[9] ;
  wire \COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_3_n_0 ;
  wire \COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_4_n_0 ;
  wire COMP_LOOP_k_12_4_sva_7_0;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_10_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_2_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_3_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_4_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_5_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_6_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_7_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_8_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[3]_i_9_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_10_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_3_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_4_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_5_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_6_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_7_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_8_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0[7]_i_9_n_0 ;
  wire [1:0]\COMP_LOOP_k_12_4_sva_7_0_reg[2] ;
  wire [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3] ;
  wire [0:0]\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_1 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_2 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_3 ;
  wire [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[4] ;
  wire [3:0]\COMP_LOOP_k_12_4_sva_7_0_reg[6] ;
  wire [10:0]\COMP_LOOP_k_12_4_sva_7_0_reg[7] ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_0 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_1 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_2 ;
  wire \COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_3 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_10_n_0 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_3_n_0 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_4_n_0 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_5_n_0 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_6_n_0 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_8_n_0 ;
  wire \COMP_LOOP_twiddle_f_1_sva[31]_i_9_n_0 ;
  wire [16:0]\COMP_LOOP_twiddle_f_1_sva_reg[16] ;
  wire [14:0]\COMP_LOOP_twiddle_f_1_sva_reg[31] ;
  wire \COMP_LOOP_twiddle_f_9_sva[31]_i_3_n_0 ;
  wire \COMP_LOOP_twiddle_f_9_sva[31]_i_4_n_0 ;
  wire [16:0]\COMP_LOOP_twiddle_help_1_sva_reg[16] ;
  wire [14:0]\COMP_LOOP_twiddle_help_1_sva_reg[31] ;
  wire [11:0]D;
  wire [2:0]DI;
  wire [0:0]E;
  wire \FSM_sequential_state_var_reg[2]_0 ;
  wire \FSM_sequential_state_var_reg_n_0_[0] ;
  wire \FSM_sequential_state_var_reg_n_0_[1] ;
  wire \FSM_sequential_state_var_reg_n_0_[2] ;
  wire \FSM_sequential_state_var_reg_n_0_[3] ;
  wire \FSM_sequential_state_var_reg_n_0_[4] ;
  wire \FSM_sequential_state_var_reg_n_0_[5] ;
  wire \FSM_sequential_state_var_reg_n_0_[6] ;
  wire \FSM_sequential_state_var_reg_n_0_[7] ;
  wire MUX_s_1_2_2_return;
  wire [10:0]MUX_v_12_2_20_return;
  wire [3:0]MUX_v_4_2_2_return;
  wire [3:0]O;
  wire [11:0]P;
  wire [3:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire \STAGE_LOOP_i_3_0_sva_reg[0] ;
  wire \STAGE_LOOP_i_3_0_sva_reg[0]_0 ;
  wire \STAGE_LOOP_i_3_0_sva_reg[0]_1 ;
  wire \STAGE_LOOP_i_3_0_sva_reg[0]_2 ;
  wire \STAGE_LOOP_i_3_0_sva_reg[3] ;
  wire \STAGE_LOOP_i_3_0_sva_reg[3]_0 ;
  wire [12:0]\STAGE_LOOP_lshift_psp_sva_reg[12] ;
  wire [2:0]\STAGE_LOOP_lshift_psp_sva_reg[12]_0 ;
  wire [3:0]\STAGE_LOOP_lshift_psp_sva_reg[4] ;
  wire \VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ;
  wire \VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ;
  wire \VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ;
  wire [3:0]\VEC_LOOP_acc_10_cse_1_sva_reg[11] ;
  wire [3:0]\VEC_LOOP_acc_10_cse_1_sva_reg[7] ;
  wire VEC_LOOP_acc_12_psp_sva_10;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_10_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_11_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_12_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_5_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_6_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_7_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_8_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[11]_i_9_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_2_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_3_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_4_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_5_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_6_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_7_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_8_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[3]_i_9_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_2_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_3_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_4_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_5_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_6_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_7_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_8_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva[7]_i_9_n_0 ;
  wire [0:0]\VEC_LOOP_acc_1_cse_10_sva_reg[10] ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_n_1 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_n_2 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_n_3 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_1 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_2 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_3 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_0 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_1 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_2 ;
  wire \VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_3 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_2_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_3_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_4_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_5_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_6_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_7_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_8_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[11]_i_9_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[12]_i_4_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_2_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_3_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_4_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_5_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_6_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_7_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_8_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[3]_i_9_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_2_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_3_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_4_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_5_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_6_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_7_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_8_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1[7]_i_9_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_1 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_2 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_3 ;
  wire [0:0]\VEC_LOOP_j_12_0_1_sva_1_reg[12] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[3] ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_1 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_2 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_3 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_0 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_1 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_2 ;
  wire \VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_3 ;
  wire [7:0]acc_10_nl;
  wire [10:9]acc_10_nl__0;
  wire [10:1]acc_12_nl;
  wire and_132_rmff;
  wire asn_itm_1;
  wire asn_itm_1_reg;
  wire clk;
  wire complete_rsc_rdy;
  wire complete_rsc_rdy_0;
  wire [0:0]complete_rsc_rdy_1;
  wire [0:0]complete_rsc_rdy_2;
  wire [4:2]conv_u2u_13_14_return;
  wire input_037_in;
  wire input_1;
  wire input_125_in;
  wire input_147_in;
  wire input_2;
  wire input_46_in;
  wire input_519_in;
  wire input_57_in;
  wire main_stage_0_2;
  wire main_stage_0_2_reg;
  wire nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat;
  wire [1:0]nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  wire nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  wire nl_z_mul_nl_i_6_n_0;
  wire nl_z_mul_nl_i_7_n_0;
  wire nl_z_out_1;
  wire [7:0]nl_z_out_1_0;
  wire nl_z_out_1_1;
  wire nl_z_out_1_i_28_n_0;
  wire nl_z_out_1_i_29_n_0;
  wire nl_z_out_1_i_30_n_0;
  wire nl_z_out_1_i_31_n_0;
  wire nl_z_out_1_i_32_n_0;
  wire nl_z_out_1_i_33_n_0;
  wire nl_z_out_1_i_35_n_0;
  wire nl_z_out_1_i_36_n_0;
  wire nl_z_out_1_i_37_n_0;
  wire nl_z_out_1_i_38_n_0;
  wire nl_z_out_1_i_39_n_0;
  wire nl_z_out_1_i_40_n_0;
  wire nl_z_out_1_i_41_n_0;
  wire nl_z_out_1_i_42_n_0;
  wire nl_z_out_1_i_43_n_0;
  wire nl_z_out_1_i_44_n_0;
  wire nl_z_out_1_i_45_n_0;
  wire nl_z_out_1_i_46_n_0;
  wire [8:0]nl_z_out_2;
  wire nl_z_out_2_0;
  wire nl_z_out_2_1;
  wire nl_z_out_2_2;
  wire nl_z_out_2_3;
  wire nl_z_out_2_4;
  wire nl_z_out_2_5;
  wire nl_z_out_2_6;
  wire nl_z_out_2_7;
  wire nl_z_out_2_8;
  wire nl_z_out_2_i_24_n_0;
  wire nl_z_out_2_i_25_n_0;
  wire nl_z_out_2_i_26_n_0;
  wire nl_z_out_2_i_27_n_0;
  wire nl_z_out_2_i_37_n_0;
  wire nl_z_out_2_i_38_n_0;
  wire [11:0]out;
  wire [3:0]p_0_in;
  wire [11:0]p_0_in2_in;
  wire [1:1]p_0_in4_in;
  wire [10:2]p_1_in5_in;
  wire p_238_in;
  wire p_and_1_cse;
  wire reg_complete_rsci_oswt_cse0;
  wire reg_complete_rsci_oswt_cse_i_2_n_0;
  wire [0:0]reg_complete_rsci_oswt_cse_reg;
  wire [0:0]reg_complete_rsci_oswt_cse_reg_0;
  wire [0:0]reg_complete_rsci_oswt_cse_reg_1;
  wire [0:0]reg_complete_rsci_oswt_cse_reg_2;
  wire reg_ensig_cgo_1_cse;
  wire reg_ensig_cgo_cse;
  wire reg_twiddle_rsci_oswt_cse_i_2_n_0;
  wire [12:0]reg_twiddle_rsci_oswt_cse_reg;
  wire reg_vec_rsc_triosy_obj_iswt0_cse0;
  wire \return_rsci_d_reg[0] ;
  wire rst;
  wire sel33_in;
  wire [7:0]state_var;
  wire [7:0]state_var_NS;
  wire \state_var_reg_rep[0]_0 ;
  wire \state_var_reg_rep[1]_0 ;
  wire \state_var_reg_rep[2]_0 ;
  wire [0:0]\state_var_reg_rep[3]_0 ;
  wire [9:0]\state_var_reg_rep[3]_1 ;
  wire \state_var_reg_rep[3]_2 ;
  wire [0:0]\state_var_reg_rep[4]_0 ;
  wire [0:0]\state_var_reg_rep[4]_1 ;
  wire \state_var_reg_rep[4]_2 ;
  wire \state_var_reg_rep[6]_0 ;
  wire \state_var_reg_rep[6]_1 ;
  wire [0:0]\state_var_reg_rep[6]_2 ;
  wire \state_var_reg_rep[7]_0 ;
  wire \state_var_reg_rep[7]_1 ;
  wire \state_var_reg_rep[7]_i_12_n_1 ;
  wire \state_var_reg_rep[7]_i_12_n_2 ;
  wire \state_var_reg_rep[7]_i_12_n_3 ;
  wire \state_var_reg_rep[7]_i_16_n_0 ;
  wire \state_var_reg_rep[7]_i_16_n_1 ;
  wire \state_var_reg_rep[7]_i_16_n_2 ;
  wire \state_var_reg_rep[7]_i_16_n_3 ;
  wire \state_var_reg_rep[7]_i_22_n_0 ;
  wire \state_var_reg_rep[7]_i_22_n_1 ;
  wire \state_var_reg_rep[7]_i_22_n_2 ;
  wire \state_var_reg_rep[7]_i_22_n_3 ;
  wire \state_var_rep[1]_i_2_n_0 ;
  wire \state_var_rep[1]_i_3_n_0 ;
  wire \state_var_rep[1]_i_4_n_0 ;
  wire \state_var_rep[2]_i_2_n_0 ;
  wire \state_var_rep[2]_i_3_n_0 ;
  wire \state_var_rep[2]_i_4_n_0 ;
  wire \state_var_rep[2]_i_5_n_0 ;
  wire \state_var_rep[3]_i_2_n_0 ;
  wire \state_var_rep[3]_i_3_n_0 ;
  wire \state_var_rep[3]_i_4_n_0 ;
  wire \state_var_rep[4]_i_2_n_0 ;
  wire \state_var_rep[4]_i_3_n_0 ;
  wire \state_var_rep[4]_i_4_n_0 ;
  wire \state_var_rep[4]_i_5_n_0 ;
  wire \state_var_rep[4]_i_6_n_0 ;
  wire \state_var_rep[4]_i_7_n_0 ;
  wire \state_var_rep[5]_i_2_n_0 ;
  wire \state_var_rep[5]_i_3_n_0 ;
  wire \state_var_rep[5]_i_4_n_0 ;
  wire \state_var_rep[5]_i_5_n_0 ;
  wire \state_var_rep[6]_i_10_n_0 ;
  wire \state_var_rep[6]_i_11_n_0 ;
  wire \state_var_rep[6]_i_2_n_0 ;
  wire \state_var_rep[6]_i_3_n_0 ;
  wire \state_var_rep[6]_i_4_n_0 ;
  wire \state_var_rep[6]_i_5_n_0 ;
  wire \state_var_rep[6]_i_6_n_0 ;
  wire \state_var_rep[6]_i_7_n_0 ;
  wire \state_var_rep[6]_i_8_n_0 ;
  wire \state_var_rep[6]_i_9_n_0 ;
  wire \state_var_rep[7]_i_10_n_0 ;
  wire \state_var_rep[7]_i_11_n_0 ;
  wire \state_var_rep[7]_i_13_n_0 ;
  wire \state_var_rep[7]_i_14_n_0 ;
  wire \state_var_rep[7]_i_15_n_0 ;
  wire \state_var_rep[7]_i_17_n_0 ;
  wire \state_var_rep[7]_i_18_n_0 ;
  wire \state_var_rep[7]_i_19_n_0 ;
  wire \state_var_rep[7]_i_20_n_0 ;
  wire \state_var_rep[7]_i_21_n_0 ;
  wire \state_var_rep[7]_i_23_n_0 ;
  wire \state_var_rep[7]_i_24_n_0 ;
  wire \state_var_rep[7]_i_25_n_0 ;
  wire \state_var_rep[7]_i_26_n_0 ;
  wire \state_var_rep[7]_i_27_n_0 ;
  wire \state_var_rep[7]_i_28_n_0 ;
  wire \state_var_rep[7]_i_29_n_0 ;
  wire \state_var_rep[7]_i_2_n_0 ;
  wire \state_var_rep[7]_i_30_n_0 ;
  wire \state_var_rep[7]_i_31_n_0 ;
  wire \state_var_rep[7]_i_3_n_0 ;
  wire \state_var_rep[7]_i_4_n_0 ;
  wire \state_var_rep[7]_i_5_n_0 ;
  wire \state_var_rep[7]_i_6_n_0 ;
  wire \state_var_rep[7]_i_7_n_0 ;
  wire \state_var_rep[7]_i_8_n_0 ;
  wire \state_var_rep[7]_i_9_n_0 ;
  wire [11:0]twiddle_h_rsc_adra;
  wire \twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[0]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_10_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_10_n_1 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_10_n_2 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_10_n_3 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_11_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_12_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_13_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_14_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_15_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_16_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_17_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_18_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_19_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_20_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_21_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_22_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_23_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_24_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_25_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_26_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_27_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_28_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_29_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_30_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_31_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_32_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_33_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_34_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_35_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_36_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_37_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_38_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_0 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_1 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_2 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_3 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_4 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_5 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_6 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_3_n_7 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_5_n_1 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_5_n_2 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_5_n_3 ;
  wire \twiddle_h_rsc_adra[10]_INST_0_i_6_n_0 ;
  wire [11:0]\twiddle_h_rsc_adra[11] ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_11_n_0 ;
  wire [1:0]\twiddle_h_rsc_adra[11]_INST_0_i_13_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_18_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_19_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_20_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_3_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5_1 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_5_n_7 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ;
  wire \twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ;
  wire \twiddle_h_rsc_adra[1]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[2]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ;
  wire \twiddle_h_rsc_adra[3]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[3]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[4]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[4]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[5]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[5]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_10_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_13_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_1 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_2 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_3 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_5 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_6 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_3_n_7 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_4_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_5_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_6_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_7_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_8_n_0 ;
  wire \twiddle_h_rsc_adra[6]_INST_0_i_9_n_0 ;
  wire [0:0]\twiddle_h_rsc_adra[7]_INST_0_i_1_0 ;
  wire [2:0]\twiddle_h_rsc_adra[7]_INST_0_i_1_1 ;
  wire \twiddle_h_rsc_adra[7]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[7]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[8]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[8]_INST_0_i_2_n_0 ;
  wire \twiddle_h_rsc_adra[9]_INST_0_i_1_n_0 ;
  wire \twiddle_h_rsc_adra[9]_INST_0_i_2_n_0 ;
  wire [0:0]twiddle_h_rsc_adrb;
  wire \twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ;
  wire [11:0]vec_rsc_adra;
  wire \vec_rsc_adra[0]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[0]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[0]_INST_0_i_3_n_0 ;
  wire [9:0]\vec_rsc_adra[10] ;
  wire \vec_rsc_adra[10]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[10]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[10]_INST_0_i_3_n_0 ;
  wire [11:0]\vec_rsc_adra[11] ;
  wire [11:0]\vec_rsc_adra[11]_0 ;
  wire [8:0]\vec_rsc_adra[11]_1 ;
  wire [7:0]\vec_rsc_adra[11]_2 ;
  wire \vec_rsc_adra[11]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_1 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_2 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_3 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_4 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_5 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_6 ;
  wire \vec_rsc_adra[11]_INST_0_i_14_n_7 ;
  wire \vec_rsc_adra[11]_INST_0_i_15_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_16_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_20_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_21_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_22_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_23_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_24_n_1 ;
  wire \vec_rsc_adra[11]_INST_0_i_24_n_2 ;
  wire \vec_rsc_adra[11]_INST_0_i_24_n_3 ;
  wire \vec_rsc_adra[11]_INST_0_i_29_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_30_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_31_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_32_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_37_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_38_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_39_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_40_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_42_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_43_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_1 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_2 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_3 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_4 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_5 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_6 ;
  wire \vec_rsc_adra[11]_INST_0_i_7_n_7 ;
  wire [3:0]\vec_rsc_adra[11]_INST_0_i_8 ;
  wire \vec_rsc_adra[11]_INST_0_i_9_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_2_n_1 ;
  wire \vec_rsc_adra[1]_INST_0_i_2_n_2 ;
  wire \vec_rsc_adra[1]_INST_0_i_2_n_3 ;
  wire \vec_rsc_adra[1]_INST_0_i_2_n_7 ;
  wire \vec_rsc_adra[1]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_7_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_8_n_0 ;
  wire \vec_rsc_adra[1]_INST_0_i_9_n_0 ;
  wire \vec_rsc_adra[2]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[2]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[2]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[3]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[3]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[3]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[3]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adra[3]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adra[4]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[4]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[4]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[5]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[5]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[5]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[6]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[6]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[6]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_14_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_15_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_15_n_1 ;
  wire \vec_rsc_adra[7]_INST_0_i_15_n_2 ;
  wire \vec_rsc_adra[7]_INST_0_i_15_n_3 ;
  wire \vec_rsc_adra[7]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_20_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_21_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_22_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_23_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_28_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_29_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_30_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_31_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_1 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_2 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_3 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_4 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_5 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_6 ;
  wire \vec_rsc_adra[7]_INST_0_i_4_n_7 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_1 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_2 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_3 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_4 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_5 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_6 ;
  wire \vec_rsc_adra[7]_INST_0_i_6_n_7 ;
  wire \vec_rsc_adra[8]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[8]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[8]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adra[9]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adra[9]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adra[9]_INST_0_i_3_n_0 ;
  wire [11:0]vec_rsc_adrb;
  wire \vec_rsc_adrb[0]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adrb[0]_INST_0_i_5_n_1 ;
  wire \vec_rsc_adrb[0]_INST_0_i_5_n_2 ;
  wire \vec_rsc_adrb[0]_INST_0_i_5_n_3 ;
  wire \vec_rsc_adrb[10]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[10]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_14_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_15_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_16_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_17_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_18_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_19_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_1_n_2 ;
  wire \vec_rsc_adrb[11]_INST_0_i_1_n_3 ;
  wire \vec_rsc_adrb[11]_INST_0_i_20_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_21_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_22_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_23_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_4_n_3 ;
  wire \vec_rsc_adrb[11]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adrb[11]_INST_0_i_9_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adrb[1]_INST_0_i_4_n_1 ;
  wire \vec_rsc_adrb[1]_INST_0_i_4_n_2 ;
  wire \vec_rsc_adrb[1]_INST_0_i_4_n_3 ;
  wire \vec_rsc_adrb[1]_INST_0_i_4_n_7 ;
  wire \vec_rsc_adrb[1]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adrb[2]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[2]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[3]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[3]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_1_n_1 ;
  wire \vec_rsc_adrb[4]_INST_0_i_1_n_2 ;
  wire \vec_rsc_adrb[4]_INST_0_i_1_n_3 ;
  wire \vec_rsc_adrb[4]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_8_n_0 ;
  wire \vec_rsc_adrb[4]_INST_0_i_9_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_14_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_15_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_16_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_17_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_18_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_19_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_20_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_21_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_22_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_23_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_2_n_1 ;
  wire \vec_rsc_adrb[5]_INST_0_i_2_n_2 ;
  wire \vec_rsc_adrb[5]_INST_0_i_2_n_3 ;
  wire \vec_rsc_adrb[5]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_7_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_8_n_0 ;
  wire \vec_rsc_adrb[5]_INST_0_i_9_n_0 ;
  wire \vec_rsc_adrb[6]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[6]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[7]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[7]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_1_n_1 ;
  wire \vec_rsc_adrb[8]_INST_0_i_1_n_2 ;
  wire \vec_rsc_adrb[8]_INST_0_i_1_n_3 ;
  wire \vec_rsc_adrb[8]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_8_n_0 ;
  wire \vec_rsc_adrb[8]_INST_0_i_9_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_10_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_11_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_12_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_13_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_14_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_15_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_16_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_17_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_18_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_19_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_1_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_20_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_21_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_22_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_2_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_2_n_1 ;
  wire \vec_rsc_adrb[9]_INST_0_i_2_n_2 ;
  wire \vec_rsc_adrb[9]_INST_0_i_2_n_3 ;
  wire \vec_rsc_adrb[9]_INST_0_i_3_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_4_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_5_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_6_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_7_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_8_n_0 ;
  wire \vec_rsc_adrb[9]_INST_0_i_9_n_0 ;
  wire vec_rsc_wea;
  wire vec_rsc_wea_INST_0_i_1_n_0;
  wire vec_rsc_wea_INST_0_i_2_n_0;
  wire [31:0]vector__2;
  wire [31:0]vector__2_0;
  wire [31:0]z_mul_itm_1_reg;
  wire [31:0]z_mul_itm_1_reg_0;
  wire [7:0]z_out_14;
  wire [8:8]z_out_14__0;
  wire [3:3]\NLW_VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_VEC_LOOP_j_12_0_1_sva_1_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_VEC_LOOP_j_12_0_1_sva_1_reg[12]_i_2_O_UNCONNECTED ;
  wire [3:3]\NLW_state_var_reg_rep[7]_i_12_CO_UNCONNECTED ;
  wire [2:0]\NLW_state_var_reg_rep[7]_i_12_O_UNCONNECTED ;
  wire [3:0]\NLW_state_var_reg_rep[7]_i_16_O_UNCONNECTED ;
  wire [3:0]\NLW_state_var_reg_rep[7]_i_22_O_UNCONNECTED ;
  wire [3:3]\NLW_twiddle_h_rsc_adra[10]_INST_0_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_twiddle_h_rsc_adra[11]_INST_0_i_16_CO_UNCONNECTED ;
  wire [3:1]\NLW_twiddle_h_rsc_adra[11]_INST_0_i_16_O_UNCONNECTED ;
  wire [3:0]\NLW_twiddle_h_rsc_adra[11]_INST_0_i_5_CO_UNCONNECTED ;
  wire [3:1]\NLW_twiddle_h_rsc_adra[11]_INST_0_i_5_O_UNCONNECTED ;
  wire [3:3]\NLW_vec_rsc_adra[11]_INST_0_i_14_CO_UNCONNECTED ;
  wire [3:3]\NLW_vec_rsc_adra[11]_INST_0_i_24_CO_UNCONNECTED ;
  wire [3:0]\NLW_vec_rsc_adra[11]_INST_0_i_41_CO_UNCONNECTED ;
  wire [3:1]\NLW_vec_rsc_adra[11]_INST_0_i_41_O_UNCONNECTED ;
  wire [3:3]\NLW_vec_rsc_adra[11]_INST_0_i_7_CO_UNCONNECTED ;
  wire [3:2]\NLW_vec_rsc_adrb[11]_INST_0_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_vec_rsc_adrb[11]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_vec_rsc_adrb[11]_INST_0_i_4_CO_UNCONNECTED ;
  wire [3:2]\NLW_vec_rsc_adrb[11]_INST_0_i_4_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFF888888F8)) 
    \COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_1 
       (.I0(complete_rsc_rdy_0),
        .I1(p_0_in[3]),
        .I2(nl_z_mul_nl_i_6_n_0),
        .I3(p_0_in[1]),
        .I4(p_0_in[0]),
        .I5(\COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_3_n_0 ),
        .O(complete_rsc_rdy_1));
  LUT6 #(
    .INIT(64'hFFFF0000AAAB0000)) 
    \COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_3 
       (.I0(input_147_in),
        .I1(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I2(sel33_in),
        .I3(p_0_in[1]),
        .I4(complete_rsc_rdy_0),
        .I5(COMP_LOOP_5_twiddle_f_lshift_ncse_sva4),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00FF0080)) 
    \COMP_LOOP_1_twiddle_f_acc_cse_sva[3]_i_4 
       (.I0(state_var[3]),
        .I1(state_var[4]),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I3(state_var[7]),
        .I4(state_var[5]),
        .O(COMP_LOOP_5_twiddle_f_lshift_ncse_sva4));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11]_i_1 
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .I1(Q[3]),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_1 
       (.I0(Q[3]),
        .I1(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAF00AB00)) 
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_2 
       (.I0(input_147_in),
        .I1(p_0_in[0]),
        .I2(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ),
        .I3(complete_rsc_rdy_0),
        .I4(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ),
        .I5(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .O(COMP_LOOP_2_twiddle_f_lshift_ncse_sva0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hD5007F3F)) 
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I1(state_var[1]),
        .I2(state_var[0]),
        .I3(state_var[7]),
        .I4(state_var[2]),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000540000000000)) 
    \COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_4 
       (.I0(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I1(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I2(state_var[3]),
        .I3(state_var[6]),
        .I4(state_var[7]),
        .I5(complete_rsc_rdy_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hABAAABABA8AAA8A8)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_1 
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[2]),
        .I1(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ),
        .I2(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I3(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I4(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_3_n_0 ),
        .I5(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[10] ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h0D00)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_3 
       (.I0(\return_rsci_d_reg[0] ),
        .I1(complete_rsc_rdy),
        .I2(state_var[7]),
        .I3(state_var[6]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA0080)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_1 
       (.I0(Q[3]),
        .I1(p_0_in[3]),
        .I2(complete_rsc_rdy_0),
        .I3(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I4(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I5(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hEEEEEFEEEEEEEEEE)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_2 
       (.I0(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ),
        .I1(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I2(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I3(complete_rsc_rdy_0),
        .I4(state_var[7]),
        .I5(state_var[6]),
        .O(COMP_LOOP_3_twiddle_f_lshift_ncse_sva0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC000000A0000000A)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5 
       (.I0(nl_z_mul_nl_i_6_n_0),
        .I1(complete_rsc_rdy_0),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB0B0B0F0B0B0B0B0)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6 
       (.I0(input_147_in),
        .I1(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ),
        .I2(complete_rsc_rdy_0),
        .I3(sel33_in),
        .I4(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I5(\vec_rsc_adrb[5]_INST_0_i_21_n_0 ),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hABAAABABA8AAA8A8)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[8]_i_1 
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[0]),
        .I1(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ),
        .I2(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I3(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I4(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_3_n_0 ),
        .I5(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[8]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[8] ));
  LUT6 #(
    .INIT(64'hABAAABABA8AAA8A8)) 
    \COMP_LOOP_3_twiddle_f_lshift_ncse_sva[9]_i_1 
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[1]),
        .I1(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ),
        .I2(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I3(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I4(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]_i_3_n_0 ),
        .I5(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[9]),
        .O(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva_reg[9] ));
  LUT6 #(
    .INIT(64'h000000001010101F)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[0]_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I2(\state_var_reg_rep[7]_1 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0] ));
  LUT6 #(
    .INIT(64'h00000000808F8080)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[1]_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I2(\state_var_reg_rep[7]_1 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0]_2 ));
  LUT6 #(
    .INIT(64'h0000000047034400)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[2]_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I1(\state_var_reg_rep[7]_1 ),
        .I2(Q[0]),
        .I3(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I4(Q[1]),
        .I5(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h0000000030B80088)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[3]_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I1(\state_var_reg_rep[7]_1 ),
        .I2(Q[0]),
        .I3(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I4(Q[1]),
        .I5(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_1 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[3]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10 
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(state_var[3]),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF99A900000000)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_2 
       (.I0(p_0_in[3]),
        .I1(p_0_in[2]),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I3(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ),
        .I4(input_147_in),
        .I5(complete_rsc_rdy_0),
        .O(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0));
  LUT6 #(
    .INIT(64'h5555555755555554)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_4 
       (.I0(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0] ),
        .I1(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(p_0_in[3]),
        .I5(Q[3]),
        .O(MUX_v_4_2_2_return[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h7AAA3222)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5 
       (.I0(state_var[2]),
        .I1(state_var[7]),
        .I2(state_var[0]),
        .I3(state_var[1]),
        .I4(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_6 
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h5555555755555554)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_7 
       (.I0(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[0]_0 ),
        .I1(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(p_0_in[3]),
        .I5(Q[2]),
        .O(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_8 
       (.I0(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(state_var[7]),
        .I3(state_var[3]),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I5(state_var[6]),
        .O(\state_var_reg_rep[7]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[8]_i_1 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\STAGE_LOOP_i_3_0_sva_reg[0] ),
        .I2(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[8]),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[8] ));
  LUT4 #(
    .INIT(16'h8F80)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[9]_i_1 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\STAGE_LOOP_i_3_0_sva_reg[0]_2 ),
        .I2(COMP_LOOP_5_twiddle_f_lshift_ncse_sva0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[9]),
        .O(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[9] ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[0]_i_1 
       (.I0(P[0]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[0]),
        .O(nl_z_out_2[0]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[1]_i_1 
       (.I0(P[1]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[1]),
        .O(nl_z_out_2[1]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[2]_i_1 
       (.I0(P[2]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[2]),
        .O(nl_z_out_2[2]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[3]_i_1 
       (.I0(P[3]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[3]),
        .O(nl_z_out_2[3]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[4]_i_1 
       (.I0(P[4]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[4]),
        .O(nl_z_out_2[4]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[5]_i_1 
       (.I0(P[5]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[5]),
        .O(nl_z_out_2[5]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[6]_i_1 
       (.I0(P[6]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[6]),
        .O(nl_z_out_2[6]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[7]_i_1 
       (.I0(P[7]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl[7]),
        .O(nl_z_out_2[7]));
  LUT6 #(
    .INIT(64'hFFAAAAAAFEAAAAAA)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_1 
       (.I0(\COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_3_n_0 ),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(complete_rsc_rdy_0),
        .I4(p_0_in[3]),
        .I5(\COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_4_n_0 ),
        .O(\state_var_reg_rep[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_2 
       (.I0(P[8]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(acc_10_nl__0[9]),
        .O(nl_z_out_2[8]));
  LUT6 #(
    .INIT(64'hF0E0A0A0E0E0F0A0)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_3 
       (.I0(input_147_in),
        .I1(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_5_n_0 ),
        .I2(complete_rsc_rdy_0),
        .I3(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ),
        .I4(p_0_in[2]),
        .I5(input_037_in),
        .O(\COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hFFFF5DFF)) 
    \COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_4 
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[2]),
        .I4(state_var[1]),
        .O(\COMP_LOOP_9_twiddle_f_mul_psp_sva[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_10 
       (.I0(state_var[1]),
        .I1(state_var[7]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[2]),
        .I4(state_var[0]),
        .I5(\state_var_reg_rep[6]_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_2 
       (.I0(nl_z_out_1_0[3]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[2]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_3 
       (.I0(nl_z_out_1_0[2]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[1]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_4 
       (.I0(nl_z_out_1_0[1]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[0]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_5 
       (.I0(nl_z_out_1_0[0]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_6 
       (.I0(nl_z_out_1_0[2]),
        .I1(nl_z_out_1_0[3]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[7]),
        .I4(p_0_in2_in[6]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_7 
       (.I0(nl_z_out_1_0[1]),
        .I1(nl_z_out_1_0[2]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[6]),
        .I4(p_0_in2_in[5]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_8 
       (.I0(nl_z_out_1_0[0]),
        .I1(nl_z_out_1_0[1]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[5]),
        .I4(p_0_in2_in[4]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h556A556A0000003F)) 
    \COMP_LOOP_k_12_4_sva_7_0[3]_i_9 
       (.I0(nl_z_out_1_0[0]),
        .I1(p_0_in2_in[4]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(\COMP_LOOP_k_12_4_sva_7_0[3]_i_10_n_0 ),
        .I4(p_0_in2_in[3]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hCC00CC00C8040804)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_1 
       (.I0(\state_var_reg_rep[6]_0 ),
        .I1(complete_rsc_rdy_0),
        .I2(vec_rsc_wea_INST_0_i_1_n_0),
        .I3(input_147_in),
        .I4(\vec_rsc_adra[0]_INST_0_i_3_n_0 ),
        .I5(sel33_in),
        .O(\state_var_reg_rep[6]_2 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_10 
       (.I0(nl_z_out_1_0[3]),
        .I1(nl_z_out_1_0[4]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[8]),
        .I4(p_0_in2_in[7]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_3 
       (.I0(nl_z_out_1_0[7]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[6]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_4 
       (.I0(nl_z_out_1_0[6]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[5]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_5 
       (.I0(nl_z_out_1_0[5]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[4]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_6 
       (.I0(nl_z_out_1_0[4]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(nl_z_out_1_0[3]),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_7 
       (.I0(nl_z_out_1_0[6]),
        .I1(nl_z_out_1_0[7]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[11]),
        .I4(p_0_in2_in[10]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_8 
       (.I0(nl_z_out_1_0[5]),
        .I1(nl_z_out_1_0[6]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[10]),
        .I4(p_0_in2_in[9]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h3CCC3CCC55555AAA)) 
    \COMP_LOOP_k_12_4_sva_7_0[7]_i_9 
       (.I0(nl_z_out_1_0[4]),
        .I1(nl_z_out_1_0[5]),
        .I2(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I3(p_0_in2_in[9]),
        .I4(p_0_in2_in[8]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0[7]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_0 ,\COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_1 ,\COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_2 ,\COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\COMP_LOOP_k_12_4_sva_7_0[3]_i_2_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[3]_i_3_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[3]_i_4_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[3]_i_5_n_0 }),
        .O(z_out_14[3:0]),
        .S({\COMP_LOOP_k_12_4_sva_7_0[3]_i_6_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[3]_i_7_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[3]_i_8_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[3]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2 
       (.CI(\COMP_LOOP_k_12_4_sva_7_0_reg[3]_i_1_n_0 ),
        .CO({\COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_0 ,\COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_1 ,\COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_2 ,\COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\COMP_LOOP_k_12_4_sva_7_0[7]_i_3_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[7]_i_4_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[7]_i_5_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[7]_i_6_n_0 }),
        .O(z_out_14[7:4]),
        .S({\COMP_LOOP_k_12_4_sva_7_0[7]_i_7_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[7]_i_8_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[7]_i_9_n_0 ,\COMP_LOOP_k_12_4_sva_7_0[7]_i_10_n_0 }));
  LUT6 #(
    .INIT(64'hFFFFFFFEFEFEFEFE)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_1 
       (.I0(\COMP_LOOP_twiddle_f_1_sva[31]_i_3_n_0 ),
        .I1(\COMP_LOOP_twiddle_f_1_sva[31]_i_4_n_0 ),
        .I2(\COMP_LOOP_twiddle_f_1_sva[31]_i_5_n_0 ),
        .I3(p_0_in[0]),
        .I4(sel33_in),
        .I5(\COMP_LOOP_twiddle_f_1_sva[31]_i_6_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1_reg[12] ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_10 
       (.I0(sel33_in),
        .I1(state_var[7]),
        .I2(state_var[3]),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hA3FFA0A000000000)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_3 
       (.I0(input_147_in),
        .I1(p_0_in[0]),
        .I2(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I3(p_0_in[3]),
        .I4(\COMP_LOOP_twiddle_f_1_sva[31]_i_8_n_0 ),
        .I5(complete_rsc_rdy_0),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h080008000C00080C)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_4 
       (.I0(\COMP_LOOP_twiddle_f_1_sva[31]_i_9_n_0 ),
        .I1(complete_rsc_rdy_0),
        .I2(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I3(p_0_in[3]),
        .I4(input_147_in),
        .I5(\COMP_LOOP_twiddle_f_1_sva[31]_i_10_n_0 ),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_5 
       (.I0(vec_rsc_wea_INST_0_i_2_n_0),
        .I1(p_0_in[3]),
        .I2(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I3(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I4(\VEC_LOOP_acc_1_cse_10_sva[11]_i_5_n_0 ),
        .I5(complete_rsc_rdy_0),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_6 
       (.I0(\return_rsci_d_reg[0] ),
        .I1(complete_rsc_rdy),
        .I2(input_147_in),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_7 
       (.I0(state_var[4]),
        .I1(state_var[5]),
        .I2(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I3(state_var[6]),
        .I4(state_var[7]),
        .I5(state_var[3]),
        .O(\state_var_reg_rep[4]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h20220000)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_8 
       (.I0(state_var[0]),
        .I1(state_var[2]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[7]),
        .I4(state_var[1]),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h2A0015152A00AAAA)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_9 
       (.I0(state_var[2]),
        .I1(state_var[0]),
        .I2(state_var[1]),
        .I3(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I4(state_var[7]),
        .I5(state_var[3]),
        .O(\COMP_LOOP_twiddle_f_1_sva[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAA88A8)) 
    \COMP_LOOP_twiddle_f_9_sva[31]_i_1 
       (.I0(complete_rsc_rdy_0),
        .I1(input_147_in),
        .I2(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]_i_3_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ),
        .I4(\COMP_LOOP_twiddle_f_9_sva[31]_i_3_n_0 ),
        .I5(\COMP_LOOP_twiddle_f_9_sva[31]_i_4_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'h1010100010001000)) 
    \COMP_LOOP_twiddle_f_9_sva[31]_i_3 
       (.I0(state_var[5]),
        .I1(state_var[7]),
        .I2(state_var[3]),
        .I3(sel33_in),
        .I4(vec_rsc_wea_INST_0_i_2_n_0),
        .I5(vec_rsc_wea_INST_0_i_1_n_0),
        .O(\COMP_LOOP_twiddle_f_9_sva[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFCFF0000FDF30000)) 
    \COMP_LOOP_twiddle_f_9_sva[31]_i_4 
       (.I0(state_var[3]),
        .I1(state_var[6]),
        .I2(state_var[7]),
        .I3(state_var[5]),
        .I4(complete_rsc_rdy_0),
        .I5(state_var[4]),
        .O(\COMP_LOOP_twiddle_f_9_sva[31]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[0] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[0]),
        .Q(\FSM_sequential_state_var_reg_n_0_[0] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[1] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[1]),
        .Q(\FSM_sequential_state_var_reg_n_0_[1] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[2] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[2]),
        .Q(\FSM_sequential_state_var_reg_n_0_[2] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[3] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[3]),
        .Q(\FSM_sequential_state_var_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[4] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[4]),
        .Q(\FSM_sequential_state_var_reg_n_0_[4] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[5] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[5]),
        .Q(\FSM_sequential_state_var_reg_n_0_[5] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[6] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[6]),
        .Q(\FSM_sequential_state_var_reg_n_0_[6] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "COMP_LOOP_7_VEC_LOOP_C_3:00110111,COMP_LOOP_9_VEC_LOOP_C_1:01000101,COMP_LOOP_7_VEC_LOOP_C_2:00110110,COMP_LOOP_6_VEC_LOOP_C_1:00101101,COMP_LOOP_9_VEC_LOOP_C_0:01000100,COMP_LOOP_6_VEC_LOOP_C_0:00101100,COMP_LOOP_7_VEC_LOOP_C_1:00110101,COMP_LOOP_7_VEC_LOOP_C_0:00110100,COMP_LOOP_C_4:00011011,COMP_LOOP_3_VEC_LOOP_C_6:00011010,COMP_LOOP_3_VEC_LOOP_C_5:00011001,COMP_LOOP_16_VEC_LOOP_C_3:01111111,COMP_LOOP_3_VEC_LOOP_C_4:00011000,COMP_LOOP_16_VEC_LOOP_C_2:01111110,COMP_LOOP_C_9:01000011,COMP_LOOP_8_VEC_LOOP_C_6:01000010,COMP_LOOP_C_6:00101011,COMP_LOOP_5_VEC_LOOP_C_6:00101010,COMP_LOOP_16_VEC_LOOP_C_1:01111101,COMP_LOOP_16_VEC_LOOP_C_0:01111100,COMP_LOOP_C_7:00110011,COMP_LOOP_8_VEC_LOOP_C_5:01000001,COMP_LOOP_6_VEC_LOOP_C_6:00110010,COMP_LOOP_8_VEC_LOOP_C_4:01000000,COMP_LOOP_5_VEC_LOOP_C_5:00101001,COMP_LOOP_5_VEC_LOOP_C_4:00101000,COMP_LOOP_1_VEC_LOOP_C_3:00000111,COMP_LOOP_6_VEC_LOOP_C_5:00110001,COMP_LOOP_1_VEC_LOOP_C_2:00000110,COMP_LOOP_6_VEC_LOOP_C_4:00110000,COMP_LOOP_1_VEC_LOOP_C_1:00000101,COMP_LOOP_1_VEC_LOOP_C_0:00000100,COMP_LOOP_C_16:01111011,COMP_LOOP_15_VEC_LOOP_C_6:01111010,main_C_2:10000110,COMP_LOOP_10_VEC_LOOP_C_3:01001111,COMP_LOOP_10_VEC_LOOP_C_2:01001110,COMP_LOOP_15_VEC_LOOP_C_5:01111001,COMP_LOOP_11_VEC_LOOP_C_3:01010111,COMP_LOOP_15_VEC_LOOP_C_4:01111000,main_C_1:10000101,COMP_LOOP_11_VEC_LOOP_C_2:01010110,COMP_LOOP_8_VEC_LOOP_C_3:00111111,STAGE_LOOP_C_1:10000100,COMP_LOOP_10_VEC_LOOP_C_1:01001101,COMP_LOOP_8_VEC_LOOP_C_2:00111110,COMP_LOOP_10_VEC_LOOP_C_0:01001100,COMP_LOOP_C_1:00000011,COMP_LOOP_11_VEC_LOOP_C_1:01010101,COMP_LOOP_C_0:00000010,COMP_LOOP_8_VEC_LOOP_C_1:00111101,COMP_LOOP_11_VEC_LOOP_C_0:01010100,COMP_LOOP_8_VEC_LOOP_C_0:00111100,STAGE_LOOP_C_0:00000001,iSTATE:00000000,COMP_LOOP_13_VEC_LOOP_C_3:01100111,COMP_LOOP_13_VEC_LOOP_C_2:01100110,COMP_LOOP_C_17:10000011,COMP_LOOP_13_VEC_LOOP_C_1:01100101,COMP_LOOP_16_VEC_LOOP_C_6:10000010,COMP_LOOP_13_VEC_LOOP_C_0:01100100,COMP_LOOP_C_10:01001011,COMP_LOOP_9_VEC_LOOP_C_6:01001010,COMP_LOOP_16_VEC_LOOP_C_5:10000001,COMP_LOOP_C_11:01010011,COMP_LOOP_10_VEC_LOOP_C_6:01010010,COMP_LOOP_16_VEC_LOOP_C_4:10000000,COMP_LOOP_C_8:00111011,COMP_LOOP_9_VEC_LOOP_C_5:01001001,COMP_LOOP_7_VEC_LOOP_C_6:00111010,COMP_LOOP_9_VEC_LOOP_C_4:01001000,COMP_LOOP_10_VEC_LOOP_C_5:01010001,COMP_LOOP_2_VEC_LOOP_C_3:00001111,COMP_LOOP_10_VEC_LOOP_C_4:01010000,COMP_LOOP_7_VEC_LOOP_C_5:00111001,COMP_LOOP_2_VEC_LOOP_C_2:00001110,COMP_LOOP_7_VEC_LOOP_C_4:00111000,COMP_LOOP_3_VEC_LOOP_C_3:00010111,COMP_LOOP_3_VEC_LOOP_C_2:00010110,COMP_LOOP_2_VEC_LOOP_C_1:00001101,COMP_LOOP_C_13:01100011,COMP_LOOP_2_VEC_LOOP_C_0:00001100,COMP_LOOP_12_VEC_LOOP_C_6:01100010,COMP_LOOP_3_VEC_LOOP_C_1:00010101,COMP_LOOP_3_VEC_LOOP_C_0:00010100,COMP_LOOP_12_VEC_LOOP_C_5:01100001,COMP_LOOP_12_VEC_LOOP_C_4:01100000,COMP_LOOP_5_VEC_LOOP_C_3:00100111,COMP_LOOP_5_VEC_LOOP_C_2:00100110,COMP_LOOP_12_VEC_LOOP_C_3:01011111,COMP_LOOP_12_VEC_LOOP_C_2:01011110,COMP_LOOP_5_VEC_LOOP_C_1:00100101,COMP_LOOP_5_VEC_LOOP_C_0:00100100,COMP_LOOP_C_2:00001011,COMP_LOOP_12_VEC_LOOP_C_1:01011101,COMP_LOOP_1_VEC_LOOP_C_6:00001010,COMP_LOOP_12_VEC_LOOP_C_0:01011100,COMP_LOOP_C_3:00010011,COMP_LOOP_2_VEC_LOOP_C_6:00010010,COMP_LOOP_1_VEC_LOOP_C_5:00001001,COMP_LOOP_14_VEC_LOOP_C_3:01101111,COMP_LOOP_1_VEC_LOOP_C_4:00001000,COMP_LOOP_14_VEC_LOOP_C_2:01101110,COMP_LOOP_2_VEC_LOOP_C_5:00010001,COMP_LOOP_15_VEC_LOOP_C_3:01110111,COMP_LOOP_2_VEC_LOOP_C_4:00010000,COMP_LOOP_15_VEC_LOOP_C_2:01110110,COMP_LOOP_14_VEC_LOOP_C_1:01101101,COMP_LOOP_14_VEC_LOOP_C_0:01101100,COMP_LOOP_C_5:00100011,COMP_LOOP_4_VEC_LOOP_C_6:00100010,COMP_LOOP_15_VEC_LOOP_C_1:01110101,COMP_LOOP_15_VEC_LOOP_C_0:01110100,COMP_LOOP_C_12:01011011,COMP_LOOP_11_VEC_LOOP_C_6:01011010,COMP_LOOP_4_VEC_LOOP_C_5:00100001,COMP_LOOP_4_VEC_LOOP_C_4:00100000,COMP_LOOP_11_VEC_LOOP_C_5:01011001,COMP_LOOP_11_VEC_LOOP_C_4:01011000,COMP_LOOP_4_VEC_LOOP_C_3:00011111,COMP_LOOP_4_VEC_LOOP_C_2:00011110,COMP_LOOP_C_14:01101011,COMP_LOOP_13_VEC_LOOP_C_6:01101010,COMP_LOOP_4_VEC_LOOP_C_1:00011101,COMP_LOOP_C_15:01110011,COMP_LOOP_4_VEC_LOOP_C_0:00011100,COMP_LOOP_14_VEC_LOOP_C_6:01110010,COMP_LOOP_13_VEC_LOOP_C_5:01101001,COMP_LOOP_9_VEC_LOOP_C_3:01000111,COMP_LOOP_13_VEC_LOOP_C_4:01101000,COMP_LOOP_9_VEC_LOOP_C_2:01000110,COMP_LOOP_6_VEC_LOOP_C_3:00101111,COMP_LOOP_14_VEC_LOOP_C_5:01110001,COMP_LOOP_6_VEC_LOOP_C_2:00101110,COMP_LOOP_14_VEC_LOOP_C_4:01110000" *) 
  FDRE \FSM_sequential_state_var_reg[7] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[7]),
        .Q(\FSM_sequential_state_var_reg_n_0_[7] ),
        .R(rst));
  LUT6 #(
    .INIT(64'h000000000000000B)) 
    \STAGE_LOOP_i_3_0_sva[3]_i_1 
       (.I0(complete_rsc_rdy),
        .I1(\return_rsci_d_reg[0] ),
        .I2(sel33_in),
        .I3(vec_rsc_wea_INST_0_i_1_n_0),
        .I4(input_147_in),
        .I5(\vec_rsc_adra[0]_INST_0_i_3_n_0 ),
        .O(SR));
  LUT6 #(
    .INIT(64'h000000000000B00B)) 
    \STAGE_LOOP_i_3_0_sva[3]_i_2 
       (.I0(complete_rsc_rdy),
        .I1(\return_rsci_d_reg[0] ),
        .I2(input_147_in),
        .I3(sel33_in),
        .I4(vec_rsc_wea_INST_0_i_1_n_0),
        .I5(\vec_rsc_adra[0]_INST_0_i_3_n_0 ),
        .O(complete_rsc_rdy_2));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \STAGE_LOOP_lshift_psp_sva[12]_i_1 
       (.I0(COMP_LOOP_k_12_4_sva_7_0),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [2]),
        .O(\STAGE_LOOP_i_3_0_sva_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \STAGE_LOOP_lshift_psp_sva[4]_i_1 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [2]),
        .I1(COMP_LOOP_k_12_4_sva_7_0),
        .O(\STAGE_LOOP_i_3_0_sva_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hBB00BB00BB00000B)) 
    \STAGE_LOOP_lshift_psp_sva[7]_i_1 
       (.I0(complete_rsc_rdy),
        .I1(\return_rsci_d_reg[0] ),
        .I2(vec_rsc_wea_INST_0_i_1_n_0),
        .I3(input_147_in),
        .I4(\state_var_reg_rep[6]_0 ),
        .I5(sel33_in),
        .O(COMP_LOOP_k_12_4_sva_7_0));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[0]_i_1 
       (.I0(\vec_rsc_adrb[1]_INST_0_i_4_n_7 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[1]_INST_0_i_2_n_7 ),
        .I4(O[0]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[10]_i_1 
       (.I0(\vec_rsc_adra[11]_INST_0_i_7_n_5 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_14_n_5 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [2]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[11]_i_1 
       (.I0(\vec_rsc_adra[11]_INST_0_i_7_n_4 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_14_n_4 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [3]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    \VEC_LOOP_acc_10_cse_1_sva[11]_i_2 
       (.I0(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .I1(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I2(state_var[6]),
        .I3(state_var[4]),
        .I4(state_var[7]),
        .I5(state_var[5]),
        .O(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h0000CDED)) 
    \VEC_LOOP_acc_10_cse_1_sva[11]_i_3 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(state_var[6]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .O(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h05000104FFFFFFFF)) 
    \VEC_LOOP_acc_10_cse_1_sva[11]_i_4 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .I1(state_var[4]),
        .I2(state_var[7]),
        .I3(state_var[5]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[1]_i_1 
       (.I0(input_1),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(input_46_in),
        .I4(O[1]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[2]_i_1 
       (.I0(input_2),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(input_57_in),
        .I4(O[2]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[3]_i_1 
       (.I0(input_519_in),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(input_125_in),
        .I4(O[3]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[4]_i_1 
       (.I0(\vec_rsc_adra[7]_INST_0_i_4_n_7 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_6_n_7 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [0]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[5]_i_1 
       (.I0(\vec_rsc_adra[7]_INST_0_i_4_n_6 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_6_n_6 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [1]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[6]_i_1 
       (.I0(\vec_rsc_adra[7]_INST_0_i_4_n_5 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_6_n_5 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [2]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[7]_i_1 
       (.I0(\vec_rsc_adra[7]_INST_0_i_4_n_4 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_6_n_4 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [3]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[8]_i_1 
       (.I0(\vec_rsc_adra[11]_INST_0_i_7_n_7 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_14_n_7 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [0]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \VEC_LOOP_acc_10_cse_1_sva[9]_i_1 
       (.I0(\vec_rsc_adra[11]_INST_0_i_7_n_6 ),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_3_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_14_n_6 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [1]),
        .I5(\VEC_LOOP_acc_10_cse_1_sva[11]_i_4_n_0 ),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[0]_i_1 
       (.I0(acc_12_nl[1]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[0]),
        .O(\state_var_reg_rep[3]_1 [0]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[1]_i_1 
       (.I0(acc_12_nl[2]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[1]),
        .O(\state_var_reg_rep[3]_1 [1]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[2]_i_1 
       (.I0(acc_12_nl[3]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[2]),
        .O(\state_var_reg_rep[3]_1 [2]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[3]_i_1 
       (.I0(acc_12_nl[4]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[3]),
        .O(\state_var_reg_rep[3]_1 [3]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[4]_i_1 
       (.I0(acc_12_nl[5]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[4]),
        .O(\state_var_reg_rep[3]_1 [4]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[5]_i_1 
       (.I0(acc_12_nl[6]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[5]),
        .O(\state_var_reg_rep[3]_1 [5]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[6]_i_1 
       (.I0(acc_12_nl[7]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[6]),
        .O(\state_var_reg_rep[3]_1 [6]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[7]_i_1 
       (.I0(acc_12_nl[8]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl[7]),
        .O(\state_var_reg_rep[3]_1 [7]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[8]_i_1 
       (.I0(acc_12_nl[9]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl__0[9]),
        .O(\state_var_reg_rep[3]_1 [8]));
  LUT6 #(
    .INIT(64'h0000000032003232)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[9]_i_1 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(complete_rsc_rdy),
        .I4(\return_rsci_d_reg[0] ),
        .I5(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .O(\state_var_reg_rep[4]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[9]_i_2 
       (.I0(acc_12_nl[10]),
        .I1(\state_var_reg_rep[3]_2 ),
        .I2(acc_10_nl__0[10]),
        .O(\state_var_reg_rep[3]_1 [9]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \VEC_LOOP_acc_12_psp_sva_9_0[9]_i_3 
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .I3(state_var[5]),
        .I4(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .O(\state_var_reg_rep[3]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_1 
       (.I0(\return_rsci_d_reg[0] ),
        .I1(complete_rsc_rdy),
        .I2(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .O(reg_complete_rsci_oswt_cse_reg_2));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_10 
       (.I0(nl_z_out_1_0[6]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [2]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [10]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[10]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_11 
       (.I0(nl_z_out_1_0[5]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [1]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [9]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[9]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_12 
       (.I0(nl_z_out_1_0[4]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [0]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [8]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[8]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h44444444444CCCC4)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_2 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(complete_rsc_rdy_0),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(\state_var_reg_rep[6]_0 ),
        .I4(input_147_in),
        .I5(\VEC_LOOP_acc_1_cse_10_sva[11]_i_5_n_0 ),
        .O(\state_var_reg_rep[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_4 
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(state_var[2]),
        .I3(state_var[1]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hFF5D)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_5 
       (.I0(state_var[1]),
        .I1(state_var[7]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[2]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_6 
       (.I0(\vec_rsc_adra[11]_0 [10]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[6]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_7 
       (.I0(\vec_rsc_adra[11]_0 [9]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[5]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_8 
       (.I0(\vec_rsc_adra[11]_0 [8]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[4]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[11]_i_9 
       (.I0(nl_z_out_1_0[7]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [3]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [11]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[11]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[11]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_2 
       (.I0(state_var[7]),
        .I1(state_var[6]),
        .I2(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_3 
       (.I0(state_var[7]),
        .I1(state_var[5]),
        .I2(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_4 
       (.I0(state_var[7]),
        .I1(state_var[4]),
        .I2(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_5 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF56A6000056A6)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_6 
       (.I0(p_0_in[3]),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[4] [3]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [3]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[3]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF56A6000056A6)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_7 
       (.I0(p_0_in[2]),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[4] [2]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [2]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[2]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF56A6000056A6)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_8 
       (.I0(p_0_in[1]),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[4] [1]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [1]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[1]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFF1D001D)) 
    \VEC_LOOP_acc_1_cse_10_sva[3]_i_9 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [0]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\vec_rsc_adra[11]_0 [0]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I4(reg_twiddle_rsci_oswt_cse_reg[0]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[3]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_2 
       (.I0(\vec_rsc_adra[11]_0 [7]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[3]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_3 
       (.I0(\vec_rsc_adra[11]_0 [6]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[2]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_4 
       (.I0(\vec_rsc_adra[11]_0 [5]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[1]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_5 
       (.I0(\vec_rsc_adra[11]_0 [4]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(nl_z_out_1_0[0]),
        .I3(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_6 
       (.I0(nl_z_out_1_0[3]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [3]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [7]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[7]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_7 
       (.I0(nl_z_out_1_0[2]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [2]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [6]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[6]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_8 
       (.I0(nl_z_out_1_0[1]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [1]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [5]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[5]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF53AC000053AC)) 
    \VEC_LOOP_acc_1_cse_10_sva[7]_i_9 
       (.I0(nl_z_out_1_0[0]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [0]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [4]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(reg_twiddle_rsci_oswt_cse_reg[4]),
        .O(\VEC_LOOP_acc_1_cse_10_sva[7]_i_9_n_0 ));
  CARRY4 \VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3 
       (.CI(\VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_0 ),
        .CO({\NLW_VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_CO_UNCONNECTED [3],\VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_n_1 ,\VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_n_2 ,\VEC_LOOP_acc_1_cse_10_sva_reg[11]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\VEC_LOOP_acc_1_cse_10_sva[11]_i_6_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[11]_i_7_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[11]_i_8_n_0 }),
        .O(out[11:8]),
        .S({\VEC_LOOP_acc_1_cse_10_sva[11]_i_9_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[11]_i_10_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[11]_i_11_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[11]_i_12_n_0 }));
  CARRY4 \VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_0 ,\VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_1 ,\VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_2 ,\VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\VEC_LOOP_acc_1_cse_10_sva[3]_i_2_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[3]_i_3_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[3]_i_4_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[3]_i_5_n_0 }),
        .O(out[3:0]),
        .S({\VEC_LOOP_acc_1_cse_10_sva[3]_i_6_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[3]_i_7_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[3]_i_8_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[3]_i_9_n_0 }));
  CARRY4 \VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1 
       (.CI(\VEC_LOOP_acc_1_cse_10_sva_reg[3]_i_1_n_0 ),
        .CO({\VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_0 ,\VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_1 ,\VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_2 ,\VEC_LOOP_acc_1_cse_10_sva_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\VEC_LOOP_acc_1_cse_10_sva[7]_i_2_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[7]_i_3_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[7]_i_4_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[7]_i_5_n_0 }),
        .O(out[7:4]),
        .S({\VEC_LOOP_acc_1_cse_10_sva[7]_i_6_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[7]_i_7_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[7]_i_8_n_0 ,\VEC_LOOP_acc_1_cse_10_sva[7]_i_9_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hA2)) 
    \VEC_LOOP_acc_psp_sva[7]_i_1 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\return_rsci_d_reg[0] ),
        .I2(complete_rsc_rdy),
        .O(reg_complete_rsci_oswt_cse_reg_1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFCCFF01)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_10 
       (.I0(state_var[5]),
        .I1(state_var[4]),
        .I2(state_var[6]),
        .I3(state_var[7]),
        .I4(state_var[3]),
        .I5(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_2 
       (.I0(p_0_in2_in[10]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[11]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_3 
       (.I0(p_0_in2_in[9]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[10]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_4 
       (.I0(p_0_in2_in[8]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[9]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_5 
       (.I0(p_0_in2_in[7]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[8]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_6 
       (.I0(p_0_in2_in[11]),
        .I1(p_0_in2_in[10]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[7]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [11]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_7 
       (.I0(p_0_in2_in[10]),
        .I1(p_0_in2_in[9]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[6]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [10]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_8 
       (.I0(p_0_in2_in[9]),
        .I1(p_0_in2_in[8]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[5]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [9]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[11]_i_9 
       (.I0(p_0_in2_in[8]),
        .I1(p_0_in2_in[7]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[4]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [8]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[11]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \VEC_LOOP_j_12_0_1_sva_1[12]_i_1 
       (.I0(\return_rsci_d_reg[0] ),
        .I1(complete_rsc_rdy),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .O(reg_complete_rsci_oswt_cse_reg_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \VEC_LOOP_j_12_0_1_sva_1[12]_i_3 
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(state_var[2]),
        .I3(state_var[1]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \VEC_LOOP_j_12_0_1_sva_1[12]_i_4 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I1(p_0_in2_in[11]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000005F005E)) 
    \VEC_LOOP_j_12_0_1_sva_1[12]_i_5 
       (.I0(state_var[3]),
        .I1(state_var[6]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[5]),
        .I5(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000EAEB2A2A)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_10 
       (.I0(p_0_in[3]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .I4(\vec_rsc_adra[11]_0 [3]),
        .I5(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .O(conv_u2u_13_14_return[4]));
  LUT6 #(
    .INIT(64'hFE04FE04EE44EF44)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_11 
       (.I0(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(\vec_rsc_adra[11]_0 [2]),
        .I4(p_0_in[3]),
        .I5(p_0_in[0]),
        .O(conv_u2u_13_14_return[3]));
  LUT6 #(
    .INIT(64'hFAFA0202FAFB0202)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_12 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I3(p_0_in[2]),
        .I4(\vec_rsc_adra[11]_0 [1]),
        .I5(p_0_in[3]),
        .O(conv_u2u_13_14_return[2]));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_2 
       (.I0(p_0_in2_in[2]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[3]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_3 
       (.I0(p_0_in2_in[1]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[2]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_4 
       (.I0(p_0_in2_in[0]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[1]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_5 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1_reg[3] ),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[0]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0DDDF222)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_6 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I1(p_0_in2_in[3]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I3(p_0_in2_in[2]),
        .I4(conv_u2u_13_14_return[4]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h0DDDF222)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_7 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I1(p_0_in2_in[2]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I3(p_0_in2_in[1]),
        .I4(conv_u2u_13_14_return[3]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h0DDDF222)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_8 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I1(p_0_in2_in[1]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I3(p_0_in2_in[0]),
        .I4(conv_u2u_13_14_return[2]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h56AA55AA56A655A6)) 
    \VEC_LOOP_j_12_0_1_sva_1[3]_i_9 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[3]_i_5_n_0 ),
        .I1(p_0_in[0]),
        .I2(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [0]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ),
        .I5(p_0_in[1]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[3]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_2 
       (.I0(p_0_in2_in[6]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[7]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_3 
       (.I0(p_0_in2_in[5]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[6]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_4 
       (.I0(p_0_in2_in[4]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[5]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_5 
       (.I0(p_0_in2_in[3]),
        .I1(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I2(p_0_in2_in[4]),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_6 
       (.I0(p_0_in2_in[7]),
        .I1(p_0_in2_in[6]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[3]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [7]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_7 
       (.I0(p_0_in2_in[6]),
        .I1(p_0_in2_in[5]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[2]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [6]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_8 
       (.I0(p_0_in2_in[5]),
        .I1(p_0_in2_in[4]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [5]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h2323A0502CDCA050)) 
    \VEC_LOOP_j_12_0_1_sva_1[7]_i_9 
       (.I0(p_0_in2_in[4]),
        .I1(p_0_in2_in[3]),
        .I2(\VEC_LOOP_j_12_0_1_sva_1[12]_i_5_n_0 ),
        .I3(nl_z_out_1_0[0]),
        .I4(\VEC_LOOP_j_12_0_1_sva_1[11]_i_10_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [4]),
        .O(\VEC_LOOP_j_12_0_1_sva_1[7]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1 
       (.CI(\VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_0 ),
        .CO({\VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_0 ,\VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_1 ,\VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_2 ,\VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\VEC_LOOP_j_12_0_1_sva_1[11]_i_2_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[11]_i_3_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[11]_i_4_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[11]_i_5_n_0 }),
        .O(\STAGE_LOOP_lshift_psp_sva_reg[12] [11:8]),
        .S({\VEC_LOOP_j_12_0_1_sva_1[11]_i_6_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[11]_i_7_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[11]_i_8_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[11]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \VEC_LOOP_j_12_0_1_sva_1_reg[12]_i_2 
       (.CI(\VEC_LOOP_j_12_0_1_sva_1_reg[11]_i_1_n_0 ),
        .CO(\NLW_VEC_LOOP_j_12_0_1_sva_1_reg[12]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_VEC_LOOP_j_12_0_1_sva_1_reg[12]_i_2_O_UNCONNECTED [3:1],\STAGE_LOOP_lshift_psp_sva_reg[12] [12]}),
        .S({1'b0,1'b0,1'b0,\VEC_LOOP_j_12_0_1_sva_1[12]_i_4_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_0 ,\VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_1 ,\VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_2 ,\VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_3 }),
        .CYINIT(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .DI({\VEC_LOOP_j_12_0_1_sva_1[3]_i_2_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[3]_i_3_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[3]_i_4_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[3]_i_5_n_0 }),
        .O(\STAGE_LOOP_lshift_psp_sva_reg[12] [3:0]),
        .S({\VEC_LOOP_j_12_0_1_sva_1[3]_i_6_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[3]_i_7_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[3]_i_8_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[3]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1 
       (.CI(\VEC_LOOP_j_12_0_1_sva_1_reg[3]_i_1_n_0 ),
        .CO({\VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_0 ,\VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_1 ,\VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_2 ,\VEC_LOOP_j_12_0_1_sva_1_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\VEC_LOOP_j_12_0_1_sva_1[7]_i_2_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[7]_i_3_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[7]_i_4_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[7]_i_5_n_0 }),
        .O(\STAGE_LOOP_lshift_psp_sva_reg[12] [7:4]),
        .S({\VEC_LOOP_j_12_0_1_sva_1[7]_i_6_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[7]_i_7_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[7]_i_8_n_0 ,\VEC_LOOP_j_12_0_1_sva_1[7]_i_9_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    asn_itm_1_i_1
       (.I0(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat),
        .I1(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .I2(asn_itm_1),
        .O(asn_itm_1_reg));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'hE)) 
    main_stage_0_2_i_1
       (.I0(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .I1(main_stage_0_2),
        .O(main_stage_0_2_reg));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_1
       (.I0(z_mul_itm_1_reg[16]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[16]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [16]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_10
       (.I0(z_mul_itm_1_reg[7]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[7]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_11
       (.I0(z_mul_itm_1_reg[6]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[6]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [6]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_12
       (.I0(z_mul_itm_1_reg[5]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[5]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [5]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_13
       (.I0(z_mul_itm_1_reg[4]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[4]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [4]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_14
       (.I0(z_mul_itm_1_reg[3]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[3]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [3]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_15
       (.I0(z_mul_itm_1_reg[2]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[2]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [2]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_16
       (.I0(z_mul_itm_1_reg[1]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[1]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [1]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_17
       (.I0(z_mul_itm_1_reg[0]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[0]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_2
       (.I0(z_mul_itm_1_reg[15]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[15]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [15]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_3
       (.I0(z_mul_itm_1_reg[14]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[14]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [14]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_4
       (.I0(z_mul_itm_1_reg[13]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[13]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [13]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_5
       (.I0(z_mul_itm_1_reg[12]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[12]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [12]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_6
       (.I0(z_mul_itm_1_reg[11]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[11]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [11]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_7
       (.I0(z_mul_itm_1_reg[10]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[10]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [10]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_8
       (.I0(z_mul_itm_1_reg[9]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[9]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [9]));
  LUT3 #(
    .INIT(8'hB8)) 
    nl_z_mul_itm_1_i_9
       (.I0(z_mul_itm_1_reg[8]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[8]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[16] [8]));
  LUT5 #(
    .INIT(32'hFFFF0082)) 
    nl_z_mul_nl_i_1
       (.I0(nl_z_mul_nl_i_6_n_0),
        .I1(input_147_in),
        .I2(\state_var_reg_rep[6]_0 ),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(nl_z_mul_nl_i_7_n_0),
        .O(reg_complete_rsci_oswt_cse_reg));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h000D)) 
    nl_z_mul_nl_i_6
       (.I0(\return_rsci_d_reg[0] ),
        .I1(complete_rsc_rdy),
        .I2(sel33_in),
        .I3(vec_rsc_wea_INST_0_i_1_n_0),
        .O(nl_z_mul_nl_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFEEFEE000000000)) 
    nl_z_mul_nl_i_7
       (.I0(vec_rsc_wea_INST_0_i_1_n_0),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(p_0_in[0]),
        .I3(sel33_in),
        .I4(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ),
        .I5(\COMP_LOOP_twiddle_f_1_sva[31]_i_6_n_0 ),
        .O(nl_z_mul_nl_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFF6FEFF00000000)) 
    nl_z_out_1_i_1
       (.I0(p_0_in[3]),
        .I1(p_0_in[0]),
        .I2(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I3(p_0_in[2]),
        .I4(p_0_in[1]),
        .I5(nl_z_out_1_0[7]),
        .O(B[10]));
  LUT6 #(
    .INIT(64'hFEFEFFFFFCCCFCCC)) 
    nl_z_out_1_i_10
       (.I0(nl_z_out_1_i_32_n_0),
        .I1(nl_z_out_1_i_30_n_0),
        .I2(p_0_in[2]),
        .I3(nl_z_out_1_i_33_n_0),
        .I4(input_037_in),
        .I5(nl_z_out_1_0[0]),
        .O(B[1]));
  LUT6 #(
    .INIT(64'hFFFFFEFCFFFFFFF9)) 
    nl_z_out_1_i_11
       (.I0(state_var[3]),
        .I1(state_var[4]),
        .I2(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I3(state_var[6]),
        .I4(state_var[7]),
        .I5(state_var[5]),
        .O(B[0]));
  LUT5 #(
    .INIT(32'hF8888888)) 
    nl_z_out_1_i_12
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(Q[3]),
        .I3(nl_z_out_1),
        .I4(nl_z_out_1_i_36_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [11]));
  LUT6 #(
    .INIT(64'hFFFFC080C080C080)) 
    nl_z_out_1_i_13
       (.I0(nl_z_out_1_i_36_n_0),
        .I1(nl_z_out_1_1),
        .I2(Q[3]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I4(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[10]),
        .I5(nl_z_out_1_i_35_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [10]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_14
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[9]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[9]),
        .I4(nl_z_out_1_i_37_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [9]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_15
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[8]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[8]),
        .I4(nl_z_out_1_i_38_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [8]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_16
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]),
        .I4(nl_z_out_1_i_39_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [7]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_17
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[6]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[6]),
        .I4(nl_z_out_1_i_40_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [6]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_18
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[5]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[5]),
        .I4(nl_z_out_1_i_41_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [5]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_19
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[4]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[4]),
        .I4(nl_z_out_1_i_42_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [4]));
  LUT4 #(
    .INIT(16'hF888)) 
    nl_z_out_1_i_2
       (.I0(nl_z_out_1_0[6]),
        .I1(nl_z_out_1_i_28_n_0),
        .I2(nl_z_out_1_0[7]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .O(B[9]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_20
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[3]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[3]),
        .I4(nl_z_out_1_i_43_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [3]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_21
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[2]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[2]),
        .I4(nl_z_out_1_i_44_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [2]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_22
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[1]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[1]),
        .I4(nl_z_out_1_i_45_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [1]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    nl_z_out_1_i_23
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[0]),
        .I1(nl_z_out_1_i_35_n_0),
        .I2(nl_z_out_1_i_29_n_0),
        .I3(COMP_LOOP_5_twiddle_f_lshift_ncse_sva[0]),
        .I4(nl_z_out_1_i_46_n_0),
        .O(\COMP_LOOP_2_twiddle_f_lshift_ncse_sva_reg[11] [0]));
  LUT2 #(
    .INIT(4'h2)) 
    nl_z_out_1_i_24
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    nl_z_out_1_i_25
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    nl_z_out_1_i_26
       (.I0(state_var[5]),
        .I1(state_var[7]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    nl_z_out_1_i_27
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .O(p_0_in[1]));
  LUT6 #(
    .INIT(64'hFFFFFDFFFFFFFFF9)) 
    nl_z_out_1_i_28
       (.I0(state_var[4]),
        .I1(state_var[5]),
        .I2(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I3(state_var[3]),
        .I4(state_var[7]),
        .I5(state_var[6]),
        .O(nl_z_out_1_i_28_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    nl_z_out_1_i_29
       (.I0(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .I1(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(nl_z_out_1_i_29_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_1_i_3
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(nl_z_out_1_0[6]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(nl_z_out_1_0[5]),
        .I4(nl_z_out_1_0[7]),
        .I5(nl_z_out_1_i_29_n_0),
        .O(B[8]));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    nl_z_out_1_i_30
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I1(state_var[3]),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ),
        .O(nl_z_out_1_i_30_n_0));
  LUT6 #(
    .INIT(64'hFEFE0000FFFE0000)) 
    nl_z_out_1_i_31
       (.I0(p_0_in[3]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I4(nl_z_out_1_0[1]),
        .I5(p_0_in[0]),
        .O(nl_z_out_1_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    nl_z_out_1_i_32
       (.I0(state_var[6]),
        .I1(state_var[0]),
        .I2(state_var[7]),
        .I3(state_var[2]),
        .I4(state_var[1]),
        .O(nl_z_out_1_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    nl_z_out_1_i_33
       (.I0(state_var[6]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I2(state_var[3]),
        .I3(state_var[7]),
        .I4(vec_rsc_wea_INST_0_i_2_n_0),
        .O(nl_z_out_1_i_33_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h32)) 
    nl_z_out_1_i_34
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .O(input_037_in));
  LUT6 #(
    .INIT(64'h00000000000E0040)) 
    nl_z_out_1_i_35
       (.I0(p_0_in[1]),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(p_0_in[0]),
        .I5(vec_rsc_wea_INST_0_i_2_n_0),
        .O(nl_z_out_1_i_35_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    nl_z_out_1_i_36
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(state_var[3]),
        .I3(state_var[6]),
        .I4(state_var[7]),
        .I5(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .O(nl_z_out_1_i_36_n_0));
  LUT6 #(
    .INIT(64'h00000C0000000800)) 
    nl_z_out_1_i_37
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_37_n_0));
  LUT6 #(
    .INIT(64'h0000000C00000008)) 
    nl_z_out_1_i_38
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_38_n_0));
  LUT6 #(
    .INIT(64'h0000C00000008000)) 
    nl_z_out_1_i_39
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_39_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_1_i_4
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(nl_z_out_1_0[5]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(nl_z_out_1_0[4]),
        .I4(nl_z_out_1_0[6]),
        .I5(nl_z_out_1_i_29_n_0),
        .O(B[7]));
  LUT6 #(
    .INIT(64'h00000C0000000800)) 
    nl_z_out_1_i_40
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_40_n_0));
  LUT6 #(
    .INIT(64'h00000C0000000800)) 
    nl_z_out_1_i_41
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_41_n_0));
  LUT6 #(
    .INIT(64'h0000030000000200)) 
    nl_z_out_1_i_42
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_42_n_0));
  LUT6 #(
    .INIT(64'h0000300000002000)) 
    nl_z_out_1_i_43
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_43_n_0));
  LUT6 #(
    .INIT(64'h0000003000000020)) 
    nl_z_out_1_i_44
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_44_n_0));
  LUT6 #(
    .INIT(64'h0000003000000020)) 
    nl_z_out_1_i_45
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_45_n_0));
  LUT6 #(
    .INIT(64'h0000000300000002)) 
    nl_z_out_1_i_46
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(nl_z_out_1_i_36_n_0),
        .O(nl_z_out_1_i_46_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_1_i_5
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(nl_z_out_1_0[4]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(nl_z_out_1_0[3]),
        .I4(nl_z_out_1_0[5]),
        .I5(nl_z_out_1_i_29_n_0),
        .O(B[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_1_i_6
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(nl_z_out_1_0[3]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(nl_z_out_1_0[2]),
        .I4(nl_z_out_1_0[4]),
        .I5(nl_z_out_1_i_29_n_0),
        .O(B[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_1_i_7
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(nl_z_out_1_0[2]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .I4(nl_z_out_1_0[3]),
        .I5(nl_z_out_1_i_29_n_0),
        .O(B[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_1_i_8
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(nl_z_out_1_0[1]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(nl_z_out_1_0[0]),
        .I4(nl_z_out_1_0[2]),
        .I5(nl_z_out_1_i_29_n_0),
        .O(B[3]));
  LUT4 #(
    .INIT(16'hFFEA)) 
    nl_z_out_1_i_9
       (.I0(nl_z_out_1_i_30_n_0),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I2(nl_z_out_1_0[0]),
        .I3(nl_z_out_1_i_31_n_0),
        .O(B[2]));
  LUT6 #(
    .INIT(64'hFEF7FFF600000000)) 
    nl_z_out_2_i_1
       (.I0(p_0_in[3]),
        .I1(p_0_in[0]),
        .I2(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(nl_z_out_1_0[7]),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [10]));
  LUT6 #(
    .INIT(64'hEEEEEEEEEAEAEEEA)) 
    nl_z_out_2_i_10
       (.I0(nl_z_out_2_i_26_n_0),
        .I1(nl_z_out_1_0[1]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I3(state_var[3]),
        .I4(state_var[7]),
        .I5(vec_rsc_wea_INST_0_i_2_n_0),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [1]));
  LUT6 #(
    .INIT(64'hFFFFAAAAFFFBAAAA)) 
    nl_z_out_2_i_11
       (.I0(nl_z_out_2_i_27_n_0),
        .I1(state_var[6]),
        .I2(state_var[7]),
        .I3(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I4(nl_z_out_1_0[0]),
        .I5(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [0]));
  LUT6 #(
    .INIT(64'hFEF7FFF600000000)) 
    nl_z_out_2_i_12
       (.I0(p_0_in[3]),
        .I1(p_0_in[0]),
        .I2(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11]),
        .O(A[11]));
  LUT4 #(
    .INIT(16'hF888)) 
    nl_z_out_2_i_13
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[10]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[10]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[10]));
  LUT4 #(
    .INIT(16'hF888)) 
    nl_z_out_2_i_14
       (.I0(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[9]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[9]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_15
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_2),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[8]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[8]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_16
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_8),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[7]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_17
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_7),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[6]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[6]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_18
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_6),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[5]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[5]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_19
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_0),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[4]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[4]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[4]));
  LUT4 #(
    .INIT(16'hF888)) 
    nl_z_out_2_i_2
       (.I0(nl_z_out_1_0[6]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(nl_z_out_1_0[7]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_20
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_5),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[3]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[3]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_21
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_4),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[2]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[2]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_22
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_3),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[1]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[1]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_23
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_2_1),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(COMP_LOOP_2_twiddle_f_lshift_ncse_sva[0]),
        .I4(COMP_LOOP_3_twiddle_f_lshift_ncse_sva[0]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(A[0]));
  LUT6 #(
    .INIT(64'hAEAEAAAAFFAAAAAA)) 
    nl_z_out_2_i_24
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I1(p_0_in[2]),
        .I2(reg_twiddle_rsci_oswt_cse_i_2_n_0),
        .I3(nl_z_out_2_i_37_n_0),
        .I4(nl_z_out_1_0[0]),
        .I5(p_0_in[1]),
        .O(nl_z_out_2_i_24_n_0));
  LUT6 #(
    .INIT(64'hFAF70000FFF70000)) 
    nl_z_out_2_i_25
       (.I0(state_var[3]),
        .I1(state_var[6]),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .I4(nl_z_out_1_0[2]),
        .I5(state_var[5]),
        .O(nl_z_out_2_i_25_n_0));
  LUT6 #(
    .INIT(64'hFEFE22F2323222F2)) 
    nl_z_out_2_i_26
       (.I0(nl_z_out_2_i_37_n_0),
        .I1(p_0_in[1]),
        .I2(nl_z_out_1_0[1]),
        .I3(p_0_in[3]),
        .I4(p_0_in[2]),
        .I5(nl_z_out_2_i_38_n_0),
        .O(nl_z_out_2_i_26_n_0));
  LUT6 #(
    .INIT(64'h00000000002000C8)) 
    nl_z_out_2_i_27
       (.I0(p_0_in[3]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(p_0_in[0]),
        .I5(vec_rsc_wea_INST_0_i_2_n_0),
        .O(nl_z_out_2_i_27_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    nl_z_out_2_i_3
       (.I0(nl_z_out_1_0[5]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(nl_z_out_1_0[6]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [8]));
  LUT5 #(
    .INIT(32'h00100000)) 
    nl_z_out_2_i_37
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(state_var[3]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .O(nl_z_out_2_i_37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    nl_z_out_2_i_38
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(state_var[3]),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .O(nl_z_out_2_i_38_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_4
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_1_0[7]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(nl_z_out_1_0[4]),
        .I4(nl_z_out_1_0[5]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_5
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_1_0[6]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(nl_z_out_1_0[3]),
        .I4(nl_z_out_1_0[4]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_6
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_1_0[5]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(nl_z_out_1_0[2]),
        .I4(nl_z_out_1_0[3]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_7
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_1_0[4]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .I4(nl_z_out_1_0[2]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    nl_z_out_2_i_8
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(nl_z_out_1_0[3]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I3(nl_z_out_1_0[0]),
        .I4(nl_z_out_1_0[1]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [3]));
  LUT4 #(
    .INIT(16'hFEEE)) 
    nl_z_out_2_i_9
       (.I0(nl_z_out_2_i_24_n_0),
        .I1(nl_z_out_2_i_25_n_0),
        .I2(nl_z_out_1_0[2]),
        .I3(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[7] [2]));
  LUT2 #(
    .INIT(4'h8)) 
    \p_buf_sva_1[31]_i_1 
       (.I0(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .I1(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat),
        .O(p_and_1_cse));
  LUT4 #(
    .INIT(16'h0040)) 
    reg_complete_rsci_oswt_cse_i_1
       (.I0(\vec_rsc_adra[0]_INST_0_i_3_n_0 ),
        .I1(reg_complete_rsci_oswt_cse_i_2_n_0),
        .I2(sel33_in),
        .I3(vec_rsc_wea_INST_0_i_1_n_0),
        .O(reg_complete_rsci_oswt_cse0));
  LUT5 #(
    .INIT(32'h01000000)) 
    reg_complete_rsci_oswt_cse_i_2
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [1]),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [2]),
        .I3(input_147_in),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .O(reg_complete_rsci_oswt_cse_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h0600)) 
    reg_ensig_cgo_1_cse_i_1
       (.I0(state_var[1]),
        .I1(state_var[0]),
        .I2(state_var[7]),
        .I3(state_var[2]),
        .O(and_132_rmff));
  LUT6 #(
    .INIT(64'h80AAF0F001AA0202)) 
    reg_ensig_cgo_cse_i_1
       (.I0(\state_var_reg_rep[6]_0 ),
        .I1(state_var[0]),
        .I2(state_var[2]),
        .I3(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I4(state_var[7]),
        .I5(state_var[1]),
        .O(MUX_s_1_2_2_return));
  LUT6 #(
    .INIT(64'h00000000D5550303)) 
    reg_run_rsci_oswt_cse_i_1
       (.I0(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I1(state_var[2]),
        .I2(state_var[1]),
        .I3(state_var[0]),
        .I4(state_var[7]),
        .I5(\vec_rsc_adra[0]_INST_0_i_3_n_0 ),
        .O(\state_var_reg_rep[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h8)) 
    reg_twiddle_rsci_oswt_1_cse_i_1
       (.I0(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .I1(reg_twiddle_rsci_oswt_cse_reg[12]),
        .O(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1]));
  LUT6 #(
    .INIT(64'hF7F0F7F0FFF0F7F0)) 
    reg_twiddle_rsci_oswt_cse_i_1
       (.I0(nl_z_out_1_i_32_n_0),
        .I1(reg_twiddle_rsci_oswt_cse_i_2_n_0),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I3(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I4(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I5(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .O(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    reg_twiddle_rsci_oswt_cse_i_2
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .I2(state_var[1]),
        .I3(state_var[2]),
        .I4(state_var[0]),
        .O(reg_twiddle_rsci_oswt_cse_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    reg_vec_rsc_triosy_obj_iswt0_cse_i_1
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[2]),
        .I4(state_var[1]),
        .I5(\state_var_reg_rep[6]_0 ),
        .O(reg_vec_rsc_triosy_obj_iswt0_cse0));
  LUT1 #(
    .INIT(2'h1)) 
    reg_vec_rsci_oswt_1_cse_i_1
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .O(p_238_in));
  LUT4 #(
    .INIT(16'h10FF)) 
    reg_vec_rsci_oswt_cse_i_1
       (.I0(vec_rsc_wea_INST_0_i_2_n_0),
        .I1(input_147_in),
        .I2(sel33_in),
        .I3(\state_var_reg_rep[0]_0 ),
        .O(nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hCF8A)) 
    \return_rsci_d[31]_i_1 
       (.I0(reg_ensig_cgo_cse),
        .I1(complete_rsc_rdy),
        .I2(\return_rsci_d_reg[0] ),
        .I3(MUX_s_1_2_2_return),
        .O(COMP_LOOP_1_mult_cmp_ccs_ccore_en));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    run_ac_sync_tmp_dobj_sva_i_2
       (.I0(complete_rsc_rdy_0),
        .I1(state_var[1]),
        .I2(state_var[2]),
        .I3(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I4(state_var[7]),
        .I5(state_var[0]),
        .O(\state_var_reg_rep[1]_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[0] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[0]),
        .Q(state_var[0]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[1] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[1]),
        .Q(state_var[1]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[2] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[2]),
        .Q(state_var[2]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[3] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[3]),
        .Q(state_var[3]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[4] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[4]),
        .Q(state_var[4]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[5] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[5]),
        .Q(state_var[5]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[6] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[6]),
        .Q(state_var[6]),
        .R(rst));
  (* equivalent_register_removal = "no" *) 
  FDRE \state_var_reg_rep[7] 
       (.C(clk),
        .CE(complete_rsc_rdy_0),
        .D(state_var_NS[7]),
        .Q(state_var[7]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \state_var_reg_rep[7]_i_12 
       (.CI(\state_var_reg_rep[7]_i_16_n_0 ),
        .CO({\NLW_state_var_reg_rep[7]_i_12_CO_UNCONNECTED [3],\state_var_reg_rep[7]_i_12_n_1 ,\state_var_reg_rep[7]_i_12_n_2 ,\state_var_reg_rep[7]_i_12_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,z_out_14[7:5]}),
        .O({COMP_LOOP_1_acc_nl,\NLW_state_var_reg_rep[7]_i_12_O_UNCONNECTED [2:0]}),
        .S({\state_var_rep[7]_i_17_n_0 ,\state_var_rep[7]_i_18_n_0 ,\state_var_rep[7]_i_19_n_0 ,\state_var_rep[7]_i_20_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \state_var_reg_rep[7]_i_16 
       (.CI(\state_var_reg_rep[7]_i_22_n_0 ),
        .CO({\state_var_reg_rep[7]_i_16_n_0 ,\state_var_reg_rep[7]_i_16_n_1 ,\state_var_reg_rep[7]_i_16_n_2 ,\state_var_reg_rep[7]_i_16_n_3 }),
        .CYINIT(1'b0),
        .DI(z_out_14[4:1]),
        .O(\NLW_state_var_reg_rep[7]_i_16_O_UNCONNECTED [3:0]),
        .S({\state_var_rep[7]_i_23_n_0 ,\state_var_rep[7]_i_24_n_0 ,\state_var_rep[7]_i_25_n_0 ,\state_var_rep[7]_i_26_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \state_var_reg_rep[7]_i_22 
       (.CI(1'b0),
        .CO({\state_var_reg_rep[7]_i_22_n_0 ,\state_var_reg_rep[7]_i_22_n_1 ,\state_var_reg_rep[7]_i_22_n_2 ,\state_var_reg_rep[7]_i_22_n_3 }),
        .CYINIT(\state_var_rep[7]_i_27_n_0 ),
        .DI({z_out_14[0],1'b0,1'b0,1'b0}),
        .O(\NLW_state_var_reg_rep[7]_i_22_O_UNCONNECTED [3:0]),
        .S({\state_var_rep[7]_i_28_n_0 ,\state_var_rep[7]_i_29_n_0 ,\state_var_rep[7]_i_30_n_0 ,\state_var_rep[7]_i_31_n_0 }));
  LUT6 #(
    .INIT(64'hEE00AA00BAFDFFFF)) 
    \state_var_rep[0]_i_1 
       (.I0(\state_var_rep[1]_i_2_n_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I2(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[0] ),
        .O(state_var_NS[0]));
  LUT6 #(
    .INIT(64'hCCCFDCFCCCCCDCFC)) 
    \state_var_rep[1]_i_1 
       (.I0(\state_var_rep[1]_i_2_n_0 ),
        .I1(\state_var_rep[1]_i_3_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(state_var_NS[1]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_var_rep[1]_i_2 
       (.I0(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[3] ),
        .O(\state_var_rep[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000B0000)) 
    \state_var_rep[1]_i_3 
       (.I0(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I1(\state_var_rep[1]_i_2_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I5(\state_var_rep[1]_i_4_n_0 ),
        .O(\state_var_rep[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h880F880088008800)) 
    \state_var_rep[1]_i_4 
       (.I0(\state_var_rep[7]_i_4_n_0 ),
        .I1(COMP_LOOP_1_acc_nl),
        .I2(\state_var_rep[1]_i_2_n_0 ),
        .I3(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I4(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I5(\state_var_rep[7]_i_10_n_0 ),
        .O(\state_var_rep[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEEEFEE)) 
    \state_var_rep[2]_i_1 
       (.I0(\state_var_rep[2]_i_2_n_0 ),
        .I1(\state_var_rep[7]_i_5_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I5(\state_var_rep[2]_i_3_n_0 ),
        .O(state_var_NS[2]));
  LUT6 #(
    .INIT(64'hAAAAAEAEFFAAAAAA)) 
    \state_var_rep[2]_i_2 
       (.I0(\state_var_rep[2]_i_4_n_0 ),
        .I1(\state_var_rep[2]_i_5_n_0 ),
        .I2(\state_var_rep[1]_i_2_n_0 ),
        .I3(\state_var_rep[7]_i_9_n_0 ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000F020200000000)) 
    \state_var_rep[2]_i_3 
       (.I0(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I1(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I2(\state_var_rep[1]_i_2_n_0 ),
        .I3(COMP_LOOP_1_acc_nl),
        .I4(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I5(\state_var_rep[7]_i_10_n_0 ),
        .O(\state_var_rep[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF000008190000)) 
    \state_var_rep[2]_i_4 
       (.I0(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I1(\state_var_rep[1]_i_2_n_0 ),
        .I2(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I3(\FSM_sequential_state_var_reg[2]_0 ),
        .I4(\state_var_rep[6]_i_4_n_0 ),
        .I5(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0004)) 
    \state_var_rep[2]_i_5 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [2]),
        .I3(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [1]),
        .I4(\FSM_sequential_state_var_reg_n_0_[0] ),
        .O(\state_var_rep[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF80)) 
    \state_var_rep[3]_i_1 
       (.I0(\state_var_rep[6]_i_4_n_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I3(\state_var_rep[3]_i_2_n_0 ),
        .I4(\state_var_rep[3]_i_3_n_0 ),
        .I5(\state_var_rep[3]_i_4_n_0 ),
        .O(state_var_NS[3]));
  LUT6 #(
    .INIT(64'h00800C8000800080)) 
    \state_var_rep[3]_i_2 
       (.I0(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I1(\state_var_rep[7]_i_9_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I5(\STAGE_LOOP_lshift_psp_sva_reg[12] [12]),
        .O(\state_var_rep[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA003CAAAA0000)) 
    \state_var_rep[3]_i_3 
       (.I0(\state_var_rep[6]_i_9_n_0 ),
        .I1(\state_var_rep[7]_i_11_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I5(\state_var_rep[5]_i_4_n_0 ),
        .O(\state_var_rep[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000C8888888)) 
    \state_var_rep[3]_i_4 
       (.I0(\state_var_rep[4]_i_7_n_0 ),
        .I1(\state_var_rep[7]_i_7_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I3(acc_10_nl__0[9]),
        .I4(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFAE)) 
    \state_var_rep[4]_i_1 
       (.I0(\state_var_rep[4]_i_2_n_0 ),
        .I1(\state_var_rep[6]_i_4_n_0 ),
        .I2(\state_var_rep[4]_i_3_n_0 ),
        .I3(\state_var_rep[4]_i_4_n_0 ),
        .I4(\state_var_rep[4]_i_5_n_0 ),
        .I5(\state_var_rep[6]_i_2_n_0 ),
        .O(state_var_NS[4]));
  LUT6 #(
    .INIT(64'hFFFF808033008080)) 
    \state_var_rep[4]_i_2 
       (.I0(\state_var_rep[7]_i_9_n_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I2(\state_var_rep[4]_i_6_n_0 ),
        .I3(\state_var_rep[6]_i_8_n_0 ),
        .I4(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I5(\state_var_rep[6]_i_9_n_0 ),
        .O(\state_var_rep[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \state_var_rep[4]_i_3 
       (.I0(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[4] ),
        .O(\state_var_rep[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h00080000)) 
    \state_var_rep[4]_i_4 
       (.I0(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I4(\state_var_rep[4]_i_7_n_0 ),
        .O(\state_var_rep[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1010100000000000)) 
    \state_var_rep[4]_i_5 
       (.I0(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I2(\state_var_rep[6]_i_4_n_0 ),
        .I3(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I5(\state_var_rep[5]_i_4_n_0 ),
        .O(\state_var_rep[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \state_var_rep[4]_i_6 
       (.I0(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \state_var_rep[4]_i_7 
       (.I0(acc_10_nl__0[10]),
        .I1(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I3(\VEC_LOOP_acc_1_cse_10_sva_reg[10] ),
        .O(\state_var_rep[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \state_var_rep[5]_i_1 
       (.I0(\state_var_rep[6]_i_2_n_0 ),
        .I1(\state_var_rep[5]_i_2_n_0 ),
        .I2(\state_var_rep[5]_i_3_n_0 ),
        .I3(\state_var_rep[5]_i_4_n_0 ),
        .I4(\state_var_rep[6]_i_3_n_0 ),
        .I5(\FSM_sequential_state_var_reg_n_0_[5] ),
        .O(state_var_NS[5]));
  LUT6 #(
    .INIT(64'h00880F0000880000)) 
    \state_var_rep[5]_i_2 
       (.I0(\state_var_rep[7]_i_7_n_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I5(\state_var_rep[5]_i_5_n_0 ),
        .O(\state_var_rep[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \state_var_rep[5]_i_3 
       (.I0(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[3] ),
        .O(\state_var_rep[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \state_var_rep[5]_i_4 
       (.I0(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I2(reg_twiddle_rsci_oswt_cse_reg[12]),
        .O(\state_var_rep[5]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \state_var_rep[5]_i_5 
       (.I0(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I1(acc_10_nl__0[10]),
        .I2(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[3] ),
        .O(\state_var_rep[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEAAEEAA)) 
    \state_var_rep[6]_i_1 
       (.I0(\state_var_rep[6]_i_2_n_0 ),
        .I1(\state_var_rep[6]_i_3_n_0 ),
        .I2(\state_var_rep[6]_i_4_n_0 ),
        .I3(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I5(\state_var_rep[6]_i_5_n_0 ),
        .O(state_var_NS[6]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \state_var_rep[6]_i_10 
       (.I0(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[5] ),
        .O(\state_var_rep[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0200020002020200)) 
    \state_var_rep[6]_i_11 
       (.I0(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I4(\VEC_LOOP_acc_1_cse_10_sva_reg[10] ),
        .I5(\state_var_rep[4]_i_3_n_0 ),
        .O(\state_var_rep[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAAEA)) 
    \state_var_rep[6]_i_2 
       (.I0(\state_var_rep[6]_i_6_n_0 ),
        .I1(\state_var_rep[6]_i_7_n_0 ),
        .I2(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I4(\state_var_rep[4]_i_3_n_0 ),
        .I5(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2A2A2AFE)) 
    \state_var_rep[6]_i_3 
       (.I0(\state_var_rep[6]_i_8_n_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I5(\state_var_rep[6]_i_9_n_0 ),
        .O(\state_var_rep[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \state_var_rep[6]_i_4 
       (.I0(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[7] ),
        .O(\state_var_rep[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'hFFFF0080)) 
    \state_var_rep[6]_i_5 
       (.I0(\state_var_rep[6]_i_10_n_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I4(\state_var_rep[6]_i_11_n_0 ),
        .O(\state_var_rep[6]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \state_var_rep[6]_i_6 
       (.I0(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I1(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I2(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I4(\state_var_rep[1]_i_2_n_0 ),
        .O(\state_var_rep[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \state_var_rep[6]_i_7 
       (.I0(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I1(acc_10_nl__0[9]),
        .O(\state_var_rep[6]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h00EA)) 
    \state_var_rep[6]_i_8 
       (.I0(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[12] [12]),
        .I2(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .O(\state_var_rep[6]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h005D)) 
    \state_var_rep[6]_i_9 
       (.I0(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I1(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I2(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[7] ),
        .O(\state_var_rep[6]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEFE)) 
    \state_var_rep[7]_i_1 
       (.I0(\state_var_rep[7]_i_2_n_0 ),
        .I1(\state_var_rep[7]_i_3_n_0 ),
        .I2(\state_var_rep[7]_i_4_n_0 ),
        .I3(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I4(\state_var_rep[7]_i_5_n_0 ),
        .I5(\state_var_rep[7]_i_6_n_0 ),
        .O(state_var_NS[7]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_var_rep[7]_i_10 
       (.I0(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[7]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \state_var_rep[7]_i_11 
       (.I0(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[4] ),
        .O(\state_var_rep[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \state_var_rep[7]_i_13 
       (.I0(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[4] ),
        .O(\state_var_rep[7]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAABAA)) 
    \state_var_rep[7]_i_14 
       (.I0(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I1(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [1]),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [2]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I4(\STAGE_LOOP_lshift_psp_sva_reg[12]_0 [0]),
        .I5(\FSM_sequential_state_var_reg_n_0_[1] ),
        .O(\state_var_rep[7]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h00000000888888F8)) 
    \state_var_rep[7]_i_15 
       (.I0(\state_var_rep[7]_i_4_n_0 ),
        .I1(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I2(\state_var_rep[7]_i_21_n_0 ),
        .I3(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I4(\FSM_sequential_state_var_reg[2]_0 ),
        .I5(\FSM_sequential_state_var_reg_n_0_[0] ),
        .O(\state_var_rep[7]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \state_var_rep[7]_i_17 
       (.I0(z_out_14__0),
        .O(\state_var_rep[7]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_18 
       (.I0(z_out_14[7]),
        .I1(p_0_in2_in[11]),
        .O(\state_var_rep[7]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_19 
       (.I0(z_out_14[6]),
        .I1(p_0_in2_in[10]),
        .O(\state_var_rep[7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    \state_var_rep[7]_i_2 
       (.I0(\state_var_rep[7]_i_7_n_0 ),
        .I1(\VEC_LOOP_acc_1_cse_10_sva_reg[10] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .I5(\state_var_rep[7]_i_8_n_0 ),
        .O(\state_var_rep[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_20 
       (.I0(z_out_14[5]),
        .I1(p_0_in2_in[9]),
        .O(\state_var_rep[7]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \state_var_rep[7]_i_21 
       (.I0(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[1] ),
        .O(\state_var_rep[7]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_23 
       (.I0(z_out_14[4]),
        .I1(p_0_in2_in[8]),
        .O(\state_var_rep[7]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_24 
       (.I0(z_out_14[3]),
        .I1(p_0_in2_in[7]),
        .O(\state_var_rep[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_25 
       (.I0(z_out_14[2]),
        .I1(p_0_in2_in[6]),
        .O(\state_var_rep[7]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_26 
       (.I0(z_out_14[1]),
        .I1(p_0_in2_in[5]),
        .O(\state_var_rep[7]_i_26_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \state_var_rep[7]_i_27 
       (.I0(p_0_in2_in[0]),
        .O(\state_var_rep[7]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \state_var_rep[7]_i_28 
       (.I0(z_out_14[0]),
        .I1(p_0_in2_in[4]),
        .O(\state_var_rep[7]_i_28_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \state_var_rep[7]_i_29 
       (.I0(p_0_in2_in[3]),
        .O(\state_var_rep[7]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0000080008080800)) 
    \state_var_rep[7]_i_3 
       (.I0(\state_var_rep[7]_i_9_n_0 ),
        .I1(\state_var_rep[7]_i_10_n_0 ),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[12] [12]),
        .I3(\state_var_rep[7]_i_11_n_0 ),
        .I4(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[4] ),
        .O(\state_var_rep[7]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \state_var_rep[7]_i_30 
       (.I0(p_0_in2_in[2]),
        .O(\state_var_rep[7]_i_30_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \state_var_rep[7]_i_31 
       (.I0(p_0_in2_in[1]),
        .O(\state_var_rep[7]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \state_var_rep[7]_i_4 
       (.I0(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[5] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[3] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h44404040)) 
    \state_var_rep[7]_i_5 
       (.I0(\FSM_sequential_state_var_reg[2]_0 ),
        .I1(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I2(\state_var_rep[1]_i_2_n_0 ),
        .I3(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[2] ),
        .O(\state_var_rep[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF000400)) 
    \state_var_rep[7]_i_6 
       (.I0(COMP_LOOP_1_acc_nl),
        .I1(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I3(\state_var_rep[7]_i_13_n_0 ),
        .I4(\state_var_rep[7]_i_14_n_0 ),
        .I5(\state_var_rep[7]_i_15_n_0 ),
        .O(\state_var_rep[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \state_var_rep[7]_i_7 
       (.I0(\FSM_sequential_state_var_reg_n_0_[7] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I2(\FSM_sequential_state_var_reg_n_0_[4] ),
        .I3(\FSM_sequential_state_var_reg_n_0_[3] ),
        .O(\state_var_rep[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCC00440C00000000)) 
    \state_var_rep[7]_i_8 
       (.I0(acc_10_nl__0[9]),
        .I1(\state_var_rep[6]_i_10_n_0 ),
        .I2(acc_10_nl__0[10]),
        .I3(\FSM_sequential_state_var_reg_n_0_[6] ),
        .I4(\FSM_sequential_state_var_reg_n_0_[2] ),
        .I5(\FSM_sequential_state_var_reg_n_0_[1] ),
        .O(\state_var_rep[7]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_var_rep[7]_i_9 
       (.I0(\FSM_sequential_state_var_reg_n_0_[0] ),
        .I1(\FSM_sequential_state_var_reg_n_0_[7] ),
        .O(\state_var_rep[7]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \twiddle_h_rsc_adra[0]_INST_0 
       (.I0(P[0]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [0]),
        .I4(\twiddle_h_rsc_adra[0]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \twiddle_h_rsc_adra[0]_INST_0_i_1 
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(state_var[2]),
        .I3(state_var[1]),
        .O(\twiddle_h_rsc_adra[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h080F000002000000)) 
    \twiddle_h_rsc_adra[0]_INST_0_i_2 
       (.I0(state_var[5]),
        .I1(state_var[4]),
        .I2(state_var[7]),
        .I3(state_var[6]),
        .I4(\twiddle_h_rsc_adra[11] [0]),
        .I5(state_var[3]),
        .O(\twiddle_h_rsc_adra[0]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[10]_INST_0 
       (.I0(\twiddle_h_rsc_adra[10]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[10]),
        .I3(\twiddle_h_rsc_adra[10]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_3_n_4 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [9]),
        .I4(\vec_rsc_adra[11]_1 [7]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_1_n_0 ));
  CARRY4 \twiddle_h_rsc_adra[10]_INST_0_i_10 
       (.CI(1'b0),
        .CO({\twiddle_h_rsc_adra[10]_INST_0_i_10_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_10_n_1 ,\twiddle_h_rsc_adra[10]_INST_0_i_10_n_2 ,\twiddle_h_rsc_adra[10]_INST_0_i_10_n_3 }),
        .CYINIT(1'b0),
        .DI({\twiddle_h_rsc_adra[10]_INST_0_i_18_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_19_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_20_n_0 ,1'b0}),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[4] ),
        .S({\twiddle_h_rsc_adra[10]_INST_0_i_21_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_22_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_23_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_24_n_0 }));
  LUT6 #(
    .INIT(64'hEAC0800080008000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_11 
       (.I0(nl_z_out_1_0[2]),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_25_n_0 ),
        .I2(nl_z_out_1_0[0]),
        .I3(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I4(nl_z_out_1_0[1]),
        .I5(\twiddle_h_rsc_adra[10]_INST_0_i_26_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_12 
       (.I0(nl_z_out_1_0[2]),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .I2(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .I4(\twiddle_h_rsc_adra[10]_INST_0_i_26_n_0 ),
        .I5(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_13 
       (.I0(nl_z_out_1_0[2]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I2(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .I4(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .I5(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E817E817)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_14 
       (.I0(\twiddle_h_rsc_adra[10]_INST_0_i_27_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_28_n_0 ),
        .I2(\twiddle_h_rsc_adra[10]_INST_0_i_29_n_0 ),
        .I3(\twiddle_h_rsc_adra[10]_INST_0_i_30_n_0 ),
        .I4(nl_z_out_1_0[0]),
        .I5(\twiddle_h_rsc_adra[10]_INST_0_i_31_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h0CA7F358)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_15 
       (.I0(\twiddle_h_rsc_adra[10]_INST_0_i_32_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_33_n_0 ),
        .I2(\twiddle_h_rsc_adra[10]_INST_0_i_28_n_0 ),
        .I3(\twiddle_h_rsc_adra[10]_INST_0_i_29_n_0 ),
        .I4(\twiddle_h_rsc_adra[10]_INST_0_i_27_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hCE3131CE)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_16 
       (.I0(\twiddle_h_rsc_adra[10]_INST_0_i_33_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_32_n_0 ),
        .I2(\twiddle_h_rsc_adra[10]_INST_0_i_34_n_0 ),
        .I3(\twiddle_h_rsc_adra[10]_INST_0_i_35_n_0 ),
        .I4(\twiddle_h_rsc_adra[10]_INST_0_i_36_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hE11E)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_17 
       (.I0(\twiddle_h_rsc_adra[10]_INST_0_i_37_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_32_n_0 ),
        .I2(\twiddle_h_rsc_adra[10]_INST_0_i_34_n_0 ),
        .I3(\twiddle_h_rsc_adra[10]_INST_0_i_33_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_18 
       (.I0(nl_z_out_1_0[4]),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .I2(nl_z_out_1_0[5]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I4(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I5(nl_z_out_1_0[3]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_19 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I1(nl_z_out_1_0[4]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(nl_z_out_1_0[5]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[9]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [10]),
        .I4(\twiddle_h_rsc_adra[11] [8]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_20 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I1(nl_z_out_1_0[3]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h6A6A6A95C03FC03F)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_21 
       (.I0(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I2(nl_z_out_1_0[3]),
        .I3(\twiddle_h_rsc_adra[10]_INST_0_i_38_n_0 ),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I5(nl_z_out_1_0[4]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_22 
       (.I0(nl_z_out_1_0[5]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I2(nl_z_out_1_0[4]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I4(nl_z_out_1_0[3]),
        .I5(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_23 
       (.I0(nl_z_out_1_0[3]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(nl_z_out_1_0[4]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_24 
       (.I0(nl_z_out_1_0[3]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_25 
       (.I0(Q[0]),
        .I1(\state_var_reg_rep[7]_1 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I3(MUX_v_4_2_2_return[1]),
        .I4(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h00000000001D0000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_26 
       (.I0(Q[0]),
        .I1(\state_var_reg_rep[7]_1 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I3(MUX_v_4_2_2_return[1]),
        .I4(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_27 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I2(MUX_v_4_2_2_return[0]),
        .I3(MUX_v_4_2_2_return[1]),
        .I4(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_27_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_28 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(MUX_v_4_2_2_return[0]),
        .I4(nl_z_out_1_0[1]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_28_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hFFFBFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_29 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(MUX_v_4_2_2_return[0]),
        .I4(nl_z_out_1_0[2]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_29_n_0 ));
  CARRY4 \twiddle_h_rsc_adra[10]_INST_0_i_3 
       (.CI(1'b0),
        .CO({\twiddle_h_rsc_adra[10]_INST_0_i_3_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_3_n_1 ,\twiddle_h_rsc_adra[10]_INST_0_i_3_n_2 ,\twiddle_h_rsc_adra[10]_INST_0_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\twiddle_h_rsc_adra[7]_INST_0_i_1_0 ,DI}),
        .O({\twiddle_h_rsc_adra[10]_INST_0_i_3_n_4 ,\twiddle_h_rsc_adra[10]_INST_0_i_3_n_5 ,\twiddle_h_rsc_adra[10]_INST_0_i_3_n_6 ,\twiddle_h_rsc_adra[10]_INST_0_i_3_n_7 }),
        .S({\twiddle_h_rsc_adra[10]_INST_0_i_6_n_0 ,\twiddle_h_rsc_adra[7]_INST_0_i_1_1 }));
  LUT6 #(
    .INIT(64'h0030200000002000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_30 
       (.I0(nl_z_out_1_0[1]),
        .I1(MUX_v_4_2_2_return[3]),
        .I2(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I3(MUX_v_4_2_2_return[1]),
        .I4(MUX_v_4_2_2_return[0]),
        .I5(nl_z_out_1_0[2]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_30_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A8080000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_31 
       (.I0(MUX_v_4_2_2_return[1]),
        .I1(Q[0]),
        .I2(\state_var_reg_rep[7]_1 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I4(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_31_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hFFBFFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_32 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(MUX_v_4_2_2_return[0]),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I4(nl_z_out_1_0[1]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_32_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFFFBFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_33 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(MUX_v_4_2_2_return[0]),
        .I4(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_33_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_34 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(MUX_v_4_2_2_return[0]),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I4(nl_z_out_1_0[2]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_34_n_0 ));
  LUT6 #(
    .INIT(64'h0000300800000008)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_35 
       (.I0(nl_z_out_1_0[1]),
        .I1(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(MUX_v_4_2_2_return[0]),
        .I4(MUX_v_4_2_2_return[3]),
        .I5(nl_z_out_1_0[2]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_35_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_36 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(MUX_v_4_2_2_return[0]),
        .I4(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_36_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_37 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(MUX_v_4_2_2_return[0]),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I4(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_37_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_38 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(MUX_v_4_2_2_return[1]),
        .I2(MUX_v_4_2_2_return[0]),
        .I3(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I4(nl_z_out_1_0[5]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_38_n_0 ));
  CARRY4 \twiddle_h_rsc_adra[10]_INST_0_i_5 
       (.CI(\twiddle_h_rsc_adra[6]_INST_0_i_3_n_0 ),
        .CO({\NLW_twiddle_h_rsc_adra[10]_INST_0_i_5_CO_UNCONNECTED [3],\twiddle_h_rsc_adra[10]_INST_0_i_5_n_1 ,\twiddle_h_rsc_adra[10]_INST_0_i_5_n_2 ,\twiddle_h_rsc_adra[10]_INST_0_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\twiddle_h_rsc_adra[10]_INST_0_i_11_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_12_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_13_n_0 }),
        .O({\COMP_LOOP_k_12_4_sva_7_0_reg[2] ,DI[2:1]}),
        .S({\twiddle_h_rsc_adra[10]_INST_0_i_14_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_15_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_16_n_0 ,\twiddle_h_rsc_adra[10]_INST_0_i_17_n_0 }));
  LUT4 #(
    .INIT(16'h9666)) 
    \twiddle_h_rsc_adra[10]_INST_0_i_6 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[4] [3]),
        .I1(\COMP_LOOP_k_12_4_sva_7_0_reg[2] [0]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(nl_z_out_1_0[6]),
        .O(\twiddle_h_rsc_adra[10]_INST_0_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[11]_INST_0 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[11]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_3_n_0 ),
        .O(twiddle_h_rsc_adra[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_5_n_7 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [10]),
        .I4(\vec_rsc_adra[11]_1 [8]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000030004)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_10 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ),
        .I1(state_var[6]),
        .I2(state_var[7]),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(state_var[3]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h6A959595956A6A6A)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_11 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_5_0 ),
        .I1(nl_z_out_1_0[7]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I4(nl_z_out_1_0[6]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_5_1 ),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000151)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_13 
       (.I0(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I1(Q[0]),
        .I2(\state_var_reg_rep[7]_1 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I4(MUX_v_4_2_2_return[1]),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000005404)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_14 
       (.I0(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I1(Q[0]),
        .I2(\state_var_reg_rep[7]_1 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I4(MUX_v_4_2_2_return[1]),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ));
  CARRY4 \twiddle_h_rsc_adra[11]_INST_0_i_16 
       (.CI(\twiddle_h_rsc_adra[10]_INST_0_i_10_n_0 ),
        .CO(\NLW_twiddle_h_rsc_adra[11]_INST_0_i_16_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_twiddle_h_rsc_adra[11]_INST_0_i_16_O_UNCONNECTED [3:1],\COMP_LOOP_k_12_4_sva_7_0_reg[3]_0 }),
        .S({1'b0,1'b0,1'b0,\twiddle_h_rsc_adra[11]_INST_0_i_18_n_0 }));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_17 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [1]),
        .I1(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(p_0_in[3]),
        .I5(Q[1]),
        .O(MUX_v_4_2_2_return[1]));
  LUT6 #(
    .INIT(64'h2BD4D42BFC03FC03)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_18 
       (.I0(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_19_n_0 ),
        .I2(\twiddle_h_rsc_adra[10]_INST_0_i_38_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_20_n_0 ),
        .I4(\twiddle_h_rsc_adra[10]_INST_0_i_26_n_0 ),
        .I5(nl_z_out_1_0[3]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_18_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_19 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(MUX_v_4_2_2_return[0]),
        .I2(MUX_v_4_2_2_return[1]),
        .I3(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I4(nl_z_out_1_0[4]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I1(state_var[3]),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000A000C00)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_20 
       (.I0(nl_z_out_1_0[4]),
        .I1(nl_z_out_1_0[5]),
        .I2(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I3(MUX_v_4_2_2_return[1]),
        .I4(MUX_v_4_2_2_return[0]),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_3 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[10]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [11]),
        .I4(\twiddle_h_rsc_adra[11] [9]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000440045)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_4 
       (.I0(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I1(state_var[7]),
        .I2(state_var[6]),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(state_var[3]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ));
  CARRY4 \twiddle_h_rsc_adra[11]_INST_0_i_5 
       (.CI(\twiddle_h_rsc_adra[10]_INST_0_i_3_n_0 ),
        .CO(\NLW_twiddle_h_rsc_adra[11]_INST_0_i_5_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_twiddle_h_rsc_adra[11]_INST_0_i_5_O_UNCONNECTED [3:1],\twiddle_h_rsc_adra[11]_INST_0_i_5_n_7 }),
        .S({1'b0,1'b0,1'b0,\twiddle_h_rsc_adra[11]_INST_0_i_11_n_0 }));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_6 
       (.I0(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I2(state_var[6]),
        .I3(state_var[4]),
        .I4(state_var[7]),
        .I5(state_var[5]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_7 
       (.I0(state_var[7]),
        .I1(state_var[1]),
        .I2(state_var[2]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_8 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0003000000000008)) 
    \twiddle_h_rsc_adra[11]_INST_0_i_9 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(p_0_in[0]),
        .I5(p_0_in[3]),
        .O(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \twiddle_h_rsc_adra[1]_INST_0 
       (.I0(P[1]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(\twiddle_h_rsc_adra[1]_INST_0_i_1_n_0 ),
        .O(twiddle_h_rsc_adra[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[1]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(\twiddle_h_rsc_adra[11] [0]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [1]),
        .I4(P[0]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\twiddle_h_rsc_adra[1]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \twiddle_h_rsc_adra[2]_INST_0 
       (.I0(\twiddle_h_rsc_adra[2]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .I2(\twiddle_h_rsc_adra[11] [0]),
        .I3(P[2]),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[2]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(\twiddle_h_rsc_adra[11] [1]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [2]),
        .I4(P[1]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\twiddle_h_rsc_adra[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \twiddle_h_rsc_adra[2]_INST_0_i_2 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(state_var[3]),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .O(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \twiddle_h_rsc_adra[2]_INST_0_i_3 
       (.I0(state_var[5]),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .O(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \twiddle_h_rsc_adra[3]_INST_0 
       (.I0(\twiddle_h_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[3]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[3]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I1(\twiddle_h_rsc_adra[11] [3]),
        .I2(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [1]),
        .I4(P[3]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[3]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(\twiddle_h_rsc_adra[11] [2]),
        .I2(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[11]_1 [0]),
        .I4(P[2]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\twiddle_h_rsc_adra[3]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[4]_INST_0 
       (.I0(\twiddle_h_rsc_adra[4]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[4]),
        .I3(\twiddle_h_rsc_adra[4]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[4]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_3_n_7 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [3]),
        .I4(\vec_rsc_adra[11]_1 [1]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[4]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[3]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [4]),
        .I4(\twiddle_h_rsc_adra[11] [2]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[4]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[5]_INST_0 
       (.I0(\twiddle_h_rsc_adra[5]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[5]),
        .I3(\twiddle_h_rsc_adra[5]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[5]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_3_n_6 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [4]),
        .I4(\vec_rsc_adra[11]_1 [2]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[5]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[4]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [5]),
        .I4(\twiddle_h_rsc_adra[11] [3]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[5]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[6]_INST_0 
       (.I0(\twiddle_h_rsc_adra[6]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[6]),
        .I3(\twiddle_h_rsc_adra[6]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_3_n_5 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [5]),
        .I4(\vec_rsc_adra[11]_1 [3]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_10 
       (.I0(nl_z_out_1_0[0]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000044404)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_11 
       (.I0(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I1(MUX_v_4_2_2_return[1]),
        .I2(Q[0]),
        .I3(\state_var_reg_rep[7]_1 ),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000000044400040)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_12 
       (.I0(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I1(MUX_v_4_2_2_return[1]),
        .I2(Q[0]),
        .I3(\state_var_reg_rep[7]_1 ),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I5(MUX_v_4_2_2_return[3]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_13 
       (.I0(MUX_v_4_2_2_return[3]),
        .I1(MUX_v_4_2_2_return[1]),
        .I2(MUX_v_4_2_2_return[0]),
        .I3(\COMP_LOOP_1_twiddle_f_acc_cse_sva_reg[2] ),
        .I4(nl_z_out_1_0[2]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_14 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_13_0 [0]),
        .I1(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(p_0_in[3]),
        .I5(Q[0]),
        .O(MUX_v_4_2_2_return[0]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[5]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [6]),
        .I4(\twiddle_h_rsc_adra[11] [4]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_2_n_0 ));
  CARRY4 \twiddle_h_rsc_adra[6]_INST_0_i_3 
       (.CI(1'b0),
        .CO({\twiddle_h_rsc_adra[6]_INST_0_i_3_n_0 ,\twiddle_h_rsc_adra[6]_INST_0_i_3_n_1 ,\twiddle_h_rsc_adra[6]_INST_0_i_3_n_2 ,\twiddle_h_rsc_adra[6]_INST_0_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\twiddle_h_rsc_adra[6]_INST_0_i_4_n_0 ,\twiddle_h_rsc_adra[6]_INST_0_i_5_n_0 ,\twiddle_h_rsc_adra[6]_INST_0_i_6_n_0 ,1'b0}),
        .O({DI[0],\twiddle_h_rsc_adra[6]_INST_0_i_3_n_5 ,\twiddle_h_rsc_adra[6]_INST_0_i_3_n_6 ,\twiddle_h_rsc_adra[6]_INST_0_i_3_n_7 }),
        .S({\twiddle_h_rsc_adra[6]_INST_0_i_7_n_0 ,\twiddle_h_rsc_adra[6]_INST_0_i_8_n_0 ,\twiddle_h_rsc_adra[6]_INST_0_i_9_n_0 ,\twiddle_h_rsc_adra[6]_INST_0_i_10_n_0 }));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_4 
       (.I0(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .I1(nl_z_out_1_0[1]),
        .I2(nl_z_out_1_0[2]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I4(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I5(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_5 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I1(nl_z_out_1_0[1]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(nl_z_out_1_0[2]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_6 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I1(nl_z_out_1_0[0]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h6A6A6A95C03FC03F)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_7 
       (.I0(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .I1(\twiddle_h_rsc_adra[6]_INST_0_i_12_n_0 ),
        .I2(nl_z_out_1_0[0]),
        .I3(\twiddle_h_rsc_adra[6]_INST_0_i_13_n_0 ),
        .I4(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I5(nl_z_out_1_0[1]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_8 
       (.I0(nl_z_out_1_0[2]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I2(nl_z_out_1_0[1]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I4(nl_z_out_1_0[0]),
        .I5(\twiddle_h_rsc_adra[6]_INST_0_i_11_n_0 ),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \twiddle_h_rsc_adra[6]_INST_0_i_9 
       (.I0(nl_z_out_1_0[0]),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_14_n_0 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .O(\twiddle_h_rsc_adra[6]_INST_0_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[7]_INST_0 
       (.I0(\twiddle_h_rsc_adra[7]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[7]),
        .I3(\twiddle_h_rsc_adra[7]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[7]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_3_n_7 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [6]),
        .I4(\vec_rsc_adra[11]_1 [4]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[7]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[6]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [7]),
        .I4(\twiddle_h_rsc_adra[11] [5]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[7]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[8]_INST_0 
       (.I0(\twiddle_h_rsc_adra[8]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[8]),
        .I3(\twiddle_h_rsc_adra[8]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[8]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_3_n_6 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [7]),
        .I4(\vec_rsc_adra[11]_1 [5]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[8]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[7]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [8]),
        .I4(\twiddle_h_rsc_adra[11] [6]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[8]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \twiddle_h_rsc_adra[9]_INST_0 
       (.I0(\twiddle_h_rsc_adra[9]_INST_0_i_1_n_0 ),
        .I1(\twiddle_h_rsc_adra[11]_INST_0_i_2_n_0 ),
        .I2(P[9]),
        .I3(\twiddle_h_rsc_adra[9]_INST_0_i_2_n_0 ),
        .O(twiddle_h_rsc_adra[9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[9]_INST_0_i_1 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_4_n_0 ),
        .I1(\twiddle_h_rsc_adra[10]_INST_0_i_3_n_5 ),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [8]),
        .I4(\vec_rsc_adra[11]_1 [6]),
        .I5(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .O(\twiddle_h_rsc_adra[9]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \twiddle_h_rsc_adra[9]_INST_0_i_2 
       (.I0(\twiddle_h_rsc_adra[11]_INST_0_i_9_n_0 ),
        .I1(P[8]),
        .I2(\twiddle_h_rsc_adra[11]_INST_0_i_10_n_0 ),
        .I3(\twiddle_h_rsc_adra[11] [9]),
        .I4(\twiddle_h_rsc_adra[11] [7]),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(\twiddle_h_rsc_adra[9]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h7F77)) 
    \twiddle_h_rsc_adrb[0]_INST_0 
       (.I0(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .I1(reg_twiddle_rsci_oswt_cse_reg[12]),
        .I2(complete_rsc_rdy),
        .I3(\return_rsci_d_reg[0] ),
        .O(twiddle_h_rsc_adrb));
  LUT6 #(
    .INIT(64'h0000000000440045)) 
    \twiddle_h_rsc_adrb[0]_INST_0_i_1 
       (.I0(vec_rsc_wea_INST_0_i_2_n_0),
        .I1(state_var[7]),
        .I2(state_var[3]),
        .I3(\twiddle_h_rsc_adra[11]_INST_0_i_7_n_0 ),
        .I4(state_var[6]),
        .I5(\twiddle_h_rsc_adra[11]_INST_0_i_8_n_0 ),
        .O(\twiddle_h_rsc_adrb[0]_INST_0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \vec_rsc_adra[0]_INST_0 
       (.I0(\vec_rsc_adra[0]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .I2(\vec_rsc_adra[1]_INST_0_i_2_n_7 ),
        .I3(\vec_rsc_adra[0]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adra[0]));
  LUT6 #(
    .INIT(64'hFFFF88F888F888F8)) 
    \vec_rsc_adra[0]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(\vec_rsc_adrb[1]_INST_0_i_4_n_7 ),
        .I2(\vec_rsc_adra[11] [0]),
        .I3(\state_var_reg_rep[0]_0 ),
        .I4(O[0]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000002F000000)) 
    \vec_rsc_adra[0]_INST_0_i_2 
       (.I0(vec_rsc_wea_INST_0_i_1_n_0),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(\vec_rsc_adra[0]_INST_0_i_3_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [0]),
        .I4(sel33_in),
        .I5(input_147_in),
        .O(\vec_rsc_adra[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFCCFFCCFFCCFE)) 
    \vec_rsc_adra[0]_INST_0_i_3 
       (.I0(state_var[3]),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(state_var[6]),
        .I3(state_var[7]),
        .I4(state_var[4]),
        .I5(state_var[5]),
        .O(\vec_rsc_adra[0]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[10]_INST_0 
       (.I0(\vec_rsc_adra[10]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [10]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[10]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[10]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[10]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[10]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [7]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_7_n_5 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [2]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[10]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[6]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [6]),
        .I4(\vec_rsc_adra[11]_INST_0_i_14_n_5 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[10]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[10]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [8]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [9]),
        .I4(\vec_rsc_adra[11]_0 [10]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[10]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[11]_INST_0 
       (.I0(\vec_rsc_adra[11]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [11]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_3_n_0 ),
        .I4(\vec_rsc_adra[11]_INST_0_i_4_n_0 ),
        .O(vec_rsc_adra[11]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[11]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [8]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_7_n_4 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [3]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00FF00FE)) 
    \vec_rsc_adra[11]_INST_0_i_10 
       (.I0(state_var[6]),
        .I1(state_var[4]),
        .I2(state_var[5]),
        .I3(state_var[7]),
        .I4(state_var[3]),
        .O(\state_var_reg_rep[6]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \vec_rsc_adra[11]_INST_0_i_11 
       (.I0(state_var[5]),
        .I1(state_var[3]),
        .I2(state_var[4]),
        .I3(state_var[6]),
        .O(\vec_rsc_adra[11]_INST_0_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h50505051)) 
    \vec_rsc_adra[11]_INST_0_i_12 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .I1(state_var[6]),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .I4(state_var[5]),
        .O(\vec_rsc_adra[11]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000440045)) 
    \vec_rsc_adra[11]_INST_0_i_13 
       (.I0(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I1(state_var[7]),
        .I2(state_var[6]),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(state_var[3]),
        .I5(\vec_rsc_adra[3]_INST_0_i_4_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_13_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[11]_INST_0_i_14 
       (.CI(\vec_rsc_adra[7]_INST_0_i_6_n_0 ),
        .CO({\NLW_vec_rsc_adra[11]_INST_0_i_14_CO_UNCONNECTED [3],\vec_rsc_adra[11]_INST_0_i_14_n_1 ,\vec_rsc_adra[11]_INST_0_i_14_n_2 ,\vec_rsc_adra[11]_INST_0_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\vec_rsc_adra[11]_0 [10:8]}),
        .O({\vec_rsc_adra[11]_INST_0_i_14_n_4 ,\vec_rsc_adra[11]_INST_0_i_14_n_5 ,\vec_rsc_adra[11]_INST_0_i_14_n_6 ,\vec_rsc_adra[11]_INST_0_i_14_n_7 }),
        .S({\vec_rsc_adra[11]_INST_0_i_29_n_0 ,\vec_rsc_adra[11]_INST_0_i_30_n_0 ,\vec_rsc_adra[11]_INST_0_i_31_n_0 ,\vec_rsc_adra[11]_INST_0_i_32_n_0 }));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \vec_rsc_adra[11]_INST_0_i_15 
       (.I0(vec_rsc_wea_INST_0_i_2_n_0),
        .I1(state_var[3]),
        .I2(\vec_rsc_adra[3]_INST_0_i_4_n_0 ),
        .I3(state_var[5]),
        .I4(state_var[7]),
        .I5(state_var[4]),
        .O(\vec_rsc_adra[11]_INST_0_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \vec_rsc_adra[11]_INST_0_i_16 
       (.I0(state_var[3]),
        .I1(state_var[0]),
        .I2(state_var[2]),
        .I3(state_var[7]),
        .I4(state_var[1]),
        .O(\vec_rsc_adra[11]_INST_0_i_16_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[11]_INST_0_i_17 
       (.I0(\vec_rsc_adra[11]_0 [10]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [2]),
        .O(MUX_v_12_2_20_return[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[11]_INST_0_i_18 
       (.I0(\vec_rsc_adra[11]_0 [9]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [1]),
        .O(MUX_v_12_2_20_return[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[11]_INST_0_i_19 
       (.I0(\vec_rsc_adra[11]_0 [8]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [0]),
        .O(MUX_v_12_2_20_return[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFB7F7)) 
    \vec_rsc_adra[11]_INST_0_i_2 
       (.I0(\state_var_reg_rep[6]_0 ),
        .I1(state_var[0]),
        .I2(state_var[7]),
        .I3(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I4(state_var[2]),
        .I5(state_var[1]),
        .O(\state_var_reg_rep[0]_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[11]_INST_0_i_20 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [3]),
        .I1(\vec_rsc_adra[11]_0 [11]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[7]),
        .O(\vec_rsc_adra[11]_INST_0_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[11]_INST_0_i_21 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [2]),
        .I1(\vec_rsc_adra[11]_0 [10]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[6]),
        .O(\vec_rsc_adra[11]_INST_0_i_21_n_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[11]_INST_0_i_22 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [1]),
        .I1(\vec_rsc_adra[11]_0 [9]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[5]),
        .O(\vec_rsc_adra[11]_INST_0_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[11]_INST_0_i_23 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [0]),
        .I1(\vec_rsc_adra[11]_0 [8]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[4]),
        .O(\vec_rsc_adra[11]_INST_0_i_23_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[11]_INST_0_i_24 
       (.CI(\vec_rsc_adra[7]_INST_0_i_15_n_0 ),
        .CO({\NLW_vec_rsc_adra[11]_INST_0_i_24_CO_UNCONNECTED [3],\vec_rsc_adra[11]_INST_0_i_24_n_1 ,\vec_rsc_adra[11]_INST_0_i_24_n_2 ,\vec_rsc_adra[11]_INST_0_i_24_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,nl_z_out_1_0[6:4]}),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[6] ),
        .S(\vec_rsc_adra[11]_INST_0_i_8 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[11]_INST_0_i_29 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [3]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[11]_INST_0_i_37_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [11]),
        .O(\vec_rsc_adra[11]_INST_0_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[11]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[7]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [7]),
        .I4(\vec_rsc_adra[11]_INST_0_i_14_n_4 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[11]_INST_0_i_30 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [2]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[11]_INST_0_i_38_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [10]),
        .O(\vec_rsc_adra[11]_INST_0_i_30_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[11]_INST_0_i_31 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [1]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[11]_INST_0_i_39_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [9]),
        .O(\vec_rsc_adra[11]_INST_0_i_31_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[11]_INST_0_i_32 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[6] [0]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[11]_INST_0_i_40_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [8]),
        .O(\vec_rsc_adra[11]_INST_0_i_32_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[11]_INST_0_i_37 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14__0),
        .I3(z_out_14[7]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_37_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[11]_INST_0_i_38 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[7]),
        .I3(z_out_14[6]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_38_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[11]_INST_0_i_39 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[6]),
        .I3(z_out_14[5]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_39_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[11]_INST_0_i_4 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [9]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(VEC_LOOP_acc_12_psp_sva_10),
        .I4(\vec_rsc_adra[11]_0 [11]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[11]_INST_0_i_40 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[5]),
        .I3(z_out_14[4]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_40_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[11]_INST_0_i_41 
       (.CI(\COMP_LOOP_k_12_4_sva_7_0_reg[7]_i_2_n_0 ),
        .CO(\NLW_vec_rsc_adra[11]_INST_0_i_41_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_vec_rsc_adra[11]_INST_0_i_41_O_UNCONNECTED [3:1],z_out_14__0}),
        .S({1'b0,1'b0,1'b0,\vec_rsc_adra[11]_INST_0_i_42_n_0 }));
  LUT3 #(
    .INIT(8'h9A)) 
    \vec_rsc_adra[11]_INST_0_i_42 
       (.I0(\vec_rsc_adra[11]_INST_0_i_43_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I2(p_0_in2_in[11]),
        .O(\vec_rsc_adra[11]_INST_0_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hFF00BF00FE00FF00)) 
    \vec_rsc_adra[11]_INST_0_i_43 
       (.I0(\state_var_reg_rep[6]_0 ),
        .I1(vec_rsc_wea_INST_0_i_1_n_0),
        .I2(input_147_in),
        .I3(nl_z_out_1_0[7]),
        .I4(sel33_in),
        .I5(vec_rsc_wea_INST_0_i_2_n_0),
        .O(\vec_rsc_adra[11]_INST_0_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \vec_rsc_adra[11]_INST_0_i_5 
       (.I0(\vec_rsc_adra[3]_INST_0_i_4_n_0 ),
        .I1(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I2(state_var[3]),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(state_var[7]),
        .I5(state_var[6]),
        .O(\vec_rsc_adra[11]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010040)) 
    \vec_rsc_adra[11]_INST_0_i_6 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[3]),
        .I3(vec_rsc_wea_INST_0_i_2_n_0),
        .I4(p_0_in[0]),
        .I5(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[11]_INST_0_i_6_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[11]_INST_0_i_7 
       (.CI(\vec_rsc_adra[7]_INST_0_i_4_n_0 ),
        .CO({\NLW_vec_rsc_adra[11]_INST_0_i_7_CO_UNCONNECTED [3],\vec_rsc_adra[11]_INST_0_i_7_n_1 ,\vec_rsc_adra[11]_INST_0_i_7_n_2 ,\vec_rsc_adra[11]_INST_0_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,MUX_v_12_2_20_return[10:8]}),
        .O({\vec_rsc_adra[11]_INST_0_i_7_n_4 ,\vec_rsc_adra[11]_INST_0_i_7_n_5 ,\vec_rsc_adra[11]_INST_0_i_7_n_6 ,\vec_rsc_adra[11]_INST_0_i_7_n_7 }),
        .S({\vec_rsc_adra[11]_INST_0_i_20_n_0 ,\vec_rsc_adra[11]_INST_0_i_21_n_0 ,\vec_rsc_adra[11]_INST_0_i_22_n_0 ,\vec_rsc_adra[11]_INST_0_i_23_n_0 }));
  LUT6 #(
    .INIT(64'h5500FFFF45504550)) 
    \vec_rsc_adra[11]_INST_0_i_9 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(p_0_in[3]),
        .O(\vec_rsc_adra[11]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEAFFEA)) 
    \vec_rsc_adra[1]_INST_0 
       (.I0(\vec_rsc_adra[1]_INST_0_i_1_n_0 ),
        .I1(input_46_in),
        .I2(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .I3(\vec_rsc_adra[1]_INST_0_i_4_n_0 ),
        .I4(\state_var_reg_rep[0]_0 ),
        .I5(\vec_rsc_adra[11] [1]),
        .O(vec_rsc_adra[1]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hE0A0E0E0)) 
    \vec_rsc_adra[1]_INST_0_i_1 
       (.I0(\vec_rsc_adra[3]_INST_0_i_5_n_0 ),
        .I1(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat),
        .I2(\vec_rsc_adra[11]_0 [1]),
        .I3(state_var[7]),
        .I4(state_var[4]),
        .O(\vec_rsc_adra[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0888FFFF0888AAAA)) 
    \vec_rsc_adra[1]_INST_0_i_10 
       (.I0(state_var[0]),
        .I1(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I2(state_var[2]),
        .I3(state_var[1]),
        .I4(state_var[7]),
        .I5(state_var[3]),
        .O(\vec_rsc_adra[1]_INST_0_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[1]_INST_0_i_11 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[0]),
        .I3(p_0_in2_in[3]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[1]_INST_0_i_11_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[1]_INST_0_i_2 
       (.CI(1'b0),
        .CO({\vec_rsc_adra[1]_INST_0_i_2_n_0 ,\vec_rsc_adra[1]_INST_0_i_2_n_1 ,\vec_rsc_adra[1]_INST_0_i_2_n_2 ,\vec_rsc_adra[1]_INST_0_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\vec_rsc_adra[11]_0 [3:0]),
        .O({input_125_in,input_57_in,input_46_in,\vec_rsc_adra[1]_INST_0_i_2_n_7 }),
        .S({\vec_rsc_adra[1]_INST_0_i_5_n_0 ,\vec_rsc_adra[1]_INST_0_i_6_n_0 ,\vec_rsc_adra[1]_INST_0_i_7_n_0 ,\vec_rsc_adra[1]_INST_0_i_8_n_0 }));
  LUT6 #(
    .INIT(64'h0000010000000004)) 
    \vec_rsc_adra[1]_INST_0_i_3 
       (.I0(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .I1(state_var[6]),
        .I2(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I3(state_var[5]),
        .I4(state_var[7]),
        .I5(state_var[4]),
        .O(\vec_rsc_adra[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[1]_INST_0_i_4 
       (.I0(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(input_1),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [0]),
        .I4(O[1]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[1]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[1]_INST_0_i_5 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [3]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[1]_INST_0_i_11_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [3]),
        .O(\vec_rsc_adra[1]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04F7FB08)) 
    \vec_rsc_adra[1]_INST_0_i_6 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [2]),
        .I1(state_var[5]),
        .I2(state_var[7]),
        .I3(p_0_in2_in[2]),
        .I4(\vec_rsc_adra[11]_0 [2]),
        .O(\vec_rsc_adra[1]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h04F7FB08)) 
    \vec_rsc_adra[1]_INST_0_i_7 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [1]),
        .I1(state_var[5]),
        .I2(state_var[7]),
        .I3(p_0_in2_in[1]),
        .I4(\vec_rsc_adra[11]_0 [1]),
        .O(\vec_rsc_adra[1]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h0D2FF2D0)) 
    \vec_rsc_adra[1]_INST_0_i_8 
       (.I0(state_var[5]),
        .I1(state_var[7]),
        .I2(p_0_in2_in[0]),
        .I3(\STAGE_LOOP_lshift_psp_sva_reg[4] [0]),
        .I4(\vec_rsc_adra[11]_0 [0]),
        .O(\vec_rsc_adra[1]_INST_0_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \vec_rsc_adra[1]_INST_0_i_9 
       (.I0(state_var[1]),
        .I1(state_var[7]),
        .I2(state_var[2]),
        .O(\vec_rsc_adra[1]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF88F8)) 
    \vec_rsc_adra[2]_INST_0 
       (.I0(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[10] [1]),
        .I2(\vec_rsc_adra[11] [2]),
        .I3(\state_var_reg_rep[0]_0 ),
        .I4(\vec_rsc_adra[2]_INST_0_i_1_n_0 ),
        .I5(\vec_rsc_adra[2]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adra[2]));
  LUT6 #(
    .INIT(64'hFFFFCC40CC40CC40)) 
    \vec_rsc_adra[2]_INST_0_i_1 
       (.I0(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [2]),
        .I2(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat),
        .I3(\vec_rsc_adra[3]_INST_0_i_5_n_0 ),
        .I4(input_57_in),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[2]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(input_2),
        .I2(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I3(\vec_rsc_adra[10] [0]),
        .I4(O[2]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[2]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h32)) 
    \vec_rsc_adra[2]_INST_0_i_3 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .O(\vec_rsc_adra[2]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \vec_rsc_adra[2]_INST_0_i_4 
       (.I0(state_var[0]),
        .I1(state_var[7]),
        .I2(state_var[2]),
        .I3(state_var[1]),
        .O(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF88F8)) 
    \vec_rsc_adra[3]_INST_0 
       (.I0(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[10] [2]),
        .I2(\vec_rsc_adra[11] [3]),
        .I3(\state_var_reg_rep[0]_0 ),
        .I4(\vec_rsc_adra[3]_INST_0_i_2_n_0 ),
        .I5(\vec_rsc_adra[3]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[3]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \vec_rsc_adra[3]_INST_0_i_1 
       (.I0(vec_rsc_wea_INST_0_i_2_n_0),
        .I1(state_var[3]),
        .I2(\vec_rsc_adra[3]_INST_0_i_4_n_0 ),
        .I3(state_var[7]),
        .I4(state_var[4]),
        .O(\vec_rsc_adra[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adra[3]_INST_0_i_2 
       (.I0(\vec_rsc_adra[3]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [3]),
        .I2(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .I3(input_125_in),
        .I4(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adra[11]_1 [0]),
        .O(\vec_rsc_adra[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[3]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I1(input_519_in),
        .I2(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I3(\vec_rsc_adra[10] [1]),
        .I4(O[3]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[3]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \vec_rsc_adra[3]_INST_0_i_4 
       (.I0(state_var[1]),
        .I1(state_var[7]),
        .I2(state_var[2]),
        .O(\vec_rsc_adra[3]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000C0000000404)) 
    \vec_rsc_adra[3]_INST_0_i_5 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ),
        .I1(sel33_in),
        .I2(input_147_in),
        .I3(vec_rsc_wea_INST_0_i_1_n_0),
        .I4(vec_rsc_wea_INST_0_i_2_n_0),
        .I5(p_0_in[0]),
        .O(\vec_rsc_adra[3]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[4]_INST_0 
       (.I0(\vec_rsc_adra[4]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [4]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[4]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[4]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[4]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[4]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [1]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_4_n_7 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [0]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[4]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[0]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [0]),
        .I4(\vec_rsc_adra[7]_INST_0_i_6_n_7 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[4]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [2]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [3]),
        .I4(\vec_rsc_adra[11]_0 [4]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[4]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[5]_INST_0 
       (.I0(\vec_rsc_adra[5]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [5]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[5]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[5]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[5]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[5]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [2]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_4_n_6 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [1]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[5]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[1]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [1]),
        .I4(\vec_rsc_adra[7]_INST_0_i_6_n_6 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[5]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [3]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [4]),
        .I4(\vec_rsc_adra[11]_0 [5]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[5]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[6]_INST_0 
       (.I0(\vec_rsc_adra[6]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [6]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[6]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[6]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[6]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[6]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [3]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_4_n_5 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [2]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[6]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[2]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [2]),
        .I4(\vec_rsc_adra[7]_INST_0_i_6_n_5 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[6]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [4]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [5]),
        .I4(\vec_rsc_adra[11]_0 [6]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[6]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[7]_INST_0 
       (.I0(\vec_rsc_adra[7]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [7]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[7]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[7]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[7]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [4]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[7]_INST_0_i_4_n_4 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [3]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[7]_INST_0_i_10 
       (.I0(\vec_rsc_adra[11]_0 [4]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [0]),
        .O(MUX_v_12_2_20_return[4]));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[7]_INST_0_i_11 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [3]),
        .I1(\vec_rsc_adra[11]_0 [7]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[3]),
        .O(\vec_rsc_adra[7]_INST_0_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[7]_INST_0_i_12 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [2]),
        .I1(\vec_rsc_adra[11]_0 [6]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[2]),
        .O(\vec_rsc_adra[7]_INST_0_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[7]_INST_0_i_13 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [1]),
        .I1(\vec_rsc_adra[11]_0 [5]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .O(\vec_rsc_adra[7]_INST_0_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h36C6)) 
    \vec_rsc_adra[7]_INST_0_i_14 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [0]),
        .I1(\vec_rsc_adra[11]_0 [4]),
        .I2(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I3(nl_z_out_1_0[0]),
        .O(\vec_rsc_adra[7]_INST_0_i_14_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[7]_INST_0_i_15 
       (.CI(\vec_rsc_adrb[0]_INST_0_i_5_n_0 ),
        .CO({\vec_rsc_adra[7]_INST_0_i_15_n_0 ,\vec_rsc_adra[7]_INST_0_i_15_n_1 ,\vec_rsc_adra[7]_INST_0_i_15_n_2 ,\vec_rsc_adra[7]_INST_0_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_z_out_1_0[3:0]),
        .O(\COMP_LOOP_k_12_4_sva_7_0_reg[3] ),
        .S(S));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[7]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[3]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [3]),
        .I4(\vec_rsc_adra[7]_INST_0_i_6_n_4 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[7]_INST_0_i_20 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [3]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[7]_INST_0_i_28_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [7]),
        .O(\vec_rsc_adra[7]_INST_0_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[7]_INST_0_i_21 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [2]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[7]_INST_0_i_29_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [6]),
        .O(\vec_rsc_adra[7]_INST_0_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[7]_INST_0_i_22 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [1]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[7]_INST_0_i_30_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [5]),
        .O(\vec_rsc_adra[7]_INST_0_i_22_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFF20)) 
    \vec_rsc_adra[7]_INST_0_i_23 
       (.I0(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [0]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adra[7]_INST_0_i_31_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [4]),
        .O(\vec_rsc_adra[7]_INST_0_i_23_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[7]_INST_0_i_28 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[4]),
        .I3(z_out_14[3]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_28_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[7]_INST_0_i_29 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[3]),
        .I3(z_out_14[2]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[7]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [5]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [6]),
        .I4(\vec_rsc_adra[11]_0 [7]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[7]_INST_0_i_30 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[2]),
        .I3(z_out_14[1]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_30_n_0 ));
  LUT5 #(
    .INIT(32'hFF202020)) 
    \vec_rsc_adra[7]_INST_0_i_31 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(z_out_14[1]),
        .I3(z_out_14[0]),
        .I4(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adra[7]_INST_0_i_31_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[7]_INST_0_i_4 
       (.CI(\vec_rsc_adrb[1]_INST_0_i_4_n_0 ),
        .CO({\vec_rsc_adra[7]_INST_0_i_4_n_0 ,\vec_rsc_adra[7]_INST_0_i_4_n_1 ,\vec_rsc_adra[7]_INST_0_i_4_n_2 ,\vec_rsc_adra[7]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_12_2_20_return[7:4]),
        .O({\vec_rsc_adra[7]_INST_0_i_4_n_4 ,\vec_rsc_adra[7]_INST_0_i_4_n_5 ,\vec_rsc_adra[7]_INST_0_i_4_n_6 ,\vec_rsc_adra[7]_INST_0_i_4_n_7 }),
        .S({\vec_rsc_adra[7]_INST_0_i_11_n_0 ,\vec_rsc_adra[7]_INST_0_i_12_n_0 ,\vec_rsc_adra[7]_INST_0_i_13_n_0 ,\vec_rsc_adra[7]_INST_0_i_14_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adra[7]_INST_0_i_6 
       (.CI(\vec_rsc_adra[1]_INST_0_i_2_n_0 ),
        .CO({\vec_rsc_adra[7]_INST_0_i_6_n_0 ,\vec_rsc_adra[7]_INST_0_i_6_n_1 ,\vec_rsc_adra[7]_INST_0_i_6_n_2 ,\vec_rsc_adra[7]_INST_0_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(\vec_rsc_adra[11]_0 [7:4]),
        .O({\vec_rsc_adra[7]_INST_0_i_6_n_4 ,\vec_rsc_adra[7]_INST_0_i_6_n_5 ,\vec_rsc_adra[7]_INST_0_i_6_n_6 ,\vec_rsc_adra[7]_INST_0_i_6_n_7 }),
        .S({\vec_rsc_adra[7]_INST_0_i_20_n_0 ,\vec_rsc_adra[7]_INST_0_i_21_n_0 ,\vec_rsc_adra[7]_INST_0_i_22_n_0 ,\vec_rsc_adra[7]_INST_0_i_23_n_0 }));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[7]_INST_0_i_7 
       (.I0(\vec_rsc_adra[11]_0 [7]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [3]),
        .O(MUX_v_12_2_20_return[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[7]_INST_0_i_8 
       (.I0(\vec_rsc_adra[11]_0 [6]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [2]),
        .O(MUX_v_12_2_20_return[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adra[7]_INST_0_i_9 
       (.I0(\vec_rsc_adra[11]_0 [5]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\COMP_LOOP_k_12_4_sva_7_0_reg[3] [1]),
        .O(MUX_v_12_2_20_return[5]));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[8]_INST_0 
       (.I0(\vec_rsc_adra[8]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [8]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[8]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[8]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[8]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[8]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [5]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_7_n_7 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [0]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[8]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[4]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [4]),
        .I4(\vec_rsc_adra[11]_INST_0_i_14_n_7 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[8]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[8]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [6]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [7]),
        .I4(\vec_rsc_adra[11]_0 [8]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[8]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \vec_rsc_adra[9]_INST_0 
       (.I0(\vec_rsc_adra[9]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adra[11] [9]),
        .I2(\state_var_reg_rep[0]_0 ),
        .I3(\vec_rsc_adra[9]_INST_0_i_2_n_0 ),
        .I4(\vec_rsc_adra[9]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adra[9]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \vec_rsc_adra[9]_INST_0_i_1 
       (.I0(\vec_rsc_adra[11]_1 [6]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_INST_0_i_6_n_0 ),
        .I3(\vec_rsc_adra[11]_INST_0_i_7_n_6 ),
        .I4(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [1]),
        .I5(\vec_rsc_adra[11]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adra[9]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[9]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(acc_10_nl[5]),
        .I2(\vec_rsc_adra[11]_INST_0_i_13_n_0 ),
        .I3(\vec_rsc_adra[11]_2 [5]),
        .I4(\vec_rsc_adra[11]_INST_0_i_14_n_6 ),
        .I5(\vec_rsc_adra[1]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adra[9]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adra[9]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adra[10] [7]),
        .I2(\vec_rsc_adra[3]_INST_0_i_1_n_0 ),
        .I3(\vec_rsc_adra[10] [8]),
        .I4(\vec_rsc_adra[11]_0 [9]),
        .I5(\vec_rsc_adra[11]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adra[9]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAFAEE)) 
    \vec_rsc_adrb[0]_INST_0 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_1_n_0 ),
        .I1(O[0]),
        .I2(\vec_rsc_adrb[1]_INST_0_i_4_n_7 ),
        .I3(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(vec_rsc_adrb[0]));
  LUT6 #(
    .INIT(64'h3333223200002202)) 
    \vec_rsc_adrb[0]_INST_0_i_1 
       (.I0(\vec_rsc_adra[1]_INST_0_i_2_n_7 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .I2(state_var[6]),
        .I3(state_var[7]),
        .I4(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [0]),
        .O(\vec_rsc_adrb[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFDFDDDD00202222)) 
    \vec_rsc_adrb[0]_INST_0_i_10 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I3(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(p_0_in2_in[3]),
        .O(\vec_rsc_adrb[0]_INST_0_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFB04)) 
    \vec_rsc_adrb[0]_INST_0_i_11 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[7]),
        .I3(p_0_in2_in[2]),
        .O(\vec_rsc_adrb[0]_INST_0_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFB04)) 
    \vec_rsc_adrb[0]_INST_0_i_12 
       (.I0(\VEC_LOOP_j_12_0_1_sva_1[12]_i_3_n_0 ),
        .I1(state_var[4]),
        .I2(state_var[7]),
        .I3(p_0_in2_in[1]),
        .O(\vec_rsc_adrb[0]_INST_0_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \vec_rsc_adrb[0]_INST_0_i_13 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(p_0_in2_in[0]),
        .O(\vec_rsc_adrb[0]_INST_0_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0F0E)) 
    \vec_rsc_adrb[0]_INST_0_i_3 
       (.I0(state_var[5]),
        .I1(state_var[4]),
        .I2(state_var[7]),
        .I3(state_var[6]),
        .O(\vec_rsc_adrb[0]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFDF)) 
    \vec_rsc_adrb[0]_INST_0_i_4 
       (.I0(state_var[3]),
        .I1(state_var[0]),
        .I2(state_var[2]),
        .I3(state_var[7]),
        .I4(state_var[1]),
        .O(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[0]_INST_0_i_5 
       (.CI(1'b0),
        .CO({\vec_rsc_adrb[0]_INST_0_i_5_n_0 ,\vec_rsc_adrb[0]_INST_0_i_5_n_1 ,\vec_rsc_adrb[0]_INST_0_i_5_n_2 ,\vec_rsc_adrb[0]_INST_0_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI(p_0_in2_in[3:0]),
        .O(\STAGE_LOOP_lshift_psp_sva_reg[4] ),
        .S({\vec_rsc_adrb[0]_INST_0_i_10_n_0 ,\vec_rsc_adrb[0]_INST_0_i_11_n_0 ,\vec_rsc_adrb[0]_INST_0_i_12_n_0 ,\vec_rsc_adrb[0]_INST_0_i_13_n_0 }));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[10]_INST_0 
       (.I0(acc_12_nl[10]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[10]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl__0[9]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[10]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adrb[10]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[10]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[11]_INST_0_i_7_n_5 ),
        .O(\vec_rsc_adrb[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[10]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_INST_0_i_14_n_5 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [2]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[7]),
        .O(\vec_rsc_adrb[10]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[11]_INST_0 
       (.I0(\VEC_LOOP_acc_1_cse_10_sva_reg[10] ),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_3_n_0 ),
        .I3(acc_10_nl__0[10]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[11]_INST_0_i_6_n_0 ),
        .O(vec_rsc_adrb[11]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[11]_INST_0_i_1 
       (.CI(\vec_rsc_adrb[8]_INST_0_i_1_n_0 ),
        .CO({\NLW_vec_rsc_adrb[11]_INST_0_i_1_CO_UNCONNECTED [3:2],\vec_rsc_adrb[11]_INST_0_i_1_n_2 ,\vec_rsc_adrb[11]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,p_1_in5_in[10:9]}),
        .O({\NLW_vec_rsc_adrb[11]_INST_0_i_1_O_UNCONNECTED [3],\VEC_LOOP_acc_1_cse_10_sva_reg[10] ,acc_12_nl[10:9]}),
        .S({1'b0,\vec_rsc_adrb[11]_INST_0_i_9_n_0 ,\vec_rsc_adrb[11]_INST_0_i_10_n_0 ,\vec_rsc_adrb[11]_INST_0_i_11_n_0 }));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[11]_INST_0_i_10 
       (.I0(p_0_in2_in[11]),
        .I1(\vec_rsc_adra[11]_0 [10]),
        .I2(nl_z_out_1_0[7]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[6]),
        .O(\vec_rsc_adrb[11]_INST_0_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[11]_INST_0_i_11 
       (.I0(p_0_in2_in[10]),
        .I1(\vec_rsc_adra[11]_0 [9]),
        .I2(nl_z_out_1_0[6]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[5]),
        .O(\vec_rsc_adrb[11]_INST_0_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \vec_rsc_adrb[11]_INST_0_i_12 
       (.I0(state_var[3]),
        .I1(state_var[0]),
        .I2(state_var[2]),
        .I3(state_var[7]),
        .I4(state_var[1]),
        .O(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAFFEAEA)) 
    \vec_rsc_adrb[11]_INST_0_i_13 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_18_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [10]),
        .I2(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [11]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .O(\vec_rsc_adrb[11]_INST_0_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h2AD5)) 
    \vec_rsc_adrb[11]_INST_0_i_14 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I2(\vec_rsc_adra[11]_0 [11]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_21_n_0 ),
        .O(\vec_rsc_adrb[11]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h5555566656665666)) 
    \vec_rsc_adrb[11]_INST_0_i_15 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_13_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_22_n_0 ),
        .I2(nl_z_out_1_0[6]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I4(\vec_rsc_adrb[11]_INST_0_i_23_n_0 ),
        .I5(nl_z_out_1_0[7]),
        .O(\vec_rsc_adrb[11]_INST_0_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h50505051)) 
    \vec_rsc_adrb[11]_INST_0_i_16 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[6]),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .I4(state_var[5]),
        .O(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \vec_rsc_adrb[11]_INST_0_i_17 
       (.I0(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .I1(state_var[3]),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \vec_rsc_adrb[11]_INST_0_i_18 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I4(state_var[3]),
        .I5(p_0_in2_in[11]),
        .O(\vec_rsc_adrb[11]_INST_0_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h0000080000000000)) 
    \vec_rsc_adrb[11]_INST_0_i_19 
       (.I0(state_var[6]),
        .I1(state_var[4]),
        .I2(state_var[7]),
        .I3(state_var[5]),
        .I4(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I5(state_var[3]),
        .O(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \vec_rsc_adrb[11]_INST_0_i_2 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .O(\state_var_reg_rep[7]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF7FF)) 
    \vec_rsc_adrb[11]_INST_0_i_20 
       (.I0(state_var[4]),
        .I1(state_var[5]),
        .I2(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I3(state_var[3]),
        .I4(state_var[7]),
        .I5(state_var[6]),
        .O(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF00005B5D0000)) 
    \vec_rsc_adrb[11]_INST_0_i_21 
       (.I0(sel33_in),
        .I1(state_var[5]),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .I4(nl_z_out_1_0[7]),
        .I5(\vec_rsc_adrb[4]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adrb[11]_INST_0_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h0400C4CC)) 
    \vec_rsc_adrb[11]_INST_0_i_22 
       (.I0(state_var[5]),
        .I1(nl_z_out_1_0[7]),
        .I2(state_var[7]),
        .I3(state_var[6]),
        .I4(sel33_in),
        .O(\vec_rsc_adrb[11]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF7FFFFEF)) 
    \vec_rsc_adrb[11]_INST_0_i_23 
       (.I0(p_0_in[1]),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(sel33_in),
        .I3(vec_rsc_wea_INST_0_i_1_n_0),
        .I4(p_0_in[0]),
        .I5(input_147_in),
        .O(\vec_rsc_adrb[11]_INST_0_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[11]_INST_0_i_3 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[11]_INST_0_i_7_n_4 ),
        .O(\vec_rsc_adrb[11]_INST_0_i_3_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[11]_INST_0_i_4 
       (.CI(\vec_rsc_adrb[9]_INST_0_i_2_n_0 ),
        .CO({\NLW_vec_rsc_adrb[11]_INST_0_i_4_CO_UNCONNECTED [3:1],\vec_rsc_adrb[11]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\vec_rsc_adrb[11]_INST_0_i_13_n_0 }),
        .O({\NLW_vec_rsc_adrb[11]_INST_0_i_4_O_UNCONNECTED [3:2],acc_10_nl__0}),
        .S({1'b0,1'b0,\vec_rsc_adrb[11]_INST_0_i_14_n_0 ,\vec_rsc_adrb[11]_INST_0_i_15_n_0 }));
  LUT4 #(
    .INIT(16'h0004)) 
    \vec_rsc_adrb[11]_INST_0_i_5 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .O(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[11]_INST_0_i_6 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_INST_0_i_14_n_4 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [3]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl__0[9]),
        .O(\vec_rsc_adrb[11]_INST_0_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[11]_INST_0_i_7 
       (.I0(\vec_rsc_adra[11]_0 [10]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[11]),
        .O(p_1_in5_in[10]));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[11]_INST_0_i_8 
       (.I0(\vec_rsc_adra[11]_0 [9]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[10]),
        .O(p_1_in5_in[9]));
  LUT3 #(
    .INIT(8'h6F)) 
    \vec_rsc_adrb[11]_INST_0_i_9 
       (.I0(\vec_rsc_adra[11]_0 [11]),
        .I1(nl_z_out_1_0[7]),
        .I2(p_0_in4_in),
        .O(\vec_rsc_adrb[11]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEEFEEE)) 
    \vec_rsc_adrb[1]_INST_0 
       (.I0(\vec_rsc_adrb[1]_INST_0_i_1_n_0 ),
        .I1(\vec_rsc_adrb[1]_INST_0_i_2_n_0 ),
        .I2(\vec_rsc_adrb[1]_INST_0_i_3_n_0 ),
        .I3(input_1),
        .I4(\state_var_reg_rep[7]_0 ),
        .I5(acc_12_nl[1]),
        .O(vec_rsc_adrb[1]));
  LUT4 #(
    .INIT(16'hF888)) 
    \vec_rsc_adrb[1]_INST_0_i_1 
       (.I0(O[1]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I2(input_46_in),
        .I3(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adrb[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1111E1EE22222D22)) 
    \vec_rsc_adrb[1]_INST_0_i_10 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [3]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(state_var[7]),
        .I3(state_var[6]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [3]),
        .O(\vec_rsc_adrb[1]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h1111E1EE22222D22)) 
    \vec_rsc_adrb[1]_INST_0_i_11 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [2]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(state_var[7]),
        .I3(state_var[5]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [2]),
        .O(\vec_rsc_adrb[1]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h1111E1EE22222D22)) 
    \vec_rsc_adrb[1]_INST_0_i_12 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [1]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [1]),
        .O(\vec_rsc_adrb[1]_INST_0_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h112D)) 
    \vec_rsc_adrb[1]_INST_0_i_13 
       (.I0(\STAGE_LOOP_lshift_psp_sva_reg[4] [0]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I3(\vec_rsc_adra[11]_0 [0]),
        .O(\vec_rsc_adrb[1]_INST_0_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hBABB0000)) 
    \vec_rsc_adrb[1]_INST_0_i_2 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adrb[1]_INST_0_i_5_n_0 ),
        .I2(state_var[7]),
        .I3(state_var[4]),
        .I4(\vec_rsc_adra[11]_0 [1]),
        .O(\vec_rsc_adrb[1]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h00003332)) 
    \vec_rsc_adrb[1]_INST_0_i_3 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .I3(state_var[5]),
        .I4(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .O(\vec_rsc_adrb[1]_INST_0_i_3_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[1]_INST_0_i_4 
       (.CI(1'b0),
        .CO({\vec_rsc_adrb[1]_INST_0_i_4_n_0 ,\vec_rsc_adrb[1]_INST_0_i_4_n_1 ,\vec_rsc_adrb[1]_INST_0_i_4_n_2 ,\vec_rsc_adrb[1]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_12_2_20_return[3:0]),
        .O({input_519_in,input_2,input_1,\vec_rsc_adrb[1]_INST_0_i_4_n_7 }),
        .S({\vec_rsc_adrb[1]_INST_0_i_10_n_0 ,\vec_rsc_adrb[1]_INST_0_i_11_n_0 ,\vec_rsc_adrb[1]_INST_0_i_12_n_0 ,\vec_rsc_adrb[1]_INST_0_i_13_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \vec_rsc_adrb[1]_INST_0_i_5 
       (.I0(state_var[6]),
        .I1(state_var[7]),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(state_var[3]),
        .I4(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .O(\vec_rsc_adrb[1]_INST_0_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adrb[1]_INST_0_i_6 
       (.I0(\vec_rsc_adra[11]_0 [3]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[4] [3]),
        .O(MUX_v_12_2_20_return[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adrb[1]_INST_0_i_7 
       (.I0(\vec_rsc_adra[11]_0 [2]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[4] [2]),
        .O(MUX_v_12_2_20_return[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adrb[1]_INST_0_i_8 
       (.I0(\vec_rsc_adra[11]_0 [1]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[4] [1]),
        .O(MUX_v_12_2_20_return[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_adrb[1]_INST_0_i_9 
       (.I0(\vec_rsc_adra[11]_0 [0]),
        .I1(\VEC_LOOP_acc_10_cse_1_sva[11]_i_2_n_0 ),
        .I2(\STAGE_LOOP_lshift_psp_sva_reg[4] [0]),
        .O(MUX_v_12_2_20_return[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[2]_INST_0 
       (.I0(acc_12_nl[2]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[2]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl[0]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[2]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adrb[2]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[2]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(input_2),
        .O(\vec_rsc_adrb[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[2]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(input_57_in),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(O[2]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(\vec_rsc_adra[11]_0 [2]),
        .O(\vec_rsc_adrb[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[3]_INST_0 
       (.I0(acc_12_nl[3]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[3]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl[1]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[3]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adrb[3]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[3]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(input_519_in),
        .O(\vec_rsc_adrb[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[3]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(input_125_in),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(O[3]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[0]),
        .O(\vec_rsc_adrb[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[4]_INST_0 
       (.I0(acc_12_nl[4]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[4]_INST_0_i_2_n_0 ),
        .I3(acc_10_nl[2]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[4]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adrb[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[4]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\vec_rsc_adrb[4]_INST_0_i_1_n_0 ,\vec_rsc_adrb[4]_INST_0_i_1_n_1 ,\vec_rsc_adrb[4]_INST_0_i_1_n_2 ,\vec_rsc_adrb[4]_INST_0_i_1_n_3 }),
        .CYINIT(\state_var_reg_rep[7]_0 ),
        .DI({p_1_in5_in[4:2],p_0_in4_in}),
        .O(acc_12_nl[4:1]),
        .S({\vec_rsc_adrb[4]_INST_0_i_8_n_0 ,\vec_rsc_adrb[4]_INST_0_i_9_n_0 ,\vec_rsc_adrb[4]_INST_0_i_10_n_0 ,\vec_rsc_adrb[4]_INST_0_i_11_n_0 }));
  LUT6 #(
    .INIT(64'h2E2E2E2E2E2E2ED1)) 
    \vec_rsc_adrb[4]_INST_0_i_10 
       (.I0(p_0_in2_in[3]),
        .I1(p_0_in4_in),
        .I2(\vec_rsc_adra[11]_0 [2]),
        .I3(\vec_rsc_adrb[4]_INST_0_i_12_n_0 ),
        .I4(\vec_rsc_adrb[4]_INST_0_i_13_n_0 ),
        .I5(\twiddle_h_rsc_adra[2]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adrb[4]_INST_0_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h35)) 
    \vec_rsc_adrb[4]_INST_0_i_11 
       (.I0(p_0_in2_in[2]),
        .I1(\vec_rsc_adra[11]_0 [1]),
        .I2(p_0_in4_in),
        .O(\vec_rsc_adrb[4]_INST_0_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hFFFEDFFF)) 
    \vec_rsc_adrb[4]_INST_0_i_12 
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .I2(state_var[1]),
        .I3(state_var[0]),
        .I4(state_var[2]),
        .O(\vec_rsc_adrb[4]_INST_0_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \vec_rsc_adrb[4]_INST_0_i_13 
       (.I0(state_var[7]),
        .I1(state_var[6]),
        .I2(sel33_in),
        .O(\vec_rsc_adrb[4]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[4]_INST_0_i_2 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[7]_INST_0_i_4_n_7 ),
        .O(\vec_rsc_adrb[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[4]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[7]_INST_0_i_6_n_7 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [0]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[1]),
        .O(\vec_rsc_adrb[4]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[4]_INST_0_i_4 
       (.I0(\vec_rsc_adra[11]_0 [4]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[5]),
        .O(p_1_in5_in[4]));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[4]_INST_0_i_5 
       (.I0(\vec_rsc_adra[11]_0 [3]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[4]),
        .O(p_1_in5_in[3]));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[4]_INST_0_i_6 
       (.I0(\vec_rsc_adra[11]_0 [2]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[3]),
        .O(p_1_in5_in[2]));
  LUT5 #(
    .INIT(32'hFFFFFFDF)) 
    \vec_rsc_adrb[4]_INST_0_i_7 
       (.I0(state_var[3]),
        .I1(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[5]),
        .O(p_0_in4_in));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[4]_INST_0_i_8 
       (.I0(p_0_in2_in[5]),
        .I1(\vec_rsc_adra[11]_0 [4]),
        .I2(nl_z_out_1_0[1]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[0]),
        .O(\vec_rsc_adrb[4]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h5555AA9AAA9AAA9A)) 
    \vec_rsc_adrb[4]_INST_0_i_9 
       (.I0(p_1_in5_in[3]),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .I3(\vec_rsc_adrb[1]_INST_0_i_5_n_0 ),
        .I4(\state_var_reg_rep[7]_0 ),
        .I5(nl_z_out_1_0[0]),
        .O(\vec_rsc_adrb[4]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[5]_INST_0 
       (.I0(acc_12_nl[5]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[5]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl[3]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[5]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adrb[5]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[5]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[7]_INST_0_i_4_n_6 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[5]_INST_0_i_10 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [4]),
        .I2(p_0_in2_in[6]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[5]_INST_0_i_14_n_0 ),
        .I5(\vec_rsc_adrb[5]_INST_0_i_19_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h5555555556565666)) 
    \vec_rsc_adrb[5]_INST_0_i_11 
       (.I0(\vec_rsc_adrb[5]_INST_0_i_7_n_0 ),
        .I1(\vec_rsc_adrb[5]_INST_0_i_20_n_0 ),
        .I2(nl_z_out_1_0[1]),
        .I3(\vec_rsc_adrb[5]_INST_0_i_21_n_0 ),
        .I4(\vec_rsc_adrb[11]_INST_0_i_23_n_0 ),
        .I5(\vec_rsc_adrb[5]_INST_0_i_22_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[5]_INST_0_i_12 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [2]),
        .I2(p_0_in2_in[4]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[5]_INST_0_i_17_n_0 ),
        .I5(\vec_rsc_adrb[5]_INST_0_i_23_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[5]_INST_0_i_13 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [7]),
        .I2(\vec_rsc_adra[11]_0 [6]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[6]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[5]_INST_0_i_14 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [6]),
        .I2(\vec_rsc_adra[11]_0 [5]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[5]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000A000C)) 
    \vec_rsc_adrb[5]_INST_0_i_15 
       (.I0(\vec_rsc_adra[11]_0 [4]),
        .I1(\vec_rsc_adra[11]_0 [5]),
        .I2(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .I3(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I4(p_0_in[3]),
        .I5(\vec_rsc_adra[2]_INST_0_i_3_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \vec_rsc_adrb[5]_INST_0_i_16 
       (.I0(state_var[3]),
        .I1(state_var[7]),
        .I2(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I3(\COMP_LOOP_3_twiddle_f_lshift_ncse_sva[7]_i_4_n_0 ),
        .I4(state_var[6]),
        .I5(p_0_in2_in[5]),
        .O(\vec_rsc_adrb[5]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[5]_INST_0_i_17 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [4]),
        .I2(\vec_rsc_adra[11]_0 [3]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[3]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adrb[5]_INST_0_i_18 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ),
        .I1(nl_z_out_1_0[3]),
        .I2(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ),
        .I3(nl_z_out_1_0[2]),
        .I4(nl_z_out_1_0[1]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adrb[5]_INST_0_i_19 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ),
        .I1(nl_z_out_1_0[2]),
        .I2(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ),
        .I3(nl_z_out_1_0[1]),
        .I4(nl_z_out_1_0[0]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_19_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[5]_INST_0_i_2 
       (.CI(1'b0),
        .CO({\vec_rsc_adrb[5]_INST_0_i_2_n_0 ,\vec_rsc_adrb[5]_INST_0_i_2_n_1 ,\vec_rsc_adrb[5]_INST_0_i_2_n_2 ,\vec_rsc_adrb[5]_INST_0_i_2_n_3 }),
        .CYINIT(\vec_rsc_adrb[5]_INST_0_i_4_n_0 ),
        .DI({\vec_rsc_adrb[5]_INST_0_i_5_n_0 ,\vec_rsc_adrb[5]_INST_0_i_6_n_0 ,\vec_rsc_adrb[5]_INST_0_i_7_n_0 ,\vec_rsc_adrb[5]_INST_0_i_8_n_0 }),
        .O(acc_10_nl[3:0]),
        .S({\vec_rsc_adrb[5]_INST_0_i_9_n_0 ,\vec_rsc_adrb[5]_INST_0_i_10_n_0 ,\vec_rsc_adrb[5]_INST_0_i_11_n_0 ,\vec_rsc_adrb[5]_INST_0_i_12_n_0 }));
  LUT6 #(
    .INIT(64'h0010FFFF00100010)) 
    \vec_rsc_adrb[5]_INST_0_i_20 
       (.I0(state_var[4]),
        .I1(state_var[7]),
        .I2(state_var[5]),
        .I3(\vec_rsc_adrb[1]_INST_0_i_5_n_0 ),
        .I4(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .I5(nl_z_out_1_0[0]),
        .O(\vec_rsc_adrb[5]_INST_0_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hCD)) 
    \vec_rsc_adrb[5]_INST_0_i_21 
       (.I0(state_var[5]),
        .I1(state_var[7]),
        .I2(state_var[6]),
        .O(\vec_rsc_adrb[5]_INST_0_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h0808080808FF0808)) 
    \vec_rsc_adrb[5]_INST_0_i_22 
       (.I0(nl_z_out_1_0[1]),
        .I1(p_0_in[3]),
        .I2(sel33_in),
        .I3(\vec_rsc_adrb[1]_INST_0_i_5_n_0 ),
        .I4(nl_z_out_1_0[0]),
        .I5(p_0_in[1]),
        .O(\vec_rsc_adrb[5]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hF8FFF8F8F8FFF8FF)) 
    \vec_rsc_adrb[5]_INST_0_i_23 
       (.I0(nl_z_out_1_0[0]),
        .I1(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I3(\vec_rsc_adrb[1]_INST_0_i_5_n_0 ),
        .I4(state_var[7]),
        .I5(state_var[4]),
        .O(\vec_rsc_adrb[5]_INST_0_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[5]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[7]_INST_0_i_6_n_6 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [1]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[2]),
        .O(\vec_rsc_adrb[5]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \vec_rsc_adrb[5]_INST_0_i_4 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .I1(state_var[7]),
        .I2(state_var[4]),
        .O(\vec_rsc_adrb[5]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[5]_INST_0_i_5 
       (.I0(\vec_rsc_adrb[5]_INST_0_i_13_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[7]),
        .I3(\vec_rsc_adra[11]_0 [5]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[5]_INST_0_i_6 
       (.I0(\vec_rsc_adrb[5]_INST_0_i_14_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[6]),
        .I3(\vec_rsc_adra[11]_0 [4]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFABFFABFFAB)) 
    \vec_rsc_adrb[5]_INST_0_i_7 
       (.I0(\vec_rsc_adrb[5]_INST_0_i_15_n_0 ),
        .I1(p_0_in2_in[4]),
        .I2(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .I3(\vec_rsc_adrb[5]_INST_0_i_16_n_0 ),
        .I4(\vec_rsc_adra[11]_0 [3]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[5]_INST_0_i_8 
       (.I0(\vec_rsc_adrb[5]_INST_0_i_17_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[4]),
        .I3(\vec_rsc_adra[11]_0 [2]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[5]_INST_0_i_9 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [5]),
        .I2(p_0_in2_in[7]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[5]_INST_0_i_13_n_0 ),
        .I5(\vec_rsc_adrb[5]_INST_0_i_18_n_0 ),
        .O(\vec_rsc_adrb[5]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[6]_INST_0 
       (.I0(acc_12_nl[6]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[6]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl[4]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[6]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adrb[6]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[6]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[7]_INST_0_i_4_n_5 ),
        .O(\vec_rsc_adrb[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[6]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[7]_INST_0_i_6_n_5 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [2]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[3]),
        .O(\vec_rsc_adrb[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[7]_INST_0 
       (.I0(acc_12_nl[7]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[7]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl[5]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[7]_INST_0_i_2_n_0 ),
        .O(vec_rsc_adrb[7]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[7]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[7]_INST_0_i_4_n_4 ),
        .O(\vec_rsc_adrb[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[7]_INST_0_i_2 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[7]_INST_0_i_6_n_4 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[7] [3]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[4]),
        .O(\vec_rsc_adrb[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[8]_INST_0 
       (.I0(acc_12_nl[8]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[8]_INST_0_i_2_n_0 ),
        .I3(acc_10_nl[6]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[8]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adrb[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[8]_INST_0_i_1 
       (.CI(\vec_rsc_adrb[4]_INST_0_i_1_n_0 ),
        .CO({\vec_rsc_adrb[8]_INST_0_i_1_n_0 ,\vec_rsc_adrb[8]_INST_0_i_1_n_1 ,\vec_rsc_adrb[8]_INST_0_i_1_n_2 ,\vec_rsc_adrb[8]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(p_1_in5_in[8:5]),
        .O(acc_12_nl[8:5]),
        .S({\vec_rsc_adrb[8]_INST_0_i_8_n_0 ,\vec_rsc_adrb[8]_INST_0_i_9_n_0 ,\vec_rsc_adrb[8]_INST_0_i_10_n_0 ,\vec_rsc_adrb[8]_INST_0_i_11_n_0 }));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[8]_INST_0_i_10 
       (.I0(p_0_in2_in[7]),
        .I1(\vec_rsc_adra[11]_0 [6]),
        .I2(nl_z_out_1_0[3]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[2]),
        .O(\vec_rsc_adrb[8]_INST_0_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[8]_INST_0_i_11 
       (.I0(p_0_in2_in[6]),
        .I1(\vec_rsc_adra[11]_0 [5]),
        .I2(nl_z_out_1_0[2]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[1]),
        .O(\vec_rsc_adrb[8]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[8]_INST_0_i_2 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[11]_INST_0_i_7_n_7 ),
        .O(\vec_rsc_adrb[8]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[8]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_INST_0_i_14_n_7 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [0]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[5]),
        .O(\vec_rsc_adrb[8]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[8]_INST_0_i_4 
       (.I0(\vec_rsc_adra[11]_0 [8]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[9]),
        .O(p_1_in5_in[8]));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[8]_INST_0_i_5 
       (.I0(\vec_rsc_adra[11]_0 [7]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[8]),
        .O(p_1_in5_in[7]));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[8]_INST_0_i_6 
       (.I0(\vec_rsc_adra[11]_0 [6]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[7]),
        .O(p_1_in5_in[6]));
  LUT3 #(
    .INIT(8'h8B)) 
    \vec_rsc_adrb[8]_INST_0_i_7 
       (.I0(\vec_rsc_adra[11]_0 [5]),
        .I1(p_0_in4_in),
        .I2(p_0_in2_in[6]),
        .O(p_1_in5_in[5]));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[8]_INST_0_i_8 
       (.I0(p_0_in2_in[9]),
        .I1(\vec_rsc_adra[11]_0 [8]),
        .I2(nl_z_out_1_0[5]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[4]),
        .O(\vec_rsc_adrb[8]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h33A5CCA5)) 
    \vec_rsc_adrb[8]_INST_0_i_9 
       (.I0(p_0_in2_in[8]),
        .I1(\vec_rsc_adra[11]_0 [7]),
        .I2(nl_z_out_1_0[4]),
        .I3(p_0_in4_in),
        .I4(nl_z_out_1_0[3]),
        .O(\vec_rsc_adrb[8]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF2F2F2)) 
    \vec_rsc_adrb[9]_INST_0 
       (.I0(acc_12_nl[9]),
        .I1(\state_var_reg_rep[7]_0 ),
        .I2(\vec_rsc_adrb[9]_INST_0_i_1_n_0 ),
        .I3(acc_10_nl[7]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I5(\vec_rsc_adrb[9]_INST_0_i_3_n_0 ),
        .O(vec_rsc_adrb[9]));
  LUT6 #(
    .INIT(64'h0055005400000000)) 
    \vec_rsc_adrb[9]_INST_0_i_1 
       (.I0(\vec_rsc_adrb[0]_INST_0_i_4_n_0 ),
        .I1(state_var[5]),
        .I2(state_var[4]),
        .I3(state_var[7]),
        .I4(state_var[6]),
        .I5(\vec_rsc_adra[11]_INST_0_i_7_n_6 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[9]_INST_0_i_10 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [7]),
        .I2(p_0_in2_in[9]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[9]_INST_0_i_14_n_0 ),
        .I5(\vec_rsc_adrb[9]_INST_0_i_18_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[9]_INST_0_i_11 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [6]),
        .I2(p_0_in2_in[8]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[9]_INST_0_i_15_n_0 ),
        .I5(\vec_rsc_adrb[9]_INST_0_i_19_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[9]_INST_0_i_12 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [11]),
        .I2(\vec_rsc_adra[11]_0 [10]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[10]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[9]_INST_0_i_13 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [10]),
        .I2(\vec_rsc_adra[11]_0 [9]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[9]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[9]_INST_0_i_14 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [9]),
        .I2(\vec_rsc_adra[11]_0 [8]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[8]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F888F8FFFF)) 
    \vec_rsc_adrb[9]_INST_0_i_15 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [8]),
        .I2(\vec_rsc_adra[11]_0 [7]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I4(p_0_in2_in[7]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_20_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adrb[9]_INST_0_i_16 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ),
        .I1(nl_z_out_1_0[7]),
        .I2(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ),
        .I3(nl_z_out_1_0[6]),
        .I4(nl_z_out_1_0[5]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adrb[9]_INST_0_i_17 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ),
        .I1(nl_z_out_1_0[6]),
        .I2(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ),
        .I3(nl_z_out_1_0[5]),
        .I4(nl_z_out_1_0[4]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adrb[9]_INST_0_i_18 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ),
        .I1(nl_z_out_1_0[5]),
        .I2(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ),
        .I3(nl_z_out_1_0[4]),
        .I4(nl_z_out_1_0[3]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \vec_rsc_adrb[9]_INST_0_i_19 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ),
        .I1(nl_z_out_1_0[4]),
        .I2(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ),
        .I3(nl_z_out_1_0[3]),
        .I4(nl_z_out_1_0[2]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_19_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vec_rsc_adrb[9]_INST_0_i_2 
       (.CI(\vec_rsc_adrb[5]_INST_0_i_2_n_0 ),
        .CO({\vec_rsc_adrb[9]_INST_0_i_2_n_0 ,\vec_rsc_adrb[9]_INST_0_i_2_n_1 ,\vec_rsc_adrb[9]_INST_0_i_2_n_2 ,\vec_rsc_adrb[9]_INST_0_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\vec_rsc_adrb[9]_INST_0_i_4_n_0 ,\vec_rsc_adrb[9]_INST_0_i_5_n_0 ,\vec_rsc_adrb[9]_INST_0_i_6_n_0 ,\vec_rsc_adrb[9]_INST_0_i_7_n_0 }),
        .O(acc_10_nl[7:4]),
        .S({\vec_rsc_adrb[9]_INST_0_i_8_n_0 ,\vec_rsc_adrb[9]_INST_0_i_9_n_0 ,\vec_rsc_adrb[9]_INST_0_i_10_n_0 ,\vec_rsc_adrb[9]_INST_0_i_11_n_0 }));
  LUT6 #(
    .INIT(64'h200000002000000F)) 
    \vec_rsc_adrb[9]_INST_0_i_20 
       (.I0(p_0_in[0]),
        .I1(\VEC_LOOP_acc_1_cse_10_sva[11]_i_4_n_0 ),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .I4(p_0_in[3]),
        .I5(\vec_rsc_adrb[11]_INST_0_i_12_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h0505000000000030)) 
    \vec_rsc_adrb[9]_INST_0_i_21 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_22_n_0 ),
        .I1(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .I2(p_0_in[3]),
        .I3(\vec_rsc_adra[1]_INST_0_i_10_n_0 ),
        .I4(p_0_in[2]),
        .I5(p_0_in[1]),
        .O(\vec_rsc_adrb[9]_INST_0_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hFFDFFFFF)) 
    \vec_rsc_adrb[9]_INST_0_i_22 
       (.I0(state_var[1]),
        .I1(state_var[2]),
        .I2(state_var[0]),
        .I3(state_var[7]),
        .I4(state_var[3]),
        .O(\vec_rsc_adrb[9]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \vec_rsc_adrb[9]_INST_0_i_3 
       (.I0(\vec_rsc_adra[11]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adra[11]_INST_0_i_14_n_6 ),
        .I2(\vec_rsc_adrb[11]_INST_0_i_16_n_0 ),
        .I3(\VEC_LOOP_acc_10_cse_1_sva_reg[11] [1]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_17_n_0 ),
        .I5(acc_10_nl[6]),
        .O(\vec_rsc_adrb[9]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[9]_INST_0_i_4 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_12_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[11]),
        .I3(\vec_rsc_adra[11]_0 [9]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[9]_INST_0_i_5 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_13_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[10]),
        .I3(\vec_rsc_adra[11]_0 [8]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[9]_INST_0_i_6 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_14_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[9]),
        .I3(\vec_rsc_adra[11]_0 [7]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFAEAEAE)) 
    \vec_rsc_adrb[9]_INST_0_i_7 
       (.I0(\vec_rsc_adrb[9]_INST_0_i_15_n_0 ),
        .I1(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I2(p_0_in2_in[8]),
        .I3(\vec_rsc_adra[11]_0 [6]),
        .I4(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[9]_INST_0_i_8 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [9]),
        .I2(p_0_in2_in[11]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[9]_INST_0_i_12_n_0 ),
        .I5(\vec_rsc_adrb[9]_INST_0_i_16_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00007077FFFF8F88)) 
    \vec_rsc_adrb[9]_INST_0_i_9 
       (.I0(\vec_rsc_adrb[11]_INST_0_i_5_n_0 ),
        .I1(\vec_rsc_adra[11]_0 [8]),
        .I2(p_0_in2_in[10]),
        .I3(\vec_rsc_adrb[11]_INST_0_i_19_n_0 ),
        .I4(\vec_rsc_adrb[9]_INST_0_i_13_n_0 ),
        .I5(\vec_rsc_adrb[9]_INST_0_i_17_n_0 ),
        .O(\vec_rsc_adrb[9]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0200FFFF00000000)) 
    vec_rsc_wea_INST_0
       (.I0(vec_rsc_wea_INST_0_i_1_n_0),
        .I1(vec_rsc_wea_INST_0_i_2_n_0),
        .I2(input_147_in),
        .I3(sel33_in),
        .I4(\state_var_reg_rep[0]_0 ),
        .I5(complete_rsc_rdy_0),
        .O(vec_rsc_wea));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h70FF0000)) 
    vec_rsc_wea_INST_0_i_1
       (.I0(state_var[0]),
        .I1(state_var[2]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[7]),
        .I4(state_var[1]),
        .O(vec_rsc_wea_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'h70FF0000)) 
    vec_rsc_wea_INST_0_i_2
       (.I0(state_var[1]),
        .I1(state_var[2]),
        .I2(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I3(state_var[7]),
        .I4(state_var[0]),
        .O(vec_rsc_wea_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h2AAA0000)) 
    vec_rsc_wea_INST_0_i_3
       (.I0(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I1(state_var[2]),
        .I2(state_var[1]),
        .I3(state_var[0]),
        .I4(state_var[7]),
        .O(input_147_in));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h2AFF0000)) 
    vec_rsc_wea_INST_0_i_4
       (.I0(\vec_rsc_adra[11]_INST_0_i_11_n_0 ),
        .I1(state_var[1]),
        .I2(state_var[0]),
        .I3(state_var[7]),
        .I4(state_var[2]),
        .O(sel33_in));
  LUT2 #(
    .INIT(4'hB)) 
    vec_rsc_wea_INST_0_i_5
       (.I0(complete_rsc_rdy),
        .I1(\return_rsci_d_reg[0] ),
        .O(complete_rsc_rdy_0));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_1
       (.I0(vector__2[31]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[31]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [14]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_10
       (.I0(vector__2[22]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[22]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [5]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_11
       (.I0(vector__2[21]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[21]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [4]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_12
       (.I0(vector__2[20]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[20]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [3]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_13
       (.I0(vector__2[19]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[19]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [2]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_14
       (.I0(vector__2[18]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[18]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [1]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_15
       (.I0(vector__2[17]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[17]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_2
       (.I0(vector__2[30]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[30]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [13]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_3
       (.I0(vector__2[29]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[29]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [12]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_4
       (.I0(vector__2[28]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[28]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [11]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_5
       (.I0(vector__2[27]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[27]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [10]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_6
       (.I0(vector__2[26]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[26]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [9]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_7
       (.I0(vector__2[25]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[25]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [8]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_8
       (.I0(vector__2[24]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[24]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector__0_i_9
       (.I0(vector__2[23]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[23]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[31] [6]));
  LUT6 #(
    .INIT(64'h888888888CC88888)) 
    vector_i_1
       (.I0(reg_ensig_cgo_1_cse),
        .I1(complete_rsc_rdy_0),
        .I2(vec_rsc_wea_INST_0_i_2_n_0),
        .I3(vec_rsc_wea_INST_0_i_1_n_0),
        .I4(sel33_in),
        .I5(input_147_in),
        .O(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_10
       (.I0(vector__2[12]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[12]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [12]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_11
       (.I0(vector__2[11]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[11]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [11]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_12
       (.I0(vector__2[10]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[10]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [10]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_13
       (.I0(vector__2[9]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[9]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [9]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_14
       (.I0(vector__2[8]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[8]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [8]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_15
       (.I0(vector__2[7]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[7]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_16
       (.I0(vector__2[6]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[6]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [6]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_17
       (.I0(vector__2[5]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[5]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [5]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_18
       (.I0(vector__2[4]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[4]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [4]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_19
       (.I0(vector__2[3]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[3]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [3]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_20
       (.I0(vector__2[2]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[2]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [2]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_21
       (.I0(vector__2[1]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[1]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [1]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_22
       (.I0(vector__2[0]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[0]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_6
       (.I0(vector__2[16]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[16]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [16]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_7
       (.I0(vector__2[15]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[15]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [15]));
  LUT6 #(
    .INIT(64'hFFDDFFDDFFDDFFDF)) 
    vector_i_74
       (.I0(vec_rsc_wea_INST_0_i_2_n_0),
        .I1(\vec_rsc_adra[1]_INST_0_i_9_n_0 ),
        .I2(state_var[6]),
        .I3(state_var[7]),
        .I4(state_var[4]),
        .I5(state_var[5]),
        .O(\state_var_reg_rep[6]_1 ));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_8
       (.I0(vector__2[14]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[14]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [14]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_9
       (.I0(vector__2[13]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(vector__2_0[13]),
        .O(\COMP_LOOP_twiddle_help_1_sva_reg[16] [13]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_1
       (.I0(z_mul_itm_1_reg[31]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[31]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [14]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_10
       (.I0(z_mul_itm_1_reg[22]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[22]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [5]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_11
       (.I0(z_mul_itm_1_reg[21]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[21]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [4]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_12
       (.I0(z_mul_itm_1_reg[20]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[20]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [3]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_13
       (.I0(z_mul_itm_1_reg[19]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[19]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [2]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_14
       (.I0(z_mul_itm_1_reg[18]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[18]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [1]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_15
       (.I0(z_mul_itm_1_reg[17]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[17]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_2
       (.I0(z_mul_itm_1_reg[30]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[30]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [13]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_3
       (.I0(z_mul_itm_1_reg[29]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[29]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [12]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_4
       (.I0(z_mul_itm_1_reg[28]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[28]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [11]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_5
       (.I0(z_mul_itm_1_reg[27]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[27]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [10]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_6
       (.I0(z_mul_itm_1_reg[26]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[26]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [9]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_7
       (.I0(z_mul_itm_1_reg[25]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[25]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [8]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_8
       (.I0(z_mul_itm_1_reg[24]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[24]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    z_mul_itm_1_reg_i_9
       (.I0(z_mul_itm_1_reg[23]),
        .I1(\vec_rsc_adra[11]_INST_0_i_5_n_0 ),
        .I2(z_mul_itm_1_reg_0[23]),
        .O(\COMP_LOOP_twiddle_f_1_sva_reg[31] [6]));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_run_rsci" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_run_rsci
   (run_rsci_bcwt,
    run_rsci_ivld_bfwt,
    rst,
    clk,
    run_rsci_ivld_bfwt_reg,
    complete_rsc_rdy,
    run_rsci_bcwt_reg,
    reg_run_rsci_oswt_cse,
    run_rsci_bcwt_reg_0);
  output run_rsci_bcwt;
  output run_rsci_ivld_bfwt;
  input rst;
  input clk;
  input run_rsci_ivld_bfwt_reg;
  input complete_rsc_rdy;
  input run_rsci_bcwt_reg;
  input reg_run_rsci_oswt_cse;
  input run_rsci_bcwt_reg_0;

  wire clk;
  wire complete_rsc_rdy;
  wire reg_run_rsci_oswt_cse;
  wire rst;
  wire run_rsci_bcwt;
  wire run_rsci_bcwt_reg;
  wire run_rsci_bcwt_reg_0;
  wire run_rsci_ivld_bfwt;
  wire run_rsci_ivld_bfwt_reg;

  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst
       (.clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .reg_run_rsci_oswt_cse(reg_run_rsci_oswt_cse),
        .rst(rst),
        .run_rsci_bcwt(run_rsci_bcwt),
        .run_rsci_bcwt_reg_0(run_rsci_bcwt_reg),
        .run_rsci_bcwt_reg_1(run_rsci_bcwt_reg_0),
        .run_rsci_ivld_bfwt(run_rsci_ivld_bfwt),
        .run_rsci_ivld_bfwt_reg_0(run_rsci_ivld_bfwt_reg));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
   (run_rsci_bcwt,
    run_rsci_ivld_bfwt,
    rst,
    clk,
    run_rsci_ivld_bfwt_reg_0,
    complete_rsc_rdy,
    run_rsci_bcwt_reg_0,
    reg_run_rsci_oswt_cse,
    run_rsci_bcwt_reg_1);
  output run_rsci_bcwt;
  output run_rsci_ivld_bfwt;
  input rst;
  input clk;
  input run_rsci_ivld_bfwt_reg_0;
  input complete_rsc_rdy;
  input run_rsci_bcwt_reg_0;
  input reg_run_rsci_oswt_cse;
  input run_rsci_bcwt_reg_1;

  wire clk;
  wire complete_rsc_rdy;
  wire reg_run_rsci_oswt_cse;
  wire rst;
  wire run_rsci_bcwt;
  wire run_rsci_bcwt_i_1_n_0;
  wire run_rsci_bcwt_reg_0;
  wire run_rsci_bcwt_reg_1;
  wire run_rsci_ivld_bfwt;
  wire run_rsci_ivld_bfwt_reg_0;

  LUT5 #(
    .INIT(32'h20AA30AA)) 
    run_rsci_bcwt_i_1
       (.I0(run_rsci_bcwt),
        .I1(complete_rsc_rdy),
        .I2(run_rsci_bcwt_reg_0),
        .I3(reg_run_rsci_oswt_cse),
        .I4(run_rsci_bcwt_reg_1),
        .O(run_rsci_bcwt_i_1_n_0));
  FDRE run_rsci_bcwt_reg
       (.C(clk),
        .CE(1'b1),
        .D(run_rsci_bcwt_i_1_n_0),
        .Q(run_rsci_bcwt),
        .R(rst));
  FDRE run_rsci_ivld_bfwt_reg
       (.C(clk),
        .CE(1'b1),
        .D(run_rsci_ivld_bfwt_reg_0),
        .Q(run_rsci_ivld_bfwt),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_staller" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_staller
   (core_wten_reg_reg_0,
    run_rsc_rdy,
    vec_rsc_triosy_lz,
    E,
    reg_vec_rsci_oswt_cse_reg,
    reg_twiddle_rsci_oswt_1_cse_reg,
    reg_twiddle_rsci_oswt_cse_reg,
    core_wten_reg_reg_1,
    core_wten_reg_reg_2,
    core_wten_reg_reg_3,
    core_wten_reg_reg_4,
    core_wten_reg_reg_5,
    core_wten_reg_reg_6,
    rst,
    clk,
    vec_rsci_bcwt_reg,
    complete_rsc_rdy,
    reg_run_rsci_oswt_cse,
    reg_vec_rsc_triosy_obj_iswt0_cse,
    reg_vec_rsci_oswt_1_cse,
    reg_vec_rsci_oswt_cse,
    reg_twiddle_rsci_oswt_1_cse,
    reg_twiddle_rsci_oswt_cse,
    twiddle_h_rsci_bcwt,
    twiddle_h_rsci_bcwt_1,
    twiddle_rsci_bcwt,
    twiddle_rsci_bcwt_1,
    vec_rsci_bcwt,
    vec_rsci_bcwt_1);
  output core_wten_reg_reg_0;
  output run_rsc_rdy;
  output vec_rsc_triosy_lz;
  output [0:0]E;
  output [0:0]reg_vec_rsci_oswt_cse_reg;
  output [0:0]reg_twiddle_rsci_oswt_1_cse_reg;
  output [0:0]reg_twiddle_rsci_oswt_cse_reg;
  output core_wten_reg_reg_1;
  output core_wten_reg_reg_2;
  output core_wten_reg_reg_3;
  output core_wten_reg_reg_4;
  output core_wten_reg_reg_5;
  output core_wten_reg_reg_6;
  input rst;
  input clk;
  input vec_rsci_bcwt_reg;
  input complete_rsc_rdy;
  input reg_run_rsci_oswt_cse;
  input reg_vec_rsc_triosy_obj_iswt0_cse;
  input reg_vec_rsci_oswt_1_cse;
  input reg_vec_rsci_oswt_cse;
  input reg_twiddle_rsci_oswt_1_cse;
  input reg_twiddle_rsci_oswt_cse;
  input twiddle_h_rsci_bcwt;
  input twiddle_h_rsci_bcwt_1;
  input twiddle_rsci_bcwt;
  input twiddle_rsci_bcwt_1;
  input vec_rsci_bcwt;
  input vec_rsci_bcwt_1;

  wire [0:0]E;
  wire clk;
  wire complete_rsc_rdy;
  wire core_wten_iff;
  wire core_wten_reg_reg_0;
  wire core_wten_reg_reg_1;
  wire core_wten_reg_reg_2;
  wire core_wten_reg_reg_3;
  wire core_wten_reg_reg_4;
  wire core_wten_reg_reg_5;
  wire core_wten_reg_reg_6;
  wire reg_run_rsci_oswt_cse;
  wire reg_twiddle_rsci_oswt_1_cse;
  wire [0:0]reg_twiddle_rsci_oswt_1_cse_reg;
  wire reg_twiddle_rsci_oswt_cse;
  wire [0:0]reg_twiddle_rsci_oswt_cse_reg;
  wire reg_vec_rsc_triosy_obj_iswt0_cse;
  wire reg_vec_rsci_oswt_1_cse;
  wire reg_vec_rsci_oswt_cse;
  wire [0:0]reg_vec_rsci_oswt_cse_reg;
  wire rst;
  wire run_rsc_rdy;
  wire twiddle_h_rsci_bcwt;
  wire twiddle_h_rsci_bcwt_1;
  wire twiddle_rsci_bcwt;
  wire twiddle_rsci_bcwt_1;
  wire vec_rsc_triosy_lz;
  wire vec_rsci_bcwt;
  wire vec_rsci_bcwt_1;
  wire vec_rsci_bcwt_reg;

  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    core_wten_reg_i_1
       (.I0(vec_rsci_bcwt_reg),
        .I1(complete_rsc_rdy),
        .O(core_wten_iff));
  FDRE core_wten_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(core_wten_iff),
        .Q(core_wten_reg_reg_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'h0D00CCCC)) 
    \inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt0 
       (.I0(core_wten_reg_reg_0),
        .I1(twiddle_h_rsci_bcwt),
        .I2(complete_rsc_rdy),
        .I3(vec_rsci_bcwt_reg),
        .I4(reg_twiddle_rsci_oswt_cse),
        .O(core_wten_reg_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT5 #(
    .INIT(32'h0D00CCCC)) 
    \inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst/twiddle_h_rsci_bcwt_10 
       (.I0(core_wten_reg_reg_0),
        .I1(twiddle_h_rsci_bcwt_1),
        .I2(complete_rsc_rdy),
        .I3(vec_rsci_bcwt_reg),
        .I4(reg_twiddle_rsci_oswt_1_cse),
        .O(core_wten_reg_reg_2));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT5 #(
    .INIT(32'h0D00CCCC)) 
    \inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt0 
       (.I0(core_wten_reg_reg_0),
        .I1(twiddle_rsci_bcwt),
        .I2(complete_rsc_rdy),
        .I3(vec_rsci_bcwt_reg),
        .I4(reg_twiddle_rsci_oswt_cse),
        .O(core_wten_reg_reg_3));
  LUT5 #(
    .INIT(32'h0D00CCCC)) 
    \inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst/twiddle_rsci_bcwt_10 
       (.I0(core_wten_reg_reg_0),
        .I1(twiddle_rsci_bcwt_1),
        .I2(complete_rsc_rdy),
        .I3(vec_rsci_bcwt_reg),
        .I4(reg_twiddle_rsci_oswt_1_cse),
        .O(core_wten_reg_reg_4));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT5 #(
    .INIT(32'h0D00CCCC)) 
    \inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt0 
       (.I0(core_wten_reg_reg_0),
        .I1(vec_rsci_bcwt),
        .I2(complete_rsc_rdy),
        .I3(vec_rsci_bcwt_reg),
        .I4(reg_vec_rsci_oswt_cse),
        .O(core_wten_reg_reg_5));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT5 #(
    .INIT(32'h0D00CCCC)) 
    \inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst/vec_rsci_bcwt_10 
       (.I0(core_wten_reg_reg_0),
        .I1(vec_rsci_bcwt_1),
        .I2(complete_rsc_rdy),
        .I3(vec_rsci_bcwt_reg),
        .I4(reg_vec_rsci_oswt_1_cse),
        .O(core_wten_reg_reg_6));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    run_rsc_rdy_INST_0
       (.I0(reg_run_rsci_oswt_cse),
        .I1(core_wten_reg_reg_0),
        .O(run_rsc_rdy));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    twiddle_h_rsc_triosy_lz_INST_0
       (.I0(reg_vec_rsc_triosy_obj_iswt0_cse),
        .I1(core_wten_reg_reg_0),
        .O(vec_rsc_triosy_lz));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \twiddle_rsci_qa_d_bfwt_31_0[31]_i_1 
       (.I0(reg_twiddle_rsci_oswt_cse),
        .I1(core_wten_reg_reg_0),
        .O(reg_twiddle_rsci_oswt_cse_reg));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \twiddle_rsci_qa_d_bfwt_63_32[31]_i_1 
       (.I0(reg_twiddle_rsci_oswt_1_cse),
        .I1(core_wten_reg_reg_0),
        .O(reg_twiddle_rsci_oswt_1_cse_reg));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \vec_rsci_qa_d_bfwt_31_0[31]_i_1 
       (.I0(reg_vec_rsci_oswt_cse),
        .I1(core_wten_reg_reg_0),
        .O(reg_vec_rsci_oswt_cse_reg));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \vec_rsci_qa_d_bfwt_63_32[31]_i_1 
       (.I0(reg_vec_rsci_oswt_1_cse),
        .I1(core_wten_reg_reg_0),
        .O(E));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1
   (twiddle_h_rsci_bcwt,
    twiddle_h_rsci_bcwt_1,
    D,
    \twiddle_h_rsci_qa_d_bfwt_31_0_reg[31] ,
    rst,
    twiddle_h_rsci_bcwt_reg,
    clk,
    twiddle_h_rsci_bcwt_1_reg,
    \COMP_LOOP_twiddle_help_1_sva_reg[31] ,
    twiddle_h_rsc_qb,
    E,
    twiddle_h_rsc_qa,
    \twiddle_h_rsci_qa_d_bfwt_63_32_reg[0] );
  output twiddle_h_rsci_bcwt;
  output twiddle_h_rsci_bcwt_1;
  output [31:0]D;
  output [31:0]\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31] ;
  input rst;
  input twiddle_h_rsci_bcwt_reg;
  input clk;
  input twiddle_h_rsci_bcwt_1_reg;
  input \COMP_LOOP_twiddle_help_1_sva_reg[31] ;
  input [31:0]twiddle_h_rsc_qb;
  input [0:0]E;
  input [31:0]twiddle_h_rsc_qa;
  input [0:0]\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0] ;

  wire \COMP_LOOP_twiddle_help_1_sva_reg[31] ;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire rst;
  wire [31:0]twiddle_h_rsc_qa;
  wire [31:0]twiddle_h_rsc_qb;
  wire twiddle_h_rsci_bcwt;
  wire twiddle_h_rsci_bcwt_1;
  wire twiddle_h_rsci_bcwt_1_reg;
  wire twiddle_h_rsci_bcwt_reg;
  wire [31:0]\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31] ;
  wire [0:0]\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0] ;

  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
       (.\COMP_LOOP_twiddle_help_1_sva_reg[31] (\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .D(D),
        .E(E),
        .clk(clk),
        .rst(rst),
        .twiddle_h_rsc_qa(twiddle_h_rsc_qa),
        .twiddle_h_rsc_qb(twiddle_h_rsc_qb),
        .twiddle_h_rsci_bcwt_1_reg_0(twiddle_h_rsci_bcwt_1),
        .twiddle_h_rsci_bcwt_1_reg_1(twiddle_h_rsci_bcwt_1_reg),
        .twiddle_h_rsci_bcwt_reg_0(twiddle_h_rsci_bcwt),
        .twiddle_h_rsci_bcwt_reg_1(twiddle_h_rsci_bcwt_reg),
        .\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 (\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31] ),
        .\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 (\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0] ));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
   (twiddle_h_rsci_bcwt_reg_0,
    twiddle_h_rsci_bcwt_1_reg_0,
    D,
    \twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 ,
    rst,
    twiddle_h_rsci_bcwt_reg_1,
    clk,
    twiddle_h_rsci_bcwt_1_reg_1,
    \COMP_LOOP_twiddle_help_1_sva_reg[31] ,
    twiddle_h_rsc_qb,
    E,
    twiddle_h_rsc_qa,
    \twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 );
  output twiddle_h_rsci_bcwt_reg_0;
  output twiddle_h_rsci_bcwt_1_reg_0;
  output [31:0]D;
  output [31:0]\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 ;
  input rst;
  input twiddle_h_rsci_bcwt_reg_1;
  input clk;
  input twiddle_h_rsci_bcwt_1_reg_1;
  input \COMP_LOOP_twiddle_help_1_sva_reg[31] ;
  input [31:0]twiddle_h_rsc_qb;
  input [0:0]E;
  input [31:0]twiddle_h_rsc_qa;
  input [0:0]\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ;

  wire \COMP_LOOP_twiddle_help_1_sva_reg[31] ;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire rst;
  wire [31:0]twiddle_h_rsc_qa;
  wire [31:0]twiddle_h_rsc_qb;
  wire twiddle_h_rsci_bcwt_1_reg_0;
  wire twiddle_h_rsci_bcwt_1_reg_1;
  wire twiddle_h_rsci_bcwt_reg_0;
  wire twiddle_h_rsci_bcwt_reg_1;
  wire [31:0]twiddle_h_rsci_qa_d_bfwt_31_0;
  wire [31:0]\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 ;
  wire [31:0]twiddle_h_rsci_qa_d_bfwt_63_32;
  wire [0:0]\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ;

  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[0]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [0]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[0]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[10]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [10]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[10]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[11]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [11]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[11]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[11]),
        .O(D[11]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[12]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [12]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[12]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[12]),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[13]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [13]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[13]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[13]),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[14]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [14]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[14]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[14]),
        .O(D[14]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[15]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [15]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[15]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[15]),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[16]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [16]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[16]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[16]),
        .O(D[16]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[17]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [17]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[17]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[17]),
        .O(D[17]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[18]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [18]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[18]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[18]),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[19]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [19]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[19]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[19]),
        .O(D[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[1]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [1]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[1]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[20]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [20]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[20]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[20]),
        .O(D[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[21]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [21]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[21]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[21]),
        .O(D[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[22]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [22]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[22]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[22]),
        .O(D[22]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[23]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [23]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[23]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[23]),
        .O(D[23]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[24]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [24]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[24]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[24]),
        .O(D[24]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[25]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [25]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[25]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[25]),
        .O(D[25]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[26]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [26]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[26]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[26]),
        .O(D[26]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[27]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [27]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[27]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[27]),
        .O(D[27]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[28]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [28]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[28]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[28]),
        .O(D[28]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[29]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [29]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[29]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[29]),
        .O(D[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[2]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [2]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[2]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[2]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[30]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [30]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[30]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[30]),
        .O(D[30]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[31]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [31]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[31]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[31]),
        .O(D[31]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[3]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [3]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[3]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[4]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [4]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[4]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[4]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[5]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [5]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[5]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[5]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[6]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [6]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[6]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[6]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[7]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [7]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[7]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[8]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [8]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[8]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[8]),
        .O(D[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_help_1_sva[9]_i_1 
       (.I0(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [9]),
        .I1(\COMP_LOOP_twiddle_help_1_sva_reg[31] ),
        .I2(twiddle_h_rsci_qa_d_bfwt_63_32[9]),
        .I3(twiddle_h_rsci_bcwt_1_reg_0),
        .I4(twiddle_h_rsc_qb[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[0]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[0]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[0]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[10]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[10]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[10]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[11]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[11]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[11]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[12]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[12]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[12]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[13]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[13]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[13]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[14]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[14]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[14]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[15]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[15]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[15]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [15]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[16]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[16]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[16]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [16]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[17]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[17]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[17]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [17]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[18]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[18]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[18]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [18]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[19]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[19]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[19]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [19]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[1]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[1]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[1]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[20]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[20]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[20]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [20]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[21]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[21]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[21]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [21]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[22]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[22]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[22]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [22]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[23]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[23]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[23]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [23]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[24]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[24]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[24]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [24]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[25]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[25]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[25]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [25]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[26]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[26]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[26]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [26]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[27]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[27]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[27]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [27]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[28]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[28]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[28]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [28]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[29]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[29]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[29]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [29]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[2]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[2]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[2]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[30]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[30]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[30]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [30]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[31]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[31]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[31]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [31]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[3]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[3]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[3]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[4]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[4]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[4]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[5]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[5]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[5]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[6]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[6]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[6]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[7]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[7]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[7]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[8]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[8]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[8]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_help_9_sva[9]_i_1 
       (.I0(twiddle_h_rsci_qa_d_bfwt_31_0[9]),
        .I1(twiddle_h_rsci_bcwt_reg_0),
        .I2(twiddle_h_rsc_qa[9]),
        .O(\twiddle_h_rsci_qa_d_bfwt_31_0_reg[31]_0 [9]));
  FDRE twiddle_h_rsci_bcwt_1_reg
       (.C(clk),
        .CE(1'b1),
        .D(twiddle_h_rsci_bcwt_1_reg_1),
        .Q(twiddle_h_rsci_bcwt_1_reg_0),
        .R(rst));
  FDRE twiddle_h_rsci_bcwt_reg
       (.C(clk),
        .CE(1'b1),
        .D(twiddle_h_rsci_bcwt_reg_1),
        .Q(twiddle_h_rsci_bcwt_reg_0),
        .R(rst));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[0] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[0]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[0]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[10] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[10]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[10]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[11] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[11]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[11]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[12] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[12]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[12]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[13] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[13]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[13]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[14] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[14]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[14]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[15] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[15]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[15]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[16] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[16]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[16]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[17] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[17]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[17]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[18] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[18]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[18]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[19] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[19]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[19]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[1] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[1]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[1]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[20] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[20]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[20]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[21] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[21]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[21]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[22] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[22]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[22]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[23] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[23]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[23]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[24] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[24]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[24]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[25] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[25]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[25]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[26] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[26]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[26]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[27] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[27]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[27]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[28] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[28]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[28]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[29] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[29]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[29]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[2] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[2]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[2]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[30] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[30]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[30]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[31] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[31]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[31]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[3] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[3]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[3]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[4] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[4]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[4]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[5] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[5]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[5]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[6] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[6]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[6]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[7] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[7]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[7]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[8] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[8]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[8]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_31_0_reg[9] 
       (.C(clk),
        .CE(E),
        .D(twiddle_h_rsc_qa[9]),
        .Q(twiddle_h_rsci_qa_d_bfwt_31_0[9]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[0] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[0]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[0]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[10] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[10]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[10]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[11] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[11]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[11]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[12] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[12]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[12]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[13] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[13]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[13]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[14] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[14]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[14]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[15] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[15]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[15]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[16] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[16]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[16]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[17] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[17]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[17]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[18] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[18]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[18]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[19] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[19]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[19]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[1] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[1]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[1]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[20] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[20]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[20]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[21] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[21]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[21]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[22] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[22]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[22]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[23] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[23]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[23]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[24] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[24]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[24]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[25] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[25]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[25]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[26] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[26]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[26]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[27] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[27]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[27]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[28] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[28]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[28]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[29] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[29]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[29]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[2] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[2]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[2]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[30] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[30]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[30]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[31] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[31]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[31]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[3] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[3]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[3]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[4] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[4]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[4]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[5] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[5]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[5]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[6] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[6]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[6]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[7] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[7]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[7]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[8] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[8]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[8]),
        .R(1'b0));
  FDRE \twiddle_h_rsci_qa_d_bfwt_63_32_reg[9] 
       (.C(clk),
        .CE(\twiddle_h_rsci_qa_d_bfwt_63_32_reg[0]_0 ),
        .D(twiddle_h_rsc_qb[9]),
        .Q(twiddle_h_rsci_qa_d_bfwt_63_32[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_twiddle_rsci_1" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
   (twiddle_rsci_bcwt,
    twiddle_rsci_bcwt_1,
    D,
    \twiddle_rsci_qa_d_bfwt_31_0_reg[31] ,
    rst,
    twiddle_rsci_bcwt_reg,
    clk,
    twiddle_rsci_bcwt_1_reg,
    \COMP_LOOP_twiddle_f_1_sva_reg[31] ,
    twiddle_rsc_qb,
    E,
    twiddle_rsc_qa,
    \twiddle_rsci_qa_d_bfwt_63_32_reg[31] );
  output twiddle_rsci_bcwt;
  output twiddle_rsci_bcwt_1;
  output [31:0]D;
  output [31:0]\twiddle_rsci_qa_d_bfwt_31_0_reg[31] ;
  input rst;
  input twiddle_rsci_bcwt_reg;
  input clk;
  input twiddle_rsci_bcwt_1_reg;
  input \COMP_LOOP_twiddle_f_1_sva_reg[31] ;
  input [31:0]twiddle_rsc_qb;
  input [0:0]E;
  input [31:0]twiddle_rsc_qa;
  input [0:0]\twiddle_rsci_qa_d_bfwt_63_32_reg[31] ;

  wire \COMP_LOOP_twiddle_f_1_sva_reg[31] ;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire rst;
  wire [31:0]twiddle_rsc_qa;
  wire [31:0]twiddle_rsc_qb;
  wire twiddle_rsci_bcwt;
  wire twiddle_rsci_bcwt_1;
  wire twiddle_rsci_bcwt_1_reg;
  wire twiddle_rsci_bcwt_reg;
  wire [31:0]\twiddle_rsci_qa_d_bfwt_31_0_reg[31] ;
  wire [0:0]\twiddle_rsci_qa_d_bfwt_63_32_reg[31] ;

  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
       (.\COMP_LOOP_twiddle_f_1_sva_reg[31] (\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .D(D),
        .E(E),
        .clk(clk),
        .rst(rst),
        .twiddle_rsc_qa(twiddle_rsc_qa),
        .twiddle_rsc_qb(twiddle_rsc_qb),
        .twiddle_rsci_bcwt_1_reg_0(twiddle_rsci_bcwt_1),
        .twiddle_rsci_bcwt_1_reg_1(twiddle_rsci_bcwt_1_reg),
        .twiddle_rsci_bcwt_reg_0(twiddle_rsci_bcwt),
        .twiddle_rsci_bcwt_reg_1(twiddle_rsci_bcwt_reg),
        .\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 (\twiddle_rsci_qa_d_bfwt_31_0_reg[31] ),
        .\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 (\twiddle_rsci_qa_d_bfwt_63_32_reg[31] ));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
   (twiddle_rsci_bcwt_reg_0,
    twiddle_rsci_bcwt_1_reg_0,
    D,
    \twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 ,
    rst,
    twiddle_rsci_bcwt_reg_1,
    clk,
    twiddle_rsci_bcwt_1_reg_1,
    \COMP_LOOP_twiddle_f_1_sva_reg[31] ,
    twiddle_rsc_qb,
    E,
    twiddle_rsc_qa,
    \twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 );
  output twiddle_rsci_bcwt_reg_0;
  output twiddle_rsci_bcwt_1_reg_0;
  output [31:0]D;
  output [31:0]\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 ;
  input rst;
  input twiddle_rsci_bcwt_reg_1;
  input clk;
  input twiddle_rsci_bcwt_1_reg_1;
  input \COMP_LOOP_twiddle_f_1_sva_reg[31] ;
  input [31:0]twiddle_rsc_qb;
  input [0:0]E;
  input [31:0]twiddle_rsc_qa;
  input [0:0]\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ;

  wire \COMP_LOOP_twiddle_f_1_sva_reg[31] ;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire rst;
  wire [31:0]twiddle_rsc_qa;
  wire [31:0]twiddle_rsc_qb;
  wire twiddle_rsci_bcwt_1_reg_0;
  wire twiddle_rsci_bcwt_1_reg_1;
  wire twiddle_rsci_bcwt_reg_0;
  wire twiddle_rsci_bcwt_reg_1;
  wire [31:0]twiddle_rsci_qa_d_bfwt_31_0;
  wire [31:0]\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 ;
  wire [31:0]twiddle_rsci_qa_d_bfwt_63_32;
  wire [0:0]\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ;

  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[0]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [0]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[0]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[10]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [10]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[10]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[11]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [11]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[11]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[11]),
        .O(D[11]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[12]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [12]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[12]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[12]),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[13]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [13]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[13]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[13]),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[14]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [14]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[14]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[14]),
        .O(D[14]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[15]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [15]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[15]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[15]),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[16]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [16]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[16]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[16]),
        .O(D[16]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[17]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [17]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[17]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[17]),
        .O(D[17]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[18]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [18]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[18]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[18]),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[19]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [19]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[19]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[19]),
        .O(D[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[1]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [1]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[1]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[20]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [20]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[20]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[20]),
        .O(D[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[21]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [21]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[21]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[21]),
        .O(D[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[22]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [22]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[22]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[22]),
        .O(D[22]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[23]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [23]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[23]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[23]),
        .O(D[23]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[24]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [24]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[24]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[24]),
        .O(D[24]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[25]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [25]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[25]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[25]),
        .O(D[25]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[26]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [26]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[26]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[26]),
        .O(D[26]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[27]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [27]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[27]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[27]),
        .O(D[27]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[28]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [28]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[28]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[28]),
        .O(D[28]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[29]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [29]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[29]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[29]),
        .O(D[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[2]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [2]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[2]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[2]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[30]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [30]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[30]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[30]),
        .O(D[30]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[31]_i_2 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [31]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[31]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[31]),
        .O(D[31]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[3]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [3]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[3]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[4]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [4]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[4]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[4]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[5]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [5]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[5]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[5]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[6]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [6]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[6]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[6]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[7]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [7]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[7]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[8]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [8]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[8]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[8]),
        .O(D[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \COMP_LOOP_twiddle_f_1_sva[9]_i_1 
       (.I0(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [9]),
        .I1(\COMP_LOOP_twiddle_f_1_sva_reg[31] ),
        .I2(twiddle_rsci_qa_d_bfwt_63_32[9]),
        .I3(twiddle_rsci_bcwt_1_reg_0),
        .I4(twiddle_rsc_qb[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[0]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[0]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[0]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[10]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[10]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[10]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[11]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[11]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[11]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[12]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[12]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[12]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[13]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[13]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[13]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[14]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[14]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[14]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[15]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[15]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[15]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [15]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[16]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[16]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[16]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [16]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[17]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[17]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[17]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [17]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[18]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[18]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[18]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [18]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[19]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[19]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[19]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [19]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[1]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[1]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[1]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[20]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[20]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[20]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [20]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[21]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[21]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[21]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [21]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[22]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[22]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[22]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [22]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[23]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[23]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[23]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [23]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[24]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[24]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[24]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [24]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[25]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[25]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[25]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [25]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[26]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[26]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[26]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [26]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[27]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[27]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[27]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [27]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[28]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[28]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[28]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [28]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[29]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[29]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[29]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [29]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[2]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[2]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[2]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[30]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[30]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[30]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [30]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[31]_i_2 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[31]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[31]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [31]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[3]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[3]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[3]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[4]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[4]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[4]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[5]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[5]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[5]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[6]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[6]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[6]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[7]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[7]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[7]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[8]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[8]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[8]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \COMP_LOOP_twiddle_f_9_sva[9]_i_1 
       (.I0(twiddle_rsci_qa_d_bfwt_31_0[9]),
        .I1(twiddle_rsci_bcwt_reg_0),
        .I2(twiddle_rsc_qa[9]),
        .O(\twiddle_rsci_qa_d_bfwt_31_0_reg[31]_0 [9]));
  FDRE twiddle_rsci_bcwt_1_reg
       (.C(clk),
        .CE(1'b1),
        .D(twiddle_rsci_bcwt_1_reg_1),
        .Q(twiddle_rsci_bcwt_1_reg_0),
        .R(rst));
  FDRE twiddle_rsci_bcwt_reg
       (.C(clk),
        .CE(1'b1),
        .D(twiddle_rsci_bcwt_reg_1),
        .Q(twiddle_rsci_bcwt_reg_0),
        .R(rst));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[0] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[0]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[0]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[10] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[10]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[10]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[11] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[11]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[11]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[12] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[12]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[12]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[13] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[13]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[13]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[14] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[14]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[14]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[15] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[15]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[15]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[16] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[16]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[16]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[17] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[17]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[17]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[18] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[18]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[18]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[19] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[19]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[19]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[1] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[1]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[1]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[20] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[20]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[20]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[21] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[21]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[21]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[22] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[22]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[22]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[23] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[23]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[23]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[24] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[24]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[24]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[25] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[25]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[25]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[26] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[26]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[26]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[27] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[27]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[27]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[28] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[28]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[28]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[29] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[29]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[29]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[2] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[2]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[2]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[30] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[30]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[30]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[31] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[31]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[31]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[3] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[3]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[3]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[4] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[4]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[4]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[5] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[5]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[5]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[6] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[6]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[6]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[7] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[7]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[7]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[8] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[8]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[8]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_31_0_reg[9] 
       (.C(clk),
        .CE(E),
        .D(twiddle_rsc_qa[9]),
        .Q(twiddle_rsci_qa_d_bfwt_31_0[9]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[0] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[0]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[0]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[10] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[10]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[10]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[11] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[11]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[11]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[12] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[12]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[12]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[13] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[13]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[13]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[14] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[14]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[14]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[15] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[15]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[15]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[16] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[16]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[16]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[17] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[17]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[17]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[18] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[18]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[18]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[19] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[19]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[19]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[1] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[1]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[1]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[20] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[20]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[20]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[21] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[21]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[21]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[22] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[22]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[22]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[23] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[23]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[23]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[24] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[24]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[24]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[25] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[25]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[25]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[26] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[26]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[26]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[27] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[27]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[27]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[28] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[28]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[28]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[29] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[29]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[29]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[2] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[2]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[2]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[30] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[30]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[30]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[31] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[31]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[31]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[3] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[3]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[3]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[4] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[4]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[4]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[5] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[5]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[5]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[6] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[6]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[6]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[7] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[7]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[7]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[8] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[8]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[8]),
        .R(1'b0));
  FDRE \twiddle_rsci_qa_d_bfwt_63_32_reg[9] 
       (.C(clk),
        .CE(\twiddle_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(twiddle_rsc_qb[9]),
        .Q(twiddle_rsci_qa_d_bfwt_63_32[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_vec_rsci_1" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_vec_rsci_1
   (vec_rsci_bcwt,
    vec_rsci_bcwt_1,
    nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
    O,
    out,
    \p_sva_reg[31] ,
    rst,
    vec_rsci_bcwt_reg,
    clk,
    vec_rsci_bcwt_1_reg,
    vector__1_i_20,
    vec_rsc_qa,
    vec_rsc_qb,
    CO,
    E,
    \vec_rsci_qa_d_bfwt_63_32_reg[31] ,
    S,
    Q);
  output vec_rsci_bcwt;
  output vec_rsci_bcwt_1;
  output [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  output [0:0]O;
  output [31:0]out;
  output [31:0]\p_sva_reg[31] ;
  input rst;
  input vec_rsci_bcwt_reg;
  input clk;
  input vec_rsci_bcwt_1_reg;
  input vector__1_i_20;
  input [31:0]vec_rsc_qa;
  input [31:0]vec_rsc_qb;
  input [0:0]CO;
  input [0:0]E;
  input [0:0]\vec_rsci_qa_d_bfwt_63_32_reg[31] ;
  input [0:0]S;
  input [31:0]Q;

  wire [0:0]CO;
  wire [0:0]E;
  wire [0:0]O;
  wire [31:0]Q;
  wire [0:0]S;
  wire clk;
  wire [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  wire [31:0]out;
  wire [31:0]\p_sva_reg[31] ;
  wire rst;
  wire [31:0]vec_rsc_qa;
  wire [31:0]vec_rsc_qb;
  wire vec_rsci_bcwt;
  wire vec_rsci_bcwt_1;
  wire vec_rsci_bcwt_1_reg;
  wire vec_rsci_bcwt_reg;
  wire [0:0]\vec_rsci_qa_d_bfwt_63_32_reg[31] ;
  wire vector__1_i_20;

  top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst
       (.CO(CO),
        .E(E),
        .O(O),
        .Q(Q),
        .S(S),
        .clk(clk),
        .nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat),
        .out(out),
        .\p_sva_reg[31] (\p_sva_reg[31] ),
        .rst(rst),
        .vec_rsc_qa(vec_rsc_qa),
        .vec_rsc_qb(vec_rsc_qb),
        .vec_rsci_bcwt_1_reg_0(vec_rsci_bcwt_1),
        .vec_rsci_bcwt_1_reg_1(vec_rsci_bcwt_1_reg),
        .vec_rsci_bcwt_reg_0(vec_rsci_bcwt),
        .vec_rsci_bcwt_reg_1(vec_rsci_bcwt_reg),
        .\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 (\vec_rsci_qa_d_bfwt_63_32_reg[31] ),
        .vector__1_i_20_0(vector__1_i_20));
endmodule

(* ORIG_REF_NAME = "inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp" *) 
module top_inPlaceNTT_DIF_preco_0_0_inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp
   (vec_rsci_bcwt_reg_0,
    vec_rsci_bcwt_1_reg_0,
    nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
    O,
    out,
    \p_sva_reg[31] ,
    rst,
    vec_rsci_bcwt_reg_1,
    clk,
    vec_rsci_bcwt_1_reg_1,
    vector__1_i_20_0,
    vec_rsc_qa,
    vec_rsc_qb,
    CO,
    E,
    \vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ,
    S,
    Q);
  output vec_rsci_bcwt_reg_0;
  output vec_rsci_bcwt_1_reg_0;
  output [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  output [0:0]O;
  output [31:0]out;
  output [31:0]\p_sva_reg[31] ;
  input rst;
  input vec_rsci_bcwt_reg_1;
  input clk;
  input vec_rsci_bcwt_1_reg_1;
  input vector__1_i_20_0;
  input [31:0]vec_rsc_qa;
  input [31:0]vec_rsc_qb;
  input [0:0]CO;
  input [0:0]E;
  input [0:0]\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ;
  input [0:0]S;
  input [31:0]Q;

  wire [0:0]CO;
  wire [0:0]E;
  wire [30:0]MUX_v_32_2_2_return0_in;
  wire [0:0]O;
  wire [31:0]Q;
  wire [0:0]S;
  wire [31:1]acc_13_nl;
  wire clk;
  wire [30:0]input_0;
  wire [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  wire [31:0]out;
  wire [31:0]\p_sva_reg[31] ;
  wire \return_rsci_d[11]_i_11_n_0 ;
  wire \return_rsci_d[11]_i_12_n_0 ;
  wire \return_rsci_d[11]_i_13_n_0 ;
  wire \return_rsci_d[11]_i_14_n_0 ;
  wire \return_rsci_d[11]_i_3_n_0 ;
  wire \return_rsci_d[11]_i_4_n_0 ;
  wire \return_rsci_d[11]_i_5_n_0 ;
  wire \return_rsci_d[11]_i_6_n_0 ;
  wire \return_rsci_d[15]_i_11_n_0 ;
  wire \return_rsci_d[15]_i_12_n_0 ;
  wire \return_rsci_d[15]_i_13_n_0 ;
  wire \return_rsci_d[15]_i_14_n_0 ;
  wire \return_rsci_d[15]_i_3_n_0 ;
  wire \return_rsci_d[15]_i_4_n_0 ;
  wire \return_rsci_d[15]_i_5_n_0 ;
  wire \return_rsci_d[15]_i_6_n_0 ;
  wire \return_rsci_d[19]_i_11_n_0 ;
  wire \return_rsci_d[19]_i_12_n_0 ;
  wire \return_rsci_d[19]_i_13_n_0 ;
  wire \return_rsci_d[19]_i_14_n_0 ;
  wire \return_rsci_d[19]_i_3_n_0 ;
  wire \return_rsci_d[19]_i_4_n_0 ;
  wire \return_rsci_d[19]_i_5_n_0 ;
  wire \return_rsci_d[19]_i_6_n_0 ;
  wire \return_rsci_d[23]_i_11_n_0 ;
  wire \return_rsci_d[23]_i_12_n_0 ;
  wire \return_rsci_d[23]_i_13_n_0 ;
  wire \return_rsci_d[23]_i_14_n_0 ;
  wire \return_rsci_d[23]_i_3_n_0 ;
  wire \return_rsci_d[23]_i_4_n_0 ;
  wire \return_rsci_d[23]_i_5_n_0 ;
  wire \return_rsci_d[23]_i_6_n_0 ;
  wire \return_rsci_d[27]_i_11_n_0 ;
  wire \return_rsci_d[27]_i_12_n_0 ;
  wire \return_rsci_d[27]_i_13_n_0 ;
  wire \return_rsci_d[27]_i_14_n_0 ;
  wire \return_rsci_d[27]_i_3_n_0 ;
  wire \return_rsci_d[27]_i_4_n_0 ;
  wire \return_rsci_d[27]_i_5_n_0 ;
  wire \return_rsci_d[27]_i_6_n_0 ;
  wire \return_rsci_d[31]_i_10_n_0 ;
  wire \return_rsci_d[31]_i_11_n_0 ;
  wire \return_rsci_d[31]_i_12_n_0 ;
  wire \return_rsci_d[31]_i_13_n_0 ;
  wire \return_rsci_d[31]_i_16_n_0 ;
  wire \return_rsci_d[31]_i_3_n_0 ;
  wire \return_rsci_d[31]_i_4_n_0 ;
  wire \return_rsci_d[31]_i_5_n_0 ;
  wire \return_rsci_d[31]_i_6_n_0 ;
  wire \return_rsci_d[3]_i_12_n_0 ;
  wire \return_rsci_d[3]_i_13_n_0 ;
  wire \return_rsci_d[3]_i_14_n_0 ;
  wire \return_rsci_d[3]_i_15_n_0 ;
  wire \return_rsci_d[3]_i_2_n_0 ;
  wire \return_rsci_d[3]_i_4_n_0 ;
  wire \return_rsci_d[3]_i_5_n_0 ;
  wire \return_rsci_d[3]_i_6_n_0 ;
  wire \return_rsci_d[3]_i_7_n_0 ;
  wire \return_rsci_d[7]_i_11_n_0 ;
  wire \return_rsci_d[7]_i_12_n_0 ;
  wire \return_rsci_d[7]_i_13_n_0 ;
  wire \return_rsci_d[7]_i_14_n_0 ;
  wire \return_rsci_d[7]_i_3_n_0 ;
  wire \return_rsci_d[7]_i_4_n_0 ;
  wire \return_rsci_d[7]_i_5_n_0 ;
  wire \return_rsci_d[7]_i_6_n_0 ;
  wire \return_rsci_d_reg[11]_i_1_n_0 ;
  wire \return_rsci_d_reg[11]_i_1_n_1 ;
  wire \return_rsci_d_reg[11]_i_1_n_2 ;
  wire \return_rsci_d_reg[11]_i_1_n_3 ;
  wire \return_rsci_d_reg[11]_i_2_n_0 ;
  wire \return_rsci_d_reg[11]_i_2_n_1 ;
  wire \return_rsci_d_reg[11]_i_2_n_2 ;
  wire \return_rsci_d_reg[11]_i_2_n_3 ;
  wire \return_rsci_d_reg[15]_i_1_n_0 ;
  wire \return_rsci_d_reg[15]_i_1_n_1 ;
  wire \return_rsci_d_reg[15]_i_1_n_2 ;
  wire \return_rsci_d_reg[15]_i_1_n_3 ;
  wire \return_rsci_d_reg[15]_i_2_n_0 ;
  wire \return_rsci_d_reg[15]_i_2_n_1 ;
  wire \return_rsci_d_reg[15]_i_2_n_2 ;
  wire \return_rsci_d_reg[15]_i_2_n_3 ;
  wire \return_rsci_d_reg[19]_i_1_n_0 ;
  wire \return_rsci_d_reg[19]_i_1_n_1 ;
  wire \return_rsci_d_reg[19]_i_1_n_2 ;
  wire \return_rsci_d_reg[19]_i_1_n_3 ;
  wire \return_rsci_d_reg[19]_i_2_n_0 ;
  wire \return_rsci_d_reg[19]_i_2_n_1 ;
  wire \return_rsci_d_reg[19]_i_2_n_2 ;
  wire \return_rsci_d_reg[19]_i_2_n_3 ;
  wire \return_rsci_d_reg[23]_i_1_n_0 ;
  wire \return_rsci_d_reg[23]_i_1_n_1 ;
  wire \return_rsci_d_reg[23]_i_1_n_2 ;
  wire \return_rsci_d_reg[23]_i_1_n_3 ;
  wire \return_rsci_d_reg[23]_i_2_n_0 ;
  wire \return_rsci_d_reg[23]_i_2_n_1 ;
  wire \return_rsci_d_reg[23]_i_2_n_2 ;
  wire \return_rsci_d_reg[23]_i_2_n_3 ;
  wire \return_rsci_d_reg[27]_i_1_n_0 ;
  wire \return_rsci_d_reg[27]_i_1_n_1 ;
  wire \return_rsci_d_reg[27]_i_1_n_2 ;
  wire \return_rsci_d_reg[27]_i_1_n_3 ;
  wire \return_rsci_d_reg[27]_i_2_n_0 ;
  wire \return_rsci_d_reg[27]_i_2_n_1 ;
  wire \return_rsci_d_reg[27]_i_2_n_2 ;
  wire \return_rsci_d_reg[27]_i_2_n_3 ;
  wire \return_rsci_d_reg[31]_i_14_n_3 ;
  wire \return_rsci_d_reg[31]_i_1_n_1 ;
  wire \return_rsci_d_reg[31]_i_1_n_2 ;
  wire \return_rsci_d_reg[31]_i_1_n_3 ;
  wire \return_rsci_d_reg[31]_i_2_n_1 ;
  wire \return_rsci_d_reg[31]_i_2_n_2 ;
  wire \return_rsci_d_reg[31]_i_2_n_3 ;
  wire \return_rsci_d_reg[3]_i_1_n_0 ;
  wire \return_rsci_d_reg[3]_i_1_n_1 ;
  wire \return_rsci_d_reg[3]_i_1_n_2 ;
  wire \return_rsci_d_reg[3]_i_1_n_3 ;
  wire \return_rsci_d_reg[3]_i_3_n_0 ;
  wire \return_rsci_d_reg[3]_i_3_n_1 ;
  wire \return_rsci_d_reg[3]_i_3_n_2 ;
  wire \return_rsci_d_reg[3]_i_3_n_3 ;
  wire \return_rsci_d_reg[7]_i_1_n_0 ;
  wire \return_rsci_d_reg[7]_i_1_n_1 ;
  wire \return_rsci_d_reg[7]_i_1_n_2 ;
  wire \return_rsci_d_reg[7]_i_1_n_3 ;
  wire \return_rsci_d_reg[7]_i_2_n_0 ;
  wire \return_rsci_d_reg[7]_i_2_n_1 ;
  wire \return_rsci_d_reg[7]_i_2_n_2 ;
  wire \return_rsci_d_reg[7]_i_2_n_3 ;
  wire rst;
  wire [31:0]vec_rsc_qa;
  wire [31:0]vec_rsc_qb;
  wire vec_rsci_bcwt_1_reg_0;
  wire vec_rsci_bcwt_1_reg_1;
  wire vec_rsci_bcwt_reg_0;
  wire vec_rsci_bcwt_reg_1;
  wire [31:0]vec_rsci_qa_d_bfwt_31_0;
  wire [31:0]vec_rsci_qa_d_bfwt_63_32;
  wire [0:0]\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ;
  wire vector__1_i_10_n_0;
  wire vector__1_i_10_n_1;
  wire vector__1_i_10_n_2;
  wire vector__1_i_10_n_3;
  wire vector__1_i_11_n_0;
  wire vector__1_i_12_n_0;
  wire vector__1_i_13_n_0;
  wire vector__1_i_14_n_0;
  wire vector__1_i_15_n_0;
  wire vector__1_i_15_n_1;
  wire vector__1_i_15_n_2;
  wire vector__1_i_15_n_3;
  wire vector__1_i_16_n_0;
  wire vector__1_i_17_n_0;
  wire vector__1_i_18_n_0;
  wire vector__1_i_19_n_0;
  wire vector__1_i_1_n_0;
  wire vector__1_i_1_n_1;
  wire vector__1_i_1_n_2;
  wire vector__1_i_1_n_3;
  wire vector__1_i_20_0;
  wire vector__1_i_20_n_0;
  wire vector__1_i_20_n_1;
  wire vector__1_i_20_n_2;
  wire vector__1_i_20_n_3;
  wire vector__1_i_21_n_0;
  wire vector__1_i_22_n_0;
  wire vector__1_i_23_n_0;
  wire vector__1_i_24_n_0;
  wire vector__1_i_25_n_0;
  wire vector__1_i_26_n_0;
  wire vector__1_i_27_n_0;
  wire vector__1_i_28_n_0;
  wire vector__1_i_29_n_0;
  wire vector__1_i_2_n_0;
  wire vector__1_i_2_n_1;
  wire vector__1_i_2_n_2;
  wire vector__1_i_2_n_3;
  wire vector__1_i_30_n_0;
  wire vector__1_i_31_n_0;
  wire vector__1_i_32_n_0;
  wire vector__1_i_33_n_0;
  wire vector__1_i_34_n_0;
  wire vector__1_i_35_n_0;
  wire vector__1_i_36_n_0;
  wire vector__1_i_37_n_0;
  wire vector__1_i_38_n_0;
  wire vector__1_i_39_n_0;
  wire vector__1_i_3_n_0;
  wire vector__1_i_3_n_1;
  wire vector__1_i_3_n_2;
  wire vector__1_i_3_n_3;
  wire vector__1_i_40_n_0;
  wire vector__1_i_41_n_0;
  wire vector__1_i_42_n_0;
  wire vector__1_i_43_n_0;
  wire vector__1_i_44_n_0;
  wire vector__1_i_45_n_0;
  wire vector__1_i_46_n_0;
  wire vector__1_i_47_n_0;
  wire vector__1_i_48_n_0;
  wire vector__1_i_49_n_0;
  wire vector__1_i_4_n_0;
  wire vector__1_i_4_n_1;
  wire vector__1_i_4_n_2;
  wire vector__1_i_4_n_3;
  wire vector__1_i_50_n_0;
  wire vector__1_i_51_n_0;
  wire vector__1_i_52_n_0;
  wire vector__1_i_53_n_0;
  wire vector__1_i_54_n_0;
  wire vector__1_i_55_n_0;
  wire vector__1_i_56_n_0;
  wire vector__1_i_57_n_0;
  wire vector__1_i_58_n_0;
  wire vector__1_i_59_n_0;
  wire vector__1_i_5_n_0;
  wire vector__1_i_5_n_1;
  wire vector__1_i_5_n_2;
  wire vector__1_i_5_n_3;
  wire vector__1_i_64_n_0;
  wire vector__1_i_65_n_0;
  wire vector__1_i_66_n_0;
  wire vector__1_i_67_n_0;
  wire vector__1_i_6_n_0;
  wire vector__1_i_72_n_0;
  wire vector__1_i_73_n_0;
  wire vector__1_i_74_n_0;
  wire vector__1_i_75_n_0;
  wire vector__1_i_7_n_0;
  wire vector__1_i_80_n_0;
  wire vector__1_i_81_n_0;
  wire vector__1_i_8_n_0;
  wire vector__1_i_9_n_0;
  wire vector_i_100_n_0;
  wire vector_i_101_n_0;
  wire vector_i_102_n_0;
  wire vector_i_103_n_0;
  wire vector_i_23_n_1;
  wire vector_i_23_n_2;
  wire vector_i_23_n_3;
  wire vector_i_25_n_0;
  wire vector_i_26_n_0;
  wire vector_i_27_n_0;
  wire vector_i_28_n_0;
  wire vector_i_28_n_1;
  wire vector_i_28_n_2;
  wire vector_i_28_n_3;
  wire vector_i_29_n_0;
  wire vector_i_2_n_1;
  wire vector_i_2_n_2;
  wire vector_i_2_n_3;
  wire vector_i_30_n_0;
  wire vector_i_31_n_0;
  wire vector_i_32_n_0;
  wire vector_i_33_n_0;
  wire vector_i_33_n_1;
  wire vector_i_33_n_2;
  wire vector_i_33_n_3;
  wire vector_i_34_n_0;
  wire vector_i_35_n_0;
  wire vector_i_36_n_0;
  wire vector_i_37_n_0;
  wire vector_i_38_n_0;
  wire vector_i_38_n_1;
  wire vector_i_38_n_2;
  wire vector_i_38_n_3;
  wire vector_i_39_n_0;
  wire vector_i_3_n_0;
  wire vector_i_3_n_1;
  wire vector_i_3_n_2;
  wire vector_i_3_n_3;
  wire vector_i_40_n_0;
  wire vector_i_41_n_0;
  wire vector_i_42_n_0;
  wire vector_i_43_n_0;
  wire vector_i_44_n_0;
  wire vector_i_45_n_0;
  wire vector_i_46_n_0;
  wire vector_i_47_n_0;
  wire vector_i_48_n_0;
  wire vector_i_49_n_0;
  wire vector_i_4_n_0;
  wire vector_i_4_n_1;
  wire vector_i_4_n_2;
  wire vector_i_4_n_3;
  wire vector_i_50_n_0;
  wire vector_i_51_n_0;
  wire vector_i_52_n_0;
  wire vector_i_53_n_0;
  wire vector_i_54_n_0;
  wire vector_i_55_n_0;
  wire vector_i_56_n_0;
  wire vector_i_57_n_0;
  wire vector_i_58_n_0;
  wire vector_i_59_n_0;
  wire vector_i_5_n_0;
  wire vector_i_5_n_1;
  wire vector_i_5_n_2;
  wire vector_i_5_n_3;
  wire vector_i_60_n_0;
  wire vector_i_61_n_0;
  wire vector_i_62_n_0;
  wire vector_i_63_n_0;
  wire vector_i_64_n_0;
  wire vector_i_65_n_0;
  wire vector_i_66_n_0;
  wire vector_i_67_n_0;
  wire vector_i_68_n_0;
  wire vector_i_69_n_0;
  wire vector_i_70_n_0;
  wire vector_i_71_n_0;
  wire vector_i_72_n_0;
  wire vector_i_73_n_0;
  wire vector_i_75_n_0;
  wire vector_i_76_n_0;
  wire vector_i_77_n_0;
  wire vector_i_78_n_0;
  wire vector_i_79_n_0;
  wire vector_i_84_n_0;
  wire vector_i_85_n_0;
  wire vector_i_86_n_0;
  wire vector_i_87_n_0;
  wire vector_i_92_n_0;
  wire vector_i_93_n_0;
  wire vector_i_94_n_0;
  wire vector_i_95_n_0;
  wire [3:3]\NLW_return_rsci_d_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_return_rsci_d_reg[31]_i_14_CO_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_14_O_UNCONNECTED ;
  wire [3:3]\NLW_return_rsci_d_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]NLW_vector_i_2_CO_UNCONNECTED;
  wire [3:3]NLW_vector_i_23_CO_UNCONNECTED;

  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[11]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[8]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[8]),
        .I3(vector__1_i_20_0),
        .I4(input_0[8]),
        .O(MUX_v_32_2_2_return0_in[8]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[11]_i_11 
       (.I0(vector__1_i_59_n_0),
        .I1(vec_rsc_qb[11]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[11]),
        .O(\return_rsci_d[11]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[11]_i_12 
       (.I0(vector__1_i_64_n_0),
        .I1(vec_rsc_qb[10]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[10]),
        .O(\return_rsci_d[11]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[11]_i_13 
       (.I0(vector__1_i_65_n_0),
        .I1(vec_rsc_qb[9]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[9]),
        .O(\return_rsci_d[11]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[11]_i_14 
       (.I0(vector__1_i_66_n_0),
        .I1(vec_rsc_qb[8]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[8]),
        .O(\return_rsci_d[11]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[11]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[11]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[11]),
        .O(\return_rsci_d[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[11]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[10]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[10]),
        .O(\return_rsci_d[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[11]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[9]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[9]),
        .O(\return_rsci_d[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[11]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[8]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[8]),
        .O(\return_rsci_d[11]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[11]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[11]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[11]),
        .I3(vector__1_i_20_0),
        .I4(input_0[11]),
        .O(MUX_v_32_2_2_return0_in[11]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[11]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[10]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[10]),
        .I3(vector__1_i_20_0),
        .I4(input_0[10]),
        .O(MUX_v_32_2_2_return0_in[10]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[11]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[9]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[9]),
        .I3(vector__1_i_20_0),
        .I4(input_0[9]),
        .O(MUX_v_32_2_2_return0_in[9]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[15]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[12]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[12]),
        .I3(vector__1_i_20_0),
        .I4(input_0[12]),
        .O(MUX_v_32_2_2_return0_in[12]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[15]_i_11 
       (.I0(vector_i_103_n_0),
        .I1(vec_rsc_qb[15]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[15]),
        .O(\return_rsci_d[15]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[15]_i_12 
       (.I0(vector__1_i_56_n_0),
        .I1(vec_rsc_qb[14]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[14]),
        .O(\return_rsci_d[15]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[15]_i_13 
       (.I0(vector__1_i_57_n_0),
        .I1(vec_rsc_qb[13]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[13]),
        .O(\return_rsci_d[15]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[15]_i_14 
       (.I0(vector__1_i_58_n_0),
        .I1(vec_rsc_qb[12]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[12]),
        .O(\return_rsci_d[15]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[15]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[15]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[15]),
        .O(\return_rsci_d[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[15]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[14]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[14]),
        .O(\return_rsci_d[15]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[15]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[13]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[13]),
        .O(\return_rsci_d[15]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[15]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[12]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[12]),
        .O(\return_rsci_d[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[15]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[15]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[15]),
        .I3(vector__1_i_20_0),
        .I4(input_0[15]),
        .O(MUX_v_32_2_2_return0_in[15]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[15]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[14]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[14]),
        .I3(vector__1_i_20_0),
        .I4(input_0[14]),
        .O(MUX_v_32_2_2_return0_in[14]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[15]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[13]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[13]),
        .I3(vector__1_i_20_0),
        .I4(input_0[13]),
        .O(MUX_v_32_2_2_return0_in[13]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[19]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[16]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[16]),
        .I3(vector__1_i_20_0),
        .I4(input_0[16]),
        .O(MUX_v_32_2_2_return0_in[16]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[19]_i_11 
       (.I0(vector_i_95_n_0),
        .I1(vec_rsc_qb[19]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[19]),
        .O(\return_rsci_d[19]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[19]_i_12 
       (.I0(vector_i_100_n_0),
        .I1(vec_rsc_qb[18]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[18]),
        .O(\return_rsci_d[19]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[19]_i_13 
       (.I0(vector_i_101_n_0),
        .I1(vec_rsc_qb[17]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[17]),
        .O(\return_rsci_d[19]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[19]_i_14 
       (.I0(vector_i_102_n_0),
        .I1(vec_rsc_qb[16]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[16]),
        .O(\return_rsci_d[19]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[19]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[19]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[19]),
        .O(\return_rsci_d[19]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[19]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[18]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[18]),
        .O(\return_rsci_d[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[19]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[17]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[17]),
        .O(\return_rsci_d[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[19]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[16]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[16]),
        .O(\return_rsci_d[19]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[19]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[19]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[19]),
        .I3(vector__1_i_20_0),
        .I4(input_0[19]),
        .O(MUX_v_32_2_2_return0_in[19]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[19]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[18]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[18]),
        .I3(vector__1_i_20_0),
        .I4(input_0[18]),
        .O(MUX_v_32_2_2_return0_in[18]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[19]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[17]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[17]),
        .I3(vector__1_i_20_0),
        .I4(input_0[17]),
        .O(MUX_v_32_2_2_return0_in[17]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[23]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[20]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[20]),
        .I3(vector__1_i_20_0),
        .I4(input_0[20]),
        .O(MUX_v_32_2_2_return0_in[20]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[23]_i_11 
       (.I0(vector_i_87_n_0),
        .I1(vec_rsc_qb[23]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[23]),
        .O(\return_rsci_d[23]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[23]_i_12 
       (.I0(vector_i_92_n_0),
        .I1(vec_rsc_qb[22]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[22]),
        .O(\return_rsci_d[23]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[23]_i_13 
       (.I0(vector_i_93_n_0),
        .I1(vec_rsc_qb[21]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[21]),
        .O(\return_rsci_d[23]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[23]_i_14 
       (.I0(vector_i_94_n_0),
        .I1(vec_rsc_qb[20]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[20]),
        .O(\return_rsci_d[23]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[23]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[23]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[23]),
        .O(\return_rsci_d[23]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[23]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[22]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[22]),
        .O(\return_rsci_d[23]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[23]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[21]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[21]),
        .O(\return_rsci_d[23]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[23]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[20]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[20]),
        .O(\return_rsci_d[23]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[23]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[23]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[23]),
        .I3(vector__1_i_20_0),
        .I4(input_0[23]),
        .O(MUX_v_32_2_2_return0_in[23]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[23]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[22]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[22]),
        .I3(vector__1_i_20_0),
        .I4(input_0[22]),
        .O(MUX_v_32_2_2_return0_in[22]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[23]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[21]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[21]),
        .I3(vector__1_i_20_0),
        .I4(input_0[21]),
        .O(MUX_v_32_2_2_return0_in[21]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[27]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[24]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[24]),
        .I3(vector__1_i_20_0),
        .I4(input_0[24]),
        .O(MUX_v_32_2_2_return0_in[24]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[27]_i_11 
       (.I0(vector_i_77_n_0),
        .I1(vec_rsc_qb[27]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[27]),
        .O(\return_rsci_d[27]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[27]_i_12 
       (.I0(vector_i_84_n_0),
        .I1(vec_rsc_qb[26]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[26]),
        .O(\return_rsci_d[27]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[27]_i_13 
       (.I0(vector_i_85_n_0),
        .I1(vec_rsc_qb[25]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[25]),
        .O(\return_rsci_d[27]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[27]_i_14 
       (.I0(vector_i_86_n_0),
        .I1(vec_rsc_qb[24]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[24]),
        .O(\return_rsci_d[27]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[27]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[27]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[27]),
        .O(\return_rsci_d[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[27]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[26]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[26]),
        .O(\return_rsci_d[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[27]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[25]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[25]),
        .O(\return_rsci_d[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[27]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[24]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[24]),
        .O(\return_rsci_d[27]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[27]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[27]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[27]),
        .I3(vector__1_i_20_0),
        .I4(input_0[27]),
        .O(MUX_v_32_2_2_return0_in[27]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[27]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[26]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[26]),
        .I3(vector__1_i_20_0),
        .I4(input_0[26]),
        .O(MUX_v_32_2_2_return0_in[26]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[27]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[25]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[25]),
        .I3(vector__1_i_20_0),
        .I4(input_0[25]),
        .O(MUX_v_32_2_2_return0_in[25]));
  LUT6 #(
    .INIT(64'h474747B8B8B847B8)) 
    \return_rsci_d[31]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[31]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[31]),
        .I3(vec_rsc_qb[31]),
        .I4(vec_rsci_bcwt_1_reg_0),
        .I5(vec_rsci_qa_d_bfwt_63_32[31]),
        .O(\return_rsci_d[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[31]_i_11 
       (.I0(vector_i_78_n_0),
        .I1(vec_rsc_qb[30]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[30]),
        .O(\return_rsci_d[31]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[31]_i_12 
       (.I0(vector_i_75_n_0),
        .I1(vec_rsc_qb[29]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[29]),
        .O(\return_rsci_d[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[31]_i_13 
       (.I0(vector_i_76_n_0),
        .I1(vec_rsc_qb[28]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[28]),
        .O(\return_rsci_d[31]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \return_rsci_d[31]_i_16 
       (.I0(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31]),
        .O(\return_rsci_d[31]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[31]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[31]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31]),
        .O(\return_rsci_d[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[31]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[30]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[30]),
        .O(\return_rsci_d[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[31]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[29]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[29]),
        .O(\return_rsci_d[31]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[31]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[28]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[28]),
        .O(\return_rsci_d[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[31]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[30]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[30]),
        .I3(vector__1_i_20_0),
        .I4(input_0[30]),
        .O(MUX_v_32_2_2_return0_in[30]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[31]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[29]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[29]),
        .I3(vector__1_i_20_0),
        .I4(input_0[29]),
        .O(MUX_v_32_2_2_return0_in[29]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[31]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[28]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[28]),
        .I3(vector__1_i_20_0),
        .I4(input_0[28]),
        .O(MUX_v_32_2_2_return0_in[28]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[3]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[1]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[1]),
        .I3(vector__1_i_20_0),
        .I4(input_0[1]),
        .O(MUX_v_32_2_2_return0_in[1]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[3]_i_11 
       (.I0(vec_rsci_qa_d_bfwt_31_0[0]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[0]),
        .I3(vector__1_i_20_0),
        .I4(input_0[0]),
        .O(MUX_v_32_2_2_return0_in[0]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[3]_i_12 
       (.I0(vector__1_i_75_n_0),
        .I1(vec_rsc_qb[3]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[3]),
        .O(\return_rsci_d[3]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[3]_i_13 
       (.I0(vector__1_i_80_n_0),
        .I1(vec_rsc_qb[2]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[2]),
        .O(\return_rsci_d[3]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[3]_i_14 
       (.I0(vector__1_i_81_n_0),
        .I1(vec_rsc_qb[1]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[1]),
        .O(\return_rsci_d[3]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h474747B8B8B847B8)) 
    \return_rsci_d[3]_i_15 
       (.I0(vec_rsci_qa_d_bfwt_31_0[0]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[0]),
        .I3(vec_rsc_qb[0]),
        .I4(vec_rsci_bcwt_1_reg_0),
        .I5(vec_rsci_qa_d_bfwt_63_32[0]),
        .O(\return_rsci_d[3]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \return_rsci_d[3]_i_2 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .O(\return_rsci_d[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[3]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[3]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[3]),
        .O(\return_rsci_d[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[3]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[2]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[2]),
        .O(\return_rsci_d[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[3]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[1]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[1]),
        .O(\return_rsci_d[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[3]_i_7 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[0]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[0]),
        .O(\return_rsci_d[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[3]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[3]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[3]),
        .I3(vector__1_i_20_0),
        .I4(input_0[3]),
        .O(MUX_v_32_2_2_return0_in[3]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[3]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[2]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[2]),
        .I3(vector__1_i_20_0),
        .I4(input_0[2]),
        .O(MUX_v_32_2_2_return0_in[2]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[7]_i_10 
       (.I0(vec_rsci_qa_d_bfwt_31_0[4]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[4]),
        .I3(vector__1_i_20_0),
        .I4(input_0[4]),
        .O(MUX_v_32_2_2_return0_in[4]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[7]_i_11 
       (.I0(vector__1_i_67_n_0),
        .I1(vec_rsc_qb[7]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[7]),
        .O(\return_rsci_d[7]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[7]_i_12 
       (.I0(vector__1_i_72_n_0),
        .I1(vec_rsc_qb[6]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[6]),
        .O(\return_rsci_d[7]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[7]_i_13 
       (.I0(vector__1_i_73_n_0),
        .I1(vec_rsc_qb[5]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[5]),
        .O(\return_rsci_d[7]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \return_rsci_d[7]_i_14 
       (.I0(vector__1_i_74_n_0),
        .I1(vec_rsc_qb[4]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[4]),
        .O(\return_rsci_d[7]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[7]_i_3 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[7]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[7]),
        .O(\return_rsci_d[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[7]_i_4 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[6]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[6]),
        .O(\return_rsci_d[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[7]_i_5 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[5]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[5]),
        .O(\return_rsci_d[7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \return_rsci_d[7]_i_6 
       (.I0(\return_rsci_d_reg[31]_i_14_n_3 ),
        .I1(Q[4]),
        .I2(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[4]),
        .O(\return_rsci_d[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[7]_i_7 
       (.I0(vec_rsci_qa_d_bfwt_31_0[7]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[7]),
        .I3(vector__1_i_20_0),
        .I4(input_0[7]),
        .O(MUX_v_32_2_2_return0_in[7]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[7]_i_8 
       (.I0(vec_rsci_qa_d_bfwt_31_0[6]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[6]),
        .I3(vector__1_i_20_0),
        .I4(input_0[6]),
        .O(MUX_v_32_2_2_return0_in[6]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \return_rsci_d[7]_i_9 
       (.I0(vec_rsci_qa_d_bfwt_31_0[5]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[5]),
        .I3(vector__1_i_20_0),
        .I4(input_0[5]),
        .O(MUX_v_32_2_2_return0_in[5]));
  CARRY4 \return_rsci_d_reg[11]_i_1 
       (.CI(\return_rsci_d_reg[7]_i_1_n_0 ),
        .CO({\return_rsci_d_reg[11]_i_1_n_0 ,\return_rsci_d_reg[11]_i_1_n_1 ,\return_rsci_d_reg[11]_i_1_n_2 ,\return_rsci_d_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[11:8]),
        .O(\p_sva_reg[31] [11:8]),
        .S({\return_rsci_d[11]_i_3_n_0 ,\return_rsci_d[11]_i_4_n_0 ,\return_rsci_d[11]_i_5_n_0 ,\return_rsci_d[11]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[11]_i_2 
       (.CI(\return_rsci_d_reg[7]_i_2_n_0 ),
        .CO({\return_rsci_d_reg[11]_i_2_n_0 ,\return_rsci_d_reg[11]_i_2_n_1 ,\return_rsci_d_reg[11]_i_2_n_2 ,\return_rsci_d_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[11:8]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[11:8]),
        .S({\return_rsci_d[11]_i_11_n_0 ,\return_rsci_d[11]_i_12_n_0 ,\return_rsci_d[11]_i_13_n_0 ,\return_rsci_d[11]_i_14_n_0 }));
  CARRY4 \return_rsci_d_reg[15]_i_1 
       (.CI(\return_rsci_d_reg[11]_i_1_n_0 ),
        .CO({\return_rsci_d_reg[15]_i_1_n_0 ,\return_rsci_d_reg[15]_i_1_n_1 ,\return_rsci_d_reg[15]_i_1_n_2 ,\return_rsci_d_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[15:12]),
        .O(\p_sva_reg[31] [15:12]),
        .S({\return_rsci_d[15]_i_3_n_0 ,\return_rsci_d[15]_i_4_n_0 ,\return_rsci_d[15]_i_5_n_0 ,\return_rsci_d[15]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[15]_i_2 
       (.CI(\return_rsci_d_reg[11]_i_2_n_0 ),
        .CO({\return_rsci_d_reg[15]_i_2_n_0 ,\return_rsci_d_reg[15]_i_2_n_1 ,\return_rsci_d_reg[15]_i_2_n_2 ,\return_rsci_d_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[15:12]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[15:12]),
        .S({\return_rsci_d[15]_i_11_n_0 ,\return_rsci_d[15]_i_12_n_0 ,\return_rsci_d[15]_i_13_n_0 ,\return_rsci_d[15]_i_14_n_0 }));
  CARRY4 \return_rsci_d_reg[19]_i_1 
       (.CI(\return_rsci_d_reg[15]_i_1_n_0 ),
        .CO({\return_rsci_d_reg[19]_i_1_n_0 ,\return_rsci_d_reg[19]_i_1_n_1 ,\return_rsci_d_reg[19]_i_1_n_2 ,\return_rsci_d_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[19:16]),
        .O(\p_sva_reg[31] [19:16]),
        .S({\return_rsci_d[19]_i_3_n_0 ,\return_rsci_d[19]_i_4_n_0 ,\return_rsci_d[19]_i_5_n_0 ,\return_rsci_d[19]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[19]_i_2 
       (.CI(\return_rsci_d_reg[15]_i_2_n_0 ),
        .CO({\return_rsci_d_reg[19]_i_2_n_0 ,\return_rsci_d_reg[19]_i_2_n_1 ,\return_rsci_d_reg[19]_i_2_n_2 ,\return_rsci_d_reg[19]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[19:16]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[19:16]),
        .S({\return_rsci_d[19]_i_11_n_0 ,\return_rsci_d[19]_i_12_n_0 ,\return_rsci_d[19]_i_13_n_0 ,\return_rsci_d[19]_i_14_n_0 }));
  CARRY4 \return_rsci_d_reg[23]_i_1 
       (.CI(\return_rsci_d_reg[19]_i_1_n_0 ),
        .CO({\return_rsci_d_reg[23]_i_1_n_0 ,\return_rsci_d_reg[23]_i_1_n_1 ,\return_rsci_d_reg[23]_i_1_n_2 ,\return_rsci_d_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[23:20]),
        .O(\p_sva_reg[31] [23:20]),
        .S({\return_rsci_d[23]_i_3_n_0 ,\return_rsci_d[23]_i_4_n_0 ,\return_rsci_d[23]_i_5_n_0 ,\return_rsci_d[23]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[23]_i_2 
       (.CI(\return_rsci_d_reg[19]_i_2_n_0 ),
        .CO({\return_rsci_d_reg[23]_i_2_n_0 ,\return_rsci_d_reg[23]_i_2_n_1 ,\return_rsci_d_reg[23]_i_2_n_2 ,\return_rsci_d_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[23:20]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[23:20]),
        .S({\return_rsci_d[23]_i_11_n_0 ,\return_rsci_d[23]_i_12_n_0 ,\return_rsci_d[23]_i_13_n_0 ,\return_rsci_d[23]_i_14_n_0 }));
  CARRY4 \return_rsci_d_reg[27]_i_1 
       (.CI(\return_rsci_d_reg[23]_i_1_n_0 ),
        .CO({\return_rsci_d_reg[27]_i_1_n_0 ,\return_rsci_d_reg[27]_i_1_n_1 ,\return_rsci_d_reg[27]_i_1_n_2 ,\return_rsci_d_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[27:24]),
        .O(\p_sva_reg[31] [27:24]),
        .S({\return_rsci_d[27]_i_3_n_0 ,\return_rsci_d[27]_i_4_n_0 ,\return_rsci_d[27]_i_5_n_0 ,\return_rsci_d[27]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[27]_i_2 
       (.CI(\return_rsci_d_reg[23]_i_2_n_0 ),
        .CO({\return_rsci_d_reg[27]_i_2_n_0 ,\return_rsci_d_reg[27]_i_2_n_1 ,\return_rsci_d_reg[27]_i_2_n_2 ,\return_rsci_d_reg[27]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[27:24]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[27:24]),
        .S({\return_rsci_d[27]_i_11_n_0 ,\return_rsci_d[27]_i_12_n_0 ,\return_rsci_d[27]_i_13_n_0 ,\return_rsci_d[27]_i_14_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_1 
       (.CI(\return_rsci_d_reg[27]_i_1_n_0 ),
        .CO({\NLW_return_rsci_d_reg[31]_i_1_CO_UNCONNECTED [3],\return_rsci_d_reg[31]_i_1_n_1 ,\return_rsci_d_reg[31]_i_1_n_2 ,\return_rsci_d_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[30:28]}),
        .O(\p_sva_reg[31] [31:28]),
        .S({\return_rsci_d[31]_i_3_n_0 ,\return_rsci_d[31]_i_4_n_0 ,\return_rsci_d[31]_i_5_n_0 ,\return_rsci_d[31]_i_6_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_14 
       (.CI(CO),
        .CO({\NLW_return_rsci_d_reg[31]_i_14_CO_UNCONNECTED [3:1],\return_rsci_d_reg[31]_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31]}),
        .O(\NLW_return_rsci_d_reg[31]_i_14_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\return_rsci_d[31]_i_16_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[31]_i_2 
       (.CI(\return_rsci_d_reg[27]_i_2_n_0 ),
        .CO({\NLW_return_rsci_d_reg[31]_i_2_CO_UNCONNECTED [3],\return_rsci_d_reg[31]_i_2_n_1 ,\return_rsci_d_reg[31]_i_2_n_2 ,\return_rsci_d_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,MUX_v_32_2_2_return0_in[30:28]}),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:28]),
        .S({\return_rsci_d[31]_i_10_n_0 ,\return_rsci_d[31]_i_11_n_0 ,\return_rsci_d[31]_i_12_n_0 ,\return_rsci_d[31]_i_13_n_0 }));
  CARRY4 \return_rsci_d_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\return_rsci_d_reg[3]_i_1_n_0 ,\return_rsci_d_reg[3]_i_1_n_1 ,\return_rsci_d_reg[3]_i_1_n_2 ,\return_rsci_d_reg[3]_i_1_n_3 }),
        .CYINIT(\return_rsci_d[3]_i_2_n_0 ),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[3:0]),
        .O(\p_sva_reg[31] [3:0]),
        .S({\return_rsci_d[3]_i_4_n_0 ,\return_rsci_d[3]_i_5_n_0 ,\return_rsci_d[3]_i_6_n_0 ,\return_rsci_d[3]_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\return_rsci_d_reg[3]_i_3_n_0 ,\return_rsci_d_reg[3]_i_3_n_1 ,\return_rsci_d_reg[3]_i_3_n_2 ,\return_rsci_d_reg[3]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[3:0]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[3:0]),
        .S({\return_rsci_d[3]_i_12_n_0 ,\return_rsci_d[3]_i_13_n_0 ,\return_rsci_d[3]_i_14_n_0 ,\return_rsci_d[3]_i_15_n_0 }));
  CARRY4 \return_rsci_d_reg[7]_i_1 
       (.CI(\return_rsci_d_reg[3]_i_1_n_0 ),
        .CO({\return_rsci_d_reg[7]_i_1_n_0 ,\return_rsci_d_reg[7]_i_1_n_1 ,\return_rsci_d_reg[7]_i_1_n_2 ,\return_rsci_d_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[7:4]),
        .O(\p_sva_reg[31] [7:4]),
        .S({\return_rsci_d[7]_i_3_n_0 ,\return_rsci_d[7]_i_4_n_0 ,\return_rsci_d[7]_i_5_n_0 ,\return_rsci_d[7]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \return_rsci_d_reg[7]_i_2 
       (.CI(\return_rsci_d_reg[3]_i_3_n_0 ),
        .CO({\return_rsci_d_reg[7]_i_2_n_0 ,\return_rsci_d_reg[7]_i_2_n_1 ,\return_rsci_d_reg[7]_i_2_n_2 ,\return_rsci_d_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(MUX_v_32_2_2_return0_in[7:4]),
        .O(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[7:4]),
        .S({\return_rsci_d[7]_i_11_n_0 ,\return_rsci_d[7]_i_12_n_0 ,\return_rsci_d[7]_i_13_n_0 ,\return_rsci_d[7]_i_14_n_0 }));
  FDRE vec_rsci_bcwt_1_reg
       (.C(clk),
        .CE(1'b1),
        .D(vec_rsci_bcwt_1_reg_1),
        .Q(vec_rsci_bcwt_1_reg_0),
        .R(rst));
  FDRE vec_rsci_bcwt_reg
       (.C(clk),
        .CE(1'b1),
        .D(vec_rsci_bcwt_reg_1),
        .Q(vec_rsci_bcwt_reg_0),
        .R(rst));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[0] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[0]),
        .Q(vec_rsci_qa_d_bfwt_31_0[0]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[10] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[10]),
        .Q(vec_rsci_qa_d_bfwt_31_0[10]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[11] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[11]),
        .Q(vec_rsci_qa_d_bfwt_31_0[11]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[12] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[12]),
        .Q(vec_rsci_qa_d_bfwt_31_0[12]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[13] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[13]),
        .Q(vec_rsci_qa_d_bfwt_31_0[13]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[14] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[14]),
        .Q(vec_rsci_qa_d_bfwt_31_0[14]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[15] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[15]),
        .Q(vec_rsci_qa_d_bfwt_31_0[15]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[16] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[16]),
        .Q(vec_rsci_qa_d_bfwt_31_0[16]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[17] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[17]),
        .Q(vec_rsci_qa_d_bfwt_31_0[17]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[18] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[18]),
        .Q(vec_rsci_qa_d_bfwt_31_0[18]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[19] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[19]),
        .Q(vec_rsci_qa_d_bfwt_31_0[19]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[1] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[1]),
        .Q(vec_rsci_qa_d_bfwt_31_0[1]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[20] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[20]),
        .Q(vec_rsci_qa_d_bfwt_31_0[20]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[21] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[21]),
        .Q(vec_rsci_qa_d_bfwt_31_0[21]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[22] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[22]),
        .Q(vec_rsci_qa_d_bfwt_31_0[22]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[23] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[23]),
        .Q(vec_rsci_qa_d_bfwt_31_0[23]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[24] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[24]),
        .Q(vec_rsci_qa_d_bfwt_31_0[24]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[25] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[25]),
        .Q(vec_rsci_qa_d_bfwt_31_0[25]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[26] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[26]),
        .Q(vec_rsci_qa_d_bfwt_31_0[26]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[27] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[27]),
        .Q(vec_rsci_qa_d_bfwt_31_0[27]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[28] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[28]),
        .Q(vec_rsci_qa_d_bfwt_31_0[28]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[29] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[29]),
        .Q(vec_rsci_qa_d_bfwt_31_0[29]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[2] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[2]),
        .Q(vec_rsci_qa_d_bfwt_31_0[2]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[30] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[30]),
        .Q(vec_rsci_qa_d_bfwt_31_0[30]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[31] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[31]),
        .Q(vec_rsci_qa_d_bfwt_31_0[31]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[3] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[3]),
        .Q(vec_rsci_qa_d_bfwt_31_0[3]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[4] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[4]),
        .Q(vec_rsci_qa_d_bfwt_31_0[4]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[5] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[5]),
        .Q(vec_rsci_qa_d_bfwt_31_0[5]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[6] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[6]),
        .Q(vec_rsci_qa_d_bfwt_31_0[6]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[7] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[7]),
        .Q(vec_rsci_qa_d_bfwt_31_0[7]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[8] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[8]),
        .Q(vec_rsci_qa_d_bfwt_31_0[8]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_31_0_reg[9] 
       (.C(clk),
        .CE(E),
        .D(vec_rsc_qa[9]),
        .Q(vec_rsci_qa_d_bfwt_31_0[9]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[0] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[0]),
        .Q(vec_rsci_qa_d_bfwt_63_32[0]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[10] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[10]),
        .Q(vec_rsci_qa_d_bfwt_63_32[10]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[11] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[11]),
        .Q(vec_rsci_qa_d_bfwt_63_32[11]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[12] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[12]),
        .Q(vec_rsci_qa_d_bfwt_63_32[12]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[13] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[13]),
        .Q(vec_rsci_qa_d_bfwt_63_32[13]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[14] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[14]),
        .Q(vec_rsci_qa_d_bfwt_63_32[14]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[15] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[15]),
        .Q(vec_rsci_qa_d_bfwt_63_32[15]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[16] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[16]),
        .Q(vec_rsci_qa_d_bfwt_63_32[16]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[17] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[17]),
        .Q(vec_rsci_qa_d_bfwt_63_32[17]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[18] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[18]),
        .Q(vec_rsci_qa_d_bfwt_63_32[18]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[19] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[19]),
        .Q(vec_rsci_qa_d_bfwt_63_32[19]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[1] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[1]),
        .Q(vec_rsci_qa_d_bfwt_63_32[1]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[20] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[20]),
        .Q(vec_rsci_qa_d_bfwt_63_32[20]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[21] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[21]),
        .Q(vec_rsci_qa_d_bfwt_63_32[21]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[22] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[22]),
        .Q(vec_rsci_qa_d_bfwt_63_32[22]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[23] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[23]),
        .Q(vec_rsci_qa_d_bfwt_63_32[23]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[24] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[24]),
        .Q(vec_rsci_qa_d_bfwt_63_32[24]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[25] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[25]),
        .Q(vec_rsci_qa_d_bfwt_63_32[25]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[26] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[26]),
        .Q(vec_rsci_qa_d_bfwt_63_32[26]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[27] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[27]),
        .Q(vec_rsci_qa_d_bfwt_63_32[27]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[28] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[28]),
        .Q(vec_rsci_qa_d_bfwt_63_32[28]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[29] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[29]),
        .Q(vec_rsci_qa_d_bfwt_63_32[29]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[2] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[2]),
        .Q(vec_rsci_qa_d_bfwt_63_32[2]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[30] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[30]),
        .Q(vec_rsci_qa_d_bfwt_63_32[30]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[31] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[31]),
        .Q(vec_rsci_qa_d_bfwt_63_32[31]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[3] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[3]),
        .Q(vec_rsci_qa_d_bfwt_63_32[3]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[4] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[4]),
        .Q(vec_rsci_qa_d_bfwt_63_32[4]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[5] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[5]),
        .Q(vec_rsci_qa_d_bfwt_63_32[5]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[6] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[6]),
        .Q(vec_rsci_qa_d_bfwt_63_32[6]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[7] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[7]),
        .Q(vec_rsci_qa_d_bfwt_63_32[7]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[8] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[8]),
        .Q(vec_rsci_qa_d_bfwt_63_32[8]),
        .R(1'b0));
  FDRE \vec_rsci_qa_d_bfwt_63_32_reg[9] 
       (.C(clk),
        .CE(\vec_rsci_qa_d_bfwt_63_32_reg[31]_0 ),
        .D(vec_rsc_qb[9]),
        .Q(vec_rsci_qa_d_bfwt_63_32[9]),
        .R(1'b0));
  CARRY4 vector__1_i_1
       (.CI(vector__1_i_2_n_0),
        .CO({vector__1_i_1_n_0,vector__1_i_1_n_1,vector__1_i_1_n_2,vector__1_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[16:13]),
        .O(out[15:12]),
        .S({vector__1_i_6_n_0,vector__1_i_7_n_0,vector__1_i_8_n_0,vector__1_i_9_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector__1_i_10
       (.CI(vector__1_i_15_n_0),
        .CO({vector__1_i_10_n_0,vector__1_i_10_n_1,vector__1_i_10_n_2,vector__1_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({vector__1_i_33_n_0,vector__1_i_34_n_0,vector__1_i_35_n_0,vector__1_i_36_n_0}),
        .O(acc_13_nl[12:9]),
        .S({vector__1_i_37_n_0,vector__1_i_38_n_0,vector__1_i_39_n_0,vector__1_i_40_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_11
       (.I0(O),
        .I1(Q[11]),
        .I2(acc_13_nl[12]),
        .O(vector__1_i_11_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_12
       (.I0(O),
        .I1(Q[10]),
        .I2(acc_13_nl[11]),
        .O(vector__1_i_12_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_13
       (.I0(O),
        .I1(Q[9]),
        .I2(acc_13_nl[10]),
        .O(vector__1_i_13_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_14
       (.I0(O),
        .I1(Q[8]),
        .I2(acc_13_nl[9]),
        .O(vector__1_i_14_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector__1_i_15
       (.CI(vector__1_i_20_n_0),
        .CO({vector__1_i_15_n_0,vector__1_i_15_n_1,vector__1_i_15_n_2,vector__1_i_15_n_3}),
        .CYINIT(1'b0),
        .DI({vector__1_i_41_n_0,vector__1_i_42_n_0,vector__1_i_43_n_0,vector__1_i_44_n_0}),
        .O(acc_13_nl[8:5]),
        .S({vector__1_i_45_n_0,vector__1_i_46_n_0,vector__1_i_47_n_0,vector__1_i_48_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_16
       (.I0(O),
        .I1(Q[7]),
        .I2(acc_13_nl[8]),
        .O(vector__1_i_16_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_17
       (.I0(O),
        .I1(Q[6]),
        .I2(acc_13_nl[7]),
        .O(vector__1_i_17_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_18
       (.I0(O),
        .I1(Q[5]),
        .I2(acc_13_nl[6]),
        .O(vector__1_i_18_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_19
       (.I0(O),
        .I1(Q[4]),
        .I2(acc_13_nl[5]),
        .O(vector__1_i_19_n_0));
  CARRY4 vector__1_i_2
       (.CI(vector__1_i_3_n_0),
        .CO({vector__1_i_2_n_0,vector__1_i_2_n_1,vector__1_i_2_n_2,vector__1_i_2_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[12:9]),
        .O(out[11:8]),
        .S({vector__1_i_11_n_0,vector__1_i_12_n_0,vector__1_i_13_n_0,vector__1_i_14_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector__1_i_20
       (.CI(1'b0),
        .CO({vector__1_i_20_n_0,vector__1_i_20_n_1,vector__1_i_20_n_2,vector__1_i_20_n_3}),
        .CYINIT(1'b0),
        .DI({vector__1_i_49_n_0,vector__1_i_50_n_0,vector__1_i_51_n_0,1'b0}),
        .O(acc_13_nl[4:1]),
        .S({vector__1_i_52_n_0,vector__1_i_53_n_0,vector__1_i_54_n_0,vector__1_i_55_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_21
       (.I0(O),
        .I1(Q[3]),
        .I2(acc_13_nl[4]),
        .O(vector__1_i_21_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_22
       (.I0(O),
        .I1(Q[2]),
        .I2(acc_13_nl[3]),
        .O(vector__1_i_22_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_23
       (.I0(O),
        .I1(Q[1]),
        .I2(acc_13_nl[2]),
        .O(vector__1_i_23_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_24
       (.I0(O),
        .I1(Q[0]),
        .I2(acc_13_nl[1]),
        .O(vector__1_i_24_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_25
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[14]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[14]),
        .I4(vector__1_i_56_n_0),
        .O(vector__1_i_25_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_26
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[13]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[13]),
        .I4(vector__1_i_57_n_0),
        .O(vector__1_i_26_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_27
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[12]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[12]),
        .I4(vector__1_i_58_n_0),
        .O(vector__1_i_27_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_28
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[11]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[11]),
        .I4(vector__1_i_59_n_0),
        .O(vector__1_i_28_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_29
       (.I0(vector__1_i_56_n_0),
        .I1(input_0[14]),
        .I2(input_0[15]),
        .I3(vector_i_103_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_29_n_0));
  CARRY4 vector__1_i_3
       (.CI(vector__1_i_4_n_0),
        .CO({vector__1_i_3_n_0,vector__1_i_3_n_1,vector__1_i_3_n_2,vector__1_i_3_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[8:5]),
        .O(out[7:4]),
        .S({vector__1_i_16_n_0,vector__1_i_17_n_0,vector__1_i_18_n_0,vector__1_i_19_n_0}));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_30
       (.I0(vector__1_i_57_n_0),
        .I1(input_0[13]),
        .I2(input_0[14]),
        .I3(vector__1_i_56_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_30_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_31
       (.I0(vector__1_i_58_n_0),
        .I1(input_0[12]),
        .I2(input_0[13]),
        .I3(vector__1_i_57_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_31_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_32
       (.I0(vector__1_i_59_n_0),
        .I1(input_0[11]),
        .I2(input_0[12]),
        .I3(vector__1_i_58_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_32_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_33
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[10]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[10]),
        .I4(vector__1_i_64_n_0),
        .O(vector__1_i_33_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_34
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[9]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[9]),
        .I4(vector__1_i_65_n_0),
        .O(vector__1_i_34_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_35
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[8]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[8]),
        .I4(vector__1_i_66_n_0),
        .O(vector__1_i_35_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_36
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[7]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[7]),
        .I4(vector__1_i_67_n_0),
        .O(vector__1_i_36_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_37
       (.I0(vector__1_i_64_n_0),
        .I1(input_0[10]),
        .I2(input_0[11]),
        .I3(vector__1_i_59_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_37_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_38
       (.I0(vector__1_i_65_n_0),
        .I1(input_0[9]),
        .I2(input_0[10]),
        .I3(vector__1_i_64_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_38_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_39
       (.I0(vector__1_i_66_n_0),
        .I1(input_0[8]),
        .I2(input_0[9]),
        .I3(vector__1_i_65_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_39_n_0));
  CARRY4 vector__1_i_4
       (.CI(1'b0),
        .CO({vector__1_i_4_n_0,vector__1_i_4_n_1,vector__1_i_4_n_2,vector__1_i_4_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[4:1]),
        .O(out[3:0]),
        .S({vector__1_i_21_n_0,vector__1_i_22_n_0,vector__1_i_23_n_0,vector__1_i_24_n_0}));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_40
       (.I0(vector__1_i_67_n_0),
        .I1(input_0[7]),
        .I2(input_0[8]),
        .I3(vector__1_i_66_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_40_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_41
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[6]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[6]),
        .I4(vector__1_i_72_n_0),
        .O(vector__1_i_41_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_42
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[5]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[5]),
        .I4(vector__1_i_73_n_0),
        .O(vector__1_i_42_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_43
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[4]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[4]),
        .I4(vector__1_i_74_n_0),
        .O(vector__1_i_43_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_44
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[3]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[3]),
        .I4(vector__1_i_75_n_0),
        .O(vector__1_i_44_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_45
       (.I0(vector__1_i_72_n_0),
        .I1(input_0[6]),
        .I2(input_0[7]),
        .I3(vector__1_i_67_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_45_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_46
       (.I0(vector__1_i_73_n_0),
        .I1(input_0[5]),
        .I2(input_0[6]),
        .I3(vector__1_i_72_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_46_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_47
       (.I0(vector__1_i_74_n_0),
        .I1(input_0[4]),
        .I2(input_0[5]),
        .I3(vector__1_i_73_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_47_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_48
       (.I0(vector__1_i_75_n_0),
        .I1(input_0[3]),
        .I2(input_0[4]),
        .I3(vector__1_i_74_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_48_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_49
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[2]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[2]),
        .I4(vector__1_i_80_n_0),
        .O(vector__1_i_49_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector__1_i_5
       (.CI(vector__1_i_10_n_0),
        .CO({vector__1_i_5_n_0,vector__1_i_5_n_1,vector__1_i_5_n_2,vector__1_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({vector__1_i_25_n_0,vector__1_i_26_n_0,vector__1_i_27_n_0,vector__1_i_28_n_0}),
        .O(acc_13_nl[16:13]),
        .S({vector__1_i_29_n_0,vector__1_i_30_n_0,vector__1_i_31_n_0,vector__1_i_32_n_0}));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector__1_i_50
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[1]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[1]),
        .I4(vector__1_i_81_n_0),
        .O(vector__1_i_50_n_0));
  LUT5 #(
    .INIT(32'hEEE777E7)) 
    vector__1_i_51
       (.I0(vector__1_i_20_0),
        .I1(input_0[0]),
        .I2(vec_rsc_qa[0]),
        .I3(vec_rsci_bcwt_reg_0),
        .I4(vec_rsci_qa_d_bfwt_31_0[0]),
        .O(vector__1_i_51_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_52
       (.I0(vector__1_i_80_n_0),
        .I1(input_0[2]),
        .I2(input_0[3]),
        .I3(vector__1_i_75_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_52_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector__1_i_53
       (.I0(vector__1_i_81_n_0),
        .I1(input_0[1]),
        .I2(input_0[2]),
        .I3(vector__1_i_80_n_0),
        .I4(vector__1_i_20_0),
        .O(vector__1_i_53_n_0));
  LUT5 #(
    .INIT(32'h656A9A95)) 
    vector__1_i_54
       (.I0(vector__1_i_51_n_0),
        .I1(vec_rsci_qa_d_bfwt_63_32[1]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsc_qb[1]),
        .I4(vector__1_i_81_n_0),
        .O(vector__1_i_54_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    vector__1_i_55
       (.I0(input_0[0]),
        .I1(vec_rsc_qa[0]),
        .I2(vec_rsci_bcwt_reg_0),
        .I3(vec_rsci_qa_d_bfwt_31_0[0]),
        .O(vector__1_i_55_n_0));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_56
       (.I0(vec_rsci_qa_d_bfwt_31_0[14]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[14]),
        .O(vector__1_i_56_n_0));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_57
       (.I0(vec_rsci_qa_d_bfwt_31_0[13]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[13]),
        .O(vector__1_i_57_n_0));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_58
       (.I0(vec_rsci_qa_d_bfwt_31_0[12]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[12]),
        .O(vector__1_i_58_n_0));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_59
       (.I0(vec_rsci_qa_d_bfwt_31_0[11]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[11]),
        .O(vector__1_i_59_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_6
       (.I0(O),
        .I1(Q[15]),
        .I2(acc_13_nl[16]),
        .O(vector__1_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_60
       (.I0(vec_rsci_qa_d_bfwt_63_32[14]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[14]),
        .O(input_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_61
       (.I0(vec_rsci_qa_d_bfwt_63_32[13]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[13]),
        .O(input_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_62
       (.I0(vec_rsci_qa_d_bfwt_63_32[12]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[12]),
        .O(input_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_63
       (.I0(vec_rsci_qa_d_bfwt_63_32[11]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[11]),
        .O(input_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_64
       (.I0(vec_rsci_qa_d_bfwt_31_0[10]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[10]),
        .O(vector__1_i_64_n_0));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_65
       (.I0(vec_rsci_qa_d_bfwt_31_0[9]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[9]),
        .O(vector__1_i_65_n_0));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_66
       (.I0(vec_rsci_qa_d_bfwt_31_0[8]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[8]),
        .O(vector__1_i_66_n_0));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_67
       (.I0(vec_rsci_qa_d_bfwt_31_0[7]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[7]),
        .O(vector__1_i_67_n_0));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_68
       (.I0(vec_rsci_qa_d_bfwt_63_32[10]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[10]),
        .O(input_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_69
       (.I0(vec_rsci_qa_d_bfwt_63_32[9]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[9]),
        .O(input_0[9]));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_7
       (.I0(O),
        .I1(Q[14]),
        .I2(acc_13_nl[15]),
        .O(vector__1_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_70
       (.I0(vec_rsci_qa_d_bfwt_63_32[8]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[8]),
        .O(input_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_71
       (.I0(vec_rsci_qa_d_bfwt_63_32[7]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[7]),
        .O(input_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_72
       (.I0(vec_rsci_qa_d_bfwt_31_0[6]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[6]),
        .O(vector__1_i_72_n_0));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_73
       (.I0(vec_rsci_qa_d_bfwt_31_0[5]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[5]),
        .O(vector__1_i_73_n_0));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_74
       (.I0(vec_rsci_qa_d_bfwt_31_0[4]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[4]),
        .O(vector__1_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_75
       (.I0(vec_rsci_qa_d_bfwt_31_0[3]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[3]),
        .O(vector__1_i_75_n_0));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_76
       (.I0(vec_rsci_qa_d_bfwt_63_32[6]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[6]),
        .O(input_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_77
       (.I0(vec_rsci_qa_d_bfwt_63_32[5]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[5]),
        .O(input_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_78
       (.I0(vec_rsci_qa_d_bfwt_63_32[4]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[4]),
        .O(input_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_79
       (.I0(vec_rsci_qa_d_bfwt_63_32[3]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[3]),
        .O(input_0[3]));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_8
       (.I0(O),
        .I1(Q[13]),
        .I2(acc_13_nl[14]),
        .O(vector__1_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_80
       (.I0(vec_rsci_qa_d_bfwt_31_0[2]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[2]),
        .O(vector__1_i_80_n_0));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_81
       (.I0(vec_rsci_qa_d_bfwt_31_0[1]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[1]),
        .O(vector__1_i_81_n_0));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_82
       (.I0(vec_rsci_qa_d_bfwt_63_32[0]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[0]),
        .O(input_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_83
       (.I0(vec_rsci_qa_d_bfwt_63_32[2]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[2]),
        .O(input_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector__1_i_84
       (.I0(vec_rsci_qa_d_bfwt_63_32[1]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[1]),
        .O(input_0[1]));
  LUT3 #(
    .INIT(8'h78)) 
    vector__1_i_9
       (.I0(O),
        .I1(Q[12]),
        .I2(acc_13_nl[13]),
        .O(vector__1_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_100
       (.I0(vec_rsci_qa_d_bfwt_31_0[18]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[18]),
        .O(vector_i_100_n_0));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_101
       (.I0(vec_rsci_qa_d_bfwt_31_0[17]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[17]),
        .O(vector_i_101_n_0));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_102
       (.I0(vec_rsci_qa_d_bfwt_31_0[16]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[16]),
        .O(vector_i_102_n_0));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_103
       (.I0(vec_rsci_qa_d_bfwt_31_0[15]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[15]),
        .O(vector_i_103_n_0));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_104
       (.I0(vec_rsci_qa_d_bfwt_63_32[18]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[18]),
        .O(input_0[18]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_105
       (.I0(vec_rsci_qa_d_bfwt_63_32[17]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[17]),
        .O(input_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_106
       (.I0(vec_rsci_qa_d_bfwt_63_32[16]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[16]),
        .O(input_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_107
       (.I0(vec_rsci_qa_d_bfwt_63_32[15]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[15]),
        .O(input_0[15]));
  CARRY4 vector_i_2
       (.CI(vector_i_3_n_0),
        .CO({NLW_vector_i_2_CO_UNCONNECTED[3],vector_i_2_n_1,vector_i_2_n_2,vector_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,acc_13_nl[31:29]}),
        .O(out[31:28]),
        .S({S,vector_i_25_n_0,vector_i_26_n_0,vector_i_27_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector_i_23
       (.CI(vector_i_28_n_0),
        .CO({NLW_vector_i_23_CO_UNCONNECTED[3],vector_i_23_n_1,vector_i_23_n_2,vector_i_23_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,vector_i_43_n_0,vector_i_44_n_0,vector_i_45_n_0}),
        .O({O,acc_13_nl[31:29]}),
        .S({vector_i_46_n_0,vector_i_47_n_0,vector_i_48_n_0,vector_i_49_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_25
       (.I0(O),
        .I1(Q[30]),
        .I2(acc_13_nl[31]),
        .O(vector_i_25_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_26
       (.I0(O),
        .I1(Q[29]),
        .I2(acc_13_nl[30]),
        .O(vector_i_26_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_27
       (.I0(O),
        .I1(Q[28]),
        .I2(acc_13_nl[29]),
        .O(vector_i_27_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector_i_28
       (.CI(vector_i_33_n_0),
        .CO({vector_i_28_n_0,vector_i_28_n_1,vector_i_28_n_2,vector_i_28_n_3}),
        .CYINIT(1'b0),
        .DI({vector_i_50_n_0,vector_i_51_n_0,vector_i_52_n_0,vector_i_53_n_0}),
        .O(acc_13_nl[28:25]),
        .S({vector_i_54_n_0,vector_i_55_n_0,vector_i_56_n_0,vector_i_57_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_29
       (.I0(O),
        .I1(Q[27]),
        .I2(acc_13_nl[28]),
        .O(vector_i_29_n_0));
  CARRY4 vector_i_3
       (.CI(vector_i_4_n_0),
        .CO({vector_i_3_n_0,vector_i_3_n_1,vector_i_3_n_2,vector_i_3_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[28:25]),
        .O(out[27:24]),
        .S({vector_i_29_n_0,vector_i_30_n_0,vector_i_31_n_0,vector_i_32_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_30
       (.I0(O),
        .I1(Q[26]),
        .I2(acc_13_nl[27]),
        .O(vector_i_30_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_31
       (.I0(O),
        .I1(Q[25]),
        .I2(acc_13_nl[26]),
        .O(vector_i_31_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_32
       (.I0(O),
        .I1(Q[24]),
        .I2(acc_13_nl[25]),
        .O(vector_i_32_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector_i_33
       (.CI(vector_i_38_n_0),
        .CO({vector_i_33_n_0,vector_i_33_n_1,vector_i_33_n_2,vector_i_33_n_3}),
        .CYINIT(1'b0),
        .DI({vector_i_58_n_0,vector_i_59_n_0,vector_i_60_n_0,vector_i_61_n_0}),
        .O(acc_13_nl[24:21]),
        .S({vector_i_62_n_0,vector_i_63_n_0,vector_i_64_n_0,vector_i_65_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_34
       (.I0(O),
        .I1(Q[23]),
        .I2(acc_13_nl[24]),
        .O(vector_i_34_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_35
       (.I0(O),
        .I1(Q[22]),
        .I2(acc_13_nl[23]),
        .O(vector_i_35_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_36
       (.I0(O),
        .I1(Q[21]),
        .I2(acc_13_nl[22]),
        .O(vector_i_36_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_37
       (.I0(O),
        .I1(Q[20]),
        .I2(acc_13_nl[21]),
        .O(vector_i_37_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 vector_i_38
       (.CI(vector__1_i_5_n_0),
        .CO({vector_i_38_n_0,vector_i_38_n_1,vector_i_38_n_2,vector_i_38_n_3}),
        .CYINIT(1'b0),
        .DI({vector_i_66_n_0,vector_i_67_n_0,vector_i_68_n_0,vector_i_69_n_0}),
        .O(acc_13_nl[20:17]),
        .S({vector_i_70_n_0,vector_i_71_n_0,vector_i_72_n_0,vector_i_73_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_39
       (.I0(O),
        .I1(Q[19]),
        .I2(acc_13_nl[20]),
        .O(vector_i_39_n_0));
  CARRY4 vector_i_4
       (.CI(vector_i_5_n_0),
        .CO({vector_i_4_n_0,vector_i_4_n_1,vector_i_4_n_2,vector_i_4_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[24:21]),
        .O(out[23:20]),
        .S({vector_i_34_n_0,vector_i_35_n_0,vector_i_36_n_0,vector_i_37_n_0}));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_40
       (.I0(O),
        .I1(Q[18]),
        .I2(acc_13_nl[19]),
        .O(vector_i_40_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_41
       (.I0(O),
        .I1(Q[17]),
        .I2(acc_13_nl[18]),
        .O(vector_i_41_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    vector_i_42
       (.I0(O),
        .I1(Q[16]),
        .I2(acc_13_nl[17]),
        .O(vector_i_42_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_43
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[29]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[29]),
        .I4(vector_i_75_n_0),
        .O(vector_i_43_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_44
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[28]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[28]),
        .I4(vector_i_76_n_0),
        .O(vector_i_44_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_45
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[27]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[27]),
        .I4(vector_i_77_n_0),
        .O(vector_i_45_n_0));
  LUT6 #(
    .INIT(64'h202A4540DFD5BABF)) 
    vector_i_46
       (.I0(vector_i_78_n_0),
        .I1(vec_rsci_qa_d_bfwt_63_32[30]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsc_qb[30]),
        .I4(vector__1_i_20_0),
        .I5(vector_i_79_n_0),
        .O(vector_i_46_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_47
       (.I0(vector_i_75_n_0),
        .I1(input_0[29]),
        .I2(input_0[30]),
        .I3(vector_i_78_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_47_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_48
       (.I0(vector_i_76_n_0),
        .I1(input_0[28]),
        .I2(input_0[29]),
        .I3(vector_i_75_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_48_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_49
       (.I0(vector_i_77_n_0),
        .I1(input_0[27]),
        .I2(input_0[28]),
        .I3(vector_i_76_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_49_n_0));
  CARRY4 vector_i_5
       (.CI(vector__1_i_1_n_0),
        .CO({vector_i_5_n_0,vector_i_5_n_1,vector_i_5_n_2,vector_i_5_n_3}),
        .CYINIT(1'b0),
        .DI(acc_13_nl[20:17]),
        .O(out[19:16]),
        .S({vector_i_39_n_0,vector_i_40_n_0,vector_i_41_n_0,vector_i_42_n_0}));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_50
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[26]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[26]),
        .I4(vector_i_84_n_0),
        .O(vector_i_50_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_51
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[25]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[25]),
        .I4(vector_i_85_n_0),
        .O(vector_i_51_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_52
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[24]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[24]),
        .I4(vector_i_86_n_0),
        .O(vector_i_52_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_53
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[23]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[23]),
        .I4(vector_i_87_n_0),
        .O(vector_i_53_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_54
       (.I0(vector_i_84_n_0),
        .I1(input_0[26]),
        .I2(input_0[27]),
        .I3(vector_i_77_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_54_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_55
       (.I0(vector_i_85_n_0),
        .I1(input_0[25]),
        .I2(input_0[26]),
        .I3(vector_i_84_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_55_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_56
       (.I0(vector_i_86_n_0),
        .I1(input_0[24]),
        .I2(input_0[25]),
        .I3(vector_i_85_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_56_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_57
       (.I0(vector_i_87_n_0),
        .I1(input_0[23]),
        .I2(input_0[24]),
        .I3(vector_i_86_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_57_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_58
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[22]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[22]),
        .I4(vector_i_92_n_0),
        .O(vector_i_58_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_59
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[21]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[21]),
        .I4(vector_i_93_n_0),
        .O(vector_i_59_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_60
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[20]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[20]),
        .I4(vector_i_94_n_0),
        .O(vector_i_60_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_61
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[19]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[19]),
        .I4(vector_i_95_n_0),
        .O(vector_i_61_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_62
       (.I0(vector_i_92_n_0),
        .I1(input_0[22]),
        .I2(input_0[23]),
        .I3(vector_i_87_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_62_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_63
       (.I0(vector_i_93_n_0),
        .I1(input_0[21]),
        .I2(input_0[22]),
        .I3(vector_i_92_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_63_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_64
       (.I0(vector_i_94_n_0),
        .I1(input_0[20]),
        .I2(input_0[21]),
        .I3(vector_i_93_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_64_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_65
       (.I0(vector_i_95_n_0),
        .I1(input_0[19]),
        .I2(input_0[20]),
        .I3(vector_i_94_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_65_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_66
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[18]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[18]),
        .I4(vector_i_100_n_0),
        .O(vector_i_66_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_67
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[17]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[17]),
        .I4(vector_i_101_n_0),
        .O(vector_i_67_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_68
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[16]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[16]),
        .I4(vector_i_102_n_0),
        .O(vector_i_68_n_0));
  LUT5 #(
    .INIT(32'h02A25404)) 
    vector_i_69
       (.I0(vector__1_i_20_0),
        .I1(vec_rsc_qb[15]),
        .I2(vec_rsci_bcwt_1_reg_0),
        .I3(vec_rsci_qa_d_bfwt_63_32[15]),
        .I4(vector_i_103_n_0),
        .O(vector_i_69_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_70
       (.I0(vector_i_100_n_0),
        .I1(input_0[18]),
        .I2(input_0[19]),
        .I3(vector_i_95_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_70_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_71
       (.I0(vector_i_101_n_0),
        .I1(input_0[17]),
        .I2(input_0[18]),
        .I3(vector_i_100_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_71_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_72
       (.I0(vector_i_102_n_0),
        .I1(input_0[16]),
        .I2(input_0[17]),
        .I3(vector_i_101_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_72_n_0));
  LUT5 #(
    .INIT(32'hD22DB44B)) 
    vector_i_73
       (.I0(vector_i_103_n_0),
        .I1(input_0[15]),
        .I2(input_0[16]),
        .I3(vector_i_102_n_0),
        .I4(vector__1_i_20_0),
        .O(vector_i_73_n_0));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_75
       (.I0(vec_rsci_qa_d_bfwt_31_0[29]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[29]),
        .O(vector_i_75_n_0));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_76
       (.I0(vec_rsci_qa_d_bfwt_31_0[28]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[28]),
        .O(vector_i_76_n_0));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_77
       (.I0(vec_rsci_qa_d_bfwt_31_0[27]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[27]),
        .O(vector_i_77_n_0));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_78
       (.I0(vec_rsci_qa_d_bfwt_31_0[30]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[30]),
        .O(vector_i_78_n_0));
  LUT6 #(
    .INIT(64'h474747B8B8B847B8)) 
    vector_i_79
       (.I0(vec_rsci_qa_d_bfwt_31_0[31]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[31]),
        .I3(vec_rsc_qb[31]),
        .I4(vec_rsci_bcwt_1_reg_0),
        .I5(vec_rsci_qa_d_bfwt_63_32[31]),
        .O(vector_i_79_n_0));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_80
       (.I0(vec_rsci_qa_d_bfwt_63_32[29]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[29]),
        .O(input_0[29]));
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_81
       (.I0(vec_rsci_qa_d_bfwt_63_32[30]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[30]),
        .O(input_0[30]));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_82
       (.I0(vec_rsci_qa_d_bfwt_63_32[28]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[28]),
        .O(input_0[28]));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_83
       (.I0(vec_rsci_qa_d_bfwt_63_32[27]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[27]),
        .O(input_0[27]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_84
       (.I0(vec_rsci_qa_d_bfwt_31_0[26]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[26]),
        .O(vector_i_84_n_0));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_85
       (.I0(vec_rsci_qa_d_bfwt_31_0[25]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[25]),
        .O(vector_i_85_n_0));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_86
       (.I0(vec_rsci_qa_d_bfwt_31_0[24]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[24]),
        .O(vector_i_86_n_0));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_87
       (.I0(vec_rsci_qa_d_bfwt_31_0[23]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[23]),
        .O(vector_i_87_n_0));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_88
       (.I0(vec_rsci_qa_d_bfwt_63_32[26]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[26]),
        .O(input_0[26]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_89
       (.I0(vec_rsci_qa_d_bfwt_63_32[25]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[25]),
        .O(input_0[25]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_90
       (.I0(vec_rsci_qa_d_bfwt_63_32[24]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[24]),
        .O(input_0[24]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_91
       (.I0(vec_rsci_qa_d_bfwt_63_32[23]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[23]),
        .O(input_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_92
       (.I0(vec_rsci_qa_d_bfwt_31_0[22]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[22]),
        .O(vector_i_92_n_0));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_93
       (.I0(vec_rsci_qa_d_bfwt_31_0[21]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[21]),
        .O(vector_i_93_n_0));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_94
       (.I0(vec_rsci_qa_d_bfwt_31_0[20]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[20]),
        .O(vector_i_94_n_0));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_95
       (.I0(vec_rsci_qa_d_bfwt_31_0[19]),
        .I1(vec_rsci_bcwt_reg_0),
        .I2(vec_rsc_qa[19]),
        .O(vector_i_95_n_0));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_96
       (.I0(vec_rsci_qa_d_bfwt_63_32[22]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[22]),
        .O(input_0[22]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_97
       (.I0(vec_rsci_qa_d_bfwt_63_32[21]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[21]),
        .O(input_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_98
       (.I0(vec_rsci_qa_d_bfwt_63_32[20]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[20]),
        .O(input_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    vector_i_99
       (.I0(vec_rsci_qa_d_bfwt_63_32[19]),
        .I1(vec_rsci_bcwt_1_reg_0),
        .I2(vec_rsc_qb[19]),
        .O(input_0[19]));
endmodule

(* ORIG_REF_NAME = "mgc_shift_l_v5" *) 
module top_inPlaceNTT_DIF_preco_0_0_mgc_shift_l_v5
   (\STAGE_LOOP_i_3_0_sva_reg[2] ,
    D,
    Q);
  output \STAGE_LOOP_i_3_0_sva_reg[2] ;
  output [0:0]D;
  input [2:0]Q;

  wire [0:0]D;
  wire [2:0]Q;
  wire \STAGE_LOOP_i_3_0_sva_reg[2] ;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \STAGE_LOOP_i_3_0_sva[0]_i_1 
       (.I0(Q[0]),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \STAGE_LOOP_lshift_psp_sva[4]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\STAGE_LOOP_i_3_0_sva_reg[2] ));
endmodule

(* ORIG_REF_NAME = "mgc_shift_l_v5" *) 
module top_inPlaceNTT_DIF_preco_0_0_mgc_shift_l_v5__parameterized3
   (\STAGE_LOOP_i_3_0_sva_reg[0] ,
    \STAGE_LOOP_i_3_0_sva_reg[0]_0 ,
    \STAGE_LOOP_i_3_0_sva_reg[0]_1 ,
    \STAGE_LOOP_i_3_0_sva_reg[0]_2 ,
    MUX_v_4_2_2_return,
    Q,
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ,
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] );
  output \STAGE_LOOP_i_3_0_sva_reg[0] ;
  output \STAGE_LOOP_i_3_0_sva_reg[0]_0 ;
  output \STAGE_LOOP_i_3_0_sva_reg[0]_1 ;
  output \STAGE_LOOP_i_3_0_sva_reg[0]_2 ;
  input [0:0]MUX_v_4_2_2_return;
  input [1:0]Q;
  input \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ;
  input [1:0]\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] ;

  wire \COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ;
  wire [1:0]\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] ;
  wire [0:0]MUX_v_4_2_2_return;
  wire [1:0]Q;
  wire \STAGE_LOOP_i_3_0_sva_reg[0] ;
  wire \STAGE_LOOP_i_3_0_sva_reg[0]_0 ;
  wire \STAGE_LOOP_i_3_0_sva_reg[0]_1 ;
  wire \STAGE_LOOP_i_3_0_sva_reg[0]_2 ;

  LUT6 #(
    .INIT(64'h02000200020002AA)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[4]_i_1 
       (.I0(MUX_v_4_2_2_return),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ),
        .I4(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [1]),
        .I5(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [0]),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0] ));
  LUT6 #(
    .INIT(64'h800080AA80008000)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[5]_i_1 
       (.I0(MUX_v_4_2_2_return),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ),
        .I4(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [1]),
        .I5(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [0]),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h202A000A20200000)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[6]_i_1 
       (.I0(MUX_v_4_2_2_return),
        .I1(Q[0]),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ),
        .I3(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [0]),
        .I4(Q[1]),
        .I5(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [1]),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0]_2 ));
  LUT6 #(
    .INIT(64'h0A008A8000008080)) 
    \COMP_LOOP_5_twiddle_f_lshift_ncse_sva[7]_i_3 
       (.I0(MUX_v_4_2_2_return),
        .I1(Q[0]),
        .I2(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[4] ),
        .I3(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [0]),
        .I4(Q[1]),
        .I5(\COMP_LOOP_5_twiddle_f_lshift_ncse_sva_reg[6] [1]),
        .O(\STAGE_LOOP_i_3_0_sva_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "modulo_add" *) 
module top_inPlaceNTT_DIF_preco_0_0_modulo_add
   (vec_rsc_da,
    CO,
    vec_rsc_da_31_sp_1,
    return_rsc_z,
    Q,
    nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
    out,
    clk);
  output [31:0]vec_rsc_da;
  output [0:0]CO;
  input vec_rsc_da_31_sp_1;
  input [31:0]return_rsc_z;
  input [31:0]Q;
  input [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  input COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  input [31:0]out;
  input clk;

  wire [0:0]CO;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire [31:0]Q;
  wire clk;
  wire [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  wire [31:0]out;
  wire [31:0]return_rsc_z;
  wire [31:0]vec_rsc_da;
  wire vec_rsc_da_31_sn_1;

  assign vec_rsc_da_31_sn_1 = vec_rsc_da_31_sp_1;
  top_inPlaceNTT_DIF_preco_0_0_modulo_add_core modulo_add_core_inst
       (.CO(CO),
        .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .Q(Q),
        .clk(clk),
        .nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat),
        .out(out),
        .return_rsc_z(return_rsc_z),
        .vec_rsc_da(vec_rsc_da),
        .vec_rsc_da_31_sp_1(vec_rsc_da_31_sn_1));
endmodule

(* ORIG_REF_NAME = "modulo_add_core" *) 
module top_inPlaceNTT_DIF_preco_0_0_modulo_add_core
   (vec_rsc_da,
    CO,
    vec_rsc_da_31_sp_1,
    return_rsc_z,
    Q,
    nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
    out,
    clk);
  output [31:0]vec_rsc_da;
  output [0:0]CO;
  input vec_rsc_da_31_sp_1;
  input [31:0]return_rsc_z;
  input [31:0]Q;
  input [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  input COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  input [31:0]out;
  input clk;

  wire [0:0]CO;
  wire [31:0]COMP_LOOP_1_modulo_add_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire [31:0]Q;
  wire clk;
  wire [31:0]nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  wire [31:0]out;
  wire [31:0]return_rsc_z;
  wire \return_rsci_d[31]_i_18_n_0 ;
  wire \return_rsci_d[31]_i_19_n_0 ;
  wire \return_rsci_d[31]_i_20_n_0 ;
  wire \return_rsci_d[31]_i_21_n_0 ;
  wire \return_rsci_d[31]_i_23_n_0 ;
  wire \return_rsci_d[31]_i_24_n_0 ;
  wire \return_rsci_d[31]_i_25_n_0 ;
  wire \return_rsci_d[31]_i_26_n_0 ;
  wire \return_rsci_d[31]_i_28_n_0 ;
  wire \return_rsci_d[31]_i_29_n_0 ;
  wire \return_rsci_d[31]_i_30_n_0 ;
  wire \return_rsci_d[31]_i_31_n_0 ;
  wire \return_rsci_d[31]_i_33_n_0 ;
  wire \return_rsci_d[31]_i_34_n_0 ;
  wire \return_rsci_d[31]_i_35_n_0 ;
  wire \return_rsci_d[31]_i_36_n_0 ;
  wire \return_rsci_d[31]_i_38_n_0 ;
  wire \return_rsci_d[31]_i_39_n_0 ;
  wire \return_rsci_d[31]_i_40_n_0 ;
  wire \return_rsci_d[31]_i_41_n_0 ;
  wire \return_rsci_d[31]_i_43_n_0 ;
  wire \return_rsci_d[31]_i_44_n_0 ;
  wire \return_rsci_d[31]_i_45_n_0 ;
  wire \return_rsci_d[31]_i_46_n_0 ;
  wire \return_rsci_d[31]_i_48_n_0 ;
  wire \return_rsci_d[31]_i_49_n_0 ;
  wire \return_rsci_d[31]_i_50_n_0 ;
  wire \return_rsci_d[31]_i_51_n_0 ;
  wire \return_rsci_d[31]_i_52_n_0 ;
  wire \return_rsci_d[31]_i_53_n_0 ;
  wire \return_rsci_d[31]_i_54_n_0 ;
  wire \return_rsci_d[31]_i_55_n_0 ;
  wire \return_rsci_d_reg[31]_i_15_n_1 ;
  wire \return_rsci_d_reg[31]_i_15_n_2 ;
  wire \return_rsci_d_reg[31]_i_15_n_3 ;
  wire \return_rsci_d_reg[31]_i_17_n_0 ;
  wire \return_rsci_d_reg[31]_i_17_n_1 ;
  wire \return_rsci_d_reg[31]_i_17_n_2 ;
  wire \return_rsci_d_reg[31]_i_17_n_3 ;
  wire \return_rsci_d_reg[31]_i_22_n_0 ;
  wire \return_rsci_d_reg[31]_i_22_n_1 ;
  wire \return_rsci_d_reg[31]_i_22_n_2 ;
  wire \return_rsci_d_reg[31]_i_22_n_3 ;
  wire \return_rsci_d_reg[31]_i_27_n_0 ;
  wire \return_rsci_d_reg[31]_i_27_n_1 ;
  wire \return_rsci_d_reg[31]_i_27_n_2 ;
  wire \return_rsci_d_reg[31]_i_27_n_3 ;
  wire \return_rsci_d_reg[31]_i_32_n_0 ;
  wire \return_rsci_d_reg[31]_i_32_n_1 ;
  wire \return_rsci_d_reg[31]_i_32_n_2 ;
  wire \return_rsci_d_reg[31]_i_32_n_3 ;
  wire \return_rsci_d_reg[31]_i_37_n_0 ;
  wire \return_rsci_d_reg[31]_i_37_n_1 ;
  wire \return_rsci_d_reg[31]_i_37_n_2 ;
  wire \return_rsci_d_reg[31]_i_37_n_3 ;
  wire \return_rsci_d_reg[31]_i_42_n_0 ;
  wire \return_rsci_d_reg[31]_i_42_n_1 ;
  wire \return_rsci_d_reg[31]_i_42_n_2 ;
  wire \return_rsci_d_reg[31]_i_42_n_3 ;
  wire \return_rsci_d_reg[31]_i_47_n_0 ;
  wire \return_rsci_d_reg[31]_i_47_n_1 ;
  wire \return_rsci_d_reg[31]_i_47_n_2 ;
  wire \return_rsci_d_reg[31]_i_47_n_3 ;
  wire [31:0]vec_rsc_da;
  wire vec_rsc_da_31_sn_1;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_15_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_17_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_22_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_27_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_32_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_37_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_42_O_UNCONNECTED ;
  wire [3:0]\NLW_return_rsci_d_reg[31]_i_47_O_UNCONNECTED ;

  assign vec_rsc_da_31_sn_1 = vec_rsc_da_31_sp_1;
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_18 
       (.I0(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31]),
        .I1(Q[31]),
        .O(\return_rsci_d[31]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_19 
       (.I0(Q[30]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[30]),
        .O(\return_rsci_d[31]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_20 
       (.I0(Q[29]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[29]),
        .O(\return_rsci_d[31]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_21 
       (.I0(Q[28]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[28]),
        .O(\return_rsci_d[31]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_23 
       (.I0(Q[27]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[27]),
        .O(\return_rsci_d[31]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_24 
       (.I0(Q[26]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[26]),
        .O(\return_rsci_d[31]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_25 
       (.I0(Q[25]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[25]),
        .O(\return_rsci_d[31]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_26 
       (.I0(Q[24]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[24]),
        .O(\return_rsci_d[31]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_28 
       (.I0(Q[23]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[23]),
        .O(\return_rsci_d[31]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_29 
       (.I0(Q[22]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[22]),
        .O(\return_rsci_d[31]_i_29_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_30 
       (.I0(Q[21]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[21]),
        .O(\return_rsci_d[31]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_31 
       (.I0(Q[20]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[20]),
        .O(\return_rsci_d[31]_i_31_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_33 
       (.I0(Q[19]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[19]),
        .O(\return_rsci_d[31]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_34 
       (.I0(Q[18]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[18]),
        .O(\return_rsci_d[31]_i_34_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_35 
       (.I0(Q[17]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[17]),
        .O(\return_rsci_d[31]_i_35_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_36 
       (.I0(Q[16]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[16]),
        .O(\return_rsci_d[31]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_38 
       (.I0(Q[15]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[15]),
        .O(\return_rsci_d[31]_i_38_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_39 
       (.I0(Q[14]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[14]),
        .O(\return_rsci_d[31]_i_39_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_40 
       (.I0(Q[13]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[13]),
        .O(\return_rsci_d[31]_i_40_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_41 
       (.I0(Q[12]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[12]),
        .O(\return_rsci_d[31]_i_41_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_43 
       (.I0(Q[11]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[11]),
        .O(\return_rsci_d[31]_i_43_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_44 
       (.I0(Q[10]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[10]),
        .O(\return_rsci_d[31]_i_44_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_45 
       (.I0(Q[9]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[9]),
        .O(\return_rsci_d[31]_i_45_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_46 
       (.I0(Q[8]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[8]),
        .O(\return_rsci_d[31]_i_46_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_48 
       (.I0(Q[7]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[7]),
        .O(\return_rsci_d[31]_i_48_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_49 
       (.I0(Q[6]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[6]),
        .O(\return_rsci_d[31]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_50 
       (.I0(Q[5]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[5]),
        .O(\return_rsci_d[31]_i_50_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_51 
       (.I0(Q[4]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[4]),
        .O(\return_rsci_d[31]_i_51_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_52 
       (.I0(Q[3]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[3]),
        .O(\return_rsci_d[31]_i_52_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_53 
       (.I0(Q[2]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[2]),
        .O(\return_rsci_d[31]_i_53_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_54 
       (.I0(Q[1]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[1]),
        .O(\return_rsci_d[31]_i_54_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \return_rsci_d[31]_i_55 
       (.I0(Q[0]),
        .I1(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[0]),
        .O(\return_rsci_d[31]_i_55_n_0 ));
  FDRE \return_rsci_d_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[0]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[0]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[10]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[10]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[11]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[11]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[12]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[12]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[13] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[13]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[13]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[14] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[14]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[14]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[15] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[15]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[15]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[16] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[16]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[16]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[17] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[17]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[17]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[18] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[18]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[18]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[19] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[19]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[19]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[1]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[1]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[20] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[20]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[20]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[21] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[21]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[21]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[22] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[22]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[22]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[23] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[23]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[23]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[24] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[24]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[24]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[25] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[25]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[25]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[26] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[26]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[26]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[27] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[27]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[27]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[28] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[28]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[28]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[29] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[29]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[29]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[2]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[2]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[30] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[30]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[30]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[31] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[31]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[31]),
        .R(1'b0));
  CARRY4 \return_rsci_d_reg[31]_i_15 
       (.CI(\return_rsci_d_reg[31]_i_17_n_0 ),
        .CO({CO,\return_rsci_d_reg[31]_i_15_n_1 ,\return_rsci_d_reg[31]_i_15_n_2 ,\return_rsci_d_reg[31]_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[31:28]),
        .O(\NLW_return_rsci_d_reg[31]_i_15_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_18_n_0 ,\return_rsci_d[31]_i_19_n_0 ,\return_rsci_d[31]_i_20_n_0 ,\return_rsci_d[31]_i_21_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_17 
       (.CI(\return_rsci_d_reg[31]_i_22_n_0 ),
        .CO({\return_rsci_d_reg[31]_i_17_n_0 ,\return_rsci_d_reg[31]_i_17_n_1 ,\return_rsci_d_reg[31]_i_17_n_2 ,\return_rsci_d_reg[31]_i_17_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[27:24]),
        .O(\NLW_return_rsci_d_reg[31]_i_17_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_23_n_0 ,\return_rsci_d[31]_i_24_n_0 ,\return_rsci_d[31]_i_25_n_0 ,\return_rsci_d[31]_i_26_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_22 
       (.CI(\return_rsci_d_reg[31]_i_27_n_0 ),
        .CO({\return_rsci_d_reg[31]_i_22_n_0 ,\return_rsci_d_reg[31]_i_22_n_1 ,\return_rsci_d_reg[31]_i_22_n_2 ,\return_rsci_d_reg[31]_i_22_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[23:20]),
        .O(\NLW_return_rsci_d_reg[31]_i_22_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_28_n_0 ,\return_rsci_d[31]_i_29_n_0 ,\return_rsci_d[31]_i_30_n_0 ,\return_rsci_d[31]_i_31_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_27 
       (.CI(\return_rsci_d_reg[31]_i_32_n_0 ),
        .CO({\return_rsci_d_reg[31]_i_27_n_0 ,\return_rsci_d_reg[31]_i_27_n_1 ,\return_rsci_d_reg[31]_i_27_n_2 ,\return_rsci_d_reg[31]_i_27_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[19:16]),
        .O(\NLW_return_rsci_d_reg[31]_i_27_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_33_n_0 ,\return_rsci_d[31]_i_34_n_0 ,\return_rsci_d[31]_i_35_n_0 ,\return_rsci_d[31]_i_36_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_32 
       (.CI(\return_rsci_d_reg[31]_i_37_n_0 ),
        .CO({\return_rsci_d_reg[31]_i_32_n_0 ,\return_rsci_d_reg[31]_i_32_n_1 ,\return_rsci_d_reg[31]_i_32_n_2 ,\return_rsci_d_reg[31]_i_32_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[15:12]),
        .O(\NLW_return_rsci_d_reg[31]_i_32_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_38_n_0 ,\return_rsci_d[31]_i_39_n_0 ,\return_rsci_d[31]_i_40_n_0 ,\return_rsci_d[31]_i_41_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_37 
       (.CI(\return_rsci_d_reg[31]_i_42_n_0 ),
        .CO({\return_rsci_d_reg[31]_i_37_n_0 ,\return_rsci_d_reg[31]_i_37_n_1 ,\return_rsci_d_reg[31]_i_37_n_2 ,\return_rsci_d_reg[31]_i_37_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[11:8]),
        .O(\NLW_return_rsci_d_reg[31]_i_37_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_43_n_0 ,\return_rsci_d[31]_i_44_n_0 ,\return_rsci_d[31]_i_45_n_0 ,\return_rsci_d[31]_i_46_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_42 
       (.CI(\return_rsci_d_reg[31]_i_47_n_0 ),
        .CO({\return_rsci_d_reg[31]_i_42_n_0 ,\return_rsci_d_reg[31]_i_42_n_1 ,\return_rsci_d_reg[31]_i_42_n_2 ,\return_rsci_d_reg[31]_i_42_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O(\NLW_return_rsci_d_reg[31]_i_42_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_48_n_0 ,\return_rsci_d[31]_i_49_n_0 ,\return_rsci_d[31]_i_50_n_0 ,\return_rsci_d[31]_i_51_n_0 }));
  CARRY4 \return_rsci_d_reg[31]_i_47 
       (.CI(1'b0),
        .CO({\return_rsci_d_reg[31]_i_47_n_0 ,\return_rsci_d_reg[31]_i_47_n_1 ,\return_rsci_d_reg[31]_i_47_n_2 ,\return_rsci_d_reg[31]_i_47_n_3 }),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(\NLW_return_rsci_d_reg[31]_i_47_O_UNCONNECTED [3:0]),
        .S({\return_rsci_d[31]_i_52_n_0 ,\return_rsci_d[31]_i_53_n_0 ,\return_rsci_d[31]_i_54_n_0 ,\return_rsci_d[31]_i_55_n_0 }));
  FDRE \return_rsci_d_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[3]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[3]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[4]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[4]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[5]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[5]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[6]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[6]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[7]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[7]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[8]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[8]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .D(out[9]),
        .Q(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[0]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[0]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[0]),
        .O(vec_rsc_da[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[10]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[10]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[10]),
        .O(vec_rsc_da[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[11]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[11]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[11]),
        .O(vec_rsc_da[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[12]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[12]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[12]),
        .O(vec_rsc_da[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[13]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[13]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[13]),
        .O(vec_rsc_da[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[14]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[14]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[14]),
        .O(vec_rsc_da[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[15]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[15]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[15]),
        .O(vec_rsc_da[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[16]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[16]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[16]),
        .O(vec_rsc_da[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[17]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[17]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[17]),
        .O(vec_rsc_da[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[18]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[18]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[18]),
        .O(vec_rsc_da[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[19]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[19]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[19]),
        .O(vec_rsc_da[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[1]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[1]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[1]),
        .O(vec_rsc_da[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[20]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[20]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[20]),
        .O(vec_rsc_da[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[21]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[21]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[21]),
        .O(vec_rsc_da[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[22]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[22]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[22]),
        .O(vec_rsc_da[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[23]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[23]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[23]),
        .O(vec_rsc_da[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[24]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[24]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[24]),
        .O(vec_rsc_da[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[25]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[25]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[25]),
        .O(vec_rsc_da[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[26]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[26]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[26]),
        .O(vec_rsc_da[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[27]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[27]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[27]),
        .O(vec_rsc_da[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[28]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[28]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[28]),
        .O(vec_rsc_da[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[29]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[29]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[29]),
        .O(vec_rsc_da[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[2]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[2]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[2]),
        .O(vec_rsc_da[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[30]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[30]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[30]),
        .O(vec_rsc_da[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[31]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[31]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[31]),
        .O(vec_rsc_da[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[3]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[3]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[3]),
        .O(vec_rsc_da[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[4]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[4]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[4]),
        .O(vec_rsc_da[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[5]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[5]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[5]),
        .O(vec_rsc_da[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[6]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[6]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[6]),
        .O(vec_rsc_da[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[7]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[7]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[7]),
        .O(vec_rsc_da[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[8]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[8]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[8]),
        .O(vec_rsc_da[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vec_rsc_da[9]_INST_0 
       (.I0(COMP_LOOP_1_modulo_add_cmp_return_rsc_z[9]),
        .I1(vec_rsc_da_31_sn_1),
        .I2(return_rsc_z[9]),
        .O(vec_rsc_da[9]));
endmodule

(* ORIG_REF_NAME = "mult" *) 
module top_inPlaceNTT_DIF_preco_0_0_mult
   (asn_itm_1,
    main_stage_0_2,
    S,
    \return_rsci_d_reg[31] ,
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
    clk,
    out,
    B,
    vector__2,
    p_sva0,
    p_and_1_cse,
    p_rsc_dat,
    nl_z_mul_itm_1__0,
    z_mul_itm_1_reg,
    rst,
    asn_itm_1_reg,
    main_stage_0_2_reg,
    Q,
    O,
    COMP_LOOP_1_mult_cmp_ccs_ccore_en);
  output asn_itm_1;
  output main_stage_0_2;
  output [0:0]S;
  output [31:0]\return_rsci_d_reg[31] ;
  input COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  input clk;
  input [31:0]out;
  input [16:0]B;
  input [14:0]vector__2;
  input p_sva0;
  input p_and_1_cse;
  input [31:0]p_rsc_dat;
  input [16:0]nl_z_mul_itm_1__0;
  input [14:0]z_mul_itm_1_reg;
  input rst;
  input asn_itm_1_reg;
  input main_stage_0_2_reg;
  input [31:0]Q;
  input [0:0]O;
  input COMP_LOOP_1_mult_cmp_ccs_ccore_en;

  wire [16:0]B;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire [0:0]O;
  wire [31:0]Q;
  wire [0:0]S;
  wire asn_itm_1;
  wire asn_itm_1_reg;
  wire clk;
  wire main_stage_0_2;
  wire main_stage_0_2_reg;
  wire [16:0]nl_z_mul_itm_1__0;
  wire [31:0]out;
  wire p_and_1_cse;
  wire [31:0]p_rsc_dat;
  wire p_sva0;
  wire [31:0]\return_rsci_d_reg[31] ;
  wire rst;
  wire [14:0]vector__2;
  wire [14:0]z_mul_itm_1_reg;

  top_inPlaceNTT_DIF_preco_0_0_mult_core mult_core_inst
       (.B(B),
        .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .COMP_LOOP_1_mult_cmp_ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .O(O),
        .Q(Q),
        .S(S),
        .asn_itm_1(asn_itm_1),
        .asn_itm_1_reg_0(asn_itm_1_reg),
        .clk(clk),
        .main_stage_0_2(main_stage_0_2),
        .main_stage_0_2_reg_0(main_stage_0_2_reg),
        .nl_z_mul_itm_1__0_0(nl_z_mul_itm_1__0),
        .out(out),
        .p_and_1_cse(p_and_1_cse),
        .p_rsc_dat(p_rsc_dat),
        .p_sva0(p_sva0),
        .\return_rsci_d_reg[31]_0 (\return_rsci_d_reg[31] ),
        .rst(rst),
        .vector__2_0(vector__2),
        .z_mul_itm_1_reg_0(z_mul_itm_1_reg));
endmodule

(* ORIG_REF_NAME = "mult_core" *) 
module top_inPlaceNTT_DIF_preco_0_0_mult_core
   (asn_itm_1,
    main_stage_0_2,
    S,
    \return_rsci_d_reg[31]_0 ,
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
    clk,
    out,
    B,
    vector__2_0,
    p_sva0,
    p_and_1_cse,
    p_rsc_dat,
    nl_z_mul_itm_1__0_0,
    z_mul_itm_1_reg_0,
    rst,
    asn_itm_1_reg_0,
    main_stage_0_2_reg_0,
    COMP_LOOP_1_mult_cmp_ccs_ccore_en,
    Q,
    O);
  output asn_itm_1;
  output main_stage_0_2;
  output [0:0]S;
  output [31:0]\return_rsci_d_reg[31]_0 ;
  input COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  input clk;
  input [31:0]out;
  input [16:0]B;
  input [14:0]vector__2_0;
  input p_sva0;
  input p_and_1_cse;
  input [31:0]p_rsc_dat;
  input [16:0]nl_z_mul_itm_1__0_0;
  input [14:0]z_mul_itm_1_reg_0;
  input rst;
  input asn_itm_1_reg_0;
  input main_stage_0_2_reg_0;
  input COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  input [31:0]Q;
  input [0:0]O;

  wire [16:0]B;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire [0:0]O;
  wire [31:0]Q;
  wire [0:0]S;
  wire asn_itm_1;
  wire asn_itm_1_reg_0;
  wire clk;
  wire [32:32]if_acc_1_nl;
  wire main_stage_0_2;
  wire main_stage_0_2_reg_0;
  wire nl_if_acc_1_nl_carry__0_i_1_n_0;
  wire nl_if_acc_1_nl_carry__0_i_2_n_0;
  wire nl_if_acc_1_nl_carry__0_i_3_n_0;
  wire nl_if_acc_1_nl_carry__0_i_4_n_0;
  wire nl_if_acc_1_nl_carry__0_n_0;
  wire nl_if_acc_1_nl_carry__0_n_1;
  wire nl_if_acc_1_nl_carry__0_n_2;
  wire nl_if_acc_1_nl_carry__0_n_3;
  wire nl_if_acc_1_nl_carry__1_i_1_n_0;
  wire nl_if_acc_1_nl_carry__1_i_2_n_0;
  wire nl_if_acc_1_nl_carry__1_i_3_n_0;
  wire nl_if_acc_1_nl_carry__1_i_4_n_0;
  wire nl_if_acc_1_nl_carry__1_n_0;
  wire nl_if_acc_1_nl_carry__1_n_1;
  wire nl_if_acc_1_nl_carry__1_n_2;
  wire nl_if_acc_1_nl_carry__1_n_3;
  wire nl_if_acc_1_nl_carry__2_i_1_n_0;
  wire nl_if_acc_1_nl_carry__2_i_2_n_0;
  wire nl_if_acc_1_nl_carry__2_i_3_n_0;
  wire nl_if_acc_1_nl_carry__2_i_4_n_0;
  wire nl_if_acc_1_nl_carry__2_n_0;
  wire nl_if_acc_1_nl_carry__2_n_1;
  wire nl_if_acc_1_nl_carry__2_n_2;
  wire nl_if_acc_1_nl_carry__2_n_3;
  wire nl_if_acc_1_nl_carry__3_i_1_n_0;
  wire nl_if_acc_1_nl_carry__3_i_2_n_0;
  wire nl_if_acc_1_nl_carry__3_i_3_n_0;
  wire nl_if_acc_1_nl_carry__3_i_4_n_0;
  wire nl_if_acc_1_nl_carry__3_n_0;
  wire nl_if_acc_1_nl_carry__3_n_1;
  wire nl_if_acc_1_nl_carry__3_n_2;
  wire nl_if_acc_1_nl_carry__3_n_3;
  wire nl_if_acc_1_nl_carry__4_i_1_n_0;
  wire nl_if_acc_1_nl_carry__4_i_2_n_0;
  wire nl_if_acc_1_nl_carry__4_i_3_n_0;
  wire nl_if_acc_1_nl_carry__4_i_4_n_0;
  wire nl_if_acc_1_nl_carry__4_n_0;
  wire nl_if_acc_1_nl_carry__4_n_1;
  wire nl_if_acc_1_nl_carry__4_n_2;
  wire nl_if_acc_1_nl_carry__4_n_3;
  wire nl_if_acc_1_nl_carry__5_i_1_n_0;
  wire nl_if_acc_1_nl_carry__5_i_2_n_0;
  wire nl_if_acc_1_nl_carry__5_i_3_n_0;
  wire nl_if_acc_1_nl_carry__5_i_4_n_0;
  wire nl_if_acc_1_nl_carry__5_n_0;
  wire nl_if_acc_1_nl_carry__5_n_1;
  wire nl_if_acc_1_nl_carry__5_n_2;
  wire nl_if_acc_1_nl_carry__5_n_3;
  wire nl_if_acc_1_nl_carry__6_i_1_n_0;
  wire nl_if_acc_1_nl_carry__6_i_2_n_0;
  wire nl_if_acc_1_nl_carry__6_i_3_n_0;
  wire nl_if_acc_1_nl_carry__6_i_4_n_0;
  wire nl_if_acc_1_nl_carry__6_n_0;
  wire nl_if_acc_1_nl_carry__6_n_1;
  wire nl_if_acc_1_nl_carry__6_n_2;
  wire nl_if_acc_1_nl_carry__6_n_3;
  wire nl_if_acc_1_nl_carry_i_1_n_0;
  wire nl_if_acc_1_nl_carry_i_2_n_0;
  wire nl_if_acc_1_nl_carry_i_3_n_0;
  wire nl_if_acc_1_nl_carry_i_4_n_0;
  wire nl_if_acc_1_nl_carry_n_0;
  wire nl_if_acc_1_nl_carry_n_1;
  wire nl_if_acc_1_nl_carry_n_2;
  wire nl_if_acc_1_nl_carry_n_3;
  wire nl_if_acc_nl_carry__0_i_1_n_0;
  wire nl_if_acc_nl_carry__0_i_2_n_0;
  wire nl_if_acc_nl_carry__0_i_3_n_0;
  wire nl_if_acc_nl_carry__0_i_4_n_0;
  wire nl_if_acc_nl_carry__0_n_0;
  wire nl_if_acc_nl_carry__0_n_1;
  wire nl_if_acc_nl_carry__0_n_2;
  wire nl_if_acc_nl_carry__0_n_3;
  wire nl_if_acc_nl_carry__1_i_1_n_0;
  wire nl_if_acc_nl_carry__1_i_2_n_0;
  wire nl_if_acc_nl_carry__1_i_3_n_0;
  wire nl_if_acc_nl_carry__1_i_4_n_0;
  wire nl_if_acc_nl_carry__1_n_0;
  wire nl_if_acc_nl_carry__1_n_1;
  wire nl_if_acc_nl_carry__1_n_2;
  wire nl_if_acc_nl_carry__1_n_3;
  wire nl_if_acc_nl_carry__2_i_1_n_0;
  wire nl_if_acc_nl_carry__2_i_2_n_0;
  wire nl_if_acc_nl_carry__2_i_3_n_0;
  wire nl_if_acc_nl_carry__2_i_4_n_0;
  wire nl_if_acc_nl_carry__2_n_0;
  wire nl_if_acc_nl_carry__2_n_1;
  wire nl_if_acc_nl_carry__2_n_2;
  wire nl_if_acc_nl_carry__2_n_3;
  wire nl_if_acc_nl_carry__3_i_1_n_0;
  wire nl_if_acc_nl_carry__3_i_2_n_0;
  wire nl_if_acc_nl_carry__3_i_3_n_0;
  wire nl_if_acc_nl_carry__3_i_4_n_0;
  wire nl_if_acc_nl_carry__3_n_0;
  wire nl_if_acc_nl_carry__3_n_1;
  wire nl_if_acc_nl_carry__3_n_2;
  wire nl_if_acc_nl_carry__3_n_3;
  wire nl_if_acc_nl_carry__4_i_1_n_0;
  wire nl_if_acc_nl_carry__4_i_2_n_0;
  wire nl_if_acc_nl_carry__4_i_3_n_0;
  wire nl_if_acc_nl_carry__4_i_4_n_0;
  wire nl_if_acc_nl_carry__4_n_0;
  wire nl_if_acc_nl_carry__4_n_1;
  wire nl_if_acc_nl_carry__4_n_2;
  wire nl_if_acc_nl_carry__4_n_3;
  wire nl_if_acc_nl_carry__5_i_1_n_0;
  wire nl_if_acc_nl_carry__5_i_2_n_0;
  wire nl_if_acc_nl_carry__5_i_3_n_0;
  wire nl_if_acc_nl_carry__5_i_4_n_0;
  wire nl_if_acc_nl_carry__5_n_0;
  wire nl_if_acc_nl_carry__5_n_1;
  wire nl_if_acc_nl_carry__5_n_2;
  wire nl_if_acc_nl_carry__5_n_3;
  wire nl_if_acc_nl_carry__6_i_1_n_0;
  wire nl_if_acc_nl_carry__6_i_2_n_0;
  wire nl_if_acc_nl_carry__6_i_3_n_0;
  wire nl_if_acc_nl_carry__6_i_4_n_0;
  wire nl_if_acc_nl_carry__6_n_1;
  wire nl_if_acc_nl_carry__6_n_2;
  wire nl_if_acc_nl_carry__6_n_3;
  wire nl_if_acc_nl_carry_i_1_n_0;
  wire nl_if_acc_nl_carry_i_2_n_0;
  wire nl_if_acc_nl_carry_i_3_n_0;
  wire nl_if_acc_nl_carry_i_4_n_0;
  wire nl_if_acc_nl_carry_i_5_n_0;
  wire nl_if_acc_nl_carry_n_0;
  wire nl_if_acc_nl_carry_n_1;
  wire nl_if_acc_nl_carry_n_2;
  wire nl_if_acc_nl_carry_n_3;
  wire [31:0]nl_res_sva_3;
  wire nl_res_sva_3_carry__0_i_1_n_0;
  wire nl_res_sva_3_carry__0_i_2_n_0;
  wire nl_res_sva_3_carry__0_i_3_n_0;
  wire nl_res_sva_3_carry__0_i_4_n_0;
  wire nl_res_sva_3_carry__0_n_0;
  wire nl_res_sva_3_carry__0_n_1;
  wire nl_res_sva_3_carry__0_n_2;
  wire nl_res_sva_3_carry__0_n_3;
  wire nl_res_sva_3_carry__1_i_1_n_0;
  wire nl_res_sva_3_carry__1_i_2_n_0;
  wire nl_res_sva_3_carry__1_i_3_n_0;
  wire nl_res_sva_3_carry__1_i_4_n_0;
  wire nl_res_sva_3_carry__1_n_0;
  wire nl_res_sva_3_carry__1_n_1;
  wire nl_res_sva_3_carry__1_n_2;
  wire nl_res_sva_3_carry__1_n_3;
  wire nl_res_sva_3_carry__2_i_1_n_0;
  wire nl_res_sva_3_carry__2_i_2_n_0;
  wire nl_res_sva_3_carry__2_i_3_n_0;
  wire nl_res_sva_3_carry__2_i_4_n_0;
  wire nl_res_sva_3_carry__2_n_0;
  wire nl_res_sva_3_carry__2_n_1;
  wire nl_res_sva_3_carry__2_n_2;
  wire nl_res_sva_3_carry__2_n_3;
  wire nl_res_sva_3_carry__3_i_1_n_0;
  wire nl_res_sva_3_carry__3_i_2_n_0;
  wire nl_res_sva_3_carry__3_i_3_n_0;
  wire nl_res_sva_3_carry__3_i_4_n_0;
  wire nl_res_sva_3_carry__3_n_0;
  wire nl_res_sva_3_carry__3_n_1;
  wire nl_res_sva_3_carry__3_n_2;
  wire nl_res_sva_3_carry__3_n_3;
  wire nl_res_sva_3_carry__4_i_1_n_0;
  wire nl_res_sva_3_carry__4_i_2_n_0;
  wire nl_res_sva_3_carry__4_i_3_n_0;
  wire nl_res_sva_3_carry__4_i_4_n_0;
  wire nl_res_sva_3_carry__4_n_0;
  wire nl_res_sva_3_carry__4_n_1;
  wire nl_res_sva_3_carry__4_n_2;
  wire nl_res_sva_3_carry__4_n_3;
  wire nl_res_sva_3_carry__5_i_1_n_0;
  wire nl_res_sva_3_carry__5_i_2_n_0;
  wire nl_res_sva_3_carry__5_i_3_n_0;
  wire nl_res_sva_3_carry__5_i_4_n_0;
  wire nl_res_sva_3_carry__5_n_0;
  wire nl_res_sva_3_carry__5_n_1;
  wire nl_res_sva_3_carry__5_n_2;
  wire nl_res_sva_3_carry__5_n_3;
  wire nl_res_sva_3_carry__6_i_1_n_0;
  wire nl_res_sva_3_carry__6_i_2_n_0;
  wire nl_res_sva_3_carry__6_i_3_n_0;
  wire nl_res_sva_3_carry__6_i_4_n_0;
  wire nl_res_sva_3_carry__6_n_1;
  wire nl_res_sva_3_carry__6_n_2;
  wire nl_res_sva_3_carry__6_n_3;
  wire nl_res_sva_3_carry_i_1_n_0;
  wire nl_res_sva_3_carry_i_2_n_0;
  wire nl_res_sva_3_carry_i_3_n_0;
  wire nl_res_sva_3_carry_i_4_n_0;
  wire nl_res_sva_3_carry_n_0;
  wire nl_res_sva_3_carry_n_1;
  wire nl_res_sva_3_carry_n_2;
  wire nl_res_sva_3_carry_n_3;
  wire [16:0]nl_z_mul_itm_1__0_0;
  wire nl_z_mul_itm_1__0_n_100;
  wire nl_z_mul_itm_1__0_n_101;
  wire nl_z_mul_itm_1__0_n_102;
  wire nl_z_mul_itm_1__0_n_103;
  wire nl_z_mul_itm_1__0_n_104;
  wire nl_z_mul_itm_1__0_n_105;
  wire nl_z_mul_itm_1__0_n_106;
  wire nl_z_mul_itm_1__0_n_107;
  wire nl_z_mul_itm_1__0_n_108;
  wire nl_z_mul_itm_1__0_n_109;
  wire nl_z_mul_itm_1__0_n_110;
  wire nl_z_mul_itm_1__0_n_111;
  wire nl_z_mul_itm_1__0_n_112;
  wire nl_z_mul_itm_1__0_n_113;
  wire nl_z_mul_itm_1__0_n_114;
  wire nl_z_mul_itm_1__0_n_115;
  wire nl_z_mul_itm_1__0_n_116;
  wire nl_z_mul_itm_1__0_n_117;
  wire nl_z_mul_itm_1__0_n_118;
  wire nl_z_mul_itm_1__0_n_119;
  wire nl_z_mul_itm_1__0_n_120;
  wire nl_z_mul_itm_1__0_n_121;
  wire nl_z_mul_itm_1__0_n_122;
  wire nl_z_mul_itm_1__0_n_123;
  wire nl_z_mul_itm_1__0_n_124;
  wire nl_z_mul_itm_1__0_n_125;
  wire nl_z_mul_itm_1__0_n_126;
  wire nl_z_mul_itm_1__0_n_127;
  wire nl_z_mul_itm_1__0_n_128;
  wire nl_z_mul_itm_1__0_n_129;
  wire nl_z_mul_itm_1__0_n_130;
  wire nl_z_mul_itm_1__0_n_131;
  wire nl_z_mul_itm_1__0_n_132;
  wire nl_z_mul_itm_1__0_n_133;
  wire nl_z_mul_itm_1__0_n_134;
  wire nl_z_mul_itm_1__0_n_135;
  wire nl_z_mul_itm_1__0_n_136;
  wire nl_z_mul_itm_1__0_n_137;
  wire nl_z_mul_itm_1__0_n_138;
  wire nl_z_mul_itm_1__0_n_139;
  wire nl_z_mul_itm_1__0_n_140;
  wire nl_z_mul_itm_1__0_n_141;
  wire nl_z_mul_itm_1__0_n_142;
  wire nl_z_mul_itm_1__0_n_143;
  wire nl_z_mul_itm_1__0_n_144;
  wire nl_z_mul_itm_1__0_n_145;
  wire nl_z_mul_itm_1__0_n_146;
  wire nl_z_mul_itm_1__0_n_147;
  wire nl_z_mul_itm_1__0_n_148;
  wire nl_z_mul_itm_1__0_n_149;
  wire nl_z_mul_itm_1__0_n_150;
  wire nl_z_mul_itm_1__0_n_151;
  wire nl_z_mul_itm_1__0_n_152;
  wire nl_z_mul_itm_1__0_n_153;
  wire nl_z_mul_itm_1__0_n_58;
  wire nl_z_mul_itm_1__0_n_59;
  wire nl_z_mul_itm_1__0_n_60;
  wire nl_z_mul_itm_1__0_n_61;
  wire nl_z_mul_itm_1__0_n_62;
  wire nl_z_mul_itm_1__0_n_63;
  wire nl_z_mul_itm_1__0_n_64;
  wire nl_z_mul_itm_1__0_n_65;
  wire nl_z_mul_itm_1__0_n_66;
  wire nl_z_mul_itm_1__0_n_67;
  wire nl_z_mul_itm_1__0_n_68;
  wire nl_z_mul_itm_1__0_n_69;
  wire nl_z_mul_itm_1__0_n_70;
  wire nl_z_mul_itm_1__0_n_71;
  wire nl_z_mul_itm_1__0_n_72;
  wire nl_z_mul_itm_1__0_n_73;
  wire nl_z_mul_itm_1__0_n_74;
  wire nl_z_mul_itm_1__0_n_75;
  wire nl_z_mul_itm_1__0_n_76;
  wire nl_z_mul_itm_1__0_n_77;
  wire nl_z_mul_itm_1__0_n_78;
  wire nl_z_mul_itm_1__0_n_79;
  wire nl_z_mul_itm_1__0_n_80;
  wire nl_z_mul_itm_1__0_n_81;
  wire nl_z_mul_itm_1__0_n_82;
  wire nl_z_mul_itm_1__0_n_83;
  wire nl_z_mul_itm_1__0_n_84;
  wire nl_z_mul_itm_1__0_n_85;
  wire nl_z_mul_itm_1__0_n_86;
  wire nl_z_mul_itm_1__0_n_87;
  wire nl_z_mul_itm_1__0_n_88;
  wire nl_z_mul_itm_1__0_n_89;
  wire nl_z_mul_itm_1__0_n_90;
  wire nl_z_mul_itm_1__0_n_91;
  wire nl_z_mul_itm_1__0_n_92;
  wire nl_z_mul_itm_1__0_n_93;
  wire nl_z_mul_itm_1__0_n_94;
  wire nl_z_mul_itm_1__0_n_95;
  wire nl_z_mul_itm_1__0_n_96;
  wire nl_z_mul_itm_1__0_n_97;
  wire nl_z_mul_itm_1__0_n_98;
  wire nl_z_mul_itm_1__0_n_99;
  wire nl_z_mul_itm_1_carry__0_i_1_n_0;
  wire nl_z_mul_itm_1_carry__0_i_2_n_0;
  wire nl_z_mul_itm_1_carry__0_i_3_n_0;
  wire nl_z_mul_itm_1_carry__0_i_4_n_0;
  wire nl_z_mul_itm_1_carry__0_n_0;
  wire nl_z_mul_itm_1_carry__0_n_1;
  wire nl_z_mul_itm_1_carry__0_n_2;
  wire nl_z_mul_itm_1_carry__0_n_3;
  wire nl_z_mul_itm_1_carry__1_i_1_n_0;
  wire nl_z_mul_itm_1_carry__1_i_2_n_0;
  wire nl_z_mul_itm_1_carry__1_i_3_n_0;
  wire nl_z_mul_itm_1_carry__1_i_4_n_0;
  wire nl_z_mul_itm_1_carry__1_n_0;
  wire nl_z_mul_itm_1_carry__1_n_1;
  wire nl_z_mul_itm_1_carry__1_n_2;
  wire nl_z_mul_itm_1_carry__1_n_3;
  wire nl_z_mul_itm_1_carry__2_i_1_n_0;
  wire nl_z_mul_itm_1_carry__2_i_2_n_0;
  wire nl_z_mul_itm_1_carry__2_i_3_n_0;
  wire nl_z_mul_itm_1_carry__2_i_4_n_0;
  wire nl_z_mul_itm_1_carry__2_n_1;
  wire nl_z_mul_itm_1_carry__2_n_2;
  wire nl_z_mul_itm_1_carry__2_n_3;
  wire nl_z_mul_itm_1_carry_i_1_n_0;
  wire nl_z_mul_itm_1_carry_i_2_n_0;
  wire nl_z_mul_itm_1_carry_i_3_n_0;
  wire nl_z_mul_itm_1_carry_n_0;
  wire nl_z_mul_itm_1_carry_n_1;
  wire nl_z_mul_itm_1_carry_n_2;
  wire nl_z_mul_itm_1_carry_n_3;
  wire nl_z_mul_itm_1_n_100;
  wire nl_z_mul_itm_1_n_101;
  wire nl_z_mul_itm_1_n_102;
  wire nl_z_mul_itm_1_n_103;
  wire nl_z_mul_itm_1_n_104;
  wire nl_z_mul_itm_1_n_105;
  wire nl_z_mul_itm_1_n_106;
  wire nl_z_mul_itm_1_n_107;
  wire nl_z_mul_itm_1_n_108;
  wire nl_z_mul_itm_1_n_109;
  wire nl_z_mul_itm_1_n_110;
  wire nl_z_mul_itm_1_n_111;
  wire nl_z_mul_itm_1_n_112;
  wire nl_z_mul_itm_1_n_113;
  wire nl_z_mul_itm_1_n_114;
  wire nl_z_mul_itm_1_n_115;
  wire nl_z_mul_itm_1_n_116;
  wire nl_z_mul_itm_1_n_117;
  wire nl_z_mul_itm_1_n_118;
  wire nl_z_mul_itm_1_n_119;
  wire nl_z_mul_itm_1_n_120;
  wire nl_z_mul_itm_1_n_121;
  wire nl_z_mul_itm_1_n_122;
  wire nl_z_mul_itm_1_n_123;
  wire nl_z_mul_itm_1_n_124;
  wire nl_z_mul_itm_1_n_125;
  wire nl_z_mul_itm_1_n_126;
  wire nl_z_mul_itm_1_n_127;
  wire nl_z_mul_itm_1_n_128;
  wire nl_z_mul_itm_1_n_129;
  wire nl_z_mul_itm_1_n_130;
  wire nl_z_mul_itm_1_n_131;
  wire nl_z_mul_itm_1_n_132;
  wire nl_z_mul_itm_1_n_133;
  wire nl_z_mul_itm_1_n_134;
  wire nl_z_mul_itm_1_n_135;
  wire nl_z_mul_itm_1_n_136;
  wire nl_z_mul_itm_1_n_137;
  wire nl_z_mul_itm_1_n_138;
  wire nl_z_mul_itm_1_n_139;
  wire nl_z_mul_itm_1_n_140;
  wire nl_z_mul_itm_1_n_141;
  wire nl_z_mul_itm_1_n_142;
  wire nl_z_mul_itm_1_n_143;
  wire nl_z_mul_itm_1_n_144;
  wire nl_z_mul_itm_1_n_145;
  wire nl_z_mul_itm_1_n_146;
  wire nl_z_mul_itm_1_n_147;
  wire nl_z_mul_itm_1_n_148;
  wire nl_z_mul_itm_1_n_149;
  wire nl_z_mul_itm_1_n_150;
  wire nl_z_mul_itm_1_n_151;
  wire nl_z_mul_itm_1_n_152;
  wire nl_z_mul_itm_1_n_153;
  wire nl_z_mul_itm_1_n_58;
  wire nl_z_mul_itm_1_n_59;
  wire nl_z_mul_itm_1_n_60;
  wire nl_z_mul_itm_1_n_61;
  wire nl_z_mul_itm_1_n_62;
  wire nl_z_mul_itm_1_n_63;
  wire nl_z_mul_itm_1_n_64;
  wire nl_z_mul_itm_1_n_65;
  wire nl_z_mul_itm_1_n_66;
  wire nl_z_mul_itm_1_n_67;
  wire nl_z_mul_itm_1_n_68;
  wire nl_z_mul_itm_1_n_69;
  wire nl_z_mul_itm_1_n_70;
  wire nl_z_mul_itm_1_n_71;
  wire nl_z_mul_itm_1_n_72;
  wire nl_z_mul_itm_1_n_73;
  wire nl_z_mul_itm_1_n_74;
  wire nl_z_mul_itm_1_n_75;
  wire nl_z_mul_itm_1_n_76;
  wire nl_z_mul_itm_1_n_77;
  wire nl_z_mul_itm_1_n_78;
  wire nl_z_mul_itm_1_n_79;
  wire nl_z_mul_itm_1_n_80;
  wire nl_z_mul_itm_1_n_81;
  wire nl_z_mul_itm_1_n_82;
  wire nl_z_mul_itm_1_n_83;
  wire nl_z_mul_itm_1_n_84;
  wire nl_z_mul_itm_1_n_85;
  wire nl_z_mul_itm_1_n_86;
  wire nl_z_mul_itm_1_n_87;
  wire nl_z_mul_itm_1_n_88;
  wire nl_z_mul_itm_1_n_89;
  wire nl_z_mul_itm_1_n_90;
  wire nl_z_mul_itm_1_n_91;
  wire nl_z_mul_itm_1_n_92;
  wire nl_z_mul_itm_1_n_93;
  wire nl_z_mul_itm_1_n_94;
  wire nl_z_mul_itm_1_n_95;
  wire nl_z_mul_itm_1_n_96;
  wire nl_z_mul_itm_1_n_97;
  wire nl_z_mul_itm_1_n_98;
  wire nl_z_mul_itm_1_n_99;
  wire nl_z_mul_nl__0_i_10_n_0;
  wire nl_z_mul_nl__0_i_11_n_0;
  wire nl_z_mul_nl__0_i_12_n_0;
  wire nl_z_mul_nl__0_i_13_n_0;
  wire nl_z_mul_nl__0_i_14_n_0;
  wire nl_z_mul_nl__0_i_15_n_0;
  wire nl_z_mul_nl__0_i_16_n_0;
  wire nl_z_mul_nl__0_i_17_n_0;
  wire nl_z_mul_nl__0_i_17_n_1;
  wire nl_z_mul_nl__0_i_17_n_2;
  wire nl_z_mul_nl__0_i_17_n_3;
  wire nl_z_mul_nl__0_i_18_n_0;
  wire nl_z_mul_nl__0_i_19_n_0;
  wire nl_z_mul_nl__0_i_1_n_0;
  wire nl_z_mul_nl__0_i_1_n_1;
  wire nl_z_mul_nl__0_i_1_n_2;
  wire nl_z_mul_nl__0_i_1_n_3;
  wire nl_z_mul_nl__0_i_20_n_0;
  wire nl_z_mul_nl__0_i_21_n_0;
  wire nl_z_mul_nl__0_i_22_n_0;
  wire nl_z_mul_nl__0_i_22_n_1;
  wire nl_z_mul_nl__0_i_22_n_2;
  wire nl_z_mul_nl__0_i_22_n_3;
  wire nl_z_mul_nl__0_i_23_n_0;
  wire nl_z_mul_nl__0_i_24_n_0;
  wire nl_z_mul_nl__0_i_25_n_0;
  wire nl_z_mul_nl__0_i_26_n_0;
  wire nl_z_mul_nl__0_i_27_n_0;
  wire nl_z_mul_nl__0_i_27_n_1;
  wire nl_z_mul_nl__0_i_27_n_2;
  wire nl_z_mul_nl__0_i_27_n_3;
  wire nl_z_mul_nl__0_i_28_n_0;
  wire nl_z_mul_nl__0_i_29_n_0;
  wire nl_z_mul_nl__0_i_2_n_0;
  wire nl_z_mul_nl__0_i_2_n_1;
  wire nl_z_mul_nl__0_i_2_n_2;
  wire nl_z_mul_nl__0_i_2_n_3;
  wire nl_z_mul_nl__0_i_30_n_0;
  wire nl_z_mul_nl__0_i_31_n_0;
  wire nl_z_mul_nl__0_i_32_n_0;
  wire nl_z_mul_nl__0_i_32_n_1;
  wire nl_z_mul_nl__0_i_32_n_2;
  wire nl_z_mul_nl__0_i_32_n_3;
  wire nl_z_mul_nl__0_i_33_n_0;
  wire nl_z_mul_nl__0_i_34_n_0;
  wire nl_z_mul_nl__0_i_35_n_0;
  wire nl_z_mul_nl__0_i_36_n_0;
  wire nl_z_mul_nl__0_i_37_n_0;
  wire nl_z_mul_nl__0_i_38_n_0;
  wire nl_z_mul_nl__0_i_39_n_0;
  wire nl_z_mul_nl__0_i_3_n_0;
  wire nl_z_mul_nl__0_i_3_n_1;
  wire nl_z_mul_nl__0_i_3_n_2;
  wire nl_z_mul_nl__0_i_3_n_3;
  wire nl_z_mul_nl__0_i_4_n_0;
  wire nl_z_mul_nl__0_i_4_n_1;
  wire nl_z_mul_nl__0_i_4_n_2;
  wire nl_z_mul_nl__0_i_4_n_3;
  wire nl_z_mul_nl__0_i_5_n_0;
  wire nl_z_mul_nl__0_i_6_n_0;
  wire nl_z_mul_nl__0_i_7_n_0;
  wire nl_z_mul_nl__0_i_8_n_0;
  wire nl_z_mul_nl__0_i_9_n_0;
  wire nl_z_mul_nl__0_n_100;
  wire nl_z_mul_nl__0_n_101;
  wire nl_z_mul_nl__0_n_102;
  wire nl_z_mul_nl__0_n_103;
  wire nl_z_mul_nl__0_n_104;
  wire nl_z_mul_nl__0_n_105;
  wire nl_z_mul_nl__0_n_106;
  wire nl_z_mul_nl__0_n_107;
  wire nl_z_mul_nl__0_n_108;
  wire nl_z_mul_nl__0_n_109;
  wire nl_z_mul_nl__0_n_110;
  wire nl_z_mul_nl__0_n_111;
  wire nl_z_mul_nl__0_n_112;
  wire nl_z_mul_nl__0_n_113;
  wire nl_z_mul_nl__0_n_114;
  wire nl_z_mul_nl__0_n_115;
  wire nl_z_mul_nl__0_n_116;
  wire nl_z_mul_nl__0_n_117;
  wire nl_z_mul_nl__0_n_118;
  wire nl_z_mul_nl__0_n_119;
  wire nl_z_mul_nl__0_n_120;
  wire nl_z_mul_nl__0_n_121;
  wire nl_z_mul_nl__0_n_122;
  wire nl_z_mul_nl__0_n_123;
  wire nl_z_mul_nl__0_n_124;
  wire nl_z_mul_nl__0_n_125;
  wire nl_z_mul_nl__0_n_126;
  wire nl_z_mul_nl__0_n_127;
  wire nl_z_mul_nl__0_n_128;
  wire nl_z_mul_nl__0_n_129;
  wire nl_z_mul_nl__0_n_130;
  wire nl_z_mul_nl__0_n_131;
  wire nl_z_mul_nl__0_n_132;
  wire nl_z_mul_nl__0_n_133;
  wire nl_z_mul_nl__0_n_134;
  wire nl_z_mul_nl__0_n_135;
  wire nl_z_mul_nl__0_n_136;
  wire nl_z_mul_nl__0_n_137;
  wire nl_z_mul_nl__0_n_138;
  wire nl_z_mul_nl__0_n_139;
  wire nl_z_mul_nl__0_n_140;
  wire nl_z_mul_nl__0_n_141;
  wire nl_z_mul_nl__0_n_142;
  wire nl_z_mul_nl__0_n_143;
  wire nl_z_mul_nl__0_n_144;
  wire nl_z_mul_nl__0_n_145;
  wire nl_z_mul_nl__0_n_146;
  wire nl_z_mul_nl__0_n_147;
  wire nl_z_mul_nl__0_n_148;
  wire nl_z_mul_nl__0_n_149;
  wire nl_z_mul_nl__0_n_150;
  wire nl_z_mul_nl__0_n_151;
  wire nl_z_mul_nl__0_n_152;
  wire nl_z_mul_nl__0_n_153;
  wire nl_z_mul_nl__0_n_24;
  wire nl_z_mul_nl__0_n_25;
  wire nl_z_mul_nl__0_n_26;
  wire nl_z_mul_nl__0_n_27;
  wire nl_z_mul_nl__0_n_28;
  wire nl_z_mul_nl__0_n_29;
  wire nl_z_mul_nl__0_n_30;
  wire nl_z_mul_nl__0_n_31;
  wire nl_z_mul_nl__0_n_32;
  wire nl_z_mul_nl__0_n_33;
  wire nl_z_mul_nl__0_n_34;
  wire nl_z_mul_nl__0_n_35;
  wire nl_z_mul_nl__0_n_36;
  wire nl_z_mul_nl__0_n_37;
  wire nl_z_mul_nl__0_n_38;
  wire nl_z_mul_nl__0_n_39;
  wire nl_z_mul_nl__0_n_40;
  wire nl_z_mul_nl__0_n_41;
  wire nl_z_mul_nl__0_n_42;
  wire nl_z_mul_nl__0_n_43;
  wire nl_z_mul_nl__0_n_44;
  wire nl_z_mul_nl__0_n_45;
  wire nl_z_mul_nl__0_n_46;
  wire nl_z_mul_nl__0_n_47;
  wire nl_z_mul_nl__0_n_48;
  wire nl_z_mul_nl__0_n_49;
  wire nl_z_mul_nl__0_n_50;
  wire nl_z_mul_nl__0_n_51;
  wire nl_z_mul_nl__0_n_52;
  wire nl_z_mul_nl__0_n_53;
  wire nl_z_mul_nl__0_n_58;
  wire nl_z_mul_nl__0_n_59;
  wire nl_z_mul_nl__0_n_60;
  wire nl_z_mul_nl__0_n_61;
  wire nl_z_mul_nl__0_n_62;
  wire nl_z_mul_nl__0_n_63;
  wire nl_z_mul_nl__0_n_64;
  wire nl_z_mul_nl__0_n_65;
  wire nl_z_mul_nl__0_n_66;
  wire nl_z_mul_nl__0_n_67;
  wire nl_z_mul_nl__0_n_68;
  wire nl_z_mul_nl__0_n_69;
  wire nl_z_mul_nl__0_n_70;
  wire nl_z_mul_nl__0_n_71;
  wire nl_z_mul_nl__0_n_72;
  wire nl_z_mul_nl__0_n_73;
  wire nl_z_mul_nl__0_n_74;
  wire nl_z_mul_nl__0_n_75;
  wire nl_z_mul_nl__0_n_76;
  wire nl_z_mul_nl__0_n_77;
  wire nl_z_mul_nl__0_n_78;
  wire nl_z_mul_nl__0_n_79;
  wire nl_z_mul_nl__0_n_80;
  wire nl_z_mul_nl__0_n_81;
  wire nl_z_mul_nl__0_n_82;
  wire nl_z_mul_nl__0_n_83;
  wire nl_z_mul_nl__0_n_84;
  wire nl_z_mul_nl__0_n_85;
  wire nl_z_mul_nl__0_n_86;
  wire nl_z_mul_nl__0_n_87;
  wire nl_z_mul_nl__0_n_88;
  wire nl_z_mul_nl__0_n_89;
  wire nl_z_mul_nl__0_n_90;
  wire nl_z_mul_nl__0_n_91;
  wire nl_z_mul_nl__0_n_92;
  wire nl_z_mul_nl__0_n_93;
  wire nl_z_mul_nl__0_n_94;
  wire nl_z_mul_nl__0_n_95;
  wire nl_z_mul_nl__0_n_96;
  wire nl_z_mul_nl__0_n_97;
  wire nl_z_mul_nl__0_n_98;
  wire nl_z_mul_nl__0_n_99;
  wire nl_z_mul_nl__1_n_100;
  wire nl_z_mul_nl__1_n_101;
  wire nl_z_mul_nl__1_n_102;
  wire nl_z_mul_nl__1_n_103;
  wire nl_z_mul_nl__1_n_104;
  wire nl_z_mul_nl__1_n_105;
  wire nl_z_mul_nl__1_n_58;
  wire nl_z_mul_nl__1_n_59;
  wire nl_z_mul_nl__1_n_60;
  wire nl_z_mul_nl__1_n_61;
  wire nl_z_mul_nl__1_n_62;
  wire nl_z_mul_nl__1_n_63;
  wire nl_z_mul_nl__1_n_64;
  wire nl_z_mul_nl__1_n_65;
  wire nl_z_mul_nl__1_n_66;
  wire nl_z_mul_nl__1_n_67;
  wire nl_z_mul_nl__1_n_68;
  wire nl_z_mul_nl__1_n_69;
  wire nl_z_mul_nl__1_n_70;
  wire nl_z_mul_nl__1_n_71;
  wire nl_z_mul_nl__1_n_72;
  wire nl_z_mul_nl__1_n_73;
  wire nl_z_mul_nl__1_n_74;
  wire nl_z_mul_nl__1_n_75;
  wire nl_z_mul_nl__1_n_76;
  wire nl_z_mul_nl__1_n_77;
  wire nl_z_mul_nl__1_n_78;
  wire nl_z_mul_nl__1_n_79;
  wire nl_z_mul_nl__1_n_80;
  wire nl_z_mul_nl__1_n_81;
  wire nl_z_mul_nl__1_n_82;
  wire nl_z_mul_nl__1_n_83;
  wire nl_z_mul_nl__1_n_84;
  wire nl_z_mul_nl__1_n_85;
  wire nl_z_mul_nl__1_n_86;
  wire nl_z_mul_nl__1_n_87;
  wire nl_z_mul_nl__1_n_88;
  wire nl_z_mul_nl__1_n_89;
  wire nl_z_mul_nl__1_n_90;
  wire nl_z_mul_nl__1_n_91;
  wire nl_z_mul_nl__1_n_92;
  wire nl_z_mul_nl__1_n_93;
  wire nl_z_mul_nl__1_n_94;
  wire nl_z_mul_nl__1_n_95;
  wire nl_z_mul_nl__1_n_96;
  wire nl_z_mul_nl__1_n_97;
  wire nl_z_mul_nl__1_n_98;
  wire nl_z_mul_nl__1_n_99;
  wire [31:16]nl_z_mul_nl__2;
  wire nl_z_mul_nl_carry__0_i_1_n_0;
  wire nl_z_mul_nl_carry__0_i_2_n_0;
  wire nl_z_mul_nl_carry__0_i_3_n_0;
  wire nl_z_mul_nl_carry__0_i_4_n_0;
  wire nl_z_mul_nl_carry__0_n_0;
  wire nl_z_mul_nl_carry__0_n_1;
  wire nl_z_mul_nl_carry__0_n_2;
  wire nl_z_mul_nl_carry__0_n_3;
  wire nl_z_mul_nl_carry__1_i_1_n_0;
  wire nl_z_mul_nl_carry__1_i_2_n_0;
  wire nl_z_mul_nl_carry__1_i_3_n_0;
  wire nl_z_mul_nl_carry__1_i_4_n_0;
  wire nl_z_mul_nl_carry__1_n_0;
  wire nl_z_mul_nl_carry__1_n_1;
  wire nl_z_mul_nl_carry__1_n_2;
  wire nl_z_mul_nl_carry__1_n_3;
  wire nl_z_mul_nl_carry__2_i_1_n_0;
  wire nl_z_mul_nl_carry__2_i_2_n_0;
  wire nl_z_mul_nl_carry__2_i_3_n_0;
  wire nl_z_mul_nl_carry__2_i_4_n_0;
  wire nl_z_mul_nl_carry__2_n_1;
  wire nl_z_mul_nl_carry__2_n_2;
  wire nl_z_mul_nl_carry__2_n_3;
  wire nl_z_mul_nl_carry_i_1_n_0;
  wire nl_z_mul_nl_carry_i_2_n_0;
  wire nl_z_mul_nl_carry_i_3_n_0;
  wire nl_z_mul_nl_carry_n_0;
  wire nl_z_mul_nl_carry_n_1;
  wire nl_z_mul_nl_carry_n_2;
  wire nl_z_mul_nl_carry_n_3;
  wire nl_z_mul_nl_i_10_n_0;
  wire nl_z_mul_nl_i_11_n_0;
  wire nl_z_mul_nl_i_12_n_0;
  wire nl_z_mul_nl_i_13_n_0;
  wire nl_z_mul_nl_i_14_n_0;
  wire nl_z_mul_nl_i_15_n_0;
  wire nl_z_mul_nl_i_16_n_0;
  wire nl_z_mul_nl_i_17_n_0;
  wire nl_z_mul_nl_i_18_n_0;
  wire nl_z_mul_nl_i_19_n_0;
  wire nl_z_mul_nl_i_20_n_0;
  wire nl_z_mul_nl_i_21_n_0;
  wire nl_z_mul_nl_i_22_n_0;
  wire nl_z_mul_nl_i_23_n_0;
  wire nl_z_mul_nl_i_2_n_1;
  wire nl_z_mul_nl_i_2_n_2;
  wire nl_z_mul_nl_i_2_n_3;
  wire nl_z_mul_nl_i_3_n_0;
  wire nl_z_mul_nl_i_3_n_1;
  wire nl_z_mul_nl_i_3_n_2;
  wire nl_z_mul_nl_i_3_n_3;
  wire nl_z_mul_nl_i_4_n_0;
  wire nl_z_mul_nl_i_4_n_1;
  wire nl_z_mul_nl_i_4_n_2;
  wire nl_z_mul_nl_i_4_n_3;
  wire nl_z_mul_nl_i_5_n_0;
  wire nl_z_mul_nl_i_5_n_1;
  wire nl_z_mul_nl_i_5_n_2;
  wire nl_z_mul_nl_i_5_n_3;
  wire nl_z_mul_nl_i_8_n_0;
  wire nl_z_mul_nl_i_9_n_0;
  wire nl_z_mul_nl_n_100;
  wire nl_z_mul_nl_n_101;
  wire nl_z_mul_nl_n_102;
  wire nl_z_mul_nl_n_103;
  wire nl_z_mul_nl_n_104;
  wire nl_z_mul_nl_n_105;
  wire nl_z_mul_nl_n_106;
  wire nl_z_mul_nl_n_107;
  wire nl_z_mul_nl_n_108;
  wire nl_z_mul_nl_n_109;
  wire nl_z_mul_nl_n_110;
  wire nl_z_mul_nl_n_111;
  wire nl_z_mul_nl_n_112;
  wire nl_z_mul_nl_n_113;
  wire nl_z_mul_nl_n_114;
  wire nl_z_mul_nl_n_115;
  wire nl_z_mul_nl_n_116;
  wire nl_z_mul_nl_n_117;
  wire nl_z_mul_nl_n_118;
  wire nl_z_mul_nl_n_119;
  wire nl_z_mul_nl_n_120;
  wire nl_z_mul_nl_n_121;
  wire nl_z_mul_nl_n_122;
  wire nl_z_mul_nl_n_123;
  wire nl_z_mul_nl_n_124;
  wire nl_z_mul_nl_n_125;
  wire nl_z_mul_nl_n_126;
  wire nl_z_mul_nl_n_127;
  wire nl_z_mul_nl_n_128;
  wire nl_z_mul_nl_n_129;
  wire nl_z_mul_nl_n_130;
  wire nl_z_mul_nl_n_131;
  wire nl_z_mul_nl_n_132;
  wire nl_z_mul_nl_n_133;
  wire nl_z_mul_nl_n_134;
  wire nl_z_mul_nl_n_135;
  wire nl_z_mul_nl_n_136;
  wire nl_z_mul_nl_n_137;
  wire nl_z_mul_nl_n_138;
  wire nl_z_mul_nl_n_139;
  wire nl_z_mul_nl_n_140;
  wire nl_z_mul_nl_n_141;
  wire nl_z_mul_nl_n_142;
  wire nl_z_mul_nl_n_143;
  wire nl_z_mul_nl_n_144;
  wire nl_z_mul_nl_n_145;
  wire nl_z_mul_nl_n_146;
  wire nl_z_mul_nl_n_147;
  wire nl_z_mul_nl_n_148;
  wire nl_z_mul_nl_n_149;
  wire nl_z_mul_nl_n_150;
  wire nl_z_mul_nl_n_151;
  wire nl_z_mul_nl_n_152;
  wire nl_z_mul_nl_n_153;
  wire nl_z_mul_nl_n_58;
  wire nl_z_mul_nl_n_59;
  wire nl_z_mul_nl_n_60;
  wire nl_z_mul_nl_n_61;
  wire nl_z_mul_nl_n_62;
  wire nl_z_mul_nl_n_63;
  wire nl_z_mul_nl_n_64;
  wire nl_z_mul_nl_n_65;
  wire nl_z_mul_nl_n_66;
  wire nl_z_mul_nl_n_67;
  wire nl_z_mul_nl_n_68;
  wire nl_z_mul_nl_n_69;
  wire nl_z_mul_nl_n_70;
  wire nl_z_mul_nl_n_71;
  wire nl_z_mul_nl_n_72;
  wire nl_z_mul_nl_n_73;
  wire nl_z_mul_nl_n_74;
  wire nl_z_mul_nl_n_75;
  wire nl_z_mul_nl_n_76;
  wire nl_z_mul_nl_n_77;
  wire nl_z_mul_nl_n_78;
  wire nl_z_mul_nl_n_79;
  wire nl_z_mul_nl_n_80;
  wire nl_z_mul_nl_n_81;
  wire nl_z_mul_nl_n_82;
  wire nl_z_mul_nl_n_83;
  wire nl_z_mul_nl_n_84;
  wire nl_z_mul_nl_n_85;
  wire nl_z_mul_nl_n_86;
  wire nl_z_mul_nl_n_87;
  wire nl_z_mul_nl_n_88;
  wire nl_z_mul_nl_n_89;
  wire nl_z_mul_nl_n_90;
  wire nl_z_mul_nl_n_91;
  wire nl_z_mul_nl_n_92;
  wire nl_z_mul_nl_n_93;
  wire nl_z_mul_nl_n_94;
  wire nl_z_mul_nl_n_95;
  wire nl_z_mul_nl_n_96;
  wire nl_z_mul_nl_n_97;
  wire nl_z_mul_nl_n_98;
  wire nl_z_mul_nl_n_99;
  wire [31:0]out;
  wire p_and_1_cse;
  wire [31:0]p_buf_sva_1;
  wire [31:0]p_buf_sva_2;
  wire p_buf_sva_20;
  wire [31:0]p_rsc_dat;
  wire p_sva0;
  wire [31:0]readslicef_64_32_32_return;
  wire res_and_cse__1;
  wire [31:0]res_sva_1;
  wire [31:0]result;
  wire [31:0]\return_rsci_d_reg[31]_0 ;
  wire rst;
  wire slc_32_svs_1;
  wire vector__0_n_100;
  wire vector__0_n_101;
  wire vector__0_n_102;
  wire vector__0_n_103;
  wire vector__0_n_104;
  wire vector__0_n_105;
  wire vector__0_n_58;
  wire vector__0_n_59;
  wire vector__0_n_60;
  wire vector__0_n_61;
  wire vector__0_n_62;
  wire vector__0_n_63;
  wire vector__0_n_64;
  wire vector__0_n_65;
  wire vector__0_n_66;
  wire vector__0_n_67;
  wire vector__0_n_68;
  wire vector__0_n_69;
  wire vector__0_n_70;
  wire vector__0_n_71;
  wire vector__0_n_72;
  wire vector__0_n_73;
  wire vector__0_n_74;
  wire vector__0_n_75;
  wire vector__0_n_76;
  wire vector__0_n_77;
  wire vector__0_n_78;
  wire vector__0_n_79;
  wire vector__0_n_80;
  wire vector__0_n_81;
  wire vector__0_n_82;
  wire vector__0_n_83;
  wire vector__0_n_84;
  wire vector__0_n_85;
  wire vector__0_n_86;
  wire vector__0_n_87;
  wire vector__0_n_88;
  wire vector__0_n_89;
  wire vector__0_n_90;
  wire vector__0_n_91;
  wire vector__0_n_92;
  wire vector__0_n_93;
  wire vector__0_n_94;
  wire vector__0_n_95;
  wire vector__0_n_96;
  wire vector__0_n_97;
  wire vector__0_n_98;
  wire vector__0_n_99;
  wire vector__1_n_100;
  wire vector__1_n_101;
  wire vector__1_n_102;
  wire vector__1_n_103;
  wire vector__1_n_104;
  wire vector__1_n_105;
  wire vector__1_n_106;
  wire vector__1_n_107;
  wire vector__1_n_108;
  wire vector__1_n_109;
  wire vector__1_n_110;
  wire vector__1_n_111;
  wire vector__1_n_112;
  wire vector__1_n_113;
  wire vector__1_n_114;
  wire vector__1_n_115;
  wire vector__1_n_116;
  wire vector__1_n_117;
  wire vector__1_n_118;
  wire vector__1_n_119;
  wire vector__1_n_120;
  wire vector__1_n_121;
  wire vector__1_n_122;
  wire vector__1_n_123;
  wire vector__1_n_124;
  wire vector__1_n_125;
  wire vector__1_n_126;
  wire vector__1_n_127;
  wire vector__1_n_128;
  wire vector__1_n_129;
  wire vector__1_n_130;
  wire vector__1_n_131;
  wire vector__1_n_132;
  wire vector__1_n_133;
  wire vector__1_n_134;
  wire vector__1_n_135;
  wire vector__1_n_136;
  wire vector__1_n_137;
  wire vector__1_n_138;
  wire vector__1_n_139;
  wire vector__1_n_140;
  wire vector__1_n_141;
  wire vector__1_n_142;
  wire vector__1_n_143;
  wire vector__1_n_144;
  wire vector__1_n_145;
  wire vector__1_n_146;
  wire vector__1_n_147;
  wire vector__1_n_148;
  wire vector__1_n_149;
  wire vector__1_n_150;
  wire vector__1_n_151;
  wire vector__1_n_152;
  wire vector__1_n_153;
  wire vector__1_n_58;
  wire vector__1_n_59;
  wire vector__1_n_60;
  wire vector__1_n_61;
  wire vector__1_n_62;
  wire vector__1_n_63;
  wire vector__1_n_64;
  wire vector__1_n_65;
  wire vector__1_n_66;
  wire vector__1_n_67;
  wire vector__1_n_68;
  wire vector__1_n_69;
  wire vector__1_n_70;
  wire vector__1_n_71;
  wire vector__1_n_72;
  wire vector__1_n_73;
  wire vector__1_n_74;
  wire vector__1_n_75;
  wire vector__1_n_76;
  wire vector__1_n_77;
  wire vector__1_n_78;
  wire vector__1_n_79;
  wire vector__1_n_80;
  wire vector__1_n_81;
  wire vector__1_n_82;
  wire vector__1_n_83;
  wire vector__1_n_84;
  wire vector__1_n_85;
  wire vector__1_n_86;
  wire vector__1_n_87;
  wire vector__1_n_88;
  wire vector__1_n_89;
  wire vector__1_n_90;
  wire vector__1_n_91;
  wire vector__1_n_92;
  wire vector__1_n_93;
  wire vector__1_n_94;
  wire vector__1_n_95;
  wire vector__1_n_96;
  wire vector__1_n_97;
  wire vector__1_n_98;
  wire vector__1_n_99;
  wire [14:0]vector__2_0;
  wire vector__2_n_100;
  wire vector__2_n_101;
  wire vector__2_n_102;
  wire vector__2_n_103;
  wire vector__2_n_104;
  wire vector__2_n_105;
  wire vector__2_n_58;
  wire vector__2_n_59;
  wire vector__2_n_60;
  wire vector__2_n_61;
  wire vector__2_n_62;
  wire vector__2_n_63;
  wire vector__2_n_64;
  wire vector__2_n_65;
  wire vector__2_n_66;
  wire vector__2_n_67;
  wire vector__2_n_68;
  wire vector__2_n_69;
  wire vector__2_n_70;
  wire vector__2_n_71;
  wire vector__2_n_72;
  wire vector__2_n_73;
  wire vector__2_n_74;
  wire vector__2_n_75;
  wire vector__2_n_76;
  wire vector__2_n_77;
  wire vector__2_n_78;
  wire vector__2_n_79;
  wire vector__2_n_80;
  wire vector__2_n_81;
  wire vector__2_n_82;
  wire vector__2_n_83;
  wire vector__2_n_84;
  wire vector__2_n_85;
  wire vector__2_n_86;
  wire vector__2_n_87;
  wire vector__2_n_88;
  wire vector__2_n_89;
  wire vector__2_n_90;
  wire vector__2_n_91;
  wire vector__2_n_92;
  wire vector__2_n_93;
  wire vector__2_n_94;
  wire vector__2_n_95;
  wire vector__2_n_96;
  wire vector__2_n_97;
  wire vector__2_n_98;
  wire vector__2_n_99;
  wire vector_n_100;
  wire vector_n_101;
  wire vector_n_102;
  wire vector_n_103;
  wire vector_n_104;
  wire vector_n_105;
  wire vector_n_106;
  wire vector_n_107;
  wire vector_n_108;
  wire vector_n_109;
  wire vector_n_110;
  wire vector_n_111;
  wire vector_n_112;
  wire vector_n_113;
  wire vector_n_114;
  wire vector_n_115;
  wire vector_n_116;
  wire vector_n_117;
  wire vector_n_118;
  wire vector_n_119;
  wire vector_n_120;
  wire vector_n_121;
  wire vector_n_122;
  wire vector_n_123;
  wire vector_n_124;
  wire vector_n_125;
  wire vector_n_126;
  wire vector_n_127;
  wire vector_n_128;
  wire vector_n_129;
  wire vector_n_130;
  wire vector_n_131;
  wire vector_n_132;
  wire vector_n_133;
  wire vector_n_134;
  wire vector_n_135;
  wire vector_n_136;
  wire vector_n_137;
  wire vector_n_138;
  wire vector_n_139;
  wire vector_n_140;
  wire vector_n_141;
  wire vector_n_142;
  wire vector_n_143;
  wire vector_n_144;
  wire vector_n_145;
  wire vector_n_146;
  wire vector_n_147;
  wire vector_n_148;
  wire vector_n_149;
  wire vector_n_150;
  wire vector_n_151;
  wire vector_n_152;
  wire vector_n_153;
  wire vector_n_58;
  wire vector_n_59;
  wire vector_n_60;
  wire vector_n_61;
  wire vector_n_62;
  wire vector_n_63;
  wire vector_n_64;
  wire vector_n_65;
  wire vector_n_66;
  wire vector_n_67;
  wire vector_n_68;
  wire vector_n_69;
  wire vector_n_70;
  wire vector_n_71;
  wire vector_n_72;
  wire vector_n_73;
  wire vector_n_74;
  wire vector_n_75;
  wire vector_n_76;
  wire vector_n_77;
  wire vector_n_78;
  wire vector_n_79;
  wire vector_n_80;
  wire vector_n_81;
  wire vector_n_82;
  wire vector_n_83;
  wire vector_n_84;
  wire vector_n_85;
  wire vector_n_86;
  wire vector_n_87;
  wire vector_n_88;
  wire vector_n_89;
  wire vector_n_90;
  wire vector_n_91;
  wire vector_n_92;
  wire vector_n_93;
  wire vector_n_94;
  wire vector_n_95;
  wire vector_n_96;
  wire vector_n_97;
  wire vector_n_98;
  wire vector_n_99;
  wire \z_mul_itm_1_reg[0]__0_n_0 ;
  wire \z_mul_itm_1_reg[10]__0_n_0 ;
  wire \z_mul_itm_1_reg[11]__0_n_0 ;
  wire \z_mul_itm_1_reg[12]__0_n_0 ;
  wire \z_mul_itm_1_reg[13]__0_n_0 ;
  wire \z_mul_itm_1_reg[14]__0_n_0 ;
  wire \z_mul_itm_1_reg[15]__0_n_0 ;
  wire \z_mul_itm_1_reg[16]__0_n_0 ;
  wire \z_mul_itm_1_reg[1]__0_n_0 ;
  wire \z_mul_itm_1_reg[2]__0_n_0 ;
  wire \z_mul_itm_1_reg[3]__0_n_0 ;
  wire \z_mul_itm_1_reg[4]__0_n_0 ;
  wire \z_mul_itm_1_reg[5]__0_n_0 ;
  wire \z_mul_itm_1_reg[6]__0_n_0 ;
  wire \z_mul_itm_1_reg[7]__0_n_0 ;
  wire \z_mul_itm_1_reg[8]__0_n_0 ;
  wire \z_mul_itm_1_reg[9]__0_n_0 ;
  wire [14:0]z_mul_itm_1_reg_0;
  wire [31:16]z_mul_itm_1_reg__0;
  wire z_mul_itm_1_reg_n_100;
  wire z_mul_itm_1_reg_n_101;
  wire z_mul_itm_1_reg_n_102;
  wire z_mul_itm_1_reg_n_103;
  wire z_mul_itm_1_reg_n_104;
  wire z_mul_itm_1_reg_n_105;
  wire z_mul_itm_1_reg_n_58;
  wire z_mul_itm_1_reg_n_59;
  wire z_mul_itm_1_reg_n_60;
  wire z_mul_itm_1_reg_n_61;
  wire z_mul_itm_1_reg_n_62;
  wire z_mul_itm_1_reg_n_63;
  wire z_mul_itm_1_reg_n_64;
  wire z_mul_itm_1_reg_n_65;
  wire z_mul_itm_1_reg_n_66;
  wire z_mul_itm_1_reg_n_67;
  wire z_mul_itm_1_reg_n_68;
  wire z_mul_itm_1_reg_n_69;
  wire z_mul_itm_1_reg_n_70;
  wire z_mul_itm_1_reg_n_71;
  wire z_mul_itm_1_reg_n_72;
  wire z_mul_itm_1_reg_n_73;
  wire z_mul_itm_1_reg_n_74;
  wire z_mul_itm_1_reg_n_75;
  wire z_mul_itm_1_reg_n_76;
  wire z_mul_itm_1_reg_n_77;
  wire z_mul_itm_1_reg_n_78;
  wire z_mul_itm_1_reg_n_79;
  wire z_mul_itm_1_reg_n_80;
  wire z_mul_itm_1_reg_n_81;
  wire z_mul_itm_1_reg_n_82;
  wire z_mul_itm_1_reg_n_83;
  wire z_mul_itm_1_reg_n_84;
  wire z_mul_itm_1_reg_n_85;
  wire z_mul_itm_1_reg_n_86;
  wire z_mul_itm_1_reg_n_87;
  wire z_mul_itm_1_reg_n_88;
  wire z_mul_itm_1_reg_n_89;
  wire z_mul_itm_1_reg_n_90;
  wire z_mul_itm_1_reg_n_91;
  wire z_mul_itm_1_reg_n_92;
  wire z_mul_itm_1_reg_n_93;
  wire z_mul_itm_1_reg_n_94;
  wire z_mul_itm_1_reg_n_95;
  wire z_mul_itm_1_reg_n_96;
  wire z_mul_itm_1_reg_n_97;
  wire z_mul_itm_1_reg_n_98;
  wire z_mul_itm_1_reg_n_99;
  wire [3:0]NLW_nl_if_acc_1_nl_carry_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__4_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__5_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__6_O_UNCONNECTED;
  wire [3:0]NLW_nl_if_acc_1_nl_carry__7_CO_UNCONNECTED;
  wire [3:1]NLW_nl_if_acc_1_nl_carry__7_O_UNCONNECTED;
  wire [3:3]NLW_nl_if_acc_nl_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_nl_res_sva_3_carry__6_CO_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_nl_z_mul_itm_1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_nl_z_mul_itm_1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_itm_1_CARRYOUT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1__0_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_itm_1__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_nl_z_mul_itm_1__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_nl_z_mul_itm_1__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_itm_1__0_CARRYOUT_UNCONNECTED;
  wire [3:3]NLW_nl_z_mul_itm_1_carry__2_CO_UNCONNECTED;
  wire NLW_nl_z_mul_nl_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_mul_nl_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_nl_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_nl_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_nl_z_mul_nl_ACOUT_UNCONNECTED;
  wire [17:0]NLW_nl_z_mul_nl_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl_CARRYOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__0_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_mul_nl__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__0_UNDERFLOW_UNCONNECTED;
  wire [17:0]NLW_nl_z_mul_nl__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl__0_CARRYOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl__0_i_17_O_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl__0_i_22_O_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl__0_i_27_O_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl__0_i_32_O_UNCONNECTED;
  wire NLW_nl_z_mul_nl__1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__1_OVERFLOW_UNCONNECTED;
  wire NLW_nl_z_mul_nl__1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__1_PATTERNDETECT_UNCONNECTED;
  wire NLW_nl_z_mul_nl__1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_nl_z_mul_nl__1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_nl_z_mul_nl__1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_nl_z_mul_nl__1_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_nl_z_mul_nl__1_PCOUT_UNCONNECTED;
  wire [3:3]NLW_nl_z_mul_nl_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_nl_z_mul_nl_i_2_CO_UNCONNECTED;
  wire NLW_vector_CARRYCASCOUT_UNCONNECTED;
  wire NLW_vector_MULTSIGNOUT_UNCONNECTED;
  wire NLW_vector_OVERFLOW_UNCONNECTED;
  wire NLW_vector_PATTERNBDETECT_UNCONNECTED;
  wire NLW_vector_PATTERNDETECT_UNCONNECTED;
  wire NLW_vector_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_vector_ACOUT_UNCONNECTED;
  wire [17:0]NLW_vector_BCOUT_UNCONNECTED;
  wire [3:0]NLW_vector_CARRYOUT_UNCONNECTED;
  wire NLW_vector__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_vector__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_vector__0_OVERFLOW_UNCONNECTED;
  wire NLW_vector__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_vector__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_vector__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_vector__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_vector__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_vector__0_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_vector__0_PCOUT_UNCONNECTED;
  wire NLW_vector__1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_vector__1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_vector__1_OVERFLOW_UNCONNECTED;
  wire NLW_vector__1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_vector__1_PATTERNDETECT_UNCONNECTED;
  wire NLW_vector__1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_vector__1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_vector__1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_vector__1_CARRYOUT_UNCONNECTED;
  wire NLW_vector__2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_vector__2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_vector__2_OVERFLOW_UNCONNECTED;
  wire NLW_vector__2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_vector__2_PATTERNDETECT_UNCONNECTED;
  wire NLW_vector__2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_vector__2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_vector__2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_vector__2_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_vector__2_PCOUT_UNCONNECTED;
  wire NLW_z_mul_itm_1_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_z_mul_itm_1_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_z_mul_itm_1_reg_OVERFLOW_UNCONNECTED;
  wire NLW_z_mul_itm_1_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_z_mul_itm_1_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_z_mul_itm_1_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_z_mul_itm_1_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_z_mul_itm_1_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_z_mul_itm_1_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_z_mul_itm_1_reg_PCOUT_UNCONNECTED;

  FDRE asn_itm_1_reg
       (.C(clk),
        .CE(1'b1),
        .D(asn_itm_1_reg_0),
        .Q(asn_itm_1),
        .R(rst));
  FDRE main_stage_0_2_reg
       (.C(clk),
        .CE(1'b1),
        .D(main_stage_0_2_reg_0),
        .Q(main_stage_0_2),
        .R(rst));
  CARRY4 nl_if_acc_1_nl_carry
       (.CI(1'b0),
        .CO({nl_if_acc_1_nl_carry_n_0,nl_if_acc_1_nl_carry_n_1,nl_if_acc_1_nl_carry_n_2,nl_if_acc_1_nl_carry_n_3}),
        .CYINIT(1'b1),
        .DI(nl_res_sva_3[3:0]),
        .O(NLW_nl_if_acc_1_nl_carry_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry_i_1_n_0,nl_if_acc_1_nl_carry_i_2_n_0,nl_if_acc_1_nl_carry_i_3_n_0,nl_if_acc_1_nl_carry_i_4_n_0}));
  CARRY4 nl_if_acc_1_nl_carry__0
       (.CI(nl_if_acc_1_nl_carry_n_0),
        .CO({nl_if_acc_1_nl_carry__0_n_0,nl_if_acc_1_nl_carry__0_n_1,nl_if_acc_1_nl_carry__0_n_2,nl_if_acc_1_nl_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[7:4]),
        .O(NLW_nl_if_acc_1_nl_carry__0_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__0_i_1_n_0,nl_if_acc_1_nl_carry__0_i_2_n_0,nl_if_acc_1_nl_carry__0_i_3_n_0,nl_if_acc_1_nl_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__0_i_1
       (.I0(nl_res_sva_3[7]),
        .I1(p_buf_sva_1[7]),
        .O(nl_if_acc_1_nl_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__0_i_2
       (.I0(nl_res_sva_3[6]),
        .I1(p_buf_sva_1[6]),
        .O(nl_if_acc_1_nl_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__0_i_3
       (.I0(nl_res_sva_3[5]),
        .I1(p_buf_sva_1[5]),
        .O(nl_if_acc_1_nl_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__0_i_4
       (.I0(nl_res_sva_3[4]),
        .I1(p_buf_sva_1[4]),
        .O(nl_if_acc_1_nl_carry__0_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__1
       (.CI(nl_if_acc_1_nl_carry__0_n_0),
        .CO({nl_if_acc_1_nl_carry__1_n_0,nl_if_acc_1_nl_carry__1_n_1,nl_if_acc_1_nl_carry__1_n_2,nl_if_acc_1_nl_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[11:8]),
        .O(NLW_nl_if_acc_1_nl_carry__1_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__1_i_1_n_0,nl_if_acc_1_nl_carry__1_i_2_n_0,nl_if_acc_1_nl_carry__1_i_3_n_0,nl_if_acc_1_nl_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__1_i_1
       (.I0(nl_res_sva_3[11]),
        .I1(p_buf_sva_1[11]),
        .O(nl_if_acc_1_nl_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__1_i_2
       (.I0(nl_res_sva_3[10]),
        .I1(p_buf_sva_1[10]),
        .O(nl_if_acc_1_nl_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__1_i_3
       (.I0(nl_res_sva_3[9]),
        .I1(p_buf_sva_1[9]),
        .O(nl_if_acc_1_nl_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__1_i_4
       (.I0(nl_res_sva_3[8]),
        .I1(p_buf_sva_1[8]),
        .O(nl_if_acc_1_nl_carry__1_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__2
       (.CI(nl_if_acc_1_nl_carry__1_n_0),
        .CO({nl_if_acc_1_nl_carry__2_n_0,nl_if_acc_1_nl_carry__2_n_1,nl_if_acc_1_nl_carry__2_n_2,nl_if_acc_1_nl_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[15:12]),
        .O(NLW_nl_if_acc_1_nl_carry__2_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__2_i_1_n_0,nl_if_acc_1_nl_carry__2_i_2_n_0,nl_if_acc_1_nl_carry__2_i_3_n_0,nl_if_acc_1_nl_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__2_i_1
       (.I0(nl_res_sva_3[15]),
        .I1(p_buf_sva_1[15]),
        .O(nl_if_acc_1_nl_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__2_i_2
       (.I0(nl_res_sva_3[14]),
        .I1(p_buf_sva_1[14]),
        .O(nl_if_acc_1_nl_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__2_i_3
       (.I0(nl_res_sva_3[13]),
        .I1(p_buf_sva_1[13]),
        .O(nl_if_acc_1_nl_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__2_i_4
       (.I0(nl_res_sva_3[12]),
        .I1(p_buf_sva_1[12]),
        .O(nl_if_acc_1_nl_carry__2_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__3
       (.CI(nl_if_acc_1_nl_carry__2_n_0),
        .CO({nl_if_acc_1_nl_carry__3_n_0,nl_if_acc_1_nl_carry__3_n_1,nl_if_acc_1_nl_carry__3_n_2,nl_if_acc_1_nl_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[19:16]),
        .O(NLW_nl_if_acc_1_nl_carry__3_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__3_i_1_n_0,nl_if_acc_1_nl_carry__3_i_2_n_0,nl_if_acc_1_nl_carry__3_i_3_n_0,nl_if_acc_1_nl_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__3_i_1
       (.I0(nl_res_sva_3[19]),
        .I1(p_buf_sva_1[19]),
        .O(nl_if_acc_1_nl_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__3_i_2
       (.I0(nl_res_sva_3[18]),
        .I1(p_buf_sva_1[18]),
        .O(nl_if_acc_1_nl_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__3_i_3
       (.I0(nl_res_sva_3[17]),
        .I1(p_buf_sva_1[17]),
        .O(nl_if_acc_1_nl_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__3_i_4
       (.I0(nl_res_sva_3[16]),
        .I1(p_buf_sva_1[16]),
        .O(nl_if_acc_1_nl_carry__3_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__4
       (.CI(nl_if_acc_1_nl_carry__3_n_0),
        .CO({nl_if_acc_1_nl_carry__4_n_0,nl_if_acc_1_nl_carry__4_n_1,nl_if_acc_1_nl_carry__4_n_2,nl_if_acc_1_nl_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[23:20]),
        .O(NLW_nl_if_acc_1_nl_carry__4_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__4_i_1_n_0,nl_if_acc_1_nl_carry__4_i_2_n_0,nl_if_acc_1_nl_carry__4_i_3_n_0,nl_if_acc_1_nl_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__4_i_1
       (.I0(nl_res_sva_3[23]),
        .I1(p_buf_sva_1[23]),
        .O(nl_if_acc_1_nl_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__4_i_2
       (.I0(nl_res_sva_3[22]),
        .I1(p_buf_sva_1[22]),
        .O(nl_if_acc_1_nl_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__4_i_3
       (.I0(nl_res_sva_3[21]),
        .I1(p_buf_sva_1[21]),
        .O(nl_if_acc_1_nl_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__4_i_4
       (.I0(nl_res_sva_3[20]),
        .I1(p_buf_sva_1[20]),
        .O(nl_if_acc_1_nl_carry__4_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__5
       (.CI(nl_if_acc_1_nl_carry__4_n_0),
        .CO({nl_if_acc_1_nl_carry__5_n_0,nl_if_acc_1_nl_carry__5_n_1,nl_if_acc_1_nl_carry__5_n_2,nl_if_acc_1_nl_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[27:24]),
        .O(NLW_nl_if_acc_1_nl_carry__5_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__5_i_1_n_0,nl_if_acc_1_nl_carry__5_i_2_n_0,nl_if_acc_1_nl_carry__5_i_3_n_0,nl_if_acc_1_nl_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__5_i_1
       (.I0(nl_res_sva_3[27]),
        .I1(p_buf_sva_1[27]),
        .O(nl_if_acc_1_nl_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__5_i_2
       (.I0(nl_res_sva_3[26]),
        .I1(p_buf_sva_1[26]),
        .O(nl_if_acc_1_nl_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__5_i_3
       (.I0(nl_res_sva_3[25]),
        .I1(p_buf_sva_1[25]),
        .O(nl_if_acc_1_nl_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__5_i_4
       (.I0(nl_res_sva_3[24]),
        .I1(p_buf_sva_1[24]),
        .O(nl_if_acc_1_nl_carry__5_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__6
       (.CI(nl_if_acc_1_nl_carry__5_n_0),
        .CO({nl_if_acc_1_nl_carry__6_n_0,nl_if_acc_1_nl_carry__6_n_1,nl_if_acc_1_nl_carry__6_n_2,nl_if_acc_1_nl_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI(nl_res_sva_3[31:28]),
        .O(NLW_nl_if_acc_1_nl_carry__6_O_UNCONNECTED[3:0]),
        .S({nl_if_acc_1_nl_carry__6_i_1_n_0,nl_if_acc_1_nl_carry__6_i_2_n_0,nl_if_acc_1_nl_carry__6_i_3_n_0,nl_if_acc_1_nl_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__6_i_1
       (.I0(nl_res_sva_3[31]),
        .I1(p_buf_sva_1[31]),
        .O(nl_if_acc_1_nl_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__6_i_2
       (.I0(nl_res_sva_3[30]),
        .I1(p_buf_sva_1[30]),
        .O(nl_if_acc_1_nl_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__6_i_3
       (.I0(nl_res_sva_3[29]),
        .I1(p_buf_sva_1[29]),
        .O(nl_if_acc_1_nl_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry__6_i_4
       (.I0(nl_res_sva_3[28]),
        .I1(p_buf_sva_1[28]),
        .O(nl_if_acc_1_nl_carry__6_i_4_n_0));
  CARRY4 nl_if_acc_1_nl_carry__7
       (.CI(nl_if_acc_1_nl_carry__6_n_0),
        .CO(NLW_nl_if_acc_1_nl_carry__7_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_nl_if_acc_1_nl_carry__7_O_UNCONNECTED[3:1],if_acc_1_nl}),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry_i_1
       (.I0(nl_res_sva_3[3]),
        .I1(p_buf_sva_1[3]),
        .O(nl_if_acc_1_nl_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry_i_2
       (.I0(nl_res_sva_3[2]),
        .I1(p_buf_sva_1[2]),
        .O(nl_if_acc_1_nl_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry_i_3
       (.I0(nl_res_sva_3[1]),
        .I1(p_buf_sva_1[1]),
        .O(nl_if_acc_1_nl_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_if_acc_1_nl_carry_i_4
       (.I0(nl_res_sva_3[0]),
        .I1(p_buf_sva_1[0]),
        .O(nl_if_acc_1_nl_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry
       (.CI(1'b0),
        .CO({nl_if_acc_nl_carry_n_0,nl_if_acc_nl_carry_n_1,nl_if_acc_nl_carry_n_2,nl_if_acc_nl_carry_n_3}),
        .CYINIT(nl_if_acc_nl_carry_i_1_n_0),
        .DI(res_sva_1[3:0]),
        .O(result[3:0]),
        .S({nl_if_acc_nl_carry_i_2_n_0,nl_if_acc_nl_carry_i_3_n_0,nl_if_acc_nl_carry_i_4_n_0,nl_if_acc_nl_carry_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__0
       (.CI(nl_if_acc_nl_carry_n_0),
        .CO({nl_if_acc_nl_carry__0_n_0,nl_if_acc_nl_carry__0_n_1,nl_if_acc_nl_carry__0_n_2,nl_if_acc_nl_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(res_sva_1[7:4]),
        .O(result[7:4]),
        .S({nl_if_acc_nl_carry__0_i_1_n_0,nl_if_acc_nl_carry__0_i_2_n_0,nl_if_acc_nl_carry__0_i_3_n_0,nl_if_acc_nl_carry__0_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__0_i_1
       (.I0(res_sva_1[7]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[7]),
        .O(nl_if_acc_nl_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__0_i_2
       (.I0(res_sva_1[6]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[6]),
        .O(nl_if_acc_nl_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__0_i_3
       (.I0(res_sva_1[5]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[5]),
        .O(nl_if_acc_nl_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__0_i_4
       (.I0(res_sva_1[4]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[4]),
        .O(nl_if_acc_nl_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__1
       (.CI(nl_if_acc_nl_carry__0_n_0),
        .CO({nl_if_acc_nl_carry__1_n_0,nl_if_acc_nl_carry__1_n_1,nl_if_acc_nl_carry__1_n_2,nl_if_acc_nl_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(res_sva_1[11:8]),
        .O(result[11:8]),
        .S({nl_if_acc_nl_carry__1_i_1_n_0,nl_if_acc_nl_carry__1_i_2_n_0,nl_if_acc_nl_carry__1_i_3_n_0,nl_if_acc_nl_carry__1_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__1_i_1
       (.I0(res_sva_1[11]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[11]),
        .O(nl_if_acc_nl_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__1_i_2
       (.I0(res_sva_1[10]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[10]),
        .O(nl_if_acc_nl_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__1_i_3
       (.I0(res_sva_1[9]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[9]),
        .O(nl_if_acc_nl_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__1_i_4
       (.I0(res_sva_1[8]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[8]),
        .O(nl_if_acc_nl_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__2
       (.CI(nl_if_acc_nl_carry__1_n_0),
        .CO({nl_if_acc_nl_carry__2_n_0,nl_if_acc_nl_carry__2_n_1,nl_if_acc_nl_carry__2_n_2,nl_if_acc_nl_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(res_sva_1[15:12]),
        .O(result[15:12]),
        .S({nl_if_acc_nl_carry__2_i_1_n_0,nl_if_acc_nl_carry__2_i_2_n_0,nl_if_acc_nl_carry__2_i_3_n_0,nl_if_acc_nl_carry__2_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__2_i_1
       (.I0(res_sva_1[15]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[15]),
        .O(nl_if_acc_nl_carry__2_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__2_i_2
       (.I0(res_sva_1[14]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[14]),
        .O(nl_if_acc_nl_carry__2_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__2_i_3
       (.I0(res_sva_1[13]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[13]),
        .O(nl_if_acc_nl_carry__2_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__2_i_4
       (.I0(res_sva_1[12]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[12]),
        .O(nl_if_acc_nl_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__3
       (.CI(nl_if_acc_nl_carry__2_n_0),
        .CO({nl_if_acc_nl_carry__3_n_0,nl_if_acc_nl_carry__3_n_1,nl_if_acc_nl_carry__3_n_2,nl_if_acc_nl_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(res_sva_1[19:16]),
        .O(result[19:16]),
        .S({nl_if_acc_nl_carry__3_i_1_n_0,nl_if_acc_nl_carry__3_i_2_n_0,nl_if_acc_nl_carry__3_i_3_n_0,nl_if_acc_nl_carry__3_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__3_i_1
       (.I0(res_sva_1[19]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[19]),
        .O(nl_if_acc_nl_carry__3_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__3_i_2
       (.I0(res_sva_1[18]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[18]),
        .O(nl_if_acc_nl_carry__3_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__3_i_3
       (.I0(res_sva_1[17]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[17]),
        .O(nl_if_acc_nl_carry__3_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__3_i_4
       (.I0(res_sva_1[16]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[16]),
        .O(nl_if_acc_nl_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__4
       (.CI(nl_if_acc_nl_carry__3_n_0),
        .CO({nl_if_acc_nl_carry__4_n_0,nl_if_acc_nl_carry__4_n_1,nl_if_acc_nl_carry__4_n_2,nl_if_acc_nl_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(res_sva_1[23:20]),
        .O(result[23:20]),
        .S({nl_if_acc_nl_carry__4_i_1_n_0,nl_if_acc_nl_carry__4_i_2_n_0,nl_if_acc_nl_carry__4_i_3_n_0,nl_if_acc_nl_carry__4_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__4_i_1
       (.I0(res_sva_1[23]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[23]),
        .O(nl_if_acc_nl_carry__4_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__4_i_2
       (.I0(res_sva_1[22]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[22]),
        .O(nl_if_acc_nl_carry__4_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__4_i_3
       (.I0(res_sva_1[21]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[21]),
        .O(nl_if_acc_nl_carry__4_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__4_i_4
       (.I0(res_sva_1[20]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[20]),
        .O(nl_if_acc_nl_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__5
       (.CI(nl_if_acc_nl_carry__4_n_0),
        .CO({nl_if_acc_nl_carry__5_n_0,nl_if_acc_nl_carry__5_n_1,nl_if_acc_nl_carry__5_n_2,nl_if_acc_nl_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(res_sva_1[27:24]),
        .O(result[27:24]),
        .S({nl_if_acc_nl_carry__5_i_1_n_0,nl_if_acc_nl_carry__5_i_2_n_0,nl_if_acc_nl_carry__5_i_3_n_0,nl_if_acc_nl_carry__5_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__5_i_1
       (.I0(res_sva_1[27]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[27]),
        .O(nl_if_acc_nl_carry__5_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__5_i_2
       (.I0(res_sva_1[26]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[26]),
        .O(nl_if_acc_nl_carry__5_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__5_i_3
       (.I0(res_sva_1[25]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[25]),
        .O(nl_if_acc_nl_carry__5_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__5_i_4
       (.I0(res_sva_1[24]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[24]),
        .O(nl_if_acc_nl_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_if_acc_nl_carry__6
       (.CI(nl_if_acc_nl_carry__5_n_0),
        .CO({NLW_nl_if_acc_nl_carry__6_CO_UNCONNECTED[3],nl_if_acc_nl_carry__6_n_1,nl_if_acc_nl_carry__6_n_2,nl_if_acc_nl_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,res_sva_1[30:28]}),
        .O(result[31:28]),
        .S({nl_if_acc_nl_carry__6_i_1_n_0,nl_if_acc_nl_carry__6_i_2_n_0,nl_if_acc_nl_carry__6_i_3_n_0,nl_if_acc_nl_carry__6_i_4_n_0}));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__6_i_1
       (.I0(res_sva_1[31]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[31]),
        .O(nl_if_acc_nl_carry__6_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__6_i_2
       (.I0(res_sva_1[30]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[30]),
        .O(nl_if_acc_nl_carry__6_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__6_i_3
       (.I0(res_sva_1[29]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[29]),
        .O(nl_if_acc_nl_carry__6_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry__6_i_4
       (.I0(res_sva_1[28]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[28]),
        .O(nl_if_acc_nl_carry__6_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    nl_if_acc_nl_carry_i_1
       (.I0(slc_32_svs_1),
        .O(nl_if_acc_nl_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry_i_2
       (.I0(res_sva_1[3]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[3]),
        .O(nl_if_acc_nl_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry_i_3
       (.I0(res_sva_1[2]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[2]),
        .O(nl_if_acc_nl_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry_i_4
       (.I0(res_sva_1[1]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[1]),
        .O(nl_if_acc_nl_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    nl_if_acc_nl_carry_i_5
       (.I0(res_sva_1[0]),
        .I1(slc_32_svs_1),
        .I2(p_buf_sva_2[0]),
        .O(nl_if_acc_nl_carry_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry
       (.CI(1'b0),
        .CO({nl_res_sva_3_carry_n_0,nl_res_sva_3_carry_n_1,nl_res_sva_3_carry_n_2,nl_res_sva_3_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\z_mul_itm_1_reg[3]__0_n_0 ,\z_mul_itm_1_reg[2]__0_n_0 ,\z_mul_itm_1_reg[1]__0_n_0 ,\z_mul_itm_1_reg[0]__0_n_0 }),
        .O(nl_res_sva_3[3:0]),
        .S({nl_res_sva_3_carry_i_1_n_0,nl_res_sva_3_carry_i_2_n_0,nl_res_sva_3_carry_i_3_n_0,nl_res_sva_3_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__0
       (.CI(nl_res_sva_3_carry_n_0),
        .CO({nl_res_sva_3_carry__0_n_0,nl_res_sva_3_carry__0_n_1,nl_res_sva_3_carry__0_n_2,nl_res_sva_3_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\z_mul_itm_1_reg[7]__0_n_0 ,\z_mul_itm_1_reg[6]__0_n_0 ,\z_mul_itm_1_reg[5]__0_n_0 ,\z_mul_itm_1_reg[4]__0_n_0 }),
        .O(nl_res_sva_3[7:4]),
        .S({nl_res_sva_3_carry__0_i_1_n_0,nl_res_sva_3_carry__0_i_2_n_0,nl_res_sva_3_carry__0_i_3_n_0,nl_res_sva_3_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__0_i_1
       (.I0(\z_mul_itm_1_reg[7]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_98),
        .O(nl_res_sva_3_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__0_i_2
       (.I0(\z_mul_itm_1_reg[6]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_99),
        .O(nl_res_sva_3_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__0_i_3
       (.I0(\z_mul_itm_1_reg[5]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_100),
        .O(nl_res_sva_3_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__0_i_4
       (.I0(\z_mul_itm_1_reg[4]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_101),
        .O(nl_res_sva_3_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__1
       (.CI(nl_res_sva_3_carry__0_n_0),
        .CO({nl_res_sva_3_carry__1_n_0,nl_res_sva_3_carry__1_n_1,nl_res_sva_3_carry__1_n_2,nl_res_sva_3_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({\z_mul_itm_1_reg[11]__0_n_0 ,\z_mul_itm_1_reg[10]__0_n_0 ,\z_mul_itm_1_reg[9]__0_n_0 ,\z_mul_itm_1_reg[8]__0_n_0 }),
        .O(nl_res_sva_3[11:8]),
        .S({nl_res_sva_3_carry__1_i_1_n_0,nl_res_sva_3_carry__1_i_2_n_0,nl_res_sva_3_carry__1_i_3_n_0,nl_res_sva_3_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__1_i_1
       (.I0(\z_mul_itm_1_reg[11]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_94),
        .O(nl_res_sva_3_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__1_i_2
       (.I0(\z_mul_itm_1_reg[10]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_95),
        .O(nl_res_sva_3_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__1_i_3
       (.I0(\z_mul_itm_1_reg[9]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_96),
        .O(nl_res_sva_3_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__1_i_4
       (.I0(\z_mul_itm_1_reg[8]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_97),
        .O(nl_res_sva_3_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__2
       (.CI(nl_res_sva_3_carry__1_n_0),
        .CO({nl_res_sva_3_carry__2_n_0,nl_res_sva_3_carry__2_n_1,nl_res_sva_3_carry__2_n_2,nl_res_sva_3_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({\z_mul_itm_1_reg[15]__0_n_0 ,\z_mul_itm_1_reg[14]__0_n_0 ,\z_mul_itm_1_reg[13]__0_n_0 ,\z_mul_itm_1_reg[12]__0_n_0 }),
        .O(nl_res_sva_3[15:12]),
        .S({nl_res_sva_3_carry__2_i_1_n_0,nl_res_sva_3_carry__2_i_2_n_0,nl_res_sva_3_carry__2_i_3_n_0,nl_res_sva_3_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__2_i_1
       (.I0(\z_mul_itm_1_reg[15]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_90),
        .O(nl_res_sva_3_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__2_i_2
       (.I0(\z_mul_itm_1_reg[14]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_91),
        .O(nl_res_sva_3_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__2_i_3
       (.I0(\z_mul_itm_1_reg[13]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_92),
        .O(nl_res_sva_3_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__2_i_4
       (.I0(\z_mul_itm_1_reg[12]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_93),
        .O(nl_res_sva_3_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__3
       (.CI(nl_res_sva_3_carry__2_n_0),
        .CO({nl_res_sva_3_carry__3_n_0,nl_res_sva_3_carry__3_n_1,nl_res_sva_3_carry__3_n_2,nl_res_sva_3_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(z_mul_itm_1_reg__0[19:16]),
        .O(nl_res_sva_3[19:16]),
        .S({nl_res_sva_3_carry__3_i_1_n_0,nl_res_sva_3_carry__3_i_2_n_0,nl_res_sva_3_carry__3_i_3_n_0,nl_res_sva_3_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__3_i_1
       (.I0(z_mul_itm_1_reg__0[19]),
        .I1(nl_z_mul_nl__2[19]),
        .O(nl_res_sva_3_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__3_i_2
       (.I0(z_mul_itm_1_reg__0[18]),
        .I1(nl_z_mul_nl__2[18]),
        .O(nl_res_sva_3_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__3_i_3
       (.I0(z_mul_itm_1_reg__0[17]),
        .I1(nl_z_mul_nl__2[17]),
        .O(nl_res_sva_3_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__3_i_4
       (.I0(z_mul_itm_1_reg__0[16]),
        .I1(nl_z_mul_nl__2[16]),
        .O(nl_res_sva_3_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__4
       (.CI(nl_res_sva_3_carry__3_n_0),
        .CO({nl_res_sva_3_carry__4_n_0,nl_res_sva_3_carry__4_n_1,nl_res_sva_3_carry__4_n_2,nl_res_sva_3_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(z_mul_itm_1_reg__0[23:20]),
        .O(nl_res_sva_3[23:20]),
        .S({nl_res_sva_3_carry__4_i_1_n_0,nl_res_sva_3_carry__4_i_2_n_0,nl_res_sva_3_carry__4_i_3_n_0,nl_res_sva_3_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__4_i_1
       (.I0(z_mul_itm_1_reg__0[23]),
        .I1(nl_z_mul_nl__2[23]),
        .O(nl_res_sva_3_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__4_i_2
       (.I0(z_mul_itm_1_reg__0[22]),
        .I1(nl_z_mul_nl__2[22]),
        .O(nl_res_sva_3_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__4_i_3
       (.I0(z_mul_itm_1_reg__0[21]),
        .I1(nl_z_mul_nl__2[21]),
        .O(nl_res_sva_3_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__4_i_4
       (.I0(z_mul_itm_1_reg__0[20]),
        .I1(nl_z_mul_nl__2[20]),
        .O(nl_res_sva_3_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__5
       (.CI(nl_res_sva_3_carry__4_n_0),
        .CO({nl_res_sva_3_carry__5_n_0,nl_res_sva_3_carry__5_n_1,nl_res_sva_3_carry__5_n_2,nl_res_sva_3_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(z_mul_itm_1_reg__0[27:24]),
        .O(nl_res_sva_3[27:24]),
        .S({nl_res_sva_3_carry__5_i_1_n_0,nl_res_sva_3_carry__5_i_2_n_0,nl_res_sva_3_carry__5_i_3_n_0,nl_res_sva_3_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__5_i_1
       (.I0(z_mul_itm_1_reg__0[27]),
        .I1(nl_z_mul_nl__2[27]),
        .O(nl_res_sva_3_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__5_i_2
       (.I0(z_mul_itm_1_reg__0[26]),
        .I1(nl_z_mul_nl__2[26]),
        .O(nl_res_sva_3_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__5_i_3
       (.I0(z_mul_itm_1_reg__0[25]),
        .I1(nl_z_mul_nl__2[25]),
        .O(nl_res_sva_3_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__5_i_4
       (.I0(z_mul_itm_1_reg__0[24]),
        .I1(nl_z_mul_nl__2[24]),
        .O(nl_res_sva_3_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_res_sva_3_carry__6
       (.CI(nl_res_sva_3_carry__5_n_0),
        .CO({NLW_nl_res_sva_3_carry__6_CO_UNCONNECTED[3],nl_res_sva_3_carry__6_n_1,nl_res_sva_3_carry__6_n_2,nl_res_sva_3_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,z_mul_itm_1_reg__0[30:28]}),
        .O(nl_res_sva_3[31:28]),
        .S({nl_res_sva_3_carry__6_i_1_n_0,nl_res_sva_3_carry__6_i_2_n_0,nl_res_sva_3_carry__6_i_3_n_0,nl_res_sva_3_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__6_i_1
       (.I0(z_mul_itm_1_reg__0[31]),
        .I1(nl_z_mul_nl__2[31]),
        .O(nl_res_sva_3_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__6_i_2
       (.I0(z_mul_itm_1_reg__0[30]),
        .I1(nl_z_mul_nl__2[30]),
        .O(nl_res_sva_3_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__6_i_3
       (.I0(z_mul_itm_1_reg__0[29]),
        .I1(nl_z_mul_nl__2[29]),
        .O(nl_res_sva_3_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry__6_i_4
       (.I0(z_mul_itm_1_reg__0[28]),
        .I1(nl_z_mul_nl__2[28]),
        .O(nl_res_sva_3_carry__6_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry_i_1
       (.I0(\z_mul_itm_1_reg[3]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_102),
        .O(nl_res_sva_3_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry_i_2
       (.I0(\z_mul_itm_1_reg[2]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_103),
        .O(nl_res_sva_3_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry_i_3
       (.I0(\z_mul_itm_1_reg[1]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_104),
        .O(nl_res_sva_3_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    nl_res_sva_3_carry_i_4
       (.I0(\z_mul_itm_1_reg[0]__0_n_0 ),
        .I1(nl_z_mul_nl__0_n_105),
        .O(nl_res_sva_3_carry_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_mul_itm_1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,nl_z_mul_itm_1__0_0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_nl_z_mul_itm_1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,out[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_mul_itm_1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_mul_itm_1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_mul_itm_1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(p_and_1_cse),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_mul_itm_1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_mul_itm_1_OVERFLOW_UNCONNECTED),
        .P({nl_z_mul_itm_1_n_58,nl_z_mul_itm_1_n_59,nl_z_mul_itm_1_n_60,nl_z_mul_itm_1_n_61,nl_z_mul_itm_1_n_62,nl_z_mul_itm_1_n_63,nl_z_mul_itm_1_n_64,nl_z_mul_itm_1_n_65,nl_z_mul_itm_1_n_66,nl_z_mul_itm_1_n_67,nl_z_mul_itm_1_n_68,nl_z_mul_itm_1_n_69,nl_z_mul_itm_1_n_70,nl_z_mul_itm_1_n_71,nl_z_mul_itm_1_n_72,nl_z_mul_itm_1_n_73,nl_z_mul_itm_1_n_74,nl_z_mul_itm_1_n_75,nl_z_mul_itm_1_n_76,nl_z_mul_itm_1_n_77,nl_z_mul_itm_1_n_78,nl_z_mul_itm_1_n_79,nl_z_mul_itm_1_n_80,nl_z_mul_itm_1_n_81,nl_z_mul_itm_1_n_82,nl_z_mul_itm_1_n_83,nl_z_mul_itm_1_n_84,nl_z_mul_itm_1_n_85,nl_z_mul_itm_1_n_86,nl_z_mul_itm_1_n_87,nl_z_mul_itm_1_n_88,nl_z_mul_itm_1_n_89,nl_z_mul_itm_1_n_90,nl_z_mul_itm_1_n_91,nl_z_mul_itm_1_n_92,nl_z_mul_itm_1_n_93,nl_z_mul_itm_1_n_94,nl_z_mul_itm_1_n_95,nl_z_mul_itm_1_n_96,nl_z_mul_itm_1_n_97,nl_z_mul_itm_1_n_98,nl_z_mul_itm_1_n_99,nl_z_mul_itm_1_n_100,nl_z_mul_itm_1_n_101,nl_z_mul_itm_1_n_102,nl_z_mul_itm_1_n_103,nl_z_mul_itm_1_n_104,nl_z_mul_itm_1_n_105}),
        .PATTERNBDETECT(NLW_nl_z_mul_itm_1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_mul_itm_1_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({nl_z_mul_itm_1_n_106,nl_z_mul_itm_1_n_107,nl_z_mul_itm_1_n_108,nl_z_mul_itm_1_n_109,nl_z_mul_itm_1_n_110,nl_z_mul_itm_1_n_111,nl_z_mul_itm_1_n_112,nl_z_mul_itm_1_n_113,nl_z_mul_itm_1_n_114,nl_z_mul_itm_1_n_115,nl_z_mul_itm_1_n_116,nl_z_mul_itm_1_n_117,nl_z_mul_itm_1_n_118,nl_z_mul_itm_1_n_119,nl_z_mul_itm_1_n_120,nl_z_mul_itm_1_n_121,nl_z_mul_itm_1_n_122,nl_z_mul_itm_1_n_123,nl_z_mul_itm_1_n_124,nl_z_mul_itm_1_n_125,nl_z_mul_itm_1_n_126,nl_z_mul_itm_1_n_127,nl_z_mul_itm_1_n_128,nl_z_mul_itm_1_n_129,nl_z_mul_itm_1_n_130,nl_z_mul_itm_1_n_131,nl_z_mul_itm_1_n_132,nl_z_mul_itm_1_n_133,nl_z_mul_itm_1_n_134,nl_z_mul_itm_1_n_135,nl_z_mul_itm_1_n_136,nl_z_mul_itm_1_n_137,nl_z_mul_itm_1_n_138,nl_z_mul_itm_1_n_139,nl_z_mul_itm_1_n_140,nl_z_mul_itm_1_n_141,nl_z_mul_itm_1_n_142,nl_z_mul_itm_1_n_143,nl_z_mul_itm_1_n_144,nl_z_mul_itm_1_n_145,nl_z_mul_itm_1_n_146,nl_z_mul_itm_1_n_147,nl_z_mul_itm_1_n_148,nl_z_mul_itm_1_n_149,nl_z_mul_itm_1_n_150,nl_z_mul_itm_1_n_151,nl_z_mul_itm_1_n_152,nl_z_mul_itm_1_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_mul_itm_1_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_mul_itm_1__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_nl_z_mul_itm_1__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,nl_z_mul_itm_1__0_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_mul_itm_1__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_mul_itm_1__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_mul_itm_1__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_mul_itm_1__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_mul_itm_1__0_OVERFLOW_UNCONNECTED),
        .P({nl_z_mul_itm_1__0_n_58,nl_z_mul_itm_1__0_n_59,nl_z_mul_itm_1__0_n_60,nl_z_mul_itm_1__0_n_61,nl_z_mul_itm_1__0_n_62,nl_z_mul_itm_1__0_n_63,nl_z_mul_itm_1__0_n_64,nl_z_mul_itm_1__0_n_65,nl_z_mul_itm_1__0_n_66,nl_z_mul_itm_1__0_n_67,nl_z_mul_itm_1__0_n_68,nl_z_mul_itm_1__0_n_69,nl_z_mul_itm_1__0_n_70,nl_z_mul_itm_1__0_n_71,nl_z_mul_itm_1__0_n_72,nl_z_mul_itm_1__0_n_73,nl_z_mul_itm_1__0_n_74,nl_z_mul_itm_1__0_n_75,nl_z_mul_itm_1__0_n_76,nl_z_mul_itm_1__0_n_77,nl_z_mul_itm_1__0_n_78,nl_z_mul_itm_1__0_n_79,nl_z_mul_itm_1__0_n_80,nl_z_mul_itm_1__0_n_81,nl_z_mul_itm_1__0_n_82,nl_z_mul_itm_1__0_n_83,nl_z_mul_itm_1__0_n_84,nl_z_mul_itm_1__0_n_85,nl_z_mul_itm_1__0_n_86,nl_z_mul_itm_1__0_n_87,nl_z_mul_itm_1__0_n_88,nl_z_mul_itm_1__0_n_89,nl_z_mul_itm_1__0_n_90,nl_z_mul_itm_1__0_n_91,nl_z_mul_itm_1__0_n_92,nl_z_mul_itm_1__0_n_93,nl_z_mul_itm_1__0_n_94,nl_z_mul_itm_1__0_n_95,nl_z_mul_itm_1__0_n_96,nl_z_mul_itm_1__0_n_97,nl_z_mul_itm_1__0_n_98,nl_z_mul_itm_1__0_n_99,nl_z_mul_itm_1__0_n_100,nl_z_mul_itm_1__0_n_101,nl_z_mul_itm_1__0_n_102,nl_z_mul_itm_1__0_n_103,nl_z_mul_itm_1__0_n_104,nl_z_mul_itm_1__0_n_105}),
        .PATTERNBDETECT(NLW_nl_z_mul_itm_1__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_mul_itm_1__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({nl_z_mul_itm_1__0_n_106,nl_z_mul_itm_1__0_n_107,nl_z_mul_itm_1__0_n_108,nl_z_mul_itm_1__0_n_109,nl_z_mul_itm_1__0_n_110,nl_z_mul_itm_1__0_n_111,nl_z_mul_itm_1__0_n_112,nl_z_mul_itm_1__0_n_113,nl_z_mul_itm_1__0_n_114,nl_z_mul_itm_1__0_n_115,nl_z_mul_itm_1__0_n_116,nl_z_mul_itm_1__0_n_117,nl_z_mul_itm_1__0_n_118,nl_z_mul_itm_1__0_n_119,nl_z_mul_itm_1__0_n_120,nl_z_mul_itm_1__0_n_121,nl_z_mul_itm_1__0_n_122,nl_z_mul_itm_1__0_n_123,nl_z_mul_itm_1__0_n_124,nl_z_mul_itm_1__0_n_125,nl_z_mul_itm_1__0_n_126,nl_z_mul_itm_1__0_n_127,nl_z_mul_itm_1__0_n_128,nl_z_mul_itm_1__0_n_129,nl_z_mul_itm_1__0_n_130,nl_z_mul_itm_1__0_n_131,nl_z_mul_itm_1__0_n_132,nl_z_mul_itm_1__0_n_133,nl_z_mul_itm_1__0_n_134,nl_z_mul_itm_1__0_n_135,nl_z_mul_itm_1__0_n_136,nl_z_mul_itm_1__0_n_137,nl_z_mul_itm_1__0_n_138,nl_z_mul_itm_1__0_n_139,nl_z_mul_itm_1__0_n_140,nl_z_mul_itm_1__0_n_141,nl_z_mul_itm_1__0_n_142,nl_z_mul_itm_1__0_n_143,nl_z_mul_itm_1__0_n_144,nl_z_mul_itm_1__0_n_145,nl_z_mul_itm_1__0_n_146,nl_z_mul_itm_1__0_n_147,nl_z_mul_itm_1__0_n_148,nl_z_mul_itm_1__0_n_149,nl_z_mul_itm_1__0_n_150,nl_z_mul_itm_1__0_n_151,nl_z_mul_itm_1__0_n_152,nl_z_mul_itm_1__0_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_mul_itm_1__0_UNDERFLOW_UNCONNECTED));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_itm_1_carry
       (.CI(1'b0),
        .CO({nl_z_mul_itm_1_carry_n_0,nl_z_mul_itm_1_carry_n_1,nl_z_mul_itm_1_carry_n_2,nl_z_mul_itm_1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({z_mul_itm_1_reg_n_103,z_mul_itm_1_reg_n_104,z_mul_itm_1_reg_n_105,1'b0}),
        .O(z_mul_itm_1_reg__0[19:16]),
        .S({nl_z_mul_itm_1_carry_i_1_n_0,nl_z_mul_itm_1_carry_i_2_n_0,nl_z_mul_itm_1_carry_i_3_n_0,\z_mul_itm_1_reg[16]__0_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_itm_1_carry__0
       (.CI(nl_z_mul_itm_1_carry_n_0),
        .CO({nl_z_mul_itm_1_carry__0_n_0,nl_z_mul_itm_1_carry__0_n_1,nl_z_mul_itm_1_carry__0_n_2,nl_z_mul_itm_1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({z_mul_itm_1_reg_n_99,z_mul_itm_1_reg_n_100,z_mul_itm_1_reg_n_101,z_mul_itm_1_reg_n_102}),
        .O(z_mul_itm_1_reg__0[23:20]),
        .S({nl_z_mul_itm_1_carry__0_i_1_n_0,nl_z_mul_itm_1_carry__0_i_2_n_0,nl_z_mul_itm_1_carry__0_i_3_n_0,nl_z_mul_itm_1_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__0_i_1
       (.I0(z_mul_itm_1_reg_n_99),
        .I1(nl_z_mul_itm_1_n_99),
        .O(nl_z_mul_itm_1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__0_i_2
       (.I0(z_mul_itm_1_reg_n_100),
        .I1(nl_z_mul_itm_1_n_100),
        .O(nl_z_mul_itm_1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__0_i_3
       (.I0(z_mul_itm_1_reg_n_101),
        .I1(nl_z_mul_itm_1_n_101),
        .O(nl_z_mul_itm_1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__0_i_4
       (.I0(z_mul_itm_1_reg_n_102),
        .I1(nl_z_mul_itm_1_n_102),
        .O(nl_z_mul_itm_1_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_itm_1_carry__1
       (.CI(nl_z_mul_itm_1_carry__0_n_0),
        .CO({nl_z_mul_itm_1_carry__1_n_0,nl_z_mul_itm_1_carry__1_n_1,nl_z_mul_itm_1_carry__1_n_2,nl_z_mul_itm_1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({z_mul_itm_1_reg_n_95,z_mul_itm_1_reg_n_96,z_mul_itm_1_reg_n_97,z_mul_itm_1_reg_n_98}),
        .O(z_mul_itm_1_reg__0[27:24]),
        .S({nl_z_mul_itm_1_carry__1_i_1_n_0,nl_z_mul_itm_1_carry__1_i_2_n_0,nl_z_mul_itm_1_carry__1_i_3_n_0,nl_z_mul_itm_1_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__1_i_1
       (.I0(z_mul_itm_1_reg_n_95),
        .I1(nl_z_mul_itm_1_n_95),
        .O(nl_z_mul_itm_1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__1_i_2
       (.I0(z_mul_itm_1_reg_n_96),
        .I1(nl_z_mul_itm_1_n_96),
        .O(nl_z_mul_itm_1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__1_i_3
       (.I0(z_mul_itm_1_reg_n_97),
        .I1(nl_z_mul_itm_1_n_97),
        .O(nl_z_mul_itm_1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__1_i_4
       (.I0(z_mul_itm_1_reg_n_98),
        .I1(nl_z_mul_itm_1_n_98),
        .O(nl_z_mul_itm_1_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_itm_1_carry__2
       (.CI(nl_z_mul_itm_1_carry__1_n_0),
        .CO({NLW_nl_z_mul_itm_1_carry__2_CO_UNCONNECTED[3],nl_z_mul_itm_1_carry__2_n_1,nl_z_mul_itm_1_carry__2_n_2,nl_z_mul_itm_1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,z_mul_itm_1_reg_n_92,z_mul_itm_1_reg_n_93,z_mul_itm_1_reg_n_94}),
        .O(z_mul_itm_1_reg__0[31:28]),
        .S({nl_z_mul_itm_1_carry__2_i_1_n_0,nl_z_mul_itm_1_carry__2_i_2_n_0,nl_z_mul_itm_1_carry__2_i_3_n_0,nl_z_mul_itm_1_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__2_i_1
       (.I0(z_mul_itm_1_reg_n_91),
        .I1(nl_z_mul_itm_1_n_91),
        .O(nl_z_mul_itm_1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__2_i_2
       (.I0(z_mul_itm_1_reg_n_92),
        .I1(nl_z_mul_itm_1_n_92),
        .O(nl_z_mul_itm_1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__2_i_3
       (.I0(z_mul_itm_1_reg_n_93),
        .I1(nl_z_mul_itm_1_n_93),
        .O(nl_z_mul_itm_1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry__2_i_4
       (.I0(z_mul_itm_1_reg_n_94),
        .I1(nl_z_mul_itm_1_n_94),
        .O(nl_z_mul_itm_1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry_i_1
       (.I0(z_mul_itm_1_reg_n_103),
        .I1(nl_z_mul_itm_1_n_103),
        .O(nl_z_mul_itm_1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry_i_2
       (.I0(z_mul_itm_1_reg_n_104),
        .I1(nl_z_mul_itm_1_n_104),
        .O(nl_z_mul_itm_1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_itm_1_carry_i_3
       (.I0(z_mul_itm_1_reg_n_105),
        .I1(nl_z_mul_itm_1_n_105),
        .O(nl_z_mul_itm_1_carry_i_3_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_mul_nl
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,p_rsc_dat[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_nl_z_mul_nl_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,readslicef_64_32_32_return[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_mul_nl_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_mul_nl_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_mul_nl_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(p_sva0),
        .CEA2(p_and_1_cse),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(p_and_1_cse),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_mul_nl_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_mul_nl_OVERFLOW_UNCONNECTED),
        .P({nl_z_mul_nl_n_58,nl_z_mul_nl_n_59,nl_z_mul_nl_n_60,nl_z_mul_nl_n_61,nl_z_mul_nl_n_62,nl_z_mul_nl_n_63,nl_z_mul_nl_n_64,nl_z_mul_nl_n_65,nl_z_mul_nl_n_66,nl_z_mul_nl_n_67,nl_z_mul_nl_n_68,nl_z_mul_nl_n_69,nl_z_mul_nl_n_70,nl_z_mul_nl_n_71,nl_z_mul_nl_n_72,nl_z_mul_nl_n_73,nl_z_mul_nl_n_74,nl_z_mul_nl_n_75,nl_z_mul_nl_n_76,nl_z_mul_nl_n_77,nl_z_mul_nl_n_78,nl_z_mul_nl_n_79,nl_z_mul_nl_n_80,nl_z_mul_nl_n_81,nl_z_mul_nl_n_82,nl_z_mul_nl_n_83,nl_z_mul_nl_n_84,nl_z_mul_nl_n_85,nl_z_mul_nl_n_86,nl_z_mul_nl_n_87,nl_z_mul_nl_n_88,nl_z_mul_nl_n_89,nl_z_mul_nl_n_90,nl_z_mul_nl_n_91,nl_z_mul_nl_n_92,nl_z_mul_nl_n_93,nl_z_mul_nl_n_94,nl_z_mul_nl_n_95,nl_z_mul_nl_n_96,nl_z_mul_nl_n_97,nl_z_mul_nl_n_98,nl_z_mul_nl_n_99,nl_z_mul_nl_n_100,nl_z_mul_nl_n_101,nl_z_mul_nl_n_102,nl_z_mul_nl_n_103,nl_z_mul_nl_n_104,nl_z_mul_nl_n_105}),
        .PATTERNBDETECT(NLW_nl_z_mul_nl_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_mul_nl_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({nl_z_mul_nl_n_106,nl_z_mul_nl_n_107,nl_z_mul_nl_n_108,nl_z_mul_nl_n_109,nl_z_mul_nl_n_110,nl_z_mul_nl_n_111,nl_z_mul_nl_n_112,nl_z_mul_nl_n_113,nl_z_mul_nl_n_114,nl_z_mul_nl_n_115,nl_z_mul_nl_n_116,nl_z_mul_nl_n_117,nl_z_mul_nl_n_118,nl_z_mul_nl_n_119,nl_z_mul_nl_n_120,nl_z_mul_nl_n_121,nl_z_mul_nl_n_122,nl_z_mul_nl_n_123,nl_z_mul_nl_n_124,nl_z_mul_nl_n_125,nl_z_mul_nl_n_126,nl_z_mul_nl_n_127,nl_z_mul_nl_n_128,nl_z_mul_nl_n_129,nl_z_mul_nl_n_130,nl_z_mul_nl_n_131,nl_z_mul_nl_n_132,nl_z_mul_nl_n_133,nl_z_mul_nl_n_134,nl_z_mul_nl_n_135,nl_z_mul_nl_n_136,nl_z_mul_nl_n_137,nl_z_mul_nl_n_138,nl_z_mul_nl_n_139,nl_z_mul_nl_n_140,nl_z_mul_nl_n_141,nl_z_mul_nl_n_142,nl_z_mul_nl_n_143,nl_z_mul_nl_n_144,nl_z_mul_nl_n_145,nl_z_mul_nl_n_146,nl_z_mul_nl_n_147,nl_z_mul_nl_n_148,nl_z_mul_nl_n_149,nl_z_mul_nl_n_150,nl_z_mul_nl_n_151,nl_z_mul_nl_n_152,nl_z_mul_nl_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_mul_nl_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_mul_nl__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,readslicef_64_32_32_return[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT({nl_z_mul_nl__0_n_24,nl_z_mul_nl__0_n_25,nl_z_mul_nl__0_n_26,nl_z_mul_nl__0_n_27,nl_z_mul_nl__0_n_28,nl_z_mul_nl__0_n_29,nl_z_mul_nl__0_n_30,nl_z_mul_nl__0_n_31,nl_z_mul_nl__0_n_32,nl_z_mul_nl__0_n_33,nl_z_mul_nl__0_n_34,nl_z_mul_nl__0_n_35,nl_z_mul_nl__0_n_36,nl_z_mul_nl__0_n_37,nl_z_mul_nl__0_n_38,nl_z_mul_nl__0_n_39,nl_z_mul_nl__0_n_40,nl_z_mul_nl__0_n_41,nl_z_mul_nl__0_n_42,nl_z_mul_nl__0_n_43,nl_z_mul_nl__0_n_44,nl_z_mul_nl__0_n_45,nl_z_mul_nl__0_n_46,nl_z_mul_nl__0_n_47,nl_z_mul_nl__0_n_48,nl_z_mul_nl__0_n_49,nl_z_mul_nl__0_n_50,nl_z_mul_nl__0_n_51,nl_z_mul_nl__0_n_52,nl_z_mul_nl__0_n_53}),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,p_rsc_dat[16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_mul_nl__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_mul_nl__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_mul_nl__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(p_and_1_cse),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(p_sva0),
        .CEB2(p_and_1_cse),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_mul_nl__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_mul_nl__0_OVERFLOW_UNCONNECTED),
        .P({nl_z_mul_nl__0_n_58,nl_z_mul_nl__0_n_59,nl_z_mul_nl__0_n_60,nl_z_mul_nl__0_n_61,nl_z_mul_nl__0_n_62,nl_z_mul_nl__0_n_63,nl_z_mul_nl__0_n_64,nl_z_mul_nl__0_n_65,nl_z_mul_nl__0_n_66,nl_z_mul_nl__0_n_67,nl_z_mul_nl__0_n_68,nl_z_mul_nl__0_n_69,nl_z_mul_nl__0_n_70,nl_z_mul_nl__0_n_71,nl_z_mul_nl__0_n_72,nl_z_mul_nl__0_n_73,nl_z_mul_nl__0_n_74,nl_z_mul_nl__0_n_75,nl_z_mul_nl__0_n_76,nl_z_mul_nl__0_n_77,nl_z_mul_nl__0_n_78,nl_z_mul_nl__0_n_79,nl_z_mul_nl__0_n_80,nl_z_mul_nl__0_n_81,nl_z_mul_nl__0_n_82,nl_z_mul_nl__0_n_83,nl_z_mul_nl__0_n_84,nl_z_mul_nl__0_n_85,nl_z_mul_nl__0_n_86,nl_z_mul_nl__0_n_87,nl_z_mul_nl__0_n_88,nl_z_mul_nl__0_n_89,nl_z_mul_nl__0_n_90,nl_z_mul_nl__0_n_91,nl_z_mul_nl__0_n_92,nl_z_mul_nl__0_n_93,nl_z_mul_nl__0_n_94,nl_z_mul_nl__0_n_95,nl_z_mul_nl__0_n_96,nl_z_mul_nl__0_n_97,nl_z_mul_nl__0_n_98,nl_z_mul_nl__0_n_99,nl_z_mul_nl__0_n_100,nl_z_mul_nl__0_n_101,nl_z_mul_nl__0_n_102,nl_z_mul_nl__0_n_103,nl_z_mul_nl__0_n_104,nl_z_mul_nl__0_n_105}),
        .PATTERNBDETECT(NLW_nl_z_mul_nl__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_mul_nl__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({nl_z_mul_nl__0_n_106,nl_z_mul_nl__0_n_107,nl_z_mul_nl__0_n_108,nl_z_mul_nl__0_n_109,nl_z_mul_nl__0_n_110,nl_z_mul_nl__0_n_111,nl_z_mul_nl__0_n_112,nl_z_mul_nl__0_n_113,nl_z_mul_nl__0_n_114,nl_z_mul_nl__0_n_115,nl_z_mul_nl__0_n_116,nl_z_mul_nl__0_n_117,nl_z_mul_nl__0_n_118,nl_z_mul_nl__0_n_119,nl_z_mul_nl__0_n_120,nl_z_mul_nl__0_n_121,nl_z_mul_nl__0_n_122,nl_z_mul_nl__0_n_123,nl_z_mul_nl__0_n_124,nl_z_mul_nl__0_n_125,nl_z_mul_nl__0_n_126,nl_z_mul_nl__0_n_127,nl_z_mul_nl__0_n_128,nl_z_mul_nl__0_n_129,nl_z_mul_nl__0_n_130,nl_z_mul_nl__0_n_131,nl_z_mul_nl__0_n_132,nl_z_mul_nl__0_n_133,nl_z_mul_nl__0_n_134,nl_z_mul_nl__0_n_135,nl_z_mul_nl__0_n_136,nl_z_mul_nl__0_n_137,nl_z_mul_nl__0_n_138,nl_z_mul_nl__0_n_139,nl_z_mul_nl__0_n_140,nl_z_mul_nl__0_n_141,nl_z_mul_nl__0_n_142,nl_z_mul_nl__0_n_143,nl_z_mul_nl__0_n_144,nl_z_mul_nl__0_n_145,nl_z_mul_nl__0_n_146,nl_z_mul_nl__0_n_147,nl_z_mul_nl__0_n_148,nl_z_mul_nl__0_n_149,nl_z_mul_nl__0_n_150,nl_z_mul_nl__0_n_151,nl_z_mul_nl__0_n_152,nl_z_mul_nl__0_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_mul_nl__0_UNDERFLOW_UNCONNECTED));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_1
       (.CI(nl_z_mul_nl__0_i_2_n_0),
        .CO({nl_z_mul_nl__0_i_1_n_0,nl_z_mul_nl__0_i_1_n_1,nl_z_mul_nl__0_i_1_n_2,nl_z_mul_nl__0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_75,vector__2_n_76,vector__2_n_77,vector__2_n_78}),
        .O(readslicef_64_32_32_return[15:12]),
        .S({nl_z_mul_nl__0_i_5_n_0,nl_z_mul_nl__0_i_6_n_0,nl_z_mul_nl__0_i_7_n_0,nl_z_mul_nl__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_10
       (.I0(vector__2_n_80),
        .I1(vector__0_n_97),
        .O(nl_z_mul_nl__0_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_11
       (.I0(vector__2_n_81),
        .I1(vector__0_n_98),
        .O(nl_z_mul_nl__0_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_12
       (.I0(vector__2_n_82),
        .I1(vector__0_n_99),
        .O(nl_z_mul_nl__0_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_13
       (.I0(vector__2_n_83),
        .I1(vector__0_n_100),
        .O(nl_z_mul_nl__0_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_14
       (.I0(vector__2_n_84),
        .I1(vector__0_n_101),
        .O(nl_z_mul_nl__0_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_15
       (.I0(vector__2_n_85),
        .I1(vector__0_n_102),
        .O(nl_z_mul_nl__0_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_16
       (.I0(vector__2_n_86),
        .I1(vector__0_n_103),
        .O(nl_z_mul_nl__0_i_16_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_17
       (.CI(nl_z_mul_nl__0_i_22_n_0),
        .CO({nl_z_mul_nl__0_i_17_n_0,nl_z_mul_nl__0_i_17_n_1,nl_z_mul_nl__0_i_17_n_2,nl_z_mul_nl__0_i_17_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_91,vector__2_n_92,vector__2_n_93,vector__2_n_94}),
        .O(NLW_nl_z_mul_nl__0_i_17_O_UNCONNECTED[3:0]),
        .S({nl_z_mul_nl__0_i_23_n_0,nl_z_mul_nl__0_i_24_n_0,nl_z_mul_nl__0_i_25_n_0,nl_z_mul_nl__0_i_26_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_18
       (.I0(vector__2_n_87),
        .I1(vector__0_n_104),
        .O(nl_z_mul_nl__0_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_19
       (.I0(vector__2_n_88),
        .I1(vector__0_n_105),
        .O(nl_z_mul_nl__0_i_19_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_2
       (.CI(nl_z_mul_nl__0_i_3_n_0),
        .CO({nl_z_mul_nl__0_i_2_n_0,nl_z_mul_nl__0_i_2_n_1,nl_z_mul_nl__0_i_2_n_2,nl_z_mul_nl__0_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_79,vector__2_n_80,vector__2_n_81,vector__2_n_82}),
        .O(readslicef_64_32_32_return[11:8]),
        .S({nl_z_mul_nl__0_i_9_n_0,nl_z_mul_nl__0_i_10_n_0,nl_z_mul_nl__0_i_11_n_0,nl_z_mul_nl__0_i_12_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_20
       (.I0(vector__2_n_89),
        .I1(vector_n_89),
        .O(nl_z_mul_nl__0_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_21
       (.I0(vector__2_n_90),
        .I1(vector_n_90),
        .O(nl_z_mul_nl__0_i_21_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_22
       (.CI(nl_z_mul_nl__0_i_27_n_0),
        .CO({nl_z_mul_nl__0_i_22_n_0,nl_z_mul_nl__0_i_22_n_1,nl_z_mul_nl__0_i_22_n_2,nl_z_mul_nl__0_i_22_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_95,vector__2_n_96,vector__2_n_97,vector__2_n_98}),
        .O(NLW_nl_z_mul_nl__0_i_22_O_UNCONNECTED[3:0]),
        .S({nl_z_mul_nl__0_i_28_n_0,nl_z_mul_nl__0_i_29_n_0,nl_z_mul_nl__0_i_30_n_0,nl_z_mul_nl__0_i_31_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_23
       (.I0(vector__2_n_91),
        .I1(vector_n_91),
        .O(nl_z_mul_nl__0_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_24
       (.I0(vector__2_n_92),
        .I1(vector_n_92),
        .O(nl_z_mul_nl__0_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_25
       (.I0(vector__2_n_93),
        .I1(vector_n_93),
        .O(nl_z_mul_nl__0_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_26
       (.I0(vector__2_n_94),
        .I1(vector_n_94),
        .O(nl_z_mul_nl__0_i_26_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_27
       (.CI(nl_z_mul_nl__0_i_32_n_0),
        .CO({nl_z_mul_nl__0_i_27_n_0,nl_z_mul_nl__0_i_27_n_1,nl_z_mul_nl__0_i_27_n_2,nl_z_mul_nl__0_i_27_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_99,vector__2_n_100,vector__2_n_101,vector__2_n_102}),
        .O(NLW_nl_z_mul_nl__0_i_27_O_UNCONNECTED[3:0]),
        .S({nl_z_mul_nl__0_i_33_n_0,nl_z_mul_nl__0_i_34_n_0,nl_z_mul_nl__0_i_35_n_0,nl_z_mul_nl__0_i_36_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_28
       (.I0(vector__2_n_95),
        .I1(vector_n_95),
        .O(nl_z_mul_nl__0_i_28_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_29
       (.I0(vector__2_n_96),
        .I1(vector_n_96),
        .O(nl_z_mul_nl__0_i_29_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_3
       (.CI(nl_z_mul_nl__0_i_4_n_0),
        .CO({nl_z_mul_nl__0_i_3_n_0,nl_z_mul_nl__0_i_3_n_1,nl_z_mul_nl__0_i_3_n_2,nl_z_mul_nl__0_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_83,vector__2_n_84,vector__2_n_85,vector__2_n_86}),
        .O(readslicef_64_32_32_return[7:4]),
        .S({nl_z_mul_nl__0_i_13_n_0,nl_z_mul_nl__0_i_14_n_0,nl_z_mul_nl__0_i_15_n_0,nl_z_mul_nl__0_i_16_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_30
       (.I0(vector__2_n_97),
        .I1(vector_n_97),
        .O(nl_z_mul_nl__0_i_30_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_31
       (.I0(vector__2_n_98),
        .I1(vector_n_98),
        .O(nl_z_mul_nl__0_i_31_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_32
       (.CI(1'b0),
        .CO({nl_z_mul_nl__0_i_32_n_0,nl_z_mul_nl__0_i_32_n_1,nl_z_mul_nl__0_i_32_n_2,nl_z_mul_nl__0_i_32_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_103,vector__2_n_104,vector__2_n_105,1'b0}),
        .O(NLW_nl_z_mul_nl__0_i_32_O_UNCONNECTED[3:0]),
        .S({nl_z_mul_nl__0_i_37_n_0,nl_z_mul_nl__0_i_38_n_0,nl_z_mul_nl__0_i_39_n_0,vector__1_n_89}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_33
       (.I0(vector__2_n_99),
        .I1(vector_n_99),
        .O(nl_z_mul_nl__0_i_33_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_34
       (.I0(vector__2_n_100),
        .I1(vector_n_100),
        .O(nl_z_mul_nl__0_i_34_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_35
       (.I0(vector__2_n_101),
        .I1(vector_n_101),
        .O(nl_z_mul_nl__0_i_35_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_36
       (.I0(vector__2_n_102),
        .I1(vector_n_102),
        .O(nl_z_mul_nl__0_i_36_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_37
       (.I0(vector__2_n_103),
        .I1(vector_n_103),
        .O(nl_z_mul_nl__0_i_37_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_38
       (.I0(vector__2_n_104),
        .I1(vector_n_104),
        .O(nl_z_mul_nl__0_i_38_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_39
       (.I0(vector__2_n_105),
        .I1(vector_n_105),
        .O(nl_z_mul_nl__0_i_39_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl__0_i_4
       (.CI(nl_z_mul_nl__0_i_17_n_0),
        .CO({nl_z_mul_nl__0_i_4_n_0,nl_z_mul_nl__0_i_4_n_1,nl_z_mul_nl__0_i_4_n_2,nl_z_mul_nl__0_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_87,vector__2_n_88,vector__2_n_89,vector__2_n_90}),
        .O(readslicef_64_32_32_return[3:0]),
        .S({nl_z_mul_nl__0_i_18_n_0,nl_z_mul_nl__0_i_19_n_0,nl_z_mul_nl__0_i_20_n_0,nl_z_mul_nl__0_i_21_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_5
       (.I0(vector__2_n_75),
        .I1(vector__0_n_92),
        .O(nl_z_mul_nl__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_6
       (.I0(vector__2_n_76),
        .I1(vector__0_n_93),
        .O(nl_z_mul_nl__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_7
       (.I0(vector__2_n_77),
        .I1(vector__0_n_94),
        .O(nl_z_mul_nl__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_8
       (.I0(vector__2_n_78),
        .I1(vector__0_n_95),
        .O(nl_z_mul_nl__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl__0_i_9
       (.I0(vector__2_n_79),
        .I1(vector__0_n_96),
        .O(nl_z_mul_nl__0_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    nl_z_mul_nl__1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({nl_z_mul_nl__0_n_24,nl_z_mul_nl__0_n_25,nl_z_mul_nl__0_n_26,nl_z_mul_nl__0_n_27,nl_z_mul_nl__0_n_28,nl_z_mul_nl__0_n_29,nl_z_mul_nl__0_n_30,nl_z_mul_nl__0_n_31,nl_z_mul_nl__0_n_32,nl_z_mul_nl__0_n_33,nl_z_mul_nl__0_n_34,nl_z_mul_nl__0_n_35,nl_z_mul_nl__0_n_36,nl_z_mul_nl__0_n_37,nl_z_mul_nl__0_n_38,nl_z_mul_nl__0_n_39,nl_z_mul_nl__0_n_40,nl_z_mul_nl__0_n_41,nl_z_mul_nl__0_n_42,nl_z_mul_nl__0_n_43,nl_z_mul_nl__0_n_44,nl_z_mul_nl__0_n_45,nl_z_mul_nl__0_n_46,nl_z_mul_nl__0_n_47,nl_z_mul_nl__0_n_48,nl_z_mul_nl__0_n_49,nl_z_mul_nl__0_n_50,nl_z_mul_nl__0_n_51,nl_z_mul_nl__0_n_52,nl_z_mul_nl__0_n_53}),
        .ACOUT(NLW_nl_z_mul_nl__1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,p_rsc_dat[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_nl_z_mul_nl__1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_nl_z_mul_nl__1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_nl_z_mul_nl__1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(p_sva0),
        .CEB2(p_and_1_cse),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_nl_z_mul_nl__1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_nl_z_mul_nl__1_OVERFLOW_UNCONNECTED),
        .P({nl_z_mul_nl__1_n_58,nl_z_mul_nl__1_n_59,nl_z_mul_nl__1_n_60,nl_z_mul_nl__1_n_61,nl_z_mul_nl__1_n_62,nl_z_mul_nl__1_n_63,nl_z_mul_nl__1_n_64,nl_z_mul_nl__1_n_65,nl_z_mul_nl__1_n_66,nl_z_mul_nl__1_n_67,nl_z_mul_nl__1_n_68,nl_z_mul_nl__1_n_69,nl_z_mul_nl__1_n_70,nl_z_mul_nl__1_n_71,nl_z_mul_nl__1_n_72,nl_z_mul_nl__1_n_73,nl_z_mul_nl__1_n_74,nl_z_mul_nl__1_n_75,nl_z_mul_nl__1_n_76,nl_z_mul_nl__1_n_77,nl_z_mul_nl__1_n_78,nl_z_mul_nl__1_n_79,nl_z_mul_nl__1_n_80,nl_z_mul_nl__1_n_81,nl_z_mul_nl__1_n_82,nl_z_mul_nl__1_n_83,nl_z_mul_nl__1_n_84,nl_z_mul_nl__1_n_85,nl_z_mul_nl__1_n_86,nl_z_mul_nl__1_n_87,nl_z_mul_nl__1_n_88,nl_z_mul_nl__1_n_89,nl_z_mul_nl__1_n_90,nl_z_mul_nl__1_n_91,nl_z_mul_nl__1_n_92,nl_z_mul_nl__1_n_93,nl_z_mul_nl__1_n_94,nl_z_mul_nl__1_n_95,nl_z_mul_nl__1_n_96,nl_z_mul_nl__1_n_97,nl_z_mul_nl__1_n_98,nl_z_mul_nl__1_n_99,nl_z_mul_nl__1_n_100,nl_z_mul_nl__1_n_101,nl_z_mul_nl__1_n_102,nl_z_mul_nl__1_n_103,nl_z_mul_nl__1_n_104,nl_z_mul_nl__1_n_105}),
        .PATTERNBDETECT(NLW_nl_z_mul_nl__1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_nl_z_mul_nl__1_PATTERNDETECT_UNCONNECTED),
        .PCIN({nl_z_mul_nl__0_n_106,nl_z_mul_nl__0_n_107,nl_z_mul_nl__0_n_108,nl_z_mul_nl__0_n_109,nl_z_mul_nl__0_n_110,nl_z_mul_nl__0_n_111,nl_z_mul_nl__0_n_112,nl_z_mul_nl__0_n_113,nl_z_mul_nl__0_n_114,nl_z_mul_nl__0_n_115,nl_z_mul_nl__0_n_116,nl_z_mul_nl__0_n_117,nl_z_mul_nl__0_n_118,nl_z_mul_nl__0_n_119,nl_z_mul_nl__0_n_120,nl_z_mul_nl__0_n_121,nl_z_mul_nl__0_n_122,nl_z_mul_nl__0_n_123,nl_z_mul_nl__0_n_124,nl_z_mul_nl__0_n_125,nl_z_mul_nl__0_n_126,nl_z_mul_nl__0_n_127,nl_z_mul_nl__0_n_128,nl_z_mul_nl__0_n_129,nl_z_mul_nl__0_n_130,nl_z_mul_nl__0_n_131,nl_z_mul_nl__0_n_132,nl_z_mul_nl__0_n_133,nl_z_mul_nl__0_n_134,nl_z_mul_nl__0_n_135,nl_z_mul_nl__0_n_136,nl_z_mul_nl__0_n_137,nl_z_mul_nl__0_n_138,nl_z_mul_nl__0_n_139,nl_z_mul_nl__0_n_140,nl_z_mul_nl__0_n_141,nl_z_mul_nl__0_n_142,nl_z_mul_nl__0_n_143,nl_z_mul_nl__0_n_144,nl_z_mul_nl__0_n_145,nl_z_mul_nl__0_n_146,nl_z_mul_nl__0_n_147,nl_z_mul_nl__0_n_148,nl_z_mul_nl__0_n_149,nl_z_mul_nl__0_n_150,nl_z_mul_nl__0_n_151,nl_z_mul_nl__0_n_152,nl_z_mul_nl__0_n_153}),
        .PCOUT(NLW_nl_z_mul_nl__1_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_nl_z_mul_nl__1_UNDERFLOW_UNCONNECTED));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_carry
       (.CI(1'b0),
        .CO({nl_z_mul_nl_carry_n_0,nl_z_mul_nl_carry_n_1,nl_z_mul_nl_carry_n_2,nl_z_mul_nl_carry_n_3}),
        .CYINIT(1'b0),
        .DI({nl_z_mul_nl__1_n_103,nl_z_mul_nl__1_n_104,nl_z_mul_nl__1_n_105,1'b0}),
        .O(nl_z_mul_nl__2[19:16]),
        .S({nl_z_mul_nl_carry_i_1_n_0,nl_z_mul_nl_carry_i_2_n_0,nl_z_mul_nl_carry_i_3_n_0,nl_z_mul_nl__0_n_89}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_carry__0
       (.CI(nl_z_mul_nl_carry_n_0),
        .CO({nl_z_mul_nl_carry__0_n_0,nl_z_mul_nl_carry__0_n_1,nl_z_mul_nl_carry__0_n_2,nl_z_mul_nl_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({nl_z_mul_nl__1_n_99,nl_z_mul_nl__1_n_100,nl_z_mul_nl__1_n_101,nl_z_mul_nl__1_n_102}),
        .O(nl_z_mul_nl__2[23:20]),
        .S({nl_z_mul_nl_carry__0_i_1_n_0,nl_z_mul_nl_carry__0_i_2_n_0,nl_z_mul_nl_carry__0_i_3_n_0,nl_z_mul_nl_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__0_i_1
       (.I0(nl_z_mul_nl__1_n_99),
        .I1(nl_z_mul_nl_n_99),
        .O(nl_z_mul_nl_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__0_i_2
       (.I0(nl_z_mul_nl__1_n_100),
        .I1(nl_z_mul_nl_n_100),
        .O(nl_z_mul_nl_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__0_i_3
       (.I0(nl_z_mul_nl__1_n_101),
        .I1(nl_z_mul_nl_n_101),
        .O(nl_z_mul_nl_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__0_i_4
       (.I0(nl_z_mul_nl__1_n_102),
        .I1(nl_z_mul_nl_n_102),
        .O(nl_z_mul_nl_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_carry__1
       (.CI(nl_z_mul_nl_carry__0_n_0),
        .CO({nl_z_mul_nl_carry__1_n_0,nl_z_mul_nl_carry__1_n_1,nl_z_mul_nl_carry__1_n_2,nl_z_mul_nl_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({nl_z_mul_nl__1_n_95,nl_z_mul_nl__1_n_96,nl_z_mul_nl__1_n_97,nl_z_mul_nl__1_n_98}),
        .O(nl_z_mul_nl__2[27:24]),
        .S({nl_z_mul_nl_carry__1_i_1_n_0,nl_z_mul_nl_carry__1_i_2_n_0,nl_z_mul_nl_carry__1_i_3_n_0,nl_z_mul_nl_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__1_i_1
       (.I0(nl_z_mul_nl__1_n_95),
        .I1(nl_z_mul_nl_n_95),
        .O(nl_z_mul_nl_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__1_i_2
       (.I0(nl_z_mul_nl__1_n_96),
        .I1(nl_z_mul_nl_n_96),
        .O(nl_z_mul_nl_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__1_i_3
       (.I0(nl_z_mul_nl__1_n_97),
        .I1(nl_z_mul_nl_n_97),
        .O(nl_z_mul_nl_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__1_i_4
       (.I0(nl_z_mul_nl__1_n_98),
        .I1(nl_z_mul_nl_n_98),
        .O(nl_z_mul_nl_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_carry__2
       (.CI(nl_z_mul_nl_carry__1_n_0),
        .CO({NLW_nl_z_mul_nl_carry__2_CO_UNCONNECTED[3],nl_z_mul_nl_carry__2_n_1,nl_z_mul_nl_carry__2_n_2,nl_z_mul_nl_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,nl_z_mul_nl__1_n_92,nl_z_mul_nl__1_n_93,nl_z_mul_nl__1_n_94}),
        .O(nl_z_mul_nl__2[31:28]),
        .S({nl_z_mul_nl_carry__2_i_1_n_0,nl_z_mul_nl_carry__2_i_2_n_0,nl_z_mul_nl_carry__2_i_3_n_0,nl_z_mul_nl_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__2_i_1
       (.I0(nl_z_mul_nl__1_n_91),
        .I1(nl_z_mul_nl_n_91),
        .O(nl_z_mul_nl_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__2_i_2
       (.I0(nl_z_mul_nl__1_n_92),
        .I1(nl_z_mul_nl_n_92),
        .O(nl_z_mul_nl_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__2_i_3
       (.I0(nl_z_mul_nl__1_n_93),
        .I1(nl_z_mul_nl_n_93),
        .O(nl_z_mul_nl_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry__2_i_4
       (.I0(nl_z_mul_nl__1_n_94),
        .I1(nl_z_mul_nl_n_94),
        .O(nl_z_mul_nl_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry_i_1
       (.I0(nl_z_mul_nl__1_n_103),
        .I1(nl_z_mul_nl_n_103),
        .O(nl_z_mul_nl_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry_i_2
       (.I0(nl_z_mul_nl__1_n_104),
        .I1(nl_z_mul_nl_n_104),
        .O(nl_z_mul_nl_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_carry_i_3
       (.I0(nl_z_mul_nl__1_n_105),
        .I1(nl_z_mul_nl_n_105),
        .O(nl_z_mul_nl_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_10
       (.I0(vector__2_n_61),
        .I1(vector__0_n_78),
        .O(nl_z_mul_nl_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_11
       (.I0(vector__2_n_62),
        .I1(vector__0_n_79),
        .O(nl_z_mul_nl_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_12
       (.I0(vector__2_n_63),
        .I1(vector__0_n_80),
        .O(nl_z_mul_nl_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_13
       (.I0(vector__2_n_64),
        .I1(vector__0_n_81),
        .O(nl_z_mul_nl_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_14
       (.I0(vector__2_n_65),
        .I1(vector__0_n_82),
        .O(nl_z_mul_nl_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_15
       (.I0(vector__2_n_66),
        .I1(vector__0_n_83),
        .O(nl_z_mul_nl_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_16
       (.I0(vector__2_n_67),
        .I1(vector__0_n_84),
        .O(nl_z_mul_nl_i_16_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_17
       (.I0(vector__2_n_68),
        .I1(vector__0_n_85),
        .O(nl_z_mul_nl_i_17_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_18
       (.I0(vector__2_n_69),
        .I1(vector__0_n_86),
        .O(nl_z_mul_nl_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_19
       (.I0(vector__2_n_70),
        .I1(vector__0_n_87),
        .O(nl_z_mul_nl_i_19_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_i_2
       (.CI(nl_z_mul_nl_i_3_n_0),
        .CO({NLW_nl_z_mul_nl_i_2_CO_UNCONNECTED[3],nl_z_mul_nl_i_2_n_1,nl_z_mul_nl_i_2_n_2,nl_z_mul_nl_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,vector__2_n_60,vector__2_n_61,vector__2_n_62}),
        .O(readslicef_64_32_32_return[31:28]),
        .S({nl_z_mul_nl_i_8_n_0,nl_z_mul_nl_i_9_n_0,nl_z_mul_nl_i_10_n_0,nl_z_mul_nl_i_11_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_20
       (.I0(vector__2_n_71),
        .I1(vector__0_n_88),
        .O(nl_z_mul_nl_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_21
       (.I0(vector__2_n_72),
        .I1(vector__0_n_89),
        .O(nl_z_mul_nl_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_22
       (.I0(vector__2_n_73),
        .I1(vector__0_n_90),
        .O(nl_z_mul_nl_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_23
       (.I0(vector__2_n_74),
        .I1(vector__0_n_91),
        .O(nl_z_mul_nl_i_23_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_i_3
       (.CI(nl_z_mul_nl_i_4_n_0),
        .CO({nl_z_mul_nl_i_3_n_0,nl_z_mul_nl_i_3_n_1,nl_z_mul_nl_i_3_n_2,nl_z_mul_nl_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_63,vector__2_n_64,vector__2_n_65,vector__2_n_66}),
        .O(readslicef_64_32_32_return[27:24]),
        .S({nl_z_mul_nl_i_12_n_0,nl_z_mul_nl_i_13_n_0,nl_z_mul_nl_i_14_n_0,nl_z_mul_nl_i_15_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_i_4
       (.CI(nl_z_mul_nl_i_5_n_0),
        .CO({nl_z_mul_nl_i_4_n_0,nl_z_mul_nl_i_4_n_1,nl_z_mul_nl_i_4_n_2,nl_z_mul_nl_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_67,vector__2_n_68,vector__2_n_69,vector__2_n_70}),
        .O(readslicef_64_32_32_return[23:20]),
        .S({nl_z_mul_nl_i_16_n_0,nl_z_mul_nl_i_17_n_0,nl_z_mul_nl_i_18_n_0,nl_z_mul_nl_i_19_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 nl_z_mul_nl_i_5
       (.CI(nl_z_mul_nl__0_i_1_n_0),
        .CO({nl_z_mul_nl_i_5_n_0,nl_z_mul_nl_i_5_n_1,nl_z_mul_nl_i_5_n_2,nl_z_mul_nl_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({vector__2_n_71,vector__2_n_72,vector__2_n_73,vector__2_n_74}),
        .O(readslicef_64_32_32_return[19:16]),
        .S({nl_z_mul_nl_i_20_n_0,nl_z_mul_nl_i_21_n_0,nl_z_mul_nl_i_22_n_0,nl_z_mul_nl_i_23_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_8
       (.I0(vector__2_n_59),
        .I1(vector__0_n_76),
        .O(nl_z_mul_nl_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    nl_z_mul_nl_i_9
       (.I0(vector__2_n_60),
        .I1(vector__0_n_77),
        .O(nl_z_mul_nl_i_9_n_0));
  FDRE \p_buf_sva_1_reg[0] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[0]),
        .Q(p_buf_sva_1[0]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[10] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[10]),
        .Q(p_buf_sva_1[10]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[11] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[11]),
        .Q(p_buf_sva_1[11]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[12] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[12]),
        .Q(p_buf_sva_1[12]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[13] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[13]),
        .Q(p_buf_sva_1[13]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[14] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[14]),
        .Q(p_buf_sva_1[14]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[15] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[15]),
        .Q(p_buf_sva_1[15]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[16] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[16]),
        .Q(p_buf_sva_1[16]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[17] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[17]),
        .Q(p_buf_sva_1[17]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[18] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[18]),
        .Q(p_buf_sva_1[18]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[19] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[19]),
        .Q(p_buf_sva_1[19]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[1] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[1]),
        .Q(p_buf_sva_1[1]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[20] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[20]),
        .Q(p_buf_sva_1[20]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[21] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[21]),
        .Q(p_buf_sva_1[21]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[22] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[22]),
        .Q(p_buf_sva_1[22]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[23] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[23]),
        .Q(p_buf_sva_1[23]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[24] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[24]),
        .Q(p_buf_sva_1[24]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[25] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[25]),
        .Q(p_buf_sva_1[25]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[26] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[26]),
        .Q(p_buf_sva_1[26]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[27] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[27]),
        .Q(p_buf_sva_1[27]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[28] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[28]),
        .Q(p_buf_sva_1[28]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[29] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[29]),
        .Q(p_buf_sva_1[29]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[2] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[2]),
        .Q(p_buf_sva_1[2]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[30] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[30]),
        .Q(p_buf_sva_1[30]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[31] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[31]),
        .Q(p_buf_sva_1[31]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[3] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[3]),
        .Q(p_buf_sva_1[3]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[4] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[4]),
        .Q(p_buf_sva_1[4]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[5] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[5]),
        .Q(p_buf_sva_1[5]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[6] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[6]),
        .Q(p_buf_sva_1[6]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[7] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[7]),
        .Q(p_buf_sva_1[7]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[8] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[8]),
        .Q(p_buf_sva_1[8]),
        .R(1'b0));
  FDRE \p_buf_sva_1_reg[9] 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(Q[9]),
        .Q(p_buf_sva_1[9]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[0] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[0]),
        .Q(p_buf_sva_2[0]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[10] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[10]),
        .Q(p_buf_sva_2[10]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[11] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[11]),
        .Q(p_buf_sva_2[11]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[12] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[12]),
        .Q(p_buf_sva_2[12]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[13] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[13]),
        .Q(p_buf_sva_2[13]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[14] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[14]),
        .Q(p_buf_sva_2[14]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[15] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[15]),
        .Q(p_buf_sva_2[15]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[16] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[16]),
        .Q(p_buf_sva_2[16]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[17] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[17]),
        .Q(p_buf_sva_2[17]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[18] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[18]),
        .Q(p_buf_sva_2[18]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[19] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[19]),
        .Q(p_buf_sva_2[19]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[1] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[1]),
        .Q(p_buf_sva_2[1]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[20] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[20]),
        .Q(p_buf_sva_2[20]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[21] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[21]),
        .Q(p_buf_sva_2[21]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[22] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[22]),
        .Q(p_buf_sva_2[22]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[23] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[23]),
        .Q(p_buf_sva_2[23]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[24] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[24]),
        .Q(p_buf_sva_2[24]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[25] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[25]),
        .Q(p_buf_sva_2[25]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[26] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[26]),
        .Q(p_buf_sva_2[26]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[27] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[27]),
        .Q(p_buf_sva_2[27]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[28] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[28]),
        .Q(p_buf_sva_2[28]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[29] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[29]),
        .Q(p_buf_sva_2[29]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[2] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[2]),
        .Q(p_buf_sva_2[2]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[30] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[30]),
        .Q(p_buf_sva_2[30]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[31] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[31]),
        .Q(p_buf_sva_2[31]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[3] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[3]),
        .Q(p_buf_sva_2[3]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[4] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[4]),
        .Q(p_buf_sva_2[4]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[5] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[5]),
        .Q(p_buf_sva_2[5]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[6] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[6]),
        .Q(p_buf_sva_2[6]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[7] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[7]),
        .Q(p_buf_sva_2[7]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[8] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[8]),
        .Q(p_buf_sva_2[8]),
        .R(1'b0));
  FDRE \p_buf_sva_2_reg[9] 
       (.C(clk),
        .CE(p_buf_sva_20),
        .D(p_buf_sva_1[9]),
        .Q(p_buf_sva_2[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    res_and_cse
       (.I0(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .I1(asn_itm_1),
        .I2(main_stage_0_2),
        .O(res_and_cse__1));
  LUT4 #(
    .INIT(16'h0080)) 
    res_and_cse__0
       (.I0(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .I1(asn_itm_1),
        .I2(main_stage_0_2),
        .I3(if_acc_1_nl),
        .O(p_buf_sva_20));
  FDRE \res_sva_1_reg[0] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[0]),
        .Q(res_sva_1[0]),
        .R(1'b0));
  FDRE \res_sva_1_reg[10] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[10]),
        .Q(res_sva_1[10]),
        .R(1'b0));
  FDRE \res_sva_1_reg[11] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[11]),
        .Q(res_sva_1[11]),
        .R(1'b0));
  FDRE \res_sva_1_reg[12] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[12]),
        .Q(res_sva_1[12]),
        .R(1'b0));
  FDRE \res_sva_1_reg[13] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[13]),
        .Q(res_sva_1[13]),
        .R(1'b0));
  FDRE \res_sva_1_reg[14] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[14]),
        .Q(res_sva_1[14]),
        .R(1'b0));
  FDRE \res_sva_1_reg[15] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[15]),
        .Q(res_sva_1[15]),
        .R(1'b0));
  FDRE \res_sva_1_reg[16] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[16]),
        .Q(res_sva_1[16]),
        .R(1'b0));
  FDRE \res_sva_1_reg[17] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[17]),
        .Q(res_sva_1[17]),
        .R(1'b0));
  FDRE \res_sva_1_reg[18] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[18]),
        .Q(res_sva_1[18]),
        .R(1'b0));
  FDRE \res_sva_1_reg[19] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[19]),
        .Q(res_sva_1[19]),
        .R(1'b0));
  FDRE \res_sva_1_reg[1] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[1]),
        .Q(res_sva_1[1]),
        .R(1'b0));
  FDRE \res_sva_1_reg[20] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[20]),
        .Q(res_sva_1[20]),
        .R(1'b0));
  FDRE \res_sva_1_reg[21] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[21]),
        .Q(res_sva_1[21]),
        .R(1'b0));
  FDRE \res_sva_1_reg[22] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[22]),
        .Q(res_sva_1[22]),
        .R(1'b0));
  FDRE \res_sva_1_reg[23] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[23]),
        .Q(res_sva_1[23]),
        .R(1'b0));
  FDRE \res_sva_1_reg[24] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[24]),
        .Q(res_sva_1[24]),
        .R(1'b0));
  FDRE \res_sva_1_reg[25] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[25]),
        .Q(res_sva_1[25]),
        .R(1'b0));
  FDRE \res_sva_1_reg[26] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[26]),
        .Q(res_sva_1[26]),
        .R(1'b0));
  FDRE \res_sva_1_reg[27] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[27]),
        .Q(res_sva_1[27]),
        .R(1'b0));
  FDRE \res_sva_1_reg[28] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[28]),
        .Q(res_sva_1[28]),
        .R(1'b0));
  FDRE \res_sva_1_reg[29] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[29]),
        .Q(res_sva_1[29]),
        .R(1'b0));
  FDRE \res_sva_1_reg[2] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[2]),
        .Q(res_sva_1[2]),
        .R(1'b0));
  FDRE \res_sva_1_reg[30] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[30]),
        .Q(res_sva_1[30]),
        .R(1'b0));
  FDRE \res_sva_1_reg[31] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[31]),
        .Q(res_sva_1[31]),
        .R(1'b0));
  FDRE \res_sva_1_reg[3] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[3]),
        .Q(res_sva_1[3]),
        .R(1'b0));
  FDRE \res_sva_1_reg[4] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[4]),
        .Q(res_sva_1[4]),
        .R(1'b0));
  FDRE \res_sva_1_reg[5] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[5]),
        .Q(res_sva_1[5]),
        .R(1'b0));
  FDRE \res_sva_1_reg[6] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[6]),
        .Q(res_sva_1[6]),
        .R(1'b0));
  FDRE \res_sva_1_reg[7] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[7]),
        .Q(res_sva_1[7]),
        .R(1'b0));
  FDRE \res_sva_1_reg[8] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[8]),
        .Q(res_sva_1[8]),
        .R(1'b0));
  FDRE \res_sva_1_reg[9] 
       (.C(clk),
        .CE(res_and_cse__1),
        .D(nl_res_sva_3[9]),
        .Q(res_sva_1[9]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[0] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[0]),
        .Q(\return_rsci_d_reg[31]_0 [0]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[10] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[10]),
        .Q(\return_rsci_d_reg[31]_0 [10]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[11] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[11]),
        .Q(\return_rsci_d_reg[31]_0 [11]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[12] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[12]),
        .Q(\return_rsci_d_reg[31]_0 [12]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[13] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[13]),
        .Q(\return_rsci_d_reg[31]_0 [13]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[14] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[14]),
        .Q(\return_rsci_d_reg[31]_0 [14]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[15] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[15]),
        .Q(\return_rsci_d_reg[31]_0 [15]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[16] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[16]),
        .Q(\return_rsci_d_reg[31]_0 [16]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[17] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[17]),
        .Q(\return_rsci_d_reg[31]_0 [17]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[18] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[18]),
        .Q(\return_rsci_d_reg[31]_0 [18]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[19] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[19]),
        .Q(\return_rsci_d_reg[31]_0 [19]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[1] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[1]),
        .Q(\return_rsci_d_reg[31]_0 [1]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[20] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[20]),
        .Q(\return_rsci_d_reg[31]_0 [20]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[21] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[21]),
        .Q(\return_rsci_d_reg[31]_0 [21]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[22] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[22]),
        .Q(\return_rsci_d_reg[31]_0 [22]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[23] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[23]),
        .Q(\return_rsci_d_reg[31]_0 [23]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[24] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[24]),
        .Q(\return_rsci_d_reg[31]_0 [24]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[25] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[25]),
        .Q(\return_rsci_d_reg[31]_0 [25]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[26] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[26]),
        .Q(\return_rsci_d_reg[31]_0 [26]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[27] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[27]),
        .Q(\return_rsci_d_reg[31]_0 [27]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[28] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[28]),
        .Q(\return_rsci_d_reg[31]_0 [28]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[29] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[29]),
        .Q(\return_rsci_d_reg[31]_0 [29]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[2] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[2]),
        .Q(\return_rsci_d_reg[31]_0 [2]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[30] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[30]),
        .Q(\return_rsci_d_reg[31]_0 [30]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[31] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[31]),
        .Q(\return_rsci_d_reg[31]_0 [31]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[3] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[3]),
        .Q(\return_rsci_d_reg[31]_0 [3]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[4] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[4]),
        .Q(\return_rsci_d_reg[31]_0 [4]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[5] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[5]),
        .Q(\return_rsci_d_reg[31]_0 [5]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[6] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[6]),
        .Q(\return_rsci_d_reg[31]_0 [6]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[7] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[7]),
        .Q(\return_rsci_d_reg[31]_0 [7]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[8] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[8]),
        .Q(\return_rsci_d_reg[31]_0 [8]),
        .R(1'b0));
  FDRE \return_rsci_d_reg[9] 
       (.C(clk),
        .CE(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
        .D(result[9]),
        .Q(\return_rsci_d_reg[31]_0 [9]),
        .R(1'b0));
  FDRE slc_32_svs_1_reg
       (.C(clk),
        .CE(res_and_cse__1),
        .D(if_acc_1_nl),
        .Q(slc_32_svs_1),
        .R(rst));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    vector
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,B}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_vector_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,out[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_vector_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_vector_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_vector_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_vector_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_vector_OVERFLOW_UNCONNECTED),
        .P({vector_n_58,vector_n_59,vector_n_60,vector_n_61,vector_n_62,vector_n_63,vector_n_64,vector_n_65,vector_n_66,vector_n_67,vector_n_68,vector_n_69,vector_n_70,vector_n_71,vector_n_72,vector_n_73,vector_n_74,vector_n_75,vector_n_76,vector_n_77,vector_n_78,vector_n_79,vector_n_80,vector_n_81,vector_n_82,vector_n_83,vector_n_84,vector_n_85,vector_n_86,vector_n_87,vector_n_88,vector_n_89,vector_n_90,vector_n_91,vector_n_92,vector_n_93,vector_n_94,vector_n_95,vector_n_96,vector_n_97,vector_n_98,vector_n_99,vector_n_100,vector_n_101,vector_n_102,vector_n_103,vector_n_104,vector_n_105}),
        .PATTERNBDETECT(NLW_vector_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_vector_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({vector_n_106,vector_n_107,vector_n_108,vector_n_109,vector_n_110,vector_n_111,vector_n_112,vector_n_113,vector_n_114,vector_n_115,vector_n_116,vector_n_117,vector_n_118,vector_n_119,vector_n_120,vector_n_121,vector_n_122,vector_n_123,vector_n_124,vector_n_125,vector_n_126,vector_n_127,vector_n_128,vector_n_129,vector_n_130,vector_n_131,vector_n_132,vector_n_133,vector_n_134,vector_n_135,vector_n_136,vector_n_137,vector_n_138,vector_n_139,vector_n_140,vector_n_141,vector_n_142,vector_n_143,vector_n_144,vector_n_145,vector_n_146,vector_n_147,vector_n_148,vector_n_149,vector_n_150,vector_n_151,vector_n_152,vector_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_vector_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    vector__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out[31:17]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_vector__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,vector__2_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_vector__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_vector__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_vector__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_vector__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_vector__0_OVERFLOW_UNCONNECTED),
        .P({vector__0_n_58,vector__0_n_59,vector__0_n_60,vector__0_n_61,vector__0_n_62,vector__0_n_63,vector__0_n_64,vector__0_n_65,vector__0_n_66,vector__0_n_67,vector__0_n_68,vector__0_n_69,vector__0_n_70,vector__0_n_71,vector__0_n_72,vector__0_n_73,vector__0_n_74,vector__0_n_75,vector__0_n_76,vector__0_n_77,vector__0_n_78,vector__0_n_79,vector__0_n_80,vector__0_n_81,vector__0_n_82,vector__0_n_83,vector__0_n_84,vector__0_n_85,vector__0_n_86,vector__0_n_87,vector__0_n_88,vector__0_n_89,vector__0_n_90,vector__0_n_91,vector__0_n_92,vector__0_n_93,vector__0_n_94,vector__0_n_95,vector__0_n_96,vector__0_n_97,vector__0_n_98,vector__0_n_99,vector__0_n_100,vector__0_n_101,vector__0_n_102,vector__0_n_103,vector__0_n_104,vector__0_n_105}),
        .PATTERNBDETECT(NLW_vector__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_vector__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({vector_n_106,vector_n_107,vector_n_108,vector_n_109,vector_n_110,vector_n_111,vector_n_112,vector_n_113,vector_n_114,vector_n_115,vector_n_116,vector_n_117,vector_n_118,vector_n_119,vector_n_120,vector_n_121,vector_n_122,vector_n_123,vector_n_124,vector_n_125,vector_n_126,vector_n_127,vector_n_128,vector_n_129,vector_n_130,vector_n_131,vector_n_132,vector_n_133,vector_n_134,vector_n_135,vector_n_136,vector_n_137,vector_n_138,vector_n_139,vector_n_140,vector_n_141,vector_n_142,vector_n_143,vector_n_144,vector_n_145,vector_n_146,vector_n_147,vector_n_148,vector_n_149,vector_n_150,vector_n_151,vector_n_152,vector_n_153}),
        .PCOUT(NLW_vector__0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_vector__0_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    vector__1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_vector__1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,B}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_vector__1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_vector__1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_vector__1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_vector__1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_vector__1_OVERFLOW_UNCONNECTED),
        .P({vector__1_n_58,vector__1_n_59,vector__1_n_60,vector__1_n_61,vector__1_n_62,vector__1_n_63,vector__1_n_64,vector__1_n_65,vector__1_n_66,vector__1_n_67,vector__1_n_68,vector__1_n_69,vector__1_n_70,vector__1_n_71,vector__1_n_72,vector__1_n_73,vector__1_n_74,vector__1_n_75,vector__1_n_76,vector__1_n_77,vector__1_n_78,vector__1_n_79,vector__1_n_80,vector__1_n_81,vector__1_n_82,vector__1_n_83,vector__1_n_84,vector__1_n_85,vector__1_n_86,vector__1_n_87,vector__1_n_88,vector__1_n_89,vector__1_n_90,vector__1_n_91,vector__1_n_92,vector__1_n_93,vector__1_n_94,vector__1_n_95,vector__1_n_96,vector__1_n_97,vector__1_n_98,vector__1_n_99,vector__1_n_100,vector__1_n_101,vector__1_n_102,vector__1_n_103,vector__1_n_104,vector__1_n_105}),
        .PATTERNBDETECT(NLW_vector__1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_vector__1_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({vector__1_n_106,vector__1_n_107,vector__1_n_108,vector__1_n_109,vector__1_n_110,vector__1_n_111,vector__1_n_112,vector__1_n_113,vector__1_n_114,vector__1_n_115,vector__1_n_116,vector__1_n_117,vector__1_n_118,vector__1_n_119,vector__1_n_120,vector__1_n_121,vector__1_n_122,vector__1_n_123,vector__1_n_124,vector__1_n_125,vector__1_n_126,vector__1_n_127,vector__1_n_128,vector__1_n_129,vector__1_n_130,vector__1_n_131,vector__1_n_132,vector__1_n_133,vector__1_n_134,vector__1_n_135,vector__1_n_136,vector__1_n_137,vector__1_n_138,vector__1_n_139,vector__1_n_140,vector__1_n_141,vector__1_n_142,vector__1_n_143,vector__1_n_144,vector__1_n_145,vector__1_n_146,vector__1_n_147,vector__1_n_148,vector__1_n_149,vector__1_n_150,vector__1_n_151,vector__1_n_152,vector__1_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_vector__1_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    vector__2
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_vector__2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,vector__2_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_vector__2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_vector__2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_vector__2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_vector__2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_vector__2_OVERFLOW_UNCONNECTED),
        .P({vector__2_n_58,vector__2_n_59,vector__2_n_60,vector__2_n_61,vector__2_n_62,vector__2_n_63,vector__2_n_64,vector__2_n_65,vector__2_n_66,vector__2_n_67,vector__2_n_68,vector__2_n_69,vector__2_n_70,vector__2_n_71,vector__2_n_72,vector__2_n_73,vector__2_n_74,vector__2_n_75,vector__2_n_76,vector__2_n_77,vector__2_n_78,vector__2_n_79,vector__2_n_80,vector__2_n_81,vector__2_n_82,vector__2_n_83,vector__2_n_84,vector__2_n_85,vector__2_n_86,vector__2_n_87,vector__2_n_88,vector__2_n_89,vector__2_n_90,vector__2_n_91,vector__2_n_92,vector__2_n_93,vector__2_n_94,vector__2_n_95,vector__2_n_96,vector__2_n_97,vector__2_n_98,vector__2_n_99,vector__2_n_100,vector__2_n_101,vector__2_n_102,vector__2_n_103,vector__2_n_104,vector__2_n_105}),
        .PATTERNBDETECT(NLW_vector__2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_vector__2_PATTERNDETECT_UNCONNECTED),
        .PCIN({vector__1_n_106,vector__1_n_107,vector__1_n_108,vector__1_n_109,vector__1_n_110,vector__1_n_111,vector__1_n_112,vector__1_n_113,vector__1_n_114,vector__1_n_115,vector__1_n_116,vector__1_n_117,vector__1_n_118,vector__1_n_119,vector__1_n_120,vector__1_n_121,vector__1_n_122,vector__1_n_123,vector__1_n_124,vector__1_n_125,vector__1_n_126,vector__1_n_127,vector__1_n_128,vector__1_n_129,vector__1_n_130,vector__1_n_131,vector__1_n_132,vector__1_n_133,vector__1_n_134,vector__1_n_135,vector__1_n_136,vector__1_n_137,vector__1_n_138,vector__1_n_139,vector__1_n_140,vector__1_n_141,vector__1_n_142,vector__1_n_143,vector__1_n_144,vector__1_n_145,vector__1_n_146,vector__1_n_147,vector__1_n_148,vector__1_n_149,vector__1_n_150,vector__1_n_151,vector__1_n_152,vector__1_n_153}),
        .PCOUT(NLW_vector__2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_vector__2_UNDERFLOW_UNCONNECTED));
  LUT2 #(
    .INIT(4'h4)) 
    vector_i_24
       (.I0(Q[31]),
        .I1(O),
        .O(S));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    z_mul_itm_1_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_z_mul_itm_1_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,z_mul_itm_1_reg_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_z_mul_itm_1_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_z_mul_itm_1_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_z_mul_itm_1_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(p_and_1_cse),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_z_mul_itm_1_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_z_mul_itm_1_reg_OVERFLOW_UNCONNECTED),
        .P({z_mul_itm_1_reg_n_58,z_mul_itm_1_reg_n_59,z_mul_itm_1_reg_n_60,z_mul_itm_1_reg_n_61,z_mul_itm_1_reg_n_62,z_mul_itm_1_reg_n_63,z_mul_itm_1_reg_n_64,z_mul_itm_1_reg_n_65,z_mul_itm_1_reg_n_66,z_mul_itm_1_reg_n_67,z_mul_itm_1_reg_n_68,z_mul_itm_1_reg_n_69,z_mul_itm_1_reg_n_70,z_mul_itm_1_reg_n_71,z_mul_itm_1_reg_n_72,z_mul_itm_1_reg_n_73,z_mul_itm_1_reg_n_74,z_mul_itm_1_reg_n_75,z_mul_itm_1_reg_n_76,z_mul_itm_1_reg_n_77,z_mul_itm_1_reg_n_78,z_mul_itm_1_reg_n_79,z_mul_itm_1_reg_n_80,z_mul_itm_1_reg_n_81,z_mul_itm_1_reg_n_82,z_mul_itm_1_reg_n_83,z_mul_itm_1_reg_n_84,z_mul_itm_1_reg_n_85,z_mul_itm_1_reg_n_86,z_mul_itm_1_reg_n_87,z_mul_itm_1_reg_n_88,z_mul_itm_1_reg_n_89,z_mul_itm_1_reg_n_90,z_mul_itm_1_reg_n_91,z_mul_itm_1_reg_n_92,z_mul_itm_1_reg_n_93,z_mul_itm_1_reg_n_94,z_mul_itm_1_reg_n_95,z_mul_itm_1_reg_n_96,z_mul_itm_1_reg_n_97,z_mul_itm_1_reg_n_98,z_mul_itm_1_reg_n_99,z_mul_itm_1_reg_n_100,z_mul_itm_1_reg_n_101,z_mul_itm_1_reg_n_102,z_mul_itm_1_reg_n_103,z_mul_itm_1_reg_n_104,z_mul_itm_1_reg_n_105}),
        .PATTERNBDETECT(NLW_z_mul_itm_1_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_z_mul_itm_1_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({nl_z_mul_itm_1__0_n_106,nl_z_mul_itm_1__0_n_107,nl_z_mul_itm_1__0_n_108,nl_z_mul_itm_1__0_n_109,nl_z_mul_itm_1__0_n_110,nl_z_mul_itm_1__0_n_111,nl_z_mul_itm_1__0_n_112,nl_z_mul_itm_1__0_n_113,nl_z_mul_itm_1__0_n_114,nl_z_mul_itm_1__0_n_115,nl_z_mul_itm_1__0_n_116,nl_z_mul_itm_1__0_n_117,nl_z_mul_itm_1__0_n_118,nl_z_mul_itm_1__0_n_119,nl_z_mul_itm_1__0_n_120,nl_z_mul_itm_1__0_n_121,nl_z_mul_itm_1__0_n_122,nl_z_mul_itm_1__0_n_123,nl_z_mul_itm_1__0_n_124,nl_z_mul_itm_1__0_n_125,nl_z_mul_itm_1__0_n_126,nl_z_mul_itm_1__0_n_127,nl_z_mul_itm_1__0_n_128,nl_z_mul_itm_1__0_n_129,nl_z_mul_itm_1__0_n_130,nl_z_mul_itm_1__0_n_131,nl_z_mul_itm_1__0_n_132,nl_z_mul_itm_1__0_n_133,nl_z_mul_itm_1__0_n_134,nl_z_mul_itm_1__0_n_135,nl_z_mul_itm_1__0_n_136,nl_z_mul_itm_1__0_n_137,nl_z_mul_itm_1__0_n_138,nl_z_mul_itm_1__0_n_139,nl_z_mul_itm_1__0_n_140,nl_z_mul_itm_1__0_n_141,nl_z_mul_itm_1__0_n_142,nl_z_mul_itm_1__0_n_143,nl_z_mul_itm_1__0_n_144,nl_z_mul_itm_1__0_n_145,nl_z_mul_itm_1__0_n_146,nl_z_mul_itm_1__0_n_147,nl_z_mul_itm_1__0_n_148,nl_z_mul_itm_1__0_n_149,nl_z_mul_itm_1__0_n_150,nl_z_mul_itm_1__0_n_151,nl_z_mul_itm_1__0_n_152,nl_z_mul_itm_1__0_n_153}),
        .PCOUT(NLW_z_mul_itm_1_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_z_mul_itm_1_reg_UNDERFLOW_UNCONNECTED));
  FDRE \z_mul_itm_1_reg[0]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_105),
        .Q(\z_mul_itm_1_reg[0]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[10]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_95),
        .Q(\z_mul_itm_1_reg[10]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[11]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_94),
        .Q(\z_mul_itm_1_reg[11]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[12]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_93),
        .Q(\z_mul_itm_1_reg[12]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[13]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_92),
        .Q(\z_mul_itm_1_reg[13]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[14]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_91),
        .Q(\z_mul_itm_1_reg[14]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[15]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_90),
        .Q(\z_mul_itm_1_reg[15]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[16]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_89),
        .Q(\z_mul_itm_1_reg[16]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[1]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_104),
        .Q(\z_mul_itm_1_reg[1]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[2]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_103),
        .Q(\z_mul_itm_1_reg[2]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[3]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_102),
        .Q(\z_mul_itm_1_reg[3]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[4]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_101),
        .Q(\z_mul_itm_1_reg[4]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[5]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_100),
        .Q(\z_mul_itm_1_reg[5]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[6]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_99),
        .Q(\z_mul_itm_1_reg[6]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[7]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_98),
        .Q(\z_mul_itm_1_reg[7]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[8]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_97),
        .Q(\z_mul_itm_1_reg[8]__0_n_0 ),
        .R(1'b0));
  FDRE \z_mul_itm_1_reg[9]__0 
       (.C(clk),
        .CE(p_and_1_cse),
        .D(nl_z_mul_itm_1__0_n_96),
        .Q(\z_mul_itm_1_reg[9]__0_n_0 ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
