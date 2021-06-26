
--------> /opt/mentorgraphics/Catapult_10.3a/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_pkg_v1 IS

COMPONENT ccs_in_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_in_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_in_v1;

ARCHITECTURE beh OF ccs_in_v1 IS
BEGIN

  idat <= dat;

END beh;


--------> /opt/mentorgraphics/Catapult_10.3a/Mgc_home/pkgs/siflibs/ccs_out_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_out_pkg_v1 IS

COMPONENT ccs_out_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    idat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_out_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    idat  : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_out_v1;

ARCHITECTURE beh OF ccs_out_v1 IS
BEGIN

  dat <= idat;

END beh;


--------> /opt/mentorgraphics/Catapult_10.3a/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.3a/798110 Production Release
--  HLS Date:       Tue Dec  4 22:20:19 PST 2018
-- 
--  Generated by:   jd4691@newnano.poly.edu
--  Generated date: Wed Jun 23 00:11:17 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    fir_filter_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_filter_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    SHIFT_LOOP_C_0_tr0 : IN STD_LOGIC;
    MAC_LOOP_C_0_tr0 : IN STD_LOGIC
  );
END fir_filter_core_core_fsm;

ARCHITECTURE v1 OF fir_filter_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for fir_filter_core_core_fsm_1
  TYPE fir_filter_core_core_fsm_1_ST IS (main_C_0, SHIFT_LOOP_C_0, MAC_LOOP_C_0,
      main_C_1, main_C_2);

  SIGNAL state_var : fir_filter_core_core_fsm_1_ST;
  SIGNAL state_var_NS : fir_filter_core_core_fsm_1_ST;

