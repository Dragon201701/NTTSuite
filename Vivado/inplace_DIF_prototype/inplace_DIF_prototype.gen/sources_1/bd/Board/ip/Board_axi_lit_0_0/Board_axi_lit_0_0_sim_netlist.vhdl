-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Thu Jul 14 22:47:20 2022
-- Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/NTT_Xilinx/Vivado/inplace_DIF_prototype/inplace_DIF_prototype.gen/sources_1/bd/Board/ip/Board_axi_lit_0_0/Board_axi_lit_0_0_sim_netlist.vhdl
-- Design      : Board_axi_lit_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku115-flvb2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Board_axi_lit_0_0_axi_lit is
  port (
    RVALID : out STD_LOGIC;
    BVALID : out STD_LOGIC;
    WREADY : out STD_LOGIC;
    AWREADY : out STD_LOGIC;
    RDATA : out STD_LOGIC_VECTOR ( 19 downto 0 );
    p_rsc_dat : out STD_LOGIC_VECTOR ( 31 downto 0 );
    r_rsc_dat : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ARREADY : out STD_LOGIC;
    ARVALID : in STD_LOGIC;
    ACLK : in STD_LOGIC;
    ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    ac_sync_complete : in STD_LOGIC;
    ac_sync_run_rsc_lzin : in STD_LOGIC;
    r_rsc_triosy_lz : in STD_LOGIC;
    p_rsc_triosy_lz : in STD_LOGIC;
    vec_rsc_triosy_0_0_lz : in STD_LOGIC;
    vec_rsc_triosy_0_1_lz : in STD_LOGIC;
    vec_rsc_triosy_0_2_lz : in STD_LOGIC;
    vec_rsc_triosy_0_3_lz : in STD_LOGIC;
    vec_rsc_triosy_0_4_lz : in STD_LOGIC;
    vec_rsc_triosy_0_5_lz : in STD_LOGIC;
    vec_rsc_triosy_0_6_lz : in STD_LOGIC;
    vec_rsc_triosy_0_7_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_2_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_3_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_0_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_1_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_2_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_3_lz : in STD_LOGIC;
    AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AWVALID : in STD_LOGIC;
    WVALID : in STD_LOGIC;
    BREADY : in STD_LOGIC;
    RREADY : in STD_LOGIC;
    WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ARESETN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Board_axi_lit_0_0_axi_lit : entity is "axi_lit";
end Board_axi_lit_0_0_axi_lit;

architecture STRUCTURE of Board_axi_lit_0_0_axi_lit is
  signal \^awready\ : STD_LOGIC;
  signal \^bvalid\ : STD_LOGIC;
  signal \FSM_onehot_wstate[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^rvalid\ : STD_LOGIC;
  signal \^wready\ : STD_LOGIC;
  signal aw_hs : STD_LOGIC;
  signal control_w0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \control_w[0]_i_1_n_0\ : STD_LOGIC;
  signal p0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \p[31]_i_1_n_0\ : STD_LOGIC;
  signal \p[31]_i_3_n_0\ : STD_LOGIC;
  signal \^p_rsc_dat\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal r0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \r[31]_i_1_n_0\ : STD_LOGIC;
  signal \^r_rsc_dat\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal rnext : STD_LOGIC;
  signal waddr : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ARREADY_INST_0 : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[0]\ : label is "WRDATA:010,WRRESP:100,WRIDLE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[1]\ : label is "WRDATA:010,WRRESP:100,WRIDLE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[2]\ : label is "WRDATA:010,WRRESP:100,WRIDLE:001";
  attribute SOFT_HLUTNM of FSM_sequential_rstate_i_1 : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES of FSM_sequential_rstate_reg : label is "RDIDLE:0,RDDATA:1";
  attribute SOFT_HLUTNM of \control_w[0]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \control_w[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \p[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \p[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \p[11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \p[12]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \p[13]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \p[14]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \p[15]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \p[16]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \p[17]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \p[18]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \p[19]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \p[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \p[20]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \p[21]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \p[22]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \p[23]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \p[24]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \p[25]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \p[26]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \p[27]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \p[28]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \p[29]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \p[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \p[30]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \p[31]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \p[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \p[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \p[5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \p[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \p[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \p[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \p[9]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \r[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \r[11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \r[12]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \r[13]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \r[14]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \r[15]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r[16]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \r[17]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \r[18]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \r[19]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \r[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r[20]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \r[21]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \r[22]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \r[23]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \r[24]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \r[25]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \r[26]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \r[27]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \r[28]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \r[29]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \r[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r[30]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \r[31]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \r[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \r[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \r[5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \r[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \r[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \r[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r[9]_i_1\ : label is "soft_lutpair10";
begin
  AWREADY <= \^awready\;
  BVALID <= \^bvalid\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  RVALID <= \^rvalid\;
  WREADY <= \^wready\;
  p_rsc_dat(31 downto 0) <= \^p_rsc_dat\(31 downto 0);
  r_rsc_dat(31 downto 0) <= \^r_rsc_dat\(31 downto 0);
ARREADY_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rvalid\,
      O => ARREADY
    );
\FSM_onehot_wstate[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \^bvalid\,
      I1 => BREADY,
      I2 => AWVALID,
      I3 => \^awready\,
      O => \FSM_onehot_wstate[0]_i_1_n_0\
    );
\FSM_onehot_wstate[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN,
      O => \FSM_onehot_wstate[0]_i_2_n_0\
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => AWVALID,
      I1 => \^awready\,
      I2 => WVALID,
      I3 => \^wready\,
      O => \FSM_onehot_wstate[1]_i_1_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => BREADY,
      I1 => \^bvalid\,
      I2 => WVALID,
      I3 => \^wready\,
      O => \FSM_onehot_wstate[2]_i_1_n_0\
    );
\FSM_onehot_wstate_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => \FSM_onehot_wstate[0]_i_1_n_0\,
      PRE => \FSM_onehot_wstate[0]_i_2_n_0\,
      Q => \^awready\
    );
\FSM_onehot_wstate_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => \FSM_onehot_wstate[1]_i_1_n_0\,
      Q => \^wready\
    );
\FSM_onehot_wstate_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => \FSM_onehot_wstate[2]_i_1_n_0\,
      Q => \^bvalid\
    );
FSM_sequential_rstate_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => RREADY,
      I1 => \^rvalid\,
      I2 => ARVALID,
      O => rnext
    );
FSM_sequential_rstate_reg: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => '1',
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => rnext,
      Q => \^rvalid\
    );
\control_w[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \p[31]_i_3_n_0\,
      I1 => waddr(3),
      I2 => waddr(2),
      I3 => waddr(0),
      I4 => waddr(1),
      O => \control_w[0]_i_1_n_0\
    );
\control_w[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(0),
      I1 => WSTRB(0),
      I2 => \^q\(0),
      O => control_w0(0)
    );
\control_w[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(1),
      I1 => WSTRB(0),
      I2 => \^q\(1),
      O => control_w0(1)
    );
\control_w_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \control_w[0]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => control_w0(0),
      Q => \^q\(0)
    );
\control_w_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \control_w[0]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => control_w0(1),
      Q => \^q\(1)
    );
\p[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(0),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(0),
      O => p0(0)
    );
\p[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(10),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(10),
      O => p0(10)
    );
\p[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(11),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(11),
      O => p0(11)
    );
\p[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(12),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(12),
      O => p0(12)
    );
\p[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(13),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(13),
      O => p0(13)
    );
\p[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(14),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(14),
      O => p0(14)
    );
\p[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(15),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(15),
      O => p0(15)
    );
\p[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(16),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(16),
      O => p0(16)
    );
\p[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(17),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(17),
      O => p0(17)
    );
\p[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(18),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(18),
      O => p0(18)
    );
\p[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(19),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(19),
      O => p0(19)
    );
\p[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(1),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(1),
      O => p0(1)
    );
\p[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(20),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(20),
      O => p0(20)
    );
\p[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(21),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(21),
      O => p0(21)
    );
\p[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(22),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(22),
      O => p0(22)
    );
\p[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(23),
      I1 => WSTRB(2),
      I2 => \^p_rsc_dat\(23),
      O => p0(23)
    );
\p[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(24),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(24),
      O => p0(24)
    );
\p[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(25),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(25),
      O => p0(25)
    );
\p[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(26),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(26),
      O => p0(26)
    );
\p[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(27),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(27),
      O => p0(27)
    );
\p[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(28),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(28),
      O => p0(28)
    );
\p[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(29),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(29),
      O => p0(29)
    );
\p[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(2),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(2),
      O => p0(2)
    );
\p[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(30),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(30),
      O => p0(30)
    );
\p[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \p[31]_i_3_n_0\,
      I1 => waddr(2),
      I2 => waddr(3),
      I3 => waddr(0),
      I4 => waddr(1),
      O => \p[31]_i_1_n_0\
    );
\p[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(31),
      I1 => WSTRB(3),
      I2 => \^p_rsc_dat\(31),
      O => p0(31)
    );
\p[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => WVALID,
      I1 => \^wready\,
      I2 => waddr(4),
      I3 => waddr(5),
      O => \p[31]_i_3_n_0\
    );
\p[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(3),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(3),
      O => p0(3)
    );
\p[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(4),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(4),
      O => p0(4)
    );
\p[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(5),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(5),
      O => p0(5)
    );
\p[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(6),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(6),
      O => p0(6)
    );
\p[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(7),
      I1 => WSTRB(0),
      I2 => \^p_rsc_dat\(7),
      O => p0(7)
    );
\p[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(8),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(8),
      O => p0(8)
    );
\p[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(9),
      I1 => WSTRB(1),
      I2 => \^p_rsc_dat\(9),
      O => p0(9)
    );
\p_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(0),
      Q => \^p_rsc_dat\(0)
    );
\p_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(10),
      Q => \^p_rsc_dat\(10)
    );
\p_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(11),
      Q => \^p_rsc_dat\(11)
    );
\p_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(12),
      Q => \^p_rsc_dat\(12)
    );
\p_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(13),
      Q => \^p_rsc_dat\(13)
    );
\p_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(14),
      Q => \^p_rsc_dat\(14)
    );
\p_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(15),
      Q => \^p_rsc_dat\(15)
    );
\p_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(16),
      Q => \^p_rsc_dat\(16)
    );
\p_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(17),
      Q => \^p_rsc_dat\(17)
    );
\p_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(18),
      Q => \^p_rsc_dat\(18)
    );
\p_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(19),
      Q => \^p_rsc_dat\(19)
    );
\p_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(1),
      Q => \^p_rsc_dat\(1)
    );
\p_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(20),
      Q => \^p_rsc_dat\(20)
    );
\p_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(21),
      Q => \^p_rsc_dat\(21)
    );
\p_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(22),
      Q => \^p_rsc_dat\(22)
    );
\p_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(23),
      Q => \^p_rsc_dat\(23)
    );
