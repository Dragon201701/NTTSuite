
--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_in_wait_v1.vhd 
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

PACKAGE ccs_sync_in_wait_pkg_v1 IS

COMPONENT ccs_sync_in_wait_v1 
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    rdy : OUT   std_logic;
    vld : IN    std_logic;
    irdy : IN    std_logic;
    ivld : OUT   std_logic
  );
END COMPONENT;

END ccs_sync_in_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_sync_in_wait_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    rdy : OUT   std_logic;
    vld : IN    std_logic;
    irdy : IN    std_logic;
    ivld : OUT   std_logic
  );
END ccs_sync_in_wait_v1;

ARCHITECTURE beh OF ccs_sync_in_wait_v1 IS
BEGIN
   rdy <= irdy;
   ivld <= vld;
END beh; 

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_out_wait_v1.vhd 
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

PACKAGE ccs_sync_out_wait_pkg_v1 IS

COMPONENT ccs_sync_out_wait_v1
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ivld : IN    std_logic;
    irdy : OUT   std_logic;
    vld : OUT   std_logic;
    rdy : IN    std_logic
  );
END COMPONENT;

END ccs_sync_out_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_sync_out_wait_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ivld : IN    std_logic;
    irdy : OUT   std_logic;
    vld : OUT   std_logic;
    rdy : IN    std_logic
  );
END ccs_sync_out_wait_v1;

ARCHITECTURE beh OF ccs_sync_out_wait_v1 IS
BEGIN
   irdy <= rdy;
   vld <= ivld;
END beh; 

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
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


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_out_v1.vhd 
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


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Sun Jan 23 14:08:06 2022
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    axi_test_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_2_4_32_16_16_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_2_4_32_16_16_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END axi_test_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_2_4_32_16_16_32_1_gen;

ARCHITECTURE v1 OF axi_test_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_2_4_32_16_16_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(7 DOWNTO 4));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(3 DOWNTO 0));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    main_C_0_tr0 : IN STD_LOGIC;
    ADD_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END axi_test_core_core_fsm;

ARCHITECTURE v1 OF axi_test_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for axi_test_core_core_fsm_1
  TYPE axi_test_core_core_fsm_1_ST IS (core_rlp_C_0, main_C_0, ADD_LOOP_C_0, ADD_LOOP_C_1,
      main_C_1, main_C_2, main_C_3);

  SIGNAL state_var : axi_test_core_core_fsm_1_ST;
  SIGNAL state_var_NS : axi_test_core_core_fsm_1_ST;

