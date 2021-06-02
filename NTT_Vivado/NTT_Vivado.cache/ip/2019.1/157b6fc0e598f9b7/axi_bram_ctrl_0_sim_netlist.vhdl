-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jun  1 23:04:54 2021
-- Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_bram_ctrl_0_sim_netlist.vhdl
-- Design      : axi_bram_ctrl_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO is
  port (
    \GEN_AW_DUAL.aw_active_reg\ : out STD_LOGIC;
    \bvalid_cnt_reg[2]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg\ : out STD_LOGIC;
    bid_gets_fifo_load : out STD_LOGIC;
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0\ : out STD_LOGIC;
    \bvalid_cnt_reg[0]\ : out STD_LOGIC;
    \axi_bid_int_reg[0]\ : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    aw_active : in STD_LOGIC;
    last_data_ack_mod : in STD_LOGIC;
    bid_gets_fifo_load_d1_reg : in STD_LOGIC;
    bvalid_cnt : in STD_LOGIC_VECTOR ( 2 downto 0 );
    bid_gets_fifo_load_d1_reg_0 : in STD_LOGIC;
    bid_gets_fifo_load_d1 : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    \axi_bid_int_reg[0]_0\ : in STD_LOGIC;
    wr_data_sm_cs : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_wr_burst : in STD_LOGIC;
    axi_awaddr_full : in STD_LOGIC;
    wr_addr_sm_cs : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awready : in STD_LOGIC;
    \GEN_AWREADY.axi_awready_int_i_5\ : in STD_LOGIC;
    curr_awlen_reg_1_or_2 : in STD_LOGIC;
    axi_awlen_pipe_1_or_2 : in STD_LOGIC;
    axi_awid_pipe : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO is
  signal \Addr_Counters[0].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[1].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[2].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[3].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[3].XORCY_I_i_1_n_0\ : STD_LOGIC;
  signal CI : STD_LOGIC;
  signal D : STD_LOGIC;
  signal Data_Exists_DFF_i_2_n_0 : STD_LOGIC;
  signal Data_Exists_DFF_i_3_n_0 : STD_LOGIC;
  signal Data_Exists_DFF_i_4_n_0 : STD_LOGIC;
  signal \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[2]\ : STD_LOGIC;
  signal \GEN_AWREADY.axi_awready_int_i_7_n_0\ : STD_LOGIC;
  signal \^gen_aw_dual.aw_active_reg\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awaddr_full_reg\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awaddr_full_reg_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal S0_out : STD_LOGIC;
  signal S1_out : STD_LOGIC;
  signal addr_cy_1 : STD_LOGIC;
  signal addr_cy_2 : STD_LOGIC;
  signal addr_cy_3 : STD_LOGIC;
  signal \axi_bid_int[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_bid_int[0]_i_3_n_0\ : STD_LOGIC;
  signal axi_bvalid_int_i_4_n_0 : STD_LOGIC;
  signal bid_fifo_ld : STD_LOGIC;
  signal bid_fifo_not_empty : STD_LOGIC;
  signal bid_fifo_rd : STD_LOGIC;
  signal \^bid_gets_fifo_load\ : STD_LOGIC;
  signal \^bvalid_cnt_reg[0]\ : STD_LOGIC;
  signal \^bvalid_cnt_reg[2]\ : STD_LOGIC;
  signal sum_A_0 : STD_LOGIC;
  signal sum_A_1 : STD_LOGIC;
  signal sum_A_2 : STD_LOGIC;
  signal sum_A_3 : STD_LOGIC;
  signal \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \Addr_Counters[0].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "LO:O";
  attribute BOX_TYPE of \Addr_Counters[1].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \Addr_Counters[2].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \Addr_Counters[3].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of Data_Exists_DFF : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of Data_Exists_DFF : label is "FDR";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Data_Exists_DFF_i_4 : label is "soft_lutpair72";
  attribute BOX_TYPE of \FIFO_RAM[0].SRL16E_I\ : label is "PRIMITIVE";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \FIFO_RAM[0].SRL16E_I\ : label is "U0/\gint_inst.abcv4_0_int_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM ";
  attribute srl_name : string;
  attribute srl_name of \FIFO_RAM[0].SRL16E_I\ : label is "U0/\gint_inst.abcv4_0_int_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM[0].SRL16E_I ";
  attribute SOFT_HLUTNM of \FIFO_RAM[0].SRL16E_I_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \GEN_AWREADY.axi_awready_int_i_6\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2\ : label is "soft_lutpair73";
begin
  \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]\ <= \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[2]\;
  \GEN_AW_DUAL.aw_active_reg\ <= \^gen_aw_dual.aw_active_reg\;
  \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg\ <= \^gen_aw_pipe_dual.axi_awaddr_full_reg\;
  \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0\ <= \^gen_aw_pipe_dual.axi_awaddr_full_reg_0\;
  bid_gets_fifo_load <= \^bid_gets_fifo_load\;
  \bvalid_cnt_reg[0]\ <= \^bvalid_cnt_reg[0]\;
  \bvalid_cnt_reg[2]\ <= \^bvalid_cnt_reg[2]\;
\Addr_Counters[0].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bid_fifo_not_empty,
      D => sum_A_3,
      Q => \Addr_Counters[0].FDRE_I_n_0\,
      R => SR(0)
    );
\Addr_Counters[0].MUXCY_L_I_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED\(3),
      CO(2) => addr_cy_1,
      CO(1) => addr_cy_2,
      CO(0) => addr_cy_3,
      CYINIT => CI,
      DI(3) => \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => \Addr_Counters[2].FDRE_I_n_0\,
      DI(1) => \Addr_Counters[1].FDRE_I_n_0\,
      DI(0) => \Addr_Counters[0].FDRE_I_n_0\,
      O(3) => sum_A_0,
      O(2) => sum_A_1,
      O(1) => sum_A_2,
      O(0) => sum_A_3,
      S(3) => \Addr_Counters[3].XORCY_I_i_1_n_0\,
      S(2) => S0_out,
      S(1) => S1_out,
      S(0) => S
    );
\Addr_Counters[0].MUXCY_L_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFFFFFD0000"
    )
        port map (
      I0 => \^gen_aw_dual.aw_active_reg\,
      I1 => \Addr_Counters[1].FDRE_I_n_0\,
      I2 => \Addr_Counters[3].FDRE_I_n_0\,
      I3 => \Addr_Counters[2].FDRE_I_n_0\,
      I4 => \axi_bid_int[0]_i_2_n_0\,
      I5 => \Addr_Counters[0].FDRE_I_n_0\,
      O => S
    );
\Addr_Counters[0].MUXCY_L_I_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4555555555555555"
    )
        port map (
      I0 => \^gen_aw_dual.aw_active_reg\,
      I1 => \axi_bid_int[0]_i_2_n_0\,
      I2 => \Addr_Counters[0].FDRE_I_n_0\,
      I3 => \Addr_Counters[1].FDRE_I_n_0\,
      I4 => \Addr_Counters[3].FDRE_I_n_0\,
      I5 => \Addr_Counters[2].FDRE_I_n_0\,
      O => CI
    );
\Addr_Counters[1].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bid_fifo_not_empty,
      D => sum_A_2,
      Q => \Addr_Counters[1].FDRE_I_n_0\,
      R => SR(0)
    );
\Addr_Counters[1].MUXCY_L_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFFFFFD0000"
    )
        port map (
      I0 => \^gen_aw_dual.aw_active_reg\,
      I1 => \Addr_Counters[0].FDRE_I_n_0\,
      I2 => \Addr_Counters[3].FDRE_I_n_0\,
      I3 => \Addr_Counters[2].FDRE_I_n_0\,
      I4 => \axi_bid_int[0]_i_2_n_0\,
      I5 => \Addr_Counters[1].FDRE_I_n_0\,
      O => S1_out
    );
\Addr_Counters[2].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bid_fifo_not_empty,
      D => sum_A_1,
      Q => \Addr_Counters[2].FDRE_I_n_0\,
      R => SR(0)
    );
\Addr_Counters[2].MUXCY_L_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFFFFFD0000"
    )
        port map (
      I0 => \^gen_aw_dual.aw_active_reg\,
      I1 => \Addr_Counters[0].FDRE_I_n_0\,
      I2 => \Addr_Counters[1].FDRE_I_n_0\,
      I3 => \Addr_Counters[3].FDRE_I_n_0\,
      I4 => \axi_bid_int[0]_i_2_n_0\,
      I5 => \Addr_Counters[2].FDRE_I_n_0\,
      O => S0_out
    );
\Addr_Counters[3].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bid_fifo_not_empty,
      D => sum_A_0,
      Q => \Addr_Counters[3].FDRE_I_n_0\,
      R => SR(0)
    );
\Addr_Counters[3].XORCY_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFFFFFD0000"
    )
        port map (
      I0 => \^gen_aw_dual.aw_active_reg\,
      I1 => \Addr_Counters[0].FDRE_I_n_0\,
      I2 => \Addr_Counters[1].FDRE_I_n_0\,
      I3 => \Addr_Counters[2].FDRE_I_n_0\,
      I4 => \axi_bid_int[0]_i_2_n_0\,
      I5 => \Addr_Counters[3].FDRE_I_n_0\,
      O => \Addr_Counters[3].XORCY_I_i_1_n_0\
    );
Data_Exists_DFF: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D,
      Q => bid_fifo_not_empty,
      R => SR(0)
    );
Data_Exists_DFF_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C8CF"
    )
        port map (
      I0 => Data_Exists_DFF_i_2_n_0,
      I1 => bid_fifo_not_empty,
      I2 => Data_Exists_DFF_i_3_n_0,
      I3 => \^gen_aw_dual.aw_active_reg\,
      O => D
    );
Data_Exists_DFF_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFFE"
    )
        port map (
      I0 => bvalid_cnt(0),
      I1 => bvalid_cnt(2),
      I2 => bvalid_cnt(1),
      I3 => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[2]\,
      I4 => Data_Exists_DFF_i_4_n_0,
      I5 => bid_gets_fifo_load_d1,
      O => Data_Exists_DFF_i_2_n_0
    );
Data_Exists_DFF_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Addr_Counters[0].FDRE_I_n_0\,
      I1 => \Addr_Counters[1].FDRE_I_n_0\,
      I2 => \Addr_Counters[3].FDRE_I_n_0\,
      I3 => \Addr_Counters[2].FDRE_I_n_0\,
      O => Data_Exists_DFF_i_3_n_0
    );
Data_Exists_DFF_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => \axi_bid_int_reg[0]_0\,
      I1 => s_axi_bready,
      I2 => bvalid_cnt(1),
      I3 => bvalid_cnt(2),
      I4 => bvalid_cnt(0),
      O => Data_Exists_DFF_i_4_n_0
    );
\FIFO_RAM[0].SRL16E_I\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000",
      IS_CLK_INVERTED => '0'
    )
        port map (
      A0 => \Addr_Counters[0].FDRE_I_n_0\,
      A1 => \Addr_Counters[1].FDRE_I_n_0\,
      A2 => \Addr_Counters[2].FDRE_I_n_0\,
      A3 => \Addr_Counters[3].FDRE_I_n_0\,
      CE => CI,
      CLK => s_axi_aclk,
      D => bid_fifo_ld,
      Q => bid_fifo_rd
    );
\FIFO_RAM[0].SRL16E_I_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_awid_pipe,
      I1 => axi_awaddr_full,
      I2 => s_axi_awid(0),
      O => bid_fifo_ld
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808080FFFFFF"
    )
        port map (
      I0 => bvalid_cnt(0),
      I1 => bvalid_cnt(1),
      I2 => bvalid_cnt(2),
      I3 => s_axi_awvalid,
      I4 => s_axi_awready,
      I5 => aw_active,
      O => \^bvalid_cnt_reg[0]\
    );
\GEN_AWREADY.axi_awready_int_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEAAFEFFFFFFFF"
    )
        port map (
      I0 => \^bvalid_cnt_reg[2]\,
      I1 => aw_active,
      I2 => \GEN_AWREADY.axi_awready_int_i_7_n_0\,
      I3 => last_data_ack_mod,
      I4 => \^gen_aw_pipe_dual.axi_awaddr_full_reg\,
      I5 => bid_gets_fifo_load_d1_reg,
      O => \^gen_aw_dual.aw_active_reg\
    );
\GEN_AWREADY.axi_awready_int_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => bvalid_cnt(2),
      I1 => bvalid_cnt(1),
      I2 => bvalid_cnt(0),
      O => \^bvalid_cnt_reg[2]\
    );
\GEN_AWREADY.axi_awready_int_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => wr_addr_sm_cs,
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      O => \GEN_AWREADY.axi_awready_int_i_7_n_0\
    );
\GEN_AWREADY.axi_awready_int_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => axi_awaddr_full,
      I1 => \GEN_AWREADY.axi_awready_int_i_5\,
      I2 => curr_awlen_reg_1_or_2,
      I3 => axi_awlen_pipe_1_or_2,
      O => \^gen_aw_pipe_dual.axi_awaddr_full_reg\
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^bvalid_cnt_reg[0]\,
      I1 => \^gen_aw_dual.aw_active_reg\,
      I2 => axi_awaddr_full,
      O => \^gen_aw_pipe_dual.axi_awaddr_full_reg_0\
    );
\axi_bid_int[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => bid_fifo_ld,
      I1 => bid_fifo_rd,
      I2 => \^bid_gets_fifo_load\,
      I3 => \axi_bid_int[0]_i_2_n_0\,
      I4 => s_axi_bid(0),
      O => \axi_bid_int_reg[0]\
    );
\axi_bid_int[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAA8A8A8"
    )
        port map (
      I0 => bid_fifo_not_empty,
      I1 => bid_gets_fifo_load_d1,
      I2 => \axi_bid_int[0]_i_3_n_0\,
      I3 => s_axi_bready,
      I4 => \axi_bid_int_reg[0]_0\,
      I5 => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[2]\,
      O => \axi_bid_int[0]_i_2_n_0\
    );
\axi_bid_int[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => bvalid_cnt(0),
      I1 => bvalid_cnt(2),
      I2 => bvalid_cnt(1),
      O => \axi_bid_int[0]_i_3_n_0\
    );
axi_bvalid_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBBBBABBBB"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => axi_bvalid_int_i_4_n_0,
      I2 => \^gen_aw_pipe_dual.axi_awaddr_full_reg_0\,
      I3 => axi_wr_burst,
      I4 => wr_data_sm_cs(0),
      I5 => wr_data_sm_cs(1),
      O => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[2]\
    );
axi_bvalid_int_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0B000000"
    )
        port map (
      I0 => wr_data_sm_cs(1),
      I1 => \^bvalid_cnt_reg[0]\,
      I2 => wr_data_sm_cs(0),
      I3 => s_axi_wlast,
      I4 => s_axi_wvalid,
      O => axi_bvalid_int_i_4_n_0
    );
bid_gets_fifo_load_d1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000015"
    )
        port map (
      I0 => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[2]\,
      I1 => bid_fifo_not_empty,
      I2 => bvalid_cnt(0),
      I3 => bid_gets_fifo_load_d1_reg_0,
      I4 => \^gen_aw_dual.aw_active_reg\,
      O => \^bid_gets_fifo_load\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow is
  port (
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1]\ : out STD_LOGIC;
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0]\ : out STD_LOGIC;
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1]\ : out STD_LOGIC;
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]\ : out STD_LOGIC;
    \s_axi_awsize[2]\ : out STD_LOGIC;
    ua_narrow_load1_carry_i_5_0 : in STD_LOGIC;
    ua_narrow_load1_carry_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_awaddr_full : in STD_LOGIC;
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]\ : in STD_LOGIC;
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\ : in STD_LOGIC;
    \GEN_NARROW_CNT.narrow_addr_int_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\ : in STD_LOGIC;
    \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_NARROW_CNT.narrow_addr_int_reg[1]\ : in STD_LOGIC;
    \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\ : in STD_LOGIC;
    \GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\ : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow is
  signal \^gen_aw_pipe_dual.gen_awaddr[0].axi_awaddr_pipe_reg[0]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.gen_awaddr[1].axi_awaddr_pipe_reg[1]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.gen_awaddr[2].axi_awaddr_pipe_reg[2]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awsize_pipe_reg[2]\ : STD_LOGIC;
  signal \^s_axi_awsize[2]\ : STD_LOGIC;
  signal ua_narrow_load1_carry_i_10_n_0 : STD_LOGIC;
  signal \ua_narrow_load1_carry_i_1__0_n_0\ : STD_LOGIC;
  signal ua_narrow_load1_carry_i_2_n_0 : STD_LOGIC;
  signal ua_narrow_load1_carry_i_3_n_0 : STD_LOGIC;
  signal \ua_narrow_load1_carry_i_4__0_n_0\ : STD_LOGIC;
  signal ua_narrow_load1_carry_i_5_n_0 : STD_LOGIC;
  signal ua_narrow_load1_carry_i_6_n_0 : STD_LOGIC;
  signal ua_narrow_load1_carry_n_2 : STD_LOGIC;
  signal ua_narrow_load1_carry_n_3 : STD_LOGIC;
  signal NLW_ua_narrow_load1_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_ua_narrow_load1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of ua_narrow_load1_carry_i_5 : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of ua_narrow_load1_carry_i_7 : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of ua_narrow_load1_carry_i_8 : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \ua_narrow_load1_carry_i_9__0\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \wrap_burst_total[0]_i_7\ : label is "soft_lutpair74";
begin
  \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0]\ <= \^gen_aw_pipe_dual.gen_awaddr[0].axi_awaddr_pipe_reg[0]\;
  \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1]\ <= \^gen_aw_pipe_dual.gen_awaddr[1].axi_awaddr_pipe_reg[1]\;
  \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2]\ <= \^gen_aw_pipe_dual.gen_awaddr[2].axi_awaddr_pipe_reg[2]\;
  \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2]\ <= \^gen_aw_pipe_dual.axi_awsize_pipe_reg[2]\;
  \s_axi_awsize[2]\ <= \^s_axi_awsize[2]\;
\GEN_NARROW_CNT.narrow_addr_int[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D100D100D1FFD100"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]\,
      I1 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\,
      I2 => \GEN_NARROW_CNT.narrow_addr_int_reg[2]\(0),
      I3 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\,
      I4 => ua_narrow_load1_carry_n_2,
      I5 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\,
      O => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0]\
    );
\GEN_NARROW_CNT.narrow_addr_int[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88B8B888"
    )
        port map (
      I0 => D(0),
      I1 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\,
      I2 => ua_narrow_load1_carry_n_2,
      I3 => \GEN_NARROW_CNT.narrow_addr_int_reg[1]\,
      I4 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\,
      O => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1]\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B008B008BFF8B00"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int_reg[2]\(1),
      I1 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\,
      I2 => \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\,
      I3 => \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\,
      I4 => ua_narrow_load1_carry_n_2,
      I5 => \GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\,
      O => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]\
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => Q(1),
      I2 => s_axi_awsize(0),
      I3 => axi_awaddr_full,
      I4 => Q(0),
      O => \^s_axi_awsize[2]\
    );
ua_narrow_load1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 2) => NLW_ua_narrow_load1_carry_CO_UNCONNECTED(3 downto 2),
      CO(1) => ua_narrow_load1_carry_n_2,
      CO(0) => ua_narrow_load1_carry_n_3,
      CYINIT => '1',
      DI(3 downto 2) => B"00",
      DI(1) => \ua_narrow_load1_carry_i_1__0_n_0\,
      DI(0) => ua_narrow_load1_carry_i_2_n_0,
      O(3 downto 0) => NLW_ua_narrow_load1_carry_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => ua_narrow_load1_carry_i_3_n_0,
      S(0) => \ua_narrow_load1_carry_i_4__0_n_0\
    );
ua_narrow_load1_carry_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF5555FFFF57F7"
    )
        port map (
      I0 => \^gen_aw_pipe_dual.gen_awaddr[1].axi_awaddr_pipe_reg[1]\,
      I1 => s_axi_awaddr(0),
      I2 => axi_awaddr_full,
      I3 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\,
      I4 => \^s_axi_awsize[2]\,
      I5 => ua_narrow_load1_carry_i_5_0,
      O => ua_narrow_load1_carry_i_10_n_0
    );
\ua_narrow_load1_carry_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000440347"
    )
        port map (
      I0 => Q(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awsize(0),
      I3 => Q(1),
      I4 => s_axi_awsize(1),
      I5 => ua_narrow_load1_carry_i_5_n_0,
      O => \ua_narrow_load1_carry_i_1__0_n_0\
    );
ua_narrow_load1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => ua_narrow_load1_carry_i_6_n_0,
      I1 => s_axi_awaddr(2),
      I2 => axi_awaddr_full,
      I3 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\,
      O => ua_narrow_load1_carry_i_2_n_0
    );
ua_narrow_load1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEEFAFAFFEE"
    )
        port map (
      I0 => ua_narrow_load1_carry_i_5_n_0,
      I1 => s_axi_awsize(1),
      I2 => Q(1),
      I3 => s_axi_awsize(0),
      I4 => axi_awaddr_full,
      I5 => Q(0),
      O => ua_narrow_load1_carry_i_3_n_0
    );
\ua_narrow_load1_carry_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FE00C200F000C0"
    )
        port map (
      I0 => \^gen_aw_pipe_dual.gen_awaddr[0].axi_awaddr_pipe_reg[0]\,
      I1 => ua_narrow_load1_carry_i_5_0,
      I2 => ua_narrow_load1_carry_0,
      I3 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[2]\,
      I4 => \^gen_aw_pipe_dual.gen_awaddr[2].axi_awaddr_pipe_reg[2]\,
      I5 => \^gen_aw_pipe_dual.gen_awaddr[1].axi_awaddr_pipe_reg[1]\,
      O => \ua_narrow_load1_carry_i_4__0_n_0\
    );
ua_narrow_load1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => s_axi_awaddr(2),
      I1 => axi_awaddr_full,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\,
      I3 => ua_narrow_load1_carry_i_10_n_0,
      O => ua_narrow_load1_carry_i_5_n_0
    );
ua_narrow_load1_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000005044440050"
    )
        port map (
      I0 => ua_narrow_load1_carry_i_5_0,
      I1 => Q(0),
      I2 => s_axi_awsize(0),
      I3 => s_axi_awsize(1),
      I4 => axi_awaddr_full,
      I5 => Q(1),
      O => ua_narrow_load1_carry_i_6_n_0
    );
ua_narrow_load1_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\,
      I1 => axi_awaddr_full,
      I2 => s_axi_awaddr(0),
      O => \^gen_aw_pipe_dual.gen_awaddr[0].axi_awaddr_pipe_reg[0]\
    );
ua_narrow_load1_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\,
      I1 => axi_awaddr_full,
      I2 => s_axi_awaddr(2),
      O => \^gen_aw_pipe_dual.gen_awaddr[2].axi_awaddr_pipe_reg[2]\
    );
\ua_narrow_load1_carry_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg\,
      I1 => axi_awaddr_full,
      I2 => s_axi_awaddr(1),
      O => \^gen_aw_pipe_dual.gen_awaddr[1].axi_awaddr_pipe_reg[1]\
    );
\wrap_burst_total[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => axi_awaddr_full,
      I2 => s_axi_awsize(1),
      O => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0 is
  port (
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2]\ : out STD_LOGIC;
    s_axi_arsize_0_sp_1 : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]\ : out STD_LOGIC;
    s_axi_arsize_2_sp_1 : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\ : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_araddr_full : in STD_LOGIC;
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ua_narrow_load1_carry_i_1_0 : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    D : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_1\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_2\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_0\ : in STD_LOGIC;
    narrow_addr_int : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\ : in STD_LOGIC;
    curr_narrow_burst : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_3\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0 : entity is "ua_narrow";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0 is
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[0].axi_araddr_pipe_reg[0]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[1].axi_araddr_pipe_reg[1]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[2].axi_araddr_pipe_reg[2]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[2]\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0\ : STD_LOGIC;
  signal s_axi_arsize_0_sn_1 : STD_LOGIC;
  signal s_axi_arsize_2_sn_1 : STD_LOGIC;
  signal \ua_narrow_load1_carry_i_10__0_n_0\ : STD_LOGIC;
  signal ua_narrow_load1_carry_i_1_n_0 : STD_LOGIC;
  signal \ua_narrow_load1_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \ua_narrow_load1_carry_i_3__0_n_0\ : STD_LOGIC;
  signal ua_narrow_load1_carry_i_4_n_0 : STD_LOGIC;
  signal \ua_narrow_load1_carry_i_5__0_n_0\ : STD_LOGIC;
  signal ua_narrow_load1_carry_i_9_n_0 : STD_LOGIC;
  signal ua_narrow_load1_carry_n_2 : STD_LOGIC;
  signal ua_narrow_load1_carry_n_3 : STD_LOGIC;
  signal NLW_ua_narrow_load1_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_ua_narrow_load1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ua_narrow_load1_carry_i_5__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ua_narrow_load1_carry_i_6__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ua_narrow_load1_carry_i_7__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ua_narrow_load1_carry_i_8__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wrap_burst_total[1]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wrap_burst_total[1]_i_6\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wrap_burst_total[1]_i_7\ : label is "soft_lutpair2";
begin
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[0].axi_araddr_pipe_reg[0]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[1].axi_araddr_pipe_reg[1]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[2].axi_araddr_pipe_reg[2]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[2]\;
  s_axi_arsize_0_sp_1 <= s_axi_arsize_0_sn_1;
  s_axi_arsize_2_sp_1 <= s_axi_arsize_2_sn_1;
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00B8B800FFB8B8"
    )
        port map (
      I0 => D(0),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\,
      I5 => narrow_addr_int(0),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ua_narrow_load1_carry_n_2,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAFCCCC0050CCCC"
    )
        port map (
      I0 => narrow_addr_int(0),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0\,
      I2 => curr_narrow_burst,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_3\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\,
      I5 => narrow_addr_int(1),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA20AA20AAEFAA20"
    )
        port map (
      I0 => D(1),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_1\,
      I4 => ua_narrow_load1_carry_n_2,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_2\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEF0F00011F0F0"
    )
        port map (
      I0 => narrow_addr_int(0),
      I1 => narrow_addr_int(1),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\,
      I5 => narrow_addr_int(2),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA20AA20AAEFAA20"
    )
        port map (
      I0 => D(2),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_1\,
      I4 => ua_narrow_load1_carry_n_2,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => Q(2),
      I2 => s_axi_arsize(1),
      I3 => axi_araddr_full,
      I4 => Q(1),
      O => s_axi_arsize_2_sn_1
    );
ua_narrow_load1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 2) => NLW_ua_narrow_load1_carry_CO_UNCONNECTED(3 downto 2),
      CO(1) => ua_narrow_load1_carry_n_2,
      CO(0) => ua_narrow_load1_carry_n_3,
      CYINIT => '1',
      DI(3 downto 2) => B"00",
      DI(1) => ua_narrow_load1_carry_i_1_n_0,
      DI(0) => \ua_narrow_load1_carry_i_2__0_n_0\,
      O(3 downto 0) => NLW_ua_narrow_load1_carry_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \ua_narrow_load1_carry_i_3__0_n_0\,
      S(0) => ua_narrow_load1_carry_i_4_n_0
    );
