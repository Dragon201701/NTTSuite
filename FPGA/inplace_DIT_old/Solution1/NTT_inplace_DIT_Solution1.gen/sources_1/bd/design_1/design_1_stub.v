// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Fri Jun 10 15:11:55 2022
// Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/NTT_Xilinx/FPGA/inplace_DIT/Solution1/NTT_inplace_DIT_Solution1.gen/sources_1/bd/design_1/design_1_stub.v
// Design      : design_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvb2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module design_1(clk, complete_rsc_rdy, complete_rsc_vld, 
  p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, rst, run_rsc_rdy, run_rsc_vld, 
  twiddle_h_rsc_triosy_lz, twiddle_rsc_triosy_lz, vec_rsc_triosy_lz)
/* synthesis syn_black_box black_box_pad_pin="clk,complete_rsc_rdy,complete_rsc_vld,p_rsc_dat[31:0],p_rsc_triosy_lz,r_rsc_dat[31:0],r_rsc_triosy_lz,rst,run_rsc_rdy,run_rsc_vld,twiddle_h_rsc_triosy_lz,twiddle_rsc_triosy_lz,vec_rsc_triosy_lz" */;
  input clk;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  input [31:0]p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0]r_rsc_dat;
  output r_rsc_triosy_lz;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output twiddle_h_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output vec_rsc_triosy_lz;
endmodule
