-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Thu Jul 14 22:47:20 2022
-- Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/NTT_Xilinx/Vivado/inplace_DIF_prototype/inplace_DIF_prototype.gen/sources_1/bd/Board/ip/Board_axi_lit_0_0/Board_axi_lit_0_0_stub.vhdl
-- Design      : Board_axi_lit_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku115-flvb2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Board_axi_lit_0_0 is
  Port ( 
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

end Board_axi_lit_0_0;

architecture stub of Board_axi_lit_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ACLK,ARESETN,AWADDR[31:0],AWVALID,AWREADY,WDATA[31:0],WSTRB[3:0],WVALID,WREADY,BRESP[1:0],BVALID,BREADY,ARADDR[31:0],ARVALID,ARREADY,RDATA[31:0],RRESP[1:0],RVALID,RREADY,p_rsc_dat[31:0],r_rsc_dat[31:0],ac_sync_run,ac_sync_complete_rsc_vzout,ac_sync_complete,ac_sync_run_rsc_lzin,vec_rsc_triosy_0_0_lz,vec_rsc_triosy_0_1_lz,vec_rsc_triosy_0_2_lz,vec_rsc_triosy_0_3_lz,vec_rsc_triosy_0_4_lz,vec_rsc_triosy_0_5_lz,vec_rsc_triosy_0_6_lz,vec_rsc_triosy_0_7_lz,p_rsc_triosy_lz,r_rsc_triosy_lz,twiddle_rsc_triosy_0_0_lz,twiddle_rsc_triosy_0_1_lz,twiddle_rsc_triosy_0_2_lz,twiddle_rsc_triosy_0_3_lz,twiddle_h_rsc_triosy_0_0_lz,twiddle_h_rsc_triosy_0_1_lz,twiddle_h_rsc_triosy_0_2_lz,twiddle_h_rsc_triosy_0_3_lz";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_lit,Vivado 2021.1";
begin
end;
