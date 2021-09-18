-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Thu Sep 16 00:49:22 2021
-- Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_inPlaceNTT_DIF_preco_0_0_stub.vhdl
-- Design      : top_inPlaceNTT_DIF_preco_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    run_rsc_rdy : out STD_LOGIC;
    run_rsc_vld : in STD_LOGIC;
    vec_rsc_adra : out STD_LOGIC_VECTOR ( 11 downto 0 );
    vec_rsc_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_wea : out STD_LOGIC;
    vec_rsc_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_adrb : out STD_LOGIC_VECTOR ( 11 downto 0 );
    vec_rsc_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_web : out STD_LOGIC;
    vec_rsc_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_lz : out STD_LOGIC;
    p_rsc_dat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    p_rsc_triosy_lz : out STD_LOGIC;
    r_rsc_dat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    r_rsc_triosy_lz : out STD_LOGIC;
    twiddle_rsc_adra : out STD_LOGIC_VECTOR ( 11 downto 0 );
    twiddle_rsc_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_wea : out STD_LOGIC;
    twiddle_rsc_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_adrb : out STD_LOGIC_VECTOR ( 11 downto 0 );
    twiddle_rsc_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_web : out STD_LOGIC;
    twiddle_rsc_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_triosy_lz : out STD_LOGIC;
    twiddle_h_rsc_adra : out STD_LOGIC_VECTOR ( 11 downto 0 );
    twiddle_h_rsc_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_wea : out STD_LOGIC;
    twiddle_h_rsc_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_adrb : out STD_LOGIC_VECTOR ( 11 downto 0 );
    twiddle_h_rsc_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_web : out STD_LOGIC;
    twiddle_h_rsc_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_triosy_lz : out STD_LOGIC;
    complete_rsc_rdy : in STD_LOGIC;
    complete_rsc_vld : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,run_rsc_rdy,run_rsc_vld,vec_rsc_adra[11:0],vec_rsc_da[31:0],vec_rsc_wea,vec_rsc_qa[31:0],vec_rsc_adrb[11:0],vec_rsc_db[31:0],vec_rsc_web,vec_rsc_qb[31:0],vec_rsc_triosy_lz,p_rsc_dat[31:0],p_rsc_triosy_lz,r_rsc_dat[31:0],r_rsc_triosy_lz,twiddle_rsc_adra[11:0],twiddle_rsc_da[31:0],twiddle_rsc_wea,twiddle_rsc_qa[31:0],twiddle_rsc_adrb[11:0],twiddle_rsc_db[31:0],twiddle_rsc_web,twiddle_rsc_qb[31:0],twiddle_rsc_triosy_lz,twiddle_h_rsc_adra[11:0],twiddle_h_rsc_da[31:0],twiddle_h_rsc_wea,twiddle_h_rsc_qa[31:0],twiddle_h_rsc_adrb[11:0],twiddle_h_rsc_db[31:0],twiddle_h_rsc_web,twiddle_h_rsc_qb[31:0],twiddle_h_rsc_triosy_lz,complete_rsc_rdy,complete_rsc_vld";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "inPlaceNTT_DIF_precomp,Vivado 2021.1";
begin
end;
