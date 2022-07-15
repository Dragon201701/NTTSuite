//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Sat Jul  9 16:42:02 2022
//Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
//Command     : generate_target top.bd
//Design      : top
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "top,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top.hwdef" *) 
module top
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN top_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  input complete_rdy_in;
  output complete_rsc_vld;
  input [31:0]p_rsc_dat;
  input [31:0]r_rsc_dat;
  input rst;
  output run_rdy;
  input run_rsc_vld;

  wire Net;
  wire [31:0]blk_mem_gen_0_douta;
  wire [31:0]blk_mem_gen_0_doutb;
  wire [31:0]blk_mem_gen_1_douta;
  wire [31:0]blk_mem_gen_1_doutb;
  wire [31:0]blk_mem_gen_2_douta;
  wire [31:0]blk_mem_gen_2_doutb;
  wire bram_ena_1;
  wire complete_rdy_in_1;
  wire inPlaceNTT_DIF_preco_0_complete_rsc_vld;
  wire inPlaceNTT_DIF_preco_0_run_rsc_rdy;
  wire [11:0]inPlaceNTT_DIF_preco_0_twiddle_h_rsc_adra;
  wire [11:0]inPlaceNTT_DIF_preco_0_twiddle_h_rsc_adrb;
  wire [31:0]inPlaceNTT_DIF_preco_0_twiddle_h_rsc_da;
  wire [31:0]inPlaceNTT_DIF_preco_0_twiddle_h_rsc_db;
  wire inPlaceNTT_DIF_preco_0_twiddle_h_rsc_wea;
  wire inPlaceNTT_DIF_preco_0_twiddle_h_rsc_web;
  wire [11:0]inPlaceNTT_DIF_preco_0_twiddle_rsc_adra;
  wire [11:0]inPlaceNTT_DIF_preco_0_twiddle_rsc_adrb;
  wire [31:0]inPlaceNTT_DIF_preco_0_twiddle_rsc_da;
  wire [31:0]inPlaceNTT_DIF_preco_0_twiddle_rsc_db;
  wire inPlaceNTT_DIF_preco_0_twiddle_rsc_wea;
  wire inPlaceNTT_DIF_preco_0_twiddle_rsc_web;
  wire [11:0]inPlaceNTT_DIF_preco_0_vec_rsc_adra;
  wire [11:0]inPlaceNTT_DIF_preco_0_vec_rsc_adrb;
  wire [31:0]inPlaceNTT_DIF_preco_0_vec_rsc_da;
  wire [31:0]inPlaceNTT_DIF_preco_0_vec_rsc_db;
  wire inPlaceNTT_DIF_preco_0_vec_rsc_wea;
  wire inPlaceNTT_DIF_preco_0_vec_rsc_web;
  wire [31:0]p_rsc_dat_1;
  wire [31:0]r_rsc_dat_1;
  wire rst_0_1;
  wire run_rsc_vld_1;

  assign Net = clk;
  assign bram_ena_1 = bram_ena;
  assign complete_rdy_in_1 = complete_rdy_in;
  assign complete_rsc_vld = inPlaceNTT_DIF_preco_0_complete_rsc_vld;
  assign p_rsc_dat_1 = p_rsc_dat[31:0];
  assign r_rsc_dat_1 = r_rsc_dat[31:0];
  assign rst_0_1 = rst;
  assign run_rdy = inPlaceNTT_DIF_preco_0_run_rsc_rdy;
  assign run_rsc_vld_1 = run_rsc_vld;
  top_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_preco_0_vec_rsc_adra}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_preco_0_vec_rsc_adrb}),
        .clka(Net),
        .clkb(Net),
        .dina(inPlaceNTT_DIF_preco_0_vec_rsc_da),
        .dinb(inPlaceNTT_DIF_preco_0_vec_rsc_db),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .ena(bram_ena_1),
        .enb(bram_ena_1),
        .rsta(rst_0_1),
        .rstb(rst_0_1),
        .wea({inPlaceNTT_DIF_preco_0_vec_rsc_wea,inPlaceNTT_DIF_preco_0_vec_rsc_wea,inPlaceNTT_DIF_preco_0_vec_rsc_wea,inPlaceNTT_DIF_preco_0_vec_rsc_wea}),
        .web({inPlaceNTT_DIF_preco_0_vec_rsc_web,inPlaceNTT_DIF_preco_0_vec_rsc_web,inPlaceNTT_DIF_preco_0_vec_rsc_web,inPlaceNTT_DIF_preco_0_vec_rsc_web}));
  top_blk_mem_gen_0_1 blk_mem_gen_1
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_preco_0_twiddle_rsc_adra}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_preco_0_twiddle_rsc_adrb}),
        .clka(Net),
        .clkb(Net),
        .dina(inPlaceNTT_DIF_preco_0_twiddle_rsc_da),
        .dinb(inPlaceNTT_DIF_preco_0_twiddle_rsc_db),
        .douta(blk_mem_gen_1_douta),
        .doutb(blk_mem_gen_1_doutb),
        .ena(bram_ena_1),
        .enb(bram_ena_1),
        .rsta(rst_0_1),
        .rstb(rst_0_1),
        .wea({inPlaceNTT_DIF_preco_0_twiddle_rsc_wea,inPlaceNTT_DIF_preco_0_twiddle_rsc_wea,inPlaceNTT_DIF_preco_0_twiddle_rsc_wea,inPlaceNTT_DIF_preco_0_twiddle_rsc_wea}),
        .web({inPlaceNTT_DIF_preco_0_twiddle_rsc_web,inPlaceNTT_DIF_preco_0_twiddle_rsc_web,inPlaceNTT_DIF_preco_0_twiddle_rsc_web,inPlaceNTT_DIF_preco_0_twiddle_rsc_web}));
  top_blk_mem_gen_1_2 blk_mem_gen_2
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_adra}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_adrb}),
        .clka(Net),
        .clkb(Net),
        .dina(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_da),
        .dinb(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_db),
        .douta(blk_mem_gen_2_douta),
        .doutb(blk_mem_gen_2_doutb),
        .ena(bram_ena_1),
        .enb(bram_ena_1),
        .rsta(rst_0_1),
        .rstb(rst_0_1),
        .wea({inPlaceNTT_DIF_preco_0_twiddle_h_rsc_wea,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_wea,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_wea,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_wea}),
        .web({inPlaceNTT_DIF_preco_0_twiddle_h_rsc_web,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_web,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_web,inPlaceNTT_DIF_preco_0_twiddle_h_rsc_web}));
  top_inPlaceNTT_DIF_preco_0_0 inPlaceNTT_DIF_preco_0
       (.clk(Net),
        .complete_rsc_rdy(complete_rdy_in_1),
        .complete_rsc_vld(inPlaceNTT_DIF_preco_0_complete_rsc_vld),
        .p_rsc_dat(p_rsc_dat_1),
        .r_rsc_dat(r_rsc_dat_1),
        .rst(rst_0_1),
        .run_rsc_rdy(inPlaceNTT_DIF_preco_0_run_rsc_rdy),
        .run_rsc_vld(run_rsc_vld_1),
        .twiddle_h_rsc_adra(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_adra),
        .twiddle_h_rsc_adrb(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_adrb),
        .twiddle_h_rsc_da(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_da),
        .twiddle_h_rsc_db(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_db),
        .twiddle_h_rsc_qa(blk_mem_gen_2_douta),
        .twiddle_h_rsc_qb(blk_mem_gen_2_doutb),
        .twiddle_h_rsc_wea(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_wea),
        .twiddle_h_rsc_web(inPlaceNTT_DIF_preco_0_twiddle_h_rsc_web),
        .twiddle_rsc_adra(inPlaceNTT_DIF_preco_0_twiddle_rsc_adra),
        .twiddle_rsc_adrb(inPlaceNTT_DIF_preco_0_twiddle_rsc_adrb),
        .twiddle_rsc_da(inPlaceNTT_DIF_preco_0_twiddle_rsc_da),
        .twiddle_rsc_db(inPlaceNTT_DIF_preco_0_twiddle_rsc_db),
        .twiddle_rsc_qa(blk_mem_gen_1_douta),
        .twiddle_rsc_qb(blk_mem_gen_1_doutb),
        .twiddle_rsc_wea(inPlaceNTT_DIF_preco_0_twiddle_rsc_wea),
        .twiddle_rsc_web(inPlaceNTT_DIF_preco_0_twiddle_rsc_web),
        .vec_rsc_adra(inPlaceNTT_DIF_preco_0_vec_rsc_adra),
        .vec_rsc_adrb(inPlaceNTT_DIF_preco_0_vec_rsc_adrb),
        .vec_rsc_da(inPlaceNTT_DIF_preco_0_vec_rsc_da),
        .vec_rsc_db(inPlaceNTT_DIF_preco_0_vec_rsc_db),
        .vec_rsc_qa(blk_mem_gen_0_douta),
        .vec_rsc_qb(blk_mem_gen_0_doutb),
        .vec_rsc_wea(inPlaceNTT_DIF_preco_0_vec_rsc_wea),
        .vec_rsc_web(inPlaceNTT_DIF_preco_0_vec_rsc_web));
endmodule
