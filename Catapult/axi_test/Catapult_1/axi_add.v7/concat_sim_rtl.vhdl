
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


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
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
--  Generated date: Sun Jan  2 18:35:22 2022
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    main_C_0_tr0 : IN STD_LOGIC;
    ADD_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END axi_add_core_core_fsm;

ARCHITECTURE v7 OF axi_add_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for axi_add_core_core_fsm_1
  TYPE axi_add_core_core_fsm_1_ST IS (core_rlp_C_0, main_C_0, ADD_LOOP_C_0, ADD_LOOP_C_1,
      main_C_1, main_C_2);

  SIGNAL state_var : axi_add_core_core_fsm_1_ST;
  SIGNAL state_var_NS : axi_add_core_core_fsm_1_ST;

BEGIN
  axi_add_core_core_fsm_1 : PROCESS (main_C_0_tr0, ADD_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010");
        IF ( main_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= ADD_LOOP_C_0;
        END IF;
      WHEN ADD_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100");
        state_var_NS <= ADD_LOOP_C_1;
      WHEN ADD_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000");
        IF ( ADD_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= ADD_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS axi_add_core_core_fsm_1;

  axi_add_core_core_fsm_1_REG : PROCESS (clk)
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
  END PROCESS axi_add_core_core_fsm_1_REG;

END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC
  );
END axi_add_core_staller;

ARCHITECTURE v7 OF axi_add_core_staller IS
  -- Default Constants

BEGIN
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        core_wten <= '0';
      ELSE
        core_wten <= NOT complete_rsci_wen_comp;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    b_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    b_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl;

ARCHITECTURE v7 OF axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  b_rsc_triosy_obj_ld_core_sct <= b_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    a_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    a_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl;

ARCHITECTURE v7 OF axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  a_rsc_triosy_obj_ld_core_sct <= a_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_complete_rsci_complete_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_complete_rsci_complete_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC;
    complete_rsci_biwt : IN STD_LOGIC;
    complete_rsci_bdwt : IN STD_LOGIC;
    complete_rsci_bcwt : OUT STD_LOGIC
  );
END axi_add_core_complete_rsci_complete_wait_dp;

ARCHITECTURE v7 OF axi_add_core_complete_rsci_complete_wait_dp IS
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
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_complete_rsci_complete_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_complete_rsci_complete_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_biwt : OUT STD_LOGIC;
    complete_rsci_bdwt : OUT STD_LOGIC;
    complete_rsci_bcwt : IN STD_LOGIC;
    complete_rsci_ivld_core_sct : OUT STD_LOGIC;
    complete_rsci_irdy : IN STD_LOGIC
  );
END axi_add_core_complete_rsci_complete_wait_ctrl;

ARCHITECTURE v7 OF axi_add_core_complete_rsci_complete_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_ogwt : STD_LOGIC;

BEGIN
  complete_rsci_bdwt <= complete_rsci_oswt AND core_wen;
  complete_rsci_biwt <= complete_rsci_ogwt AND complete_rsci_irdy;
  complete_rsci_ogwt <= complete_rsci_oswt AND (NOT complete_rsci_bcwt);
  complete_rsci_ivld_core_sct <= complete_rsci_ogwt;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_run_rsci_run_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_run_rsci_run_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC;
    run_rsci_ivld : IN STD_LOGIC;
    run_rsci_biwt : IN STD_LOGIC;
    run_rsci_bdwt : IN STD_LOGIC
  );
END axi_add_core_run_rsci_run_wait_dp;

ARCHITECTURE v7 OF axi_add_core_run_rsci_run_wait_dp IS
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
      IF (rst = '1') THEN
        run_rsci_ivld_bfwt <= '0';
      ELSIF ( run_rsci_biwt = '1' ) THEN
        run_rsci_ivld_bfwt <= run_rsci_ivld;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_run_rsci_run_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_run_rsci_run_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_biwt : OUT STD_LOGIC;
    run_rsci_bdwt : OUT STD_LOGIC
  );
END axi_add_core_run_rsci_run_wait_ctrl;