\p_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(24),
      Q => \^p_rsc_dat\(24)
    );
\p_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(25),
      Q => \^p_rsc_dat\(25)
    );
\p_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(26),
      Q => \^p_rsc_dat\(26)
    );
\p_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(27),
      Q => \^p_rsc_dat\(27)
    );
\p_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(28),
      Q => \^p_rsc_dat\(28)
    );
\p_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(29),
      Q => \^p_rsc_dat\(29)
    );
\p_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(2),
      Q => \^p_rsc_dat\(2)
    );
\p_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(30),
      Q => \^p_rsc_dat\(30)
    );
\p_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(31),
      Q => \^p_rsc_dat\(31)
    );
\p_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(3),
      Q => \^p_rsc_dat\(3)
    );
\p_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(4),
      Q => \^p_rsc_dat\(4)
    );
\p_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(5),
      Q => \^p_rsc_dat\(5)
    );
\p_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(6),
      Q => \^p_rsc_dat\(6)
    );
\p_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(7),
      Q => \^p_rsc_dat\(7)
    );
\p_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(8),
      Q => \^p_rsc_dat\(8)
    );
\p_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \p[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => p0(9),
      Q => \^p_rsc_dat\(9)
    );
\r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(0),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(0),
      O => r0(0)
    );
\r[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(10),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(10),
      O => r0(10)
    );
