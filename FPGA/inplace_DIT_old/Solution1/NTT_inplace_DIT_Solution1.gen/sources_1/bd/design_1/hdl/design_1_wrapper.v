//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Fri Jun 10 15:09:46 2022
//Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    complete_rsc_rdy,
    complete_rsc_vld,
    p_rsc_dat,
    p_rsc_triosy_lz,
    r_rsc_dat,
    r_rsc_triosy_lz,
    rst,
    run_rsc_rdy,
    run_rsc_vld,
    twiddle_h_rsc_triosy_lz,
    twiddle_rsc_triosy_lz,
    vec_rsc_triosy_lz);
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

  wire clk;
  wire complete_rsc_rdy;
  wire complete_rsc_vld;
  wire [31:0]p_rsc_dat;
  wire p_rsc_triosy_lz;
  wire [31:0]r_rsc_dat;
  wire r_rsc_triosy_lz;
  wire rst;
  wire run_rsc_rdy;
  wire run_rsc_vld;
  wire twiddle_h_rsc_triosy_lz;
  wire twiddle_rsc_triosy_lz;
  wire vec_rsc_triosy_lz;

  design_1 design_1_i
       (.clk(clk),
        .complete_rsc_rdy(complete_rsc_rdy),
        .complete_rsc_vld(complete_rsc_vld),
        .p_rsc_dat(p_rsc_dat),
        .p_rsc_triosy_lz(p_rsc_triosy_lz),
        .r_rsc_dat(r_rsc_dat),
        .r_rsc_triosy_lz(r_rsc_triosy_lz),
        .rst(rst),
        .run_rsc_rdy(run_rsc_rdy),
        .run_rsc_vld(run_rsc_vld),
        .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
        .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
        .vec_rsc_triosy_lz(vec_rsc_triosy_lz));
endmodule