ARCHITECTURE v7 OF axi_add_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_b_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_b_rsc_triosy_obj IS
  PORT(
    b_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    b_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END axi_add_core_b_rsc_triosy_obj;

ARCHITECTURE v7 OF axi_add_core_b_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL b_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      b_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      b_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  b_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => b_rsc_triosy_obj_ld_core_sct,
      lz => b_rsc_triosy_lz
    );
  axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl_inst : axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      b_rsc_triosy_obj_iswt0 => b_rsc_triosy_obj_iswt0,
      b_rsc_triosy_obj_ld_core_sct => b_rsc_triosy_obj_ld_core_sct
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_a_rsc_triosy_obj IS
  PORT(
    a_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    a_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END axi_add_core_a_rsc_triosy_obj;

ARCHITECTURE v7 OF axi_add_core_a_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
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
  axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl_inst : axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      a_rsc_triosy_obj_iswt0 => a_rsc_triosy_obj_iswt0,
      a_rsc_triosy_obj_ld_core_sct => a_rsc_triosy_obj_ld_core_sct
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_complete_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_complete_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC
  );
END axi_add_core_complete_rsci;

ARCHITECTURE v7 OF axi_add_core_complete_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_biwt : STD_LOGIC;
  SIGNAL complete_rsci_bdwt : STD_LOGIC;
  SIGNAL complete_rsci_bcwt : STD_LOGIC;
  SIGNAL complete_rsci_ivld_core_sct : STD_LOGIC;
  SIGNAL complete_rsci_irdy : STD_LOGIC;

  COMPONENT axi_add_core_complete_rsci_complete_wait_ctrl
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
  COMPONENT axi_add_core_complete_rsci_complete_wait_dp
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
  axi_add_core_complete_rsci_complete_wait_ctrl_inst : axi_add_core_complete_rsci_complete_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt,
      complete_rsci_ivld_core_sct => complete_rsci_ivld_core_sct,
      complete_rsci_irdy => complete_rsci_irdy
    );
  axi_add_core_complete_rsci_complete_wait_dp_inst : axi_add_core_complete_rsci_complete_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_run_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core_run_rsci IS
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
END axi_add_core_run_rsci;

ARCHITECTURE v7 OF axi_add_core_run_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_rsci_ivld : STD_LOGIC;
  SIGNAL run_rsci_biwt : STD_LOGIC;
  SIGNAL run_rsci_bdwt : STD_LOGIC;

  COMPONENT axi_add_core_run_rsci_run_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_biwt : OUT STD_LOGIC;
      run_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_run_rsci_run_wait_dp
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
  axi_add_core_run_rsci_run_wait_ctrl_inst : axi_add_core_run_rsci_run_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      run_rsci_oswt => run_rsci_oswt,
      core_wten => core_wten,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
  axi_add_core_run_rsci_run_wait_dp_inst : axi_add_core_run_rsci_run_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt,
      run_rsci_ivld => run_rsci_ivld,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    a_rsc_dat : IN STD_LOGIC_VECTOR (511 DOWNTO 0);
    a_rsc_triosy_lz : OUT STD_LOGIC;
    b_rsc_dat : OUT STD_LOGIC_VECTOR (511 DOWNTO 0);
    b_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END axi_add_core;