BEGIN
  axi_test_core_core_fsm_1 : PROCESS (main_C_0_tr0, ADD_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010");
        IF ( main_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= ADD_LOOP_C_0;
        END IF;
      WHEN ADD_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100");
        state_var_NS <= ADD_LOOP_C_1;
      WHEN ADD_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000");
        IF ( ADD_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= ADD_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000");
        state_var_NS <= main_C_3;
      WHEN main_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS axi_test_core_core_fsm_1;

  axi_test_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= core_rlp_C_0;
      ELSE
        IF ( complete_rsci_wen_comp = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS axi_test_core_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    core_wten_pff : OUT STD_LOGIC
  );
END axi_test_core_staller;

ARCHITECTURE v1 OF axi_test_core_staller IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wten_reg : STD_LOGIC;

BEGIN
  core_wten <= core_wten_reg;
  core_wten_pff <= NOT complete_rsci_wen_comp;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        core_wten_reg <= '0';
      ELSE
        core_wten_reg <= NOT complete_rsci_wen_comp;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    arrsum_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    arrsum_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl;

ARCHITECTURE v1 OF axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  arrsum_rsc_triosy_obj_ld_core_sct <= arrsum_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    a_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    a_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl;

ARCHITECTURE v1 OF axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  a_rsc_triosy_obj_ld_core_sct <= a_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_complete_rsci_complete_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_complete_rsci_complete_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC;
    complete_rsci_biwt : IN STD_LOGIC;
    complete_rsci_bdwt : IN STD_LOGIC;
    complete_rsci_bcwt : OUT STD_LOGIC
  );
END axi_test_core_complete_rsci_complete_wait_dp;

ARCHITECTURE v1 OF axi_test_core_complete_rsci_complete_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL complete_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  complete_rsci_bcwt <= complete_rsci_bcwt_drv;

  complete_rsci_wen_comp <= (NOT complete_rsci_oswt) OR complete_rsci_biwt OR complete_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        complete_rsci_bcwt_drv <= '0';
      ELSE
        complete_rsci_bcwt_drv <= NOT((NOT(complete_rsci_bcwt_drv OR complete_rsci_biwt))
            OR complete_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_complete_rsci_complete_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_complete_rsci_complete_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_biwt : OUT STD_LOGIC;
    complete_rsci_bdwt : OUT STD_LOGIC;
    complete_rsci_bcwt : IN STD_LOGIC;
    complete_rsci_ivld_core_sct : OUT STD_LOGIC;
    complete_rsci_irdy : IN STD_LOGIC
  );
END axi_test_core_complete_rsci_complete_wait_ctrl;

ARCHITECTURE v1 OF axi_test_core_complete_rsci_complete_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_ogwt : STD_LOGIC;

BEGIN
  complete_rsci_bdwt <= complete_rsci_oswt AND core_wen;
  complete_rsci_biwt <= complete_rsci_ogwt AND complete_rsci_irdy;
  complete_rsci_ogwt <= complete_rsci_oswt AND (NOT complete_rsci_bcwt);
  complete_rsci_ivld_core_sct <= complete_rsci_ogwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_a_rsci_1_a_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_a_rsci_1_a_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_rsci_adra_d : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    a_rsci_adra_d_core : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsci_biwt : IN STD_LOGIC;
    a_rsci_bdwt : IN STD_LOGIC
  );
END axi_test_core_a_rsci_1_a_rsc_wait_dp;

ARCHITECTURE v1 OF axi_test_core_a_rsci_1_a_rsc_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_rsci_bcwt : STD_LOGIC;
  SIGNAL a_rsci_qa_d_bfwt_31_0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

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
  a_rsci_qa_d_mxwt <= MUX_v_32_2_2((a_rsci_qa_d(31 DOWNTO 0)), a_rsci_qa_d_bfwt_31_0,
      a_rsci_bcwt);
  a_rsci_adra_d <= a_rsci_adra_d_core(3 DOWNTO 0);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        a_rsci_bcwt <= '0';
      ELSE
        a_rsci_bcwt <= NOT((NOT(a_rsci_bcwt OR a_rsci_biwt)) OR a_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( a_rsci_biwt = '1' ) THEN
        a_rsci_qa_d_bfwt_31_0 <= a_rsci_qa_d(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_a_rsci_1_a_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_a_rsci_1_a_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    a_rsci_oswt : IN STD_LOGIC;
    a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1 DOWNTO
        0);
    a_rsci_biwt : OUT STD_LOGIC;
    a_rsci_bdwt : OUT STD_LOGIC;
    a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wten_pff : IN STD_LOGIC;
    a_rsci_oswt_pff : IN STD_LOGIC
  );
END axi_test_core_a_rsci_1_a_rsc_wait_ctrl;

ARCHITECTURE v1 OF axi_test_core_a_rsci_1_a_rsc_wait_ctrl IS
  -- Default Constants

  SIGNAL ADD_LOOP_and_7_nl : STD_LOGIC;
BEGIN
  a_rsci_bdwt <= a_rsci_oswt AND core_wen;
  a_rsci_biwt <= (NOT core_wten) AND a_rsci_oswt;
  ADD_LOOP_and_7_nl <= (a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(0)) AND
      (NOT core_wten_pff) AND a_rsci_oswt_pff;
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= STD_LOGIC_VECTOR'( '0' & ADD_LOOP_and_7_nl);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_run_rsci_run_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_run_rsci_run_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC;
    run_rsci_ivld : IN STD_LOGIC;
    run_rsci_biwt : IN STD_LOGIC;
    run_rsci_bdwt : IN STD_LOGIC
  );
