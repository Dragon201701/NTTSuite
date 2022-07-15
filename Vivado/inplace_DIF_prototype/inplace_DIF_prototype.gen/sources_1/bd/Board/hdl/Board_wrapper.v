//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Thu Jul 14 23:12:39 2022
//Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
//Command     : generate_target Board_wrapper.bd
//Design      : Board_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Board_wrapper
   (CLK_IN_D_clk_n,
    CLK_IN_D_clk_p,
    pcie_7x_mgt_rxn,
    pcie_7x_mgt_rxp,
    pcie_7x_mgt_txn,
    pcie_7x_mgt_txp,
    refclk,
    sys_rst_n);
  input [0:0]CLK_IN_D_clk_n;
  input [0:0]CLK_IN_D_clk_p;
  input [0:0]pcie_7x_mgt_rxn;
  input [0:0]pcie_7x_mgt_rxp;
  output [0:0]pcie_7x_mgt_txn;
  output [0:0]pcie_7x_mgt_txp;
  input refclk;
  input sys_rst_n;

  wire [0:0]CLK_IN_D_clk_n;
  wire [0:0]CLK_IN_D_clk_p;
  wire [0:0]pcie_7x_mgt_rxn;
  wire [0:0]pcie_7x_mgt_rxp;
  wire [0:0]pcie_7x_mgt_txn;
  wire [0:0]pcie_7x_mgt_txp;
  wire refclk;
  wire sys_rst_n;

  Board Board_i
       (.CLK_IN_D_clk_n(CLK_IN_D_clk_n),
        .CLK_IN_D_clk_p(CLK_IN_D_clk_p),
        .pcie_7x_mgt_rxn(pcie_7x_mgt_rxn),
        .pcie_7x_mgt_rxp(pcie_7x_mgt_rxp),
        .pcie_7x_mgt_txn(pcie_7x_mgt_txn),
        .pcie_7x_mgt_txp(pcie_7x_mgt_txp),
        .refclk(refclk),
        .sys_rst_n(sys_rst_n));
endmodule