ARCHITECTURE v7 OF axi_add_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL run_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL a_rsci_idat : STD_LOGIC_VECTOR (511 DOWNTO 0);
  SIGNAL complete_rsci_wen_comp : STD_LOGIC;
  SIGNAL b_rsci_idat_511_482 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_481_480 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_479_450 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_449_448 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_447_418 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_417_416 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_415_386 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_385_384 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_383_354 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_353_352 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_351_322 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_321_320 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_319_290 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_289_288 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_287_258 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_257_256 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_255_226 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_225_224 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_223_194 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_193_192 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_191_162 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_161_160 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_159_130 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_129_128 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_127_98 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_97_96 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_95_66 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_65_64 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_63_34 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_33_32 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_idat_31_2 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_idat_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL or_dcpl_1 : STD_LOGIC;
  SIGNAL or_dcpl_2 : STD_LOGIC;
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL or_dcpl_7 : STD_LOGIC;
  SIGNAL or_dcpl_9 : STD_LOGIC;
  SIGNAL or_dcpl_12 : STD_LOGIC;
  SIGNAL or_dcpl_13 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL or_dcpl_28 : STD_LOGIC;
  SIGNAL or_dcpl_30 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_33 : STD_LOGIC;
  SIGNAL or_dcpl_38 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL or_tmp_1 : STD_LOGIC;
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL or_tmp_13 : STD_LOGIC;
  SIGNAL or_tmp_19 : STD_LOGIC;
  SIGNAL or_tmp_25 : STD_LOGIC;
  SIGNAL or_tmp_31 : STD_LOGIC;
  SIGNAL or_tmp_37 : STD_LOGIC;
  SIGNAL or_tmp_43 : STD_LOGIC;
  SIGNAL or_tmp_49 : STD_LOGIC;
  SIGNAL or_tmp_55 : STD_LOGIC;
  SIGNAL or_tmp_61 : STD_LOGIC;
  SIGNAL or_tmp_67 : STD_LOGIC;
  SIGNAL or_tmp_73 : STD_LOGIC;
  SIGNAL or_tmp_79 : STD_LOGIC;
  SIGNAL or_tmp_85 : STD_LOGIC;
  SIGNAL or_tmp_91 : STD_LOGIC;
  SIGNAL ADD_LOOP_i_4_0_sva_3_0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL ADD_LOOP_i_4_0_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL run_ac_sync_tmp_dobj_sva : STD_LOGIC;
  SIGNAL ADD_LOOP_and_cse : STD_LOGIC;
  SIGNAL reg_b_rsc_triosy_obj_ld_core_psct_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_ivld_core_psct_cse : STD_LOGIC;
  SIGNAL reg_run_rsci_irdy_core_psct_cse : STD_LOGIC;
  SIGNAL b_and_cse : STD_LOGIC;
  SIGNAL drf_a_ptr_smx_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsc_1_511_482_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_481_480_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_479_450_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_449_448_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_447_418_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_417_416_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_415_386_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_385_384_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_383_354_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_353_352_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_351_322_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_321_320_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_319_290_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_289_288_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_287_258_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_257_256_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_255_226_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_225_224_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_223_194_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_193_192_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_191_162_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_161_160_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_159_130_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_129_128_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_127_98_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_97_96_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_95_66_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_65_64_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_63_34_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_33_32_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsc_1_31_2_lpi_1_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsc_1_1_0_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL operator_32_false_acc_psp_sva_1 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_and_32_cse : STD_LOGIC;
  SIGNAL b_and_33_cse : STD_LOGIC;
  SIGNAL b_and_36_cse : STD_LOGIC;
  SIGNAL b_and_37_cse : STD_LOGIC;
  SIGNAL b_and_40_cse : STD_LOGIC;
  SIGNAL b_and_41_cse : STD_LOGIC;
  SIGNAL b_and_44_cse : STD_LOGIC;
  SIGNAL b_and_45_cse : STD_LOGIC;
  SIGNAL b_and_48_cse : STD_LOGIC;
  SIGNAL b_and_49_cse : STD_LOGIC;
  SIGNAL b_and_52_cse : STD_LOGIC;
  SIGNAL b_and_53_cse : STD_LOGIC;
  SIGNAL b_and_56_cse : STD_LOGIC;
  SIGNAL b_and_57_cse : STD_LOGIC;
  SIGNAL b_and_60_cse : STD_LOGIC;

  SIGNAL a_rsci_dat : STD_LOGIC_VECTOR (511 DOWNTO 0);
  SIGNAL a_rsci_idat_1 : STD_LOGIC_VECTOR (511 DOWNTO 0);

  SIGNAL b_rsci_idat : STD_LOGIC_VECTOR (511 DOWNTO 0);
  SIGNAL b_rsci_dat : STD_LOGIC_VECTOR (511 DOWNTO 0);

  COMPONENT axi_add_core_run_rsci
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
  COMPONENT axi_add_core_complete_rsci
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
  COMPONENT axi_add_core_a_rsc_triosy_obj
    PORT(
      a_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      a_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_b_rsc_triosy_obj
    PORT(
      b_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      b_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      main_C_0_tr0 : IN STD_LOGIC;
      ADD_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_add_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL axi_add_core_core_fsm_inst_main_C_0_tr0 : STD_LOGIC;
  SIGNAL axi_add_core_core_fsm_inst_ADD_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX_v_2_2_2(input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_30_2_2(input_0 : STD_LOGIC_VECTOR(29 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(29 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(29 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_32_16_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN "1011" =>
          result := input_11;
        WHEN "1100" =>
          result := input_12;
        WHEN "1101" =>
          result := input_13;
        WHEN "1110" =>
          result := input_14;
        WHEN others =>
          result := input_15;
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
  a_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 512
      )
    PORT MAP(
      dat => a_rsci_dat,
      idat => a_rsci_idat_1
    );
  a_rsci_dat <= a_rsc_dat;
  a_rsci_idat <= a_rsci_idat_1;

  b_rsci : work.ccs_out_pkg_v1.ccs_out_v1
    GENERIC MAP(
      rscid => 3,
      width => 512
      )
    PORT MAP(
      idat => b_rsci_idat,
      dat => b_rsci_dat
    );
  b_rsci_idat <= b_rsci_idat_511_482 & b_rsci_idat_481_480 & b_rsci_idat_479_450
      & b_rsci_idat_449_448 & b_rsci_idat_447_418 & b_rsci_idat_417_416 & b_rsci_idat_415_386
      & b_rsci_idat_385_384 & b_rsci_idat_383_354 & b_rsci_idat_353_352 & b_rsci_idat_351_322
      & b_rsci_idat_321_320 & b_rsci_idat_319_290 & b_rsci_idat_289_288 & b_rsci_idat_287_258
      & b_rsci_idat_257_256 & b_rsci_idat_255_226 & b_rsci_idat_225_224 & b_rsci_idat_223_194
      & b_rsci_idat_193_192 & b_rsci_idat_191_162 & b_rsci_idat_161_160 & b_rsci_idat_159_130
      & b_rsci_idat_129_128 & b_rsci_idat_127_98 & b_rsci_idat_97_96 & b_rsci_idat_95_66
      & b_rsci_idat_65_64 & b_rsci_idat_63_34 & b_rsci_idat_33_32 & b_rsci_idat_31_2
      & b_rsci_idat_1_0;
  b_rsc_dat <= b_rsci_dat;

  axi_add_core_run_rsci_inst : axi_add_core_run_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      core_wen => complete_rsci_wen_comp,
      run_rsci_oswt => reg_run_rsci_irdy_core_psct_cse,
      core_wten => core_wten,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt
    );
  axi_add_core_complete_rsci_inst : axi_add_core_complete_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      core_wen => complete_rsci_wen_comp,
      complete_rsci_oswt => reg_complete_rsci_ivld_core_psct_cse,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  axi_add_core_a_rsc_triosy_obj_inst : axi_add_core_a_rsc_triosy_obj
    PORT MAP(
      a_rsc_triosy_lz => a_rsc_triosy_lz,
      core_wten => core_wten,
      a_rsc_triosy_obj_iswt0 => reg_b_rsc_triosy_obj_ld_core_psct_cse
    );
  axi_add_core_b_rsc_triosy_obj_inst : axi_add_core_b_rsc_triosy_obj
    PORT MAP(
      b_rsc_triosy_lz => b_rsc_triosy_lz,
      core_wten => core_wten,
      b_rsc_triosy_obj_iswt0 => reg_b_rsc_triosy_obj_ld_core_psct_cse
    );
  axi_add_core_staller_inst : axi_add_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wten => core_wten,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  axi_add_core_core_fsm_inst : axi_add_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      fsm_output => axi_add_core_core_fsm_inst_fsm_output,
      main_C_0_tr0 => axi_add_core_core_fsm_inst_main_C_0_tr0,
      ADD_LOOP_C_1_tr0 => axi_add_core_core_fsm_inst_ADD_LOOP_C_1_tr0
    );
  fsm_output <= axi_add_core_core_fsm_inst_fsm_output;
  axi_add_core_core_fsm_inst_main_C_0_tr0 <= NOT run_ac_sync_tmp_dobj_sva;
  axi_add_core_core_fsm_inst_ADD_LOOP_C_1_tr0 <= ADD_LOOP_i_4_0_sva_1(4);

  ADD_LOOP_and_cse <= complete_rsci_wen_comp AND (fsm_output(2));
  b_and_cse <= complete_rsci_wen_comp AND (fsm_output(3));
  b_and_32_cse <= b_and_cse AND (or_dcpl_5 OR or_dcpl);
  b_and_33_cse <= b_and_cse AND (or_dcpl_13 OR or_dcpl_4);
  b_and_36_cse <= b_and_cse AND (or_dcpl_5 OR or_dcpl_9);
  b_and_37_cse <= b_and_cse AND (or_dcpl_13 OR or_dcpl_7);
  b_and_40_cse <= b_and_cse AND (or_dcpl_5 OR or_dcpl_7);
  b_and_41_cse <= b_and_cse AND (or_dcpl_13 OR or_dcpl_9);
  b_and_44_cse <= b_and_cse AND (or_dcpl_5 OR or_dcpl_4);
  b_and_45_cse <= b_and_cse AND (or_dcpl_13 OR or_dcpl);
  b_and_48_cse <= b_and_cse AND (or_dcpl_2 OR or_dcpl);
  b_and_49_cse <= b_and_cse AND (or_dcpl_18 OR or_dcpl_4);
  b_and_52_cse <= b_and_cse AND (or_dcpl_2 OR or_dcpl_9);
  b_and_53_cse <= b_and_cse AND (or_dcpl_18 OR or_dcpl_7);
  b_and_56_cse <= b_and_cse AND (or_dcpl_2 OR or_dcpl_7);
  b_and_57_cse <= b_and_cse AND (or_dcpl_18 OR or_dcpl_9);
  b_and_60_cse <= b_and_cse AND (or_dcpl_18 OR or_dcpl);
  drf_a_ptr_smx_sva_1 <= MUX_v_32_16_2((a_rsci_idat(31 DOWNTO 0)), (a_rsci_idat(63
      DOWNTO 32)), (a_rsci_idat(95 DOWNTO 64)), (a_rsci_idat(127 DOWNTO 96)), (a_rsci_idat(159
      DOWNTO 128)), (a_rsci_idat(191 DOWNTO 160)), (a_rsci_idat(223 DOWNTO 192)),
      (a_rsci_idat(255 DOWNTO 224)), (a_rsci_idat(287 DOWNTO 256)), (a_rsci_idat(319
      DOWNTO 288)), (a_rsci_idat(351 DOWNTO 320)), (a_rsci_idat(383 DOWNTO 352)),
      (a_rsci_idat(415 DOWNTO 384)), (a_rsci_idat(447 DOWNTO 416)), (a_rsci_idat(479
      DOWNTO 448)), (a_rsci_idat(511 DOWNTO 480)), ADD_LOOP_i_4_0_sva_3_0);
  operator_32_false_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(drf_a_ptr_smx_sva_1(31
      DOWNTO 2)) + UNSIGNED'( "000000000000000000000000011001"), 30));
  or_dcpl <= NOT(CONV_SL_1_1(ADD_LOOP_i_4_0_sva_1(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_1 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_1(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_2 <= or_dcpl_1 OR (ADD_LOOP_i_4_0_sva_1(2));
  or_dcpl_4 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_5 <= or_dcpl_1 OR (NOT (ADD_LOOP_i_4_0_sva_1(2)));
  or_dcpl_7 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_9 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_12 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_1(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_13 <= or_dcpl_12 OR (ADD_LOOP_i_4_0_sva_1(2));
  or_dcpl_18 <= or_dcpl_12 OR (NOT (ADD_LOOP_i_4_0_sva_1(2)));
  or_dcpl_25 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_26 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_28 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_30 <= NOT(CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_32 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_33 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_38 <= CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_43 <= NOT(CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")));
  or_tmp_1 <= (NOT((CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0001")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0010"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0011")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0100"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0101")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0110"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("0111")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1000"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1001")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1010"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1011")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1100"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1101")))
      OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1110"))) OR (CONV_SL_1_1(ADD_LOOP_i_4_0_sva_3_0=STD_LOGIC_VECTOR'("1111")))))
      AND (fsm_output(2));
  or_tmp_7 <= (or_dcpl_26 OR or_dcpl_25) AND (fsm_output(2));
  or_tmp_13 <= (or_dcpl_26 OR or_dcpl_28) AND (fsm_output(2));
  or_tmp_19 <= (or_dcpl_26 OR or_dcpl_30) AND (fsm_output(2));
  or_tmp_25 <= (or_dcpl_33 OR or_dcpl_32) AND (fsm_output(2));
  or_tmp_31 <= (or_dcpl_33 OR or_dcpl_25) AND (fsm_output(2));
  or_tmp_37 <= (or_dcpl_33 OR or_dcpl_28) AND (fsm_output(2));
  or_tmp_43 <= (or_dcpl_33 OR or_dcpl_30) AND (fsm_output(2));
  or_tmp_49 <= (or_dcpl_38 OR or_dcpl_32) AND (fsm_output(2));
  or_tmp_55 <= (or_dcpl_38 OR or_dcpl_25) AND (fsm_output(2));
  or_tmp_61 <= (or_dcpl_38 OR or_dcpl_28) AND (fsm_output(2));
  or_tmp_67 <= (or_dcpl_38 OR or_dcpl_30) AND (fsm_output(2));
  or_tmp_73 <= (or_dcpl_43 OR or_dcpl_32) AND (fsm_output(2));
  or_tmp_79 <= (or_dcpl_43 OR or_dcpl_25) AND (fsm_output(2));
  or_tmp_85 <= (or_dcpl_43 OR or_dcpl_28) AND (fsm_output(2));
  or_tmp_91 <= (or_dcpl_43 OR or_dcpl_30) AND (fsm_output(2));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsci_idat_1_0 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_31_2 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_33_32 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_63_34 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_65_64 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_95_66 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_97_96 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_127_98 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_129_128 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_159_130 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_161_160 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_191_162 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_193_192 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_223_194 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_225_224 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_255_226 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_257_256 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_287_258 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_289_288 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_319_290 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_321_320 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_351_322 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_353_352 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_383_354 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_385_384 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_415_386 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_417_416 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_447_418 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_449_448 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_479_450 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsci_idat_481_480 <= STD_LOGIC_VECTOR'( "00");
        b_rsci_idat_511_482 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( ADD_LOOP_and_cse = '1' ) THEN
        b_rsci_idat_1_0 <= MUX_v_2_2_2(b_rsc_1_1_0_lpi_1_dfm, (drf_a_ptr_smx_sva_1(1
            DOWNTO 0)), or_tmp_1);
        b_rsci_idat_31_2 <= MUX_v_30_2_2(b_rsc_1_31_2_lpi_1_dfm, operator_32_false_acc_psp_sva_1,
            or_tmp_1);
        b_rsci_idat_33_32 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_33_32_lpi_1_dfm,
            or_tmp_7);
        b_rsci_idat_63_34 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_63_34_lpi_1_dfm,
            or_tmp_7);
        b_rsci_idat_65_64 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_65_64_lpi_1_dfm,
            or_tmp_13);
        b_rsci_idat_95_66 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_95_66_lpi_1_dfm,
            or_tmp_13);
        b_rsci_idat_97_96 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_97_96_lpi_1_dfm,
            or_tmp_19);
        b_rsci_idat_127_98 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_127_98_lpi_1_dfm,
            or_tmp_19);
        b_rsci_idat_129_128 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_129_128_lpi_1_dfm,
            or_tmp_25);
        b_rsci_idat_159_130 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_159_130_lpi_1_dfm,
            or_tmp_25);
        b_rsci_idat_161_160 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_161_160_lpi_1_dfm,
            or_tmp_31);
        b_rsci_idat_191_162 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_191_162_lpi_1_dfm,
            or_tmp_31);
        b_rsci_idat_193_192 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_193_192_lpi_1_dfm,
            or_tmp_37);
        b_rsci_idat_223_194 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_223_194_lpi_1_dfm,
            or_tmp_37);
        b_rsci_idat_225_224 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_225_224_lpi_1_dfm,
            or_tmp_43);
        b_rsci_idat_255_226 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_255_226_lpi_1_dfm,
            or_tmp_43);
        b_rsci_idat_257_256 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_257_256_lpi_1_dfm,
            or_tmp_49);
        b_rsci_idat_287_258 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_287_258_lpi_1_dfm,
            or_tmp_49);
        b_rsci_idat_289_288 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_289_288_lpi_1_dfm,
            or_tmp_55);
        b_rsci_idat_319_290 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_319_290_lpi_1_dfm,
            or_tmp_55);
        b_rsci_idat_321_320 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_321_320_lpi_1_dfm,
            or_tmp_61);
        b_rsci_idat_351_322 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_351_322_lpi_1_dfm,
            or_tmp_61);
        b_rsci_idat_353_352 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_353_352_lpi_1_dfm,
            or_tmp_67);
        b_rsci_idat_383_354 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_383_354_lpi_1_dfm,
            or_tmp_67);
        b_rsci_idat_385_384 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_385_384_lpi_1_dfm,
            or_tmp_73);
        b_rsci_idat_415_386 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_415_386_lpi_1_dfm,
            or_tmp_73);
        b_rsci_idat_417_416 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_417_416_lpi_1_dfm,
            or_tmp_79);
        b_rsci_idat_447_418 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_447_418_lpi_1_dfm,
            or_tmp_79);
        b_rsci_idat_449_448 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_449_448_lpi_1_dfm,
            or_tmp_85);
        b_rsci_idat_479_450 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_479_450_lpi_1_dfm,
            or_tmp_85);
        b_rsci_idat_481_480 <= MUX_v_2_2_2((drf_a_ptr_smx_sva_1(1 DOWNTO 0)), b_rsc_1_481_480_lpi_1_dfm,
            or_tmp_91);
        b_rsci_idat_511_482 <= MUX_v_30_2_2(operator_32_false_acc_psp_sva_1, b_rsc_1_511_482_lpi_1_dfm,
            or_tmp_91);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_b_rsc_triosy_obj_ld_core_psct_cse <= '0';
        reg_complete_rsci_ivld_core_psct_cse <= '0';
        reg_run_rsci_irdy_core_psct_cse <= '0';
        ADD_LOOP_i_4_0_sva_3_0 <= STD_LOGIC_VECTOR'( "0000");
        ADD_LOOP_i_4_0_sva_1 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( complete_rsci_wen_comp = '1' ) THEN
        reg_b_rsc_triosy_obj_ld_core_psct_cse <= fsm_output(4);
        reg_complete_rsci_ivld_core_psct_cse <= (ADD_LOOP_i_4_0_sva_1(4)) AND (fsm_output(3));
        reg_run_rsci_irdy_core_psct_cse <= (fsm_output(0)) OR (fsm_output(5));
        ADD_LOOP_i_4_0_sva_3_0 <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (ADD_LOOP_i_4_0_sva_1(3
            DOWNTO 0)), (fsm_output(3)));
        ADD_LOOP_i_4_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(ADD_LOOP_i_4_0_sva_3_0),
            4), 5) + UNSIGNED'( "00001"), 5));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_255_226_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_225_224_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_32_cse = '1' ) THEN
        b_rsc_1_255_226_lpi_1_dfm <= b_rsci_idat_255_226;
        b_rsc_1_225_224_lpi_1_dfm <= b_rsci_idat_225_224;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_257_256_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_287_258_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_33_cse = '1' ) THEN
        b_rsc_1_257_256_lpi_1_dfm <= b_rsci_idat_257_256;
        b_rsc_1_287_258_lpi_1_dfm <= b_rsci_idat_287_258;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_223_194_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_193_192_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_36_cse = '1' ) THEN
        b_rsc_1_223_194_lpi_1_dfm <= b_rsci_idat_223_194;
        b_rsc_1_193_192_lpi_1_dfm <= b_rsci_idat_193_192;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_289_288_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_319_290_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_37_cse = '1' ) THEN
        b_rsc_1_289_288_lpi_1_dfm <= b_rsci_idat_289_288;
        b_rsc_1_319_290_lpi_1_dfm <= b_rsci_idat_319_290;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_191_162_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_161_160_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_40_cse = '1' ) THEN
        b_rsc_1_191_162_lpi_1_dfm <= b_rsci_idat_191_162;
        b_rsc_1_161_160_lpi_1_dfm <= b_rsci_idat_161_160;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_321_320_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_351_322_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_41_cse = '1' ) THEN
        b_rsc_1_321_320_lpi_1_dfm <= b_rsci_idat_321_320;
        b_rsc_1_351_322_lpi_1_dfm <= b_rsci_idat_351_322;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_159_130_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_129_128_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_44_cse = '1' ) THEN
        b_rsc_1_159_130_lpi_1_dfm <= b_rsci_idat_159_130;
        b_rsc_1_129_128_lpi_1_dfm <= b_rsci_idat_129_128;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_353_352_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_383_354_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_45_cse = '1' ) THEN
        b_rsc_1_353_352_lpi_1_dfm <= b_rsci_idat_353_352;
        b_rsc_1_383_354_lpi_1_dfm <= b_rsci_idat_383_354;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_127_98_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_97_96_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_48_cse = '1' ) THEN
        b_rsc_1_127_98_lpi_1_dfm <= b_rsci_idat_127_98;
        b_rsc_1_97_96_lpi_1_dfm <= b_rsci_idat_97_96;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_385_384_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_415_386_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_49_cse = '1' ) THEN
        b_rsc_1_385_384_lpi_1_dfm <= b_rsci_idat_385_384;
        b_rsc_1_415_386_lpi_1_dfm <= b_rsci_idat_415_386;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_95_66_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_65_64_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_52_cse = '1' ) THEN
        b_rsc_1_95_66_lpi_1_dfm <= b_rsci_idat_95_66;
        b_rsc_1_65_64_lpi_1_dfm <= b_rsci_idat_65_64;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_417_416_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_447_418_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_53_cse = '1' ) THEN
        b_rsc_1_417_416_lpi_1_dfm <= b_rsci_idat_417_416;
        b_rsc_1_447_418_lpi_1_dfm <= b_rsci_idat_447_418;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_63_34_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_33_32_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_56_cse = '1' ) THEN
        b_rsc_1_63_34_lpi_1_dfm <= b_rsci_idat_63_34;
        b_rsc_1_33_32_lpi_1_dfm <= b_rsci_idat_33_32;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_449_448_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_479_450_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_57_cse = '1' ) THEN
        b_rsc_1_449_448_lpi_1_dfm <= b_rsci_idat_449_448;
        b_rsc_1_479_450_lpi_1_dfm <= b_rsci_idat_479_450;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_31_2_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
        b_rsc_1_1_0_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( b_and_cse = '1' ) THEN
        b_rsc_1_31_2_lpi_1_dfm <= b_rsci_idat_31_2;
        b_rsc_1_1_0_lpi_1_dfm <= b_rsci_idat_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsc_1_481_480_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00");
        b_rsc_1_511_482_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( b_and_60_cse = '1' ) THEN
        b_rsc_1_481_480_lpi_1_dfm <= b_rsci_idat_481_480;
        b_rsc_1_511_482_lpi_1_dfm <= b_rsci_idat_511_482;
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
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;


