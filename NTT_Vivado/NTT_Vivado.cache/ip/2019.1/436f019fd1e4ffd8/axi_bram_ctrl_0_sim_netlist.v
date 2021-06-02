// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jun  1 22:59:47 2021
// Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_bram_ctrl_0_sim_netlist.v
// Design      : axi_bram_ctrl_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO
   (\GEN_AW_DUAL.aw_active_reg ,
    \bvalid_cnt_reg[2] ,
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ,
    \bvalid_cnt_reg[0] ,
    bid_gets_fifo_load,
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] ,
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0 ,
    Data_Exists_DFF_0,
    SR,
    s_axi_aclk,
    aw_active,
    last_data_ack_mod,
    bid_gets_fifo_load_d1_reg,
    wr_data_sm_cs,
    s_axi_wvalid,
    s_axi_wlast,
    bvalid_cnt,
    bid_gets_fifo_load_d1_reg_0,
    Data_Exists_DFF_1,
    s_axi_bready,
    bid_gets_fifo_load_d1,
    axi_wr_burst,
    axi_awaddr_full,
    wr_addr_sm_cs,
    s_axi_awvalid,
    s_axi_awready,
    \GEN_AWREADY.axi_awready_int_i_4 ,
    curr_awlen_reg_1_or_2,
    axi_awlen_pipe_1_or_2,
    axi_awid_pipe,
    s_axi_awid,
    s_axi_bid);
  output \GEN_AW_DUAL.aw_active_reg ;
  output \bvalid_cnt_reg[2] ;
  output \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ;
  output \bvalid_cnt_reg[0] ;
  output bid_gets_fifo_load;
  output \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] ;
  output \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0 ;
  output Data_Exists_DFF_0;
  input [0:0]SR;
  input s_axi_aclk;
  input aw_active;
  input last_data_ack_mod;
  input bid_gets_fifo_load_d1_reg;
  input [2:0]wr_data_sm_cs;
  input s_axi_wvalid;
  input s_axi_wlast;
  input [2:0]bvalid_cnt;
  input bid_gets_fifo_load_d1_reg_0;
  input Data_Exists_DFF_1;
  input s_axi_bready;
  input bid_gets_fifo_load_d1;
  input axi_wr_burst;
  input axi_awaddr_full;
  input wr_addr_sm_cs;
  input s_axi_awvalid;
  input s_axi_awready;
  input \GEN_AWREADY.axi_awready_int_i_4 ;
  input curr_awlen_reg_1_or_2;
  input axi_awlen_pipe_1_or_2;
  input axi_awid_pipe;
  input [0:0]s_axi_awid;
  input [0:0]s_axi_bid;

  wire \Addr_Counters[0].FDRE_I_n_0 ;
  wire \Addr_Counters[0].MUXCY_L_I_i_3_n_0 ;
  wire \Addr_Counters[0].MUXCY_L_I_i_4_n_0 ;
  wire \Addr_Counters[1].FDRE_I_n_0 ;
  wire \Addr_Counters[2].FDRE_I_n_0 ;
  wire \Addr_Counters[3].FDRE_I_n_0 ;
  wire \Addr_Counters[3].XORCY_I_i_1_n_0 ;
  wire CI;
  wire D;
  wire Data_Exists_DFF_0;
  wire Data_Exists_DFF_1;
  wire Data_Exists_DFF_i_2_n_0;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] ;
  wire \GEN_AWREADY.axi_awready_int_i_4 ;
  wire \GEN_AWREADY.axi_awready_int_i_6_n_0 ;
  wire \GEN_AW_DUAL.aw_active_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0 ;
  wire S;
  wire S0_out;
  wire S1_out;
  wire [0:0]SR;
  wire addr_cy_1;
  wire addr_cy_2;
  wire addr_cy_3;
  wire aw_active;
  wire axi_awaddr_full;
  wire axi_awid_pipe;
  wire axi_awlen_pipe_1_or_2;
  wire \axi_bid_int[0]_i_2_n_0 ;
  wire \axi_bid_int[0]_i_3_n_0 ;
  wire axi_wr_burst;
  wire bid_fifo_ld;
  wire bid_fifo_not_empty;
  wire bid_fifo_rd;
  wire bid_gets_fifo_load;
  wire bid_gets_fifo_load_d1;
  wire bid_gets_fifo_load_d1_i_2_n_0;
  wire bid_gets_fifo_load_d1_reg;
  wire bid_gets_fifo_load_d1_reg_0;
  wire [2:0]bvalid_cnt;
  wire \bvalid_cnt_reg[0] ;
  wire \bvalid_cnt_reg[2] ;
  wire curr_awlen_reg_1_or_2;
  wire last_data_ack_mod;
  wire s_axi_aclk;
  wire [0:0]s_axi_awid;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_wlast;
  wire s_axi_wvalid;
  wire sum_A_0;
  wire sum_A_1;
  wire sum_A_2;
  wire sum_A_3;
  wire wr_addr_sm_cs;
  wire [2:0]wr_data_sm_cs;
  wire [3:3]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[0].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_3),
        .Q(\Addr_Counters[0].FDRE_I_n_0 ),
        .R(SR));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \Addr_Counters[0].MUXCY_L_I_CARRY4 
       (.CI(1'b0),
        .CO({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED [3],addr_cy_1,addr_cy_2,addr_cy_3}),
        .CYINIT(CI),
        .DI({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED [3],\Addr_Counters[2].FDRE_I_n_0 ,\Addr_Counters[1].FDRE_I_n_0 ,\Addr_Counters[0].FDRE_I_n_0 }),
        .O({sum_A_0,sum_A_1,sum_A_2,sum_A_3}),
        .S({\Addr_Counters[3].XORCY_I_i_1_n_0 ,S0_out,S1_out,S}));
  LUT4 #(
    .INIT(16'hA208)) 
    \Addr_Counters[0].MUXCY_L_I_i_1 
       (.I0(\Addr_Counters[0].MUXCY_L_I_i_3_n_0 ),
        .I1(bid_fifo_not_empty),
        .I2(\axi_bid_int[0]_i_2_n_0 ),
        .I3(\Addr_Counters[0].FDRE_I_n_0 ),
        .O(S));
  LUT4 #(
    .INIT(16'h0455)) 
    \Addr_Counters[0].MUXCY_L_I_i_2 
       (.I0(\GEN_AW_DUAL.aw_active_reg ),
        .I1(bid_fifo_not_empty),
        .I2(\axi_bid_int[0]_i_2_n_0 ),
        .I3(\Addr_Counters[0].MUXCY_L_I_i_4_n_0 ),
        .O(CI));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \Addr_Counters[0].MUXCY_L_I_i_3 
       (.I0(\Addr_Counters[2].FDRE_I_n_0 ),
        .I1(\Addr_Counters[3].FDRE_I_n_0 ),
        .I2(\Addr_Counters[1].FDRE_I_n_0 ),
        .I3(\Addr_Counters[0].FDRE_I_n_0 ),
        .I4(\GEN_AW_DUAL.aw_active_reg ),
        .O(\Addr_Counters[0].MUXCY_L_I_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \Addr_Counters[0].MUXCY_L_I_i_4 
       (.I0(\Addr_Counters[0].FDRE_I_n_0 ),
        .I1(\Addr_Counters[1].FDRE_I_n_0 ),
        .I2(\Addr_Counters[3].FDRE_I_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .O(\Addr_Counters[0].MUXCY_L_I_i_4_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[1].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_2),
        .Q(\Addr_Counters[1].FDRE_I_n_0 ),
        .R(SR));
  LUT4 #(
    .INIT(16'hA208)) 
    \Addr_Counters[1].MUXCY_L_I_i_1 
       (.I0(\Addr_Counters[0].MUXCY_L_I_i_3_n_0 ),
        .I1(bid_fifo_not_empty),
        .I2(\axi_bid_int[0]_i_2_n_0 ),
        .I3(\Addr_Counters[1].FDRE_I_n_0 ),
        .O(S1_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[2].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_1),
        .Q(\Addr_Counters[2].FDRE_I_n_0 ),
        .R(SR));
  LUT4 #(
    .INIT(16'hA208)) 
    \Addr_Counters[2].MUXCY_L_I_i_1 
       (.I0(\Addr_Counters[0].MUXCY_L_I_i_3_n_0 ),
        .I1(bid_fifo_not_empty),
        .I2(\axi_bid_int[0]_i_2_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .O(S0_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[3].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_0),
        .Q(\Addr_Counters[3].FDRE_I_n_0 ),
        .R(SR));
  LUT4 #(
    .INIT(16'hA208)) 
    \Addr_Counters[3].XORCY_I_i_1 
       (.I0(\Addr_Counters[0].MUXCY_L_I_i_3_n_0 ),
        .I1(bid_fifo_not_empty),
        .I2(\axi_bid_int[0]_i_2_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .O(\Addr_Counters[3].XORCY_I_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    Data_Exists_DFF
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D),
        .Q(bid_fifo_not_empty),
        .R(SR));
  LUT4 #(
    .INIT(16'hFD05)) 
    Data_Exists_DFF_i_1
       (.I0(\GEN_AW_DUAL.aw_active_reg ),
        .I1(\axi_bid_int[0]_i_2_n_0 ),
        .I2(Data_Exists_DFF_i_2_n_0),
        .I3(bid_fifo_not_empty),
        .O(D));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Data_Exists_DFF_i_2
       (.I0(\Addr_Counters[0].FDRE_I_n_0 ),
        .I1(\Addr_Counters[1].FDRE_I_n_0 ),
        .I2(\Addr_Counters[3].FDRE_I_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .O(Data_Exists_DFF_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* srl_bus_name = "U0/\gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM " *) 
  (* srl_name = "U0/\gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM[0].SRL16E_I " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    \FIFO_RAM[0].SRL16E_I 
       (.A0(\Addr_Counters[0].FDRE_I_n_0 ),
        .A1(\Addr_Counters[1].FDRE_I_n_0 ),
        .A2(\Addr_Counters[2].FDRE_I_n_0 ),
        .A3(\Addr_Counters[3].FDRE_I_n_0 ),
        .CE(CI),
        .CLK(s_axi_aclk),
        .D(bid_fifo_ld),
        .Q(bid_fifo_rd));
  LUT3 #(
    .INIT(8'hB8)) 
    \FIFO_RAM[0].SRL16E_I_i_1 
       (.I0(axi_awid_pipe),
        .I1(axi_awaddr_full),
        .I2(s_axi_awid),
        .O(bid_fifo_ld));
  LUT6 #(
    .INIT(64'hFEFEAAFEFFFFFFFF)) 
    \GEN_AWREADY.axi_awready_int_i_3 
       (.I0(\bvalid_cnt_reg[2] ),
        .I1(aw_active),
        .I2(\GEN_AWREADY.axi_awready_int_i_6_n_0 ),
        .I3(last_data_ack_mod),
        .I4(\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ),
        .I5(bid_gets_fifo_load_d1_reg),
        .O(\GEN_AW_DUAL.aw_active_reg ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_AWREADY.axi_awready_int_i_5 
       (.I0(bvalid_cnt[2]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[0]),
        .O(\bvalid_cnt_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hAB)) 
    \GEN_AWREADY.axi_awready_int_i_6 
       (.I0(wr_addr_sm_cs),
        .I1(axi_awaddr_full),
        .I2(s_axi_awvalid),
        .O(\GEN_AWREADY.axi_awready_int_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \GEN_AWREADY.axi_awready_int_i_7 
       (.I0(axi_awaddr_full),
        .I1(\GEN_AWREADY.axi_awready_int_i_4 ),
        .I2(curr_awlen_reg_1_or_2),
        .I3(axi_awlen_pipe_1_or_2),
        .O(\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ));
  LUT6 #(
    .INIT(64'h7F7F7F7F7F000000)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2 
       (.I0(bvalid_cnt[0]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[2]),
        .I3(s_axi_awvalid),
        .I4(s_axi_awready),
        .I5(aw_active),
        .O(\bvalid_cnt_reg[0] ));
  LUT6 #(
    .INIT(64'hAFACAFAFA0ACA0A0)) 
    \axi_bid_int[0]_i_1 
       (.I0(bid_fifo_ld),
        .I1(bid_fifo_rd),
        .I2(bid_gets_fifo_load),
        .I3(\axi_bid_int[0]_i_2_n_0 ),
        .I4(bid_fifo_not_empty),
        .I5(s_axi_bid),
        .O(Data_Exists_DFF_0));
  LUT6 #(
    .INIT(64'h0000000011110FFF)) 
    \axi_bid_int[0]_i_2 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] ),
        .I1(bid_gets_fifo_load_d1_i_2_n_0),
        .I2(Data_Exists_DFF_1),
        .I3(s_axi_bready),
        .I4(\axi_bid_int[0]_i_3_n_0 ),
        .I5(bid_gets_fifo_load_d1),
        .O(\axi_bid_int[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \axi_bid_int[0]_i_3 
       (.I0(bvalid_cnt[0]),
        .I1(bvalid_cnt[2]),
        .I2(bvalid_cnt[1]),
        .O(\axi_bid_int[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    axi_wready_int_mod_i_2
       (.I0(\GEN_AW_DUAL.aw_active_reg ),
        .I1(axi_awaddr_full),
        .I2(\bvalid_cnt_reg[0] ),
        .O(\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0 ));
  LUT6 #(
    .INIT(64'h0000000000000EEE)) 
    bid_gets_fifo_load_d1_i_1
       (.I0(bid_gets_fifo_load_d1_i_2_n_0),
        .I1(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] ),
        .I2(bid_fifo_not_empty),
        .I3(bvalid_cnt[0]),
        .I4(bid_gets_fifo_load_d1_reg_0),
        .I5(\GEN_AW_DUAL.aw_active_reg ),
        .O(bid_gets_fifo_load));
  LUT6 #(
    .INIT(64'h0050000000400000)) 
    bid_gets_fifo_load_d1_i_2
       (.I0(wr_data_sm_cs[2]),
        .I1(wr_data_sm_cs[1]),
        .I2(s_axi_wvalid),
        .I3(wr_data_sm_cs[0]),
        .I4(s_axi_wlast),
        .I5(\bvalid_cnt_reg[0] ),
        .O(bid_gets_fifo_load_d1_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000008)) 
    bid_gets_fifo_load_d1_i_3
       (.I0(\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0 ),
        .I1(wr_data_sm_cs[0]),
        .I2(axi_wr_burst),
        .I3(wr_data_sm_cs[1]),
        .I4(wr_data_sm_cs[2]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] ));
endmodule

(* C_BRAM_ADDR_WIDTH = "11" *) (* C_BRAM_INST_MODE = "EXTERNAL" *) (* C_ECC = "0" *) 
(* C_ECC_ONOFF_RESET_VALUE = "0" *) (* C_ECC_TYPE = "0" *) (* C_FAMILY = "virtex7" *) 
(* C_FAULT_INJECT = "0" *) (* C_MEMORY_DEPTH = "2048" *) (* C_RD_CMD_OPTIMIZATION = "0" *) 
(* C_READ_LATENCY = "2" *) (* C_SINGLE_PORT_BRAM = "0" *) (* C_S_AXI_ADDR_WIDTH = "14" *) 
(* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) (* C_S_AXI_DATA_WIDTH = "64" *) 
(* C_S_AXI_ID_WIDTH = "1" *) (* C_S_AXI_PROTOCOL = "AXI4" *) (* C_S_AXI_SUPPORTS_NARROW_BURST = "1" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl
   (s_axi_aclk,
    s_axi_aresetn,
    ecc_interrupt,
    ecc_ue,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_ctrl_awvalid,
    s_axi_ctrl_awready,
    s_axi_ctrl_awaddr,
    s_axi_ctrl_wdata,
    s_axi_ctrl_wvalid,
    s_axi_ctrl_wready,
    s_axi_ctrl_bresp,
    s_axi_ctrl_bvalid,
    s_axi_ctrl_bready,
    s_axi_ctrl_araddr,
    s_axi_ctrl_arvalid,
    s_axi_ctrl_arready,
    s_axi_ctrl_rdata,
    s_axi_ctrl_rresp,
    s_axi_ctrl_rvalid,
    s_axi_ctrl_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a,
    bram_rst_b,
    bram_clk_b,
    bram_en_b,
    bram_we_b,
    bram_addr_b,
    bram_wrdata_b,
    bram_rddata_b);
  input s_axi_aclk;
  input s_axi_aresetn;
  output ecc_interrupt;
  output ecc_ue;
  input [0:0]s_axi_awid;
  input [13:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [13:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_ctrl_awvalid;
  output s_axi_ctrl_awready;
  input [31:0]s_axi_ctrl_awaddr;
  input [31:0]s_axi_ctrl_wdata;
  input s_axi_ctrl_wvalid;
  output s_axi_ctrl_wready;
  output [1:0]s_axi_ctrl_bresp;
  output s_axi_ctrl_bvalid;
  input s_axi_ctrl_bready;
  input [31:0]s_axi_ctrl_araddr;
  input s_axi_ctrl_arvalid;
  output s_axi_ctrl_arready;
  output [31:0]s_axi_ctrl_rdata;
  output [1:0]s_axi_ctrl_rresp;
  output s_axi_ctrl_rvalid;
  input s_axi_ctrl_rready;
  output bram_rst_a;
  output bram_clk_a;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [13:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  input [63:0]bram_rddata_a;
  output bram_rst_b;
  output bram_clk_b;
  output bram_en_b;
  output [7:0]bram_we_b;
  output [13:0]bram_addr_b;
  output [63:0]bram_wrdata_b;
  input [63:0]bram_rddata_b;

  wire \<const0> ;
  wire [13:3]\^bram_addr_a ;
  wire [13:3]\^bram_addr_b ;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire bram_rst_b;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [13:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign bram_addr_a[13:3] = \^bram_addr_a [13:3];
  assign bram_addr_a[2] = \<const0> ;
  assign bram_addr_a[1] = \<const0> ;
  assign bram_addr_a[0] = \<const0> ;
  assign bram_addr_b[13:3] = \^bram_addr_b [13:3];
  assign bram_addr_b[2] = \<const0> ;
  assign bram_addr_b[1] = \<const0> ;
  assign bram_addr_b[0] = \<const0> ;
  assign bram_clk_a = s_axi_aclk;
  assign bram_clk_b = s_axi_aclk;
  assign bram_rst_a = bram_rst_b;
  assign bram_we_b[7] = \<const0> ;
  assign bram_we_b[6] = \<const0> ;
  assign bram_we_b[5] = \<const0> ;
  assign bram_we_b[4] = \<const0> ;
  assign bram_we_b[3] = \<const0> ;
  assign bram_we_b[2] = \<const0> ;
  assign bram_we_b[1] = \<const0> ;
  assign bram_we_b[0] = \<const0> ;
  assign bram_wrdata_b[63] = \<const0> ;
  assign bram_wrdata_b[62] = \<const0> ;
  assign bram_wrdata_b[61] = \<const0> ;
  assign bram_wrdata_b[60] = \<const0> ;
  assign bram_wrdata_b[59] = \<const0> ;
  assign bram_wrdata_b[58] = \<const0> ;
  assign bram_wrdata_b[57] = \<const0> ;
  assign bram_wrdata_b[56] = \<const0> ;
  assign bram_wrdata_b[55] = \<const0> ;
  assign bram_wrdata_b[54] = \<const0> ;
  assign bram_wrdata_b[53] = \<const0> ;
  assign bram_wrdata_b[52] = \<const0> ;
  assign bram_wrdata_b[51] = \<const0> ;
  assign bram_wrdata_b[50] = \<const0> ;
  assign bram_wrdata_b[49] = \<const0> ;
  assign bram_wrdata_b[48] = \<const0> ;
  assign bram_wrdata_b[47] = \<const0> ;
  assign bram_wrdata_b[46] = \<const0> ;
  assign bram_wrdata_b[45] = \<const0> ;
  assign bram_wrdata_b[44] = \<const0> ;
  assign bram_wrdata_b[43] = \<const0> ;
  assign bram_wrdata_b[42] = \<const0> ;
  assign bram_wrdata_b[41] = \<const0> ;
  assign bram_wrdata_b[40] = \<const0> ;
  assign bram_wrdata_b[39] = \<const0> ;
  assign bram_wrdata_b[38] = \<const0> ;
  assign bram_wrdata_b[37] = \<const0> ;
  assign bram_wrdata_b[36] = \<const0> ;
  assign bram_wrdata_b[35] = \<const0> ;
  assign bram_wrdata_b[34] = \<const0> ;
  assign bram_wrdata_b[33] = \<const0> ;
  assign bram_wrdata_b[32] = \<const0> ;
  assign bram_wrdata_b[31] = \<const0> ;
  assign bram_wrdata_b[30] = \<const0> ;
  assign bram_wrdata_b[29] = \<const0> ;
  assign bram_wrdata_b[28] = \<const0> ;
  assign bram_wrdata_b[27] = \<const0> ;
  assign bram_wrdata_b[26] = \<const0> ;
  assign bram_wrdata_b[25] = \<const0> ;
  assign bram_wrdata_b[24] = \<const0> ;
  assign bram_wrdata_b[23] = \<const0> ;
  assign bram_wrdata_b[22] = \<const0> ;
  assign bram_wrdata_b[21] = \<const0> ;
  assign bram_wrdata_b[20] = \<const0> ;
  assign bram_wrdata_b[19] = \<const0> ;
  assign bram_wrdata_b[18] = \<const0> ;
  assign bram_wrdata_b[17] = \<const0> ;
  assign bram_wrdata_b[16] = \<const0> ;
  assign bram_wrdata_b[15] = \<const0> ;
  assign bram_wrdata_b[14] = \<const0> ;
  assign bram_wrdata_b[13] = \<const0> ;
  assign bram_wrdata_b[12] = \<const0> ;
  assign bram_wrdata_b[11] = \<const0> ;
  assign bram_wrdata_b[10] = \<const0> ;
  assign bram_wrdata_b[9] = \<const0> ;
  assign bram_wrdata_b[8] = \<const0> ;
  assign bram_wrdata_b[7] = \<const0> ;
  assign bram_wrdata_b[6] = \<const0> ;
  assign bram_wrdata_b[5] = \<const0> ;
  assign bram_wrdata_b[4] = \<const0> ;
  assign bram_wrdata_b[3] = \<const0> ;
  assign bram_wrdata_b[2] = \<const0> ;
  assign bram_wrdata_b[1] = \<const0> ;
  assign bram_wrdata_b[0] = \<const0> ;
  assign ecc_interrupt = \<const0> ;
  assign ecc_ue = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_ctrl_arready = \<const0> ;
  assign s_axi_ctrl_awready = \<const0> ;
  assign s_axi_ctrl_bresp[1] = \<const0> ;
  assign s_axi_ctrl_bresp[0] = \<const0> ;
  assign s_axi_ctrl_bvalid = \<const0> ;
  assign s_axi_ctrl_rdata[31] = \<const0> ;
  assign s_axi_ctrl_rdata[30] = \<const0> ;
  assign s_axi_ctrl_rdata[29] = \<const0> ;
  assign s_axi_ctrl_rdata[28] = \<const0> ;
  assign s_axi_ctrl_rdata[27] = \<const0> ;
  assign s_axi_ctrl_rdata[26] = \<const0> ;
  assign s_axi_ctrl_rdata[25] = \<const0> ;
  assign s_axi_ctrl_rdata[24] = \<const0> ;
  assign s_axi_ctrl_rdata[23] = \<const0> ;
  assign s_axi_ctrl_rdata[22] = \<const0> ;
  assign s_axi_ctrl_rdata[21] = \<const0> ;
  assign s_axi_ctrl_rdata[20] = \<const0> ;
  assign s_axi_ctrl_rdata[19] = \<const0> ;
  assign s_axi_ctrl_rdata[18] = \<const0> ;
  assign s_axi_ctrl_rdata[17] = \<const0> ;
  assign s_axi_ctrl_rdata[16] = \<const0> ;
  assign s_axi_ctrl_rdata[15] = \<const0> ;
  assign s_axi_ctrl_rdata[14] = \<const0> ;
  assign s_axi_ctrl_rdata[13] = \<const0> ;
  assign s_axi_ctrl_rdata[12] = \<const0> ;
  assign s_axi_ctrl_rdata[11] = \<const0> ;
  assign s_axi_ctrl_rdata[10] = \<const0> ;
  assign s_axi_ctrl_rdata[9] = \<const0> ;
  assign s_axi_ctrl_rdata[8] = \<const0> ;
  assign s_axi_ctrl_rdata[7] = \<const0> ;
  assign s_axi_ctrl_rdata[6] = \<const0> ;
  assign s_axi_ctrl_rdata[5] = \<const0> ;
  assign s_axi_ctrl_rdata[4] = \<const0> ;
  assign s_axi_ctrl_rdata[3] = \<const0> ;
  assign s_axi_ctrl_rdata[2] = \<const0> ;
  assign s_axi_ctrl_rdata[1] = \<const0> ;
  assign s_axi_ctrl_rdata[0] = \<const0> ;
  assign s_axi_ctrl_rresp[1] = \<const0> ;
  assign s_axi_ctrl_rresp[0] = \<const0> ;
  assign s_axi_ctrl_rvalid = \<const0> ;
  assign s_axi_ctrl_wready = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top \gext_inst.abcv4_0_ext_inst 
       (.\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg (s_axi_rlast),
        .\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg (s_axi_rvalid),
        .SR(bram_rst_b),
        .axi_bvalid_int_reg(s_axi_bvalid),
        .bram_addr_a(\^bram_addr_a ),
        .bram_addr_b(\^bram_addr_b ),
        .bram_en_a(bram_en_a),
        .bram_en_b(bram_en_b),
        .bram_rddata_b(bram_rddata_b),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rready(s_axi_rready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* CHECK_LICENSE_TYPE = "axi_bram_ctrl_0,axi_bram_ctrl,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_bram_ctrl,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a,
    bram_rst_b,
    bram_clk_b,
    bram_en_b,
    bram_we_b,
    bram_addr_b,
    bram_wrdata_b,
    bram_rddata_b);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI:S_AXI_CTRL, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 14, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [13:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input s_axi_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [63:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [7:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [13:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input s_axi_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [63:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1" *) output bram_rst_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) output bram_clk_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) output bram_en_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) output [7:0]bram_we_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) output [13:0]bram_addr_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) output [63:0]bram_wrdata_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) input [63:0]bram_rddata_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MASTER_TYPE BRAM_CTRL, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1" *) output bram_rst_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) output bram_clk_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) output bram_en_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) output [7:0]bram_we_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) output [13:0]bram_addr_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) output [63:0]bram_wrdata_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) input [63:0]bram_rddata_b;

  wire [13:0]bram_addr_a;
  wire [13:0]bram_addr_b;
  wire bram_clk_a;
  wire bram_clk_b;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_a;
  wire [63:0]bram_rddata_b;
  wire bram_rst_a;
  wire bram_rst_b;
  wire [7:0]bram_we_a;
  wire [7:0]bram_we_b;
  wire [63:0]bram_wrdata_a;
  wire [63:0]bram_wrdata_b;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [13:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_U0_ecc_interrupt_UNCONNECTED;
  wire NLW_U0_ecc_ue_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_arready_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_awready_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_wready_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_ctrl_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_ctrl_rdata_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_ctrl_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;

  (* C_BRAM_ADDR_WIDTH = "11" *) 
  (* C_BRAM_INST_MODE = "EXTERNAL" *) 
  (* C_ECC = "0" *) 
  (* C_ECC_ONOFF_RESET_VALUE = "0" *) 
  (* C_ECC_TYPE = "0" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_FAULT_INJECT = "0" *) 
  (* C_MEMORY_DEPTH = "2048" *) 
  (* C_RD_CMD_OPTIMIZATION = "0" *) 
  (* C_READ_LATENCY = "2" *) 
  (* C_SINGLE_PORT_BRAM = "0" *) 
  (* C_S_AXI_ADDR_WIDTH = "14" *) 
  (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_DATA_WIDTH = "64" *) 
  (* C_S_AXI_ID_WIDTH = "1" *) 
  (* C_S_AXI_PROTOCOL = "AXI4" *) 
  (* C_S_AXI_SUPPORTS_NARROW_BURST = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl U0
       (.bram_addr_a(bram_addr_a),
        .bram_addr_b(bram_addr_b),
        .bram_clk_a(bram_clk_a),
        .bram_clk_b(bram_clk_b),
        .bram_en_a(bram_en_a),
        .bram_en_b(bram_en_b),
        .bram_rddata_a(bram_rddata_a),
        .bram_rddata_b(bram_rddata_b),
        .bram_rst_a(bram_rst_a),
        .bram_rst_b(bram_rst_b),
        .bram_we_a(bram_we_a),
        .bram_we_b(bram_we_b),
        .bram_wrdata_a(bram_wrdata_a),
        .bram_wrdata_b(bram_wrdata_b),
        .ecc_interrupt(NLW_U0_ecc_interrupt_UNCONNECTED),
        .ecc_ue(NLW_U0_ecc_ue_UNCONNECTED),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(1'b0),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_ctrl_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_arready(NLW_U0_s_axi_ctrl_arready_UNCONNECTED),
        .s_axi_ctrl_arvalid(1'b0),
        .s_axi_ctrl_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_awready(NLW_U0_s_axi_ctrl_awready_UNCONNECTED),
        .s_axi_ctrl_awvalid(1'b0),
        .s_axi_ctrl_bready(1'b0),
        .s_axi_ctrl_bresp(NLW_U0_s_axi_ctrl_bresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_bvalid(NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED),
        .s_axi_ctrl_rdata(NLW_U0_s_axi_ctrl_rdata_UNCONNECTED[31:0]),
        .s_axi_ctrl_rready(1'b0),
        .s_axi_ctrl_rresp(NLW_U0_s_axi_ctrl_rresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_rvalid(NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED),
        .s_axi_ctrl_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_wready(NLW_U0_s_axi_ctrl_wready_UNCONNECTED),
        .s_axi_ctrl_wvalid(1'b0),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top
   (\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ,
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ,
    s_axi_awready,
    SR,
    s_axi_rdata,
    bram_addr_b,
    bram_addr_a,
    axi_bvalid_int_reg,
    bram_en_a,
    bram_we_a,
    bram_wrdata_a,
    s_axi_rid,
    s_axi_wready,
    s_axi_arready,
    bram_en_b,
    s_axi_bid,
    s_axi_wvalid,
    s_axi_aresetn,
    s_axi_wlast,
    s_axi_awlen,
    s_axi_awvalid,
    s_axi_rready,
    s_axi_arvalid,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_awburst,
    s_axi_awaddr,
    s_axi_araddr,
    s_axi_aclk,
    s_axi_arburst,
    s_axi_arid,
    bram_rddata_b,
    s_axi_awsize,
    s_axi_bready,
    s_axi_awid,
    s_axi_wstrb,
    s_axi_wdata);
  output \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ;
  output \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ;
  output s_axi_awready;
  output [0:0]SR;
  output [63:0]s_axi_rdata;
  output [10:0]bram_addr_b;
  output [10:0]bram_addr_a;
  output axi_bvalid_int_reg;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [63:0]bram_wrdata_a;
  output [0:0]s_axi_rid;
  output s_axi_wready;
  output s_axi_arready;
  output bram_en_b;
  output [0:0]s_axi_bid;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input s_axi_wlast;
  input [7:0]s_axi_awlen;
  input s_axi_awvalid;
  input s_axi_rready;
  input s_axi_arvalid;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_awburst;
  input [13:0]s_axi_awaddr;
  input [13:0]s_axi_araddr;
  input s_axi_aclk;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arid;
  input [63:0]bram_rddata_b;
  input [2:0]s_axi_awsize;
  input s_axi_bready;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_wstrb;
  input [63:0]s_axi_wdata;

  wire \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ;
  wire [0:0]SR;
  wire axi_bvalid_int_reg;
  wire [10:0]bram_addr_a;
  wire [10:0]bram_addr_b;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [13:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rready;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi \GEN_AXI4.I_FULL_AXI 
       (.\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg (\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ),
        .\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg (\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ),
        .SR(SR),
        .axi_bvalid_int_reg(axi_bvalid_int_reg),
        .bram_addr_a(bram_addr_a),
        .bram_addr_b(bram_addr_b),
        .bram_en_a(bram_en_a),
        .bram_en_b(bram_en_b),
        .bram_rddata_b(bram_rddata_b),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rready(s_axi_rready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi
   (\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ,
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ,
    s_axi_awready,
    SR,
    s_axi_rdata,
    bram_addr_b,
    bram_addr_a,
    axi_bvalid_int_reg,
    bram_en_a,
    bram_we_a,
    bram_wrdata_a,
    s_axi_rid,
    s_axi_wready,
    s_axi_arready,
    bram_en_b,
    s_axi_bid,
    s_axi_wvalid,
    s_axi_aresetn,
    s_axi_wlast,
    s_axi_awlen,
    s_axi_awvalid,
    s_axi_rready,
    s_axi_arvalid,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_awburst,
    s_axi_awaddr,
    s_axi_araddr,
    s_axi_aclk,
    s_axi_arburst,
    s_axi_arid,
    bram_rddata_b,
    s_axi_awsize,
    s_axi_bready,
    s_axi_awid,
    s_axi_wstrb,
    s_axi_wdata);
  output \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ;
  output \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ;
  output s_axi_awready;
  output [0:0]SR;
  output [63:0]s_axi_rdata;
  output [10:0]bram_addr_b;
  output [10:0]bram_addr_a;
  output axi_bvalid_int_reg;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [63:0]bram_wrdata_a;
  output [0:0]s_axi_rid;
  output s_axi_wready;
  output s_axi_arready;
  output bram_en_b;
  output [0:0]s_axi_bid;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input s_axi_wlast;
  input [7:0]s_axi_awlen;
  input s_axi_awvalid;
  input s_axi_rready;
  input s_axi_arvalid;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_awburst;
  input [13:0]s_axi_awaddr;
  input [13:0]s_axi_araddr;
  input s_axi_aclk;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arid;
  input [63:0]bram_rddata_b;
  input [2:0]s_axi_awsize;
  input s_axi_bready;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_wstrb;
  input [63:0]s_axi_wdata;

  wire \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ;
  wire I_WR_CHNL_n_69;
  wire [0:0]SR;
  wire axi_aresetn_d3;
  wire axi_aresetn_re_reg;
  wire axi_bvalid_int_reg;
  wire [10:0]bram_addr_a;
  wire [10:0]bram_addr_b;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [13:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rready;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl I_RD_CHNL
       (.\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1]_0 (I_WR_CHNL_n_69),
        .\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 (\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg ),
        .\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 (\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg ),
        .Q(bram_addr_b[8:0]),
        .SR(SR),
        .axi_aresetn_d3(axi_aresetn_d3),
        .axi_aresetn_re_reg(axi_aresetn_re_reg),
        .bram_addr_b(bram_addr_b[10:9]),
        .bram_en_b(bram_en_b),
        .bram_rddata_b(bram_rddata_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rready(s_axi_rready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl I_WR_CHNL
       (.\GEN_AWREADY.axi_aresetn_d3_reg_0 (I_WR_CHNL_n_69),
        .Q(bram_addr_a[8:0]),
        .SR(SR),
        .axi_aresetn_d3(axi_aresetn_d3),
        .axi_aresetn_re_reg(axi_aresetn_re_reg),
        .axi_bvalid_int_reg_0(axi_bvalid_int_reg),
        .bram_addr_a(bram_addr_a[10:9]),
        .bram_en_a(bram_en_a),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl
   (SR,
    bram_en_b,
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ,
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ,
    s_axi_rid,
    Q,
    s_axi_arready,
    bram_addr_b,
    s_axi_rdata,
    s_axi_aclk,
    s_axi_arid,
    s_axi_araddr,
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1]_0 ,
    s_axi_rready,
    s_axi_aresetn,
    s_axi_arvalid,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    axi_aresetn_d3,
    axi_aresetn_re_reg,
    bram_rddata_b);
  output [0:0]SR;
  output bram_en_b;
  output \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ;
  output \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ;
  output [0:0]s_axi_rid;
  output [8:0]Q;
  output s_axi_arready;
  output [1:0]bram_addr_b;
  output [63:0]s_axi_rdata;
  input s_axi_aclk;
  input [0:0]s_axi_arid;
  input [13:0]s_axi_araddr;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1]_0 ;
  input s_axi_rready;
  input s_axi_aresetn;
  input s_axi_arvalid;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input axi_aresetn_d3;
  input axi_aresetn_re_reg;
  input [63:0]bram_rddata_b;

  wire \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2_n_0 ;
  wire \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs[1]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[1]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[2]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[3]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[4]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[5]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[6]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[6] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[7] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_23_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_24_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[9] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep__0_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__0_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__1_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__0_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__1_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep__0_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep__0_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep__0_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[6]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[7]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[8]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4_n_0 ;
  wire [9:0]\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ;
  wire [8:6]\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_cnt_en_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_6_n_0 ;
  wire [10:0]\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_63_63_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_63_63_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_63_63_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_63_63_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_63_63_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ;
  wire [10:0]\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_6 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_7 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_10 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_11 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_12 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_13 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_14 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_15 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_16 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_3 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_30 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_31 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_4 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_8 ;
  wire \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_9 ;
  wire \GEN_NO_RD_CMD_OPT.act_rd_burst_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.act_rd_burst_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.act_rd_burst_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.act_rd_burst_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_10_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_12_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_7_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.bram_en_int_i_9_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_one_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_one_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_zero_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.end_brst_rd_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_i_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.no_ar_ack_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_7_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_i_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_6_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0 ;
  wire [8:0]Q;
  wire [0:0]SR;
  wire act_rd_burst;
  wire act_rd_burst_set;
  wire act_rd_burst_two;
  wire addr_rl_rd_buf_in;
  wire ar_active;
  wire araddr_pipe_ld71_out;
  wire axi_araddr_full;
  wire [1:0]axi_arburst_pipe;
  wire axi_aresetn_d3;
  wire axi_aresetn_re_reg;
  wire axi_arid_pipe;
  wire [7:0]axi_arlen_pipe;
  wire axi_arlen_pipe_1_or_2;
  wire axi_arready_int;
  wire [2:0]axi_arsize_pipe;
  wire axi_arsize_pipe_max;
  wire axi_b2b_brst;
  wire axi_early_arready_int;
  wire axi_rd_burst;
  wire axi_rid_temp;
  wire axi_rid_temp2;
  wire axi_rid_temp2_full;
  wire axi_rid_temp_full;
  wire axi_rid_temp_full_d1;
  wire axi_rvalid_clr_ok;
  wire axi_rvalid_set;
  wire axi_rvalid_set_cmb;
  wire [1:0]bram_addr_b;
  wire bram_addr_ld_en;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire [7:0]brst_cnt;
  wire brst_cnt_max_d1;
  wire brst_one;
  wire brst_zero;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_narrow_burst;
  wire curr_narrow_burst_cmb;
  wire curr_wrap_burst;
  wire curr_wrap_burst_reg;
  wire data_out_comp;
  wire data_out_comp0_carry_i_1_n_0;
  wire data_out_comp0_carry_i_2_n_0;
  wire data_out_comp0_carry_i_3_n_0;
  wire data_out_comp0_carry_i_4_n_0;
  wire data_out_comp0_carry_i_5_n_0;
  wire data_out_comp0_carry_i_6_n_0;
  wire data_out_comp0_carry_i_7_n_0;
  wire data_out_comp0_carry_n_1;
  wire data_out_comp0_carry_n_2;
  wire data_out_comp0_carry_n_3;
  wire disable_b2b_brst;
  wire disable_b2b_brst_cmb;
  wire end_brst_rd;
  wire end_brst_rd_clr;
  wire i__carry__0_i_1_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire last_bram_addr;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc;
  wire narrow_bram_addr_inc_d1;
  wire [2:0]narrow_burst_cnt_ld_mod;
  wire [2:0]narrow_burst_cnt_ld_reg;
  wire no_ar_ack;
  wire [10:0]p_0_in;
  wire [10:0]p_0_in__0;
  wire \p_0_out_inferred__9/i__carry__0_n_3 ;
  wire \p_0_out_inferred__9/i__carry_n_0 ;
  wire \p_0_out_inferred__9/i__carry_n_1 ;
  wire \p_0_out_inferred__9/i__carry_n_2 ;
  wire \p_0_out_inferred__9/i__carry_n_3 ;
  wire p_18_out;
  wire p_25_out;
  wire p_31_out;
  wire p_38_out;
  wire p_69_out;
  wire p_75_out;
  wire p_83_out;
  wire p_9_out;
  wire pend_rd_op;
  wire pend_rd_op_cmb;
  wire [9:9]plusOp;
  wire [9:1]plusOp__0;
  wire [1:1]rd_addr_sm_cs;
  wire rd_adv_buf113_out;
  wire [3:0]rd_data_sm_cs;
  wire rl_cnt_en;
  wire [1:0]rlast_sm_cs;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [63:0]s_axi_rdata;
  wire \s_axi_rdata[0]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[10]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[11]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[12]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[13]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[14]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[15]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[16]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[17]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[18]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[19]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[1]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[20]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[21]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[22]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[23]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[24]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[25]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[26]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[27]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[28]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[29]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[2]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[30]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[31]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[32]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[33]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[34]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[35]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[36]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[37]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[38]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[39]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[3]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[40]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[41]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[42]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[43]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[44]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[45]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[46]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[47]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[48]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[49]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[4]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[50]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[51]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[52]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[53]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[54]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[55]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[56]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[57]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[58]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[59]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[5]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[60]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[61]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[62]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[63]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[6]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[7]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[8]_INST_0_i_1_n_0 ;
  wire \s_axi_rdata[9]_INST_0_i_1_n_0 ;
  wire [0:0]s_axi_rid;
  wire s_axi_rready;
  wire sel;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_63_63_SPO_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_63_63_SPO_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_63_63_SPO_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_63_63_SPO_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_63_63_SPO_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_DOD_UNCONNECTED ;
  wire \NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_DOD_UNCONNECTED ;
  wire [3:0]NLW_data_out_comp0_carry_O_UNCONNECTED;
  wire [3:0]\NLW_p_0_out_inferred__9/i__carry_O_UNCONNECTED ;
  wire [3:1]\NLW_p_0_out_inferred__9/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_p_0_out_inferred__9/i__carry__0_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0077FFFFFF0F0000)) 
    \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1 
       (.I0(data_out_comp),
        .I1(rd_adv_buf113_out),
        .I2(sel),
        .I3(rlast_sm_cs[1]),
        .I4(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_3_n_0 ),
        .I5(rlast_sm_cs[0]),
        .O(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F0FFFFF0DFF0000)) 
    \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1 
       (.I0(axi_rd_burst),
        .I1(sel),
        .I2(rlast_sm_cs[0]),
        .I3(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2_n_0 ),
        .I4(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_3_n_0 ),
        .I5(rlast_sm_cs[1]),
        .O(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(data_out_comp),
        .I3(rlast_sm_cs[0]),
        .O(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF000000F4F4F4F4)) 
    \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .I2(rlast_sm_cs[0]),
        .I3(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I4(s_axi_rready),
        .I5(rlast_sm_cs[1]),
        .O(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "idle:00,w8_throttle:010,w8_throttle_b2:101,w8_last_data:11,rd_latency_rlast:01,w8_2nd_last_data:10" *) 
  FDRE \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1_n_0 ),
        .Q(rlast_sm_cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:00,w8_throttle:010,w8_throttle_b2:101,w8_last_data:11,rd_latency_rlast:01,w8_2nd_last_data:10" *) 
  FDRE \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1_n_0 ),
        .Q(rlast_sm_cs[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFD555FFFFC000)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_i_1 
       (.I0(s_axi_arvalid),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I2(s_axi_rready),
        .I3(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I4(axi_aresetn_re_reg),
        .I5(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_i_1_n_0 ),
        .Q(axi_arready_int),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_5_n_0 ),
        .O(p_83_out));
  LUT6 #(
    .INIT(64'h5D5D5D5D5DFF5D5D)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ),
        .I1(brst_zero),
        .I2(rd_adv_buf113_out),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_6_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEEEE00F0FFFFFFF0)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_3 
       (.I0(brst_zero),
        .I1(end_brst_rd),
        .I2(sel),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_adv_buf113_out),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_5 
       (.I0(brst_one),
        .I1(axi_arready_int),
        .I2(s_axi_arvalid),
        .I3(axi_araddr_full),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_6 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_83_out),
        .Q(axi_early_arready_int),
        .R(SR));
  LUT6 #(
    .INIT(64'hABBBFBBBAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2 
       (.I0(bram_addr_ld_en),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_5_n_0 ),
        .I5(ar_active),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000001000A0A0100)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3 
       (.I0(sel),
        .I1(axi_rd_burst),
        .I2(rd_data_sm_cs[3]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[2]),
        .I5(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF500F500F1000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_5 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ),
        .I1(axi_b2b_brst),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_6_n_0 ),
        .I3(rd_adv_buf113_out),
        .I4(end_brst_rd),
        .I5(brst_zero),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0704)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_6 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[2]),
        .I2(rd_data_sm_cs[3]),
        .I3(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2_n_0 ),
        .Q(ar_active),
        .R(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hA080A080A080B080)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17 ),
        .I1(rd_addr_sm_cs),
        .I2(s_axi_arvalid),
        .I3(axi_arready_int),
        .I4(axi_araddr_full),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs[1]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs[1]_i_1_n_0 ),
        .Q(rd_addr_sm_cs),
        .R(\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[0]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[10]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[11]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg[12] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[12]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg[13] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[13]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[1]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[2]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[3]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[4]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[5]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[6]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[7]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[8]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_araddr[9]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hDC00)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1 
       (.I0(bram_addr_ld_en),
        .I1(araddr_pipe_ld71_out),
        .I2(axi_araddr_full),
        .I3(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0 ),
        .Q(axi_araddr_full),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h03AA)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ),
        .I1(s_axi_arburst[0]),
        .I2(s_axi_arburst[1]),
        .I3(araddr_pipe_ld71_out),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arburst[0]),
        .Q(axi_arburst_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arburst[1]),
        .Q(axi_arburst_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arid_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arid),
        .Q(axi_arid_pipe),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h88880008)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2_n_0 ),
        .I1(axi_aresetn_d3),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18 ),
        .I3(axi_araddr_full),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17 ),
        .O(araddr_pipe_ld71_out));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17 ),
        .I1(rd_addr_sm_cs),
        .I2(axi_arready_int),
        .I3(s_axi_arvalid),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_1 
       (.I0(s_axi_arlen[7]),
        .I1(s_axi_arlen[4]),
        .I2(s_axi_arlen[5]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2_n_0 ),
        .O(p_25_out));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[3]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[6]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_reg 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(p_25_out),
        .Q(axi_arlen_pipe_1_or_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[0]),
        .Q(axi_arlen_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[1]),
        .Q(axi_arlen_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[2]),
        .Q(axi_arlen_pipe[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[3]),
        .Q(axi_arlen_pipe[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[4]),
        .Q(axi_arlen_pipe[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[5]),
        .Q(axi_arlen_pipe[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[6]),
        .Q(axi_arlen_pipe[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arlen[7]),
        .Q(axi_arlen_pipe[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arsize[0]),
        .Q(axi_arsize_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arsize[1]),
        .Q(axi_arsize_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld71_out),
        .D(s_axi_arsize[2]),
        .Q(axi_arsize_pipe[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000000088A8)) 
    \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1 
       (.I0(s_axi_aresetn),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_3_n_0 ),
        .I4(end_brst_rd_clr),
        .I5(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2 
       (.I0(narrow_addr_int[0]),
        .I1(narrow_addr_int[1]),
        .I2(narrow_addr_int[2]),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .I4(curr_narrow_burst),
        .O(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_3 
       (.I0(ar_active),
        .I1(pend_rd_op),
        .I2(brst_zero),
        .O(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[0]_i_1 
       (.I0(s_axi_arlen[0]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[1]_i_1 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[2]_i_1 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[3]_i_1 
       (.I0(s_axi_arlen[3]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[4]_i_1 
       (.I0(s_axi_arlen[4]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[5]_i_1 
       (.I0(s_axi_arvalid),
        .I1(axi_arready_int),
        .I2(s_axi_arlen[5]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[6]_i_1 
       (.I0(s_axi_arlen[6]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_2 
       (.I0(s_axi_arlen[7]),
        .I1(s_axi_arvalid),
        .I2(axi_arready_int),
        .O(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[0]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[1]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[2]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[3]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[4]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[5]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[6]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg[7]_i_2_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[7] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21 ),
        .I3(Q[4]),
        .I4(Q[6]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[10]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21 ),
        .I4(Q[5]),
        .I5(Q[7]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[11]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[12]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[13]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB800B8FF)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[3]),
        .I3(bram_addr_ld_en),
        .I4(Q[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_3 
       (.I0(curr_narrow_burst),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .I2(narrow_addr_int[2]),
        .I3(narrow_addr_int[1]),
        .I4(narrow_addr_int[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[5]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[7]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[8]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21 ),
        .I3(Q[5]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[9]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_9 ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_8 ),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_31 ),
        .Q(bram_addr_b[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_30 ),
        .Q(bram_addr_b[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_16 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_15 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_14 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_13 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_12 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_11 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .D(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_10 ),
        .Q(Q[6]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFCFFFCAACCAACCAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3 
       (.I0(s_axi_arsize[2]),
        .I1(axi_arsize_pipe[2]),
        .I2(axi_arsize_pipe[1]),
        .I3(axi_araddr_full),
        .I4(s_axi_arsize[1]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00EF00EC00E300E0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFFFF0035)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h750F750C750F5500)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0F08FFFF0F08F080)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12 
       (.I0(axi_arburst_pipe[0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arburst[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13 
       (.I0(axi_arburst_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arburst[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7F77)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14 
       (.I0(curr_narrow_burst_cmb),
        .I1(axi_aresetn_d3),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_23_n_0 ),
        .I5(curr_fixed_burst),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15 
       (.I0(axi_arlen_pipe[7]),
        .I1(s_axi_arlen[7]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I3(axi_arlen_pipe[6]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[6]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16 
       (.I0(axi_arlen_pipe[5]),
        .I1(s_axi_arlen[5]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I3(axi_arlen_pipe[4]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26 ),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h0000000511050505)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_24_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_2_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19 
       (.I0(axi_arlen_pipe[3]),
        .I1(s_axi_arlen[3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I3(axi_arlen_pipe[2]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20 
       (.I0(axi_arlen_pipe[1]),
        .I1(s_axi_arlen[1]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I3(axi_arlen_pipe[0]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCFFFEFFFEFEFE)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21 
       (.I0(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_6_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26 ),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEFFFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_22 
       (.I0(rd_addr_sm_cs),
        .I1(no_ar_ack),
        .I2(ar_active),
        .I3(pend_rd_op),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19 ),
        .I5(axi_araddr_full),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_23 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ),
        .I4(s_axi_araddr[0]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_23_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_24 
       (.I0(s_axi_arlen[4]),
        .I1(axi_arlen_pipe[4]),
        .I2(s_axi_arlen[2]),
        .I3(axi_araddr_full),
        .I4(axi_arlen_pipe[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF002000200020)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3 
       (.I0(curr_narrow_burst),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ),
        .I3(narrow_bram_addr_inc_d1),
        .I4(curr_narrow_burst_cmb),
        .I5(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .I1(curr_narrow_burst),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5 
       (.I0(axi_arsize_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(axi_arsize_pipe[2]),
        .I4(s_axi_arsize[2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF010000)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8 
       (.I0(narrow_addr_int[0]),
        .I1(narrow_addr_int[1]),
        .I2(narrow_addr_int[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFC00CA0CAC)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .Q(narrow_addr_int[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .Q(narrow_addr_int[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .Q(narrow_addr_int[2]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_3_n_0 ),
        .O(narrow_bram_addr_inc));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_bram_addr_inc),
        .Q(narrow_bram_addr_inc_d1),
        .R(SR));
  LUT5 #(
    .INIT(32'h0333AAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_1 
       (.I0(narrow_burst_cnt_ld_reg[0]),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I4(bram_addr_ld_en),
        .O(narrow_burst_cnt_ld_mod[0]));
  LUT6 #(
    .INIT(64'h0047FFFF00470000)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_1 
       (.I0(axi_arsize_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .I4(bram_addr_ld_en),
        .I5(narrow_burst_cnt_ld_reg[1]),
        .O(narrow_burst_cnt_ld_mod[1]));
  LUT6 #(
    .INIT(64'h0151FFFF01510000)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .I1(s_axi_arsize[0]),
        .I2(axi_araddr_full),
        .I3(axi_arsize_pipe[0]),
        .I4(bram_addr_ld_en),
        .I5(narrow_burst_cnt_ld_reg[2]),
        .O(narrow_burst_cnt_ld_mod[2]));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_mod[0]),
        .Q(narrow_burst_cnt_ld_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_mod[1]),
        .Q(narrow_burst_cnt_ld_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_mod[2]),
        .Q(narrow_burst_cnt_ld_reg[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'hD0DDD00000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3_n_0 ),
        .I2(curr_narrow_burst_cmb),
        .I3(p_75_out),
        .I4(curr_narrow_burst),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2 
       (.I0(pend_rd_op),
        .I1(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00BF)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I1(rlast_sm_cs[0]),
        .I2(rlast_sm_cs[1]),
        .I3(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAACFFFFFFFFFFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_4 
       (.I0(s_axi_arsize[2]),
        .I1(axi_arsize_pipe[2]),
        .I2(axi_arsize_pipe[1]),
        .I3(axi_araddr_full),
        .I4(s_axi_arsize[1]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .O(curr_narrow_burst_cmb));
  LUT6 #(
    .INIT(64'hAAAA8A8AAAA08A80)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_5 
       (.I0(\GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0 ),
        .I1(axi_arburst_pipe[1]),
        .I2(axi_araddr_full),
        .I3(s_axi_arburst[1]),
        .I4(axi_arburst_pipe[0]),
        .I5(s_axi_arburst[0]),
        .O(p_75_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ),
        .Q(curr_narrow_burst),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[0]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[4]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[5]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .O(plusOp__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[6]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4_n_0 ),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[8]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .O(plusOp__0[8]));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I1(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_2 
       (.I0(\p_0_out_inferred__9/i__carry__0_n_3 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .O(addr_rl_rd_buf_in));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[9] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .O(plusOp__0[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[0] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[0]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[1] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[1]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[2] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[2]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[3] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[3]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[4] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[4]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[5] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[5]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[6] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[6]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[7] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[7]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[8] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[8]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg[9] 
       (.C(s_axi_aclk),
        .CE(addr_rl_rd_buf_in),
        .D(plusOp__0[9]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[9] ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in[9]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep__0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep__0_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__1_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__1_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__1_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__1_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep__0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep__0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep__0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep__0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep__0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[6]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[8]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h80FF)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I1(s_axi_rready),
        .I2(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I3(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [9]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .O(plusOp));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_4_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[0]_rep__0_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__0_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[1]_rep__1_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__0_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[2]_rep__1_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[3]_rep__0_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[4]_rep__0_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[5]_rep__0_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[6] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[6]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[7] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[7]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[8] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[8]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[9] 
       (.C(s_axi_aclk),
        .CE(rd_adv_buf113_out),
        .D(plusOp),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [9]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hDC)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_cnt_en_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I1(bram_en_b),
        .I2(rl_cnt_en),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_cnt_en_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_cnt_en_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_cnt_en_i_1_n_0 ),
        .Q(rl_cnt_en),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[0]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .O(p_0_in[0]));
  LUT4 #(
    .INIT(16'hD0FF)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1 
       (.I0(rl_cnt_en),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I3(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_2 
       (.I0(rl_cnt_en),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ),
        .O(p_38_out));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [10]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [8]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [7]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [9]),
        .O(p_0_in[10]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [3]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_6_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_6 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [7]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [5]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [8]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [10]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [9]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [3]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[4]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[5]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[6]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [7]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[8]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [8]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [7]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[9]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [9]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [7]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_5_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [8]),
        .O(p_0_in[9]));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[0]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[10]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [10]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[1]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [1]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[2]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [2]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[3]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [3]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[4]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [4]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[5]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [5]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[6]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [6]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[7]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [7]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[8]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [8]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_38_out),
        .D(p_0_in[9]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [9]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[0]),
        .DIB(bram_rddata_b[1]),
        .DIC(bram_rddata_b[2]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[12]),
        .DIB(bram_rddata_b[13]),
        .DIC(bram_rddata_b[14]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[15]),
        .DIB(bram_rddata_b[16]),
        .DIC(bram_rddata_b[17]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[18]),
        .DIB(bram_rddata_b[19]),
        .DIC(bram_rddata_b[20]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[21]),
        .DIB(bram_rddata_b[22]),
        .DIC(bram_rddata_b[23]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[24]),
        .DIB(bram_rddata_b[25]),
        .DIC(bram_rddata_b[26]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[27]),
        .DIB(bram_rddata_b[28]),
        .DIC(bram_rddata_b[29]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "32" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[30]),
        .DIB(bram_rddata_b[31]),
        .DIC(bram_rddata_b[32]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "33" *) 
  (* ram_slice_end = "35" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[33]),
        .DIB(bram_rddata_b[34]),
        .DIC(bram_rddata_b[35]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "38" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[36]),
        .DIB(bram_rddata_b[37]),
        .DIC(bram_rddata_b[38]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "39" *) 
  (* ram_slice_end = "41" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[39]),
        .DIB(bram_rddata_b[40]),
        .DIC(bram_rddata_b[41]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[3]),
        .DIB(bram_rddata_b[4]),
        .DIC(bram_rddata_b[5]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "42" *) 
  (* ram_slice_end = "44" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[42]),
        .DIB(bram_rddata_b[43]),
        .DIC(bram_rddata_b[44]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "45" *) 
  (* ram_slice_end = "47" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[45]),
        .DIB(bram_rddata_b[46]),
        .DIC(bram_rddata_b[47]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "48" *) 
  (* ram_slice_end = "50" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[48]),
        .DIB(bram_rddata_b[49]),
        .DIC(bram_rddata_b[50]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "51" *) 
  (* ram_slice_end = "53" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[51]),
        .DIB(bram_rddata_b[52]),
        .DIC(bram_rddata_b[53]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "56" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[54]),
        .DIB(bram_rddata_b[55]),
        .DIC(bram_rddata_b[56]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "57" *) 
  (* ram_slice_end = "59" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[57]),
        .DIB(bram_rddata_b[58]),
        .DIC(bram_rddata_b[59]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "60" *) 
  (* ram_slice_end = "62" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[60]),
        .DIB(bram_rddata_b[61]),
        .DIC(bram_rddata_b[62]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "63" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_63_63 
       (.A0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .A1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .A2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .A3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .A4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .A5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .D(bram_rddata_b[63]),
        .DPO(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_63_63_n_0 ),
        .DPRA0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .DPRA1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .DPRA2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .DPRA3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .DPRA4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .DPRA5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .SPO(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_63_63_SPO_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[6]),
        .DIB(bram_rddata_b[7]),
        .DIC(bram_rddata_b[8]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[9]),
        .DIB(bram_rddata_b[10]),
        .DIC(bram_rddata_b[11]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[0]),
        .DIB(bram_rddata_b[1]),
        .DIC(bram_rddata_b[2]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[12]),
        .DIB(bram_rddata_b[13]),
        .DIC(bram_rddata_b[14]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[15]),
        .DIB(bram_rddata_b[16]),
        .DIC(bram_rddata_b[17]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[18]),
        .DIB(bram_rddata_b[19]),
        .DIC(bram_rddata_b[20]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[21]),
        .DIB(bram_rddata_b[22]),
        .DIC(bram_rddata_b[23]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[24]),
        .DIB(bram_rddata_b[25]),
        .DIC(bram_rddata_b[26]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[27]),
        .DIB(bram_rddata_b[28]),
        .DIC(bram_rddata_b[29]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "32" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[30]),
        .DIB(bram_rddata_b[31]),
        .DIC(bram_rddata_b[32]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "33" *) 
  (* ram_slice_end = "35" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[33]),
        .DIB(bram_rddata_b[34]),
        .DIC(bram_rddata_b[35]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "38" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[36]),
        .DIB(bram_rddata_b[37]),
        .DIC(bram_rddata_b[38]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "39" *) 
  (* ram_slice_end = "41" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[39]),
        .DIB(bram_rddata_b[40]),
        .DIC(bram_rddata_b[41]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[3]),
        .DIB(bram_rddata_b[4]),
        .DIC(bram_rddata_b[5]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "42" *) 
  (* ram_slice_end = "44" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[42]),
        .DIB(bram_rddata_b[43]),
        .DIC(bram_rddata_b[44]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "45" *) 
  (* ram_slice_end = "47" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[45]),
        .DIB(bram_rddata_b[46]),
        .DIC(bram_rddata_b[47]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "48" *) 
  (* ram_slice_end = "50" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[48]),
        .DIB(bram_rddata_b[49]),
        .DIC(bram_rddata_b[50]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "51" *) 
  (* ram_slice_end = "53" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[51]),
        .DIB(bram_rddata_b[52]),
        .DIC(bram_rddata_b[53]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "56" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[54]),
        .DIB(bram_rddata_b[55]),
        .DIC(bram_rddata_b[56]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "57" *) 
  (* ram_slice_end = "59" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[57]),
        .DIB(bram_rddata_b[58]),
        .DIC(bram_rddata_b[59]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "60" *) 
  (* ram_slice_end = "62" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[60]),
        .DIB(bram_rddata_b[61]),
        .DIC(bram_rddata_b[62]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "63" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_63_63 
       (.A0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .A1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .A2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .A3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .A4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .A5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .D(bram_rddata_b[63]),
        .DPO(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_63_63_n_0 ),
        .DPRA0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .DPRA1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .DPRA2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .DPRA3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .DPRA4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .DPRA5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .SPO(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_63_63_SPO_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[6]),
        .DIB(bram_rddata_b[7]),
        .DIC(bram_rddata_b[8]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[9]),
        .DIB(bram_rddata_b[10]),
        .DIC(bram_rddata_b[11]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[0]),
        .DIB(bram_rddata_b[1]),
        .DIC(bram_rddata_b[2]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[12]),
        .DIB(bram_rddata_b[13]),
        .DIC(bram_rddata_b[14]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[15]),
        .DIB(bram_rddata_b[16]),
        .DIC(bram_rddata_b[17]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[18]),
        .DIB(bram_rddata_b[19]),
        .DIC(bram_rddata_b[20]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[21]),
        .DIB(bram_rddata_b[22]),
        .DIC(bram_rddata_b[23]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[24]),
        .DIB(bram_rddata_b[25]),
        .DIC(bram_rddata_b[26]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[27]),
        .DIB(bram_rddata_b[28]),
        .DIC(bram_rddata_b[29]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "32" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[30]),
        .DIB(bram_rddata_b[31]),
        .DIC(bram_rddata_b[32]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "33" *) 
  (* ram_slice_end = "35" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[33]),
        .DIB(bram_rddata_b[34]),
        .DIC(bram_rddata_b[35]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "38" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[36]),
        .DIB(bram_rddata_b[37]),
        .DIC(bram_rddata_b[38]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "39" *) 
  (* ram_slice_end = "41" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[39]),
        .DIB(bram_rddata_b[40]),
        .DIC(bram_rddata_b[41]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[3]),
        .DIB(bram_rddata_b[4]),
        .DIC(bram_rddata_b[5]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "42" *) 
  (* ram_slice_end = "44" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[42]),
        .DIB(bram_rddata_b[43]),
        .DIC(bram_rddata_b[44]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "45" *) 
  (* ram_slice_end = "47" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[45]),
        .DIB(bram_rddata_b[46]),
        .DIC(bram_rddata_b[47]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "48" *) 
  (* ram_slice_end = "50" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[48]),
        .DIB(bram_rddata_b[49]),
        .DIC(bram_rddata_b[50]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "51" *) 
  (* ram_slice_end = "53" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[51]),
        .DIB(bram_rddata_b[52]),
        .DIC(bram_rddata_b[53]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "56" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[54]),
        .DIB(bram_rddata_b[55]),
        .DIC(bram_rddata_b[56]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "57" *) 
  (* ram_slice_end = "59" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[57]),
        .DIB(bram_rddata_b[58]),
        .DIC(bram_rddata_b[59]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "60" *) 
  (* ram_slice_end = "62" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1:0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1:0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[60]),
        .DIB(bram_rddata_b[61]),
        .DIC(bram_rddata_b[62]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "63" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_63_63 
       (.A0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .A1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .A2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .A3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .A4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .A5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .D(bram_rddata_b[63]),
        .DPO(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_63_63_n_0 ),
        .DPRA0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .DPRA1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .DPRA2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .DPRA3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .DPRA4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .DPRA5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .SPO(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_63_63_SPO_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[6]),
        .DIB(bram_rddata_b[7]),
        .DIC(bram_rddata_b[8]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[9]),
        .DIB(bram_rddata_b[10]),
        .DIC(bram_rddata_b[11]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[0]),
        .DIB(bram_rddata_b[1]),
        .DIC(bram_rddata_b[2]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[12]),
        .DIB(bram_rddata_b[13]),
        .DIC(bram_rddata_b[14]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[15]),
        .DIB(bram_rddata_b[16]),
        .DIC(bram_rddata_b[17]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[18]),
        .DIB(bram_rddata_b[19]),
        .DIC(bram_rddata_b[20]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[21]),
        .DIB(bram_rddata_b[22]),
        .DIC(bram_rddata_b[23]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[24]),
        .DIB(bram_rddata_b[25]),
        .DIC(bram_rddata_b[26]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[27]),
        .DIB(bram_rddata_b[28]),
        .DIC(bram_rddata_b[29]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "32" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[30]),
        .DIB(bram_rddata_b[31]),
        .DIC(bram_rddata_b[32]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "33" *) 
  (* ram_slice_end = "35" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[33]),
        .DIB(bram_rddata_b[34]),
        .DIC(bram_rddata_b[35]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "38" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[36]),
        .DIB(bram_rddata_b[37]),
        .DIC(bram_rddata_b[38]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "39" *) 
  (* ram_slice_end = "41" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[39]),
        .DIB(bram_rddata_b[40]),
        .DIC(bram_rddata_b[41]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[3]),
        .DIB(bram_rddata_b[4]),
        .DIC(bram_rddata_b[5]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "42" *) 
  (* ram_slice_end = "44" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[42]),
        .DIB(bram_rddata_b[43]),
        .DIC(bram_rddata_b[44]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "45" *) 
  (* ram_slice_end = "47" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[45]),
        .DIB(bram_rddata_b[46]),
        .DIC(bram_rddata_b[47]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "48" *) 
  (* ram_slice_end = "50" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[48]),
        .DIB(bram_rddata_b[49]),
        .DIC(bram_rddata_b[50]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "51" *) 
  (* ram_slice_end = "53" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[51]),
        .DIB(bram_rddata_b[52]),
        .DIC(bram_rddata_b[53]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "56" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[54]),
        .DIB(bram_rddata_b[55]),
        .DIC(bram_rddata_b[56]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "57" *) 
  (* ram_slice_end = "59" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[57]),
        .DIB(bram_rddata_b[58]),
        .DIC(bram_rddata_b[59]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "60" *) 
  (* ram_slice_end = "62" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[60]),
        .DIB(bram_rddata_b[61]),
        .DIC(bram_rddata_b[62]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "63" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_63_63 
       (.A0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .A1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .A2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .A3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .A4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .A5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .D(bram_rddata_b[63]),
        .DPO(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_63_63_n_0 ),
        .DPRA0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .DPRA1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .DPRA2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .DPRA3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .DPRA4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .DPRA5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .SPO(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_63_63_SPO_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[6]),
        .DIB(bram_rddata_b[7]),
        .DIC(bram_rddata_b[8]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "256" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[9]),
        .DIB(bram_rddata_b[10]),
        .DIC(bram_rddata_b[11]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[0]),
        .DIB(bram_rddata_b[1]),
        .DIC(bram_rddata_b[2]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[12]),
        .DIB(bram_rddata_b[13]),
        .DIC(bram_rddata_b[14]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[15]),
        .DIB(bram_rddata_b[16]),
        .DIC(bram_rddata_b[17]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[18]),
        .DIB(bram_rddata_b[19]),
        .DIC(bram_rddata_b[20]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[21]),
        .DIB(bram_rddata_b[22]),
        .DIC(bram_rddata_b[23]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[24]),
        .DIB(bram_rddata_b[25]),
        .DIC(bram_rddata_b[26]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[27]),
        .DIB(bram_rddata_b[28]),
        .DIC(bram_rddata_b[29]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "32" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[30]),
        .DIB(bram_rddata_b[31]),
        .DIC(bram_rddata_b[32]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "33" *) 
  (* ram_slice_end = "35" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[33]),
        .DIB(bram_rddata_b[34]),
        .DIC(bram_rddata_b[35]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "38" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[36]),
        .DIB(bram_rddata_b[37]),
        .DIC(bram_rddata_b[38]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "39" *) 
  (* ram_slice_end = "41" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[39]),
        .DIB(bram_rddata_b[40]),
        .DIC(bram_rddata_b[41]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[3]),
        .DIB(bram_rddata_b[4]),
        .DIC(bram_rddata_b[5]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "42" *) 
  (* ram_slice_end = "44" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[42]),
        .DIB(bram_rddata_b[43]),
        .DIC(bram_rddata_b[44]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "45" *) 
  (* ram_slice_end = "47" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[45]),
        .DIB(bram_rddata_b[46]),
        .DIC(bram_rddata_b[47]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "48" *) 
  (* ram_slice_end = "50" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[4]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[48]),
        .DIB(bram_rddata_b[49]),
        .DIC(bram_rddata_b[50]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "51" *) 
  (* ram_slice_end = "53" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 }),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[51]),
        .DIB(bram_rddata_b[52]),
        .DIC(bram_rddata_b[53]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "56" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[54]),
        .DIB(bram_rddata_b[55]),
        .DIC(bram_rddata_b[56]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "57" *) 
  (* ram_slice_end = "59" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[57]),
        .DIB(bram_rddata_b[58]),
        .DIC(bram_rddata_b[59]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "60" *) 
  (* ram_slice_end = "62" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5:4],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[3]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[60]),
        .DIB(bram_rddata_b[61]),
        .DIC(bram_rddata_b[62]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "63" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_63_63 
       (.A0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .A1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .A2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .A3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .A4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .A5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .D(bram_rddata_b[63]),
        .DPO(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_63_63_n_0 ),
        .DPRA0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep_n_0 ),
        .DPRA1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep__1_n_0 ),
        .DPRA2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep_n_0 ),
        .DPRA3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .DPRA4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .DPRA5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .SPO(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_63_63_SPO_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[6]),
        .DIB(bram_rddata_b[7]),
        .DIC(bram_rddata_b[8]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16448" *) 
  (* RTL_RAM_NAME = "gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_RD_CHNL/GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11 
       (.ADDRA({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRB({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRC({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[5]_rep__0_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4:3],\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[2]_rep__1_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[1]_rep_n_0 ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [0]}),
        .ADDRD({\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ,\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] }),
        .DIA(bram_rddata_b[9]),
        .DIB(bram_rddata_b[10]),
        .DIC(bram_rddata_b[11]),
        .DID(1'b0),
        .DOA(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_0 ),
        .DOB(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_1 ),
        .DOC(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_2 ),
        .DOD(\NLW_GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_DOD_UNCONNECTED ),
        .WCLK(s_axi_aclk),
        .WE(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_5_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_6_n_0 ),
        .O(p_69_out));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_2 
       (.I0(axi_arlen_pipe[6]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[6]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_4 
       (.I0(axi_arlen_pipe[4]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00053305)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_5 
       (.I0(s_axi_arlen[3]),
        .I1(axi_arlen_pipe[3]),
        .I2(s_axi_arlen[2]),
        .I3(axi_araddr_full),
        .I4(axi_arlen_pipe[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_6 
       (.I0(axi_arlen_pipe[5]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[5]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_reg 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(p_69_out),
        .Q(axi_rd_burst),
        .R(SR));
  LUT3 #(
    .INIT(8'hEA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ),
        .O(p_18_out));
  LUT4 #(
    .INIT(16'h00E2)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2 
       (.I0(s_axi_arlen[0]),
        .I1(axi_araddr_full),
        .I2(axi_arlen_pipe[0]),
        .I3(p_69_out),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_4_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[7] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[6] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(p_18_out),
        .Q(sel),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[0]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .O(p_0_in__0[0]));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [10]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [8]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [7]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [9]),
        .O(p_0_in__0[10]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [4]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [3]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[4]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [3]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[5]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [3]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [4]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[6]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [7]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[8]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [8]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [7]),
        .O(p_0_in__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[9]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [9]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [7]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [8]),
        .O(p_0_in__0[9]));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[10]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [10]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [3]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [4]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [5]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[7]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [7]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[8]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [8]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in__0[9]),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [9]),
        .R(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAB08A8000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1 
       (.I0(axi_rid_temp),
        .I1(axi_rvalid_set),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0 ),
        .I3(axi_b2b_brst),
        .I4(s_axi_rid),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1_n_0 ),
        .Q(s_axi_rid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1 
       (.I0(axi_arid_pipe),
        .I1(axi_araddr_full),
        .I2(s_axi_arid),
        .I3(axi_rid_temp_full),
        .I4(bram_addr_ld_en),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3311F00000000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1 
       (.I0(axi_rid_temp_full_d1),
        .I1(p_9_out),
        .I2(bram_addr_ld_en),
        .I3(axi_rid_temp_full),
        .I4(axi_rid_temp2_full),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1_n_0 ),
        .Q(axi_rid_temp2_full),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hCFAACFCFC0AAC0C0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1 
       (.I0(axi_rid_temp2),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3_n_0 ),
        .I3(axi_rid_temp_full),
        .I4(bram_addr_ld_en),
        .I5(axi_rid_temp),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_2 
       (.I0(axi_arid_pipe),
        .I1(axi_araddr_full),
        .I2(s_axi_arid),
        .O(axi_rid_temp2));
  LUT6 #(
    .INIT(64'h8A88AAAA8A888A88)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3 
       (.I0(axi_rid_temp2_full),
        .I1(axi_rvalid_set),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0 ),
        .I3(axi_b2b_brst),
        .I4(axi_rid_temp_full),
        .I5(axi_rid_temp_full_d1),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rid_temp_full),
        .Q(axi_rid_temp_full_d1),
        .R(SR));
  LUT6 #(
    .INIT(64'hBBBBFFA800000000)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1 
       (.I0(axi_rid_temp2_full),
        .I1(p_9_out),
        .I2(axi_rid_temp_full_d1),
        .I3(bram_addr_ld_en),
        .I4(axi_rid_temp_full),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_2 
       (.I0(axi_rvalid_set),
        .I1(s_axi_rready),
        .I2(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I3(axi_b2b_brst),
        .O(p_9_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1_n_0 ),
        .Q(axi_rid_temp_full),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1_n_0 ),
        .Q(axi_rid_temp),
        .R(SR));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0 \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW 
       (.\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_0 (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0] (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_4 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1] (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] (narrow_burst_cnt_ld_reg),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 (\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ),
        .Q(axi_arsize_pipe),
        .axi_araddr_full(axi_araddr_full),
        .bram_addr_ld_en(bram_addr_ld_en),
        .narrow_addr_int(narrow_addr_int),
        .s_axi_araddr(s_axi_araddr[2:0]),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arsize_2_sp_1(\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .ua_narrow_load1_carry_0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .ua_narrow_load1_carry_1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .ua_narrow_load1_carry_i_1__0_0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1 \GEN_NO_RD_CMD_OPT.I_WRAP_BRST 
       (.\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_28 ),
        .\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_29 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_0 (Q[1]),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_1 (Q[2]),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_2 (Q[0]),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 (Q[3]),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_15 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_1 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_4_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_14 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_1 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_13 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_1 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0 (\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_16 ),
        .\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 (\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_3 ),
        .\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ),
        .\GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg (\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ),
        .\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 (brst_cnt),
        .\GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23 ),
        .\GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_4 ),
        .\GEN_NO_RD_CMD_OPT.brst_zero_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2 ),
        .\GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_6 ),
        .\GEN_NO_RD_CMD_OPT.last_bram_addr_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17 ),
        .\GEN_NO_RD_CMD_OPT.pend_rd_op_reg (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18 ),
        .\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .Q(rd_data_sm_cs),
        .SR(SR),
        .ar_active(ar_active),
        .axi_araddr_full(axi_araddr_full),
        .axi_aresetn_d3(axi_aresetn_d3),
        .axi_arlen_pipe_1_or_2(axi_arlen_pipe_1_or_2),
        .axi_arready_int(axi_arready_int),
        .axi_arsize_pipe_max(axi_arsize_pipe_max),
        .axi_b2b_brst(axi_b2b_brst),
        .axi_rd_burst(axi_rd_burst),
        .bram_addr_b(bram_addr_b),
        .bram_addr_ld_en(bram_addr_ld_en),
        .brst_zero(brst_zero),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_narrow_burst(curr_narrow_burst),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .disable_b2b_brst(disable_b2b_brst),
        .end_brst_rd(end_brst_rd),
        .last_bram_addr(last_bram_addr),
        .narrow_addr_int(narrow_addr_int),
        .narrow_bram_addr_inc_d1(narrow_bram_addr_inc_d1),
        .no_ar_ack(no_ar_ack),
        .pend_rd_op(pend_rd_op),
        .rd_addr_sm_cs(rd_addr_sm_cs),
        .rd_adv_buf113_out(rd_adv_buf113_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[13:4]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen[3:0]),
        .s_axi_arsize(s_axi_arsize[2:1]),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rready(s_axi_rready),
        .s_axi_rready_0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22 ),
        .\save_init_bram_addr_ld_reg[10]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_9 ),
        .\save_init_bram_addr_ld_reg[11]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_8 ),
        .\save_init_bram_addr_ld_reg[12]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_31 ),
        .\save_init_bram_addr_ld_reg[13]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_30 ),
        .\save_init_bram_addr_ld_reg[7]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_12 ),
        .\save_init_bram_addr_ld_reg[8]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_11 ),
        .\save_init_bram_addr_ld_reg[9]_0 (\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_10 ),
        .sel(sel),
        .\wrap_burst_total_reg[0]_0 (axi_arsize_pipe[2:1]),
        .\wrap_burst_total_reg[1]_0 (\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .\wrap_burst_total_reg[2]_0 (axi_arlen_pipe[3:0]));
  LUT6 #(
    .INIT(64'h0000000022E2EEE2)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_i_1 
       (.I0(act_rd_burst),
        .I1(act_rd_burst_set),
        .I2(axi_rd_burst),
        .I3(bram_addr_ld_en),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_3_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFC202)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0 ),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[2]),
        .I3(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_4_n_0 ),
        .I4(rd_data_sm_cs[1]),
        .I5(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_5_n_0 ),
        .O(act_rd_burst_set));
  LUT6 #(
    .INIT(64'h0EE00000FFFFFFFF)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_i_3 
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0 ),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA0A8000000000000)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ),
        .I1(end_brst_rd),
        .I2(brst_zero),
        .I3(axi_b2b_brst),
        .I4(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I5(s_axi_rready),
        .O(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hFFFFF100)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_i_5 
       (.I0(sel),
        .I1(axi_rd_burst),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[3]),
        .O(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_1_n_0 ),
        .Q(act_rd_burst),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1 
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst_set),
        .I2(sel),
        .I3(bram_addr_ld_en),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_3_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1_n_0 ),
        .Q(act_rd_burst_two),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h08FF0800)) 
    \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[2]),
        .I3(araddr_pipe_ld71_out),
        .I4(axi_arsize_pipe_max),
        .O(\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1_n_0 ),
        .Q(axi_arsize_pipe_max),
        .R(SR));
  LUT6 #(
    .INIT(64'h2A2A2A2AEAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1 
       (.I0(axi_b2b_brst),
        .I1(rd_data_sm_cs[0]),
        .I2(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22 ),
        .I5(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[3]),
        .O(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1_n_0 ),
        .Q(axi_b2b_brst),
        .R(SR));
  LUT6 #(
    .INIT(64'hDDDDFCCC00000000)) 
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0 ),
        .I2(rlast_sm_cs[1]),
        .I3(rlast_sm_cs[0]),
        .I4(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF020002)) 
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_3_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ),
        .I3(rlast_sm_cs[1]),
        .I4(rd_adv_buf113_out),
        .I5(rlast_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count[10]_i_4_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_count_reg [0]),
        .O(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBBBBBBB800000000)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3_n_0 ),
        .I4(axi_rvalid_clr_ok),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[3]),
        .I3(rd_data_sm_cs[2]),
        .O(\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E0)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0 ),
        .I1(disable_b2b_brst),
        .I2(last_bram_addr),
        .I3(axi_rvalid_clr_ok),
        .O(\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1_n_0 ),
        .Q(axi_rvalid_clr_ok),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h7F7F7F0000000000)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1 
       (.I0(axi_rvalid_clr_ok),
        .I1(s_axi_rready),
        .I2(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I3(axi_rvalid_set),
        .I4(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I5(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1_n_0 ),
        .Q(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_set_i_1 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .O(axi_rvalid_set_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.axi_rvalid_set_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_set_cmb),
        .Q(axi_rvalid_set),
        .R(SR));
  LUT6 #(
    .INIT(64'h1313F3FF13130300)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_1 
       (.I0(rd_data_sm_cs[3]),
        .I1(\GEN_NO_RD_CMD_OPT.bram_en_int_i_2_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.bram_en_int_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.bram_en_int_i_4_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.bram_en_int_i_5_n_0 ),
        .I5(bram_en_b),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAEAAAEAAAE)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_10 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(end_brst_rd),
        .I3(brst_zero),
        .I4(s_axi_rready),
        .I5(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h05C0050005CF050F)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_12 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0 ),
        .I1(rd_adv_buf113_out),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[0]),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2 ),
        .I5(sel),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000007EFF)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_2 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[0]),
        .I3(bram_addr_ld_en),
        .I4(\GEN_NO_RD_CMD_OPT.bram_en_int_i_6_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1555)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_3 
       (.I0(bram_addr_ld_en),
        .I1(pend_rd_op),
        .I2(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I3(s_axi_rready),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_4 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5454545455555554)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_5 
       (.I0(rd_data_sm_cs[3]),
        .I1(\GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.bram_en_int_i_9_n_0 ),
        .I3(bram_addr_ld_en),
        .I4(rd_data_sm_cs[2]),
        .I5(\GEN_NO_RD_CMD_OPT.bram_en_int_i_10_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAEAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_6 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[2]),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2 ),
        .I5(rd_adv_buf113_out),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0C0A0C0A0C0A0C00)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_7 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_3 ),
        .I1(\GEN_NO_RD_CMD_OPT.bram_en_int_i_12_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_4 ),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[0]),
        .I5(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8080800000000000)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_8 
       (.I0(bram_addr_ld_en),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(act_rd_burst_two),
        .I4(act_rd_burst),
        .I5(rd_adv_buf113_out),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF0000DFFF00)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_9 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2 ),
        .I1(rd_adv_buf113_out),
        .I2(brst_one),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[2]),
        .I5(\GEN_NO_RD_CMD_OPT.act_rd_burst_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.bram_en_int_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.bram_en_int_i_1_n_0 ),
        .Q(bram_en_b),
        .R(SR));
  LUT5 #(
    .INIT(32'hB800B8FF)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1 
       (.I0(axi_arlen_pipe[0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[0]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[0]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8FFB800B800B8FF)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1 
       (.I0(axi_arlen_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[1]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[1]),
        .I5(brst_cnt[0]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBBB8888B)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24 ),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[1]),
        .I3(brst_cnt[0]),
        .I4(brst_cnt[2]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B88B)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25 ),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[3]),
        .I3(brst_cnt[1]),
        .I4(brst_cnt[0]),
        .I5(brst_cnt[2]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8FFB800B800B8FF)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1 
       (.I0(axi_arlen_pipe[4]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[4]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[4]),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23 ),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1 
       (.I0(axi_arlen_pipe[5]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[5]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[5]),
        .I5(\GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_2_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_2 
       (.I0(brst_cnt[4]),
        .I1(brst_cnt[3]),
        .I2(brst_cnt[2]),
        .I3(brst_cnt[1]),
        .I4(brst_cnt[0]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1 
       (.I0(axi_arlen_pipe[6]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[6]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[6]),
        .I5(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1 
       (.I0(bram_addr_ld_en),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB88BB8B8)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[7]),
        .I3(brst_cnt[6]),
        .I4(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3 
       (.I0(axi_arlen_pipe[7]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[7]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4 
       (.I0(brst_cnt[0]),
        .I1(brst_cnt[1]),
        .I2(brst_cnt[2]),
        .I3(brst_cnt[3]),
        .I4(brst_cnt[4]),
        .I5(brst_cnt[5]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_max_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .Q(brst_cnt_max_d1),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1_n_0 ),
        .Q(brst_cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1_n_0 ),
        .Q(brst_cnt[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1_n_0 ),
        .Q(brst_cnt[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1_n_0 ),
        .Q(brst_cnt[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1_n_0 ),
        .Q(brst_cnt[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1_n_0 ),
        .Q(brst_cnt[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1_n_0 ),
        .Q(brst_cnt[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2_n_0 ),
        .Q(brst_cnt[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000A0AAA088)) 
    \GEN_NO_RD_CMD_OPT.brst_one_i_1 
       (.I0(s_axi_aresetn),
        .I1(brst_one),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_2_n_0 ),
        .I3(bram_addr_ld_en),
        .I4(\GEN_NO_RD_CMD_OPT.brst_one_i_2_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.brst_one_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \GEN_NO_RD_CMD_OPT.brst_one_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .I1(brst_cnt[2]),
        .I2(brst_cnt[3]),
        .I3(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0 ),
        .I4(brst_cnt[1]),
        .I5(brst_cnt[0]),
        .O(\GEN_NO_RD_CMD_OPT.brst_one_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_one_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.brst_one_i_1_n_0 ),
        .Q(brst_one),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h5400)) 
    \GEN_NO_RD_CMD_OPT.brst_zero_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0 ),
        .I2(brst_zero),
        .I3(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.brst_zero_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hA8AAA888)) 
    \GEN_NO_RD_CMD_OPT.brst_zero_i_2 
       (.I0(bram_addr_ld_en),
        .I1(p_69_out),
        .I2(axi_arlen_pipe[0]),
        .I3(axi_araddr_full),
        .I4(s_axi_arlen[0]),
        .O(\GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.brst_zero_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.brst_zero_i_1_n_0 ),
        .Q(brst_zero),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_i_1 
       (.I0(s_axi_arburst[0]),
        .I1(axi_arburst_pipe[0]),
        .I2(s_axi_arburst[1]),
        .I3(axi_araddr_full),
        .I4(axi_arburst_pipe[1]),
        .O(curr_fixed_burst));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(curr_fixed_burst),
        .Q(curr_fixed_burst_reg),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h000ACC0A)) 
    \GEN_NO_RD_CMD_OPT.curr_wrap_burst_reg_i_1 
       (.I0(s_axi_arburst[1]),
        .I1(axi_arburst_pipe[1]),
        .I2(s_axi_arburst[0]),
        .I3(axi_araddr_full),
        .I4(axi_arburst_pipe[0]),
        .O(curr_wrap_burst));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.curr_wrap_burst_reg_reg 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(curr_wrap_burst),
        .Q(curr_wrap_burst_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'hEAEAEAAAEAAAEAEA)) 
    \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0 ),
        .I1(rd_data_sm_cs[3]),
        .I2(disable_b2b_brst),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[0]),
        .I5(rd_data_sm_cs[1]),
        .O(disable_b2b_brst_cmb));
  LUT6 #(
    .INIT(64'h00000000FFF0D8D8)) 
    \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3_n_0 ),
        .I2(disable_b2b_brst),
        .I3(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_4_n_0 ),
        .I4(rd_data_sm_cs[2]),
        .I5(rd_data_sm_cs[3]),
        .O(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3 
       (.I0(sel),
        .I1(axi_rd_burst),
        .O(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0404040404040400)) 
    \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_4 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_adv_buf113_out),
        .I3(brst_one),
        .I4(brst_zero),
        .I5(end_brst_rd),
        .O(\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.disable_b2b_brst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(disable_b2b_brst_cmb),
        .Q(disable_b2b_brst),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFBEBF40400000)) 
    \GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[0]),
        .I3(bram_addr_ld_en),
        .I4(rd_data_sm_cs[2]),
        .I5(end_brst_rd_clr),
        .O(\GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.end_brst_rd_clr_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1_n_0 ),
        .Q(end_brst_rd_clr),
        .R(SR));
  LUT5 #(
    .INIT(32'h55300000)) 
    \GEN_NO_RD_CMD_OPT.end_brst_rd_i_1 
       (.I0(end_brst_rd_clr),
        .I1(brst_cnt_max_d1),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .I3(end_brst_rd),
        .I4(s_axi_aresetn),
        .O(\GEN_NO_RD_CMD_OPT.end_brst_rd_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.end_brst_rd_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.end_brst_rd_i_1_n_0 ),
        .Q(end_brst_rd),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEFEFEFEEEFEEEFEE)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0 ),
        .I2(rd_data_sm_cs[0]),
        .I3(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_4_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0 ),
        .O(p_31_out));
  LUT6 #(
    .INIT(64'h1010101000001000)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0 ),
        .I3(pend_rd_op),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_3 ),
        .I5(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_0 ),
        .I1(brst_cnt[2]),
        .I2(brst_cnt[3]),
        .I3(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0 ),
        .I4(brst_cnt[0]),
        .I5(brst_cnt[1]),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h00000040)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_4 
       (.I0(rd_data_sm_cs[1]),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_8_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .I4(rd_data_sm_cs[2]),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_5 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[3]),
        .I2(s_axi_rready),
        .I3(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_6 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_7 
       (.I0(brst_cnt[4]),
        .I1(brst_cnt[6]),
        .I2(brst_cnt[5]),
        .I3(brst_cnt[7]),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h001D)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_i_8 
       (.I0(s_axi_arlen[0]),
        .I1(axi_araddr_full),
        .I2(axi_arlen_pipe[0]),
        .I3(p_69_out),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.last_bram_addr_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_31_out),
        .Q(last_bram_addr),
        .R(SR));
  LUT6 #(
    .INIT(64'hFF0FFFFF00008800)) 
    \GEN_NO_RD_CMD_OPT.no_ar_ack_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .I4(rd_data_sm_cs[2]),
        .I5(no_ar_ack),
        .O(\GEN_NO_RD_CMD_OPT.no_ar_ack_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.no_ar_ack_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.no_ar_ack_i_1_n_0 ),
        .Q(no_ar_ack),
        .R(SR));
  LUT6 #(
    .INIT(64'h002AFFFF002A0000)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_2_n_0 ),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0 ),
        .I4(pend_rd_op_cmb),
        .I5(pend_rd_op),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFCCCFEEEECCCC)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .I1(rd_data_sm_cs[3]),
        .I2(axi_rd_burst),
        .I3(sel),
        .I4(rd_data_sm_cs[2]),
        .I5(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_3 
       (.I0(bram_addr_ld_en),
        .I1(end_brst_rd),
        .I2(ar_active),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF40500010)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_4 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .I2(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_5_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_6_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_7_n_0 ),
        .O(pend_rd_op_cmb));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_5 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[2]),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_6 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(pend_rd_op),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFCF4CC44FFF4CC44)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_7 
       (.I0(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_8_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2_n_0 ),
        .I2(pend_rd_op),
        .I3(bram_addr_ld_en),
        .I4(axi_rvalid_set_cmb),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_3 ),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h77770FFF0FFFFFFF)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_i_8 
       (.I0(ar_active),
        .I1(end_brst_rd),
        .I2(pend_rd_op),
        .I3(\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0 ),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NO_RD_CMD_OPT.pend_rd_op_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NO_RD_CMD_OPT.pend_rd_op_i_1_n_0 ),
        .Q(pend_rd_op),
        .R(SR));
  LUT6 #(
    .INIT(64'h0003444433337777)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_1 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[3]),
        .I2(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0 ),
        .I4(rd_data_sm_cs[2]),
        .I5(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE0000000E000E000)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2 
       (.I0(act_rd_burst),
        .I1(act_rd_burst_two),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[0]),
        .I4(bram_addr_ld_en),
        .I5(rd_adv_buf113_out),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0070)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEFEF0FEFEFE)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_5_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_6_n_0 ),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_3 ),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_5 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [1]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [8]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [5]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [9]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [6]),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_6 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_8_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [10]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [4]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [7]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [2]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RD_DATA_SM_RL.rd_latency_count_reg [3]),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_8 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h3737343704040404)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2_n_0 ),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[0]),
        .I4(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF00FF00FF00FF80F)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[0]),
        .I4(pend_rd_op),
        .I5(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3 
       (.I0(rd_data_sm_cs[1]),
        .I1(axi_rd_burst),
        .I2(sel),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hFFFFAABA)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_5_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20 ),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(\GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h557F5F7F55755F75)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_5 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_adv_buf113_out),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(\GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2 ),
        .I5(sel),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h060A)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_1 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[3]),
        .I3(rd_data_sm_cs[1]),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFBBB00200888)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3_n_0 ),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[2]),
        .I5(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000F000007F0000)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_2 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[3]),
        .I5(rd_data_sm_cs[2]),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEBFAAAAAAAAA)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3 
       (.I0(rd_adv_buf113_out),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[0]),
        .I5(bram_addr_ld_en),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEBFAFFC3EBFA)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4 
       (.I0(bram_addr_ld_en),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[0]),
        .I5(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFF7FFF77)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(axi_b2b_brst),
        .I3(brst_zero),
        .I4(end_brst_rd),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0 ));
  FDRE \GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_1_n_0 ),
        .Q(rd_data_sm_cs[0]),
        .R(SR));
  FDRE \GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_1_n_0 ),
        .Q(rd_data_sm_cs[1]),
        .R(SR));
  FDRE \GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_1_n_0 ),
        .Q(rd_data_sm_cs[2]),
        .R(SR));
  FDRE \GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_2_n_0 ),
        .Q(rd_data_sm_cs[3]),
        .R(SR));
  CARRY4 data_out_comp0_carry
       (.CI(1'b0),
        .CO({data_out_comp,data_out_comp0_carry_n_1,data_out_comp0_carry_n_2,data_out_comp0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_data_out_comp0_carry_O_UNCONNECTED[3:0]),
        .S({data_out_comp0_carry_i_1_n_0,data_out_comp0_carry_i_2_n_0,data_out_comp0_carry_i_3_n_0,data_out_comp0_carry_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    data_out_comp0_carry_i_1
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [9]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_i_3_n_0 ),
        .O(data_out_comp0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0024410041000041)) 
    data_out_comp0_carry_i_2
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[7] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[6] ),
        .I4(data_out_comp0_carry_i_5_n_0),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .O(data_out_comp0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2882)) 
    data_out_comp0_carry_i_3
       (.I0(data_out_comp0_carry_i_6_n_0),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ),
        .I2(data_out_comp0_carry_i_7_n_0),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [5]),
        .O(data_out_comp0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000099090090000)) 
    data_out_comp0_carry_i_4
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [2]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [1]),
        .O(data_out_comp0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    data_out_comp0_carry_i_5
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ),
        .O(data_out_comp0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h8484844221212118)) 
    data_out_comp0_carry_i_6
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [3]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg [4]),
        .O(data_out_comp0_carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    data_out_comp0_carry_i_7
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .O(data_out_comp0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_1
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[8] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[9] ),
        .O(i__carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_1
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[7] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[6] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_2
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .O(i__carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_3
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .O(i__carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_4
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .O(i__carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[7] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[7] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[6] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[6] ),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[5] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[5] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[4] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[4] ),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[3] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[3] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[2] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[2] ),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[1] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[1] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_in_reg_n_0_[0] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_CURR_ARLEN_RL.GEN_CURR_ARLEN_DUAL.curr_arlen_reg_reg_n_0_[0] ),
        .O(i__carry_i_8_n_0));
  CARRY4 \p_0_out_inferred__9/i__carry 
       (.CI(1'b0),
        .CO({\p_0_out_inferred__9/i__carry_n_0 ,\p_0_out_inferred__9/i__carry_n_1 ,\p_0_out_inferred__9/i__carry_n_2 ,\p_0_out_inferred__9/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O(\NLW_p_0_out_inferred__9/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  CARRY4 \p_0_out_inferred__9/i__carry__0 
       (.CI(\p_0_out_inferred__9/i__carry_n_0 ),
        .CO({\NLW_p_0_out_inferred__9/i__carry__0_CO_UNCONNECTED [3:1],\p_0_out_inferred__9/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_p_0_out_inferred__9/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,i__carry__0_i_1_n_0}));
  LUT4 #(
    .INIT(16'hEAAA)) 
    s_axi_arready_INST_0
       (.I0(axi_arready_int),
        .I1(\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0 ),
        .I2(s_axi_rready),
        .I3(axi_early_arready_int),
        .O(s_axi_arready));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[0]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[0]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[0]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_0 ),
        .O(\s_axi_rdata[0]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[10]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[10]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[10]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_1 ),
        .O(\s_axi_rdata[10]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[11]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[11]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[11]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_2 ),
        .O(\s_axi_rdata[11]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[12]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[12]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[12]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_0 ),
        .O(\s_axi_rdata[12]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[13]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[13]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[13]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_1 ),
        .O(\s_axi_rdata[13]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[14]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_12_14_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[14]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[14]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_12_14_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_12_14_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_12_14_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_12_14_n_2 ),
        .O(\s_axi_rdata[14]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[15]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[15]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[15]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_0 ),
        .O(\s_axi_rdata[15]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[16]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[16]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[16]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_1 ),
        .O(\s_axi_rdata[16]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[17]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_15_17_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[17]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[17]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_15_17_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_15_17_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_15_17_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_15_17_n_2 ),
        .O(\s_axi_rdata[17]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[18]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[18]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[18]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_0 ),
        .O(\s_axi_rdata[18]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[19]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[19]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[19]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_1 ),
        .O(\s_axi_rdata[19]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[1]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[1]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[1]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_1 ),
        .O(\s_axi_rdata[1]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[20]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_18_20_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[20]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[20]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_18_20_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_18_20_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_18_20_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_18_20_n_2 ),
        .O(\s_axi_rdata[20]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[21]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[21]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[21]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_0 ),
        .O(\s_axi_rdata[21]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[22]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[22]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[22]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_1 ),
        .O(\s_axi_rdata[22]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[23]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_21_23_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[23]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[23]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_21_23_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_21_23_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_21_23_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_21_23_n_2 ),
        .O(\s_axi_rdata[23]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[24]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[24]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[24]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_0 ),
        .O(\s_axi_rdata[24]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[25]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[25]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[25]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_1 ),
        .O(\s_axi_rdata[25]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[26]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_24_26_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[26]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[26]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_24_26_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_24_26_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_24_26_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_24_26_n_2 ),
        .O(\s_axi_rdata[26]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[27]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[27]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[27]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_0 ),
        .O(\s_axi_rdata[27]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[28]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[28]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[28]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_1 ),
        .O(\s_axi_rdata[28]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[29]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_27_29_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[29]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[29]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_27_29_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_27_29_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_27_29_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_27_29_n_2 ),
        .O(\s_axi_rdata[29]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[2]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_0_2_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[2]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[2]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_0_2_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_0_2_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_0_2_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_0_2_n_2 ),
        .O(\s_axi_rdata[2]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[30]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[30]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[30]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_0 ),
        .O(\s_axi_rdata[30]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[31]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[31]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[31]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_1 ),
        .O(\s_axi_rdata[31]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[32]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_30_32_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[32]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[32]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[32]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_30_32_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_30_32_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_30_32_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_30_32_n_2 ),
        .O(\s_axi_rdata[32]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[33]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[33]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[33]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[33]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_0 ),
        .O(\s_axi_rdata[33]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[34]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[34]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[34]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[34]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_1 ),
        .O(\s_axi_rdata[34]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[35]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_33_35_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[35]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[35]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[35]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_33_35_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_33_35_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_33_35_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_33_35_n_2 ),
        .O(\s_axi_rdata[35]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[36]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[36]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[36]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[36]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_0 ),
        .O(\s_axi_rdata[36]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[37]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[37]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[37]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[37]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_1 ),
        .O(\s_axi_rdata[37]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[38]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_36_38_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[38]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[38]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[38]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_36_38_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_36_38_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_36_38_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_36_38_n_2 ),
        .O(\s_axi_rdata[38]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[39]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[39]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[39]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[39]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_0 ),
        .O(\s_axi_rdata[39]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[3]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[3]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[3]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_0 ),
        .O(\s_axi_rdata[3]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[40]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[40]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[40]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[40]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_1 ),
        .O(\s_axi_rdata[40]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[41]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_39_41_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[41]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[41]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[41]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_39_41_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_39_41_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_39_41_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_39_41_n_2 ),
        .O(\s_axi_rdata[41]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[42]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[42]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[42]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[42]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_0 ),
        .O(\s_axi_rdata[42]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[43]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[43]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[43]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[43]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_1 ),
        .O(\s_axi_rdata[43]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[44]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_42_44_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[44]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[44]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[44]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_42_44_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_42_44_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_42_44_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_42_44_n_2 ),
        .O(\s_axi_rdata[44]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[45]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[45]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[45]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[45]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_0 ),
        .O(\s_axi_rdata[45]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[46]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[46]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[46]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[46]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_1 ),
        .O(\s_axi_rdata[46]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[47]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_45_47_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[47]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[47]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[47]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_45_47_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_45_47_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_45_47_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_45_47_n_2 ),
        .O(\s_axi_rdata[47]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[48]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[48]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[48]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[48]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_0 ),
        .O(\s_axi_rdata[48]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[49]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[49]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[49]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[49]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_1 ),
        .O(\s_axi_rdata[49]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[4]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[4]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[4]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_1 ),
        .O(\s_axi_rdata[4]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[50]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_48_50_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[50]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[50]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[50]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_48_50_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_48_50_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_48_50_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_48_50_n_2 ),
        .O(\s_axi_rdata[50]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[51]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[51]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[51]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[51]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_0 ),
        .O(\s_axi_rdata[51]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[52]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[52]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[52]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[52]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_1 ),
        .O(\s_axi_rdata[52]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[53]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_51_53_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[53]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[53]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[53]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_51_53_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_51_53_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_51_53_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_51_53_n_2 ),
        .O(\s_axi_rdata[53]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[54]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[54]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[54]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[54]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_0 ),
        .O(\s_axi_rdata[54]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[55]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[55]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[55]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[55]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_1 ),
        .O(\s_axi_rdata[55]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[56]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_54_56_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[56]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[56]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[56]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_54_56_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_54_56_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_54_56_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_54_56_n_2 ),
        .O(\s_axi_rdata[56]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[57]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[57]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[57]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[57]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_0 ),
        .O(\s_axi_rdata[57]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[58]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[58]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[58]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[58]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_1 ),
        .O(\s_axi_rdata[58]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[59]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_57_59_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[59]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[59]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[59]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_57_59_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_57_59_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_57_59_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_57_59_n_2 ),
        .O(\s_axi_rdata[59]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[5]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_3_5_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[5]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[5]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_3_5_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_3_5_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_3_5_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_3_5_n_2 ),
        .O(\s_axi_rdata[5]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[60]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[60]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[60]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[60]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_0 ),
        .O(\s_axi_rdata[60]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[61]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[61]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[61]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[61]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_1 ),
        .O(\s_axi_rdata[61]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[62]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_60_62_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[62]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[62]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[62]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_60_62_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_60_62_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_60_62_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_60_62_n_2 ),
        .O(\s_axi_rdata[62]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[63]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_63_63_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[63]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[63]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[63]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_63_63_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_63_63_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_63_63_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_63_63_n_0 ),
        .O(\s_axi_rdata[63]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[6]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[6]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[6]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_0 ),
        .O(\s_axi_rdata[6]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[7]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[7]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[7]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_1 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_1 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_1 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_1 ),
        .O(\s_axi_rdata[7]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[8]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_6_8_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[8]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[8]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_6_8_n_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_6_8_n_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_6_8_n_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_6_8_n_2 ),
        .O(\s_axi_rdata[8]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \s_axi_rdata[9]_INST_0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_256_319_9_11_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [8]),
        .I4(\s_axi_rdata[9]_INST_0_i_1_n_0 ),
        .O(s_axi_rdata[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[9]_INST_0_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_192_255_9_11_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_128_191_9_11_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [7]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_64_127_9_11_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg_rep [6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.rl_rd_buf_reg_0_63_9_11_n_0 ),
        .O(\s_axi_rdata[9]_INST_0_i_1_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow
   (\s_axi_awsize[2] ,
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] ,
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] ,
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] ,
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] ,
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ,
    axi_awaddr_full,
    s_axi_awaddr,
    \GEN_NARROW_CNT.narrow_addr_int_reg[0] ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ,
    Q,
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[1] ,
    D,
    \GEN_NARROW_CNT.narrow_addr_int_reg[2] ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ,
    ua_narrow_load1_carry_i_1_0,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ,
    s_axi_awsize,
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg );
  output \s_axi_awsize[2] ;
  output \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] ;
  output \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] ;
  output \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ;
  output \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] ;
  output \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] ;
  output \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] ;
  output \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ;
  output \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ;
  input axi_awaddr_full;
  input [2:0]s_axi_awaddr;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[0] ;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ;
  input [0:0]Q;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  input [1:0]D;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[2] ;
  input \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ;
  input ua_narrow_load1_carry_i_1_0;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ;
  input [1:0]s_axi_awsize;
  input [1:0]\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg ;

  wire [1:0]D;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ;
  wire \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] ;
  wire \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[0] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[2] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ;
  wire [1:0]\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 ;
  wire [0:0]Q;
  wire axi_awaddr_full;
  wire [2:0]s_axi_awaddr;
  wire [1:0]s_axi_awsize;
  wire \s_axi_awsize[2] ;
  wire ua_narrow_load1_carry_i_1_0;
  wire ua_narrow_load1_carry_i_1_n_0;
  wire ua_narrow_load1_carry_i_2_n_0;
  wire ua_narrow_load1_carry_i_3_n_0;
  wire ua_narrow_load1_carry_i_4_n_0;
  wire ua_narrow_load1_carry_i_5_n_0;
  wire ua_narrow_load1_carry_n_2;
  wire ua_narrow_load1_carry_n_3;
  wire [3:2]NLW_ua_narrow_load1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_ua_narrow_load1_carry_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_2 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int_reg[0] ),
        .I1(ua_narrow_load1_carry_n_2),
        .I2(\GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ),
        .I3(Q),
        .I4(\GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ),
        .O(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] ));
  LUT5 #(
    .INIT(32'h82FF8200)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_2 
       (.I0(ua_narrow_load1_carry_n_2),
        .I1(\GEN_NARROW_CNT.narrow_addr_int_reg[1] ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int_reg[0] ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ),
        .I4(D[0]),
        .O(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] ));
  LUT5 #(
    .INIT(32'hFFFF44F0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_2 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int_reg[2] ),
        .I1(ua_narrow_load1_carry_n_2),
        .I2(D[1]),
        .I3(\GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ),
        .O(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 [1]),
        .I2(s_axi_awsize[0]),
        .I3(axi_awaddr_full),
        .I4(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 [0]),
        .O(\s_axi_awsize[2] ));
  CARRY4 ua_narrow_load1_carry
       (.CI(1'b0),
        .CO({NLW_ua_narrow_load1_carry_CO_UNCONNECTED[3:2],ua_narrow_load1_carry_n_2,ua_narrow_load1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,ua_narrow_load1_carry_i_1_n_0,ua_narrow_load1_carry_i_2_n_0}),
        .O(NLW_ua_narrow_load1_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,ua_narrow_load1_carry_i_3_n_0,ua_narrow_load1_carry_i_4_n_0}));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    ua_narrow_load1_carry_i_1
       (.I0(\s_axi_awsize[2] ),
        .I1(ua_narrow_load1_carry_i_5_n_0),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[2]),
        .O(ua_narrow_load1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000404040004)) 
    ua_narrow_load1_carry_i_2
       (.I0(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ),
        .I1(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] ),
        .I2(ua_narrow_load1_carry_i_1_0),
        .I3(s_axi_awaddr[2]),
        .I4(axi_awaddr_full),
        .I5(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ),
        .O(ua_narrow_load1_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h75777555)) 
    ua_narrow_load1_carry_i_3
       (.I0(\s_axi_awsize[2] ),
        .I1(ua_narrow_load1_carry_i_5_n_0),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[2]),
        .O(ua_narrow_load1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000EEEC0000C2C0)) 
    ua_narrow_load1_carry_i_4
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] ),
        .I1(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] ),
        .I2(ua_narrow_load1_carry_i_1_0),
        .I3(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] ),
        .I4(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ),
        .I5(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ),
        .O(ua_narrow_load1_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h33377737FFFFFFFF)) 
    ua_narrow_load1_carry_i_5
       (.I0(ua_narrow_load1_carry_i_1_0),
        .I1(\s_axi_awsize[2] ),
        .I2(s_axi_awaddr[0]),
        .I3(axi_awaddr_full),
        .I4(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ),
        .I5(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] ),
        .O(ua_narrow_load1_carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_6__0
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg ),
        .I1(axi_awaddr_full),
        .I2(s_axi_awaddr[1]),
        .O(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_7
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ),
        .I1(axi_awaddr_full),
        .I2(s_axi_awaddr[0]),
        .O(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_8
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ),
        .I1(axi_awaddr_full),
        .I2(s_axi_awaddr[2]),
        .O(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_4 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 [0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[0]),
        .O(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_7 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 [1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[1]),
        .O(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ));
endmodule

(* ORIG_REF_NAME = "ua_narrow" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0
   (s_axi_arsize_2_sp_1,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0] ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ,
    Q,
    axi_araddr_full,
    s_axi_arsize,
    ua_narrow_load1_carry_i_1__0_0,
    s_axi_araddr,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ,
    bram_addr_ld_en,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_4 ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1] ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1 ,
    ua_narrow_load1_carry_0,
    ua_narrow_load1_carry_1,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_0 ,
    narrow_addr_int,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 );
  output s_axi_arsize_2_sp_1;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ;
  output \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0] ;
  output \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ;
  output \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ;
  input [2:0]Q;
  input axi_araddr_full;
  input [2:0]s_axi_arsize;
  input ua_narrow_load1_carry_i_1__0_0;
  input [2:0]s_axi_araddr;
  input [2:0]\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ;
  input bram_addr_ld_en;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_4 ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1 ;
  input ua_narrow_load1_carry_0;
  input ua_narrow_load1_carry_1;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_0 ;
  input [2:0]narrow_addr_int;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 ;
  input \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 ;

  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_4 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  wire [2:0]\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 ;
  wire [2:0]Q;
  wire axi_araddr_full;
  wire bram_addr_ld_en;
  wire [2:0]narrow_addr_int;
  wire [2:0]s_axi_araddr;
  wire [2:0]s_axi_arsize;
  wire s_axi_arsize_2_sn_1;
  wire ua_narrow_load1_carry_0;
  wire ua_narrow_load1_carry_1;
  wire ua_narrow_load1_carry_i_10_n_0;
  wire ua_narrow_load1_carry_i_1__0_0;
  wire ua_narrow_load1_carry_i_1__0_n_0;
  wire ua_narrow_load1_carry_i_2__0_n_0;
  wire ua_narrow_load1_carry_i_3__0_n_0;
  wire ua_narrow_load1_carry_i_4__0_n_0;
  wire ua_narrow_load1_carry_i_5__0_n_0;
  wire ua_narrow_load1_carry_i_6_n_0;
  wire ua_narrow_load1_carry_n_2;
  wire ua_narrow_load1_carry_n_3;
  wire [3:2]NLW_ua_narrow_load1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_ua_narrow_load1_carry_O_UNCONNECTED;

  assign s_axi_arsize_2_sp_1 = s_axi_arsize_2_sn_1;
  LUT4 #(
    .INIT(16'hB88B)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 ),
        .I3(narrow_addr_int[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h3A003A003AFF3A00)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] [0]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 ),
        .I2(bram_addr_ld_en),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 ),
        .I4(ua_narrow_load1_carry_n_2),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_4 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFACA0A3)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0 ),
        .I1(narrow_addr_int[0]),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 ),
        .I4(narrow_addr_int[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h74FF740074007400)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2 
       (.I0(s_axi_arsize_2_sn_1),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] [1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 ),
        .I4(ua_narrow_load1_carry_n_2),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAFFAAFCAA00AA03)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0 ),
        .I1(narrow_addr_int[0]),
        .I2(narrow_addr_int[1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_2 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_3 ),
        .I5(narrow_addr_int[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0] ));
  LUT6 #(
    .INIT(64'hB800B800B8FFB800)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2] [2]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3 ),
        .I4(ua_narrow_load1_carry_n_2),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2 
       (.I0(s_axi_arsize[2]),
        .I1(Q[2]),
        .I2(s_axi_arsize[1]),
        .I3(axi_araddr_full),
        .I4(Q[1]),
        .O(s_axi_arsize_2_sn_1));
  CARRY4 ua_narrow_load1_carry
       (.CI(1'b0),
        .CO({NLW_ua_narrow_load1_carry_CO_UNCONNECTED[3:2],ua_narrow_load1_carry_n_2,ua_narrow_load1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,ua_narrow_load1_carry_i_1__0_n_0,ua_narrow_load1_carry_i_2__0_n_0}),
        .O(NLW_ua_narrow_load1_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,ua_narrow_load1_carry_i_3__0_n_0,ua_narrow_load1_carry_i_4__0_n_0}));
  LUT6 #(
    .INIT(64'hFFFF0151FFFFFFFF)) 
    ua_narrow_load1_carry_i_10
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .I1(s_axi_araddr[0]),
        .I2(axi_araddr_full),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 ),
        .I4(s_axi_arsize_2_sn_1),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ),
        .O(ua_narrow_load1_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    ua_narrow_load1_carry_i_1__0
       (.I0(Q[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(Q[2]),
        .I4(s_axi_arsize[2]),
        .I5(ua_narrow_load1_carry_i_5__0_n_0),
        .O(ua_narrow_load1_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h02A2)) 
    ua_narrow_load1_carry_i_2__0
       (.I0(ua_narrow_load1_carry_i_6_n_0),
        .I1(s_axi_araddr[2]),
        .I2(axi_araddr_full),
        .I3(ua_narrow_load1_carry_i_1__0_0),
        .O(ua_narrow_load1_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    ua_narrow_load1_carry_i_3__0
       (.I0(Q[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(Q[2]),
        .I4(s_axi_arsize[2]),
        .I5(ua_narrow_load1_carry_i_5__0_n_0),
        .O(ua_narrow_load1_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h00000000FFF0A088)) 
    ua_narrow_load1_carry_i_4__0
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .I4(ua_narrow_load1_carry_0),
        .I5(ua_narrow_load1_carry_1),
        .O(ua_narrow_load1_carry_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hD0DDD000)) 
    ua_narrow_load1_carry_i_5__0
       (.I0(ua_narrow_load1_carry_i_10_n_0),
        .I1(ua_narrow_load1_carry_i_6_n_0),
        .I2(ua_narrow_load1_carry_i_1__0_0),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[2]),
        .O(ua_narrow_load1_carry_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h0000000047034400)) 
    ua_narrow_load1_carry_i_6
       (.I0(Q[2]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[2]),
        .I3(Q[1]),
        .I4(s_axi_arsize[1]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .O(ua_narrow_load1_carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_7__0
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_0 ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ));
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_8__0
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4 ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_9
       (.I0(ua_narrow_load1_carry_i_1__0_0),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[2]_i_3__0 
       (.I0(Q[0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl
   (axi_aresetn_re_reg,
    bram_en_a,
    bram_wrdata_a,
    axi_aresetn_d3,
    axi_bvalid_int_reg_0,
    s_axi_wready,
    \GEN_AWREADY.axi_aresetn_d3_reg_0 ,
    s_axi_awready,
    s_axi_bid,
    Q,
    bram_addr_a,
    bram_we_a,
    SR,
    s_axi_aclk,
    s_axi_awaddr,
    s_axi_awid,
    s_axi_wdata,
    s_axi_aresetn,
    s_axi_wvalid,
    s_axi_wlast,
    s_axi_awlen,
    s_axi_awvalid,
    s_axi_awburst,
    s_axi_bready,
    s_axi_awsize,
    s_axi_wstrb);
  output axi_aresetn_re_reg;
  output bram_en_a;
  output [63:0]bram_wrdata_a;
  output axi_aresetn_d3;
  output axi_bvalid_int_reg_0;
  output s_axi_wready;
  output \GEN_AWREADY.axi_aresetn_d3_reg_0 ;
  output s_axi_awready;
  output [0:0]s_axi_bid;
  output [8:0]Q;
  output [1:0]bram_addr_a;
  output [7:0]bram_we_a;
  input [0:0]SR;
  input s_axi_aclk;
  input [13:0]s_axi_awaddr;
  input [0:0]s_axi_awid;
  input [63:0]s_axi_wdata;
  input s_axi_aresetn;
  input s_axi_wvalid;
  input s_axi_wlast;
  input [7:0]s_axi_awlen;
  input s_axi_awvalid;
  input [1:0]s_axi_awburst;
  input s_axi_bready;
  input [2:0]s_axi_awsize;
  input [7:0]s_axi_wstrb;

  wire BID_FIFO_n_0;
  wire BID_FIFO_n_1;
  wire BID_FIFO_n_2;
  wire BID_FIFO_n_3;
  wire BID_FIFO_n_5;
  wire BID_FIFO_n_6;
  wire BID_FIFO_n_7;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0 ;
  wire \GEN_AWREADY.axi_aresetn_d3_reg_0 ;
  wire \GEN_AWREADY.axi_awready_int_i_1_n_0 ;
  wire \GEN_AWREADY.axi_awready_int_i_2_n_0 ;
  wire \GEN_AWREADY.axi_awready_int_i_4_n_0 ;
  wire \GEN_AW_DUAL.aw_active_i_1_n_0 ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0 ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0 ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_i_3_n_0 ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0 ;
  wire \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0 ;
  wire \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ;
  wire \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_1_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_5_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_6_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1] ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2] ;
  wire \GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_0 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_1 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_2 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_3 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_4 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_5 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_6 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_7 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_8 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_3_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0 ;
  wire \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ;
  wire I_WRAP_BRST_n_0;
  wire I_WRAP_BRST_n_1;
  wire I_WRAP_BRST_n_10;
  wire I_WRAP_BRST_n_11;
  wire I_WRAP_BRST_n_12;
  wire I_WRAP_BRST_n_15;
  wire I_WRAP_BRST_n_16;
  wire I_WRAP_BRST_n_17;
  wire I_WRAP_BRST_n_18;
  wire I_WRAP_BRST_n_19;
  wire I_WRAP_BRST_n_2;
  wire I_WRAP_BRST_n_20;
  wire I_WRAP_BRST_n_21;
  wire I_WRAP_BRST_n_4;
  wire I_WRAP_BRST_n_5;
  wire I_WRAP_BRST_n_6;
  wire I_WRAP_BRST_n_7;
  wire I_WRAP_BRST_n_8;
  wire I_WRAP_BRST_n_9;
  wire [8:0]Q;
  wire [0:0]SR;
  wire aw_active;
  wire axi_aresetn_d1;
  wire axi_aresetn_d2;
  wire axi_aresetn_d3;
  wire axi_aresetn_re;
  wire axi_aresetn_re_reg;
  wire axi_awaddr_full;
  wire [1:0]axi_awburst_pipe;
  wire axi_awid_pipe;
  wire [7:0]axi_awlen_pipe;
  wire axi_awlen_pipe_1_or_2;
  wire [2:0]axi_awsize_pipe;
  wire axi_bvalid_int_i_1_n_0;
  wire axi_bvalid_int_i_2_n_0;
  wire axi_bvalid_int_i_3_n_0;
  wire axi_bvalid_int_i_4_n_0;
  wire axi_bvalid_int_reg_0;
  wire axi_wdata_full_cmb;
  wire axi_wdata_full_reg;
  wire axi_wr_burst;
  wire axi_wr_burst_cmb;
  wire axi_wr_burst_i_1_n_0;
  wire axi_wr_burst_i_3_n_0;
  wire axi_wready_int_mod_i_1_n_0;
  wire axi_wready_int_mod_i_3_n_0;
  wire bid_gets_fifo_load;
  wire bid_gets_fifo_load_d1;
  wire [1:0]bram_addr_a;
  wire bram_addr_ld_en;
  wire bram_en_a;
  wire bram_en_cmb;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire [2:0]bvalid_cnt;
  wire \bvalid_cnt[0]_i_1_n_0 ;
  wire \bvalid_cnt[1]_i_1_n_0 ;
  wire \bvalid_cnt[2]_i_1_n_0 ;
  wire clr_bram_we;
  wire clr_bram_we_cmb;
  wire curr_awlen_reg_1_or_2;
  wire curr_awlen_reg_1_or_20;
  wire curr_awlen_reg_1_or_2_i_3_n_0;
  wire curr_awlen_reg_1_or_2_i_4_n_0;
  wire curr_awlen_reg_1_or_2_i_5_n_0;
  wire curr_awlen_reg_1_or_2_i_6_n_0;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_i_1_n_0;
  wire curr_fixed_burst_reg_i_2_n_0;
  wire curr_narrow_burst;
  wire curr_narrow_burst_en;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_i_1_n_0;
  wire curr_wrap_burst_reg_i_2_n_0;
  wire delay_aw_active_clr;
  wire last_data_ack_mod;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc;
  wire narrow_bram_addr_inc_d1;
  wire [2:0]narrow_burst_cnt_ld_reg;
  wire [9:8]p_1_in;
  wire p_25_in;
  wire p_9_out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [13:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire wr_addr_sm_cs;
  wire [2:0]wr_data_sm_cs;
  wire [0:0]wr_data_sm_ns__0;
  wire wrdata_reg_ld;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO BID_FIFO
       (.Data_Exists_DFF_0(BID_FIFO_n_7),
        .Data_Exists_DFF_1(axi_bvalid_int_reg_0),
        .\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] (BID_FIFO_n_5),
        .\GEN_AWREADY.axi_awready_int_i_4 (\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .\GEN_AW_DUAL.aw_active_reg (BID_FIFO_n_0),
        .\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg (BID_FIFO_n_2),
        .\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0 (BID_FIFO_n_6),
        .SR(SR),
        .aw_active(aw_active),
        .axi_awaddr_full(axi_awaddr_full),
        .axi_awid_pipe(axi_awid_pipe),
        .axi_awlen_pipe_1_or_2(axi_awlen_pipe_1_or_2),
        .axi_wr_burst(axi_wr_burst),
        .bid_gets_fifo_load(bid_gets_fifo_load),
        .bid_gets_fifo_load_d1(bid_gets_fifo_load_d1),
        .bid_gets_fifo_load_d1_reg(axi_aresetn_d3),
        .bid_gets_fifo_load_d1_reg_0(axi_bvalid_int_i_2_n_0),
        .bvalid_cnt(bvalid_cnt),
        .\bvalid_cnt_reg[0] (BID_FIFO_n_3),
        .\bvalid_cnt_reg[2] (BID_FIFO_n_1),
        .curr_awlen_reg_1_or_2(curr_awlen_reg_1_or_2),
        .last_data_ack_mod(last_data_ack_mod),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_awid(s_axi_awid),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wvalid(s_axi_wvalid),
        .wr_addr_sm_cs(wr_addr_sm_cs),
        .wr_data_sm_cs(wr_data_sm_cs));
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1 
       (.I0(wr_data_sm_ns__0),
        .I1(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0 ),
        .I2(wr_data_sm_cs[0]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCC5555000F)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3_n_0 ),
        .I1(s_axi_wvalid),
        .I2(wr_data_sm_cs[0]),
        .I3(BID_FIFO_n_3),
        .I4(wr_data_sm_cs[1]),
        .I5(wr_data_sm_cs[2]),
        .O(wr_data_sm_ns__0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'hFFFFBAAA)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3 
       (.I0(wr_data_sm_cs[0]),
        .I1(bvalid_cnt[0]),
        .I2(bvalid_cnt[2]),
        .I3(bvalid_cnt[1]),
        .I4(BID_FIFO_n_2),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h008AFFFF00AA0000)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0 ),
        .I1(wr_data_sm_cs[0]),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ),
        .I3(wr_data_sm_cs[2]),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0 ),
        .I5(wr_data_sm_cs[1]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'hEEAAFEBA)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2 
       (.I0(wr_data_sm_cs[1]),
        .I1(wr_data_sm_cs[0]),
        .I2(BID_FIFO_n_3),
        .I3(axi_wr_burst),
        .I4(s_axi_wlast),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FFFFFF400000)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1 
       (.I0(wr_data_sm_cs[0]),
        .I1(wr_data_sm_cs[1]),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ),
        .I3(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0 ),
        .I5(wr_data_sm_cs[2]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hAAEA)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2 
       (.I0(BID_FIFO_n_2),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[2]),
        .I3(bvalid_cnt[0]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0013001000100010)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3 
       (.I0(axi_wr_burst),
        .I1(wr_data_sm_cs[1]),
        .I2(wr_data_sm_cs[0]),
        .I3(wr_data_sm_cs[2]),
        .I4(s_axi_wlast),
        .I5(BID_FIFO_n_3),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0F000C003B383B38)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4 
       (.I0(BID_FIFO_n_6),
        .I1(wr_data_sm_cs[0]),
        .I2(wr_data_sm_cs[2]),
        .I3(s_axi_wvalid),
        .I4(s_axi_wlast),
        .I5(wr_data_sm_cs[1]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "brst_wr_data:010,idle:000,w8_awaddr:001,sng_wr_data:100,b2b_w8_wr_data:011" *) 
  FDRE \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0 ),
        .Q(wr_data_sm_cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "brst_wr_data:010,idle:000,w8_awaddr:001,sng_wr_data:100,b2b_w8_wr_data:011" *) 
  FDRE \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0 ),
        .Q(wr_data_sm_cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "brst_wr_data:010,idle:000,w8_awaddr:001,sng_wr_data:100,b2b_w8_wr_data:011" *) 
  FDRE \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0 ),
        .Q(wr_data_sm_cs[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_aresetn),
        .Q(axi_aresetn_d1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_d2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_aresetn_d1),
        .Q(axi_aresetn_d2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_d3_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_aresetn_d2),
        .Q(axi_aresetn_d3),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_AWREADY.axi_aresetn_re_reg_i_1 
       (.I0(axi_aresetn_d1),
        .I1(axi_aresetn_d2),
        .O(axi_aresetn_re));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_re_reg_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_aresetn_re),
        .Q(axi_aresetn_re_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFBFBFFFFF00AA)) 
    \GEN_AWREADY.axi_awready_int_i_1 
       (.I0(axi_awaddr_full),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_aresetn_d3),
        .I3(BID_FIFO_n_0),
        .I4(axi_aresetn_re_reg),
        .I5(s_axi_awready),
        .O(\GEN_AWREADY.axi_awready_int_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4440404040404040)) 
    \GEN_AWREADY.axi_awready_int_i_2 
       (.I0(\GEN_AWREADY.axi_awready_int_i_4_n_0 ),
        .I1(s_axi_awvalid),
        .I2(aw_active),
        .I3(bvalid_cnt[0]),
        .I4(bvalid_cnt[1]),
        .I5(bvalid_cnt[2]),
        .O(\GEN_AWREADY.axi_awready_int_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAABABABABABABABA)) 
    \GEN_AWREADY.axi_awready_int_i_4 
       (.I0(wr_addr_sm_cs),
        .I1(BID_FIFO_n_2),
        .I2(last_data_ack_mod),
        .I3(bvalid_cnt[2]),
        .I4(bvalid_cnt[1]),
        .I5(bvalid_cnt[0]),
        .O(\GEN_AWREADY.axi_awready_int_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_awready_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AWREADY.axi_awready_int_i_1_n_0 ),
        .Q(s_axi_awready),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFF7FFFF0000FFFF)) 
    \GEN_AW_DUAL.aw_active_i_1 
       (.I0(wr_data_sm_cs[2]),
        .I1(delay_aw_active_clr),
        .I2(wr_data_sm_cs[0]),
        .I3(wr_data_sm_cs[1]),
        .I4(BID_FIFO_n_0),
        .I5(aw_active),
        .O(\GEN_AW_DUAL.aw_active_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_DUAL.aw_active_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_DUAL.aw_active_i_1_n_0 ),
        .Q(aw_active),
        .R(\GEN_AWREADY.axi_aresetn_d3_reg_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \GEN_AW_DUAL.wr_addr_sm_cs_i_1 
       (.I0(\GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0 ),
        .I1(wr_addr_sm_cs),
        .I2(s_axi_awvalid),
        .I3(axi_awaddr_full),
        .I4(\GEN_AW_DUAL.wr_addr_sm_cs_i_3_n_0 ),
        .O(\GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \GEN_AW_DUAL.wr_addr_sm_cs_i_2 
       (.I0(BID_FIFO_n_1),
        .I1(last_data_ack_mod),
        .I2(axi_awaddr_full),
        .I3(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .I4(curr_awlen_reg_1_or_2),
        .I5(axi_awlen_pipe_1_or_2),
        .O(\GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1555)) 
    \GEN_AW_DUAL.wr_addr_sm_cs_i_3 
       (.I0(aw_active),
        .I1(bvalid_cnt[0]),
        .I2(bvalid_cnt[1]),
        .I3(bvalid_cnt[2]),
        .O(\GEN_AW_DUAL.wr_addr_sm_cs_i_3_n_0 ));
  FDRE \GEN_AW_DUAL.wr_addr_sm_cs_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0 ),
        .Q(wr_addr_sm_cs),
        .R(\GEN_AWREADY.axi_aresetn_d3_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[0]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg[10] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[10]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg[11] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[11]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg[12] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[12]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg[13] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[13]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[1]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[2]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h40)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1 
       (.I0(axi_awaddr_full),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_aresetn_d3),
        .O(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[3]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[4]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[5]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[6]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[7]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg[8] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[8]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg[9] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awaddr[9]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'hEA004000)) 
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1 
       (.I0(axi_awaddr_full),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_aresetn_d3),
        .I3(s_axi_aresetn),
        .I4(BID_FIFO_n_0),
        .O(\GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0 ),
        .Q(axi_awaddr_full),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBF00BF00BF00FF40)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1 
       (.I0(axi_awaddr_full),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_aresetn_d3),
        .I3(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .I4(s_axi_awburst[0]),
        .I5(s_axi_awburst[1]),
        .O(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0 ),
        .Q(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awburst[0]),
        .Q(axi_awburst_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awburst[1]),
        .Q(axi_awburst_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awid_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awid),
        .Q(axi_awid_pipe),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_1 
       (.I0(s_axi_awlen[5]),
        .I1(s_axi_awlen[2]),
        .I2(s_axi_awlen[4]),
        .I3(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2_n_0 ),
        .O(p_9_out));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2 
       (.I0(s_axi_awlen[6]),
        .I1(s_axi_awlen[7]),
        .I2(s_axi_awlen[3]),
        .I3(s_axi_awlen[1]),
        .O(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_reg 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(p_9_out),
        .Q(axi_awlen_pipe_1_or_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[0]),
        .Q(axi_awlen_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[1]),
        .Q(axi_awlen_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[2]),
        .Q(axi_awlen_pipe[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[3]),
        .Q(axi_awlen_pipe[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[4]),
        .Q(axi_awlen_pipe[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[5]),
        .Q(axi_awlen_pipe[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[6]),
        .Q(axi_awlen_pipe[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awlen[7]),
        .Q(axi_awlen_pipe[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awsize[0]),
        .Q(axi_awsize_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awsize[1]),
        .Q(axi_awsize_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0 ),
        .D(s_axi_awsize[2]),
        .Q(axi_awsize_pipe[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1 
       (.I0(p_1_in[8]),
        .I1(I_WRAP_BRST_n_1),
        .I2(bram_addr_a[0]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2 
       (.I0(p_1_in[9]),
        .I1(I_WRAP_BRST_n_1),
        .I2(bram_addr_a[1]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_5),
        .Q(Q[7]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_4),
        .Q(Q[8]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1_n_0 ),
        .Q(bram_addr_a[0]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_2_n_0 ),
        .Q(bram_addr_a[1]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_12),
        .Q(Q[0]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_11),
        .Q(Q[1]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_10),
        .Q(Q[2]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_9),
        .Q(Q[3]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_8),
        .Q(Q[4]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_7),
        .Q(Q[5]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_15),
        .D(I_WRAP_BRST_n_6),
        .Q(Q[6]),
        .R(I_WRAP_BRST_n_0));
  LUT5 #(
    .INIT(32'h3FAAC0AA)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_1 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .I1(curr_narrow_burst),
        .I2(I_WRAP_BRST_n_16),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .I4(narrow_addr_int[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000003F5F5F003F)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_3 
       (.I0(axi_awsize_pipe[1]),
        .I1(s_axi_awsize[1]),
        .I2(I_WRAP_BRST_n_18),
        .I3(s_axi_awsize[2]),
        .I4(axi_awaddr_full),
        .I5(axi_awsize_pipe[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFFFCCCC5000CCCC)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_1 
       (.I0(narrow_addr_int[0]),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .I2(curr_narrow_burst),
        .I3(I_WRAP_BRST_n_16),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .I5(narrow_addr_int[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAA8A)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_3 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .I1(narrow_bram_addr_inc_d1),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[1]_i_6_n_0 ),
        .I3(narrow_addr_int[1]),
        .I4(narrow_addr_int[0]),
        .I5(narrow_addr_int[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCFEFDF9FAF8FB)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_4 
       (.I0(I_WRAP_BRST_n_18),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCDDCCCFCCDDFFCF)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_5 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .I3(I_WRAP_BRST_n_18),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_6 
       (.I0(wr_data_sm_cs[0]),
        .I1(s_axi_wvalid),
        .I2(wr_data_sm_cs[1]),
        .I3(wr_data_sm_cs[2]),
        .I4(curr_narrow_burst),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hA8AAFFFF02AA0000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_1 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I1(narrow_addr_int[0]),
        .I2(narrow_addr_int[1]),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ),
        .I5(narrow_addr_int[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEEEEEEEF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_10 
       (.I0(I_WRAP_BRST_n_2),
        .I1(BID_FIFO_n_0),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_11 
       (.I0(axi_awlen_pipe[5]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awvalid),
        .I3(s_axi_awlen[5]),
        .I4(I_WRAP_BRST_n_18),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h000F3535)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_12 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I1(I_WRAP_BRST_n_17),
        .I2(I_WRAP_BRST_n_18),
        .I3(I_WRAP_BRST_n_21),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hACA0FFFFACA00000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_13 
       (.I0(axi_awlen_pipe[1]),
        .I1(s_axi_awlen[1]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awvalid),
        .I4(I_WRAP_BRST_n_18),
        .I5(I_WRAP_BRST_n_20),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_14 
       (.I0(s_axi_awsize[0]),
        .I1(axi_awsize_pipe[0]),
        .I2(s_axi_awsize[1]),
        .I3(axi_awaddr_full),
        .I4(axi_awsize_pipe[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h00CACACA)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_15 
       (.I0(curr_awlen_reg_1_or_2_i_4_n_0),
        .I1(curr_awlen_reg_1_or_2_i_3_n_0),
        .I2(I_WRAP_BRST_n_18),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FEAE02A2)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_16 
       (.I0(I_WRAP_BRST_n_19),
        .I1(s_axi_awsize[0]),
        .I2(axi_awaddr_full),
        .I3(axi_awsize_pipe[0]),
        .I4(I_WRAP_BRST_n_20),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF008080FF00)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_17 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I2(I_WRAP_BRST_n_17),
        .I3(curr_awlen_reg_1_or_2_i_6_n_0),
        .I4(I_WRAP_BRST_n_18),
        .I5(curr_awlen_reg_1_or_2_i_5_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'h115FFF5F)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_18 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I2(I_WRAP_BRST_n_20),
        .I3(I_WRAP_BRST_n_18),
        .I4(I_WRAP_BRST_n_19),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h8A800A0080800000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_19 
       (.I0(I_WRAP_BRST_n_18),
        .I1(axi_awsize_pipe[1]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awsize[1]),
        .I4(axi_awsize_pipe[2]),
        .I5(s_axi_awsize[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h115FFF5F)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_20 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I2(I_WRAP_BRST_n_21),
        .I3(I_WRAP_BRST_n_18),
        .I4(I_WRAP_BRST_n_17),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_21 
       (.I0(axi_awlen_pipe[7]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awvalid),
        .I3(s_axi_awlen[7]),
        .I4(I_WRAP_BRST_n_18),
        .I5(curr_awlen_reg_1_or_2_i_3_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_22 
       (.I0(axi_awlen_pipe[4]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awvalid),
        .I3(s_axi_awlen[4]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAAAAAAAEAEAEA)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_3 
       (.I0(BID_FIFO_n_0),
        .I1(I_WRAP_BRST_n_18),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I3(axi_awsize_pipe[2]),
        .I4(axi_awaddr_full),
        .I5(s_axi_awsize[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00002000FFFFFFFF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_4 
       (.I0(curr_narrow_burst),
        .I1(wr_data_sm_cs[2]),
        .I2(wr_data_sm_cs[1]),
        .I3(s_axi_wvalid),
        .I4(wr_data_sm_cs[0]),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0F0E)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_5 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I3(I_WRAP_BRST_n_18),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000EFFF00)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_6 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ),
        .I3(curr_wrap_burst_reg_i_2_n_0),
        .I4(curr_fixed_burst_reg_i_2_n_0),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h233A230A203A200A)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_7 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I3(I_WRAP_BRST_n_18),
        .I4(curr_awlen_reg_1_or_2_i_3_n_0),
        .I5(curr_awlen_reg_1_or_2_i_4_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF54)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_8 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4F4F4F0F0FFF0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_9 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0 ),
        .Q(narrow_addr_int[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_CNT.narrow_addr_int[1]_i_1_n_0 ),
        .Q(narrow_addr_int[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0 ),
        .Q(narrow_addr_int[2]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000008)) 
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_1 
       (.I0(curr_narrow_burst),
        .I1(I_WRAP_BRST_n_16),
        .I2(narrow_addr_int[1]),
        .I3(narrow_addr_int[0]),
        .I4(narrow_addr_int[2]),
        .O(narrow_bram_addr_inc));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_bram_addr_inc),
        .Q(narrow_bram_addr_inc_d1),
        .R(SR));
  LUT5 #(
    .INIT(32'h88888BBB)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_1 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ),
        .I1(BID_FIFO_n_0),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I3(I_WRAP_BRST_n_18),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .O(narrow_burst_cnt_ld_reg[0]));
  LUT6 #(
    .INIT(64'h88888888888BBB8B)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_1 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1] ),
        .I1(BID_FIFO_n_0),
        .I2(s_axi_awsize[2]),
        .I3(axi_awaddr_full),
        .I4(axi_awsize_pipe[2]),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .O(narrow_burst_cnt_ld_reg[1]));
  LUT6 #(
    .INIT(64'h888888B8B8B888B8)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_1 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2] ),
        .I1(BID_FIFO_n_0),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .I3(s_axi_awsize[0]),
        .I4(axi_awaddr_full),
        .I5(axi_awsize_pipe[0]),
        .O(narrow_burst_cnt_ld_reg[2]));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_reg[0]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_reg[1]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_reg[2]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NARROW_EN.axi_wlast_d1_i_1 
       (.I0(s_axi_wready),
        .I1(s_axi_wlast),
        .I2(s_axi_wvalid),
        .O(p_25_in));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_EN.axi_wlast_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_25_in),
        .Q(last_data_ack_mod),
        .R(SR));
  LUT6 #(
    .INIT(64'h0FBB0F0000000000)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_1 
       (.I0(last_data_ack_mod),
        .I1(p_25_in),
        .I2(I_WRAP_BRST_n_2),
        .I3(curr_narrow_burst_en),
        .I4(curr_narrow_burst),
        .I5(s_axi_aresetn),
        .O(\GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h000D)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_2 
       (.I0(curr_awlen_reg_1_or_20),
        .I1(I_WRAP_BRST_n_20),
        .I2(curr_fixed_burst),
        .I3(BID_FIFO_n_0),
        .O(curr_narrow_burst_en));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_3 
       (.I0(s_axi_awburst[0]),
        .I1(axi_awburst_pipe[0]),
        .I2(s_axi_awburst[1]),
        .I3(axi_awaddr_full),
        .I4(axi_awburst_pipe[1]),
        .O(curr_fixed_burst));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_EN.curr_narrow_burst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ),
        .Q(curr_narrow_burst),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_1 
       (.I0(axi_aresetn_d3),
        .O(\GEN_AWREADY.axi_aresetn_d3_reg_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow \GEN_UA_NARROW.I_UA_NARROW 
       (.D(narrow_burst_cnt_ld_reg[2:1]),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] (\GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] (\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] (\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] (\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] (\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[0] (\GEN_NARROW_CNT.narrow_addr_int[1]_i_5_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[0]_0 (\GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[0]_1 (BID_FIFO_n_0),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[0]_2 (\GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[1] (\GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[2] (\GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 (\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] (\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] (\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] (\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]_0 (axi_awsize_pipe[2:1]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ),
        .axi_awaddr_full(axi_awaddr_full),
        .s_axi_awaddr(s_axi_awaddr[2:0]),
        .s_axi_awsize(s_axi_awsize[2:1]),
        .\s_axi_awsize[2] (\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .ua_narrow_load1_carry_i_1_0(I_WRAP_BRST_n_18));
  LUT5 #(
    .INIT(32'hFFFF0004)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_1 
       (.I0(wr_data_sm_cs[2]),
        .I1(wr_data_sm_cs[0]),
        .I2(wr_data_sm_cs[1]),
        .I3(BID_FIFO_n_6),
        .I4(axi_wready_int_mod_i_3_n_0),
        .O(axi_wdata_full_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wdata_full_cmb),
        .Q(axi_wdata_full_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000FFEC00A8)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_1 
       (.I0(wr_data_sm_cs[0]),
        .I1(BID_FIFO_n_3),
        .I2(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_3_n_0 ),
        .I3(wr_data_sm_cs[1]),
        .I4(s_axi_wvalid),
        .I5(wr_data_sm_cs[2]),
        .O(bram_en_cmb));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_3 
       (.I0(axi_awaddr_full),
        .I1(BID_FIFO_n_0),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_cmb),
        .Q(bram_en_a),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000000040FF)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_1 
       (.I0(axi_wr_burst),
        .I1(wr_data_sm_cs[0]),
        .I2(BID_FIFO_n_6),
        .I3(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ),
        .I4(wr_data_sm_cs[1]),
        .I5(wr_data_sm_cs[2]),
        .O(clr_bram_we_cmb));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2 
       (.I0(s_axi_wlast),
        .I1(wr_data_sm_cs[0]),
        .I2(s_axi_wvalid),
        .I3(BID_FIFO_n_3),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(clr_bram_we_cmb),
        .Q(clr_bram_we),
        .R(SR));
  LUT6 #(
    .INIT(64'h5404FFFF54040000)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1 
       (.I0(wr_data_sm_cs[2]),
        .I1(s_axi_wlast),
        .I2(wr_data_sm_cs[0]),
        .I3(BID_FIFO_n_6),
        .I4(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0 ),
        .I5(delay_aw_active_clr),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEAAAEAAAEAAA)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2 
       (.I0(clr_bram_we_cmb),
        .I1(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ),
        .I2(I_WRAP_BRST_n_16),
        .I3(s_axi_wlast),
        .I4(wr_data_sm_cs[2]),
        .I5(delay_aw_active_clr),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0 ),
        .Q(delay_aw_active_clr),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[0].bram_wrdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[0]),
        .Q(bram_wrdata_a[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[10].bram_wrdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[10]),
        .Q(bram_wrdata_a[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[11].bram_wrdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[11]),
        .Q(bram_wrdata_a[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[12].bram_wrdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[12]),
        .Q(bram_wrdata_a[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[13].bram_wrdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[13]),
        .Q(bram_wrdata_a[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[14].bram_wrdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[14]),
        .Q(bram_wrdata_a[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[15].bram_wrdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[15]),
        .Q(bram_wrdata_a[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[16].bram_wrdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[16]),
        .Q(bram_wrdata_a[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[17].bram_wrdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[17]),
        .Q(bram_wrdata_a[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[18].bram_wrdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[18]),
        .Q(bram_wrdata_a[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[19].bram_wrdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[19]),
        .Q(bram_wrdata_a[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[1].bram_wrdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[1]),
        .Q(bram_wrdata_a[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[20].bram_wrdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[20]),
        .Q(bram_wrdata_a[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[21].bram_wrdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[21]),
        .Q(bram_wrdata_a[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[22].bram_wrdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[22]),
        .Q(bram_wrdata_a[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[23].bram_wrdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[23]),
        .Q(bram_wrdata_a[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[24].bram_wrdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[24]),
        .Q(bram_wrdata_a[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[25].bram_wrdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[25]),
        .Q(bram_wrdata_a[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[26].bram_wrdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[26]),
        .Q(bram_wrdata_a[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[27].bram_wrdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[27]),
        .Q(bram_wrdata_a[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[28].bram_wrdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[28]),
        .Q(bram_wrdata_a[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[29].bram_wrdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[29]),
        .Q(bram_wrdata_a[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[2].bram_wrdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[2]),
        .Q(bram_wrdata_a[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[30].bram_wrdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[30]),
        .Q(bram_wrdata_a[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[31].bram_wrdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[31]),
        .Q(bram_wrdata_a[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[32].bram_wrdata_int_reg[32] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[32]),
        .Q(bram_wrdata_a[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[33].bram_wrdata_int_reg[33] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[33]),
        .Q(bram_wrdata_a[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[34].bram_wrdata_int_reg[34] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[34]),
        .Q(bram_wrdata_a[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[35].bram_wrdata_int_reg[35] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[35]),
        .Q(bram_wrdata_a[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[36].bram_wrdata_int_reg[36] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[36]),
        .Q(bram_wrdata_a[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[37].bram_wrdata_int_reg[37] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[37]),
        .Q(bram_wrdata_a[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[38].bram_wrdata_int_reg[38] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[38]),
        .Q(bram_wrdata_a[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[39].bram_wrdata_int_reg[39] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[39]),
        .Q(bram_wrdata_a[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[3].bram_wrdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[3]),
        .Q(bram_wrdata_a[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[40].bram_wrdata_int_reg[40] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[40]),
        .Q(bram_wrdata_a[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[41].bram_wrdata_int_reg[41] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[41]),
        .Q(bram_wrdata_a[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[42].bram_wrdata_int_reg[42] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[42]),
        .Q(bram_wrdata_a[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[43].bram_wrdata_int_reg[43] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[43]),
        .Q(bram_wrdata_a[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[44].bram_wrdata_int_reg[44] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[44]),
        .Q(bram_wrdata_a[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[45].bram_wrdata_int_reg[45] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[45]),
        .Q(bram_wrdata_a[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[46].bram_wrdata_int_reg[46] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[46]),
        .Q(bram_wrdata_a[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[47].bram_wrdata_int_reg[47] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[47]),
        .Q(bram_wrdata_a[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[48].bram_wrdata_int_reg[48] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[48]),
        .Q(bram_wrdata_a[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[49].bram_wrdata_int_reg[49] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[49]),
        .Q(bram_wrdata_a[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[4].bram_wrdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[4]),
        .Q(bram_wrdata_a[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[50].bram_wrdata_int_reg[50] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[50]),
        .Q(bram_wrdata_a[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[51].bram_wrdata_int_reg[51] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[51]),
        .Q(bram_wrdata_a[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[52].bram_wrdata_int_reg[52] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[52]),
        .Q(bram_wrdata_a[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[53].bram_wrdata_int_reg[53] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[53]),
        .Q(bram_wrdata_a[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[54].bram_wrdata_int_reg[54] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[54]),
        .Q(bram_wrdata_a[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[55].bram_wrdata_int_reg[55] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[55]),
        .Q(bram_wrdata_a[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[56].bram_wrdata_int_reg[56] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[56]),
        .Q(bram_wrdata_a[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[57].bram_wrdata_int_reg[57] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[57]),
        .Q(bram_wrdata_a[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[58].bram_wrdata_int_reg[58] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[58]),
        .Q(bram_wrdata_a[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[59].bram_wrdata_int_reg[59] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[59]),
        .Q(bram_wrdata_a[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[5].bram_wrdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[5]),
        .Q(bram_wrdata_a[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[60].bram_wrdata_int_reg[60] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[60]),
        .Q(bram_wrdata_a[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[61].bram_wrdata_int_reg[61] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[61]),
        .Q(bram_wrdata_a[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[62].bram_wrdata_int_reg[62] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[62]),
        .Q(bram_wrdata_a[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[63].bram_wrdata_int_reg[63] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[63]),
        .Q(bram_wrdata_a[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[6].bram_wrdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[6]),
        .Q(bram_wrdata_a[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[7].bram_wrdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[7]),
        .Q(bram_wrdata_a[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[8].bram_wrdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[8]),
        .Q(bram_wrdata_a[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[9].bram_wrdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[9]),
        .Q(bram_wrdata_a[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF7D50000FFFFFFFF)) 
    \GEN_WR_NO_ECC.bram_we_int[7]_i_1 
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[1]),
        .I2(wr_data_sm_cs[2]),
        .I3(wr_data_sm_cs[0]),
        .I4(clr_bram_we),
        .I5(s_axi_aresetn),
        .O(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h082A)) 
    \GEN_WR_NO_ECC.bram_we_int[7]_i_2 
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[1]),
        .I2(wr_data_sm_cs[2]),
        .I3(wr_data_sm_cs[0]),
        .O(wrdata_reg_ld));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[0]),
        .Q(bram_we_a[0]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[1]),
        .Q(bram_we_a[1]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[2]),
        .Q(bram_we_a[2]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[3]),
        .Q(bram_we_a[3]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[4]),
        .Q(bram_we_a[4]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[5]),
        .Q(bram_we_a[5]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[6]),
        .Q(bram_we_a[6]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[7]),
        .Q(bram_we_a[7]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst I_WRAP_BRST
       (.D({I_WRAP_BRST_n_4,I_WRAP_BRST_n_5,I_WRAP_BRST_n_6,I_WRAP_BRST_n_7,I_WRAP_BRST_n_8,I_WRAP_BRST_n_9,I_WRAP_BRST_n_10,I_WRAP_BRST_n_11,I_WRAP_BRST_n_12}),
        .E(bram_addr_ld_en),
        .\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] (I_WRAP_BRST_n_1),
        .\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 (I_WRAP_BRST_n_16),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] (I_WRAP_BRST_n_20),
        .\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] (I_WRAP_BRST_n_19),
        .\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] (I_WRAP_BRST_n_21),
        .\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] (I_WRAP_BRST_n_17),
        .\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] (I_WRAP_BRST_n_18),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] (\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0 ),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] (Q),
        .Q(axi_awlen_pipe[3:0]),
        .SR(I_WRAP_BRST_n_0),
        .axi_awaddr_full(axi_awaddr_full),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_fixed_burst_reg_reg(I_WRAP_BRST_n_15),
        .curr_narrow_burst(curr_narrow_burst),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .narrow_addr_int(narrow_addr_int),
        .narrow_bram_addr_inc_d1(narrow_bram_addr_inc_d1),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr[13:3]),
        .s_axi_awlen(s_axi_awlen[3:0]),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awsize_2_sp_1(I_WRAP_BRST_n_2),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid),
        .\save_init_bram_addr_ld_reg[13]_0 (p_1_in),
        .\save_init_bram_addr_ld_reg[13]_1 (BID_FIFO_n_0),
        .wr_data_sm_cs(wr_data_sm_cs),
        .\wrap_burst_total_reg[0]_0 (axi_awsize_pipe),
        .\wrap_burst_total_reg[0]_1 (SR),
        .\wrap_burst_total_reg[1]_0 (\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .\wrap_burst_total_reg[1]_1 (\GEN_UA_NARROW.I_UA_NARROW_n_7 ));
  FDRE #(
    .INIT(1'b0)) 
    \axi_bid_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(BID_FIFO_n_7),
        .Q(s_axi_bid),
        .R(SR));
  LUT3 #(
    .INIT(8'h8A)) 
    axi_bvalid_int_i_1
       (.I0(s_axi_aresetn),
        .I1(axi_bvalid_int_i_2_n_0),
        .I2(axi_bvalid_int_i_3_n_0),
        .O(axi_bvalid_int_i_1_n_0));
  LUT5 #(
    .INIT(32'hEFFFEEEE)) 
    axi_bvalid_int_i_2
       (.I0(bvalid_cnt[2]),
        .I1(bvalid_cnt[1]),
        .I2(s_axi_bready),
        .I3(axi_bvalid_int_reg_0),
        .I4(bvalid_cnt[0]),
        .O(axi_bvalid_int_i_2_n_0));
  LUT6 #(
    .INIT(64'h5555555504444444)) 
    axi_bvalid_int_i_3
       (.I0(BID_FIFO_n_5),
        .I1(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ),
        .I2(axi_bvalid_int_i_4_n_0),
        .I3(s_axi_wvalid),
        .I4(wr_data_sm_cs[1]),
        .I5(wr_data_sm_cs[2]),
        .O(axi_bvalid_int_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_bvalid_int_i_4
       (.I0(s_axi_wlast),
        .I1(wr_data_sm_cs[0]),
        .O(axi_bvalid_int_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_int_i_1_n_0),
        .Q(axi_bvalid_int_reg_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    axi_wr_burst_i_1
       (.I0(axi_wr_burst_cmb),
        .I1(axi_wr_burst_i_3_n_0),
        .I2(axi_wr_burst),
        .O(axi_wr_burst_i_1_n_0));
  LUT6 #(
    .INIT(64'h00030003F4F74447)) 
    axi_wr_burst_i_2
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3_n_0 ),
        .I1(wr_data_sm_cs[1]),
        .I2(wr_data_sm_cs[0]),
        .I3(s_axi_wlast),
        .I4(s_axi_wvalid),
        .I5(wr_data_sm_cs[2]),
        .O(axi_wr_burst_cmb));
  LUT6 #(
    .INIT(64'h400C44CC400C400C)) 
    axi_wr_burst_i_3
       (.I0(wr_data_sm_cs[2]),
        .I1(s_axi_wvalid),
        .I2(wr_data_sm_cs[0]),
        .I3(wr_data_sm_cs[1]),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3_n_0 ),
        .I5(s_axi_wlast),
        .O(axi_wr_burst_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wr_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wr_burst_i_1_n_0),
        .Q(axi_wr_burst),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000FFFB00000000)) 
    axi_wready_int_mod_i_1
       (.I0(wr_data_sm_cs[2]),
        .I1(wr_data_sm_cs[0]),
        .I2(wr_data_sm_cs[1]),
        .I3(BID_FIFO_n_6),
        .I4(axi_wready_int_mod_i_3_n_0),
        .I5(s_axi_aresetn),
        .O(axi_wready_int_mod_i_1_n_0));
  LUT6 #(
    .INIT(64'h000000FCF0F000F4)) 
    axi_wready_int_mod_i_3
       (.I0(BID_FIFO_n_3),
        .I1(s_axi_wvalid),
        .I2(axi_wdata_full_reg),
        .I3(wr_data_sm_cs[0]),
        .I4(wr_data_sm_cs[1]),
        .I5(wr_data_sm_cs[2]),
        .O(axi_wready_int_mod_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wready_int_mod_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_int_mod_i_1_n_0),
        .Q(s_axi_wready),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    bid_gets_fifo_load_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bid_gets_fifo_load),
        .Q(bid_gets_fifo_load_d1),
        .R(SR));
  LUT6 #(
    .INIT(64'h777788888880777F)) 
    \bvalid_cnt[0]_i_1 
       (.I0(axi_bvalid_int_reg_0),
        .I1(s_axi_bready),
        .I2(bvalid_cnt[1]),
        .I3(bvalid_cnt[2]),
        .I4(axi_bvalid_int_i_3_n_0),
        .I5(bvalid_cnt[0]),
        .O(\bvalid_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDD20BB44BB44BB44)) 
    \bvalid_cnt[1]_i_1 
       (.I0(axi_bvalid_int_i_3_n_0),
        .I1(bvalid_cnt[0]),
        .I2(bvalid_cnt[2]),
        .I3(bvalid_cnt[1]),
        .I4(s_axi_bready),
        .I5(axi_bvalid_int_reg_0),
        .O(\bvalid_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0D0B4F0B4F0B4F0)) 
    \bvalid_cnt[2]_i_1 
       (.I0(axi_bvalid_int_i_3_n_0),
        .I1(bvalid_cnt[0]),
        .I2(bvalid_cnt[2]),
        .I3(bvalid_cnt[1]),
        .I4(s_axi_bready),
        .I5(axi_bvalid_int_reg_0),
        .O(\bvalid_cnt[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[0]_i_1_n_0 ),
        .Q(bvalid_cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[1]_i_1_n_0 ),
        .Q(bvalid_cnt[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[2]_i_1_n_0 ),
        .Q(bvalid_cnt[2]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000001)) 
    curr_awlen_reg_1_or_2_i_1
       (.I0(I_WRAP_BRST_n_19),
        .I1(curr_awlen_reg_1_or_2_i_3_n_0),
        .I2(curr_awlen_reg_1_or_2_i_4_n_0),
        .I3(curr_awlen_reg_1_or_2_i_5_n_0),
        .I4(curr_awlen_reg_1_or_2_i_6_n_0),
        .O(curr_awlen_reg_1_or_20));
  LUT4 #(
    .INIT(16'hB888)) 
    curr_awlen_reg_1_or_2_i_3
       (.I0(axi_awlen_pipe[6]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awvalid),
        .I3(s_axi_awlen[6]),
        .O(curr_awlen_reg_1_or_2_i_3_n_0));
  LUT4 #(
    .INIT(16'hB888)) 
    curr_awlen_reg_1_or_2_i_4
       (.I0(axi_awlen_pipe[7]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awvalid),
        .I3(s_axi_awlen[7]),
        .O(curr_awlen_reg_1_or_2_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFA00CCCCFA00)) 
    curr_awlen_reg_1_or_2_i_5
       (.I0(s_axi_awlen[2]),
        .I1(axi_awlen_pipe[2]),
        .I2(s_axi_awlen[4]),
        .I3(s_axi_awvalid),
        .I4(axi_awaddr_full),
        .I5(axi_awlen_pipe[4]),
        .O(curr_awlen_reg_1_or_2_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFF0FFA0CCF0CCA0)) 
    curr_awlen_reg_1_or_2_i_6
       (.I0(s_axi_awlen[5]),
        .I1(axi_awlen_pipe[5]),
        .I2(s_axi_awvalid),
        .I3(axi_awaddr_full),
        .I4(s_axi_awlen[3]),
        .I5(axi_awlen_pipe[3]),
        .O(curr_awlen_reg_1_or_2_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_awlen_reg_1_or_2_reg
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(curr_awlen_reg_1_or_20),
        .Q(curr_awlen_reg_1_or_2),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAABFB00000151)) 
    curr_fixed_burst_reg_i_1
       (.I0(BID_FIFO_n_0),
        .I1(s_axi_awburst[0]),
        .I2(axi_awaddr_full),
        .I3(axi_awburst_pipe[0]),
        .I4(curr_fixed_burst_reg_i_2_n_0),
        .I5(curr_fixed_burst_reg),
        .O(curr_fixed_burst_reg_i_1_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    curr_fixed_burst_reg_i_2
       (.I0(axi_awburst_pipe[1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awburst[1]),
        .O(curr_fixed_burst_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(curr_fixed_burst_reg_i_1_n_0),
        .Q(curr_fixed_burst_reg),
        .R(I_WRAP_BRST_n_0));
  LUT6 #(
    .INIT(64'hAAAAFEAE00005404)) 
    curr_wrap_burst_reg_i_1
       (.I0(BID_FIFO_n_0),
        .I1(s_axi_awburst[1]),
        .I2(axi_awaddr_full),
        .I3(axi_awburst_pipe[1]),
        .I4(curr_wrap_burst_reg_i_2_n_0),
        .I5(curr_wrap_burst_reg),
        .O(curr_wrap_burst_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_wrap_burst_reg_i_2
       (.I0(axi_awburst_pipe[0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awburst[0]),
        .O(curr_wrap_burst_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(curr_wrap_burst_reg_i_1_n_0),
        .Q(curr_wrap_burst_reg),
        .R(I_WRAP_BRST_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst
   (SR,
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ,
    s_axi_awsize_2_sp_1,
    E,
    D,
    \save_init_bram_addr_ld_reg[13]_0 ,
    curr_fixed_burst_reg_reg,
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 ,
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ,
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ,
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] ,
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] ,
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] ,
    wr_data_sm_cs,
    s_axi_wvalid,
    s_axi_aresetn,
    Q,
    s_axi_awlen,
    axi_awaddr_full,
    s_axi_awvalid,
    \save_init_bram_addr_ld_reg[13]_1 ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ,
    s_axi_awaddr,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ,
    curr_fixed_burst_reg,
    curr_narrow_burst,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ,
    curr_wrap_burst_reg,
    narrow_bram_addr_inc_d1,
    narrow_addr_int,
    s_axi_awsize,
    \wrap_burst_total_reg[0]_0 ,
    \wrap_burst_total_reg[1]_0 ,
    \wrap_burst_total_reg[1]_1 ,
    \wrap_burst_total_reg[0]_1 ,
    s_axi_aclk);
  output [0:0]SR;
  output \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ;
  output s_axi_awsize_2_sp_1;
  output [0:0]E;
  output [8:0]D;
  output [1:0]\save_init_bram_addr_ld_reg[13]_0 ;
  output [0:0]curr_fixed_burst_reg_reg;
  output \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 ;
  output \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ;
  output \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ;
  output \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] ;
  output \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] ;
  output \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] ;
  input [2:0]wr_data_sm_cs;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input [3:0]Q;
  input [3:0]s_axi_awlen;
  input axi_awaddr_full;
  input s_axi_awvalid;
  input \save_init_bram_addr_ld_reg[13]_1 ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ;
  input [10:0]s_axi_awaddr;
  input [8:0]\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ;
  input curr_fixed_burst_reg;
  input curr_narrow_burst;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ;
  input curr_wrap_burst_reg;
  input narrow_bram_addr_inc_d1;
  input [2:0]narrow_addr_int;
  input [2:0]s_axi_awsize;
  input [2:0]\wrap_burst_total_reg[0]_0 ;
  input \wrap_burst_total_reg[1]_0 ;
  input \wrap_burst_total_reg[1]_1 ;
  input [0:0]\wrap_burst_total_reg[0]_1 ;
  input s_axi_aclk;

  wire [8:0]D;
  wire [0:0]E;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] ;
  wire \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] ;
  wire \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] ;
  wire \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ;
  wire \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ;
  wire [8:0]\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  wire [3:0]Q;
  wire [0:0]SR;
  wire axi_awaddr_full;
  wire curr_fixed_burst_reg;
  wire [0:0]curr_fixed_burst_reg_reg;
  wire curr_narrow_burst;
  wire curr_wrap_burst_reg;
  wire [10:1]data0;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc_d1;
  wire [7:0]p_1_in;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [10:0]s_axi_awaddr;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awsize;
  wire s_axi_awsize_2_sn_1;
  wire s_axi_awvalid;
  wire s_axi_wvalid;
  wire \save_init_bram_addr_ld[13]_i_3_n_0 ;
  wire \save_init_bram_addr_ld[4]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[5]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[6]_i_2_n_0 ;
  wire [1:0]\save_init_bram_addr_ld_reg[13]_0 ;
  wire \save_init_bram_addr_ld_reg[13]_1 ;
  wire [2:0]wr_data_sm_cs;
  wire [2:0]wrap_burst_total;
  wire \wrap_burst_total[0]_i_2_n_0 ;
  wire \wrap_burst_total[1]_i_3__0_n_0 ;
  wire \wrap_burst_total[2]_i_1__0_n_0 ;
  wire \wrap_burst_total[2]_i_2__0_n_0 ;
  wire [1:0]wrap_burst_total_cmb;
  wire [2:0]\wrap_burst_total_reg[0]_0 ;
  wire [0:0]\wrap_burst_total_reg[0]_1 ;
  wire \wrap_burst_total_reg[1]_0 ;
  wire \wrap_burst_total_reg[1]_1 ;

  assign s_axi_awsize_2_sp_1 = s_axi_awsize_2_sn_1;
  LUT5 #(
    .INIT(32'h6AFF6A00)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [7]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [6]),
        .I3(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I4(p_1_in[6]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'h55557775)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_1 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I1(curr_fixed_burst_reg),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 ),
        .I3(curr_narrow_burst),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0 ),
        .O(curr_fixed_burst_reg_reg));
  LUT6 #(
    .INIT(64'h6AAAFFFF6AAA0000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [8]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [6]),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [7]),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I5(p_1_in[7]),
        .O(D[8]));
  LUT4 #(
    .INIT(16'h0040)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3 
       (.I0(wr_data_sm_cs[2]),
        .I1(wr_data_sm_cs[1]),
        .I2(s_axi_wvalid),
        .I3(wr_data_sm_cs[0]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCCCC8C)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4 
       (.I0(narrow_bram_addr_inc_d1),
        .I1(curr_narrow_burst),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]_0 ),
        .I3(narrow_addr_int[1]),
        .I4(narrow_addr_int[0]),
        .I5(narrow_addr_int[2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00020000FFFFFFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_1 
       (.I0(wr_data_sm_cs[2]),
        .I1(s_axi_wvalid),
        .I2(wr_data_sm_cs[1]),
        .I3(wr_data_sm_cs[0]),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I5(s_axi_aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8AAAAAA)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3 
       (.I0(\save_init_bram_addr_ld_reg[13]_1 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I2(wr_data_sm_cs[2]),
        .I3(wr_data_sm_cs[1]),
        .I4(s_axi_wvalid),
        .I5(wr_data_sm_cs[0]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ));
  LUT5 #(
    .INIT(32'hABBBFFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ),
        .I3(\save_init_bram_addr_ld[6]_i_2_n_0 ),
        .I4(curr_wrap_burst_reg),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F00A000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [1]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [2]),
        .I2(wrap_burst_total[1]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [0]),
        .I4(wrap_burst_total[0]),
        .I5(wrap_burst_total[2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4540FFFF45404540)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_1 
       (.I0(\save_init_bram_addr_ld_reg[13]_1 ),
        .I1(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ),
        .I2(axi_awaddr_full),
        .I3(s_axi_awaddr[0]),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [0]),
        .I5(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h6F60)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [0]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [1]),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I3(p_1_in[0]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h6AFF6A00)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [2]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [1]),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [0]),
        .I3(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I4(p_1_in[1]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h6AAAFFFF6AAA0000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [3]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [0]),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [1]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [2]),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I5(p_1_in[2]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h6F60)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [4]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I3(p_1_in[3]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'h6AFF6A00)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [5]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [4]),
        .I3(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I4(p_1_in[4]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h6AAAFFFF6AAA0000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [6]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [4]),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [5]),
        .I4(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] ),
        .I5(p_1_in[5]),
        .O(D[6]));
  LUT4 #(
    .INIT(16'h8000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [3]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [0]),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [1]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] [2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    curr_awlen_reg_1_or_2_i_2
       (.I0(Q[1]),
        .I1(s_axi_awlen[1]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awvalid),
        .O(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[10]_i_1 
       (.I0(data0[7]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[7]),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[11]_i_1 
       (.I0(data0[8]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[8]),
        .O(p_1_in[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[12]_i_1 
       (.I0(data0[9]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[9]),
        .O(\save_init_bram_addr_ld_reg[13]_0 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    \save_init_bram_addr_ld[13]_i_1 
       (.I0(\save_init_bram_addr_ld_reg[13]_1 ),
        .O(E));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[13]_i_2 
       (.I0(data0[10]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[10]),
        .O(\save_init_bram_addr_ld_reg[13]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    \save_init_bram_addr_ld[13]_i_3 
       (.I0(\save_init_bram_addr_ld_reg[13]_1 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .O(\save_init_bram_addr_ld[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[4]_i_1 
       (.I0(\save_init_bram_addr_ld[4]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[1]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'hA282)) 
    \save_init_bram_addr_ld[4]_i_2 
       (.I0(data0[1]),
        .I1(wrap_burst_total[1]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[0]),
        .O(\save_init_bram_addr_ld[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[5]_i_1 
       (.I0(\save_init_bram_addr_ld[5]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[2]),
        .O(p_1_in[1]));
  LUT4 #(
    .INIT(16'hA28A)) 
    \save_init_bram_addr_ld[5]_i_2 
       (.I0(data0[2]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .O(\save_init_bram_addr_ld[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \save_init_bram_addr_ld[6]_i_1 
       (.I0(data0[3]),
        .I1(\save_init_bram_addr_ld[6]_i_2_n_0 ),
        .I2(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I3(\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ),
        .I4(axi_awaddr_full),
        .I5(s_axi_awaddr[3]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \save_init_bram_addr_ld[6]_i_2 
       (.I0(wrap_burst_total[0]),
        .I1(wrap_burst_total[2]),
        .I2(wrap_burst_total[1]),
        .O(\save_init_bram_addr_ld[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[7]_i_1 
       (.I0(data0[4]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[4]),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[8]_i_1 
       (.I0(data0[5]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[5]),
        .O(p_1_in[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[9]_i_1 
       (.I0(data0[6]),
        .I1(\save_init_bram_addr_ld[13]_i_3_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[6]),
        .O(p_1_in[5]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[6]),
        .Q(data0[7]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[7]),
        .Q(data0[8]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\save_init_bram_addr_ld_reg[13]_0 [0]),
        .Q(data0[9]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\save_init_bram_addr_ld_reg[13]_0 [1]),
        .Q(data0[10]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[0]),
        .Q(data0[1]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[1]),
        .Q(data0[2]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[2]),
        .Q(data0[3]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[3]),
        .Q(data0[4]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[4]),
        .Q(data0[5]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[5]),
        .Q(data0[6]),
        .R(\wrap_burst_total_reg[0]_1 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \wrap_burst_total[0]_i_1 
       (.I0(\wrap_burst_total[0]_i_2_n_0 ),
        .I1(s_axi_awsize[2]),
        .I2(axi_awaddr_full),
        .I3(\wrap_burst_total_reg[0]_0 [2]),
        .O(wrap_burst_total_cmb[0]));
  LUT6 #(
    .INIT(64'h6600000010400000)) 
    \wrap_burst_total[0]_i_2 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ),
        .I1(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ),
        .I2(\wrap_burst_total_reg[1]_0 ),
        .I3(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] ),
        .I4(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] ),
        .I5(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] ),
        .O(\wrap_burst_total[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \wrap_burst_total[0]_i_3__0 
       (.I0(Q[0]),
        .I1(s_axi_awlen[0]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awvalid),
        .O(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] ));
  LUT6 #(
    .INIT(64'h000000000880C080)) 
    \wrap_burst_total[1]_i_1 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] ),
        .I1(\wrap_burst_total[1]_i_3__0_n_0 ),
        .I2(\wrap_burst_total_reg[1]_0 ),
        .I3(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ),
        .I4(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ),
        .I5(\wrap_burst_total_reg[1]_1 ),
        .O(wrap_burst_total_cmb[1]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hACA0)) 
    \wrap_burst_total[1]_i_2__0 
       (.I0(Q[2]),
        .I1(s_axi_awlen[2]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awvalid),
        .O(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] ));
  LUT6 #(
    .INIT(64'hCCA0CC0000A00000)) 
    \wrap_burst_total[1]_i_3__0 
       (.I0(s_axi_awlen[1]),
        .I1(Q[1]),
        .I2(s_axi_awvalid),
        .I3(axi_awaddr_full),
        .I4(s_axi_awlen[0]),
        .I5(Q[0]),
        .O(\wrap_burst_total[1]_i_3__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_5 
       (.I0(\wrap_burst_total_reg[0]_0 [0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[0]),
        .O(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \wrap_burst_total[1]_i_6 
       (.I0(Q[3]),
        .I1(s_axi_awlen[3]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awvalid),
        .O(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ));
  LUT6 #(
    .INIT(64'h4450440000000000)) 
    \wrap_burst_total[2]_i_1__0 
       (.I0(\wrap_burst_total[2]_i_2__0_n_0 ),
        .I1(Q[3]),
        .I2(s_axi_awlen[3]),
        .I3(axi_awaddr_full),
        .I4(s_axi_awvalid),
        .I5(s_axi_awsize_2_sn_1),
        .O(\wrap_burst_total[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'h13DFFFFF)) 
    \wrap_burst_total[2]_i_2__0 
       (.I0(s_axi_awvalid),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[2]),
        .I3(Q[2]),
        .I4(\wrap_burst_total[1]_i_3__0_n_0 ),
        .O(\wrap_burst_total[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h3055300000000000)) 
    \wrap_burst_total[2]_i_3 
       (.I0(s_axi_awsize[2]),
        .I1(\wrap_burst_total_reg[0]_0 [2]),
        .I2(\wrap_burst_total_reg[0]_0 [1]),
        .I3(axi_awaddr_full),
        .I4(s_axi_awsize[1]),
        .I5(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ),
        .O(s_axi_awsize_2_sn_1));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wrap_burst_total_cmb[0]),
        .Q(wrap_burst_total[0]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wrap_burst_total_cmb[1]),
        .Q(wrap_burst_total[1]),
        .R(\wrap_burst_total_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\wrap_burst_total[2]_i_1__0_n_0 ),
        .Q(wrap_burst_total[2]),
        .R(\wrap_burst_total_reg[0]_1 ));
endmodule

(* ORIG_REF_NAME = "wrap_brst" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1
   (\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ,
    rd_adv_buf113_out,
    \GEN_NO_RD_CMD_OPT.brst_zero_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg ,
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ,
    SR,
    \GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg ,
    bram_addr_ld_en,
    \save_init_bram_addr_ld_reg[11]_0 ,
    \save_init_bram_addr_ld_reg[10]_0 ,
    \save_init_bram_addr_ld_reg[9]_0 ,
    \save_init_bram_addr_ld_reg[8]_0 ,
    \save_init_bram_addr_ld_reg[7]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ,
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ,
    \GEN_NO_RD_CMD_OPT.last_bram_addr_reg ,
    \GEN_NO_RD_CMD_OPT.pend_rd_op_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg ,
    \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 ,
    s_axi_rready_0,
    \GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ,
    \save_init_bram_addr_ld_reg[13]_0 ,
    \save_init_bram_addr_ld_reg[12]_0 ,
    narrow_addr_int,
    narrow_bram_addr_inc_d1,
    curr_narrow_burst,
    Q,
    s_axi_aresetn,
    curr_fixed_burst_reg,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_1 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_1 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_1 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]_0 ,
    axi_aresetn_d3,
    rd_addr_sm_cs,
    axi_araddr_full,
    last_bram_addr,
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 ,
    s_axi_rready,
    brst_zero,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ,
    s_axi_araddr,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ,
    curr_wrap_burst_reg,
    sel,
    axi_b2b_brst,
    end_brst_rd,
    axi_arsize_pipe_max,
    axi_arlen_pipe_1_or_2,
    disable_b2b_brst,
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg ,
    axi_arready_int,
    s_axi_arvalid,
    pend_rd_op,
    ar_active,
    no_ar_ack,
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_7 ,
    axi_rd_burst,
    s_axi_arsize,
    \wrap_burst_total_reg[0]_0 ,
    \wrap_burst_total_reg[1]_0 ,
    \wrap_burst_total_reg[2]_0 ,
    s_axi_arlen,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_0 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_1 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_2 ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 ,
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] ,
    bram_addr_b,
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] ,
    s_axi_aclk);
  output \GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ;
  output rd_adv_buf113_out;
  output \GEN_NO_RD_CMD_OPT.brst_zero_reg ;
  output \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg ;
  output \GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ;
  output [0:0]SR;
  output \GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg ;
  output bram_addr_ld_en;
  output \save_init_bram_addr_ld_reg[11]_0 ;
  output \save_init_bram_addr_ld_reg[10]_0 ;
  output \save_init_bram_addr_ld_reg[9]_0 ;
  output \save_init_bram_addr_ld_reg[8]_0 ;
  output \save_init_bram_addr_ld_reg[7]_0 ;
  output \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ;
  output \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] ;
  output \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ;
  output \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ;
  output \GEN_NO_RD_CMD_OPT.last_bram_addr_reg ;
  output \GEN_NO_RD_CMD_OPT.pend_rd_op_reg ;
  output \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg ;
  output \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg ;
  output \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 ;
  output s_axi_rready_0;
  output \GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ;
  output \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ;
  output \save_init_bram_addr_ld_reg[13]_0 ;
  output \save_init_bram_addr_ld_reg[12]_0 ;
  input [2:0]narrow_addr_int;
  input narrow_bram_addr_inc_d1;
  input curr_narrow_burst;
  input [3:0]Q;
  input s_axi_aresetn;
  input curr_fixed_burst_reg;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_1 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_1 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_1 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]_0 ;
  input axi_aresetn_d3;
  input [0:0]rd_addr_sm_cs;
  input axi_araddr_full;
  input last_bram_addr;
  input \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 ;
  input s_axi_rready;
  input brst_zero;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ;
  input [9:0]s_axi_araddr;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ;
  input curr_wrap_burst_reg;
  input sel;
  input axi_b2b_brst;
  input end_brst_rd;
  input axi_arsize_pipe_max;
  input axi_arlen_pipe_1_or_2;
  input disable_b2b_brst;
  input \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg ;
  input axi_arready_int;
  input s_axi_arvalid;
  input pend_rd_op;
  input ar_active;
  input no_ar_ack;
  input [7:0]\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 ;
  input axi_rd_burst;
  input [1:0]s_axi_arsize;
  input [1:0]\wrap_burst_total_reg[0]_0 ;
  input \wrap_burst_total_reg[1]_0 ;
  input [3:0]\wrap_burst_total_reg[2]_0 ;
  input [3:0]s_axi_arlen;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_0 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_1 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_2 ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 ;
  input \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] ;
  input [1:0]bram_addr_b;
  input \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] ;
  input s_axi_aclk;

  wire \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_1 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ;
  wire \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 ;
  wire \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg ;
  wire \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg ;
  wire \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg ;
  wire [7:0]\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] ;
  wire \GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ;
  wire \GEN_NO_RD_CMD_OPT.brst_zero_reg ;
  wire \GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg ;
  wire \GEN_NO_RD_CMD_OPT.last_bram_addr_reg ;
  wire \GEN_NO_RD_CMD_OPT.pend_rd_op_reg ;
  wire \GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ;
  wire [3:0]Q;
  wire [0:0]SR;
  wire ar_active;
  wire axi_araddr_full;
  wire axi_aresetn_d3;
  wire axi_arlen_pipe_1_or_2;
  wire axi_arready_int;
  wire axi_arsize_pipe_max;
  wire axi_b2b_brst;
  wire axi_rd_burst;
  wire [1:0]bram_addr_b;
  wire [13:4]bram_addr_ld;
  wire bram_addr_ld_en;
  wire brst_zero;
  wire curr_fixed_burst_reg;
  wire curr_narrow_burst;
  wire curr_wrap_burst_reg;
  wire [10:1]data0;
  wire disable_b2b_brst;
  wire end_brst_rd;
  wire last_bram_addr;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc_d1;
  wire no_ar_ack;
  wire pend_rd_op;
  wire [0:0]rd_addr_sm_cs;
  wire rd_adv_buf113_out;
  wire s_axi_aclk;
  wire [9:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire [3:0]s_axi_arlen;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire s_axi_rready;
  wire s_axi_rready_0;
  wire \save_init_bram_addr_ld[6]_i_2__0_n_0 ;
  wire \save_init_bram_addr_ld_reg[10]_0 ;
  wire \save_init_bram_addr_ld_reg[11]_0 ;
  wire \save_init_bram_addr_ld_reg[12]_0 ;
  wire \save_init_bram_addr_ld_reg[13]_0 ;
  wire \save_init_bram_addr_ld_reg[7]_0 ;
  wire \save_init_bram_addr_ld_reg[8]_0 ;
  wire \save_init_bram_addr_ld_reg[9]_0 ;
  wire sel;
  wire [2:0]wrap_burst_total;
  wire \wrap_burst_total[0]_i_2__0_n_0 ;
  wire \wrap_burst_total[1]_i_2_n_0 ;
  wire \wrap_burst_total[2]_i_2_n_0 ;
  wire [2:0]wrap_burst_total_cmb;
  wire [1:0]\wrap_burst_total_reg[0]_0 ;
  wire \wrap_burst_total_reg[1]_0 ;
  wire [3:0]\wrap_burst_total_reg[2]_0 ;

  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(data0[7]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0 ),
        .O(\save_init_bram_addr_ld_reg[10]_0 ));
  LUT6 #(
    .INIT(64'hCCFCCCCCDCFCDCFC)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I3(curr_fixed_burst_reg),
        .I4(curr_narrow_burst),
        .I5(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ),
        .O(\GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_10 
       (.I0(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [7]),
        .I1(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [5]),
        .I2(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [6]),
        .I3(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [4]),
        .I4(\GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] ),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(data0[8]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ),
        .O(\save_init_bram_addr_ld_reg[11]_0 ));
  LUT6 #(
    .INIT(64'h55555555FFDFFFFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3 
       (.I0(curr_wrap_burst_reg),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEFEFE00FEFE)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ),
        .I5(rd_adv_buf113_out),
        .O(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ));
  LUT6 #(
    .INIT(64'hFFF0000054540000)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7 
       (.I0(Q[1]),
        .I1(sel),
        .I2(\GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ),
        .I3(s_axi_rready_0),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFF0F200F2F0F)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8 
       (.I0(rd_adv_buf113_out),
        .I1(\GEN_NO_RD_CMD_OPT.brst_zero_reg ),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg ),
        .I5(\GEN_NO_RD_CMD_OPT.brst_cnt_reg[7] ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hCCACFFAFCCAC00A0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1 
       (.I0(data0[9]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I4(bram_addr_ld_en),
        .I5(bram_addr_b[0]),
        .O(\save_init_bram_addr_ld_reg[12]_0 ));
  LUT6 #(
    .INIT(64'hCCACFFAFCCAC00A0)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_1 
       (.I0(data0[10]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I4(bram_addr_ld_en),
        .I5(bram_addr_b[1]),
        .O(\save_init_bram_addr_ld_reg[13]_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ),
        .I1(narrow_addr_int[2]),
        .I2(narrow_addr_int[1]),
        .I3(narrow_addr_int[0]),
        .I4(narrow_bram_addr_inc_d1),
        .I5(curr_narrow_burst),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hABBBFFFF)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 ),
        .I3(\save_init_bram_addr_ld[6]_i_2__0_n_0 ),
        .I4(curr_wrap_burst_reg),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F00A000)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_1 ),
        .I2(wrap_burst_total[1]),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_2 ),
        .I4(wrap_burst_total[0]),
        .I5(wrap_burst_total[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_6 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_2 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_1 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8A8A8A8A8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] ),
        .I1(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]_0 ),
        .I4(narrow_bram_addr_inc_d1),
        .I5(curr_narrow_burst),
        .O(\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]_1 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA08A)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3 
       (.I0(data0[1]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_1 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hA28A)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3 
       (.I0(data0[2]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_1 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hAA8A)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3 
       (.I0(data0[3]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(data0[4]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ),
        .O(\save_init_bram_addr_ld_reg[7]_0 ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(data0[5]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0 ),
        .O(\save_init_bram_addr_ld_reg[8]_0 ));
  LUT6 #(
    .INIT(64'hEFEEE0EE2F222022)) 
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_1 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I4(data0[6]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0 ),
        .O(\save_init_bram_addr_ld_reg[9]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out[9]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 ),
        .I1(s_axi_rready),
        .O(rd_adv_buf113_out));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_i_3 
       (.I0(\wrap_burst_total_reg[2]_0 [1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_3 
       (.I0(axi_arsize_pipe_max),
        .I1(axi_araddr_full),
        .I2(axi_arlen_pipe_1_or_2),
        .I3(disable_b2b_brst),
        .I4(\GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg ),
        .O(\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h88088800)) 
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_4 
       (.I0(s_axi_rready),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 ),
        .I2(axi_b2b_brst),
        .I3(brst_zero),
        .I4(end_brst_rd),
        .O(s_axi_rready_0));
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_NO_RD_CMD_OPT.bram_en_int_i_11 
       (.I0(brst_zero),
        .I1(end_brst_rd),
        .O(\GEN_NO_RD_CMD_OPT.brst_zero_reg ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_2 
       (.I0(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [0]),
        .I1(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [1]),
        .I2(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [2]),
        .I3(\GEN_NO_RD_CMD_OPT.bram_en_int_i_7 [3]),
        .O(\GEN_NO_RD_CMD_OPT.brst_cnt_reg[0] ));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_7 
       (.I0(sel),
        .I1(axi_rd_burst),
        .O(\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_RL.axi_rd_burst_two_reg ));
  LUT1 #(
    .INIT(2'h1)) 
    bram_rst_b_INST_0
       (.I0(s_axi_aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[10]_i_1__0 
       (.I0(data0[7]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[6]),
        .O(bram_addr_ld[10]));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[11]_i_1__0 
       (.I0(data0[8]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[7]),
        .O(bram_addr_ld[11]));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[12]_i_1__0 
       (.I0(data0[9]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[8]),
        .O(bram_addr_ld[12]));
  LUT6 #(
    .INIT(64'h8A888A888A888888)) 
    \save_init_bram_addr_ld[13]_i_1__0 
       (.I0(axi_aresetn_d3),
        .I1(\GEN_NO_RD_CMD_OPT.last_bram_addr_reg ),
        .I2(rd_addr_sm_cs),
        .I3(\GEN_NO_RD_CMD_OPT.pend_rd_op_reg ),
        .I4(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg ),
        .I5(axi_araddr_full),
        .O(bram_addr_ld_en));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[13]_i_2__0 
       (.I0(data0[10]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[9]),
        .O(bram_addr_ld[13]));
  LUT6 #(
    .INIT(64'h2000222200000000)) 
    \save_init_bram_addr_ld[13]_i_3__0 
       (.I0(last_bram_addr),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_RL_NO_ECC.addr_rl_rd_buf_out_reg[0]_rep__0 ),
        .I3(s_axi_rready),
        .I4(brst_zero),
        .I5(\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg ),
        .O(\GEN_NO_RD_CMD_OPT.last_bram_addr_reg ));
  LUT3 #(
    .INIT(8'h01)) 
    \save_init_bram_addr_ld[13]_i_4 
       (.I0(pend_rd_op),
        .I1(ar_active),
        .I2(no_ar_ack),
        .O(\GEN_NO_RD_CMD_OPT.pend_rd_op_reg ));
  LUT2 #(
    .INIT(4'h8)) 
    \save_init_bram_addr_ld[13]_i_5 
       (.I0(axi_arready_int),
        .I1(s_axi_arvalid),
        .O(\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_RL.axi_arready_int_reg ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[4]_i_1__0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[0]),
        .O(bram_addr_ld[4]));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[5]_i_1__0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[1]),
        .O(bram_addr_ld[5]));
  LUT6 #(
    .INIT(64'hFFFFFF2F00000020)) 
    \save_init_bram_addr_ld[6]_i_1__0 
       (.I0(data0[3]),
        .I1(\save_init_bram_addr_ld[6]_i_2__0_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ),
        .I4(\GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1] ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ),
        .O(bram_addr_ld[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \save_init_bram_addr_ld[6]_i_2__0 
       (.I0(wrap_burst_total[1]),
        .I1(wrap_burst_total[2]),
        .I2(wrap_burst_total[0]),
        .O(\save_init_bram_addr_ld[6]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[7]_i_1__0 
       (.I0(data0[4]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[3]),
        .O(bram_addr_ld[7]));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[8]_i_1__0 
       (.I0(data0[5]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[4]),
        .O(bram_addr_ld[8]));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \save_init_bram_addr_ld[9]_i_1__0 
       (.I0(data0[6]),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_3_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_4_n_0 ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[5]),
        .O(bram_addr_ld[9]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[10]),
        .Q(data0[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[11]),
        .Q(data0[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[12]),
        .Q(data0[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[13] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[13]),
        .Q(data0[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[4]),
        .Q(data0[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[5]),
        .Q(data0[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[6]),
        .Q(data0[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[7]),
        .Q(data0[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[8]),
        .Q(data0[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[9]),
        .Q(data0[6]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h02A2)) 
    \wrap_burst_total[0]_i_1__0 
       (.I0(\wrap_burst_total[0]_i_2__0_n_0 ),
        .I1(s_axi_arsize[1]),
        .I2(axi_araddr_full),
        .I3(\wrap_burst_total_reg[0]_0 [1]),
        .O(wrap_burst_total_cmb[0]));
  LUT6 #(
    .INIT(64'h2100900020008000)) 
    \wrap_burst_total[0]_i_2__0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] ),
        .I1(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] ),
        .I4(\wrap_burst_total_reg[1]_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ),
        .O(\wrap_burst_total[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[0]_i_3 
       (.I0(\wrap_burst_total_reg[2]_0 [0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] ));
  LUT6 #(
    .INIT(64'h0400400040404000)) 
    \wrap_burst_total[1]_i_1__0 
       (.I0(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ),
        .I1(\wrap_burst_total[1]_i_2_n_0 ),
        .I2(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ),
        .I3(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] ),
        .I4(\wrap_burst_total_reg[1]_0 ),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ),
        .O(wrap_burst_total_cmb[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    \wrap_burst_total[1]_i_2 
       (.I0(s_axi_arlen[0]),
        .I1(\wrap_burst_total_reg[2]_0 [0]),
        .I2(s_axi_arlen[1]),
        .I3(axi_araddr_full),
        .I4(\wrap_burst_total_reg[2]_0 [1]),
        .O(\wrap_burst_total[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_3 
       (.I0(\wrap_burst_total_reg[0]_0 [0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[0]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_4__0 
       (.I0(\wrap_burst_total_reg[2]_0 [2]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[2]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_5__0 
       (.I0(\wrap_burst_total_reg[2]_0 [3]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[3]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ));
  LUT6 #(
    .INIT(64'h0000000088800080)) 
    \wrap_burst_total[2]_i_1 
       (.I0(\wrap_burst_total[2]_i_2_n_0 ),
        .I1(\wrap_burst_total_reg[1]_0 ),
        .I2(s_axi_arsize[0]),
        .I3(axi_araddr_full),
        .I4(\wrap_burst_total_reg[0]_0 [0]),
        .I5(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ),
        .O(wrap_burst_total_cmb[2]));
  LUT6 #(
    .INIT(64'h8A800A0080800000)) 
    \wrap_burst_total[2]_i_2 
       (.I0(\wrap_burst_total[1]_i_2_n_0 ),
        .I1(\wrap_burst_total_reg[2]_0 [2]),
        .I2(axi_araddr_full),
        .I3(s_axi_arlen[2]),
        .I4(\wrap_burst_total_reg[2]_0 [3]),
        .I5(s_axi_arlen[3]),
        .O(\wrap_burst_total[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[2]_i_4 
       (.I0(\wrap_burst_total_reg[0]_0 [1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .O(\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(wrap_burst_total_cmb[0]),
        .Q(wrap_burst_total[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(wrap_burst_total_cmb[1]),
        .Q(wrap_burst_total[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(wrap_burst_total_cmb[2]),
        .Q(wrap_burst_total[2]),
        .R(SR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