\r[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(11),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(11),
      O => r0(11)
    );
\r[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(12),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(12),
      O => r0(12)
    );
\r[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(13),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(13),
      O => r0(13)
    );
\r[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(14),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(14),
      O => r0(14)
    );
\r[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(15),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(15),
      O => r0(15)
    );
\r[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(16),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(16),
      O => r0(16)
    );
\r[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(17),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(17),
      O => r0(17)
    );
\r[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(18),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(18),
      O => r0(18)
    );
\r[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(19),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(19),
      O => r0(19)
    );
\r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(1),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(1),
      O => r0(1)
    );
\r[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(20),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(20),
      O => r0(20)
    );
\r[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(21),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(21),
      O => r0(21)
    );
\r[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(22),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(22),
      O => r0(22)
    );
\r[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(23),
      I1 => WSTRB(2),
      I2 => \^r_rsc_dat\(23),
      O => r0(23)
    );
\r[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(24),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(24),
      O => r0(24)
    );
\r[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(25),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(25),
      O => r0(25)
    );
\r[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(26),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(26),
      O => r0(26)
    );
\r[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(27),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(27),
      O => r0(27)
    );
\r[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(28),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(28),
      O => r0(28)
    );
\r[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(29),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(29),
      O => r0(29)
    );
\r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(2),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(2),
      O => r0(2)
    );
