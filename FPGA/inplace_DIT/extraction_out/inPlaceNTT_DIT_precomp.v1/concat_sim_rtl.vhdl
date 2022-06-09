
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

--------> ../td_ccore_solutions/modulo_sub_9cc7439c5775bc162fe17431e78231ea6384_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Jun  9 11:07:43 2022
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
      rscid => 9,
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
      rscid => 10,
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
      rscid => 11,
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




--------> ../td_ccore_solutions/modulo_add_0c8c8b8581199e9d1dc87e75ec5d104e605c_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Jun  9 11:07:44 2022
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
  SIGNAL acc_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
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
      rscid => 6,
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
      rscid => 7,
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
      rscid => 8,
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
            32)), acc_nl(32));
      END IF;
    END IF;
  END PROCESS;
  qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(base_rsci_idat) - UNSIGNED(m_rsci_idat),
      32));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_rsci_idat) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT
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




--------> ../td_ccore_solutions/mult_9b8ae6c857951539e3f3886315ce73b770ef_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Jun  9 11:07:46 2022
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    mult_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;


ENTITY mult_core IS
  PORT(
    x_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    y_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    y_rsc_dat_1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END mult_core;

ARCHITECTURE v1 OF mult_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL x_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL y_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL y_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL return_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL slc_32_svs_1 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL p_buf_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_buf_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_mul_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1 : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL res_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL res_and_cse : STD_LOGIC;
  SIGNAL p_and_1_cse : STD_LOGIC;
  SIGNAL acc_itm_32_1 : STD_LOGIC;

  SIGNAL if_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL t_mul_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_mul_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL x_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL y_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL y_rsci_idat_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL y_rsci_1_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL y_rsci_1_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

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
  x_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 32
      )
    PORT MAP(
      dat => x_rsci_dat,
      idat => x_rsci_idat_1
    );
  x_rsci_dat <= x_rsc_dat;
  x_rsci_idat <= x_rsci_idat_1;

  y_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 32
      )
    PORT MAP(
      dat => y_rsci_dat,
      idat => y_rsci_idat_2
    );
  y_rsci_dat <= y_rsc_dat;
  y_rsci_idat <= y_rsci_idat_2;

  y_rsci_1 : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 3,
      width => 32
      )
    PORT MAP(
      dat => y_rsci_1_dat,
      idat => y_rsci_1_idat
    );
  y_rsci_1_dat <= y_rsc_dat_1;
  y_rsci_idat_1 <= y_rsci_1_idat;

  p_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 4,
      width => 32
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

  return_rsci : work.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 5,
      width => 32
      )
    PORT MAP(
      d => return_rsci_d_1,
      z => return_rsci_z
    );
  return_rsci_d_1 <= return_rsci_d;
  return_rsc_z <= return_rsci_z;

  ccs_ccore_start_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 21,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  res_and_cse <= ccs_ccore_en AND and_dcpl;
  p_and_1_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  z_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1)
      * UNSIGNED(p_buf_sva_1)), 32));
  res_sva_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_mul_itm_1) - CONV_UNSIGNED(UNSIGNED(z_mul_nl),
      32), 32));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & res_sva_3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT
      p_buf_sva_1), 32), 33) + UNSIGNED'( "000000000000000000000000000000001"), 33));
  acc_itm_32_1 <= acc_nl(32);
  and_dcpl <= main_stage_0_2 AND asn_itm_1;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( ccs_ccore_en = '1' ) THEN
        return_rsci_d <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(if_acc_nl),
            32)), res_sva_1, slc_32_svs_1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        asn_itm_1 <= '0';
        main_stage_0_2 <= '0';
      ELSIF ( ccs_ccore_en = '1' ) THEN
        asn_itm_1 <= ccs_ccore_start_rsci_idat;
        main_stage_0_2 <= '1';
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( res_and_cse = '1' ) THEN
        res_sva_1 <= res_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        slc_32_svs_1 <= '0';
      ELSIF ( res_and_cse = '1' ) THEN
        slc_32_svs_1 <= acc_itm_32_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( (ccs_ccore_en AND and_dcpl AND (NOT acc_itm_32_1)) = '1' ) THEN
        p_buf_sva_2 <= p_buf_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( p_and_1_cse = '1' ) THEN
        p_buf_sva_1 <= p_rsci_idat;
        z_mul_itm_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(x_rsci_idat)
            * UNSIGNED(y_rsci_idat)), 32));
        operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1 <= t_mul_nl(63
            DOWNTO 32);
      END IF;
    END IF;
  END PROCESS;
  if_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(res_sva_1) - UNSIGNED(p_buf_sva_2),
      32));
  t_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(x_rsci_idat) * UNSIGNED(y_rsci_idat_1)),
      64));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    mult
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;


