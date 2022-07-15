-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Fri Jun 10 15:11:55 2022
-- Host        : Desktop-0-Alienware-R7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/NTT_Xilinx/FPGA/inplace_DIT/Solution1/NTT_inplace_DIT_Solution1.gen/sources_1/bd/design_1/design_1_stub.vhdl
-- Design      : design_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku115-flvb2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1 is
  Port ( 
    clk : in STD_LOGIC;
    complete_rsc_rdy : in STD_LOGIC;
    complete_rsc_vld : out STD_LOGIC;
    p_rsc_dat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    p_rsc_triosy_lz : out STD_LOGIC;
    r_rsc_dat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    r_rsc_triosy_lz : out STD_LOGIC;
    rst : in STD_LOGIC;
    run_rsc_rdy : out STD_LOGIC;
    run_rsc_vld : in STD_LOGIC;
    twiddle_h_rsc_triosy_lz : out STD_LOGIC;
    twiddle_rsc_triosy_lz : out STD_LOGIC;
    vec_rsc_triosy_lz : out STD_LOGIC
  );

end design_1;

architecture stub of design_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,complete_rsc_rdy,complete_rsc_vld,p_rsc_dat[31:0],p_rsc_triosy_lz,r_rsc_dat[31:0],r_rsc_triosy_lz,rst,run_rsc_rdy,run_rsc_vld,twiddle_h_rsc_triosy_lz,twiddle_rsc_triosy_lz,vec_rsc_triosy_lz";
begin
end;