ua_narrow_load1_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000440347"
    )
        port map (
      I0 => Q(1),
      I1 => axi_araddr_full,
      I2 => s_axi_arsize(1),
      I3 => Q(2),
      I4 => s_axi_arsize(2),
      I5 => \ua_narrow_load1_carry_i_5__0_n_0\,
      O => ua_narrow_load1_carry_i_1_n_0
    );
\ua_narrow_load1_carry_i_10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000047034400"
    )
        port map (
      I0 => Q(2),
      I1 => axi_araddr_full,
      I2 => s_axi_arsize(2),
      I3 => Q(1),
      I4 => s_axi_arsize(1),
      I5 => s_axi_arsize_0_sn_1,
      O => \ua_narrow_load1_carry_i_10__0_n_0\
    );
\ua_narrow_load1_carry_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000404040004"
    )
        port map (
      I0 => s_axi_arsize_0_sn_1,
      I1 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\,
      I2 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[2]\,
      I3 => s_axi_araddr(2),
      I4 => axi_araddr_full,
      I5 => ua_narrow_load1_carry_i_1_0,
      O => \ua_narrow_load1_carry_i_2__0_n_0\
    );
\ua_narrow_load1_carry_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFBBFCB8"
    )
        port map (
      I0 => Q(1),
      I1 => axi_araddr_full,
      I2 => s_axi_arsize(1),
      I3 => Q(2),
      I4 => s_axi_arsize(2),
      I5 => \ua_narrow_load1_carry_i_5__0_n_0\,
      O => \ua_narrow_load1_carry_i_3__0_n_0\
    );
ua_narrow_load1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FA00F800F00008"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[1].axi_araddr_pipe_reg[1]\,
      I1 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[0].axi_araddr_pipe_reg[0]\,
      I2 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\,
      I3 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[2]\,
      I4 => s_axi_arsize_0_sn_1,
      I5 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[2].axi_araddr_pipe_reg[2]\,
      O => ua_narrow_load1_carry_i_4_n_0
    );
\ua_narrow_load1_carry_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D0DDD000"
    )
        port map (
      I0 => ua_narrow_load1_carry_i_9_n_0,
      I1 => \ua_narrow_load1_carry_i_10__0_n_0\,
      I2 => ua_narrow_load1_carry_i_1_0,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(2),
      O => \ua_narrow_load1_carry_i_5__0_n_0\
    );
\ua_narrow_load1_carry_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_0\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(1),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[1].axi_araddr_pipe_reg[1]\
    );
\ua_narrow_load1_carry_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(0),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[0].axi_araddr_pipe_reg[0]\
    );
\ua_narrow_load1_carry_i_8__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ua_narrow_load1_carry_i_1_0,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(2),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[2].axi_araddr_pipe_reg[2]\
    );
ua_narrow_load1_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33377737FFFFFFFF"
    )
        port map (
      I0 => s_axi_arsize_0_sn_1,
      I1 => s_axi_arsize_2_sn_1,
      I2 => s_axi_araddr(0),
      I3 => axi_araddr_full,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7\,
      I5 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.gen_araddr[1].axi_araddr_pipe_reg[1]\,
      O => ua_narrow_load1_carry_i_9_n_0
    );
\wrap_burst_total[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(2),
      I1 => axi_araddr_full,
      I2 => s_axi_arsize(2),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[2]\
    );
\wrap_burst_total[1]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => axi_araddr_full,
      I2 => s_axi_arsize(1),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\
    );
\wrap_burst_total[1]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => s_axi_arsize(0),
      I1 => Q(0),
      I2 => axi_araddr_full,
      O => s_axi_arsize_0_sn_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    curr_wrap_burst_reg_reg : out STD_LOGIC;
    curr_fixed_burst_reg_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]_0\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]_0\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0]\ : out STD_LOGIC;
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3]\ : out STD_LOGIC;
    wr_data_sm_cs : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \save_init_bram_addr_ld_reg[14]_0\ : in STD_LOGIC;
    curr_wrap_burst_reg : in STD_LOGIC;
    curr_wrap_burst : in STD_LOGIC;
    curr_fixed_burst_reg : in STD_LOGIC;
    curr_fixed_burst : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    axi_awaddr_full : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\ : in STD_LOGIC;
    curr_narrow_burst : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg\ : in STD_LOGIC;
    narrow_bram_addr_inc_d1 : in STD_LOGIC;
    narrow_addr_int : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \wrap_burst_total_reg[0]_0\ : in STD_LOGIC;
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \wrap_burst_total_reg[1]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \wrap_burst_total_reg[2]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_burst_total_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst is
  signal \^d\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[0]_0\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awlen_pipe_reg[0]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awlen_pipe_reg[2]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awlen_pipe_reg[3]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]\ : STD_LOGIC;
  signal \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]_0\ : STD_LOGIC;
  signal \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\ : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal data0 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \save_init_bram_addr_ld[14]_i_3_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_4_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_5__0_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[5]_i_2__0_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[6]_i_2__0_n_0\ : STD_LOGIC;
  signal wrap_burst_total : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \wrap_burst_total[0]_i_4_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[0]_i_5_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[0]_i_6_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[0]_i_8_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[1]_i_2_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[1]_i_3_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[2]_i_2__0_n_0\ : STD_LOGIC;
  signal wrap_burst_total_cmb : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_2\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_2\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of curr_wrap_burst_reg_i_1 : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \save_init_bram_addr_ld[14]_i_3\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \save_init_bram_addr_ld[5]_i_2__0\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \save_init_bram_addr_ld[6]_i_2__0\ : label is "soft_lutpair79";
begin
  D(11 downto 0) <= \^d\(11 downto 0);
  E(0) <= \^e\(0);
  \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]_0\ <= \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[0]_0\;
  \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0]\ <= \^gen_aw_pipe_dual.axi_awlen_pipe_reg[0]\;
  \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1]\ <= \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\;
  \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2]\ <= \^gen_aw_pipe_dual.axi_awlen_pipe_reg[2]\;
  \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3]\ <= \^gen_aw_pipe_dual.axi_awlen_pipe_reg[3]\;
  \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0]\ <= \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\;
  \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]\ <= \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]\;
  \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]_0\ <= \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]_0\;
  SR(0) <= \^sr\(0);
\GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AFF6A00"
    )
        port map (
      I0 => Q(7),
      I1 => \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\,
      I2 => Q(6),
      I3 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I4 => p_1_in(6),
      O => \^d\(7)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55557775"
    )
        port map (
      I0 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I1 => curr_fixed_burst_reg,
      I2 => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[0]_0\,
      I3 => curr_narrow_burst,
      I4 => \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\,
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\(0)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAFFFF6AAA0000"
    )
        port map (
      I0 => Q(8),
      I1 => Q(6),
      I2 => \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\,
      I3 => Q(7),
      I4 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I5 => p_1_in(7),
      O => \^d\(8)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => wr_data_sm_cs(0),
      I1 => wr_data_sm_cs(1),
      I2 => wr_data_sm_cs(2),
      I3 => s_axi_wvalid,
      O => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[0]_0\
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCCC8C"
    )
        port map (
      I0 => narrow_bram_addr_inc_d1,
      I1 => curr_narrow_burst,
      I2 => \^fsm_sequential_gen_wdata_sm_no_ecc_dual_reg_wready.wr_data_sm_cs_reg[0]_0\,
      I3 => narrow_addr_int(1),
      I4 => narrow_addr_int(0),
      I5 => narrow_addr_int(2),
      O => \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01000000FFFFFFFF"
    )
        port map (
      I0 => wr_data_sm_cs(1),
      I1 => wr_data_sm_cs(0),
      I2 => s_axi_wvalid,
      I3 => wr_data_sm_cs(2),
      I4 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I5 => s_axi_aresetn,
      O => \^sr\(0)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\(1)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAAAAA"
    )
        port map (
      I0 => \save_init_bram_addr_ld_reg[14]_0\,
      I1 => \save_init_bram_addr_ld[14]_i_4_n_0\,
      I2 => wr_data_sm_cs(0),
      I3 => wr_data_sm_cs(1),
      I4 => wr_data_sm_cs(2),
      I5 => s_axi_wvalid,
      O => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4540FFFF45404540"
    )
        port map (
      I0 => \save_init_bram_addr_ld_reg[14]_0\,
      I1 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg\,
      I2 => axi_awaddr_full,
      I3 => s_axi_awaddr(0),
      I4 => Q(0),
      I5 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      O => \^d\(0)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I3 => p_1_in(0),
      O => \^d\(1)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AFF6A00"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      I3 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I4 => p_1_in(1),
      O => \^d\(2)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAFFFF6AAA0000"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      I4 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I5 => p_1_in(2),
      O => \^d\(3)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => Q(4),
      I1 => \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\,
      I2 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I3 => p_1_in(3),
      O => \^d\(4)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AFF6A00"
    )
        port map (
      I0 => Q(5),
      I1 => \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\,
      I2 => Q(4),
      I3 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I4 => p_1_in(4),
      O => \^d\(5)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAFFFF6AAA0000"
    )
        port map (
      I0 => Q(6),
      I1 => Q(4),
      I2 => \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\,
      I3 => Q(5),
      I4 => \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_3_n_0\,
      I5 => p_1_in(5),
      O => \^d\(6)
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      O => \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wrap_burst_total_reg[1]_0\(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awsize(0),
      O => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wrap_burst_total_reg[1]_0\(1),
      I1 => axi_awaddr_full,
      I2 => s_axi_awsize(1),
      O => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]_0\
    );
curr_awlen_reg_1_or_2_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(3),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(3),
      O => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[3]\
    );
curr_fixed_burst_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D8"
    )
        port map (
      I0 => \save_init_bram_addr_ld_reg[14]_0\,
      I1 => curr_fixed_burst_reg,
      I2 => curr_fixed_burst,
      I3 => \^sr\(0),
      O => curr_fixed_burst_reg_reg
    );
curr_wrap_burst_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D8"
    )
        port map (
      I0 => \save_init_bram_addr_ld_reg[14]_0\,
      I1 => curr_wrap_burst_reg,
      I2 => curr_wrap_burst,
      I3 => \^sr\(0),
      O => curr_wrap_burst_reg_reg
    );
\save_init_bram_addr_ld[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(7),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(7),
      O => p_1_in(6)
    );
\save_init_bram_addr_ld[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(8),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(8),
      O => p_1_in(7)
    );
\save_init_bram_addr_ld[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(9),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(9),
      O => \^d\(9)
    );
\save_init_bram_addr_ld[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(10),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(10),
      O => \^d\(10)
    );
\save_init_bram_addr_ld[14]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \save_init_bram_addr_ld_reg[14]_0\,
      O => \^e\(0)
    );
\save_init_bram_addr_ld[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(11),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(11),
      O => \^d\(11)
    );
\save_init_bram_addr_ld[14]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \save_init_bram_addr_ld_reg[14]_0\,
      I1 => \save_init_bram_addr_ld[14]_i_4_n_0\,
      O => \save_init_bram_addr_ld[14]_i_3_n_0\
    );
\save_init_bram_addr_ld[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABBBFFFF"
    )
        port map (
      I0 => \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\,
      I1 => \save_init_bram_addr_ld[14]_i_5__0_n_0\,
      I2 => \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\,
      I3 => \save_init_bram_addr_ld[6]_i_2__0_n_0\,
      I4 => curr_wrap_burst_reg,
      O => \save_init_bram_addr_ld[14]_i_4_n_0\
    );
\save_init_bram_addr_ld[14]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000008F00A000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => wrap_burst_total(1),
      I3 => Q(0),
      I4 => wrap_burst_total(0),
      I5 => wrap_burst_total(2),
      O => \save_init_bram_addr_ld[14]_i_5__0_n_0\
    );
\save_init_bram_addr_ld[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \save_init_bram_addr_ld[4]_i_2__0_n_0\,
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(1),
      O => p_1_in(0)
    );
\save_init_bram_addr_ld[4]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A282"
    )
        port map (
      I0 => data0(1),
      I1 => wrap_burst_total(1),
      I2 => wrap_burst_total(2),
      I3 => wrap_burst_total(0),
      O => \save_init_bram_addr_ld[4]_i_2__0_n_0\
    );
\save_init_bram_addr_ld[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \save_init_bram_addr_ld[5]_i_2__0_n_0\,
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(2),
      O => p_1_in(1)
    );
\save_init_bram_addr_ld[5]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A28A"
    )
        port map (
      I0 => data0(2),
      I1 => wrap_burst_total(0),
      I2 => wrap_burst_total(2),
      I3 => wrap_burst_total(1),
      O => \save_init_bram_addr_ld[5]_i_2__0_n_0\
    );
\save_init_bram_addr_ld[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F202F2F2F202020"
    )
        port map (
      I0 => data0(3),
      I1 => \save_init_bram_addr_ld[6]_i_2__0_n_0\,
      I2 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I3 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg\,
      I4 => axi_awaddr_full,
      I5 => s_axi_awaddr(3),
      O => p_1_in(2)
    );
\save_init_bram_addr_ld[6]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => wrap_burst_total(0),
      I1 => wrap_burst_total(2),
      I2 => wrap_burst_total(1),
      O => \save_init_bram_addr_ld[6]_i_2__0_n_0\
    );
\save_init_bram_addr_ld[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(4),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(4),
      O => p_1_in(3)
    );
\save_init_bram_addr_ld[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(5),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(5),
      O => p_1_in(4)
    );
\save_init_bram_addr_ld[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(6),
      I1 => \save_init_bram_addr_ld[14]_i_3_n_0\,
      I2 => \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg\,
      I3 => axi_awaddr_full,
      I4 => s_axi_awaddr(6),
      O => p_1_in(5)
    );
\save_init_bram_addr_ld_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(6),
      Q => data0(7),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(7),
      Q => data0(8),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => \^d\(9),
      Q => data0(9),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => \^d\(10),
      Q => data0(10),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => \^d\(11),
      Q => data0(11),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(0),
      Q => data0(1),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(1),
      Q => data0(2),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(2),
      Q => data0(3),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(3),
      Q => data0(4),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(4),
      Q => data0(5),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\save_init_bram_addr_ld_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(5),
      Q => data0(6),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\wrap_burst_total[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFF90"
    )
        port map (
      I0 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\,
      I1 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[2]\,
      I2 => \wrap_burst_total[0]_i_4_n_0\,
      I3 => \wrap_burst_total[0]_i_5_n_0\,
      I4 => \wrap_burst_total[0]_i_6_n_0\,
      I5 => \wrap_burst_total_reg[0]_0\,
      O => wrap_burst_total_cmb(0)
    );
\wrap_burst_total[0]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(1),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(1),
      O => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\
    );
\wrap_burst_total[0]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(2),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(2),
      O => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[2]\
    );
\wrap_burst_total[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888000000000000"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awlen(0),
      I3 => s_axi_awvalid,
      I4 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\,
      I5 => \wrap_burst_total[0]_i_8_n_0\,
      O => \wrap_burst_total[0]_i_4_n_0\
    );
\wrap_burst_total[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000088808"
    )
        port map (
      I0 => \wrap_burst_total[2]_i_2__0_n_0\,
      I1 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\,
      I2 => s_axi_awsize(1),
      I3 => axi_awaddr_full,
      I4 => \wrap_burst_total_reg[1]_0\(1),
      I5 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[3]\,
      O => \wrap_burst_total[0]_i_5_n_0\
    );
\wrap_burst_total[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C00000000000800"
    )
        port map (
      I0 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]_0\,
      I1 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[0]\,
      I2 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\,
      I3 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\,
      I4 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[2]\,
      I5 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[3]\,
      O => \wrap_burst_total[0]_i_6_n_0\
    );
\wrap_burst_total[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000AAACCCC0AAA"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => \wrap_burst_total_reg[1]_0\(1),
      I2 => s_axi_awlen(3),
      I3 => s_axi_awvalid,
      I4 => axi_awaddr_full,
      I5 => \wrap_burst_total_reg[2]_0\(3),
      O => \wrap_burst_total[0]_i_8_n_0\
    );
\wrap_burst_total[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(0),
      O => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[0]\
    );
\wrap_burst_total[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \wrap_burst_total[1]_i_2_n_0\,
      I1 => s_axi_awsize(2),
      I2 => axi_awaddr_full,
      I3 => \wrap_burst_total_reg[1]_0\(2),
      O => wrap_burst_total_cmb(1)
    );
\wrap_burst_total[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FFF00008080000"
    )
        port map (
      I0 => \wrap_burst_total[1]_i_3_n_0\,
      I1 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\,
      I2 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[3]\,
      I3 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\,
      I4 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]_0\,
      I5 => \wrap_burst_total[2]_i_2__0_n_0\,
      O => \wrap_burst_total[1]_i_2_n_0\
    );
\wrap_burst_total[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCA0000000A000"
    )
        port map (
      I0 => s_axi_awsize(0),
      I1 => \wrap_burst_total_reg[1]_0\(0),
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(0),
      I4 => axi_awaddr_full,
      I5 => \wrap_burst_total_reg[2]_0\(0),
      O => \wrap_burst_total[1]_i_3_n_0\
    );
\wrap_burst_total[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A80808000000000"
    )
        port map (
      I0 => \wrap_burst_total[2]_i_2__0_n_0\,
      I1 => \wrap_burst_total_reg[2]_0\(3),
      I2 => axi_awaddr_full,
      I3 => s_axi_awvalid,
      I4 => s_axi_awlen(3),
      I5 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]\,
      O => wrap_burst_total_cmb(2)
    );
\wrap_burst_total[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F808000000000000"
    )
        port map (
      I0 => s_axi_awlen(0),
      I1 => s_axi_awvalid,
      I2 => axi_awaddr_full,
      I3 => \wrap_burst_total_reg[2]_0\(0),
      I4 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[2]\,
      I5 => \^gen_aw_pipe_dual.axi_awlen_pipe_reg[1]\,
      O => \wrap_burst_total[2]_i_2__0_n_0\
    );
\wrap_burst_total[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000C0A0A000C0"
    )
        port map (
      I0 => \wrap_burst_total_reg[1]_0\(1),
      I1 => s_axi_awsize(1),
      I2 => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[0]\,
      I3 => s_axi_awsize(2),
      I4 => axi_awaddr_full,
      I5 => \wrap_burst_total_reg[1]_0\(2),
      O => \^gen_aw_pipe_dual.axi_awsize_pipe_reg[1]\
    );
\wrap_burst_total_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => wrap_burst_total_cmb(0),
      Q => wrap_burst_total(0),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\wrap_burst_total_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => wrap_burst_total_cmb(1),
      Q => wrap_burst_total(1),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
\wrap_burst_total_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => wrap_burst_total_cmb(2),
      Q => wrap_burst_total(2),
      R => \wrap_burst_total_reg[0]_1\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1 is
  port (
    bram_addr_ld_en : out STD_LOGIC;
    \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[2]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_reg\ : out STD_LOGIC;
    s_axi_aresetn_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \GEN_NO_RD_CMD_OPT.brst_zero_reg\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_reg\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.brst_zero_reg_0\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1]\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\ : out STD_LOGIC;
    narrow_bram_addr_inc_d1 : in STD_LOGIC;
    curr_narrow_burst : in STD_LOGIC;
    end_brst_rd : in STD_LOGIC;
    axi_b2b_brst : in STD_LOGIC;
    brst_zero : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[0]\ : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    curr_fixed_burst_reg : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]\ : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    axi_araddr_full : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg\ : in STD_LOGIC;
    axi_aresetn_d3 : in STD_LOGIC;
    last_bram_addr : in STD_LOGIC;
    rd_addr_sm_cs : in STD_LOGIC;
    \save_init_bram_addr_ld[14]_i_3__0_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_arlen_pipe_1_or_2 : in STD_LOGIC;
    disable_b2b_brst : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg\ : in STD_LOGIC;
    axi_arsize_pipe_max : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg\ : in STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg\ : in STD_LOGIC;
    curr_wrap_burst_reg : in STD_LOGIC;
    narrow_addr_int : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    ar_active : in STD_LOGIC;
    \save_init_bram_addr_ld_reg[14]_0\ : in STD_LOGIC;
    no_ar_ack : in STD_LOGIC;
    \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[2]\ : in STD_LOGIC;
    axi_rd_burst : in STD_LOGIC;
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \wrap_burst_total_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \wrap_burst_total_reg[1]_0\ : in STD_LOGIC;
    \wrap_burst_total_reg[1]_1\ : in STD_LOGIC;
    \wrap_burst_total_reg[1]_2\ : in STD_LOGIC;
    \wrap_burst_total_reg[2]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1 : entity is "wrap_brst";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1 is
  signal \^d\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_1_or_2_reg\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[0]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[1]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[2]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[3]\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_narrow_en.curr_narrow_burst_reg\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.gen_rd_burst_norl.axi_rd_burst_two_reg\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.axi_rvalid_int_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_9_n_0\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.brst_zero_reg\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.brst_zero_reg_0\ : STD_LOGIC;
  signal bram_addr_ld : STD_LOGIC_VECTOR ( 11 downto 4 );
  signal \^bram_addr_ld_en\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal \^s_axi_aresetn_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_4__0_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_5_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_6_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_7_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[14]_i_8_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[4]_i_2_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[5]_i_2_n_0\ : STD_LOGIC;
  signal \save_init_bram_addr_ld[6]_i_2_n_0\ : STD_LOGIC;
  signal wrap_burst_total : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \wrap_burst_total[0]_i_2_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[1]_i_4_n_0\ : STD_LOGIC;
  signal \wrap_burst_total[2]_i_3__0_n_0\ : STD_LOGIC;
  signal wrap_burst_total_cmb : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_6\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_8\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_9\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \save_init_bram_addr_ld[14]_i_6\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \save_init_bram_addr_ld[5]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \save_init_bram_addr_ld[6]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wrap_burst_total[0]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wrap_burst_total[1]_i_2__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wrap_burst_total[1]_i_3__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wrap_burst_total[1]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wrap_burst_total[2]_i_1__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wrap_burst_total[2]_i_4\ : label is "soft_lutpair6";
begin
  D(11 downto 0) <= \^d\(11 downto 0);
  \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[2]\ <= \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_reg\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_1_or_2_reg\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[0]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[1]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[2]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[3]\;
  \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\ <= \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\;
  \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_reg\ <= \^gen_no_rd_cmd_opt.gen_narrow_en.curr_narrow_burst_reg\;
  \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg\ <= \^gen_no_rd_cmd_opt.gen_rd_burst_norl.axi_rd_burst_two_reg\;
  \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ <= \^gen_no_rd_cmd_opt.axi_rvalid_int_reg\;
  \GEN_NO_RD_CMD_OPT.brst_zero_reg\ <= \^gen_no_rd_cmd_opt.brst_zero_reg\;
  \GEN_NO_RD_CMD_OPT.brst_zero_reg_0\ <= \^gen_no_rd_cmd_opt.brst_zero_reg_0\;
  bram_addr_ld_en <= \^bram_addr_ld_en\;
  s_axi_aresetn_0 <= \^s_axi_aresetn_0\;
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[2]\,
      I1 => axi_rd_burst,
      O => \^gen_no_rd_cmd_opt.gen_rd_burst_norl.axi_rd_burst_two_reg\
    );
\GEN_AWREADY.axi_awready_int_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^s_axi_aresetn_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => brst_zero,
      I1 => end_brst_rd,
      O => \^gen_no_rd_cmd_opt.brst_zero_reg_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF600F6FF060006"
    )
        port map (
      I0 => Q(7),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\,
      I2 => \^bram_addr_ld_en\,
      I3 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I4 => data0(7),
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0\,
      O => \^d\(7)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555755555557FF"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0\,
      I1 => \^gen_no_rd_cmd_opt.gen_narrow_en.curr_narrow_burst_reg\,
      I2 => narrow_bram_addr_inc_d1,
      I3 => curr_narrow_burst,
      I4 => curr_fixed_burst_reg,
      I5 => \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\,
      O => E(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE0EF202"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]\,
      I1 => \^bram_addr_ld_en\,
      I2 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I3 => data0(8),
      I4 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0\,
      O => \^d\(8)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555454545454"
    )
        port map (
      I0 => \^bram_addr_ld_en\,
      I1 => \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0\,
      I3 => \^gen_no_rd_cmd_opt.gen_narrow_en.curr_narrow_burst_reg\,
      I4 => narrow_bram_addr_inc_d1,
      I5 => curr_narrow_burst,
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555FFDFFFFF"
    )
        port map (
      I0 => curr_wrap_burst_reg,
      I1 => wrap_burst_total(1),
      I2 => wrap_burst_total(2),
      I3 => wrap_burst_total(0),
      I4 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]\,
      I5 => \save_init_bram_addr_ld[14]_i_8_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I1 => \^bram_addr_ld_en\,
      O => E(1)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000DDD111D1"
    )
        port map (
      I0 => Q(0),
      I1 => \^bram_addr_ld_en\,
      I2 => s_axi_araddr(0),
      I3 => axi_araddr_full,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg\,
      I5 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      O => \^d\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF600F6FF060006"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => \^bram_addr_ld_en\,
      I3 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I4 => \save_init_bram_addr_ld[4]_i_2_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]\,
      O => \^d\(1)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF600F6FF060006"
    )
        port map (
      I0 => Q(2),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]\,
      I2 => \^bram_addr_ld_en\,
      I3 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I4 => \save_init_bram_addr_ld[5]_i_2_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0\,
      O => \^d\(2)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0E0EFE0E0202F202"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]\,
      I1 => \^bram_addr_ld_en\,
      I2 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I3 => data0(3),
      I4 => \save_init_bram_addr_ld[6]_i_2_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0\,
      O => \^d\(3)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF600F6FF060006"
    )
        port map (
      I0 => Q(4),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]\,
      I2 => \^bram_addr_ld_en\,
      I3 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I4 => data0(4),
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0\,
      O => \^d\(4)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF600F6FF060006"
    )
        port map (
      I0 => Q(5),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]\,
      I2 => \^bram_addr_ld_en\,
      I3 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I4 => data0(5),
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0\,
      O => \^d\(5)
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF600F6FF060006"
    )
        port map (
      I0 => Q(6),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]\,
      I2 => \^bram_addr_ld_en\,
      I3 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I4 => data0(6),
      I5 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0\,
      O => \^d\(6)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => curr_narrow_burst,
      I1 => \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\,
      I2 => narrow_addr_int(2),
      I3 => narrow_addr_int(1),
      I4 => narrow_addr_int(0),
      O => \^gen_no_rd_cmd_opt.gen_narrow_en.curr_narrow_burst_reg\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[0]\,
      I1 => s_axi_rready,
      O => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg\
    );
