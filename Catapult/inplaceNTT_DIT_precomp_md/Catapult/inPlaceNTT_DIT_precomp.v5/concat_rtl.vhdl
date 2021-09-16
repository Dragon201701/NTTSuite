
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


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_out_dreg_v2.vhd 
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
PACKAGE mgc_out_dreg_pkg_v2 IS

COMPONENT mgc_out_dreg_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END mgc_out_dreg_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_out_dreg_v2 IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_dreg_v2;

ARCHITECTURE beh OF mgc_out_dreg_v2 IS
BEGIN

  z <= d;

END beh;

--------> ../td_ccore_solutions/modulo_sub_a48ff83301b11bc89e50b3ecfb088e71634e_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Sep 16 11:33:31 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    modulo_sub_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;


ENTITY modulo_sub_core IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_sub_core;

ARCHITECTURE v1 OF modulo_sub_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL base_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL return_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  base_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 4,
      width => 32
      )
    PORT MAP(
      dat => base_rsci_dat,
      idat => base_rsci_idat_1
    );
  base_rsci_dat <= base_rsc_dat;
  base_rsci_idat <= base_rsci_idat_1;

  m_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 5,
      width => 32
      )
    PORT MAP(
      dat => m_rsci_dat,
      idat => m_rsci_idat_1
    );
  m_rsci_dat <= m_rsc_dat;
  m_rsci_idat <= m_rsci_idat_1;

  return_rsci : work.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 6,
      width => 32
      )
    PORT MAP(
      d => return_rsci_d_1,
      z => return_rsci_z
    );
  return_rsci_d_1 <= return_rsci_d;
  return_rsc_z <= return_rsci_z;

  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( ccs_ccore_en = '1' ) THEN
        return_rsci_d <= MUX_v_32_2_2(('0' & (base_rsci_idat(30 DOWNTO 0))), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(qif_acc_nl),
            32)), base_rsci_idat(31));
      END IF;
    END IF;
  END PROCESS;
  qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (base_rsci_idat(30
      DOWNTO 0))) + UNSIGNED(m_rsci_idat), 32));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    modulo_sub
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;


ENTITY modulo_sub IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_sub;

ARCHITECTURE v1 OF modulo_sub IS
  -- Default Constants

  COMPONENT modulo_sub_core
    PORT(
      base_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL modulo_sub_core_inst_base_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_core_inst_m_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_core_inst_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  modulo_sub_core_inst : modulo_sub_core
    PORT MAP(
      base_rsc_dat => modulo_sub_core_inst_base_rsc_dat,
      m_rsc_dat => modulo_sub_core_inst_m_rsc_dat,
      return_rsc_z => modulo_sub_core_inst_return_rsc_z,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_en => ccs_ccore_en
    );
  modulo_sub_core_inst_base_rsc_dat <= base_rsc_dat;
  modulo_sub_core_inst_m_rsc_dat <= m_rsc_dat;
  return_rsc_z <= modulo_sub_core_inst_return_rsc_z;

END v1;




--------> ../td_ccore_solutions/modulo_add_9e6b06881060c48119593246171fb95f6028_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Sep 16 11:33:32 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    modulo_add_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;


ENTITY modulo_add_core IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_add_core;

ARCHITECTURE v1 OF modulo_add_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL base_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL return_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  base_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 32
      )
    PORT MAP(
      dat => base_rsci_dat,
      idat => base_rsci_idat_1
    );
  base_rsci_dat <= base_rsc_dat;
  base_rsci_idat <= base_rsci_idat_1;

  m_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 32
      )
    PORT MAP(
      dat => m_rsci_dat,
      idat => m_rsci_idat_1
    );
  m_rsci_dat <= m_rsc_dat;
  m_rsci_idat <= m_rsci_idat_1;

  return_rsci : work.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 3,
      width => 32
      )
    PORT MAP(
      d => return_rsci_d_1,
      z => return_rsci_z
    );
  return_rsci_d_1 <= return_rsci_d;
  return_rsc_z <= return_rsci_z;

  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( ccs_ccore_en = '1' ) THEN
        return_rsci_d <= MUX_v_32_2_2(base_rsci_idat, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(qif_acc_nl),
            32)), acc_1_nl(32));
      END IF;
    END IF;
  END PROCESS;
  qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(base_rsci_idat) - UNSIGNED(m_rsci_idat),
      32));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_rsci_idat) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT
      base_rsci_idat), 32), 33) + UNSIGNED'( "000000000000000000000000000000001"),
      33));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    modulo_add
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;


ENTITY modulo_add IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_add;

ARCHITECTURE v1 OF modulo_add IS
  -- Default Constants

  COMPONENT modulo_add_core
    PORT(
      base_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL modulo_add_core_inst_base_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_core_inst_m_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_core_inst_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  modulo_add_core_inst : modulo_add_core
    PORT MAP(
      base_rsc_dat => modulo_add_core_inst_base_rsc_dat,
      m_rsc_dat => modulo_add_core_inst_m_rsc_dat,
      return_rsc_z => modulo_add_core_inst_return_rsc_z,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_en => ccs_ccore_en
    );
  modulo_add_core_inst_base_rsc_dat <= base_rsc_dat;
  modulo_add_core_inst_m_rsc_dat <= m_rsc_dat;
  return_rsc_z <= modulo_add_core_inst_return_rsc_z;

END v1;




--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/src/funcs.vhd 

-- a package of attributes that give verification tools a hint about
-- the function being implemented
PACKAGE attributes IS
  ATTRIBUTE CALYPTO_FUNC : string;
  ATTRIBUTE CALYPTO_DATA_ORDER : string;
end attributes;

-----------------------------------------------------------------------
-- Package that declares synthesizable functions needed for RTL output
-----------------------------------------------------------------------

LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

   FUNCTION maximum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION minimum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2 : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
   
-----------------------------------------------------------------
-- logic functions
-----------------------------------------------------------------

   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION or_v (inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- mux functions
-----------------------------------------------------------------

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC_VECTOR;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- latch functions
-----------------------------------------------------------------
   FUNCTION lat_s(dinput: STD_LOGIC       ; clk: STD_LOGIC; doutput: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- tristate functions
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC       ; control: STD_LOGIC) RETURN STD_LOGIC;
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: SIGNED  ) RETURN STD_LOGIC;

   -- RETURN 2 bits (left => lt, right => eq)
   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED;
 
   FUNCTION fabs(arg1: SIGNED  ) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "**" (l, r: UNSIGNED) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "**" (l, r: SIGNED  ) RETURN SIGNED  ;

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-- *_stdar functions use shift functions from std_logic_arith
-----------------------------------------------------------------

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;

   -----------------------------------------------------------------
   -- *_stdar functions use shift functions from std_logic_arith
   -----------------------------------------------------------------
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC;
   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE;
   --FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR ;

   FUNCTION ceil_log2(size : NATURAL) return NATURAL;
   FUNCTION bits(size : NATURAL) return NATURAL;    

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   
END funcs;


--------------------------- B O D Y ----------------------------


PACKAGE BODY funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC IS
     BEGIN IF arg1 THEN RETURN '1'; ELSE RETURN '0'; END IF; END;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
--     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;

   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
     VARIABLE result: STD_LOGIC_VECTOR(0 DOWNTO 0);
   BEGIN
     result := (0 => arg1);
     RETURN result;
   END;

   FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 > arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION minimum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 < arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := input1'LENGTH;
     ALIAS input1a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
     ALIAS input2a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     --synopsys translate_off
     FOR i IN len-1 DOWNTO 0 LOOP
       result(i) := resolved(input1a(i) & input2a(i));
     END LOOP;
     --synopsys translate_on
     RETURN result;
   END;

   FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED) RETURN UNSIGNED IS
   BEGIN RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

   FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED) RETURN SIGNED IS
   BEGIN RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

-----------------------------------------------------------------
-- Logic Functions
-----------------------------------------------------------------

   FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;
   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(and_v(inputs, 1)); END;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(or_v(inputs, 1)); END;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(xor_v(inputs, 1)); END;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result AND inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION or_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     -- this if is added as a quick fix for a bug in catapult evaluating the loop even if inputs'LENGTH==1
     -- see dts0100971279
     IF icnt2 > 1 THEN
       FOR i IN icnt2-1 DOWNTO 1 LOOP
         inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
         result := result OR inputsx(olenM1 DOWNTO 0);
       END LOOP;
     END IF;
     RETURN result;
   END;

   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result XOR inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