END axi_test_core_run_rsci_run_wait_dp;

ARCHITECTURE v1 OF axi_test_core_run_rsci_run_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_rsci_bcwt : STD_LOGIC;
  SIGNAL run_rsci_ivld_bfwt : STD_LOGIC;

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

BEGIN
  run_rsci_ivld_mxwt <= MUX_s_1_2_2(run_rsci_ivld, run_rsci_ivld_bfwt, run_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_rsci_bcwt <= '0';
      ELSE
        run_rsci_bcwt <= NOT((NOT(run_rsci_bcwt OR run_rsci_biwt)) OR run_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( run_rsci_biwt = '1' ) THEN
        run_rsci_ivld_bfwt <= run_rsci_ivld;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_run_rsci_run_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_run_rsci_run_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_biwt : OUT STD_LOGIC;
    run_rsci_bdwt : OUT STD_LOGIC
  );
END axi_test_core_run_rsci_run_wait_ctrl;

ARCHITECTURE v1 OF axi_test_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_arrsum_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_arrsum_rsc_triosy_obj IS
  PORT(
    arrsum_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    arrsum_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END axi_test_core_arrsum_rsc_triosy_obj;

ARCHITECTURE v1 OF axi_test_core_arrsum_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL arrsum_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      arrsum_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      arrsum_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  arrsum_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => arrsum_rsc_triosy_obj_ld_core_sct,
      lz => arrsum_rsc_triosy_lz
    );
  axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl_inst : axi_test_core_arrsum_rsc_triosy_obj_arrsum_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      arrsum_rsc_triosy_obj_iswt0 => arrsum_rsc_triosy_obj_iswt0,
      arrsum_rsc_triosy_obj_ld_core_sct => arrsum_rsc_triosy_obj_ld_core_sct
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_a_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_a_rsc_triosy_obj IS
  PORT(
    a_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    a_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END axi_test_core_a_rsc_triosy_obj;

ARCHITECTURE v1 OF axi_test_core_a_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      a_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      a_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  a_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => a_rsc_triosy_obj_ld_core_sct,
      lz => a_rsc_triosy_lz
    );
  axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl_inst : axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      a_rsc_triosy_obj_iswt0 => a_rsc_triosy_obj_iswt0,
      a_rsc_triosy_obj_ld_core_sct => a_rsc_triosy_obj_ld_core_sct
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_complete_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_complete_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC
  );
END axi_test_core_complete_rsci;

ARCHITECTURE v1 OF axi_test_core_complete_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_biwt : STD_LOGIC;
  SIGNAL complete_rsci_bdwt : STD_LOGIC;
  SIGNAL complete_rsci_bcwt : STD_LOGIC;
  SIGNAL complete_rsci_ivld_core_sct : STD_LOGIC;
  SIGNAL complete_rsci_irdy : STD_LOGIC;

  COMPONENT axi_test_core_complete_rsci_complete_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      complete_rsci_oswt : IN STD_LOGIC;
      complete_rsci_biwt : OUT STD_LOGIC;
      complete_rsci_bdwt : OUT STD_LOGIC;
      complete_rsci_bcwt : IN STD_LOGIC;
      complete_rsci_ivld_core_sct : OUT STD_LOGIC;
      complete_rsci_irdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_complete_rsci_complete_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsci_oswt : IN STD_LOGIC;
      complete_rsci_wen_comp : OUT STD_LOGIC;
      complete_rsci_biwt : IN STD_LOGIC;
      complete_rsci_bdwt : IN STD_LOGIC;
      complete_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  complete_rsci : work.ccs_sync_out_wait_pkg_v1.ccs_sync_out_wait_v1
    GENERIC MAP(
      rscid => 4
      )
    PORT MAP(
      vld => complete_rsc_vld,
      rdy => complete_rsc_rdy,
      ivld => complete_rsci_ivld_core_sct,
      irdy => complete_rsci_irdy
    );
  axi_test_core_complete_rsci_complete_wait_ctrl_inst : axi_test_core_complete_rsci_complete_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt,
      complete_rsci_ivld_core_sct => complete_rsci_ivld_core_sct,
      complete_rsci_irdy => complete_rsci_irdy
    );
  axi_test_core_complete_rsci_complete_wait_dp_inst : axi_test_core_complete_rsci_complete_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_a_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_a_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_rsci_adra_d : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    a_rsci_oswt : IN STD_LOGIC;
    a_rsci_adra_d_core : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wten_pff : IN STD_LOGIC;
    a_rsci_oswt_pff : IN STD_LOGIC
  );
