// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Jul 14 22:47:20 2022
// Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/NTT_Xilinx/Vivado/inplace_DIF_prototype/inplace_DIF_prototype.gen/sources_1/bd/Board/ip/Board_axi_lit_0_0/Board_axi_lit_0_0_stub.v
// Design      : Board_axi_lit_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvb2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_lit,Vivado 2021.1" *)
module Board_axi_lit_0_0(ACLK, ARESETN, AWADDR, AWVALID, AWREADY, WDATA, 
  WSTRB, WVALID, WREADY, BRESP, BVALID, BREADY, ARADDR, ARVALID, ARREADY, RDATA, RRESP, RVALID, RREADY, 
  p_rsc_dat, r_rsc_dat, ac_sync_run, ac_sync_complete_rsc_vzout, ac_sync_complete, 
  ac_sync_run_rsc_lzin, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, 
  vec_rsc_triosy_0_2_lz, vec_rsc_triosy_0_3_lz, vec_rsc_triosy_0_4_lz, 
  vec_rsc_triosy_0_5_lz, vec_rsc_triosy_0_6_lz, vec_rsc_triosy_0_7_lz, p_rsc_triosy_lz, 
  r_rsc_triosy_lz, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_triosy_0_1_lz, 
  twiddle_rsc_triosy_0_2_lz, twiddle_rsc_triosy_0_3_lz, twiddle_h_rsc_triosy_0_0_lz, 
  twiddle_h_rsc_triosy_0_1_lz, twiddle_h_rsc_triosy_0_2_lz, 
  twiddle_h_rsc_triosy_0_3_lz)
/* synthesis syn_black_box black_box_pad_pin="ACLK,ARESETN,AWADDR[31:0],AWVALID,AWREADY,WDATA[31:0],WSTRB[3:0],WVALID,WREADY,BRESP[1:0],BVALID,BREADY,ARADDR[31:0],ARVALID,ARREADY,RDATA[31:0],RRESP[1:0],RVALID,RREADY,p_rsc_dat[31:0],r_rsc_dat[31:0],ac_sync_run,ac_sync_complete_rsc_vzout,ac_sync_complete,ac_sync_run_rsc_lzin,vec_rsc_triosy_0_0_lz,vec_rsc_triosy_0_1_lz,vec_rsc_triosy_0_2_lz,vec_rsc_triosy_0_3_lz,vec_rsc_triosy_0_4_lz,vec_rsc_triosy_0_5_lz,vec_rsc_triosy_0_6_lz,vec_rsc_triosy_0_7_lz,p_rsc_triosy_lz,r_rsc_triosy_lz,twiddle_rsc_triosy_0_0_lz,twiddle_rsc_triosy_0_1_lz,twiddle_rsc_triosy_0_2_lz,twiddle_rsc_triosy_0_3_lz,twiddle_h_rsc_triosy_0_0_lz,twiddle_h_rsc_triosy_0_1_lz,twiddle_h_rsc_triosy_0_2_lz,twiddle_h_rsc_triosy_0_3_lz" */;
  input ACLK;
  input ARESETN;
  input [31:0]AWADDR;
  input AWVALID;
  output AWREADY;
  input [31:0]WDATA;
  input [3:0]WSTRB;
  input WVALID;
  output WREADY;
  output [1:0]BRESP;
  output BVALID;
  input BREADY;
  input [31:0]ARADDR;
  input ARVALID;
  output ARREADY;
  output [31:0]RDATA;
  output [1:0]RRESP;
  output RVALID;
  input RREADY;
  output [31:0]p_rsc_dat;
  output [31:0]r_rsc_dat;
  output ac_sync_run;
  output ac_sync_complete_rsc_vzout;
  input ac_sync_complete;
  input ac_sync_run_rsc_lzin;
  input vec_rsc_triosy_0_0_lz;
  input vec_rsc_triosy_0_1_lz;
  input vec_rsc_triosy_0_2_lz;
  input vec_rsc_triosy_0_3_lz;
  input vec_rsc_triosy_0_4_lz;
  input vec_rsc_triosy_0_5_lz;
  input vec_rsc_triosy_0_6_lz;
  input vec_rsc_triosy_0_7_lz;
  input p_rsc_triosy_lz;
  input r_rsc_triosy_lz;
  input twiddle_rsc_triosy_0_0_lz;
  input twiddle_rsc_triosy_0_1_lz;
  input twiddle_rsc_triosy_0_2_lz;
  input twiddle_rsc_triosy_0_3_lz;
  input twiddle_h_rsc_triosy_0_0_lz;
  input twiddle_h_rsc_triosy_0_1_lz;
  input twiddle_h_rsc_triosy_0_2_lz;
  input twiddle_h_rsc_triosy_0_3_lz;
endmodule
