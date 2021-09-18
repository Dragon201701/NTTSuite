// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
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
module top_inPlaceNTT_DIF_preco_0_0 (
  clk,
  rst,
  run_rsc_rdy,
  run_rsc_vld,
  vec_rsc_adra,
  vec_rsc_da,
  vec_rsc_wea,
  vec_rsc_qa,
  vec_rsc_adrb,
  vec_rsc_db,
  vec_rsc_web,
  vec_rsc_qb,
  vec_rsc_triosy_lz,
  p_rsc_dat,
  p_rsc_triosy_lz,
  r_rsc_dat,
  r_rsc_triosy_lz,
  twiddle_rsc_adra,
  twiddle_rsc_da,
  twiddle_rsc_wea,
  twiddle_rsc_qa,
  twiddle_rsc_adrb,
  twiddle_rsc_db,
  twiddle_rsc_web,
  twiddle_rsc_qb,
  twiddle_rsc_triosy_lz,
  twiddle_h_rsc_adra,
  twiddle_h_rsc_da,
  twiddle_h_rsc_wea,
  twiddle_h_rsc_qa,
  twiddle_h_rsc_adrb,
  twiddle_h_rsc_db,
  twiddle_h_rsc_web,
  twiddle_h_rsc_qb,
  twiddle_h_rsc_triosy_lz,
  complete_rsc_rdy,
  complete_rsc_vld
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
output wire run_rsc_rdy;
input wire run_rsc_vld;
output wire [11 : 0] vec_rsc_adra;
output wire [31 : 0] vec_rsc_da;
output wire vec_rsc_wea;
input wire [31 : 0] vec_rsc_qa;
output wire [11 : 0] vec_rsc_adrb;
output wire [31 : 0] vec_rsc_db;
output wire vec_rsc_web;
input wire [31 : 0] vec_rsc_qb;
output wire vec_rsc_triosy_lz;
input wire [31 : 0] p_rsc_dat;
output wire p_rsc_triosy_lz;
input wire [31 : 0] r_rsc_dat;
output wire r_rsc_triosy_lz;
output wire [11 : 0] twiddle_rsc_adra;
output wire [31 : 0] twiddle_rsc_da;
output wire twiddle_rsc_wea;
input wire [31 : 0] twiddle_rsc_qa;
output wire [11 : 0] twiddle_rsc_adrb;
output wire [31 : 0] twiddle_rsc_db;
output wire twiddle_rsc_web;
input wire [31 : 0] twiddle_rsc_qb;
output wire twiddle_rsc_triosy_lz;
output wire [11 : 0] twiddle_h_rsc_adra;
output wire [31 : 0] twiddle_h_rsc_da;
output wire twiddle_h_rsc_wea;
input wire [31 : 0] twiddle_h_rsc_qa;
output wire [11 : 0] twiddle_h_rsc_adrb;
output wire [31 : 0] twiddle_h_rsc_db;
output wire twiddle_h_rsc_web;
input wire [31 : 0] twiddle_h_rsc_qb;
output wire twiddle_h_rsc_triosy_lz;
input wire complete_rsc_rdy;
output wire complete_rsc_vld;

  inPlaceNTT_DIF_precomp inst (
    .clk(clk),
    .rst(rst),
    .run_rsc_rdy(run_rsc_rdy),
    .run_rsc_vld(run_rsc_vld),
    .vec_rsc_adra(vec_rsc_adra),
    .vec_rsc_da(vec_rsc_da),
    .vec_rsc_wea(vec_rsc_wea),
    .vec_rsc_qa(vec_rsc_qa),
    .vec_rsc_adrb(vec_rsc_adrb),
    .vec_rsc_db(vec_rsc_db),
    .vec_rsc_web(vec_rsc_web),
    .vec_rsc_qb(vec_rsc_qb),
    .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
    .p_rsc_dat(p_rsc_dat),
    .p_rsc_triosy_lz(p_rsc_triosy_lz),
    .r_rsc_dat(r_rsc_dat),
    .r_rsc_triosy_lz(r_rsc_triosy_lz),
    .twiddle_rsc_adra(twiddle_rsc_adra),
    .twiddle_rsc_da(twiddle_rsc_da),
    .twiddle_rsc_wea(twiddle_rsc_wea),
    .twiddle_rsc_qa(twiddle_rsc_qa),
    .twiddle_rsc_adrb(twiddle_rsc_adrb),
    .twiddle_rsc_db(twiddle_rsc_db),
    .twiddle_rsc_web(twiddle_rsc_web),
    .twiddle_rsc_qb(twiddle_rsc_qb),
    .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
    .twiddle_h_rsc_adra(twiddle_h_rsc_adra),
    .twiddle_h_rsc_da(twiddle_h_rsc_da),
    .twiddle_h_rsc_wea(twiddle_h_rsc_wea),
    .twiddle_h_rsc_qa(twiddle_h_rsc_qa),
    .twiddle_h_rsc_adrb(twiddle_h_rsc_adrb),
    .twiddle_h_rsc_db(twiddle_h_rsc_db),
    .twiddle_h_rsc_web(twiddle_h_rsc_web),
    .twiddle_h_rsc_qb(twiddle_h_rsc_qb),
    .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
    .complete_rsc_rdy(complete_rsc_rdy),
    .complete_rsc_vld(complete_rsc_vld)
  );
endmodule