END axi_test_core_a_rsci_1;

ARCHITECTURE v1 OF axi_test_core_a_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_rsci_biwt : STD_LOGIC;
  SIGNAL a_rsci_bdwt : STD_LOGIC;
  SIGNAL a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL a_rsci_qa_d_mxwt_pconst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_adra_d_reg : STD_LOGIC_VECTOR (3 DOWNTO 0);

  COMPONENT axi_test_core_a_rsci_1_a_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      a_rsci_oswt : IN STD_LOGIC;
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
          DOWNTO 0);
      a_rsci_biwt : OUT STD_LOGIC;
      a_rsci_bdwt : OUT STD_LOGIC;
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      a_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT axi_test_core_a_rsci_1_a_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_rsci_adra_d : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      a_rsci_adra_d_core : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      a_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsci_biwt : IN STD_LOGIC;
      a_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_adra_d : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_adra_d_core : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_qa_d_mxwt : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

BEGIN
  axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst : axi_test_core_a_rsci_1_a_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      a_rsci_oswt => a_rsci_oswt,
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      a_rsci_biwt => a_rsci_biwt,
      a_rsci_bdwt => a_rsci_bdwt,
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct => axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff => core_wten_pff,
      a_rsci_oswt_pff => a_rsci_oswt_pff
    );
  axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(0)));
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= axi_test_core_a_rsci_1_a_rsc_wait_ctrl_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;

  axi_test_core_a_rsci_1_a_rsc_wait_dp_inst : axi_test_core_a_rsci_1_a_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      a_rsci_adra_d => axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_adra_d,
      a_rsci_qa_d => axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_qa_d,
      a_rsci_adra_d_core => axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_adra_d_core,
      a_rsci_qa_d_mxwt => axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_qa_d_mxwt,
      a_rsci_biwt => a_rsci_biwt,
      a_rsci_bdwt => a_rsci_bdwt
    );
  a_rsci_adra_d_reg <= axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_adra_d;
  axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_qa_d <= a_rsci_qa_d;
  axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_adra_d_core <= STD_LOGIC_VECTOR'(
      "0000") & (a_rsci_adra_d_core(3 DOWNTO 0));
  a_rsci_qa_d_mxwt_pconst <= axi_test_core_a_rsci_1_a_rsc_wait_dp_inst_a_rsci_qa_d_mxwt;

  a_rsci_qa_d_mxwt <= a_rsci_qa_d_mxwt_pconst;
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  a_rsci_adra_d <= a_rsci_adra_d_reg;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core_run_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core_run_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC
  );
END axi_test_core_run_rsci;

