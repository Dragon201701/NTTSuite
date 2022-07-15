// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Jul 14 22:34:44 2022
// Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/NTT_Xilinx/Vivado/inplace_DIF_prototype/inplace_DIF_prototype.gen/sources_1/bd/Board/ip/Board_inPlaceNTT_DIF_preco_0_0/Board_inPlaceNTT_DIF_preco_0_0_stub.v
// Design      : Board_inPlaceNTT_DIF_preco_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvb2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "inPlaceNTT_DIF_precomp,Vivado 2021.1" *)
module Board_inPlaceNTT_DIF_preco_0_0(clk, rst, run_rsc_lzin, run_rsc_vzin, 
  vec_rsc_0_0_adr, vec_rsc_0_0_d, vec_rsc_0_0_we, vec_rsc_0_0_q, vec_rsc_triosy_0_0_lz, 
  vec_rsc_0_1_adr, vec_rsc_0_1_d, vec_rsc_0_1_we, vec_rsc_0_1_q, vec_rsc_triosy_0_1_lz, 
  vec_rsc_0_2_adr, vec_rsc_0_2_d, vec_rsc_0_2_we, vec_rsc_0_2_q, vec_rsc_triosy_0_2_lz, 
  vec_rsc_0_3_adr, vec_rsc_0_3_d, vec_rsc_0_3_we, vec_rsc_0_3_q, vec_rsc_triosy_0_3_lz, 
  vec_rsc_0_4_adr, vec_rsc_0_4_d, vec_rsc_0_4_we, vec_rsc_0_4_q, vec_rsc_triosy_0_4_lz, 
  vec_rsc_0_5_adr, vec_rsc_0_5_d, vec_rsc_0_5_we, vec_rsc_0_5_q, vec_rsc_triosy_0_5_lz, 
  vec_rsc_0_6_adr, vec_rsc_0_6_d, vec_rsc_0_6_we, vec_rsc_0_6_q, vec_rsc_triosy_0_6_lz, 
  vec_rsc_0_7_adr, vec_rsc_0_7_d, vec_rsc_0_7_we, vec_rsc_0_7_q, vec_rsc_triosy_0_7_lz, 
  p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_0_0_adra, 
  twiddle_rsc_0_0_da, twiddle_rsc_0_0_wea, twiddle_rsc_0_0_qa, twiddle_rsc_0_0_adrb, 
  twiddle_rsc_0_0_db, twiddle_rsc_0_0_web, twiddle_rsc_0_0_qb, twiddle_rsc_triosy_0_0_lz, 
  twiddle_rsc_0_1_adra, twiddle_rsc_0_1_da, twiddle_rsc_0_1_wea, twiddle_rsc_0_1_qa, 
  twiddle_rsc_0_1_adrb, twiddle_rsc_0_1_db, twiddle_rsc_0_1_web, twiddle_rsc_0_1_qb, 
  twiddle_rsc_triosy_0_1_lz, twiddle_rsc_0_2_adra, twiddle_rsc_0_2_da, 
  twiddle_rsc_0_2_wea, twiddle_rsc_0_2_qa, twiddle_rsc_0_2_adrb, twiddle_rsc_0_2_db, 
  twiddle_rsc_0_2_web, twiddle_rsc_0_2_qb, twiddle_rsc_triosy_0_2_lz, 
  twiddle_rsc_0_3_adra, twiddle_rsc_0_3_da, twiddle_rsc_0_3_wea, twiddle_rsc_0_3_qa, 
  twiddle_rsc_0_3_adrb, twiddle_rsc_0_3_db, twiddle_rsc_0_3_web, twiddle_rsc_0_3_qb, 
  twiddle_rsc_triosy_0_3_lz, twiddle_h_rsc_0_0_adra, twiddle_h_rsc_0_0_da, 
  twiddle_h_rsc_0_0_wea, twiddle_h_rsc_0_0_qa, twiddle_h_rsc_0_0_adrb, 
  twiddle_h_rsc_0_0_db, twiddle_h_rsc_0_0_web, twiddle_h_rsc_0_0_qb, 
  twiddle_h_rsc_triosy_0_0_lz, twiddle_h_rsc_0_1_adra, twiddle_h_rsc_0_1_da, 
  twiddle_h_rsc_0_1_wea, twiddle_h_rsc_0_1_qa, twiddle_h_rsc_0_1_adrb, 
  twiddle_h_rsc_0_1_db, twiddle_h_rsc_0_1_web, twiddle_h_rsc_0_1_qb, 
  twiddle_h_rsc_triosy_0_1_lz, twiddle_h_rsc_0_2_adra, twiddle_h_rsc_0_2_da, 
  twiddle_h_rsc_0_2_wea, twiddle_h_rsc_0_2_qa, twiddle_h_rsc_0_2_adrb, 
  twiddle_h_rsc_0_2_db, twiddle_h_rsc_0_2_web, twiddle_h_rsc_0_2_qb, 
  twiddle_h_rsc_triosy_0_2_lz, twiddle_h_rsc_0_3_adra, twiddle_h_rsc_0_3_da, 
  twiddle_h_rsc_0_3_wea, twiddle_h_rsc_0_3_qa, twiddle_h_rsc_0_3_adrb, 
  twiddle_h_rsc_0_3_db, twiddle_h_rsc_0_3_web, twiddle_h_rsc_0_3_qb, 
  twiddle_h_rsc_triosy_0_3_lz, complete_rsc_lzout, complete_rsc_vzout)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,run_rsc_lzin,run_rsc_vzin,vec_rsc_0_0_adr[6:0],vec_rsc_0_0_d[31:0],vec_rsc_0_0_we,vec_rsc_0_0_q[31:0],vec_rsc_triosy_0_0_lz,vec_rsc_0_1_adr[6:0],vec_rsc_0_1_d[31:0],vec_rsc_0_1_we,vec_rsc_0_1_q[31:0],vec_rsc_triosy_0_1_lz,vec_rsc_0_2_adr[6:0],vec_rsc_0_2_d[31:0],vec_rsc_0_2_we,vec_rsc_0_2_q[31:0],vec_rsc_triosy_0_2_lz,vec_rsc_0_3_adr[6:0],vec_rsc_0_3_d[31:0],vec_rsc_0_3_we,vec_rsc_0_3_q[31:0],vec_rsc_triosy_0_3_lz,vec_rsc_0_4_adr[6:0],vec_rsc_0_4_d[31:0],vec_rsc_0_4_we,vec_rsc_0_4_q[31:0],vec_rsc_triosy_0_4_lz,vec_rsc_0_5_adr[6:0],vec_rsc_0_5_d[31:0],vec_rsc_0_5_we,vec_rsc_0_5_q[31:0],vec_rsc_triosy_0_5_lz,vec_rsc_0_6_adr[6:0],vec_rsc_0_6_d[31:0],vec_rsc_0_6_we,vec_rsc_0_6_q[31:0],vec_rsc_triosy_0_6_lz,vec_rsc_0_7_adr[6:0],vec_rsc_0_7_d[31:0],vec_rsc_0_7_we,vec_rsc_0_7_q[31:0],vec_rsc_triosy_0_7_lz,p_rsc_dat[31:0],p_rsc_triosy_lz,r_rsc_dat[31:0],r_rsc_triosy_lz,twiddle_rsc_0_0_adra[7:0],twiddle_rsc_0_0_da[31:0],twiddle_rsc_0_0_wea,twiddle_rsc_0_0_qa[31:0],twiddle_rsc_0_0_adrb[7:0],twiddle_rsc_0_0_db[31:0],twiddle_rsc_0_0_web,twiddle_rsc_0_0_qb[31:0],twiddle_rsc_triosy_0_0_lz,twiddle_rsc_0_1_adra[7:0],twiddle_rsc_0_1_da[31:0],twiddle_rsc_0_1_wea,twiddle_rsc_0_1_qa[31:0],twiddle_rsc_0_1_adrb[7:0],twiddle_rsc_0_1_db[31:0],twiddle_rsc_0_1_web,twiddle_rsc_0_1_qb[31:0],twiddle_rsc_triosy_0_1_lz,twiddle_rsc_0_2_adra[7:0],twiddle_rsc_0_2_da[31:0],twiddle_rsc_0_2_wea,twiddle_rsc_0_2_qa[31:0],twiddle_rsc_0_2_adrb[7:0],twiddle_rsc_0_2_db[31:0],twiddle_rsc_0_2_web,twiddle_rsc_0_2_qb[31:0],twiddle_rsc_triosy_0_2_lz,twiddle_rsc_0_3_adra[7:0],twiddle_rsc_0_3_da[31:0],twiddle_rsc_0_3_wea,twiddle_rsc_0_3_qa[31:0],twiddle_rsc_0_3_adrb[7:0],twiddle_rsc_0_3_db[31:0],twiddle_rsc_0_3_web,twiddle_rsc_0_3_qb[31:0],twiddle_rsc_triosy_0_3_lz,twiddle_h_rsc_0_0_adra[7:0],twiddle_h_rsc_0_0_da[31:0],twiddle_h_rsc_0_0_wea,twiddle_h_rsc_0_0_qa[31:0],twiddle_h_rsc_0_0_adrb[7:0],twiddle_h_rsc_0_0_db[31:0],twiddle_h_rsc_0_0_web,twiddle_h_rsc_0_0_qb[31:0],twiddle_h_rsc_triosy_0_0_lz,twiddle_h_rsc_0_1_adra[7:0],twiddle_h_rsc_0_1_da[31:0],twiddle_h_rsc_0_1_wea,twiddle_h_rsc_0_1_qa[31:0],twiddle_h_rsc_0_1_adrb[7:0],twiddle_h_rsc_0_1_db[31:0],twiddle_h_rsc_0_1_web,twiddle_h_rsc_0_1_qb[31:0],twiddle_h_rsc_triosy_0_1_lz,twiddle_h_rsc_0_2_adra[7:0],twiddle_h_rsc_0_2_da[31:0],twiddle_h_rsc_0_2_wea,twiddle_h_rsc_0_2_qa[31:0],twiddle_h_rsc_0_2_adrb[7:0],twiddle_h_rsc_0_2_db[31:0],twiddle_h_rsc_0_2_web,twiddle_h_rsc_0_2_qb[31:0],twiddle_h_rsc_triosy_0_2_lz,twiddle_h_rsc_0_3_adra[7:0],twiddle_h_rsc_0_3_da[31:0],twiddle_h_rsc_0_3_wea,twiddle_h_rsc_0_3_qa[31:0],twiddle_h_rsc_0_3_adrb[7:0],twiddle_h_rsc_0_3_db[31:0],twiddle_h_rsc_0_3_web,twiddle_h_rsc_0_3_qb[31:0],twiddle_h_rsc_triosy_0_3_lz,complete_rsc_lzout,complete_rsc_vzout" */;
  input clk;
  input rst;
  output run_rsc_lzin;
  input run_rsc_vzin;
  output [6:0]vec_rsc_0_0_adr;
  output [31:0]vec_rsc_0_0_d;
  output vec_rsc_0_0_we;
  input [31:0]vec_rsc_0_0_q;
  output vec_rsc_triosy_0_0_lz;
  output [6:0]vec_rsc_0_1_adr;
  output [31:0]vec_rsc_0_1_d;
  output vec_rsc_0_1_we;
  input [31:0]vec_rsc_0_1_q;
  output vec_rsc_triosy_0_1_lz;
  output [6:0]vec_rsc_0_2_adr;
  output [31:0]vec_rsc_0_2_d;
  output vec_rsc_0_2_we;
  input [31:0]vec_rsc_0_2_q;
  output vec_rsc_triosy_0_2_lz;
  output [6:0]vec_rsc_0_3_adr;
  output [31:0]vec_rsc_0_3_d;
  output vec_rsc_0_3_we;
  input [31:0]vec_rsc_0_3_q;
  output vec_rsc_triosy_0_3_lz;
  output [6:0]vec_rsc_0_4_adr;
  output [31:0]vec_rsc_0_4_d;
  output vec_rsc_0_4_we;
  input [31:0]vec_rsc_0_4_q;
  output vec_rsc_triosy_0_4_lz;
  output [6:0]vec_rsc_0_5_adr;
  output [31:0]vec_rsc_0_5_d;
  output vec_rsc_0_5_we;
  input [31:0]vec_rsc_0_5_q;
  output vec_rsc_triosy_0_5_lz;
  output [6:0]vec_rsc_0_6_adr;
  output [31:0]vec_rsc_0_6_d;
  output vec_rsc_0_6_we;
  input [31:0]vec_rsc_0_6_q;
  output vec_rsc_triosy_0_6_lz;
  output [6:0]vec_rsc_0_7_adr;
  output [31:0]vec_rsc_0_7_d;
  output vec_rsc_0_7_we;
  input [31:0]vec_rsc_0_7_q;
  output vec_rsc_triosy_0_7_lz;
  input [31:0]p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0]r_rsc_dat;
  output r_rsc_triosy_lz;
  output [7:0]twiddle_rsc_0_0_adra;
  output [31:0]twiddle_rsc_0_0_da;
  output twiddle_rsc_0_0_wea;
  input [31:0]twiddle_rsc_0_0_qa;
  output [7:0]twiddle_rsc_0_0_adrb;
  output [31:0]twiddle_rsc_0_0_db;
  output twiddle_rsc_0_0_web;
  input [31:0]twiddle_rsc_0_0_qb;
  output twiddle_rsc_triosy_0_0_lz;
  output [7:0]twiddle_rsc_0_1_adra;
  output [31:0]twiddle_rsc_0_1_da;
  output twiddle_rsc_0_1_wea;
  input [31:0]twiddle_rsc_0_1_qa;
  output [7:0]twiddle_rsc_0_1_adrb;
  output [31:0]twiddle_rsc_0_1_db;
  output twiddle_rsc_0_1_web;
  input [31:0]twiddle_rsc_0_1_qb;
  output twiddle_rsc_triosy_0_1_lz;
  output [7:0]twiddle_rsc_0_2_adra;
  output [31:0]twiddle_rsc_0_2_da;
  output twiddle_rsc_0_2_wea;
  input [31:0]twiddle_rsc_0_2_qa;
  output [7:0]twiddle_rsc_0_2_adrb;
  output [31:0]twiddle_rsc_0_2_db;
  output twiddle_rsc_0_2_web;
  input [31:0]twiddle_rsc_0_2_qb;
  output twiddle_rsc_triosy_0_2_lz;
  output [7:0]twiddle_rsc_0_3_adra;
  output [31:0]twiddle_rsc_0_3_da;
  output twiddle_rsc_0_3_wea;
  input [31:0]twiddle_rsc_0_3_qa;
  output [7:0]twiddle_rsc_0_3_adrb;
  output [31:0]twiddle_rsc_0_3_db;
  output twiddle_rsc_0_3_web;
  input [31:0]twiddle_rsc_0_3_qb;
  output twiddle_rsc_triosy_0_3_lz;
  output [7:0]twiddle_h_rsc_0_0_adra;
  output [31:0]twiddle_h_rsc_0_0_da;
  output twiddle_h_rsc_0_0_wea;
  input [31:0]twiddle_h_rsc_0_0_qa;
  output [7:0]twiddle_h_rsc_0_0_adrb;
  output [31:0]twiddle_h_rsc_0_0_db;
  output twiddle_h_rsc_0_0_web;
  input [31:0]twiddle_h_rsc_0_0_qb;
  output twiddle_h_rsc_triosy_0_0_lz;
  output [7:0]twiddle_h_rsc_0_1_adra;
  output [31:0]twiddle_h_rsc_0_1_da;
  output twiddle_h_rsc_0_1_wea;
  input [31:0]twiddle_h_rsc_0_1_qa;
  output [7:0]twiddle_h_rsc_0_1_adrb;
  output [31:0]twiddle_h_rsc_0_1_db;
  output twiddle_h_rsc_0_1_web;
  input [31:0]twiddle_h_rsc_0_1_qb;
  output twiddle_h_rsc_triosy_0_1_lz;
  output [7:0]twiddle_h_rsc_0_2_adra;
  output [31:0]twiddle_h_rsc_0_2_da;
  output twiddle_h_rsc_0_2_wea;
  input [31:0]twiddle_h_rsc_0_2_qa;
  output [7:0]twiddle_h_rsc_0_2_adrb;
  output [31:0]twiddle_h_rsc_0_2_db;
  output twiddle_h_rsc_0_2_web;
  input [31:0]twiddle_h_rsc_0_2_qb;
  output twiddle_h_rsc_triosy_0_2_lz;
  output [7:0]twiddle_h_rsc_0_3_adra;
  output [31:0]twiddle_h_rsc_0_3_da;
  output twiddle_h_rsc_0_3_wea;
  input [31:0]twiddle_h_rsc_0_3_qa;
  output [7:0]twiddle_h_rsc_0_3_adrb;
  output [31:0]twiddle_h_rsc_0_3_db;
  output twiddle_h_rsc_0_3_web;
  input [31:0]twiddle_h_rsc_0_3_qb;
  output twiddle_h_rsc_triosy_0_3_lz;
  output complete_rsc_lzout;
  input complete_rsc_vzout;
endmodule