\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => axi_arlen_pipe_1_or_2,
      I1 => disable_b2b_brst,
      I2 => axi_araddr_full,
      I3 => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg\,
      I4 => axi_arsize_pipe_max,
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_1_or_2_reg\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAFB0000"
    )
        port map (
      I0 => \save_init_bram_addr_ld[14]_i_3__0_0\(2),
      I1 => \save_init_bram_addr_ld[14]_i_3__0_0\(1),
      I2 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_6_n_0\,
      I3 => \^gen_no_rd_cmd_opt.gen_rd_burst_norl.axi_rd_burst_two_reg\,
      I4 => \save_init_bram_addr_ld[14]_i_3__0_0\(0),
      I5 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_7_n_0\,
      O => \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F2FFFFFF"
    )
        port map (
      I0 => end_brst_rd,
      I1 => axi_b2b_brst,
      I2 => brst_zero,
      I3 => s_axi_rready,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[0]\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000D0F0D"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.brst_zero_reg_0\,
      I1 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_8_n_0\,
      I2 => \save_init_bram_addr_ld[14]_i_3__0_0\(0),
      I3 => \save_init_bram_addr_ld[14]_i_3__0_0\(1),
      I4 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_9_n_0\,
      I5 => \save_init_bram_addr_ld[14]_i_3__0_0\(3),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_7_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \save_init_bram_addr_ld[14]_i_3__0_0\(2),
      I1 => s_axi_rready,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[0]\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_8_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \save_init_bram_addr_ld[14]_i_3__0_0\(2),
      I1 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[2]\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_9_n_0\
    );
\save_init_bram_addr_ld[10]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(7),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(7),
      O => bram_addr_ld(10)
    );
\save_init_bram_addr_ld[11]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(8),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(8),
      O => bram_addr_ld(11)
    );
\save_init_bram_addr_ld[12]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(9),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(9),
      O => \^d\(9)
    );
\save_init_bram_addr_ld[13]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(10),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(10),
      O => \^d\(10)
    );
\save_init_bram_addr_ld[14]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"080808AA"
    )
        port map (
      I0 => axi_aresetn_d3,
      I1 => last_bram_addr,
      I2 => \^gen_no_rd_cmd_opt.brst_zero_reg\,
      I3 => rd_addr_sm_cs,
      I4 => \save_init_bram_addr_ld[14]_i_4__0_n_0\,
      O => \^bram_addr_ld_en\
    );
\save_init_bram_addr_ld[14]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(11),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(11),
      O => \^d\(11)
    );
\save_init_bram_addr_ld[14]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22222F22FFFFFFFF"
    )
        port map (
      I0 => brst_zero,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg\,
      I2 => \save_init_bram_addr_ld[14]_i_3__0_0\(0),
      I3 => \save_init_bram_addr_ld[14]_i_3__0_0\(1),
      I4 => \save_init_bram_addr_ld[14]_i_6_n_0\,
      I5 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_1_or_2_reg\,
      O => \^gen_no_rd_cmd_opt.brst_zero_reg\
    );
\save_init_bram_addr_ld[14]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF1"
    )
        port map (
      I0 => axi_araddr_full,
      I1 => s_axi_arvalid,
      I2 => ar_active,
      I3 => \save_init_bram_addr_ld_reg[14]_0\,
      I4 => no_ar_ack,
      O => \save_init_bram_addr_ld[14]_i_4__0_n_0\
    );
\save_init_bram_addr_ld[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000057000000"
    )
        port map (
      I0 => curr_narrow_burst,
      I1 => narrow_bram_addr_inc_d1,
      I2 => \^gen_no_rd_cmd_opt.gen_narrow_en.curr_narrow_burst_reg\,
      I3 => curr_wrap_burst_reg,
      I4 => \save_init_bram_addr_ld[14]_i_7_n_0\,
      I5 => \^fsm_sequential_gen_no_rd_cmd_opt.rd_data_sm_cs_reg[2]\,
      O => \save_init_bram_addr_ld[14]_i_5_n_0\
    );
\save_init_bram_addr_ld[14]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \save_init_bram_addr_ld[14]_i_3__0_0\(3),
      I1 => \save_init_bram_addr_ld[14]_i_3__0_0\(2),
      O => \save_init_bram_addr_ld[14]_i_6_n_0\
    );
\save_init_bram_addr_ld[14]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \save_init_bram_addr_ld[14]_i_8_n_0\,
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      I5 => \save_init_bram_addr_ld[6]_i_2_n_0\,
      O => \save_init_bram_addr_ld[14]_i_7_n_0\
    );
\save_init_bram_addr_ld[14]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4440044000400040"
    )
        port map (
      I0 => wrap_burst_total(2),
      I1 => Q(0),
      I2 => wrap_burst_total(0),
      I3 => wrap_burst_total(1),
      I4 => Q(2),
      I5 => Q(1),
      O => \save_init_bram_addr_ld[14]_i_8_n_0\
    );
\save_init_bram_addr_ld[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \save_init_bram_addr_ld[4]_i_2_n_0\,
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(1),
      O => bram_addr_ld(4)
    );
\save_init_bram_addr_ld[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A282"
    )
        port map (
      I0 => data0(1),
      I1 => wrap_burst_total(1),
      I2 => wrap_burst_total(2),
      I3 => wrap_burst_total(0),
      O => \save_init_bram_addr_ld[4]_i_2_n_0\
    );
\save_init_bram_addr_ld[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \save_init_bram_addr_ld[5]_i_2_n_0\,
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(2),
      O => bram_addr_ld(5)
    );
\save_init_bram_addr_ld[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A28A"
    )
        port map (
      I0 => data0(2),
      I1 => wrap_burst_total(0),
      I2 => wrap_burst_total(2),
      I3 => wrap_burst_total(1),
      O => \save_init_bram_addr_ld[5]_i_2_n_0\
    );
\save_init_bram_addr_ld[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F202F2F2F202020"
    )
        port map (
      I0 => data0(3),
      I1 => \save_init_bram_addr_ld[6]_i_2_n_0\,
      I2 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\,
      I4 => axi_araddr_full,
      I5 => s_axi_araddr(3),
      O => bram_addr_ld(6)
    );
\save_init_bram_addr_ld[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => wrap_burst_total(0),
      I1 => wrap_burst_total(2),
      I2 => wrap_burst_total(1),
      O => \save_init_bram_addr_ld[6]_i_2_n_0\
    );
\save_init_bram_addr_ld[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(4),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(4),
      O => bram_addr_ld(7)
    );
\save_init_bram_addr_ld[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(5),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(5),
      O => bram_addr_ld(8)
    );
\save_init_bram_addr_ld[9]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => data0(6),
      I1 => \save_init_bram_addr_ld[14]_i_5_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\,
      I3 => axi_araddr_full,
      I4 => s_axi_araddr(6),
      O => bram_addr_ld(9)
    );
\save_init_bram_addr_ld_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(10),
      Q => data0(7),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(11),
      Q => data0(8),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => \^d\(9),
      Q => data0(9),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => \^d\(10),
      Q => data0(10),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => \^d\(11),
      Q => data0(11),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(4),
      Q => data0(1),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(5),
      Q => data0(2),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(6),
      Q => data0(3),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(7),
      Q => data0(4),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(8),
      Q => data0(5),
      R => \^s_axi_aresetn_0\
    );
\save_init_bram_addr_ld_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => bram_addr_ld(9),
      Q => data0(6),
      R => \^s_axi_aresetn_0\
    );
\wrap_burst_total[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \wrap_burst_total[0]_i_2_n_0\,
      I1 => s_axi_arsize(1),
      I2 => axi_araddr_full,
      I3 => \wrap_burst_total_reg[0]_0\(1),
      O => wrap_burst_total_cmb(0)
    );
\wrap_burst_total[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2200100098000000"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[2]\,
      I1 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[3]\,
      I2 => \wrap_burst_total_reg[1]_0\,
      I3 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[0]\,
      I4 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[1]\,
      I5 => \wrap_burst_total_reg[1]_1\,
      O => \wrap_burst_total[0]_i_2_n_0\
    );
\wrap_burst_total[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(1),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(1),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[1]\
    );
\wrap_burst_total[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0050008000C00000"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[3]\,
      I1 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[2]\,
      I2 => \wrap_burst_total[1]_i_4_n_0\,
      I3 => \wrap_burst_total_reg[1]_2\,
      I4 => \wrap_burst_total_reg[1]_0\,
      I5 => \wrap_burst_total_reg[1]_1\,
      O => wrap_burst_total_cmb(1)
    );
\wrap_burst_total[1]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(3),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(3),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[3]\
    );
\wrap_burst_total[1]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(2),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(2),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[2]\
    );
\wrap_burst_total[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCA000A0"
    )
        port map (
      I0 => s_axi_arlen(0),
      I1 => \wrap_burst_total_reg[2]_0\(0),
      I2 => s_axi_arlen(1),
      I3 => axi_araddr_full,
      I4 => \wrap_burst_total_reg[2]_0\(1),
      O => \wrap_burst_total[1]_i_4_n_0\
    );
\wrap_burst_total[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20222000"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\,
      I1 => \wrap_burst_total[2]_i_3__0_n_0\,
      I2 => \wrap_burst_total_reg[2]_0\(3),
      I3 => axi_araddr_full,
      I4 => s_axi_arlen(3),
      O => wrap_burst_total_cmb(2)
    );
\wrap_burst_total[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000C0A0A000C0"
    )
        port map (
      I0 => \wrap_burst_total_reg[0]_0\(0),
      I1 => s_axi_arsize(0),
      I2 => \wrap_burst_total_reg[1]_1\,
      I3 => s_axi_arsize(1),
      I4 => axi_araddr_full,
      I5 => \wrap_burst_total_reg[0]_0\(1),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arsize_pipe_reg[1]\
    );
\wrap_burst_total[2]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F553FFFFFFFFFFF"
    )
        port map (
      I0 => s_axi_arlen(2),
      I1 => \wrap_burst_total_reg[2]_0\(2),
      I2 => \wrap_burst_total_reg[2]_0\(1),
      I3 => axi_araddr_full,
      I4 => s_axi_arlen(1),
      I5 => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[0]\,
      O => \wrap_burst_total[2]_i_3__0_n_0\
    );
\wrap_burst_total[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wrap_burst_total_reg[2]_0\(0),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(0),
      O => \^gen_no_rd_cmd_opt.gen_ar_pipe_dual.axi_arlen_pipe_reg[0]\
    );
\wrap_burst_total_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => wrap_burst_total_cmb(0),
      Q => wrap_burst_total(0),
      R => \^s_axi_aresetn_0\
    );
\wrap_burst_total_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => wrap_burst_total_cmb(1),
      Q => wrap_burst_total(1),
      R => \^s_axi_aresetn_0\
    );
\wrap_burst_total_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^bram_addr_ld_en\,
      D => wrap_burst_total_cmb(2),
      Q => wrap_burst_total(2),
      R => \^s_axi_aresetn_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 12;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 12;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 8;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 8;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute ECC_MODE : integer;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 262144;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 4096;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "block";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 8;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 8;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 12;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 12;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 12;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 12;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 8;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 8;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 64;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base is
  signal \<const0>\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_3_n_0\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIADI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIBDI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIPADIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIPBDIP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute \MEM.PORTA.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ : integer;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ : integer;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ : integer;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 7;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ : integer;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ : integer;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ : integer;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 7;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 262144;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 4095;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 7;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 4095;
  attribute ram_offset : integer;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\ : label is 7;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 8;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 15;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 8;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 15;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 8;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 15;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 8;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\ : label is 15;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 16;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 23;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 16;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 23;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 16;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 23;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 16;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\ : label is 23;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 24;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 31;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 24;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 31;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 24;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 31;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 24;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\ : label is 31;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 32;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 39;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 32;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 39;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 32;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 39;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 32;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\ : label is 39;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 40;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 47;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 40;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 47;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 40;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 47;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 40;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\ : label is 47;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 48;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 55;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 48;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 55;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 48;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 55;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 48;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\ : label is 55;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is "p0_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 56;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 63;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is "p0_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 56;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 63;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 262144;
  attribute RTL_RAM_NAME of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is "gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem";
  attribute bram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 0;
  attribute bram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 4095;
  attribute bram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 56;
  attribute bram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 63;
  attribute ram_addr_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 0;
  attribute ram_addr_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 4095;
  attribute ram_offset of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 0;
  attribute ram_slice_begin of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 56;
  attribute ram_slice_end of \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\ : label is 63;
begin
  dbiterra <= \<const0>\;
  dbiterrb <= \<const0>\;
  sbiterra <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(7 downto 0),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(7 downto 0),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(7 downto 0),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(7 downto 0),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(0),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(15 downto 8),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(15 downto 8),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(15 downto 8),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(15 downto 8),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(1),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(23 downto 16),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(23 downto 16),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(23 downto 16),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(23 downto 16),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(2),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(31 downto 24),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(31 downto 24),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(31 downto 24),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(31 downto 24),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(3),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(39 downto 32),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(39 downto 32),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(39 downto 32),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(39 downto 32),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(4),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_4_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(47 downto 40),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(47 downto 40),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(47 downto 40),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(47 downto 40),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(5),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_5_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(55 downto 48),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(55 downto 48),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(55 downto 48),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(55 downto 48),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_i_1_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(6),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_6_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIADI_UNCONNECTED\(31 downto 8),
      DIADI(7 downto 0) => dina(63 downto 56),
      DIBDI(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIBDI_UNCONNECTED\(31 downto 8),
      DIBDI(7 downto 0) => dinb(63 downto 56),
      DIPADIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIPADIP_UNCONNECTED\(3 downto 1),
      DIPADIP(0) => '0',
      DIPBDIP(3 downto 1) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DIPBDIP_UNCONNECTED\(3 downto 1),
      DIPBDIP(0) => '0',
      DOADO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(63 downto 56),
      DOBDO(31 downto 8) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOBDO_UNCONNECTED\(31 downto 8),
      DOBDO(7 downto 0) => doutb(63 downto 56),
      DOPADOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\,
      ENBWREN => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\,
      INJECTDBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => rsta,
      RSTRAMB => rstb,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_SBITERR_UNCONNECTED\,
      WEA(3 downto 1) => B"000",
      WEA(0) => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rsta,
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_1_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rstb,
      I1 => enb,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_2_n_0\
    );
\gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wea(7),
      I1 => ena,
      O => \gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_7_i_3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0\ : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    enb : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_reg_0\ : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_aresetn_d3 : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_aresetn_re_reg : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl is
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[2]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_NORL.axi_arready_int_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0]\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1]\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2]\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_10_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_11_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_12_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_9_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0]\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_6\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_7\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_8\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_9\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_1\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_10\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_11\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_12\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_13\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_14\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_15\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_16\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_9\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1_n_0\ : STD_LOGIC;
  signal \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_10_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_11_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_i_9_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.bram_en_int_reg_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_one_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_one_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_zero_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.end_brst_rd_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.last_bram_addr_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.no_ar_ack_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.no_ar_ack_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_2_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_3_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal act_rd_burst : STD_LOGIC;
  signal act_rd_burst_set : STD_LOGIC;
  signal act_rd_burst_two : STD_LOGIC;
  signal ar_active : STD_LOGIC;
  signal araddr_pipe_ld63_out : STD_LOGIC;
  signal axi_araddr_full : STD_LOGIC;
  signal axi_arburst_pipe : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_arid_pipe : STD_LOGIC;
  signal axi_arlen_pipe : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_arlen_pipe_1_or_2 : STD_LOGIC;
  signal axi_arready_int : STD_LOGIC;
  signal axi_arsize_pipe : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_arsize_pipe_max : STD_LOGIC;
  signal axi_b2b_brst : STD_LOGIC;
  signal axi_early_arready_int : STD_LOGIC;
  signal axi_rd_burst : STD_LOGIC;
  signal axi_rdata_en : STD_LOGIC;
  signal axi_rid_temp : STD_LOGIC;
  signal axi_rid_temp2 : STD_LOGIC;
  signal axi_rid_temp2_full : STD_LOGIC;
  signal axi_rid_temp_full : STD_LOGIC;
  signal axi_rid_temp_full_d1 : STD_LOGIC;
  signal axi_rlast_set : STD_LOGIC;
  signal axi_rvalid_clr_ok : STD_LOGIC;
  signal axi_rvalid_set : STD_LOGIC;
  signal axi_rvalid_set_cmb : STD_LOGIC;
  signal bram_addr_ld : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal bram_addr_ld_en : STD_LOGIC;
  signal bram_addr_ld_en_mod : STD_LOGIC;
  signal brst_cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal brst_cnt_max_d1 : STD_LOGIC;
  signal brst_one : STD_LOGIC;
  signal brst_zero : STD_LOGIC;
  signal curr_fixed_burst : STD_LOGIC;
  signal curr_fixed_burst_reg : STD_LOGIC;
  signal curr_narrow_burst : STD_LOGIC;
  signal curr_wrap_burst : STD_LOGIC;
  signal curr_wrap_burst_reg : STD_LOGIC;
  signal disable_b2b_brst : STD_LOGIC;
  signal disable_b2b_brst_cmb : STD_LOGIC;
  signal \^enb\ : STD_LOGIC;
  signal end_brst_rd : STD_LOGIC;
  signal end_brst_rd_clr : STD_LOGIC;
  signal last_bram_addr : STD_LOGIC;
  signal narrow_addr_int : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal narrow_bram_addr_inc : STD_LOGIC;
  signal narrow_bram_addr_inc_d1 : STD_LOGIC;
  signal narrow_burst_cnt_ld_mod : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal narrow_burst_cnt_ld_reg : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal no_ar_ack : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal p_27_out : STD_LOGIC;
  signal p_61_out : STD_LOGIC;
  signal p_74_out : STD_LOGIC;
  signal p_7_out : STD_LOGIC;
  signal rd_addr_sm_cs : STD_LOGIC;
  signal rd_data_sm_cs : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rd_data_sm_ns : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rd_skid_buf : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal rd_skid_buf_ld : STD_LOGIC;
  signal rd_skid_buf_ld_cmb : STD_LOGIC;
  signal rd_skid_buf_ld_reg : STD_LOGIC;
  signal rddata_mux_sel : STD_LOGIC;
  signal rddata_mux_sel_cmb : STD_LOGIC;
  signal rlast_sm_cs : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^s_axi_rid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_3\ : label is "soft_lutpair21";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg\ : label is "idle:0,ld_araddr:1";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5\ : label is "soft_lutpair27";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[0]\ : label is "sec_addr:0010,sng_addr:0001,last_data_ar_pend:1000,idle:0000,last_addr:0101,last_data:0111,full_throttle:0100,last_throttle:0110,full_pipe:0011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1]\ : label is "sec_addr:0010,sng_addr:0001,last_data_ar_pend:1000,idle:0000,last_addr:0101,last_data:0111,full_throttle:0100,last_throttle:0110,full_pipe:0011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[2]\ : label is "sec_addr:0010,sng_addr:0001,last_data_ar_pend:1000,idle:0000,last_addr:0101,last_data:0111,full_throttle:0100,last_throttle:0110,full_pipe:0011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[3]\ : label is "sec_addr:0010,sng_addr:0001,last_data_ar_pend:1000,idle:0000,last_addr:0101,last_data:0111,full_throttle:0100,last_throttle:0110,full_pipe:0011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[0]\ : label is "idle:000,w8_last_data:100,w8_2nd_last_data:011,w8_throttle:010,w8_throttle_b2:001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[1]\ : label is "idle:000,w8_last_data:100,w8_2nd_last_data:011,w8_throttle:010,w8_throttle_b2:001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[2]\ : label is "idle:000,w8_last_data:100,w8_2nd_last_data:011,w8_throttle:010,w8_throttle_b2:001";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_5\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_2\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_4\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.axi_rvalid_set_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.bram_en_int_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.bram_en_int_i_8\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.bram_en_int_i_9\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_one_i_2\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.brst_zero_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.curr_wrap_burst_reg_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.last_bram_addr_i_3\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.last_bram_addr_i_5\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.last_bram_addr_i_8\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.no_ar_ack_i_2\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.pend_rd_op_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.pend_rd_op_i_5\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \GEN_NO_RD_CMD_OPT.pend_rd_op_i_8\ : label is "soft_lutpair24";
begin
  \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0\ <= \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\;
  \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0\ <= \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\;
  Q(11 downto 0) <= \^q\(11 downto 0);
  SR(0) <= \^sr\(0);
  enb <= \^enb\;
  s_axi_rid(0) <= \^s_axi_rid\(0);
\FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444F000044440000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\,
      I1 => last_bram_addr,
      I2 => rd_addr_sm_cs,
      I3 => axi_araddr_full,
      I4 => s_axi_arvalid,
      I5 => \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_3_n_0\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_2_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => no_ar_ack,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I2 => ar_active,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_3_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_2_n_0\,
      Q => rd_addr_sm_cs,
      R => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_reg_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00033737"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(3),
      I2 => rd_data_sm_cs(1),
      I3 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2_n_0\,
      I4 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0\,
      O => rd_data_sm_ns(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDD0FFFFDDD00000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I1 => bram_addr_ld_en,
      I2 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      I3 => act_rd_burst,
      I4 => rd_data_sm_cs(2),
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_2_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777F000077770000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I1 => rd_data_sm_cs(1),
      I2 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I3 => bram_addr_ld_en,
      I4 => rd_data_sm_cs(0),
      I5 => rd_data_sm_cs(2),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[0]_i_3_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAA0200"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2_n_0\,
      I1 => brst_zero,
      I2 => end_brst_rd,
      I3 => rd_data_sm_cs(2),
      I4 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0\,
      I5 => rd_data_sm_cs(3),
      O => rd_data_sm_ns(1)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C5F0C50FFFFFFFF"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0\,
      I1 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_4_n_0\,
      I2 => rd_data_sm_cs(2),
      I3 => rd_data_sm_cs(1),
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      I5 => rd_data_sm_cs(0),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_2_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBAA"
    )
        port map (
      I0 => rd_data_sm_cs(0),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I2 => rd_data_sm_cs(2),
      I3 => rd_data_sm_cs(1),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000AABA"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_2_n_0\,
      I1 => rd_data_sm_cs(1),
      I2 => rd_data_sm_cs(2),
      I3 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0\,
      I4 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_3_n_0\,
      I5 => rd_data_sm_cs(3),
      O => rd_data_sm_ns(2)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555FF5757"
    )
        port map (
      I0 => rd_data_sm_cs(0),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I2 => axi_rd_burst,
      I3 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_4_n_0\,
      I4 => rd_data_sm_cs(1),
      I5 => rd_data_sm_cs(2),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_2_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001010FFF"
    )
        port map (
      I0 => brst_zero,
      I1 => end_brst_rd,
      I2 => rd_data_sm_cs(1),
      I3 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I4 => rd_data_sm_cs(2),
      I5 => rd_data_sm_cs(0),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_3_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => axi_arsize_pipe_max,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0\,
      I2 => axi_araddr_full,
      I3 => disable_b2b_brst,
      I4 => axi_arlen_pipe_1_or_2,
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_4_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000200020000FFFF"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I1 => rd_data_sm_cs(0),
      I2 => rd_data_sm_cs(2),
      I3 => rd_data_sm_cs(1),
      I4 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3_n_0\,
      I5 => rd_data_sm_cs(3),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C0008000800"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0\,
      I1 => rd_data_sm_cs(2),
      I2 => rd_data_sm_cs(3),
      I3 => rd_data_sm_cs(0),
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I5 => rd_data_sm_cs(1),
      O => rd_data_sm_ns(3)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"052055200500050F"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I1 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0\,
      I2 => rd_data_sm_cs(0),
      I3 => rd_data_sm_cs(2),
      I4 => bram_addr_ld_en,
      I5 => rd_data_sm_cs(1),
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_3_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80808000"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => s_axi_rready,
      I3 => act_rd_burst,
      I4 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_4_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => brst_zero,
      I1 => axi_b2b_brst,
      I2 => end_brst_rd,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0\,
      D => rd_data_sm_ns(0),
      Q => rd_data_sm_cs(0),
      R => \^sr\(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0\,
      D => rd_data_sm_ns(1),
      Q => rd_data_sm_cs(1),
      R => \^sr\(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0\,
      D => rd_data_sm_ns(2),
      Q => rd_data_sm_cs(2),
      R => \^sr\(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_1_n_0\,
      D => rd_data_sm_ns(3),
      Q => rd_data_sm_cs(3),
      R => \^sr\(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F005F004FF00FF04"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_2_n_0\,
      I1 => last_bram_addr,
      I2 => rlast_sm_cs(2),
      I3 => rlast_sm_cs(0),
      I4 => rlast_sm_cs(1),
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010105050505"
    )
        port map (
      I0 => rlast_sm_cs(1),
      I1 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I3 => s_axi_rready,
      I4 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I5 => axi_rd_burst,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_2_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F50004FFFF0004"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2_n_0\,
      I1 => last_bram_addr,
      I2 => rlast_sm_cs(2),
      I3 => rlast_sm_cs(0),
      I4 => rlast_sm_cs(1),
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1515150015155555"
    )
        port map (
      I0 => rlast_sm_cs(1),
      I1 => s_axi_rready,
      I2 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I3 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I5 => axi_rd_burst,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_2_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0F004F0F0F0F4"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      I1 => last_bram_addr,
      I2 => rlast_sm_cs(2),
      I3 => rlast_sm_cs(0),
      I4 => rlast_sm_cs(1),
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      O => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[2]_i_1_n_0\
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[0]_i_1_n_0\,
      Q => rlast_sm_cs(0),
      R => \^sr\(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[1]_i_1_n_0\,
      Q => rlast_sm_cs(1),
      R => \^sr\(0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs[2]_i_1_n_0\,
      Q => rlast_sm_cs(2),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_NORL.axi_arready_int_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAEEE"
    )
        port map (
      I0 => p_1_out,
      I1 => axi_arready_int,
      I2 => axi_araddr_full,
      I3 => s_axi_arvalid,
      I4 => araddr_pipe_ld63_out,
      O => \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_NORL.axi_arready_int_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_NORL.axi_arready_int_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAEA"
    )
        port map (
      I0 => axi_aresetn_re_reg,
      I1 => axi_araddr_full,
      I2 => bram_addr_ld_en,
      I3 => axi_early_arready_int,
      O => p_1_out
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_NORL.axi_arready_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_ARREADY.GEN_ARREADY_NORL.axi_arready_int_i_1_n_0\,
      Q => axi_arready_int,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000101100"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22\,
      I3 => rd_data_sm_cs(1),
      I4 => rd_data_sm_cs(2),
      I5 => \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0\,
      O => p_74_out
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FF3FFFF3F23FFFF"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I2 => rd_data_sm_cs(1),
      I3 => rd_data_sm_cs(0),
      I4 => brst_one,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => axi_araddr_full,
      I1 => s_axi_arvalid,
      I2 => axi_arready_int,
      I3 => rd_data_sm_cs(3),
      O => \GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_ARREADY.axi_early_arready_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_74_out,
      Q => axi_early_arready_int,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBABAAAAAAAA"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3_n_0\,
      I3 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[1]_i_3_n_0\,
      I4 => rd_data_sm_cs(3),
      I5 => ar_active,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000080000A0A8A0A"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I2 => rd_data_sm_cs(1),
      I3 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[3]_i_5_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20\,
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAAAAAAAAAAAAAA"
    )
        port map (
      I0 => rd_data_sm_cs(1),
      I1 => end_brst_rd,
      I2 => brst_zero,
      I3 => rd_data_sm_cs(2),
      I4 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I5 => s_axi_rready,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(3),
      I2 => rd_data_sm_cs(0),
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_1_n_0\,
      Q => ar_active,
      R => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_reg_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(0),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0]\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(10),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(11),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(12),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(13),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(14),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(1),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1]\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(2),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2]\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(3),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(4),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(5),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(6),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(7),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(8),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_araddr(9),
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDF00000"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_2_n_0\,
      I2 => araddr_pipe_ld63_out,
      I3 => axi_araddr_full,
      I4 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\,
      I2 => last_bram_addr,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0\,
      Q => axi_araddr_full,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"03AA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0\,
      I1 => s_axi_arburst(0),
      I2 => s_axi_arburst(1),
      I3 => araddr_pipe_ld63_out,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0\,
      Q => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arburst(0),
      Q => axi_arburst_pipe(0),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arburst(1),
      Q => axi_arburst_pipe(1),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arid_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arid(0),
      Q => axi_arid_pipe,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800AAAA08000800"
    )
        port map (
      I0 => axi_aresetn_d3,
      I1 => s_axi_arvalid,
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\,
      I3 => last_bram_addr,
      I4 => axi_araddr_full,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2_n_0\,
      O => araddr_pipe_ld63_out
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FE00"
    )
        port map (
      I0 => ar_active,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I2 => no_ar_ack,
      I3 => s_axi_arvalid,
      I4 => rd_addr_sm_cs,
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe[7]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_arlen(5),
      I1 => s_axi_arlen(7),
      I2 => s_axi_arlen(3),
      I3 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2_n_0\,
      O => p_21_out
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axi_arlen(6),
      I1 => s_axi_arlen(1),
      I2 => s_axi_arlen(2),
      I3 => s_axi_arlen(4),
      O => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => p_21_out,
      Q => axi_arlen_pipe_1_or_2,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(0),
      Q => axi_arlen_pipe(0),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(1),
      Q => axi_arlen_pipe(1),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(2),
      Q => axi_arlen_pipe(2),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(3),
      Q => axi_arlen_pipe(3),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(4),
      Q => axi_arlen_pipe(4),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(5),
      Q => axi_arlen_pipe(5),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(6),
      Q => axi_arlen_pipe(6),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arlen(7),
      Q => axi_arlen_pipe(7),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arsize(0),
      Q => axi_arsize_pipe(0),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arsize(1),
      Q => axi_arsize_pipe(1),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => araddr_pipe_ld63_out,
      D => s_axi_arsize(2),
      Q => axi_arsize_pipe(2),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0\,
      I2 => end_brst_rd_clr,
      I3 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00202020"
    )
        port map (
      I0 => ar_active,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I2 => brst_zero,
      I3 => curr_narrow_burst,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0\,
      Q => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0\,
      I3 => \^q\(5),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(10),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(8),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0\,
      I4 => \^q\(5),
      I5 => \^q\(7),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(11),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(4),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(5),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(6),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(7),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(3),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(8),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(9),
      O => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_10\,
      Q => \^q\(7),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_9\,
      Q => \^q\(8),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en_mod,
      D => bram_addr_ld(12),
      Q => \^q\(9),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en_mod,
      D => bram_addr_ld(13),
      Q => \^q\(10),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en_mod,
      D => bram_addr_ld(14),
      Q => \^q\(11),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17\,
      Q => \^q\(0),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_16\,
      Q => \^q\(1),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_15\,
      Q => \^q\(2),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_14\,
      Q => \^q\(3),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_13\,
      Q => \^q\(4),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_12\,
      Q => \^q\(5),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      D => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_11\,
      Q => \^q\(6),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => axi_arlen_pipe(7),
      I1 => s_axi_arlen(7),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => axi_arlen_pipe(6),
      I4 => axi_araddr_full,
      I5 => s_axi_arlen(6),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_10_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => axi_arlen_pipe(2),
      I1 => s_axi_arlen(2),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => axi_arlen_pipe(3),
      I4 => axi_araddr_full,
      I5 => s_axi_arlen(3),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_11_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => axi_arlen_pipe(4),
      I1 => s_axi_arlen(4),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => axi_arlen_pipe(5),
      I4 => axi_araddr_full,
      I5 => s_axi_arlen(5),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_12_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFC7FFFFFFFF"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_5_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_6_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27\,
      I5 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_8_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_9_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arburst_pipe(0),
      I1 => axi_araddr_full,
      I2 => s_axi_arburst(0),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000440347"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1]\,
      I1 => axi_araddr_full,
      I2 => s_axi_araddr(1),
      I3 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0]\,
      I4 => s_axi_araddr(0),
      I5 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00EF00EC00E300E0"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_7_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54AAAAA8548888A8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_10_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_8_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FEEE"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_11_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_12_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_9_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0B0F08"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5757575715051000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFC0FFFFCFC08A80"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEB822B8EE882288"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA08A808A808A80"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFFCAF0CA0FCA00C"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFFCAF0CA0FCA00C"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24\,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26\,
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8A8A8080808A808"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => s_axi_arlen(4),
      I4 => axi_araddr_full,
      I5 => axi_arlen_pipe(4),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24\,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23\,
      I2 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I4 => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => axi_arlen_pipe(5),
      I1 => s_axi_arlen(5),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => axi_arlen_pipe(4),
      I4 => axi_araddr_full,
      I5 => s_axi_arlen(4),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => axi_arlen_pipe(3),
      I1 => s_axi_arlen(3),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => axi_arlen_pipe(2),
      I4 => axi_araddr_full,
      I5 => s_axi_arlen(2),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => axi_arlen_pipe(6),
      I1 => s_axi_arlen(6),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => axi_arlen_pipe(7),
      I4 => axi_araddr_full,
      I5 => s_axi_arlen(7),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_1\,
      I1 => curr_narrow_burst,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55D555D555D50000"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2\,
      I5 => narrow_bram_addr_inc_d1,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_5_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arburst_pipe(1),
      I1 => axi_araddr_full,
      I2 => s_axi_arburst(1),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFDDDDDDDF"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\,
      I5 => curr_fixed_burst,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3332"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EFF0EFF0EFF0EE0"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_9\,
      Q => narrow_addr_int(0),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_8\,
      Q => narrow_addr_int(1),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_7\,
      Q => narrow_addr_int(2),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2\,
      O => narrow_bram_addr_inc
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_bram_addr_inc,
      Q => narrow_bram_addr_inc_d1,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001DFFFF001D0000"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => axi_araddr_full,
      I2 => axi_arsize_pipe(2),
      I3 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2_n_0\,
      I4 => bram_addr_ld_en,
      I5 => narrow_burst_cnt_ld_reg(0),
      O => narrow_burst_cnt_ld_mod(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAC000C0"
    )
        port map (
      I0 => axi_arsize_pipe(0),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(1),
      I3 => axi_araddr_full,
      I4 => axi_arsize_pipe(1),
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001DFFFF001D0000"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => axi_araddr_full,
      I2 => axi_arsize_pipe(2),
      I3 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I4 => bram_addr_ld_en,
      I5 => narrow_burst_cnt_ld_reg(1),
      O => narrow_burst_cnt_ld_mod(1)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"082AFFFF082A0000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_6\,
      I1 => axi_araddr_full,
      I2 => axi_arsize_pipe(0),
      I3 => s_axi_arsize(0),
      I4 => bram_addr_ld_en,
      I5 => narrow_burst_cnt_ld_reg(2),
      O => narrow_burst_cnt_ld_mod(2)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_burst_cnt_ld_mod(0),
      Q => narrow_burst_cnt_ld_reg(0),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_burst_cnt_ld_mod(1),
      Q => narrow_burst_cnt_ld_reg(1),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_burst_cnt_ld_mod(2),
      Q => narrow_burst_cnt_ld_reg(2),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA2A002000000000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27\,
      I2 => \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0\,
      I3 => curr_fixed_burst,
      I4 => curr_narrow_burst,
      I5 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF5FFD5FFFFFFDFF"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3_n_0\,
      I1 => rlast_sm_cs(1),
      I2 => rlast_sm_cs(0),
      I3 => rlast_sm_cs(2),
      I4 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I1 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_i_1_n_0\,
      Q => curr_narrow_burst,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(0),
      I1 => D(0),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[0].axi_rdata_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0\,
      Q => s_axi_rdata(0),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(10),
      I1 => D(10),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[10].axi_rdata_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0\,
      Q => s_axi_rdata(10),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(11),
      I1 => D(11),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[11].axi_rdata_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0\,
      Q => s_axi_rdata(11),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(12),
      I1 => D(12),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[12].axi_rdata_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0\,
      Q => s_axi_rdata(12),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(13),
      I1 => D(13),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[13].axi_rdata_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0\,
      Q => s_axi_rdata(13),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(14),
      I1 => D(14),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[14].axi_rdata_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0\,
      Q => s_axi_rdata(14),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(15),
      I1 => D(15),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[15].axi_rdata_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0\,
      Q => s_axi_rdata(15),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(16),
      I1 => D(16),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[16].axi_rdata_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0\,
      Q => s_axi_rdata(16),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(17),
      I1 => D(17),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[17].axi_rdata_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0\,
      Q => s_axi_rdata(17),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(18),
      I1 => D(18),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[18].axi_rdata_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0\,
      Q => s_axi_rdata(18),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(19),
      I1 => D(19),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[19].axi_rdata_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0\,
      Q => s_axi_rdata(19),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(1),
      I1 => D(1),
      I2 => rddata_mux_sel,
      O => p_0_in
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[1].axi_rdata_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => p_0_in,
      Q => s_axi_rdata(1),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(20),
      I1 => D(20),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[20].axi_rdata_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0\,
      Q => s_axi_rdata(20),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(21),
      I1 => D(21),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[21].axi_rdata_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0\,
      Q => s_axi_rdata(21),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(22),
      I1 => D(22),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[22].axi_rdata_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0\,
      Q => s_axi_rdata(22),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(23),
      I1 => D(23),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[23].axi_rdata_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0\,
      Q => s_axi_rdata(23),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(24),
      I1 => D(24),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[24].axi_rdata_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0\,
      Q => s_axi_rdata(24),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(25),
      I1 => D(25),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[25].axi_rdata_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0\,
      Q => s_axi_rdata(25),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(26),
      I1 => D(26),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[26].axi_rdata_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0\,
      Q => s_axi_rdata(26),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(27),
      I1 => D(27),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[27].axi_rdata_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0\,
      Q => s_axi_rdata(27),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(28),
      I1 => D(28),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[28].axi_rdata_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0\,
      Q => s_axi_rdata(28),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(29),
      I1 => D(29),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[29].axi_rdata_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0\,
      Q => s_axi_rdata(29),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(2),
      I1 => D(2),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[2].axi_rdata_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0\,
      Q => s_axi_rdata(2),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(30),
      I1 => D(30),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[30].axi_rdata_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0\,
      Q => s_axi_rdata(30),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(31),
      I1 => D(31),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[31].axi_rdata_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0\,
      Q => s_axi_rdata(31),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(32),
      I1 => D(32),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[32].axi_rdata_int_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0\,
      Q => s_axi_rdata(32),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(33),
      I1 => D(33),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[33].axi_rdata_int_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0\,
      Q => s_axi_rdata(33),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(34),
      I1 => D(34),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[34].axi_rdata_int_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0\,
      Q => s_axi_rdata(34),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(35),
      I1 => D(35),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[35].axi_rdata_int_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0\,
      Q => s_axi_rdata(35),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(36),
      I1 => D(36),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[36].axi_rdata_int_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0\,
      Q => s_axi_rdata(36),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(37),
      I1 => D(37),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[37].axi_rdata_int_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0\,
      Q => s_axi_rdata(37),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(38),
      I1 => D(38),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[38].axi_rdata_int_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0\,
      Q => s_axi_rdata(38),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(39),
      I1 => D(39),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[39].axi_rdata_int_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0\,
      Q => s_axi_rdata(39),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(3),
      I1 => D(3),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[3].axi_rdata_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0\,
      Q => s_axi_rdata(3),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(40),
      I1 => D(40),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[40].axi_rdata_int_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0\,
      Q => s_axi_rdata(40),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(41),
      I1 => D(41),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[41].axi_rdata_int_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0\,
      Q => s_axi_rdata(41),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(42),
      I1 => D(42),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[42].axi_rdata_int_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0\,
      Q => s_axi_rdata(42),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(43),
      I1 => D(43),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[43].axi_rdata_int_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0\,
      Q => s_axi_rdata(43),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(44),
      I1 => D(44),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[44].axi_rdata_int_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0\,
      Q => s_axi_rdata(44),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(45),
      I1 => D(45),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[45].axi_rdata_int_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0\,
      Q => s_axi_rdata(45),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(46),
      I1 => D(46),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[46].axi_rdata_int_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0\,
      Q => s_axi_rdata(46),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(47),
      I1 => D(47),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[47].axi_rdata_int_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0\,
      Q => s_axi_rdata(47),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(48),
      I1 => D(48),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[48].axi_rdata_int_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0\,
      Q => s_axi_rdata(48),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(49),
      I1 => D(49),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[49].axi_rdata_int_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0\,
      Q => s_axi_rdata(49),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(4),
      I1 => D(4),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[4].axi_rdata_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0\,
      Q => s_axi_rdata(4),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(50),
      I1 => D(50),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[50].axi_rdata_int_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0\,
      Q => s_axi_rdata(50),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(51),
      I1 => D(51),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[51].axi_rdata_int_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0\,
      Q => s_axi_rdata(51),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(52),
      I1 => D(52),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[52].axi_rdata_int_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0\,
      Q => s_axi_rdata(52),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(53),
      I1 => D(53),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[53].axi_rdata_int_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0\,
      Q => s_axi_rdata(53),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(54),
      I1 => D(54),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[54].axi_rdata_int_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0\,
      Q => s_axi_rdata(54),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(55),
      I1 => D(55),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[55].axi_rdata_int_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0\,
      Q => s_axi_rdata(55),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(56),
      I1 => D(56),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[56].axi_rdata_int_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0\,
      Q => s_axi_rdata(56),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(57),
      I1 => D(57),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[57].axi_rdata_int_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0\,
      Q => s_axi_rdata(57),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(58),
      I1 => D(58),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[58].axi_rdata_int_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0\,
      Q => s_axi_rdata(58),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(59),
      I1 => D(59),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[59].axi_rdata_int_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0\,
      Q => s_axi_rdata(59),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(5),
      I1 => D(5),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[5].axi_rdata_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0\,
      Q => s_axi_rdata(5),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(60),
      I1 => D(60),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[60].axi_rdata_int_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0\,
      Q => s_axi_rdata(60),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(61),
      I1 => D(61),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[61].axi_rdata_int_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0\,
      Q => s_axi_rdata(61),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(62),
      I1 => D(62),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[62].axi_rdata_int_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0\,
      Q => s_axi_rdata(62),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I2 => axi_b2b_brst,
      I3 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1100222033112200"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(3),
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_4_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I4 => rd_data_sm_cs(1),
      I5 => rd_data_sm_cs(0),
      O => axi_rdata_en
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(63),
      I1 => D(63),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => act_rd_burst,
      I1 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3_n_0\,
      Q => s_axi_rdata(63),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(6),
      I1 => D(6),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[6].axi_rdata_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0\,
      Q => s_axi_rdata(6),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(7),
      I1 => D(7),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[7].axi_rdata_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0\,
      Q => s_axi_rdata(7),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(8),
      I1 => D(8),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[8].axi_rdata_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0\,
      Q => s_axi_rdata(8),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rd_skid_buf(9),
      I1 => D(9),
      I2 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[9].axi_rdata_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_rdata_en,
      D => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0\,
      Q => s_axi_rdata(9),
      R => \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.GEN_RDATA_NO_RL_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf[63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAAAAAAA"
    )
        port map (
      I0 => rd_skid_buf_ld_reg,
      I1 => rd_data_sm_cs(1),
      I2 => rd_data_sm_cs(3),
      I3 => rd_data_sm_cs(0),
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I5 => rd_data_sm_cs(2),
      O => rd_skid_buf_ld
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(0),
      Q => rd_skid_buf(0),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(10),
      Q => rd_skid_buf(10),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(11),
      Q => rd_skid_buf(11),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(12),
      Q => rd_skid_buf(12),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(13),
      Q => rd_skid_buf(13),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(14),
      Q => rd_skid_buf(14),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(15),
      Q => rd_skid_buf(15),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(16),
      Q => rd_skid_buf(16),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(17),
      Q => rd_skid_buf(17),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(18),
      Q => rd_skid_buf(18),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(19),
      Q => rd_skid_buf(19),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(1),
      Q => rd_skid_buf(1),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(20),
      Q => rd_skid_buf(20),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(21),
      Q => rd_skid_buf(21),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(22),
      Q => rd_skid_buf(22),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(23),
      Q => rd_skid_buf(23),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(24),
      Q => rd_skid_buf(24),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(25),
      Q => rd_skid_buf(25),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(26),
      Q => rd_skid_buf(26),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(27),
      Q => rd_skid_buf(27),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(28),
      Q => rd_skid_buf(28),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(29),
      Q => rd_skid_buf(29),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(2),
      Q => rd_skid_buf(2),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(30),
      Q => rd_skid_buf(30),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(31),
      Q => rd_skid_buf(31),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(32),
      Q => rd_skid_buf(32),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(33),
      Q => rd_skid_buf(33),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(34),
      Q => rd_skid_buf(34),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(35),
      Q => rd_skid_buf(35),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(36),
      Q => rd_skid_buf(36),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(37),
      Q => rd_skid_buf(37),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(38),
      Q => rd_skid_buf(38),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(39),
      Q => rd_skid_buf(39),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(3),
      Q => rd_skid_buf(3),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(40),
      Q => rd_skid_buf(40),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(41),
      Q => rd_skid_buf(41),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(42),
      Q => rd_skid_buf(42),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(43),
      Q => rd_skid_buf(43),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(44),
      Q => rd_skid_buf(44),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(45),
      Q => rd_skid_buf(45),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(46),
      Q => rd_skid_buf(46),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(47),
      Q => rd_skid_buf(47),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(48),
      Q => rd_skid_buf(48),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(49),
      Q => rd_skid_buf(49),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(4),
      Q => rd_skid_buf(4),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(50),
      Q => rd_skid_buf(50),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(51),
      Q => rd_skid_buf(51),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(52),
      Q => rd_skid_buf(52),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(53),
      Q => rd_skid_buf(53),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(54),
      Q => rd_skid_buf(54),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(55),
      Q => rd_skid_buf(55),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(56),
      Q => rd_skid_buf(56),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(57),
      Q => rd_skid_buf(57),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(58),
      Q => rd_skid_buf(58),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(59),
      Q => rd_skid_buf(59),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(5),
      Q => rd_skid_buf(5),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(60),
      Q => rd_skid_buf(60),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(61),
      Q => rd_skid_buf(61),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(62),
      Q => rd_skid_buf(62),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(63),
      Q => rd_skid_buf(63),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(6),
      Q => rd_skid_buf(6),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(7),
      Q => rd_skid_buf(7),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(8),
      Q => rd_skid_buf(8),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rd_skid_buf_ld,
      D => D(9),
      Q => rd_skid_buf(9),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0C000A0"
    )
        port map (
      I0 => axi_rd_burst,
      I1 => p_61_out,
      I2 => s_axi_aresetn,
      I3 => brst_zero,
      I4 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26\,
      I3 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\,
      I4 => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_5_n_0\,
      O => p_61_out
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arlen_pipe(4),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(4),
      O => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arlen_pipe(5),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(5),
      O => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => s_axi_arlen(3),
      I1 => axi_arlen_pipe(3),
      I2 => s_axi_arlen(2),
      I3 => axi_araddr_full,
      I4 => axi_arlen_pipe(2),
      O => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_i_1_n_0\,
      Q => axi_rd_burst,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0C000A0"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I1 => act_rd_burst_two,
      I2 => s_axi_aresetn,
      I3 => brst_zero,
      I4 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => s_axi_arlen(0),
      I1 => axi_araddr_full,
      I2 => axi_arlen_pipe(0),
      I3 => p_61_out,
      O => act_rd_burst_two
    );
\GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_i_1_n_0\,
      Q => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E200F0000000"
    )
        port map (
      I0 => \^s_axi_rid\(0),
      I1 => axi_rvalid_set,
      I2 => axi_rid_temp,
      I3 => s_axi_aresetn,
      I4 => axi_b2b_brst,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_1_n_0\,
      Q => \^s_axi_rid\(0),
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFFFFFB8000000"
    )
        port map (
      I0 => axi_arid_pipe,
      I1 => axi_araddr_full,
      I2 => s_axi_arid(0),
      I3 => axi_rid_temp_full,
      I4 => bram_addr_ld_en,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0]\,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3311F00000000000"
    )
        port map (
      I0 => axi_rid_temp_full_d1,
      I1 => p_7_out,
      I2 => bram_addr_ld_en,
      I3 => axi_rid_temp_full,
      I4 => axi_rid_temp2_full,
      I5 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => axi_rvalid_set,
      I1 => s_axi_rready,
      I2 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I3 => axi_b2b_brst,
      O => p_7_out
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_full_i_1_n_0\,
      Q => axi_rid_temp2_full,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2[0]_i_1_n_0\,
      Q => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAACFCFC0AAC0C0"
    )
        port map (
      I0 => axi_rid_temp2,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp2_reg_n_0_[0]\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3_n_0\,
      I3 => axi_rid_temp_full,
      I4 => bram_addr_ld_en,
      I5 => axi_rid_temp,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arid_pipe,
      I1 => axi_araddr_full,
      I2 => s_axi_arid(0),
      O => axi_rid_temp2
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A88AAAA8A888A88"
    )
        port map (
      I0 => axi_rid_temp2_full,
      I1 => axi_rvalid_set,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_int[0]_i_2_n_0\,
      I3 => axi_b2b_brst,
      I4 => axi_rid_temp_full,
      I5 => axi_rid_temp_full_d1,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_rid_temp_full,
      Q => axi_rid_temp_full_d1,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBFFA800000000"
    )
        port map (
      I0 => axi_rid_temp2_full,
      I1 => p_7_out,
      I2 => axi_rid_temp_full_d1,
      I3 => bram_addr_ld_en,
      I4 => axi_rid_temp_full,
      I5 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_full_i_1_n_0\,
      Q => axi_rid_temp_full,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_RID.axi_rid_temp[0]_i_1_n_0\,
      Q => axi_rid_temp,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow_0
     port map (
      D(2 downto 0) => narrow_burst_cnt_ld_mod(2 downto 0),
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0]\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_1\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1]\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_5\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2]\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0]\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_0\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1]\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_7\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_8\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_9\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_7_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[0]_3\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_0\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_1\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_2\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[1]_3\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_1\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\ => \GEN_NO_RD_CMD_OPT.GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\,
      Q(2 downto 0) => axi_arsize_pipe(2 downto 0),
      axi_araddr_full => axi_araddr_full,
      curr_narrow_burst => curr_narrow_burst,
      narrow_addr_int(2 downto 0) => narrow_addr_int(2 downto 0),
      s_axi_araddr(2 downto 0) => s_axi_araddr(2 downto 0),
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arsize_0_sp_1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      s_axi_arsize_2_sp_1 => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_6\,
      ua_narrow_load1_carry_i_1_0 => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2]\
    );
\GEN_NO_RD_CMD_OPT.I_WRAP_BRST\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_1
     port map (
      D(11 downto 9) => bram_addr_ld(14 downto 12),
      D(8) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_9\,
      D(7) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_10\,
      D(6) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_11\,
      D(5) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_12\,
      D(4) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_13\,
      D(3) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_14\,
      D(2) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_15\,
      D(1) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_16\,
      D(0) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_17\,
      E(1) => bram_addr_ld_en_mod,
      E(0) => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_5\,
      \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs_reg[2]\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_1\,
      \FSM_sequential_GEN_NO_RD_CMD_OPT.rlast_sm_cs_reg[2]\ => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_reg\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0]\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_25\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1]\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_26\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2]\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3]\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24\,
      \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1]\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_27\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]_0\ => \GEN_NO_RD_CMD_OPT.GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0\,
      \GEN_NO_RD_CMD_OPT.GEN_NARROW_EN.curr_narrow_burst_reg\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_2\,
      \GEN_NO_RD_CMD_OPT.GEN_RDATA_NO_ECC.rd_skid_buf_reg[0]\ => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      \GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg\ => \GEN_NO_RD_CMD_OPT.GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0\,
      \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      \GEN_NO_RD_CMD_OPT.brst_zero_reg\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\,
      \GEN_NO_RD_CMD_OPT.brst_zero_reg_0\ => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22\,
      Q(7 downto 0) => \^q\(7 downto 0),
      ar_active => ar_active,
      axi_araddr_full => axi_araddr_full,
      axi_aresetn_d3 => axi_aresetn_d3,
      axi_arlen_pipe_1_or_2 => axi_arlen_pipe_1_or_2,
      axi_arsize_pipe_max => axi_arsize_pipe_max,
      axi_b2b_brst => axi_b2b_brst,
      axi_rd_burst => axi_rd_burst,
      bram_addr_ld_en => bram_addr_ld_en,
      brst_zero => brst_zero,
      curr_fixed_burst_reg => curr_fixed_burst_reg,
      curr_narrow_burst => curr_narrow_burst,
      curr_wrap_burst_reg => curr_wrap_burst_reg,
      disable_b2b_brst => disable_b2b_brst,
      end_brst_rd => end_brst_rd,
      last_bram_addr => last_bram_addr,
      narrow_addr_int(2 downto 0) => narrow_addr_int(2 downto 0),
      narrow_bram_addr_inc_d1 => narrow_bram_addr_inc_d1,
      no_ar_ack => no_ar_ack,
      rd_addr_sm_cs => rd_addr_sm_cs,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(11 downto 0) => s_axi_araddr(14 downto 3),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aresetn_0 => \^sr\(0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arsize(1 downto 0) => s_axi_arsize(2 downto 1),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_rready => s_axi_rready,
      \save_init_bram_addr_ld[14]_i_3__0_0\(3 downto 0) => rd_data_sm_cs(3 downto 0),
      \save_init_bram_addr_ld_reg[14]_0\ => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      \wrap_burst_total_reg[0]_0\(1 downto 0) => axi_arsize_pipe(2 downto 1),
      \wrap_burst_total_reg[1]_0\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_2\,
      \wrap_burst_total_reg[1]_1\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_4\,
      \wrap_burst_total_reg[1]_2\ => \GEN_NO_RD_CMD_OPT.GEN_UA_NARROW.I_UA_NARROW_n_3\,
      \wrap_burst_total_reg[2]_0\(3 downto 0) => axi_arlen_pipe(3 downto 0)
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000022E2EEE2"
    )
        port map (
      I0 => act_rd_burst,
      I1 => act_rd_burst_set,
      I2 => axi_rd_burst,
      I3 => bram_addr_ld_en,
      I4 => act_rd_burst_two,
      I5 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_3_n_0\,
      O => \GEN_NO_RD_CMD_OPT.act_rd_burst_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.act_rd_burst_i_1_n_0\,
      Q => act_rd_burst,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      I1 => act_rd_burst_set,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I3 => bram_addr_ld_en,
      I4 => act_rd_burst_two,
      I5 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_3_n_0\,
      O => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0C0E0200000E020"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0\,
      I1 => rd_data_sm_cs(0),
      I2 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_4_n_0\,
      I3 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      I4 => rd_data_sm_cs(1),
      I5 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_5_n_0\,
      O => act_rd_burst_set
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02000004FFFFFFFF"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(3),
      I2 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6_n_0\,
      I3 => rd_data_sm_cs(1),
      I4 => rd_data_sm_cs(0),
      I5 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_data_sm_cs(3),
      I1 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F200000000000000"
    )
        port map (
      I0 => end_brst_rd,
      I1 => axi_b2b_brst,
      I2 => brst_zero,
      I3 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I4 => s_axi_rready,
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20\,
      O => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FFF"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      I1 => act_rd_burst,
      I2 => s_axi_rready,
      I3 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      O => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_1_n_0\,
      Q => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_reg_n_0\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FF0800"
    )
        port map (
      I0 => s_axi_arsize(0),
      I1 => s_axi_arsize(1),
      I2 => s_axi_arsize(2),
      I3 => araddr_pipe_ld63_out,
      I4 => axi_arsize_pipe_max,
      O => \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.axi_arsize_pipe_max_i_1_n_0\,
      Q => axi_arsize_pipe_max,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202020200FF00"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_20\,
      I1 => rd_data_sm_cs(2),
      I2 => rd_data_sm_cs(3),
      I3 => axi_b2b_brst,
      I4 => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_3_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_4_n_0\,
      O => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(0),
      I2 => rd_data_sm_cs(3),
      I3 => rd_data_sm_cs(1),
      O => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A88000000000000"
    )
        port map (
      I0 => \FSM_sequential_GEN_NO_RD_CMD_OPT.rd_data_sm_cs[2]_i_4_n_0\,
      I1 => brst_zero,
      I2 => axi_b2b_brst,
      I3 => end_brst_rd,
      I4 => \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_i_4_n_0\,
      I5 => rd_data_sm_cs(1),
      O => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_b2b_brst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.axi_b2b_brst_i_1_n_0\,
      Q => axi_b2b_brst,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBF00000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0\,
      I1 => s_axi_rready,
      I2 => axi_rlast_set,
      I3 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I4 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => rlast_sm_cs(0),
      I3 => rlast_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rlast_int_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088000000880F00"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I1 => s_axi_rready,
      I2 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I3 => rlast_sm_cs(2),
      I4 => rlast_sm_cs(0),
      I5 => rlast_sm_cs(1),
      O => axi_rlast_set
    );
\GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.axi_rlast_int_i_1_n_0\,
      Q => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFAC0000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_18\,
      I1 => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2_n_0\,
      I2 => bram_addr_ld_en,
      I3 => axi_rvalid_clr_ok,
      I4 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F888F888F888888"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_4_n_0\,
      I2 => axi_rvalid_clr_ok,
      I3 => last_bram_addr,
      I4 => disable_b2b_brst,
      I5 => \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_data_sm_cs(1),
      I1 => rd_data_sm_cs(3),
      O => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rd_data_sm_cs(0),
      I1 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.axi_rvalid_clr_ok_i_1_n_0\,
      Q => axi_rvalid_clr_ok,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7F0000000000"
    )
        port map (
      I0 => axi_rvalid_clr_ok,
      I1 => s_axi_rready,
      I2 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I3 => axi_rvalid_set,
      I4 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I5 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.axi_rvalid_int_i_1_n_0\,
      Q => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_set_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(0),
      I2 => rd_data_sm_cs(3),
      I3 => rd_data_sm_cs(1),
      O => axi_rvalid_set_cmb
    );
\GEN_NO_RD_CMD_OPT.axi_rvalid_set_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_rvalid_set_cmb,
      Q => axi_rvalid_set,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF8F0000008F"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22\,
      I1 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_2_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.bram_en_int_reg_i_3_n_0\,
      I3 => rd_data_sm_cs(3),
      I4 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_4_n_0\,
      I5 => \^enb\,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0CFFCCAAAAAAAA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I1 => end_brst_rd,
      I2 => axi_b2b_brst,
      I3 => brst_zero,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I5 => rd_data_sm_cs(0),
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_10_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAABAAAA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_5_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I2 => brst_zero,
      I3 => end_brst_rd,
      I4 => brst_one,
      I5 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_11_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => rd_data_sm_cs(0),
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => s_axi_rready,
      I3 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA2AAAA8AA28AA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_7_n_0\,
      I1 => rd_data_sm_cs(1),
      I2 => rd_data_sm_cs(0),
      I3 => rd_data_sm_cs(2),
      I4 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_9_n_0\,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55FF0355"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I2 => axi_rd_burst,
      I3 => rd_data_sm_cs(0),
      I4 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"007FFFFF007F0000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => s_axi_rready,
      I3 => bram_addr_ld_en,
      I4 => rd_data_sm_cs(2),
      I5 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_10_n_0\,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFF003BBBB0003"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6_n_0\,
      I1 => bram_addr_ld_en,
      I2 => rd_data_sm_cs(1),
      I3 => rd_data_sm_cs(0),
      I4 => rd_data_sm_cs(2),
      I5 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_11_n_0\,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_7_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"007F"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => s_axi_rready,
      I3 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_8_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0111"
    )
        port map (
      I0 => end_brst_rd,
      I1 => brst_zero,
      I2 => s_axi_rready,
      I3 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_i_9_n_0\
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.bram_en_int_i_1_n_0\,
      Q => \^enb\,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.bram_en_int_reg_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_5_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.bram_en_int_i_6_n_0\,
      O => \GEN_NO_RD_CMD_OPT.bram_en_int_reg_i_3_n_0\,
      S => rd_data_sm_cs(1)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B800B8FF"
    )
        port map (
      I0 => axi_arlen_pipe(0),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(0),
      I3 => bram_addr_ld_en,
      I4 => brst_cnt(0),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB800B800B8FF"
    )
        port map (
      I0 => axi_arlen_pipe(1),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(1),
      I3 => bram_addr_ld_en,
      I4 => brst_cnt(1),
      I5 => brst_cnt(0),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B88B"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_23\,
      I1 => bram_addr_ld_en,
      I2 => brst_cnt(2),
      I3 => brst_cnt(0),
      I4 => brst_cnt(1),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B88B"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_24\,
      I1 => bram_addr_ld_en,
      I2 => brst_cnt(3),
      I3 => brst_cnt(2),
      I4 => brst_cnt(1),
      I5 => brst_cnt(0),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B800B8FFB8FFB800"
    )
        port map (
      I0 => axi_arlen_pipe(4),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(4),
      I3 => bram_addr_ld_en,
      I4 => brst_cnt(4),
      I5 => \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => brst_cnt(2),
      I1 => brst_cnt(3),
      I2 => brst_cnt(0),
      I3 => brst_cnt(1),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B800B8FFB8FFB800"
    )
        port map (
      I0 => axi_arlen_pipe(5),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(5),
      I3 => bram_addr_ld_en,
      I4 => brst_cnt(5),
      I5 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5_n_0\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B88BB8B8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\,
      I1 => bram_addr_ld_en,
      I2 => brst_cnt(6),
      I3 => brst_cnt(5),
      I4 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5_n_0\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arlen_pipe(6),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(6),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_1\,
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B88BB8"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\,
      I1 => bram_addr_ld_en,
      I2 => brst_cnt(7),
      I3 => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5_n_0\,
      I4 => brst_cnt(6),
      I5 => brst_cnt(5),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_arlen_pipe(7),
      I1 => axi_araddr_full,
      I2 => s_axi_arlen(7),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => brst_cnt(1),
      I1 => brst_cnt(0),
      I2 => brst_cnt(3),
      I3 => brst_cnt(2),
      I4 => brst_cnt(4),
      O => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_max_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0\,
      Q => brst_cnt_max_d1,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[0]_i_1_n_0\,
      Q => brst_cnt(0),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[1]_i_1_n_0\,
      Q => brst_cnt(1),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[2]_i_1_n_0\,
      Q => brst_cnt(2),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[3]_i_1_n_0\,
      Q => brst_cnt(3),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[4]_i_1_n_0\,
      Q => brst_cnt(4),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[5]_i_1_n_0\,
      Q => brst_cnt(5),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[6]_i_1_n_0\,
      Q => brst_cnt(6),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_1_n_0\,
      D => \GEN_NO_RD_CMD_OPT.brst_cnt[7]_i_2_n_0\,
      Q => brst_cnt(7),
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.brst_one_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000A0AAA088"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => brst_one,
      I2 => act_rd_burst_two,
      I3 => bram_addr_ld_en,
      I4 => \GEN_NO_RD_CMD_OPT.brst_one_i_2_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.brst_one_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_one_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0\,
      I1 => brst_cnt(1),
      I2 => brst_cnt(0),
      O => \GEN_NO_RD_CMD_OPT.brst_one_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_one_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.brst_one_i_1_n_0\,
      Q => brst_one,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.brst_zero_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5400"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0\,
      I2 => brst_zero,
      I3 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.brst_zero_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_zero_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8AAA888"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => p_61_out,
      I2 => axi_arlen_pipe(0),
      I3 => axi_araddr_full,
      I4 => s_axi_arlen(0),
      O => \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.brst_zero_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.brst_zero_i_1_n_0\,
      Q => brst_zero,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => s_axi_arburst(0),
      I1 => axi_arburst_pipe(0),
      I2 => s_axi_arburst(1),
      I3 => axi_araddr_full,
      I4 => axi_arburst_pipe(1),
      O => curr_fixed_burst
    );
\GEN_NO_RD_CMD_OPT.curr_fixed_burst_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en,
      D => curr_fixed_burst,
      Q => curr_fixed_burst_reg,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.curr_wrap_burst_reg_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000ACC0A"
    )
        port map (
      I0 => s_axi_arburst(1),
      I1 => axi_arburst_pipe(1),
      I2 => s_axi_arburst(0),
      I3 => axi_araddr_full,
      I4 => axi_arburst_pipe(0),
      O => curr_wrap_burst
    );
\GEN_NO_RD_CMD_OPT.curr_wrap_burst_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en,
      D => curr_wrap_burst,
      Q => curr_wrap_burst_reg,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABAAAAABABABABA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0\,
      I1 => rd_data_sm_cs(3),
      I2 => disable_b2b_brst,
      I3 => rd_data_sm_cs(1),
      I4 => rd_data_sm_cs(2),
      I5 => rd_data_sm_cs(0),
      O => disable_b2b_brst_cmb
    );
\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BFBBBFBF"
    )
        port map (
      I0 => disable_b2b_brst,
      I1 => rd_data_sm_cs(1),
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I3 => brst_one,
      I4 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_22\,
      I5 => \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3_n_0\,
      O => \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFDFDFDFDFFFDFD"
    )
        port map (
      I0 => rd_data_sm_cs(0),
      I1 => rd_data_sm_cs(3),
      I2 => rd_data_sm_cs(2),
      I3 => rd_data_sm_cs(1),
      I4 => axi_rd_burst,
      I5 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      O => \GEN_NO_RD_CMD_OPT.disable_b2b_brst_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.disable_b2b_brst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => disable_b2b_brst_cmb,
      Q => disable_b2b_brst,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEFFEF11000000"
    )
        port map (
      I0 => rd_data_sm_cs(3),
      I1 => rd_data_sm_cs(1),
      I2 => bram_addr_ld_en,
      I3 => rd_data_sm_cs(2),
      I4 => rd_data_sm_cs(0),
      I5 => end_brst_rd_clr,
      O => \GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.end_brst_rd_clr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.end_brst_rd_clr_i_1_n_0\,
      Q => end_brst_rd_clr,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.end_brst_rd_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55300000"
    )
        port map (
      I0 => end_brst_rd_clr,
      I1 => brst_cnt_max_d1,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0\,
      I3 => end_brst_rd,
      I4 => s_axi_aresetn,
      O => \GEN_NO_RD_CMD_OPT.end_brst_rd_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.end_brst_rd_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.end_brst_rd_i_1_n_0\,
      Q => end_brst_rd,
      R => '0'
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEAAAAAAAAAAA"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0\,
      I2 => rd_data_sm_cs(3),
      I3 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I4 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_4_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0\,
      O => p_27_out
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0\,
      I1 => brst_cnt(0),
      I2 => brst_cnt(1),
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => axi_rd_burst,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAA0008"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I2 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I3 => axi_rd_burst,
      I4 => bram_addr_ld_en,
      I5 => \GEN_NO_RD_CMD_OPT.brst_zero_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"81"
    )
        port map (
      I0 => rd_data_sm_cs(1),
      I1 => rd_data_sm_cs(0),
      I2 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_1\,
      I1 => brst_cnt(2),
      I2 => brst_cnt(3),
      I3 => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_8_n_0\,
      I4 => brst_cnt(7),
      I5 => brst_cnt(4),
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C000FF00800000"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I1 => s_axi_rready,
      I2 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I3 => rd_data_sm_cs(3),
      I4 => rd_data_sm_cs(2),
      I5 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_7_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => brst_cnt(6),
      I1 => brst_cnt(5),
      O => \GEN_NO_RD_CMD_OPT.last_bram_addr_i_8_n_0\
    );
\GEN_NO_RD_CMD_OPT.last_bram_addr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_27_out,
      Q => last_bram_addr,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.no_ar_ack_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCC050C0C0"
    )
        port map (
      I0 => rd_data_sm_cs(3),
      I1 => no_ar_ack,
      I2 => rd_data_sm_cs(1),
      I3 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I4 => bram_addr_ld_en,
      I5 => \GEN_NO_RD_CMD_OPT.no_ar_ack_i_2_n_0\,
      O => \GEN_NO_RD_CMD_OPT.no_ar_ack_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.no_ar_ack_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => rd_data_sm_cs(2),
      I1 => rd_data_sm_cs(3),
      I2 => rd_data_sm_cs(0),
      O => \GEN_NO_RD_CMD_OPT.no_ar_ack_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.no_ar_ack_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.no_ar_ack_i_1_n_0\,
      Q => no_ar_ack,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F7F3F7500400045"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_2_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0\,
      I2 => rd_data_sm_cs(0),
      I3 => rd_data_sm_cs(3),
      I4 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_4_n_0\,
      I5 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8E82000EBEBEBEB"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_5_n_0\,
      I1 => rd_data_sm_cs(1),
      I2 => rd_data_sm_cs(0),
      I3 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      I4 => rd_data_sm_cs(2),
      I5 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_2_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00A3"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_6_n_0\,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_7_n_0\,
      I2 => rd_data_sm_cs(1),
      I3 => rd_data_sm_cs(3),
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07FF07000FFF0FFF"
    )
        port map (
      I0 => end_brst_rd,
      I1 => ar_active,
      I2 => bram_addr_ld_en,
      I3 => rd_data_sm_cs(1),
      I4 => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_8_n_0\,
      I5 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_4_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"15FF"
    )
        port map (
      I0 => bram_addr_ld_en,
      I1 => ar_active,
      I2 => end_brst_rd,
      I3 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_5_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88008800FFFFF000"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I3 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I4 => bram_addr_ld_en,
      I5 => rd_data_sm_cs(2),
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_6_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00770F0F0077000F"
    )
        port map (
      I0 => ar_active,
      I1 => end_brst_rd,
      I2 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I3 => bram_addr_ld_en,
      I4 => rd_data_sm_cs(2),
      I5 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_21\,
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_7_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => \^gen_no_rd_cmd_opt.axi_rlast_int_reg_0\,
      I1 => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      I2 => bram_addr_ld_en,
      O => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_8_n_0\
    );
\GEN_NO_RD_CMD_OPT.pend_rd_op_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.pend_rd_op_i_1_n_0\,
      Q => \GEN_NO_RD_CMD_OPT.pend_rd_op_reg_n_0\,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.rd_skid_buf_ld_reg_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000E666"
    )
        port map (
      I0 => rd_data_sm_cs(0),
      I1 => rd_data_sm_cs(1),
      I2 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I3 => s_axi_rready,
      I4 => rd_data_sm_cs(3),
      I5 => rd_data_sm_cs(2),
      O => rd_skid_buf_ld_cmb
    );
\GEN_NO_RD_CMD_OPT.rd_skid_buf_ld_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => rd_skid_buf_ld_cmb,
      Q => rd_skid_buf_ld_reg,
      R => \^sr\(0)
    );
\GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE02"
    )
        port map (
      I0 => rddata_mux_sel_cmb,
      I1 => rd_data_sm_cs(3),
      I2 => \GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_3_n_0\,
      I3 => rddata_mux_sel,
      O => \GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_1_n_0\
    );
\GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B8B800000800"
    )
        port map (
      I0 => \GEN_NO_RD_CMD_OPT.act_rd_burst_two_i_6_n_0\,
      I1 => rd_data_sm_cs(0),
      I2 => \GEN_NO_RD_CMD_OPT.I_WRAP_BRST_n_19\,
      I3 => rd_data_sm_cs(1),
      I4 => rd_data_sm_cs(3),
      I5 => rd_data_sm_cs(2),
      O => rddata_mux_sel_cmb
    );
\GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0A0A007F7F7F7"
    )
        port map (
      I0 => rd_data_sm_cs(1),
      I1 => \GEN_NO_RD_CMD_OPT.GEN_RD_BURST_NORL.axi_rd_burst_two_reg_n_0\,
      I2 => rd_data_sm_cs(2),
      I3 => s_axi_rready,
      I4 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I5 => rd_data_sm_cs(0),
      O => \GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_3_n_0\
    );
\GEN_NO_RD_CMD_OPT.rddata_mux_sel_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NO_RD_CMD_OPT.rddata_mux_sel_i_1_n_0\,
      Q => rddata_mux_sel,
      R => \^sr\(0)
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => axi_arready_int,
      I1 => \^gen_no_rd_cmd_opt.axi_rvalid_int_reg_0\,
      I2 => s_axi_rready,
      I3 => axi_early_arready_int,
      O => s_axi_arready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl is
  port (
    axi_aresetn_re_reg : out STD_LOGIC;
    BRAM_En_A : out STD_LOGIC;
    BRAM_WrData_A : out STD_LOGIC_VECTOR ( 63 downto 0 );
    axi_aresetn_d3 : out STD_LOGIC;
    axi_bvalid_int_reg_0 : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    \GEN_AWREADY.axi_aresetn_d3_reg_0\ : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl is
  signal BID_FIFO_n_0 : STD_LOGIC;
  signal BID_FIFO_n_1 : STD_LOGIC;
  signal BID_FIFO_n_2 : STD_LOGIC;
  signal BID_FIFO_n_4 : STD_LOGIC;
  signal BID_FIFO_n_5 : STD_LOGIC;
  signal BID_FIFO_n_6 : STD_LOGIC;
  signal BID_FIFO_n_7 : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\ : STD_LOGIC;
  signal \^gen_awready.axi_aresetn_d3_reg_0\ : STD_LOGIC;
  signal \GEN_AWREADY.axi_awready_int_i_2_n_0\ : STD_LOGIC;
  signal \GEN_AWREADY.axi_awready_int_i_3_n_0\ : STD_LOGIC;
  signal \GEN_AWREADY.axi_awready_int_i_5_n_0\ : STD_LOGIC;
  signal \GEN_AW_DUAL.aw_active_i_1_n_0\ : STD_LOGIC;
  signal \GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0\ : STD_LOGIC;
  signal \GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0\ : STD_LOGIC;
  signal \GEN_AW_DUAL.wr_addr_sm_cs_i_3_n_0\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0\ : STD_LOGIC;
  signal \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2_n_0\ : STD_LOGIC;
  signal \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[1]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_23_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_24_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_25_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_26_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_27_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_28_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \GEN_NARROW_EN.curr_narrow_burst_i_1_n_0\ : STD_LOGIC;
  signal \GEN_NARROW_EN.curr_narrow_burst_i_3_n_0\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_0\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_1\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_2\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_3\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_4\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_5\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_6\ : STD_LOGIC;
  signal \GEN_UA_NARROW.I_UA_NARROW_n_7\ : STD_LOGIC;
  signal \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_2_n_0\ : STD_LOGIC;
  signal \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0\ : STD_LOGIC;
  signal \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0\ : STD_LOGIC;
  signal \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0\ : STD_LOGIC;
  signal \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\ : STD_LOGIC;
  signal I_WRAP_BRST_n_0 : STD_LOGIC;
  signal I_WRAP_BRST_n_1 : STD_LOGIC;
  signal I_WRAP_BRST_n_10 : STD_LOGIC;
  signal I_WRAP_BRST_n_11 : STD_LOGIC;
  signal I_WRAP_BRST_n_12 : STD_LOGIC;
  signal I_WRAP_BRST_n_13 : STD_LOGIC;
  signal I_WRAP_BRST_n_14 : STD_LOGIC;
  signal I_WRAP_BRST_n_15 : STD_LOGIC;
  signal I_WRAP_BRST_n_17 : STD_LOGIC;
  signal I_WRAP_BRST_n_18 : STD_LOGIC;
  signal I_WRAP_BRST_n_19 : STD_LOGIC;
  signal I_WRAP_BRST_n_2 : STD_LOGIC;
  signal I_WRAP_BRST_n_20 : STD_LOGIC;
  signal I_WRAP_BRST_n_21 : STD_LOGIC;
  signal I_WRAP_BRST_n_22 : STD_LOGIC;
  signal I_WRAP_BRST_n_23 : STD_LOGIC;
  signal I_WRAP_BRST_n_24 : STD_LOGIC;
  signal I_WRAP_BRST_n_25 : STD_LOGIC;
  signal I_WRAP_BRST_n_7 : STD_LOGIC;
  signal I_WRAP_BRST_n_8 : STD_LOGIC;
  signal I_WRAP_BRST_n_9 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal aw_active : STD_LOGIC;
  signal axi_aresetn_d1 : STD_LOGIC;
  signal axi_aresetn_d2 : STD_LOGIC;
  signal \^axi_aresetn_d3\ : STD_LOGIC;
  signal axi_aresetn_re : STD_LOGIC;
  signal \^axi_aresetn_re_reg\ : STD_LOGIC;
  signal axi_awaddr_full : STD_LOGIC;
  signal axi_awburst_pipe : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_awid_pipe : STD_LOGIC;
  signal axi_awlen_pipe : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_awlen_pipe_1_or_2 : STD_LOGIC;
  signal axi_awsize_pipe : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_bvalid_int_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_int_i_2_n_0 : STD_LOGIC;
  signal \^axi_bvalid_int_reg_0\ : STD_LOGIC;
  signal axi_wdata_full_cmb : STD_LOGIC;
  signal axi_wdata_full_reg : STD_LOGIC;
  signal axi_wr_burst : STD_LOGIC;
  signal axi_wr_burst_cmb : STD_LOGIC;
  signal axi_wr_burst_i_1_n_0 : STD_LOGIC;
  signal axi_wr_burst_i_3_n_0 : STD_LOGIC;
  signal axi_wready_int_mod_i_1_n_0 : STD_LOGIC;
  signal bid_gets_fifo_load : STD_LOGIC;
  signal bid_gets_fifo_load_d1 : STD_LOGIC;
  signal bram_addr_ld_en : STD_LOGIC;
  signal bram_addr_ld_en_mod : STD_LOGIC;
  signal bram_en_cmb : STD_LOGIC;
  signal bvalid_cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \bvalid_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bvalid_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bvalid_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal clr_bram_we : STD_LOGIC;
  signal clr_bram_we_cmb : STD_LOGIC;
  signal curr_awlen_reg_1_or_2 : STD_LOGIC;
  signal curr_awlen_reg_1_or_20 : STD_LOGIC;
  signal curr_awlen_reg_1_or_2_i_2_n_0 : STD_LOGIC;
  signal curr_awlen_reg_1_or_2_i_3_n_0 : STD_LOGIC;
  signal curr_awlen_reg_1_or_2_i_4_n_0 : STD_LOGIC;
  signal curr_fixed_burst : STD_LOGIC;
  signal curr_fixed_burst_reg : STD_LOGIC;
  signal curr_narrow_burst : STD_LOGIC;
  signal curr_narrow_burst_en : STD_LOGIC;
  signal curr_wrap_burst : STD_LOGIC;
  signal curr_wrap_burst_reg : STD_LOGIC;
  signal delay_aw_active_clr : STD_LOGIC;
  signal last_data_ack_mod : STD_LOGIC;
  signal narrow_addr_int : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal narrow_bram_addr_inc : STD_LOGIC;
  signal narrow_bram_addr_inc_d1 : STD_LOGIC;
  signal narrow_burst_cnt_ld_reg : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 10 downto 8 );
  signal p_25_in : STD_LOGIC;
  signal \p_9_out__0\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_wready\ : STD_LOGIC;
  signal wr_addr_sm_cs : STD_LOGIC;
  signal wr_data_sm_cs : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal wrdata_reg_ld : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6\ : label is "soft_lutpair85";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\ : label is "brst_wr_data:010,idle:000,w8_awaddr:001,sng_wr_data:100,b2b_w8_wr_data:011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1]\ : label is "brst_wr_data:010,idle:000,w8_awaddr:001,sng_wr_data:100,b2b_w8_wr_data:011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]\ : label is "brst_wr_data:010,idle:000,w8_awaddr:001,sng_wr_data:100,b2b_w8_wr_data:011";
  attribute SOFT_HLUTNM of \GEN_AW_DUAL.wr_addr_sm_cs_i_3\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT.narrow_addr_int[2]_i_10\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT.narrow_addr_int[2]_i_17\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT.narrow_addr_int[2]_i_26\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \GEN_NARROW_CNT.narrow_addr_int[2]_i_9\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \GEN_NARROW_EN.axi_wlast_d1_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of axi_bvalid_int_i_1 : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of axi_wready_int_mod_i_1 : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of curr_fixed_burst_reg_i_2 : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of curr_wrap_burst_reg_i_2 : label is "soft_lutpair82";
begin
  \GEN_AWREADY.axi_aresetn_d3_reg_0\ <= \^gen_awready.axi_aresetn_d3_reg_0\;
  Q(11 downto 0) <= \^q\(11 downto 0);
  axi_aresetn_d3 <= \^axi_aresetn_d3\;
  axi_aresetn_re_reg <= \^axi_aresetn_re_reg\;
  axi_bvalid_int_reg_0 <= \^axi_bvalid_int_reg_0\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bid(0) <= \^s_axi_bid\(0);
  s_axi_wready <= \^s_axi_wready\;
BID_FIFO: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO
     port map (
      \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]\ => BID_FIFO_n_4,
      \GEN_AWREADY.axi_awready_int_i_5\ => \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0\,
      \GEN_AW_DUAL.aw_active_reg\ => BID_FIFO_n_0,
      \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg\ => BID_FIFO_n_2,
      \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg_0\ => BID_FIFO_n_5,
      SR(0) => SR(0),
      aw_active => aw_active,
      axi_awaddr_full => axi_awaddr_full,
      axi_awid_pipe => axi_awid_pipe,
      axi_awlen_pipe_1_or_2 => axi_awlen_pipe_1_or_2,
      \axi_bid_int_reg[0]\ => BID_FIFO_n_7,
      \axi_bid_int_reg[0]_0\ => \^axi_bvalid_int_reg_0\,
      axi_wr_burst => axi_wr_burst,
      bid_gets_fifo_load => bid_gets_fifo_load,
      bid_gets_fifo_load_d1 => bid_gets_fifo_load_d1,
      bid_gets_fifo_load_d1_reg => \^axi_aresetn_d3\,
      bid_gets_fifo_load_d1_reg_0 => axi_bvalid_int_i_2_n_0,
      bvalid_cnt(2 downto 0) => bvalid_cnt(2 downto 0),
      \bvalid_cnt_reg[0]\ => BID_FIFO_n_6,
      \bvalid_cnt_reg[2]\ => BID_FIFO_n_1,
      curr_awlen_reg_1_or_2 => curr_awlen_reg_1_or_2,
      last_data_ack_mod => last_data_ack_mod,
      s_axi_aclk => s_axi_aclk,
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awready => \^s_axi_awready\,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => \^s_axi_bid\(0),
      s_axi_bready => s_axi_bready,
      s_axi_wlast => s_axi_wlast,
      s_axi_wvalid => s_axi_wvalid,
      wr_addr_sm_cs => wr_addr_sm_cs,
      wr_data_sm_cs(2 downto 0) => wr_data_sm_cs(2 downto 0)
    );