ARCHITECTURE v1 OF axi_test_core_run_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_rsci_ivld : STD_LOGIC;
  SIGNAL run_rsci_biwt : STD_LOGIC;
  SIGNAL run_rsci_bdwt : STD_LOGIC;

  COMPONENT axi_test_core_run_rsci_run_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_biwt : OUT STD_LOGIC;
      run_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_run_rsci_run_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsci_ivld_mxwt : OUT STD_LOGIC;
      run_rsci_ivld : IN STD_LOGIC;
      run_rsci_biwt : IN STD_LOGIC;
      run_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  run_rsci : work.ccs_sync_in_wait_pkg_v1.ccs_sync_in_wait_v1
    GENERIC MAP(
      rscid => 1
      )
    PORT MAP(
      vld => run_rsc_vld,
      rdy => run_rsc_rdy,
      ivld => run_rsci_ivld,
      irdy => run_rsci_biwt
    );
  axi_test_core_run_rsci_run_wait_ctrl_inst : axi_test_core_run_rsci_run_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      run_rsci_oswt => run_rsci_oswt,
      core_wten => core_wten,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
  axi_test_core_run_rsci_run_wait_dp_inst : axi_test_core_run_rsci_run_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt,
      run_rsci_ivld => run_rsci_ivld,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    a_rsc_triosy_lz : OUT STD_LOGIC;
    arrsum_rsc_dat : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    arrsum_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    a_rsci_adra_d : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END axi_test_core;

