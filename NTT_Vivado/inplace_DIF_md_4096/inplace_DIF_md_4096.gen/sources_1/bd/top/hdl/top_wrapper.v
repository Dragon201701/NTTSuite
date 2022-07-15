//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Sat Jul  9 16:42:02 2022
//Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
//Command     : generate_target top_wrapper.bd
//Design      : top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_wrapper
   (bram_ena,
    clk,
    complete_rdy_in,
    complete_rsc_vld,
    p_rsc_dat,
    r_rsc_dat,
    rst,
    run_rdy,
    run_rsc_vld);
  input bram_ena;
  input clk;
  input complete_rdy_in;
  output complete_rsc_vld;
  input [31:0]p_rsc_dat;
  input [31:0]r_rsc_dat;
  input rst;
  output run_rdy;
  input run_rsc_vld;

  wire bram_ena;
  wire clk;
  wire complete_rdy_in;
  wire complete_rsc_vld;
  wire [31:0]p_rsc_dat;
  wire [31:0]r_rsc_dat;
  wire rst;
  wire run_rdy;
  wire run_rsc_vld;

  top top_i
       (.bram_ena(bram_ena),
        .clk(clk),
        .complete_rdy_in(complete_rdy_in),
        .complete_rsc_vld(complete_rsc_vld),
        .p_rsc_dat(p_rsc_dat),
        .r_rsc_dat(r_rsc_dat),
        .rst(rst),
        .run_rdy(run_rdy),
        .run_rsc_vld(run_rsc_vld));
endmodule