\FSM_sequential_GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.rd_addr_sm_cs_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^axi_aresetn_d3\,
      O => \^gen_awready.axi_aresetn_d3_reg_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBAAFFFFFBAA0000"
    )
        port map (
      I0 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2_n_0\,
      I1 => wr_data_sm_cs(2),
      I2 => s_axi_wvalid,
      I3 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0\,
      I4 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_5_n_0\,
      I5 => wr_data_sm_cs(0),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => wr_data_sm_cs(1),
      I2 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\,
      I3 => wr_data_sm_cs(0),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222FFFF20220000"
    )
        port map (
      I0 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0\,
      I1 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0\,
      I2 => wr_data_sm_cs(0),
      I3 => s_axi_wlast,
      I4 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_5_n_0\,
      I5 => wr_data_sm_cs(1),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABAA"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => wr_data_sm_cs(0),
      I2 => wr_data_sm_cs(1),
      I3 => BID_FIFO_n_6,
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF04FF0000"
    )
        port map (
      I0 => wr_data_sm_cs(1),
      I1 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0\,
      I2 => BID_FIFO_n_6,
      I3 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0\,
      I4 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_5_n_0\,
      I5 => wr_data_sm_cs(2),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_wlast,
      I1 => wr_data_sm_cs(0),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FACF"
    )
        port map (
      I0 => axi_wr_burst,
      I1 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\,
      I2 => wr_data_sm_cs(1),
      I3 => wr_data_sm_cs(0),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_4_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03DF031003D30310"
    )
        port map (
      I0 => BID_FIFO_n_5,
      I1 => wr_data_sm_cs(1),
      I2 => wr_data_sm_cs(0),
      I3 => wr_data_sm_cs(2),
      I4 => s_axi_wvalid,
      I5 => s_axi_wlast,
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_5_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5515"
    )
        port map (
      I0 => BID_FIFO_n_2,
      I1 => bvalid_cnt(1),
      I2 => bvalid_cnt(2),
      I3 => bvalid_cnt(0),
      O => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0\,
      Q => wr_data_sm_cs(0),
      R => SR(0)
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0\,
      Q => wr_data_sm_cs(1),
      R => SR(0)
    );
\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0\,
      Q => wr_data_sm_cs(2),
      R => SR(0)
    );
\GEN_AWREADY.axi_aresetn_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_aresetn,
      Q => axi_aresetn_d1,
      R => '0'
    );
\GEN_AWREADY.axi_aresetn_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_aresetn_d1,
      Q => axi_aresetn_d2,
      R => '0'
    );
\GEN_AWREADY.axi_aresetn_d3_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_aresetn_d2,
      Q => \^axi_aresetn_d3\,
      R => '0'
    );
\GEN_AWREADY.axi_aresetn_re_reg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => axi_aresetn_d1,
      I1 => axi_aresetn_d2,
      O => axi_aresetn_re
    );
\GEN_AWREADY.axi_aresetn_re_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_aresetn_re,
      Q => \^axi_aresetn_re_reg\,
      R => '0'
    );
\GEN_AWREADY.axi_awready_int_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFBFFFFF00AA"
    )
        port map (
      I0 => axi_awaddr_full,
      I1 => \GEN_AWREADY.axi_awready_int_i_3_n_0\,
      I2 => \^axi_aresetn_d3\,
      I3 => BID_FIFO_n_0,
      I4 => \^axi_aresetn_re_reg\,
      I5 => \^s_axi_awready\,
      O => \GEN_AWREADY.axi_awready_int_i_2_n_0\
    );
\GEN_AWREADY.axi_awready_int_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4440404040404040"
    )
        port map (
      I0 => \GEN_AWREADY.axi_awready_int_i_5_n_0\,
      I1 => s_axi_awvalid,
      I2 => aw_active,
      I3 => bvalid_cnt(0),
      I4 => bvalid_cnt(1),
      I5 => bvalid_cnt(2),
      O => \GEN_AWREADY.axi_awready_int_i_3_n_0\
    );
\GEN_AWREADY.axi_awready_int_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABABABABABABA"
    )
        port map (
      I0 => wr_addr_sm_cs,
      I1 => BID_FIFO_n_2,
      I2 => last_data_ack_mod,
      I3 => bvalid_cnt(2),
      I4 => bvalid_cnt(1),
      I5 => bvalid_cnt(0),
      O => \GEN_AWREADY.axi_awready_int_i_5_n_0\
    );
\GEN_AWREADY.axi_awready_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_AWREADY.axi_awready_int_i_2_n_0\,
      Q => \^s_axi_awready\,
      R => SR(0)
    );
\GEN_AW_DUAL.aw_active_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFFF0000FFFF"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => delay_aw_active_clr,
      I2 => wr_data_sm_cs(0),
      I3 => wr_data_sm_cs(1),
      I4 => BID_FIFO_n_0,
      I5 => aw_active,
      O => \GEN_AW_DUAL.aw_active_i_1_n_0\
    );
\GEN_AW_DUAL.aw_active_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_AW_DUAL.aw_active_i_1_n_0\,
      Q => aw_active,
      R => \^gen_awready.axi_aresetn_d3_reg_0\
    );
\GEN_AW_DUAL.wr_addr_sm_cs_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0\,
      I1 => wr_addr_sm_cs,
      I2 => s_axi_awvalid,
      I3 => axi_awaddr_full,
      I4 => \GEN_AW_DUAL.wr_addr_sm_cs_i_3_n_0\,
      O => \GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0\
    );
\GEN_AW_DUAL.wr_addr_sm_cs_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => BID_FIFO_n_1,
      I1 => last_data_ack_mod,
      I2 => axi_awaddr_full,
      I3 => \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0\,
      I4 => curr_awlen_reg_1_or_2,
      I5 => axi_awlen_pipe_1_or_2,
      O => \GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0\
    );
\GEN_AW_DUAL.wr_addr_sm_cs_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1555"
    )
        port map (
      I0 => aw_active,
      I1 => bvalid_cnt(0),
      I2 => bvalid_cnt(1),
      I3 => bvalid_cnt(2),
      O => \GEN_AW_DUAL.wr_addr_sm_cs_i_3_n_0\
    );
\GEN_AW_DUAL.wr_addr_sm_cs_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0\,
      Q => wr_addr_sm_cs,
      R => \^gen_awready.axi_aresetn_d3_reg_0\
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(0),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(10),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(11),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(12),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(13),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(14),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(1),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(2),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => axi_awaddr_full,
      I1 => \GEN_AWREADY.axi_awready_int_i_3_n_0\,
      I2 => \^axi_aresetn_d3\,
      O => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(3),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(4),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(5),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(6),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(7),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(8),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awaddr(9),
      Q => \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EA004000"
    )
        port map (
      I0 => axi_awaddr_full,
      I1 => \GEN_AWREADY.axi_awready_int_i_3_n_0\,
      I2 => \^axi_aresetn_d3\,
      I3 => s_axi_aresetn,
      I4 => BID_FIFO_n_0,
      O => \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0\
    );
\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0\,
      Q => axi_awaddr_full,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF00BF00BF00FF40"
    )
        port map (
      I0 => axi_awaddr_full,
      I1 => \GEN_AWREADY.axi_awready_int_i_3_n_0\,
      I2 => \^axi_aresetn_d3\,
      I3 => \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0\,
      I4 => s_axi_awburst(0),
      I5 => s_axi_awburst(1),
      O => \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0\
    );
\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0\,
      Q => \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0\,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awburst(0),
      Q => axi_awburst_pipe(0),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awburst(1),
      Q => axi_awburst_pipe(1),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awid_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awid(0),
      Q => axi_awid_pipe,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_awlen(5),
      I1 => s_axi_awlen(3),
      I2 => s_axi_awlen(6),
      I3 => \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2_n_0\,
      O => \p_9_out__0\
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axi_awlen(7),
      I1 => s_axi_awlen(2),
      I2 => s_axi_awlen(4),
      I3 => s_axi_awlen(1),
      O => \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2_n_0\
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => \p_9_out__0\,
      Q => axi_awlen_pipe_1_or_2,
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(0),
      Q => axi_awlen_pipe(0),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(1),
      Q => axi_awlen_pipe(1),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(2),
      Q => axi_awlen_pipe(2),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(3),
      Q => axi_awlen_pipe(3),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(4),
      Q => axi_awlen_pipe(4),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(5),
      Q => axi_awlen_pipe(5),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(6),
      Q => axi_awlen_pipe(6),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awlen(7),
      Q => axi_awlen_pipe(7),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awsize(0),
      Q => axi_awsize_pipe(0),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awsize(1),
      Q => axi_awsize_pipe(1),
      R => '0'
    );
\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe[3]_i_1_n_0\,
      D => s_axi_awsize(2),
      Q => axi_awsize_pipe(2),
      R => '0'
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0\
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_8,
      Q => \^q\(7),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_7,
      Q => \^q\(8),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en_mod,
      D => p_1_in(8),
      Q => \^q\(9),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en_mod,
      D => p_1_in(9),
      Q => \^q\(10),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en_mod,
      D => p_1_in(10),
      Q => \^q\(11),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_15,
      Q => \^q\(0),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_14,
      Q => \^q\(1),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_13,
      Q => \^q\(2),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_12,
      Q => \^q\(3),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_11,
      Q => \^q\(4),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_10,
      Q => \^q\(5),
      R => I_WRAP_BRST_n_0
    );
\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => I_WRAP_BRST_n_17,
      D => I_WRAP_BRST_n_9,
      Q => \^q\(6),
      R => I_WRAP_BRST_n_0
    );
\GEN_NARROW_CNT.narrow_addr_int[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3FAAC0AA"
    )
        port map (
      I0 => \GEN_UA_NARROW.I_UA_NARROW_n_4\,
      I1 => curr_narrow_burst,
      I2 => I_WRAP_BRST_n_18,
      I3 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\,
      I4 => narrow_addr_int(0),
      O => \GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFFFCAACCAACCAA"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => axi_awsize_pipe(2),
      I2 => axi_awsize_pipe(1),
      I3 => axi_awaddr_full,
      I4 => s_axi_awsize(1),
      I5 => I_WRAP_BRST_n_22,
      O => \GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFFFCCCC5000CCCC"
    )
        port map (
      I0 => narrow_addr_int(0),
      I1 => \GEN_UA_NARROW.I_UA_NARROW_n_5\,
      I2 => curr_narrow_burst,
      I3 => I_WRAP_BRST_n_18,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\,
      I5 => narrow_addr_int(1),
      O => \GEN_NARROW_CNT.narrow_addr_int[1]_i_1_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF99FFFFAAC3"
    )
        port map (
      I0 => \GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I1 => \GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_0\,
      I3 => I_WRAP_BRST_n_23,
      I4 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I5 => I_WRAP_BRST_n_22,
      O => \GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0A0C0F0F0A0C00"
    )
        port map (
      I0 => \GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I1 => \GEN_UA_NARROW.I_UA_NARROW_n_2\,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I3 => I_WRAP_BRST_n_23,
      I4 => I_WRAP_BRST_n_22,
      I5 => \GEN_UA_NARROW.I_UA_NARROW_n_0\,
      O => \GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFFF0F01100F0F0"
    )
        port map (
      I0 => narrow_addr_int(0),
      I1 => narrow_addr_int(1),
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_6\,
      I3 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0\,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\,
      I5 => narrow_addr_int(2),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_awburst_pipe(1),
      I1 => axi_awaddr_full,
      I2 => s_axi_awburst(1),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD0DDD0D0000DD0D"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\,
      I1 => \GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\,
      I2 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0\,
      I3 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0\,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\,
      I5 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5AAA5AAA588A0880"
    )
        port map (
      I0 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I1 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0\,
      I2 => I_WRAP_BRST_n_22,
      I3 => I_WRAP_BRST_n_23,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\,
      I5 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEEEFFFF"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0\,
      I1 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_23_n_0\,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_7\,
      I3 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_24_n_0\,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_25_n_0\,
      I5 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_26_n_0\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEEEEEEF"
    )
        port map (
      I0 => I_WRAP_BRST_n_21,
      I1 => BID_FIFO_n_0,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_0\,
      I3 => \GEN_UA_NARROW.I_UA_NARROW_n_3\,
      I4 => \GEN_UA_NARROW.I_UA_NARROW_n_2\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0CAF0CA0FCAFFCA0"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_27_n_0\,
      I1 => curr_awlen_reg_1_or_2_i_4_n_0,
      I2 => I_WRAP_BRST_n_22,
      I3 => I_WRAP_BRST_n_23,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_28_n_0\,
      I5 => curr_awlen_reg_1_or_2_i_3_n_0,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFB84747FFB8"
    )
        port map (
      I0 => axi_awsize_pipe(1),
      I1 => axi_awaddr_full,
      I2 => s_axi_awsize(1),
      I3 => I_WRAP_BRST_n_24,
      I4 => I_WRAP_BRST_n_22,
      I5 => I_WRAP_BRST_n_19,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0055330F"
    )
        port map (
      I0 => I_WRAP_BRST_n_25,
      I1 => I_WRAP_BRST_n_20,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I3 => I_WRAP_BRST_n_23,
      I4 => I_WRAP_BRST_n_22,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5FFF555CFCCCFFF"
    )
        port map (
      I0 => curr_awlen_reg_1_or_2_i_3_n_0,
      I1 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_28_n_0\,
      I2 => axi_awsize_pipe(1),
      I3 => axi_awaddr_full,
      I4 => s_axi_awsize(1),
      I5 => I_WRAP_BRST_n_22,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF35003"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_27_n_0\,
      I1 => curr_awlen_reg_1_or_2_i_4_n_0,
      I2 => I_WRAP_BRST_n_22,
      I3 => I_WRAP_BRST_n_23,
      I4 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => I_WRAP_BRST_n_19,
      I1 => I_WRAP_BRST_n_22,
      I2 => axi_awlen_pipe(0),
      I3 => axi_awaddr_full,
      I4 => s_axi_awvalid,
      I5 => s_axi_awlen(0),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => I_WRAP_BRST_n_25,
      I1 => I_WRAP_BRST_n_22,
      I2 => axi_awlen_pipe(2),
      I3 => axi_awaddr_full,
      I4 => s_axi_awvalid,
      I5 => s_axi_awlen(2),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00A3A3A3"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_28_n_0\,
      I1 => curr_awlen_reg_1_or_2_i_3_n_0,
      I2 => I_WRAP_BRST_n_22,
      I3 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I4 => I_WRAP_BRST_n_23,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1D1D1D0000001D00"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => axi_awaddr_full,
      I2 => axi_awsize_pipe(1),
      I3 => I_WRAP_BRST_n_25,
      I4 => I_WRAP_BRST_n_22,
      I5 => I_WRAP_BRST_n_20,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_23_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888FFFFB8880000"
    )
        port map (
      I0 => axi_awlen_pipe(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awlen(0),
      I3 => s_axi_awvalid,
      I4 => I_WRAP_BRST_n_22,
      I5 => I_WRAP_BRST_n_19,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_24_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF47774777"
    )
        port map (
      I0 => axi_awlen_pipe(5),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(5),
      I4 => curr_awlen_reg_1_or_2_i_4_n_0,
      I5 => I_WRAP_BRST_n_22,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_25_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA80A0A0"
    )
        port map (
      I0 => I_WRAP_BRST_n_23,
      I1 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I2 => I_WRAP_BRST_n_25,
      I3 => I_WRAP_BRST_n_20,
      I4 => I_WRAP_BRST_n_22,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_26_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => axi_awlen_pipe(5),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(5),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_27_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_28\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => axi_awlen_pipe(6),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(6),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_28_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => wr_data_sm_cs(2),
      I2 => wr_data_sm_cs(1),
      I3 => wr_data_sm_cs(0),
      I4 => curr_narrow_burst,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF08"
    )
        port map (
      I0 => I_WRAP_BRST_n_23,
      I1 => I_WRAP_BRST_n_22,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I3 => BID_FIFO_n_0,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEFFFFAEFEA"
    )
        port map (
      I0 => I_WRAP_BRST_n_22,
      I1 => axi_awsize_pipe(1),
      I2 => axi_awaddr_full,
      I3 => s_axi_awsize(1),
      I4 => axi_awsize_pipe(2),
      I5 => s_axi_awsize(2),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF999999D9"
    )
        port map (
      I0 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0\,
      I1 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0\,
      I2 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0\,
      I3 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0\,
      I4 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0\,
      I5 => \GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5554"
    )
        port map (
      I0 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I1 => I_WRAP_BRST_n_23,
      I2 => I_WRAP_BRST_n_22,
      I3 => \GEN_UA_NARROW.I_UA_NARROW_n_2\,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => narrow_addr_int(2),
      I1 => narrow_addr_int(0),
      I2 => narrow_addr_int(1),
      I3 => I_WRAP_BRST_n_18,
      I4 => curr_narrow_burst,
      I5 => narrow_bram_addr_inc_d1,
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int[2]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_awburst_pipe(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awburst(0),
      O => \GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0\
    );
\GEN_NARROW_CNT.narrow_addr_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0\,
      Q => narrow_addr_int(0),
      R => SR(0)
    );
\GEN_NARROW_CNT.narrow_addr_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NARROW_CNT.narrow_addr_int[1]_i_1_n_0\,
      Q => narrow_addr_int(1),
      R => SR(0)
    );
\GEN_NARROW_CNT.narrow_addr_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0\,
      Q => narrow_addr_int(2),
      R => SR(0)
    );
\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => curr_narrow_burst,
      I1 => I_WRAP_BRST_n_18,
      I2 => narrow_addr_int(1),
      I3 => narrow_addr_int(0),
      I4 => narrow_addr_int(2),
      O => narrow_bram_addr_inc
    );
\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_bram_addr_inc,
      Q => narrow_bram_addr_inc_d1,
      R => SR(0)
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF150015"
    )
        port map (
      I0 => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      I1 => I_WRAP_BRST_n_23,
      I2 => I_WRAP_BRST_n_22,
      I3 => BID_FIFO_n_0,
      I4 => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0]\,
      O => narrow_burst_cnt_ld_reg(0)
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888B8888888B8B8B"
    )
        port map (
      I0 => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1]\,
      I1 => BID_FIFO_n_0,
      I2 => I_WRAP_BRST_n_23,
      I3 => axi_awsize_pipe(2),
      I4 => axi_awaddr_full,
      I5 => s_axi_awsize(2),
      O => narrow_burst_cnt_ld_reg(1)
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888B8888888B8B8B"
    )
        port map (
      I0 => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2]\,
      I1 => BID_FIFO_n_0,
      I2 => \GEN_UA_NARROW.I_UA_NARROW_n_7\,
      I3 => axi_awsize_pipe(0),
      I4 => axi_awaddr_full,
      I5 => s_axi_awsize(0),
      O => narrow_burst_cnt_ld_reg(2)
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_burst_cnt_ld_reg(0),
      Q => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0]\,
      R => SR(0)
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_burst_cnt_ld_reg(1),
      Q => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1]\,
      R => SR(0)
    );
\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => narrow_burst_cnt_ld_reg(2),
      Q => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2]\,
      R => SR(0)
    );
\GEN_NARROW_EN.axi_wlast_d1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => s_axi_wlast,
      I2 => s_axi_wvalid,
      O => p_25_in
    );
\GEN_NARROW_EN.axi_wlast_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_25_in,
      Q => last_data_ack_mod,
      R => SR(0)
    );
\GEN_NARROW_EN.curr_narrow_burst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FBB0F0000000000"
    )
        port map (
      I0 => last_data_ack_mod,
      I1 => p_25_in,
      I2 => I_WRAP_BRST_n_21,
      I3 => curr_narrow_burst_en,
      I4 => curr_narrow_burst,
      I5 => s_axi_aresetn,
      O => \GEN_NARROW_EN.curr_narrow_burst_i_1_n_0\
    );
\GEN_NARROW_EN.curr_narrow_burst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => \GEN_NARROW_EN.curr_narrow_burst_i_3_n_0\,
      I1 => curr_awlen_reg_1_or_20,
      I2 => curr_fixed_burst,
      I3 => BID_FIFO_n_0,
      O => curr_narrow_burst_en
    );
\GEN_NARROW_EN.curr_narrow_burst_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4777"
    )
        port map (
      I0 => axi_awlen_pipe(0),
      I1 => axi_awaddr_full,
      I2 => s_axi_awlen(0),
      I3 => s_axi_awvalid,
      O => \GEN_NARROW_EN.curr_narrow_burst_i_3_n_0\
    );
\GEN_NARROW_EN.curr_narrow_burst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_NARROW_EN.curr_narrow_burst_i_1_n_0\,
      Q => curr_narrow_burst,
      R => '0'
    );
\GEN_UA_NARROW.I_UA_NARROW\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ua_narrow
     port map (
      D(0) => narrow_burst_cnt_ld_reg(1),
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0]\ => \GEN_UA_NARROW.I_UA_NARROW_n_0\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1]\ => \GEN_UA_NARROW.I_UA_NARROW_n_3\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2]\ => \GEN_UA_NARROW.I_UA_NARROW_n_2\,
      \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2]\ => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[0]\ => \GEN_NARROW_CNT.narrow_addr_int[0]_i_3_n_0\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[0]_0\ => BID_FIFO_n_0,
      \GEN_NARROW_CNT.narrow_addr_int_reg[0]_1\ => \GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[0]_2\ => \GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[1]\ => \GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[2]\(1) => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2]\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[2]\(0) => \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0]\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0\ => \GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0\,
      \GEN_NARROW_CNT.narrow_addr_int_reg[2]_1\ => \GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0\,
      \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0]\ => \GEN_UA_NARROW.I_UA_NARROW_n_4\,
      \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1]\ => \GEN_UA_NARROW.I_UA_NARROW_n_5\,
      \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2]\ => \GEN_UA_NARROW.I_UA_NARROW_n_6\,
      Q(1 downto 0) => axi_awsize_pipe(2 downto 1),
      axi_awaddr_full => axi_awaddr_full,
      s_axi_awaddr(2 downto 0) => s_axi_awaddr(2 downto 0),
      s_axi_awsize(1 downto 0) => s_axi_awsize(2 downto 1),
      \s_axi_awsize[2]\ => \GEN_UA_NARROW.I_UA_NARROW_n_7\,
      ua_narrow_load1_carry_0 => I_WRAP_BRST_n_23,
      ua_narrow_load1_carry_i_5_0 => I_WRAP_BRST_n_22
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00005454F0F0FE00"
    )
        port map (
      I0 => wr_data_sm_cs(0),
      I1 => s_axi_wvalid,
      I2 => axi_wdata_full_reg,
      I3 => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_2_n_0\,
      I4 => wr_data_sm_cs(1),
      I5 => wr_data_sm_cs(2),
      O => axi_wdata_full_cmb
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DF55DF00"
    )
        port map (
      I0 => wr_data_sm_cs(0),
      I1 => BID_FIFO_n_0,
      I2 => axi_awaddr_full,
      I3 => BID_FIFO_n_6,
      I4 => axi_wdata_full_reg,
      O => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_2_n_0\
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_wdata_full_cmb,
      Q => axi_wdata_full_reg,
      R => SR(0)
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4400450055114500"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => wr_data_sm_cs(1),
      I2 => BID_FIFO_n_6,
      I3 => s_axi_wvalid,
      I4 => wr_data_sm_cs(0),
      I5 => BID_FIFO_n_5,
      O => bram_en_cmb
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => bram_en_cmb,
      Q => BRAM_En_A,
      R => SR(0)
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010101010111010"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => wr_data_sm_cs(1),
      I2 => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0\,
      I3 => BID_FIFO_n_5,
      I4 => wr_data_sm_cs(0),
      I5 => axi_wr_burst,
      O => clr_bram_we_cmb
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_wlast,
      I2 => wr_data_sm_cs(0),
      I3 => BID_FIFO_n_6,
      O => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0\
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => clr_bram_we_cmb,
      Q => clr_bram_we,
      R => SR(0)
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0454FFFF04540000"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => s_axi_wlast,
      I2 => wr_data_sm_cs(0),
      I3 => BID_FIFO_n_5,
      I4 => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0\,
      I5 => delay_aw_active_clr,
      O => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0\
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEAAAEAAAEA"
    )
        port map (
      I0 => clr_bram_we_cmb,
      I1 => I_WRAP_BRST_n_18,
      I2 => s_axi_wlast,
      I3 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\,
      I4 => wr_data_sm_cs(2),
      I5 => delay_aw_active_clr,
      O => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0\
    );
\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0\,
      Q => delay_aw_active_clr,
      R => SR(0)
    );
\GEN_WRDATA[0].bram_wrdata_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(0),
      Q => BRAM_WrData_A(0),
      R => '0'
    );
\GEN_WRDATA[10].bram_wrdata_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(10),
      Q => BRAM_WrData_A(10),
      R => '0'
    );
\GEN_WRDATA[11].bram_wrdata_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(11),
      Q => BRAM_WrData_A(11),
      R => '0'
    );
\GEN_WRDATA[12].bram_wrdata_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(12),
      Q => BRAM_WrData_A(12),
      R => '0'
    );
\GEN_WRDATA[13].bram_wrdata_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(13),
      Q => BRAM_WrData_A(13),
      R => '0'
    );
\GEN_WRDATA[14].bram_wrdata_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(14),
      Q => BRAM_WrData_A(14),
      R => '0'
    );
\GEN_WRDATA[15].bram_wrdata_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(15),
      Q => BRAM_WrData_A(15),
      R => '0'
    );
\GEN_WRDATA[16].bram_wrdata_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(16),
      Q => BRAM_WrData_A(16),
      R => '0'
    );
\GEN_WRDATA[17].bram_wrdata_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(17),
      Q => BRAM_WrData_A(17),
      R => '0'
    );
\GEN_WRDATA[18].bram_wrdata_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(18),
      Q => BRAM_WrData_A(18),
      R => '0'
    );
\GEN_WRDATA[19].bram_wrdata_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(19),
      Q => BRAM_WrData_A(19),
      R => '0'
    );
\GEN_WRDATA[1].bram_wrdata_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(1),
      Q => BRAM_WrData_A(1),
      R => '0'
    );
\GEN_WRDATA[20].bram_wrdata_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(20),
      Q => BRAM_WrData_A(20),
      R => '0'
    );
\GEN_WRDATA[21].bram_wrdata_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(21),
      Q => BRAM_WrData_A(21),
      R => '0'
    );