ARCHITECTURE v1 OF axi_test_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL run_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL a_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL arrsum_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL complete_rsci_wen_comp : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL ADD_LOOP_i_4_0_sva_3_0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL ADD_LOOP_i_4_0_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL run_ac_sync_tmp_dobj_sva_st : STD_LOGIC;
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_a_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_a_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL a_rsci_adra_d_reg : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL run_ac_sync_tmp_dobj_sva : STD_LOGIC;
  SIGNAL sum_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL sum_sva_1_mx0w0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL arrsum_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL arrsum_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT axi_test_core_run_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsc_rdy : OUT STD_LOGIC;
      run_rsc_vld : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_ivld_mxwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_a_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_rsci_adra_d : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      a_rsci_oswt : IN STD_LOGIC;
      a_rsci_adra_d_core : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      a_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
          DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      a_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_adra_d : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_adra_d_core : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_test_core_a_rsci_1_inst_a_rsci_oswt_pff : STD_LOGIC;

  COMPONENT axi_test_core_complete_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsc_rdy : IN STD_LOGIC;
      complete_rsc_vld : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      complete_rsci_oswt : IN STD_LOGIC;
      complete_rsci_wen_comp : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_a_rsc_triosy_obj
    PORT(
      a_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      a_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_arrsum_rsc_triosy_obj
    PORT(
      arrsum_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      arrsum_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      core_wten_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_test_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      main_C_0_tr0 : IN STD_LOGIC;
      ADD_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_test_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL axi_test_core_core_fsm_inst_main_C_0_tr0 : STD_LOGIC;
  SIGNAL axi_test_core_core_fsm_inst_ADD_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_2_2(input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);

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
  arrsum_rsci : work.ccs_out_pkg_v1.ccs_out_v1
    GENERIC MAP(
      rscid => 3,
      width => 32
      )
    PORT MAP(
      idat => arrsum_rsci_idat_1,
      dat => arrsum_rsci_dat
    );
  arrsum_rsci_idat_1 <= arrsum_rsci_idat;
  arrsum_rsc_dat <= arrsum_rsci_dat;

  axi_test_core_run_rsci_inst : axi_test_core_run_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      core_wen => complete_rsci_wen_comp,
      run_rsci_oswt => reg_run_rsci_oswt_cse,
      core_wten => core_wten,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt
    );
  axi_test_core_a_rsci_1_inst : axi_test_core_a_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      a_rsci_adra_d => axi_test_core_a_rsci_1_inst_a_rsci_adra_d,
      a_rsci_qa_d => axi_test_core_a_rsci_1_inst_a_rsci_qa_d,
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => axi_test_core_a_rsci_1_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      a_rsci_oswt => reg_a_rsci_oswt_cse,
      a_rsci_adra_d_core => axi_test_core_a_rsci_1_inst_a_rsci_adra_d_core,
      a_rsci_qa_d_mxwt => axi_test_core_a_rsci_1_inst_a_rsci_qa_d_mxwt,
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => axi_test_core_a_rsci_1_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff => core_wten_iff,
      a_rsci_oswt_pff => axi_test_core_a_rsci_1_inst_a_rsci_oswt_pff
    );
  a_rsci_adra_d_reg <= axi_test_core_a_rsci_1_inst_a_rsci_adra_d;
  axi_test_core_a_rsci_1_inst_a_rsci_qa_d <= a_rsci_qa_d;
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= axi_test_core_a_rsci_1_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  axi_test_core_a_rsci_1_inst_a_rsci_adra_d_core <= STD_LOGIC_VECTOR'( "0000") &
      ADD_LOOP_i_4_0_sva_3_0;
  a_rsci_qa_d_mxwt <= axi_test_core_a_rsci_1_inst_a_rsci_qa_d_mxwt;
  axi_test_core_a_rsci_1_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct <=
      STD_LOGIC_VECTOR'( '0' & (fsm_output(2)));
  axi_test_core_a_rsci_1_inst_a_rsci_oswt_pff <= fsm_output(2);

  axi_test_core_complete_rsci_inst : axi_test_core_complete_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      core_wen => complete_rsci_wen_comp,
      complete_rsci_oswt => reg_complete_rsci_oswt_cse,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  axi_test_core_a_rsc_triosy_obj_inst : axi_test_core_a_rsc_triosy_obj
    PORT MAP(
      a_rsc_triosy_lz => a_rsc_triosy_lz,
      core_wten => core_wten,
      a_rsc_triosy_obj_iswt0 => reg_a_rsc_triosy_obj_iswt0_cse
    );
  axi_test_core_arrsum_rsc_triosy_obj_inst : axi_test_core_arrsum_rsc_triosy_obj
    PORT MAP(
      arrsum_rsc_triosy_lz => arrsum_rsc_triosy_lz,
      core_wten => core_wten,
      arrsum_rsc_triosy_obj_iswt0 => reg_a_rsc_triosy_obj_iswt0_cse
    );
  axi_test_core_staller_inst : axi_test_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wten => core_wten,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      core_wten_pff => core_wten_iff
    );
  axi_test_core_core_fsm_inst : axi_test_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      fsm_output => axi_test_core_core_fsm_inst_fsm_output,
      main_C_0_tr0 => axi_test_core_core_fsm_inst_main_C_0_tr0,
      ADD_LOOP_C_1_tr0 => axi_test_core_core_fsm_inst_ADD_LOOP_C_1_tr0
    );
  fsm_output <= axi_test_core_core_fsm_inst_fsm_output;
  axi_test_core_core_fsm_inst_main_C_0_tr0 <= NOT run_ac_sync_tmp_dobj_sva_st;
  axi_test_core_core_fsm_inst_ADD_LOOP_C_1_tr0 <= ADD_LOOP_i_4_0_sva_1(4);

  sum_sva_1_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(sum_sva) + UNSIGNED(a_rsci_qa_d_mxwt),
      32));
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  a_rsci_adra_d <= a_rsci_adra_d_reg;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        ADD_LOOP_i_4_0_sva_3_0 <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (ADD_LOOP_i_4_0_sva_1(3
            DOWNTO 0)), (fsm_output(3)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_run_rsci_oswt_cse <= '0';
        reg_a_rsci_oswt_cse <= '0';
        reg_complete_rsci_oswt_cse <= '0';
        reg_a_rsc_triosy_obj_iswt0_cse <= '0';
        ADD_LOOP_i_4_0_sva_1 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( complete_rsci_wen_comp = '1' ) THEN
        reg_run_rsci_oswt_cse <= (fsm_output(6)) OR (fsm_output(0));
        reg_a_rsci_oswt_cse <= fsm_output(2);
        reg_complete_rsci_oswt_cse <= run_ac_sync_tmp_dobj_sva_st AND (fsm_output(4));
        reg_a_rsc_triosy_obj_iswt0_cse <= fsm_output(5);
        ADD_LOOP_i_4_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(ADD_LOOP_i_4_0_sva_3_0),
            4), 5) + UNSIGNED'( "00001"), 5));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (ADD_LOOP_i_4_0_sva_1(4)) AND (fsm_output(3)))
          = '1' ) THEN
        arrsum_rsci_idat <= sum_sva_1_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_ac_sync_tmp_dobj_sva_st <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (fsm_output(6))) = '1' ) THEN
        run_ac_sync_tmp_dobj_sva_st <= run_ac_sync_tmp_dobj_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_ac_sync_tmp_dobj_sva <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (fsm_output(1))) = '1' ) THEN
        run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((fsm_output(3)) OR (fsm_output(1)))) = '1'
          ) THEN
        sum_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            sum_sva_1_mx0w0, (fsm_output(3)));
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    axi_test
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_test IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    a_rsc_adra : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_wea : OUT STD_LOGIC;
    a_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_adrb : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_web : OUT STD_LOGIC;
    a_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_triosy_lz : OUT STD_LOGIC;
    arrsum_rsc_dat : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    arrsum_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END axi_test;

