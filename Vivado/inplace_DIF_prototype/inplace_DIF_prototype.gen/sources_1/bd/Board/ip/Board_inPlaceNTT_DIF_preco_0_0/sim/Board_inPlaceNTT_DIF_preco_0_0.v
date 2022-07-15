// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:inPlaceNTT_DIF_precomp:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Board_inPlaceNTT_DIF_preco_0_0 (
  clk,
  rst,
  run_rsc_lzin,
  run_rsc_vzin,
  vec_rsc_0_0_adr,
  vec_rsc_0_0_d,
  vec_rsc_0_0_we,
  vec_rsc_0_0_q,
  vec_rsc_triosy_0_0_lz,
  vec_rsc_0_1_adr,
  vec_rsc_0_1_d,
  vec_rsc_0_1_we,
  vec_rsc_0_1_q,
  vec_rsc_triosy_0_1_lz,
  vec_rsc_0_2_adr,
  vec_rsc_0_2_d,
  vec_rsc_0_2_we,
  vec_rsc_0_2_q,
  vec_rsc_triosy_0_2_lz,
  vec_rsc_0_3_adr,
  vec_rsc_0_3_d,
  vec_rsc_0_3_we,
  vec_rsc_0_3_q,
  vec_rsc_triosy_0_3_lz,
  vec_rsc_0_4_adr,
  vec_rsc_0_4_d,
  vec_rsc_0_4_we,
  vec_rsc_0_4_q,
  vec_rsc_triosy_0_4_lz,
  vec_rsc_0_5_adr,
  vec_rsc_0_5_d,
  vec_rsc_0_5_we,
  vec_rsc_0_5_q,
  vec_rsc_triosy_0_5_lz,
  vec_rsc_0_6_adr,
  vec_rsc_0_6_d,
  vec_rsc_0_6_we,
  vec_rsc_0_6_q,
  vec_rsc_triosy_0_6_lz,
  vec_rsc_0_7_adr,
  vec_rsc_0_7_d,
  vec_rsc_0_7_we,
  vec_rsc_0_7_q,
  vec_rsc_triosy_0_7_lz,
  p_rsc_dat,
  p_rsc_triosy_lz,
  r_rsc_dat,
  r_rsc_triosy_lz,
  twiddle_rsc_0_0_adra,
  twiddle_rsc_0_0_da,
  twiddle_rsc_0_0_wea,
  twiddle_rsc_0_0_qa,
  twiddle_rsc_0_0_adrb,
  twiddle_rsc_0_0_db,
  twiddle_rsc_0_0_web,
  twiddle_rsc_0_0_qb,
  twiddle_rsc_triosy_0_0_lz,
  twiddle_rsc_0_1_adra,
  twiddle_rsc_0_1_da,
  twiddle_rsc_0_1_wea,
  twiddle_rsc_0_1_qa,
  twiddle_rsc_0_1_adrb,
  twiddle_rsc_0_1_db,
  twiddle_rsc_0_1_web,
  twiddle_rsc_0_1_qb,
  twiddle_rsc_triosy_0_1_lz,
  twiddle_rsc_0_2_adra,
  twiddle_rsc_0_2_da,
  twiddle_rsc_0_2_wea,
  twiddle_rsc_0_2_qa,
  twiddle_rsc_0_2_adrb,
  twiddle_rsc_0_2_db,
  twiddle_rsc_0_2_web,
  twiddle_rsc_0_2_qb,
  twiddle_rsc_triosy_0_2_lz,
  twiddle_rsc_0_3_adra,
  twiddle_rsc_0_3_da,
  twiddle_rsc_0_3_wea,
  twiddle_rsc_0_3_qa,
  twiddle_rsc_0_3_adrb,
  twiddle_rsc_0_3_db,
  twiddle_rsc_0_3_web,
  twiddle_rsc_0_3_qb,
  twiddle_rsc_triosy_0_3_lz,
  twiddle_h_rsc_0_0_adra,
  twiddle_h_rsc_0_0_da,
  twiddle_h_rsc_0_0_wea,
  twiddle_h_rsc_0_0_qa,
  twiddle_h_rsc_0_0_adrb,
  twiddle_h_rsc_0_0_db,
  twiddle_h_rsc_0_0_web,
  twiddle_h_rsc_0_0_qb,
  twiddle_h_rsc_triosy_0_0_lz,
  twiddle_h_rsc_0_1_adra,
  twiddle_h_rsc_0_1_da,
  twiddle_h_rsc_0_1_wea,
  twiddle_h_rsc_0_1_qa,
  twiddle_h_rsc_0_1_adrb,
  twiddle_h_rsc_0_1_db,
  twiddle_h_rsc_0_1_web,
  twiddle_h_rsc_0_1_qb,
  twiddle_h_rsc_triosy_0_1_lz,
  twiddle_h_rsc_0_2_adra,
  twiddle_h_rsc_0_2_da,
  twiddle_h_rsc_0_2_wea,
  twiddle_h_rsc_0_2_qa,
  twiddle_h_rsc_0_2_adrb,
  twiddle_h_rsc_0_2_db,
  twiddle_h_rsc_0_2_web,
  twiddle_h_rsc_0_2_qb,
  twiddle_h_rsc_triosy_0_2_lz,
  twiddle_h_rsc_0_3_adra,
  twiddle_h_rsc_0_3_da,
  twiddle_h_rsc_0_3_wea,
  twiddle_h_rsc_0_3_qa,
  twiddle_h_rsc_0_3_adrb,
  twiddle_h_rsc_0_3_db,
  twiddle_h_rsc_0_3_web,
  twiddle_h_rsc_0_3_qb,
  twiddle_h_rsc_triosy_0_3_lz,
  complete_rsc_lzout,
  complete_rsc_vzout
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 62500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
output wire run_rsc_lzin;
input wire run_rsc_vzin;
output wire [6 : 0] vec_rsc_0_0_adr;
output wire [31 : 0] vec_rsc_0_0_d;
output wire vec_rsc_0_0_we;
input wire [31 : 0] vec_rsc_0_0_q;
output wire vec_rsc_triosy_0_0_lz;
output wire [6 : 0] vec_rsc_0_1_adr;
output wire [31 : 0] vec_rsc_0_1_d;
output wire vec_rsc_0_1_we;
input wire [31 : 0] vec_rsc_0_1_q;
output wire vec_rsc_triosy_0_1_lz;
output wire [6 : 0] vec_rsc_0_2_adr;
output wire [31 : 0] vec_rsc_0_2_d;
output wire vec_rsc_0_2_we;
input wire [31 : 0] vec_rsc_0_2_q;
output wire vec_rsc_triosy_0_2_lz;
output wire [6 : 0] vec_rsc_0_3_adr;
output wire [31 : 0] vec_rsc_0_3_d;
output wire vec_rsc_0_3_we;
input wire [31 : 0] vec_rsc_0_3_q;
output wire vec_rsc_triosy_0_3_lz;
output wire [6 : 0] vec_rsc_0_4_adr;
output wire [31 : 0] vec_rsc_0_4_d;
output wire vec_rsc_0_4_we;
input wire [31 : 0] vec_rsc_0_4_q;
output wire vec_rsc_triosy_0_4_lz;
output wire [6 : 0] vec_rsc_0_5_adr;
output wire [31 : 0] vec_rsc_0_5_d;
output wire vec_rsc_0_5_we;
input wire [31 : 0] vec_rsc_0_5_q;
output wire vec_rsc_triosy_0_5_lz;
output wire [6 : 0] vec_rsc_0_6_adr;
output wire [31 : 0] vec_rsc_0_6_d;
output wire vec_rsc_0_6_we;
input wire [31 : 0] vec_rsc_0_6_q;
output wire vec_rsc_triosy_0_6_lz;
output wire [6 : 0] vec_rsc_0_7_adr;
output wire [31 : 0] vec_rsc_0_7_d;
output wire vec_rsc_0_7_we;
input wire [31 : 0] vec_rsc_0_7_q;
output wire vec_rsc_triosy_0_7_lz;
input wire [31 : 0] p_rsc_dat;
output wire p_rsc_triosy_lz;
input wire [31 : 0] r_rsc_dat;
output wire r_rsc_triosy_lz;
output wire [7 : 0] twiddle_rsc_0_0_adra;
output wire [31 : 0] twiddle_rsc_0_0_da;
output wire twiddle_rsc_0_0_wea;
input wire [31 : 0] twiddle_rsc_0_0_qa;
output wire [7 : 0] twiddle_rsc_0_0_adrb;
output wire [31 : 0] twiddle_rsc_0_0_db;
output wire twiddle_rsc_0_0_web;
input wire [31 : 0] twiddle_rsc_0_0_qb;
output wire twiddle_rsc_triosy_0_0_lz;
output wire [7 : 0] twiddle_rsc_0_1_adra;
output wire [31 : 0] twiddle_rsc_0_1_da;
output wire twiddle_rsc_0_1_wea;
input wire [31 : 0] twiddle_rsc_0_1_qa;
output wire [7 : 0] twiddle_rsc_0_1_adrb;
output wire [31 : 0] twiddle_rsc_0_1_db;
output wire twiddle_rsc_0_1_web;
input wire [31 : 0] twiddle_rsc_0_1_qb;
output wire twiddle_rsc_triosy_0_1_lz;
output wire [7 : 0] twiddle_rsc_0_2_adra;
output wire [31 : 0] twiddle_rsc_0_2_da;
output wire twiddle_rsc_0_2_wea;
input wire [31 : 0] twiddle_rsc_0_2_qa;
output wire [7 : 0] twiddle_rsc_0_2_adrb;
output wire [31 : 0] twiddle_rsc_0_2_db;
output wire twiddle_rsc_0_2_web;
input wire [31 : 0] twiddle_rsc_0_2_qb;
output wire twiddle_rsc_triosy_0_2_lz;
output wire [7 : 0] twiddle_rsc_0_3_adra;
output wire [31 : 0] twiddle_rsc_0_3_da;
output wire twiddle_rsc_0_3_wea;
input wire [31 : 0] twiddle_rsc_0_3_qa;
output wire [7 : 0] twiddle_rsc_0_3_adrb;
output wire [31 : 0] twiddle_rsc_0_3_db;
output wire twiddle_rsc_0_3_web;
input wire [31 : 0] twiddle_rsc_0_3_qb;
output wire twiddle_rsc_triosy_0_3_lz;
output wire [7 : 0] twiddle_h_rsc_0_0_adra;
output wire [31 : 0] twiddle_h_rsc_0_0_da;
output wire twiddle_h_rsc_0_0_wea;
input wire [31 : 0] twiddle_h_rsc_0_0_qa;
output wire [7 : 0] twiddle_h_rsc_0_0_adrb;
output wire [31 : 0] twiddle_h_rsc_0_0_db;
output wire twiddle_h_rsc_0_0_web;
input wire [31 : 0] twiddle_h_rsc_0_0_qb;
output wire twiddle_h_rsc_triosy_0_0_lz;
output wire [7 : 0] twiddle_h_rsc_0_1_adra;
output wire [31 : 0] twiddle_h_rsc_0_1_da;
output wire twiddle_h_rsc_0_1_wea;
input wire [31 : 0] twiddle_h_rsc_0_1_qa;
output wire [7 : 0] twiddle_h_rsc_0_1_adrb;
output wire [31 : 0] twiddle_h_rsc_0_1_db;
output wire twiddle_h_rsc_0_1_web;
input wire [31 : 0] twiddle_h_rsc_0_1_qb;
output wire twiddle_h_rsc_triosy_0_1_lz;
output wire [7 : 0] twiddle_h_rsc_0_2_adra;
output wire [31 : 0] twiddle_h_rsc_0_2_da;
output wire twiddle_h_rsc_0_2_wea;
input wire [31 : 0] twiddle_h_rsc_0_2_qa;
output wire [7 : 0] twiddle_h_rsc_0_2_adrb;
output wire [31 : 0] twiddle_h_rsc_0_2_db;
output wire twiddle_h_rsc_0_2_web;
input wire [31 : 0] twiddle_h_rsc_0_2_qb;
output wire twiddle_h_rsc_triosy_0_2_lz;
output wire [7 : 0] twiddle_h_rsc_0_3_adra;
output wire [31 : 0] twiddle_h_rsc_0_3_da;
output wire twiddle_h_rsc_0_3_wea;
input wire [31 : 0] twiddle_h_rsc_0_3_qa;
output wire [7 : 0] twiddle_h_rsc_0_3_adrb;
output wire [31 : 0] twiddle_h_rsc_0_3_db;
output wire twiddle_h_rsc_0_3_web;
input wire [31 : 0] twiddle_h_rsc_0_3_qb;
output wire twiddle_h_rsc_triosy_0_3_lz;
output wire complete_rsc_lzout;
input wire complete_rsc_vzout;

  inPlaceNTT_DIF_precomp inst (
    .clk(clk),
    .rst(rst),
    .run_rsc_lzin(run_rsc_lzin),
    .run_rsc_vzin(run_rsc_vzin),
    .vec_rsc_0_0_adr(vec_rsc_0_0_adr),
    .vec_rsc_0_0_d(vec_rsc_0_0_d),
    .vec_rsc_0_0_we(vec_rsc_0_0_we),
    .vec_rsc_0_0_q(vec_rsc_0_0_q),
    .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
    .vec_rsc_0_1_adr(vec_rsc_0_1_adr),
    .vec_rsc_0_1_d(vec_rsc_0_1_d),
    .vec_rsc_0_1_we(vec_rsc_0_1_we),
    .vec_rsc_0_1_q(vec_rsc_0_1_q),
    .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
    .vec_rsc_0_2_adr(vec_rsc_0_2_adr),
    .vec_rsc_0_2_d(vec_rsc_0_2_d),
    .vec_rsc_0_2_we(vec_rsc_0_2_we),
    .vec_rsc_0_2_q(vec_rsc_0_2_q),
    .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
    .vec_rsc_0_3_adr(vec_rsc_0_3_adr),
    .vec_rsc_0_3_d(vec_rsc_0_3_d),
    .vec_rsc_0_3_we(vec_rsc_0_3_we),
    .vec_rsc_0_3_q(vec_rsc_0_3_q),
    .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
    .vec_rsc_0_4_adr(vec_rsc_0_4_adr),
    .vec_rsc_0_4_d(vec_rsc_0_4_d),
    .vec_rsc_0_4_we(vec_rsc_0_4_we),
    .vec_rsc_0_4_q(vec_rsc_0_4_q),
    .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
    .vec_rsc_0_5_adr(vec_rsc_0_5_adr),
    .vec_rsc_0_5_d(vec_rsc_0_5_d),
    .vec_rsc_0_5_we(vec_rsc_0_5_we),
    .vec_rsc_0_5_q(vec_rsc_0_5_q),
    .vec_rsc_triosy_0_5_lz(vec_rsc_triosy_0_5_lz),
    .vec_rsc_0_6_adr(vec_rsc_0_6_adr),
    .vec_rsc_0_6_d(vec_rsc_0_6_d),
    .vec_rsc_0_6_we(vec_rsc_0_6_we),
    .vec_rsc_0_6_q(vec_rsc_0_6_q),
    .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
    .vec_rsc_0_7_adr(vec_rsc_0_7_adr),
    .vec_rsc_0_7_d(vec_rsc_0_7_d),
    .vec_rsc_0_7_we(vec_rsc_0_7_we),
    .vec_rsc_0_7_q(vec_rsc_0_7_q),
    .vec_rsc_triosy_0_7_lz(vec_rsc_triosy_0_7_lz),
    .p_rsc_dat(p_rsc_dat),
    .p_rsc_triosy_lz(p_rsc_triosy_lz),
    .r_rsc_dat(r_rsc_dat),
    .r_rsc_triosy_lz(r_rsc_triosy_lz),
    .twiddle_rsc_0_0_adra(twiddle_rsc_0_0_adra),
    .twiddle_rsc_0_0_da(twiddle_rsc_0_0_da),
    .twiddle_rsc_0_0_wea(twiddle_rsc_0_0_wea),
    .twiddle_rsc_0_0_qa(twiddle_rsc_0_0_qa),
    .twiddle_rsc_0_0_adrb(twiddle_rsc_0_0_adrb),
    .twiddle_rsc_0_0_db(twiddle_rsc_0_0_db),
    .twiddle_rsc_0_0_web(twiddle_rsc_0_0_web),
    .twiddle_rsc_0_0_qb(twiddle_rsc_0_0_qb),
    .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
    .twiddle_rsc_0_1_adra(twiddle_rsc_0_1_adra),
    .twiddle_rsc_0_1_da(twiddle_rsc_0_1_da),
    .twiddle_rsc_0_1_wea(twiddle_rsc_0_1_wea),
    .twiddle_rsc_0_1_qa(twiddle_rsc_0_1_qa),
    .twiddle_rsc_0_1_adrb(twiddle_rsc_0_1_adrb),
    .twiddle_rsc_0_1_db(twiddle_rsc_0_1_db),
    .twiddle_rsc_0_1_web(twiddle_rsc_0_1_web),
    .twiddle_rsc_0_1_qb(twiddle_rsc_0_1_qb),
    .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
    .twiddle_rsc_0_2_adra(twiddle_rsc_0_2_adra),
    .twiddle_rsc_0_2_da(twiddle_rsc_0_2_da),
    .twiddle_rsc_0_2_wea(twiddle_rsc_0_2_wea),
    .twiddle_rsc_0_2_qa(twiddle_rsc_0_2_qa),
    .twiddle_rsc_0_2_adrb(twiddle_rsc_0_2_adrb),
    .twiddle_rsc_0_2_db(twiddle_rsc_0_2_db),
    .twiddle_rsc_0_2_web(twiddle_rsc_0_2_web),
    .twiddle_rsc_0_2_qb(twiddle_rsc_0_2_qb),
    .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
    .twiddle_rsc_0_3_adra(twiddle_rsc_0_3_adra),
    .twiddle_rsc_0_3_da(twiddle_rsc_0_3_da),
    .twiddle_rsc_0_3_wea(twiddle_rsc_0_3_wea),
    .twiddle_rsc_0_3_qa(twiddle_rsc_0_3_qa),
    .twiddle_rsc_0_3_adrb(twiddle_rsc_0_3_adrb),
    .twiddle_rsc_0_3_db(twiddle_rsc_0_3_db),
    .twiddle_rsc_0_3_web(twiddle_rsc_0_3_web),
    .twiddle_rsc_0_3_qb(twiddle_rsc_0_3_qb),
    .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
    .twiddle_h_rsc_0_0_adra(twiddle_h_rsc_0_0_adra),
    .twiddle_h_rsc_0_0_da(twiddle_h_rsc_0_0_da),
    .twiddle_h_rsc_0_0_wea(twiddle_h_rsc_0_0_wea),
    .twiddle_h_rsc_0_0_qa(twiddle_h_rsc_0_0_qa),
    .twiddle_h_rsc_0_0_adrb(twiddle_h_rsc_0_0_adrb),
    .twiddle_h_rsc_0_0_db(twiddle_h_rsc_0_0_db),
    .twiddle_h_rsc_0_0_web(twiddle_h_rsc_0_0_web),
    .twiddle_h_rsc_0_0_qb(twiddle_h_rsc_0_0_qb),
    .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
    .twiddle_h_rsc_0_1_adra(twiddle_h_rsc_0_1_adra),
    .twiddle_h_rsc_0_1_da(twiddle_h_rsc_0_1_da),
    .twiddle_h_rsc_0_1_wea(twiddle_h_rsc_0_1_wea),
    .twiddle_h_rsc_0_1_qa(twiddle_h_rsc_0_1_qa),
    .twiddle_h_rsc_0_1_adrb(twiddle_h_rsc_0_1_adrb),
    .twiddle_h_rsc_0_1_db(twiddle_h_rsc_0_1_db),
    .twiddle_h_rsc_0_1_web(twiddle_h_rsc_0_1_web),
    .twiddle_h_rsc_0_1_qb(twiddle_h_rsc_0_1_qb),
    .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
    .twiddle_h_rsc_0_2_adra(twiddle_h_rsc_0_2_adra),
    .twiddle_h_rsc_0_2_da(twiddle_h_rsc_0_2_da),
    .twiddle_h_rsc_0_2_wea(twiddle_h_rsc_0_2_wea),
    .twiddle_h_rsc_0_2_qa(twiddle_h_rsc_0_2_qa),
    .twiddle_h_rsc_0_2_adrb(twiddle_h_rsc_0_2_adrb),
    .twiddle_h_rsc_0_2_db(twiddle_h_rsc_0_2_db),
    .twiddle_h_rsc_0_2_web(twiddle_h_rsc_0_2_web),
    .twiddle_h_rsc_0_2_qb(twiddle_h_rsc_0_2_qb),
    .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
    .twiddle_h_rsc_0_3_adra(twiddle_h_rsc_0_3_adra),
    .twiddle_h_rsc_0_3_da(twiddle_h_rsc_0_3_da),
    .twiddle_h_rsc_0_3_wea(twiddle_h_rsc_0_3_wea),
    .twiddle_h_rsc_0_3_qa(twiddle_h_rsc_0_3_qa),
    .twiddle_h_rsc_0_3_adrb(twiddle_h_rsc_0_3_adrb),
    .twiddle_h_rsc_0_3_db(twiddle_h_rsc_0_3_db),
    .twiddle_h_rsc_0_3_web(twiddle_h_rsc_0_3_web),
    .twiddle_h_rsc_0_3_qb(twiddle_h_rsc_0_3_qb),
    .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz),
    .complete_rsc_lzout(complete_rsc_lzout),
    .complete_rsc_vzout(complete_rsc_vzout)
  );
endmodule