ENTITY axi_add IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    a_rsc_dat : IN STD_LOGIC_VECTOR (511 DOWNTO 0);
    a_rsc_triosy_lz : OUT STD_LOGIC;
    b_rsc_dat : OUT STD_LOGIC_VECTOR (511 DOWNTO 0);
    b_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END axi_add;

ARCHITECTURE v7 OF axi_add IS
  -- Default Constants

  COMPONENT axi_add_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsc_rdy : OUT STD_LOGIC;
      run_rsc_vld : IN STD_LOGIC;
      a_rsc_dat : IN STD_LOGIC_VECTOR (511 DOWNTO 0);
      a_rsc_triosy_lz : OUT STD_LOGIC;
      b_rsc_dat : OUT STD_LOGIC_VECTOR (511 DOWNTO 0);
      b_rsc_triosy_lz : OUT STD_LOGIC;
      complete_rsc_rdy : IN STD_LOGIC;
      complete_rsc_vld : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_add_core_inst_a_rsc_dat : STD_LOGIC_VECTOR (511 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_dat : STD_LOGIC_VECTOR (511 DOWNTO 0);

BEGIN
  axi_add_core_inst : axi_add_core
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      a_rsc_dat => axi_add_core_inst_a_rsc_dat,
      a_rsc_triosy_lz => a_rsc_triosy_lz,
      b_rsc_dat => axi_add_core_inst_b_rsc_dat,
      b_rsc_triosy_lz => b_rsc_triosy_lz,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld
    );
  axi_add_core_inst_a_rsc_dat <= a_rsc_dat;
  b_rsc_dat <= axi_add_core_inst_b_rsc_dat;

END v7;



