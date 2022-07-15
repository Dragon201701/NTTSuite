// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Jul 14 22:47:20 2022
// Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/NTT_Xilinx/Vivado/inplace_DIF_prototype/inplace_DIF_prototype.gen/sources_1/bd/Board/ip/Board_axi_lit_0_0/Board_axi_lit_0_0_sim_netlist.v
// Design      : Board_axi_lit_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvb2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Board_axi_lit_0_0,axi_lit,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axi_lit,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module Board_axi_lit_0_0
   (ACLK,
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
    twiddle_h_rsc_triosy_0_3_lz);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF interface_aximm, ASSOCIATED_RESET ARESETN, FREQ_HZ 62500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, INSERT_VIP 0" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR" *) input [31:0]AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID" *) input AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY" *) output AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WDATA" *) input [31:0]WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB" *) input [3:0]WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WVALID" *) input WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WREADY" *) output WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BRESP" *) output [1:0]BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BVALID" *) output BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BREADY" *) input BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR" *) input [31:0]ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID" *) input ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY" *) output ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RDATA" *) output [31:0]RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RRESP" *) output [1:0]RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RVALID" *) output RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interface_aximm, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 62500000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input RREADY;
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

  wire \<const0> ;
  wire ACLK;
  wire [31:0]ARADDR;
  wire ARESETN;
  wire ARREADY;
  wire ARVALID;
  wire [31:0]AWADDR;
  wire AWREADY;
  wire AWVALID;
  wire BREADY;
  wire BVALID;
  wire [19:0]\^RDATA ;
  wire RREADY;
  wire RVALID;
  wire [31:0]WDATA;
  wire WREADY;
  wire [3:0]WSTRB;
  wire WVALID;
  wire ac_sync_complete;
  wire ac_sync_complete_rsc_vzout;
  wire ac_sync_run;
  wire ac_sync_run_rsc_lzin;
  wire [31:0]p_rsc_dat;
  wire p_rsc_triosy_lz;
  wire [31:0]r_rsc_dat;
  wire r_rsc_triosy_lz;
  wire twiddle_h_rsc_triosy_0_0_lz;
  wire twiddle_h_rsc_triosy_0_1_lz;
  wire twiddle_h_rsc_triosy_0_2_lz;
  wire twiddle_h_rsc_triosy_0_3_lz;
  wire twiddle_rsc_triosy_0_0_lz;
  wire twiddle_rsc_triosy_0_1_lz;
  wire twiddle_rsc_triosy_0_2_lz;
  wire twiddle_rsc_triosy_0_3_lz;
  wire vec_rsc_triosy_0_0_lz;
  wire vec_rsc_triosy_0_1_lz;
  wire vec_rsc_triosy_0_2_lz;
  wire vec_rsc_triosy_0_3_lz;
  wire vec_rsc_triosy_0_4_lz;
  wire vec_rsc_triosy_0_5_lz;
  wire vec_rsc_triosy_0_6_lz;
  wire vec_rsc_triosy_0_7_lz;

  assign BRESP[1] = \<const0> ;
  assign BRESP[0] = \<const0> ;
  assign RDATA[31] = \<const0> ;
  assign RDATA[30] = \<const0> ;
  assign RDATA[29] = \<const0> ;
  assign RDATA[28] = \<const0> ;
  assign RDATA[27] = \<const0> ;
  assign RDATA[26] = \<const0> ;
  assign RDATA[25] = \<const0> ;
  assign RDATA[24] = \<const0> ;
  assign RDATA[23] = \<const0> ;
  assign RDATA[22] = \<const0> ;
  assign RDATA[21] = \<const0> ;
  assign RDATA[20] = \<const0> ;
  assign RDATA[19:0] = \^RDATA [19:0];
  assign RRESP[1] = \<const0> ;
  assign RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  Board_axi_lit_0_0_axi_lit inst
       (.ACLK(ACLK),
        .ARADDR(ARADDR[5:0]),
        .ARESETN(ARESETN),
        .ARREADY(ARREADY),
        .ARVALID(ARVALID),
        .AWADDR(AWADDR[5:0]),
        .AWREADY(AWREADY),
        .AWVALID(AWVALID),
        .BREADY(BREADY),
        .BVALID(BVALID),
        .Q({ac_sync_complete_rsc_vzout,ac_sync_run}),
        .RDATA(\^RDATA ),
        .RREADY(RREADY),
        .RVALID(RVALID),
        .WDATA(WDATA),
        .WREADY(WREADY),
        .WSTRB(WSTRB),
        .WVALID(WVALID),
        .ac_sync_complete(ac_sync_complete),
        .ac_sync_run_rsc_lzin(ac_sync_run_rsc_lzin),
        .p_rsc_dat(p_rsc_dat),
        .p_rsc_triosy_lz(p_rsc_triosy_lz),
        .r_rsc_dat(r_rsc_dat),
        .r_rsc_triosy_lz(r_rsc_triosy_lz),
        .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
        .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
        .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
        .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz),
        .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
        .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
        .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
        .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
        .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
        .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
        .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
        .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
        .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
        .vec_rsc_triosy_0_5_lz(vec_rsc_triosy_0_5_lz),
        .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
        .vec_rsc_triosy_0_7_lz(vec_rsc_triosy_0_7_lz));
