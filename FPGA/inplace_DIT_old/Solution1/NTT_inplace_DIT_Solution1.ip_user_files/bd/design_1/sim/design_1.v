//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Fri Jun 10 15:09:46 2022
//Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_BD}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  input [31:0]p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0]r_rsc_dat;
  output r_rsc_triosy_lz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output twiddle_h_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output vec_rsc_triosy_lz;

  wire [31:0]blk_mem_gen_twiddle_h_rsc_douta;
  wire [31:0]blk_mem_gen_twiddle_h_rsc_doutb;
  wire [31:0]blk_mem_gen_twiddle_rsc_douta;
  wire [31:0]blk_mem_gen_twiddle_rsc_doutb;
  wire [31:0]blk_mem_gen_vec_douta;
  wire [31:0]blk_mem_gen_vec_doutb;
  wire clk_1;
  wire complete_rsc_rdy_1;
  wire inPlaceNTT_DIT_preco_0_complete_rsc_vld;
  wire inPlaceNTT_DIT_preco_0_p_rsc_triosy_lz;
  wire inPlaceNTT_DIT_preco_0_r_rsc_triosy_lz;
  wire inPlaceNTT_DIT_preco_0_run_rsc_rdy;
  wire [13:0]inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adra;
  wire [13:0]inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adrb;
  wire [31:0]inPlaceNTT_DIT_preco_0_twiddle_h_rsc_da;
  wire [31:0]inPlaceNTT_DIT_preco_0_twiddle_h_rsc_db;
  wire inPlaceNTT_DIT_preco_0_twiddle_h_rsc_triosy_lz;
  wire inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea;
  wire inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web;
  wire [13:0]inPlaceNTT_DIT_preco_0_twiddle_rsc_adra;
  wire [13:0]inPlaceNTT_DIT_preco_0_twiddle_rsc_adrb;
  wire [31:0]inPlaceNTT_DIT_preco_0_twiddle_rsc_da;
  wire [31:0]inPlaceNTT_DIT_preco_0_twiddle_rsc_db;
  wire inPlaceNTT_DIT_preco_0_twiddle_rsc_triosy_lz;
  wire inPlaceNTT_DIT_preco_0_twiddle_rsc_wea;
  wire inPlaceNTT_DIT_preco_0_twiddle_rsc_web;
  wire [13:0]inPlaceNTT_DIT_preco_0_vec_rsc_adra;
  wire [13:0]inPlaceNTT_DIT_preco_0_vec_rsc_adrb;
  wire [31:0]inPlaceNTT_DIT_preco_0_vec_rsc_da;
  wire [31:0]inPlaceNTT_DIT_preco_0_vec_rsc_db;
  wire inPlaceNTT_DIT_preco_0_vec_rsc_triosy_lz;
  wire inPlaceNTT_DIT_preco_0_vec_rsc_wea;
  wire inPlaceNTT_DIT_preco_0_vec_rsc_web;
  wire [31:0]p_rsc_dat_1;
  wire [31:0]r_rsc_dat_1;
  wire rst_1;
  wire run_rsc_vld_1;

  assign clk_1 = clk;
  assign complete_rsc_rdy_1 = complete_rsc_rdy;
  assign complete_rsc_vld = inPlaceNTT_DIT_preco_0_complete_rsc_vld;
  assign p_rsc_dat_1 = p_rsc_dat[31:0];
  assign p_rsc_triosy_lz = inPlaceNTT_DIT_preco_0_p_rsc_triosy_lz;
  assign r_rsc_dat_1 = r_rsc_dat[31:0];
  assign r_rsc_triosy_lz = inPlaceNTT_DIT_preco_0_r_rsc_triosy_lz;
  assign rst_1 = rst;
  assign run_rsc_rdy = inPlaceNTT_DIT_preco_0_run_rsc_rdy;
  assign run_rsc_vld_1 = run_rsc_vld;
  assign twiddle_h_rsc_triosy_lz = inPlaceNTT_DIT_preco_0_twiddle_h_rsc_triosy_lz;
  assign twiddle_rsc_triosy_lz = inPlaceNTT_DIT_preco_0_twiddle_rsc_triosy_lz;
  assign vec_rsc_triosy_lz = inPlaceNTT_DIT_preco_0_vec_rsc_triosy_lz;
  design_1_blk_mem_gen_0_2 blk_mem_gen_twiddle_h_rsc
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adra}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adrb}),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_da),
        .dinb(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_db),
        .douta(blk_mem_gen_twiddle_h_rsc_douta),
        .doutb(blk_mem_gen_twiddle_h_rsc_doutb),
        .ena(1'b0),
        .enb(1'b0),
        .rsta(1'b0),
        .rstb(1'b0),
        .wea({inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea}),
        .web({inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web,inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web}));
  design_1_blk_mem_gen_0_1 blk_mem_gen_twiddle_rsc
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIT_preco_0_twiddle_rsc_adra}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIT_preco_0_twiddle_rsc_adrb}),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(inPlaceNTT_DIT_preco_0_twiddle_rsc_da),
        .dinb(inPlaceNTT_DIT_preco_0_twiddle_rsc_db),
        .douta(blk_mem_gen_twiddle_rsc_douta),
        .doutb(blk_mem_gen_twiddle_rsc_doutb),
        .ena(1'b0),
        .enb(1'b0),
        .rsta(1'b0),
        .rstb(1'b0),
        .wea({inPlaceNTT_DIT_preco_0_twiddle_rsc_wea,inPlaceNTT_DIT_preco_0_twiddle_rsc_wea,inPlaceNTT_DIT_preco_0_twiddle_rsc_wea,inPlaceNTT_DIT_preco_0_twiddle_rsc_wea}),
        .web({inPlaceNTT_DIT_preco_0_twiddle_rsc_web,inPlaceNTT_DIT_preco_0_twiddle_rsc_web,inPlaceNTT_DIT_preco_0_twiddle_rsc_web,inPlaceNTT_DIT_preco_0_twiddle_rsc_web}));
  design_1_blk_mem_gen_0_0 blk_mem_gen_vec
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIT_preco_0_vec_rsc_adra}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIT_preco_0_vec_rsc_adrb}),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(inPlaceNTT_DIT_preco_0_vec_rsc_da),
        .dinb(inPlaceNTT_DIT_preco_0_vec_rsc_db),
        .douta(blk_mem_gen_vec_douta),
        .doutb(blk_mem_gen_vec_doutb),
        .ena(1'b0),
        .enb(1'b0),
        .rsta(1'b0),
        .rstb(1'b0),
        .wea({inPlaceNTT_DIT_preco_0_vec_rsc_wea,inPlaceNTT_DIT_preco_0_vec_rsc_wea,inPlaceNTT_DIT_preco_0_vec_rsc_wea,inPlaceNTT_DIT_preco_0_vec_rsc_wea}),
        .web({inPlaceNTT_DIT_preco_0_vec_rsc_web,inPlaceNTT_DIT_preco_0_vec_rsc_web,inPlaceNTT_DIT_preco_0_vec_rsc_web,inPlaceNTT_DIT_preco_0_vec_rsc_web}));
  design_1_inPlaceNTT_DIT_preco_0_0 inPlaceNTT_DIT_preco_0
       (.clk(clk_1),
        .complete_rsc_rdy(complete_rsc_rdy_1),
        .complete_rsc_vld(inPlaceNTT_DIT_preco_0_complete_rsc_vld),
        .p_rsc_dat(p_rsc_dat_1),
        .p_rsc_triosy_lz(inPlaceNTT_DIT_preco_0_p_rsc_triosy_lz),
        .r_rsc_dat(r_rsc_dat_1),
        .r_rsc_triosy_lz(inPlaceNTT_DIT_preco_0_r_rsc_triosy_lz),
        .rst(rst_1),
        .run_rsc_rdy(inPlaceNTT_DIT_preco_0_run_rsc_rdy),
        .run_rsc_vld(run_rsc_vld_1),
        .twiddle_h_rsc_adra(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adra),
        .twiddle_h_rsc_adrb(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adrb),
        .twiddle_h_rsc_da(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_da),
        .twiddle_h_rsc_db(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_db),
        .twiddle_h_rsc_qa(blk_mem_gen_twiddle_h_rsc_douta),
        .twiddle_h_rsc_qb(blk_mem_gen_twiddle_h_rsc_doutb),
        .twiddle_h_rsc_triosy_lz(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_triosy_lz),
        .twiddle_h_rsc_wea(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea),
        .twiddle_h_rsc_web(inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web),
        .twiddle_rsc_adra(inPlaceNTT_DIT_preco_0_twiddle_rsc_adra),
        .twiddle_rsc_adrb(inPlaceNTT_DIT_preco_0_twiddle_rsc_adrb),
        .twiddle_rsc_da(inPlaceNTT_DIT_preco_0_twiddle_rsc_da),
        .twiddle_rsc_db(inPlaceNTT_DIT_preco_0_twiddle_rsc_db),
        .twiddle_rsc_qa(blk_mem_gen_twiddle_rsc_douta),
        .twiddle_rsc_qb(blk_mem_gen_twiddle_rsc_doutb),
        .twiddle_rsc_triosy_lz(inPlaceNTT_DIT_preco_0_twiddle_rsc_triosy_lz),
        .twiddle_rsc_wea(inPlaceNTT_DIT_preco_0_twiddle_rsc_wea),
        .twiddle_rsc_web(inPlaceNTT_DIT_preco_0_twiddle_rsc_web),
        .vec_rsc_adra(inPlaceNTT_DIT_preco_0_vec_rsc_adra),
        .vec_rsc_adrb(inPlaceNTT_DIT_preco_0_vec_rsc_adrb),
        .vec_rsc_da(inPlaceNTT_DIT_preco_0_vec_rsc_da),
        .vec_rsc_db(inPlaceNTT_DIT_preco_0_vec_rsc_db),
        .vec_rsc_qa(blk_mem_gen_vec_douta),
        .vec_rsc_qb(blk_mem_gen_vec_doutb),
        .vec_rsc_triosy_lz(inPlaceNTT_DIT_preco_0_vec_rsc_triosy_lz),
        .vec_rsc_wea(inPlaceNTT_DIT_preco_0_vec_rsc_wea),
        .vec_rsc_web(inPlaceNTT_DIT_preco_0_vec_rsc_web));
endmodule