-----------------------------------------------------------------
-- Muxes
-----------------------------------------------------------------
   
   FUNCTION mux_sel2_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(1 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 4;
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector( size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "01" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "10" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "11" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel3_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(2 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 8;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "001" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "010" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "011" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "100" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "101" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "110" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "111" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel4_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 16;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "0000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "0001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "0010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "0011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "0100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "0101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "0110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "0111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "1000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "1001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "1010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "1011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "1100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "1101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "1110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "1111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel5_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(4 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 32;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0 );
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "00001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "00010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "00011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "00100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "00101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "00110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "00111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "01000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "01001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "01010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "01011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "01100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "01101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "01110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "01111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "10000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "10001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "10010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "10011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "10100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "10101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "10110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "10111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "11000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "11001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "11010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "11011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "11100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "11101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "11110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "11111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel6_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(5 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 64;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "000001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "000010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "000011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "000100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "000101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "000110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "000111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "001000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "001001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "001010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "001011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "001100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "001101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "001110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "001111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "010000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "010001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "010010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "010011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "010100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "010101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "010110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "010111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "011000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "011001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "011010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "011011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "011100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "011101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "011110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "011111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN "100000" =>
       result := inputs0( 33*size-1 DOWNTO 32*size);
     WHEN "100001" =>
       result := inputs0( 34*size-1 DOWNTO 33*size);
     WHEN "100010" =>
       result := inputs0( 35*size-1 DOWNTO 34*size);
     WHEN "100011" =>
       result := inputs0( 36*size-1 DOWNTO 35*size);
     WHEN "100100" =>
       result := inputs0( 37*size-1 DOWNTO 36*size);
     WHEN "100101" =>
       result := inputs0( 38*size-1 DOWNTO 37*size);
     WHEN "100110" =>
       result := inputs0( 39*size-1 DOWNTO 38*size);
     WHEN "100111" =>
       result := inputs0( 40*size-1 DOWNTO 39*size);
     WHEN "101000" =>
       result := inputs0( 41*size-1 DOWNTO 40*size);
     WHEN "101001" =>
       result := inputs0( 42*size-1 DOWNTO 41*size);
     WHEN "101010" =>
       result := inputs0( 43*size-1 DOWNTO 42*size);
     WHEN "101011" =>
       result := inputs0( 44*size-1 DOWNTO 43*size);
     WHEN "101100" =>
       result := inputs0( 45*size-1 DOWNTO 44*size);
     WHEN "101101" =>
       result := inputs0( 46*size-1 DOWNTO 45*size);
     WHEN "101110" =>
       result := inputs0( 47*size-1 DOWNTO 46*size);
     WHEN "101111" =>
       result := inputs0( 48*size-1 DOWNTO 47*size);
     WHEN "110000" =>
       result := inputs0( 49*size-1 DOWNTO 48*size);
     WHEN "110001" =>
       result := inputs0( 50*size-1 DOWNTO 49*size);
     WHEN "110010" =>
       result := inputs0( 51*size-1 DOWNTO 50*size);
     WHEN "110011" =>
       result := inputs0( 52*size-1 DOWNTO 51*size);
     WHEN "110100" =>
       result := inputs0( 53*size-1 DOWNTO 52*size);
     WHEN "110101" =>
       result := inputs0( 54*size-1 DOWNTO 53*size);
     WHEN "110110" =>
       result := inputs0( 55*size-1 DOWNTO 54*size);
     WHEN "110111" =>
       result := inputs0( 56*size-1 DOWNTO 55*size);
     WHEN "111000" =>
       result := inputs0( 57*size-1 DOWNTO 56*size);
     WHEN "111001" =>
       result := inputs0( 58*size-1 DOWNTO 57*size);
     WHEN "111010" =>
       result := inputs0( 59*size-1 DOWNTO 58*size);
     WHEN "111011" =>
       result := inputs0( 60*size-1 DOWNTO 59*size);
     WHEN "111100" =>
       result := inputs0( 61*size-1 DOWNTO 60*size);
     WHEN "111101" =>
       result := inputs0( 62*size-1 DOWNTO 61*size);
     WHEN "111110" =>
       result := inputs0( 63*size-1 DOWNTO 62*size);
     WHEN "111111" =>
       result := inputs0( 64*size-1 DOWNTO 63*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS  --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2 SEVERITY FAILURE;
     --synopsys translate_on
       CASE sel IS
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0( size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1  DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0(size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
       RETURN result;
   END;
--   BEGIN RETURN mux_v(inputs, TO_STDLOGICVECTOR(sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     ALIAS    sel0   : STD_LOGIC_VECTOR( sel'LENGTH-1 DOWNTO 0 ) IS sel;

     VARIABLE sellen : INTEGER RANGE 2-sel'LENGTH TO sel'LENGTH;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2**sel'LENGTH;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
     TYPE inputs_array_type is array(natural range <>) of std_logic_vector( olen - 1 DOWNTO 0);
     VARIABLE inputs_array : inputs_array_type( 2**sel'LENGTH - 1 DOWNTO 0);
   BEGIN
     sellen := sel'LENGTH;
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2**sellen SEVERITY FAILURE;
     sellen := 2-sellen;
     --synopsys translate_on
     CASE sellen IS
     WHEN 1 =>
       CASE sel0(0) IS

       WHEN '1' 
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0(  size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1 DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0( size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
     WHEN 2 =>
       result := mux_sel2_v(inputs, not sel);
     WHEN 3 =>
       result := mux_sel3_v(inputs, not sel);
     WHEN 4 =>
       result := mux_sel4_v(inputs, not sel);
     WHEN 5 =>
       result := mux_sel5_v(inputs, not sel);
     WHEN 6 =>
       result := mux_sel6_v(inputs, not sel);
     WHEN others =>
       -- synopsys translate_off
       IF(Is_X(sel0)) THEN
         result := (others => 'X');
       ELSE
       -- synopsys translate_on
         FOR i in 0 to 2**sel'LENGTH - 1 LOOP
           inputs_array(i) := inputs0( ((i + 1) * olen) - 1  DOWNTO i*olen);
         END LOOP;
         result := inputs_array(CONV_INTEGER( (UNSIGNED(NOT sel0)) ));
       -- synopsys translate_off
       END IF;
       -- synopsys translate_on
     END CASE;
     RETURN result;
   END;

 
-----------------------------------------------------------------
-- Latches
-----------------------------------------------------------------

   FUNCTION lat_s(dinput: STD_LOGIC; clk: STD_LOGIC; doutput: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN mux_s(STD_LOGIC_VECTOR'(doutput & dinput), clk); END;

   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR ; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     --synopsys translate_off
     ASSERT dinput'LENGTH = doutput'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN mux_v(doutput & dinput, clk);
   END;

-----------------------------------------------------------------
-- Tri-States
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC; control: STD_LOGIC) RETURN STD_LOGIC IS
--   BEGIN RETURN TO_STDLOGIC(tri_v(TO_STDLOGICVECTOR(dinput), control)); END;
--
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR ; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
--     VARIABLE result: STD_LOGIC_VECTOR(dinput'range);
--   BEGIN
--     CASE control IS
--     WHEN '0' | 'L' =>
--       result := (others => 'Z');
--     WHEN '1' | 'H' =>
--       FOR i IN dinput'range LOOP
--         result(i) := to_UX01(dinput(i));
--       END LOOP;
--     WHEN others =>
--       -- synopsys translate_off
--       result := (others => 'X');
--       -- synopsys translate_on
--     END CASE;
--     RETURN result;
--   END;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;

   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     VARIABLE diff: UNSIGNED(l'LENGTH DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     diff := ('0'&l) - ('0'&r);
     RETURN diff(l'LENGTH);
   END;
   FUNCTION "<"(l, r: SIGNED  ) RETURN STD_LOGIC IS
   BEGIN
     RETURN (UNSIGNED(l) < UNSIGNED(r)) xor (l(l'LEFT) xor r(r'LEFT));
   END;

   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION "<=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">"(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;
   FUNCTION ">=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;

   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN not or_s(l xor r);
   END;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   --some functions to placate spyglass
   FUNCTION mult_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a*b;
   END mult_natural;

   FUNCTION div_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a/b;
   END div_natural;

   FUNCTION mod_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a mod b;
   END mod_natural;

   FUNCTION add_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a+b;
   END add_unsigned;

   FUNCTION sub_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a-b;
   END sub_unsigned;

   FUNCTION sub_int(a,b : INTEGER) RETURN INTEGER IS
   BEGIN
     return a-b;
   END sub_int;

   FUNCTION concat_0(b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return '0' & b;
   END concat_0;

   FUNCTION concat_uns(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a&b;
   END concat_uns;

   FUNCTION concat_vect(a,b : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     return a&b;
   END concat_vect;





   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED IS
     CONSTANT ninps : NATURAL := arg'LENGTH / width;
     ALIAS    arg0  : UNSIGNED(arg'LENGTH-1 DOWNTO 0) IS arg;
     VARIABLE result: UNSIGNED(width-1 DOWNTO 0);
     VARIABLE from  : INTEGER;
     VARIABLE dto   : INTEGER;
   BEGIN
     --synopsys translate_off
     ASSERT arg'LENGTH = width * ninps SEVERITY FAILURE;
     --synopsys translate_on
     result := (OTHERS => '0');
     FOR i IN ninps-1 DOWNTO 0 LOOP
       --result := result + arg0((i+1)*width-1 DOWNTO i*width);
       from := mult_natural((i+1), width)-1; --2.1.6.3
       dto  := mult_natural(i,width); --2.1.6.3
       result := add_unsigned(result , arg0(from DOWNTO dto) );
     END LOOP;
     RETURN result;
   END faccu;

   FUNCTION  fabs (arg1: SIGNED) RETURN UNSIGNED IS
   BEGIN
     CASE arg1(arg1'LEFT) IS
     WHEN '1'
     --synopsys translate_off
          | 'H'
     --synopsys translate_on
       =>
       RETURN UNSIGNED'("0") - UNSIGNED(arg1);
     WHEN '0'
     --synopsys translate_off
          | 'L'
     --synopsys translate_on
       =>
       RETURN UNSIGNED(arg1);
     WHEN others =>
       RETURN resolve_unsigned(UNSIGNED(arg1), UNSIGNED'("0") - UNSIGNED(arg1));
     END CASE;
   END;

   PROCEDURE divmod(l, r: UNSIGNED; rdiv, rmod: OUT UNSIGNED) IS
     CONSTANT llen: INTEGER := l'LENGTH;
     CONSTANT rlen: INTEGER := r'LENGTH;
     CONSTANT llen_plus_rlen: INTEGER := llen + rlen;
     VARIABLE lbuf: UNSIGNED(llen+rlen-1 DOWNTO 0);
     VARIABLE diff: UNSIGNED(rlen DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT rdiv'LENGTH = llen AND rmod'LENGTH = rlen SEVERITY FAILURE;
     --synopsys translate_on
     lbuf := (others => '0');
     lbuf(llen-1 DOWNTO 0) := l;
     FOR i IN rdiv'range LOOP
       diff := sub_unsigned(lbuf(llen_plus_rlen-1 DOWNTO llen-1) ,(concat_0(r)));
       rdiv(i) := not diff(rlen);
       IF diff(rlen) = '0' THEN
         lbuf(llen_plus_rlen-1 DOWNTO llen-1) := diff;
       END IF;
       lbuf(llen_plus_rlen-1 DOWNTO 1) := lbuf(llen_plus_rlen-2 DOWNTO 0);
     END LOOP;
     rmod := lbuf(llen_plus_rlen-1 DOWNTO llen);
   END divmod;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rdiv;
   END "/";

   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rmod;
   END;

   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN l MOD r; END;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rdiv := UNSIGNED'("0") - rdiv;
     END IF;
     RETURN SIGNED(rdiv); -- overflow problem "1000" / "11"
   END "/";

   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
     CONSTANT rnul: UNSIGNED(r'LENGTH-1 DOWNTO 0) := (others => '0');
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     IF rmod /= rnul AND to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rmod := UNSIGNED(r) + rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "MOD";

   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "REM";

   FUNCTION mult_unsigned(l,r : UNSIGNED) return UNSIGNED is
   BEGIN
     return l*r; 
   END mult_unsigned;

   FUNCTION "**" (l, r : UNSIGNED) RETURN UNSIGNED IS
     CONSTANT llen  : NATURAL := l'LENGTH;
     VARIABLE result: UNSIGNED(llen-1 DOWNTO 0);
     VARIABLE fak   : UNSIGNED(llen-1 DOWNTO 0);
   BEGIN
     fak := l;
     result := (others => '0'); result(0) := '1';
     FOR i IN r'reverse_range LOOP
       --was:result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(result & (result*fak)), r(i)));
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR( concat_uns(result , mult_unsigned(result,fak) )), r(i)));

       fak := mult_unsigned(fak , fak);
     END LOOP;
     RETURN result;
   END "**";

   FUNCTION "**" (l, r : SIGNED) RETURN SIGNED IS
     CONSTANT rlen  : NATURAL := r'LENGTH;
     ALIAS    r0    : SIGNED(0 TO r'LENGTH-1) IS r;
     VARIABLE result: SIGNED(l'range);
   BEGIN
     CASE r(r'LEFT) IS
     WHEN '0'
   --synopsys translate_off
          | 'L'
   --synopsys translate_on
     =>
       result := SIGNED(UNSIGNED(l) ** UNSIGNED(r0(1 TO r'LENGTH-1)));
     WHEN '1'
   --synopsys translate_off
          | 'H'
   --synopsys translate_on
     =>
       result := (others => '0');
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END "**";

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-----------------------------------------------------------------

   FUNCTION add_nat(arg1 : NATURAL; arg2 : NATURAL ) RETURN NATURAL IS
   BEGIN
     return (arg1 + arg2);
   END;
   
--   FUNCTION UNSIGNED_2_BIT_VECTOR(arg1 : NATURAL; arg2 : NATURAL ) RETURN BIT_VECTOR IS
--   BEGIN
--     return (arg1 + arg2);
--   END;
   
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(SIGNED(result), arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: SIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: SIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
        =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
        =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;


   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     --SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: NATURAL range 1 TO len;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => '0');
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         --was:temp(i2+sw) := result(i2);
         temp_idx := add_nat(i2,sw);
         temp(temp_idx) := result(i2);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: sw_range;
     VARIABLE result_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => sbit);
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         -- was: temp(i2) := result(i2+sw);
         result_idx := add_nat(i2,sw);
         temp(i2) := result(result_idx);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;


   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := arg1'LENGTH;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     VARIABLE temp: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     SUBTYPE sw_range IS NATURAL range 0 TO len-1;
     VARIABLE sw: sw_range;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     result := (others=>'0');
     result := arg1;
     sw := sdir MOD len;
     FOR i IN arg2'reverse_range LOOP
       EXIT WHEN sw = 0;
       IF signd2 AND i = arg2'LEFT THEN 
         sw := sub_int(len,sw); 
       END IF;
       -- temp := result(len-sw-1 DOWNTO 0) & result(len-1 DOWNTO len-sw)
       FOR i2 IN len-1 DOWNTO 0 LOOP
         --was: temp((i2+sw) MOD len) := result(i2);
         temp_idx := add_nat(i2,sw) MOD len;
         temp(temp_idx) := result(i2);
       END LOOP;
       result := mux_v(STD_LOGIC_VECTOR(concat_vect(result,temp)), arg2(i));
       sw := mod_natural(mult_natural(sw,2), len);
     END LOOP;
     RETURN result;
   END frot;

   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, -1); END;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, -1); END;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC IS
     CONSTANT len : INTEGER := vec'LENGTH;
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
   BEGIN
     IF index >= len OR index < 0 THEN
       RETURN 'X';
     END IF;
     RETURN vec0(index);
   END;

   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     CONSTANT indexPwidthM1 : INTEGER := index+width-1; --2.1.6.3
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
     CONSTANT xxx : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => 'X');
   BEGIN
     IF index+width > len OR index < 0 THEN
       RETURN xxx;
     END IF;
     RETURN vec0(indexPwidthM1 DOWNTO index);
   END;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     VARIABLE vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     CONSTANT xxx : STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others => 'X');
   BEGIN
     vec0 := vec;
     IF index >= len OR index < 0 THEN
       RETURN xxx;
     END IF;
     vec0(index) := dinput;
     RETURN vec0;
   END;

   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE IS
     VARIABLE n_b : POSITIVE;
     VARIABLE p_v : NATURAL;
   BEGIN
     p_v := p;
     FOR i IN 1 TO 32 LOOP
       p_v := div_natural(p_v,2);
       n_b := i;
       EXIT WHEN (p_v = 0);
     END LOOP;
     RETURN n_b;
   END;


--   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
--
--     CONSTANT vlen: INTEGER := vec'LENGTH;
--     CONSTANT ilen: INTEGER := dinput'LENGTH;
--     CONSTANT max_shift: INTEGER := vlen-ilen;
--     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
--     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
--     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
--     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
--     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
--     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
--   BEGIN
--     inp := (others => '0');
--     mask := (others => '0');
--
--     IF index > max_shift OR index < 0 THEN
--       RETURN xxx;
--     END IF;
--
--     shift := CONV_UNSIGNED(index, shift'LENGTH);
--     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
--     mask(ilen-1 DOWNTO 0) := ones;
--     inp := fshl(inp, shift, vlen);
--     mask := fshl(mask, shift, vlen);
--     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
--     RETURN vec0;
--   END;

   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR IS

     type enable_matrix is array (0 to enable'LENGTH-1 ) of std_logic_vector(byte_width-1 downto 0);
     CONSTANT vlen: INTEGER := vec'LENGTH;
     CONSTANT ilen: INTEGER := dinput'LENGTH;
     CONSTANT max_shift: INTEGER := vlen-ilen;
     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask2: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE enables: enable_matrix;
     VARIABLE cat_enables: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0 );
     VARIABLE lsbi : INTEGER;
     VARIABLE msbi : INTEGER;

   BEGIN
     cat_enables := (others => '0');
     lsbi := 0;
     msbi := byte_width-1;
     inp := (others => '0');
     mask := (others => '0');

     IF index > max_shift OR index < 0 THEN
       RETURN xxx;
     END IF;

     --initialize enables
     for i in 0 TO (enable'LENGTH-1) loop
       enables(i)  := (others => enable(i));
       cat_enables(msbi downto lsbi) := enables(i) ;
       lsbi := msbi+1;
       msbi := msbi+byte_width;
     end loop;


     shift := CONV_UNSIGNED(index, shift'LENGTH);
     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
     mask(ilen-1 DOWNTO 0) := UNSIGNED((STD_LOGIC_VECTOR(ones) AND cat_enables));
     inp := fshl(inp, shift, vlen);
     mask := fshl(mask, shift, vlen);
     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
     RETURN vec0;
   END;


   FUNCTION ceil_log2(size : NATURAL) return NATURAL is
     VARIABLE cnt : NATURAL;
     VARIABLE res : NATURAL;
   begin
     cnt := 1;
     res := 0;
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;
   
   FUNCTION bits(size : NATURAL) return NATURAL is
   begin
     return ceil_log2(size);
   END;

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH) xor conv_std_logic_vector(c, s'LENGTH);
     cout := ( (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH)) or (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) or (conv_std_logic_vector(b, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) );
   END PROCEDURE csa;

   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH);
     cout := (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH));
   END PROCEDURE csha;

END funcs;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_comps_v5.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;

PACKAGE mgc_shift_comps_v5 IS

COMPONENT mgc_shift_l_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_r_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_bl_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_br_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

END mgc_shift_comps_v5;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_l_beh_v5.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_shift_l_v5 IS
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END mgc_shift_l_v5;

LIBRARY ieee;

USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF mgc_shift_l_v5 IS

  FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
  BEGIN
    IF(arg1 > arg2) THEN
      RETURN(arg1) ;
    ELSE
      RETURN(arg2) ;
    END IF;
  END;

  FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
    CONSTANT ilen: INTEGER := arg1'LENGTH;
    CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
    CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
    CONSTANT len: INTEGER := maximum(ilen, olen);
    VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
  BEGIN
    result := (others => sbit);
    result(ilenub DOWNTO 0) := arg1;
    result := shl(result, arg2);
    RETURN result(olenM1 DOWNTO 0);
  END;

  FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
    CONSTANT ilen: INTEGER := arg1'LENGTH;
    CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
    CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
    CONSTANT len: INTEGER := maximum(ilen, olen);
    VARIABLE result: SIGNED(len-1 DOWNTO 0);
  BEGIN
    result := (others => sbit);
    result(ilenub DOWNTO 0) := arg1;
    result := shl(SIGNED(result), arg2);
    RETURN result(olenM1 DOWNTO 0);
  END;

  FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE)
  RETURN UNSIGNED IS
  BEGIN
    RETURN fshl_stdar(arg1, arg2, '0', olen);
  END;

  FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE)
  RETURN SIGNED IS
  BEGIN
    RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen);
  END;

BEGIN
UNSGNED:  IF signd_a = 0 GENERATE
    z <= std_logic_vector(fshl_stdar(unsigned(a), unsigned(s), width_z));
  END GENERATE;
SGNED:  IF signd_a /= 0 GENERATE
    z <= std_logic_vector(fshl_stdar(  signed(a), unsigned(s), width_z));
  END GENERATE;
END beh;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Sep 16 11:40:06 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_10_32_1024_1024_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_10_32_1024_1024_32_1_gen;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(19 DOWNTO 10));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(9 DOWNTO 0));
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_10_32_1024_1024_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_10_32_1024_1024_32_1_gen;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(19 DOWNTO 10));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(9 DOWNTO 0));
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_8_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_8_10_32_1024_1024_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_8_10_32_1024_1024_32_1_gen;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_8_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(19 DOWNTO 10));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(9 DOWNTO 0));
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    main_C_0_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_2_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_3_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_4_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_5_tr0 : IN STD_LOGIC;
    COMP_LOOP_5_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_6_tr0 : IN STD_LOGIC;
    COMP_LOOP_6_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_7_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_8_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_9_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_core_fsm;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_precomp_core_core_fsm_1
  TYPE inPlaceNTT_DIT_precomp_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, COMP_LOOP_C_0,
      COMP_LOOP_C_1, COMP_LOOP_1_VEC_LOOP_C_0, COMP_LOOP_1_VEC_LOOP_C_1, COMP_LOOP_1_VEC_LOOP_C_2,
      COMP_LOOP_1_VEC_LOOP_C_3, COMP_LOOP_1_VEC_LOOP_C_4, COMP_LOOP_1_VEC_LOOP_C_5,
      COMP_LOOP_1_VEC_LOOP_C_6, COMP_LOOP_1_VEC_LOOP_C_7, COMP_LOOP_1_VEC_LOOP_C_8,
      COMP_LOOP_C_2, COMP_LOOP_2_VEC_LOOP_C_0, COMP_LOOP_2_VEC_LOOP_C_1, COMP_LOOP_2_VEC_LOOP_C_2,
      COMP_LOOP_2_VEC_LOOP_C_3, COMP_LOOP_2_VEC_LOOP_C_4, COMP_LOOP_2_VEC_LOOP_C_5,
      COMP_LOOP_2_VEC_LOOP_C_6, COMP_LOOP_2_VEC_LOOP_C_7, COMP_LOOP_2_VEC_LOOP_C_8,
      COMP_LOOP_C_3, COMP_LOOP_3_VEC_LOOP_C_0, COMP_LOOP_3_VEC_LOOP_C_1, COMP_LOOP_3_VEC_LOOP_C_2,
      COMP_LOOP_3_VEC_LOOP_C_3, COMP_LOOP_3_VEC_LOOP_C_4, COMP_LOOP_3_VEC_LOOP_C_5,
      COMP_LOOP_3_VEC_LOOP_C_6, COMP_LOOP_3_VEC_LOOP_C_7, COMP_LOOP_3_VEC_LOOP_C_8,
      COMP_LOOP_C_4, COMP_LOOP_4_VEC_LOOP_C_0, COMP_LOOP_4_VEC_LOOP_C_1, COMP_LOOP_4_VEC_LOOP_C_2,
      COMP_LOOP_4_VEC_LOOP_C_3, COMP_LOOP_4_VEC_LOOP_C_4, COMP_LOOP_4_VEC_LOOP_C_5,
      COMP_LOOP_4_VEC_LOOP_C_6, COMP_LOOP_4_VEC_LOOP_C_7, COMP_LOOP_4_VEC_LOOP_C_8,
      COMP_LOOP_C_5, COMP_LOOP_5_VEC_LOOP_C_0, COMP_LOOP_5_VEC_LOOP_C_1, COMP_LOOP_5_VEC_LOOP_C_2,
      COMP_LOOP_5_VEC_LOOP_C_3, COMP_LOOP_5_VEC_LOOP_C_4, COMP_LOOP_5_VEC_LOOP_C_5,
      COMP_LOOP_5_VEC_LOOP_C_6, COMP_LOOP_5_VEC_LOOP_C_7, COMP_LOOP_5_VEC_LOOP_C_8,
      COMP_LOOP_C_6, COMP_LOOP_6_VEC_LOOP_C_0, COMP_LOOP_6_VEC_LOOP_C_1, COMP_LOOP_6_VEC_LOOP_C_2,
      COMP_LOOP_6_VEC_LOOP_C_3, COMP_LOOP_6_VEC_LOOP_C_4, COMP_LOOP_6_VEC_LOOP_C_5,
      COMP_LOOP_6_VEC_LOOP_C_6, COMP_LOOP_6_VEC_LOOP_C_7, COMP_LOOP_6_VEC_LOOP_C_8,
      COMP_LOOP_C_7, COMP_LOOP_7_VEC_LOOP_C_0, COMP_LOOP_7_VEC_LOOP_C_1, COMP_LOOP_7_VEC_LOOP_C_2,
      COMP_LOOP_7_VEC_LOOP_C_3, COMP_LOOP_7_VEC_LOOP_C_4, COMP_LOOP_7_VEC_LOOP_C_5,
      COMP_LOOP_7_VEC_LOOP_C_6, COMP_LOOP_7_VEC_LOOP_C_7, COMP_LOOP_7_VEC_LOOP_C_8,
      COMP_LOOP_C_8, COMP_LOOP_8_VEC_LOOP_C_0, COMP_LOOP_8_VEC_LOOP_C_1, COMP_LOOP_8_VEC_LOOP_C_2,
      COMP_LOOP_8_VEC_LOOP_C_3, COMP_LOOP_8_VEC_LOOP_C_4, COMP_LOOP_8_VEC_LOOP_C_5,
      COMP_LOOP_8_VEC_LOOP_C_6, COMP_LOOP_8_VEC_LOOP_C_7, COMP_LOOP_8_VEC_LOOP_C_8,
      COMP_LOOP_C_9, STAGE_LOOP_C_1, main_C_1, main_C_2);

  SIGNAL state_var : inPlaceNTT_DIT_precomp_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_precomp_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_precomp_core_core_fsm_1 : PROCESS (main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_2_tr0, COMP_LOOP_2_VEC_LOOP_C_8_tr0, COMP_LOOP_C_3_tr0, COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_4_tr0, COMP_LOOP_4_VEC_LOOP_C_8_tr0, COMP_LOOP_C_5_tr0, COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_6_tr0, COMP_LOOP_6_VEC_LOOP_C_8_tr0, COMP_LOOP_C_7_tr0, COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_8_tr0, COMP_LOOP_8_VEC_LOOP_C_8_tr0, COMP_LOOP_C_9_tr0, STAGE_LOOP_C_1_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001");
        state_var_NS <= COMP_LOOP_C_0;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
      WHEN COMP_LOOP_1_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_1;
      WHEN COMP_LOOP_1_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_2;
      WHEN COMP_LOOP_1_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_3;
      WHEN COMP_LOOP_1_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_4;
      WHEN COMP_LOOP_1_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_5;
      WHEN COMP_LOOP_1_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_6;
      WHEN COMP_LOOP_1_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_7;
      WHEN COMP_LOOP_1_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_8;
      WHEN COMP_LOOP_1_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100");
        IF ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101");
        IF ( COMP_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_2_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_1;
      WHEN COMP_LOOP_2_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_2;
      WHEN COMP_LOOP_2_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_3;
      WHEN COMP_LOOP_2_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_4;
      WHEN COMP_LOOP_2_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_5;
      WHEN COMP_LOOP_2_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_6;
      WHEN COMP_LOOP_2_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_7;
      WHEN COMP_LOOP_2_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_8;
      WHEN COMP_LOOP_2_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110");
        IF ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_3;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111");
        IF ( COMP_LOOP_C_3_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_3_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_1;
      WHEN COMP_LOOP_3_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_2;
      WHEN COMP_LOOP_3_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_3;
      WHEN COMP_LOOP_3_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_4;
      WHEN COMP_LOOP_3_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_5;
      WHEN COMP_LOOP_3_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_6;
      WHEN COMP_LOOP_3_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_7;
      WHEN COMP_LOOP_3_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_8;
      WHEN COMP_LOOP_3_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000");
        IF ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_4;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001");
        IF ( COMP_LOOP_C_4_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_4_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_1;
      WHEN COMP_LOOP_4_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_2;
      WHEN COMP_LOOP_4_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_3;
      WHEN COMP_LOOP_4_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_4;
      WHEN COMP_LOOP_4_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_5;
      WHEN COMP_LOOP_4_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_6;
      WHEN COMP_LOOP_4_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_7;
      WHEN COMP_LOOP_4_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_8;
      WHEN COMP_LOOP_4_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010");
        IF ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_5;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011");
        IF ( COMP_LOOP_C_5_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_5_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_1;
      WHEN COMP_LOOP_5_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_2;
      WHEN COMP_LOOP_5_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_3;
      WHEN COMP_LOOP_5_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_4;
      WHEN COMP_LOOP_5_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_5;
      WHEN COMP_LOOP_5_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_6;
      WHEN COMP_LOOP_5_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_7;
      WHEN COMP_LOOP_5_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_8;
      WHEN COMP_LOOP_5_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100");
        IF ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_6;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101");
        IF ( COMP_LOOP_C_6_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_6_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_1;
      WHEN COMP_LOOP_6_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_2;
      WHEN COMP_LOOP_6_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_3;
      WHEN COMP_LOOP_6_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_4;
      WHEN COMP_LOOP_6_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_5;
      WHEN COMP_LOOP_6_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_6;
      WHEN COMP_LOOP_6_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_7;
      WHEN COMP_LOOP_6_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_8;
      WHEN COMP_LOOP_6_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110");
        IF ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_7;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111");
        IF ( COMP_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_7_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_1;
      WHEN COMP_LOOP_7_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_2;
      WHEN COMP_LOOP_7_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_3;
      WHEN COMP_LOOP_7_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_4;
      WHEN COMP_LOOP_7_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_5;
      WHEN COMP_LOOP_7_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_6;
      WHEN COMP_LOOP_7_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000110");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_7;
      WHEN COMP_LOOP_7_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000111");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_8;
      WHEN COMP_LOOP_7_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001000");
        IF ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_8;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001001");
        IF ( COMP_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_8_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001010");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_1;
      WHEN COMP_LOOP_8_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001011");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_2;
      WHEN COMP_LOOP_8_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001100");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_3;
      WHEN COMP_LOOP_8_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001101");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_4;
      WHEN COMP_LOOP_8_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001110");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_5;
      WHEN COMP_LOOP_8_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001111");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_6;
      WHEN COMP_LOOP_8_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010000");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_7;
      WHEN COMP_LOOP_8_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010001");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_8;
      WHEN COMP_LOOP_8_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010010");
        IF ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010011");
        IF ( COMP_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010100");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010101");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010110");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000");
        IF ( main_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
    END CASE;
  END PROCESS inPlaceNTT_DIT_precomp_core_core_fsm_1;

  inPlaceNTT_DIT_precomp_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        IF ( complete_rsci_wen_comp = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS inPlaceNTT_DIT_precomp_core_core_fsm_1_REG;

END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    core_wten_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_staller;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_staller IS
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
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  PORT(
    core_wten : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  PORT(
    core_wten : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    r_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    r_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  r_rsc_triosy_obj_ld_core_sct <= r_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    p_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    p_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  p_rsc_triosy_obj_ld_core_sct <= p_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    vec_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  vec_rsc_triosy_obj_ld_core_sct <= vec_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC;
    complete_rsci_biwt : IN STD_LOGIC;
    complete_rsci_bdwt : IN STD_LOGIC;
    complete_rsci_bcwt : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp IS
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
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_biwt : OUT STD_LOGIC;
    complete_rsci_bdwt : OUT STD_LOGIC;
    complete_rsci_bcwt : IN STD_LOGIC;
    complete_rsci_ivld_core_sct : OUT STD_LOGIC;
    complete_rsci_irdy : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_ogwt : STD_LOGIC;

BEGIN
  complete_rsci_bdwt <= complete_rsci_oswt AND core_wen;
  complete_rsci_biwt <= complete_rsci_ogwt AND complete_rsci_irdy;
  complete_rsci_ogwt <= complete_rsci_oswt AND (NOT complete_rsci_bcwt);
  complete_rsci_ivld_core_sct <= complete_rsci_ogwt;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_biwt : IN STD_LOGIC;
    twiddle_h_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_qa_d_bfwt_31_0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  twiddle_h_rsci_qa_d_mxwt <= MUX_v_32_2_2((twiddle_h_rsci_qa_d(31 DOWNTO 0)), twiddle_h_rsci_qa_d_bfwt_31_0,
      twiddle_h_rsci_bcwt);
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_core(9 DOWNTO 0);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        twiddle_h_rsci_bcwt <= '0';
      ELSE
        twiddle_h_rsci_bcwt <= NOT((NOT(twiddle_h_rsci_bcwt OR twiddle_h_rsci_biwt))
            OR twiddle_h_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( twiddle_h_rsci_biwt = '1' ) THEN
        twiddle_h_rsci_qa_d_bfwt_31_0 <= twiddle_h_rsci_qa_d(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    twiddle_h_rsci_biwt : OUT STD_LOGIC;
    twiddle_h_rsci_bdwt : OUT STD_LOGIC;
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    IS
  -- Default Constants

  SIGNAL COMP_LOOP_twiddle_help_and_7_nl : STD_LOGIC;
BEGIN
  twiddle_h_rsci_bdwt <= twiddle_h_rsci_oswt AND core_wen;
  twiddle_h_rsci_biwt <= (NOT core_wten) AND twiddle_h_rsci_oswt;
  COMP_LOOP_twiddle_help_and_7_nl <= (twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(0))
      AND (NOT core_wten_pff) AND twiddle_h_rsci_oswt_pff;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= STD_LOGIC_VECTOR'(
      '0' & COMP_LOOP_twiddle_help_and_7_nl);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_biwt : IN STD_LOGIC;
    twiddle_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_rsci_qa_d_bfwt_31_0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  twiddle_rsci_qa_d_mxwt <= MUX_v_32_2_2((twiddle_rsci_qa_d(31 DOWNTO 0)), twiddle_rsci_qa_d_bfwt_31_0,
      twiddle_rsci_bcwt);
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_core(9 DOWNTO 0);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        twiddle_rsci_bcwt <= '0';
      ELSE
        twiddle_rsci_bcwt <= NOT((NOT(twiddle_rsci_bcwt OR twiddle_rsci_biwt)) OR
            twiddle_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( twiddle_rsci_biwt = '1' ) THEN
        twiddle_rsci_qa_d_bfwt_31_0 <= twiddle_rsci_qa_d(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    twiddle_rsci_biwt : OUT STD_LOGIC;
    twiddle_rsci_bdwt : OUT STD_LOGIC;
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    IS
  -- Default Constants

  SIGNAL COMP_LOOP_twiddle_f_and_7_nl : STD_LOGIC;
BEGIN
  twiddle_rsci_bdwt <= twiddle_rsci_oswt AND core_wen;
  twiddle_rsci_biwt <= (NOT core_wten) AND twiddle_rsci_oswt;
  COMP_LOOP_twiddle_f_and_7_nl <= (twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(0))
      AND (NOT core_wten_pff) AND twiddle_rsci_oswt_pff;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= STD_LOGIC_VECTOR'( '0'
      & COMP_LOOP_twiddle_f_and_7_nl);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_wait_dp IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_wait_dp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_da_d_core : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_biwt : IN STD_LOGIC;
    vec_rsci_bdwt : IN STD_LOGIC;
    vec_rsci_biwt_1 : IN STD_LOGIC;
    vec_rsci_bdwt_2 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsci_bcwt : STD_LOGIC;
  SIGNAL vec_rsci_bcwt_1 : STD_LOGIC;
  SIGNAL vec_rsci_qa_d_bfwt_63_32 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_qa_d_bfwt_31_0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL VEC_LOOP_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
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
  VEC_LOOP_mux_2_nl <= MUX_v_32_2_2((vec_rsci_qa_d(63 DOWNTO 32)), vec_rsci_qa_d_bfwt_63_32,
      vec_rsci_bcwt_1);
  VEC_LOOP_mux_3_nl <= MUX_v_32_2_2((vec_rsci_qa_d(31 DOWNTO 0)), vec_rsci_qa_d_bfwt_31_0,
      vec_rsci_bcwt);
  vec_rsci_qa_d_mxwt <= VEC_LOOP_mux_2_nl & VEC_LOOP_mux_3_nl;
  vec_rsci_da_d <= vec_rsci_da_d_core(31 DOWNTO 0);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        vec_rsci_bcwt <= '0';
        vec_rsci_bcwt_1 <= '0';
      ELSE
        vec_rsci_bcwt <= NOT((NOT(vec_rsci_bcwt OR vec_rsci_biwt)) OR vec_rsci_bdwt);
        vec_rsci_bcwt_1 <= NOT((NOT(vec_rsci_bcwt_1 OR vec_rsci_biwt_1)) OR vec_rsci_bdwt_2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( vec_rsci_biwt_1 = '1' ) THEN
        vec_rsci_qa_d_bfwt_63_32 <= vec_rsci_qa_d(63 DOWNTO 32);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( vec_rsci_biwt = '1' ) THEN
        vec_rsci_qa_d_bfwt_31_0 <= vec_rsci_qa_d(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    vec_rsci_oswt : IN STD_LOGIC;
    vec_rsci_oswt_1 : IN STD_LOGIC;
    vec_rsci_wea_d_core_psct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
        DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
        DOWNTO 0);
    vec_rsci_biwt : OUT STD_LOGIC;
    vec_rsci_bdwt : OUT STD_LOGIC;
    vec_rsci_biwt_1 : OUT STD_LOGIC;
    vec_rsci_bdwt_2 : OUT STD_LOGIC;
    vec_rsci_wea_d_core_sct : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    vec_rsci_oswt_pff : IN STD_LOGIC;
    vec_rsci_oswt_1_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsci_dswt_pff : STD_LOGIC;

  SIGNAL VEC_LOOP_and_8_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_12_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_10_nl : STD_LOGIC;
BEGIN
  vec_rsci_bdwt <= vec_rsci_oswt AND core_wen;
  vec_rsci_biwt <= (NOT core_wten) AND vec_rsci_oswt;
  vec_rsci_bdwt_2 <= vec_rsci_oswt_1 AND core_wen;
  vec_rsci_biwt_1 <= (NOT core_wten) AND vec_rsci_oswt_1;
  VEC_LOOP_and_8_nl <= (vec_rsci_wea_d_core_psct(0)) AND vec_rsci_dswt_pff;
  vec_rsci_wea_d_core_sct <= STD_LOGIC_VECTOR'( '0' & VEC_LOOP_and_8_nl);
  vec_rsci_dswt_pff <= (NOT core_wten_pff) AND vec_rsci_oswt_pff;
  VEC_LOOP_and_12_nl <= (NOT core_wten_pff) AND vec_rsci_oswt_1_pff;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      AND STD_LOGIC_VECTOR'( VEC_LOOP_and_12_nl & vec_rsci_dswt_pff);
  VEC_LOOP_and_10_nl <= (vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(0))
      AND vec_rsci_dswt_pff;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct <= STD_LOGIC_VECTOR'( '0' &
      VEC_LOOP_and_10_nl);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC;
    run_rsci_ivld : IN STD_LOGIC;
    run_rsci_biwt : IN STD_LOGIC;
    run_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp IS
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
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_biwt : OUT STD_LOGIC;
    run_rsci_bdwt : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj IS
  PORT(
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  twiddle_h_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => twiddle_h_rsc_triosy_obj_ld_core_sct,
      lz => twiddle_h_rsc_triosy_lz
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      : inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      twiddle_h_rsc_triosy_obj_iswt0 => twiddle_h_rsc_triosy_obj_iswt0,
      twiddle_h_rsc_triosy_obj_ld_core_sct => twiddle_h_rsc_triosy_obj_ld_core_sct
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj IS
  PORT(
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  twiddle_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => twiddle_rsc_triosy_obj_ld_core_sct,
      lz => twiddle_rsc_triosy_lz
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      : inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      twiddle_rsc_triosy_obj_iswt0 => twiddle_rsc_triosy_obj_iswt0,
      twiddle_rsc_triosy_obj_ld_core_sct => twiddle_rsc_triosy_obj_ld_core_sct
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj IS
  PORT(
    r_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    r_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL r_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      r_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      r_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => r_rsc_triosy_obj_ld_core_sct,
      lz => r_rsc_triosy_lz
    );
  inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      r_rsc_triosy_obj_iswt0 => r_rsc_triosy_obj_iswt0,
      r_rsc_triosy_obj_ld_core_sct => r_rsc_triosy_obj_ld_core_sct
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj IS
  PORT(
    p_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    p_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      p_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      p_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => p_rsc_triosy_obj_ld_core_sct,
      lz => p_rsc_triosy_lz
    );
  inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      p_rsc_triosy_obj_iswt0 => p_rsc_triosy_obj_iswt0,
      p_rsc_triosy_obj_ld_core_sct => p_rsc_triosy_obj_ld_core_sct
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj IS
  PORT(
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      vec_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  vec_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => vec_rsc_triosy_obj_ld_core_sct,
      lz => vec_rsc_triosy_lz
    );
  inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl_inst :
      inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      vec_rsc_triosy_obj_iswt0 => vec_rsc_triosy_obj_iswt0,
      vec_rsc_triosy_obj_ld_core_sct => vec_rsc_triosy_obj_ld_core_sct
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_complete_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_complete_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_complete_rsci;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_complete_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_biwt : STD_LOGIC;
  SIGNAL complete_rsci_bdwt : STD_LOGIC;
  SIGNAL complete_rsci_bcwt : STD_LOGIC;
  SIGNAL complete_rsci_ivld_core_sct : STD_LOGIC;
  SIGNAL complete_rsci_irdy : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl
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
  COMPONENT inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp
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
      rscid => 13
      )
    PORT MAP(
      vld => complete_rsc_vld,
      rdy => complete_rsc_rdy,
      ivld => complete_rsci_ivld_core_sct,
      irdy => complete_rsci_irdy
    );
  inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt,
      complete_rsci_ivld_core_sct => complete_rsci_ivld_core_sct,
      complete_rsci_irdy => complete_rsci_irdy
    );
  inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp_inst : inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_mxwt_pconst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      twiddle_h_rsci_biwt : OUT STD_LOGIC;
      twiddle_h_rsci_bdwt : OUT STD_LOGIC;
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_biwt : IN STD_LOGIC;
      twiddle_h_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d
      : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core
      : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      twiddle_h_rsci_oswt => twiddle_h_rsci_oswt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff => core_wten_pff,
      twiddle_h_rsci_oswt_pff => twiddle_h_rsci_oswt_pff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(0)));
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;

  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_adra_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d,
      twiddle_h_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_adra_d_core => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core,
      twiddle_h_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt
    );
  twiddle_h_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      <= twiddle_h_rsci_qa_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core
      <= STD_LOGIC_VECTOR'( "0000000000") & (twiddle_h_rsci_adra_d_core(9 DOWNTO
      0));
  twiddle_h_rsci_qa_d_mxwt_pconst <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt;

  twiddle_h_rsci_qa_d_mxwt <= twiddle_h_rsci_qa_d_mxwt_pconst;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_reg;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_mxwt_pconst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      twiddle_rsci_biwt : OUT STD_LOGIC;
      twiddle_rsci_bdwt : OUT STD_LOGIC;
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_biwt : IN STD_LOGIC;
      twiddle_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d
      : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core
      : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      twiddle_rsci_oswt => twiddle_rsci_oswt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff => core_wten_pff,
      twiddle_rsci_oswt_pff => twiddle_rsci_oswt_pff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(0)));
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;

  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_adra_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d,
      twiddle_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d,
      twiddle_rsci_adra_d_core => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core,
      twiddle_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt
    );
  twiddle_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      <= twiddle_rsci_qa_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core
      <= STD_LOGIC_VECTOR'( "0000000000") & (twiddle_rsci_adra_d_core(9 DOWNTO 0));
  twiddle_rsci_qa_d_mxwt_pconst <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt;

  twiddle_rsci_qa_d_mxwt <= twiddle_rsci_qa_d_mxwt_pconst;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_reg;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_vec_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    vec_rsci_oswt : IN STD_LOGIC;
    vec_rsci_oswt_1 : IN STD_LOGIC;
    vec_rsci_da_d_core : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_wea_d_core_psct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
        DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
        DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    vec_rsci_oswt_pff : IN STD_LOGIC;
    vec_rsci_oswt_1_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_vec_rsci_1;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsci_biwt : STD_LOGIC;
  SIGNAL vec_rsci_bdwt : STD_LOGIC;
  SIGNAL vec_rsci_biwt_1 : STD_LOGIC;
  SIGNAL vec_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL vec_rsci_wea_d_core_sct : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL vec_rsci_da_d_reg : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      vec_rsci_oswt : IN STD_LOGIC;
      vec_rsci_oswt_1 : IN STD_LOGIC;
      vec_rsci_wea_d_core_psct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
          DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
          DOWNTO 0);
      vec_rsci_biwt : OUT STD_LOGIC;
      vec_rsci_bdwt : OUT STD_LOGIC;
      vec_rsci_biwt_1 : OUT STD_LOGIC;
      vec_rsci_bdwt_2 : OUT STD_LOGIC;
      vec_rsci_wea_d_core_sct : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      vec_rsci_oswt_pff : IN STD_LOGIC;
      vec_rsci_oswt_1_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_da_d_core : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_biwt : IN STD_LOGIC;
      vec_rsci_bdwt : IN STD_LOGIC;
      vec_rsci_biwt_1 : IN STD_LOGIC;
      vec_rsci_bdwt_2 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d_core
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      vec_rsci_oswt => vec_rsci_oswt,
      vec_rsci_oswt_1 => vec_rsci_oswt_1,
      vec_rsci_wea_d_core_psct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_psct,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      vec_rsci_biwt => vec_rsci_biwt,
      vec_rsci_bdwt => vec_rsci_bdwt,
      vec_rsci_biwt_1 => vec_rsci_biwt_1,
      vec_rsci_bdwt_2 => vec_rsci_bdwt_2,
      vec_rsci_wea_d_core_sct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_sct,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct,
      core_wten_pff => core_wten_pff,
      vec_rsci_oswt_pff => vec_rsci_oswt_pff,
      vec_rsci_oswt_1_pff => vec_rsci_oswt_1_pff
    );
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (vec_rsci_wea_d_core_psct(0)));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(0)));
  vec_rsci_wea_d_core_sct <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_sct;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;

  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsci_da_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d,
      vec_rsci_qa_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_qa_d,
      vec_rsci_da_d_core => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d_core,
      vec_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_qa_d_mxwt,
      vec_rsci_biwt => vec_rsci_biwt,
      vec_rsci_bdwt => vec_rsci_bdwt,
      vec_rsci_biwt_1 => vec_rsci_biwt_1,
      vec_rsci_bdwt_2 => vec_rsci_bdwt_2
    );
  vec_rsci_da_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d_core
      <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000") & (vec_rsci_da_d_core(31
      DOWNTO 0));
  vec_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_qa_d_mxwt;

  vec_rsci_wea_d <= vec_rsci_wea_d_core_sct;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  vec_rsci_da_d <= vec_rsci_da_d_reg;
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core_run_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core_run_rsci IS
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
END inPlaceNTT_DIT_precomp_core_run_rsci;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core_run_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_rsci_ivld : STD_LOGIC;
  SIGNAL run_rsci_biwt : STD_LOGIC;
  SIGNAL run_rsci_bdwt : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_biwt : OUT STD_LOGIC;
      run_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp
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
      rscid => 7
      )
    PORT MAP(
      vld => run_rsc_vld,
      rdy => run_rsc_rdy,
      ivld => run_rsci_ivld,
      irdy => run_rsci_biwt
    );
  inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      run_rsci_oswt => run_rsci_oswt,
      core_wten => core_wten,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
  inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp_inst : inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt,
      run_rsci_ivld => run_rsci_ivld,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0)
  );
END inPlaceNTT_DIT_precomp_core;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL run_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL vec_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL complete_rsci_wen_comp : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modulo_add_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL or_tmp_24 : STD_LOGIC;
  SIGNAL nor_tmp_1 : STD_LOGIC;
  SIGNAL nor_tmp_14 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL or_dcpl_30 : STD_LOGIC;
  SIGNAL or_tmp_67 : STD_LOGIC;
  SIGNAL or_tmp_69 : STD_LOGIC;
  SIGNAL or_tmp_70 : STD_LOGIC;
  SIGNAL or_tmp_71 : STD_LOGIC;
  SIGNAL or_tmp_75 : STD_LOGIC;
  SIGNAL or_tmp_76 : STD_LOGIC;
  SIGNAL mux_tmp_75 : STD_LOGIC;
  SIGNAL or_tmp_77 : STD_LOGIC;
  SIGNAL or_tmp_79 : STD_LOGIC;
  SIGNAL mux_tmp_76 : STD_LOGIC;
  SIGNAL mux_tmp_77 : STD_LOGIC;
  SIGNAL or_tmp_80 : STD_LOGIC;
  SIGNAL mux_tmp_78 : STD_LOGIC;
  SIGNAL mux_tmp_79 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_16 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL mux_tmp_81 : STD_LOGIC;
  SIGNAL mux_tmp_82 : STD_LOGIC;
  SIGNAL mux_tmp_83 : STD_LOGIC;
  SIGNAL mux_tmp_85 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL or_tmp_86 : STD_LOGIC;
  SIGNAL mux_tmp_89 : STD_LOGIC;
  SIGNAL or_tmp_89 : STD_LOGIC;
  SIGNAL or_tmp_90 : STD_LOGIC;
  SIGNAL nand_tmp : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL or_tmp_101 : STD_LOGIC;
  SIGNAL mux_tmp_102 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_114 : STD_LOGIC;
  SIGNAL mux_tmp_115 : STD_LOGIC;
  SIGNAL mux_tmp_121 : STD_LOGIC;
  SIGNAL or_dcpl_42 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL or_dcpl_47 : STD_LOGIC;
  SIGNAL or_tmp_131 : STD_LOGIC;
  SIGNAL mux_tmp_155 : STD_LOGIC;
  SIGNAL or_dcpl_51 : STD_LOGIC;
  SIGNAL or_dcpl_58 : STD_LOGIC;
  SIGNAL or_dcpl_61 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_j_2_10_0_sva_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_92_cse : STD_LOGIC;
  SIGNAL or_90_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_and_2_cse : STD_LOGIC;
  SIGNAL or_231_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_nor_1_cse : STD_LOGIC;
  SIGNAL or_139_cse : STD_LOGIC;
  SIGNAL or_8_cse : STD_LOGIC;
  SIGNAL vec_rsci_da_d_reg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_reg : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_adra_d_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_20_rmff : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_13_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_25_rmff : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL nor_62_rmff : STD_LOGIC;
  SIGNAL twiddle_h_rsci_adra_d_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL and_99_rmff : STD_LOGIC;
  SIGNAL factor1_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_1_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_2_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_3_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_4_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_5_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_6_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_7_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_lpi_4_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_11_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_j_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_74_itm : STD_LOGIC;
  SIGNAL mux_111_itm : STD_LOGIC;
  SIGNAL mux_86_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL mux_tmp_176 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL and_dcpl_282 : STD_LOGIC;
  SIGNAL and_dcpl_286 : STD_LOGIC;
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_292 : STD_LOGIC;
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL z_out_12 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl_308 : STD_LOGIC;
  SIGNAL and_dcpl_311 : STD_LOGIC;
  SIGNAL and_dcpl_315 : STD_LOGIC;
  SIGNAL and_dcpl_320 : STD_LOGIC;
  SIGNAL and_dcpl_325 : STD_LOGIC;
  SIGNAL z_out_13 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL z_out_14 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_dcpl_349 : STD_LOGIC;
  SIGNAL and_dcpl_351 : STD_LOGIC;
  SIGNAL and_dcpl_360 : STD_LOGIC;
  SIGNAL and_dcpl_366 : STD_LOGIC;
  SIGNAL and_dcpl_376 : STD_LOGIC;
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_384 : STD_LOGIC;
  SIGNAL and_dcpl_393 : STD_LOGIC;
  SIGNAL and_dcpl_398 : STD_LOGIC;
  SIGNAL and_dcpl_403 : STD_LOGIC;
  SIGNAL and_dcpl_406 : STD_LOGIC;
  SIGNAL and_dcpl_410 : STD_LOGIC;
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_416 : STD_LOGIC;
  SIGNAL and_dcpl_421 : STD_LOGIC;
  SIGNAL and_dcpl_429 : STD_LOGIC;
  SIGNAL and_dcpl_437 : STD_LOGIC;
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_489 : STD_LOGIC;
  SIGNAL and_dcpl_494 : STD_LOGIC;
  SIGNAL and_dcpl_499 : STD_LOGIC;
  SIGNAL and_dcpl_500 : STD_LOGIC;
  SIGNAL and_dcpl_503 : STD_LOGIC;
  SIGNAL and_dcpl_505 : STD_LOGIC;
  SIGNAL and_dcpl_506 : STD_LOGIC;
  SIGNAL and_dcpl_507 : STD_LOGIC;
  SIGNAL and_dcpl_510 : STD_LOGIC;
  SIGNAL z_out_22 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_j_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_2_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_3_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_4_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_5_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_6_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_7_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_8_mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_k_10_3_sva_6_0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_1_sva_mx0c0 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c1
      : STD_LOGIC;
  SIGNAL COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c2
      : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_2_sva_mx0c0 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_2_sva_mx0c2 : STD_LOGIC;
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_or_32_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_7_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_4_cse : STD_LOGIC;
  SIGNAL reg_mult_res_1_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_res_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_res_5_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_res_7_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_3_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_11_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_13_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_19_cse : STD_LOGIC;
  SIGNAL and_184_cse : STD_LOGIC;
  SIGNAL and_190_cse : STD_LOGIC;
  SIGNAL and_201_cse : STD_LOGIC;
  SIGNAL and_206_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_cse : STD_LOGIC;
  SIGNAL and_203_cse : STD_LOGIC;
  SIGNAL and_209_cse : STD_LOGIC;
  SIGNAL and_400_cse : STD_LOGIC;
  SIGNAL and_403_cse : STD_LOGIC;
  SIGNAL and_407_cse : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_28_rgt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_itm_7_4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_itm_3_0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL or_69_cse : STD_LOGIC;
  SIGNAL and_550_cse : STD_LOGIC;
  SIGNAL mux_177_itm : STD_LOGIC;
  SIGNAL and_188_itm : STD_LOGIC;
  SIGNAL and_193_itm : STD_LOGIC;
  SIGNAL and_196_itm : STD_LOGIC;
  SIGNAL and_204_itm : STD_LOGIC;
  SIGNAL and_207_itm : STD_LOGIC;
  SIGNAL and_210_itm : STD_LOGIC;
  SIGNAL and_211_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_35_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_27_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_37_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_8_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_1_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;
  SIGNAL z_out_15_22_10 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL z_out_19_32 : STD_LOGIC;
  SIGNAL z_out_20_32 : STD_LOGIC;
  SIGNAL z_out_21_32 : STD_LOGIC;
  SIGNAL and_553_cse : STD_LOGIC;

  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL mux_71_nl : STD_LOGIC;
  SIGNAL or_108_nl : STD_LOGIC;
  SIGNAL mux_70_nl : STD_LOGIC;
  SIGNAL or_107_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL or_106_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL mux_66_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL or_129_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL or_127_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_twiddle_f_mul_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_75_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_not_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL or_147_nl : STD_LOGIC;
  SIGNAL or_151_nl : STD_LOGIC;
  SIGNAL and_109_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL nor_131_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL or_249_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL nor_127_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL nor_128_nl : STD_LOGIC;
  SIGNAL nor_129_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_res_mux_12_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_552_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_126_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_2_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_not_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL nor_30_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL nor_31_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL and_125_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_res_mux_13_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_554_nl : STD_LOGIC;
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_res_mux_14_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_556_nl : STD_LOGIC;
  SIGNAL acc_6_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_res_mux_15_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_558_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL nor_87_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL nor_38_nl : STD_LOGIC;
  SIGNAL nor_35_nl : STD_LOGIC;
  SIGNAL mux_93_nl : STD_LOGIC;
  SIGNAL or_125_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_6_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_4_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_2_nl : STD_LOGIC;
  SIGNAL and_59_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_26_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_3_nl : STD_LOGIC;
  SIGNAL nor_64_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL or_122_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_5_nl : STD_LOGIC;
  SIGNAL nor_63_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL or_238_nl : STD_LOGIC;
  SIGNAL mult_t_mux1h_1_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_551_nl : STD_LOGIC;
  SIGNAL nor_132_nl : STD_LOGIC;
  SIGNAL nor_133_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL acc_5_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mult_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_if_or_6_nl : STD_LOGIC;
  SIGNAL acc_7_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mux1h_10_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_8_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_35_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_39_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_10_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_40_nl : STD_LOGIC;
  SIGNAL acc_9_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_mux_11_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_or_41_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_12_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL acc_10_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_13_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_or_42_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_14_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_mux_3_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL acc_12_nl : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_5_nl : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL VEC_LOOP_or_43_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_mux_15_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_6_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_mux_16_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_or_44_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_36_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL VEC_LOOP_or_45_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_37_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL acc_15_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_38_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_or_46_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_39_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_or_47_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL VEC_LOOP_and_15_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_40_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL not_571_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL acc_16_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_if_mult_if_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_559_nl : STD_LOGIC;
  SIGNAL acc_17_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_if_mux1h_11_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_560_nl : STD_LOGIC;
  SIGNAL acc_18_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_if_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_561_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_68_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_69_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_1_nl : STD_LOGIC;
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT modulo_sub
    PORT (
      base_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1 : STD_LOGIC_VECTOR (31 DOWNTO
      0);

  COMPONENT modulo_add
    PORT (
      base_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL COMP_LOOP_1_modulo_add_cmp_base_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_add_cmp_m_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1 : STD_LOGIC_VECTOR (31 DOWNTO
      0);

  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (8 DOWNTO 0);

  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (10 DOWNTO 0);

  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_run_rsci
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
  COMPONENT inPlaceNTT_DIT_precomp_core_vec_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      vec_rsci_oswt : IN STD_LOGIC;
      vec_rsci_oswt_1 : IN STD_LOGIC;
      vec_rsci_da_d_core : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_wea_d_core_psct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
          DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct : IN STD_LOGIC_VECTOR (1
          DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      vec_rsci_oswt_pff : IN STD_LOGIC;
      vec_rsci_oswt_1_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_wait_dp
    PORT(
      ensig_cgo_iro : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core
      : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d
      : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d :
      STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core
      : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_complete_rsci
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
  COMPONENT inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj
    PORT(
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj
    PORT(
      p_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      p_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj
    PORT(
      r_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      r_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj
    PORT(
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj
    PORT(
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      core_wten_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIT_precomp_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      main_C_0_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_2_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_3_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_4_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_5_tr0 : IN STD_LOGIC;
      COMP_LOOP_5_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_6_tr0 : IN STD_LOGIC;
      COMP_LOOP_6_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_7_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_8_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_9_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_s_1_3_2(input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_4_2(input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_5_2(input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_6_2(input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
      tmp := sel(5);
      result := result or ( input_5 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_7_2(input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
      tmp := sel(5);
      result := result or ( input_5 and tmp);
      tmp := sel(6);
      result := result or ( input_6 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_10_3_2(input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_10_4_2(input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_4_2(input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_3_2(input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_4_2(input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_8_2(input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_3_7_2(input_6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_6_3_2(input_2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(5 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_3_2(input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_4_2(input_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_8_2(input_7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_8_3_2(input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_8_4_2(input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_9_5_2(input_4 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(8 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
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

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_22_2_2(input_0 : STD_LOGIC_VECTOR(21 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(21 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(21 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
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

  FUNCTION MUX_v_9_2_2(input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION minimum(arg1,arg2:INTEGER) RETURN INTEGER IS
  BEGIN
    IF(arg1<arg2)THEN
      RETURN arg1;
    ELSE
      RETURN arg2;
    END IF;
  END;

  FUNCTION maximum(arg1,arg2:INTEGER) RETURN INTEGER IS
  BEGIN
    IF(arg1>arg2)THEN
      RETURN arg1;
    ELSE
      RETURN arg2;
    END IF;
  END;

  FUNCTION READSLICE_32_33(input_val:STD_LOGIC_VECTOR(32 DOWNTO 0);index:INTEGER)
  RETURN STD_LOGIC_VECTOR IS
    CONSTANT min_sat_index:INTEGER:= maximum( index, 0 );
    CONSTANT sat_index:INTEGER:= minimum( min_sat_index, 1);
  BEGIN
    RETURN input_val(sat_index+31 DOWNTO sat_index);
  END;

BEGIN
  p_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 9,
      width => 32
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

  COMP_LOOP_1_modulo_sub_cmp : modulo_sub
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => and_99_rmff,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat <= READSLICE_32_33(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(factor1_1_sva
      & '1') + UNSIGNED((MUX1HOT_v_32_8_2((NOT mult_res_1_lpi_4_dfm_mx0), (NOT mult_res_2_lpi_4_dfm_mx0),
      (NOT mult_res_3_lpi_4_dfm_mx0), (NOT mult_res_4_lpi_4_dfm_mx0), (NOT mult_res_5_lpi_4_dfm_mx0),
      (NOT mult_res_6_lpi_4_dfm_mx0), (NOT mult_res_7_lpi_4_dfm_mx0), (NOT mult_res_lpi_4_dfm_mx0),
      STD_LOGIC_VECTOR'( and_188_itm & and_193_itm & and_196_itm & and_553_cse &
      and_204_itm & and_207_itm & and_210_itm & and_211_itm))) & '1'), 33)), 1);
  COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_sub_cmp_return_rsc_z <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1;

  COMP_LOOP_1_modulo_add_cmp : modulo_add
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_add_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => and_99_rmff,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_add_cmp_base_rsc_dat <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(factor1_1_sva)
      + UNSIGNED(MUX1HOT_v_32_8_2(mult_res_1_lpi_4_dfm_mx0, mult_res_2_lpi_4_dfm_mx0,
      mult_res_3_lpi_4_dfm_mx0, mult_res_4_lpi_4_dfm_mx0, mult_res_5_lpi_4_dfm_mx0,
      mult_res_6_lpi_4_dfm_mx0, mult_res_7_lpi_4_dfm_mx0, mult_res_lpi_4_dfm_mx0,
      STD_LOGIC_VECTOR'( and_188_itm & and_193_itm & and_196_itm & and_553_cse &
      and_204_itm & and_207_itm & and_210_itm & and_211_itm))), 32));
  COMP_LOOP_1_modulo_add_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_add_cmp_return_rsc_z <= COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1;

  COMP_LOOP_3_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 9
      )
    PORT MAP(
      a => COMP_LOOP_3_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_3_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_3_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_3_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_3_twiddle_f_lshift_rg_s <= COMP_LOOP_5_twiddle_f_lshift_itm_3_0;
  COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 <= COMP_LOOP_3_twiddle_f_lshift_rg_z;

  COMP_LOOP_1_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 11
      )
    PORT MAP(
      a => COMP_LOOP_1_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_1_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_1_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_1_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(z_out_14, STAGE_LOOP_i_3_0_sva,
      CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("0000001")));
  z_out <= COMP_LOOP_1_twiddle_f_lshift_rg_z;

  COMP_LOOP_2_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => COMP_LOOP_2_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_2_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_2_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_2_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_2_twiddle_f_lshift_rg_s <= COMP_LOOP_5_twiddle_f_lshift_itm_3_0;
  z_out_1 <= COMP_LOOP_2_twiddle_f_lshift_rg_z;

  inPlaceNTT_DIT_precomp_core_run_rsci_inst : inPlaceNTT_DIT_precomp_core_run_rsci
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
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst : inPlaceNTT_DIT_precomp_core_vec_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsci_da_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d,
      vec_rsci_qa_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d,
      vec_rsci_wea_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      vec_rsci_oswt => reg_vec_rsci_oswt_cse,
      vec_rsci_oswt_1 => reg_vec_rsci_oswt_1_cse,
      vec_rsci_da_d_core => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core,
      vec_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt,
      vec_rsci_wea_d_core_psct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      core_wten_pff => core_wten_iff,
      vec_rsci_oswt_pff => inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff,
      vec_rsci_oswt_1_pff => VEC_LOOP_nor_1_cse
    );
  vec_rsci_da_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_wea_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core <= STD_LOGIC_VECTOR'(
      "00000000000000000000000000000000") & (MUX_v_32_2_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm, and_dcpl_25));
  vec_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct <= STD_LOGIC_VECTOR'(
      '0' & (NOT mux_86_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( VEC_LOOP_nor_1_cse & VEC_LOOP_nor_1_cse);
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (NOT mux_86_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff <= NOT mux_74_itm;

  inPlaceNTT_DIT_precomp_core_wait_dp_inst : inPlaceNTT_DIT_precomp_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro,
      core_wen => complete_rsci_wen_comp,
      ensig_cgo => reg_ensig_cgo_cse,
      COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro <= NOT mux_111_itm;

  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_adra_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d,
      twiddle_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      twiddle_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_rsci_adra_d_core => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core,
      twiddle_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff => core_wten_iff,
      twiddle_rsci_oswt_pff => nor_62_rmff
    );
  twiddle_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core <= STD_LOGIC_VECTOR'(
      "0000000000") & COMP_LOOP_twiddle_f_mux1h_20_rmff & COMP_LOOP_twiddle_f_and_rmff
      & COMP_LOOP_twiddle_f_mux1h_13_rmff & COMP_LOOP_twiddle_f_mux1h_25_rmff;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & nor_62_rmff);

  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_adra_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d,
      twiddle_h_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      twiddle_h_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_h_rsci_adra_d_core => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core,
      twiddle_h_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff => core_wten_iff,
      twiddle_h_rsci_oswt_pff => nor_62_rmff
    );
  twiddle_h_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core <=
      STD_LOGIC_VECTOR'( "0000000000") & COMP_LOOP_twiddle_f_mux1h_20_rmff & COMP_LOOP_twiddle_f_and_rmff
      & COMP_LOOP_twiddle_f_mux1h_13_rmff & COMP_LOOP_twiddle_f_mux1h_25_rmff;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & nor_62_rmff);

  inPlaceNTT_DIT_precomp_core_complete_rsci_inst : inPlaceNTT_DIT_precomp_core_complete_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      core_wen => complete_rsci_wen_comp,
      complete_rsci_oswt => reg_complete_rsci_oswt_cse,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_inst : inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj
    PORT MAP(
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      core_wten => core_wten,
      vec_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_inst : inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj
    PORT MAP(
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      core_wten => core_wten,
      p_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_inst : inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj
    PORT MAP(
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      core_wten => core_wten,
      r_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj
    PORT MAP(
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      core_wten => core_wten,
      twiddle_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj
    PORT MAP(
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      core_wten => core_wten,
      twiddle_h_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIT_precomp_core_staller_inst : inPlaceNTT_DIT_precomp_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wten => core_wten,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      core_wten_pff => core_wten_iff
    );
  inPlaceNTT_DIT_precomp_core_core_fsm_inst : inPlaceNTT_DIT_precomp_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      fsm_output => inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output,
      main_C_0_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0,
      COMP_LOOP_1_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_2_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0,
      COMP_LOOP_2_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_3_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0,
      COMP_LOOP_3_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_4_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0,
      COMP_LOOP_4_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_5_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0,
      COMP_LOOP_5_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_6_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0,
      COMP_LOOP_6_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_7_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0,
      COMP_LOOP_7_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0,
      COMP_LOOP_8_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_9_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 <= NOT (z_out_13(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 <= NOT (z_out_13(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 <= NOT (z_out_12(8));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 <= NOT (z_out_13(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 <= NOT (z_out_13(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 <= NOT (z_out_13(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 <= NOT (z_out_18(7));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_2_10_0_sva_1(10);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 <= NOT (z_out_15_22_10(0));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= STAGE_LOOP_acc_itm_4_1;

  or_108_nl <= (fsm_output(0)) OR (NOT (fsm_output(6))) OR (fsm_output(5));
  mux_71_nl <= MUX_s_1_2_2(or_108_nl, or_tmp_69, fsm_output(1));
  or_107_nl <= ((fsm_output(0)) AND (fsm_output(6))) OR (fsm_output(5));
  mux_70_nl <= MUX_s_1_2_2(or_tmp_67, or_107_nl, fsm_output(1));
  mux_72_nl <= MUX_s_1_2_2(mux_71_nl, mux_70_nl, fsm_output(3));
  mux_68_nl <= MUX_s_1_2_2(or_tmp_71, or_tmp_67, fsm_output(1));
  or_106_nl <= (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(6)) OR (fsm_output(5));
  mux_69_nl <= MUX_s_1_2_2(mux_68_nl, or_106_nl, fsm_output(3));
  mux_73_nl <= MUX_s_1_2_2(mux_72_nl, mux_69_nl, fsm_output(4));
  mux_65_nl <= MUX_s_1_2_2(or_tmp_70, or_tmp_71, fsm_output(1));
  mux_64_nl <= MUX_s_1_2_2(or_tmp_69, or_tmp_70, fsm_output(1));
  mux_66_nl <= MUX_s_1_2_2(mux_65_nl, mux_64_nl, fsm_output(3));
  mux_62_nl <= MUX_s_1_2_2(or_231_cse, or_tmp_69, fsm_output(1));
  mux_61_nl <= MUX_s_1_2_2(or_tmp_67, or_231_cse, fsm_output(1));
  mux_63_nl <= MUX_s_1_2_2(mux_62_nl, mux_61_nl, fsm_output(3));
  mux_67_nl <= MUX_s_1_2_2(mux_66_nl, mux_63_nl, fsm_output(4));
  mux_74_itm <= MUX_s_1_2_2(mux_73_nl, mux_67_nl, fsm_output(2));
  nand_5_nl <= NOT((VEC_LOOP_j_2_10_0_sva_1(10)) AND (fsm_output(6)));
  or_129_nl <= COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm OR (fsm_output(6));
  mux_96_nl <= MUX_s_1_2_2(nand_5_nl, or_129_nl, fsm_output(2));
  or_130_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR mux_96_nl;
  mux_97_nl <= MUX_s_1_2_2(nand_tmp, or_130_nl, fsm_output(3));
  mux_94_nl <= MUX_s_1_2_2(or_dcpl_30, or_tmp_90, fsm_output(4));
  or_127_nl <= (fsm_output(5)) OR mux_94_nl;
  mux_95_nl <= MUX_s_1_2_2(or_127_nl, nand_tmp, fsm_output(3));
  mux_98_nl <= MUX_s_1_2_2(mux_97_nl, mux_95_nl, fsm_output(1));
  nor_62_rmff <= NOT(mux_98_nl OR (fsm_output(0)));
  COMP_LOOP_twiddle_f_or_7_cse <= (and_dcpl_31 AND and_dcpl_16 AND and_dcpl_39) OR
      (and_dcpl_47 AND and_dcpl_21);
  COMP_LOOP_twiddle_f_or_4_cse <= and_dcpl_61 OR (and_dcpl_41 AND and_dcpl_15) OR
      (and_dcpl_47 AND and_dcpl_15) OR (and_dcpl_50 AND and_dcpl_30);
  COMP_LOOP_twiddle_f_mux1h_6_nl <= MUX1HOT_s_1_3_2((z_out_22(2)), (z_out_22(1)),
      (z_out_22(0)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_4_cse & COMP_LOOP_twiddle_f_or_7_cse
      & and_dcpl_65));
  COMP_LOOP_twiddle_f_and_rmff <= COMP_LOOP_twiddle_f_mux1h_6_nl AND (NOT(mux_tmp_100
      OR (fsm_output(0))));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl <= MUX_s_1_2_2((z_out_22(1)), (z_out_22(0)),
      COMP_LOOP_twiddle_f_or_7_cse);
  COMP_LOOP_twiddle_f_mux1h_13_rmff <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl
      AND (NOT(and_dcpl_53 AND xor_dcpl AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("010"))));
  COMP_LOOP_1_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(z_out(6
      DOWNTO 0)) * UNSIGNED(COMP_LOOP_k_10_3_sva_6_0)), 7));
  and_75_nl <= and_dcpl_23 AND and_dcpl_39;
  COMP_LOOP_twiddle_f_mux1h_20_rmff <= MUX1HOT_v_7_4_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_1_twiddle_f_mul_nl),
      7)), (z_out_22(9 DOWNTO 3)), (z_out_22(8 DOWNTO 2)), (z_out_22(7 DOWNTO 1)),
      STD_LOGIC_VECTOR'( and_75_nl & COMP_LOOP_twiddle_f_or_4_cse & COMP_LOOP_twiddle_f_or_7_cse
      & and_dcpl_65));
  COMP_LOOP_twiddle_f_mux1h_25_rmff <= (z_out_22(0)) AND (NOT((NOT((fsm_output(4))
      XOR (fsm_output(2)))) AND xor_dcpl AND (NOT (fsm_output(6))) AND (fsm_output(1))
      AND (NOT (fsm_output(0)))));
  mux_108_nl <= MUX_s_1_2_2(or_139_cse, or_tmp_79, fsm_output(3));
  mux_109_nl <= MUX_s_1_2_2(mux_108_nl, mux_tmp_102, fsm_output(2));
  mux_110_nl <= MUX_s_1_2_2(mux_109_nl, mux_tmp_106, fsm_output(1));
  mux_101_nl <= MUX_s_1_2_2(or_tmp_79, or_tmp_76, fsm_output(3));
  mux_103_nl <= MUX_s_1_2_2(mux_tmp_102, mux_101_nl, fsm_output(2));
  mux_107_nl <= MUX_s_1_2_2(mux_tmp_106, mux_103_nl, fsm_output(1));
  mux_111_itm <= MUX_s_1_2_2(mux_110_nl, mux_107_nl, fsm_output(0));
  mux_113_nl <= MUX_s_1_2_2(mux_tmp_83, mux_tmp_112, fsm_output(1));
  and_99_rmff <= (NOT mux_113_nl) AND (fsm_output(0));
  or_92_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_90_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  and_550_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  or_69_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"));
  mux_127_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), or_69_cse);
  or_147_nl <= (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"))))
      OR (fsm_output(5));
  or_151_nl <= (VEC_LOOP_j_2_10_0_sva_1(10)) OR (fsm_output(0));
  mux_128_nl <= MUX_s_1_2_2(mux_127_nl, or_147_nl, or_151_nl);
  nor_74_nl <= NOT(mux_128_nl OR (fsm_output(6)));
  and_109_nl <= and_dcpl_41 AND and_dcpl_14 AND (NOT (fsm_output(0))) AND (VEC_LOOP_j_2_10_0_sva_1(10));
  COMP_LOOP_twiddle_f_mux1h_28_rgt <= MUX1HOT_v_8_3_2((STD_LOGIC_VECTOR'( "0000")
      & z_out_14), (z_out_1(7 DOWNTO 0)), (z_out_18(7 DOWNTO 0)), STD_LOGIC_VECTOR'(
      nor_74_nl & and_109_nl & and_dcpl_44));
  or_8_cse <= (fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(3)));
  mux_134_nl <= MUX_s_1_2_2(mux_tmp_81, mux_tmp_76, fsm_output(3));
  mux_135_nl <= MUX_s_1_2_2(mux_tmp_77, mux_134_nl, fsm_output(1));
  COMP_LOOP_twiddle_help_and_cse <= complete_rsci_wen_comp AND (NOT mux_135_nl) AND
      (fsm_output(0));
  or_231_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  mux_80_nl <= MUX_s_1_2_2(mux_tmp_79, mux_tmp_77, fsm_output(1));
  VEC_LOOP_nor_1_cse <= NOT(mux_80_nl OR (fsm_output(0)));
  VEC_LOOP_and_2_cse <= complete_rsci_wen_comp AND (NOT(or_dcpl_43 OR or_dcpl_29));
  VEC_LOOP_or_3_cse <= and_dcpl_33 OR and_dcpl_51;
  or_139_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("101"));
  mult_res_1_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_10, reg_mult_res_1_cse, z_out_19_32);
  mult_res_2_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_11, reg_mult_res_1_cse, z_out_19_32);
  mult_res_3_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_11, reg_mult_res_3_cse, z_out_20_32);
  mult_res_4_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_10, reg_mult_res_3_cse, z_out_21_32);
  mult_res_5_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_10, reg_mult_res_5_cse, z_out_21_32);
  mult_res_6_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_8, reg_mult_res_5_cse, z_out_20_32);
  mult_res_7_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_8, reg_mult_res_7_cse, z_out_20_32);
  mult_res_lpi_4_dfm_mx0 <= MUX_v_32_2_2(z_out_8, reg_mult_res_7_cse, z_out_19_32);
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT z_out_14))
      + SIGNED'( "01011"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  or_tmp_24 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  nor_tmp_1 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  nor_tmp_14 <= or_tmp_24 AND (fsm_output(6));
  or_dcpl_29 <= (fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(0));
  or_dcpl_30 <= (fsm_output(6)) OR (fsm_output(2));
  or_tmp_67 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_69 <= (fsm_output(0)) OR (fsm_output(6)) OR (NOT (fsm_output(5)));
  or_tmp_70 <= (fsm_output(0)) OR (fsm_output(6)) OR (fsm_output(5));
  or_tmp_71 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  or_tmp_75 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"));
  or_tmp_76 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("100"));
  mux_tmp_75 <= MUX_s_1_2_2(or_tmp_76, or_tmp_75, fsm_output(2));
  or_tmp_77 <= (fsm_output(6)) OR (NOT nor_tmp_1);
  or_tmp_79 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_76 <= MUX_s_1_2_2(or_tmp_79, or_tmp_77, fsm_output(2));
  mux_tmp_77 <= MUX_s_1_2_2(mux_tmp_76, mux_tmp_75, fsm_output(3));
  or_tmp_80 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_78 <= MUX_s_1_2_2(or_tmp_80, or_tmp_79, fsm_output(2));
  mux_tmp_79 <= MUX_s_1_2_2(mux_tmp_75, mux_tmp_78, fsm_output(3));
  and_dcpl_14 <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_dcpl_15 <= and_dcpl_14 AND (NOT (fsm_output(0)));
  and_dcpl_16 <= (NOT (fsm_output(6))) AND (fsm_output(2));
  and_dcpl_17 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_18 <= and_dcpl_17 AND and_dcpl_16;
  and_dcpl_19 <= and_dcpl_18 AND and_dcpl_15;
  and_dcpl_21 <= (fsm_output(3)) AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  and_dcpl_22 <= NOT((fsm_output(6)) OR (fsm_output(2)));
  and_dcpl_23 <= and_dcpl_17 AND and_dcpl_22;
  mux_tmp_81 <= MUX_s_1_2_2(or_tmp_75, or_tmp_80, fsm_output(2));
  mux_tmp_82 <= MUX_s_1_2_2(or_tmp_77, or_tmp_76, fsm_output(2));
  mux_tmp_83 <= MUX_s_1_2_2(mux_tmp_82, mux_tmp_81, fsm_output(3));
  mux_84_nl <= MUX_s_1_2_2(or_139_cse, or_tmp_80, fsm_output(2));
  mux_tmp_85 <= MUX_s_1_2_2(mux_84_nl, mux_tmp_76, fsm_output(3));
  mux_86_itm <= MUX_s_1_2_2(mux_tmp_85, mux_tmp_83, fsm_output(1));
  and_dcpl_25 <= (NOT mux_86_itm) AND (fsm_output(0));
  and_dcpl_26 <= and_dcpl_18 AND and_dcpl_21;
  and_dcpl_27 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_28 <= (NOT mux_tmp_85) AND and_dcpl_27;
  and_dcpl_29 <= (fsm_output(3)) AND (NOT (fsm_output(1)));
  and_dcpl_30 <= and_dcpl_29 AND (NOT (fsm_output(0)));
  and_dcpl_31 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_33 <= and_dcpl_31 AND and_dcpl_22 AND and_dcpl_30;
  nor_86_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(4)));
  nor_87_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_87_nl <= MUX_s_1_2_2(nor_86_nl, nor_87_nl, fsm_output(3));
  and_dcpl_37 <= mux_87_nl AND (NOT (fsm_output(5))) AND (fsm_output(2)) AND (fsm_output(1))
      AND (NOT (fsm_output(0)));
  and_dcpl_38 <= (NOT (fsm_output(3))) AND (fsm_output(1));
  and_dcpl_39 <= and_dcpl_38 AND (NOT (fsm_output(0)));
  and_dcpl_40 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_41 <= and_dcpl_40 AND and_dcpl_22;
  and_dcpl_42 <= and_dcpl_41 AND and_dcpl_39;
  and_dcpl_44 <= and_dcpl_40 AND and_dcpl_16 AND and_dcpl_30;
  and_dcpl_46 <= nor_tmp_1 AND and_dcpl_22 AND and_dcpl_39;
  and_dcpl_47 <= nor_tmp_1 AND and_dcpl_16;
  and_dcpl_48 <= and_dcpl_47 AND and_dcpl_39;
  and_dcpl_49 <= (fsm_output(6)) AND (NOT (fsm_output(2)));
  and_dcpl_50 <= and_dcpl_17 AND and_dcpl_49;
  and_dcpl_51 <= and_dcpl_50 AND and_dcpl_15;
  and_dcpl_52 <= and_dcpl_50 AND and_dcpl_21;
  and_dcpl_53 <= NOT((fsm_output(4)) OR (fsm_output(6)));
  nor_38_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_35_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")));
  mux_88_nl <= MUX_s_1_2_2(nor_38_nl, nor_35_nl, fsm_output(1));
  and_dcpl_56 <= mux_88_nl AND (NOT (fsm_output(5))) AND and_dcpl_53 AND (NOT (fsm_output(0)));
  or_tmp_86 <= (fsm_output(2)) OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR (fsm_output(5));
  mux_tmp_89 <= MUX_s_1_2_2(or_tmp_86, mux_tmp_78, fsm_output(3));
  or_tmp_89 <= (NOT (fsm_output(2))) OR (fsm_output(6)) OR (NOT (fsm_output(4)))
      OR (fsm_output(5));
  or_tmp_90 <= (NOT (fsm_output(2))) OR (NOT (VEC_LOOP_j_2_10_0_sva_1(10))) OR (fsm_output(6));
  or_125_nl <= (fsm_output(2)) OR (NOT (VEC_LOOP_j_2_10_0_sva_1(10))) OR (fsm_output(6));
  mux_93_nl <= MUX_s_1_2_2(or_125_nl, or_tmp_90, fsm_output(4));
  nand_tmp <= NOT((fsm_output(5)) AND (NOT mux_93_nl));
  mux_99_nl <= MUX_s_1_2_2(or_tmp_89, mux_tmp_76, fsm_output(3));
  mux_tmp_100 <= MUX_s_1_2_2(mux_tmp_77, mux_99_nl, fsm_output(1));
  and_dcpl_61 <= and_dcpl_18 AND and_dcpl_30;
  and_dcpl_65 <= and_dcpl_41 AND and_dcpl_21;
  and_dcpl_81 <= and_dcpl_31 AND (fsm_output(6)) AND (fsm_output(2));
  and_dcpl_84 <= and_dcpl_81 AND and_dcpl_14 AND (fsm_output(0));
  or_tmp_101 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("011"));
  mux_tmp_102 <= MUX_s_1_2_2(or_tmp_80, or_tmp_101, fsm_output(3));
  mux_105_nl <= MUX_s_1_2_2(or_tmp_101, or_tmp_75, fsm_output(3));
  mux_104_nl <= MUX_s_1_2_2(or_tmp_76, or_tmp_80, fsm_output(3));
  mux_tmp_106 <= MUX_s_1_2_2(mux_105_nl, mux_104_nl, fsm_output(2));
  mux_tmp_112 <= MUX_s_1_2_2(mux_tmp_78, mux_tmp_82, fsm_output(3));
  mux_tmp_114 <= MUX_s_1_2_2(and_550_cse, nor_tmp_14, or_90_cse);
  mux_tmp_115 <= MUX_s_1_2_2(and_dcpl_17, (fsm_output(5)), fsm_output(6));
  mux_120_nl <= MUX_s_1_2_2(mux_tmp_115, nor_tmp_14, or_90_cse);
  mux_tmp_121 <= MUX_s_1_2_2(mux_120_nl, mux_tmp_114, fsm_output(1));
  or_dcpl_42 <= (fsm_output(6)) OR (NOT (fsm_output(2)));
  or_dcpl_43 <= or_tmp_24 OR or_dcpl_42;
  and_dcpl_113 <= and_dcpl_17 AND (NOT((fsm_output(1)) XOR (fsm_output(3)))) AND
      and_dcpl_16 AND (fsm_output(0));
  mux_tmp_137 <= MUX_s_1_2_2(mux_tmp_76, or_tmp_86, fsm_output(3));
  mux_138_nl <= MUX_s_1_2_2(mux_tmp_89, mux_tmp_137, fsm_output(1));
  and_dcpl_114 <= (NOT mux_138_nl) AND (fsm_output(0));
  or_dcpl_47 <= (fsm_output(3)) OR (NOT (fsm_output(1))) OR (fsm_output(0));
  or_tmp_131 <= (fsm_output(6)) OR and_dcpl_17;
  mux_tmp_155 <= MUX_s_1_2_2(and_dcpl_17, or_tmp_24, fsm_output(6));
  or_dcpl_51 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")) OR or_dcpl_30;
  or_dcpl_58 <= (NOT (fsm_output(3))) OR (NOT (fsm_output(1))) OR (fsm_output(0));
  or_dcpl_61 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")) OR or_dcpl_42;
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_81 AND and_dcpl_15;
  VEC_LOOP_j_1_sva_mx0c0 <= and_dcpl_23 AND and_dcpl_38 AND (fsm_output(0));
  mux_139_nl <= MUX_s_1_2_2(mux_tmp_112, mux_tmp_79, fsm_output(1));
  COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c1
      <= (NOT mux_139_nl) AND (fsm_output(0));
  COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c2
      <= NOT(mux_86_itm OR (fsm_output(0)));
  VEC_LOOP_acc_1_cse_2_sva_mx0c0 <= (NOT mux_tmp_100) AND (fsm_output(0));
  mux_159_nl <= MUX_s_1_2_2(mux_tmp_137, mux_tmp_85, fsm_output(1));
  VEC_LOOP_acc_1_cse_2_sva_mx0c2 <= NOT(mux_159_nl OR (fsm_output(0)));
  xor_dcpl <= NOT((fsm_output(5)) XOR (fsm_output(3)));
  VEC_LOOP_or_11_cse <= and_dcpl_19 OR and_dcpl_26;
  VEC_LOOP_or_13_cse <= and_dcpl_42 OR and_dcpl_48 OR and_dcpl_52;
  VEC_LOOP_or_19_cse <= and_dcpl_33 OR and_dcpl_42 OR and_dcpl_44 OR and_dcpl_48
      OR and_dcpl_51 OR and_dcpl_52;
  VEC_LOOP_mux1h_6_nl <= MUX1HOT_v_8_4_2((z_out_16(9 DOWNTO 2)), (z_out_12(8 DOWNTO
      1)), (z_out_18(9 DOWNTO 2)), (z_out_18(7 DOWNTO 0)), STD_LOGIC_VECTOR'( VEC_LOOP_or_11_cse
      & VEC_LOOP_or_3_cse & VEC_LOOP_or_13_cse & and_dcpl_44));
  VEC_LOOP_mux1h_4_nl <= MUX1HOT_s_1_4_2((z_out_16(1)), (z_out_12(0)), (z_out_18(1)),
      (VEC_LOOP_acc_1_cse_2_sva(1)), STD_LOGIC_VECTOR'( VEC_LOOP_or_11_cse & VEC_LOOP_or_3_cse
      & VEC_LOOP_or_13_cse & and_dcpl_44));
  and_59_nl <= (NOT mux_tmp_89) AND and_dcpl_27;
  VEC_LOOP_mux1h_2_nl <= MUX1HOT_s_1_3_2((z_out_16(0)), (VEC_LOOP_acc_1_cse_2_sva(0)),
      (z_out_18(0)), STD_LOGIC_VECTOR'( VEC_LOOP_or_11_cse & and_59_nl & VEC_LOOP_or_13_cse));
  and_26_nl <= and_dcpl_23 AND and_dcpl_21;
  VEC_LOOP_mux1h_nl <= MUX1HOT_v_7_8_2((z_out_18(6 DOWNTO 0)), VEC_LOOP_acc_psp_sva,
      (VEC_LOOP_acc_10_cse_1_sva(9 DOWNTO 3)), (z_out_18(9 DOWNTO 3)), (VEC_LOOP_acc_1_cse_2_sva(9
      DOWNTO 3)), (z_out_16(9 DOWNTO 3)), (VEC_LOOP_acc_11_psp_sva(8 DOWNTO 2)),
      (COMP_LOOP_5_twiddle_f_lshift_itm_7_4 & (COMP_LOOP_5_twiddle_f_lshift_itm_3_0(3
      DOWNTO 1))), STD_LOGIC_VECTOR'( and_dcpl_19 & and_26_nl & and_dcpl_25 & and_dcpl_26
      & and_dcpl_28 & VEC_LOOP_or_19_cse & and_dcpl_37 & and_dcpl_46));
  VEC_LOOP_mux1h_1_nl <= MUX1HOT_s_1_7_2((VEC_LOOP_j_1_sva(2)), (VEC_LOOP_acc_10_cse_1_sva(2)),
      (z_out_18(2)), (VEC_LOOP_acc_1_cse_2_sva(2)), (z_out_16(2)), (VEC_LOOP_acc_11_psp_sva(1)),
      (COMP_LOOP_5_twiddle_f_lshift_itm_3_0(0)), STD_LOGIC_VECTOR'( and_dcpl_56 &
      and_dcpl_25 & and_dcpl_26 & and_dcpl_28 & VEC_LOOP_or_19_cse & and_dcpl_37
      & and_dcpl_46));
  or_122_nl <= (fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(6)) OR (NOT nor_tmp_1);
  mux_90_nl <= MUX_s_1_2_2(mux_tmp_85, or_122_nl, fsm_output(1));
  nor_64_nl <= NOT(mux_90_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_3_nl <= MUX1HOT_s_1_6_2((VEC_LOOP_j_1_sva(1)), (VEC_LOOP_acc_10_cse_1_sva(1)),
      (z_out_18(1)), (VEC_LOOP_acc_1_cse_2_sva(1)), (z_out_16(1)), (VEC_LOOP_acc_11_psp_sva(0)),
      STD_LOGIC_VECTOR'( and_dcpl_56 & and_dcpl_25 & and_dcpl_26 & nor_64_nl & VEC_LOOP_or_19_cse
      & and_dcpl_37));
  mux_91_nl <= MUX_s_1_2_2(mux_tmp_82, or_tmp_89, fsm_output(3));
  mux_92_nl <= MUX_s_1_2_2(mux_tmp_85, mux_91_nl, fsm_output(1));
  nor_63_nl <= NOT(mux_92_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_5_nl <= MUX1HOT_s_1_5_2((VEC_LOOP_j_1_sva(0)), (VEC_LOOP_acc_10_cse_1_sva(0)),
      (z_out_18(0)), (VEC_LOOP_acc_1_cse_2_sva(0)), (z_out_16(0)), STD_LOGIC_VECTOR'(
      and_dcpl_56 & and_dcpl_25 & and_dcpl_26 & nor_63_nl & VEC_LOOP_or_19_cse));
  vec_rsci_adra_d <= VEC_LOOP_mux1h_6_nl & VEC_LOOP_mux1h_4_nl & VEC_LOOP_mux1h_2_nl
      & VEC_LOOP_mux1h_nl & VEC_LOOP_mux1h_1_nl & VEC_LOOP_mux1h_3_nl & VEC_LOOP_mux1h_5_nl;
  vec_rsci_wea_d <= vec_rsci_wea_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_da_d <= vec_rsci_da_d_reg;
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_reg;
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_reg;
  or_238_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("011"));
  mux_tmp_175 <= MUX_s_1_2_2(or_238_nl, or_tmp_76, fsm_output(2));
  mux_tmp_176 <= MUX_s_1_2_2(mux_tmp_78, mux_tmp_175, fsm_output(3));
  mux_177_itm <= MUX_s_1_2_2(mux_tmp_176, mux_tmp_79, fsm_output(1));
  and_184_cse <= (fsm_output(3)) AND (NOT (fsm_output(1))) AND (fsm_output(0));
  and_190_cse <= (NOT (fsm_output(3))) AND (fsm_output(1)) AND (fsm_output(0));
  and_201_cse <= (NOT (fsm_output(3))) AND (NOT (fsm_output(1))) AND (fsm_output(0));
  and_203_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_22;
  and_206_cse <= (fsm_output(3)) AND (fsm_output(1)) AND (fsm_output(0));
  and_209_cse <= and_dcpl_17 AND (fsm_output(6)) AND (fsm_output(2));
  and_dcpl_276 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT and_dcpl_16) OR (fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(0)));
  and_dcpl_282 <= and_dcpl_31 AND (NOT (fsm_output(6))) AND (NOT (fsm_output(2)))
      AND (NOT (fsm_output(3))) AND (fsm_output(1)) AND (fsm_output(0));
  and_dcpl_286 <= and_dcpl_31 AND and_dcpl_16 AND (fsm_output(3)) AND (NOT (fsm_output(1)))
      AND (fsm_output(0));
  and_dcpl_292 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01")) AND
      and_dcpl_22 AND (fsm_output(3)) AND (NOT (fsm_output(1))) AND (NOT (fsm_output(0)));
  and_dcpl_298 <= (NOT (fsm_output(4))) AND (NOT (fsm_output(5))) AND (fsm_output(6))
      AND (NOT (fsm_output(2))) AND and_dcpl_14 AND (NOT (fsm_output(0)));
  and_dcpl_302 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_22 AND and_dcpl_14 AND (fsm_output(0));
  and_dcpl_308 <= and_dcpl_47 AND and_206_cse;
  and_dcpl_311 <= and_dcpl_47 AND (NOT (fsm_output(3))) AND (NOT (fsm_output(1)))
      AND (fsm_output(0));
  and_dcpl_315 <= (fsm_output(5)) AND (NOT (fsm_output(4))) AND (NOT (fsm_output(6)))
      AND (NOT (fsm_output(2))) AND and_206_cse;
  and_dcpl_320 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01")) AND
      and_dcpl_16 AND (NOT (fsm_output(3))) AND (fsm_output(1)) AND (fsm_output(0));
  and_dcpl_325 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00")) AND
      and_dcpl_16 AND (fsm_output(3)) AND (NOT (fsm_output(1))) AND (fsm_output(0));
  and_dcpl_337 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("0000010")));
  and_dcpl_349 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("1010011"));
  and_dcpl_351 <= NOT((fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(0)));
  and_dcpl_360 <= (fsm_output(3)) AND (NOT (fsm_output(1))) AND (NOT (fsm_output(0)));
  and_dcpl_366 <= (NOT (fsm_output(3))) AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  and_400_cse <= and_dcpl_40 AND and_dcpl_16 AND and_dcpl_360;
  and_403_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_16 AND and_dcpl_366;
  and_dcpl_376 <= and_dcpl_17 AND (fsm_output(6)) AND (NOT (fsm_output(2)));
  and_407_cse <= and_dcpl_376 AND and_dcpl_21;
  and_dcpl_384 <= and_dcpl_18 AND and_dcpl_351;
  and_dcpl_393 <= and_dcpl_31 AND and_dcpl_22 AND and_dcpl_360;
  and_dcpl_398 <= and_dcpl_40 AND and_dcpl_22 AND and_dcpl_39;
  and_dcpl_403 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_16 AND and_dcpl_39;
  and_dcpl_406 <= and_dcpl_50 AND and_dcpl_351;
  and_dcpl_410 <= and_dcpl_31 AND and_dcpl_49 AND and_dcpl_38 AND (fsm_output(0));
  and_dcpl_416 <= NOT((NOT and_dcpl_18) OR (fsm_output(3)) OR (fsm_output(1)) OR
      (fsm_output(0)));
  and_dcpl_421 <= and_dcpl_40 AND and_dcpl_16 AND and_dcpl_29 AND (NOT (fsm_output(0)));
  and_dcpl_429 <= and_dcpl_40 AND (NOT (fsm_output(6))) AND (NOT (fsm_output(2)))
      AND and_dcpl_366;
  and_dcpl_437 <= and_dcpl_376 AND and_dcpl_29 AND (fsm_output(0));
  and_dcpl_489 <= and_dcpl_17 AND and_dcpl_16 AND and_dcpl_360;
  and_dcpl_494 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01")) AND
      and_dcpl_16 AND (NOT (fsm_output(3))) AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  and_dcpl_499 <= NOT((fsm_output(4)) OR (NOT (fsm_output(5))) OR (fsm_output(6))
      OR (fsm_output(2)));
  and_dcpl_500 <= and_dcpl_499 AND and_dcpl_351;
  and_dcpl_503 <= and_dcpl_499 AND and_dcpl_21;
  and_dcpl_505 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_16;
  and_dcpl_506 <= and_dcpl_505 AND and_dcpl_351;
  and_dcpl_507 <= and_dcpl_505 AND and_dcpl_21;
  and_dcpl_510 <= and_dcpl_17 AND (fsm_output(6)) AND (NOT (fsm_output(2))) AND and_dcpl_360;
  VEC_LOOP_or_32_ssc <= and_dcpl_416 OR and_dcpl_437;
  COMP_LOOP_twiddle_f_or_ssc <= and_dcpl_500 OR and_dcpl_506 OR and_dcpl_510;
  mux_tmp <= MUX_s_1_2_2((NOT or_tmp_24), (fsm_output(5)), fsm_output(6));
  and_188_itm <= and_dcpl_17 AND and_dcpl_22 AND and_184_cse;
  and_193_itm <= and_dcpl_31 AND and_dcpl_22 AND and_190_cse;
  and_196_itm <= and_dcpl_31 AND and_dcpl_16 AND and_184_cse;
  and_204_itm <= and_203_cse AND and_201_cse;
  and_207_itm <= and_203_cse AND and_206_cse;
  and_210_itm <= and_209_cse AND and_201_cse;
  and_211_itm <= and_209_cse AND and_206_cse;
  VEC_LOOP_or_35_itm <= and_dcpl_308 OR and_dcpl_311 OR and_dcpl_315 OR and_dcpl_320
      OR and_dcpl_325;
  VEC_LOOP_or_27_itm <= (and_dcpl_17 AND and_dcpl_16 AND and_dcpl_21) OR (CONV_SL_1_1(fsm_output(5
      DOWNTO 4)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_22 AND and_dcpl_360) OR (and_dcpl_40
      AND and_dcpl_22 AND and_dcpl_366) OR and_400_cse OR and_403_cse OR (and_dcpl_376
      AND and_dcpl_351) OR and_407_cse;
  VEC_LOOP_or_37_itm <= and_dcpl_26 OR and_dcpl_393 OR and_dcpl_398 OR and_400_cse
      OR and_dcpl_403 OR and_dcpl_406 OR and_dcpl_52;
  VEC_LOOP_or_8_itm <= and_dcpl_26 OR and_dcpl_429 OR and_403_cse OR and_407_cse;
  COMP_LOOP_twiddle_f_nor_1_itm <= NOT(and_dcpl_494 OR and_dcpl_503 OR and_dcpl_507);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        reg_mult_res_1_cse <= acc_nl(32 DOWNTO 1);
        reg_mult_res_3_cse <= acc_2_nl(32 DOWNTO 1);
        reg_mult_res_5_cse <= acc_4_nl(32 DOWNTO 1);
        reg_mult_res_7_cse <= acc_6_nl(32 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_run_rsci_oswt_cse <= '0';
        reg_vec_rsci_oswt_cse <= '0';
        reg_vec_rsci_oswt_1_cse <= '0';
        reg_twiddle_rsci_oswt_cse <= '0';
        reg_complete_rsci_oswt_cse <= '0';
        reg_vec_rsc_triosy_obj_iswt0_cse <= '0';
        reg_ensig_cgo_cse <= '0';
      ELSIF ( complete_rsci_wen_comp = '1' ) THEN
        reg_run_rsci_oswt_cse <= NOT(or_tmp_24 OR or_dcpl_30 OR or_dcpl_29);
        reg_vec_rsci_oswt_cse <= NOT mux_74_itm;
        reg_vec_rsci_oswt_1_cse <= VEC_LOOP_nor_1_cse;
        reg_twiddle_rsci_oswt_cse <= nor_62_rmff;
        reg_complete_rsci_oswt_cse <= and_dcpl_81 AND and_dcpl_14 AND (NOT (fsm_output(0)))
            AND STAGE_LOOP_acc_itm_4_1;
        reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_84;
        reg_ensig_cgo_cse <= NOT mux_111_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_118_nl) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((and_dcpl_23 AND and_dcpl_15) OR STAGE_LOOP_i_3_0_sva_mx0c1))
          = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), z_out_14,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_tmp_121) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_193_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_k_10_3_sva_6_0 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), (z_out_17(6
            DOWNTO 0)), COMP_LOOP_k_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_195_nl AND complete_rsci_wen_comp AND (NOT (fsm_output(6)))) = '1'
          ) THEN
        COMP_LOOP_5_twiddle_f_lshift_itm_7_4 <= COMP_LOOP_twiddle_f_mux1h_28_rgt(7
            DOWNTO 4);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_198_nl AND (NOT((fsm_output(0)) OR (fsm_output(4)))) AND complete_rsci_wen_comp
          AND (NOT (fsm_output(6)))) = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_itm_3_0 <= COMP_LOOP_twiddle_f_mux1h_28_rgt(3
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (VEC_LOOP_j_1_sva_mx0c0 OR and_dcpl_61)) =
          '1' ) THEN
        VEC_LOOP_j_1_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            VEC_LOOP_j_1_sva_1, VEC_LOOP_j_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_twiddle_help_and_cse = '1' ) THEN
        COMP_LOOP_twiddle_help_1_sva <= twiddle_h_rsci_qa_d_mxwt;
        COMP_LOOP_twiddle_f_1_sva <= twiddle_rsci_qa_d_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (and_dcpl_19 OR and_dcpl_84)) = '1' ) THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm <= MUX_s_1_2_2((z_out_15_22_10(12)),
            run_rsci_ivld_mxwt, and_dcpl_84);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_19 OR and_dcpl_26 OR and_dcpl_33
          OR and_dcpl_42 OR and_dcpl_44 OR and_dcpl_48 OR and_dcpl_51 OR and_dcpl_52))
          = '1' ) THEN
        VEC_LOOP_acc_10_cse_1_sva <= z_out_16;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( VEC_LOOP_and_2_cse = '1' ) THEN
        VEC_LOOP_acc_psp_sva <= z_out_18(6 DOWNTO 0);
        VEC_LOOP_j_1_sva_1 <= z_out_11;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_113 OR and_dcpl_114)) = '1' ) THEN
        factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(31 DOWNTO 0)), (vec_rsci_qa_d_mxwt(63
            DOWNTO 32)), and_dcpl_114);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_113 OR COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c1
          OR COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c2
          OR and_dcpl_114)) = '1' ) THEN
        COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm
            <= MUX1HOT_v_32_4_2((vec_rsci_qa_d_mxwt(63 DOWNTO 32)), (z_out_2(63 DOWNTO
            32)), COMP_LOOP_1_modulo_sub_cmp_return_rsc_z, (vec_rsci_qa_d_mxwt(31
            DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_113 & COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c1
            & COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm_mx0c2
            & and_dcpl_114));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_dcpl_43 OR or_dcpl_47))) = '1' ) THEN
        COMP_LOOP_1_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_158_nl) = '1' ) THEN
        COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (VEC_LOOP_acc_1_cse_2_sva_mx0c0 OR and_dcpl_26
          OR VEC_LOOP_acc_1_cse_2_sva_mx0c2 OR and_dcpl_42 OR and_dcpl_48 OR and_dcpl_52))
          = '1' ) THEN
        VEC_LOOP_acc_1_cse_2_sva <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            VEC_LOOP_VEC_LOOP_mux_2_nl, VEC_LOOP_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_2_10_0_sva_1 <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (complete_rsci_wen_comp AND (NOT(mux_168_nl OR (fsm_output(0))))) =
          '1' ) THEN
        VEC_LOOP_j_2_10_0_sva_1 <= z_out_13;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_dcpl_51 OR or_dcpl_29))) = '1' ) THEN
        COMP_LOOP_2_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_172_nl OR (fsm_output(6)))) = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND VEC_LOOP_or_3_cse) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva <= z_out_12;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_dcpl_51 OR or_dcpl_58))) = '1' ) THEN
        COMP_LOOP_3_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_dcpl_61 OR or_dcpl_29))) = '1' ) THEN
        COMP_LOOP_4_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_dcpl_61 OR or_dcpl_58))) = '1' ) THEN
        COMP_LOOP_5_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT((NOT nor_tmp_1) OR or_dcpl_30 OR or_8_cse)))
          = '1' ) THEN
        COMP_LOOP_6_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_tmp_86 OR or_dcpl_47))) = '1' ) THEN
        COMP_LOOP_7_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_tmp_24 OR (NOT (fsm_output(6))) OR
          (NOT (fsm_output(2))) OR or_8_cse))) = '1' ) THEN
        COMP_LOOP_8_mult_z_mul_itm <= z_out_2(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  and_552_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_22
      AND (NOT (fsm_output(3))) AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  mult_res_mux_12_nl <= MUX_v_32_2_2(COMP_LOOP_1_mult_z_mul_itm, COMP_LOOP_2_mult_z_mul_itm,
      and_552_nl);
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_res_mux_12_nl & '1') + UNSIGNED((NOT
      (z_out_2(31 DOWNTO 0))) & '1'), 33));
  and_554_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("0100110"));
  mult_res_mux_13_nl <= MUX_v_32_2_2(COMP_LOOP_3_mult_z_mul_itm, COMP_LOOP_4_mult_z_mul_itm,
      and_554_nl);
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_res_mux_13_nl & '1') +
      UNSIGNED((NOT (z_out_2(31 DOWNTO 0))) & '1'), 33));
  and_556_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND and_dcpl_22
      AND (fsm_output(3)) AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  mult_res_mux_14_nl <= MUX_v_32_2_2(COMP_LOOP_5_mult_z_mul_itm, COMP_LOOP_6_mult_z_mul_itm,
      and_556_nl);
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_res_mux_14_nl & '1') +
      UNSIGNED((NOT (z_out_2(31 DOWNTO 0))) & '1'), 33));
  and_558_nl <= and_dcpl_17 AND (fsm_output(6)) AND (fsm_output(2)) AND (fsm_output(3))
      AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  mult_res_mux_15_nl <= MUX_v_32_2_2(COMP_LOOP_7_mult_z_mul_itm, COMP_LOOP_8_mult_z_mul_itm,
      and_558_nl);
  acc_6_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_res_mux_15_nl & '1') +
      UNSIGNED((NOT (z_out_2(31 DOWNTO 0))) & '1'), 33));
  mux_116_nl <= MUX_s_1_2_2(mux_tmp_115, and_550_cse, fsm_output(2));
  mux_117_nl <= MUX_s_1_2_2(mux_116_nl, nor_tmp_14, fsm_output(3));
  mux_118_nl <= MUX_s_1_2_2(mux_117_nl, mux_tmp_114, or_92_cse);
  COMP_LOOP_k_not_nl <= NOT mux_tmp_121;
  mux_190_nl <= MUX_s_1_2_2(mux_tmp, nor_tmp_14, fsm_output(2));
  mux_189_nl <= MUX_s_1_2_2(and_550_cse, nor_tmp_14, fsm_output(2));
  mux_191_nl <= MUX_s_1_2_2(mux_190_nl, mux_189_nl, fsm_output(1));
  mux_192_nl <= MUX_s_1_2_2(mux_191_nl, nor_tmp_14, fsm_output(3));
  or_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  mux_188_nl <= MUX_s_1_2_2(mux_tmp, nor_tmp_14, or_nl);
  mux_193_nl <= MUX_s_1_2_2(mux_192_nl, mux_188_nl, fsm_output(0));
  or_250_nl <= (fsm_output(2)) OR (fsm_output(0));
  or_249_nl <= (NOT (fsm_output(2))) OR (fsm_output(0));
  mux_194_nl <= MUX_s_1_2_2(or_250_nl, or_249_nl, fsm_output(3));
  nor_131_nl <= NOT((fsm_output(4)) OR (fsm_output(1)) OR mux_194_nl);
  mux_195_nl <= MUX_s_1_2_2(or_69_cse, nor_131_nl, fsm_output(5));
  nor_127_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("001")));
  nor_128_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("110")));
  mux_196_nl <= MUX_s_1_2_2((fsm_output(2)), (NOT (fsm_output(2))), fsm_output(3));
  nor_129_nl <= NOT((fsm_output(1)) OR mux_196_nl);
  mux_197_nl <= MUX_s_1_2_2(nor_128_nl, nor_129_nl, VEC_LOOP_j_2_10_0_sva_1(10));
  mux_198_nl <= MUX_s_1_2_2(nor_127_nl, mux_197_nl, fsm_output(5));
  VEC_LOOP_j_not_1_nl <= NOT VEC_LOOP_j_1_sva_mx0c0;
  and_126_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  mux_157_nl <= MUX_s_1_2_2(mux_tmp_155, or_tmp_131, and_126_nl);
  mux_154_nl <= MUX_s_1_2_2(or_tmp_131, (fsm_output(6)), fsm_output(2));
  mux_156_nl <= MUX_s_1_2_2(mux_tmp_155, mux_154_nl, fsm_output(3));
  mux_158_nl <= MUX_s_1_2_2(mux_157_nl, mux_156_nl, or_92_cse);
  VEC_LOOP_VEC_LOOP_mux_2_nl <= MUX_v_10_2_2(z_out_18, (VEC_LOOP_j_2_10_0_sva_1(9
      DOWNTO 0)), VEC_LOOP_acc_1_cse_2_sva_mx0c2);
  VEC_LOOP_not_nl <= NOT VEC_LOOP_acc_1_cse_2_sva_mx0c0;
  mux_168_nl <= MUX_s_1_2_2(mux_tmp_89, mux_tmp_77, fsm_output(1));
  nor_30_nl <= NOT((CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")))
      OR (fsm_output(5)));
  nor_31_nl <= NOT(((fsm_output(2)) AND (fsm_output(4))) OR (fsm_output(5)));
  mux_169_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(4));
  mux_170_nl <= MUX_s_1_2_2(and_dcpl_17, mux_169_nl, fsm_output(2));
  mux_171_nl <= MUX_s_1_2_2(nor_31_nl, mux_170_nl, fsm_output(3));
  and_125_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  mux_172_nl <= MUX_s_1_2_2(nor_30_nl, mux_171_nl, and_125_nl);
  and_551_nl <= (NOT mux_177_itm) AND (fsm_output(0));
  nor_132_nl <= NOT(mux_177_itm OR (fsm_output(0)));
  mux_200_nl <= MUX_s_1_2_2(mux_tmp_175, mux_tmp_81, fsm_output(3));
  mux_199_nl <= MUX_s_1_2_2(mux_200_nl, mux_tmp_176, fsm_output(1));
  nor_133_nl <= NOT(mux_199_nl OR (fsm_output(0)));
  mult_t_mux1h_1_nl <= MUX1HOT_v_32_3_2(COMP_LOOP_twiddle_help_1_sva, COMP_LOOP_twiddle_f_1_sva,
      p_sva, STD_LOGIC_VECTOR'( and_551_nl & nor_132_nl & nor_133_nl));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_1_operator_96_false_operator_96_false_slc_mult_t_mul_63_32_itm)
      * UNSIGNED(mult_t_mux1h_1_nl)), 64));
  and_553_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_16 AND and_190_cse;
  mult_if_or_6_nl <= (and_209_cse AND and_dcpl_14 AND (fsm_output(0))) OR and_211_itm;
  mult_if_mult_if_mux_2_nl <= MUX_v_32_2_2(reg_mult_res_5_cse, reg_mult_res_7_cse,
      mult_if_or_6_nl);
  acc_5_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mult_if_mux_2_nl &
      '1') + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_8 <= acc_5_nl(32 DOWNTO 1);
  mult_if_mux1h_10_nl <= MUX1HOT_v_32_3_2(reg_mult_res_1_cse, reg_mult_res_3_cse,
      reg_mult_res_5_cse, STD_LOGIC_VECTOR'( (NOT (fsm_output(5))) & (fsm_output(1))
      & (fsm_output(4))));
  acc_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mux1h_10_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_10 <= acc_7_nl(32 DOWNTO 1);
  VEC_LOOP_mux1h_35_nl <= MUX1HOT_v_32_3_2(VEC_LOOP_j_1_sva, reg_mult_res_1_cse,
      reg_mult_res_3_cse, STD_LOGIC_VECTOR'( and_dcpl_276 & and_dcpl_282 & and_dcpl_286));
  VEC_LOOP_or_39_nl <= (NOT and_dcpl_276) OR and_dcpl_282 OR and_dcpl_286;
  VEC_LOOP_or_40_nl <= and_dcpl_282 OR and_dcpl_286;
  VEC_LOOP_VEC_LOOP_mux_10_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "000000000000000000000")
      & STAGE_LOOP_lshift_psp_sva), (NOT p_sva), VEC_LOOP_or_40_nl);
  acc_8_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux1h_35_nl & VEC_LOOP_or_39_nl)
      + UNSIGNED(VEC_LOOP_VEC_LOOP_mux_10_nl & '1'), 33));
  z_out_11 <= acc_8_nl(32 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_mux_11_nl <= MUX_v_9_2_2((VEC_LOOP_acc_1_cse_2_sva(9 DOWNTO 1)),
      ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 3)))), and_dcpl_302);
  VEC_LOOP_or_41_nl <= (NOT(and_dcpl_292 OR and_dcpl_298)) OR and_dcpl_302;
  VEC_LOOP_VEC_LOOP_mux_12_nl <= MUX_v_7_2_2(COMP_LOOP_k_10_3_sva_6_0, ('0' & (COMP_LOOP_k_10_3_sva_6_0(6
      DOWNTO 1))), and_dcpl_302);
  VEC_LOOP_VEC_LOOP_or_8_nl <= ((COMP_LOOP_k_10_3_sva_6_0(0)) AND (NOT and_dcpl_292))
      OR and_dcpl_298;
  VEC_LOOP_VEC_LOOP_or_9_nl <= (NOT and_dcpl_302) OR and_dcpl_292 OR and_dcpl_298;
  acc_9_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_11_nl
      & VEC_LOOP_or_41_nl) + UNSIGNED(VEC_LOOP_VEC_LOOP_mux_12_nl & VEC_LOOP_VEC_LOOP_or_8_nl
      & VEC_LOOP_VEC_LOOP_or_9_nl & '1'), 10));
  z_out_12 <= acc_9_nl(9 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_or_10_nl <= (STAGE_LOOP_lshift_psp_sva(10)) OR and_dcpl_308 OR
      and_dcpl_311 OR and_dcpl_315 OR and_dcpl_320 OR and_dcpl_325;
  VEC_LOOP_VEC_LOOP_mux_13_nl <= MUX_v_10_2_2((STAGE_LOOP_lshift_psp_sva(9 DOWNTO
      0)), (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1))), VEC_LOOP_or_35_itm);
  mux_202_nl <= MUX_s_1_2_2(mux_tmp_89, mux_tmp_77, fsm_output(1));
  VEC_LOOP_or_42_nl <= mux_202_nl OR (fsm_output(0)) OR and_dcpl_308 OR and_dcpl_311
      OR and_dcpl_315 OR and_dcpl_320 OR and_dcpl_325;
  VEC_LOOP_VEC_LOOP_mux_14_nl <= MUX_v_7_2_2((VEC_LOOP_acc_1_cse_2_sva(9 DOWNTO 3)),
      COMP_LOOP_k_10_3_sva_6_0, VEC_LOOP_or_35_itm);
  VEC_LOOP_VEC_LOOP_or_11_nl <= ((VEC_LOOP_acc_1_cse_2_sva(2)) AND (NOT(and_dcpl_320
      OR and_dcpl_325))) OR and_dcpl_308 OR and_dcpl_311 OR and_dcpl_315;
  VEC_LOOP_VEC_LOOP_or_12_nl <= ((VEC_LOOP_acc_1_cse_2_sva(1)) AND (NOT(and_dcpl_311
      OR and_dcpl_315 OR and_dcpl_325))) OR and_dcpl_308 OR and_dcpl_320;
  VEC_LOOP_VEC_LOOP_or_13_nl <= ((VEC_LOOP_acc_1_cse_2_sva(0)) AND (NOT(and_dcpl_308
      OR and_dcpl_315 OR and_dcpl_320))) OR and_dcpl_311 OR and_dcpl_325;
  acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_10_nl
      & VEC_LOOP_VEC_LOOP_mux_13_nl & VEC_LOOP_or_42_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_14_nl
      & VEC_LOOP_VEC_LOOP_or_11_nl & VEC_LOOP_VEC_LOOP_or_12_nl & VEC_LOOP_VEC_LOOP_or_13_nl
      & '1'), 11), 12), 12));
  z_out_13 <= acc_10_nl(11 DOWNTO 1);
  STAGE_LOOP_mux_3_nl <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (NOT STAGE_LOOP_i_3_0_sva),
      and_dcpl_337);
  z_out_14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_mux_3_nl) + UNSIGNED'(
      and_dcpl_337 & '0' & and_dcpl_337 & '1'), 4));
  VEC_LOOP_mux_5_nl <= MUX_v_22_2_2((z_out_11(31 DOWNTO 10)), (STD_LOGIC_VECTOR'(
      "00000000000") & (z_out_17(7 DOWNTO 0)) & STD_LOGIC_VECTOR'( "000")), and_dcpl_349);
  VEC_LOOP_or_43_nl <= (NOT(and_dcpl_17 AND (NOT (fsm_output(6))) AND (fsm_output(2))
      AND and_dcpl_351)) OR and_dcpl_349;
  VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl <= NOT(MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
      (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1)), and_dcpl_349));
  acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_5_nl
      & VEC_LOOP_or_43_nl), 23), 24) + CONV_UNSIGNED(CONV_SIGNED(SIGNED('1' & VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl
      & '1'), 12), 24), 24));
  z_out_15_22_10 <= acc_12_nl(23 DOWNTO 11);
  VEC_LOOP_VEC_LOOP_mux_15_nl <= MUX_v_10_2_2(((z_out_17(6 DOWNTO 0)) & (STAGE_LOOP_lshift_psp_sva(3
      DOWNTO 1))), z_out_17, VEC_LOOP_or_27_itm);
  VEC_LOOP_mux_6_nl <= MUX_v_10_2_2((VEC_LOOP_j_1_sva(9 DOWNTO 0)), VEC_LOOP_acc_1_cse_2_sva,
      VEC_LOOP_or_27_itm);
  z_out_16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_15_nl)
      + UNSIGNED(VEC_LOOP_mux_6_nl), 10));
  VEC_LOOP_VEC_LOOP_mux_16_nl <= MUX_v_7_2_2((STD_LOGIC_VECTOR'( "000") & (COMP_LOOP_k_10_3_sva_6_0(6
      DOWNTO 3))), COMP_LOOP_k_10_3_sva_6_0, VEC_LOOP_or_37_itm);
  VEC_LOOP_or_45_nl <= and_dcpl_384 OR and_dcpl_410;
  VEC_LOOP_mux1h_36_nl <= MUX1HOT_v_3_7_2((COMP_LOOP_k_10_3_sva_6_0(2 DOWNTO 0)),
      STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'( "011"),
      STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'( "110"),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_45_nl & and_dcpl_26 & and_dcpl_393 & and_dcpl_398
      & and_400_cse & and_dcpl_403 & and_dcpl_406));
  VEC_LOOP_or_44_nl <= MUX_v_3_2_2(VEC_LOOP_mux1h_36_nl, STD_LOGIC_VECTOR'("111"),
      and_dcpl_52);
  VEC_LOOP_mux1h_37_nl <= MUX1HOT_v_10_3_2((STD_LOGIC_VECTOR'( "000") & (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 4))), (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1)), STD_LOGIC_VECTOR'( "0000000001"),
      STD_LOGIC_VECTOR'( and_dcpl_384 & VEC_LOOP_or_37_itm & and_dcpl_410));
  z_out_17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_16_nl
      & VEC_LOOP_or_44_nl) + UNSIGNED(VEC_LOOP_mux1h_37_nl), 10));
  VEC_LOOP_mux1h_38_nl <= MUX1HOT_v_10_4_2((STD_LOGIC_VECTOR'( "000") & (VEC_LOOP_j_1_sva(9
      DOWNTO 3))), (STD_LOGIC_VECTOR'( "00") & (VEC_LOOP_acc_1_cse_2_sva(9 DOWNTO
      2))), VEC_LOOP_acc_1_cse_2_sva, (STD_LOGIC_VECTOR'( "001") & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 4)))), STD_LOGIC_VECTOR'( and_dcpl_416 & and_dcpl_421 & VEC_LOOP_or_8_itm
      & and_dcpl_437));
  VEC_LOOP_or_46_nl <= (NOT(and_dcpl_416 OR and_dcpl_421 OR and_dcpl_26 OR and_dcpl_429
      OR and_403_cse OR and_407_cse)) OR and_dcpl_437;
  VEC_LOOP_mux1h_39_nl <= MUX1HOT_v_7_3_2((STD_LOGIC_VECTOR'( "000") & (COMP_LOOP_k_10_3_sva_6_0(6
      DOWNTO 3))), (STD_LOGIC_VECTOR'( "00") & (COMP_LOOP_k_10_3_sva_6_0(6 DOWNTO
      2))), COMP_LOOP_k_10_3_sva_6_0, STD_LOGIC_VECTOR'( VEC_LOOP_or_32_ssc & and_dcpl_421
      & VEC_LOOP_or_8_itm));
  VEC_LOOP_mux1h_40_nl <= MUX1HOT_v_2_4_2((COMP_LOOP_k_10_3_sva_6_0(2 DOWNTO 1)),
      (COMP_LOOP_k_10_3_sva_6_0(1 DOWNTO 0)), STD_LOGIC_VECTOR'( "01"), STD_LOGIC_VECTOR'(
      "10"), STD_LOGIC_VECTOR'( VEC_LOOP_or_32_ssc & and_dcpl_421 & and_dcpl_429
      & and_403_cse));
  not_571_nl <= NOT and_dcpl_26;
  VEC_LOOP_and_15_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), VEC_LOOP_mux1h_40_nl,
      not_571_nl);
  VEC_LOOP_or_47_nl <= MUX_v_2_2_2(VEC_LOOP_and_15_nl, STD_LOGIC_VECTOR'("11"), and_407_cse);
  VEC_LOOP_VEC_LOOP_or_14_nl <= (COMP_LOOP_k_10_3_sva_6_0(0)) OR and_dcpl_421 OR
      and_dcpl_26 OR and_dcpl_429 OR and_403_cse OR and_407_cse;
  acc_15_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux1h_38_nl & VEC_LOOP_or_46_nl)
      + UNSIGNED(VEC_LOOP_mux1h_39_nl & VEC_LOOP_or_47_nl & VEC_LOOP_VEC_LOOP_or_14_nl
      & '1'), 11));
  z_out_18 <= acc_15_nl(10 DOWNTO 1);
  and_559_nl <= and_dcpl_17 AND (fsm_output(6)) AND (fsm_output(2)) AND (fsm_output(3))
      AND (fsm_output(1)) AND (fsm_output(0));
  mult_if_mult_if_mux_3_nl <= MUX_v_32_2_2(reg_mult_res_1_cse, reg_mult_res_7_cse,
      and_559_nl);
  acc_16_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_if_mult_if_mux_3_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34),
      34));
  z_out_19_32 <= acc_16_nl(33);
  and_560_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("0011101"));
  mult_if_mux1h_11_nl <= MUX1HOT_v_32_3_2(reg_mult_res_3_cse, reg_mult_res_5_cse,
      reg_mult_res_7_cse, STD_LOGIC_VECTOR'( and_560_nl & (fsm_output(5)) & (fsm_output(6))));
  acc_17_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_if_mux1h_11_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34),
      34));
  z_out_20_32 <= acc_17_nl(33);
  and_561_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("0110001"));
  mult_if_mux_3_nl <= MUX_v_32_2_2(reg_mult_res_3_cse, reg_mult_res_5_cse, and_561_nl);
  acc_18_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_if_mux_3_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34), 34));
  z_out_21_32 <= acc_18_nl(33);
  COMP_LOOP_twiddle_f_mux_7_nl <= MUX_s_1_2_2((z_out_1(9)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(9)),
      COMP_LOOP_twiddle_f_or_ssc);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl <= COMP_LOOP_twiddle_f_mux_7_nl
      AND COMP_LOOP_twiddle_f_nor_1_itm;
  COMP_LOOP_twiddle_f_mux1h_68_nl <= MUX1HOT_v_9_5_2((z_out_1(8 DOWNTO 0)), COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1,
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(8 DOWNTO 0)), ('0' & COMP_LOOP_5_twiddle_f_lshift_itm_7_4
      & COMP_LOOP_5_twiddle_f_lshift_itm_3_0), COMP_LOOP_3_twiddle_f_lshift_ncse_sva,
      STD_LOGIC_VECTOR'( and_dcpl_489 & and_dcpl_494 & COMP_LOOP_twiddle_f_or_ssc
      & and_dcpl_503 & and_dcpl_507));
  COMP_LOOP_twiddle_f_and_10_nl <= (COMP_LOOP_k_10_3_sva_6_0(6)) AND COMP_LOOP_twiddle_f_nor_1_itm;
  COMP_LOOP_twiddle_f_or_14_nl <= and_dcpl_489 OR and_dcpl_500 OR and_dcpl_506 OR
      and_dcpl_510;
  COMP_LOOP_twiddle_f_or_15_nl <= and_dcpl_494 OR and_dcpl_507;
  COMP_LOOP_twiddle_f_mux1h_69_nl <= MUX1HOT_v_6_3_2((COMP_LOOP_k_10_3_sva_6_0(5
      DOWNTO 0)), (COMP_LOOP_k_10_3_sva_6_0(6 DOWNTO 1)), ('0' & (COMP_LOOP_k_10_3_sva_6_0(6
      DOWNTO 2))), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_14_nl & COMP_LOOP_twiddle_f_or_15_nl
      & and_dcpl_503));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_nl <= MUX_s_1_2_2((COMP_LOOP_k_10_3_sva_6_0(0)),
      (COMP_LOOP_k_10_3_sva_6_0(1)), and_dcpl_503);
  COMP_LOOP_twiddle_f_or_16_nl <= (COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_nl
      AND (NOT(and_dcpl_489 OR and_dcpl_500))) OR and_dcpl_506 OR and_dcpl_510;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_1_nl <= ((COMP_LOOP_k_10_3_sva_6_0(0))
      AND (NOT(and_dcpl_489 OR and_dcpl_494 OR and_dcpl_506))) OR and_dcpl_500 OR
      and_dcpl_507 OR and_dcpl_510;
  z_out_22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl
      & COMP_LOOP_twiddle_f_mux1h_68_nl) * UNSIGNED(COMP_LOOP_twiddle_f_and_10_nl
      & COMP_LOOP_twiddle_f_mux1h_69_nl & COMP_LOOP_twiddle_f_or_16_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_1_nl
      & '1')), 10));
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    vec_rsc_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_wea : OUT STD_LOGIC;
    vec_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_web : OUT STD_LOGIC;
    vec_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_wea : OUT STD_LOGIC;
    twiddle_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_web : OUT STD_LOGIC;
    twiddle_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_h_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_wea : OUT STD_LOGIC;
    twiddle_h_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_h_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_web : OUT STD_LOGIC;
    twiddle_h_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp;