BEGIN
  fir_filter_core_core_fsm_1 : PROCESS (SHIFT_LOOP_C_0_tr0, MAC_LOOP_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN SHIFT_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010");
        IF ( SHIFT_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= MAC_LOOP_C_0;
        ELSE
          state_var_NS <= SHIFT_LOOP_C_0;
        END IF;
      WHEN MAC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100");
        IF ( MAC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= MAC_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001");
        state_var_NS <= SHIFT_LOOP_C_0;
    END CASE;
  END PROCESS fir_filter_core_core_fsm_1;

  fir_filter_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS fir_filter_core_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_filter_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_filter_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    i_sample_rsc_dat : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    i_sample_rsc_triosy_lz : OUT STD_LOGIC;
    b_rsc_dat : IN STD_LOGIC_VECTOR (1269 DOWNTO 0);
    b_rsc_triosy_lz : OUT STD_LOGIC;
    y_rsc_dat : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    y_rsc_triosy_lz : OUT STD_LOGIC
  );
END fir_filter_core;

ARCHITECTURE v1 OF fir_filter_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL i_sample_rsci_idat : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL b_rsci_idat : STD_LOGIC_VECTOR (1269 DOWNTO 0);
  SIGNAL y_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL y_rsci_idat_8 : STD_LOGIC;
  SIGNAL y_rsci_idat_7_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL y_rsci_idat_0 : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL MAC_LOOP_n_6_0_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL sum_sva : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL reg_b_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL x_0_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_63_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_62_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_64_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_61_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_65_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_60_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_66_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_59_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_67_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_58_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_68_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_57_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_69_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_56_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_70_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_55_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_71_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_54_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_72_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_53_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_73_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_52_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_74_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_51_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_75_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_50_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_76_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_49_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_77_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_48_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_78_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_47_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_79_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_46_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_80_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_45_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_81_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_44_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_82_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_43_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_83_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_42_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_84_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_41_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_85_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_40_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_86_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_39_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_87_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_38_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_88_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_37_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_89_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_36_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_90_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_35_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_91_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_34_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_92_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_33_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_93_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_32_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_94_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_31_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_95_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_30_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_96_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_29_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_97_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_28_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_98_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_27_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_99_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_26_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_100_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_25_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_101_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_24_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_102_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_23_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_103_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_22_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_104_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_21_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_105_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_20_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_106_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_19_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_107_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_18_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_108_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_17_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_109_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_16_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_110_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_15_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_111_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_14_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_112_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_13_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_113_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_12_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_114_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_11_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_115_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_10_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_116_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_9_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_117_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_8_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_118_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_7_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_119_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_6_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_120_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_5_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_121_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_4_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_122_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_3_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_123_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_2_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_124_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_1_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_125_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_126_lpi_2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL i_sample_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL nor_ovfl_sva_1 : STD_LOGIC;
  SIGNAL and_unfl_sva_1 : STD_LOGIC;
  SIGNAL z_out_1_7 : STD_LOGIC;
  SIGNAL MAC_LOOP_mux_11_tmp : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_tmp : STD_LOGIC;
  SIGNAL and_tmp_2 : STD_LOGIC;
  SIGNAL and_tmp_3 : STD_LOGIC;
  SIGNAL and_tmp_5 : STD_LOGIC;
  SIGNAL and_tmp_6 : STD_LOGIC;
  SIGNAL and_tmp_7 : STD_LOGIC;
  SIGNAL and_tmp_8 : STD_LOGIC;
  SIGNAL and_tmp_9 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL and_tmp_12 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL and_tmp_14 : STD_LOGIC;
  SIGNAL and_tmp_15 : STD_LOGIC;
  SIGNAL and_tmp_16 : STD_LOGIC;
  SIGNAL and_tmp_17 : STD_LOGIC;
  SIGNAL and_tmp_18 : STD_LOGIC;
  SIGNAL and_tmp_19 : STD_LOGIC;
  SIGNAL and_tmp_20 : STD_LOGIC;
  SIGNAL and_tmp_21 : STD_LOGIC;
  SIGNAL and_tmp_22 : STD_LOGIC;
  SIGNAL and_tmp_23 : STD_LOGIC;
  SIGNAL and_tmp_24 : STD_LOGIC;
  SIGNAL and_tmp_25 : STD_LOGIC;
  SIGNAL and_tmp_26 : STD_LOGIC;
  SIGNAL and_tmp_27 : STD_LOGIC;
  SIGNAL and_tmp_28 : STD_LOGIC;
  SIGNAL and_tmp_29 : STD_LOGIC;
  SIGNAL and_tmp_30 : STD_LOGIC;
  SIGNAL and_tmp_31 : STD_LOGIC;
  SIGNAL and_tmp_32 : STD_LOGIC;
  SIGNAL and_tmp_33 : STD_LOGIC;
  SIGNAL and_tmp_34 : STD_LOGIC;
  SIGNAL and_tmp_35 : STD_LOGIC;
  SIGNAL and_tmp_36 : STD_LOGIC;
  SIGNAL and_tmp_37 : STD_LOGIC;
  SIGNAL and_tmp_38 : STD_LOGIC;
  SIGNAL and_tmp_39 : STD_LOGIC;
  SIGNAL and_tmp_40 : STD_LOGIC;
  SIGNAL and_tmp_41 : STD_LOGIC;
  SIGNAL and_tmp_42 : STD_LOGIC;
  SIGNAL and_tmp_43 : STD_LOGIC;
  SIGNAL and_tmp_44 : STD_LOGIC;
  SIGNAL and_tmp_45 : STD_LOGIC;
  SIGNAL and_tmp_46 : STD_LOGIC;
  SIGNAL and_tmp_47 : STD_LOGIC;
  SIGNAL and_tmp_48 : STD_LOGIC;
  SIGNAL and_tmp_49 : STD_LOGIC;
  SIGNAL and_tmp_50 : STD_LOGIC;
  SIGNAL and_tmp_51 : STD_LOGIC;
  SIGNAL and_tmp_52 : STD_LOGIC;
  SIGNAL and_tmp_53 : STD_LOGIC;
  SIGNAL and_tmp_54 : STD_LOGIC;
  SIGNAL and_tmp_55 : STD_LOGIC;
  SIGNAL and_tmp_56 : STD_LOGIC;
  SIGNAL and_tmp_57 : STD_LOGIC;
  SIGNAL and_tmp_58 : STD_LOGIC;
  SIGNAL and_tmp_59 : STD_LOGIC;
  SIGNAL and_tmp_60 : STD_LOGIC;
  SIGNAL and_tmp_61 : STD_LOGIC;
  SIGNAL and_tmp_62 : STD_LOGIC;
  SIGNAL and_tmp_63 : STD_LOGIC;
  SIGNAL and_tmp_64 : STD_LOGIC;
  SIGNAL and_tmp_65 : STD_LOGIC;
  SIGNAL and_tmp_66 : STD_LOGIC;
  SIGNAL and_tmp_67 : STD_LOGIC;
  SIGNAL and_tmp_68 : STD_LOGIC;
  SIGNAL and_tmp_69 : STD_LOGIC;
  SIGNAL and_tmp_70 : STD_LOGIC;
  SIGNAL and_tmp_71 : STD_LOGIC;
  SIGNAL and_tmp_72 : STD_LOGIC;
  SIGNAL and_tmp_73 : STD_LOGIC;
  SIGNAL and_tmp_74 : STD_LOGIC;
  SIGNAL and_tmp_75 : STD_LOGIC;
  SIGNAL and_tmp_76 : STD_LOGIC;
  SIGNAL and_tmp_77 : STD_LOGIC;
  SIGNAL and_tmp_78 : STD_LOGIC;
  SIGNAL and_tmp_79 : STD_LOGIC;
  SIGNAL and_tmp_80 : STD_LOGIC;
  SIGNAL and_tmp_81 : STD_LOGIC;
  SIGNAL and_tmp_82 : STD_LOGIC;
  SIGNAL and_tmp_83 : STD_LOGIC;
  SIGNAL and_tmp_84 : STD_LOGIC;
  SIGNAL and_tmp_85 : STD_LOGIC;
  SIGNAL and_tmp_86 : STD_LOGIC;
  SIGNAL and_tmp_87 : STD_LOGIC;
  SIGNAL and_tmp_88 : STD_LOGIC;
  SIGNAL and_tmp_89 : STD_LOGIC;
  SIGNAL and_tmp_90 : STD_LOGIC;
  SIGNAL and_tmp_91 : STD_LOGIC;
  SIGNAL and_tmp_92 : STD_LOGIC;
  SIGNAL and_tmp_93 : STD_LOGIC;
  SIGNAL and_tmp_94 : STD_LOGIC;
  SIGNAL and_tmp_95 : STD_LOGIC;
  SIGNAL and_tmp_96 : STD_LOGIC;
  SIGNAL and_tmp_97 : STD_LOGIC;
  SIGNAL and_tmp_98 : STD_LOGIC;
  SIGNAL and_tmp_99 : STD_LOGIC;
  SIGNAL and_tmp_100 : STD_LOGIC;
  SIGNAL and_tmp_101 : STD_LOGIC;
  SIGNAL and_tmp_102 : STD_LOGIC;
  SIGNAL and_tmp_103 : STD_LOGIC;
  SIGNAL and_tmp_104 : STD_LOGIC;
  SIGNAL and_tmp_105 : STD_LOGIC;
  SIGNAL and_tmp_106 : STD_LOGIC;
  SIGNAL and_tmp_107 : STD_LOGIC;
  SIGNAL and_tmp_108 : STD_LOGIC;
  SIGNAL and_tmp_109 : STD_LOGIC;
  SIGNAL and_tmp_110 : STD_LOGIC;
  SIGNAL and_tmp_111 : STD_LOGIC;
  SIGNAL and_tmp_112 : STD_LOGIC;
  SIGNAL and_tmp_113 : STD_LOGIC;
  SIGNAL and_tmp_114 : STD_LOGIC;
  SIGNAL and_tmp_115 : STD_LOGIC;
  SIGNAL and_tmp_116 : STD_LOGIC;
  SIGNAL and_tmp_117 : STD_LOGIC;
  SIGNAL and_tmp_118 : STD_LOGIC;
  SIGNAL acc_2_tmp_7_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL nor_1308_cse : STD_LOGIC;
  SIGNAL nor_1309_cse : STD_LOGIC;
  SIGNAL and_2671_cse : STD_LOGIC;
  SIGNAL and_2667_cse : STD_LOGIC;
  SIGNAL nor_1303_cse : STD_LOGIC;
  SIGNAL and_2691_cse : STD_LOGIC;
  SIGNAL and_2736_cse : STD_LOGIC;
  SIGNAL and_2741_cse : STD_LOGIC;
  SIGNAL and_2829_cse : STD_LOGIC;
  SIGNAL nor_1310_cse : STD_LOGIC;
  SIGNAL and_2668_cse : STD_LOGIC;
  SIGNAL nor_1297_cse : STD_LOGIC;
  SIGNAL and_2677_cse : STD_LOGIC;
  SIGNAL nor_1259_cse : STD_LOGIC;
  SIGNAL and_2708_cse : STD_LOGIC;
  SIGNAL nor_1271_cse : STD_LOGIC;
  SIGNAL and_2698_cse : STD_LOGIC;
  SIGNAL nor_1240_cse : STD_LOGIC;
  SIGNAL and_2723_cse : STD_LOGIC;
  SIGNAL nor_1202_cse : STD_LOGIC;
  SIGNAL and_2753_cse : STD_LOGIC;
  SIGNAL nor_1184_cse : STD_LOGIC;
  SIGNAL and_2768_cse : STD_LOGIC;
  SIGNAL nor_1188_cse : STD_LOGIC;
  SIGNAL and_2765_cse : STD_LOGIC;
  SIGNAL nor_1213_cse : STD_LOGIC;
  SIGNAL and_2743_cse : STD_LOGIC;
  SIGNAL nor_1159_cse : STD_LOGIC;
  SIGNAL and_2792_cse : STD_LOGIC;
  SIGNAL nor_1149_cse : STD_LOGIC;
  SIGNAL and_2801_cse : STD_LOGIC;
  SIGNAL nor_1132_cse : STD_LOGIC;
  SIGNAL and_2816_cse : STD_LOGIC;
  SIGNAL nor_1098_cse : STD_LOGIC;
  SIGNAL and_2846_cse : STD_LOGIC;
  SIGNAL nor_1077_cse : STD_LOGIC;
  SIGNAL and_2861_cse : STD_LOGIC;
  SIGNAL nor_1082_cse : STD_LOGIC;
  SIGNAL and_2858_cse : STD_LOGIC;
  SIGNAL nor_1048_cse : STD_LOGIC;
  SIGNAL and_2885_cse : STD_LOGIC;
  SIGNAL nor_1037_cse : STD_LOGIC;
  SIGNAL and_2894_cse : STD_LOGIC;
  SIGNAL nor_1052_cse : STD_LOGIC;
  SIGNAL and_2882_cse : STD_LOGIC;
  SIGNAL nor_1017_cse : STD_LOGIC;
  SIGNAL and_2909_cse : STD_LOGIC;
  SIGNAL nor_986_cse : STD_LOGIC;
  SIGNAL and_2933_cse : STD_LOGIC;
  SIGNAL nor_975_cse : STD_LOGIC;
  SIGNAL and_2942_cse : STD_LOGIC;
  SIGNAL nor_956_cse : STD_LOGIC;
  SIGNAL and_2957_cse : STD_LOGIC;
  SIGNAL nor_960_cse : STD_LOGIC;
  SIGNAL and_2954_cse : STD_LOGIC;
  SIGNAL nor_931_cse : STD_LOGIC;
  SIGNAL and_2981_cse : STD_LOGIC;
  SIGNAL nor_921_cse : STD_LOGIC;
  SIGNAL and_2990_cse : STD_LOGIC;
  SIGNAL nor_905_cse : STD_LOGIC;
  SIGNAL and_3005_cse : STD_LOGIC;

  SIGNAL nor_5_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL nor_1306_nl : STD_LOGIC;
  SIGNAL nor_1307_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL nor_1299_nl : STD_LOGIC;
  SIGNAL nor_1300_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL nor_1293_nl : STD_LOGIC;
  SIGNAL nor_1294_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL nor_1287_nl : STD_LOGIC;
  SIGNAL nor_1288_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL nor_1285_nl : STD_LOGIC;
  SIGNAL nor_1286_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL nor_1281_nl : STD_LOGIC;
  SIGNAL nor_1282_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL nor_1278_nl : STD_LOGIC;
  SIGNAL nor_1279_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL nor_1273_nl : STD_LOGIC;
  SIGNAL nor_1274_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL nor_1268_nl : STD_LOGIC;
  SIGNAL nor_1269_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL nor_1262_nl : STD_LOGIC;
  SIGNAL nor_1263_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL nor_1260_nl : STD_LOGIC;
  SIGNAL nor_1261_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL nor_1256_nl : STD_LOGIC;
  SIGNAL nor_1257_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL nor_1253_nl : STD_LOGIC;
  SIGNAL nor_1254_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL nor_1248_nl : STD_LOGIC;
  SIGNAL nor_1249_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL nor_1245_nl : STD_LOGIC;
  SIGNAL nor_1246_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL nor_1241_nl : STD_LOGIC;
  SIGNAL nor_1242_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL nor_1237_nl : STD_LOGIC;
  SIGNAL nor_1238_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL nor_1232_nl : STD_LOGIC;
  SIGNAL nor_1233_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL nor_1228_nl : STD_LOGIC;
  SIGNAL nor_1229_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL nor_1224_nl : STD_LOGIC;
  SIGNAL nor_1225_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL nor_1220_nl : STD_LOGIC;
  SIGNAL nor_1221_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL nor_1215_nl : STD_LOGIC;
  SIGNAL nor_1216_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL nor_1210_nl : STD_LOGIC;
  SIGNAL nor_1211_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL or_1206_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL nor_1205_nl : STD_LOGIC;
  SIGNAL nor_1206_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL nor_1203_nl : STD_LOGIC;
  SIGNAL nor_1204_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL nor_1199_nl : STD_LOGIC;
  SIGNAL nor_1200_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL nor_1196_nl : STD_LOGIC;
  SIGNAL nor_1197_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL nor_1191_nl : STD_LOGIC;
  SIGNAL nor_1192_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL nor_1189_nl : STD_LOGIC;
  SIGNAL nor_1190_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL nor_1185_nl : STD_LOGIC;
  SIGNAL nor_1186_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL nor_1182_nl : STD_LOGIC;
  SIGNAL nor_1183_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL nor_1178_nl : STD_LOGIC;
  SIGNAL nor_1179_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL nor_1175_nl : STD_LOGIC;
  SIGNAL nor_1176_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL nor_1172_nl : STD_LOGIC;
  SIGNAL nor_1173_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC;
  SIGNAL nor_1169_nl : STD_LOGIC;
  SIGNAL nor_1170_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL nor_1165_nl : STD_LOGIC;
  SIGNAL nor_1166_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL nor_1163_nl : STD_LOGIC;
  SIGNAL nor_1164_nl : STD_LOGIC;
  SIGNAL mux_300_nl : STD_LOGIC;
  SIGNAL nor_1160_nl : STD_LOGIC;
  SIGNAL nor_1161_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL nor_1157_nl : STD_LOGIC;
  SIGNAL nor_1158_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL nor_1153_nl : STD_LOGIC;
  SIGNAL nor_1154_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL nor_1150_nl : STD_LOGIC;
  SIGNAL nor_1151_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL nor_1147_nl : STD_LOGIC;
  SIGNAL nor_1148_nl : STD_LOGIC;
  SIGNAL mux_310_nl : STD_LOGIC;
  SIGNAL nor_1144_nl : STD_LOGIC;
  SIGNAL nor_1145_nl : STD_LOGIC;
  SIGNAL mux_312_nl : STD_LOGIC;
  SIGNAL nor_1140_nl : STD_LOGIC;
  SIGNAL nor_1141_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL nor_1136_nl : STD_LOGIC;
  SIGNAL nor_1137_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL nor_1133_nl : STD_LOGIC;
  SIGNAL nor_1134_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL nor_1129_nl : STD_LOGIC;
  SIGNAL nor_1130_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL nor_1125_nl : STD_LOGIC;
  SIGNAL nor_1126_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL nor_1121_nl : STD_LOGIC;
  SIGNAL nor_1122_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL nor_1118_nl : STD_LOGIC;
  SIGNAL nor_1119_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC;
  SIGNAL nor_1114_nl : STD_LOGIC;
  SIGNAL nor_1115_nl : STD_LOGIC;
  SIGNAL mux_328_nl : STD_LOGIC;
  SIGNAL nor_1110_nl : STD_LOGIC;
  SIGNAL nor_1111_nl : STD_LOGIC;
  SIGNAL mux_330_nl : STD_LOGIC;
  SIGNAL nor_1107_nl : STD_LOGIC;
  SIGNAL nor_1108_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL or_1205_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL nor_1101_nl : STD_LOGIC;
  SIGNAL nor_1102_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL nor_1099_nl : STD_LOGIC;
  SIGNAL nor_1100_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL nor_1094_nl : STD_LOGIC;
  SIGNAL nor_1095_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL nor_1090_nl : STD_LOGIC;
  SIGNAL nor_1091_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL nor_1085_nl : STD_LOGIC;
  SIGNAL nor_1086_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL nor_1083_nl : STD_LOGIC;
  SIGNAL nor_1084_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL nor_1078_nl : STD_LOGIC;
  SIGNAL nor_1079_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL nor_1074_nl : STD_LOGIC;
  SIGNAL nor_1075_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL nor_1070_nl : STD_LOGIC;
  SIGNAL nor_1071_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL nor_1067_nl : STD_LOGIC;
  SIGNAL nor_1068_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_1063_nl : STD_LOGIC;
  SIGNAL nor_1064_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL nor_1059_nl : STD_LOGIC;
  SIGNAL nor_1060_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_1055_nl : STD_LOGIC;
  SIGNAL nor_1056_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL nor_1053_nl : STD_LOGIC;
  SIGNAL nor_1054_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL nor_1049_nl : STD_LOGIC;
  SIGNAL nor_1050_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL nor_1045_nl : STD_LOGIC;
  SIGNAL nor_1046_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL nor_1041_nl : STD_LOGIC;
  SIGNAL nor_1042_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL nor_1038_nl : STD_LOGIC;
  SIGNAL nor_1039_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL nor_1034_nl : STD_LOGIC;
  SIGNAL nor_1035_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL nor_1030_nl : STD_LOGIC;
  SIGNAL nor_1031_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL nor_1026_nl : STD_LOGIC;
  SIGNAL nor_1027_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL nor_1022_nl : STD_LOGIC;
  SIGNAL nor_1023_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL nor_1018_nl : STD_LOGIC;
  SIGNAL nor_1019_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL nor_1013_nl : STD_LOGIC;
  SIGNAL nor_1014_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL nor_1009_nl : STD_LOGIC;
  SIGNAL nor_1010_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_1005_nl : STD_LOGIC;
  SIGNAL nor_1006_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL nor_1001_nl : STD_LOGIC;
  SIGNAL nor_1002_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL nor_996_nl : STD_LOGIC;
  SIGNAL nor_997_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL nor_992_nl : STD_LOGIC;
  SIGNAL nor_993_nl : STD_LOGIC;
  SIGNAL mux_392_nl : STD_LOGIC;
  SIGNAL nor_990_nl : STD_LOGIC;
  SIGNAL nor_991_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL nor_987_nl : STD_LOGIC;
  SIGNAL nor_988_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL nor_983_nl : STD_LOGIC;
  SIGNAL nor_984_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL nor_979_nl : STD_LOGIC;
  SIGNAL nor_980_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL nor_976_nl : STD_LOGIC;
  SIGNAL nor_977_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL nor_972_nl : STD_LOGIC;
  SIGNAL nor_973_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL nor_968_nl : STD_LOGIC;
  SIGNAL nor_969_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL nor_964_nl : STD_LOGIC;
  SIGNAL nor_965_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL nor_961_nl : STD_LOGIC;
  SIGNAL nor_962_nl : STD_LOGIC;
  SIGNAL mux_410_nl : STD_LOGIC;
  SIGNAL nor_957_nl : STD_LOGIC;
  SIGNAL nor_958_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nor_953_nl : STD_LOGIC;
  SIGNAL nor_954_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL nor_950_nl : STD_LOGIC;
  SIGNAL nor_951_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL nor_947_nl : STD_LOGIC;
  SIGNAL nor_948_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL nor_944_nl : STD_LOGIC;
  SIGNAL nor_945_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL nor_940_nl : STD_LOGIC;
  SIGNAL nor_941_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL nor_937_nl : STD_LOGIC;
  SIGNAL nor_938_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL nor_934_nl : STD_LOGIC;
  SIGNAL nor_935_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL nor_932_nl : STD_LOGIC;
  SIGNAL nor_933_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL nor_928_nl : STD_LOGIC;
  SIGNAL nor_929_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL nor_925_nl : STD_LOGIC;
  SIGNAL nor_926_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL nor_922_nl : STD_LOGIC;
  SIGNAL nor_923_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL nor_919_nl : STD_LOGIC;
  SIGNAL nor_920_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL nor_915_nl : STD_LOGIC;
  SIGNAL nor_916_nl : STD_LOGIC;
  SIGNAL mux_438_nl : STD_LOGIC;
  SIGNAL nor_912_nl : STD_LOGIC;
  SIGNAL nor_913_nl : STD_LOGIC;
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL nor_908_nl : STD_LOGIC;
  SIGNAL nor_909_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL nor_906_nl : STD_LOGIC;
  SIGNAL nor_907_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL nor_901_nl : STD_LOGIC;
  SIGNAL nor_902_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL nor_898_nl : STD_LOGIC;
  SIGNAL nor_899_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL nor_894_nl : STD_LOGIC;
  SIGNAL nor_895_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL nor_892_nl : STD_LOGIC;
  SIGNAL nor_893_nl : STD_LOGIC;
  SIGNAL mux_452_nl : STD_LOGIC;
  SIGNAL nor_887_nl : STD_LOGIC;
  SIGNAL nor_888_nl : STD_LOGIC;
  SIGNAL mux_454_nl : STD_LOGIC;
  SIGNAL or_1204_nl : STD_LOGIC;
  SIGNAL SHIFT_LOOP_n_SHIFT_LOOP_n_mux_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL SHIFT_LOOP_n_or_nl : STD_LOGIC;
  SIGNAL MAC_LOOP_n_nor_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL nor_1291_nl : STD_LOGIC;
  SIGNAL and_2681_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL nor_1280_nl : STD_LOGIC;
  SIGNAL and_2690_nl : STD_LOGIC;
  SIGNAL mux_236_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL nor_1266_nl : STD_LOGIC;
  SIGNAL and_2702_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL nor_1255_nl : STD_LOGIC;
  SIGNAL and_2711_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL nor_1236_nl : STD_LOGIC;
  SIGNAL and_2726_nl : STD_LOGIC;
  SIGNAL mux_259_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL nor_1223_nl : STD_LOGIC;
  SIGNAL and_2735_nl : STD_LOGIC;
  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL nor_1209_nl : STD_LOGIC;
  SIGNAL and_2747_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL nor_1198_nl : STD_LOGIC;
  SIGNAL and_2756_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL mux_281_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL nor_1181_nl : STD_LOGIC;
  SIGNAL and_2771_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL nor_1171_nl : STD_LOGIC;
  SIGNAL and_2780_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL nor_1156_nl : STD_LOGIC;
  SIGNAL and_2795_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL nor_1146_nl : STD_LOGIC;
  SIGNAL and_2804_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC;
  SIGNAL mux_319_nl : STD_LOGIC;
  SIGNAL nor_1128_nl : STD_LOGIC;
  SIGNAL and_2819_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL mux_323_nl : STD_LOGIC;
  SIGNAL mux_325_nl : STD_LOGIC;
  SIGNAL nor_1117_nl : STD_LOGIC;
  SIGNAL and_2828_nl : STD_LOGIC;
  SIGNAL mux_327_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL nor_1105_nl : STD_LOGIC;
  SIGNAL and_2840_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL nor_1093_nl : STD_LOGIC;
  SIGNAL and_2849_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL mux_343_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL nor_1073_nl : STD_LOGIC;
  SIGNAL and_2864_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL nor_1062_nl : STD_LOGIC;
  SIGNAL and_2873_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL nor_1044_nl : STD_LOGIC;
  SIGNAL and_2888_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL nor_1033_nl : STD_LOGIC;
  SIGNAL and_2897_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL nor_1012_nl : STD_LOGIC;
  SIGNAL and_2912_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL nor_1000_nl : STD_LOGIC;
  SIGNAL and_2921_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL mux_391_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL mux_395_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL nor_982_nl : STD_LOGIC;
  SIGNAL and_2936_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL nor_971_nl : STD_LOGIC;
  SIGNAL and_2945_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL mux_407_nl : STD_LOGIC;
  SIGNAL mux_409_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL nor_952_nl : STD_LOGIC;
  SIGNAL and_2960_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL nor_943_nl : STD_LOGIC;
  SIGNAL and_2969_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_927_nl : STD_LOGIC;
  SIGNAL and_2984_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL nor_918_nl : STD_LOGIC;
  SIGNAL and_2993_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL mux_439_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL nor_900_nl : STD_LOGIC;
  SIGNAL and_3008_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL nor_891_nl : STD_LOGIC;
  SIGNAL and_3016_nl : STD_LOGIC;
  SIGNAL mux_453_nl : STD_LOGIC;
  SIGNAL SHIFT_LOOP_acc_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL SHIFT_LOOP_mux_129_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL MAC_LOOP_mux_7_nl : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL MAC_LOOP_mux_8_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL MAC_LOOP_mul_1_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL MAC_LOOP_mux_9_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL MAC_LOOP_mux_10_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL i_sample_rsci_dat : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL i_sample_rsci_idat_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);

  SIGNAL b_rsci_dat : STD_LOGIC_VECTOR (1269 DOWNTO 0);
  SIGNAL b_rsci_idat_1 : STD_LOGIC_VECTOR (1269 DOWNTO 0);

  SIGNAL y_rsci_idat : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL y_rsci_dat : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT fir_filter_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      SHIFT_LOOP_C_0_tr0 : IN STD_LOGIC;
      MAC_LOOP_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_filter_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL fir_filter_core_core_fsm_inst_SHIFT_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL fir_filter_core_core_fsm_inst_MAC_LOOP_C_0_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_10_127_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_30 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_31 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_32 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_33 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_34 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_35 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_36 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_37 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_38 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_39 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_40 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_41 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_42 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_43 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_44 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_45 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_46 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_47 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_48 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_49 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_50 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_51 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_52 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_53 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_54 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_55 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_56 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_57 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_58 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_59 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_60 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_61 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_62 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_63 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_64 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_65 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_66 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_67 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_68 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_69 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_70 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_71 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_72 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_73 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_74 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_75 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_76 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_77 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_78 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_79 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_80 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_81 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_82 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_83 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_84 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_85 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_86 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_87 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_88 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_89 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_90 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_91 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_92 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_93 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_94 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_95 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_96 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_97 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_98 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_99 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_100 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_101 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_102 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_103 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_104 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_105 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_106 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_107 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_108 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_109 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_110 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_111 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_112 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_113 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_114 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_115 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_116 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_117 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_118 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_119 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_120 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_121 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_122 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_123 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_124 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_125 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_126 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000000" =>
          result := input_0;
        WHEN "0000001" =>
          result := input_1;
        WHEN "0000010" =>
          result := input_2;
        WHEN "0000011" =>
          result := input_3;
        WHEN "0000100" =>
          result := input_4;
        WHEN "0000101" =>
          result := input_5;
        WHEN "0000110" =>
          result := input_6;
        WHEN "0000111" =>
          result := input_7;
        WHEN "0001000" =>
          result := input_8;
        WHEN "0001001" =>
          result := input_9;
        WHEN "0001010" =>
          result := input_10;
        WHEN "0001011" =>
          result := input_11;
        WHEN "0001100" =>
          result := input_12;
        WHEN "0001101" =>
          result := input_13;
        WHEN "0001110" =>
          result := input_14;
        WHEN "0001111" =>
          result := input_15;
        WHEN "0010000" =>
          result := input_16;
        WHEN "0010001" =>
          result := input_17;
        WHEN "0010010" =>
          result := input_18;
        WHEN "0010011" =>
          result := input_19;
        WHEN "0010100" =>
          result := input_20;
        WHEN "0010101" =>
          result := input_21;
        WHEN "0010110" =>
          result := input_22;
        WHEN "0010111" =>
          result := input_23;
        WHEN "0011000" =>
          result := input_24;
        WHEN "0011001" =>
          result := input_25;
        WHEN "0011010" =>
          result := input_26;
        WHEN "0011011" =>
          result := input_27;
        WHEN "0011100" =>
          result := input_28;
        WHEN "0011101" =>
          result := input_29;
        WHEN "0011110" =>
          result := input_30;
        WHEN "0011111" =>
          result := input_31;
        WHEN "0100000" =>
          result := input_32;
        WHEN "0100001" =>
          result := input_33;
        WHEN "0100010" =>
          result := input_34;
        WHEN "0100011" =>
          result := input_35;
        WHEN "0100100" =>
          result := input_36;
        WHEN "0100101" =>
          result := input_37;
        WHEN "0100110" =>
          result := input_38;
        WHEN "0100111" =>
          result := input_39;
        WHEN "0101000" =>
          result := input_40;
        WHEN "0101001" =>
          result := input_41;
        WHEN "0101010" =>
          result := input_42;
        WHEN "0101011" =>
          result := input_43;
        WHEN "0101100" =>
          result := input_44;
        WHEN "0101101" =>
          result := input_45;
        WHEN "0101110" =>
          result := input_46;
        WHEN "0101111" =>
          result := input_47;
        WHEN "0110000" =>
          result := input_48;
        WHEN "0110001" =>
          result := input_49;
        WHEN "0110010" =>
          result := input_50;
        WHEN "0110011" =>
          result := input_51;
        WHEN "0110100" =>
          result := input_52;
        WHEN "0110101" =>
          result := input_53;
        WHEN "0110110" =>
          result := input_54;
        WHEN "0110111" =>
          result := input_55;
        WHEN "0111000" =>
          result := input_56;
        WHEN "0111001" =>
          result := input_57;
        WHEN "0111010" =>
          result := input_58;
        WHEN "0111011" =>
          result := input_59;
        WHEN "0111100" =>
          result := input_60;
        WHEN "0111101" =>
          result := input_61;
        WHEN "0111110" =>
          result := input_62;
        WHEN "0111111" =>
          result := input_63;
        WHEN "1000000" =>
          result := input_64;
        WHEN "1000001" =>
          result := input_65;
        WHEN "1000010" =>
          result := input_66;
        WHEN "1000011" =>
          result := input_67;
        WHEN "1000100" =>
          result := input_68;
        WHEN "1000101" =>
          result := input_69;
        WHEN "1000110" =>
          result := input_70;
        WHEN "1000111" =>
          result := input_71;
        WHEN "1001000" =>
          result := input_72;
        WHEN "1001001" =>
          result := input_73;
        WHEN "1001010" =>
          result := input_74;
        WHEN "1001011" =>
          result := input_75;
        WHEN "1001100" =>
          result := input_76;
        WHEN "1001101" =>
          result := input_77;
        WHEN "1001110" =>
          result := input_78;
        WHEN "1001111" =>
          result := input_79;
        WHEN "1010000" =>
          result := input_80;
        WHEN "1010001" =>
          result := input_81;
        WHEN "1010010" =>
          result := input_82;
        WHEN "1010011" =>
          result := input_83;
        WHEN "1010100" =>
          result := input_84;
        WHEN "1010101" =>
          result := input_85;
        WHEN "1010110" =>
          result := input_86;
        WHEN "1010111" =>
          result := input_87;
        WHEN "1011000" =>
          result := input_88;
        WHEN "1011001" =>
          result := input_89;
        WHEN "1011010" =>
          result := input_90;
        WHEN "1011011" =>
          result := input_91;
        WHEN "1011100" =>
          result := input_92;
        WHEN "1011101" =>
          result := input_93;
        WHEN "1011110" =>
          result := input_94;
        WHEN "1011111" =>
          result := input_95;
        WHEN "1100000" =>
          result := input_96;
        WHEN "1100001" =>
          result := input_97;
        WHEN "1100010" =>
          result := input_98;
        WHEN "1100011" =>
          result := input_99;
        WHEN "1100100" =>
          result := input_100;
        WHEN "1100101" =>
          result := input_101;
        WHEN "1100110" =>
          result := input_102;
        WHEN "1100111" =>
          result := input_103;
        WHEN "1101000" =>
          result := input_104;
        WHEN "1101001" =>
          result := input_105;
        WHEN "1101010" =>
          result := input_106;
        WHEN "1101011" =>
          result := input_107;
        WHEN "1101100" =>
          result := input_108;
        WHEN "1101101" =>
          result := input_109;
        WHEN "1101110" =>
          result := input_110;
        WHEN "1101111" =>
          result := input_111;
        WHEN "1110000" =>
          result := input_112;
        WHEN "1110001" =>
          result := input_113;
        WHEN "1110010" =>
          result := input_114;
        WHEN "1110011" =>
          result := input_115;
        WHEN "1110100" =>
          result := input_116;
        WHEN "1110101" =>
          result := input_117;
        WHEN "1110110" =>
          result := input_118;
        WHEN "1110111" =>
          result := input_119;
        WHEN "1111000" =>
          result := input_120;
        WHEN "1111001" =>
          result := input_121;
        WHEN "1111010" =>
          result := input_122;
        WHEN "1111011" =>
          result := input_123;
        WHEN "1111100" =>
          result := input_124;
        WHEN "1111101" =>
          result := input_125;
        WHEN others =>
          result := input_126;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_13_2_2(input_0 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(12 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_19_2_2(input_0 : STD_LOGIC_VECTOR(18 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(18 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(18 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_20_2_2(input_0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(19 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_127_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_30 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_31 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_32 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_33 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_34 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_35 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_36 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_37 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_38 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_39 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_40 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_41 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_42 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_43 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_44 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_45 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_46 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_47 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_48 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_49 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_50 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_51 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_52 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_53 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_54 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_55 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_56 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_57 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_58 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_59 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_60 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_61 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_62 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_63 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_64 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_65 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_66 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_67 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_68 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_69 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_70 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_71 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_72 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_73 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_74 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_75 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_76 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_77 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_78 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_79 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_80 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_81 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_82 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_83 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_84 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_85 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_86 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_87 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_88 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_89 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_90 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_91 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_92 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_93 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_94 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_95 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_96 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_97 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_98 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_99 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_100 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_101 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_102 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_103 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_104 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_105 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_106 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_107 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_108 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_109 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_110 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_111 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_112 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_113 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_114 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_115 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_116 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_117 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_118 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_119 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_120 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_121 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_122 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_123 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_124 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_125 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_126 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000000" =>
          result := input_0;
        WHEN "0000001" =>
          result := input_1;
        WHEN "0000010" =>
          result := input_2;
        WHEN "0000011" =>
          result := input_3;
        WHEN "0000100" =>
          result := input_4;
        WHEN "0000101" =>
          result := input_5;
        WHEN "0000110" =>
          result := input_6;
        WHEN "0000111" =>
          result := input_7;
        WHEN "0001000" =>
          result := input_8;
        WHEN "0001001" =>
          result := input_9;
        WHEN "0001010" =>
          result := input_10;
        WHEN "0001011" =>
          result := input_11;
        WHEN "0001100" =>
          result := input_12;
        WHEN "0001101" =>
          result := input_13;
        WHEN "0001110" =>
          result := input_14;
        WHEN "0001111" =>
          result := input_15;
        WHEN "0010000" =>
          result := input_16;
        WHEN "0010001" =>
          result := input_17;
        WHEN "0010010" =>
          result := input_18;
        WHEN "0010011" =>
          result := input_19;
        WHEN "0010100" =>
          result := input_20;
        WHEN "0010101" =>
          result := input_21;
        WHEN "0010110" =>
          result := input_22;
        WHEN "0010111" =>
          result := input_23;
        WHEN "0011000" =>
          result := input_24;
        WHEN "0011001" =>
          result := input_25;
        WHEN "0011010" =>
          result := input_26;
        WHEN "0011011" =>
          result := input_27;
        WHEN "0011100" =>
          result := input_28;
        WHEN "0011101" =>
          result := input_29;
        WHEN "0011110" =>
          result := input_30;
        WHEN "0011111" =>
          result := input_31;
        WHEN "0100000" =>
          result := input_32;
        WHEN "0100001" =>
          result := input_33;
        WHEN "0100010" =>
          result := input_34;
        WHEN "0100011" =>
          result := input_35;
        WHEN "0100100" =>
          result := input_36;
        WHEN "0100101" =>
          result := input_37;
        WHEN "0100110" =>
          result := input_38;
        WHEN "0100111" =>
          result := input_39;
        WHEN "0101000" =>
          result := input_40;
        WHEN "0101001" =>
          result := input_41;
        WHEN "0101010" =>
          result := input_42;
        WHEN "0101011" =>
          result := input_43;
        WHEN "0101100" =>
          result := input_44;
        WHEN "0101101" =>
          result := input_45;
        WHEN "0101110" =>
          result := input_46;
        WHEN "0101111" =>
          result := input_47;
        WHEN "0110000" =>
          result := input_48;
        WHEN "0110001" =>
          result := input_49;
        WHEN "0110010" =>
          result := input_50;
        WHEN "0110011" =>
          result := input_51;
        WHEN "0110100" =>
          result := input_52;
        WHEN "0110101" =>
          result := input_53;
        WHEN "0110110" =>
          result := input_54;
        WHEN "0110111" =>
          result := input_55;
        WHEN "0111000" =>
          result := input_56;
        WHEN "0111001" =>
          result := input_57;
        WHEN "0111010" =>
          result := input_58;
        WHEN "0111011" =>
          result := input_59;
        WHEN "0111100" =>
          result := input_60;
        WHEN "0111101" =>
          result := input_61;
        WHEN "0111110" =>
          result := input_62;
        WHEN "0111111" =>
          result := input_63;
        WHEN "1000000" =>
          result := input_64;
        WHEN "1000001" =>
          result := input_65;
        WHEN "1000010" =>
          result := input_66;
        WHEN "1000011" =>
          result := input_67;
        WHEN "1000100" =>
          result := input_68;
        WHEN "1000101" =>
          result := input_69;
        WHEN "1000110" =>
          result := input_70;
        WHEN "1000111" =>
          result := input_71;
        WHEN "1001000" =>
          result := input_72;
        WHEN "1001001" =>
          result := input_73;
        WHEN "1001010" =>
          result := input_74;
        WHEN "1001011" =>
          result := input_75;
        WHEN "1001100" =>
          result := input_76;
        WHEN "1001101" =>
          result := input_77;
        WHEN "1001110" =>
          result := input_78;
        WHEN "1001111" =>
          result := input_79;
        WHEN "1010000" =>
          result := input_80;
        WHEN "1010001" =>
          result := input_81;
        WHEN "1010010" =>
          result := input_82;
        WHEN "1010011" =>
          result := input_83;
        WHEN "1010100" =>
          result := input_84;
        WHEN "1010101" =>
          result := input_85;
        WHEN "1010110" =>
          result := input_86;
        WHEN "1010111" =>
          result := input_87;
        WHEN "1011000" =>
          result := input_88;
        WHEN "1011001" =>
          result := input_89;
        WHEN "1011010" =>
          result := input_90;
        WHEN "1011011" =>
          result := input_91;
        WHEN "1011100" =>
          result := input_92;
        WHEN "1011101" =>
          result := input_93;
        WHEN "1011110" =>
          result := input_94;
        WHEN "1011111" =>
          result := input_95;
        WHEN "1100000" =>
          result := input_96;
        WHEN "1100001" =>
          result := input_97;
        WHEN "1100010" =>
          result := input_98;
        WHEN "1100011" =>
          result := input_99;
        WHEN "1100100" =>
          result := input_100;
        WHEN "1100101" =>
          result := input_101;
        WHEN "1100110" =>
          result := input_102;
        WHEN "1100111" =>
          result := input_103;
        WHEN "1101000" =>
          result := input_104;
        WHEN "1101001" =>
          result := input_105;
        WHEN "1101010" =>
          result := input_106;
        WHEN "1101011" =>
          result := input_107;
        WHEN "1101100" =>
          result := input_108;
        WHEN "1101101" =>
          result := input_109;
        WHEN "1101110" =>
          result := input_110;
        WHEN "1101111" =>
          result := input_111;
        WHEN "1110000" =>
          result := input_112;
        WHEN "1110001" =>
          result := input_113;
        WHEN "1110010" =>
          result := input_114;
        WHEN "1110011" =>
          result := input_115;
        WHEN "1110100" =>
          result := input_116;
        WHEN "1110101" =>
          result := input_117;
        WHEN "1110110" =>
          result := input_118;
        WHEN "1110111" =>
          result := input_119;
        WHEN "1111000" =>
          result := input_120;
        WHEN "1111001" =>
          result := input_121;
        WHEN "1111010" =>
          result := input_122;
        WHEN "1111011" =>
          result := input_123;
        WHEN "1111100" =>
          result := input_124;
        WHEN "1111101" =>
          result := input_125;
        WHEN others =>
          result := input_126;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_2_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_7_2_2(input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  i_sample_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 3
      )
    PORT MAP(
      dat => i_sample_rsci_dat,
      idat => i_sample_rsci_idat_1
    );
  i_sample_rsci_dat <= i_sample_rsc_dat;
  i_sample_rsci_idat <= i_sample_rsci_idat_1;

  b_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 1270
      )
    PORT MAP(
      dat => b_rsci_dat,
      idat => b_rsci_idat_1
    );
  b_rsci_dat <= b_rsc_dat;
  b_rsci_idat <= b_rsci_idat_1;

  y_rsci : work.ccs_out_pkg_v1.ccs_out_v1
    GENERIC MAP(
      rscid => 3,
      width => 9
      )
    PORT MAP(
      idat => y_rsci_idat,
      dat => y_rsci_dat
    );
  y_rsci_idat <= y_rsci_idat_8 & y_rsci_idat_7_1 & y_rsci_idat_0;
  y_rsc_dat <= y_rsci_dat;

  i_sample_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_b_rsc_triosy_obj_ld_cse,
      lz => i_sample_rsc_triosy_lz
    );
  b_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_b_rsc_triosy_obj_ld_cse,
      lz => b_rsc_triosy_lz
    );
  y_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => y_rsc_triosy_obj_ld,
      lz => y_rsc_triosy_lz
    );
  fir_filter_core_core_fsm_inst : fir_filter_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => fir_filter_core_core_fsm_inst_fsm_output,
      SHIFT_LOOP_C_0_tr0 => fir_filter_core_core_fsm_inst_SHIFT_LOOP_C_0_tr0,
      MAC_LOOP_C_0_tr0 => fir_filter_core_core_fsm_inst_MAC_LOOP_C_0_tr0
    );
  fsm_output <= fir_filter_core_core_fsm_inst_fsm_output;
  fir_filter_core_core_fsm_inst_SHIFT_LOOP_C_0_tr0 <= NOT z_out_1_7;
  fir_filter_core_core_fsm_inst_MAC_LOOP_C_0_tr0 <= NOT z_out_1_7;

  nor_1308_cse <= NOT(CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  nor_1309_cse <= NOT((MAC_LOOP_n_6_0_sva(4)) OR (MAC_LOOP_n_6_0_sva(6)));
  and_2667_cse <= CONV_SL_1_1(acc_2_tmp_7_1(6 DOWNTO 2)=STD_LOGIC_VECTOR'("11111"));
  and_2671_cse <= (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(5))
      AND (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(1));
  nor_1303_cse <= NOT((MAC_LOOP_n_6_0_sva(5)) OR (MAC_LOOP_n_6_0_sva(0)));
  and_2691_cse <= (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(1)) AND (acc_2_tmp_7_1(2));
  and_2736_cse <= (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(3))
      AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(1));
  and_2741_cse <= CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 1)=STD_LOGIC_VECTOR'("11111"));
  and_2829_cse <= (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(3))
      AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(1));
  nor_ovfl_sva_1 <= NOT((z_out_2(14)) OR (NOT(CONV_SL_1_1(z_out_2(13 DOWNTO 8)/=STD_LOGIC_VECTOR'("000000")))));
  and_unfl_sva_1 <= (z_out_2(14)) AND (NOT(CONV_SL_1_1(z_out_2(13 DOWNTO 8)=STD_LOGIC_VECTOR'("111111"))
      AND (CONV_SL_1_1(z_out_2(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000")))));
  nor_1310_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00000")));
  and_2668_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 2)=STD_LOGIC_VECTOR'("11111"));
  mux_220_nl <= MUX_s_1_2_2(nor_1310_cse, and_2668_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp <= (MAC_LOOP_mux_11_tmp(0)) AND mux_220_nl;
  mux_223_nl <= MUX_s_1_2_2(nor_1310_cse, and_2668_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_2 <= (MAC_LOOP_mux_11_tmp(1)) AND mux_223_nl;
  nor_1297_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0000")));
  and_2677_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 3)=STD_LOGIC_VECTOR'("1111"));
  mux_225_nl <= MUX_s_1_2_2(nor_1297_cse, and_2677_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_3 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND mux_225_nl;
  nor_1291_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(5)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2681_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_228_nl <= MUX_s_1_2_2(nor_1291_nl, and_2681_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_5 <= (MAC_LOOP_mux_11_tmp(2)) AND mux_228_nl;
  mux_230_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(2))), (MAC_LOOP_mux_11_tmp(2)),
      MAC_LOOP_mux_11_tmp(1));
  and_tmp_6 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_230_nl;
  mux_232_nl <= MUX_s_1_2_2(nor_1297_cse, and_2677_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_7 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND mux_232_nl;
  nor_1280_nl <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_2690_nl <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  mux_234_nl <= MUX_s_1_2_2(nor_1280_nl, and_2690_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_8 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 3)=STD_LOGIC_VECTOR'("1111"))
      AND mux_234_nl;
  mux_236_nl <= MUX_s_1_2_2(nor_1297_cse, and_2677_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_9 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))
      AND mux_236_nl;
  nor_1271_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000")));
  and_2698_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111"));
  mux_238_nl <= MUX_s_1_2_2(nor_1271_cse, and_2698_cse, MAC_LOOP_mux_11_tmp(3));
  and_tmp_10 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND mux_238_nl;
  nor_1266_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(5)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2702_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_241_nl <= MUX_s_1_2_2(nor_1266_nl, and_2702_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_12 <= (MAC_LOOP_mux_11_tmp(3)) AND mux_241_nl;
  mux_243_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(3))), (MAC_LOOP_mux_11_tmp(3)),
      MAC_LOOP_mux_11_tmp(1));
  and_tmp_13 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_243_nl;
  nor_1259_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(5))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2708_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_245_nl <= MUX_s_1_2_2(nor_1259_cse, and_2708_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_14 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND mux_245_nl;
  nor_1255_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)));
  and_2711_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3));
  mux_247_nl <= MUX_s_1_2_2(nor_1255_nl, and_2711_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_15 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_247_nl;
  mux_249_nl <= MUX_s_1_2_2(nor_1259_cse, and_2708_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_16 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND mux_249_nl;
  mux_251_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(3))), (MAC_LOOP_mux_11_tmp(3)),
      MAC_LOOP_mux_11_tmp(2));
  and_tmp_17 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_251_nl;
  mux_253_nl <= MUX_s_1_2_2(nor_1271_cse, and_2698_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_18 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND mux_253_nl;
  nor_1240_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_2723_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  mux_255_nl <= MUX_s_1_2_2(nor_1240_cse, and_2723_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_19 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_255_nl;
  nor_1236_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(5))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2726_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_257_nl <= MUX_s_1_2_2(nor_1236_nl, and_2726_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_20 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))
      AND mux_257_nl;
  mux_259_nl <= MUX_s_1_2_2(nor_1240_cse, and_2723_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_21 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_259_nl;
  mux_261_nl <= MUX_s_1_2_2(nor_1271_cse, and_2698_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_22 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND mux_261_nl;
  nor_1223_nl <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
  and_2735_nl <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111"));
  mux_263_nl <= MUX_s_1_2_2(nor_1223_nl, and_2735_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_23 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111"))
      AND mux_263_nl;
  mux_265_nl <= MUX_s_1_2_2(nor_1271_cse, and_2698_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_24 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111"))
      AND mux_265_nl;
  nor_1213_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_2743_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  mux_267_nl <= MUX_s_1_2_2(nor_1213_cse, and_2743_cse, MAC_LOOP_mux_11_tmp(4));
  and_tmp_25 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND mux_267_nl;
  mux_269_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(4))), (MAC_LOOP_mux_11_tmp(4)),
      MAC_LOOP_mux_11_tmp(0));
  and_tmp_26 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_269_nl;
  nor_1209_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3))
      OR (MAC_LOOP_mux_11_tmp(5)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2747_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_271_nl <= MUX_s_1_2_2(nor_1209_nl, and_2747_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_27 <= (MAC_LOOP_mux_11_tmp(4)) AND mux_271_nl;
  mux_273_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(4))), (MAC_LOOP_mux_11_tmp(4)),
      MAC_LOOP_mux_11_tmp(1));
  and_tmp_28 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_273_nl;
  nor_1202_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(5))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2753_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_275_nl <= MUX_s_1_2_2(nor_1202_cse, and_2753_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_29 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(4)) AND mux_275_nl;
  nor_1198_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(4)));
  and_2756_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4));
  mux_277_nl <= MUX_s_1_2_2(nor_1198_nl, and_2756_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_30 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_277_nl;
  mux_279_nl <= MUX_s_1_2_2(nor_1202_cse, and_2753_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_31 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND mux_279_nl;
  mux_281_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(4))), (MAC_LOOP_mux_11_tmp(4)),
      MAC_LOOP_mux_11_tmp(2));
  and_tmp_32 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_281_nl;
  nor_1188_cse <= NOT((MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(5)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2765_cse <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_283_nl <= MUX_s_1_2_2(nor_1188_cse, and_2765_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_33 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4))
      AND mux_283_nl;
  nor_1184_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4)));
  and_2768_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4));
  mux_285_nl <= MUX_s_1_2_2(nor_1184_cse, and_2768_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_34 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_285_nl;
  nor_1181_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(5))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2771_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_287_nl <= MUX_s_1_2_2(nor_1181_nl, and_2771_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_35 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND mux_287_nl;
  mux_289_nl <= MUX_s_1_2_2(nor_1184_cse, and_2768_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_36 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_289_nl;
  mux_291_nl <= MUX_s_1_2_2(nor_1188_cse, and_2765_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_37 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND mux_291_nl;
  nor_1171_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4)));
  and_2780_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4));
  mux_293_nl <= MUX_s_1_2_2(nor_1171_nl, and_2780_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_38 <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_293_nl;
  mux_295_nl <= MUX_s_1_2_2(nor_1188_cse, and_2765_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_39 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND mux_295_nl;
  mux_297_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(4))), (MAC_LOOP_mux_11_tmp(4)),
      MAC_LOOP_mux_11_tmp(3));
  and_tmp_40 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_297_nl;
  mux_299_nl <= MUX_s_1_2_2(nor_1213_cse, and_2743_cse, MAC_LOOP_mux_11_tmp(3));
  and_tmp_41 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(4)) AND mux_299_nl;
  nor_1159_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_2792_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  mux_301_nl <= MUX_s_1_2_2(nor_1159_cse, and_2792_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_42 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_301_nl;
  nor_1156_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(5))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2795_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_303_nl <= MUX_s_1_2_2(nor_1156_nl, and_2795_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_43 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"))
      AND mux_303_nl;
  mux_305_nl <= MUX_s_1_2_2(nor_1159_cse, and_2792_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_44 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_305_nl;
  nor_1149_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(5)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2801_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_307_nl <= MUX_s_1_2_2(nor_1149_cse, and_2801_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_45 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND mux_307_nl;
  nor_1146_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(4)));
  and_2804_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4));
  mux_309_nl <= MUX_s_1_2_2(nor_1146_nl, and_2804_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_46 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_309_nl;
  mux_311_nl <= MUX_s_1_2_2(nor_1149_cse, and_2801_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_47 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND mux_311_nl;
  mux_313_nl <= MUX_s_1_2_2(nor_1159_cse, and_2792_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_48 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(5))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_313_nl;
  mux_315_nl <= MUX_s_1_2_2(nor_1213_cse, and_2743_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_49 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND mux_315_nl;
  nor_1132_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000")));
  and_2816_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  mux_317_nl <= MUX_s_1_2_2(nor_1132_cse, and_2816_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_50 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_317_nl;
  nor_1128_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(5)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2819_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_319_nl <= MUX_s_1_2_2(nor_1128_nl, and_2819_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_51 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"))
      AND mux_319_nl;
  mux_321_nl <= MUX_s_1_2_2(nor_1132_cse, and_2816_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_52 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_321_nl;
  mux_323_nl <= MUX_s_1_2_2(nor_1213_cse, and_2743_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_53 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND mux_323_nl;
  nor_1117_nl <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000")));
  and_2828_nl <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1111"));
  mux_325_nl <= MUX_s_1_2_2(nor_1117_nl, and_2828_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_54 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"))
      AND mux_325_nl;
  mux_327_nl <= MUX_s_1_2_2(nor_1213_cse, and_2743_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_55 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1111"))
      AND mux_327_nl;
  mux_329_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(6))), (MAC_LOOP_mux_11_tmp(6)),
      MAC_LOOP_mux_11_tmp(5));
  and_tmp_56 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111"))
      AND mux_329_nl;
  mux_331_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(5))), (MAC_LOOP_mux_11_tmp(5)),
      MAC_LOOP_mux_11_tmp(0));
  and_tmp_57 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_331_nl;
  nor_1105_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3))
      OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2840_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_333_nl <= MUX_s_1_2_2(nor_1105_nl, and_2840_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_58 <= (MAC_LOOP_mux_11_tmp(5)) AND mux_333_nl;
  mux_335_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(5))), (MAC_LOOP_mux_11_tmp(5)),
      MAC_LOOP_mux_11_tmp(1));
  and_tmp_59 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_335_nl;
  nor_1098_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2846_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_337_nl <= MUX_s_1_2_2(nor_1098_cse, and_2846_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_60 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_337_nl;
  nor_1093_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2849_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_339_nl <= MUX_s_1_2_2(nor_1093_nl, and_2849_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_61 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_339_nl;
  mux_341_nl <= MUX_s_1_2_2(nor_1098_cse, and_2846_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_62 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_341_nl;
  mux_343_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(5))), (MAC_LOOP_mux_11_tmp(5)),
      MAC_LOOP_mux_11_tmp(2));
  and_tmp_63 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_343_nl;
  nor_1082_cse <= NOT((MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2858_cse <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_345_nl <= MUX_s_1_2_2(nor_1082_cse, and_2858_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_64 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_345_nl;
  nor_1077_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2861_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_347_nl <= MUX_s_1_2_2(nor_1077_cse, and_2861_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_65 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_347_nl;
  nor_1073_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2864_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_349_nl <= MUX_s_1_2_2(nor_1073_nl, and_2864_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_66 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_349_nl;
  mux_351_nl <= MUX_s_1_2_2(nor_1077_cse, and_2861_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_67 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_351_nl;
  mux_353_nl <= MUX_s_1_2_2(nor_1082_cse, and_2858_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_68 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_353_nl;
  nor_1062_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2873_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_355_nl <= MUX_s_1_2_2(nor_1062_nl, and_2873_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_69 <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_355_nl;
  mux_357_nl <= MUX_s_1_2_2(nor_1082_cse, and_2858_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_70 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_357_nl;
  mux_359_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(5))), (MAC_LOOP_mux_11_tmp(5)),
      MAC_LOOP_mux_11_tmp(3));
  and_tmp_71 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_359_nl;
  nor_1052_cse <= NOT((MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2882_cse <= (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_361_nl <= MUX_s_1_2_2(nor_1052_cse, and_2882_cse, MAC_LOOP_mux_11_tmp(3));
  and_tmp_72 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_361_nl;
  nor_1048_cse <= NOT((MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2885_cse <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_363_nl <= MUX_s_1_2_2(nor_1048_cse, and_2885_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_73 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_363_nl;
  nor_1044_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2888_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_365_nl <= MUX_s_1_2_2(nor_1044_nl, and_2888_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_74 <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_365_nl;
  mux_367_nl <= MUX_s_1_2_2(nor_1048_cse, and_2885_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_75 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_367_nl;
  nor_1037_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2894_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_369_nl <= MUX_s_1_2_2(nor_1037_cse, and_2894_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_76 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_369_nl;
  nor_1033_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2897_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_371_nl <= MUX_s_1_2_2(nor_1033_nl, and_2897_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_77 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_371_nl;
  mux_373_nl <= MUX_s_1_2_2(nor_1037_cse, and_2894_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_78 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_373_nl;
  mux_375_nl <= MUX_s_1_2_2(nor_1048_cse, and_2885_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_79 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_375_nl;
  mux_377_nl <= MUX_s_1_2_2(nor_1052_cse, and_2882_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_80 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_377_nl;
  nor_1017_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2909_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_379_nl <= MUX_s_1_2_2(nor_1017_cse, and_2909_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_81 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_379_nl;
  nor_1012_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2912_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_381_nl <= MUX_s_1_2_2(nor_1012_nl, and_2912_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_82 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_381_nl;
  mux_383_nl <= MUX_s_1_2_2(nor_1017_cse, and_2909_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_83 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_383_nl;
  mux_385_nl <= MUX_s_1_2_2(nor_1052_cse, and_2882_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_84 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_385_nl;
  nor_1000_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3))
      OR (MAC_LOOP_mux_11_tmp(5)));
  and_2921_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5));
  mux_387_nl <= MUX_s_1_2_2(nor_1000_nl, and_2921_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_85 <= (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_387_nl;
  mux_389_nl <= MUX_s_1_2_2(nor_1052_cse, and_2882_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_86 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_389_nl;
  mux_391_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(5))), (MAC_LOOP_mux_11_tmp(5)),
      MAC_LOOP_mux_11_tmp(4));
  and_tmp_87 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_391_nl;
  mux_393_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(6))), (MAC_LOOP_mux_11_tmp(6)),
      MAC_LOOP_mux_11_tmp(4));
  and_tmp_88 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_393_nl;
  nor_986_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_2933_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_395_nl <= MUX_s_1_2_2(nor_986_cse, and_2933_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_89 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_395_nl;
  nor_982_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3))
      OR (MAC_LOOP_mux_11_tmp(6)));
  and_2936_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(6));
  mux_397_nl <= MUX_s_1_2_2(nor_982_nl, and_2936_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_90 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND mux_397_nl;
  mux_399_nl <= MUX_s_1_2_2(nor_986_cse, and_2933_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_91 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_399_nl;
  nor_975_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2942_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_401_nl <= MUX_s_1_2_2(nor_975_cse, and_2942_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_92 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_401_nl;
  nor_971_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2945_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_403_nl <= MUX_s_1_2_2(nor_971_nl, and_2945_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_93 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_403_nl;
  mux_405_nl <= MUX_s_1_2_2(nor_975_cse, and_2942_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_94 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_405_nl;
  mux_407_nl <= MUX_s_1_2_2(nor_986_cse, and_2933_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_95 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_407_nl;
  nor_960_cse <= NOT((MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2954_cse <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_409_nl <= MUX_s_1_2_2(nor_960_cse, and_2954_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_96 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_409_nl;
  nor_956_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4)) OR (MAC_LOOP_mux_11_tmp(5)));
  and_2957_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5));
  mux_411_nl <= MUX_s_1_2_2(nor_956_cse, and_2957_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_97 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_411_nl;
  nor_952_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2960_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_413_nl <= MUX_s_1_2_2(nor_952_nl, and_2960_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_98 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5))
      AND mux_413_nl;
  mux_415_nl <= MUX_s_1_2_2(nor_956_cse, and_2957_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_99 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_415_nl;
  mux_417_nl <= MUX_s_1_2_2(nor_960_cse, and_2954_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_100 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_417_nl;
  nor_943_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(5)));
  and_2969_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5));
  mux_419_nl <= MUX_s_1_2_2(nor_943_nl, and_2969_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_101 <= (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_419_nl;
  mux_421_nl <= MUX_s_1_2_2(nor_960_cse, and_2954_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_102 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_421_nl;
  mux_423_nl <= MUX_s_1_2_2(nor_986_cse, and_2933_cse, MAC_LOOP_mux_11_tmp(3));
  and_tmp_103 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(6)) AND mux_423_nl;
  mux_425_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(6))), (MAC_LOOP_mux_11_tmp(6)),
      MAC_LOOP_mux_11_tmp(3));
  and_tmp_104 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_425_nl;
  nor_931_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")));
  and_2981_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"));
  mux_427_nl <= MUX_s_1_2_2(nor_931_cse, and_2981_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_105 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_427_nl;
  nor_927_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2984_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_429_nl <= MUX_s_1_2_2(nor_927_nl, and_2984_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_106 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"))
      AND mux_429_nl;
  mux_431_nl <= MUX_s_1_2_2(nor_931_cse, and_2981_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_107 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_431_nl;
  nor_921_cse <= NOT((MAC_LOOP_mux_11_tmp(2)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_2990_cse <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_433_nl <= MUX_s_1_2_2(nor_921_cse, and_2990_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_108 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_433_nl;
  nor_918_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(3)) OR (MAC_LOOP_mux_11_tmp(4))
      OR (MAC_LOOP_mux_11_tmp(5)));
  and_2993_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5));
  mux_435_nl <= MUX_s_1_2_2(nor_918_nl, and_2993_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_109 <= (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_435_nl;
  mux_437_nl <= MUX_s_1_2_2(nor_921_cse, and_2990_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_110 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4))
      AND (MAC_LOOP_mux_11_tmp(5)) AND mux_437_nl;
  mux_439_nl <= MUX_s_1_2_2(nor_931_cse, and_2981_cse, MAC_LOOP_mux_11_tmp(2));
  and_tmp_111 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(6))
      AND mux_439_nl;
  mux_441_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(6))), (MAC_LOOP_mux_11_tmp(6)),
      MAC_LOOP_mux_11_tmp(2));
  and_tmp_112 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_441_nl;
  nor_905_cse <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000")));
  and_3005_cse <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"));
  mux_443_nl <= MUX_s_1_2_2(nor_905_cse, and_3005_cse, MAC_LOOP_mux_11_tmp(0));
  and_tmp_113 <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_443_nl;
  nor_900_nl <= NOT((MAC_LOOP_mux_11_tmp(1)) OR (MAC_LOOP_mux_11_tmp(6)));
  and_3008_nl <= (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(6));
  mux_445_nl <= MUX_s_1_2_2(nor_900_nl, and_3008_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_114 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"))
      AND mux_445_nl;
  mux_447_nl <= MUX_s_1_2_2(nor_905_cse, and_3005_cse, MAC_LOOP_mux_11_tmp(1));
  and_tmp_115 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(6)) AND mux_447_nl;
  mux_449_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(6))), (MAC_LOOP_mux_11_tmp(6)),
      MAC_LOOP_mux_11_tmp(1));
  and_tmp_116 <= (MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
      AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND mux_449_nl;
  nor_891_nl <= NOT(CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000")));
  and_3016_nl <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 1)=STD_LOGIC_VECTOR'("11111"));
  mux_451_nl <= MUX_s_1_2_2(nor_891_nl, and_3016_nl, MAC_LOOP_mux_11_tmp(0));
  and_tmp_117 <= (MAC_LOOP_mux_11_tmp(6)) AND mux_451_nl;
  mux_453_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(6))), (MAC_LOOP_mux_11_tmp(6)),
      MAC_LOOP_mux_11_tmp(0));
  and_tmp_118 <= CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 1)=STD_LOGIC_VECTOR'("11111"))
      AND mux_453_nl;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        y_rsci_idat_0 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        y_rsci_idat_0 <= (z_out_2(0)) OR nor_ovfl_sva_1 OR and_unfl_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        y_rsci_idat_7_1 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        y_rsci_idat_7_1 <= NOT(MUX_v_7_2_2(nor_5_nl, STD_LOGIC_VECTOR'("1111111"),
            and_unfl_sva_1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        y_rsci_idat_8 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        y_rsci_idat_8 <= z_out_2(14);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        i_sample_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))))
          = '1' ) THEN
        i_sample_sva <= i_sample_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_126_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT((CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 1)=STD_LOGIC_VECTOR'("111111")))
          OR (CONV_SL_1_1(acc_2_tmp_7_1(6 DOWNTO 1)=STD_LOGIC_VECTOR'("111111")))))
          AND (NOT (fsm_output(2))) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111110")))
          = '1' ) THEN
        x_126_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_125_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(((MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(2)) AND (MAC_LOOP_mux_11_tmp(3))
          AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)))
          OR ((CONV_SL_1_1(acc_2_tmp_7_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))) AND
          CONV_SL_1_1(acc_2_tmp_7_1(6 DOWNTO 2)=STD_LOGIC_VECTOR'("11111"))))) AND
          (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111101")))
          = '1' ) THEN
        x_125_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_1_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_221_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0)))
          = '1' ) THEN
        x_1_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_124_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(((CONV_SL_1_1(acc_2_tmp_7_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")))
          AND CONV_SL_1_1(acc_2_tmp_7_1(6 DOWNTO 2)=STD_LOGIC_VECTOR'("11111")))
          OR (CONV_SL_1_1(MAC_LOOP_mux_11_tmp(6 DOWNTO 2)=STD_LOGIC_VECTOR'("11111"))
          AND mux_222_nl))) AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111100")))
          = '1' ) THEN
        x_124_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_2_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_224_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND nor_1309_cse AND nor_1303_cse) = '1' ) THEN
        x_2_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_123_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(((MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
          AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)))
          OR (((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(0))) AND (acc_2_tmp_7_1(5)) AND
          (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(1)))))
          AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111011")))
          = '1' ) THEN
        x_123_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_3_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_226_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0)))
          = '1' ) THEN
        x_3_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_122_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT((((acc_2_tmp_7_1(2)) OR (NOT (acc_2_tmp_7_1(0)))) AND (acc_2_tmp_7_1(5))
          AND (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(4)) AND
          (acc_2_tmp_7_1(1))) OR ((MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(3))
          AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6))
          AND mux_227_nl))) AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111010")))
          = '1' ) THEN
        x_122_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_4_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_229_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("010")) AND nor_1309_cse AND nor_1303_cse)
          = '1' ) THEN
        x_4_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_121_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_231_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111001")))
          = '1' ) THEN
        x_121_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_5_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_233_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("010")) AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_5_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_120_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_235_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1111000")))
          = '1' ) THEN
        x_120_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_6_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_237_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("011")) AND nor_1309_cse AND nor_1303_cse)
          = '1' ) THEN
        x_6_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_119_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(((MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
          AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)))
          OR (((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(0))) AND (acc_2_tmp_7_1(5)) AND
          (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(1)))))
          AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1110111")))
          = '1' ) THEN
        x_119_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_7_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_239_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("011")) AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_7_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_118_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT((((acc_2_tmp_7_1(3)) OR (NOT (acc_2_tmp_7_1(0)))) AND (acc_2_tmp_7_1(5))
          AND (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(2)) AND
          (acc_2_tmp_7_1(1))) OR ((MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
          AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6))
          AND mux_240_nl))) AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1110110")))
          = '1' ) THEN
        x_118_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_8_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_242_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("100")) AND nor_1309_cse AND nor_1303_cse)
          = '1' ) THEN
        x_8_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_117_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_244_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1110101")))
          = '1' ) THEN
        x_117_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_9_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_246_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("100")) AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_9_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_116_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_248_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1110100")))
          = '1' ) THEN
        x_116_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_10_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_250_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("101")) AND nor_1309_cse AND nor_1303_cse)
          = '1' ) THEN
        x_10_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_115_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_252_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_115_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_11_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_254_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("101")) AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_11_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_114_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_256_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_114_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_12_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_258_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("110")) AND nor_1309_cse AND nor_1303_cse)
          = '1' ) THEN
        x_12_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_113_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_260_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND
          (MAC_LOOP_n_6_0_sva(5)) AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_113_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_13_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_262_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("110")) AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_13_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_112_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_264_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND
          (MAC_LOOP_n_6_0_sva(5)) AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_112_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_14_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_266_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND nor_1309_cse AND nor_1303_cse)
          = '1' ) THEN
        x_14_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_111_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(((MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
          AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(5)) AND (MAC_LOOP_mux_11_tmp(6)))
          OR (((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0))) AND (acc_2_tmp_7_1(5)) AND
          (acc_2_tmp_7_1(6)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(1)))))
          AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101111")))
          = '1' ) THEN
        x_111_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_15_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_268_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND nor_1309_cse AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_15_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_110_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT mux_270_nl) AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101110")))
          = '1' ) THEN
        x_110_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_16_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_272_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6)))
          AND nor_1303_cse) = '1' ) THEN
        x_16_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_109_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_274_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101101")))
          = '1' ) THEN
        x_109_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_17_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_276_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6)))
          AND (NOT (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0))) = '1' )
          THEN
        x_17_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_108_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_278_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101100")))
          = '1' ) THEN
        x_108_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_18_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_280_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND nor_1303_cse)
          = '1' ) THEN
        x_18_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_107_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_282_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101011")))
          = '1' ) THEN
        x_107_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_19_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_284_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND (NOT
          (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_19_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_106_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_286_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101010")))
          = '1' ) THEN
        x_106_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_20_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_288_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (NOT (MAC_LOOP_n_6_0_sva(3))) AND (MAC_LOOP_n_6_0_sva(4))
          AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND nor_1303_cse) = '1' ) THEN
        x_20_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_105_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_290_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101001")))
          = '1' ) THEN
        x_105_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_21_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_292_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0010101")))
          = '1' ) THEN
        x_21_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_104_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_294_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1101000")))
          = '1' ) THEN
        x_104_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_22_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_296_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (MAC_LOOP_n_6_0_sva(2))
          AND (NOT (MAC_LOOP_n_6_0_sva(3))) AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT
          (MAC_LOOP_n_6_0_sva(6))) AND nor_1303_cse) = '1' ) THEN
        x_22_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_103_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_298_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1100111")))
          = '1' ) THEN
        x_103_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_23_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_300_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0010111")))
          = '1' ) THEN
        x_23_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_102_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_302_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1100110")))
          = '1' ) THEN
        x_102_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_24_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_304_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (NOT (MAC_LOOP_n_6_0_sva(2))) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND nor_1303_cse) = '1' ) THEN
        x_24_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_101_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_306_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1100101")))
          = '1' ) THEN
        x_101_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_25_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_308_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0011001")))
          = '1' ) THEN
        x_25_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_100_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_310_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1100100")))
          = '1' ) THEN
        x_100_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_26_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_312_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (NOT
          (MAC_LOOP_n_6_0_sva(2))) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND nor_1303_cse) = '1' ) THEN
        x_26_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_99_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_314_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6)) AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_99_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_27_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_316_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0011011")))
          = '1' ) THEN
        x_27_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_98_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_318_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6)) AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_98_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_28_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_320_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND nor_1303_cse) = '1' ) THEN
        x_28_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_97_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_322_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6))
          AND (MAC_LOOP_n_6_0_sva(5)) AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_97_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_29_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_324_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0011101")))
          = '1' ) THEN
        x_29_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_96_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_326_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6))
          AND (MAC_LOOP_n_6_0_sva(5)) AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' )
          THEN
        x_96_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_30_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_328_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (MAC_LOOP_n_6_0_sva(2))
          AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6)))
          AND nor_1303_cse) = '1' ) THEN
        x_30_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_95_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(((MAC_LOOP_mux_11_tmp(0)) AND (MAC_LOOP_mux_11_tmp(1)) AND (MAC_LOOP_mux_11_tmp(2))
          AND (MAC_LOOP_mux_11_tmp(3)) AND (MAC_LOOP_mux_11_tmp(4)) AND (MAC_LOOP_mux_11_tmp(6)))
          OR (((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))) AND (acc_2_tmp_7_1(6)) AND
          (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(1)))))
          AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1011111")))
          = '1' ) THEN
        x_95_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_31_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_330_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0011111")))
          = '1' ) THEN
        x_31_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_94_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT mux_332_nl) AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_94_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_32_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_334_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5)) AND (NOT (MAC_LOOP_n_6_0_sva(0))))
          = '1' ) THEN
        x_32_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_93_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_336_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1011101")))
          = '1' ) THEN
        x_93_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_33_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_338_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5)) AND (MAC_LOOP_n_6_0_sva(0)))
          = '1' ) THEN
        x_33_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_92_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_340_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_92_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_34_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_342_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5)) AND (NOT (MAC_LOOP_n_6_0_sva(0))))
          = '1' ) THEN
        x_34_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_91_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_344_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1011011")))
          = '1' ) THEN
        x_91_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_35_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_346_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5)) AND (MAC_LOOP_n_6_0_sva(0)))
          = '1' ) THEN
        x_35_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_90_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_348_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (NOT
          (MAC_LOOP_n_6_0_sva(2))) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_90_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_36_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_350_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("010")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_36_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_89_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_352_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1011001")))
          = '1' ) THEN
        x_89_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_37_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_354_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("010")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_37_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_88_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_356_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (NOT (MAC_LOOP_n_6_0_sva(2))) AND (MAC_LOOP_n_6_0_sva(3)) AND (MAC_LOOP_n_6_0_sva(4))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_88_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_38_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_358_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("011")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_38_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_87_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_360_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1010111")))
          = '1' ) THEN
        x_87_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_39_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_362_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("011")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_39_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_86_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_364_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (MAC_LOOP_n_6_0_sva(2))
          AND (NOT (MAC_LOOP_n_6_0_sva(3))) AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6))
          AND nor_1303_cse) = '1' ) THEN
        x_86_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_40_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_366_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("100")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_40_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_85_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_368_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1010101")))
          = '1' ) THEN
        x_85_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_41_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_370_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("100")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_41_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_84_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_372_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (NOT (MAC_LOOP_n_6_0_sva(3))) AND (MAC_LOOP_n_6_0_sva(4))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_84_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_42_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_374_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("101")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_42_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_83_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_376_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND (NOT (MAC_LOOP_n_6_0_sva(5)))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_83_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_43_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_378_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("101")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_43_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_82_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_380_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse)
          = '1' ) THEN
        x_82_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_44_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_382_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("110")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_44_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_81_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_384_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND
          (NOT (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_81_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_45_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_386_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("110")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_45_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_80_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_388_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (MAC_LOOP_n_6_0_sva(6)) AND
          nor_1303_cse) = '1' ) THEN
        x_80_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_46_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_390_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_46_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_79_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_392_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1001111")))
          = '1' ) THEN
        x_79_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_47_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_394_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva(3
          DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND nor_1309_cse AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_47_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_78_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_396_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (MAC_LOOP_n_6_0_sva(2))
          AND (MAC_LOOP_n_6_0_sva(3)) AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6))
          AND nor_1303_cse) = '1' ) THEN
        x_78_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_48_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_398_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6)))
          AND (MAC_LOOP_n_6_0_sva(5)) AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' )
          THEN
        x_48_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_77_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_400_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1001101")))
          = '1' ) THEN
        x_77_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_49_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_402_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6)))
          AND (MAC_LOOP_n_6_0_sva(5)) AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_49_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_76_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_404_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (MAC_LOOP_n_6_0_sva(3)) AND (NOT (MAC_LOOP_n_6_0_sva(4)))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_76_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_50_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_406_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND (MAC_LOOP_n_6_0_sva(5))
          AND (NOT (MAC_LOOP_n_6_0_sva(0)))) = '1' ) THEN
        x_50_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_75_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_408_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1001011")))
          = '1' ) THEN
        x_75_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_51_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_410_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (MAC_LOOP_n_6_0_sva(4)) AND (NOT (MAC_LOOP_n_6_0_sva(6))) AND (MAC_LOOP_n_6_0_sva(5))
          AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_51_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_74_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_412_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (NOT
          (MAC_LOOP_n_6_0_sva(2))) AND (MAC_LOOP_n_6_0_sva(3)) AND (NOT (MAC_LOOP_n_6_0_sva(4)))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_74_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_52_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_414_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0110100")))
          = '1' ) THEN
        x_52_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_73_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_416_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1001001")))
          = '1' ) THEN
        x_73_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_53_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_418_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0110101")))
          = '1' ) THEN
        x_53_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_72_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_420_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (NOT (MAC_LOOP_n_6_0_sva(2))) AND (MAC_LOOP_n_6_0_sva(3)) AND (NOT (MAC_LOOP_n_6_0_sva(4)))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_72_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_54_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_422_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0110110")))
          = '1' ) THEN
        x_54_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_71_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_424_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1000111")))
          = '1' ) THEN
        x_71_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_55_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_426_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0110111")))
          = '1' ) THEN
        x_55_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_70_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_428_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND (MAC_LOOP_n_6_0_sva(2))
          AND (NOT (MAC_LOOP_n_6_0_sva(3))) AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND
          (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_70_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_56_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_430_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111000")))
          = '1' ) THEN
        x_56_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_69_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_432_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("1000101")))
          = '1' ) THEN
        x_69_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_57_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_434_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111001")))
          = '1' ) THEN
        x_57_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_68_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_436_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          (MAC_LOOP_n_6_0_sva(2)) AND (NOT (MAC_LOOP_n_6_0_sva(3))) AND (NOT (MAC_LOOP_n_6_0_sva(4)))
          AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse) = '1' ) THEN
        x_68_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_58_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_438_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111010")))
          = '1' ) THEN
        x_58_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_67_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_440_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6)) AND (NOT
          (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0))) = '1' ) THEN
        x_67_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_59_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_442_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111011")))
          = '1' ) THEN
        x_59_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_66_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_444_nl AND (fsm_output(1)) AND (MAC_LOOP_n_6_0_sva(1)) AND nor_1308_cse
          AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6)) AND nor_1303_cse)
          = '1' ) THEN
        x_66_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_60_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_446_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111100")))
          = '1' ) THEN
        x_60_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_65_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_448_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6))
          AND (NOT (MAC_LOOP_n_6_0_sva(5))) AND (MAC_LOOP_n_6_0_sva(0))) = '1' )
          THEN
        x_65_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_61_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_450_nl AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111101")))
          = '1' ) THEN
        x_61_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_64_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mux_452_nl AND (fsm_output(1)) AND (NOT (MAC_LOOP_n_6_0_sva(1))) AND
          nor_1308_cse AND (NOT (MAC_LOOP_n_6_0_sva(4))) AND (MAC_LOOP_n_6_0_sva(6))
          AND nor_1303_cse) = '1' ) THEN
        x_64_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_62_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT mux_454_nl) AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111110")))
          = '1' ) THEN
        x_62_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_63_lpi_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT((CONV_SL_1_1(MAC_LOOP_mux_11_tmp(5 DOWNTO 0)=STD_LOGIC_VECTOR'("111111")))
          OR (((acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))) AND CONV_SL_1_1(acc_2_tmp_7_1(5
          DOWNTO 1)=STD_LOGIC_VECTOR'("11111"))))) AND (fsm_output(1)) AND CONV_SL_1_1(MAC_LOOP_n_6_0_sva=STD_LOGIC_VECTOR'("0111111")))
          = '1' ) THEN
        x_63_lpi_2 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_0_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(2)) = '1' ) THEN
        x_0_sva <= i_sample_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        y_rsc_triosy_obj_ld <= '0';
        reg_b_rsc_triosy_obj_ld_cse <= '0';
        MAC_LOOP_n_6_0_sva <= STD_LOGIC_VECTOR'( "0000000");
        sum_sva <= STD_LOGIC_VECTOR'( "00000000000000000000");
      ELSE
        y_rsc_triosy_obj_ld <= fsm_output(3);
        reg_b_rsc_triosy_obj_ld_cse <= (NOT z_out_1_7) AND (fsm_output(2));
        MAC_LOOP_n_6_0_sva <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), SHIFT_LOOP_n_SHIFT_LOOP_n_mux_nl,
            MAC_LOOP_n_nor_nl);
        sum_sva <= MUX_v_20_2_2(STD_LOGIC_VECTOR'("00000000000000000000"), z_out_2,
            (fsm_output(2)));
      END IF;
    END IF;
  END PROCESS;
  nor_5_nl <= NOT(MUX_v_7_2_2((z_out_2(7 DOWNTO 1)), STD_LOGIC_VECTOR'("1111111"),
      nor_ovfl_sva_1));
  nor_1306_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))))) OR
      and_tmp);
  nor_1307_nl <= NOT(and_2667_cse OR and_tmp);
  mux_221_nl <= MUX_s_1_2_2(nor_1306_nl, nor_1307_nl, acc_2_tmp_7_1(1));
  mux_222_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(1))), (MAC_LOOP_mux_11_tmp(1)),
      MAC_LOOP_mux_11_tmp(0));
  nor_1299_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(1))))) OR
      and_tmp_2);
  nor_1300_nl <= NOT(and_2671_cse OR and_tmp_2);
  mux_224_nl <= MUX_s_1_2_2(nor_1299_nl, nor_1300_nl, acc_2_tmp_7_1(2));
  nor_1293_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_3);
  nor_1294_nl <= NOT(and_2671_cse OR and_tmp_3);
  mux_226_nl <= MUX_s_1_2_2(nor_1293_nl, nor_1294_nl, acc_2_tmp_7_1(2));
  mux_227_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(2))), (MAC_LOOP_mux_11_tmp(2)),
      MAC_LOOP_mux_11_tmp(0));
  nor_1287_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(2))))) OR
      and_tmp_5);
  nor_1288_nl <= NOT(and_2667_cse OR and_tmp_5);
  mux_229_nl <= MUX_s_1_2_2(nor_1287_nl, nor_1288_nl, acc_2_tmp_7_1(1));
  nor_1285_nl <= NOT(((NOT (acc_2_tmp_7_1(2))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(3))) OR and_tmp_6);
  nor_1286_nl <= NOT(and_2667_cse OR and_tmp_6);
  mux_231_nl <= MUX_s_1_2_2(nor_1285_nl, nor_1286_nl, acc_2_tmp_7_1(1));
  nor_1281_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_7);
  nor_1282_nl <= NOT(and_2667_cse OR and_tmp_7);
  mux_233_nl <= MUX_s_1_2_2(nor_1281_nl, nor_1282_nl, acc_2_tmp_7_1(1));
  nor_1278_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_8);
  nor_1279_nl <= NOT(and_2667_cse OR and_tmp_8);
  mux_235_nl <= MUX_s_1_2_2(nor_1278_nl, nor_1279_nl, acc_2_tmp_7_1(1));
  nor_1273_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_9);
  nor_1274_nl <= NOT(and_2691_cse OR and_tmp_9);
  mux_237_nl <= MUX_s_1_2_2(nor_1273_nl, nor_1274_nl, acc_2_tmp_7_1(3));
  nor_1268_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_10);
  nor_1269_nl <= NOT(and_2691_cse OR and_tmp_10);
  mux_239_nl <= MUX_s_1_2_2(nor_1268_nl, nor_1269_nl, acc_2_tmp_7_1(3));
  mux_240_nl <= MUX_s_1_2_2((NOT (MAC_LOOP_mux_11_tmp(3))), (MAC_LOOP_mux_11_tmp(3)),
      MAC_LOOP_mux_11_tmp(0));
  nor_1262_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(3))))) OR
      and_tmp_12);
  nor_1263_nl <= NOT(and_2667_cse OR and_tmp_12);
  mux_242_nl <= MUX_s_1_2_2(nor_1262_nl, nor_1263_nl, acc_2_tmp_7_1(1));
  nor_1260_nl <= NOT(((NOT (acc_2_tmp_7_1(3))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(2))) OR and_tmp_13);
  nor_1261_nl <= NOT(and_2667_cse OR and_tmp_13);
  mux_244_nl <= MUX_s_1_2_2(nor_1260_nl, nor_1261_nl, acc_2_tmp_7_1(1));
  nor_1256_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_14);
  nor_1257_nl <= NOT(and_2667_cse OR and_tmp_14);
  mux_246_nl <= MUX_s_1_2_2(nor_1256_nl, nor_1257_nl, acc_2_tmp_7_1(1));
  nor_1253_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_15);
  nor_1254_nl <= NOT(and_2667_cse OR and_tmp_15);
  mux_248_nl <= MUX_s_1_2_2(nor_1253_nl, nor_1254_nl, acc_2_tmp_7_1(1));
  nor_1248_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_16);
  nor_1249_nl <= NOT(and_2671_cse OR and_tmp_16);
  mux_250_nl <= MUX_s_1_2_2(nor_1248_nl, nor_1249_nl, acc_2_tmp_7_1(2));
  nor_1245_nl <= NOT(((NOT (acc_2_tmp_7_1(3))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(1))) OR and_tmp_17);
  nor_1246_nl <= NOT(and_2671_cse OR and_tmp_17);
  mux_252_nl <= MUX_s_1_2_2(nor_1245_nl, nor_1246_nl, acc_2_tmp_7_1(2));
  nor_1241_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_18);
  nor_1242_nl <= NOT(and_2671_cse OR and_tmp_18);
  mux_254_nl <= MUX_s_1_2_2(nor_1241_nl, nor_1242_nl, acc_2_tmp_7_1(2));
  nor_1237_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_19);
  nor_1238_nl <= NOT(and_2671_cse OR and_tmp_19);
  mux_256_nl <= MUX_s_1_2_2(nor_1237_nl, nor_1238_nl, acc_2_tmp_7_1(2));
  nor_1232_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_20);
  nor_1233_nl <= NOT(and_2667_cse OR and_tmp_20);
  mux_258_nl <= MUX_s_1_2_2(nor_1232_nl, nor_1233_nl, acc_2_tmp_7_1(1));
  nor_1228_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_21);
  nor_1229_nl <= NOT(and_2667_cse OR and_tmp_21);
  mux_260_nl <= MUX_s_1_2_2(nor_1228_nl, nor_1229_nl, acc_2_tmp_7_1(1));
  nor_1224_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_22);
  nor_1225_nl <= NOT(and_2667_cse OR and_tmp_22);
  mux_262_nl <= MUX_s_1_2_2(nor_1224_nl, nor_1225_nl, acc_2_tmp_7_1(1));
  nor_1220_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_23);
  nor_1221_nl <= NOT(and_2667_cse OR and_tmp_23);
  mux_264_nl <= MUX_s_1_2_2(nor_1220_nl, nor_1221_nl, acc_2_tmp_7_1(1));
  nor_1215_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_24);
  nor_1216_nl <= NOT(and_2736_cse OR and_tmp_24);
  mux_266_nl <= MUX_s_1_2_2(nor_1215_nl, nor_1216_nl, acc_2_tmp_7_1(4));
  nor_1210_nl <= NOT((NOT(CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("001111"))))
      OR and_tmp_25);
  nor_1211_nl <= NOT(and_2741_cse OR and_tmp_25);
  mux_268_nl <= MUX_s_1_2_2(nor_1210_nl, nor_1211_nl, acc_2_tmp_7_1(6));
  or_1206_nl <= (acc_2_tmp_7_1(4)) OR (NOT (acc_2_tmp_7_1(0))) OR and_tmp_26;
  mux_270_nl <= MUX_s_1_2_2(and_tmp_26, or_1206_nl, and_2736_cse);
  nor_1205_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(4))))) OR
      and_tmp_27);
  nor_1206_nl <= NOT(and_2667_cse OR and_tmp_27);
  mux_272_nl <= MUX_s_1_2_2(nor_1205_nl, nor_1206_nl, acc_2_tmp_7_1(1));
  nor_1203_nl <= NOT(((NOT (acc_2_tmp_7_1(4))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(2))) OR and_tmp_28);
  nor_1204_nl <= NOT(and_2667_cse OR and_tmp_28);
  mux_274_nl <= MUX_s_1_2_2(nor_1203_nl, nor_1204_nl, acc_2_tmp_7_1(1));
  nor_1199_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_29);
  nor_1200_nl <= NOT(and_2667_cse OR and_tmp_29);
  mux_276_nl <= MUX_s_1_2_2(nor_1199_nl, nor_1200_nl, acc_2_tmp_7_1(1));
  nor_1196_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_30);
  nor_1197_nl <= NOT(and_2667_cse OR and_tmp_30);
  mux_278_nl <= MUX_s_1_2_2(nor_1196_nl, nor_1197_nl, acc_2_tmp_7_1(1));
  nor_1191_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_31);
  nor_1192_nl <= NOT(and_2671_cse OR and_tmp_31);
  mux_280_nl <= MUX_s_1_2_2(nor_1191_nl, nor_1192_nl, acc_2_tmp_7_1(2));
  nor_1189_nl <= NOT(((NOT (acc_2_tmp_7_1(2))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(1))) OR and_tmp_32);
  nor_1190_nl <= NOT(and_2736_cse OR and_tmp_32);
  mux_282_nl <= MUX_s_1_2_2(nor_1189_nl, nor_1190_nl, acc_2_tmp_7_1(4));
  nor_1185_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_33);
  nor_1186_nl <= NOT(and_2671_cse OR and_tmp_33);
  mux_284_nl <= MUX_s_1_2_2(nor_1185_nl, nor_1186_nl, acc_2_tmp_7_1(2));
  nor_1182_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_34);
  nor_1183_nl <= NOT(and_2671_cse OR and_tmp_34);
  mux_286_nl <= MUX_s_1_2_2(nor_1182_nl, nor_1183_nl, acc_2_tmp_7_1(2));
  nor_1178_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_35);
  nor_1179_nl <= NOT(and_2667_cse OR and_tmp_35);
  mux_288_nl <= MUX_s_1_2_2(nor_1178_nl, nor_1179_nl, acc_2_tmp_7_1(1));
  nor_1175_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_36);
  nor_1176_nl <= NOT(and_2667_cse OR and_tmp_36);
  mux_290_nl <= MUX_s_1_2_2(nor_1175_nl, nor_1176_nl, acc_2_tmp_7_1(1));
  nor_1172_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_37);
  nor_1173_nl <= NOT(and_2667_cse OR and_tmp_37);
  mux_292_nl <= MUX_s_1_2_2(nor_1172_nl, nor_1173_nl, acc_2_tmp_7_1(1));
  nor_1169_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_38);
  nor_1170_nl <= NOT(and_2667_cse OR and_tmp_38);
  mux_294_nl <= MUX_s_1_2_2(nor_1169_nl, nor_1170_nl, acc_2_tmp_7_1(1));
  nor_1165_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_39);
  nor_1166_nl <= NOT(and_2691_cse OR and_tmp_39);
  mux_296_nl <= MUX_s_1_2_2(nor_1165_nl, nor_1166_nl, acc_2_tmp_7_1(3));
  nor_1163_nl <= NOT(((NOT (acc_2_tmp_7_1(4))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(5)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(1))) OR and_tmp_40);
  nor_1164_nl <= NOT(and_2691_cse OR and_tmp_40);
  mux_298_nl <= MUX_s_1_2_2(nor_1163_nl, nor_1164_nl, acc_2_tmp_7_1(3));
  nor_1160_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_41);
  nor_1161_nl <= NOT(and_2691_cse OR and_tmp_41);
  mux_300_nl <= MUX_s_1_2_2(nor_1160_nl, nor_1161_nl, acc_2_tmp_7_1(3));
  nor_1157_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_42);
  nor_1158_nl <= NOT(and_2691_cse OR and_tmp_42);
  mux_302_nl <= MUX_s_1_2_2(nor_1157_nl, nor_1158_nl, acc_2_tmp_7_1(3));
  nor_1153_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_43);
  nor_1154_nl <= NOT(and_2667_cse OR and_tmp_43);
  mux_304_nl <= MUX_s_1_2_2(nor_1153_nl, nor_1154_nl, acc_2_tmp_7_1(1));
  nor_1150_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_44);
  nor_1151_nl <= NOT(and_2667_cse OR and_tmp_44);
  mux_306_nl <= MUX_s_1_2_2(nor_1150_nl, nor_1151_nl, acc_2_tmp_7_1(1));
  nor_1147_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_45);
  nor_1148_nl <= NOT(and_2667_cse OR and_tmp_45);
  mux_308_nl <= MUX_s_1_2_2(nor_1147_nl, nor_1148_nl, acc_2_tmp_7_1(1));
  nor_1144_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_46);
  nor_1145_nl <= NOT(and_2667_cse OR and_tmp_46);
  mux_310_nl <= MUX_s_1_2_2(nor_1144_nl, nor_1145_nl, acc_2_tmp_7_1(1));
  nor_1140_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_47);
  nor_1141_nl <= NOT(and_2671_cse OR and_tmp_47);
  mux_312_nl <= MUX_s_1_2_2(nor_1140_nl, nor_1141_nl, acc_2_tmp_7_1(2));
  nor_1136_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(2)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_48);
  nor_1137_nl <= NOT(and_2736_cse OR and_tmp_48);
  mux_314_nl <= MUX_s_1_2_2(nor_1136_nl, nor_1137_nl, acc_2_tmp_7_1(4));
  nor_1133_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_49);
  nor_1134_nl <= NOT(and_2671_cse OR and_tmp_49);
  mux_316_nl <= MUX_s_1_2_2(nor_1133_nl, nor_1134_nl, acc_2_tmp_7_1(2));
  nor_1129_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_50);
  nor_1130_nl <= NOT(and_2671_cse OR and_tmp_50);
  mux_318_nl <= MUX_s_1_2_2(nor_1129_nl, nor_1130_nl, acc_2_tmp_7_1(2));
  nor_1125_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_51);
  nor_1126_nl <= NOT(and_2667_cse OR and_tmp_51);
  mux_320_nl <= MUX_s_1_2_2(nor_1125_nl, nor_1126_nl, acc_2_tmp_7_1(1));
  nor_1121_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_52);
  nor_1122_nl <= NOT(and_2667_cse OR and_tmp_52);
  mux_322_nl <= MUX_s_1_2_2(nor_1121_nl, nor_1122_nl, acc_2_tmp_7_1(1));
  nor_1118_nl <= NOT((NOT(CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("011101"))))
      OR and_tmp_53);
  nor_1119_nl <= NOT(and_2741_cse OR and_tmp_53);
  mux_324_nl <= MUX_s_1_2_2(nor_1118_nl, nor_1119_nl, acc_2_tmp_7_1(6));
  nor_1114_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_54);
  nor_1115_nl <= NOT(and_2667_cse OR and_tmp_54);
  mux_326_nl <= MUX_s_1_2_2(nor_1114_nl, nor_1115_nl, acc_2_tmp_7_1(1));
  nor_1110_nl <= NOT((NOT((acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(4)))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_55);
  nor_1111_nl <= NOT(and_2829_cse OR and_tmp_55);
  mux_328_nl <= MUX_s_1_2_2(nor_1110_nl, nor_1111_nl, acc_2_tmp_7_1(5));
  nor_1107_nl <= NOT(((NOT (acc_2_tmp_7_1(6))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(4))
      AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(1))) OR and_tmp_56);
  nor_1108_nl <= NOT(and_2829_cse OR and_tmp_56);
  mux_330_nl <= MUX_s_1_2_2(nor_1107_nl, nor_1108_nl, acc_2_tmp_7_1(5));
  or_1205_nl <= (acc_2_tmp_7_1(5)) OR (NOT (acc_2_tmp_7_1(0))) OR and_tmp_57;
  mux_332_nl <= MUX_s_1_2_2(and_tmp_57, or_1205_nl, and_2829_cse);
  nor_1101_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(5))))) OR
      and_tmp_58);
  nor_1102_nl <= NOT(and_2667_cse OR and_tmp_58);
  mux_334_nl <= MUX_s_1_2_2(nor_1101_nl, nor_1102_nl, acc_2_tmp_7_1(1));
  nor_1099_nl <= NOT(((NOT (acc_2_tmp_7_1(5))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(4)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(2))) OR and_tmp_59);
  nor_1100_nl <= NOT(and_2667_cse OR and_tmp_59);
  mux_336_nl <= MUX_s_1_2_2(nor_1099_nl, nor_1100_nl, acc_2_tmp_7_1(1));
  nor_1094_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_60);
  nor_1095_nl <= NOT(and_2667_cse OR and_tmp_60);
  mux_338_nl <= MUX_s_1_2_2(nor_1094_nl, nor_1095_nl, acc_2_tmp_7_1(1));
  nor_1090_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_61);
  nor_1091_nl <= NOT(and_2667_cse OR and_tmp_61);
  mux_340_nl <= MUX_s_1_2_2(nor_1090_nl, nor_1091_nl, acc_2_tmp_7_1(1));
  nor_1085_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_62);
  nor_1086_nl <= NOT(and_2671_cse OR and_tmp_62);
  mux_342_nl <= MUX_s_1_2_2(nor_1085_nl, nor_1086_nl, acc_2_tmp_7_1(2));
  nor_1083_nl <= NOT(((NOT (acc_2_tmp_7_1(5))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(1)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(4))) OR and_tmp_63);
  nor_1084_nl <= NOT(and_2671_cse OR and_tmp_63);
  mux_344_nl <= MUX_s_1_2_2(nor_1083_nl, nor_1084_nl, acc_2_tmp_7_1(2));
  nor_1078_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_64);
  nor_1079_nl <= NOT(and_2671_cse OR and_tmp_64);
  mux_346_nl <= MUX_s_1_2_2(nor_1078_nl, nor_1079_nl, acc_2_tmp_7_1(2));
  nor_1074_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_65);
  nor_1075_nl <= NOT(and_2671_cse OR and_tmp_65);
  mux_348_nl <= MUX_s_1_2_2(nor_1074_nl, nor_1075_nl, acc_2_tmp_7_1(2));
  nor_1070_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_66);
  nor_1071_nl <= NOT(and_2667_cse OR and_tmp_66);
  mux_350_nl <= MUX_s_1_2_2(nor_1070_nl, nor_1071_nl, acc_2_tmp_7_1(1));
  nor_1067_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(1)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_67);
  nor_1068_nl <= NOT(and_2829_cse OR and_tmp_67);
  mux_352_nl <= MUX_s_1_2_2(nor_1067_nl, nor_1068_nl, acc_2_tmp_7_1(5));
  nor_1063_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_68);
  nor_1064_nl <= NOT(and_2667_cse OR and_tmp_68);
  mux_354_nl <= MUX_s_1_2_2(nor_1063_nl, nor_1064_nl, acc_2_tmp_7_1(1));
  nor_1059_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_69);
  nor_1060_nl <= NOT(and_2667_cse OR and_tmp_69);
  mux_356_nl <= MUX_s_1_2_2(nor_1059_nl, nor_1060_nl, acc_2_tmp_7_1(1));
  nor_1055_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_70);
  nor_1056_nl <= NOT(and_2691_cse OR and_tmp_70);
  mux_358_nl <= MUX_s_1_2_2(nor_1055_nl, nor_1056_nl, acc_2_tmp_7_1(3));
  nor_1053_nl <= NOT(((NOT (acc_2_tmp_7_1(5))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(1)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(4))) OR and_tmp_71);
  nor_1054_nl <= NOT(and_2691_cse OR and_tmp_71);
  mux_360_nl <= MUX_s_1_2_2(nor_1053_nl, nor_1054_nl, acc_2_tmp_7_1(3));
  nor_1049_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_72);
  nor_1050_nl <= NOT(and_2691_cse OR and_tmp_72);
  mux_362_nl <= MUX_s_1_2_2(nor_1049_nl, nor_1050_nl, acc_2_tmp_7_1(3));
  nor_1045_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_73);
  nor_1046_nl <= NOT(and_2691_cse OR and_tmp_73);
  mux_364_nl <= MUX_s_1_2_2(nor_1045_nl, nor_1046_nl, acc_2_tmp_7_1(3));
  nor_1041_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_74);
  nor_1042_nl <= NOT(and_2667_cse OR and_tmp_74);
  mux_366_nl <= MUX_s_1_2_2(nor_1041_nl, nor_1042_nl, acc_2_tmp_7_1(1));
  nor_1038_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(1)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_75);
  nor_1039_nl <= NOT(and_2829_cse OR and_tmp_75);
  mux_368_nl <= MUX_s_1_2_2(nor_1038_nl, nor_1039_nl, acc_2_tmp_7_1(5));
  nor_1034_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_76);
  nor_1035_nl <= NOT(and_2667_cse OR and_tmp_76);
  mux_370_nl <= MUX_s_1_2_2(nor_1034_nl, nor_1035_nl, acc_2_tmp_7_1(1));
  nor_1030_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_77);
  nor_1031_nl <= NOT(and_2667_cse OR and_tmp_77);
  mux_372_nl <= MUX_s_1_2_2(nor_1030_nl, nor_1031_nl, acc_2_tmp_7_1(1));
  nor_1026_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_78);
  nor_1027_nl <= NOT(and_2671_cse OR and_tmp_78);
  mux_374_nl <= MUX_s_1_2_2(nor_1026_nl, nor_1027_nl, acc_2_tmp_7_1(2));
  nor_1022_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(2)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_79);
  nor_1023_nl <= NOT(and_2829_cse OR and_tmp_79);
  mux_376_nl <= MUX_s_1_2_2(nor_1022_nl, nor_1023_nl, acc_2_tmp_7_1(5));
  nor_1018_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_80);
  nor_1019_nl <= NOT(and_2671_cse OR and_tmp_80);
  mux_378_nl <= MUX_s_1_2_2(nor_1018_nl, nor_1019_nl, acc_2_tmp_7_1(2));
  nor_1013_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_81);
  nor_1014_nl <= NOT(and_2671_cse OR and_tmp_81);
  mux_380_nl <= MUX_s_1_2_2(nor_1013_nl, nor_1014_nl, acc_2_tmp_7_1(2));
  nor_1009_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_82);
  nor_1010_nl <= NOT(and_2667_cse OR and_tmp_82);
  mux_382_nl <= MUX_s_1_2_2(nor_1009_nl, nor_1010_nl, acc_2_tmp_7_1(1));
  nor_1005_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_83);
  nor_1006_nl <= NOT(and_2667_cse OR and_tmp_83);
  mux_384_nl <= MUX_s_1_2_2(nor_1005_nl, nor_1006_nl, acc_2_tmp_7_1(1));
  nor_1001_nl <= NOT((NOT(CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("101101"))))
      OR and_tmp_84);
  nor_1002_nl <= NOT(and_2741_cse OR and_tmp_84);
  mux_386_nl <= MUX_s_1_2_2(nor_1001_nl, nor_1002_nl, acc_2_tmp_7_1(6));
  nor_996_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_85);
  nor_997_nl <= NOT(and_2667_cse OR and_tmp_85);
  mux_388_nl <= MUX_s_1_2_2(nor_996_nl, nor_997_nl, acc_2_tmp_7_1(1));
  nor_992_nl <= NOT((NOT((acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(5)))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_86);
  nor_993_nl <= NOT(and_2736_cse OR and_tmp_86);
  mux_390_nl <= MUX_s_1_2_2(nor_992_nl, nor_993_nl, acc_2_tmp_7_1(4));
  nor_990_nl <= NOT(((NOT (acc_2_tmp_7_1(5))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(6))
      AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(1))) OR and_tmp_87);
  nor_991_nl <= NOT(and_2736_cse OR and_tmp_87);
  mux_392_nl <= MUX_s_1_2_2(nor_990_nl, nor_991_nl, acc_2_tmp_7_1(4));
  nor_987_nl <= NOT((CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)=STD_LOGIC_VECTOR'("101111")))
      OR and_tmp_88);
  nor_988_nl <= NOT(and_2741_cse OR and_tmp_88);
  mux_394_nl <= MUX_s_1_2_2(nor_987_nl, nor_988_nl, acc_2_tmp_7_1(6));
  nor_983_nl <= NOT((NOT((acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6)))
      OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_89);
  nor_984_nl <= NOT(and_2736_cse OR and_tmp_89);
  mux_396_nl <= MUX_s_1_2_2(nor_983_nl, nor_984_nl, acc_2_tmp_7_1(4));
  nor_979_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(6))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_90);
  nor_980_nl <= NOT(and_2667_cse OR and_tmp_90);
  mux_398_nl <= MUX_s_1_2_2(nor_979_nl, nor_980_nl, acc_2_tmp_7_1(1));
  nor_976_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(1)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_91);
  nor_977_nl <= NOT(and_2829_cse OR and_tmp_91);
  mux_400_nl <= MUX_s_1_2_2(nor_976_nl, nor_977_nl, acc_2_tmp_7_1(5));
  nor_972_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(6))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(5)))))
      OR and_tmp_92);
  nor_973_nl <= NOT(and_2667_cse OR and_tmp_92);
  mux_402_nl <= MUX_s_1_2_2(nor_972_nl, nor_973_nl, acc_2_tmp_7_1(1));
  nor_968_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_93);
  nor_969_nl <= NOT(and_2667_cse OR and_tmp_93);
  mux_404_nl <= MUX_s_1_2_2(nor_968_nl, nor_969_nl, acc_2_tmp_7_1(1));
  nor_964_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_94);
  nor_965_nl <= NOT(and_2671_cse OR and_tmp_94);
  mux_406_nl <= MUX_s_1_2_2(nor_964_nl, nor_965_nl, acc_2_tmp_7_1(2));
  nor_961_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(2)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_95);
  nor_962_nl <= NOT(and_2829_cse OR and_tmp_95);
  mux_408_nl <= MUX_s_1_2_2(nor_961_nl, nor_962_nl, acc_2_tmp_7_1(5));
  nor_957_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_96);
  nor_958_nl <= NOT(and_2671_cse OR and_tmp_96);
  mux_410_nl <= MUX_s_1_2_2(nor_957_nl, nor_958_nl, acc_2_tmp_7_1(2));
  nor_953_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_97);
  nor_954_nl <= NOT(and_2671_cse OR and_tmp_97);
  mux_412_nl <= MUX_s_1_2_2(nor_953_nl, nor_954_nl, acc_2_tmp_7_1(2));
  nor_950_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_98);
  nor_951_nl <= NOT(and_2667_cse OR and_tmp_98);
  mux_414_nl <= MUX_s_1_2_2(nor_950_nl, nor_951_nl, acc_2_tmp_7_1(1));
  nor_947_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_99);
  nor_948_nl <= NOT(and_2667_cse OR and_tmp_99);
  mux_416_nl <= MUX_s_1_2_2(nor_947_nl, nor_948_nl, acc_2_tmp_7_1(1));
  nor_944_nl <= NOT((NOT(CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("110101"))))
      OR and_tmp_100);
  nor_945_nl <= NOT(and_2741_cse OR and_tmp_100);
  mux_418_nl <= MUX_s_1_2_2(nor_944_nl, nor_945_nl, acc_2_tmp_7_1(6));
  nor_940_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_101);
  nor_941_nl <= NOT(and_2667_cse OR and_tmp_101);
  mux_420_nl <= MUX_s_1_2_2(nor_940_nl, nor_941_nl, acc_2_tmp_7_1(1));
  nor_937_nl <= NOT((NOT((acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(5)))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_102);
  nor_938_nl <= NOT(and_2691_cse OR and_tmp_102);
  mux_422_nl <= MUX_s_1_2_2(nor_937_nl, nor_938_nl, acc_2_tmp_7_1(3));
  nor_934_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(3)) OR (NOT (acc_2_tmp_7_1(0)))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_103);
  nor_935_nl <= NOT(and_2829_cse OR and_tmp_103);
  mux_424_nl <= MUX_s_1_2_2(nor_934_nl, nor_935_nl, acc_2_tmp_7_1(5));
  nor_932_nl <= NOT(((NOT (acc_2_tmp_7_1(6))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(5))
      AND (acc_2_tmp_7_1(1)) AND (acc_2_tmp_7_1(2)) AND (acc_2_tmp_7_1(4))) OR and_tmp_104);
  nor_933_nl <= NOT(and_2691_cse OR and_tmp_104);
  mux_426_nl <= MUX_s_1_2_2(nor_932_nl, nor_933_nl, acc_2_tmp_7_1(3));
  nor_928_nl <= NOT((NOT((acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_105);
  nor_929_nl <= NOT(and_2691_cse OR and_tmp_105);
  mux_428_nl <= MUX_s_1_2_2(nor_928_nl, nor_929_nl, acc_2_tmp_7_1(3));
  nor_925_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0))
      OR (NOT (acc_2_tmp_7_1(5))) OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(3)))))
      OR and_tmp_106);
  nor_926_nl <= NOT(and_2667_cse OR and_tmp_106);
  mux_430_nl <= MUX_s_1_2_2(nor_925_nl, nor_926_nl, acc_2_tmp_7_1(1));
  nor_922_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_107);
  nor_923_nl <= NOT(and_2667_cse OR and_tmp_107);
  mux_432_nl <= MUX_s_1_2_2(nor_922_nl, nor_923_nl, acc_2_tmp_7_1(1));
  nor_919_nl <= NOT((NOT(CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("111001"))))
      OR and_tmp_108);
  nor_920_nl <= NOT(and_2741_cse OR and_tmp_108);
  mux_434_nl <= MUX_s_1_2_2(nor_919_nl, nor_920_nl, acc_2_tmp_7_1(6));
  nor_915_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(2))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_109);
  nor_916_nl <= NOT(and_2667_cse OR and_tmp_109);
  mux_436_nl <= MUX_s_1_2_2(nor_915_nl, nor_916_nl, acc_2_tmp_7_1(1));
  nor_912_nl <= NOT((NOT((acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(5)))
      OR (NOT (acc_2_tmp_7_1(1))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(4)))))
      OR and_tmp_110);
  nor_913_nl <= NOT(and_2671_cse OR and_tmp_110);
  mux_438_nl <= MUX_s_1_2_2(nor_912_nl, nor_913_nl, acc_2_tmp_7_1(2));
  nor_908_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_111);
  nor_909_nl <= NOT(and_2671_cse OR and_tmp_111);
  mux_440_nl <= MUX_s_1_2_2(nor_908_nl, nor_909_nl, acc_2_tmp_7_1(2));
  nor_906_nl <= NOT(((NOT (acc_2_tmp_7_1(6))) AND (acc_2_tmp_7_1(0)) AND (acc_2_tmp_7_1(5))
      AND (acc_2_tmp_7_1(1)) AND (acc_2_tmp_7_1(3)) AND (acc_2_tmp_7_1(4))) OR and_tmp_112);
  nor_907_nl <= NOT(and_2671_cse OR and_tmp_112);
  mux_442_nl <= MUX_s_1_2_2(nor_906_nl, nor_907_nl, acc_2_tmp_7_1(2));
  nor_901_nl <= NOT((NOT((acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4)) OR (acc_2_tmp_7_1(5))
      OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6))) OR (NOT (acc_2_tmp_7_1(1)))))
      OR and_tmp_113);
  nor_902_nl <= NOT(and_2671_cse OR and_tmp_113);
  mux_444_nl <= MUX_s_1_2_2(nor_901_nl, nor_902_nl, acc_2_tmp_7_1(2));
  nor_898_nl <= NOT((NOT((acc_2_tmp_7_1(6)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(5)))
      OR (NOT (acc_2_tmp_7_1(4))) OR (NOT (acc_2_tmp_7_1(3))) OR (NOT (acc_2_tmp_7_1(2)))))
      OR and_tmp_114);
  nor_899_nl <= NOT(and_2667_cse OR and_tmp_114);
  mux_446_nl <= MUX_s_1_2_2(nor_898_nl, nor_899_nl, acc_2_tmp_7_1(1));
  nor_894_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (acc_2_tmp_7_1(5)) OR (NOT (acc_2_tmp_7_1(0))) OR (NOT (acc_2_tmp_7_1(6)))))
      OR and_tmp_115);
  nor_895_nl <= NOT(and_2667_cse OR and_tmp_115);
  mux_448_nl <= MUX_s_1_2_2(nor_894_nl, nor_895_nl, acc_2_tmp_7_1(1));
  nor_892_nl <= NOT((CONV_SL_1_1(acc_2_tmp_7_1(5 DOWNTO 0)=STD_LOGIC_VECTOR'("111101")))
      OR and_tmp_116);
  nor_893_nl <= NOT(and_2741_cse OR and_tmp_116);
  mux_450_nl <= MUX_s_1_2_2(nor_892_nl, nor_893_nl, acc_2_tmp_7_1(6));
  nor_887_nl <= NOT((NOT((acc_2_tmp_7_1(2)) OR (acc_2_tmp_7_1(3)) OR (acc_2_tmp_7_1(4))
      OR (acc_2_tmp_7_1(5)) OR (acc_2_tmp_7_1(0)) OR (NOT (acc_2_tmp_7_1(6))))) OR
      and_tmp_117);
  nor_888_nl <= NOT(and_2667_cse OR and_tmp_117);
  mux_452_nl <= MUX_s_1_2_2(nor_887_nl, nor_888_nl, acc_2_tmp_7_1(1));
  or_1204_nl <= (acc_2_tmp_7_1(6)) OR (NOT (acc_2_tmp_7_1(0))) OR and_tmp_118;
  mux_454_nl <= MUX_s_1_2_2(and_tmp_118, or_1204_nl, and_2741_cse);
  SHIFT_LOOP_n_or_nl <= (z_out_1_7 AND (fsm_output(1))) OR (fsm_output(2));
  SHIFT_LOOP_n_SHIFT_LOOP_n_mux_nl <= MUX_v_7_2_2(STD_LOGIC_VECTOR'( "1111110"),
      acc_2_tmp_7_1, SHIFT_LOOP_n_or_nl);
  MAC_LOOP_n_nor_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR ((NOT z_out_1_7) AND (fsm_output(1))));
  SHIFT_LOOP_mux_129_nl <= MUX_v_7_2_2((NOT acc_2_tmp_7_1), acc_2_tmp_7_1, fsm_output(2));
  SHIFT_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & SHIFT_LOOP_mux_129_nl)
      + UNSIGNED'( "00000001"), 8));
  z_out_1_7 <= SHIFT_LOOP_acc_nl(7);
  MAC_LOOP_mux_7_nl <= MUX_v_19_2_2((sum_sva(18 DOWNTO 0)), STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(sum_sva(19
      DOWNTO 6)),19)), fsm_output(3));
  MAC_LOOP_mux_9_nl <= MUX_v_10_127_2((b_rsci_idat(9 DOWNTO 0)), (b_rsci_idat(19
      DOWNTO 10)), (b_rsci_idat(29 DOWNTO 20)), (b_rsci_idat(39 DOWNTO 30)), (b_rsci_idat(49
      DOWNTO 40)), (b_rsci_idat(59 DOWNTO 50)), (b_rsci_idat(69 DOWNTO 60)), (b_rsci_idat(79
      DOWNTO 70)), (b_rsci_idat(89 DOWNTO 80)), (b_rsci_idat(99 DOWNTO 90)), (b_rsci_idat(109
      DOWNTO 100)), (b_rsci_idat(119 DOWNTO 110)), (b_rsci_idat(129 DOWNTO 120)),
      (b_rsci_idat(139 DOWNTO 130)), (b_rsci_idat(149 DOWNTO 140)), (b_rsci_idat(159
      DOWNTO 150)), (b_rsci_idat(169 DOWNTO 160)), (b_rsci_idat(179 DOWNTO 170)),
      (b_rsci_idat(189 DOWNTO 180)), (b_rsci_idat(199 DOWNTO 190)), (b_rsci_idat(209
      DOWNTO 200)), (b_rsci_idat(219 DOWNTO 210)), (b_rsci_idat(229 DOWNTO 220)),
      (b_rsci_idat(239 DOWNTO 230)), (b_rsci_idat(249 DOWNTO 240)), (b_rsci_idat(259
      DOWNTO 250)), (b_rsci_idat(269 DOWNTO 260)), (b_rsci_idat(279 DOWNTO 270)),
      (b_rsci_idat(289 DOWNTO 280)), (b_rsci_idat(299 DOWNTO 290)), (b_rsci_idat(309
      DOWNTO 300)), (b_rsci_idat(319 DOWNTO 310)), (b_rsci_idat(329 DOWNTO 320)),
      (b_rsci_idat(339 DOWNTO 330)), (b_rsci_idat(349 DOWNTO 340)), (b_rsci_idat(359
      DOWNTO 350)), (b_rsci_idat(369 DOWNTO 360)), (b_rsci_idat(379 DOWNTO 370)),
      (b_rsci_idat(389 DOWNTO 380)), (b_rsci_idat(399 DOWNTO 390)), (b_rsci_idat(409
      DOWNTO 400)), (b_rsci_idat(419 DOWNTO 410)), (b_rsci_idat(429 DOWNTO 420)),
      (b_rsci_idat(439 DOWNTO 430)), (b_rsci_idat(449 DOWNTO 440)), (b_rsci_idat(459
      DOWNTO 450)), (b_rsci_idat(469 DOWNTO 460)), (b_rsci_idat(479 DOWNTO 470)),
      (b_rsci_idat(489 DOWNTO 480)), (b_rsci_idat(499 DOWNTO 490)), (b_rsci_idat(509
      DOWNTO 500)), (b_rsci_idat(519 DOWNTO 510)), (b_rsci_idat(529 DOWNTO 520)),
      (b_rsci_idat(539 DOWNTO 530)), (b_rsci_idat(549 DOWNTO 540)), (b_rsci_idat(559
      DOWNTO 550)), (b_rsci_idat(569 DOWNTO 560)), (b_rsci_idat(579 DOWNTO 570)),
      (b_rsci_idat(589 DOWNTO 580)), (b_rsci_idat(599 DOWNTO 590)), (b_rsci_idat(609
      DOWNTO 600)), (b_rsci_idat(619 DOWNTO 610)), (b_rsci_idat(629 DOWNTO 620)),
      (b_rsci_idat(639 DOWNTO 630)), (b_rsci_idat(649 DOWNTO 640)), (b_rsci_idat(659
      DOWNTO 650)), (b_rsci_idat(669 DOWNTO 660)), (b_rsci_idat(679 DOWNTO 670)),
      (b_rsci_idat(689 DOWNTO 680)), (b_rsci_idat(699 DOWNTO 690)), (b_rsci_idat(709
      DOWNTO 700)), (b_rsci_idat(719 DOWNTO 710)), (b_rsci_idat(729 DOWNTO 720)),
      (b_rsci_idat(739 DOWNTO 730)), (b_rsci_idat(749 DOWNTO 740)), (b_rsci_idat(759
      DOWNTO 750)), (b_rsci_idat(769 DOWNTO 760)), (b_rsci_idat(779 DOWNTO 770)),
      (b_rsci_idat(789 DOWNTO 780)), (b_rsci_idat(799 DOWNTO 790)), (b_rsci_idat(809
      DOWNTO 800)), (b_rsci_idat(819 DOWNTO 810)), (b_rsci_idat(829 DOWNTO 820)),
      (b_rsci_idat(839 DOWNTO 830)), (b_rsci_idat(849 DOWNTO 840)), (b_rsci_idat(859
      DOWNTO 850)), (b_rsci_idat(869 DOWNTO 860)), (b_rsci_idat(879 DOWNTO 870)),
      (b_rsci_idat(889 DOWNTO 880)), (b_rsci_idat(899 DOWNTO 890)), (b_rsci_idat(909
      DOWNTO 900)), (b_rsci_idat(919 DOWNTO 910)), (b_rsci_idat(929 DOWNTO 920)),
      (b_rsci_idat(939 DOWNTO 930)), (b_rsci_idat(949 DOWNTO 940)), (b_rsci_idat(959
      DOWNTO 950)), (b_rsci_idat(969 DOWNTO 960)), (b_rsci_idat(979 DOWNTO 970)),
      (b_rsci_idat(989 DOWNTO 980)), (b_rsci_idat(999 DOWNTO 990)), (b_rsci_idat(1009
      DOWNTO 1000)), (b_rsci_idat(1019 DOWNTO 1010)), (b_rsci_idat(1029 DOWNTO 1020)),
      (b_rsci_idat(1039 DOWNTO 1030)), (b_rsci_idat(1049 DOWNTO 1040)), (b_rsci_idat(1059
      DOWNTO 1050)), (b_rsci_idat(1069 DOWNTO 1060)), (b_rsci_idat(1079 DOWNTO 1070)),
      (b_rsci_idat(1089 DOWNTO 1080)), (b_rsci_idat(1099 DOWNTO 1090)), (b_rsci_idat(1109
      DOWNTO 1100)), (b_rsci_idat(1119 DOWNTO 1110)), (b_rsci_idat(1129 DOWNTO 1120)),
      (b_rsci_idat(1139 DOWNTO 1130)), (b_rsci_idat(1149 DOWNTO 1140)), (b_rsci_idat(1159
      DOWNTO 1150)), (b_rsci_idat(1169 DOWNTO 1160)), (b_rsci_idat(1179 DOWNTO 1170)),
      (b_rsci_idat(1189 DOWNTO 1180)), (b_rsci_idat(1199 DOWNTO 1190)), (b_rsci_idat(1209
      DOWNTO 1200)), (b_rsci_idat(1219 DOWNTO 1210)), (b_rsci_idat(1229 DOWNTO 1220)),
      (b_rsci_idat(1239 DOWNTO 1230)), (b_rsci_idat(1249 DOWNTO 1240)), (b_rsci_idat(1259
      DOWNTO 1250)), (b_rsci_idat(1269 DOWNTO 1260)), MAC_LOOP_n_6_0_sva);
  MAC_LOOP_mul_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(z_out) * SIGNED(MAC_LOOP_mux_9_nl)),
      13));
  MAC_LOOP_mux_8_nl <= MUX_v_13_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(MAC_LOOP_mul_1_nl),
      13)), (STD_LOGIC_VECTOR'( "000000000000") & (sum_sva(5))), fsm_output(3));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((sum_sva(19)) & MAC_LOOP_mux_7_nl)
      + CONV_UNSIGNED(SIGNED(MAC_LOOP_mux_8_nl), 20), 20));
  acc_2_tmp_7_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(MAC_LOOP_n_6_0_sva) +
      CONV_UNSIGNED(CONV_SIGNED(SIGNED'( (fsm_output(1)) & '1'), 2), 7), 7));
  MAC_LOOP_mux_11_tmp <= MUX_v_7_2_2(MAC_LOOP_n_6_0_sva, acc_2_tmp_7_1, fsm_output(1));
  MAC_LOOP_mux_10_nl <= MUX_v_3_2_2(i_sample_sva, x_0_sva, fsm_output(1));
  z_out <= MUX_v_3_127_2(MAC_LOOP_mux_10_nl, x_1_lpi_2, x_2_lpi_2, x_3_lpi_2, x_4_lpi_2,
      x_5_lpi_2, x_6_lpi_2, x_7_lpi_2, x_8_lpi_2, x_9_lpi_2, x_10_lpi_2, x_11_lpi_2,
      x_12_lpi_2, x_13_lpi_2, x_14_lpi_2, x_15_lpi_2, x_16_lpi_2, x_17_lpi_2, x_18_lpi_2,
      x_19_lpi_2, x_20_lpi_2, x_21_lpi_2, x_22_lpi_2, x_23_lpi_2, x_24_lpi_2, x_25_lpi_2,
      x_26_lpi_2, x_27_lpi_2, x_28_lpi_2, x_29_lpi_2, x_30_lpi_2, x_31_lpi_2, x_32_lpi_2,
      x_33_lpi_2, x_34_lpi_2, x_35_lpi_2, x_36_lpi_2, x_37_lpi_2, x_38_lpi_2, x_39_lpi_2,
      x_40_lpi_2, x_41_lpi_2, x_42_lpi_2, x_43_lpi_2, x_44_lpi_2, x_45_lpi_2, x_46_lpi_2,
      x_47_lpi_2, x_48_lpi_2, x_49_lpi_2, x_50_lpi_2, x_51_lpi_2, x_52_lpi_2, x_53_lpi_2,
      x_54_lpi_2, x_55_lpi_2, x_56_lpi_2, x_57_lpi_2, x_58_lpi_2, x_59_lpi_2, x_60_lpi_2,
      x_61_lpi_2, x_62_lpi_2, x_63_lpi_2, x_64_lpi_2, x_65_lpi_2, x_66_lpi_2, x_67_lpi_2,
      x_68_lpi_2, x_69_lpi_2, x_70_lpi_2, x_71_lpi_2, x_72_lpi_2, x_73_lpi_2, x_74_lpi_2,
      x_75_lpi_2, x_76_lpi_2, x_77_lpi_2, x_78_lpi_2, x_79_lpi_2, x_80_lpi_2, x_81_lpi_2,
      x_82_lpi_2, x_83_lpi_2, x_84_lpi_2, x_85_lpi_2, x_86_lpi_2, x_87_lpi_2, x_88_lpi_2,
      x_89_lpi_2, x_90_lpi_2, x_91_lpi_2, x_92_lpi_2, x_93_lpi_2, x_94_lpi_2, x_95_lpi_2,
      x_96_lpi_2, x_97_lpi_2, x_98_lpi_2, x_99_lpi_2, x_100_lpi_2, x_101_lpi_2, x_102_lpi_2,
      x_103_lpi_2, x_104_lpi_2, x_105_lpi_2, x_106_lpi_2, x_107_lpi_2, x_108_lpi_2,
      x_109_lpi_2, x_110_lpi_2, x_111_lpi_2, x_112_lpi_2, x_113_lpi_2, x_114_lpi_2,
      x_115_lpi_2, x_116_lpi_2, x_117_lpi_2, x_118_lpi_2, x_119_lpi_2, x_120_lpi_2,
      x_121_lpi_2, x_122_lpi_2, x_123_lpi_2, x_124_lpi_2, x_125_lpi_2, x_126_lpi_2,
      MAC_LOOP_mux_11_tmp);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_filter
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_filter IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    i_sample_rsc_dat : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    i_sample_rsc_triosy_lz : OUT STD_LOGIC;
    b_rsc_dat : IN STD_LOGIC_VECTOR (1269 DOWNTO 0);
    b_rsc_triosy_lz : OUT STD_LOGIC;
    y_rsc_dat : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    y_rsc_triosy_lz : OUT STD_LOGIC
  );
END fir_filter;

ARCHITECTURE v1 OF fir_filter IS
  -- Default Constants

  COMPONENT fir_filter_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      i_sample_rsc_dat : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      i_sample_rsc_triosy_lz : OUT STD_LOGIC;
      b_rsc_dat : IN STD_LOGIC_VECTOR (1269 DOWNTO 0);
      b_rsc_triosy_lz : OUT STD_LOGIC;
      y_rsc_dat : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      y_rsc_triosy_lz : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_filter_core_inst_i_sample_rsc_dat : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL fir_filter_core_inst_b_rsc_dat : STD_LOGIC_VECTOR (1269 DOWNTO 0);
  SIGNAL fir_filter_core_inst_y_rsc_dat : STD_LOGIC_VECTOR (8 DOWNTO 0);

BEGIN
  fir_filter_core_inst : fir_filter_core
    PORT MAP(
      clk => clk,
      rst => rst,
      i_sample_rsc_dat => fir_filter_core_inst_i_sample_rsc_dat,
      i_sample_rsc_triosy_lz => i_sample_rsc_triosy_lz,
      b_rsc_dat => fir_filter_core_inst_b_rsc_dat,
      b_rsc_triosy_lz => b_rsc_triosy_lz,
      y_rsc_dat => fir_filter_core_inst_y_rsc_dat,
      y_rsc_triosy_lz => y_rsc_triosy_lz
    );
  fir_filter_core_inst_i_sample_rsc_dat <= i_sample_rsc_dat;
  fir_filter_core_inst_b_rsc_dat <= b_rsc_dat;
  y_rsc_dat <= fir_filter_core_inst_y_rsc_dat;

END v1;