\r[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(30),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(30),
      O => r0(30)
    );
\r[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \p[31]_i_3_n_0\,
      I1 => waddr(2),
      I2 => waddr(3),
      I3 => waddr(0),
      I4 => waddr(1),
      O => \r[31]_i_1_n_0\
    );
\r[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(31),
      I1 => WSTRB(3),
      I2 => \^r_rsc_dat\(31),
      O => r0(31)
    );
\r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(3),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(3),
      O => r0(3)
    );
\r[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(4),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(4),
      O => r0(4)
    );
\r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(5),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(5),
      O => r0(5)
    );
\r[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(6),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(6),
      O => r0(6)
    );
\r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(7),
      I1 => WSTRB(0),
      I2 => \^r_rsc_dat\(7),
      O => r0(7)
    );
\r[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(8),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(8),
      O => r0(8)
    );
\r[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(9),
      I1 => WSTRB(1),
      I2 => \^r_rsc_dat\(9),
      O => r0(9)
    );
\r_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(0),
      Q => \^r_rsc_dat\(0)
    );
\r_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(10),
      Q => \^r_rsc_dat\(10)
    );
\r_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(11),
      Q => \^r_rsc_dat\(11)
    );
\r_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(12),
      Q => \^r_rsc_dat\(12)
    );
\r_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(13),
      Q => \^r_rsc_dat\(13)
    );
\r_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(14),
      Q => \^r_rsc_dat\(14)
    );
\r_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(15),
      Q => \^r_rsc_dat\(15)
    );
\r_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(16),
      Q => \^r_rsc_dat\(16)
    );
\r_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(17),
      Q => \^r_rsc_dat\(17)
    );
\r_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(18),
      Q => \^r_rsc_dat\(18)
    );
\r_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(19),
      Q => \^r_rsc_dat\(19)
    );
\r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(1),
      Q => \^r_rsc_dat\(1)
    );
\r_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(20),
      Q => \^r_rsc_dat\(20)
    );
\r_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(21),
      Q => \^r_rsc_dat\(21)
    );
\r_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(22),
      Q => \^r_rsc_dat\(22)
    );
\r_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(23),
      Q => \^r_rsc_dat\(23)
    );
\r_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(24),
      Q => \^r_rsc_dat\(24)
    );
\r_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(25),
      Q => \^r_rsc_dat\(25)
    );
\r_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(26),
      Q => \^r_rsc_dat\(26)
    );
\r_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(27),
      Q => \^r_rsc_dat\(27)
    );
\r_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(28),
      Q => \^r_rsc_dat\(28)
    );
\r_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(29),
      Q => \^r_rsc_dat\(29)
    );
\r_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(2),
      Q => \^r_rsc_dat\(2)
    );
\r_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(30),
      Q => \^r_rsc_dat\(30)
    );
\r_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(31),
      Q => \^r_rsc_dat\(31)
    );
\r_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(3),
      Q => \^r_rsc_dat\(3)
    );