\GEN_WRDATA[22].bram_wrdata_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(22),
      Q => BRAM_WrData_A(22),
      R => '0'
    );
\GEN_WRDATA[23].bram_wrdata_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(23),
      Q => BRAM_WrData_A(23),
      R => '0'
    );
\GEN_WRDATA[24].bram_wrdata_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(24),
      Q => BRAM_WrData_A(24),
      R => '0'
    );
\GEN_WRDATA[25].bram_wrdata_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(25),
      Q => BRAM_WrData_A(25),
      R => '0'
    );
\GEN_WRDATA[26].bram_wrdata_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(26),
      Q => BRAM_WrData_A(26),
      R => '0'
    );
\GEN_WRDATA[27].bram_wrdata_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(27),
      Q => BRAM_WrData_A(27),
      R => '0'
    );
\GEN_WRDATA[28].bram_wrdata_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(28),
      Q => BRAM_WrData_A(28),
      R => '0'
    );
\GEN_WRDATA[29].bram_wrdata_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(29),
      Q => BRAM_WrData_A(29),
      R => '0'
    );
\GEN_WRDATA[2].bram_wrdata_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(2),
      Q => BRAM_WrData_A(2),
      R => '0'
    );
\GEN_WRDATA[30].bram_wrdata_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(30),
      Q => BRAM_WrData_A(30),
      R => '0'
    );
\GEN_WRDATA[31].bram_wrdata_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(31),
      Q => BRAM_WrData_A(31),
      R => '0'
    );
\GEN_WRDATA[32].bram_wrdata_int_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(32),
      Q => BRAM_WrData_A(32),
      R => '0'
    );
\GEN_WRDATA[33].bram_wrdata_int_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(33),
      Q => BRAM_WrData_A(33),
      R => '0'
    );
\GEN_WRDATA[34].bram_wrdata_int_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(34),
      Q => BRAM_WrData_A(34),
      R => '0'
    );
\GEN_WRDATA[35].bram_wrdata_int_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(35),
      Q => BRAM_WrData_A(35),
      R => '0'
    );
\GEN_WRDATA[36].bram_wrdata_int_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(36),
      Q => BRAM_WrData_A(36),
      R => '0'
    );
\GEN_WRDATA[37].bram_wrdata_int_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(37),
      Q => BRAM_WrData_A(37),
      R => '0'
    );
\GEN_WRDATA[38].bram_wrdata_int_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(38),
      Q => BRAM_WrData_A(38),
      R => '0'
    );
\GEN_WRDATA[39].bram_wrdata_int_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(39),
      Q => BRAM_WrData_A(39),
      R => '0'
    );
\GEN_WRDATA[3].bram_wrdata_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(3),
      Q => BRAM_WrData_A(3),
      R => '0'
    );
\GEN_WRDATA[40].bram_wrdata_int_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(40),
      Q => BRAM_WrData_A(40),
      R => '0'
    );
\GEN_WRDATA[41].bram_wrdata_int_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(41),
      Q => BRAM_WrData_A(41),
      R => '0'
    );
\GEN_WRDATA[42].bram_wrdata_int_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(42),
      Q => BRAM_WrData_A(42),
      R => '0'
    );
\GEN_WRDATA[43].bram_wrdata_int_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(43),
      Q => BRAM_WrData_A(43),
      R => '0'
    );
\GEN_WRDATA[44].bram_wrdata_int_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(44),
      Q => BRAM_WrData_A(44),
      R => '0'
    );
\GEN_WRDATA[45].bram_wrdata_int_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(45),
      Q => BRAM_WrData_A(45),
      R => '0'
    );
\GEN_WRDATA[46].bram_wrdata_int_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(46),
      Q => BRAM_WrData_A(46),
      R => '0'
    );
\GEN_WRDATA[47].bram_wrdata_int_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(47),
      Q => BRAM_WrData_A(47),
      R => '0'
    );
\GEN_WRDATA[48].bram_wrdata_int_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(48),
      Q => BRAM_WrData_A(48),
      R => '0'
    );
\GEN_WRDATA[49].bram_wrdata_int_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(49),
      Q => BRAM_WrData_A(49),
      R => '0'
    );
\GEN_WRDATA[4].bram_wrdata_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(4),
      Q => BRAM_WrData_A(4),
      R => '0'
    );
\GEN_WRDATA[50].bram_wrdata_int_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(50),
      Q => BRAM_WrData_A(50),
      R => '0'
    );
\GEN_WRDATA[51].bram_wrdata_int_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(51),
      Q => BRAM_WrData_A(51),
      R => '0'
    );
\GEN_WRDATA[52].bram_wrdata_int_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(52),
      Q => BRAM_WrData_A(52),
      R => '0'
    );
\GEN_WRDATA[53].bram_wrdata_int_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(53),
      Q => BRAM_WrData_A(53),
      R => '0'
    );
\GEN_WRDATA[54].bram_wrdata_int_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(54),
      Q => BRAM_WrData_A(54),
      R => '0'
    );
\GEN_WRDATA[55].bram_wrdata_int_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(55),
      Q => BRAM_WrData_A(55),
      R => '0'
    );
\GEN_WRDATA[56].bram_wrdata_int_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(56),
      Q => BRAM_WrData_A(56),
      R => '0'
    );
\GEN_WRDATA[57].bram_wrdata_int_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(57),
      Q => BRAM_WrData_A(57),
      R => '0'
    );
\GEN_WRDATA[58].bram_wrdata_int_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(58),
      Q => BRAM_WrData_A(58),
      R => '0'
    );
\GEN_WRDATA[59].bram_wrdata_int_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(59),
      Q => BRAM_WrData_A(59),
      R => '0'
    );
\GEN_WRDATA[5].bram_wrdata_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(5),
      Q => BRAM_WrData_A(5),
      R => '0'
    );
\GEN_WRDATA[60].bram_wrdata_int_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(60),
      Q => BRAM_WrData_A(60),
      R => '0'
    );
\GEN_WRDATA[61].bram_wrdata_int_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(61),
      Q => BRAM_WrData_A(61),
      R => '0'
    );
\GEN_WRDATA[62].bram_wrdata_int_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(62),
      Q => BRAM_WrData_A(62),
      R => '0'
    );
\GEN_WRDATA[63].bram_wrdata_int_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(63),
      Q => BRAM_WrData_A(63),
      R => '0'
    );
\GEN_WRDATA[6].bram_wrdata_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(6),
      Q => BRAM_WrData_A(6),
      R => '0'
    );
\GEN_WRDATA[7].bram_wrdata_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(7),
      Q => BRAM_WrData_A(7),
      R => '0'
    );
\GEN_WRDATA[8].bram_wrdata_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(8),
      Q => BRAM_WrData_A(8),
      R => '0'
    );
\GEN_WRDATA[9].bram_wrdata_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wdata(9),
      Q => BRAM_WrData_A(9),
      R => '0'
    );
\GEN_WR_NO_ECC.bram_we_int[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7D50000FFFFFFFF"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => wr_data_sm_cs(1),
      I2 => wr_data_sm_cs(2),
      I3 => wr_data_sm_cs(0),
      I4 => clr_bram_we,
      I5 => s_axi_aresetn,
      O => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"082A"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => wr_data_sm_cs(1),
      I2 => wr_data_sm_cs(2),
      I3 => wr_data_sm_cs(0),
      O => wrdata_reg_ld
    );
\GEN_WR_NO_ECC.bram_we_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(0),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(0),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(1),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(1),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(2),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(2),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(3),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(3),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(4),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(4),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(5),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(5),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(6),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(6),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
\GEN_WR_NO_ECC.bram_we_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wrdata_reg_ld,
      D => s_axi_wstrb(7),
      Q => \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(7),
      R => \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0\
    );
I_WRAP_BRST: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst
     port map (
      D(11 downto 9) => p_1_in(10 downto 8),
      D(8) => I_WRAP_BRST_n_7,
      D(7) => I_WRAP_BRST_n_8,
      D(6) => I_WRAP_BRST_n_9,
      D(5) => I_WRAP_BRST_n_10,
      D(4) => I_WRAP_BRST_n_11,
      D(3) => I_WRAP_BRST_n_12,
      D(2) => I_WRAP_BRST_n_13,
      D(1) => I_WRAP_BRST_n_14,
      D(0) => I_WRAP_BRST_n_15,
      E(0) => bram_addr_ld_en,
      \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\(1) => bram_addr_ld_en_mod,
      \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]\(0) => I_WRAP_BRST_n_17,
      \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0]_0\ => I_WRAP_BRST_n_18,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg\ => \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg\,
      \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0]\ => I_WRAP_BRST_n_24,
      \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1]\ => I_WRAP_BRST_n_19,
      \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2]\ => I_WRAP_BRST_n_20,
      \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3]\ => I_WRAP_BRST_n_25,
      \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0]\ => I_WRAP_BRST_n_22,
      \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]\ => I_WRAP_BRST_n_21,
      \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1]_0\ => I_WRAP_BRST_n_23,
      \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10]\ => \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5_n_0\,
      Q(8 downto 0) => \^q\(8 downto 0),
      SR(0) => I_WRAP_BRST_n_0,
      axi_awaddr_full => axi_awaddr_full,
      curr_fixed_burst => curr_fixed_burst,
      curr_fixed_burst_reg => curr_fixed_burst_reg,
      curr_fixed_burst_reg_reg => I_WRAP_BRST_n_2,
      curr_narrow_burst => curr_narrow_burst,
      curr_wrap_burst => curr_wrap_burst,
      curr_wrap_burst_reg => curr_wrap_burst_reg,
      curr_wrap_burst_reg_reg => I_WRAP_BRST_n_1,
      narrow_addr_int(2 downto 0) => narrow_addr_int(2 downto 0),
      narrow_bram_addr_inc_d1 => narrow_bram_addr_inc_d1,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_awaddr(11 downto 0) => s_axi_awaddr(14 downto 3),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_wvalid => s_axi_wvalid,
      \save_init_bram_addr_ld_reg[14]_0\ => BID_FIFO_n_0,
      wr_data_sm_cs(2 downto 0) => wr_data_sm_cs(2 downto 0),
      \wrap_burst_total_reg[0]_0\ => \GEN_UA_NARROW.I_UA_NARROW_n_1\,
      \wrap_burst_total_reg[0]_1\(0) => SR(0),
      \wrap_burst_total_reg[1]_0\(2 downto 0) => axi_awsize_pipe(2 downto 0),
      \wrap_burst_total_reg[2]_0\(3 downto 0) => axi_awlen_pipe(3 downto 0)
    );
\axi_bid_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => BID_FIFO_n_7,
      Q => \^s_axi_bid\(0),
      R => SR(0)
    );
axi_bvalid_int_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => axi_bvalid_int_i_2_n_0,
      I2 => BID_FIFO_n_4,
      O => axi_bvalid_int_i_1_n_0
    );
axi_bvalid_int_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFEEEE"
    )
        port map (
      I0 => bvalid_cnt(2),
      I1 => bvalid_cnt(1),
      I2 => s_axi_bready,
      I3 => \^axi_bvalid_int_reg_0\,
      I4 => bvalid_cnt(0),
      O => axi_bvalid_int_i_2_n_0
    );
axi_bvalid_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_bvalid_int_i_1_n_0,
      Q => \^axi_bvalid_int_reg_0\,
      R => '0'
    );
axi_wr_burst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axi_wr_burst_cmb,
      I1 => axi_wr_burst_i_3_n_0,
      I2 => axi_wr_burst,
      O => axi_wr_burst_i_1_n_0
    );
axi_wr_burst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003FFA3000300A3"
    )
        port map (
      I0 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\,
      I1 => s_axi_wlast,
      I2 => wr_data_sm_cs(1),
      I3 => wr_data_sm_cs(0),
      I4 => wr_data_sm_cs(2),
      I5 => s_axi_wvalid,
      O => axi_wr_burst_cmb
    );
axi_wr_burst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"440C400C400C400C"
    )
        port map (
      I0 => wr_data_sm_cs(2),
      I1 => s_axi_wvalid,
      I2 => wr_data_sm_cs(0),
      I3 => wr_data_sm_cs(1),
      I4 => s_axi_wlast,
      I5 => \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_6_n_0\,
      O => axi_wr_burst_i_3_n_0
    );
axi_wr_burst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_wr_burst_i_1_n_0,
      Q => axi_wr_burst,
      R => SR(0)
    );
axi_wready_int_mod_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => axi_wdata_full_cmb,
      O => axi_wready_int_mod_i_1_n_0
    );
axi_wready_int_mod_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_wready_int_mod_i_1_n_0,
      Q => \^s_axi_wready\,
      R => '0'
    );
bid_gets_fifo_load_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => bid_gets_fifo_load,
      Q => bid_gets_fifo_load_d1,
      R => SR(0)
    );
\bvalid_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A6A6A6A95959555"
    )
        port map (
      I0 => BID_FIFO_n_4,
      I1 => \^axi_bvalid_int_reg_0\,
      I2 => s_axi_bready,
      I3 => bvalid_cnt(1),
      I4 => bvalid_cnt(2),
      I5 => bvalid_cnt(0),
      O => \bvalid_cnt[0]_i_1_n_0\
    );
\bvalid_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A4F0F0F0F05A5A5A"
    )
        port map (
      I0 => bvalid_cnt(0),
      I1 => bvalid_cnt(2),
      I2 => bvalid_cnt(1),
      I3 => s_axi_bready,
      I4 => \^axi_bvalid_int_reg_0\,
      I5 => BID_FIFO_n_4,
      O => \bvalid_cnt[1]_i_1_n_0\
    );
\bvalid_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C8CCCCCCCC6C6C6C"
    )
        port map (
      I0 => bvalid_cnt(0),
      I1 => bvalid_cnt(2),
      I2 => bvalid_cnt(1),
      I3 => s_axi_bready,
      I4 => \^axi_bvalid_int_reg_0\,
      I5 => BID_FIFO_n_4,
      O => \bvalid_cnt[2]_i_1_n_0\
    );
\bvalid_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bvalid_cnt[0]_i_1_n_0\,
      Q => bvalid_cnt(0),
      R => SR(0)
    );
\bvalid_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bvalid_cnt[1]_i_1_n_0\,
      Q => bvalid_cnt(1),
      R => SR(0)
    );
\bvalid_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bvalid_cnt[2]_i_1_n_0\,
      Q => bvalid_cnt(2),
      R => SR(0)
    );
curr_awlen_reg_1_or_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => curr_awlen_reg_1_or_2_i_2_n_0,
      I1 => curr_awlen_reg_1_or_2_i_3_n_0,
      I2 => curr_awlen_reg_1_or_2_i_4_n_0,
      I3 => I_WRAP_BRST_n_25,
      I4 => I_WRAP_BRST_n_19,
      I5 => I_WRAP_BRST_n_20,
      O => curr_awlen_reg_1_or_20
    );
curr_awlen_reg_1_or_2_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFA00CCCCFA00"
    )
        port map (
      I0 => s_axi_awlen(5),
      I1 => axi_awlen_pipe(5),
      I2 => s_axi_awlen(6),
      I3 => s_axi_awvalid,
      I4 => axi_awaddr_full,
      I5 => axi_awlen_pipe(6),
      O => curr_awlen_reg_1_or_2_i_2_n_0
    );
curr_awlen_reg_1_or_2_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4777"
    )
        port map (
      I0 => axi_awlen_pipe(7),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(7),
      O => curr_awlen_reg_1_or_2_i_3_n_0
    );
curr_awlen_reg_1_or_2_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => axi_awlen_pipe(4),
      I1 => axi_awaddr_full,
      I2 => s_axi_awvalid,
      I3 => s_axi_awlen(4),
      O => curr_awlen_reg_1_or_2_i_4_n_0
    );
curr_awlen_reg_1_or_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bram_addr_ld_en,
      D => curr_awlen_reg_1_or_20,
      Q => curr_awlen_reg_1_or_2,
      R => SR(0)
    );
curr_fixed_burst_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => s_axi_awburst(0),
      I1 => axi_awburst_pipe(0),
      I2 => s_axi_awburst(1),
      I3 => axi_awaddr_full,
      I4 => axi_awburst_pipe(1),
      O => curr_fixed_burst
    );
curr_fixed_burst_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_WRAP_BRST_n_2,
      Q => curr_fixed_burst_reg,
      R => '0'
    );
curr_wrap_burst_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000ACC0A"
    )
        port map (
      I0 => s_axi_awburst(1),
      I1 => axi_awburst_pipe(1),
      I2 => s_axi_awburst(0),
      I3 => axi_awaddr_full,
      I4 => axi_awburst_pipe(0),
      O => curr_wrap_burst
    );
curr_wrap_burst_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_WRAP_BRST_n_1,
      Q => curr_wrap_burst_reg,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 12;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 12;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 8;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 8;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "common_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "no_ecc";
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "true";
  attribute MEMORY_PRIMITIVE : string;
  attribute MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "blockram";
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 262144;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute P_CLOCKING_MODE : integer;
  attribute P_CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute P_MEMORY_OPTIMIZATION : integer;
  attribute P_MEMORY_OPTIMIZATION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 1;
  attribute P_MEMORY_PRIMITIVE : integer;
  attribute P_MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 2;
  attribute P_WAKEUP_TIME : integer;
  attribute P_WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute P_WRITE_MODE_A : integer;
  attribute P_WRITE_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute P_WRITE_MODE_B : integer;
  attribute P_WRITE_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 64;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 64;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 1;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 1;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 1;
  attribute WAKEUP_TIME : string;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "disable_sleep";
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 64;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is 64;
  attribute WRITE_MODE_A : string;
  attribute WRITE_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "write_first";
  attribute WRITE_MODE_B : string;
  attribute WRITE_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "write_first";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram : entity is "TRUE";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_dbiterra_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_dbiterrb_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_sbiterra_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_sbiterrb_UNCONNECTED : STD_LOGIC;
  attribute ADDR_WIDTH_A of xpm_memory_base_inst : label is 12;
  attribute ADDR_WIDTH_B of xpm_memory_base_inst : label is 12;
  attribute AUTO_SLEEP_TIME of xpm_memory_base_inst : label is 0;
  attribute BYTE_WRITE_WIDTH_A of xpm_memory_base_inst : label is 8;
  attribute BYTE_WRITE_WIDTH_B of xpm_memory_base_inst : label is 8;
  attribute CASCADE_HEIGHT of xpm_memory_base_inst : label is 0;
  attribute CLOCKING_MODE_integer : integer;
  attribute CLOCKING_MODE_integer of xpm_memory_base_inst : label is 0;
  attribute ECC_MODE_integer : integer;
  attribute ECC_MODE_integer of xpm_memory_base_inst : label is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of xpm_memory_base_inst : label is 0;
  attribute \MEM.ADDRESS_SPACE\ : boolean;
  attribute \MEM.ADDRESS_SPACE\ of xpm_memory_base_inst : label is std.standard.true;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ : integer;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ of xpm_memory_base_inst : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ of xpm_memory_base_inst : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ of xpm_memory_base_inst : label is 63;
  attribute \MEM.ADDRESS_SPACE_END\ : integer;
  attribute \MEM.ADDRESS_SPACE_END\ of xpm_memory_base_inst : label is 4095;
  attribute \MEM.CORE_MEMORY_WIDTH\ : integer;
  attribute \MEM.CORE_MEMORY_WIDTH\ of xpm_memory_base_inst : label is 64;
  attribute MEMORY_INIT_FILE of xpm_memory_base_inst : label is "none";
  attribute MEMORY_INIT_PARAM of xpm_memory_base_inst : label is "";
  attribute MEMORY_OPTIMIZATION of xpm_memory_base_inst : label is "true";
  attribute MEMORY_PRIMITIVE_integer : integer;
  attribute MEMORY_PRIMITIVE_integer of xpm_memory_base_inst : label is 2;
  attribute MEMORY_SIZE of xpm_memory_base_inst : label is 262144;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of xpm_memory_base_inst : label is 2;
  attribute MESSAGE_CONTROL of xpm_memory_base_inst : label is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of xpm_memory_base_inst : label is 0;
  attribute P_ECC_MODE_string : string;
  attribute P_ECC_MODE_string of xpm_memory_base_inst : label is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of xpm_memory_base_inst : label is 1;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of xpm_memory_base_inst : label is 1;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of xpm_memory_base_inst : label is 4096;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of xpm_memory_base_inst : label is "yes";
  attribute P_MEMORY_PRIMITIVE_string : string;
  attribute P_MEMORY_PRIMITIVE_string of xpm_memory_base_inst : label is "block";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of xpm_memory_base_inst : label is 64;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of xpm_memory_base_inst : label is 64;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of xpm_memory_base_inst : label is 64;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of xpm_memory_base_inst : label is 64;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of xpm_memory_base_inst : label is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of xpm_memory_base_inst : label is 64;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of xpm_memory_base_inst : label is 8;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of xpm_memory_base_inst : label is 8;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of xpm_memory_base_inst : label is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of xpm_memory_base_inst : label is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of xpm_memory_base_inst : label is 12;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of xpm_memory_base_inst : label is 12;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of xpm_memory_base_inst : label is 12;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of xpm_memory_base_inst : label is 12;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of xpm_memory_base_inst : label is 8;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of xpm_memory_base_inst : label is 8;
  attribute READ_DATA_WIDTH_A of xpm_memory_base_inst : label is 64;
  attribute READ_DATA_WIDTH_B of xpm_memory_base_inst : label is 64;
  attribute READ_LATENCY_A of xpm_memory_base_inst : label is 1;
  attribute READ_LATENCY_B of xpm_memory_base_inst : label is 1;
  attribute READ_RESET_VALUE_A of xpm_memory_base_inst : label is "0";
  attribute READ_RESET_VALUE_B of xpm_memory_base_inst : label is "0";
  attribute RST_MODE_A of xpm_memory_base_inst : label is "SYNC";
  attribute RST_MODE_B of xpm_memory_base_inst : label is "SYNC";
  attribute SIM_ASSERT_CHK of xpm_memory_base_inst : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT of xpm_memory_base_inst : label is 0;
  attribute USE_MEM_INIT of xpm_memory_base_inst : label is 1;
  attribute VERSION : integer;
  attribute VERSION of xpm_memory_base_inst : label is 0;
  attribute WAKEUP_TIME_integer : integer;
  attribute WAKEUP_TIME_integer of xpm_memory_base_inst : label is 0;
  attribute WRITE_DATA_WIDTH_A of xpm_memory_base_inst : label is 64;
  attribute WRITE_DATA_WIDTH_B of xpm_memory_base_inst : label is 64;
  attribute WRITE_MODE_A_integer : integer;
  attribute WRITE_MODE_A_integer of xpm_memory_base_inst : label is 0;
  attribute WRITE_MODE_B_integer : integer;
  attribute WRITE_MODE_B_integer of xpm_memory_base_inst : label is 0;
  attribute XPM_MODULE of xpm_memory_base_inst : label is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of xpm_memory_base_inst : label is 64;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of xpm_memory_base_inst : label is 64;
begin
  dbiterra <= \<const0>\;
  dbiterrb <= \<const0>\;
  sbiterra <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
