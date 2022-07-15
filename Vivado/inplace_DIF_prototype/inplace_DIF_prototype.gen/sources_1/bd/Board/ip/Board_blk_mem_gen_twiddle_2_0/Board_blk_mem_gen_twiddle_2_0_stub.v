// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Jul 14 22:30:05 2022
// Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top Board_blk_mem_gen_twiddle_2_0 -prefix
//               Board_blk_mem_gen_twiddle_2_0_ Board_blk_mem_gen_twiddle_h_1_1_stub.v
// Design      : Board_blk_mem_gen_twiddle_h_1_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvb2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *)
module Board_blk_mem_gen_twiddle_2_0(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[12:0],dina[31:0],douta[31:0],clkb,web[0:0],addrb[12:0],dinb[31:0],doutb[31:0]" */;
  input clka;
  input [0:0]wea;
  input [12:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input [0:0]web;
  input [12:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
endmodule