\r_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(4),
      Q => \^r_rsc_dat\(4)
    );
\r_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(5),
      Q => \^r_rsc_dat\(5)
    );
\r_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(6),
      Q => \^r_rsc_dat\(6)
    );
\r_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(7),
      Q => \^r_rsc_dat\(7)
    );
\r_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(8),
      Q => \^r_rsc_dat\(8)
    );
\r_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => ACLK,
      CE => \r[31]_i_1_n_0\,
      CLR => \FSM_onehot_wstate[0]_i_2_n_0\,
      D => r0(9),
      Q => \^r_rsc_dat\(9)
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => ac_sync_complete,
      I5 => ARADDR(3),
      O => \rdata[0]_i_1_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_6_lz,
      I5 => ARADDR(3),
      O => \rdata[10]_i_1_n_0\
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_7_lz,
      I5 => ARADDR(3),
      O => \rdata[11]_i_1_n_0\
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_rsc_triosy_0_0_lz,
      I5 => ARADDR(3),
      O => \rdata[12]_i_1_n_0\
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_rsc_triosy_0_1_lz,
      I5 => ARADDR(3),
      O => \rdata[13]_i_1_n_0\
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_rsc_triosy_0_2_lz,
      I5 => ARADDR(3),
      O => \rdata[14]_i_1_n_0\
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_rsc_triosy_0_3_lz,
      I5 => ARADDR(3),
      O => \rdata[15]_i_1_n_0\
    );
\rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_h_rsc_triosy_0_0_lz,
      I5 => ARADDR(3),
      O => \rdata[16]_i_1_n_0\
    );
\rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_h_rsc_triosy_0_1_lz,
      I5 => ARADDR(3),
      O => \rdata[17]_i_1_n_0\
    );
\rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_h_rsc_triosy_0_2_lz,
      I5 => ARADDR(3),
      O => \rdata[18]_i_1_n_0\
    );
\rdata[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => ARADDR(4),
      I1 => \^rvalid\,
      I2 => ARVALID,
      O => \rdata[19]_i_1_n_0\
    );
\rdata[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ARVALID,
      I1 => \^rvalid\,
      O => \rdata[19]_i_2_n_0\
    );
\rdata[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => twiddle_h_rsc_triosy_0_3_lz,
      I5 => ARADDR(3),
      O => \rdata[19]_i_3_n_0\
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => ac_sync_run_rsc_lzin,
      I5 => ARADDR(3),
      O => \rdata[1]_i_1_n_0\
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => r_rsc_triosy_lz,
      I5 => ARADDR(3),
      O => \rdata[2]_i_1_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => p_rsc_triosy_lz,
      I5 => ARADDR(3),
      O => \rdata[3]_i_1_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_0_lz,
      I5 => ARADDR(3),
      O => \rdata[4]_i_1_n_0\
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_1_lz,
      I5 => ARADDR(3),
      O => \rdata[5]_i_1_n_0\
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_2_lz,
      I5 => ARADDR(3),
      O => \rdata[6]_i_1_n_0\
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_3_lz,
      I5 => ARADDR(3),
      O => \rdata[7]_i_1_n_0\
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_4_lz,
      I5 => ARADDR(3),
      O => \rdata[8]_i_1_n_0\
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(1),
      I2 => ARADDR(0),
      I3 => ARADDR(2),
      I4 => vec_rsc_triosy_0_5_lz,
      I5 => ARADDR(3),
      O => \rdata[9]_i_1_n_0\
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[0]_i_1_n_0\,
      Q => RDATA(0),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[10]_i_1_n_0\,
      Q => RDATA(10),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[11]_i_1_n_0\,
      Q => RDATA(11),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[12]_i_1_n_0\,
      Q => RDATA(12),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[13]_i_1_n_0\,
      Q => RDATA(13),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[14]_i_1_n_0\,
      Q => RDATA(14),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[15]_i_1_n_0\,
      Q => RDATA(15),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[16]_i_1_n_0\,
      Q => RDATA(16),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[17]_i_1_n_0\,
      Q => RDATA(17),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[18]_i_1_n_0\,
      Q => RDATA(18),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[19]_i_3_n_0\,
      Q => RDATA(19),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[1]_i_1_n_0\,
      Q => RDATA(1),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[2]_i_1_n_0\,
      Q => RDATA(2),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[3]_i_1_n_0\,
      Q => RDATA(3),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[4]_i_1_n_0\,
      Q => RDATA(4),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[5]_i_1_n_0\,
      Q => RDATA(5),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[6]_i_1_n_0\,
      Q => RDATA(6),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[7]_i_1_n_0\,
      Q => RDATA(7),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[8]_i_1_n_0\,
      Q => RDATA(8),
      R => \rdata[19]_i_1_n_0\
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \rdata[19]_i_2_n_0\,
      D => \rdata[9]_i_1_n_0\,
      Q => RDATA(9),
      R => \rdata[19]_i_1_n_0\
    );
