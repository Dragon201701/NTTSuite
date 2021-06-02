//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Jun  1 20:38:03 2021
//Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
//Command     : generate_target NTT_wrapper.bd
//Design      : NTT_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module NTT_wrapper
   (diff_clock_rtl_0_clk_n,
    diff_clock_rtl_0_clk_p,
    pcie_7x_mgt_rxn,
    pcie_7x_mgt_rxp,
    pcie_7x_mgt_txn,
    pcie_7x_mgt_txp,
    reset_rtl_0);
  input [0:0]diff_clock_rtl_0_clk_n;
  input [0:0]diff_clock_rtl_0_clk_p;
  input [7:0]pcie_7x_mgt_rxn;
  input [7:0]pcie_7x_mgt_rxp;
  output [7:0]pcie_7x_mgt_txn;
  output [7:0]pcie_7x_mgt_txp;
  input reset_rtl_0;

  wire [0:0]diff_clock_rtl_0_clk_n;
  wire [0:0]diff_clock_rtl_0_clk_p;
  wire [7:0]pcie_7x_mgt_rxn;
  wire [7:0]pcie_7x_mgt_rxp;
  wire [7:0]pcie_7x_mgt_txn;
  wire [7:0]pcie_7x_mgt_txp;
  wire reset_rtl_0;

  NTT NTT_i
       (.diff_clock_rtl_0_clk_n(diff_clock_rtl_0_clk_n),
        .diff_clock_rtl_0_clk_p(diff_clock_rtl_0_clk_p),
        .pcie_7x_mgt_rxn(pcie_7x_mgt_rxn),
        .pcie_7x_mgt_rxp(pcie_7x_mgt_rxp),
        .pcie_7x_mgt_txn(pcie_7x_mgt_txn),
        .pcie_7x_mgt_txp(pcie_7x_mgt_txp),
        .reset_rtl_0(reset_rtl_0));
endmodule