endmodule

(* ORIG_REF_NAME = "axi_lit" *) 
module Board_axi_lit_0_0_axi_lit
   (RVALID,
    BVALID,
    WREADY,
    AWREADY,
    RDATA,
    p_rsc_dat,
    r_rsc_dat,
    Q,
    ARREADY,
    ARVALID,
    ACLK,
    ARADDR,
    ac_sync_complete,
    ac_sync_run_rsc_lzin,
    r_rsc_triosy_lz,
    p_rsc_triosy_lz,
    vec_rsc_triosy_0_0_lz,
    vec_rsc_triosy_0_1_lz,
    vec_rsc_triosy_0_2_lz,
    vec_rsc_triosy_0_3_lz,
    vec_rsc_triosy_0_4_lz,
    vec_rsc_triosy_0_5_lz,
    vec_rsc_triosy_0_6_lz,
    vec_rsc_triosy_0_7_lz,
    twiddle_rsc_triosy_0_0_lz,
    twiddle_rsc_triosy_0_1_lz,
    twiddle_rsc_triosy_0_2_lz,
    twiddle_rsc_triosy_0_3_lz,
    twiddle_h_rsc_triosy_0_0_lz,
    twiddle_h_rsc_triosy_0_1_lz,
    twiddle_h_rsc_triosy_0_2_lz,
    twiddle_h_rsc_triosy_0_3_lz,
    AWADDR,
    AWVALID,
    WVALID,
    BREADY,
    RREADY,
    WDATA,
    WSTRB,
    ARESETN);
  output RVALID;
  output BVALID;
  output WREADY;
  output AWREADY;
  output [19:0]RDATA;
  output [31:0]p_rsc_dat;
  output [31:0]r_rsc_dat;
  output [1:0]Q;
  output ARREADY;
  input ARVALID;
  input ACLK;
  input [5:0]ARADDR;
  input ac_sync_complete;
  input ac_sync_run_rsc_lzin;
  input r_rsc_triosy_lz;
  input p_rsc_triosy_lz;
  input vec_rsc_triosy_0_0_lz;
  input vec_rsc_triosy_0_1_lz;
  input vec_rsc_triosy_0_2_lz;
  input vec_rsc_triosy_0_3_lz;
  input vec_rsc_triosy_0_4_lz;
  input vec_rsc_triosy_0_5_lz;
  input vec_rsc_triosy_0_6_lz;
  input vec_rsc_triosy_0_7_lz;
  input twiddle_rsc_triosy_0_0_lz;
  input twiddle_rsc_triosy_0_1_lz;
  input twiddle_rsc_triosy_0_2_lz;
  input twiddle_rsc_triosy_0_3_lz;
  input twiddle_h_rsc_triosy_0_0_lz;
  input twiddle_h_rsc_triosy_0_1_lz;
  input twiddle_h_rsc_triosy_0_2_lz;
  input twiddle_h_rsc_triosy_0_3_lz;
  input [5:0]AWADDR;
  input AWVALID;
  input WVALID;
  input BREADY;
  input RREADY;
  input [31:0]WDATA;
  input [3:0]WSTRB;
  input ARESETN;

  wire ACLK;
  wire [5:0]ARADDR;
  wire ARESETN;
  wire ARREADY;
  wire ARVALID;
  wire [5:0]AWADDR;
  wire AWREADY;
  wire AWVALID;
  wire BREADY;
  wire BVALID;
  wire \FSM_onehot_wstate[0]_i_1_n_0 ;
  wire \FSM_onehot_wstate[0]_i_2_n_0 ;
  wire \FSM_onehot_wstate[1]_i_1_n_0 ;
  wire \FSM_onehot_wstate[2]_i_1_n_0 ;
  wire [1:0]Q;
  wire [19:0]RDATA;
  wire RREADY;
  wire RVALID;
  wire [31:0]WDATA;
  wire WREADY;
  wire [3:0]WSTRB;
  wire WVALID;
  wire ac_sync_complete;
  wire ac_sync_run_rsc_lzin;
  wire aw_hs;
  wire [1:0]control_w0;
  wire \control_w[0]_i_1_n_0 ;
  wire [31:0]p0;
  wire \p[31]_i_1_n_0 ;
  wire \p[31]_i_3_n_0 ;
  wire [31:0]p_rsc_dat;
  wire p_rsc_triosy_lz;
  wire [31:0]r0;
  wire \r[31]_i_1_n_0 ;
  wire [31:0]r_rsc_dat;
  wire r_rsc_triosy_lz;
  wire \rdata[0]_i_1_n_0 ;
  wire \rdata[10]_i_1_n_0 ;
  wire \rdata[11]_i_1_n_0 ;
  wire \rdata[12]_i_1_n_0 ;
  wire \rdata[13]_i_1_n_0 ;
  wire \rdata[14]_i_1_n_0 ;
  wire \rdata[15]_i_1_n_0 ;
  wire \rdata[16]_i_1_n_0 ;
  wire \rdata[17]_i_1_n_0 ;
  wire \rdata[18]_i_1_n_0 ;
  wire \rdata[19]_i_1_n_0 ;
  wire \rdata[19]_i_2_n_0 ;
  wire \rdata[19]_i_3_n_0 ;
  wire \rdata[1]_i_1_n_0 ;
  wire \rdata[2]_i_1_n_0 ;
  wire \rdata[3]_i_1_n_0 ;
  wire \rdata[4]_i_1_n_0 ;
  wire \rdata[5]_i_1_n_0 ;
  wire \rdata[6]_i_1_n_0 ;
  wire \rdata[7]_i_1_n_0 ;
  wire \rdata[8]_i_1_n_0 ;
  wire \rdata[9]_i_1_n_0 ;
  wire rnext;
  wire twiddle_h_rsc_triosy_0_0_lz;
  wire twiddle_h_rsc_triosy_0_1_lz;
  wire twiddle_h_rsc_triosy_0_2_lz;
  wire twiddle_h_rsc_triosy_0_3_lz;
  wire twiddle_rsc_triosy_0_0_lz;
  wire twiddle_rsc_triosy_0_1_lz;
  wire twiddle_rsc_triosy_0_2_lz;
  wire twiddle_rsc_triosy_0_3_lz;
  wire vec_rsc_triosy_0_0_lz;
  wire vec_rsc_triosy_0_1_lz;
  wire vec_rsc_triosy_0_2_lz;
  wire vec_rsc_triosy_0_3_lz;
  wire vec_rsc_triosy_0_4_lz;
  wire vec_rsc_triosy_0_5_lz;
  wire vec_rsc_triosy_0_6_lz;
  wire vec_rsc_triosy_0_7_lz;
  wire [5:0]waddr;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    ARREADY_INST_0
       (.I0(RVALID),
        .O(ARREADY));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[0]_i_1 
       (.I0(BVALID),
        .I1(BREADY),
        .I2(AWVALID),
        .I3(AWREADY),
        .O(\FSM_onehot_wstate[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_wstate[0]_i_2 
       (.I0(ARESETN),
        .O(\FSM_onehot_wstate[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(AWVALID),
        .I1(AWREADY),
        .I2(WVALID),
        .I3(WREADY),
        .O(\FSM_onehot_wstate[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(BREADY),
        .I1(BVALID),
        .I2(WVALID),
        .I3(WREADY),
        .O(\FSM_onehot_wstate[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRDATA:010,WRRESP:100,WRIDLE:001" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_wstate_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[0]_i_1_n_0 ),
        .PRE(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .Q(AWREADY));
  (* FSM_ENCODED_STATES = "WRDATA:010,WRRESP:100,WRIDLE:001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(\FSM_onehot_wstate[1]_i_1_n_0 ),
        .Q(WREADY));
  (* FSM_ENCODED_STATES = "WRDATA:010,WRRESP:100,WRIDLE:001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(\FSM_onehot_wstate[2]_i_1_n_0 ),
        .Q(BVALID));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h74)) 
    FSM_sequential_rstate_i_1
       (.I0(RREADY),
        .I1(RVALID),
        .I2(ARVALID),
        .O(rnext));
  (* FSM_ENCODED_STATES = "RDIDLE:0,RDDATA:1" *) 
  FDCE FSM_sequential_rstate_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(rnext),
        .Q(RVALID));
  LUT5 #(
    .INIT(32'h00000020)) 
    \control_w[0]_i_1 
       (.I0(\p[31]_i_3_n_0 ),
        .I1(waddr[3]),
        .I2(waddr[2]),
        .I3(waddr[0]),
        .I4(waddr[1]),
        .O(\control_w[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \control_w[0]_i_2 
       (.I0(WDATA[0]),
        .I1(WSTRB[0]),
        .I2(Q[0]),
        .O(control_w0[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \control_w[1]_i_1 
       (.I0(WDATA[1]),
        .I1(WSTRB[0]),
        .I2(Q[1]),
        .O(control_w0[1]));
  FDCE \control_w_reg[0] 
       (.C(ACLK),
        .CE(\control_w[0]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(control_w0[0]),
        .Q(Q[0]));
  FDCE \control_w_reg[1] 
       (.C(ACLK),
        .CE(\control_w[0]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(control_w0[1]),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[0]_i_1 
       (.I0(WDATA[0]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[0]),
        .O(p0[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[10]_i_1 
       (.I0(WDATA[10]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[10]),
        .O(p0[10]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[11]_i_1 
       (.I0(WDATA[11]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[11]),
        .O(p0[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[12]_i_1 
       (.I0(WDATA[12]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[12]),
        .O(p0[12]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[13]_i_1 
       (.I0(WDATA[13]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[13]),
        .O(p0[13]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[14]_i_1 
       (.I0(WDATA[14]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[14]),
        .O(p0[14]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[15]_i_1 
       (.I0(WDATA[15]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[15]),
        .O(p0[15]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[16]_i_1 
       (.I0(WDATA[16]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[16]),
        .O(p0[16]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[17]_i_1 
       (.I0(WDATA[17]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[17]),
        .O(p0[17]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[18]_i_1 
       (.I0(WDATA[18]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[18]),
        .O(p0[18]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[19]_i_1 
       (.I0(WDATA[19]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[19]),
        .O(p0[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[1]_i_1 
       (.I0(WDATA[1]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[1]),
        .O(p0[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[20]_i_1 
       (.I0(WDATA[20]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[20]),
        .O(p0[20]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[21]_i_1 
       (.I0(WDATA[21]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[21]),
        .O(p0[21]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[22]_i_1 
       (.I0(WDATA[22]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[22]),
        .O(p0[22]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[23]_i_1 
       (.I0(WDATA[23]),
        .I1(WSTRB[2]),
        .I2(p_rsc_dat[23]),
        .O(p0[23]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[24]_i_1 
       (.I0(WDATA[24]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[24]),
        .O(p0[24]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[25]_i_1 
       (.I0(WDATA[25]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[25]),
        .O(p0[25]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[26]_i_1 
       (.I0(WDATA[26]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[26]),
        .O(p0[26]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[27]_i_1 
       (.I0(WDATA[27]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[27]),
        .O(p0[27]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[28]_i_1 
       (.I0(WDATA[28]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[28]),
        .O(p0[28]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[29]_i_1 
       (.I0(WDATA[29]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[29]),
        .O(p0[29]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[2]_i_1 
       (.I0(WDATA[2]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[2]),
        .O(p0[2]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[30]_i_1 
       (.I0(WDATA[30]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[30]),
        .O(p0[30]));
  LUT5 #(
    .INIT(32'h00000020)) 
    \p[31]_i_1 
       (.I0(\p[31]_i_3_n_0 ),
        .I1(waddr[2]),
        .I2(waddr[3]),
        .I3(waddr[0]),
        .I4(waddr[1]),
        .O(\p[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[31]_i_2 
       (.I0(WDATA[31]),
        .I1(WSTRB[3]),
        .I2(p_rsc_dat[31]),
        .O(p0[31]));
  LUT4 #(
    .INIT(16'h0008)) 
    \p[31]_i_3 
       (.I0(WVALID),
        .I1(WREADY),
        .I2(waddr[4]),
        .I3(waddr[5]),
        .O(\p[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[3]_i_1 
       (.I0(WDATA[3]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[3]),
        .O(p0[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[4]_i_1 
       (.I0(WDATA[4]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[4]),
        .O(p0[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[5]_i_1 
       (.I0(WDATA[5]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[5]),
        .O(p0[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[6]_i_1 
       (.I0(WDATA[6]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[6]),
        .O(p0[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[7]_i_1 
       (.I0(WDATA[7]),
        .I1(WSTRB[0]),
        .I2(p_rsc_dat[7]),
        .O(p0[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[8]_i_1 
       (.I0(WDATA[8]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[8]),
        .O(p0[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \p[9]_i_1 
       (.I0(WDATA[9]),
        .I1(WSTRB[1]),
        .I2(p_rsc_dat[9]),
        .O(p0[9]));
  FDCE \p_reg[0] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[0]),
        .Q(p_rsc_dat[0]));
  FDCE \p_reg[10] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[10]),
        .Q(p_rsc_dat[10]));
  FDCE \p_reg[11] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[11]),
        .Q(p_rsc_dat[11]));
  FDCE \p_reg[12] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[12]),
        .Q(p_rsc_dat[12]));
  FDCE \p_reg[13] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[13]),
        .Q(p_rsc_dat[13]));
  FDCE \p_reg[14] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[14]),
        .Q(p_rsc_dat[14]));
  FDCE \p_reg[15] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[15]),
        .Q(p_rsc_dat[15]));
  FDCE \p_reg[16] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[16]),
        .Q(p_rsc_dat[16]));
  FDCE \p_reg[17] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[17]),
        .Q(p_rsc_dat[17]));
  FDCE \p_reg[18] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[18]),
        .Q(p_rsc_dat[18]));
  FDCE \p_reg[19] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[19]),
        .Q(p_rsc_dat[19]));
  FDCE \p_reg[1] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[1]),
        .Q(p_rsc_dat[1]));
  FDCE \p_reg[20] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[20]),
        .Q(p_rsc_dat[20]));
  FDCE \p_reg[21] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[21]),
        .Q(p_rsc_dat[21]));
  FDCE \p_reg[22] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[22]),
        .Q(p_rsc_dat[22]));
  FDCE \p_reg[23] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[23]),
        .Q(p_rsc_dat[23]));
  FDCE \p_reg[24] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[24]),
        .Q(p_rsc_dat[24]));
  FDCE \p_reg[25] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[25]),
        .Q(p_rsc_dat[25]));
  FDCE \p_reg[26] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[26]),
        .Q(p_rsc_dat[26]));
  FDCE \p_reg[27] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[27]),
        .Q(p_rsc_dat[27]));
  FDCE \p_reg[28] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[28]),
        .Q(p_rsc_dat[28]));
  FDCE \p_reg[29] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[29]),
        .Q(p_rsc_dat[29]));
  FDCE \p_reg[2] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[2]),
        .Q(p_rsc_dat[2]));
  FDCE \p_reg[30] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[30]),
        .Q(p_rsc_dat[30]));
  FDCE \p_reg[31] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[31]),
        .Q(p_rsc_dat[31]));
  FDCE \p_reg[3] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[3]),
        .Q(p_rsc_dat[3]));
  FDCE \p_reg[4] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[4]),
        .Q(p_rsc_dat[4]));
  FDCE \p_reg[5] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[5]),
        .Q(p_rsc_dat[5]));
  FDCE \p_reg[6] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[6]),
        .Q(p_rsc_dat[6]));
  FDCE \p_reg[7] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[7]),
        .Q(p_rsc_dat[7]));
  FDCE \p_reg[8] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[8]),
        .Q(p_rsc_dat[8]));
  FDCE \p_reg[9] 
       (.C(ACLK),
        .CE(\p[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(p0[9]),
        .Q(p_rsc_dat[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[0]_i_1 
       (.I0(WDATA[0]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[0]),
        .O(r0[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[10]_i_1 
       (.I0(WDATA[10]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[10]),
        .O(r0[10]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[11]_i_1 
       (.I0(WDATA[11]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[11]),
        .O(r0[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[12]_i_1 
       (.I0(WDATA[12]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[12]),
        .O(r0[12]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[13]_i_1 
       (.I0(WDATA[13]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[13]),
        .O(r0[13]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[14]_i_1 
       (.I0(WDATA[14]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[14]),
        .O(r0[14]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[15]_i_1 
       (.I0(WDATA[15]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[15]),
        .O(r0[15]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[16]_i_1 
       (.I0(WDATA[16]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[16]),
        .O(r0[16]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[17]_i_1 
       (.I0(WDATA[17]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[17]),
        .O(r0[17]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[18]_i_1 
       (.I0(WDATA[18]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[18]),
        .O(r0[18]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[19]_i_1 
       (.I0(WDATA[19]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[19]),
        .O(r0[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[1]_i_1 
       (.I0(WDATA[1]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[1]),
        .O(r0[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[20]_i_1 
       (.I0(WDATA[20]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[20]),
        .O(r0[20]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[21]_i_1 
       (.I0(WDATA[21]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[21]),
        .O(r0[21]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[22]_i_1 
       (.I0(WDATA[22]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[22]),
        .O(r0[22]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[23]_i_1 
       (.I0(WDATA[23]),
        .I1(WSTRB[2]),
        .I2(r_rsc_dat[23]),
        .O(r0[23]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[24]_i_1 
       (.I0(WDATA[24]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[24]),
        .O(r0[24]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[25]_i_1 
       (.I0(WDATA[25]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[25]),
        .O(r0[25]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[26]_i_1 
       (.I0(WDATA[26]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[26]),
        .O(r0[26]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[27]_i_1 
       (.I0(WDATA[27]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[27]),
        .O(r0[27]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[28]_i_1 
       (.I0(WDATA[28]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[28]),
        .O(r0[28]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[29]_i_1 
       (.I0(WDATA[29]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[29]),
        .O(r0[29]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[2]_i_1 
       (.I0(WDATA[2]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[2]),
        .O(r0[2]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[30]_i_1 
       (.I0(WDATA[30]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[30]),
        .O(r0[30]));
  LUT5 #(
    .INIT(32'h00000080)) 
    \r[31]_i_1 
       (.I0(\p[31]_i_3_n_0 ),
        .I1(waddr[2]),
        .I2(waddr[3]),
        .I3(waddr[0]),
        .I4(waddr[1]),
        .O(\r[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[31]_i_2 
       (.I0(WDATA[31]),
        .I1(WSTRB[3]),
        .I2(r_rsc_dat[31]),
        .O(r0[31]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[3]_i_1 
       (.I0(WDATA[3]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[3]),
        .O(r0[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[4]_i_1 
       (.I0(WDATA[4]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[4]),
        .O(r0[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[5]_i_1 
       (.I0(WDATA[5]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[5]),
        .O(r0[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[6]_i_1 
       (.I0(WDATA[6]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[6]),
        .O(r0[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[7]_i_1 
       (.I0(WDATA[7]),
        .I1(WSTRB[0]),
        .I2(r_rsc_dat[7]),
        .O(r0[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[8]_i_1 
       (.I0(WDATA[8]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[8]),
        .O(r0[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[9]_i_1 
       (.I0(WDATA[9]),
        .I1(WSTRB[1]),
        .I2(r_rsc_dat[9]),
        .O(r0[9]));
  FDCE \r_reg[0] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[0]),
        .Q(r_rsc_dat[0]));
  FDCE \r_reg[10] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[10]),
        .Q(r_rsc_dat[10]));
  FDCE \r_reg[11] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[11]),
        .Q(r_rsc_dat[11]));
  FDCE \r_reg[12] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[12]),
        .Q(r_rsc_dat[12]));
  FDCE \r_reg[13] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[13]),
        .Q(r_rsc_dat[13]));
  FDCE \r_reg[14] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[14]),
        .Q(r_rsc_dat[14]));
  FDCE \r_reg[15] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[15]),
        .Q(r_rsc_dat[15]));
  FDCE \r_reg[16] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[16]),
        .Q(r_rsc_dat[16]));
  FDCE \r_reg[17] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[17]),
        .Q(r_rsc_dat[17]));
  FDCE \r_reg[18] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[18]),
        .Q(r_rsc_dat[18]));
  FDCE \r_reg[19] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[19]),
        .Q(r_rsc_dat[19]));
  FDCE \r_reg[1] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[1]),
        .Q(r_rsc_dat[1]));
  FDCE \r_reg[20] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[20]),
        .Q(r_rsc_dat[20]));
  FDCE \r_reg[21] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[21]),
        .Q(r_rsc_dat[21]));
  FDCE \r_reg[22] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[22]),
        .Q(r_rsc_dat[22]));
  FDCE \r_reg[23] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[23]),
        .Q(r_rsc_dat[23]));
  FDCE \r_reg[24] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[24]),
        .Q(r_rsc_dat[24]));
  FDCE \r_reg[25] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[25]),
        .Q(r_rsc_dat[25]));
  FDCE \r_reg[26] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[26]),
        .Q(r_rsc_dat[26]));
  FDCE \r_reg[27] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[27]),
        .Q(r_rsc_dat[27]));
  FDCE \r_reg[28] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[28]),
        .Q(r_rsc_dat[28]));
  FDCE \r_reg[29] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[29]),
        .Q(r_rsc_dat[29]));
  FDCE \r_reg[2] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[2]),
        .Q(r_rsc_dat[2]));
  FDCE \r_reg[30] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[30]),
        .Q(r_rsc_dat[30]));
  FDCE \r_reg[31] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[31]),
        .Q(r_rsc_dat[31]));
  FDCE \r_reg[3] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[3]),
        .Q(r_rsc_dat[3]));
  FDCE \r_reg[4] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[4]),
        .Q(r_rsc_dat[4]));
  FDCE \r_reg[5] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[5]),
        .Q(r_rsc_dat[5]));
  FDCE \r_reg[6] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[6]),
        .Q(r_rsc_dat[6]));
  FDCE \r_reg[7] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[7]),
        .Q(r_rsc_dat[7]));
  FDCE \r_reg[8] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[8]),
        .Q(r_rsc_dat[8]));
  FDCE \r_reg[9] 
       (.C(ACLK),
        .CE(\r[31]_i_1_n_0 ),
        .CLR(\FSM_onehot_wstate[0]_i_2_n_0 ),
        .D(r0[9]),
        .Q(r_rsc_dat[9]));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[0]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(ac_sync_complete),
        .I5(ARADDR[3]),
        .O(\rdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[10]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_6_lz),
        .I5(ARADDR[3]),
        .O(\rdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[11]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_7_lz),
        .I5(ARADDR[3]),
        .O(\rdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[12]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_rsc_triosy_0_0_lz),
        .I5(ARADDR[3]),
        .O(\rdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[13]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_rsc_triosy_0_1_lz),
        .I5(ARADDR[3]),
        .O(\rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[14]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_rsc_triosy_0_2_lz),
        .I5(ARADDR[3]),
        .O(\rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[15]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_rsc_triosy_0_3_lz),
        .I5(ARADDR[3]),
        .O(\rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[16]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_h_rsc_triosy_0_0_lz),
        .I5(ARADDR[3]),
        .O(\rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[17]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_h_rsc_triosy_0_1_lz),
        .I5(ARADDR[3]),
        .O(\rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[18]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_h_rsc_triosy_0_2_lz),
        .I5(ARADDR[3]),
        .O(\rdata[18]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \rdata[19]_i_1 
       (.I0(ARADDR[4]),
        .I1(RVALID),
        .I2(ARVALID),
        .O(\rdata[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \rdata[19]_i_2 
       (.I0(ARVALID),
        .I1(RVALID),
        .O(\rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[19]_i_3 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(twiddle_h_rsc_triosy_0_3_lz),
        .I5(ARADDR[3]),
        .O(\rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[1]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(ac_sync_run_rsc_lzin),
        .I5(ARADDR[3]),
        .O(\rdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[2]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(r_rsc_triosy_lz),
        .I5(ARADDR[3]),
        .O(\rdata[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[3]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(p_rsc_triosy_lz),
        .I5(ARADDR[3]),
        .O(\rdata[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[4]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_0_lz),
        .I5(ARADDR[3]),
        .O(\rdata[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[5]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_1_lz),
        .I5(ARADDR[3]),
        .O(\rdata[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[6]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_2_lz),
        .I5(ARADDR[3]),
        .O(\rdata[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[7]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_3_lz),
        .I5(ARADDR[3]),
        .O(\rdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[8]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_4_lz),
        .I5(ARADDR[3]),
        .O(\rdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[9]_i_1 
       (.I0(ARADDR[5]),
        .I1(ARADDR[1]),
        .I2(ARADDR[0]),
        .I3(ARADDR[2]),
        .I4(vec_rsc_triosy_0_5_lz),
        .I5(ARADDR[3]),
        .O(\rdata[9]_i_1_n_0 ));
  FDRE \rdata_reg[0] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[0]_i_1_n_0 ),
        .Q(RDATA[0]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[10] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[10]_i_1_n_0 ),
        .Q(RDATA[10]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[11] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[11]_i_1_n_0 ),
        .Q(RDATA[11]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[12] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[12]_i_1_n_0 ),
        .Q(RDATA[12]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[13] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[13]_i_1_n_0 ),
        .Q(RDATA[13]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[14] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[14]_i_1_n_0 ),
        .Q(RDATA[14]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[15] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[15]_i_1_n_0 ),
        .Q(RDATA[15]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[16] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[16]_i_1_n_0 ),
        .Q(RDATA[16]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[17] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[17]_i_1_n_0 ),
        .Q(RDATA[17]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[18] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[18]_i_1_n_0 ),
        .Q(RDATA[18]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[19] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[19]_i_3_n_0 ),
        .Q(RDATA[19]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[1] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[1]_i_1_n_0 ),
        .Q(RDATA[1]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[2] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[2]_i_1_n_0 ),
        .Q(RDATA[2]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[3] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[3]_i_1_n_0 ),
        .Q(RDATA[3]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[4] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[4]_i_1_n_0 ),
        .Q(RDATA[4]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[5] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[5]_i_1_n_0 ),
        .Q(RDATA[5]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[6] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[6]_i_1_n_0 ),
        .Q(RDATA[6]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[7] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[7]_i_1_n_0 ),
        .Q(RDATA[7]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[8] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[8]_i_1_n_0 ),
        .Q(RDATA[8]),
        .R(\rdata[19]_i_1_n_0 ));
  FDRE \rdata_reg[9] 
       (.C(ACLK),
        .CE(\rdata[19]_i_2_n_0 ),
        .D(\rdata[9]_i_1_n_0 ),
        .Q(RDATA[9]),
        .R(\rdata[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[5]_i_1 
       (.I0(AWREADY),
        .I1(AWVALID),
        .O(aw_hs));
  FDRE \waddr_reg[0] 
       (.C(ACLK),
        .CE(aw_hs),
        .D(AWADDR[0]),
        .Q(waddr[0]),
        .R(1'b0));
  FDRE \waddr_reg[1] 
       (.C(ACLK),
        .CE(aw_hs),
        .D(AWADDR[1]),
        .Q(waddr[1]),
        .R(1'b0));
  FDRE \waddr_reg[2] 
       (.C(ACLK),
        .CE(aw_hs),
        .D(AWADDR[2]),
        .Q(waddr[2]),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ACLK),
        .CE(aw_hs),
        .D(AWADDR[3]),
        .Q(waddr[3]),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ACLK),
        .CE(aw_hs),
        .D(AWADDR[4]),
        .Q(waddr[4]),
        .R(1'b0));
  FDRE \waddr_reg[5] 
       (.C(ACLK),
        .CE(aw_hs),
        .D(AWADDR[5]),
        .Q(waddr[5]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