\waddr[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^awready\,
      I1 => AWVALID,
      O => aw_hs
    );
\waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => aw_hs,
      D => AWADDR(0),
      Q => waddr(0),
      R => '0'
    );
\waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => aw_hs,
      D => AWADDR(1),
      Q => waddr(1),
      R => '0'
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => aw_hs,
      D => AWADDR(2),
      Q => waddr(2),
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => aw_hs,
      D => AWADDR(3),
      Q => waddr(3),
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => aw_hs,
      D => AWADDR(4),
      Q => waddr(4),
      R => '0'
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => aw_hs,
      D => AWADDR(5),
      Q => waddr(5),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Board_axi_lit_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AWVALID : in STD_LOGIC;
    AWREADY : out STD_LOGIC;
    WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    WVALID : in STD_LOGIC;
    WREADY : out STD_LOGIC;
    BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    BVALID : out STD_LOGIC;
    BREADY : in STD_LOGIC;
    ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ARVALID : in STD_LOGIC;
    ARREADY : out STD_LOGIC;
    RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RVALID : out STD_LOGIC;
    RREADY : in STD_LOGIC;
    p_rsc_dat : out STD_LOGIC_VECTOR ( 31 downto 0 );
    r_rsc_dat : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ac_sync_run : out STD_LOGIC;
    ac_sync_complete_rsc_vzout : out STD_LOGIC;
    ac_sync_complete : in STD_LOGIC;
    ac_sync_run_rsc_lzin : in STD_LOGIC;
    vec_rsc_triosy_0_0_lz : in STD_LOGIC;
    vec_rsc_triosy_0_1_lz : in STD_LOGIC;
    vec_rsc_triosy_0_2_lz : in STD_LOGIC;
    vec_rsc_triosy_0_3_lz : in STD_LOGIC;
    vec_rsc_triosy_0_4_lz : in STD_LOGIC;
    vec_rsc_triosy_0_5_lz : in STD_LOGIC;
    vec_rsc_triosy_0_6_lz : in STD_LOGIC;
    vec_rsc_triosy_0_7_lz : in STD_LOGIC;
    p_rsc_triosy_lz : in STD_LOGIC;
    r_rsc_triosy_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_2_lz : in STD_LOGIC;
    twiddle_rsc_triosy_0_3_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_0_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_1_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_2_lz : in STD_LOGIC;
    twiddle_h_rsc_triosy_0_3_lz : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Board_axi_lit_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Board_axi_lit_0_0 : entity is "Board_axi_lit_0_0,axi_lit,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of Board_axi_lit_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of Board_axi_lit_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of Board_axi_lit_0_0 : entity is "axi_lit,Vivado 2021.1";
end Board_axi_lit_0_0;

