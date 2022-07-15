-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Thu Jul 14 22:34:44 2022
-- Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/NTT_Xilinx/Vivado/inplace_DIF_prototype/inplace_DIF_prototype.gen/sources_1/bd/Board/ip/Board_inPlaceNTT_DIF_preco_0_0/Board_inPlaceNTT_DIF_preco_0_0_stub.vhdl
-- Design      : Board_inPlaceNTT_DIF_preco_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku115-flvb2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Board_inPlaceNTT_DIF_preco_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    run_rsc_lzin : out STD_LOGIC;
    run_rsc_vzin : in STD_LOGIC;
    vec_rsc_0_0_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_0_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_0_we : out STD_LOGIC;
    vec_rsc_0_0_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_0_lz : out STD_LOGIC;
    vec_rsc_0_1_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_1_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_1_we : out STD_LOGIC;
    vec_rsc_0_1_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_1_lz : out STD_LOGIC;
    vec_rsc_0_2_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_2_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_2_we : out STD_LOGIC;
    vec_rsc_0_2_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_2_lz : out STD_LOGIC;
    vec_rsc_0_3_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_3_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_3_we : out STD_LOGIC;
    vec_rsc_0_3_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_3_lz : out STD_LOGIC;
    vec_rsc_0_4_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_4_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_4_we : out STD_LOGIC;
    vec_rsc_0_4_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_4_lz : out STD_LOGIC;
    vec_rsc_0_5_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_5_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_5_we : out STD_LOGIC;
    vec_rsc_0_5_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_5_lz : out STD_LOGIC;
    vec_rsc_0_6_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_6_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_6_we : out STD_LOGIC;
    vec_rsc_0_6_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_6_lz : out STD_LOGIC;
    vec_rsc_0_7_adr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    vec_rsc_0_7_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_0_7_we : out STD_LOGIC;
    vec_rsc_0_7_q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_rsc_triosy_0_7_lz : out STD_LOGIC;
    p_rsc_dat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    p_rsc_triosy_lz : out STD_LOGIC;
    r_rsc_dat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    r_rsc_triosy_lz : out STD_LOGIC;
    twiddle_rsc_0_0_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_0_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_0_wea : out STD_LOGIC;
    twiddle_rsc_0_0_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_0_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_0_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_0_web : out STD_LOGIC;
    twiddle_rsc_0_0_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_triosy_0_0_lz : out STD_LOGIC;
    twiddle_rsc_0_1_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_1_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_1_wea : out STD_LOGIC;
    twiddle_rsc_0_1_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_1_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_1_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_1_web : out STD_LOGIC;
    twiddle_rsc_0_1_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_triosy_0_1_lz : out STD_LOGIC;
    twiddle_rsc_0_2_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_2_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_2_wea : out STD_LOGIC;
    twiddle_rsc_0_2_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_2_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_2_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_2_web : out STD_LOGIC;
    twiddle_rsc_0_2_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_triosy_0_2_lz : out STD_LOGIC;
    twiddle_rsc_0_3_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_3_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_3_wea : out STD_LOGIC;
    twiddle_rsc_0_3_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_3_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_rsc_0_3_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_0_3_web : out STD_LOGIC;
    twiddle_rsc_0_3_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_rsc_triosy_0_3_lz : out STD_LOGIC;
    twiddle_h_rsc_0_0_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_0_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_0_wea : out STD_LOGIC;
    twiddle_h_rsc_0_0_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_0_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_0_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_0_web : out STD_LOGIC;
    twiddle_h_rsc_0_0_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_triosy_0_0_lz : out STD_LOGIC;
    twiddle_h_rsc_0_1_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_1_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_1_wea : out STD_LOGIC;
    twiddle_h_rsc_0_1_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_1_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_1_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_1_web : out STD_LOGIC;
    twiddle_h_rsc_0_1_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_triosy_0_1_lz : out STD_LOGIC;
    twiddle_h_rsc_0_2_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_2_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_2_wea : out STD_LOGIC;
    twiddle_h_rsc_0_2_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_2_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_2_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_2_web : out STD_LOGIC;
    twiddle_h_rsc_0_2_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_triosy_0_2_lz : out STD_LOGIC;
    twiddle_h_rsc_0_3_adra : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_3_da : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_3_wea : out STD_LOGIC;
    twiddle_h_rsc_0_3_qa : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_3_adrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    twiddle_h_rsc_0_3_db : out STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_0_3_web : out STD_LOGIC;
    twiddle_h_rsc_0_3_qb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    twiddle_h_rsc_triosy_0_3_lz : out STD_LOGIC;
    complete_rsc_lzout : out STD_LOGIC;
    complete_rsc_vzout : in STD_LOGIC
  );

end Board_inPlaceNTT_DIF_preco_0_0;

