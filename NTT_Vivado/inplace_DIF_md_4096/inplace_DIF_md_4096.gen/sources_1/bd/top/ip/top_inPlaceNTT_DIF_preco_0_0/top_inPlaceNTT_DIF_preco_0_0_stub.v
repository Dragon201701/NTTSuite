// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Sep 16 00:49:23 2021
// Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/NTT_Xilinx/NTT_Vivado/inplace_DIF_md_4096/inplace_DIF_md_4096.gen/sources_1/bd/top/ip/top_inPlaceNTT_DIF_preco_0_0/top_inPlaceNTT_DIF_preco_0_0_stub.v
// Design      : top_inPlaceNTT_DIF_preco_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "inPlaceNTT_DIF_precomp,Vivado 2021.1" *)
module top_inPlaceNTT_DIF_preco_0_0(clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_adra, 
  vec_rsc_da, vec_rsc_wea, vec_rsc_qa, vec_rsc_adrb, vec_rsc_db, vec_rsc_web, vec_rsc_qb, 
  vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, 
  twiddle_rsc_adra, twiddle_rsc_da, twiddle_rsc_wea, twiddle_rsc_qa, twiddle_rsc_adrb, 
  twiddle_rsc_db, twiddle_rsc_web, twiddle_rsc_qb, twiddle_rsc_triosy_lz, 
  twiddle_h_rsc_adra, twiddle_h_rsc_da, twiddle_h_rsc_wea, twiddle_h_rsc_qa, 
  twiddle_h_rsc_adrb, twiddle_h_rsc_db, twiddle_h_rsc_web, twiddle_h_rsc_qb, 
  twiddle_h_rsc_triosy_lz, complete_rsc_rdy, complete_rsc_vld)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,run_rsc_rdy,run_rsc_vld,vec_rsc_adra[11:0],vec_rsc_da[31:0],vec_rsc_wea,vec_rsc_qa[31:0],vec_rsc_adrb[11:0],vec_rsc_db[31:0],vec_rsc_web,vec_rsc_qb[31:0],vec_rsc_triosy_lz,p_rsc_dat[31:0],p_rsc_triosy_lz,r_rsc_dat[31:0],r_rsc_triosy_lz,twiddle_rsc_adra[11:0],twiddle_rsc_da[31:0],twiddle_rsc_wea,twiddle_rsc_qa[31:0],twiddle_rsc_adrb[11:0],twiddle_rsc_db[31:0],twiddle_rsc_web,twiddle_rsc_qb[31:0],twiddle_rsc_triosy_lz,twiddle_h_rsc_adra[11:0],twiddle_h_rsc_da[31:0],twiddle_h_rsc_wea,twiddle_h_rsc_qa[31:0],twiddle_h_rsc_adrb[11:0],twiddle_h_rsc_db[31:0],twiddle_h_rsc_web,twiddle_h_rsc_qb[31:0],twiddle_h_rsc_triosy_lz,complete_rsc_rdy,complete_rsc_vld" */;
  input clk;
  input rst;
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
endmodule