ARCHITECTURE v1 OF axi_test IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL a_rsci_adra_d : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT axi_test_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_2_4_32_16_16_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL a_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_adrb : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_adra : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_adra_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL a_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL a_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL a_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL a_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT axi_test_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsc_rdy : OUT STD_LOGIC;
      run_rsc_vld : IN STD_LOGIC;
      a_rsc_triosy_lz : OUT STD_LOGIC;
      arrsum_rsc_dat : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      arrsum_rsc_triosy_lz : OUT STD_LOGIC;
      complete_rsc_rdy : IN STD_LOGIC;
      complete_rsc_vld : OUT STD_LOGIC;
      a_rsci_adra_d : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL axi_test_core_inst_arrsum_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_test_core_inst_a_rsci_adra_d : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_test_core_inst_a_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL axi_test_core_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);

BEGIN
  a_rsci : axi_test_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_2_4_32_16_16_32_1_gen
    PORT MAP(
      qb => a_rsci_qb,
      web => a_rsc_web,
      db => a_rsci_db,
      adrb => a_rsci_adrb,
      qa => a_rsci_qa,
      wea => a_rsc_wea,
      da => a_rsci_da,
      adra => a_rsci_adra,
      adra_d => a_rsci_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => a_rsci_da_d,
      qa_d => a_rsci_qa_d_1,
      wea_d => a_rsci_wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d => a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => a_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
    );
  a_rsci_qb <= a_rsc_qb;
  a_rsc_db <= a_rsci_db;
  a_rsc_adrb <= a_rsci_adrb;
  a_rsci_qa <= a_rsc_qa;
  a_rsc_da <= a_rsci_da;
  a_rsc_adra <= a_rsci_adra;
  a_rsci_adra_d_1 <= STD_LOGIC_VECTOR'( "0000") & a_rsci_adra_d;
  a_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  a_rsci_qa_d <= a_rsci_qa_d_1;
  a_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  a_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  axi_test_core_inst : axi_test_core
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      a_rsc_triosy_lz => a_rsc_triosy_lz,
      arrsum_rsc_dat => axi_test_core_inst_arrsum_rsc_dat,
      arrsum_rsc_triosy_lz => arrsum_rsc_triosy_lz,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      a_rsci_adra_d => axi_test_core_inst_a_rsci_adra_d,
      a_rsci_qa_d => axi_test_core_inst_a_rsci_qa_d,
      a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => axi_test_core_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
    );
  arrsum_rsc_dat <= axi_test_core_inst_arrsum_rsc_dat;
  a_rsci_adra_d <= axi_test_core_inst_a_rsci_adra_d;
  axi_test_core_inst_a_rsci_qa_d <= a_rsci_qa_d;
  a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= axi_test_core_inst_a_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;

END v1;