ENTITY mult IS
  PORT(
    x_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    y_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    y_rsc_dat_1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END mult;

ARCHITECTURE v1 OF mult IS
  -- Default Constants

  COMPONENT mult_core
    PORT(
      x_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      y_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      y_rsc_dat_1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL mult_core_inst_x_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_core_inst_y_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_core_inst_y_rsc_dat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_core_inst_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  mult_core_inst : mult_core
    PORT MAP(
      x_rsc_dat => mult_core_inst_x_rsc_dat,
      y_rsc_dat => mult_core_inst_y_rsc_dat,
      y_rsc_dat_1 => mult_core_inst_y_rsc_dat_1,
      p_rsc_dat => mult_core_inst_p_rsc_dat,
      return_rsc_z => mult_core_inst_return_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  mult_core_inst_x_rsc_dat <= x_rsc_dat;
  mult_core_inst_y_rsc_dat <= y_rsc_dat;
  mult_core_inst_y_rsc_dat_1 <= y_rsc_dat_1;
  mult_core_inst_p_rsc_dat <= p_rsc_dat;
  return_rsc_z <= mult_core_inst_return_rsc_z;

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
--  Generated date: Thu Jun  9 11:09:06 2022
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v1;

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
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
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
    COMP_LOOP_9_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_10_tr0 : IN STD_LOGIC;
    COMP_LOOP_10_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_11_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
    COMP_LOOP_12_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_13_tr0 : IN STD_LOGIC;
    COMP_LOOP_13_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_14_tr0 : IN STD_LOGIC;
    COMP_LOOP_14_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_15_tr0 : IN STD_LOGIC;
    COMP_LOOP_15_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
    COMP_LOOP_16_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_17_tr0 : IN STD_LOGIC;
    COMP_LOOP_17_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_18_tr0 : IN STD_LOGIC;
    COMP_LOOP_18_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_19_tr0 : IN STD_LOGIC;
    COMP_LOOP_19_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_20_tr0 : IN STD_LOGIC;
    COMP_LOOP_20_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_21_tr0 : IN STD_LOGIC;
    COMP_LOOP_21_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_22_tr0 : IN STD_LOGIC;
    COMP_LOOP_22_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_23_tr0 : IN STD_LOGIC;
    COMP_LOOP_23_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_24_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_25_tr0 : IN STD_LOGIC;
    COMP_LOOP_25_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_26_tr0 : IN STD_LOGIC;
    COMP_LOOP_26_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_27_tr0 : IN STD_LOGIC;
    COMP_LOOP_27_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
    COMP_LOOP_28_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_29_tr0 : IN STD_LOGIC;
    COMP_LOOP_29_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_30_tr0 : IN STD_LOGIC;
    COMP_LOOP_30_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_31_tr0 : IN STD_LOGIC;
    COMP_LOOP_31_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_32_tr0 : IN STD_LOGIC;
    COMP_LOOP_32_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_33_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_core_fsm;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_core_fsm IS
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
      COMP_LOOP_C_9, COMP_LOOP_9_VEC_LOOP_C_0, COMP_LOOP_9_VEC_LOOP_C_1, COMP_LOOP_9_VEC_LOOP_C_2,
      COMP_LOOP_9_VEC_LOOP_C_3, COMP_LOOP_9_VEC_LOOP_C_4, COMP_LOOP_9_VEC_LOOP_C_5,
      COMP_LOOP_9_VEC_LOOP_C_6, COMP_LOOP_9_VEC_LOOP_C_7, COMP_LOOP_9_VEC_LOOP_C_8,
      COMP_LOOP_C_10, COMP_LOOP_10_VEC_LOOP_C_0, COMP_LOOP_10_VEC_LOOP_C_1, COMP_LOOP_10_VEC_LOOP_C_2,
      COMP_LOOP_10_VEC_LOOP_C_3, COMP_LOOP_10_VEC_LOOP_C_4, COMP_LOOP_10_VEC_LOOP_C_5,
      COMP_LOOP_10_VEC_LOOP_C_6, COMP_LOOP_10_VEC_LOOP_C_7, COMP_LOOP_10_VEC_LOOP_C_8,
      COMP_LOOP_C_11, COMP_LOOP_11_VEC_LOOP_C_0, COMP_LOOP_11_VEC_LOOP_C_1, COMP_LOOP_11_VEC_LOOP_C_2,
      COMP_LOOP_11_VEC_LOOP_C_3, COMP_LOOP_11_VEC_LOOP_C_4, COMP_LOOP_11_VEC_LOOP_C_5,
      COMP_LOOP_11_VEC_LOOP_C_6, COMP_LOOP_11_VEC_LOOP_C_7, COMP_LOOP_11_VEC_LOOP_C_8,
      COMP_LOOP_C_12, COMP_LOOP_12_VEC_LOOP_C_0, COMP_LOOP_12_VEC_LOOP_C_1, COMP_LOOP_12_VEC_LOOP_C_2,
      COMP_LOOP_12_VEC_LOOP_C_3, COMP_LOOP_12_VEC_LOOP_C_4, COMP_LOOP_12_VEC_LOOP_C_5,
      COMP_LOOP_12_VEC_LOOP_C_6, COMP_LOOP_12_VEC_LOOP_C_7, COMP_LOOP_12_VEC_LOOP_C_8,
      COMP_LOOP_C_13, COMP_LOOP_13_VEC_LOOP_C_0, COMP_LOOP_13_VEC_LOOP_C_1, COMP_LOOP_13_VEC_LOOP_C_2,
      COMP_LOOP_13_VEC_LOOP_C_3, COMP_LOOP_13_VEC_LOOP_C_4, COMP_LOOP_13_VEC_LOOP_C_5,
      COMP_LOOP_13_VEC_LOOP_C_6, COMP_LOOP_13_VEC_LOOP_C_7, COMP_LOOP_13_VEC_LOOP_C_8,
      COMP_LOOP_C_14, COMP_LOOP_14_VEC_LOOP_C_0, COMP_LOOP_14_VEC_LOOP_C_1, COMP_LOOP_14_VEC_LOOP_C_2,
      COMP_LOOP_14_VEC_LOOP_C_3, COMP_LOOP_14_VEC_LOOP_C_4, COMP_LOOP_14_VEC_LOOP_C_5,
      COMP_LOOP_14_VEC_LOOP_C_6, COMP_LOOP_14_VEC_LOOP_C_7, COMP_LOOP_14_VEC_LOOP_C_8,
      COMP_LOOP_C_15, COMP_LOOP_15_VEC_LOOP_C_0, COMP_LOOP_15_VEC_LOOP_C_1, COMP_LOOP_15_VEC_LOOP_C_2,
      COMP_LOOP_15_VEC_LOOP_C_3, COMP_LOOP_15_VEC_LOOP_C_4, COMP_LOOP_15_VEC_LOOP_C_5,
      COMP_LOOP_15_VEC_LOOP_C_6, COMP_LOOP_15_VEC_LOOP_C_7, COMP_LOOP_15_VEC_LOOP_C_8,
      COMP_LOOP_C_16, COMP_LOOP_16_VEC_LOOP_C_0, COMP_LOOP_16_VEC_LOOP_C_1, COMP_LOOP_16_VEC_LOOP_C_2,
      COMP_LOOP_16_VEC_LOOP_C_3, COMP_LOOP_16_VEC_LOOP_C_4, COMP_LOOP_16_VEC_LOOP_C_5,
      COMP_LOOP_16_VEC_LOOP_C_6, COMP_LOOP_16_VEC_LOOP_C_7, COMP_LOOP_16_VEC_LOOP_C_8,
      COMP_LOOP_C_17, COMP_LOOP_17_VEC_LOOP_C_0, COMP_LOOP_17_VEC_LOOP_C_1, COMP_LOOP_17_VEC_LOOP_C_2,
      COMP_LOOP_17_VEC_LOOP_C_3, COMP_LOOP_17_VEC_LOOP_C_4, COMP_LOOP_17_VEC_LOOP_C_5,
      COMP_LOOP_17_VEC_LOOP_C_6, COMP_LOOP_17_VEC_LOOP_C_7, COMP_LOOP_17_VEC_LOOP_C_8,
      COMP_LOOP_C_18, COMP_LOOP_18_VEC_LOOP_C_0, COMP_LOOP_18_VEC_LOOP_C_1, COMP_LOOP_18_VEC_LOOP_C_2,
      COMP_LOOP_18_VEC_LOOP_C_3, COMP_LOOP_18_VEC_LOOP_C_4, COMP_LOOP_18_VEC_LOOP_C_5,
      COMP_LOOP_18_VEC_LOOP_C_6, COMP_LOOP_18_VEC_LOOP_C_7, COMP_LOOP_18_VEC_LOOP_C_8,
      COMP_LOOP_C_19, COMP_LOOP_19_VEC_LOOP_C_0, COMP_LOOP_19_VEC_LOOP_C_1, COMP_LOOP_19_VEC_LOOP_C_2,
      COMP_LOOP_19_VEC_LOOP_C_3, COMP_LOOP_19_VEC_LOOP_C_4, COMP_LOOP_19_VEC_LOOP_C_5,
      COMP_LOOP_19_VEC_LOOP_C_6, COMP_LOOP_19_VEC_LOOP_C_7, COMP_LOOP_19_VEC_LOOP_C_8,
      COMP_LOOP_C_20, COMP_LOOP_20_VEC_LOOP_C_0, COMP_LOOP_20_VEC_LOOP_C_1, COMP_LOOP_20_VEC_LOOP_C_2,
      COMP_LOOP_20_VEC_LOOP_C_3, COMP_LOOP_20_VEC_LOOP_C_4, COMP_LOOP_20_VEC_LOOP_C_5,
      COMP_LOOP_20_VEC_LOOP_C_6, COMP_LOOP_20_VEC_LOOP_C_7, COMP_LOOP_20_VEC_LOOP_C_8,
      COMP_LOOP_C_21, COMP_LOOP_21_VEC_LOOP_C_0, COMP_LOOP_21_VEC_LOOP_C_1, COMP_LOOP_21_VEC_LOOP_C_2,
      COMP_LOOP_21_VEC_LOOP_C_3, COMP_LOOP_21_VEC_LOOP_C_4, COMP_LOOP_21_VEC_LOOP_C_5,
      COMP_LOOP_21_VEC_LOOP_C_6, COMP_LOOP_21_VEC_LOOP_C_7, COMP_LOOP_21_VEC_LOOP_C_8,
      COMP_LOOP_C_22, COMP_LOOP_22_VEC_LOOP_C_0, COMP_LOOP_22_VEC_LOOP_C_1, COMP_LOOP_22_VEC_LOOP_C_2,
      COMP_LOOP_22_VEC_LOOP_C_3, COMP_LOOP_22_VEC_LOOP_C_4, COMP_LOOP_22_VEC_LOOP_C_5,
      COMP_LOOP_22_VEC_LOOP_C_6, COMP_LOOP_22_VEC_LOOP_C_7, COMP_LOOP_22_VEC_LOOP_C_8,
      COMP_LOOP_C_23, COMP_LOOP_23_VEC_LOOP_C_0, COMP_LOOP_23_VEC_LOOP_C_1, COMP_LOOP_23_VEC_LOOP_C_2,
      COMP_LOOP_23_VEC_LOOP_C_3, COMP_LOOP_23_VEC_LOOP_C_4, COMP_LOOP_23_VEC_LOOP_C_5,
      COMP_LOOP_23_VEC_LOOP_C_6, COMP_LOOP_23_VEC_LOOP_C_7, COMP_LOOP_23_VEC_LOOP_C_8,
      COMP_LOOP_C_24, COMP_LOOP_24_VEC_LOOP_C_0, COMP_LOOP_24_VEC_LOOP_C_1, COMP_LOOP_24_VEC_LOOP_C_2,
      COMP_LOOP_24_VEC_LOOP_C_3, COMP_LOOP_24_VEC_LOOP_C_4, COMP_LOOP_24_VEC_LOOP_C_5,
      COMP_LOOP_24_VEC_LOOP_C_6, COMP_LOOP_24_VEC_LOOP_C_7, COMP_LOOP_24_VEC_LOOP_C_8,
      COMP_LOOP_C_25, COMP_LOOP_25_VEC_LOOP_C_0, COMP_LOOP_25_VEC_LOOP_C_1, COMP_LOOP_25_VEC_LOOP_C_2,
      COMP_LOOP_25_VEC_LOOP_C_3, COMP_LOOP_25_VEC_LOOP_C_4, COMP_LOOP_25_VEC_LOOP_C_5,
      COMP_LOOP_25_VEC_LOOP_C_6, COMP_LOOP_25_VEC_LOOP_C_7, COMP_LOOP_25_VEC_LOOP_C_8,
      COMP_LOOP_C_26, COMP_LOOP_26_VEC_LOOP_C_0, COMP_LOOP_26_VEC_LOOP_C_1, COMP_LOOP_26_VEC_LOOP_C_2,
      COMP_LOOP_26_VEC_LOOP_C_3, COMP_LOOP_26_VEC_LOOP_C_4, COMP_LOOP_26_VEC_LOOP_C_5,
      COMP_LOOP_26_VEC_LOOP_C_6, COMP_LOOP_26_VEC_LOOP_C_7, COMP_LOOP_26_VEC_LOOP_C_8,
      COMP_LOOP_C_27, COMP_LOOP_27_VEC_LOOP_C_0, COMP_LOOP_27_VEC_LOOP_C_1, COMP_LOOP_27_VEC_LOOP_C_2,
      COMP_LOOP_27_VEC_LOOP_C_3, COMP_LOOP_27_VEC_LOOP_C_4, COMP_LOOP_27_VEC_LOOP_C_5,
      COMP_LOOP_27_VEC_LOOP_C_6, COMP_LOOP_27_VEC_LOOP_C_7, COMP_LOOP_27_VEC_LOOP_C_8,
      COMP_LOOP_C_28, COMP_LOOP_28_VEC_LOOP_C_0, COMP_LOOP_28_VEC_LOOP_C_1, COMP_LOOP_28_VEC_LOOP_C_2,
      COMP_LOOP_28_VEC_LOOP_C_3, COMP_LOOP_28_VEC_LOOP_C_4, COMP_LOOP_28_VEC_LOOP_C_5,
      COMP_LOOP_28_VEC_LOOP_C_6, COMP_LOOP_28_VEC_LOOP_C_7, COMP_LOOP_28_VEC_LOOP_C_8,
      COMP_LOOP_C_29, COMP_LOOP_29_VEC_LOOP_C_0, COMP_LOOP_29_VEC_LOOP_C_1, COMP_LOOP_29_VEC_LOOP_C_2,
      COMP_LOOP_29_VEC_LOOP_C_3, COMP_LOOP_29_VEC_LOOP_C_4, COMP_LOOP_29_VEC_LOOP_C_5,
      COMP_LOOP_29_VEC_LOOP_C_6, COMP_LOOP_29_VEC_LOOP_C_7, COMP_LOOP_29_VEC_LOOP_C_8,
      COMP_LOOP_C_30, COMP_LOOP_30_VEC_LOOP_C_0, COMP_LOOP_30_VEC_LOOP_C_1, COMP_LOOP_30_VEC_LOOP_C_2,
      COMP_LOOP_30_VEC_LOOP_C_3, COMP_LOOP_30_VEC_LOOP_C_4, COMP_LOOP_30_VEC_LOOP_C_5,
      COMP_LOOP_30_VEC_LOOP_C_6, COMP_LOOP_30_VEC_LOOP_C_7, COMP_LOOP_30_VEC_LOOP_C_8,
      COMP_LOOP_C_31, COMP_LOOP_31_VEC_LOOP_C_0, COMP_LOOP_31_VEC_LOOP_C_1, COMP_LOOP_31_VEC_LOOP_C_2,
      COMP_LOOP_31_VEC_LOOP_C_3, COMP_LOOP_31_VEC_LOOP_C_4, COMP_LOOP_31_VEC_LOOP_C_5,
      COMP_LOOP_31_VEC_LOOP_C_6, COMP_LOOP_31_VEC_LOOP_C_7, COMP_LOOP_31_VEC_LOOP_C_8,
      COMP_LOOP_C_32, COMP_LOOP_32_VEC_LOOP_C_0, COMP_LOOP_32_VEC_LOOP_C_1, COMP_LOOP_32_VEC_LOOP_C_2,
      COMP_LOOP_32_VEC_LOOP_C_3, COMP_LOOP_32_VEC_LOOP_C_4, COMP_LOOP_32_VEC_LOOP_C_5,
      COMP_LOOP_32_VEC_LOOP_C_6, COMP_LOOP_32_VEC_LOOP_C_7, COMP_LOOP_32_VEC_LOOP_C_8,
      COMP_LOOP_C_33, STAGE_LOOP_C_1, main_C_1, main_C_2);

  SIGNAL state_var : inPlaceNTT_DIT_precomp_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_precomp_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_precomp_core_core_fsm_1 : PROCESS (main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_2_tr0, COMP_LOOP_2_VEC_LOOP_C_8_tr0, COMP_LOOP_C_3_tr0, COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_4_tr0, COMP_LOOP_4_VEC_LOOP_C_8_tr0, COMP_LOOP_C_5_tr0, COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_6_tr0, COMP_LOOP_6_VEC_LOOP_C_8_tr0, COMP_LOOP_C_7_tr0, COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_8_tr0, COMP_LOOP_8_VEC_LOOP_C_8_tr0, COMP_LOOP_C_9_tr0, COMP_LOOP_9_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_10_tr0, COMP_LOOP_10_VEC_LOOP_C_8_tr0, COMP_LOOP_C_11_tr0, COMP_LOOP_11_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_12_tr0, COMP_LOOP_12_VEC_LOOP_C_8_tr0, COMP_LOOP_C_13_tr0, COMP_LOOP_13_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_14_tr0, COMP_LOOP_14_VEC_LOOP_C_8_tr0, COMP_LOOP_C_15_tr0, COMP_LOOP_15_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_16_tr0, COMP_LOOP_16_VEC_LOOP_C_8_tr0, COMP_LOOP_C_17_tr0, COMP_LOOP_17_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_18_tr0, COMP_LOOP_18_VEC_LOOP_C_8_tr0, COMP_LOOP_C_19_tr0, COMP_LOOP_19_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_20_tr0, COMP_LOOP_20_VEC_LOOP_C_8_tr0, COMP_LOOP_C_21_tr0, COMP_LOOP_21_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_22_tr0, COMP_LOOP_22_VEC_LOOP_C_8_tr0, COMP_LOOP_C_23_tr0, COMP_LOOP_23_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_24_tr0, COMP_LOOP_24_VEC_LOOP_C_8_tr0, COMP_LOOP_C_25_tr0, COMP_LOOP_25_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_26_tr0, COMP_LOOP_26_VEC_LOOP_C_8_tr0, COMP_LOOP_C_27_tr0, COMP_LOOP_27_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_28_tr0, COMP_LOOP_28_VEC_LOOP_C_8_tr0, COMP_LOOP_C_29_tr0, COMP_LOOP_29_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_30_tr0, COMP_LOOP_30_VEC_LOOP_C_8_tr0, COMP_LOOP_C_31_tr0, COMP_LOOP_31_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_32_tr0, COMP_LOOP_32_VEC_LOOP_C_8_tr0, COMP_LOOP_C_33_tr0, STAGE_LOOP_C_1_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000001");
        state_var_NS <= COMP_LOOP_C_0;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000010");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
      WHEN COMP_LOOP_1_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_1;
      WHEN COMP_LOOP_1_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000101");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_2;
      WHEN COMP_LOOP_1_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000110");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_3;
      WHEN COMP_LOOP_1_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000111");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_4;
      WHEN COMP_LOOP_1_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_5;
      WHEN COMP_LOOP_1_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001001");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_6;
      WHEN COMP_LOOP_1_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_7;
      WHEN COMP_LOOP_1_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_8;
      WHEN COMP_LOOP_1_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        IF ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        IF ( COMP_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_2_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_1;
      WHEN COMP_LOOP_2_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_2;
      WHEN COMP_LOOP_2_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_3;
      WHEN COMP_LOOP_2_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_4;
      WHEN COMP_LOOP_2_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_5;
      WHEN COMP_LOOP_2_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_6;
      WHEN COMP_LOOP_2_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_7;
      WHEN COMP_LOOP_2_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_8;
      WHEN COMP_LOOP_2_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        IF ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_3;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        IF ( COMP_LOOP_C_3_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_3_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_1;
      WHEN COMP_LOOP_3_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_2;
      WHEN COMP_LOOP_3_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_3;
      WHEN COMP_LOOP_3_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_4;
      WHEN COMP_LOOP_3_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_5;
      WHEN COMP_LOOP_3_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_6;
      WHEN COMP_LOOP_3_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_7;
      WHEN COMP_LOOP_3_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_8;
      WHEN COMP_LOOP_3_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        IF ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_4;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        IF ( COMP_LOOP_C_4_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_4_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_1;
      WHEN COMP_LOOP_4_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_2;
      WHEN COMP_LOOP_4_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_3;
      WHEN COMP_LOOP_4_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_4;
      WHEN COMP_LOOP_4_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_5;
      WHEN COMP_LOOP_4_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_6;
      WHEN COMP_LOOP_4_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_7;
      WHEN COMP_LOOP_4_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_8;
      WHEN COMP_LOOP_4_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        IF ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_5;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        IF ( COMP_LOOP_C_5_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_5_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_1;
      WHEN COMP_LOOP_5_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_2;
      WHEN COMP_LOOP_5_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_3;
      WHEN COMP_LOOP_5_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_4;
      WHEN COMP_LOOP_5_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_5;
      WHEN COMP_LOOP_5_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_6;
      WHEN COMP_LOOP_5_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_7;
      WHEN COMP_LOOP_5_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_8;
      WHEN COMP_LOOP_5_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        IF ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_6;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        IF ( COMP_LOOP_C_6_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_6_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_1;
      WHEN COMP_LOOP_6_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_2;
      WHEN COMP_LOOP_6_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_3;
      WHEN COMP_LOOP_6_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_4;
      WHEN COMP_LOOP_6_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_5;
      WHEN COMP_LOOP_6_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_6;
      WHEN COMP_LOOP_6_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_7;
      WHEN COMP_LOOP_6_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_8;
      WHEN COMP_LOOP_6_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        IF ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_7;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        IF ( COMP_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_7_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_1;
      WHEN COMP_LOOP_7_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_2;
      WHEN COMP_LOOP_7_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_3;
      WHEN COMP_LOOP_7_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_4;
      WHEN COMP_LOOP_7_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_5;
      WHEN COMP_LOOP_7_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_6;
      WHEN COMP_LOOP_7_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_7;
      WHEN COMP_LOOP_7_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_8;
      WHEN COMP_LOOP_7_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        IF ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_8;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        IF ( COMP_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_8_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_1;
      WHEN COMP_LOOP_8_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_2;
      WHEN COMP_LOOP_8_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_3;
      WHEN COMP_LOOP_8_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_4;
      WHEN COMP_LOOP_8_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_5;
      WHEN COMP_LOOP_8_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_6;
      WHEN COMP_LOOP_8_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_7;
      WHEN COMP_LOOP_8_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_8;
      WHEN COMP_LOOP_8_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        IF ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        IF ( COMP_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_9_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_1;
      WHEN COMP_LOOP_9_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_2;
      WHEN COMP_LOOP_9_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_3;
      WHEN COMP_LOOP_9_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_4;
      WHEN COMP_LOOP_9_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_5;
      WHEN COMP_LOOP_9_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_6;
      WHEN COMP_LOOP_9_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_7;
      WHEN COMP_LOOP_9_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_8;
      WHEN COMP_LOOP_9_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        IF ( COMP_LOOP_9_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_10;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        IF ( COMP_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_10_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_1;
      WHEN COMP_LOOP_10_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_2;
      WHEN COMP_LOOP_10_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_3;
      WHEN COMP_LOOP_10_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_4;
      WHEN COMP_LOOP_10_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_5;
      WHEN COMP_LOOP_10_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_6;
      WHEN COMP_LOOP_10_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_7;
      WHEN COMP_LOOP_10_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_8;
      WHEN COMP_LOOP_10_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        IF ( COMP_LOOP_10_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_11;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        IF ( COMP_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_11_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_1;
      WHEN COMP_LOOP_11_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_2;
      WHEN COMP_LOOP_11_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_3;
      WHEN COMP_LOOP_11_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_4;
      WHEN COMP_LOOP_11_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_5;
      WHEN COMP_LOOP_11_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_6;
      WHEN COMP_LOOP_11_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_7;
      WHEN COMP_LOOP_11_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_8;
      WHEN COMP_LOOP_11_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        IF ( COMP_LOOP_11_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_12;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        IF ( COMP_LOOP_C_12_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_12_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_1;
      WHEN COMP_LOOP_12_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_2;
      WHEN COMP_LOOP_12_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_3;
      WHEN COMP_LOOP_12_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_4;
      WHEN COMP_LOOP_12_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_5;
      WHEN COMP_LOOP_12_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_6;
      WHEN COMP_LOOP_12_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_7;
      WHEN COMP_LOOP_12_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_8;
      WHEN COMP_LOOP_12_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        IF ( COMP_LOOP_12_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_13;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        IF ( COMP_LOOP_C_13_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_13_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_1;
      WHEN COMP_LOOP_13_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_2;
      WHEN COMP_LOOP_13_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_3;
      WHEN COMP_LOOP_13_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_4;
      WHEN COMP_LOOP_13_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_5;
      WHEN COMP_LOOP_13_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_6;
      WHEN COMP_LOOP_13_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_7;
      WHEN COMP_LOOP_13_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_8;
      WHEN COMP_LOOP_13_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        IF ( COMP_LOOP_13_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_14;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        IF ( COMP_LOOP_C_14_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_14_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_1;
      WHEN COMP_LOOP_14_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_2;
      WHEN COMP_LOOP_14_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_3;
      WHEN COMP_LOOP_14_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_4;
      WHEN COMP_LOOP_14_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_5;
      WHEN COMP_LOOP_14_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_6;
      WHEN COMP_LOOP_14_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_7;
      WHEN COMP_LOOP_14_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_8;
      WHEN COMP_LOOP_14_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        IF ( COMP_LOOP_14_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_15;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        IF ( COMP_LOOP_C_15_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_15_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_1;
      WHEN COMP_LOOP_15_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_2;
      WHEN COMP_LOOP_15_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_3;
      WHEN COMP_LOOP_15_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_4;
      WHEN COMP_LOOP_15_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_5;
      WHEN COMP_LOOP_15_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_6;
      WHEN COMP_LOOP_15_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_7;
      WHEN COMP_LOOP_15_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_8;
      WHEN COMP_LOOP_15_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        IF ( COMP_LOOP_15_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_16;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        IF ( COMP_LOOP_C_16_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_16_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_1;
      WHEN COMP_LOOP_16_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_2;
      WHEN COMP_LOOP_16_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_3;
      WHEN COMP_LOOP_16_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_4;
      WHEN COMP_LOOP_16_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_5;
      WHEN COMP_LOOP_16_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_6;
      WHEN COMP_LOOP_16_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_7;
      WHEN COMP_LOOP_16_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_8;
      WHEN COMP_LOOP_16_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        IF ( COMP_LOOP_16_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_17;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        IF ( COMP_LOOP_C_17_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_17_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_1;
      WHEN COMP_LOOP_17_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_2;
      WHEN COMP_LOOP_17_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_3;
      WHEN COMP_LOOP_17_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_4;
      WHEN COMP_LOOP_17_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_5;
      WHEN COMP_LOOP_17_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_6;
      WHEN COMP_LOOP_17_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_7;
      WHEN COMP_LOOP_17_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_8;
      WHEN COMP_LOOP_17_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        IF ( COMP_LOOP_17_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_18;
        ELSE
          state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        IF ( COMP_LOOP_C_18_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_18_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_1;
      WHEN COMP_LOOP_18_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_2;
      WHEN COMP_LOOP_18_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_3;
      WHEN COMP_LOOP_18_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_4;
      WHEN COMP_LOOP_18_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_5;
      WHEN COMP_LOOP_18_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_6;
      WHEN COMP_LOOP_18_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_7;
      WHEN COMP_LOOP_18_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_8;
      WHEN COMP_LOOP_18_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        IF ( COMP_LOOP_18_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_19;
        ELSE
          state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        IF ( COMP_LOOP_C_19_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_19_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_1;
      WHEN COMP_LOOP_19_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_2;
      WHEN COMP_LOOP_19_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_3;
      WHEN COMP_LOOP_19_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_4;
      WHEN COMP_LOOP_19_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_5;
      WHEN COMP_LOOP_19_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_6;
      WHEN COMP_LOOP_19_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_7;
      WHEN COMP_LOOP_19_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_8;
      WHEN COMP_LOOP_19_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        IF ( COMP_LOOP_19_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_20;
        ELSE
          state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        IF ( COMP_LOOP_C_20_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_20_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_1;
      WHEN COMP_LOOP_20_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_2;
      WHEN COMP_LOOP_20_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_3;
      WHEN COMP_LOOP_20_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_4;
      WHEN COMP_LOOP_20_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_5;
      WHEN COMP_LOOP_20_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_6;
      WHEN COMP_LOOP_20_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_7;
      WHEN COMP_LOOP_20_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_8;
      WHEN COMP_LOOP_20_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        IF ( COMP_LOOP_20_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_21;
        ELSE
          state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        IF ( COMP_LOOP_C_21_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_21_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_1;
      WHEN COMP_LOOP_21_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_2;
      WHEN COMP_LOOP_21_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_3;
      WHEN COMP_LOOP_21_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_4;
      WHEN COMP_LOOP_21_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_5;
      WHEN COMP_LOOP_21_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_6;
      WHEN COMP_LOOP_21_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_7;
      WHEN COMP_LOOP_21_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_8;
      WHEN COMP_LOOP_21_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        IF ( COMP_LOOP_21_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_22;
        ELSE
          state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        IF ( COMP_LOOP_C_22_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_22_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_1;
      WHEN COMP_LOOP_22_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_2;
      WHEN COMP_LOOP_22_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_3;
      WHEN COMP_LOOP_22_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_4;
      WHEN COMP_LOOP_22_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_5;
      WHEN COMP_LOOP_22_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_6;
      WHEN COMP_LOOP_22_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_7;
      WHEN COMP_LOOP_22_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_8;
      WHEN COMP_LOOP_22_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        IF ( COMP_LOOP_22_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_23;
        ELSE
          state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        IF ( COMP_LOOP_C_23_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_23_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_1;
      WHEN COMP_LOOP_23_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_2;
      WHEN COMP_LOOP_23_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_3;
      WHEN COMP_LOOP_23_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_4;
      WHEN COMP_LOOP_23_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_5;
      WHEN COMP_LOOP_23_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_6;
      WHEN COMP_LOOP_23_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_7;
      WHEN COMP_LOOP_23_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_8;
      WHEN COMP_LOOP_23_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        IF ( COMP_LOOP_23_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_24;
        ELSE
          state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        IF ( COMP_LOOP_C_24_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_24_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_1;
      WHEN COMP_LOOP_24_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_2;
      WHEN COMP_LOOP_24_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_3;
      WHEN COMP_LOOP_24_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_4;
      WHEN COMP_LOOP_24_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_5;
      WHEN COMP_LOOP_24_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_6;
      WHEN COMP_LOOP_24_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_7;
      WHEN COMP_LOOP_24_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_8;
      WHEN COMP_LOOP_24_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        IF ( COMP_LOOP_24_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_25;
        ELSE
          state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        IF ( COMP_LOOP_C_25_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_25_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_1;
      WHEN COMP_LOOP_25_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_2;
      WHEN COMP_LOOP_25_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_3;
      WHEN COMP_LOOP_25_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_4;
      WHEN COMP_LOOP_25_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_5;
      WHEN COMP_LOOP_25_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_6;
      WHEN COMP_LOOP_25_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_7;
      WHEN COMP_LOOP_25_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_8;
      WHEN COMP_LOOP_25_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        IF ( COMP_LOOP_25_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_26;
        ELSE
          state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        IF ( COMP_LOOP_C_26_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_26_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_1;
      WHEN COMP_LOOP_26_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_2;
      WHEN COMP_LOOP_26_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_3;
      WHEN COMP_LOOP_26_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_4;
      WHEN COMP_LOOP_26_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_5;
      WHEN COMP_LOOP_26_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_6;
      WHEN COMP_LOOP_26_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_7;
      WHEN COMP_LOOP_26_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_8;
      WHEN COMP_LOOP_26_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        IF ( COMP_LOOP_26_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_27;
        ELSE
          state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        IF ( COMP_LOOP_C_27_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_27_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_1;
      WHEN COMP_LOOP_27_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_2;
      WHEN COMP_LOOP_27_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_3;
      WHEN COMP_LOOP_27_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_4;
      WHEN COMP_LOOP_27_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_5;
      WHEN COMP_LOOP_27_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_6;
      WHEN COMP_LOOP_27_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_7;
      WHEN COMP_LOOP_27_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_8;
      WHEN COMP_LOOP_27_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        IF ( COMP_LOOP_27_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_28;
        ELSE
          state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        IF ( COMP_LOOP_C_28_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_28_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_1;
      WHEN COMP_LOOP_28_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_2;
      WHEN COMP_LOOP_28_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_3;
      WHEN COMP_LOOP_28_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_4;
      WHEN COMP_LOOP_28_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_5;
      WHEN COMP_LOOP_28_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_6;
      WHEN COMP_LOOP_28_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_7;
      WHEN COMP_LOOP_28_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_8;
      WHEN COMP_LOOP_28_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        IF ( COMP_LOOP_28_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_29;
        ELSE
          state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        IF ( COMP_LOOP_C_29_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_29_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_1;
      WHEN COMP_LOOP_29_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_2;
      WHEN COMP_LOOP_29_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_3;
      WHEN COMP_LOOP_29_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_4;
      WHEN COMP_LOOP_29_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_5;
      WHEN COMP_LOOP_29_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_6;
      WHEN COMP_LOOP_29_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_7;
      WHEN COMP_LOOP_29_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_8;
      WHEN COMP_LOOP_29_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        IF ( COMP_LOOP_29_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_30;
        ELSE
          state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        IF ( COMP_LOOP_C_30_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_30_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_1;
      WHEN COMP_LOOP_30_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_2;
      WHEN COMP_LOOP_30_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_3;
      WHEN COMP_LOOP_30_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_4;
      WHEN COMP_LOOP_30_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_5;
      WHEN COMP_LOOP_30_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_6;
      WHEN COMP_LOOP_30_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_7;
      WHEN COMP_LOOP_30_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_8;
      WHEN COMP_LOOP_30_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        IF ( COMP_LOOP_30_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_31;
        ELSE
          state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        IF ( COMP_LOOP_C_31_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_31_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_1;
      WHEN COMP_LOOP_31_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_2;
      WHEN COMP_LOOP_31_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_3;
      WHEN COMP_LOOP_31_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_4;
      WHEN COMP_LOOP_31_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_5;
      WHEN COMP_LOOP_31_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_6;
      WHEN COMP_LOOP_31_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_7;
      WHEN COMP_LOOP_31_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_8;
      WHEN COMP_LOOP_31_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        IF ( COMP_LOOP_31_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_32;
        ELSE
          state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        IF ( COMP_LOOP_C_32_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_32_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_1;
      WHEN COMP_LOOP_32_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_2;
      WHEN COMP_LOOP_32_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_3;
      WHEN COMP_LOOP_32_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_4;
      WHEN COMP_LOOP_32_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_5;
      WHEN COMP_LOOP_32_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_6;
      WHEN COMP_LOOP_32_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_7;
      WHEN COMP_LOOP_32_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_8;
      WHEN COMP_LOOP_32_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        IF ( COMP_LOOP_32_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_33;
        ELSE
          state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        IF ( COMP_LOOP_C_33_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000");
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

END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_staller IS
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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  r_rsc_triosy_obj_ld_core_sct <= r_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  p_rsc_triosy_obj_ld_core_sct <= p_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  vec_rsc_triosy_obj_ld_core_sct <= vec_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp IS
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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl IS
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
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_biwt : IN STD_LOGIC;
    twiddle_h_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
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
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_core(13 DOWNTO 0);
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
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
END v1;

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
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_biwt : IN STD_LOGIC;
    twiddle_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
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
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_core(13 DOWNTO 0);
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
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
END v1;

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
    ensig_cgo_iro_2 : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_2 : IN STD_LOGIC;
    COMP_LOOP_1_mult_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_wait_dp;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  COMP_LOOP_1_mult_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo_2 OR ensig_cgo_iro_2);
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp IS
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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_complete_rsci IS
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
      rscid => 18
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
END v1;

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
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_mxwt_pconst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_reg : STD_LOGIC_VECTOR (13 DOWNTO 0);

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
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_biwt : IN STD_LOGIC;
      twiddle_h_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d
      : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core
      : STD_LOGIC_VECTOR (27 DOWNTO 0);
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
      <= STD_LOGIC_VECTOR'( "00000000000000") & (twiddle_h_rsci_adra_d_core(13 DOWNTO
      0));
  twiddle_h_rsci_qa_d_mxwt_pconst <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt;

  twiddle_h_rsci_qa_d_mxwt <= twiddle_h_rsci_qa_d_mxwt_pconst;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_reg;
END v1;

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
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_mxwt_pconst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_reg : STD_LOGIC_VECTOR (13 DOWNTO 0);

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
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_biwt : IN STD_LOGIC;
      twiddle_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d
      : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core
      : STD_LOGIC_VECTOR (27 DOWNTO 0);
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
      <= STD_LOGIC_VECTOR'( "00000000000000") & (twiddle_rsci_adra_d_core(13 DOWNTO
      0));
  twiddle_rsci_qa_d_mxwt_pconst <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt;

  twiddle_rsci_qa_d_mxwt <= twiddle_rsci_qa_d_mxwt_pconst;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_reg;
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1 IS
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
END v1;

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

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core_run_rsci IS
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
      rscid => 12
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
END v1;

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
    vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0)
  );
END inPlaceNTT_DIT_precomp_core;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp_core IS
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
  SIGNAL COMP_LOOP_1_mult_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL or_dcpl_138 : STD_LOGIC;
  SIGNAL or_dcpl_139 : STD_LOGIC;
  SIGNAL or_dcpl_141 : STD_LOGIC;
  SIGNAL or_dcpl_142 : STD_LOGIC;
  SIGNAL or_tmp_59 : STD_LOGIC;
  SIGNAL nand_tmp_1 : STD_LOGIC;
  SIGNAL or_tmp_61 : STD_LOGIC;
  SIGNAL mux_tmp_111 : STD_LOGIC;
  SIGNAL mux_tmp_112 : STD_LOGIC;
  SIGNAL or_tmp_63 : STD_LOGIC;
  SIGNAL or_tmp_64 : STD_LOGIC;
  SIGNAL mux_tmp_113 : STD_LOGIC;
  SIGNAL mux_tmp_114 : STD_LOGIC;
  SIGNAL mux_tmp_116 : STD_LOGIC;
  SIGNAL or_tmp_67 : STD_LOGIC;
  SIGNAL mux_tmp_117 : STD_LOGIC;
  SIGNAL mux_tmp_118 : STD_LOGIC;
  SIGNAL mux_tmp_123 : STD_LOGIC;
  SIGNAL or_tmp_70 : STD_LOGIC;
  SIGNAL or_tmp_71 : STD_LOGIC;
  SIGNAL or_tmp_72 : STD_LOGIC;
  SIGNAL or_tmp_74 : STD_LOGIC;
  SIGNAL or_tmp_75 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL mux_tmp_150 : STD_LOGIC;
  SIGNAL mux_tmp_155 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL or_tmp_85 : STD_LOGIC;
  SIGNAL mux_tmp_162 : STD_LOGIC;
  SIGNAL or_tmp_86 : STD_LOGIC;
  SIGNAL or_tmp_89 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL mux_tmp_166 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL or_tmp_94 : STD_LOGIC;
  SIGNAL or_tmp_95 : STD_LOGIC;
  SIGNAL mux_tmp_173 : STD_LOGIC;
  SIGNAL or_tmp_97 : STD_LOGIC;
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL mux_tmp_176 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL nor_tmp_24 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_93 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL and_dcpl_102 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL mux_tmp_186 : STD_LOGIC;
  SIGNAL mux_tmp_187 : STD_LOGIC;
  SIGNAL or_tmp_126 : STD_LOGIC;
  SIGNAL mux_tmp_206 : STD_LOGIC;
  SIGNAL mux_tmp_210 : STD_LOGIC;
  SIGNAL mux_tmp_212 : STD_LOGIC;
  SIGNAL mux_tmp_215 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL mux_tmp_230 : STD_LOGIC;
  SIGNAL or_tmp_164 : STD_LOGIC;
  SIGNAL or_tmp_165 : STD_LOGIC;
  SIGNAL mux_tmp_263 : STD_LOGIC;
  SIGNAL nand_tmp_6 : STD_LOGIC;
  SIGNAL or_tmp_168 : STD_LOGIC;
  SIGNAL mux_tmp_266 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL mux_tmp_268 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL or_tmp_184 : STD_LOGIC;
  SIGNAL not_tmp_150 : STD_LOGIC;
  SIGNAL mux_tmp_298 : STD_LOGIC;
  SIGNAL or_tmp_186 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL mux_tmp_315 : STD_LOGIC;
  SIGNAL mux_tmp_319 : STD_LOGIC;
  SIGNAL or_tmp_209 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL or_tmp_213 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL mux_tmp_346 : STD_LOGIC;
  SIGNAL mux_tmp_347 : STD_LOGIC;
  SIGNAL or_tmp_217 : STD_LOGIC;
  SIGNAL mux_tmp_348 : STD_LOGIC;
  SIGNAL mux_tmp_350 : STD_LOGIC;
  SIGNAL mux_tmp_351 : STD_LOGIC;
  SIGNAL mux_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_379 : STD_LOGIC;
  SIGNAL or_tmp_233 : STD_LOGIC;
  SIGNAL or_tmp_234 : STD_LOGIC;
  SIGNAL or_tmp_278 : STD_LOGIC;
  SIGNAL mux_tmp_460 : STD_LOGIC;
  SIGNAL mux_tmp_461 : STD_LOGIC;
  SIGNAL mux_tmp_499 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL mux_tmp_516 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL VEC_LOOP_j_10_14_0_sva_1 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL or_284_cse : STD_LOGIC;
  SIGNAL or_291_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_2_cse : STD_LOGIC;
  SIGNAL or_193_cse : STD_LOGIC;
  SIGNAL and_231_cse : STD_LOGIC;
  SIGNAL nor_62_cse : STD_LOGIC;
  SIGNAL or_228_cse : STD_LOGIC;
  SIGNAL or_204_cse : STD_LOGIC;
  SIGNAL nor_27_cse : STD_LOGIC;
  SIGNAL or_516_cse : STD_LOGIC;
  SIGNAL or_502_cse : STD_LOGIC;
  SIGNAL or_278_cse : STD_LOGIC;
  SIGNAL mux_238_cse : STD_LOGIC;
  SIGNAL mux_235_cse : STD_LOGIC;
  SIGNAL mux_236_cse : STD_LOGIC;
  SIGNAL mux_232_cse : STD_LOGIC;
  SIGNAL mux_130_cse : STD_LOGIC;
  SIGNAL mux_199_cse : STD_LOGIC;
  SIGNAL mux_548_cse : STD_LOGIC;
  SIGNAL mux_184_cse : STD_LOGIC;
  SIGNAL mux_185_cse : STD_LOGIC;
  SIGNAL mux_190_cse : STD_LOGIC;
  SIGNAL mux_138_cse : STD_LOGIC;
  SIGNAL mux_291_cse : STD_LOGIC;
  SIGNAL mux_287_cse : STD_LOGIC;
  SIGNAL nand_5_cse : STD_LOGIC;
  SIGNAL mux_188_cse : STD_LOGIC;
  SIGNAL mux_368_cse : STD_LOGIC;
  SIGNAL nand_4_cse : STD_LOGIC;
  SIGNAL or_268_cse : STD_LOGIC;
  SIGNAL mux_233_cse : STD_LOGIC;
  SIGNAL mux_141_cse : STD_LOGIC;
  SIGNAL mux_191_cse : STD_LOGIC;
  SIGNAL mux_241_cse : STD_LOGIC;
  SIGNAL mux_231_cse : STD_LOGIC;
  SIGNAL mux_142_cse : STD_LOGIC;
  SIGNAL mux_292_cse : STD_LOGIC;
  SIGNAL mux_139_cse : STD_LOGIC;
  SIGNAL mux_196_cse : STD_LOGIC;
  SIGNAL mux_201_cse : STD_LOGIC;
  SIGNAL mux_372_cse : STD_LOGIC;
  SIGNAL mux_338_cse : STD_LOGIC;
  SIGNAL mux_140_cse : STD_LOGIC;
  SIGNAL mux_336_cse : STD_LOGIC;
  SIGNAL mux_143_cse : STD_LOGIC;
  SIGNAL mux_198_cse : STD_LOGIC;
  SIGNAL mux_204_cse : STD_LOGIC;
  SIGNAL mux_294_cse : STD_LOGIC;
  SIGNAL nor_87_cse : STD_LOGIC;
  SIGNAL vec_rsci_da_d_reg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_reg : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_adra_d_reg : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_144_rmff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_30_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_58_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_113_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_161_rmff : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL nor_82_rmff : STD_LOGIC;
  SIGNAL twiddle_h_rsci_adra_d_reg : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL factor1_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_mult_vec_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_1_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_129_itm : STD_LOGIC;
  SIGNAL mux_325_itm : STD_LOGIC;
  SIGNAL mux_359_itm : STD_LOGIC;
  SIGNAL mux_161_itm : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_204 : STD_LOGIC;
  SIGNAL and_dcpl_205 : STD_LOGIC;
  SIGNAL and_dcpl_206 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_208 : STD_LOGIC;
  SIGNAL and_dcpl_209 : STD_LOGIC;
  SIGNAL and_dcpl_210 : STD_LOGIC;
  SIGNAL and_dcpl_211 : STD_LOGIC;
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_213 : STD_LOGIC;
  SIGNAL and_dcpl_215 : STD_LOGIC;
  SIGNAL and_dcpl_216 : STD_LOGIC;
  SIGNAL and_dcpl_217 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_219 : STD_LOGIC;
  SIGNAL and_dcpl_220 : STD_LOGIC;
  SIGNAL and_dcpl_221 : STD_LOGIC;
  SIGNAL and_dcpl_222 : STD_LOGIC;
  SIGNAL and_dcpl_223 : STD_LOGIC;
  SIGNAL and_dcpl_224 : STD_LOGIC;
  SIGNAL and_dcpl_226 : STD_LOGIC;
  SIGNAL and_dcpl_227 : STD_LOGIC;
  SIGNAL and_dcpl_228 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL and_dcpl_230 : STD_LOGIC;
  SIGNAL and_dcpl_231 : STD_LOGIC;
  SIGNAL and_dcpl_233 : STD_LOGIC;
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_235 : STD_LOGIC;
  SIGNAL and_dcpl_236 : STD_LOGIC;
  SIGNAL and_dcpl_238 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_241 : STD_LOGIC;
  SIGNAL and_dcpl_242 : STD_LOGIC;
  SIGNAL and_dcpl_243 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_245 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_248 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_250 : STD_LOGIC;
  SIGNAL and_dcpl_251 : STD_LOGIC;
  SIGNAL and_dcpl_253 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_256 : STD_LOGIC;
  SIGNAL and_dcpl_257 : STD_LOGIC;
  SIGNAL and_dcpl_258 : STD_LOGIC;
  SIGNAL and_dcpl_259 : STD_LOGIC;
  SIGNAL and_dcpl_260 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_263 : STD_LOGIC;
  SIGNAL and_dcpl_264 : STD_LOGIC;
  SIGNAL and_dcpl_265 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_269 : STD_LOGIC;
  SIGNAL and_dcpl_270 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_273 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL and_dcpl_275 : STD_LOGIC;
  SIGNAL and_dcpl_277 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_328 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_334 : STD_LOGIC;
  SIGNAL and_dcpl_335 : STD_LOGIC;
  SIGNAL and_dcpl_336 : STD_LOGIC;
  SIGNAL mux_tmp_559 : STD_LOGIC;
  SIGNAL mux_tmp_561 : STD_LOGIC;
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL and_dcpl_338 : STD_LOGIC;
  SIGNAL and_dcpl_340 : STD_LOGIC;
  SIGNAL and_dcpl_344 : STD_LOGIC;
  SIGNAL and_dcpl_345 : STD_LOGIC;
  SIGNAL and_dcpl_347 : STD_LOGIC;
  SIGNAL and_dcpl_352 : STD_LOGIC;
  SIGNAL and_dcpl_353 : STD_LOGIC;
  SIGNAL and_dcpl_354 : STD_LOGIC;
  SIGNAL and_dcpl_355 : STD_LOGIC;
  SIGNAL and_dcpl_358 : STD_LOGIC;
  SIGNAL and_dcpl_359 : STD_LOGIC;
  SIGNAL and_dcpl_361 : STD_LOGIC;
  SIGNAL and_dcpl_363 : STD_LOGIC;
  SIGNAL and_dcpl_366 : STD_LOGIC;
  SIGNAL and_dcpl_367 : STD_LOGIC;
  SIGNAL and_dcpl_368 : STD_LOGIC;
  SIGNAL and_dcpl_369 : STD_LOGIC;
  SIGNAL and_dcpl_371 : STD_LOGIC;
  SIGNAL and_dcpl_373 : STD_LOGIC;
  SIGNAL and_dcpl_374 : STD_LOGIC;
  SIGNAL and_dcpl_375 : STD_LOGIC;
  SIGNAL and_dcpl_376 : STD_LOGIC;
  SIGNAL and_dcpl_377 : STD_LOGIC;
  SIGNAL and_dcpl_379 : STD_LOGIC;
  SIGNAL and_dcpl_380 : STD_LOGIC;
  SIGNAL and_dcpl_381 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL and_dcpl_384 : STD_LOGIC;
  SIGNAL and_dcpl_385 : STD_LOGIC;
  SIGNAL and_dcpl_386 : STD_LOGIC;
  SIGNAL and_dcpl_387 : STD_LOGIC;
  SIGNAL and_dcpl_388 : STD_LOGIC;
  SIGNAL and_dcpl_390 : STD_LOGIC;
  SIGNAL and_dcpl_392 : STD_LOGIC;
  SIGNAL and_dcpl_393 : STD_LOGIC;
  SIGNAL and_dcpl_394 : STD_LOGIC;
  SIGNAL and_dcpl_395 : STD_LOGIC;
  SIGNAL and_dcpl_396 : STD_LOGIC;
  SIGNAL and_dcpl_397 : STD_LOGIC;
  SIGNAL and_dcpl_398 : STD_LOGIC;
  SIGNAL and_dcpl_399 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL and_dcpl_410 : STD_LOGIC;
  SIGNAL and_dcpl_420 : STD_LOGIC;
  SIGNAL and_dcpl_431 : STD_LOGIC;
  SIGNAL and_dcpl_440 : STD_LOGIC;
  SIGNAL and_dcpl_446 : STD_LOGIC;
  SIGNAL and_dcpl_455 : STD_LOGIC;
  SIGNAL and_dcpl_460 : STD_LOGIC;
  SIGNAL and_dcpl_475 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_500 : STD_LOGIC;
  SIGNAL and_dcpl_567 : STD_LOGIC;
  SIGNAL and_dcpl_569 : STD_LOGIC;
  SIGNAL and_dcpl_570 : STD_LOGIC;
  SIGNAL and_dcpl_571 : STD_LOGIC;
  SIGNAL and_dcpl_572 : STD_LOGIC;
  SIGNAL and_dcpl_573 : STD_LOGIC;
  SIGNAL and_dcpl_574 : STD_LOGIC;
  SIGNAL and_dcpl_575 : STD_LOGIC;
  SIGNAL and_dcpl_576 : STD_LOGIC;
  SIGNAL and_dcpl_577 : STD_LOGIC;
  SIGNAL and_dcpl_578 : STD_LOGIC;
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_j_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_k_14_5_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_j_1_sva_mx0c0 : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_ssc : STD_LOGIC;
  SIGNAL VEC_LOOP_or_6_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_7_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_12_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_16_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_17_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_26_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_9_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_10_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_32_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_35_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_19_cse : STD_LOGIC;
  SIGNAL nor_97_cse : STD_LOGIC;
  SIGNAL nand_27_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_cse : STD_LOGIC;
  SIGNAL and_474_cse : STD_LOGIC;
  SIGNAL and_492_cse : STD_LOGIC;
  SIGNAL and_506_cse : STD_LOGIC;
  SIGNAL and_518_cse : STD_LOGIC;
  SIGNAL and_521_cse : STD_LOGIC;
  SIGNAL and_524_cse : STD_LOGIC;
  SIGNAL and_463_cse : STD_LOGIC;
  SIGNAL and_486_cse : STD_LOGIC;
  SIGNAL and_500_cse : STD_LOGIC;
  SIGNAL and_516_cse : STD_LOGIC;
  SIGNAL and_523_cse : STD_LOGIC;
  SIGNAL and_519_cse : STD_LOGIC;
  SIGNAL mux_169_cse : STD_LOGIC;
  SIGNAL mux_167_cse : STD_LOGIC;
  SIGNAL and_497_cse : STD_LOGIC;
  SIGNAL and_468_cse : STD_LOGIC;
  SIGNAL and_481_cse : STD_LOGIC;
  SIGNAL and_484_cse : STD_LOGIC;
  SIGNAL and_488_cse : STD_LOGIC;
  SIGNAL and_495_cse : STD_LOGIC;
  SIGNAL and_498_cse : STD_LOGIC;
  SIGNAL and_503_cse : STD_LOGIC;
  SIGNAL and_509_cse : STD_LOGIC;
  SIGNAL and_512_cse : STD_LOGIC;
  SIGNAL and_479_cse : STD_LOGIC;
  SIGNAL and_494_cse : STD_LOGIC;
  SIGNAL and_508_cse : STD_LOGIC;
  SIGNAL and_470_cse : STD_LOGIC;
  SIGNAL and_489_cse : STD_LOGIC;
  SIGNAL and_504_cse : STD_LOGIC;
  SIGNAL and_483_cse : STD_LOGIC;
  SIGNAL and_511_cse : STD_LOGIC;
  SIGNAL or_tmp : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL nand_tmp : STD_LOGIC;
  SIGNAL nor_tmp_42 : STD_LOGIC;
  SIGNAL or_tmp_369 : STD_LOGIC;
  SIGNAL mux_tmp_587 : STD_LOGIC;
  SIGNAL mux_tmp_588 : STD_LOGIC;
  SIGNAL mux_tmp_589 : STD_LOGIC;
  SIGNAL or_tmp_373 : STD_LOGIC;
  SIGNAL mux_tmp_590 : STD_LOGIC;
  SIGNAL mux_tmp_593 : STD_LOGIC;
  SIGNAL mux_tmp_594 : STD_LOGIC;
  SIGNAL mux_tmp_597 : STD_LOGIC;
  SIGNAL or_tmp_375 : STD_LOGIC;
  SIGNAL or_tmp_376 : STD_LOGIC;
  SIGNAL or_tmp_377 : STD_LOGIC;
  SIGNAL mux_tmp_608 : STD_LOGIC;
  SIGNAL or_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_609 : STD_LOGIC;
  SIGNAL or_tmp_379 : STD_LOGIC;
  SIGNAL mux_tmp_610 : STD_LOGIC;
  SIGNAL not_tmp_311 : STD_LOGIC;
  SIGNAL nand_tmp_19 : STD_LOGIC;
  SIGNAL nor_tmp_47 : STD_LOGIC;
  SIGNAL mux_tmp_617 : STD_LOGIC;
  SIGNAL VEC_LOOP_and_4_rgt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL nand_tmp_22 : STD_LOGIC;
  SIGNAL mux_tmp_661 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_12_psp_sva_12 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_12_psp_sva_11 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_12_psp_sva_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_173_cse : STD_LOGIC;
  SIGNAL reg_VEC_LOOP_acc_1_reg : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_VEC_LOOP_acc_1_1_reg : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL or_573_cse : STD_LOGIC;
  SIGNAL or_571_cse : STD_LOGIC;
  SIGNAL nor_44_cse_1 : STD_LOGIC;
  SIGNAL or_539_cse : STD_LOGIC;
  SIGNAL or_247_cse : STD_LOGIC;
  SIGNAL nand_52_cse : STD_LOGIC;
  SIGNAL mux_649_cse : STD_LOGIC;
  SIGNAL mux_654_cse : STD_LOGIC;
  SIGNAL or_564_cse : STD_LOGIC;
  SIGNAL mux_633_cse : STD_LOGIC;
  SIGNAL or_442_cse : STD_LOGIC;
  SIGNAL nand_47_cse : STD_LOGIC;
  SIGNAL mux_468_cse : STD_LOGIC;
  SIGNAL mux_637_cse : STD_LOGIC;
  SIGNAL mux_639_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_1_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_21_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_2_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_23_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_3_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_28_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_39_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_40_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_nor_3_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_51_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_nor_12_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_40_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_43_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_54_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_62_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_66_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_67_itm : STD_LOGIC;

  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL or_212_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL or_266_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL or_317_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL or_316_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL or_315_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_30_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_58_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_89_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL and_161_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL nand_7_nl : STD_LOGIC;
  SIGNAL or_336_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL mux_300_nl : STD_LOGIC;
  SIGNAL or_335_nl : STD_LOGIC;
  SIGNAL or_333_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL nor_55_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL or_377_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_not_nl : STD_LOGIC;
  SIGNAL mux_586_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL and_627_nl : STD_LOGIC;
  SIGNAL mux_584_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL nor_53_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL nor_52_nl : STD_LOGIC;
  SIGNAL and_185_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_16_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_193_nl : STD_LOGIC;
  SIGNAL mux_438_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL or_444_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_nand_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL mux_605_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL mux_602_nl : STD_LOGIC;
  SIGNAL mux_601_nl : STD_LOGIC;
  SIGNAL mux_600_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL mux_595_nl : STD_LOGIC;
  SIGNAL or_546_nl : STD_LOGIC;
  SIGNAL mux_592_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL or_543_nl : STD_LOGIC;
  SIGNAL or_542_nl : STD_LOGIC;
  SIGNAL mux_630_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL mux_628_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL nand_43_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL or_556_nl : STD_LOGIC;
  SIGNAL mux_625_nl : STD_LOGIC;
  SIGNAL or_555_nl : STD_LOGIC;
  SIGNAL mux_624_nl : STD_LOGIC;
  SIGNAL mux_623_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL mux_621_nl : STD_LOGIC;
  SIGNAL or_554_nl : STD_LOGIC;
  SIGNAL mux_620_nl : STD_LOGIC;
  SIGNAL mux_619_nl : STD_LOGIC;
  SIGNAL mux_618_nl : STD_LOGIC;
  SIGNAL mux_614_nl : STD_LOGIC;
  SIGNAL mux_613_nl : STD_LOGIC;
  SIGNAL mux_612_nl : STD_LOGIC;
  SIGNAL mux_611_nl : STD_LOGIC;
  SIGNAL nand_40_nl : STD_LOGIC;
  SIGNAL or_552_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL nor_127_nl : STD_LOGIC;
  SIGNAL or_537_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL nor_126_nl : STD_LOGIC;
  SIGNAL or_536_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL mux_646_nl : STD_LOGIC;
  SIGNAL or_565_nl : STD_LOGIC;
  SIGNAL mux_645_nl : STD_LOGIC;
  SIGNAL mux_644_nl : STD_LOGIC;
  SIGNAL mux_643_nl : STD_LOGIC;
  SIGNAL mux_642_nl : STD_LOGIC;
  SIGNAL mux_641_nl : STD_LOGIC;
  SIGNAL mux_640_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL mux_658_nl : STD_LOGIC;
  SIGNAL mux_657_nl : STD_LOGIC;
  SIGNAL mux_656_nl : STD_LOGIC;
  SIGNAL or_575_nl : STD_LOGIC;
  SIGNAL mux_653_nl : STD_LOGIC;
  SIGNAL or_572_nl : STD_LOGIC;
  SIGNAL nand_45_nl : STD_LOGIC;
  SIGNAL mux_667_nl : STD_LOGIC;
  SIGNAL mux_666_nl : STD_LOGIC;
  SIGNAL mux_665_nl : STD_LOGIC;
  SIGNAL mux_663_nl : STD_LOGIC;
  SIGNAL nand_49_nl : STD_LOGIC;
  SIGNAL mux_546_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL nor_77_nl : STD_LOGIC;
  SIGNAL and_245_nl : STD_LOGIC;
  SIGNAL or_210_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL or_234_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL nor_60_nl : STD_LOGIC;
  SIGNAL nor_61_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL nor_58_nl : STD_LOGIC;
  SIGNAL nor_59_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL or_248_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL nand_22_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL or_310_nl : STD_LOGIC;
  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL or_313_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL or_311_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL or_330_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL or_357_nl : STD_LOGIC;
  SIGNAL or_356_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL or_360_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL nor_54_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_10_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_8_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_6_nl : STD_LOGIC;
  SIGNAL and_118_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL nor_56_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL nor_57_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_4_nl : STD_LOGIC;
  SIGNAL and_112_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL or_272_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_2_nl : STD_LOGIC;
  SIGNAL and_110_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_34_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_3_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL or_259_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_5_nl : STD_LOGIC;
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_219_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL or_279_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_7_nl : STD_LOGIC;
  SIGNAL nor_84_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL or_294_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_9_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL mux_555_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL nand_39_nl : STD_LOGIC;
  SIGNAL mux_616_nl : STD_LOGIC;
  SIGNAL mux_615_nl : STD_LOGIC;
  SIGNAL or_585_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_22_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_353_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_354_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_24_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_355_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL not_825_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_356_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_53_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_25_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_26_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_357_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_358_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_54_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_359_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_55_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_360_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_56_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_361_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_15_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_16_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_and_5_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_and_6_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_and_7_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_38_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_82_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_83_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_39_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_18_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_19_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_20_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_21_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_22_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_23_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_84_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_85_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_nor_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_40_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_643_nl : STD_LOGIC;
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_24_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_86_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_25_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_and_8_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_16_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_26_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_87_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_41_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_42_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_or_88_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_89_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_90_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_34_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_35_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_5_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_36_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_43_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_37_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_44_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_38_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_45_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL not_828_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_91_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_46_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_92_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_47_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_93_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_48_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_94_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_6_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_17_nl : STD_LOGIC;
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

  COMPONENT mult
    PORT (
      x_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      y_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      y_rsc_dat_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      p_rsc_dat : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL COMP_LOOP_1_mult_cmp_x_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_y_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_y_rsc_dat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_return_rsc_z_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;

  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (14 DOWNTO 0);

  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (13 DOWNTO 0);

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
      ensig_cgo_iro_2 : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_2 : IN STD_LOGIC;
      COMP_LOOP_1_mult_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d : STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core
      : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_adra_d_core : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d
      : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d :
      STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core
      : STD_LOGIC_VECTOR (27 DOWNTO 0);
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
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
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
      COMP_LOOP_9_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_10_tr0 : IN STD_LOGIC;
      COMP_LOOP_10_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_11_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
      COMP_LOOP_12_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_13_tr0 : IN STD_LOGIC;
      COMP_LOOP_13_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_14_tr0 : IN STD_LOGIC;
      COMP_LOOP_14_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_15_tr0 : IN STD_LOGIC;
      COMP_LOOP_15_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
      COMP_LOOP_16_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_17_tr0 : IN STD_LOGIC;
      COMP_LOOP_17_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_18_tr0 : IN STD_LOGIC;
      COMP_LOOP_18_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_19_tr0 : IN STD_LOGIC;
      COMP_LOOP_19_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_20_tr0 : IN STD_LOGIC;
      COMP_LOOP_20_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_21_tr0 : IN STD_LOGIC;
      COMP_LOOP_21_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_22_tr0 : IN STD_LOGIC;
      COMP_LOOP_22_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_23_tr0 : IN STD_LOGIC;
      COMP_LOOP_23_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_24_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_25_tr0 : IN STD_LOGIC;
      COMP_LOOP_25_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_26_tr0 : IN STD_LOGIC;
      COMP_LOOP_26_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_27_tr0 : IN STD_LOGIC;
      COMP_LOOP_27_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
      COMP_LOOP_28_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_29_tr0 : IN STD_LOGIC;
      COMP_LOOP_29_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_30_tr0 : IN STD_LOGIC;
      COMP_LOOP_30_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_31_tr0 : IN STD_LOGIC;
      COMP_LOOP_31_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_32_tr0 : IN STD_LOGIC;
      COMP_LOOP_32_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_33_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (8 DOWNTO 0);
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
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 : STD_LOGIC;
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

  FUNCTION MUX1HOT_s_1_8_2(input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
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
      tmp := sel(7);
      result := result or ( input_7 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_9_2(input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
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
      tmp := sel(7);
      result := result or ( input_7 and tmp);
      tmp := sel(8);
      result := result or ( input_8 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_10_6_2(input_5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_11_10_2(input_9 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(9 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(10 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(10 DOWNTO 0);

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
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_14_3_2(input_2 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(13 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(13 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_14_4_2(input_3 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(13 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(13 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_2_6_2(input_5 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_30_2(input_29 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(29 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);

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
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
      tmp := (OTHERS=>sel( 10));
      result := result or ( input_10 and tmp);
      tmp := (OTHERS=>sel( 11));
      result := result or ( input_11 and tmp);
      tmp := (OTHERS=>sel( 12));
      result := result or ( input_12 and tmp);
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
      tmp := (OTHERS=>sel( 15));
      result := result or ( input_15 and tmp);
      tmp := (OTHERS=>sel( 16));
      result := result or ( input_16 and tmp);
      tmp := (OTHERS=>sel( 17));
      result := result or ( input_17 and tmp);
      tmp := (OTHERS=>sel( 18));
      result := result or ( input_18 and tmp);
      tmp := (OTHERS=>sel( 19));
      result := result or ( input_19 and tmp);
      tmp := (OTHERS=>sel( 20));
      result := result or ( input_20 and tmp);
      tmp := (OTHERS=>sel( 21));
      result := result or ( input_21 and tmp);
      tmp := (OTHERS=>sel( 22));
      result := result or ( input_22 and tmp);
      tmp := (OTHERS=>sel( 23));
      result := result or ( input_23 and tmp);
      tmp := (OTHERS=>sel( 24));
      result := result or ( input_24 and tmp);
      tmp := (OTHERS=>sel( 25));
      result := result or ( input_25 and tmp);
      tmp := (OTHERS=>sel( 26));
      result := result or ( input_26 and tmp);
      tmp := (OTHERS=>sel( 27));
      result := result or ( input_27 and tmp);
      tmp := (OTHERS=>sel( 28));
      result := result or ( input_28 and tmp);
      tmp := (OTHERS=>sel( 29));
      result := result or ( input_29 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_6_2(input_5 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);

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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_6_6_2(input_5 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_9_10_2(input_9 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(9 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_9_3_2(input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_9_6_2(input_5 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
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

  FUNCTION MUX_v_14_2_2(input_0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(13 DOWNTO 0);

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

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);

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

BEGIN
  p_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 14,
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
      ccs_ccore_start_rsc_dat => and_173_cse,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat <= z_out_6;
  COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_sub_cmp_return_rsc_z <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1;

  COMP_LOOP_1_modulo_add_cmp : modulo_add
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_add_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => and_173_cse,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_add_cmp_base_rsc_dat <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(factor1_1_sva)
      + UNSIGNED(COMP_LOOP_1_mult_cmp_return_rsc_z), 32));
  COMP_LOOP_1_modulo_add_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_add_cmp_return_rsc_z <= COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1;

  COMP_LOOP_1_mult_cmp : mult
    PORT MAP(
      x_rsc_dat => COMP_LOOP_1_mult_cmp_x_rsc_dat,
      y_rsc_dat => COMP_LOOP_1_mult_cmp_y_rsc_dat,
      y_rsc_dat_1 => COMP_LOOP_1_mult_cmp_y_rsc_dat_1,
      p_rsc_dat => COMP_LOOP_1_mult_cmp_p_rsc_dat,
      return_rsc_z => COMP_LOOP_1_mult_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_mult_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_mult_cmp_x_rsc_dat <= VEC_LOOP_mult_vec_1_sva;
  COMP_LOOP_1_mult_cmp_y_rsc_dat <= COMP_LOOP_twiddle_f_1_sva;
  COMP_LOOP_1_mult_cmp_y_rsc_dat_1 <= COMP_LOOP_twiddle_help_1_sva;
  COMP_LOOP_1_mult_cmp_p_rsc_dat <= p_sva;
  COMP_LOOP_1_mult_cmp_return_rsc_z <= COMP_LOOP_1_mult_cmp_return_rsc_z_1;
  COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat <= NOT((MUX_s_1_2_2(mux_336_cse, mux_143_cse,
      fsm_output(1))) OR (fsm_output(0)));

  COMP_LOOP_17_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 15
      )
    PORT MAP(
      a => COMP_LOOP_17_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_17_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_17_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_17_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_17_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0,
      CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("000000010")));
  z_out_1 <= COMP_LOOP_17_twiddle_f_lshift_rg_z;

  COMP_LOOP_1_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 14
      )
    PORT MAP(
      a => COMP_LOOP_1_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_1_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_1_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_1_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0,
      COMP_LOOP_1_twiddle_f_acc_cse_sva, (and_dcpl_301 AND (NOT((fsm_output(3)) OR
      (fsm_output(1)))) AND and_dcpl) OR (and_dcpl_301 AND (fsm_output(3)) AND (fsm_output(1))
      AND and_dcpl) OR (and_dcpl_295 AND (NOT (fsm_output(5))) AND (NOT (fsm_output(4)))
      AND (fsm_output(3)) AND (NOT (fsm_output(1))) AND and_dcpl_208) OR (and_dcpl_295
      AND (NOT (fsm_output(5))) AND (fsm_output(4)) AND (NOT (fsm_output(3))) AND
      (fsm_output(1)) AND and_dcpl_208));
  z_out_2 <= COMP_LOOP_1_twiddle_f_lshift_rg_z;

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
      vec_rsci_oswt_1_pff => nor_87_cse
    );
  vec_rsci_da_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_wea_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core <= STD_LOGIC_VECTOR'(
      "00000000000000000000000000000000") & (MUX_v_32_2_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      VEC_LOOP_j_1_sva, and_dcpl_31));
  vec_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct <= STD_LOGIC_VECTOR'(
      '0' & (NOT mux_161_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( nor_87_cse & nor_87_cse);
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (NOT mux_161_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff <= NOT mux_129_itm;

  inPlaceNTT_DIT_precomp_core_wait_dp_inst : inPlaceNTT_DIT_precomp_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro,
      ensig_cgo_iro_2 => inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2,
      core_wen => complete_rsci_wen_comp,
      ensig_cgo => reg_ensig_cgo_cse,
      COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
      ensig_cgo_2 => reg_ensig_cgo_2_cse,
      COMP_LOOP_1_mult_cmp_ccs_ccore_en => COMP_LOOP_1_mult_cmp_ccs_ccore_en
    );
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro <= NOT mux_325_itm;
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 <= NOT mux_359_itm;

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
      twiddle_rsci_oswt_pff => nor_82_rmff
    );
  twiddle_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core <= STD_LOGIC_VECTOR'(
      "00000000000000") & COMP_LOOP_twiddle_f_mux1h_144_rmff & COMP_LOOP_twiddle_f_and_rmff
      & COMP_LOOP_twiddle_f_mux1h_30_rmff & COMP_LOOP_twiddle_f_mux1h_58_rmff & COMP_LOOP_twiddle_f_mux1h_113_rmff
      & COMP_LOOP_twiddle_f_mux1h_161_rmff;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & nor_82_rmff);

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
      twiddle_h_rsci_oswt_pff => nor_82_rmff
    );
  twiddle_h_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core <=
      STD_LOGIC_VECTOR'( "00000000000000") & COMP_LOOP_twiddle_f_mux1h_144_rmff &
      COMP_LOOP_twiddle_f_and_rmff & COMP_LOOP_twiddle_f_mux1h_30_rmff & COMP_LOOP_twiddle_f_mux1h_58_rmff
      & COMP_LOOP_twiddle_f_mux1h_113_rmff & COMP_LOOP_twiddle_f_mux1h_161_rmff;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & nor_82_rmff);

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
      COMP_LOOP_9_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_10_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0,
      COMP_LOOP_10_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_11_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0,
      COMP_LOOP_11_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_12_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0,
      COMP_LOOP_12_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_13_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0,
      COMP_LOOP_13_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_14_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0,
      COMP_LOOP_14_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_15_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0,
      COMP_LOOP_15_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_16_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0,
      COMP_LOOP_16_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_17_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0,
      COMP_LOOP_17_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_18_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0,
      COMP_LOOP_18_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_19_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0,
      COMP_LOOP_19_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_20_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0,
      COMP_LOOP_20_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_21_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0,
      COMP_LOOP_21_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_22_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0,
      COMP_LOOP_22_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_23_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0,
      COMP_LOOP_23_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_24_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0,
      COMP_LOOP_24_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_25_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0,
      COMP_LOOP_25_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_26_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0,
      COMP_LOOP_26_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_27_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0,
      COMP_LOOP_27_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_28_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0,
      COMP_LOOP_28_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_29_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0,
      COMP_LOOP_29_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_30_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0,
      COMP_LOOP_30_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_31_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0,
      COMP_LOOP_31_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_32_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0,
      COMP_LOOP_32_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_33_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 <= NOT (z_out_7(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 <= NOT (z_out_7(11));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 <= NOT (z_out_7(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 <= NOT (z_out_7(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 <= NOT (z_out_7(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 <= NOT (z_out_7(11));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 <= NOT (z_out_7(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 <= NOT (z_out_7(9));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 <= NOT (z_out_4(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= z_out_7(4);

  or_212_nl <= (fsm_output(7)) OR (NOT((fsm_output(6)) AND or_tmp_63));
  mux_125_nl <= MUX_s_1_2_2(or_212_nl, mux_tmp_111, fsm_output(4));
  mux_126_nl <= MUX_s_1_2_2(mux_125_nl, mux_tmp_114, fsm_output(3));
  mux_127_nl <= MUX_s_1_2_2(mux_126_nl, mux_tmp_118, fsm_output(2));
  mux_128_nl <= MUX_s_1_2_2(mux_127_nl, mux_tmp_123, fsm_output(5));
  mux_115_nl <= MUX_s_1_2_2(mux_tmp_114, mux_tmp_112, fsm_output(3));
  mux_119_nl <= MUX_s_1_2_2(mux_tmp_118, mux_115_nl, fsm_output(2));
  mux_124_nl <= MUX_s_1_2_2(mux_tmp_123, mux_119_nl, fsm_output(5));
  mux_129_itm <= MUX_s_1_2_2(mux_128_nl, mux_124_nl, fsm_output(1));
  mux_138_cse <= MUX_s_1_2_2(mux_235_cse, mux_tmp_137, fsm_output(2));
  mux_141_cse <= MUX_s_1_2_2(mux_tmp_137, mux_236_cse, fsm_output(2));
  mux_142_cse <= MUX_s_1_2_2(mux_141_cse, mux_291_cse, fsm_output(5));
  mux_139_cse <= MUX_s_1_2_2(mux_368_cse, mux_138_cse, fsm_output(5));
  mux_140_cse <= MUX_s_1_2_2(mux_139_cse, mux_292_cse, fsm_output(3));
  mux_143_cse <= MUX_s_1_2_2(mux_292_cse, mux_142_cse, fsm_output(3));
  mux_144_nl <= MUX_s_1_2_2(mux_143_cse, mux_140_cse, fsm_output(1));
  nor_87_cse <= NOT(mux_144_nl OR (fsm_output(0)));
  mux_190_cse <= MUX_s_1_2_2(or_tmp_72, or_tmp_71, fsm_output(3));
  nand_27_cse <= NOT((fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(8)))
      AND (fsm_output(6)));
  mux_188_cse <= MUX_s_1_2_2(nand_27_cse, mux_tmp_187, fsm_output(5));
  mux_191_cse <= MUX_s_1_2_2(mux_tmp_187, mux_190_cse, fsm_output(5));
  or_266_nl <= (NOT (fsm_output(3))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_199_cse <= MUX_s_1_2_2(or_tmp_89, or_266_nl, fsm_output(6));
  nand_5_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_166));
  nand_4_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_162));
  or_268_cse <= (fsm_output(6)) OR mux_tmp_166;
  mux_196_cse <= MUX_s_1_2_2(mux_tmp_165, or_tmp_86, fsm_output(4));
  mux_201_cse <= MUX_s_1_2_2(or_268_cse, mux_199_cse, fsm_output(4));
  mux_197_nl <= MUX_s_1_2_2(or_tmp_86, nand_4_cse, fsm_output(4));
  mux_198_cse <= MUX_s_1_2_2(mux_197_nl, mux_196_cse, fsm_output(2));
  mux_202_nl <= MUX_s_1_2_2(nand_5_cse, mux_tmp_165, fsm_output(4));
  mux_203_nl <= MUX_s_1_2_2(mux_202_nl, mux_201_cse, fsm_output(2));
  mux_204_cse <= MUX_s_1_2_2(mux_203_nl, mux_198_cse, fsm_output(5));
  or_284_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("101"));
  or_278_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0101"));
  or_291_cse <= (NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(8))
      OR (fsm_output(7));
  mux_238_cse <= MUX_s_1_2_2(or_284_cse, or_tmp_74, fsm_output(4));
  mux_235_cse <= MUX_s_1_2_2(or_tmp_75, or_tmp_74, fsm_output(4));
  mux_236_cse <= MUX_s_1_2_2(or_tmp_70, or_tmp_72, fsm_output(4));
  mux_232_cse <= MUX_s_1_2_2(or_tmp_74, or_tmp_71, fsm_output(4));
  mux_233_cse <= MUX_s_1_2_2(mux_tmp_137, mux_232_cse, fsm_output(5));
  mux_239_nl <= MUX_s_1_2_2(mux_238_cse, mux_130_cse, fsm_output(5));
  mux_237_nl <= MUX_s_1_2_2(mux_236_cse, mux_235_cse, fsm_output(5));
  mux_240_nl <= MUX_s_1_2_2(mux_239_nl, mux_237_nl, fsm_output(3));
  mux_234_nl <= MUX_s_1_2_2(mux_233_cse, mux_tmp_230, fsm_output(3));
  mux_241_cse <= MUX_s_1_2_2(mux_240_nl, mux_234_nl, fsm_output(2));
  mux_228_nl <= MUX_s_1_2_2(or_291_cse, mux_130_cse, fsm_output(5));
  mux_231_cse <= MUX_s_1_2_2(mux_tmp_230, mux_228_nl, fsm_output(3));
  or_317_nl <= COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm OR (fsm_output(4)) OR
      (fsm_output(8));
  mux_274_nl <= MUX_s_1_2_2(or_317_nl, or_tmp_165, fsm_output(6));
  or_318_nl <= (fsm_output(7)) OR mux_274_nl;
  mux_275_nl <= MUX_s_1_2_2(mux_tmp_268, or_318_nl, fsm_output(2));
  mux_276_nl <= MUX_s_1_2_2(mux_275_nl, mux_tmp_266, fsm_output(5));
  mux_277_nl <= MUX_s_1_2_2(mux_tmp_267, mux_276_nl, fsm_output(3));
  or_315_nl <= (fsm_output(4)) OR (fsm_output(8));
  mux_270_nl <= MUX_s_1_2_2(or_315_nl, or_tmp_165, fsm_output(6));
  or_316_nl <= (fsm_output(7)) OR mux_270_nl;
  mux_271_nl <= MUX_s_1_2_2(or_316_nl, or_tmp_164, fsm_output(2));
  mux_269_nl <= MUX_s_1_2_2(nand_tmp_6, mux_tmp_268, fsm_output(2));
  mux_272_nl <= MUX_s_1_2_2(mux_271_nl, mux_269_nl, fsm_output(5));
  mux_273_nl <= MUX_s_1_2_2(mux_272_nl, mux_tmp_267, fsm_output(3));
  mux_278_nl <= MUX_s_1_2_2(mux_277_nl, mux_273_nl, fsm_output(1));
  nor_82_rmff <= NOT(mux_278_nl OR (fsm_output(0)));
  COMP_LOOP_twiddle_f_or_7_cse <= and_dcpl_118 OR (and_dcpl_54 AND and_dcpl_42) OR
      (and_dcpl_57 AND and_dcpl_42) OR (and_dcpl_65 AND and_dcpl_53) OR (and_dcpl_69
      AND and_dcpl_53) OR (and_dcpl_75 AND and_dcpl_64) OR (and_dcpl_24 AND and_dcpl_72)
      OR (and_dcpl_38 AND and_dcpl_72) OR (and_dcpl_45 AND and_dcpl_80) OR (and_dcpl_54
      AND and_dcpl_85) OR (and_dcpl_57 AND and_dcpl_85) OR (and_dcpl_65 AND and_dcpl_89)
      OR (and_dcpl_69 AND and_dcpl_89) OR (and_dcpl_75 AND and_dcpl_95) OR (and_dcpl_24
      AND and_dcpl_99) OR (and_dcpl_38 AND and_dcpl_99);
  COMP_LOOP_twiddle_f_or_12_cse <= (and_dcpl_50 AND and_dcpl_20) OR (and_dcpl_62
      AND and_dcpl_42) OR (and_dcpl_73 AND and_dcpl_64) OR (and_dcpl_33 AND and_dcpl_72)
      OR (and_dcpl_50 AND and_dcpl_80) OR (and_dcpl_62 AND and_dcpl_85) OR (and_dcpl_73
      AND and_dcpl_95) OR (and_dcpl_33 AND and_dcpl_99);
  COMP_LOOP_twiddle_f_or_16_cse <= (and_dcpl_29 AND and_dcpl_42) OR (and_dcpl_77
      AND and_dcpl_64) OR (and_dcpl_29 AND and_dcpl_85) OR (and_dcpl_77 AND and_dcpl_95);
  COMP_LOOP_twiddle_f_or_17_cse <= (and_dcpl_67 AND and_dcpl_53) OR (and_dcpl_67
      AND and_dcpl_89);
  COMP_LOOP_twiddle_f_mux1h_30_nl <= MUX1HOT_s_1_4_2((z_out(3)), (z_out(2)), (z_out(1)),
      (z_out(0)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_7_cse & COMP_LOOP_twiddle_f_or_12_cse
      & COMP_LOOP_twiddle_f_or_16_cse & COMP_LOOP_twiddle_f_or_17_cse));
  COMP_LOOP_twiddle_f_mux1h_30_rmff <= COMP_LOOP_twiddle_f_mux1h_30_nl AND (NOT(and_dcpl_60
      AND and_dcpl_21 AND nor_62_cse));
  COMP_LOOP_twiddle_f_mux1h_58_nl <= MUX1HOT_s_1_3_2((z_out(2)), (z_out(1)), (z_out(0)),
      STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_7_cse & COMP_LOOP_twiddle_f_or_12_cse
      & COMP_LOOP_twiddle_f_or_16_cse));
  COMP_LOOP_twiddle_f_mux1h_58_rmff <= COMP_LOOP_twiddle_f_mux1h_58_nl AND (NOT(xor_dcpl
      AND (NOT (fsm_output(0))) AND (NOT((fsm_output(4)) XOR (fsm_output(6)))) AND
      CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_110));
  mux_291_cse <= MUX_s_1_2_2(mux_232_cse, mux_235_cse, fsm_output(2));
  mux_287_cse <= MUX_s_1_2_2(mux_130_cse, mux_232_cse, fsm_output(2));
  mux_292_cse <= MUX_s_1_2_2(mux_291_cse, mux_368_cse, fsm_output(5));
  mux_288_nl <= MUX_s_1_2_2(or_291_cse, mux_tmp_137, fsm_output(2));
  mux_289_nl <= MUX_s_1_2_2(mux_288_nl, mux_287_cse, fsm_output(5));
  mux_290_nl <= MUX_s_1_2_2(mux_289_nl, mux_139_cse, fsm_output(3));
  mux_294_cse <= MUX_s_1_2_2(mux_140_cse, mux_290_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_mux1h_89_nl <= MUX1HOT_s_1_5_2((z_out(4)), (z_out(3)), (z_out(2)),
      (z_out(1)), (z_out(0)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_7_cse & COMP_LOOP_twiddle_f_or_12_cse
      & COMP_LOOP_twiddle_f_or_16_cse & COMP_LOOP_twiddle_f_or_17_cse & and_dcpl_155));
  COMP_LOOP_twiddle_f_and_rmff <= COMP_LOOP_twiddle_f_mux1h_89_nl AND (NOT(mux_294_cse
      OR (fsm_output(0))));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl <= MUX_s_1_2_2((z_out(1)), (z_out(0)),
      COMP_LOOP_twiddle_f_or_12_cse);
  mux_295_nl <= MUX_s_1_2_2(mux_tmp_175, mux_tmp_206, fsm_output(6));
  mux_296_nl <= MUX_s_1_2_2(mux_295_nl, or_tmp_126, fsm_output(8));
  COMP_LOOP_twiddle_f_mux1h_113_rmff <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl
      AND (NOT((NOT mux_296_nl) AND and_dcpl_28));
  and_161_nl <= and_dcpl_43 AND and_dcpl_20;
  COMP_LOOP_twiddle_f_mux1h_144_rmff <= MUX1HOT_v_9_6_2((z_out(8 DOWNTO 0)), (z_out(13
      DOWNTO 5)), (z_out(12 DOWNTO 4)), (z_out(11 DOWNTO 3)), (z_out(10 DOWNTO 2)),
      (z_out(9 DOWNTO 1)), STD_LOGIC_VECTOR'( and_161_nl & COMP_LOOP_twiddle_f_or_7_cse
      & COMP_LOOP_twiddle_f_or_12_cse & COMP_LOOP_twiddle_f_or_16_cse & COMP_LOOP_twiddle_f_or_17_cse
      & and_dcpl_155));
  nand_7_nl <= NOT((fsm_output(6)) AND (NOT mux_tmp_298));
  or_336_nl <= (fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  mux_303_nl <= MUX_s_1_2_2(nand_7_nl, or_336_nl, fsm_output(8));
  mux_304_nl <= MUX_s_1_2_2(or_tmp_186, mux_303_nl, fsm_output(4));
  or_335_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (NOT (fsm_output(5)));
  mux_300_nl <= MUX_s_1_2_2(or_tmp_184, or_335_nl, fsm_output(6));
  or_333_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR not_tmp_150;
  mux_301_nl <= MUX_s_1_2_2(mux_300_nl, or_333_nl, fsm_output(8));
  mux_302_nl <= MUX_s_1_2_2(mux_301_nl, or_tmp_186, fsm_output(4));
  mux_305_nl <= MUX_s_1_2_2(mux_304_nl, mux_302_nl, fsm_output(2));
  COMP_LOOP_twiddle_f_mux1h_161_rmff <= (z_out(0)) AND (NOT((NOT mux_305_nl) AND
      and_dcpl_27));
  mux_324_nl <= MUX_s_1_2_2(mux_204_cse, mux_tmp_319, fsm_output(1));
  mux_308_nl <= MUX_s_1_2_2(mux_199_cse, mux_tmp_165, fsm_output(4));
  mux_311_nl <= MUX_s_1_2_2(mux_196_cse, mux_308_nl, fsm_output(2));
  mux_316_nl <= MUX_s_1_2_2(mux_tmp_315, mux_311_nl, fsm_output(5));
  mux_320_nl <= MUX_s_1_2_2(mux_tmp_319, mux_316_nl, fsm_output(1));
  mux_325_itm <= MUX_s_1_2_2(mux_324_nl, mux_320_nl, fsm_output(0));
  mux_338_cse <= MUX_s_1_2_2(mux_138_cse, mux_287_cse, fsm_output(5));
  mux_336_cse <= MUX_s_1_2_2(mux_142_cse, mux_372_cse, fsm_output(3));
  mux_339_nl <= MUX_s_1_2_2(mux_372_cse, mux_338_cse, fsm_output(3));
  mux_340_nl <= MUX_s_1_2_2(mux_339_nl, mux_336_cse, fsm_output(1));
  and_173_cse <= (NOT mux_340_nl) AND (fsm_output(0));
  mux_356_nl <= MUX_s_1_2_2(mux_tmp_352, mux_tmp_345, fsm_output(2));
  mux_357_nl <= MUX_s_1_2_2(mux_356_nl, mux_tmp_350, fsm_output(5));
  mux_358_nl <= MUX_s_1_2_2(mux_tmp_351, mux_357_nl, fsm_output(3));
  mux_353_nl <= MUX_s_1_2_2(mux_tmp_348, mux_tmp_352, fsm_output(2));
  mux_354_nl <= MUX_s_1_2_2(mux_tmp_346, mux_353_nl, fsm_output(5));
  mux_355_nl <= MUX_s_1_2_2(mux_354_nl, mux_tmp_351, fsm_output(3));
  mux_359_itm <= MUX_s_1_2_2(mux_358_nl, mux_355_nl, fsm_output(1));
  mux_368_cse <= MUX_s_1_2_2(mux_236_cse, mux_130_cse, fsm_output(2));
  mux_372_cse <= MUX_s_1_2_2(mux_287_cse, mux_141_cse, fsm_output(5));
  or_193_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  nor_62_cse <= NOT((fsm_output(6)) OR (fsm_output(8)));
  or_539_cse <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(5))
      OR (fsm_output(7));
  mux_416_nl <= MUX_s_1_2_2(mux_338_cse, mux_139_cse, fsm_output(3));
  mux_420_nl <= MUX_s_1_2_2(mux_140_cse, mux_416_nl, fsm_output(1));
  COMP_LOOP_twiddle_help_and_cse <= complete_rsci_wen_comp AND (NOT mux_420_nl) AND
      (fsm_output(0));
  or_442_cse <= (fsm_output(6)) OR mux_tmp_461;
  mux_468_cse <= MUX_s_1_2_2(nand_47_cse, or_564_cse, fsm_output(4));
  mux_438_nl <= MUX_s_1_2_2((fsm_output(2)), (NOT or_516_cse), fsm_output(3));
  and_193_nl <= mux_438_nl AND (NOT (fsm_output(4))) AND and_dcpl_20;
  VEC_LOOP_or_27_nl <= and_dcpl_34 OR and_dcpl_44 OR and_dcpl_51 OR and_dcpl_56 OR
      and_dcpl_63 OR and_dcpl_68 OR and_dcpl_74 OR and_dcpl_78 OR and_dcpl_83 OR
      and_dcpl_86 OR and_dcpl_88 OR and_dcpl_91 OR and_dcpl_93 OR and_dcpl_97 OR
      and_dcpl_100 OR and_dcpl_102;
  mux_467_nl <= MUX_s_1_2_2(or_278_cse, nand_47_cse, fsm_output(4));
  mux_469_nl <= MUX_s_1_2_2(mux_468_cse, mux_467_nl, fsm_output(2));
  mux_470_nl <= MUX_s_1_2_2(mux_tmp_460, mux_469_nl, fsm_output(3));
  or_444_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_463_nl <= MUX_s_1_2_2(or_444_nl, or_502_cse, fsm_output(6));
  mux_464_nl <= MUX_s_1_2_2(mux_463_nl, nand_47_cse, fsm_output(4));
  mux_462_nl <= MUX_s_1_2_2(mux_548_cse, or_442_cse, fsm_output(4));
  mux_465_nl <= MUX_s_1_2_2(mux_464_nl, mux_462_nl, fsm_output(2));
  mux_466_nl <= MUX_s_1_2_2(mux_465_nl, mux_tmp_460, fsm_output(3));
  mux_471_nl <= MUX_s_1_2_2(mux_470_nl, mux_466_nl, fsm_output(1));
  nor_80_nl <= NOT(mux_471_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_16_nl <= MUX1HOT_v_14_3_2((STD_LOGIC_VECTOR'( "00000") & (z_out_3(8
      DOWNTO 0))), z_out_7, (VEC_LOOP_j_10_14_0_sva_1(13 DOWNTO 0)), STD_LOGIC_VECTOR'(
      and_193_nl & VEC_LOOP_or_27_nl & nor_80_nl));
  VEC_LOOP_nand_nl <= NOT((NOT mux_294_cse) AND (fsm_output(0)));
  VEC_LOOP_and_4_rgt <= MUX_v_14_2_2(STD_LOGIC_VECTOR'("00000000000000"), VEC_LOOP_mux1h_16_nl,
      VEC_LOOP_nand_nl);
  nor_44_cse_1 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  or_502_cse <= (NOT (fsm_output(8))) OR (fsm_output(5)) OR (fsm_output(7));
  mux_548_cse <= MUX_s_1_2_2(or_502_cse, or_tmp_278, fsm_output(6));
  VEC_LOOP_or_26_cse <= and_dcpl_39 OR and_dcpl_55 OR and_dcpl_66 OR and_dcpl_76
      OR and_dcpl_84 OR and_dcpl_90 OR and_dcpl_96 OR and_dcpl_101;
  or_564_cse <= (fsm_output(6)) OR mux_654_cse;
  mux_633_cse <= MUX_s_1_2_2(mux_649_cse, mux_548_cse, fsm_output(4));
  mux_636_nl <= MUX_s_1_2_2(mux_548_cse, mux_tmp_461, fsm_output(4));
  mux_637_cse <= MUX_s_1_2_2(mux_636_nl, nand_tmp_22, fsm_output(0));
  mux_639_cse <= MUX_s_1_2_2(or_564_cse, mux_649_cse, fsm_output(4));
  or_573_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  or_571_cse <= (fsm_output(5)) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_654_cse <= MUX_s_1_2_2(or_tmp_85, or_573_cse, fsm_output(5));
  mux_649_cse <= MUX_s_1_2_2(or_tmp_278, or_571_cse, fsm_output(6));
  nand_47_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_461));
  and_231_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_516_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(NOT
      STAGE_LOOP_i_3_0_sva) + UNSIGNED'( "1111"), 4));
  or_dcpl_138 <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0000"));
  or_dcpl_139 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_141 <= or_193_cse OR (fsm_output(2));
  or_dcpl_142 <= or_dcpl_141 OR or_dcpl_139;
  or_tmp_59 <= ((fsm_output(6)) AND (fsm_output(0))) OR (fsm_output(8));
  nand_tmp_1 <= NOT((fsm_output(7)) AND (NOT or_tmp_59));
  or_tmp_61 <= (NOT (fsm_output(6))) OR (fsm_output(8));
  or_204_cse <= (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(8));
  mux_tmp_111 <= MUX_s_1_2_2(or_tmp_61, or_204_cse, fsm_output(7));
  mux_tmp_112 <= MUX_s_1_2_2(mux_tmp_111, nand_tmp_1, fsm_output(4));
  or_tmp_63 <= (NOT (fsm_output(0))) OR (fsm_output(8));
  or_tmp_64 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      or_tmp_63);
  or_210_nl <= (fsm_output(6)) OR (fsm_output(0)) OR (NOT (fsm_output(8)));
  mux_tmp_113 <= MUX_s_1_2_2(or_210_nl, or_tmp_61, fsm_output(7));
  mux_tmp_114 <= MUX_s_1_2_2(mux_tmp_113, or_tmp_64, fsm_output(4));
  mux_tmp_116 <= MUX_s_1_2_2(nand_tmp_1, mux_tmp_113, fsm_output(4));
  or_tmp_67 <= (fsm_output(7)) OR or_tmp_59;
  mux_tmp_117 <= MUX_s_1_2_2(or_tmp_64, or_tmp_67, fsm_output(4));
  mux_tmp_118 <= MUX_s_1_2_2(mux_tmp_117, mux_tmp_116, fsm_output(3));
  mux_121_nl <= MUX_s_1_2_2(or_tmp_67, mux_tmp_111, fsm_output(4));
  mux_122_nl <= MUX_s_1_2_2(mux_tmp_116, mux_121_nl, fsm_output(3));
  mux_120_nl <= MUX_s_1_2_2(mux_tmp_112, mux_tmp_117, fsm_output(3));
  mux_tmp_123 <= MUX_s_1_2_2(mux_122_nl, mux_120_nl, fsm_output(2));
  or_tmp_70 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  or_tmp_71 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010"));
  or_tmp_72 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  mux_130_cse <= MUX_s_1_2_2(or_tmp_71, or_tmp_70, fsm_output(4));
  or_tmp_74 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  or_tmp_75 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_137 <= MUX_s_1_2_2(or_tmp_72, or_tmp_75, fsm_output(4));
  and_dcpl_19 <= NOT((fsm_output(5)) OR (fsm_output(7)));
  and_dcpl_20 <= and_dcpl_19 AND nor_62_cse;
  and_dcpl_21 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_23 <= nor_44_cse_1 AND (fsm_output(2));
  and_dcpl_24 <= and_dcpl_23 AND and_dcpl_21;
  and_dcpl_25 <= and_dcpl_24 AND and_dcpl_20;
  and_dcpl_26 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_27 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_28 <= and_dcpl_27 AND (NOT (fsm_output(2)));
  and_dcpl_29 <= and_dcpl_28 AND and_dcpl_26;
  mux_tmp_150 <= MUX_s_1_2_2(mux_tmp_137, mux_130_cse, fsm_output(3));
  mux_154_nl <= MUX_s_1_2_2(mux_130_cse, mux_235_cse, fsm_output(3));
  mux_152_nl <= MUX_s_1_2_2(mux_232_cse, mux_tmp_137, fsm_output(3));
  mux_tmp_155 <= MUX_s_1_2_2(mux_154_nl, mux_152_nl, fsm_output(2));
  mux_158_nl <= MUX_s_1_2_2(mux_238_cse, mux_236_cse, fsm_output(3));
  mux_159_nl <= MUX_s_1_2_2(mux_158_nl, mux_tmp_150, fsm_output(2));
  mux_160_nl <= MUX_s_1_2_2(mux_159_nl, mux_tmp_155, fsm_output(5));
  mux_147_nl <= MUX_s_1_2_2(mux_236_cse, mux_232_cse, fsm_output(3));
  mux_151_nl <= MUX_s_1_2_2(mux_tmp_150, mux_147_nl, fsm_output(2));
  mux_156_nl <= MUX_s_1_2_2(mux_tmp_155, mux_151_nl, fsm_output(5));
  mux_161_itm <= MUX_s_1_2_2(mux_160_nl, mux_156_nl, fsm_output(1));
  and_dcpl_31 <= (NOT mux_161_itm) AND (fsm_output(0));
  and_dcpl_32 <= and_dcpl_27 AND (fsm_output(2));
  and_dcpl_33 <= and_dcpl_32 AND and_dcpl_26;
  and_dcpl_34 <= and_dcpl_33 AND and_dcpl_20;
  or_tmp_85 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  or_228_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_162 <= MUX_s_1_2_2(or_tmp_85, or_228_cse, fsm_output(3));
  or_tmp_86 <= (fsm_output(6)) OR mux_tmp_162;
  or_tmp_89 <= (fsm_output(3)) OR (fsm_output(8)) OR (fsm_output(7));
  or_234_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_tmp_165 <= MUX_s_1_2_2(or_234_nl, or_tmp_89, fsm_output(6));
  mux_tmp_166 <= MUX_s_1_2_2(or_573_cse, or_tmp_85, fsm_output(3));
  mux_169_cse <= MUX_s_1_2_2(mux_tmp_165, nand_4_cse, fsm_output(5));
  mux_167_cse <= MUX_s_1_2_2(or_268_cse, mux_tmp_165, fsm_output(5));
  mux_401_nl <= MUX_s_1_2_2(nand_5_cse, or_tmp_86, fsm_output(5));
  mux_171_nl <= MUX_s_1_2_2(mux_401_nl, mux_169_cse, fsm_output(4));
  mux_393_nl <= MUX_s_1_2_2(mux_199_cse, or_tmp_86, fsm_output(5));
  mux_168_nl <= MUX_s_1_2_2(mux_167_cse, mux_393_nl, fsm_output(4));
  mux_172_nl <= MUX_s_1_2_2(mux_171_nl, mux_168_nl, fsm_output(2));
  and_dcpl_35 <= (NOT mux_172_nl) AND nor_44_cse_1;
  and_dcpl_36 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_37 <= nor_44_cse_1 AND (NOT (fsm_output(2)));
  and_dcpl_38 <= and_dcpl_37 AND and_dcpl_36;
  and_dcpl_39 <= and_dcpl_38 AND and_dcpl_20;
  or_tmp_94 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10"));
  or_tmp_95 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_173 <= MUX_s_1_2_2(or_tmp_95, or_tmp_94, fsm_output(5));
  or_tmp_97 <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("100"));
  mux_174_nl <= MUX_s_1_2_2(or_dcpl_139, or_tmp_95, fsm_output(5));
  mux_tmp_175 <= MUX_s_1_2_2(mux_174_nl, or_tmp_97, fsm_output(7));
  mux_tmp_176 <= MUX_s_1_2_2((NOT or_tmp_94), and_dcpl_36, fsm_output(5));
  nor_60_nl <= NOT((fsm_output(5)) OR (NOT and_dcpl_36));
  mux_177_nl <= MUX_s_1_2_2(nor_60_nl, mux_tmp_176, fsm_output(7));
  mux_178_nl <= MUX_s_1_2_2(mux_177_nl, (NOT mux_tmp_175), fsm_output(6));
  nor_61_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR
      mux_tmp_173);
  mux_179_nl <= MUX_s_1_2_2(mux_178_nl, nor_61_nl, fsm_output(8));
  and_dcpl_40 <= mux_179_nl AND and_dcpl_32;
  and_dcpl_41 <= (fsm_output(5)) AND (NOT (fsm_output(7)));
  and_dcpl_42 <= and_dcpl_41 AND nor_62_cse;
  and_dcpl_43 <= and_dcpl_28 AND and_dcpl_21;
  and_dcpl_44 <= and_dcpl_43 AND and_dcpl_42;
  and_dcpl_45 <= and_dcpl_23 AND and_dcpl_26;
  and_dcpl_46 <= and_dcpl_45 AND and_dcpl_42;
  nor_tmp_24 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  nor_97_cse <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  mux_180_nl <= MUX_s_1_2_2(nor_tmp_24, nor_97_cse, fsm_output(7));
  nor_58_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(5)) OR (NOT (fsm_output(4))));
  mux_181_nl <= MUX_s_1_2_2(mux_180_nl, nor_58_nl, fsm_output(6));
  nor_59_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0010")));
  mux_182_nl <= MUX_s_1_2_2(mux_181_nl, nor_59_nl, fsm_output(8));
  and_dcpl_49 <= mux_182_nl AND and_dcpl_27 AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00"));
  and_dcpl_50 <= and_dcpl_32 AND (NOT or_tmp_94);
  and_dcpl_51 <= and_dcpl_50 AND and_dcpl_42;
  and_dcpl_52 <= (fsm_output(6)) AND (NOT (fsm_output(8)));
  and_dcpl_53 <= and_dcpl_19 AND and_dcpl_52;
  and_dcpl_54 <= and_dcpl_37 AND and_dcpl_21;
  and_dcpl_55 <= and_dcpl_54 AND and_dcpl_53;
  and_dcpl_56 <= and_dcpl_29 AND and_dcpl_53;
  and_dcpl_57 <= and_dcpl_23 AND (NOT or_tmp_94);
  and_dcpl_58 <= and_dcpl_57 AND and_dcpl_53;
  and_dcpl_60 <= and_dcpl_28 AND xor_dcpl;
  and_dcpl_61 <= and_dcpl_60 AND and_dcpl_36 AND and_dcpl_52;
  and_dcpl_62 <= and_dcpl_32 AND and_dcpl_36;
  and_dcpl_63 <= and_dcpl_62 AND and_dcpl_53;
  and_dcpl_64 <= and_dcpl_41 AND and_dcpl_52;
  and_dcpl_65 <= and_dcpl_37 AND and_dcpl_26;
  and_dcpl_66 <= and_dcpl_65 AND and_dcpl_64;
  and_dcpl_67 <= and_dcpl_28 AND (NOT or_tmp_94);
  and_dcpl_68 <= and_dcpl_67 AND and_dcpl_64;
  and_dcpl_69 <= and_dcpl_23 AND and_dcpl_36;
  and_dcpl_70 <= and_dcpl_69 AND and_dcpl_64;
  and_dcpl_71 <= (NOT (fsm_output(5))) AND (fsm_output(7));
  and_dcpl_72 <= and_dcpl_71 AND nor_62_cse;
  and_dcpl_73 <= and_dcpl_32 AND and_dcpl_21;
  and_dcpl_74 <= and_dcpl_73 AND and_dcpl_72;
  and_dcpl_75 <= and_dcpl_37 AND (NOT or_tmp_94);
  and_dcpl_76 <= and_dcpl_75 AND and_dcpl_72;
  and_dcpl_77 <= and_dcpl_28 AND and_dcpl_36;
  and_dcpl_78 <= and_dcpl_77 AND and_dcpl_72;
  and_dcpl_79 <= (fsm_output(5)) AND (fsm_output(7));
  and_dcpl_80 <= and_dcpl_79 AND nor_62_cse;
  and_dcpl_81 <= and_dcpl_24 AND and_dcpl_80;
  and_dcpl_82 <= and_dcpl_29 AND and_dcpl_80;
  and_dcpl_83 <= and_dcpl_33 AND and_dcpl_80;
  and_dcpl_84 <= and_dcpl_38 AND and_dcpl_80;
  and_dcpl_85 <= and_dcpl_71 AND and_dcpl_52;
  and_dcpl_86 <= and_dcpl_43 AND and_dcpl_85;
  and_dcpl_87 <= and_dcpl_45 AND and_dcpl_85;
  and_dcpl_88 <= and_dcpl_50 AND and_dcpl_85;
  and_dcpl_89 <= and_dcpl_79 AND and_dcpl_52;
  and_dcpl_90 <= and_dcpl_54 AND and_dcpl_89;
  and_dcpl_91 <= and_dcpl_29 AND and_dcpl_89;
  and_dcpl_92 <= and_dcpl_57 AND and_dcpl_89;
  and_dcpl_93 <= and_dcpl_62 AND and_dcpl_89;
  and_dcpl_94 <= (NOT (fsm_output(6))) AND (fsm_output(8));
  and_dcpl_95 <= and_dcpl_19 AND and_dcpl_94;
  and_dcpl_96 <= and_dcpl_65 AND and_dcpl_95;
  and_dcpl_97 <= and_dcpl_67 AND and_dcpl_95;
  and_dcpl_98 <= and_dcpl_69 AND and_dcpl_95;
  and_dcpl_99 <= and_dcpl_41 AND and_dcpl_94;
  and_dcpl_100 <= and_dcpl_73 AND and_dcpl_99;
  and_dcpl_101 <= and_dcpl_75 AND and_dcpl_99;
  and_dcpl_102 <= and_dcpl_77 AND and_dcpl_99;
  or_247_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_248_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_183_nl <= MUX_s_1_2_2(or_248_nl, or_247_cse, fsm_output(3));
  and_dcpl_105 <= NOT(mux_183_nl OR (fsm_output(0)) OR (fsm_output(4)) OR (NOT and_dcpl_20));
  mux_184_cse <= MUX_s_1_2_2(or_tmp_70, or_tmp_74, fsm_output(3));
  mux_185_cse <= MUX_s_1_2_2(or_tmp_74, or_tmp_72, fsm_output(3));
  mux_tmp_186 <= MUX_s_1_2_2(mux_185_cse, mux_184_cse, fsm_output(5));
  mux_tmp_187 <= MUX_s_1_2_2(or_tmp_71, or_tmp_75, fsm_output(3));
  or_tmp_126 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000")) OR
      (NOT and_dcpl_36);
  mux_tmp_206 <= MUX_s_1_2_2((NOT mux_tmp_176), mux_tmp_173, fsm_output(7));
  mux_tmp_210 <= MUX_s_1_2_2(or_tmp_74, or_tmp_70, fsm_output(5));
  mux_tmp_212 <= MUX_s_1_2_2(or_tmp_70, or_tmp_75, fsm_output(5));
  mux_tmp_215 <= MUX_s_1_2_2(or_tmp_72, or_tmp_74, fsm_output(5));
  and_dcpl_110 <= NOT((fsm_output(3)) OR (fsm_output(8)));
  mux_tmp_230 <= MUX_s_1_2_2(mux_130_cse, mux_tmp_137, fsm_output(5));
  nand_22_nl <= NOT((VEC_LOOP_j_10_14_0_sva_1(14)) AND (fsm_output(8)));
  or_307_nl <= (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  mux_262_nl <= MUX_s_1_2_2(nand_22_nl, or_307_nl, fsm_output(4));
  or_tmp_164 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_262_nl;
  or_tmp_165 <= (NOT (fsm_output(4))) OR (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR
      (fsm_output(8));
  or_310_nl <= (fsm_output(4)) OR (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  mux_tmp_263 <= MUX_s_1_2_2(or_310_nl, or_tmp_165, fsm_output(6));
  nand_tmp_6 <= NOT((fsm_output(7)) AND (NOT mux_tmp_263));
  or_tmp_168 <= (NOT (fsm_output(6))) OR (fsm_output(4)) OR (NOT (VEC_LOOP_j_10_14_0_sva_1(14)))
      OR (fsm_output(8));
  or_313_nl <= (fsm_output(6)) OR (NOT((fsm_output(4)) AND (VEC_LOOP_j_10_14_0_sva_1(14))
      AND (fsm_output(8))));
  mux_265_nl <= MUX_s_1_2_2(or_313_nl, or_tmp_168, fsm_output(7));
  mux_tmp_266 <= MUX_s_1_2_2(mux_265_nl, nand_tmp_6, fsm_output(2));
  or_311_nl <= (fsm_output(7)) OR mux_tmp_263;
  mux_264_nl <= MUX_s_1_2_2(or_311_nl, or_tmp_164, fsm_output(2));
  mux_tmp_267 <= MUX_s_1_2_2(mux_tmp_266, mux_264_nl, fsm_output(5));
  or_314_nl <= (fsm_output(6)) OR (NOT (fsm_output(4))) OR (NOT (VEC_LOOP_j_10_14_0_sva_1(14)))
      OR (fsm_output(8));
  mux_tmp_268 <= MUX_s_1_2_2(or_tmp_168, or_314_nl, fsm_output(7));
  and_dcpl_118 <= and_dcpl_45 AND and_dcpl_20;
  and_dcpl_155 <= and_dcpl_43 AND and_dcpl_80;
  or_tmp_184 <= (NOT (fsm_output(7))) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  not_tmp_150 <= MUX_s_1_2_2((fsm_output(5)), (NOT (fsm_output(5))), fsm_output(3));
  or_330_nl <= (fsm_output(3)) OR (NOT (fsm_output(5)));
  mux_tmp_298 <= MUX_s_1_2_2(not_tmp_150, or_330_nl, fsm_output(7));
  mux_299_nl <= MUX_s_1_2_2(mux_tmp_298, or_tmp_184, fsm_output(6));
  or_tmp_186 <= (fsm_output(8)) OR mux_299_nl;
  and_dcpl_164 <= and_dcpl_19 AND (fsm_output(6)) AND (fsm_output(8));
  and_dcpl_168 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101")) AND
      and_dcpl_21 AND and_dcpl_164;
  mux_313_nl <= MUX_s_1_2_2(nand_4_cse, or_268_cse, fsm_output(4));
  mux_tmp_315 <= MUX_s_1_2_2(mux_201_cse, mux_313_nl, fsm_output(2));
  mux_tmp_319 <= MUX_s_1_2_2(mux_198_cse, mux_tmp_315, fsm_output(5));
  mux_341_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(8));
  mux_342_nl <= MUX_s_1_2_2(mux_341_nl, or_tmp_61, fsm_output(0));
  or_tmp_209 <= (fsm_output(7)) OR mux_342_nl;
  or_357_nl <= (fsm_output(8)) OR (fsm_output(6));
  or_356_nl <= (fsm_output(0)) OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_tmp_343 <= MUX_s_1_2_2(or_357_nl, or_356_nl, fsm_output(7));
  nor_27_cse <= NOT((fsm_output(7)) OR (NOT (fsm_output(0))));
  or_tmp_213 <= nor_27_cse OR (fsm_output(8)) OR (fsm_output(6));
  mux_tmp_345 <= MUX_s_1_2_2(or_tmp_209, or_tmp_213, fsm_output(4));
  mux_344_nl <= MUX_s_1_2_2(mux_tmp_343, or_tmp_209, fsm_output(4));
  mux_tmp_346 <= MUX_s_1_2_2(mux_tmp_345, mux_344_nl, fsm_output(2));
  or_360_nl <= (NOT (fsm_output(8))) OR (fsm_output(6));
  mux_tmp_347 <= MUX_s_1_2_2(or_360_nl, or_204_cse, fsm_output(7));
  or_tmp_217 <= nor_27_cse OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_tmp_348 <= MUX_s_1_2_2(or_tmp_217, mux_tmp_347, fsm_output(4));
  mux_349_nl <= MUX_s_1_2_2(mux_tmp_347, mux_tmp_343, fsm_output(4));
  mux_tmp_350 <= MUX_s_1_2_2(mux_349_nl, mux_tmp_348, fsm_output(2));
  mux_tmp_351 <= MUX_s_1_2_2(mux_tmp_350, mux_tmp_346, fsm_output(5));
  mux_tmp_352 <= MUX_s_1_2_2(or_tmp_213, or_tmp_217, fsm_output(4));
  nor_54_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000000")));
  mux_378_nl <= MUX_s_1_2_2((fsm_output(7)), or_539_cse, fsm_output(6));
  mux_tmp_379 <= MUX_s_1_2_2(nor_54_nl, mux_378_nl, fsm_output(8));
  or_tmp_233 <= (fsm_output(2)) OR and_231_cse;
  or_tmp_234 <= (fsm_output(4)) OR ((fsm_output(3)) AND or_tmp_233);
  or_tmp_278 <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (fsm_output(7));
  mux_tmp_460 <= MUX_s_1_2_2(mux_633_cse, mux_639_cse, fsm_output(2));
  mux_tmp_461 <= MUX_s_1_2_2(or_228_cse, or_tmp_85, fsm_output(5));
  mux_498_nl <= MUX_s_1_2_2(mux_232_cse, or_291_cse, fsm_output(2));
  mux_tmp_499 <= MUX_s_1_2_2(mux_498_nl, mux_368_cse, fsm_output(5));
  mux_508_nl <= MUX_s_1_2_2(mux_tmp_499, mux_142_cse, fsm_output(3));
  mux_504_nl <= MUX_s_1_2_2(mux_139_cse, mux_tmp_499, fsm_output(3));
  mux_509_nl <= MUX_s_1_2_2(mux_508_nl, mux_504_nl, fsm_output(1));
  and_dcpl_193 <= (NOT mux_509_nl) AND (fsm_output(0));
  mux_511_nl <= MUX_s_1_2_2(or_tmp_75, or_tmp_70, fsm_output(3));
  mux_513_nl <= MUX_s_1_2_2(mux_184_cse, mux_511_nl, fsm_output(5));
  mux_tmp_516 <= MUX_s_1_2_2(mux_tmp_186, mux_513_nl, fsm_output(1));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_24 AND and_dcpl_164;
  VEC_LOOP_j_1_sva_mx0c0 <= and_231_cse AND (NOT (fsm_output(2))) AND and_dcpl_21
      AND and_dcpl_20;
  xor_dcpl <= NOT((fsm_output(5)) XOR (fsm_output(7)));
  VEC_LOOP_or_9_cse <= and_dcpl_25 OR and_dcpl_34;
  VEC_LOOP_or_10_cse <= and_dcpl_44 OR and_dcpl_51 OR and_dcpl_56 OR and_dcpl_63
      OR and_dcpl_68 OR and_dcpl_74 OR and_dcpl_78 OR and_dcpl_83 OR and_dcpl_86
      OR and_dcpl_88 OR and_dcpl_91 OR and_dcpl_93 OR and_dcpl_97 OR and_dcpl_100
      OR and_dcpl_102;
  VEC_LOOP_or_32_cse <= and_dcpl_46 OR and_dcpl_70 OR and_dcpl_87 OR and_dcpl_98;
  VEC_LOOP_or_35_cse <= and_dcpl_58 OR and_dcpl_92;
  VEC_LOOP_or_19_cse <= and_dcpl_39 OR and_dcpl_44 OR and_dcpl_46 OR and_dcpl_51
      OR and_dcpl_55 OR and_dcpl_56 OR and_dcpl_58 OR and_dcpl_63 OR and_dcpl_66
      OR and_dcpl_68 OR and_dcpl_70 OR and_dcpl_74 OR and_dcpl_76 OR and_dcpl_78
      OR and_dcpl_81 OR and_dcpl_83 OR and_dcpl_84 OR and_dcpl_86 OR and_dcpl_87
      OR and_dcpl_88 OR and_dcpl_90 OR and_dcpl_91 OR and_dcpl_92 OR and_dcpl_93
      OR and_dcpl_96 OR and_dcpl_97 OR and_dcpl_98 OR and_dcpl_100 OR and_dcpl_101
      OR and_dcpl_102;
  VEC_LOOP_mux1h_10_nl <= MUX1HOT_v_10_6_2((z_out_5(13 DOWNTO 4)), (z_out_7(12 DOWNTO
      3)), (z_out_7(13 DOWNTO 4)), (z_out_7(11 DOWNTO 2)), (z_out_7(10 DOWNTO 1)),
      (z_out_7(9 DOWNTO 0)), STD_LOGIC_VECTOR'( VEC_LOOP_or_9_cse & VEC_LOOP_or_26_cse
      & VEC_LOOP_or_10_cse & VEC_LOOP_or_32_cse & VEC_LOOP_or_35_cse & and_dcpl_81));
  VEC_LOOP_mux1h_8_nl <= MUX1HOT_s_1_6_2((z_out_5(3)), (z_out_7(2)), (z_out_7(3)),
      (z_out_7(1)), (z_out_7(0)), (reg_VEC_LOOP_acc_1_1_reg(3)), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_9_cse & VEC_LOOP_or_26_cse & VEC_LOOP_or_10_cse & VEC_LOOP_or_32_cse
      & VEC_LOOP_or_35_cse & and_dcpl_81));
  nor_56_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(5))) OR (fsm_output(4)));
  nor_57_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")));
  mux_225_nl <= MUX_s_1_2_2(nor_57_nl, nor_tmp_24, fsm_output(7));
  mux_226_nl <= MUX_s_1_2_2(nor_56_nl, mux_225_nl, fsm_output(6));
  and_118_nl <= mux_226_nl AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("100"))
      AND and_dcpl_110;
  VEC_LOOP_mux1h_6_nl <= MUX1HOT_s_1_5_2((z_out_5(2)), (z_out_7(1)), (z_out_7(2)),
      (z_out_7(0)), (reg_VEC_LOOP_acc_1_1_reg(2)), STD_LOGIC_VECTOR'( VEC_LOOP_or_9_cse
      & VEC_LOOP_or_26_cse & VEC_LOOP_or_10_cse & VEC_LOOP_or_32_cse & and_118_nl));
  or_272_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("101"));
  mux_207_nl <= MUX_s_1_2_2(or_272_nl, or_tmp_97, fsm_output(7));
  mux_208_nl <= MUX_s_1_2_2(mux_207_nl, mux_tmp_206, fsm_output(6));
  mux_209_nl <= MUX_s_1_2_2(mux_208_nl, or_tmp_126, fsm_output(8));
  and_112_nl <= (NOT mux_209_nl) AND and_dcpl_23;
  VEC_LOOP_mux1h_4_nl <= MUX1HOT_s_1_4_2((z_out_5(1)), (z_out_7(0)), (z_out_7(1)),
      (reg_VEC_LOOP_acc_1_1_reg(1)), STD_LOGIC_VECTOR'( VEC_LOOP_or_9_cse & VEC_LOOP_or_26_cse
      & VEC_LOOP_or_10_cse & and_112_nl));
  mux_192_nl <= MUX_s_1_2_2(mux_tmp_186, mux_191_cse, fsm_output(4));
  mux_189_nl <= MUX_s_1_2_2(mux_188_cse, mux_tmp_186, fsm_output(4));
  mux_193_nl <= MUX_s_1_2_2(mux_192_nl, mux_189_nl, fsm_output(2));
  and_110_nl <= (NOT mux_193_nl) AND nor_44_cse_1;
  VEC_LOOP_mux1h_2_nl <= MUX1HOT_s_1_3_2((z_out_5(0)), (reg_VEC_LOOP_acc_1_1_reg(0)),
      (z_out_7(0)), STD_LOGIC_VECTOR'( VEC_LOOP_or_9_cse & and_110_nl & VEC_LOOP_or_10_cse));
  and_34_nl <= and_dcpl_29 AND and_dcpl_20;
  VEC_LOOP_mux1h_nl <= MUX1HOT_v_9_10_2((z_out_3(8 DOWNTO 0)), reg_VEC_LOOP_acc_1_1_reg,
      (VEC_LOOP_acc_10_cse_1_sva(13 DOWNTO 5)), (z_out_7(13 DOWNTO 5)), (reg_VEC_LOOP_acc_1_reg
      & (reg_VEC_LOOP_acc_1_1_reg(8 DOWNTO 5))), (z_out_5(13 DOWNTO 5)), (VEC_LOOP_acc_12_psp_sva_12
      & VEC_LOOP_acc_12_psp_sva_11 & (VEC_LOOP_acc_12_psp_sva_10_0(10 DOWNTO 4))),
      (VEC_LOOP_acc_12_psp_sva_11 & (VEC_LOOP_acc_12_psp_sva_10_0(10 DOWNTO 3))),
      (VEC_LOOP_acc_12_psp_sva_10_0(10 DOWNTO 2)), (COMP_LOOP_17_twiddle_f_lshift_itm(9
      DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_25 & and_34_nl & and_dcpl_31 & and_dcpl_34
      & and_dcpl_35 & VEC_LOOP_or_19_cse & and_dcpl_40 & and_dcpl_49 & and_dcpl_61
      & and_dcpl_82));
  VEC_LOOP_mux1h_1_nl <= MUX1HOT_s_1_9_2((VEC_LOOP_j_1_sva(4)), (VEC_LOOP_acc_10_cse_1_sva(4)),
      (z_out_7(4)), (reg_VEC_LOOP_acc_1_1_reg(4)), (z_out_5(4)), (VEC_LOOP_acc_12_psp_sva_10_0(3)),
      (VEC_LOOP_acc_12_psp_sva_10_0(2)), (VEC_LOOP_acc_12_psp_sva_10_0(1)), (COMP_LOOP_17_twiddle_f_lshift_itm(0)),
      STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_31 & and_dcpl_34 & and_dcpl_35 &
      VEC_LOOP_or_19_cse & and_dcpl_40 & and_dcpl_49 & and_dcpl_61 & and_dcpl_82));
  or_259_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)/=STD_LOGIC_VECTOR'("0101010"));
  mux_205_nl <= MUX_s_1_2_2(mux_204_cse, or_259_nl, fsm_output(1));
  nor_86_nl <= NOT(mux_205_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_3_nl <= MUX1HOT_s_1_8_2((VEC_LOOP_j_1_sva(3)), (VEC_LOOP_acc_10_cse_1_sva(3)),
      (z_out_7(3)), (reg_VEC_LOOP_acc_1_1_reg(3)), (z_out_5(3)), (VEC_LOOP_acc_12_psp_sva_10_0(2)),
      (VEC_LOOP_acc_12_psp_sva_10_0(1)), (VEC_LOOP_acc_12_psp_sva_10_0(0)), STD_LOGIC_VECTOR'(
      and_dcpl_105 & and_dcpl_31 & and_dcpl_34 & nor_86_nl & VEC_LOOP_or_19_cse &
      and_dcpl_40 & and_dcpl_49 & and_dcpl_61));
  mux_220_nl <= MUX_s_1_2_2(or_284_cse, or_tmp_71, fsm_output(5));
  mux_221_nl <= MUX_s_1_2_2(mux_220_nl, mux_tmp_210, fsm_output(4));
  mux_218_nl <= MUX_s_1_2_2(or_tmp_75, or_tmp_71, fsm_output(5));
  mux_219_nl <= MUX_s_1_2_2(mux_tmp_215, mux_218_nl, fsm_output(4));
  mux_222_nl <= MUX_s_1_2_2(mux_221_nl, mux_219_nl, fsm_output(2));
  mux_216_nl <= MUX_s_1_2_2(mux_tmp_212, mux_tmp_215, fsm_output(4));
  mux_213_nl <= MUX_s_1_2_2(or_tmp_71, or_tmp_72, fsm_output(5));
  mux_214_nl <= MUX_s_1_2_2(mux_213_nl, mux_tmp_212, fsm_output(4));
  mux_217_nl <= MUX_s_1_2_2(mux_216_nl, mux_214_nl, fsm_output(2));
  mux_223_nl <= MUX_s_1_2_2(mux_222_nl, mux_217_nl, fsm_output(3));
  mux_211_nl <= MUX_s_1_2_2(or_278_cse, mux_tmp_210, fsm_output(4));
  or_279_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")) OR mux_211_nl;
  mux_224_nl <= MUX_s_1_2_2(mux_223_nl, or_279_nl, fsm_output(1));
  nor_85_nl <= NOT(mux_224_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_5_nl <= MUX1HOT_s_1_7_2((VEC_LOOP_j_1_sva(2)), (VEC_LOOP_acc_10_cse_1_sva(2)),
      (z_out_7(2)), (reg_VEC_LOOP_acc_1_1_reg(2)), (z_out_5(2)), (VEC_LOOP_acc_12_psp_sva_10_0(1)),
      (VEC_LOOP_acc_12_psp_sva_10_0(0)), STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_31
      & and_dcpl_34 & nor_85_nl & VEC_LOOP_or_19_cse & and_dcpl_40 & and_dcpl_49));
  or_294_nl <= (fsm_output(2)) OR mux_231_cse;
  mux_242_nl <= MUX_s_1_2_2(mux_241_cse, or_294_nl, fsm_output(1));
  nor_84_nl <= NOT(mux_242_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_7_nl <= MUX1HOT_s_1_6_2((VEC_LOOP_j_1_sva(1)), (VEC_LOOP_acc_10_cse_1_sva(1)),
      (z_out_7(1)), (reg_VEC_LOOP_acc_1_1_reg(1)), (z_out_5(1)), (VEC_LOOP_acc_12_psp_sva_10_0(0)),
      STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_31 & and_dcpl_34 & nor_84_nl & VEC_LOOP_or_19_cse
      & and_dcpl_40));
  mux_247_nl <= MUX_s_1_2_2(mux_232_cse, mux_236_cse, fsm_output(5));
  mux_248_nl <= MUX_s_1_2_2(mux_247_nl, mux_233_cse, fsm_output(3));
  mux_253_nl <= MUX_s_1_2_2(mux_231_cse, mux_248_nl, fsm_output(2));
  mux_261_nl <= MUX_s_1_2_2(mux_241_cse, mux_253_nl, fsm_output(1));
  nor_83_nl <= NOT(mux_261_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_9_nl <= MUX1HOT_s_1_5_2((VEC_LOOP_j_1_sva(0)), (VEC_LOOP_acc_10_cse_1_sva(0)),
      (z_out_7(0)), (reg_VEC_LOOP_acc_1_1_reg(0)), (z_out_5(0)), STD_LOGIC_VECTOR'(
      and_dcpl_105 & and_dcpl_31 & and_dcpl_34 & nor_83_nl & VEC_LOOP_or_19_cse));
  vec_rsci_adra_d <= VEC_LOOP_mux1h_10_nl & VEC_LOOP_mux1h_8_nl & VEC_LOOP_mux1h_6_nl
      & VEC_LOOP_mux1h_4_nl & VEC_LOOP_mux1h_2_nl & VEC_LOOP_mux1h_nl & VEC_LOOP_mux1h_1_nl
      & VEC_LOOP_mux1h_3_nl & VEC_LOOP_mux1h_5_nl & VEC_LOOP_mux1h_7_nl & VEC_LOOP_mux1h_9_nl;
  vec_rsci_wea_d <= vec_rsci_wea_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_da_d <= vec_rsci_da_d_reg;
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_reg;
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_reg;
  and_dcpl <= NOT((fsm_output(2)) OR (fsm_output(0)));
  and_dcpl_201 <= (NOT (fsm_output(3))) AND (fsm_output(1));
  and_dcpl_202 <= and_dcpl_201 AND and_dcpl;
  and_dcpl_204 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_205 <= and_dcpl_204 AND (NOT (fsm_output(6)));
  and_dcpl_206 <= and_dcpl_205 AND nor_97_cse;
  and_dcpl_207 <= and_dcpl_206 AND and_dcpl_202;
  and_dcpl_208 <= (fsm_output(2)) AND (NOT (fsm_output(0)));
  and_dcpl_209 <= (fsm_output(3)) AND (NOT (fsm_output(1)));
  and_dcpl_210 <= and_dcpl_209 AND and_dcpl_208;
  and_dcpl_211 <= and_dcpl_206 AND and_dcpl_210;
  and_dcpl_212 <= and_dcpl_201 AND and_dcpl_208;
  and_dcpl_213 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_215 <= and_dcpl_205 AND and_dcpl_213 AND and_dcpl_212;
  and_dcpl_216 <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_dcpl_217 <= and_dcpl_216 AND and_dcpl;
  and_dcpl_218 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_219 <= and_dcpl_205 AND and_dcpl_218;
  and_dcpl_220 <= and_dcpl_219 AND and_dcpl_217;
  and_dcpl_221 <= (fsm_output(3)) AND (fsm_output(1));
  and_dcpl_222 <= and_dcpl_221 AND and_dcpl;
  and_dcpl_223 <= and_dcpl_219 AND and_dcpl_222;
  and_dcpl_224 <= and_dcpl_216 AND and_dcpl_208;
  and_dcpl_226 <= and_dcpl_205 AND nor_tmp_24;
  and_dcpl_227 <= and_dcpl_226 AND and_dcpl_224;
  and_dcpl_228 <= and_dcpl_221 AND and_dcpl_208;
  and_dcpl_229 <= and_dcpl_226 AND and_dcpl_228;
  and_dcpl_230 <= and_dcpl_209 AND and_dcpl;
  and_dcpl_231 <= and_dcpl_204 AND (fsm_output(6));
  and_dcpl_233 <= and_dcpl_231 AND nor_97_cse AND and_dcpl_230;
  and_dcpl_234 <= and_dcpl_231 AND and_dcpl_213;
  and_dcpl_235 <= and_dcpl_234 AND and_dcpl_202;
  and_dcpl_236 <= and_dcpl_234 AND and_dcpl_210;
  and_dcpl_238 <= and_dcpl_231 AND and_dcpl_218 AND and_dcpl_212;
  and_dcpl_239 <= and_dcpl_231 AND nor_tmp_24;
  and_dcpl_240 <= and_dcpl_239 AND and_dcpl_217;
  and_dcpl_241 <= and_dcpl_239 AND and_dcpl_222;
  and_dcpl_242 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_243 <= and_dcpl_242 AND (NOT (fsm_output(6)));
  and_dcpl_244 <= and_dcpl_243 AND nor_97_cse;
  and_dcpl_245 <= and_dcpl_244 AND and_dcpl_224;
  and_dcpl_246 <= and_dcpl_244 AND and_dcpl_228;
  and_dcpl_248 <= and_dcpl_243 AND and_dcpl_213 AND and_dcpl_230;
  and_dcpl_249 <= and_dcpl_243 AND and_dcpl_218;
  and_dcpl_250 <= and_dcpl_249 AND and_dcpl_202;
  and_dcpl_251 <= and_dcpl_249 AND and_dcpl_210;
  and_dcpl_253 <= and_dcpl_243 AND nor_tmp_24 AND and_dcpl_212;
  and_dcpl_254 <= and_dcpl_242 AND (fsm_output(6));
  and_dcpl_255 <= and_dcpl_254 AND nor_97_cse;
  and_dcpl_256 <= and_dcpl_255 AND and_dcpl_217;
  and_dcpl_257 <= and_dcpl_255 AND and_dcpl_222;
  and_dcpl_258 <= and_dcpl_254 AND and_dcpl_213;
  and_dcpl_259 <= and_dcpl_258 AND and_dcpl_224;
  and_dcpl_260 <= and_dcpl_258 AND and_dcpl_228;
  and_dcpl_262 <= and_dcpl_254 AND and_dcpl_218 AND and_dcpl_230;
  and_dcpl_263 <= and_dcpl_254 AND nor_tmp_24;
  and_dcpl_264 <= and_dcpl_263 AND and_dcpl_202;
  and_dcpl_265 <= and_dcpl_263 AND and_dcpl_210;
  and_dcpl_267 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100"));
  and_dcpl_269 <= and_dcpl_267 AND nor_97_cse AND and_dcpl_212;
  and_dcpl_270 <= and_dcpl_267 AND and_dcpl_213;
  and_dcpl_271 <= and_dcpl_270 AND and_dcpl_217;
  and_dcpl_272 <= and_dcpl_270 AND and_dcpl_222;
  and_dcpl_273 <= and_dcpl_267 AND and_dcpl_218;
  and_dcpl_274 <= and_dcpl_273 AND and_dcpl_224;
  and_dcpl_275 <= and_dcpl_273 AND and_dcpl_228;
  and_dcpl_277 <= and_dcpl_267 AND nor_tmp_24 AND and_dcpl_230;
  and_dcpl_295 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_301 <= and_dcpl_295 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_328 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("101")) AND
      nor_97_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
  and_dcpl_334 <= nor_62_cse AND (NOT (fsm_output(7)));
  and_dcpl_335 <= and_dcpl_334 AND nor_97_cse;
  and_dcpl_336 <= and_dcpl_335 AND and_dcpl_216 AND (fsm_output(2)) AND (NOT (fsm_output(0)));
  mux_555_nl <= MUX_s_1_2_2(nand_4_cse, mux_199_cse, fsm_output(5));
  mux_tmp_559 <= MUX_s_1_2_2(mux_169_cse, mux_555_nl, fsm_output(1));
  mux_tmp_561 <= MUX_s_1_2_2(or_tmp_86, or_268_cse, fsm_output(5));
  mux_565_nl <= MUX_s_1_2_2(mux_tmp_561, mux_167_cse, fsm_output(1));
  mux_566_nl <= MUX_s_1_2_2(mux_tmp_559, mux_565_nl, fsm_output(4));
  mux_561_nl <= MUX_s_1_2_2(nand_27_cse, or_tmp_86, fsm_output(5));
  mux_562_nl <= MUX_s_1_2_2(mux_561_nl, mux_tmp_561, fsm_output(1));
  mux_563_nl <= MUX_s_1_2_2(mux_562_nl, mux_tmp_559, fsm_output(4));
  mux_567_nl <= MUX_s_1_2_2(mux_566_nl, mux_563_nl, fsm_output(2));
  and_dcpl_337 <= NOT(mux_567_nl OR (fsm_output(0)));
  and_dcpl_338 <= (NOT (fsm_output(2))) AND (fsm_output(0));
  and_dcpl_340 <= and_dcpl_201 AND and_dcpl_338;
  and_dcpl_344 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("101")) AND
      nor_97_cse AND and_dcpl_340;
  and_dcpl_345 <= (fsm_output(2)) AND (fsm_output(0));
  and_dcpl_347 <= and_dcpl_221 AND and_dcpl_345;
  and_dcpl_352 <= and_dcpl_273 AND and_dcpl_347;
  and_dcpl_353 <= and_dcpl_216 AND and_dcpl_345;
  and_dcpl_354 <= and_dcpl_273 AND and_dcpl_353;
  and_dcpl_355 <= and_dcpl_221 AND and_dcpl_338;
  and_dcpl_358 <= and_dcpl_267 AND and_dcpl_213 AND and_dcpl_355;
  and_dcpl_359 <= and_dcpl_201 AND and_dcpl_345;
  and_dcpl_361 <= and_dcpl_334 AND and_dcpl_213 AND and_dcpl_359;
  and_dcpl_363 <= (fsm_output(3)) AND (NOT (fsm_output(1))) AND and_dcpl_345;
  and_dcpl_366 <= and_dcpl_52 AND (fsm_output(7));
  and_dcpl_367 <= and_dcpl_366 AND nor_tmp_24;
  and_dcpl_368 <= and_dcpl_367 AND and_dcpl_363;
  and_dcpl_369 <= and_dcpl_367 AND and_dcpl_340;
  and_dcpl_371 <= and_dcpl_267 AND nor_97_cse AND and_dcpl_359;
  and_dcpl_373 <= and_dcpl_334 AND and_dcpl_218 AND and_dcpl_355;
  and_dcpl_374 <= and_dcpl_366 AND and_dcpl_213;
  and_dcpl_375 <= and_dcpl_374 AND and_dcpl_347;
  and_dcpl_376 <= and_dcpl_374 AND and_dcpl_353;
  and_dcpl_377 <= nor_62_cse AND (fsm_output(7));
  and_dcpl_379 <= and_dcpl_377 AND nor_tmp_24 AND and_dcpl_359;
  and_dcpl_380 <= and_dcpl_377 AND and_dcpl_218;
  and_dcpl_381 <= and_dcpl_380 AND and_dcpl_363;
  and_dcpl_382 <= and_dcpl_380 AND and_dcpl_340;
  and_dcpl_384 <= and_dcpl_366 AND nor_97_cse AND and_dcpl_355;
  and_dcpl_385 <= and_dcpl_377 AND nor_97_cse;
  and_dcpl_386 <= and_dcpl_385 AND and_dcpl_347;
  and_dcpl_387 <= and_dcpl_385 AND and_dcpl_353;
  and_dcpl_388 <= and_dcpl_52 AND (NOT (fsm_output(7)));
  and_dcpl_390 <= and_dcpl_388 AND nor_tmp_24 AND and_dcpl_355;
  and_dcpl_392 <= and_dcpl_388 AND and_dcpl_218 AND and_dcpl_359;
  and_dcpl_393 <= and_dcpl_388 AND and_dcpl_213;
  and_dcpl_394 <= and_dcpl_393 AND and_dcpl_340;
  and_dcpl_395 <= and_dcpl_393 AND and_dcpl_363;
  and_dcpl_396 <= and_dcpl_334 AND nor_tmp_24;
  and_dcpl_397 <= and_dcpl_396 AND and_dcpl_353;
  and_dcpl_398 <= and_dcpl_396 AND and_dcpl_347;
  and_dcpl_399 <= and_dcpl_335 AND and_dcpl_363;
  and_dcpl_410 <= and_dcpl_335 AND and_dcpl_228;
  and_463_cse <= and_dcpl_334 AND and_dcpl_213 AND and_dcpl_230;
  and_dcpl_420 <= and_dcpl_334 AND and_dcpl_218;
  and_468_cse <= and_dcpl_420 AND and_dcpl_202;
  and_470_cse <= and_dcpl_420 AND and_dcpl_210;
  and_474_cse <= and_dcpl_334 AND nor_tmp_24 AND and_dcpl_212;
  and_dcpl_431 <= and_dcpl_388 AND nor_97_cse;
  and_479_cse <= and_dcpl_431 AND and_dcpl_217;
  and_481_cse <= and_dcpl_431 AND and_dcpl_222;
  and_483_cse <= and_dcpl_393 AND and_dcpl_224;
  and_484_cse <= and_dcpl_393 AND and_dcpl_228;
  and_486_cse <= and_dcpl_388 AND and_dcpl_218 AND and_dcpl_230;
  and_dcpl_440 <= and_dcpl_388 AND nor_tmp_24;
  and_488_cse <= and_dcpl_440 AND and_dcpl_202;
  and_489_cse <= and_dcpl_440 AND and_dcpl_210;
  and_492_cse <= and_dcpl_377 AND nor_97_cse AND and_dcpl_212;
  and_dcpl_446 <= and_dcpl_377 AND and_dcpl_213;
  and_494_cse <= and_dcpl_446 AND and_dcpl_217;
  and_495_cse <= and_dcpl_446 AND and_dcpl_222;
  and_497_cse <= and_dcpl_380 AND and_dcpl_224;
  and_498_cse <= and_dcpl_380 AND and_dcpl_228;
  and_500_cse <= and_dcpl_377 AND nor_tmp_24 AND and_dcpl_230;
  and_dcpl_455 <= and_dcpl_366 AND nor_97_cse;
  and_503_cse <= and_dcpl_455 AND and_dcpl_202;
  and_504_cse <= and_dcpl_455 AND and_dcpl_210;
  and_506_cse <= and_dcpl_366 AND and_dcpl_213 AND and_dcpl_212;
  and_dcpl_460 <= and_dcpl_366 AND and_dcpl_218;
  and_508_cse <= and_dcpl_460 AND and_dcpl_217;
  and_509_cse <= and_dcpl_460 AND and_dcpl_222;
  and_511_cse <= and_dcpl_367 AND and_dcpl_224;
  and_512_cse <= and_dcpl_367 AND and_dcpl_228;
  and_516_cse <= and_dcpl_267 AND nor_97_cse AND and_dcpl_230;
  and_518_cse <= and_dcpl_270 AND and_dcpl_202;
  and_519_cse <= and_dcpl_270 AND and_dcpl_210;
  and_521_cse <= and_dcpl_267 AND and_dcpl_218 AND and_dcpl_212;
  and_dcpl_475 <= and_dcpl_267 AND nor_tmp_24;
  and_523_cse <= and_dcpl_475 AND and_dcpl_217;
  and_524_cse <= and_dcpl_475 AND and_dcpl_222;
  and_dcpl_500 <= and_dcpl_334 AND nor_97_cse AND and_dcpl_228;
  and_dcpl_567 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("101")) AND
      nor_97_cse AND and_dcpl_224;
  and_dcpl_569 <= and_dcpl_209 AND and_dcpl_338;
  and_dcpl_570 <= and_dcpl_475 AND and_dcpl_569;
  and_dcpl_571 <= and_dcpl_216 AND and_dcpl_338;
  and_dcpl_572 <= and_dcpl_420 AND and_dcpl_571;
  and_dcpl_573 <= and_dcpl_270 AND and_dcpl_571;
  and_dcpl_574 <= and_dcpl_460 AND and_dcpl_569;
  and_dcpl_575 <= and_dcpl_455 AND and_dcpl_571;
  and_dcpl_576 <= and_dcpl_440 AND and_dcpl_571;
  and_dcpl_577 <= and_dcpl_446 AND and_dcpl_569;
  and_dcpl_578 <= and_dcpl_431 AND and_dcpl_569;
  COMP_LOOP_twiddle_f_or_ssc <= and_dcpl_220 OR and_dcpl_227 OR and_dcpl_233 OR and_dcpl_236
      OR and_dcpl_240 OR and_dcpl_245 OR and_dcpl_248 OR and_dcpl_251 OR and_dcpl_256
      OR and_dcpl_259 OR and_dcpl_262 OR and_dcpl_265 OR and_dcpl_271 OR and_dcpl_274
      OR and_dcpl_277;
  VEC_LOOP_or_6_ssc <= and_dcpl_500 OR and_468_cse OR and_474_cse OR and_481_cse
      OR and_484_cse OR and_488_cse OR and_492_cse OR and_495_cse OR and_498_cse
      OR and_503_cse OR and_506_cse OR and_509_cse OR and_512_cse OR and_518_cse
      OR and_521_cse OR and_524_cse;
  or_tmp <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4))
      OR (fsm_output(5)) OR (fsm_output(7));
  mux_tmp <= MUX_s_1_2_2((NOT or_tmp), (fsm_output(7)), fsm_output(8));
  nand_tmp <= NOT((fsm_output(3)) AND (NOT or_tmp_233));
  nor_tmp_42 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  nand_52_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_tmp_369 <= NOT(nand_52_cse AND (fsm_output(2)));
  mux_tmp_587 <= MUX_s_1_2_2((NOT or_tmp_369), nor_tmp_42, fsm_output(3));
  mux_tmp_588 <= MUX_s_1_2_2((NOT mux_tmp_587), nand_tmp, fsm_output(4));
  mux_tmp_589 <= MUX_s_1_2_2(or_tmp_233, or_247_cse, fsm_output(3));
  or_tmp_373 <= (fsm_output(3)) OR (NOT nor_tmp_42);
  mux_tmp_590 <= MUX_s_1_2_2(or_tmp_373, mux_tmp_589, fsm_output(4));
  mux_tmp_593 <= MUX_s_1_2_2(or_247_cse, or_tmp_369, fsm_output(3));
  mux_tmp_594 <= MUX_s_1_2_2(nand_tmp, mux_tmp_593, fsm_output(4));
  mux_tmp_597 <= MUX_s_1_2_2((NOT mux_tmp_589), mux_tmp_587, fsm_output(4));
  or_tmp_375 <= (fsm_output(0)) OR (NOT (fsm_output(2)));
  or_tmp_376 <= and_231_cse OR (fsm_output(8));
  or_tmp_377 <= (fsm_output(3)) OR (NOT (fsm_output(1))) OR (fsm_output(8));
  nand_39_nl <= NOT((fsm_output(3)) AND (NOT or_tmp_376));
  mux_tmp_608 <= MUX_s_1_2_2(or_tmp_377, nand_39_nl, fsm_output(6));
  or_tmp_378 <= (NOT (fsm_output(1))) OR (fsm_output(8));
  mux_tmp_609 <= MUX_s_1_2_2(or_tmp_376, or_tmp_378, fsm_output(3));
  or_tmp_379 <= (fsm_output(6)) OR mux_tmp_609;
  mux_tmp_610 <= MUX_s_1_2_2(or_tmp_379, mux_tmp_608, fsm_output(7));
  not_tmp_311 <= nand_52_cse AND (fsm_output(8));
  nand_tmp_19 <= NOT((fsm_output(6)) AND (NOT mux_tmp_609));
  nor_tmp_47 <= (fsm_output(1)) AND (fsm_output(8));
  mux_615_nl <= MUX_s_1_2_2(not_tmp_311, nor_tmp_47, fsm_output(3));
  mux_616_nl <= MUX_s_1_2_2((NOT mux_615_nl), or_tmp_377, fsm_output(6));
  or_585_nl <= (fsm_output(6)) OR (NOT (fsm_output(3))) OR or_tmp_376;
  mux_tmp_617 <= MUX_s_1_2_2(mux_616_nl, or_585_nl, fsm_output(7));
  nand_tmp_22 <= NOT((fsm_output(4)) AND (fsm_output(6)) AND (NOT mux_tmp_461));
  mux_tmp_661 <= MUX_s_1_2_2(nand_47_cse, mux_548_cse, fsm_output(3));
  COMP_LOOP_twiddle_f_nor_1_itm <= NOT(and_dcpl_207 OR and_dcpl_215 OR and_dcpl_223
      OR and_dcpl_229 OR and_dcpl_235 OR and_dcpl_238 OR and_dcpl_241 OR and_dcpl_246
      OR and_dcpl_250 OR and_dcpl_253 OR and_dcpl_257 OR and_dcpl_260 OR and_dcpl_264
      OR and_dcpl_269 OR and_dcpl_272 OR and_dcpl_275);
  COMP_LOOP_twiddle_f_or_itm <= and_dcpl_211 OR and_dcpl_215;
  COMP_LOOP_twiddle_f_or_21_itm <= and_dcpl_229 OR and_dcpl_238 OR and_dcpl_246 OR
      and_dcpl_253 OR and_dcpl_260 OR and_dcpl_269 OR and_dcpl_275;
  COMP_LOOP_twiddle_f_nor_2_itm <= NOT(and_dcpl_207 OR and_dcpl_223 OR and_dcpl_235
      OR and_dcpl_241 OR and_dcpl_250 OR and_dcpl_257 OR and_dcpl_264 OR and_dcpl_272);
  COMP_LOOP_twiddle_f_or_23_itm <= and_dcpl_223 OR and_dcpl_241 OR and_dcpl_257 OR
      and_dcpl_272;
  COMP_LOOP_twiddle_f_nor_3_itm <= NOT(and_dcpl_207 OR and_dcpl_235 OR and_dcpl_250
      OR and_dcpl_264);
  COMP_LOOP_twiddle_f_or_28_itm <= and_dcpl_235 OR and_dcpl_264;
  COMP_LOOP_twiddle_f_or_39_itm <= and_dcpl_215 OR and_dcpl_229 OR and_dcpl_238 OR
      and_dcpl_246 OR and_dcpl_253 OR and_dcpl_260 OR and_dcpl_269 OR and_dcpl_275;
  COMP_LOOP_twiddle_f_or_40_itm <= and_dcpl_211 OR and_dcpl_220 OR and_dcpl_227 OR
      and_dcpl_233 OR and_dcpl_236 OR and_dcpl_240 OR and_dcpl_245 OR and_dcpl_248
      OR and_dcpl_251 OR and_dcpl_256 OR and_dcpl_259 OR and_dcpl_262 OR and_dcpl_265
      OR and_dcpl_271 OR and_dcpl_274 OR and_dcpl_277;
  VEC_LOOP_nor_3_itm <= NOT(and_dcpl_337 OR and_dcpl_344 OR and_dcpl_352 OR and_dcpl_354
      OR and_dcpl_358 OR and_dcpl_361 OR and_dcpl_368 OR and_dcpl_369 OR and_dcpl_371
      OR and_dcpl_373 OR and_dcpl_375 OR and_dcpl_376 OR and_dcpl_379 OR and_dcpl_381
      OR and_dcpl_382 OR and_dcpl_384 OR and_dcpl_386 OR and_dcpl_387 OR and_dcpl_390
      OR and_dcpl_392 OR and_dcpl_394 OR and_dcpl_395 OR and_dcpl_397 OR and_dcpl_398
      OR and_dcpl_399);
  VEC_LOOP_or_51_itm <= and_dcpl_352 OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_361
      OR and_dcpl_368 OR and_dcpl_369 OR and_dcpl_371 OR and_dcpl_373 OR and_dcpl_375
      OR and_dcpl_376 OR and_dcpl_379 OR and_dcpl_381 OR and_dcpl_382 OR and_dcpl_384
      OR and_dcpl_386 OR and_dcpl_387 OR and_dcpl_390 OR and_dcpl_392 OR and_dcpl_394
      OR and_dcpl_395 OR and_dcpl_397 OR and_dcpl_398 OR and_dcpl_399;
  VEC_LOOP_nor_12_itm <= NOT(and_497_cse OR and_463_cse OR and_479_cse OR and_486_cse
      OR and_494_cse OR and_500_cse OR and_508_cse OR and_516_cse OR and_523_cse
      OR and_470_cse OR and_489_cse OR and_504_cse OR and_519_cse OR and_483_cse
      OR and_511_cse OR and_dcpl_567 OR and_dcpl_570 OR and_dcpl_572 OR and_dcpl_573
      OR and_dcpl_574 OR and_dcpl_575 OR and_dcpl_576 OR and_dcpl_577 OR and_dcpl_578);
  VEC_LOOP_or_40_itm <= and_463_cse OR and_479_cse OR and_486_cse OR and_494_cse
      OR and_500_cse OR and_508_cse OR and_516_cse OR and_523_cse;
  VEC_LOOP_or_43_itm <= and_470_cse OR and_489_cse OR and_504_cse OR and_519_cse;
  VEC_LOOP_or_54_itm <= and_dcpl_572 OR and_dcpl_573 OR and_dcpl_575 OR and_dcpl_576;
  VEC_LOOP_or_62_itm <= and_470_cse OR and_489_cse OR and_504_cse OR and_519_cse
      OR and_dcpl_572 OR and_dcpl_573 OR and_dcpl_575 OR and_dcpl_576;
  VEC_LOOP_or_66_itm <= and_483_cse OR and_511_cse OR and_dcpl_574 OR and_dcpl_578;
  VEC_LOOP_or_67_itm <= and_497_cse OR and_dcpl_577;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        VEC_LOOP_mult_vec_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(63 DOWNTO 32)),
            (vec_rsci_qa_d_mxwt(31 DOWNTO 0)), and_dcpl_193);
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
        reg_ensig_cgo_2_cse <= '0';
      ELSIF ( complete_rsci_wen_comp = '1' ) THEN
        reg_run_rsci_oswt_cse <= NOT(or_dcpl_142 OR or_dcpl_138);
        reg_vec_rsci_oswt_cse <= NOT mux_129_itm;
        reg_vec_rsci_oswt_1_cse <= nor_87_cse;
        reg_twiddle_rsci_oswt_cse <= nor_82_rmff;
        reg_complete_rsci_oswt_cse <= and_dcpl_24 AND and_dcpl_19 AND (fsm_output(6))
            AND (fsm_output(8)) AND (z_out_7(4));
        reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_168;
        reg_ensig_cgo_cse <= NOT mux_325_itm;
        reg_ensig_cgo_2_cse <= NOT mux_359_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((and_dcpl_54 AND and_dcpl_20) OR STAGE_LOOP_i_3_0_sva_mx0c1))
          = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_377_nl) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_tmp_379) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_586_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_k_14_5_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (z_out_3(8
            DOWNTO 0)), COMP_LOOP_k_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_382_nl OR CONV_SL_1_1(fsm_output(8 DOWNTO
          6)/=STD_LOGIC_VECTOR'("000")))) = '1' ) THEN
        COMP_LOOP_1_twiddle_f_acc_cse_sva <= COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_386_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_17_twiddle_f_lshift_itm <= MUX_v_10_2_2((z_out_1(9 DOWNTO 0)),
            (z_out_7(9 DOWNTO 0)), and_dcpl_81);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (VEC_LOOP_j_1_sva_mx0c0 OR (NOT(mux_161_itm
          OR (fsm_output(0)))) OR and_dcpl_118)) = '1' ) THEN
        VEC_LOOP_j_1_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            VEC_LOOP_mux_2_nl, VEC_LOOP_j_not_1_nl);
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
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (and_dcpl_25 OR and_dcpl_168)) = '1' )
          THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm <= MUX_s_1_2_2((z_out_4(18)),
            run_rsci_ivld_mxwt, and_dcpl_168);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_25 OR and_dcpl_34 OR and_dcpl_39
          OR and_dcpl_44 OR and_dcpl_46 OR and_dcpl_51 OR and_dcpl_55 OR and_dcpl_56
          OR and_dcpl_58 OR and_dcpl_63 OR and_dcpl_66 OR and_dcpl_68 OR and_dcpl_70
          OR and_dcpl_74 OR and_dcpl_76 OR and_dcpl_78 OR and_dcpl_81 OR and_dcpl_83
          OR and_dcpl_84 OR and_dcpl_86 OR and_dcpl_87 OR and_dcpl_88 OR and_dcpl_90
          OR and_dcpl_91 OR and_dcpl_92 OR and_dcpl_93 OR and_dcpl_96 OR and_dcpl_97
          OR and_dcpl_98 OR and_dcpl_100 OR and_dcpl_101 OR and_dcpl_102)) = '1'
          ) THEN
        VEC_LOOP_acc_10_cse_1_sva <= z_out_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_193_cse OR (NOT (fsm_output(2))) OR
          or_dcpl_139 OR or_dcpl_138))) = '1' ) THEN
        VEC_LOOP_j_1_sva_1 <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_607_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        reg_VEC_LOOP_acc_1_reg <= VEC_LOOP_and_4_rgt(13 DOWNTO 9);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_630_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        reg_VEC_LOOP_acc_1_1_reg <= VEC_LOOP_and_4_rgt(8 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (((NOT((fsm_output(1)) XOR (fsm_output(3))))
          AND (fsm_output(0)) AND (fsm_output(2)) AND (NOT (fsm_output(4))) AND and_dcpl_20)
          OR and_dcpl_193)) = '1' ) THEN
        factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(31 DOWNTO 0)), (vec_rsci_qa_d_mxwt(63
            DOWNTO 32)), and_dcpl_193);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_510_nl) = '1' ) THEN
        COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_10_14_0_sva_1 <= STD_LOGIC_VECTOR'( "000000000000000");
      ELSIF ( (complete_rsci_wen_comp AND (NOT(mux_526_nl OR (fsm_output(0))))) =
          '1' ) THEN
        VEC_LOOP_j_10_14_0_sva_1 <= z_out_4(14 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_527_nl) = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= z_out_2(12 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_646_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_12_psp_sva_12 <= z_out_7(12);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_658_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_12_psp_sva_11 <= z_out_7(11);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_667_nl) AND nor_44_cse_1 AND complete_rsci_wen_comp) = '1' )
          THEN
        VEC_LOOP_acc_12_psp_sva_10_0 <= z_out_7(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_546_nl) = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out_2(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_547_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_9_twiddle_f_lshift_ncse_sva <= z_out_2(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  nor_55_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000")));
  or_377_nl <= (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(3))
      OR (or_193_cse AND (fsm_output(2)));
  mux_376_nl <= MUX_s_1_2_2((fsm_output(7)), or_377_nl, fsm_output(6));
  mux_377_nl <= MUX_s_1_2_2(nor_55_nl, mux_376_nl, fsm_output(8));
  COMP_LOOP_k_not_nl <= NOT mux_tmp_379;
  and_627_nl <= (fsm_output(8)) AND or_539_cse;
  mux_585_nl <= MUX_s_1_2_2(mux_tmp, and_627_nl, fsm_output(6));
  and_nl <= (fsm_output(8)) AND or_tmp;
  mux_584_nl <= MUX_s_1_2_2(mux_tmp, and_nl, fsm_output(6));
  mux_586_nl <= MUX_s_1_2_2(mux_585_nl, mux_584_nl, fsm_output(0));
  nor_53_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"))
      OR and_231_cse);
  mux_382_nl <= MUX_s_1_2_2(nor_53_nl, or_tmp_234, fsm_output(5));
  nor_52_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"))
      OR and_231_cse);
  mux_383_nl <= MUX_s_1_2_2(and_231_cse, (NOT or_193_cse), fsm_output(2));
  mux_384_nl <= MUX_s_1_2_2(mux_383_nl, or_516_cse, fsm_output(3));
  and_185_nl <= (fsm_output(5)) AND ((fsm_output(4)) OR mux_384_nl);
  mux_385_nl <= MUX_s_1_2_2(nor_52_nl, and_185_nl, fsm_output(7));
  mux_386_nl <= MUX_s_1_2_2(mux_385_nl, (fsm_output(7)), fsm_output(6));
  VEC_LOOP_mux_2_nl <= MUX_v_32_2_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z, VEC_LOOP_j_1_sva_1,
      and_dcpl_118);
  VEC_LOOP_j_not_1_nl <= NOT VEC_LOOP_j_1_sva_mx0c0;
  mux_601_nl <= MUX_s_1_2_2((NOT or_tmp_375), or_tmp_375, fsm_output(1));
  mux_602_nl <= MUX_s_1_2_2((NOT (fsm_output(2))), mux_601_nl, fsm_output(3));
  mux_603_nl <= MUX_s_1_2_2(mux_602_nl, or_tmp_373, fsm_output(4));
  mux_604_nl <= MUX_s_1_2_2(mux_603_nl, mux_tmp_594, fsm_output(6));
  mux_600_nl <= MUX_s_1_2_2((NOT mux_tmp_597), mux_tmp_590, fsm_output(6));
  mux_605_nl <= MUX_s_1_2_2(mux_604_nl, mux_600_nl, fsm_output(5));
  mux_598_nl <= MUX_s_1_2_2(mux_tmp_588, (NOT mux_tmp_597), fsm_output(6));
  mux_595_nl <= MUX_s_1_2_2(mux_tmp_593, or_tmp_373, fsm_output(4));
  mux_596_nl <= MUX_s_1_2_2(mux_595_nl, mux_tmp_594, fsm_output(6));
  mux_599_nl <= MUX_s_1_2_2(mux_598_nl, mux_596_nl, fsm_output(5));
  mux_606_nl <= MUX_s_1_2_2(mux_605_nl, mux_599_nl, fsm_output(7));
  or_543_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("00010"));
  mux_591_nl <= MUX_s_1_2_2(mux_tmp_590, or_543_nl, fsm_output(6));
  or_542_nl <= (fsm_output(6)) OR mux_tmp_588;
  mux_592_nl <= MUX_s_1_2_2(mux_591_nl, or_542_nl, fsm_output(5));
  or_546_nl <= (fsm_output(7)) OR mux_592_nl;
  mux_607_nl <= MUX_s_1_2_2(mux_606_nl, or_546_nl, fsm_output(8));
  or_556_nl <= (fsm_output(0)) OR (NOT nor_tmp_47);
  mux_626_nl <= MUX_s_1_2_2(or_556_nl, or_tmp_376, fsm_output(3));
  nand_43_nl <= NOT((fsm_output(6)) AND (NOT mux_626_nl));
  mux_627_nl <= MUX_s_1_2_2(nand_43_nl, nand_tmp_19, fsm_output(7));
  mux_622_nl <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), fsm_output(1));
  mux_623_nl <= MUX_s_1_2_2(mux_622_nl, nor_tmp_47, fsm_output(0));
  or_554_nl <= (fsm_output(1)) OR (fsm_output(8));
  mux_621_nl <= MUX_s_1_2_2(or_tmp_378, or_554_nl, fsm_output(0));
  mux_624_nl <= MUX_s_1_2_2((NOT mux_623_nl), mux_621_nl, fsm_output(3));
  or_555_nl <= (fsm_output(6)) OR mux_624_nl;
  mux_625_nl <= MUX_s_1_2_2(or_555_nl, or_tmp_379, fsm_output(7));
  mux_628_nl <= MUX_s_1_2_2(mux_627_nl, mux_625_nl, fsm_output(2));
  mux_620_nl <= MUX_s_1_2_2(mux_tmp_610, mux_tmp_617, fsm_output(2));
  mux_629_nl <= MUX_s_1_2_2(mux_628_nl, mux_620_nl, fsm_output(5));
  mux_614_nl <= MUX_s_1_2_2(mux_tmp_608, nand_tmp_19, fsm_output(7));
  mux_618_nl <= MUX_s_1_2_2(mux_tmp_617, mux_614_nl, fsm_output(2));
  nand_40_nl <= NOT((fsm_output(3)) AND not_tmp_311);
  mux_611_nl <= MUX_s_1_2_2(nand_40_nl, mux_tmp_609, fsm_output(6));
  or_552_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(1)))
      OR (fsm_output(8));
  mux_612_nl <= MUX_s_1_2_2(mux_611_nl, or_552_nl, fsm_output(7));
  mux_613_nl <= MUX_s_1_2_2(mux_612_nl, mux_tmp_610, fsm_output(2));
  mux_619_nl <= MUX_s_1_2_2(mux_618_nl, mux_613_nl, fsm_output(5));
  mux_630_nl <= MUX_s_1_2_2(mux_629_nl, mux_619_nl, fsm_output(4));
  nor_127_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000"))
      OR (CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND or_193_cse));
  or_537_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR (CONV_SL_1_1(fsm_output(5
      DOWNTO 3)=STD_LOGIC_VECTOR'("111")) AND or_dcpl_141);
  mux_510_nl <= MUX_s_1_2_2(nor_127_nl, or_537_nl, fsm_output(8));
  mux_523_nl <= MUX_s_1_2_2(mux_190_cse, mux_185_cse, fsm_output(5));
  mux_524_nl <= MUX_s_1_2_2(mux_191_cse, mux_523_nl, fsm_output(1));
  mux_525_nl <= MUX_s_1_2_2(mux_tmp_516, mux_524_nl, fsm_output(4));
  mux_521_nl <= MUX_s_1_2_2(mux_188_cse, mux_191_cse, fsm_output(1));
  mux_522_nl <= MUX_s_1_2_2(mux_521_nl, mux_tmp_516, fsm_output(4));
  mux_526_nl <= MUX_s_1_2_2(mux_525_nl, mux_522_nl, fsm_output(2));
  nor_126_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"))
      OR ((fsm_output(4)) AND ((fsm_output(3)) OR (CONV_SL_1_1(fsm_output(2 DOWNTO
      0)=STD_LOGIC_VECTOR'("111"))))));
  or_536_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR ((fsm_output(5))
      AND ((fsm_output(4)) OR (CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111")))));
  mux_527_nl <= MUX_s_1_2_2(nor_126_nl, or_536_nl, fsm_output(8));
  mux_642_nl <= MUX_s_1_2_2(mux_654_cse, mux_tmp_461, fsm_output(6));
  mux_640_nl <= MUX_s_1_2_2(or_tmp_85, (fsm_output(7)), fsm_output(5));
  mux_641_nl <= MUX_s_1_2_2(mux_640_nl, or_571_cse, fsm_output(6));
  mux_643_nl <= MUX_s_1_2_2(mux_642_nl, mux_641_nl, fsm_output(4));
  mux_644_nl <= MUX_s_1_2_2(mux_643_nl, mux_639_cse, fsm_output(0));
  mux_645_nl <= MUX_s_1_2_2(mux_644_nl, mux_637_cse, fsm_output(3));
  or_565_nl <= (fsm_output(1)) OR mux_645_nl;
  mux_635_nl <= MUX_s_1_2_2(nand_tmp_22, mux_633_cse, fsm_output(3));
  mux_646_nl <= MUX_s_1_2_2(or_565_nl, mux_635_nl, fsm_output(2));
  or_575_nl <= (fsm_output(0)) OR mux_468_cse;
  mux_656_nl <= MUX_s_1_2_2(or_575_nl, nand_tmp_22, fsm_output(2));
  or_572_nl <= (fsm_output(0)) OR mux_633_cse;
  mux_653_nl <= MUX_s_1_2_2(mux_637_cse, or_572_nl, fsm_output(2));
  mux_657_nl <= MUX_s_1_2_2(mux_656_nl, mux_653_nl, fsm_output(3));
  nand_45_nl <= NOT((NOT (fsm_output(3))) AND (fsm_output(2)) AND (fsm_output(4))
      AND (fsm_output(6)) AND (NOT mux_tmp_461));
  mux_658_nl <= MUX_s_1_2_2(mux_657_nl, nand_45_nl, fsm_output(1));
  mux_665_nl <= MUX_s_1_2_2(or_564_cse, or_442_cse, fsm_output(3));
  mux_666_nl <= MUX_s_1_2_2(mux_tmp_661, mux_665_nl, fsm_output(4));
  nand_49_nl <= NOT((fsm_output(3)) AND (NOT mux_649_cse));
  mux_663_nl <= MUX_s_1_2_2(nand_49_nl, mux_tmp_661, fsm_output(4));
  mux_667_nl <= MUX_s_1_2_2(mux_666_nl, mux_663_nl, fsm_output(2));
  nor_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR ((fsm_output(5))
      AND or_dcpl_142));
  or_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000")) OR (CONV_SL_1_1(fsm_output(4
      DOWNTO 3)=STD_LOGIC_VECTOR'("11")) AND or_tmp_233);
  mux_546_nl <= MUX_s_1_2_2(nor_nl, or_nl, fsm_output(8));
  nor_77_nl <= NOT((fsm_output(7)) OR ((fsm_output(5)) AND or_tmp_234));
  and_245_nl <= (fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(4)) AND (CONV_SL_1_1(fsm_output(3
      DOWNTO 2)/=STD_LOGIC_VECTOR'("00")) OR and_231_cse);
  mux_547_nl <= MUX_s_1_2_2(nor_77_nl, and_245_nl, fsm_output(6));
  COMP_LOOP_twiddle_f_mux_8_nl <= MUX_s_1_2_2((z_out_2(13)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(13)),
      COMP_LOOP_twiddle_f_or_ssc);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl <= COMP_LOOP_twiddle_f_mux_8_nl
      AND COMP_LOOP_twiddle_f_nor_1_itm;
  COMP_LOOP_twiddle_f_mux1h_353_nl <= MUX1HOT_s_1_3_2((z_out_2(12)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(12)),
      (COMP_LOOP_3_twiddle_f_lshift_ncse_sva(12)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_itm
      & COMP_LOOP_twiddle_f_or_ssc & COMP_LOOP_twiddle_f_or_21_itm));
  COMP_LOOP_twiddle_f_and_22_nl <= COMP_LOOP_twiddle_f_mux1h_353_nl AND COMP_LOOP_twiddle_f_nor_2_itm;
  COMP_LOOP_twiddle_f_mux1h_354_nl <= MUX1HOT_s_1_4_2((z_out_2(11)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(11)),
      (COMP_LOOP_5_twiddle_f_lshift_ncse_sva(11)), (COMP_LOOP_3_twiddle_f_lshift_ncse_sva(11)),
      STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_itm & COMP_LOOP_twiddle_f_or_ssc
      & COMP_LOOP_twiddle_f_or_23_itm & COMP_LOOP_twiddle_f_or_21_itm));
  COMP_LOOP_twiddle_f_and_23_nl <= COMP_LOOP_twiddle_f_mux1h_354_nl AND COMP_LOOP_twiddle_f_nor_3_itm;
  COMP_LOOP_twiddle_f_mux1h_355_nl <= MUX1HOT_v_2_6_2((z_out_2(10 DOWNTO 9)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(10
      DOWNTO 9)), (COMP_LOOP_5_twiddle_f_lshift_ncse_sva(10 DOWNTO 9)), (COMP_LOOP_3_twiddle_f_lshift_ncse_sva(10
      DOWNTO 9)), (COMP_LOOP_9_twiddle_f_lshift_ncse_sva(10 DOWNTO 9)), STD_LOGIC_VECTOR'(
      '0' & (COMP_LOOP_17_twiddle_f_lshift_itm(9))), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_itm
      & COMP_LOOP_twiddle_f_or_ssc & COMP_LOOP_twiddle_f_or_23_itm & COMP_LOOP_twiddle_f_or_21_itm
      & COMP_LOOP_twiddle_f_or_28_itm & and_dcpl_250));
  not_825_nl <= NOT and_dcpl_207;
  COMP_LOOP_twiddle_f_and_24_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_twiddle_f_mux1h_355_nl,
      not_825_nl);
  COMP_LOOP_twiddle_f_or_53_nl <= and_dcpl_207 OR and_dcpl_211 OR and_dcpl_215;
  COMP_LOOP_twiddle_f_mux1h_356_nl <= MUX1HOT_v_9_6_2((z_out_2(8 DOWNTO 0)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(8
      DOWNTO 0)), (COMP_LOOP_5_twiddle_f_lshift_ncse_sva(8 DOWNTO 0)), (COMP_LOOP_3_twiddle_f_lshift_ncse_sva(8
      DOWNTO 0)), (COMP_LOOP_9_twiddle_f_lshift_ncse_sva(8 DOWNTO 0)), (COMP_LOOP_17_twiddle_f_lshift_itm(8
      DOWNTO 0)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_53_nl & COMP_LOOP_twiddle_f_or_ssc
      & COMP_LOOP_twiddle_f_or_23_itm & COMP_LOOP_twiddle_f_or_21_itm & COMP_LOOP_twiddle_f_or_28_itm
      & and_dcpl_250));
  COMP_LOOP_twiddle_f_and_25_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND COMP_LOOP_twiddle_f_nor_1_itm;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(7)),
      (COMP_LOOP_k_14_5_sva_8_0(8)), COMP_LOOP_twiddle_f_or_39_itm);
  COMP_LOOP_twiddle_f_and_26_nl <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl
      AND COMP_LOOP_twiddle_f_nor_2_itm;
  COMP_LOOP_twiddle_f_mux1h_357_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_14_5_sva_8_0(6)),
      (COMP_LOOP_k_14_5_sva_8_0(7)), (COMP_LOOP_k_14_5_sva_8_0(8)), STD_LOGIC_VECTOR'(
      COMP_LOOP_twiddle_f_or_40_itm & COMP_LOOP_twiddle_f_or_39_itm & COMP_LOOP_twiddle_f_or_23_itm));
  COMP_LOOP_twiddle_f_and_27_nl <= COMP_LOOP_twiddle_f_mux1h_357_nl AND COMP_LOOP_twiddle_f_nor_3_itm;
  COMP_LOOP_twiddle_f_mux1h_358_nl <= MUX1HOT_v_6_6_2((STD_LOGIC_VECTOR'( "00") &
      (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 5))), (COMP_LOOP_k_14_5_sva_8_0(5 DOWNTO
      0)), (COMP_LOOP_k_14_5_sva_8_0(6 DOWNTO 1)), (COMP_LOOP_k_14_5_sva_8_0(7 DOWNTO
      2)), (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 3)), ('0' & (COMP_LOOP_k_14_5_sva_8_0(8
      DOWNTO 4))), STD_LOGIC_VECTOR'( and_dcpl_207 & COMP_LOOP_twiddle_f_or_40_itm
      & COMP_LOOP_twiddle_f_or_39_itm & COMP_LOOP_twiddle_f_or_23_itm & COMP_LOOP_twiddle_f_or_28_itm
      & and_dcpl_250));
  COMP_LOOP_twiddle_f_mux1h_359_nl <= MUX1HOT_s_1_5_2((COMP_LOOP_k_14_5_sva_8_0(4)),
      (COMP_LOOP_k_14_5_sva_8_0(0)), (COMP_LOOP_k_14_5_sva_8_0(1)), (COMP_LOOP_k_14_5_sva_8_0(2)),
      (COMP_LOOP_k_14_5_sva_8_0(3)), STD_LOGIC_VECTOR'( and_dcpl_207 & COMP_LOOP_twiddle_f_or_39_itm
      & COMP_LOOP_twiddle_f_or_23_itm & COMP_LOOP_twiddle_f_or_28_itm & and_dcpl_250));
  COMP_LOOP_twiddle_f_or_54_nl <= (COMP_LOOP_twiddle_f_mux1h_359_nl AND (NOT(and_dcpl_211
      OR and_dcpl_220 OR and_dcpl_227 OR and_dcpl_233 OR and_dcpl_236 OR and_dcpl_240
      OR and_dcpl_245 OR and_dcpl_248))) OR and_dcpl_251 OR and_dcpl_256 OR and_dcpl_259
      OR and_dcpl_262 OR and_dcpl_265 OR and_dcpl_271 OR and_dcpl_274 OR and_dcpl_277;
  COMP_LOOP_twiddle_f_mux1h_360_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_14_5_sva_8_0(3)),
      (COMP_LOOP_k_14_5_sva_8_0(0)), (COMP_LOOP_k_14_5_sva_8_0(1)), (COMP_LOOP_k_14_5_sva_8_0(2)),
      STD_LOGIC_VECTOR'( and_dcpl_207 & COMP_LOOP_twiddle_f_or_23_itm & COMP_LOOP_twiddle_f_or_28_itm
      & and_dcpl_250));
  COMP_LOOP_twiddle_f_or_55_nl <= (COMP_LOOP_twiddle_f_mux1h_360_nl AND (NOT(and_dcpl_211
      OR and_dcpl_215 OR and_dcpl_220 OR and_dcpl_227 OR and_dcpl_229 OR and_dcpl_233
      OR and_dcpl_238 OR and_dcpl_246 OR and_dcpl_251 OR and_dcpl_256 OR and_dcpl_259
      OR and_dcpl_262))) OR and_dcpl_236 OR and_dcpl_240 OR and_dcpl_245 OR and_dcpl_248
      OR and_dcpl_253 OR and_dcpl_260 OR and_dcpl_265 OR and_dcpl_269 OR and_dcpl_271
      OR and_dcpl_274 OR and_dcpl_275 OR and_dcpl_277;
  COMP_LOOP_twiddle_f_mux1h_361_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_14_5_sva_8_0(2)),
      (COMP_LOOP_k_14_5_sva_8_0(0)), (COMP_LOOP_k_14_5_sva_8_0(1)), STD_LOGIC_VECTOR'(
      and_dcpl_207 & COMP_LOOP_twiddle_f_or_28_itm & and_dcpl_250));
  COMP_LOOP_twiddle_f_or_56_nl <= (COMP_LOOP_twiddle_f_mux1h_361_nl AND (NOT(and_dcpl_211
      OR and_dcpl_215 OR and_dcpl_220 OR and_dcpl_223 OR and_dcpl_229 OR and_dcpl_236
      OR and_dcpl_240 OR and_dcpl_241 OR and_dcpl_251 OR and_dcpl_253 OR and_dcpl_256
      OR and_dcpl_260 OR and_dcpl_265 OR and_dcpl_271))) OR and_dcpl_227 OR and_dcpl_233
      OR and_dcpl_238 OR and_dcpl_245 OR and_dcpl_246 OR and_dcpl_248 OR and_dcpl_257
      OR and_dcpl_259 OR and_dcpl_262 OR and_dcpl_269 OR and_dcpl_272 OR and_dcpl_274
      OR and_dcpl_275 OR and_dcpl_277;
  COMP_LOOP_twiddle_f_mux_9_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(1)), (COMP_LOOP_k_14_5_sva_8_0(0)),
      and_dcpl_250);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl <= (COMP_LOOP_twiddle_f_mux_9_nl
      AND (NOT(and_dcpl_211 OR and_dcpl_215 OR and_dcpl_223 OR and_dcpl_227 OR and_dcpl_235
      OR and_dcpl_236 OR and_dcpl_238 OR and_dcpl_245 OR and_dcpl_251 OR and_dcpl_253
      OR and_dcpl_257 OR and_dcpl_259 OR and_dcpl_265 OR and_dcpl_269 OR and_dcpl_274)))
      OR and_dcpl_220 OR and_dcpl_229 OR and_dcpl_233 OR and_dcpl_240 OR and_dcpl_241
      OR and_dcpl_246 OR and_dcpl_248 OR and_dcpl_256 OR and_dcpl_260 OR and_dcpl_262
      OR and_dcpl_264 OR and_dcpl_271 OR and_dcpl_272 OR and_dcpl_275 OR and_dcpl_277;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl <= (COMP_LOOP_k_14_5_sva_8_0(0))
      OR and_dcpl_211 OR and_dcpl_215 OR and_dcpl_220 OR and_dcpl_223 OR and_dcpl_227
      OR and_dcpl_229 OR and_dcpl_233 OR and_dcpl_235 OR and_dcpl_236 OR and_dcpl_238
      OR and_dcpl_240 OR and_dcpl_241 OR and_dcpl_245 OR and_dcpl_246 OR and_dcpl_248
      OR and_dcpl_251 OR and_dcpl_253 OR and_dcpl_256 OR and_dcpl_257 OR and_dcpl_259
      OR and_dcpl_260 OR and_dcpl_262 OR and_dcpl_264 OR and_dcpl_265 OR and_dcpl_269
      OR and_dcpl_271 OR and_dcpl_272 OR and_dcpl_274 OR and_dcpl_275 OR and_dcpl_277
      OR and_dcpl_250;
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl
      & COMP_LOOP_twiddle_f_and_22_nl & COMP_LOOP_twiddle_f_and_23_nl & COMP_LOOP_twiddle_f_and_24_nl
      & COMP_LOOP_twiddle_f_mux1h_356_nl) * UNSIGNED(COMP_LOOP_twiddle_f_and_25_nl
      & COMP_LOOP_twiddle_f_and_26_nl & COMP_LOOP_twiddle_f_and_27_nl & COMP_LOOP_twiddle_f_mux1h_358_nl
      & COMP_LOOP_twiddle_f_or_54_nl & COMP_LOOP_twiddle_f_or_55_nl & COMP_LOOP_twiddle_f_or_56_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl)),
      14));
  VEC_LOOP_mux_15_nl <= MUX_v_9_2_2((VEC_LOOP_j_1_sva(13 DOWNTO 5)), COMP_LOOP_k_14_5_sva_8_0,
      and_dcpl_328);
  VEC_LOOP_mux_16_nl <= MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, STD_LOGIC_VECTOR'(
      "000000001"), and_dcpl_328);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_15_nl),
      10) + CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_16_nl), 10), 10));
  VEC_LOOP_VEC_LOOP_and_5_nl <= (z_out_6(31)) AND VEC_LOOP_nor_3_itm;
  VEC_LOOP_VEC_LOOP_and_6_nl <= (z_out_6(30)) AND VEC_LOOP_nor_3_itm;
  VEC_LOOP_VEC_LOOP_and_7_nl <= (z_out_6(29)) AND VEC_LOOP_nor_3_itm;
  VEC_LOOP_mux_17_nl <= MUX_s_1_2_2((z_out_6(28)), (z_out_3(9)), and_dcpl_344);
  VEC_LOOP_VEC_LOOP_or_9_nl <= (VEC_LOOP_mux_17_nl AND (NOT and_dcpl_337)) OR and_dcpl_352
      OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_361 OR and_dcpl_368 OR and_dcpl_369
      OR and_dcpl_371 OR and_dcpl_373 OR and_dcpl_375 OR and_dcpl_376 OR and_dcpl_379
      OR and_dcpl_381 OR and_dcpl_382 OR and_dcpl_384 OR and_dcpl_386 OR and_dcpl_387
      OR and_dcpl_390 OR and_dcpl_392 OR and_dcpl_394 OR and_dcpl_395 OR and_dcpl_397
      OR and_dcpl_398 OR and_dcpl_399;
  VEC_LOOP_mux1h_38_nl <= MUX1HOT_v_14_4_2((z_out_6(27 DOWNTO 14)), (reg_VEC_LOOP_acc_1_reg
      & reg_VEC_LOOP_acc_1_1_reg), ((z_out_3(8 DOWNTO 0)) & STD_LOGIC_VECTOR'( "00000")),
      (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1))), STD_LOGIC_VECTOR'( and_dcpl_336
      & and_dcpl_337 & and_dcpl_344 & VEC_LOOP_or_51_itm));
  VEC_LOOP_or_82_nl <= (NOT(and_dcpl_336 OR and_dcpl_337)) OR and_dcpl_344 OR and_dcpl_352
      OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_361 OR and_dcpl_368 OR and_dcpl_369
      OR and_dcpl_371 OR and_dcpl_373 OR and_dcpl_375 OR and_dcpl_376 OR and_dcpl_379
      OR and_dcpl_381 OR and_dcpl_382 OR and_dcpl_384 OR and_dcpl_386 OR and_dcpl_387
      OR and_dcpl_390 OR and_dcpl_392 OR and_dcpl_394 OR and_dcpl_395 OR and_dcpl_397
      OR and_dcpl_398 OR and_dcpl_399;
  VEC_LOOP_VEC_LOOP_or_10_nl <= ((STAGE_LOOP_lshift_psp_sva(14)) AND (NOT(and_dcpl_352
      OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_361 OR and_dcpl_368 OR and_dcpl_369
      OR and_dcpl_371 OR and_dcpl_373 OR and_dcpl_375 OR and_dcpl_376 OR and_dcpl_379
      OR and_dcpl_381 OR and_dcpl_382 OR and_dcpl_384 OR and_dcpl_386 OR and_dcpl_387
      OR and_dcpl_390 OR and_dcpl_392 OR and_dcpl_394 OR and_dcpl_395 OR and_dcpl_397
      OR and_dcpl_398 OR and_dcpl_399))) OR and_dcpl_336 OR and_dcpl_344;
  VEC_LOOP_mux1h_39_nl <= MUX1HOT_v_9_3_2((STAGE_LOOP_lshift_psp_sva(13 DOWNTO 5)),
      (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 6))), COMP_LOOP_k_14_5_sva_8_0, STD_LOGIC_VECTOR'(
      and_dcpl_337 & and_dcpl_344 & VEC_LOOP_or_51_itm));
  VEC_LOOP_or_83_nl <= MUX_v_9_2_2(VEC_LOOP_mux1h_39_nl, STD_LOGIC_VECTOR'("111111111"),
      and_dcpl_336);
  VEC_LOOP_mux_18_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(4)), (NOT (STAGE_LOOP_lshift_psp_sva(5))),
      and_dcpl_344);
  VEC_LOOP_VEC_LOOP_or_11_nl <= (VEC_LOOP_mux_18_nl AND (NOT(and_dcpl_361 OR and_dcpl_373
      OR and_dcpl_386 OR and_dcpl_387 OR and_dcpl_390 OR and_dcpl_392 OR and_dcpl_394
      OR and_dcpl_395 OR and_dcpl_397 OR and_dcpl_398 OR and_dcpl_399))) OR and_dcpl_336
      OR and_dcpl_352 OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_368 OR and_dcpl_369
      OR and_dcpl_371 OR and_dcpl_375 OR and_dcpl_376 OR and_dcpl_379 OR and_dcpl_381
      OR and_dcpl_382 OR and_dcpl_384;
  VEC_LOOP_mux_19_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(3)), (NOT (STAGE_LOOP_lshift_psp_sva(4))),
      and_dcpl_344);
  VEC_LOOP_VEC_LOOP_or_12_nl <= (VEC_LOOP_mux_19_nl AND (NOT(and_dcpl_361 OR and_dcpl_373
      OR and_dcpl_375 OR and_dcpl_376 OR and_dcpl_379 OR and_dcpl_381 OR and_dcpl_382
      OR and_dcpl_384 OR and_dcpl_397 OR and_dcpl_398 OR and_dcpl_399))) OR and_dcpl_336
      OR and_dcpl_352 OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_368 OR and_dcpl_369
      OR and_dcpl_371 OR and_dcpl_386 OR and_dcpl_387 OR and_dcpl_390 OR and_dcpl_392
      OR and_dcpl_394 OR and_dcpl_395;
  VEC_LOOP_mux_20_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(2)), (NOT (STAGE_LOOP_lshift_psp_sva(3))),
      and_dcpl_344);
  VEC_LOOP_VEC_LOOP_or_13_nl <= (VEC_LOOP_mux_20_nl AND (NOT(and_dcpl_361 OR and_dcpl_368
      OR and_dcpl_369 OR and_dcpl_371 OR and_dcpl_379 OR and_dcpl_381 OR and_dcpl_382
      OR and_dcpl_392 OR and_dcpl_394 OR and_dcpl_395 OR and_dcpl_399))) OR and_dcpl_336
      OR and_dcpl_352 OR and_dcpl_354 OR and_dcpl_358 OR and_dcpl_373 OR and_dcpl_375
      OR and_dcpl_376 OR and_dcpl_384 OR and_dcpl_386 OR and_dcpl_387 OR and_dcpl_390
      OR and_dcpl_397 OR and_dcpl_398;
  VEC_LOOP_mux_21_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(1)), (NOT (STAGE_LOOP_lshift_psp_sva(2))),
      and_dcpl_344);
  VEC_LOOP_VEC_LOOP_or_14_nl <= (VEC_LOOP_mux_21_nl AND (NOT(and_dcpl_354 OR and_dcpl_358
      OR and_dcpl_368 OR and_dcpl_369 OR and_dcpl_373 OR and_dcpl_376 OR and_dcpl_381
      OR and_dcpl_382 OR and_dcpl_384 OR and_dcpl_387 OR and_dcpl_390 OR and_dcpl_394
      OR and_dcpl_395 OR and_dcpl_397 OR and_dcpl_399))) OR and_dcpl_336 OR and_dcpl_352
      OR and_dcpl_361 OR and_dcpl_371 OR and_dcpl_375 OR and_dcpl_379 OR and_dcpl_386
      OR and_dcpl_392 OR and_dcpl_398;
  VEC_LOOP_mux_22_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(0)), (NOT (STAGE_LOOP_lshift_psp_sva(1))),
      and_dcpl_344);
  VEC_LOOP_VEC_LOOP_or_15_nl <= (VEC_LOOP_mux_22_nl AND (NOT(and_dcpl_352 OR and_dcpl_358
      OR and_dcpl_361 OR and_dcpl_369 OR and_dcpl_371 OR and_dcpl_373 OR and_dcpl_375
      OR and_dcpl_379 OR and_dcpl_382 OR and_dcpl_384 OR and_dcpl_386 OR and_dcpl_390
      OR and_dcpl_392 OR and_dcpl_394 OR and_dcpl_398))) OR and_dcpl_336 OR and_dcpl_354
      OR and_dcpl_368 OR and_dcpl_376 OR and_dcpl_381 OR and_dcpl_387 OR and_dcpl_395
      OR and_dcpl_397 OR and_dcpl_399;
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_and_5_nl
      & VEC_LOOP_VEC_LOOP_and_6_nl & VEC_LOOP_VEC_LOOP_and_7_nl & VEC_LOOP_VEC_LOOP_or_9_nl
      & VEC_LOOP_mux1h_38_nl & VEC_LOOP_or_82_nl), 19), 20) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(VEC_LOOP_VEC_LOOP_or_10_nl
      & VEC_LOOP_or_83_nl & VEC_LOOP_VEC_LOOP_or_11_nl & VEC_LOOP_VEC_LOOP_or_12_nl
      & VEC_LOOP_VEC_LOOP_or_13_nl & VEC_LOOP_VEC_LOOP_or_14_nl & VEC_LOOP_VEC_LOOP_or_15_nl
      & '1'), 16), 20), 20));
  z_out_4 <= acc_1_nl(19 DOWNTO 1);
  VEC_LOOP_or_84_nl <= and_dcpl_410 OR and_463_cse OR and_468_cse OR and_470_cse
      OR and_474_cse OR and_479_cse OR and_481_cse OR and_483_cse OR and_484_cse
      OR and_486_cse OR and_488_cse OR and_489_cse OR and_492_cse OR and_494_cse
      OR and_495_cse OR and_497_cse OR and_498_cse OR and_500_cse OR and_503_cse
      OR and_504_cse OR and_506_cse OR and_508_cse OR and_509_cse OR and_511_cse
      OR and_512_cse OR and_516_cse OR and_518_cse OR and_519_cse OR and_521_cse
      OR and_523_cse OR and_524_cse;
  VEC_LOOP_mux_23_nl <= MUX_v_14_2_2((VEC_LOOP_j_1_sva(13 DOWNTO 0)), (reg_VEC_LOOP_acc_1_reg
      & reg_VEC_LOOP_acc_1_1_reg), VEC_LOOP_or_84_nl);
  VEC_LOOP_mux1h_40_nl <= MUX1HOT_v_5_30_2(STD_LOGIC_VECTOR'( "11110"), STD_LOGIC_VECTOR'(
      "11101"), STD_LOGIC_VECTOR'( "11100"), STD_LOGIC_VECTOR'( "11011"), STD_LOGIC_VECTOR'(
      "11010"), STD_LOGIC_VECTOR'( "11001"), STD_LOGIC_VECTOR'( "11000"), STD_LOGIC_VECTOR'(
      "10111"), STD_LOGIC_VECTOR'( "10110"), STD_LOGIC_VECTOR'( "10101"), STD_LOGIC_VECTOR'(
      "10100"), STD_LOGIC_VECTOR'( "10011"), STD_LOGIC_VECTOR'( "10010"), STD_LOGIC_VECTOR'(
      "10001"), STD_LOGIC_VECTOR'( "10000"), STD_LOGIC_VECTOR'( "01111"), STD_LOGIC_VECTOR'(
      "01110"), STD_LOGIC_VECTOR'( "01101"), STD_LOGIC_VECTOR'( "01100"), STD_LOGIC_VECTOR'(
      "01011"), STD_LOGIC_VECTOR'( "01010"), STD_LOGIC_VECTOR'( "01001"), STD_LOGIC_VECTOR'(
      "01000"), STD_LOGIC_VECTOR'( "00111"), STD_LOGIC_VECTOR'( "00110"), STD_LOGIC_VECTOR'(
      "00101"), STD_LOGIC_VECTOR'( "00100"), STD_LOGIC_VECTOR'( "00011"), STD_LOGIC_VECTOR'(
      "00010"), STD_LOGIC_VECTOR'( "00001"), STD_LOGIC_VECTOR'( and_dcpl_410 & and_463_cse
      & and_468_cse & and_470_cse & and_474_cse & and_479_cse & and_481_cse & and_483_cse
      & and_484_cse & and_486_cse & and_488_cse & and_489_cse & and_492_cse & and_494_cse
      & and_495_cse & and_497_cse & and_498_cse & and_500_cse & and_503_cse & and_504_cse
      & and_506_cse & and_508_cse & and_509_cse & and_511_cse & and_512_cse & and_516_cse
      & and_518_cse & and_519_cse & and_521_cse & and_523_cse));
  and_643_nl <= and_dcpl_335 AND and_dcpl_224;
  VEC_LOOP_VEC_LOOP_nor_1_nl <= NOT(MUX_v_5_2_2(VEC_LOOP_mux1h_40_nl, STD_LOGIC_VECTOR'("11111"),
      and_643_nl));
  VEC_LOOP_or_85_nl <= MUX_v_5_2_2(VEC_LOOP_VEC_LOOP_nor_1_nl, STD_LOGIC_VECTOR'("11111"),
      and_524_cse);
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_23_nl) + UNSIGNED(COMP_LOOP_k_14_5_sva_8_0
      & VEC_LOOP_or_85_nl) + UNSIGNED(STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1)), 14));
  VEC_LOOP_mux_24_nl <= MUX_v_32_2_2(VEC_LOOP_j_1_sva, factor1_1_sva, and_173_cse);
  VEC_LOOP_or_86_nl <= (NOT(and_dcpl_295 AND nor_97_cse AND and_dcpl_216 AND (fsm_output(2))
      AND (NOT (fsm_output(0))))) OR and_173_cse;
  VEC_LOOP_mux_25_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "00000000000000000") & STAGE_LOOP_lshift_psp_sva),
      (NOT COMP_LOOP_1_mult_cmp_return_rsc_z), and_173_cse);
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_24_nl & VEC_LOOP_or_86_nl)
      + UNSIGNED(VEC_LOOP_mux_25_nl & '1'), 33));
  z_out_6 <= acc_3_nl(32 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_and_8_nl <= (reg_VEC_LOOP_acc_1_reg(4)) AND VEC_LOOP_nor_12_itm;
  VEC_LOOP_mux_26_nl <= MUX_s_1_2_2((reg_VEC_LOOP_acc_1_reg(3)), (reg_VEC_LOOP_acc_1_reg(4)),
      VEC_LOOP_or_40_itm);
  VEC_LOOP_VEC_LOOP_or_16_nl <= (VEC_LOOP_mux_26_nl AND (NOT(and_497_cse OR and_470_cse
      OR and_489_cse OR and_504_cse OR and_519_cse OR and_483_cse OR and_511_cse
      OR and_dcpl_567 OR and_dcpl_570 OR and_dcpl_574 OR and_dcpl_577 OR and_dcpl_578)))
      OR and_dcpl_572 OR and_dcpl_573 OR and_dcpl_575 OR and_dcpl_576;
  VEC_LOOP_mux1h_41_nl <= MUX1HOT_s_1_4_2((reg_VEC_LOOP_acc_1_reg(2)), (reg_VEC_LOOP_acc_1_reg(3)),
      (reg_VEC_LOOP_acc_1_reg(4)), (NOT (STAGE_LOOP_lshift_psp_sva(14))), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_6_ssc & VEC_LOOP_or_40_itm & VEC_LOOP_or_43_itm & VEC_LOOP_or_54_itm));
  VEC_LOOP_or_87_nl <= (VEC_LOOP_mux1h_41_nl AND (NOT(and_497_cse OR and_483_cse
      OR and_511_cse OR and_dcpl_567 OR and_dcpl_570 OR and_dcpl_577))) OR and_dcpl_574
      OR and_dcpl_578;
  VEC_LOOP_or_88_nl <= and_483_cse OR and_511_cse;
  VEC_LOOP_or_89_nl <= and_dcpl_574 OR and_dcpl_578;
  VEC_LOOP_mux1h_42_nl <= MUX1HOT_v_11_10_2(('0' & reg_VEC_LOOP_acc_1_reg & (reg_VEC_LOOP_acc_1_1_reg(8
      DOWNTO 4))), ((reg_VEC_LOOP_acc_1_reg(1 DOWNTO 0)) & reg_VEC_LOOP_acc_1_1_reg),
      ((reg_VEC_LOOP_acc_1_reg(2 DOWNTO 0)) & (reg_VEC_LOOP_acc_1_1_reg(8 DOWNTO
      1))), ((reg_VEC_LOOP_acc_1_reg(3 DOWNTO 0)) & (reg_VEC_LOOP_acc_1_1_reg(8 DOWNTO
      2))), (reg_VEC_LOOP_acc_1_reg & (reg_VEC_LOOP_acc_1_1_reg(8 DOWNTO 3))), (STD_LOGIC_VECTOR'(
      "0000001") & (NOT STAGE_LOOP_i_3_0_sva_2)), (STD_LOGIC_VECTOR'( "01") & (NOT
      (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 6)))), (NOT (STAGE_LOOP_lshift_psp_sva(13
      DOWNTO 3))), (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 4))), ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(14
      DOWNTO 5)))), STD_LOGIC_VECTOR'( and_497_cse & VEC_LOOP_or_6_ssc & VEC_LOOP_or_40_itm
      & VEC_LOOP_or_43_itm & VEC_LOOP_or_88_nl & and_dcpl_567 & and_dcpl_570 & VEC_LOOP_or_54_itm
      & VEC_LOOP_or_89_nl & and_dcpl_577));
  VEC_LOOP_or_90_nl <= (NOT(and_497_cse OR and_dcpl_500 OR and_468_cse OR and_474_cse
      OR and_481_cse OR and_484_cse OR and_488_cse OR and_492_cse OR and_495_cse
      OR and_498_cse OR and_503_cse OR and_506_cse OR and_509_cse OR and_512_cse
      OR and_518_cse OR and_521_cse OR and_524_cse OR and_463_cse OR and_479_cse
      OR and_486_cse OR and_494_cse OR and_500_cse OR and_508_cse OR and_516_cse
      OR and_523_cse OR and_470_cse OR and_489_cse OR and_504_cse OR and_519_cse
      OR and_483_cse OR and_511_cse OR and_dcpl_567)) OR and_dcpl_570 OR and_dcpl_572
      OR and_dcpl_573 OR and_dcpl_574 OR and_dcpl_575 OR and_dcpl_576 OR and_dcpl_577
      OR and_dcpl_578;
  VEC_LOOP_and_34_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND VEC_LOOP_nor_12_itm;
  VEC_LOOP_VEC_LOOP_mux_5_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(7)), (COMP_LOOP_k_14_5_sva_8_0(8)),
      VEC_LOOP_or_40_itm);
  VEC_LOOP_and_35_nl <= VEC_LOOP_VEC_LOOP_mux_5_nl AND (NOT(and_497_cse OR and_470_cse
      OR and_489_cse OR and_504_cse OR and_519_cse OR and_483_cse OR and_511_cse
      OR and_dcpl_567 OR and_dcpl_570 OR and_dcpl_572 OR and_dcpl_573 OR and_dcpl_574
      OR and_dcpl_575 OR and_dcpl_576 OR and_dcpl_577 OR and_dcpl_578));
  VEC_LOOP_mux1h_43_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_14_5_sva_8_0(6)), (COMP_LOOP_k_14_5_sva_8_0(7)),
      (COMP_LOOP_k_14_5_sva_8_0(8)), STD_LOGIC_VECTOR'( VEC_LOOP_or_6_ssc & VEC_LOOP_or_40_itm
      & VEC_LOOP_or_62_itm));
  VEC_LOOP_and_36_nl <= VEC_LOOP_mux1h_43_nl AND (NOT(and_497_cse OR and_483_cse
      OR and_511_cse OR and_dcpl_567 OR and_dcpl_570 OR and_dcpl_574 OR and_dcpl_577
      OR and_dcpl_578));
  VEC_LOOP_mux1h_44_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_14_5_sva_8_0(5)), (COMP_LOOP_k_14_5_sva_8_0(6)),
      (COMP_LOOP_k_14_5_sva_8_0(7)), (COMP_LOOP_k_14_5_sva_8_0(8)), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_6_ssc & VEC_LOOP_or_40_itm & VEC_LOOP_or_62_itm & VEC_LOOP_or_66_itm));
  VEC_LOOP_and_37_nl <= VEC_LOOP_mux1h_44_nl AND (NOT(and_497_cse OR and_dcpl_567
      OR and_dcpl_570 OR and_dcpl_577));
  VEC_LOOP_mux1h_45_nl <= MUX1HOT_v_5_6_2((COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 4)),
      (COMP_LOOP_k_14_5_sva_8_0(4 DOWNTO 0)), (COMP_LOOP_k_14_5_sva_8_0(5 DOWNTO
      1)), (COMP_LOOP_k_14_5_sva_8_0(6 DOWNTO 2)), (COMP_LOOP_k_14_5_sva_8_0(7 DOWNTO
      3)), ('0' & (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 5))), STD_LOGIC_VECTOR'( VEC_LOOP_or_67_itm
      & VEC_LOOP_or_6_ssc & VEC_LOOP_or_40_itm & VEC_LOOP_or_62_itm & VEC_LOOP_or_66_itm
      & and_dcpl_570));
  not_828_nl <= NOT and_dcpl_567;
  VEC_LOOP_and_38_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), VEC_LOOP_mux1h_45_nl,
      not_828_nl);
  VEC_LOOP_mux1h_46_nl <= MUX1HOT_s_1_5_2((COMP_LOOP_k_14_5_sva_8_0(3)), (COMP_LOOP_k_14_5_sva_8_0(0)),
      (COMP_LOOP_k_14_5_sva_8_0(1)), (COMP_LOOP_k_14_5_sva_8_0(2)), (COMP_LOOP_k_14_5_sva_8_0(4)),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_67_itm & VEC_LOOP_or_40_itm & VEC_LOOP_or_62_itm
      & VEC_LOOP_or_66_itm & and_dcpl_570));
  VEC_LOOP_or_91_nl <= (VEC_LOOP_mux1h_46_nl AND (NOT(and_dcpl_500 OR and_468_cse
      OR and_474_cse OR and_481_cse OR and_484_cse OR and_488_cse OR and_492_cse
      OR and_495_cse OR and_dcpl_567))) OR and_498_cse OR and_503_cse OR and_506_cse
      OR and_509_cse OR and_512_cse OR and_518_cse OR and_521_cse OR and_524_cse;
  VEC_LOOP_mux1h_47_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_14_5_sva_8_0(2)), (COMP_LOOP_k_14_5_sva_8_0(0)),
      (COMP_LOOP_k_14_5_sva_8_0(1)), (COMP_LOOP_k_14_5_sva_8_0(3)), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_67_itm & VEC_LOOP_or_62_itm & VEC_LOOP_or_66_itm & and_dcpl_570));
  VEC_LOOP_or_92_nl <= (VEC_LOOP_mux1h_47_nl AND (NOT(and_dcpl_500 OR and_468_cse
      OR and_474_cse OR and_481_cse OR and_498_cse OR and_503_cse OR and_506_cse
      OR and_509_cse OR and_463_cse OR and_479_cse OR and_486_cse OR and_494_cse)))
      OR and_484_cse OR and_488_cse OR and_492_cse OR and_495_cse OR and_512_cse
      OR and_518_cse OR and_521_cse OR and_524_cse OR and_500_cse OR and_508_cse
      OR and_516_cse OR and_523_cse OR and_dcpl_567;
  VEC_LOOP_mux1h_48_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_14_5_sva_8_0(1)), (COMP_LOOP_k_14_5_sva_8_0(0)),
      (COMP_LOOP_k_14_5_sva_8_0(2)), STD_LOGIC_VECTOR'( VEC_LOOP_or_67_itm & VEC_LOOP_or_66_itm
      & and_dcpl_570));
  VEC_LOOP_or_93_nl <= (VEC_LOOP_mux1h_48_nl AND (NOT(and_dcpl_500 OR and_468_cse
      OR and_484_cse OR and_488_cse OR and_498_cse OR and_503_cse OR and_512_cse
      OR and_518_cse OR and_463_cse OR and_479_cse OR and_500_cse OR and_508_cse
      OR and_470_cse OR and_489_cse OR and_dcpl_572 OR and_dcpl_576))) OR and_474_cse
      OR and_481_cse OR and_492_cse OR and_495_cse OR and_506_cse OR and_509_cse
      OR and_521_cse OR and_524_cse OR and_486_cse OR and_494_cse OR and_516_cse
      OR and_523_cse OR and_504_cse OR and_519_cse OR and_dcpl_567 OR and_dcpl_573
      OR and_dcpl_575;
  VEC_LOOP_VEC_LOOP_mux_6_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(0)), (COMP_LOOP_k_14_5_sva_8_0(1)),
      and_dcpl_570);
  VEC_LOOP_or_94_nl <= (VEC_LOOP_VEC_LOOP_mux_6_nl AND (NOT(and_dcpl_500 OR and_474_cse
      OR and_484_cse OR and_492_cse OR and_498_cse OR and_506_cse OR and_512_cse
      OR and_521_cse OR and_463_cse OR and_486_cse OR and_500_cse OR and_516_cse
      OR and_470_cse OR and_504_cse OR and_483_cse OR and_dcpl_572 OR and_dcpl_575
      OR and_dcpl_578))) OR and_468_cse OR and_481_cse OR and_488_cse OR and_495_cse
      OR and_503_cse OR and_509_cse OR and_518_cse OR and_524_cse OR and_479_cse
      OR and_494_cse OR and_508_cse OR and_523_cse OR and_489_cse OR and_519_cse
      OR and_511_cse OR and_dcpl_567 OR and_dcpl_573 OR and_dcpl_574 OR and_dcpl_576;
  VEC_LOOP_VEC_LOOP_or_17_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT(and_dcpl_572
      OR and_dcpl_573 OR and_dcpl_574 OR and_dcpl_575 OR and_dcpl_576 OR and_dcpl_578
      OR and_dcpl_577))) OR and_497_cse OR and_dcpl_500 OR and_468_cse OR and_474_cse
      OR and_481_cse OR and_484_cse OR and_488_cse OR and_492_cse OR and_495_cse
      OR and_498_cse OR and_503_cse OR and_506_cse OR and_509_cse OR and_512_cse
      OR and_518_cse OR and_521_cse OR and_524_cse OR and_463_cse OR and_479_cse
      OR and_486_cse OR and_494_cse OR and_500_cse OR and_508_cse OR and_516_cse
      OR and_523_cse OR and_470_cse OR and_489_cse OR and_504_cse OR and_519_cse
      OR and_483_cse OR and_511_cse OR and_dcpl_567;
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_and_8_nl
      & VEC_LOOP_VEC_LOOP_or_16_nl & VEC_LOOP_or_87_nl & VEC_LOOP_mux1h_42_nl & VEC_LOOP_or_90_nl)
      + UNSIGNED(VEC_LOOP_and_34_nl & VEC_LOOP_and_35_nl & VEC_LOOP_and_36_nl & VEC_LOOP_and_37_nl
      & VEC_LOOP_and_38_nl & VEC_LOOP_or_91_nl & VEC_LOOP_or_92_nl & VEC_LOOP_or_93_nl
      & VEC_LOOP_or_94_nl & VEC_LOOP_VEC_LOOP_or_17_nl & '1'), 15));
  z_out_7 <= acc_4_nl(14 DOWNTO 1);