architecture STRUCTURE of Board_axi_lit_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^rdata\ : STD_LOGIC_VECTOR ( 19 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ACLK : signal is "xilinx.com:signal:clock:1.0 ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ACLK : signal is "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF interface_aximm, ASSOCIATED_RESET ARESETN, FREQ_HZ 62500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ARESETN : signal is "xilinx.com:signal:reset:1.0 ARESETN RST";
  attribute X_INTERFACE_PARAMETER of ARESETN : signal is "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ARREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY";
  attribute X_INTERFACE_INFO of ARVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID";
  attribute X_INTERFACE_INFO of AWREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY";
  attribute X_INTERFACE_INFO of AWVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID";
  attribute X_INTERFACE_INFO of BREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BREADY";
  attribute X_INTERFACE_INFO of BVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BVALID";
  attribute X_INTERFACE_INFO of RREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RREADY";
  attribute X_INTERFACE_PARAMETER of RREADY : signal is "XIL_INTERFACENAME interface_aximm, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 62500000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN Board_axi_pcie3_0_0_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of RVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RVALID";
  attribute X_INTERFACE_INFO of WREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WREADY";
  attribute X_INTERFACE_INFO of WVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WVALID";
  attribute X_INTERFACE_INFO of ARADDR : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR";
  attribute X_INTERFACE_INFO of AWADDR : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR";
  attribute X_INTERFACE_INFO of BRESP : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BRESP";
  attribute X_INTERFACE_INFO of RDATA : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RDATA";
  attribute X_INTERFACE_INFO of RRESP : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RRESP";
  attribute X_INTERFACE_INFO of WDATA : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WDATA";
  attribute X_INTERFACE_INFO of WSTRB : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB";
begin
  BRESP(1) <= \<const0>\;
  BRESP(0) <= \<const0>\;
  RDATA(31) <= \<const0>\;
  RDATA(30) <= \<const0>\;
  RDATA(29) <= \<const0>\;
  RDATA(28) <= \<const0>\;
  RDATA(27) <= \<const0>\;
  RDATA(26) <= \<const0>\;
  RDATA(25) <= \<const0>\;
  RDATA(24) <= \<const0>\;
  RDATA(23) <= \<const0>\;
  RDATA(22) <= \<const0>\;
  RDATA(21) <= \<const0>\;
  RDATA(20) <= \<const0>\;
  RDATA(19 downto 0) <= \^rdata\(19 downto 0);
  RRESP(1) <= \<const0>\;
  RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.Board_axi_lit_0_0_axi_lit
     port map (
      ACLK => ACLK,
      ARADDR(5 downto 0) => ARADDR(5 downto 0),
      ARESETN => ARESETN,
      ARREADY => ARREADY,
      ARVALID => ARVALID,
      AWADDR(5 downto 0) => AWADDR(5 downto 0),
      AWREADY => AWREADY,
      AWVALID => AWVALID,
      BREADY => BREADY,
      BVALID => BVALID,
      Q(1) => ac_sync_complete_rsc_vzout,
      Q(0) => ac_sync_run,
      RDATA(19 downto 0) => \^rdata\(19 downto 0),
      RREADY => RREADY,
      RVALID => RVALID,
      WDATA(31 downto 0) => WDATA(31 downto 0),
      WREADY => WREADY,
      WSTRB(3 downto 0) => WSTRB(3 downto 0),
      WVALID => WVALID,
      ac_sync_complete => ac_sync_complete,
      ac_sync_run_rsc_lzin => ac_sync_run_rsc_lzin,
      p_rsc_dat(31 downto 0) => p_rsc_dat(31 downto 0),
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_dat(31 downto 0) => r_rsc_dat(31 downto 0),
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_h_rsc_triosy_0_0_lz => twiddle_h_rsc_triosy_0_0_lz,
      twiddle_h_rsc_triosy_0_1_lz => twiddle_h_rsc_triosy_0_1_lz,
      twiddle_h_rsc_triosy_0_2_lz => twiddle_h_rsc_triosy_0_2_lz,
      twiddle_h_rsc_triosy_0_3_lz => twiddle_h_rsc_triosy_0_3_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_triosy_0_2_lz => twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_triosy_0_3_lz => twiddle_rsc_triosy_0_3_lz,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      vec_rsc_triosy_0_2_lz => vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz => vec_rsc_triosy_0_3_lz,
      vec_rsc_triosy_0_4_lz => vec_rsc_triosy_0_4_lz,
      vec_rsc_triosy_0_5_lz => vec_rsc_triosy_0_5_lz,
      vec_rsc_triosy_0_6_lz => vec_rsc_triosy_0_6_lz,
      vec_rsc_triosy_0_7_lz => vec_rsc_triosy_0_7_lz
    );
end STRUCTURE;