ARCHITECTURE v5 OF inPlaceNTT_DIT_precomp IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_8_10_32_1024_1024_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL vec_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_adrb : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_adra_d_1 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL vec_rsci_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_10_32_1024_1024_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adrb : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_1 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL twiddle_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_10_32_1024_1024_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (19 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adrb : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_1 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL twiddle_h_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsc_rdy : OUT STD_LOGIC;
      run_rsc_vld : IN STD_LOGIC;
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      complete_rsc_rdy : IN STD_LOGIC;
      complete_rsc_vld : OUT STD_LOGIC;
      vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_adra_d : STD_LOGIC_VECTOR (19
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_da_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_adra_d : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
  vec_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_8_10_32_1024_1024_32_1_gen
    PORT MAP(
      qb => vec_rsci_qb,
      web => vec_rsc_web,
      db => vec_rsci_db,
      adrb => vec_rsci_adrb,
      qa => vec_rsci_qa,
      wea => vec_rsc_wea,
      da => vec_rsci_da,
      adra => vec_rsci_adra,
      adra_d => vec_rsci_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => vec_rsci_da_d_1,
      qa_d => vec_rsci_qa_d_1,
      wea_d => vec_rsci_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  vec_rsci_qb <= vec_rsc_qb;
  vec_rsc_db <= vec_rsci_db;
  vec_rsc_adrb <= vec_rsci_adrb;
  vec_rsci_qa <= vec_rsc_qa;
  vec_rsc_da <= vec_rsci_da;
  vec_rsc_adra <= vec_rsci_adra;
  vec_rsci_adra_d_1 <= vec_rsci_adra_d;
  vec_rsci_da_d_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000") & vec_rsci_da_d;
  vec_rsci_qa_d <= vec_rsci_qa_d_1;
  vec_rsci_wea_d_1 <= vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;

  twiddle_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_10_32_1024_1024_32_1_gen
    PORT MAP(
      qb => twiddle_rsci_qb,
      web => twiddle_rsc_web,
      db => twiddle_rsci_db,
      adrb => twiddle_rsci_adrb,
      qa => twiddle_rsci_qa,
      wea => twiddle_rsc_wea,
      da => twiddle_rsci_da,
      adra => twiddle_rsci_adra,
      adra_d => twiddle_rsci_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => twiddle_rsci_da_d,
      qa_d => twiddle_rsci_qa_d_1,
      wea_d => twiddle_rsci_wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d => twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
    );
  twiddle_rsci_qb <= twiddle_rsc_qb;
  twiddle_rsc_db <= twiddle_rsci_db;
  twiddle_rsc_adrb <= twiddle_rsci_adrb;
  twiddle_rsci_qa <= twiddle_rsc_qa;
  twiddle_rsc_da <= twiddle_rsci_da;
  twiddle_rsc_adra <= twiddle_rsci_adra;
  twiddle_rsci_adra_d_1 <= STD_LOGIC_VECTOR'( "0000000000") & twiddle_rsci_adra_d;
  twiddle_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  twiddle_rsci_qa_d <= twiddle_rsci_qa_d_1;
  twiddle_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  twiddle_h_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_10_32_1024_1024_32_1_gen
    PORT MAP(
      qb => twiddle_h_rsci_qb,
      web => twiddle_h_rsc_web,
      db => twiddle_h_rsci_db,
      adrb => twiddle_h_rsci_adrb,
      qa => twiddle_h_rsci_qa,
      wea => twiddle_h_rsc_wea,
      da => twiddle_h_rsci_da,
      adra => twiddle_h_rsci_adra,
      adra_d => twiddle_h_rsci_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => twiddle_h_rsci_da_d,
      qa_d => twiddle_h_rsci_qa_d_1,
      wea_d => twiddle_h_rsci_wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d => twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => twiddle_h_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
    );
  twiddle_h_rsci_qb <= twiddle_h_rsc_qb;
  twiddle_h_rsc_db <= twiddle_h_rsci_db;
  twiddle_h_rsc_adrb <= twiddle_h_rsci_adrb;
  twiddle_h_rsci_qa <= twiddle_h_rsc_qa;
  twiddle_h_rsc_da <= twiddle_h_rsci_da;
  twiddle_h_rsc_adra <= twiddle_h_rsci_adra;
  twiddle_h_rsci_adra_d_1 <= STD_LOGIC_VECTOR'( "0000000000") & twiddle_h_rsci_adra_d;
  twiddle_h_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d_1;
  twiddle_h_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  inPlaceNTT_DIT_precomp_core_inst : inPlaceNTT_DIT_precomp_core
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => inPlaceNTT_DIT_precomp_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      vec_rsci_adra_d => inPlaceNTT_DIT_precomp_core_inst_vec_rsci_adra_d,
      vec_rsci_da_d => inPlaceNTT_DIT_precomp_core_inst_vec_rsci_da_d,
      vec_rsci_qa_d => inPlaceNTT_DIT_precomp_core_inst_vec_rsci_qa_d,
      vec_rsci_wea_d => inPlaceNTT_DIT_precomp_core_inst_vec_rsci_wea_d,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d => inPlaceNTT_DIT_precomp_core_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d,
      twiddle_rsci_adra_d => inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_adra_d,
      twiddle_rsci_qa_d => inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsci_adra_d => inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d,
      twiddle_h_rsci_qa_d => inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
    );
  inPlaceNTT_DIT_precomp_core_inst_p_rsc_dat <= p_rsc_dat;
  vec_rsci_adra_d <= inPlaceNTT_DIT_precomp_core_inst_vec_rsci_adra_d;
  vec_rsci_da_d <= inPlaceNTT_DIT_precomp_core_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_wea_d <= inPlaceNTT_DIT_precomp_core_inst_vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= inPlaceNTT_DIT_precomp_core_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= inPlaceNTT_DIT_precomp_core_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  twiddle_rsci_adra_d <= inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_h_rsci_adra_d <= inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;

END v5;