END v1;

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
    vec_rsc_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    vec_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_wea : OUT STD_LOGIC;
    vec_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    vec_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_web : OUT STD_LOGIC;
    vec_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_wea : OUT STD_LOGIC;
    twiddle_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_web : OUT STD_LOGIC;
    twiddle_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_wea : OUT STD_LOGIC;
    twiddle_h_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_web : OUT STD_LOGIC;
    twiddle_h_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp;

ARCHITECTURE v1 OF inPlaceNTT_DIT_precomp IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
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
  SIGNAL vec_rsci_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL vec_rsci_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
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
  SIGNAL twiddle_rsci_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL twiddle_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
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
  SIGNAL twiddle_h_rsci_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
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
      vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_adra_d : STD_LOGIC_VECTOR (27
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
      (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
  vec_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
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

  twiddle_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen
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
  twiddle_rsci_adra_d_1 <= STD_LOGIC_VECTOR'( "00000000000000") & twiddle_rsci_adra_d;
  twiddle_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  twiddle_rsci_qa_d <= twiddle_rsci_qa_d_1;
  twiddle_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  twiddle_h_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen
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
  twiddle_h_rsci_adra_d_1 <= STD_LOGIC_VECTOR'( "00000000000000") & twiddle_h_rsci_adra_d;
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

END v1;