architecture stub of Board_inPlaceNTT_DIF_preco_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,run_rsc_lzin,run_rsc_vzin,vec_rsc_0_0_adr[6:0],vec_rsc_0_0_d[31:0],vec_rsc_0_0_we,vec_rsc_0_0_q[31:0],vec_rsc_triosy_0_0_lz,vec_rsc_0_1_adr[6:0],vec_rsc_0_1_d[31:0],vec_rsc_0_1_we,vec_rsc_0_1_q[31:0],vec_rsc_triosy_0_1_lz,vec_rsc_0_2_adr[6:0],vec_rsc_0_2_d[31:0],vec_rsc_0_2_we,vec_rsc_0_2_q[31:0],vec_rsc_triosy_0_2_lz,vec_rsc_0_3_adr[6:0],vec_rsc_0_3_d[31:0],vec_rsc_0_3_we,vec_rsc_0_3_q[31:0],vec_rsc_triosy_0_3_lz,vec_rsc_0_4_adr[6:0],vec_rsc_0_4_d[31:0],vec_rsc_0_4_we,vec_rsc_0_4_q[31:0],vec_rsc_triosy_0_4_lz,vec_rsc_0_5_adr[6:0],vec_rsc_0_5_d[31:0],vec_rsc_0_5_we,vec_rsc_0_5_q[31:0],vec_rsc_triosy_0_5_lz,vec_rsc_0_6_adr[6:0],vec_rsc_0_6_d[31:0],vec_rsc_0_6_we,vec_rsc_0_6_q[31:0],vec_rsc_triosy_0_6_lz,vec_rsc_0_7_adr[6:0],vec_rsc_0_7_d[31:0],vec_rsc_0_7_we,vec_rsc_0_7_q[31:0],vec_rsc_triosy_0_7_lz,p_rsc_dat[31:0],p_rsc_triosy_lz,r_rsc_dat[31:0],r_rsc_triosy_lz,twiddle_rsc_0_0_adra[7:0],twiddle_rsc_0_0_da[31:0],twiddle_rsc_0_0_wea,twiddle_rsc_0_0_qa[31:0],twiddle_rsc_0_0_adrb[7:0],twiddle_rsc_0_0_db[31:0],twiddle_rsc_0_0_web,twiddle_rsc_0_0_qb[31:0],twiddle_rsc_triosy_0_0_lz,twiddle_rsc_0_1_adra[7:0],twiddle_rsc_0_1_da[31:0],twiddle_rsc_0_1_wea,twiddle_rsc_0_1_qa[31:0],twiddle_rsc_0_1_adrb[7:0],twiddle_rsc_0_1_db[31:0],twiddle_rsc_0_1_web,twiddle_rsc_0_1_qb[31:0],twiddle_rsc_triosy_0_1_lz,twiddle_rsc_0_2_adra[7:0],twiddle_rsc_0_2_da[31:0],twiddle_rsc_0_2_wea,twiddle_rsc_0_2_qa[31:0],twiddle_rsc_0_2_adrb[7:0],twiddle_rsc_0_2_db[31:0],twiddle_rsc_0_2_web,twiddle_rsc_0_2_qb[31:0],twiddle_rsc_triosy_0_2_lz,twiddle_rsc_0_3_adra[7:0],twiddle_rsc_0_3_da[31:0],twiddle_rsc_0_3_wea,twiddle_rsc_0_3_qa[31:0],twiddle_rsc_0_3_adrb[7:0],twiddle_rsc_0_3_db[31:0],twiddle_rsc_0_3_web,twiddle_rsc_0_3_qb[31:0],twiddle_rsc_triosy_0_3_lz,twiddle_h_rsc_0_0_adra[7:0],twiddle_h_rsc_0_0_da[31:0],twiddle_h_rsc_0_0_wea,twiddle_h_rsc_0_0_qa[31:0],twiddle_h_rsc_0_0_adrb[7:0],twiddle_h_rsc_0_0_db[31:0],twiddle_h_rsc_0_0_web,twiddle_h_rsc_0_0_qb[31:0],twiddle_h_rsc_triosy_0_0_lz,twiddle_h_rsc_0_1_adra[7:0],twiddle_h_rsc_0_1_da[31:0],twiddle_h_rsc_0_1_wea,twiddle_h_rsc_0_1_qa[31:0],twiddle_h_rsc_0_1_adrb[7:0],twiddle_h_rsc_0_1_db[31:0],twiddle_h_rsc_0_1_web,twiddle_h_rsc_0_1_qb[31:0],twiddle_h_rsc_triosy_0_1_lz,twiddle_h_rsc_0_2_adra[7:0],twiddle_h_rsc_0_2_da[31:0],twiddle_h_rsc_0_2_wea,twiddle_h_rsc_0_2_qa[31:0],twiddle_h_rsc_0_2_adrb[7:0],twiddle_h_rsc_0_2_db[31:0],twiddle_h_rsc_0_2_web,twiddle_h_rsc_0_2_qb[31:0],twiddle_h_rsc_triosy_0_2_lz,twiddle_h_rsc_0_3_adra[7:0],twiddle_h_rsc_0_3_da[31:0],twiddle_h_rsc_0_3_wea,twiddle_h_rsc_0_3_qa[31:0],twiddle_h_rsc_0_3_adrb[7:0],twiddle_h_rsc_0_3_db[31:0],twiddle_h_rsc_0_3_web,twiddle_h_rsc_0_3_qb[31:0],twiddle_h_rsc_triosy_0_3_lz,complete_rsc_lzout,complete_rsc_vzout";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "inPlaceNTT_DIF_precomp,Vivado 2021.1";
begin
end;