xpm_memory_base_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      addrb(11 downto 0) => addrb(11 downto 0),
      clka => clka,
      clkb => '0',
      dbiterra => NLW_xpm_memory_base_inst_dbiterra_UNCONNECTED,
      dbiterrb => NLW_xpm_memory_base_inst_dbiterrb_UNCONNECTED,
      dina(63 downto 0) => dina(63 downto 0),
      dinb(63 downto 0) => dinb(63 downto 0),
      douta(63 downto 0) => douta(63 downto 0),
      doutb(63 downto 0) => doutb(63 downto 0),
      ena => ena,
      enb => enb,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '0',
      regceb => '0',
      rsta => rsta,
      rstb => rstb,
      sbiterra => NLW_xpm_memory_base_inst_sbiterra_UNCONNECTED,
      sbiterrb => NLW_xpm_memory_base_inst_sbiterrb_UNCONNECTED,
      sleep => sleep,
      wea(7 downto 0) => wea(7 downto 0),
      web(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi is
  port (
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\ : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_aresetn_0 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    axi_bvalid_int_reg : out STD_LOGIC;
    BRAM_En_A : out STD_LOGIC;
    \GEN_WR_NO_ECC.bram_we_int_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BRAM_WrData_A : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    enb : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_wlast : in STD_LOGIC;
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi is
  signal I_WR_CHNL_n_69 : STD_LOGIC;
  signal axi_aresetn_d3 : STD_LOGIC;
  signal axi_aresetn_re_reg : STD_LOGIC;
  signal \^s_axi_aresetn_0\ : STD_LOGIC;
begin
  s_axi_aresetn_0 <= \^s_axi_aresetn_0\;
I_RD_CHNL: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl
     port map (
      D(63 downto 0) => D(63 downto 0),
      \GEN_NO_RD_CMD_OPT.GEN_AR_DUAL.ar_active_reg_0\ => I_WR_CHNL_n_69,
      \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg_0\ => \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\,
      \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg_0\ => \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\,
      Q(11 downto 0) => Q(11 downto 0),
      SR(0) => \^s_axi_aresetn_0\,
      axi_aresetn_d3 => axi_aresetn_d3,
      axi_aresetn_re_reg => axi_aresetn_re_reg,
      enb => enb,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(14 downto 0) => s_axi_araddr(14 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_rdata(63 downto 0) => s_axi_rdata(63 downto 0),
      s_axi_rid(0) => s_axi_rid(0),
      s_axi_rready => s_axi_rready
    );
I_WR_CHNL: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl
     port map (
      BRAM_En_A => BRAM_En_A,
      BRAM_WrData_A(63 downto 0) => BRAM_WrData_A(63 downto 0),
      \GEN_AWREADY.axi_aresetn_d3_reg_0\ => I_WR_CHNL_n_69,
      \GEN_WR_NO_ECC.bram_we_int_reg[7]_0\(7 downto 0) => \GEN_WR_NO_ECC.bram_we_int_reg[7]\(7 downto 0),
      Q(11 downto 0) => \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\(11 downto 0),
      SR(0) => \^s_axi_aresetn_0\,
      axi_aresetn_d3 => axi_aresetn_d3,
      axi_aresetn_re_reg => axi_aresetn_re_reg,
      axi_bvalid_int_reg_0 => axi_bvalid_int_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_awaddr(14 downto 0) => s_axi_awaddr(14 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_wdata(63 downto 0) => s_axi_wdata(63 downto 0),
      s_axi_wlast => s_axi_wlast,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(7 downto 0) => s_axi_wstrb(7 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top is
  port (
    \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ : out STD_LOGIC;
    \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\ : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    axi_bvalid_int_reg : out STD_LOGIC;
    BRAM_En_A : out STD_LOGIC;
    \GEN_WR_NO_ECC.bram_we_int_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BRAM_WrData_A : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    enb : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_wlast : in STD_LOGIC;
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top is
begin
\GEN_AXI4.I_FULL_AXI\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi
     port map (
      BRAM_En_A => BRAM_En_A,
      BRAM_WrData_A(63 downto 0) => BRAM_WrData_A(63 downto 0),
      D(63 downto 0) => D(63 downto 0),
      \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\(11 downto 0) => \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\(11 downto 0),
      \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\ => \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\,
      \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ => \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\,
      \GEN_WR_NO_ECC.bram_we_int_reg[7]\(7 downto 0) => \GEN_WR_NO_ECC.bram_we_int_reg[7]\(7 downto 0),
      Q(11 downto 0) => Q(11 downto 0),
      axi_bvalid_int_reg => axi_bvalid_int_reg,
      enb => enb,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(14 downto 0) => s_axi_araddr(14 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aresetn_0 => SR(0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(14 downto 0) => s_axi_awaddr(14 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_rdata(63 downto 0) => s_axi_rdata(63 downto 0),
      s_axi_rid(0) => s_axi_rid(0),
      s_axi_rready => s_axi_rready,
      s_axi_wdata(63 downto 0) => s_axi_wdata(63 downto 0),
      s_axi_wlast => s_axi_wlast,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(7 downto 0) => s_axi_wstrb(7 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    ecc_interrupt : out STD_LOGIC;
    ecc_ue : out STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_ctrl_awvalid : in STD_LOGIC;
    s_axi_ctrl_awready : out STD_LOGIC;
    s_axi_ctrl_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ctrl_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ctrl_wvalid : in STD_LOGIC;
    s_axi_ctrl_wready : out STD_LOGIC;
    s_axi_ctrl_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ctrl_bvalid : out STD_LOGIC;
    s_axi_ctrl_bready : in STD_LOGIC;
    s_axi_ctrl_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ctrl_arvalid : in STD_LOGIC;
    s_axi_ctrl_arready : out STD_LOGIC;
    s_axi_ctrl_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ctrl_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ctrl_rvalid : out STD_LOGIC;
    s_axi_ctrl_rready : in STD_LOGIC;
    bram_rst_a : out STD_LOGIC;
    bram_clk_a : out STD_LOGIC;
    bram_en_a : out STD_LOGIC;
    bram_we_a : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bram_addr_a : out STD_LOGIC_VECTOR ( 14 downto 0 );
    bram_wrdata_a : out STD_LOGIC_VECTOR ( 63 downto 0 );
    bram_rddata_a : in STD_LOGIC_VECTOR ( 63 downto 0 );
    bram_rst_b : out STD_LOGIC;
    bram_clk_b : out STD_LOGIC;
    bram_en_b : out STD_LOGIC;
    bram_we_b : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bram_addr_b : out STD_LOGIC_VECTOR ( 14 downto 0 );
    bram_wrdata_b : out STD_LOGIC_VECTOR ( 63 downto 0 );
    bram_rddata_b : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute C_BRAM_ADDR_WIDTH : integer;
  attribute C_BRAM_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 12;
  attribute C_BRAM_INST_MODE : string;
  attribute C_BRAM_INST_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is "INTERNAL";
  attribute C_ECC : integer;
  attribute C_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 0;
  attribute C_ECC_ONOFF_RESET_VALUE : integer;
  attribute C_ECC_ONOFF_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 0;
  attribute C_ECC_TYPE : integer;
  attribute C_ECC_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is "virtex7";
  attribute C_FAULT_INJECT : integer;
  attribute C_FAULT_INJECT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 0;
  attribute C_MEMORY_DEPTH : integer;
  attribute C_MEMORY_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 4096;
  attribute C_RD_CMD_OPTIMIZATION : integer;
  attribute C_RD_CMD_OPTIMIZATION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 0;
  attribute C_READ_LATENCY : integer;
  attribute C_READ_LATENCY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 1;
  attribute C_SINGLE_PORT_BRAM : integer;
  attribute C_SINGLE_PORT_BRAM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 0;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 15;
  attribute C_S_AXI_CTRL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CTRL_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 32;
  attribute C_S_AXI_CTRL_DATA_WIDTH : integer;
  attribute C_S_AXI_CTRL_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 32;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 64;
  attribute C_S_AXI_ID_WIDTH : integer;
  attribute C_S_AXI_ID_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 1;
  attribute C_S_AXI_PROTOCOL : string;
  attribute C_S_AXI_PROTOCOL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is "AXI4";
  attribute C_S_AXI_SUPPORTS_NARROW_BURST : integer;
  attribute C_S_AXI_SUPPORTS_NARROW_BURST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is 1;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl is
  signal \<const0>\ : STD_LOGIC;
  signal douta_bram_douta_i : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal doutb_bram_doutb_i : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal p_1_out : STD_LOGIC_VECTOR ( 14 downto 3 );
  signal p_3_out : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal p_6_out : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal p_7_out : STD_LOGIC_VECTOR ( 14 downto 3 );
  signal p_8_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_9_out : STD_LOGIC;
  signal \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_dbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_dbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_sbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_sbiterrb_UNCONNECTED\ : STD_LOGIC;
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 12;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 12;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 8;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 8;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "common_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "no_ecc";
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "true";
  attribute MEMORY_PRIMITIVE : string;
  attribute MEMORY_PRIMITIVE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "blockram";
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 262144;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute P_CLOCKING_MODE : integer;
  attribute P_CLOCKING_MODE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute P_MEMORY_OPTIMIZATION : integer;
  attribute P_MEMORY_OPTIMIZATION of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 1;
  attribute P_MEMORY_PRIMITIVE : integer;
  attribute P_MEMORY_PRIMITIVE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 2;
  attribute P_WAKEUP_TIME : integer;
  attribute P_WAKEUP_TIME of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute P_WRITE_MODE_A : integer;
  attribute P_WRITE_MODE_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute P_WRITE_MODE_B : integer;
  attribute P_WRITE_MODE_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 64;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 64;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 1;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 1;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 1;
  attribute WAKEUP_TIME : string;
  attribute WAKEUP_TIME of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "disable_sleep";
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 64;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is 64;
  attribute WRITE_MODE_A : string;
  attribute WRITE_MODE_A of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "write_first";
  attribute WRITE_MODE_B : string;
  attribute WRITE_MODE_B of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "write_first";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\ : label is "TRUE";
begin
  bram_addr_a(14) <= \<const0>\;
  bram_addr_a(13) <= \<const0>\;
  bram_addr_a(12) <= \<const0>\;
  bram_addr_a(11) <= \<const0>\;
  bram_addr_a(10) <= \<const0>\;
  bram_addr_a(9) <= \<const0>\;
  bram_addr_a(8) <= \<const0>\;
  bram_addr_a(7) <= \<const0>\;
  bram_addr_a(6) <= \<const0>\;
  bram_addr_a(5) <= \<const0>\;
  bram_addr_a(4) <= \<const0>\;
  bram_addr_a(3) <= \<const0>\;
  bram_addr_a(2) <= \<const0>\;
  bram_addr_a(1) <= \<const0>\;
  bram_addr_a(0) <= \<const0>\;
  bram_addr_b(14) <= \<const0>\;
  bram_addr_b(13) <= \<const0>\;
  bram_addr_b(12) <= \<const0>\;
  bram_addr_b(11) <= \<const0>\;
  bram_addr_b(10) <= \<const0>\;
  bram_addr_b(9) <= \<const0>\;
  bram_addr_b(8) <= \<const0>\;
  bram_addr_b(7) <= \<const0>\;
  bram_addr_b(6) <= \<const0>\;
  bram_addr_b(5) <= \<const0>\;
  bram_addr_b(4) <= \<const0>\;
  bram_addr_b(3) <= \<const0>\;
  bram_addr_b(2) <= \<const0>\;
  bram_addr_b(1) <= \<const0>\;
  bram_addr_b(0) <= \<const0>\;
  bram_clk_a <= \<const0>\;
  bram_clk_b <= \<const0>\;
  bram_en_a <= \<const0>\;
  bram_en_b <= \<const0>\;
  bram_rst_a <= \<const0>\;
  bram_rst_b <= \<const0>\;
  bram_we_a(7) <= \<const0>\;
  bram_we_a(6) <= \<const0>\;
  bram_we_a(5) <= \<const0>\;
  bram_we_a(4) <= \<const0>\;
  bram_we_a(3) <= \<const0>\;
  bram_we_a(2) <= \<const0>\;
  bram_we_a(1) <= \<const0>\;
  bram_we_a(0) <= \<const0>\;
  bram_we_b(7) <= \<const0>\;
  bram_we_b(6) <= \<const0>\;
  bram_we_b(5) <= \<const0>\;
  bram_we_b(4) <= \<const0>\;
  bram_we_b(3) <= \<const0>\;
  bram_we_b(2) <= \<const0>\;
  bram_we_b(1) <= \<const0>\;
  bram_we_b(0) <= \<const0>\;
  bram_wrdata_a(63) <= \<const0>\;
  bram_wrdata_a(62) <= \<const0>\;
  bram_wrdata_a(61) <= \<const0>\;
  bram_wrdata_a(60) <= \<const0>\;
  bram_wrdata_a(59) <= \<const0>\;
  bram_wrdata_a(58) <= \<const0>\;
  bram_wrdata_a(57) <= \<const0>\;
  bram_wrdata_a(56) <= \<const0>\;
  bram_wrdata_a(55) <= \<const0>\;
  bram_wrdata_a(54) <= \<const0>\;
  bram_wrdata_a(53) <= \<const0>\;
  bram_wrdata_a(52) <= \<const0>\;
  bram_wrdata_a(51) <= \<const0>\;
  bram_wrdata_a(50) <= \<const0>\;
  bram_wrdata_a(49) <= \<const0>\;
  bram_wrdata_a(48) <= \<const0>\;
  bram_wrdata_a(47) <= \<const0>\;
  bram_wrdata_a(46) <= \<const0>\;
  bram_wrdata_a(45) <= \<const0>\;
  bram_wrdata_a(44) <= \<const0>\;
  bram_wrdata_a(43) <= \<const0>\;
  bram_wrdata_a(42) <= \<const0>\;
  bram_wrdata_a(41) <= \<const0>\;
  bram_wrdata_a(40) <= \<const0>\;
  bram_wrdata_a(39) <= \<const0>\;
  bram_wrdata_a(38) <= \<const0>\;
  bram_wrdata_a(37) <= \<const0>\;
  bram_wrdata_a(36) <= \<const0>\;
  bram_wrdata_a(35) <= \<const0>\;
  bram_wrdata_a(34) <= \<const0>\;
  bram_wrdata_a(33) <= \<const0>\;
  bram_wrdata_a(32) <= \<const0>\;
  bram_wrdata_a(31) <= \<const0>\;
  bram_wrdata_a(30) <= \<const0>\;
  bram_wrdata_a(29) <= \<const0>\;
  bram_wrdata_a(28) <= \<const0>\;
  bram_wrdata_a(27) <= \<const0>\;
  bram_wrdata_a(26) <= \<const0>\;
  bram_wrdata_a(25) <= \<const0>\;
  bram_wrdata_a(24) <= \<const0>\;
  bram_wrdata_a(23) <= \<const0>\;
  bram_wrdata_a(22) <= \<const0>\;
  bram_wrdata_a(21) <= \<const0>\;
  bram_wrdata_a(20) <= \<const0>\;
  bram_wrdata_a(19) <= \<const0>\;
  bram_wrdata_a(18) <= \<const0>\;
  bram_wrdata_a(17) <= \<const0>\;
  bram_wrdata_a(16) <= \<const0>\;
  bram_wrdata_a(15) <= \<const0>\;
  bram_wrdata_a(14) <= \<const0>\;
  bram_wrdata_a(13) <= \<const0>\;
  bram_wrdata_a(12) <= \<const0>\;
  bram_wrdata_a(11) <= \<const0>\;
  bram_wrdata_a(10) <= \<const0>\;
  bram_wrdata_a(9) <= \<const0>\;
  bram_wrdata_a(8) <= \<const0>\;
  bram_wrdata_a(7) <= \<const0>\;
  bram_wrdata_a(6) <= \<const0>\;
  bram_wrdata_a(5) <= \<const0>\;
  bram_wrdata_a(4) <= \<const0>\;
  bram_wrdata_a(3) <= \<const0>\;
  bram_wrdata_a(2) <= \<const0>\;
  bram_wrdata_a(1) <= \<const0>\;
  bram_wrdata_a(0) <= \<const0>\;
  bram_wrdata_b(63) <= \<const0>\;
  bram_wrdata_b(62) <= \<const0>\;
  bram_wrdata_b(61) <= \<const0>\;
  bram_wrdata_b(60) <= \<const0>\;
  bram_wrdata_b(59) <= \<const0>\;
  bram_wrdata_b(58) <= \<const0>\;
  bram_wrdata_b(57) <= \<const0>\;
  bram_wrdata_b(56) <= \<const0>\;
  bram_wrdata_b(55) <= \<const0>\;
  bram_wrdata_b(54) <= \<const0>\;
  bram_wrdata_b(53) <= \<const0>\;
  bram_wrdata_b(52) <= \<const0>\;
  bram_wrdata_b(51) <= \<const0>\;
  bram_wrdata_b(50) <= \<const0>\;
  bram_wrdata_b(49) <= \<const0>\;
  bram_wrdata_b(48) <= \<const0>\;
  bram_wrdata_b(47) <= \<const0>\;
  bram_wrdata_b(46) <= \<const0>\;
  bram_wrdata_b(45) <= \<const0>\;
  bram_wrdata_b(44) <= \<const0>\;
  bram_wrdata_b(43) <= \<const0>\;
  bram_wrdata_b(42) <= \<const0>\;
  bram_wrdata_b(41) <= \<const0>\;
  bram_wrdata_b(40) <= \<const0>\;
  bram_wrdata_b(39) <= \<const0>\;
  bram_wrdata_b(38) <= \<const0>\;
  bram_wrdata_b(37) <= \<const0>\;
  bram_wrdata_b(36) <= \<const0>\;
  bram_wrdata_b(35) <= \<const0>\;
  bram_wrdata_b(34) <= \<const0>\;
  bram_wrdata_b(33) <= \<const0>\;
  bram_wrdata_b(32) <= \<const0>\;
  bram_wrdata_b(31) <= \<const0>\;
  bram_wrdata_b(30) <= \<const0>\;
  bram_wrdata_b(29) <= \<const0>\;
  bram_wrdata_b(28) <= \<const0>\;
  bram_wrdata_b(27) <= \<const0>\;
  bram_wrdata_b(26) <= \<const0>\;
  bram_wrdata_b(25) <= \<const0>\;
  bram_wrdata_b(24) <= \<const0>\;
  bram_wrdata_b(23) <= \<const0>\;
  bram_wrdata_b(22) <= \<const0>\;
  bram_wrdata_b(21) <= \<const0>\;
  bram_wrdata_b(20) <= \<const0>\;
  bram_wrdata_b(19) <= \<const0>\;
  bram_wrdata_b(18) <= \<const0>\;
  bram_wrdata_b(17) <= \<const0>\;
  bram_wrdata_b(16) <= \<const0>\;
  bram_wrdata_b(15) <= \<const0>\;
  bram_wrdata_b(14) <= \<const0>\;
  bram_wrdata_b(13) <= \<const0>\;
  bram_wrdata_b(12) <= \<const0>\;
  bram_wrdata_b(11) <= \<const0>\;
  bram_wrdata_b(10) <= \<const0>\;
  bram_wrdata_b(9) <= \<const0>\;
  bram_wrdata_b(8) <= \<const0>\;
  bram_wrdata_b(7) <= \<const0>\;
  bram_wrdata_b(6) <= \<const0>\;
  bram_wrdata_b(5) <= \<const0>\;
  bram_wrdata_b(4) <= \<const0>\;
  bram_wrdata_b(3) <= \<const0>\;
  bram_wrdata_b(2) <= \<const0>\;
  bram_wrdata_b(1) <= \<const0>\;
  bram_wrdata_b(0) <= \<const0>\;
  ecc_interrupt <= \<const0>\;
  ecc_ue <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_ctrl_arready <= \<const0>\;
  s_axi_ctrl_awready <= \<const0>\;
  s_axi_ctrl_bresp(1) <= \<const0>\;
  s_axi_ctrl_bresp(0) <= \<const0>\;
  s_axi_ctrl_bvalid <= \<const0>\;
  s_axi_ctrl_rdata(31) <= \<const0>\;
  s_axi_ctrl_rdata(30) <= \<const0>\;
  s_axi_ctrl_rdata(29) <= \<const0>\;
  s_axi_ctrl_rdata(28) <= \<const0>\;
  s_axi_ctrl_rdata(27) <= \<const0>\;
  s_axi_ctrl_rdata(26) <= \<const0>\;
  s_axi_ctrl_rdata(25) <= \<const0>\;
  s_axi_ctrl_rdata(24) <= \<const0>\;
  s_axi_ctrl_rdata(23) <= \<const0>\;
  s_axi_ctrl_rdata(22) <= \<const0>\;
  s_axi_ctrl_rdata(21) <= \<const0>\;
  s_axi_ctrl_rdata(20) <= \<const0>\;
  s_axi_ctrl_rdata(19) <= \<const0>\;
  s_axi_ctrl_rdata(18) <= \<const0>\;
  s_axi_ctrl_rdata(17) <= \<const0>\;
  s_axi_ctrl_rdata(16) <= \<const0>\;
  s_axi_ctrl_rdata(15) <= \<const0>\;
  s_axi_ctrl_rdata(14) <= \<const0>\;
  s_axi_ctrl_rdata(13) <= \<const0>\;
  s_axi_ctrl_rdata(12) <= \<const0>\;
  s_axi_ctrl_rdata(11) <= \<const0>\;
  s_axi_ctrl_rdata(10) <= \<const0>\;
  s_axi_ctrl_rdata(9) <= \<const0>\;
  s_axi_ctrl_rdata(8) <= \<const0>\;
  s_axi_ctrl_rdata(7) <= \<const0>\;
  s_axi_ctrl_rdata(6) <= \<const0>\;
  s_axi_ctrl_rdata(5) <= \<const0>\;
  s_axi_ctrl_rdata(4) <= \<const0>\;
  s_axi_ctrl_rdata(3) <= \<const0>\;
  s_axi_ctrl_rdata(2) <= \<const0>\;
  s_axi_ctrl_rdata(1) <= \<const0>\;
  s_axi_ctrl_rdata(0) <= \<const0>\;
  s_axi_ctrl_rresp(1) <= \<const0>\;
  s_axi_ctrl_rresp(0) <= \<const0>\;
  s_axi_ctrl_rvalid <= \<const0>\;
  s_axi_ctrl_wready <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gint_inst.abcv4_0_int_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top
     port map (
      BRAM_En_A => p_9_out,
      BRAM_WrData_A(63 downto 0) => p_6_out(63 downto 0),
      D(63 downto 0) => doutb_bram_doutb_i(63 downto 0),
      \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14]\(11 downto 0) => p_7_out(14 downto 3),
      \GEN_NO_RD_CMD_OPT.axi_rlast_int_reg\ => s_axi_rlast,
      \GEN_NO_RD_CMD_OPT.axi_rvalid_int_reg\ => s_axi_rvalid,
      \GEN_WR_NO_ECC.bram_we_int_reg[7]\(7 downto 0) => p_8_out(7 downto 0),
      Q(11 downto 0) => p_1_out(14 downto 3),
      SR(0) => p_5_out,
      axi_bvalid_int_reg => s_axi_bvalid,
      enb => p_3_out,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(14 downto 0) => s_axi_araddr(14 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(14 downto 0) => s_axi_awaddr(14 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_rdata(63 downto 0) => s_axi_rdata(63 downto 0),
      s_axi_rid(0) => s_axi_rid(0),
      s_axi_rready => s_axi_rready,
      s_axi_wdata(63 downto 0) => s_axi_wdata(63 downto 0),
      s_axi_wlast => s_axi_wlast,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(7 downto 0) => s_axi_wstrb(7 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
\gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_tdpram
     port map (
      addra(11 downto 0) => p_7_out(14 downto 3),
      addrb(11 downto 0) => p_1_out(14 downto 3),
      clka => s_axi_aclk,
      clkb => s_axi_aclk,
      dbiterra => \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_dbiterra_UNCONNECTED\,
      dbiterrb => \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_dbiterrb_UNCONNECTED\,
      dina(63 downto 0) => p_6_out(63 downto 0),
      dinb(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      douta(63 downto 0) => douta_bram_douta_i(63 downto 0),
      doutb(63 downto 0) => doutb_bram_doutb_i(63 downto 0),
      ena => p_9_out,
      enb => p_3_out,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '1',
      regceb => '1',
      rsta => p_5_out,
      rstb => p_5_out,
      sbiterra => \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_sbiterra_UNCONNECTED\,
      sbiterrb => \NLW_gint_inst.xpm_tdpram_mem_gen.xpm_memory_inst_sbiterrb_UNCONNECTED\,
      sleep => '0',
      wea(7 downto 0) => p_8_out(7 downto 0),
      web(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 14 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_bram_ctrl_0,axi_bram_ctrl,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_bram_ctrl,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal NLW_U0_bram_clk_a_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bram_clk_b_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bram_en_a_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bram_en_b_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bram_rst_a_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bram_rst_b_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_ecc_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_ecc_ue_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_ctrl_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_ctrl_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_ctrl_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bram_addr_a_UNCONNECTED : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal NLW_U0_bram_addr_b_UNCONNECTED : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal NLW_U0_bram_we_a_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_bram_we_b_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_bram_wrdata_a_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_bram_wrdata_b_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_ctrl_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ctrl_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_s_axi_ctrl_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_BRAM_ADDR_WIDTH : integer;
  attribute C_BRAM_ADDR_WIDTH of U0 : label is 12;
  attribute C_BRAM_INST_MODE : string;
  attribute C_BRAM_INST_MODE of U0 : label is "INTERNAL";
  attribute C_ECC : integer;
  attribute C_ECC of U0 : label is 0;
  attribute C_ECC_ONOFF_RESET_VALUE : integer;
  attribute C_ECC_ONOFF_RESET_VALUE of U0 : label is 0;
  attribute C_ECC_TYPE : integer;
  attribute C_ECC_TYPE of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtex7";
  attribute C_FAULT_INJECT : integer;
  attribute C_FAULT_INJECT of U0 : label is 0;
  attribute C_MEMORY_DEPTH : integer;
  attribute C_MEMORY_DEPTH of U0 : label is 4096;
  attribute C_RD_CMD_OPTIMIZATION : integer;
  attribute C_RD_CMD_OPTIMIZATION of U0 : label is 0;
  attribute C_READ_LATENCY : integer;
  attribute C_READ_LATENCY of U0 : label is 1;
  attribute C_SINGLE_PORT_BRAM : integer;
  attribute C_SINGLE_PORT_BRAM of U0 : label is 0;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of U0 : label is 15;
  attribute C_S_AXI_CTRL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CTRL_ADDR_WIDTH of U0 : label is 32;
  attribute C_S_AXI_CTRL_DATA_WIDTH : integer;
  attribute C_S_AXI_CTRL_DATA_WIDTH of U0 : label is 32;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_S_AXI_ID_WIDTH : integer;
  attribute C_S_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_S_AXI_PROTOCOL : string;
  attribute C_S_AXI_PROTOCOL of U0 : label is "AXI4";
  attribute C_S_AXI_SUPPORTS_NARROW_BURST : integer;
  attribute C_S_AXI_SUPPORTS_NARROW_BURST of U0 : label is 1;
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 CLKIF CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s_axi_aclk : signal is "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI:S_AXI_CTRL, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 RSTIF RST";
  attribute x_interface_parameter of s_axi_aresetn : signal is "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK";
  attribute x_interface_info of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute x_interface_info of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute x_interface_info of s_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK";
  attribute x_interface_info of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute x_interface_info of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute x_interface_info of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute x_interface_info of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute x_interface_info of s_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI RLAST";
  attribute x_interface_info of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute x_interface_info of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute x_interface_info of s_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI WLAST";
  attribute x_interface_info of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute x_interface_info of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute x_interface_info of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute x_interface_info of s_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARBURST";
  attribute x_interface_info of s_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE";
  attribute x_interface_info of s_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLEN";
  attribute x_interface_info of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute x_interface_info of s_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE";
  attribute x_interface_info of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute x_interface_parameter of s_axi_awaddr : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 15, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWBURST";
  attribute x_interface_info of s_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE";
  attribute x_interface_info of s_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLEN";
  attribute x_interface_info of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute x_interface_info of s_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE";
  attribute x_interface_info of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute x_interface_info of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute x_interface_info of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute x_interface_info of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute x_interface_info of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl
     port map (
      bram_addr_a(14 downto 0) => NLW_U0_bram_addr_a_UNCONNECTED(14 downto 0),
      bram_addr_b(14 downto 0) => NLW_U0_bram_addr_b_UNCONNECTED(14 downto 0),
      bram_clk_a => NLW_U0_bram_clk_a_UNCONNECTED,
      bram_clk_b => NLW_U0_bram_clk_b_UNCONNECTED,
      bram_en_a => NLW_U0_bram_en_a_UNCONNECTED,
      bram_en_b => NLW_U0_bram_en_b_UNCONNECTED,
      bram_rddata_a(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      bram_rddata_b(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      bram_rst_a => NLW_U0_bram_rst_a_UNCONNECTED,
      bram_rst_b => NLW_U0_bram_rst_b_UNCONNECTED,
      bram_we_a(7 downto 0) => NLW_U0_bram_we_a_UNCONNECTED(7 downto 0),
      bram_we_b(7 downto 0) => NLW_U0_bram_we_b_UNCONNECTED(7 downto 0),
      bram_wrdata_a(63 downto 0) => NLW_U0_bram_wrdata_a_UNCONNECTED(63 downto 0),
      bram_wrdata_b(63 downto 0) => NLW_U0_bram_wrdata_b_UNCONNECTED(63 downto 0),
      ecc_interrupt => NLW_U0_ecc_interrupt_UNCONNECTED,
      ecc_ue => NLW_U0_ecc_ue_UNCONNECTED,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(14 downto 0) => s_axi_araddr(14 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arcache(3 downto 0) => s_axi_arcache(3 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arlock => s_axi_arlock,
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(14 downto 0) => s_axi_awaddr(14 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awcache(3 downto 0) => s_axi_awcache(3 downto 0),
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awlock => s_axi_awlock,
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_ctrl_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_ctrl_arready => NLW_U0_s_axi_ctrl_arready_UNCONNECTED,
      s_axi_ctrl_arvalid => '0',
      s_axi_ctrl_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_ctrl_awready => NLW_U0_s_axi_ctrl_awready_UNCONNECTED,
      s_axi_ctrl_awvalid => '0',
      s_axi_ctrl_bready => '0',
      s_axi_ctrl_bresp(1 downto 0) => NLW_U0_s_axi_ctrl_bresp_UNCONNECTED(1 downto 0),
      s_axi_ctrl_bvalid => NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED,
      s_axi_ctrl_rdata(31 downto 0) => NLW_U0_s_axi_ctrl_rdata_UNCONNECTED(31 downto 0),
      s_axi_ctrl_rready => '0',
      s_axi_ctrl_rresp(1 downto 0) => NLW_U0_s_axi_ctrl_rresp_UNCONNECTED(1 downto 0),
      s_axi_ctrl_rvalid => NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED,
      s_axi_ctrl_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_ctrl_wready => NLW_U0_s_axi_ctrl_wready_UNCONNECTED,
      s_axi_ctrl_wvalid => '0',
      s_axi_rdata(63 downto 0) => s_axi_rdata(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(63 downto 0) => s_axi_wdata(63 downto 0),
      s_axi_wlast => s_axi_wlast,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(7 downto 0) => s_axi_wstrb(7 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
