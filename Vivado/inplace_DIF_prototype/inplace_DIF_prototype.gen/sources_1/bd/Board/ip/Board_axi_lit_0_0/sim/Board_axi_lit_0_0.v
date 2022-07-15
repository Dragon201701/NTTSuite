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


// IP VLNV: xilinx.com:module_ref:axi_lit:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Board_axi_lit_0_0 (
  ACLK,
  ARESETN,
  AWADDR,
  AWVALID,
  AWREADY,
  WDATA,
  WSTRB,
  WVALID,
  WREADY,
  BRESP,
  BVALID,
  BREADY,
  ARADDR,
  ARVALID,
  ARREADY,
  RDATA,
  RRESP,
  RVALID,
  RREADY,
  p_rsc_dat,
  r_rsc_dat,
  ac_sync_run,
  ac_sync_complete_rsc_vzout,
  ac_sync_complete,
  ac_sync_run_rsc_lzin,
  vec_rsc_triosy_0_0_lz,
  vec_rsc_triosy_0_1_lz,
  vec_rsc_triosy_0_2_lz,
  vec_rsc_triosy_0_3_lz,
  vec_rsc_triosy_0_4_lz,
  vec_rsc_triosy_0_5_lz,
  vec_rsc_triosy_0_6_lz,
  vec_rsc_triosy_0_7_lz,
  p_rsc_triosy_lz,
  r_rsc_triosy_lz,
  twiddle_rsc_triosy_0_0_lz,
  twiddle_rsc_triosy_0_1_lz,
  twiddle_rsc_triosy_0_2_lz,
  twiddle_rsc_triosy_0_3_lz,
  twiddle_h_rsc_triosy_0_0_lz,
  twiddle_h_rsc_triosy_0_1_lz,
  twiddle_h_rsc_triosy_0_2_lz,
  twiddle_h_rsc_triosy_0_3_lz
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF interface_aximm, ASSOCIATED_RESET ARESETN, FREQ_HZ 62500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ACLK CLK" *)
input wire ACLK;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ARESETN RST" *)
input wire ARESETN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR" *)
input wire [31 : 0] AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID" *)
input wire AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY" *)
output wire AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WDATA" *)
input wire [31 : 0] WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB" *)
input wire [3 : 0] WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WVALID" *)
input wire WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WREADY" *)
output wire WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BRESP" *)
output wire [1 : 0] BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BVALID" *)
output wire BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BREADY" *)
input wire BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR" *)
input wire [31 : 0] ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID" *)
input wire ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY" *)
output wire ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RDATA" *)
output wire [31 : 0] RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RRESP" *)
output wire [1 : 0] RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RVALID" *)
output wire RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interface_aximm, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 62500000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, NUM_READ_THREADS 1, N\
UM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RREADY" *)
input wire RREADY;
output wire [31 : 0] p_rsc_dat;
output wire [31 : 0] r_rsc_dat;
output wire ac_sync_run;
output wire ac_sync_complete_rsc_vzout;
input wire ac_sync_complete;
input wire ac_sync_run_rsc_lzin;
input wire vec_rsc_triosy_0_0_lz;
input wire vec_rsc_triosy_0_1_lz;
input wire vec_rsc_triosy_0_2_lz;
input wire vec_rsc_triosy_0_3_lz;
input wire vec_rsc_triosy_0_4_lz;
input wire vec_rsc_triosy_0_5_lz;
input wire vec_rsc_triosy_0_6_lz;
input wire vec_rsc_triosy_0_7_lz;
input wire p_rsc_triosy_lz;
input wire r_rsc_triosy_lz;
input wire twiddle_rsc_triosy_0_0_lz;
input wire twiddle_rsc_triosy_0_1_lz;
input wire twiddle_rsc_triosy_0_2_lz;
input wire twiddle_rsc_triosy_0_3_lz;
input wire twiddle_h_rsc_triosy_0_0_lz;
input wire twiddle_h_rsc_triosy_0_1_lz;
input wire twiddle_h_rsc_triosy_0_2_lz;
input wire twiddle_h_rsc_triosy_0_3_lz;

  axi_lit #(
    .C_ADDR_WIDTH(32),
    .C_DATA_WIDTH(32)
  ) inst (
    .ACLK(ACLK),
    .ARESETN(ARESETN),
    .AWADDR(AWADDR),
    .AWVALID(AWVALID),
    .AWREADY(AWREADY),
    .WDATA(WDATA),
    .WSTRB(WSTRB),
    .WVALID(WVALID),
    .WREADY(WREADY),
    .BRESP(BRESP),
    .BVALID(BVALID),
    .BREADY(BREADY),
    .ARADDR(ARADDR),
    .ARVALID(ARVALID),
    .ARREADY(ARREADY),
    .RDATA(RDATA),
    .RRESP(RRESP),
    .RVALID(RVALID),
    .RREADY(RREADY),
    .p_rsc_dat(p_rsc_dat),
    .r_rsc_dat(r_rsc_dat),
    .ac_sync_run(ac_sync_run),
    .ac_sync_complete_rsc_vzout(ac_sync_complete_rsc_vzout),
    .ac_sync_complete(ac_sync_complete),
    .ac_sync_run_rsc_lzin(ac_sync_run_rsc_lzin),
    .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
    .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
    .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
    .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
    .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
    .vec_rsc_triosy_0_5_lz(vec_rsc_triosy_0_5_lz),
    .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
    .vec_rsc_triosy_0_7_lz(vec_rsc_triosy_0_7_lz),
    .p_rsc_triosy_lz(p_rsc_triosy_lz),
    .r_rsc_triosy_lz(r_rsc_triosy_lz),
    .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
    .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
    .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
    .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
    .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
    .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
    .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
    .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz)
  );
endmodule
