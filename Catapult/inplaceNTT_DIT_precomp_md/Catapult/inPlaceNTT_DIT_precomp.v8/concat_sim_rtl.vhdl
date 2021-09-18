
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

--------> ../td_ccore_solutions/modulo_sub_f83f1ef2ff5a4101c59f332e5a2a07d06350_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Sep 16 11:50:47 2021
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




--------> ../td_ccore_solutions/modulo_add_1c7cb5effec07f258b1f9fafcfd3564d6028_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Sep 16 11:50:48 2021
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




--------> ../td_ccore_solutions/mult_211a0e259bca55d0a7d87e37cf4e500170bb_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Sep 16 11:50:49 2021
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
  SIGNAL if_acc_1_itm_32_1 : STD_LOGIC;

  SIGNAL if_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL t_mul_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_mul_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL if_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
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
  if_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & res_sva_3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT
      p_buf_sva_1), 32), 33) + UNSIGNED'( "000000000000000000000000000000001"), 33));
  if_acc_1_itm_32_1 <= if_acc_1_nl(32);
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
        slc_32_svs_1 <= if_acc_1_itm_32_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( (ccs_ccore_en AND and_dcpl AND (NOT if_acc_1_itm_32_1)) = '1' ) THEN
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
--  Generated date: Thu Sep 16 11:52:26 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
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
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
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
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
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
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
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
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
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
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
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
END v8;

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
    COMP_LOOP_C_3_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_4_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_5_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_6_tr0 : IN STD_LOGIC;
    COMP_LOOP_5_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_6_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_7_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_9_tr0 : IN STD_LOGIC;
    COMP_LOOP_8_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_10_tr0 : IN STD_LOGIC;
    COMP_LOOP_9_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_10_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
    COMP_LOOP_11_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_13_tr0 : IN STD_LOGIC;
    COMP_LOOP_12_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_14_tr0 : IN STD_LOGIC;
    COMP_LOOP_13_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_15_tr0 : IN STD_LOGIC;
    COMP_LOOP_14_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
    COMP_LOOP_15_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_17_tr0 : IN STD_LOGIC;
    COMP_LOOP_16_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_18_tr0 : IN STD_LOGIC;
    COMP_LOOP_17_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_19_tr0 : IN STD_LOGIC;
    COMP_LOOP_18_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_20_tr0 : IN STD_LOGIC;
    COMP_LOOP_19_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_21_tr0 : IN STD_LOGIC;
    COMP_LOOP_20_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_22_tr0 : IN STD_LOGIC;
    COMP_LOOP_21_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_23_tr0 : IN STD_LOGIC;
    COMP_LOOP_22_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_23_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_25_tr0 : IN STD_LOGIC;
    COMP_LOOP_24_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_26_tr0 : IN STD_LOGIC;
    COMP_LOOP_25_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_27_tr0 : IN STD_LOGIC;
    COMP_LOOP_26_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
    COMP_LOOP_27_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_29_tr0 : IN STD_LOGIC;
    COMP_LOOP_28_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_30_tr0 : IN STD_LOGIC;
    COMP_LOOP_29_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_31_tr0 : IN STD_LOGIC;
    COMP_LOOP_30_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_32_tr0 : IN STD_LOGIC;
    COMP_LOOP_31_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_33_tr0 : IN STD_LOGIC;
    COMP_LOOP_32_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_34_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_core_fsm;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_precomp_core_core_fsm_1
  TYPE inPlaceNTT_DIT_precomp_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, COMP_LOOP_C_0,
      COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_1_VEC_LOOP_C_0, COMP_LOOP_1_VEC_LOOP_C_1,
      COMP_LOOP_1_VEC_LOOP_C_2, COMP_LOOP_1_VEC_LOOP_C_3, COMP_LOOP_1_VEC_LOOP_C_4,
      COMP_LOOP_1_VEC_LOOP_C_5, COMP_LOOP_1_VEC_LOOP_C_6, COMP_LOOP_1_VEC_LOOP_C_7,
      COMP_LOOP_1_VEC_LOOP_C_8, COMP_LOOP_C_3, COMP_LOOP_2_VEC_LOOP_C_0, COMP_LOOP_2_VEC_LOOP_C_1,
      COMP_LOOP_2_VEC_LOOP_C_2, COMP_LOOP_2_VEC_LOOP_C_3, COMP_LOOP_2_VEC_LOOP_C_4,
      COMP_LOOP_2_VEC_LOOP_C_5, COMP_LOOP_2_VEC_LOOP_C_6, COMP_LOOP_2_VEC_LOOP_C_7,
      COMP_LOOP_2_VEC_LOOP_C_8, COMP_LOOP_C_4, COMP_LOOP_3_VEC_LOOP_C_0, COMP_LOOP_3_VEC_LOOP_C_1,
      COMP_LOOP_3_VEC_LOOP_C_2, COMP_LOOP_3_VEC_LOOP_C_3, COMP_LOOP_3_VEC_LOOP_C_4,
      COMP_LOOP_3_VEC_LOOP_C_5, COMP_LOOP_3_VEC_LOOP_C_6, COMP_LOOP_3_VEC_LOOP_C_7,
      COMP_LOOP_3_VEC_LOOP_C_8, COMP_LOOP_C_5, COMP_LOOP_4_VEC_LOOP_C_0, COMP_LOOP_4_VEC_LOOP_C_1,
      COMP_LOOP_4_VEC_LOOP_C_2, COMP_LOOP_4_VEC_LOOP_C_3, COMP_LOOP_4_VEC_LOOP_C_4,
      COMP_LOOP_4_VEC_LOOP_C_5, COMP_LOOP_4_VEC_LOOP_C_6, COMP_LOOP_4_VEC_LOOP_C_7,
      COMP_LOOP_4_VEC_LOOP_C_8, COMP_LOOP_C_6, COMP_LOOP_5_VEC_LOOP_C_0, COMP_LOOP_5_VEC_LOOP_C_1,
      COMP_LOOP_5_VEC_LOOP_C_2, COMP_LOOP_5_VEC_LOOP_C_3, COMP_LOOP_5_VEC_LOOP_C_4,
      COMP_LOOP_5_VEC_LOOP_C_5, COMP_LOOP_5_VEC_LOOP_C_6, COMP_LOOP_5_VEC_LOOP_C_7,
      COMP_LOOP_5_VEC_LOOP_C_8, COMP_LOOP_C_7, COMP_LOOP_6_VEC_LOOP_C_0, COMP_LOOP_6_VEC_LOOP_C_1,
      COMP_LOOP_6_VEC_LOOP_C_2, COMP_LOOP_6_VEC_LOOP_C_3, COMP_LOOP_6_VEC_LOOP_C_4,
      COMP_LOOP_6_VEC_LOOP_C_5, COMP_LOOP_6_VEC_LOOP_C_6, COMP_LOOP_6_VEC_LOOP_C_7,
      COMP_LOOP_6_VEC_LOOP_C_8, COMP_LOOP_C_8, COMP_LOOP_7_VEC_LOOP_C_0, COMP_LOOP_7_VEC_LOOP_C_1,
      COMP_LOOP_7_VEC_LOOP_C_2, COMP_LOOP_7_VEC_LOOP_C_3, COMP_LOOP_7_VEC_LOOP_C_4,
      COMP_LOOP_7_VEC_LOOP_C_5, COMP_LOOP_7_VEC_LOOP_C_6, COMP_LOOP_7_VEC_LOOP_C_7,
      COMP_LOOP_7_VEC_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_8_VEC_LOOP_C_0, COMP_LOOP_8_VEC_LOOP_C_1,
      COMP_LOOP_8_VEC_LOOP_C_2, COMP_LOOP_8_VEC_LOOP_C_3, COMP_LOOP_8_VEC_LOOP_C_4,
      COMP_LOOP_8_VEC_LOOP_C_5, COMP_LOOP_8_VEC_LOOP_C_6, COMP_LOOP_8_VEC_LOOP_C_7,
      COMP_LOOP_8_VEC_LOOP_C_8, COMP_LOOP_C_10, COMP_LOOP_9_VEC_LOOP_C_0, COMP_LOOP_9_VEC_LOOP_C_1,
      COMP_LOOP_9_VEC_LOOP_C_2, COMP_LOOP_9_VEC_LOOP_C_3, COMP_LOOP_9_VEC_LOOP_C_4,
      COMP_LOOP_9_VEC_LOOP_C_5, COMP_LOOP_9_VEC_LOOP_C_6, COMP_LOOP_9_VEC_LOOP_C_7,
      COMP_LOOP_9_VEC_LOOP_C_8, COMP_LOOP_C_11, COMP_LOOP_10_VEC_LOOP_C_0, COMP_LOOP_10_VEC_LOOP_C_1,
      COMP_LOOP_10_VEC_LOOP_C_2, COMP_LOOP_10_VEC_LOOP_C_3, COMP_LOOP_10_VEC_LOOP_C_4,
      COMP_LOOP_10_VEC_LOOP_C_5, COMP_LOOP_10_VEC_LOOP_C_6, COMP_LOOP_10_VEC_LOOP_C_7,
      COMP_LOOP_10_VEC_LOOP_C_8, COMP_LOOP_C_12, COMP_LOOP_11_VEC_LOOP_C_0, COMP_LOOP_11_VEC_LOOP_C_1,
      COMP_LOOP_11_VEC_LOOP_C_2, COMP_LOOP_11_VEC_LOOP_C_3, COMP_LOOP_11_VEC_LOOP_C_4,
      COMP_LOOP_11_VEC_LOOP_C_5, COMP_LOOP_11_VEC_LOOP_C_6, COMP_LOOP_11_VEC_LOOP_C_7,
      COMP_LOOP_11_VEC_LOOP_C_8, COMP_LOOP_C_13, COMP_LOOP_12_VEC_LOOP_C_0, COMP_LOOP_12_VEC_LOOP_C_1,
      COMP_LOOP_12_VEC_LOOP_C_2, COMP_LOOP_12_VEC_LOOP_C_3, COMP_LOOP_12_VEC_LOOP_C_4,
      COMP_LOOP_12_VEC_LOOP_C_5, COMP_LOOP_12_VEC_LOOP_C_6, COMP_LOOP_12_VEC_LOOP_C_7,
      COMP_LOOP_12_VEC_LOOP_C_8, COMP_LOOP_C_14, COMP_LOOP_13_VEC_LOOP_C_0, COMP_LOOP_13_VEC_LOOP_C_1,
      COMP_LOOP_13_VEC_LOOP_C_2, COMP_LOOP_13_VEC_LOOP_C_3, COMP_LOOP_13_VEC_LOOP_C_4,
      COMP_LOOP_13_VEC_LOOP_C_5, COMP_LOOP_13_VEC_LOOP_C_6, COMP_LOOP_13_VEC_LOOP_C_7,
      COMP_LOOP_13_VEC_LOOP_C_8, COMP_LOOP_C_15, COMP_LOOP_14_VEC_LOOP_C_0, COMP_LOOP_14_VEC_LOOP_C_1,
      COMP_LOOP_14_VEC_LOOP_C_2, COMP_LOOP_14_VEC_LOOP_C_3, COMP_LOOP_14_VEC_LOOP_C_4,
      COMP_LOOP_14_VEC_LOOP_C_5, COMP_LOOP_14_VEC_LOOP_C_6, COMP_LOOP_14_VEC_LOOP_C_7,
      COMP_LOOP_14_VEC_LOOP_C_8, COMP_LOOP_C_16, COMP_LOOP_15_VEC_LOOP_C_0, COMP_LOOP_15_VEC_LOOP_C_1,
      COMP_LOOP_15_VEC_LOOP_C_2, COMP_LOOP_15_VEC_LOOP_C_3, COMP_LOOP_15_VEC_LOOP_C_4,
      COMP_LOOP_15_VEC_LOOP_C_5, COMP_LOOP_15_VEC_LOOP_C_6, COMP_LOOP_15_VEC_LOOP_C_7,
      COMP_LOOP_15_VEC_LOOP_C_8, COMP_LOOP_C_17, COMP_LOOP_16_VEC_LOOP_C_0, COMP_LOOP_16_VEC_LOOP_C_1,
      COMP_LOOP_16_VEC_LOOP_C_2, COMP_LOOP_16_VEC_LOOP_C_3, COMP_LOOP_16_VEC_LOOP_C_4,
      COMP_LOOP_16_VEC_LOOP_C_5, COMP_LOOP_16_VEC_LOOP_C_6, COMP_LOOP_16_VEC_LOOP_C_7,
      COMP_LOOP_16_VEC_LOOP_C_8, COMP_LOOP_C_18, COMP_LOOP_17_VEC_LOOP_C_0, COMP_LOOP_17_VEC_LOOP_C_1,
      COMP_LOOP_17_VEC_LOOP_C_2, COMP_LOOP_17_VEC_LOOP_C_3, COMP_LOOP_17_VEC_LOOP_C_4,
      COMP_LOOP_17_VEC_LOOP_C_5, COMP_LOOP_17_VEC_LOOP_C_6, COMP_LOOP_17_VEC_LOOP_C_7,
      COMP_LOOP_17_VEC_LOOP_C_8, COMP_LOOP_C_19, COMP_LOOP_18_VEC_LOOP_C_0, COMP_LOOP_18_VEC_LOOP_C_1,
      COMP_LOOP_18_VEC_LOOP_C_2, COMP_LOOP_18_VEC_LOOP_C_3, COMP_LOOP_18_VEC_LOOP_C_4,
      COMP_LOOP_18_VEC_LOOP_C_5, COMP_LOOP_18_VEC_LOOP_C_6, COMP_LOOP_18_VEC_LOOP_C_7,
      COMP_LOOP_18_VEC_LOOP_C_8, COMP_LOOP_C_20, COMP_LOOP_19_VEC_LOOP_C_0, COMP_LOOP_19_VEC_LOOP_C_1,
      COMP_LOOP_19_VEC_LOOP_C_2, COMP_LOOP_19_VEC_LOOP_C_3, COMP_LOOP_19_VEC_LOOP_C_4,
      COMP_LOOP_19_VEC_LOOP_C_5, COMP_LOOP_19_VEC_LOOP_C_6, COMP_LOOP_19_VEC_LOOP_C_7,
      COMP_LOOP_19_VEC_LOOP_C_8, COMP_LOOP_C_21, COMP_LOOP_20_VEC_LOOP_C_0, COMP_LOOP_20_VEC_LOOP_C_1,
      COMP_LOOP_20_VEC_LOOP_C_2, COMP_LOOP_20_VEC_LOOP_C_3, COMP_LOOP_20_VEC_LOOP_C_4,
      COMP_LOOP_20_VEC_LOOP_C_5, COMP_LOOP_20_VEC_LOOP_C_6, COMP_LOOP_20_VEC_LOOP_C_7,
      COMP_LOOP_20_VEC_LOOP_C_8, COMP_LOOP_C_22, COMP_LOOP_21_VEC_LOOP_C_0, COMP_LOOP_21_VEC_LOOP_C_1,
      COMP_LOOP_21_VEC_LOOP_C_2, COMP_LOOP_21_VEC_LOOP_C_3, COMP_LOOP_21_VEC_LOOP_C_4,
      COMP_LOOP_21_VEC_LOOP_C_5, COMP_LOOP_21_VEC_LOOP_C_6, COMP_LOOP_21_VEC_LOOP_C_7,
      COMP_LOOP_21_VEC_LOOP_C_8, COMP_LOOP_C_23, COMP_LOOP_22_VEC_LOOP_C_0, COMP_LOOP_22_VEC_LOOP_C_1,
      COMP_LOOP_22_VEC_LOOP_C_2, COMP_LOOP_22_VEC_LOOP_C_3, COMP_LOOP_22_VEC_LOOP_C_4,
      COMP_LOOP_22_VEC_LOOP_C_5, COMP_LOOP_22_VEC_LOOP_C_6, COMP_LOOP_22_VEC_LOOP_C_7,
      COMP_LOOP_22_VEC_LOOP_C_8, COMP_LOOP_C_24, COMP_LOOP_23_VEC_LOOP_C_0, COMP_LOOP_23_VEC_LOOP_C_1,
      COMP_LOOP_23_VEC_LOOP_C_2, COMP_LOOP_23_VEC_LOOP_C_3, COMP_LOOP_23_VEC_LOOP_C_4,
      COMP_LOOP_23_VEC_LOOP_C_5, COMP_LOOP_23_VEC_LOOP_C_6, COMP_LOOP_23_VEC_LOOP_C_7,
      COMP_LOOP_23_VEC_LOOP_C_8, COMP_LOOP_C_25, COMP_LOOP_24_VEC_LOOP_C_0, COMP_LOOP_24_VEC_LOOP_C_1,
      COMP_LOOP_24_VEC_LOOP_C_2, COMP_LOOP_24_VEC_LOOP_C_3, COMP_LOOP_24_VEC_LOOP_C_4,
      COMP_LOOP_24_VEC_LOOP_C_5, COMP_LOOP_24_VEC_LOOP_C_6, COMP_LOOP_24_VEC_LOOP_C_7,
      COMP_LOOP_24_VEC_LOOP_C_8, COMP_LOOP_C_26, COMP_LOOP_25_VEC_LOOP_C_0, COMP_LOOP_25_VEC_LOOP_C_1,
      COMP_LOOP_25_VEC_LOOP_C_2, COMP_LOOP_25_VEC_LOOP_C_3, COMP_LOOP_25_VEC_LOOP_C_4,
      COMP_LOOP_25_VEC_LOOP_C_5, COMP_LOOP_25_VEC_LOOP_C_6, COMP_LOOP_25_VEC_LOOP_C_7,
      COMP_LOOP_25_VEC_LOOP_C_8, COMP_LOOP_C_27, COMP_LOOP_26_VEC_LOOP_C_0, COMP_LOOP_26_VEC_LOOP_C_1,
      COMP_LOOP_26_VEC_LOOP_C_2, COMP_LOOP_26_VEC_LOOP_C_3, COMP_LOOP_26_VEC_LOOP_C_4,
      COMP_LOOP_26_VEC_LOOP_C_5, COMP_LOOP_26_VEC_LOOP_C_6, COMP_LOOP_26_VEC_LOOP_C_7,
      COMP_LOOP_26_VEC_LOOP_C_8, COMP_LOOP_C_28, COMP_LOOP_27_VEC_LOOP_C_0, COMP_LOOP_27_VEC_LOOP_C_1,
      COMP_LOOP_27_VEC_LOOP_C_2, COMP_LOOP_27_VEC_LOOP_C_3, COMP_LOOP_27_VEC_LOOP_C_4,
      COMP_LOOP_27_VEC_LOOP_C_5, COMP_LOOP_27_VEC_LOOP_C_6, COMP_LOOP_27_VEC_LOOP_C_7,
      COMP_LOOP_27_VEC_LOOP_C_8, COMP_LOOP_C_29, COMP_LOOP_28_VEC_LOOP_C_0, COMP_LOOP_28_VEC_LOOP_C_1,
      COMP_LOOP_28_VEC_LOOP_C_2, COMP_LOOP_28_VEC_LOOP_C_3, COMP_LOOP_28_VEC_LOOP_C_4,
      COMP_LOOP_28_VEC_LOOP_C_5, COMP_LOOP_28_VEC_LOOP_C_6, COMP_LOOP_28_VEC_LOOP_C_7,
      COMP_LOOP_28_VEC_LOOP_C_8, COMP_LOOP_C_30, COMP_LOOP_29_VEC_LOOP_C_0, COMP_LOOP_29_VEC_LOOP_C_1,
      COMP_LOOP_29_VEC_LOOP_C_2, COMP_LOOP_29_VEC_LOOP_C_3, COMP_LOOP_29_VEC_LOOP_C_4,
      COMP_LOOP_29_VEC_LOOP_C_5, COMP_LOOP_29_VEC_LOOP_C_6, COMP_LOOP_29_VEC_LOOP_C_7,
      COMP_LOOP_29_VEC_LOOP_C_8, COMP_LOOP_C_31, COMP_LOOP_30_VEC_LOOP_C_0, COMP_LOOP_30_VEC_LOOP_C_1,
      COMP_LOOP_30_VEC_LOOP_C_2, COMP_LOOP_30_VEC_LOOP_C_3, COMP_LOOP_30_VEC_LOOP_C_4,
      COMP_LOOP_30_VEC_LOOP_C_5, COMP_LOOP_30_VEC_LOOP_C_6, COMP_LOOP_30_VEC_LOOP_C_7,
      COMP_LOOP_30_VEC_LOOP_C_8, COMP_LOOP_C_32, COMP_LOOP_31_VEC_LOOP_C_0, COMP_LOOP_31_VEC_LOOP_C_1,
      COMP_LOOP_31_VEC_LOOP_C_2, COMP_LOOP_31_VEC_LOOP_C_3, COMP_LOOP_31_VEC_LOOP_C_4,
      COMP_LOOP_31_VEC_LOOP_C_5, COMP_LOOP_31_VEC_LOOP_C_6, COMP_LOOP_31_VEC_LOOP_C_7,
      COMP_LOOP_31_VEC_LOOP_C_8, COMP_LOOP_C_33, COMP_LOOP_32_VEC_LOOP_C_0, COMP_LOOP_32_VEC_LOOP_C_1,
      COMP_LOOP_32_VEC_LOOP_C_2, COMP_LOOP_32_VEC_LOOP_C_3, COMP_LOOP_32_VEC_LOOP_C_4,
      COMP_LOOP_32_VEC_LOOP_C_5, COMP_LOOP_32_VEC_LOOP_C_6, COMP_LOOP_32_VEC_LOOP_C_7,
      COMP_LOOP_32_VEC_LOOP_C_8, COMP_LOOP_C_34, STAGE_LOOP_C_1, main_C_1, main_C_2);

  SIGNAL state_var : inPlaceNTT_DIT_precomp_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_precomp_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_precomp_core_core_fsm_1 : PROCESS (main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_3_tr0, COMP_LOOP_2_VEC_LOOP_C_8_tr0, COMP_LOOP_C_4_tr0, COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_5_tr0, COMP_LOOP_4_VEC_LOOP_C_8_tr0, COMP_LOOP_C_6_tr0, COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_7_tr0, COMP_LOOP_6_VEC_LOOP_C_8_tr0, COMP_LOOP_C_8_tr0, COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_9_tr0, COMP_LOOP_8_VEC_LOOP_C_8_tr0, COMP_LOOP_C_10_tr0, COMP_LOOP_9_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_11_tr0, COMP_LOOP_10_VEC_LOOP_C_8_tr0, COMP_LOOP_C_12_tr0, COMP_LOOP_11_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_13_tr0, COMP_LOOP_12_VEC_LOOP_C_8_tr0, COMP_LOOP_C_14_tr0, COMP_LOOP_13_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_15_tr0, COMP_LOOP_14_VEC_LOOP_C_8_tr0, COMP_LOOP_C_16_tr0, COMP_LOOP_15_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_17_tr0, COMP_LOOP_16_VEC_LOOP_C_8_tr0, COMP_LOOP_C_18_tr0, COMP_LOOP_17_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_19_tr0, COMP_LOOP_18_VEC_LOOP_C_8_tr0, COMP_LOOP_C_20_tr0, COMP_LOOP_19_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_21_tr0, COMP_LOOP_20_VEC_LOOP_C_8_tr0, COMP_LOOP_C_22_tr0, COMP_LOOP_21_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_23_tr0, COMP_LOOP_22_VEC_LOOP_C_8_tr0, COMP_LOOP_C_24_tr0, COMP_LOOP_23_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_25_tr0, COMP_LOOP_24_VEC_LOOP_C_8_tr0, COMP_LOOP_C_26_tr0, COMP_LOOP_25_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_27_tr0, COMP_LOOP_26_VEC_LOOP_C_8_tr0, COMP_LOOP_C_28_tr0, COMP_LOOP_27_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_29_tr0, COMP_LOOP_28_VEC_LOOP_C_8_tr0, COMP_LOOP_C_30_tr0, COMP_LOOP_29_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_31_tr0, COMP_LOOP_30_VEC_LOOP_C_8_tr0, COMP_LOOP_C_32_tr0, COMP_LOOP_31_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_33_tr0, COMP_LOOP_32_VEC_LOOP_C_8_tr0, COMP_LOOP_C_34_tr0, STAGE_LOOP_C_1_tr0,
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
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
      WHEN COMP_LOOP_1_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000101");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_1;
      WHEN COMP_LOOP_1_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000110");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_2;
      WHEN COMP_LOOP_1_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000111");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_3;
      WHEN COMP_LOOP_1_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_4;
      WHEN COMP_LOOP_1_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001001");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_5;
      WHEN COMP_LOOP_1_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_6;
      WHEN COMP_LOOP_1_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_7;
      WHEN COMP_LOOP_1_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_8;
      WHEN COMP_LOOP_1_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        IF ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_3;
        ELSE
          state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        IF ( COMP_LOOP_C_3_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_2_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_1;
      WHEN COMP_LOOP_2_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_2;
      WHEN COMP_LOOP_2_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_3;
      WHEN COMP_LOOP_2_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_4;
      WHEN COMP_LOOP_2_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_5;
      WHEN COMP_LOOP_2_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_6;
      WHEN COMP_LOOP_2_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_7;
      WHEN COMP_LOOP_2_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_8;
      WHEN COMP_LOOP_2_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        IF ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_4;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        IF ( COMP_LOOP_C_4_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_3_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_1;
      WHEN COMP_LOOP_3_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_2;
      WHEN COMP_LOOP_3_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_3;
      WHEN COMP_LOOP_3_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_4;
      WHEN COMP_LOOP_3_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_5;
      WHEN COMP_LOOP_3_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_6;
      WHEN COMP_LOOP_3_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_7;
      WHEN COMP_LOOP_3_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_8;
      WHEN COMP_LOOP_3_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        IF ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_5;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        IF ( COMP_LOOP_C_5_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_4_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_1;
      WHEN COMP_LOOP_4_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_2;
      WHEN COMP_LOOP_4_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_3;
      WHEN COMP_LOOP_4_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_4;
      WHEN COMP_LOOP_4_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_5;
      WHEN COMP_LOOP_4_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_6;
      WHEN COMP_LOOP_4_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_7;
      WHEN COMP_LOOP_4_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_8;
      WHEN COMP_LOOP_4_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        IF ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_6;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        IF ( COMP_LOOP_C_6_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_5_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_1;
      WHEN COMP_LOOP_5_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_2;
      WHEN COMP_LOOP_5_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_3;
      WHEN COMP_LOOP_5_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_4;
      WHEN COMP_LOOP_5_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_5;
      WHEN COMP_LOOP_5_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_6;
      WHEN COMP_LOOP_5_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_7;
      WHEN COMP_LOOP_5_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_8;
      WHEN COMP_LOOP_5_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        IF ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_7;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        IF ( COMP_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_6_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_1;
      WHEN COMP_LOOP_6_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_2;
      WHEN COMP_LOOP_6_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_3;
      WHEN COMP_LOOP_6_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_4;
      WHEN COMP_LOOP_6_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_5;
      WHEN COMP_LOOP_6_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_6;
      WHEN COMP_LOOP_6_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_7;
      WHEN COMP_LOOP_6_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_8;
      WHEN COMP_LOOP_6_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        IF ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_8;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        IF ( COMP_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_7_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_1;
      WHEN COMP_LOOP_7_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_2;
      WHEN COMP_LOOP_7_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_3;
      WHEN COMP_LOOP_7_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_4;
      WHEN COMP_LOOP_7_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_5;
      WHEN COMP_LOOP_7_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_6;
      WHEN COMP_LOOP_7_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_7;
      WHEN COMP_LOOP_7_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_8;
      WHEN COMP_LOOP_7_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        IF ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        IF ( COMP_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_8_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_1;
      WHEN COMP_LOOP_8_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_2;
      WHEN COMP_LOOP_8_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_3;
      WHEN COMP_LOOP_8_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_4;
      WHEN COMP_LOOP_8_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_5;
      WHEN COMP_LOOP_8_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_6;
      WHEN COMP_LOOP_8_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_7;
      WHEN COMP_LOOP_8_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_8;
      WHEN COMP_LOOP_8_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        IF ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_10;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        IF ( COMP_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_9_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_1;
      WHEN COMP_LOOP_9_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_2;
      WHEN COMP_LOOP_9_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_3;
      WHEN COMP_LOOP_9_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_4;
      WHEN COMP_LOOP_9_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_5;
      WHEN COMP_LOOP_9_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_6;
      WHEN COMP_LOOP_9_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_7;
      WHEN COMP_LOOP_9_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_8;
      WHEN COMP_LOOP_9_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        IF ( COMP_LOOP_9_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_11;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        IF ( COMP_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_10_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_1;
      WHEN COMP_LOOP_10_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_2;
      WHEN COMP_LOOP_10_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_3;
      WHEN COMP_LOOP_10_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_4;
      WHEN COMP_LOOP_10_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_5;
      WHEN COMP_LOOP_10_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_6;
      WHEN COMP_LOOP_10_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_7;
      WHEN COMP_LOOP_10_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_8;
      WHEN COMP_LOOP_10_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        IF ( COMP_LOOP_10_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_12;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        IF ( COMP_LOOP_C_12_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_11_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_1;
      WHEN COMP_LOOP_11_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_2;
      WHEN COMP_LOOP_11_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_3;
      WHEN COMP_LOOP_11_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_4;
      WHEN COMP_LOOP_11_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_5;
      WHEN COMP_LOOP_11_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_6;
      WHEN COMP_LOOP_11_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_7;
      WHEN COMP_LOOP_11_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_8;
      WHEN COMP_LOOP_11_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        IF ( COMP_LOOP_11_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_13;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        IF ( COMP_LOOP_C_13_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_12_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_1;
      WHEN COMP_LOOP_12_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_2;
      WHEN COMP_LOOP_12_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_3;
      WHEN COMP_LOOP_12_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_4;
      WHEN COMP_LOOP_12_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_5;
      WHEN COMP_LOOP_12_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_6;
      WHEN COMP_LOOP_12_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_7;
      WHEN COMP_LOOP_12_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_8;
      WHEN COMP_LOOP_12_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        IF ( COMP_LOOP_12_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_14;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        IF ( COMP_LOOP_C_14_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_13_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_1;
      WHEN COMP_LOOP_13_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_2;
      WHEN COMP_LOOP_13_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_3;
      WHEN COMP_LOOP_13_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_4;
      WHEN COMP_LOOP_13_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_5;
      WHEN COMP_LOOP_13_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_6;
      WHEN COMP_LOOP_13_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_7;
      WHEN COMP_LOOP_13_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_8;
      WHEN COMP_LOOP_13_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        IF ( COMP_LOOP_13_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_15;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        IF ( COMP_LOOP_C_15_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_14_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_1;
      WHEN COMP_LOOP_14_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_2;
      WHEN COMP_LOOP_14_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_3;
      WHEN COMP_LOOP_14_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_4;
      WHEN COMP_LOOP_14_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_5;
      WHEN COMP_LOOP_14_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_6;
      WHEN COMP_LOOP_14_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_7;
      WHEN COMP_LOOP_14_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_8;
      WHEN COMP_LOOP_14_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        IF ( COMP_LOOP_14_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_16;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        IF ( COMP_LOOP_C_16_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_15_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_1;
      WHEN COMP_LOOP_15_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_2;
      WHEN COMP_LOOP_15_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_3;
      WHEN COMP_LOOP_15_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_4;
      WHEN COMP_LOOP_15_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_5;
      WHEN COMP_LOOP_15_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_6;
      WHEN COMP_LOOP_15_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_7;
      WHEN COMP_LOOP_15_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_8;
      WHEN COMP_LOOP_15_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        IF ( COMP_LOOP_15_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_17;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        IF ( COMP_LOOP_C_17_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_16_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_1;
      WHEN COMP_LOOP_16_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_2;
      WHEN COMP_LOOP_16_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_3;
      WHEN COMP_LOOP_16_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_4;
      WHEN COMP_LOOP_16_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_5;
      WHEN COMP_LOOP_16_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_6;
      WHEN COMP_LOOP_16_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_7;
      WHEN COMP_LOOP_16_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_8;
      WHEN COMP_LOOP_16_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        IF ( COMP_LOOP_16_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_18;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        IF ( COMP_LOOP_C_18_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_17_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_1;
      WHEN COMP_LOOP_17_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_2;
      WHEN COMP_LOOP_17_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_3;
      WHEN COMP_LOOP_17_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_4;
      WHEN COMP_LOOP_17_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_5;
      WHEN COMP_LOOP_17_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_6;
      WHEN COMP_LOOP_17_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_7;
      WHEN COMP_LOOP_17_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_8;
      WHEN COMP_LOOP_17_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        IF ( COMP_LOOP_17_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_19;
        ELSE
          state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        IF ( COMP_LOOP_C_19_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_18_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_1;
      WHEN COMP_LOOP_18_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_2;
      WHEN COMP_LOOP_18_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_3;
      WHEN COMP_LOOP_18_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_4;
      WHEN COMP_LOOP_18_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_5;
      WHEN COMP_LOOP_18_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_6;
      WHEN COMP_LOOP_18_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_7;
      WHEN COMP_LOOP_18_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_8;
      WHEN COMP_LOOP_18_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        IF ( COMP_LOOP_18_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_20;
        ELSE
          state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        IF ( COMP_LOOP_C_20_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_19_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_1;
      WHEN COMP_LOOP_19_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_2;
      WHEN COMP_LOOP_19_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_3;
      WHEN COMP_LOOP_19_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_4;
      WHEN COMP_LOOP_19_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_5;
      WHEN COMP_LOOP_19_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_6;
      WHEN COMP_LOOP_19_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_7;
      WHEN COMP_LOOP_19_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_8;
      WHEN COMP_LOOP_19_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        IF ( COMP_LOOP_19_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_21;
        ELSE
          state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        IF ( COMP_LOOP_C_21_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_20_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_1;
      WHEN COMP_LOOP_20_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_2;
      WHEN COMP_LOOP_20_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_3;
      WHEN COMP_LOOP_20_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_4;
      WHEN COMP_LOOP_20_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_5;
      WHEN COMP_LOOP_20_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_6;
      WHEN COMP_LOOP_20_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_7;
      WHEN COMP_LOOP_20_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_8;
      WHEN COMP_LOOP_20_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        IF ( COMP_LOOP_20_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_22;
        ELSE
          state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        IF ( COMP_LOOP_C_22_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_21_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_1;
      WHEN COMP_LOOP_21_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_2;
      WHEN COMP_LOOP_21_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_3;
      WHEN COMP_LOOP_21_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_4;
      WHEN COMP_LOOP_21_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_5;
      WHEN COMP_LOOP_21_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_6;
      WHEN COMP_LOOP_21_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_7;
      WHEN COMP_LOOP_21_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_8;
      WHEN COMP_LOOP_21_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        IF ( COMP_LOOP_21_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_23;
        ELSE
          state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        IF ( COMP_LOOP_C_23_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_22_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_1;
      WHEN COMP_LOOP_22_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_2;
      WHEN COMP_LOOP_22_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_3;
      WHEN COMP_LOOP_22_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_4;
      WHEN COMP_LOOP_22_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_5;
      WHEN COMP_LOOP_22_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_6;
      WHEN COMP_LOOP_22_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_7;
      WHEN COMP_LOOP_22_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_8;
      WHEN COMP_LOOP_22_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        IF ( COMP_LOOP_22_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_24;
        ELSE
          state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        IF ( COMP_LOOP_C_24_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_23_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_1;
      WHEN COMP_LOOP_23_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_2;
      WHEN COMP_LOOP_23_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_3;
      WHEN COMP_LOOP_23_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_4;
      WHEN COMP_LOOP_23_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_5;
      WHEN COMP_LOOP_23_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_6;
      WHEN COMP_LOOP_23_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_7;
      WHEN COMP_LOOP_23_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_8;
      WHEN COMP_LOOP_23_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        IF ( COMP_LOOP_23_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_25;
        ELSE
          state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        IF ( COMP_LOOP_C_25_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_24_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_1;
      WHEN COMP_LOOP_24_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_2;
      WHEN COMP_LOOP_24_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_3;
      WHEN COMP_LOOP_24_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_4;
      WHEN COMP_LOOP_24_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_5;
      WHEN COMP_LOOP_24_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_6;
      WHEN COMP_LOOP_24_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_7;
      WHEN COMP_LOOP_24_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_8;
      WHEN COMP_LOOP_24_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        IF ( COMP_LOOP_24_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_26;
        ELSE
          state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        IF ( COMP_LOOP_C_26_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_25_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_1;
      WHEN COMP_LOOP_25_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_2;
      WHEN COMP_LOOP_25_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_3;
      WHEN COMP_LOOP_25_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_4;
      WHEN COMP_LOOP_25_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_5;
      WHEN COMP_LOOP_25_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_6;
      WHEN COMP_LOOP_25_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_7;
      WHEN COMP_LOOP_25_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_8;
      WHEN COMP_LOOP_25_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        IF ( COMP_LOOP_25_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_27;
        ELSE
          state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        IF ( COMP_LOOP_C_27_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_26_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_1;
      WHEN COMP_LOOP_26_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_2;
      WHEN COMP_LOOP_26_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_3;
      WHEN COMP_LOOP_26_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_4;
      WHEN COMP_LOOP_26_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_5;
      WHEN COMP_LOOP_26_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_6;
      WHEN COMP_LOOP_26_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_7;
      WHEN COMP_LOOP_26_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_8;
      WHEN COMP_LOOP_26_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        IF ( COMP_LOOP_26_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_28;
        ELSE
          state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        IF ( COMP_LOOP_C_28_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_27_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_1;
      WHEN COMP_LOOP_27_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_2;
      WHEN COMP_LOOP_27_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_3;
      WHEN COMP_LOOP_27_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_4;
      WHEN COMP_LOOP_27_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_5;
      WHEN COMP_LOOP_27_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_6;
      WHEN COMP_LOOP_27_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_7;
      WHEN COMP_LOOP_27_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_8;
      WHEN COMP_LOOP_27_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        IF ( COMP_LOOP_27_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_29;
        ELSE
          state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        IF ( COMP_LOOP_C_29_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_28_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_1;
      WHEN COMP_LOOP_28_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_2;
      WHEN COMP_LOOP_28_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_3;
      WHEN COMP_LOOP_28_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_4;
      WHEN COMP_LOOP_28_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_5;
      WHEN COMP_LOOP_28_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_6;
      WHEN COMP_LOOP_28_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_7;
      WHEN COMP_LOOP_28_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_8;
      WHEN COMP_LOOP_28_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        IF ( COMP_LOOP_28_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_30;
        ELSE
          state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        IF ( COMP_LOOP_C_30_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_29_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_1;
      WHEN COMP_LOOP_29_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_2;
      WHEN COMP_LOOP_29_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_3;
      WHEN COMP_LOOP_29_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_4;
      WHEN COMP_LOOP_29_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_5;
      WHEN COMP_LOOP_29_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_6;
      WHEN COMP_LOOP_29_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_7;
      WHEN COMP_LOOP_29_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_8;
      WHEN COMP_LOOP_29_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        IF ( COMP_LOOP_29_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_31;
        ELSE
          state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        IF ( COMP_LOOP_C_31_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_30_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_1;
      WHEN COMP_LOOP_30_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_2;
      WHEN COMP_LOOP_30_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_3;
      WHEN COMP_LOOP_30_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_4;
      WHEN COMP_LOOP_30_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_5;
      WHEN COMP_LOOP_30_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_6;
      WHEN COMP_LOOP_30_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_7;
      WHEN COMP_LOOP_30_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_8;
      WHEN COMP_LOOP_30_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        IF ( COMP_LOOP_30_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_32;
        ELSE
          state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        IF ( COMP_LOOP_C_32_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_31_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_1;
      WHEN COMP_LOOP_31_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_2;
      WHEN COMP_LOOP_31_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_3;
      WHEN COMP_LOOP_31_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_4;
      WHEN COMP_LOOP_31_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_5;
      WHEN COMP_LOOP_31_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_6;
      WHEN COMP_LOOP_31_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_7;
      WHEN COMP_LOOP_31_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_8;
      WHEN COMP_LOOP_31_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        IF ( COMP_LOOP_31_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_33;
        ELSE
          state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        IF ( COMP_LOOP_C_33_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_32_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_1;
      WHEN COMP_LOOP_32_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_2;
      WHEN COMP_LOOP_32_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_3;
      WHEN COMP_LOOP_32_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_4;
      WHEN COMP_LOOP_32_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_5;
      WHEN COMP_LOOP_32_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_6;
      WHEN COMP_LOOP_32_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_7;
      WHEN COMP_LOOP_32_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_8;
      WHEN COMP_LOOP_32_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        IF ( COMP_LOOP_32_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_34;
        ELSE
          state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        IF ( COMP_LOOP_C_34_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000111");
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

END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_staller IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  r_rsc_triosy_obj_ld_core_sct <= r_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  p_rsc_triosy_obj_ld_core_sct <= p_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  vec_rsc_triosy_obj_ld_core_sct <= vec_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_ogwt : STD_LOGIC;

BEGIN
  complete_rsci_bdwt <= complete_rsci_oswt AND core_wen;
  complete_rsci_biwt <= complete_rsci_ogwt AND complete_rsci_irdy;
  complete_rsci_ogwt <= complete_rsci_oswt AND (NOT complete_rsci_bcwt);
  complete_rsci_ivld_core_sct <= complete_rsci_ogwt;
END v8;

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
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_biwt : IN STD_LOGIC;
    twiddle_h_rsci_bdwt : IN STD_LOGIC;
    twiddle_h_rsci_biwt_1 : IN STD_LOGIC;
    twiddle_h_rsci_bdwt_2 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bcwt_1 : STD_LOGIC;
  SIGNAL twiddle_h_rsci_qa_d_bfwt_63_32 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_bfwt_31_0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL COMP_LOOP_twiddle_help_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
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
  COMP_LOOP_twiddle_help_mux_2_nl <= MUX_v_32_2_2((twiddle_h_rsci_qa_d(63 DOWNTO
      32)), twiddle_h_rsci_qa_d_bfwt_63_32, twiddle_h_rsci_bcwt_1);
  COMP_LOOP_twiddle_help_mux_3_nl <= MUX_v_32_2_2((twiddle_h_rsci_qa_d(31 DOWNTO
      0)), twiddle_h_rsci_qa_d_bfwt_31_0, twiddle_h_rsci_bcwt);
  twiddle_h_rsci_qa_d_mxwt <= COMP_LOOP_twiddle_help_mux_2_nl & COMP_LOOP_twiddle_help_mux_3_nl;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        twiddle_h_rsci_bcwt <= '0';
        twiddle_h_rsci_bcwt_1 <= '0';
      ELSE
        twiddle_h_rsci_bcwt <= NOT((NOT(twiddle_h_rsci_bcwt OR twiddle_h_rsci_biwt))
            OR twiddle_h_rsci_bdwt);
        twiddle_h_rsci_bcwt_1 <= NOT((NOT(twiddle_h_rsci_bcwt_1 OR twiddle_h_rsci_biwt_1))
            OR twiddle_h_rsci_bdwt_2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( twiddle_h_rsci_biwt_1 = '1' ) THEN
        twiddle_h_rsci_qa_d_bfwt_63_32 <= twiddle_h_rsci_qa_d(63 DOWNTO 32);
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
END v8;

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
    twiddle_h_rsci_oswt_1 : IN STD_LOGIC;
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    twiddle_h_rsci_biwt : OUT STD_LOGIC;
    twiddle_h_rsci_bdwt : OUT STD_LOGIC;
    twiddle_h_rsci_biwt_1 : OUT STD_LOGIC;
    twiddle_h_rsci_bdwt_2 : OUT STD_LOGIC;
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    IS
  -- Default Constants

  SIGNAL COMP_LOOP_twiddle_help_and_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_9_nl : STD_LOGIC;
BEGIN
  twiddle_h_rsci_bdwt <= twiddle_h_rsci_oswt AND core_wen;
  twiddle_h_rsci_biwt <= (NOT core_wten) AND twiddle_h_rsci_oswt;
  twiddle_h_rsci_bdwt_2 <= twiddle_h_rsci_oswt_1 AND core_wen;
  twiddle_h_rsci_biwt_1 <= (NOT core_wten) AND twiddle_h_rsci_oswt_1;
  COMP_LOOP_twiddle_help_and_8_nl <= (NOT core_wten_pff) AND twiddle_h_rsci_oswt_1_pff;
  COMP_LOOP_twiddle_help_and_9_nl <= (NOT core_wten_pff) AND twiddle_h_rsci_oswt_pff;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      AND STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_help_and_8_nl & COMP_LOOP_twiddle_help_and_9_nl);
END v8;

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
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_biwt : IN STD_LOGIC;
    twiddle_rsci_bdwt : IN STD_LOGIC;
    twiddle_rsci_biwt_1 : IN STD_LOGIC;
    twiddle_rsci_bdwt_2 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bcwt_1 : STD_LOGIC;
  SIGNAL twiddle_rsci_qa_d_bfwt_63_32 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_bfwt_31_0 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL COMP_LOOP_twiddle_f_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
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
  COMP_LOOP_twiddle_f_mux_2_nl <= MUX_v_32_2_2((twiddle_rsci_qa_d(63 DOWNTO 32)),
      twiddle_rsci_qa_d_bfwt_63_32, twiddle_rsci_bcwt_1);
  COMP_LOOP_twiddle_f_mux_3_nl <= MUX_v_32_2_2((twiddle_rsci_qa_d(31 DOWNTO 0)),
      twiddle_rsci_qa_d_bfwt_31_0, twiddle_rsci_bcwt);
  twiddle_rsci_qa_d_mxwt <= COMP_LOOP_twiddle_f_mux_2_nl & COMP_LOOP_twiddle_f_mux_3_nl;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        twiddle_rsci_bcwt <= '0';
        twiddle_rsci_bcwt_1 <= '0';
      ELSE
        twiddle_rsci_bcwt <= NOT((NOT(twiddle_rsci_bcwt OR twiddle_rsci_biwt)) OR
            twiddle_rsci_bdwt);
        twiddle_rsci_bcwt_1 <= NOT((NOT(twiddle_rsci_bcwt_1 OR twiddle_rsci_biwt_1))
            OR twiddle_rsci_bdwt_2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( twiddle_rsci_biwt_1 = '1' ) THEN
        twiddle_rsci_qa_d_bfwt_63_32 <= twiddle_rsci_qa_d(63 DOWNTO 32);
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
END v8;

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
    twiddle_rsci_oswt_1 : IN STD_LOGIC;
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    twiddle_rsci_biwt : OUT STD_LOGIC;
    twiddle_rsci_bdwt : OUT STD_LOGIC;
    twiddle_rsci_biwt_1 : OUT STD_LOGIC;
    twiddle_rsci_bdwt_2 : OUT STD_LOGIC;
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    IS
  -- Default Constants

  SIGNAL COMP_LOOP_twiddle_f_and_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_9_nl : STD_LOGIC;
BEGIN
  twiddle_rsci_bdwt <= twiddle_rsci_oswt AND core_wen;
  twiddle_rsci_biwt <= (NOT core_wten) AND twiddle_rsci_oswt;
  twiddle_rsci_bdwt_2 <= twiddle_rsci_oswt_1 AND core_wen;
  twiddle_rsci_biwt_1 <= (NOT core_wten) AND twiddle_rsci_oswt_1;
  COMP_LOOP_twiddle_f_and_8_nl <= (NOT core_wten_pff) AND twiddle_rsci_oswt_1_pff;
  COMP_LOOP_twiddle_f_and_9_nl <= (NOT core_wten_pff) AND twiddle_rsci_oswt_pff;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      AND STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_and_8_nl & COMP_LOOP_twiddle_f_and_9_nl);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  COMP_LOOP_1_mult_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo_2 OR ensig_cgo_iro_2);
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_complete_rsci IS
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
END v8;

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
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_oswt_1 : IN STD_LOGIC;
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_biwt_1 : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_oswt_1 : IN STD_LOGIC;
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      twiddle_h_rsci_biwt : OUT STD_LOGIC;
      twiddle_h_rsci_bdwt : OUT STD_LOGIC;
      twiddle_h_rsci_biwt_1 : OUT STD_LOGIC;
      twiddle_h_rsci_bdwt_2 : OUT STD_LOGIC;
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
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
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_biwt : IN STD_LOGIC;
      twiddle_h_rsci_bdwt : IN STD_LOGIC;
      twiddle_h_rsci_biwt_1 : IN STD_LOGIC;
      twiddle_h_rsci_bdwt_2 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      twiddle_h_rsci_oswt => twiddle_h_rsci_oswt,
      twiddle_h_rsci_oswt_1 => twiddle_h_rsci_oswt_1,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_biwt_1 => twiddle_h_rsci_biwt_1,
      twiddle_h_rsci_bdwt_2 => twiddle_h_rsci_bdwt_2,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff => core_wten_pff,
      twiddle_h_rsci_oswt_1_pff => twiddle_h_rsci_oswt_1_pff,
      twiddle_h_rsci_oswt_pff => twiddle_h_rsci_oswt_pff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;

  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_biwt_1 => twiddle_h_rsci_biwt_1,
      twiddle_h_rsci_bdwt_2 => twiddle_h_rsci_bdwt_2
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt;

  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v8;

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
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_oswt_1 : IN STD_LOGIC;
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
        (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_rsci_biwt_1 : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_oswt_1 : IN STD_LOGIC;
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      twiddle_rsci_biwt : OUT STD_LOGIC;
      twiddle_rsci_bdwt : OUT STD_LOGIC;
      twiddle_rsci_biwt_1 : OUT STD_LOGIC;
      twiddle_rsci_bdwt_2 : OUT STD_LOGIC;
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
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
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_biwt : IN STD_LOGIC;
      twiddle_rsci_bdwt : IN STD_LOGIC;
      twiddle_rsci_biwt_1 : IN STD_LOGIC;
      twiddle_rsci_bdwt_2 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      twiddle_rsci_oswt => twiddle_rsci_oswt,
      twiddle_rsci_oswt_1 => twiddle_rsci_oswt_1,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_biwt_1 => twiddle_rsci_biwt_1,
      twiddle_rsci_bdwt_2 => twiddle_rsci_bdwt_2,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff => core_wten_pff,
      twiddle_rsci_oswt_1_pff => twiddle_rsci_oswt_1_pff,
      twiddle_rsci_oswt_pff => twiddle_rsci_oswt_pff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;

  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d,
      twiddle_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_biwt_1 => twiddle_rsci_biwt_1,
      twiddle_rsci_bdwt_2 => twiddle_rsci_bdwt_2
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      <= twiddle_rsci_qa_d;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt;

  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1 IS
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
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core_run_rsci IS
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
END v8;

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
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0)
  );
END inPlaceNTT_DIT_precomp_core;

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL run_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL vec_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_mxwt : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL complete_rsci_wen_comp : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modulo_add_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL or_tmp_1 : STD_LOGIC;
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL or_tmp_38 : STD_LOGIC;
  SIGNAL or_tmp_39 : STD_LOGIC;
  SIGNAL nor_tmp_3 : STD_LOGIC;
  SIGNAL mux_tmp_82 : STD_LOGIC;
  SIGNAL nor_tmp_11 : STD_LOGIC;
  SIGNAL not_tmp_69 : STD_LOGIC;
  SIGNAL nor_tmp_29 : STD_LOGIC;
  SIGNAL or_dcpl_168 : STD_LOGIC;
  SIGNAL or_tmp_145 : STD_LOGIC;
  SIGNAL mux_tmp_336 : STD_LOGIC;
  SIGNAL mux_tmp_338 : STD_LOGIC;
  SIGNAL or_tmp_148 : STD_LOGIC;
  SIGNAL mux_tmp_339 : STD_LOGIC;
  SIGNAL mux_tmp_340 : STD_LOGIC;
  SIGNAL or_tmp_149 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL mux_tmp_344 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL mux_tmp_346 : STD_LOGIC;
  SIGNAL mux_tmp_348 : STD_LOGIC;
  SIGNAL mux_tmp_350 : STD_LOGIC;
  SIGNAL mux_tmp_355 : STD_LOGIC;
  SIGNAL mux_tmp_356 : STD_LOGIC;
  SIGNAL or_tmp_156 : STD_LOGIC;
  SIGNAL or_tmp_157 : STD_LOGIC;
  SIGNAL or_tmp_158 : STD_LOGIC;
  SIGNAL or_tmp_160 : STD_LOGIC;
  SIGNAL or_tmp_161 : STD_LOGIC;
  SIGNAL mux_tmp_374 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL mux_tmp_401 : STD_LOGIC;
  SIGNAL or_tmp_172 : STD_LOGIC;
  SIGNAL or_tmp_175 : STD_LOGIC;
  SIGNAL mux_tmp_404 : STD_LOGIC;
  SIGNAL mux_tmp_405 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL or_tmp_184 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL mux_tmp_418 : STD_LOGIC;
  SIGNAL mux_tmp_419 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_93 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL and_dcpl_108 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_115 : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL and_dcpl_117 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_120 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL or_tmp_186 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL mux_tmp_424 : STD_LOGIC;
  SIGNAL mux_tmp_425 : STD_LOGIC;
  SIGNAL mux_tmp_446 : STD_LOGIC;
  SIGNAL mux_tmp_451 : STD_LOGIC;
  SIGNAL mux_tmp_454 : STD_LOGIC;
  SIGNAL mux_tmp_467 : STD_LOGIC;
  SIGNAL mux_tmp_504 : STD_LOGIC;
  SIGNAL mux_tmp_509 : STD_LOGIC;
  SIGNAL mux_tmp_516 : STD_LOGIC;
  SIGNAL mux_tmp_517 : STD_LOGIC;
  SIGNAL mux_tmp_526 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL mux_tmp_536 : STD_LOGIC;
  SIGNAL mux_tmp_543 : STD_LOGIC;
  SIGNAL mux_tmp_548 : STD_LOGIC;
  SIGNAL or_tmp_271 : STD_LOGIC;
  SIGNAL or_tmp_272 : STD_LOGIC;
  SIGNAL mux_tmp_555 : STD_LOGIC;
  SIGNAL or_tmp_273 : STD_LOGIC;
  SIGNAL or_tmp_274 : STD_LOGIC;
  SIGNAL not_tmp_207 : STD_LOGIC;
  SIGNAL or_tmp_277 : STD_LOGIC;
  SIGNAL mux_tmp_561 : STD_LOGIC;
  SIGNAL mux_tmp_562 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_167 : STD_LOGIC;
  SIGNAL mux_tmp_581 : STD_LOGIC;
  SIGNAL or_tmp_291 : STD_LOGIC;
  SIGNAL mux_tmp_586 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL or_tmp_295 : STD_LOGIC;
  SIGNAL or_tmp_297 : STD_LOGIC;
  SIGNAL mux_tmp_602 : STD_LOGIC;
  SIGNAL mux_tmp_603 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL not_tmp_218 : STD_LOGIC;
  SIGNAL or_tmp_306 : STD_LOGIC;
  SIGNAL or_tmp_307 : STD_LOGIC;
  SIGNAL or_tmp_308 : STD_LOGIC;
  SIGNAL mux_tmp_612 : STD_LOGIC;
  SIGNAL mux_tmp_614 : STD_LOGIC;
  SIGNAL mux_tmp_615 : STD_LOGIC;
  SIGNAL mux_tmp_616 : STD_LOGIC;
  SIGNAL mux_tmp_617 : STD_LOGIC;
  SIGNAL mux_tmp_618 : STD_LOGIC;
  SIGNAL mux_tmp_619 : STD_LOGIC;
  SIGNAL mux_tmp_621 : STD_LOGIC;
  SIGNAL mux_tmp_622 : STD_LOGIC;
  SIGNAL mux_tmp_623 : STD_LOGIC;
  SIGNAL mux_tmp_640 : STD_LOGIC;
  SIGNAL and_dcpl_203 : STD_LOGIC;
  SIGNAL or_tmp_330 : STD_LOGIC;
  SIGNAL mux_tmp_646 : STD_LOGIC;
  SIGNAL nand_tmp_10 : STD_LOGIC;
  SIGNAL and_dcpl_204 : STD_LOGIC;
  SIGNAL and_dcpl_205 : STD_LOGIC;
  SIGNAL not_tmp_230 : STD_LOGIC;
  SIGNAL mux_tmp_673 : STD_LOGIC;
  SIGNAL mux_tmp_677 : STD_LOGIC;
  SIGNAL or_tmp_355 : STD_LOGIC;
  SIGNAL or_tmp_356 : STD_LOGIC;
  SIGNAL mux_tmp_678 : STD_LOGIC;
  SIGNAL mux_tmp_680 : STD_LOGIC;
  SIGNAL mux_tmp_686 : STD_LOGIC;
  SIGNAL and_dcpl_216 : STD_LOGIC;
  SIGNAL mux_tmp_695 : STD_LOGIC;
  SIGNAL mux_tmp_696 : STD_LOGIC;
  SIGNAL mux_tmp_706 : STD_LOGIC;
  SIGNAL or_tmp_375 : STD_LOGIC;
  SIGNAL or_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_722 : STD_LOGIC;
  SIGNAL mux_tmp_723 : STD_LOGIC;
  SIGNAL nand_tmp_11 : STD_LOGIC;
  SIGNAL and_dcpl_227 : STD_LOGIC;
  SIGNAL and_dcpl_231 : STD_LOGIC;
  SIGNAL mux_tmp_830 : STD_LOGIC;
  SIGNAL mux_tmp_831 : STD_LOGIC;
  SIGNAL mux_tmp_834 : STD_LOGIC;
  SIGNAL mux_tmp_836 : STD_LOGIC;
  SIGNAL mux_tmp_848 : STD_LOGIC;
  SIGNAL mux_tmp_852 : STD_LOGIC;
  SIGNAL mux_tmp_853 : STD_LOGIC;
  SIGNAL mux_tmp_856 : STD_LOGIC;
  SIGNAL mux_tmp_858 : STD_LOGIC;
  SIGNAL not_tmp_267 : STD_LOGIC;
  SIGNAL or_tmp_481 : STD_LOGIC;
  SIGNAL or_tmp_486 : STD_LOGIC;
  SIGNAL or_tmp_487 : STD_LOGIC;
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL nand_tmp_19 : STD_LOGIC;
  SIGNAL mux_tmp_964 : STD_LOGIC;
  SIGNAL mux_tmp_965 : STD_LOGIC;
  SIGNAL mux_tmp_966 : STD_LOGIC;
  SIGNAL mux_tmp_978 : STD_LOGIC;
  SIGNAL mux_tmp_980 : STD_LOGIC;
  SIGNAL and_dcpl_248 : STD_LOGIC;
  SIGNAL or_tmp_527 : STD_LOGIC;
  SIGNAL or_tmp_529 : STD_LOGIC;
  SIGNAL or_tmp_530 : STD_LOGIC;
  SIGNAL mux_tmp_1006 : STD_LOGIC;
  SIGNAL mux_tmp_1011 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL or_390_cse : STD_LOGIC;
  SIGNAL or_395_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_2_cse : STD_LOGIC;
  SIGNAL and_283_cse : STD_LOGIC;
  SIGNAL and_291_cse : STD_LOGIC;
  SIGNAL or_725_cse : STD_LOGIC;
  SIGNAL or_736_cse : STD_LOGIC;
  SIGNAL or_384_cse : STD_LOGIC;
  SIGNAL or_591_cse : STD_LOGIC;
  SIGNAL or_3_cse : STD_LOGIC;
  SIGNAL nor_95_cse : STD_LOGIC;
  SIGNAL or_321_cse : STD_LOGIC;
  SIGNAL and_285_cse : STD_LOGIC;
  SIGNAL or_739_cse : STD_LOGIC;
  SIGNAL nor_132_cse : STD_LOGIC;
  SIGNAL or_449_cse : STD_LOGIC;
  SIGNAL or_470_cse : STD_LOGIC;
  SIGNAL or_750_cse : STD_LOGIC;
  SIGNAL or_538_cse : STD_LOGIC;
  SIGNAL or_613_cse : STD_LOGIC;
  SIGNAL or_610_cse : STD_LOGIC;
  SIGNAL or_685_cse : STD_LOGIC;
  SIGNAL and_300_cse : STD_LOGIC;
  SIGNAL and_322_cse : STD_LOGIC;
  SIGNAL mux_475_cse : STD_LOGIC;
  SIGNAL mux_472_cse : STD_LOGIC;
  SIGNAL mux_452_cse : STD_LOGIC;
  SIGNAL mux_1021_cse : STD_LOGIC;
  SIGNAL mux_473_cse : STD_LOGIC;
  SIGNAL mux_469_cse : STD_LOGIC;
  SIGNAL mux_369_cse : STD_LOGIC;
  SIGNAL mux_437_cse : STD_LOGIC;
  SIGNAL mux_529_cse : STD_LOGIC;
  SIGNAL mux_457_cse : STD_LOGIC;
  SIGNAL mux_600_cse : STD_LOGIC;
  SIGNAL mux_601_cse : STD_LOGIC;
  SIGNAL or_748_cse : STD_LOGIC;
  SIGNAL mux_422_cse : STD_LOGIC;
  SIGNAL mux_423_cse : STD_LOGIC;
  SIGNAL mux_428_cse : STD_LOGIC;
  SIGNAL mux_380_cse : STD_LOGIC;
  SIGNAL mux_1023_cse : STD_LOGIC;
  SIGNAL mux_474_cse : STD_LOGIC;
  SIGNAL mux_470_cse : STD_LOGIC;
  SIGNAL mux_666_cse : STD_LOGIC;
  SIGNAL mux_663_cse : STD_LOGIC;
  SIGNAL nand_6_cse : STD_LOGIC;
  SIGNAL nand_5_cse : STD_LOGIC;
  SIGNAL or_377_cse : STD_LOGIC;
  SIGNAL mux_806_cse : STD_LOGIC;
  SIGNAL mux_456_cse : STD_LOGIC;
  SIGNAL mux_429_cse : STD_LOGIC;
  SIGNAL mux_426_cse : STD_LOGIC;
  SIGNAL mux_478_cse : STD_LOGIC;
  SIGNAL mux_468_cse : STD_LOGIC;
  SIGNAL mux_381_cse : STD_LOGIC;
  SIGNAL mux_378_cse : STD_LOGIC;
  SIGNAL mux_485_cse : STD_LOGIC;
  SIGNAL mux_664_cse : STD_LOGIC;
  SIGNAL mux_434_cse : STD_LOGIC;
  SIGNAL mux_439_cse : STD_LOGIC;
  SIGNAL mux_435_cse : STD_LOGIC;
  SIGNAL mux_440_cse : STD_LOGIC;
  SIGNAL mux_382_cse : STD_LOGIC;
  SIGNAL mux_379_cse : STD_LOGIC;
  SIGNAL vec_rsci_da_d_reg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_reg : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL and_25_rmff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL VEC_LOOP_mux_rmff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_138_rmff : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_28_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_55_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_108_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_153_rmff : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL and_157_rmff : STD_LOGIC;
  SIGNAL and_152_rmff : STD_LOGIC;
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL and_207_rmff : STD_LOGIC;
  SIGNAL factor1_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_mult_vec_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_11_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_9_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_11_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_9_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_2_sva_mx0w1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_psp_sva_mx0w0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_3_sva_mx0w2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_4_sva_mx0w3 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_5_sva_mx0w4 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_6_sva_mx0w5 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_7_sva_mx0w6 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_8_sva_mx0w7 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_10_sva_mx0w9 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_11_sva_mx0w10 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_12_sva_mx0w11 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_13_sva_mx0w12 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_14_sva_mx0w13 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_15_sva_mx0w14 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_16_sva_mx0w15 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_itm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_18_sva_mx0w17 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_19_sva_mx0w18 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_20_sva_mx0w19 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_21_sva_mx0w20 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_22_sva_mx0w21 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_23_sva_mx0w22 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_24_sva_mx0w23 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_26_sva_mx0w25 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_27_sva_mx0w26 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_28_sva_mx0w27 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_29_sva_mx0w28 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_30_sva_mx0w29 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_31_sva_mx0w30 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_sva_mx0w31 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_368_itm : STD_LOGIC;
  SIGNAL mux_554_itm : STD_LOGIC;
  SIGNAL mux_630_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_itm_1 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_itm : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_515_itm : STD_LOGIC;
  SIGNAL mux_716_itm : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_263 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_269 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_285 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_288 : STD_LOGIC;
  SIGNAL and_dcpl_290 : STD_LOGIC;
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL and_dcpl_297 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL and_dcpl_307 : STD_LOGIC;
  SIGNAL and_dcpl_317 : STD_LOGIC;
  SIGNAL and_dcpl_319 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_334 : STD_LOGIC;
  SIGNAL and_dcpl_339 : STD_LOGIC;
  SIGNAL and_dcpl_342 : STD_LOGIC;
  SIGNAL and_dcpl_343 : STD_LOGIC;
  SIGNAL and_dcpl_345 : STD_LOGIC;
  SIGNAL and_dcpl_348 : STD_LOGIC;
  SIGNAL and_dcpl_352 : STD_LOGIC;
  SIGNAL and_dcpl_358 : STD_LOGIC;
  SIGNAL and_dcpl_362 : STD_LOGIC;
  SIGNAL and_dcpl_365 : STD_LOGIC;
  SIGNAL and_dcpl_371 : STD_LOGIC;
  SIGNAL and_dcpl_374 : STD_LOGIC;
  SIGNAL and_dcpl_377 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL and_dcpl_387 : STD_LOGIC;
  SIGNAL and_dcpl_390 : STD_LOGIC;
  SIGNAL and_dcpl_392 : STD_LOGIC;
  SIGNAL and_dcpl_394 : STD_LOGIC;
  SIGNAL and_dcpl_399 : STD_LOGIC;
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_402 : STD_LOGIC;
  SIGNAL and_dcpl_413 : STD_LOGIC;
  SIGNAL and_dcpl_414 : STD_LOGIC;
  SIGNAL and_dcpl_416 : STD_LOGIC;
  SIGNAL and_dcpl_422 : STD_LOGIC;
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_9 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_tmp_1031 : STD_LOGIC;
  SIGNAL nand_tmp_23 : STD_LOGIC;
  SIGNAL mux_tmp_1033 : STD_LOGIC;
  SIGNAL mux_tmp_1035 : STD_LOGIC;
  SIGNAL or_tmp_560 : STD_LOGIC;
  SIGNAL or_tmp_561 : STD_LOGIC;
  SIGNAL mux_tmp_1038 : STD_LOGIC;
  SIGNAL and_dcpl_451 : STD_LOGIC;
  SIGNAL and_dcpl_452 : STD_LOGIC;
  SIGNAL and_dcpl_457 : STD_LOGIC;
  SIGNAL and_dcpl_459 : STD_LOGIC;
  SIGNAL and_dcpl_462 : STD_LOGIC;
  SIGNAL and_dcpl_464 : STD_LOGIC;
  SIGNAL and_dcpl_466 : STD_LOGIC;
  SIGNAL and_dcpl_469 : STD_LOGIC;
  SIGNAL and_dcpl_471 : STD_LOGIC;
  SIGNAL and_dcpl_474 : STD_LOGIC;
  SIGNAL and_dcpl_476 : STD_LOGIC;
  SIGNAL and_dcpl_478 : STD_LOGIC;
  SIGNAL and_dcpl_479 : STD_LOGIC;
  SIGNAL and_dcpl_481 : STD_LOGIC;
  SIGNAL and_dcpl_485 : STD_LOGIC;
  SIGNAL and_dcpl_486 : STD_LOGIC;
  SIGNAL and_dcpl_487 : STD_LOGIC;
  SIGNAL and_dcpl_489 : STD_LOGIC;
  SIGNAL and_dcpl_490 : STD_LOGIC;
  SIGNAL and_dcpl_492 : STD_LOGIC;
  SIGNAL and_dcpl_494 : STD_LOGIC;
  SIGNAL and_dcpl_496 : STD_LOGIC;
  SIGNAL and_dcpl_498 : STD_LOGIC;
  SIGNAL and_dcpl_500 : STD_LOGIC;
  SIGNAL and_dcpl_502 : STD_LOGIC;
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_508 : STD_LOGIC;
  SIGNAL and_dcpl_518 : STD_LOGIC;
  SIGNAL and_dcpl_555 : STD_LOGIC;
  SIGNAL mux_tmp_1045 : STD_LOGIC;
  SIGNAL or_tmp_565 : STD_LOGIC;
  SIGNAL or_tmp_567 : STD_LOGIC;
  SIGNAL mux_tmp_1047 : STD_LOGIC;
  SIGNAL or_tmp_570 : STD_LOGIC;
  SIGNAL mux_tmp_1049 : STD_LOGIC;
  SIGNAL or_tmp_573 : STD_LOGIC;
  SIGNAL mux_tmp_1053 : STD_LOGIC;
  SIGNAL and_dcpl_564 : STD_LOGIC;
  SIGNAL z_out_13 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_567 : STD_LOGIC;
  SIGNAL and_dcpl_571 : STD_LOGIC;
  SIGNAL and_dcpl_572 : STD_LOGIC;
  SIGNAL and_dcpl_575 : STD_LOGIC;
  SIGNAL and_dcpl_580 : STD_LOGIC;
  SIGNAL and_dcpl_582 : STD_LOGIC;
  SIGNAL and_dcpl_583 : STD_LOGIC;
  SIGNAL and_dcpl_584 : STD_LOGIC;
  SIGNAL and_dcpl_585 : STD_LOGIC;
  SIGNAL and_dcpl_588 : STD_LOGIC;
  SIGNAL and_dcpl_589 : STD_LOGIC;
  SIGNAL and_dcpl_590 : STD_LOGIC;
  SIGNAL and_dcpl_592 : STD_LOGIC;
  SIGNAL and_dcpl_593 : STD_LOGIC;
  SIGNAL and_dcpl_595 : STD_LOGIC;
  SIGNAL and_dcpl_596 : STD_LOGIC;
  SIGNAL and_dcpl_597 : STD_LOGIC;
  SIGNAL and_dcpl_598 : STD_LOGIC;
  SIGNAL and_dcpl_600 : STD_LOGIC;
  SIGNAL and_dcpl_601 : STD_LOGIC;
  SIGNAL and_dcpl_602 : STD_LOGIC;
  SIGNAL and_dcpl_603 : STD_LOGIC;
  SIGNAL and_dcpl_605 : STD_LOGIC;
  SIGNAL and_dcpl_606 : STD_LOGIC;
  SIGNAL and_dcpl_608 : STD_LOGIC;
  SIGNAL and_dcpl_609 : STD_LOGIC;
  SIGNAL and_dcpl_610 : STD_LOGIC;
  SIGNAL and_dcpl_612 : STD_LOGIC;
  SIGNAL and_dcpl_613 : STD_LOGIC;
  SIGNAL and_dcpl_614 : STD_LOGIC;
  SIGNAL and_dcpl_615 : STD_LOGIC;
  SIGNAL and_dcpl_616 : STD_LOGIC;
  SIGNAL and_dcpl_618 : STD_LOGIC;
  SIGNAL and_dcpl_619 : STD_LOGIC;
  SIGNAL and_dcpl_620 : STD_LOGIC;
  SIGNAL and_dcpl_621 : STD_LOGIC;
  SIGNAL and_dcpl_623 : STD_LOGIC;
  SIGNAL and_dcpl_624 : STD_LOGIC;
  SIGNAL and_dcpl_625 : STD_LOGIC;
  SIGNAL and_dcpl_627 : STD_LOGIC;
  SIGNAL and_dcpl_628 : STD_LOGIC;
  SIGNAL and_dcpl_630 : STD_LOGIC;
  SIGNAL and_dcpl_631 : STD_LOGIC;
  SIGNAL and_dcpl_633 : STD_LOGIC;
  SIGNAL and_dcpl_634 : STD_LOGIC;
  SIGNAL and_dcpl_635 : STD_LOGIC;
  SIGNAL and_dcpl_636 : STD_LOGIC;
  SIGNAL and_dcpl_637 : STD_LOGIC;
  SIGNAL and_dcpl_638 : STD_LOGIC;
  SIGNAL and_dcpl_639 : STD_LOGIC;
  SIGNAL and_dcpl_640 : STD_LOGIC;
  SIGNAL and_dcpl_641 : STD_LOGIC;
  SIGNAL and_dcpl_646 : STD_LOGIC;
  SIGNAL and_dcpl_648 : STD_LOGIC;
  SIGNAL and_dcpl_649 : STD_LOGIC;
  SIGNAL and_dcpl_650 : STD_LOGIC;
  SIGNAL and_dcpl_651 : STD_LOGIC;
  SIGNAL and_dcpl_652 : STD_LOGIC;
  SIGNAL and_dcpl_653 : STD_LOGIC;
  SIGNAL and_dcpl_654 : STD_LOGIC;
  SIGNAL and_dcpl_655 : STD_LOGIC;
  SIGNAL and_dcpl_656 : STD_LOGIC;
  SIGNAL and_dcpl_657 : STD_LOGIC;
  SIGNAL z_out_14 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_660 : STD_LOGIC;
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_dcpl_698 : STD_LOGIC;
  SIGNAL and_dcpl_741 : STD_LOGIC;
  SIGNAL and_dcpl_746 : STD_LOGIC;
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_k_10_5_sva_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_1_cse_10_sva_mx0c1 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva_mx0c3 : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mul_cse_14_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_2_rgt : STD_LOGIC;
  SIGNAL VEC_LOOP_or_5_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_20_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_8_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_14_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_31_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_24_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_39_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_32_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_38_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_9_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_26_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_29_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_14_cse : STD_LOGIC;
  SIGNAL nor_98_cse : STD_LOGIC;
  SIGNAL and_275_cse : STD_LOGIC;
  SIGNAL nor_183_cse : STD_LOGIC;
  SIGNAL nand_47_cse : STD_LOGIC;
  SIGNAL and_293_cse : STD_LOGIC;
  SIGNAL and_739_cse : STD_LOGIC;
  SIGNAL and_744_cse : STD_LOGIC;
  SIGNAL and_749_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL mux_tmp_1074 : STD_LOGIC;
  SIGNAL mux_tmp_1093 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_VEC_LOOP_j_mux_rgt : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_tmp_1108 : STD_LOGIC;
  SIGNAL or_tmp_612 : STD_LOGIC;
  SIGNAL not_tmp_481 : STD_LOGIC;
  SIGNAL reg_VEC_LOOP_j_10_10_0_tmp : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL or_tmp_648 : STD_LOGIC;
  SIGNAL or_tmp_649 : STD_LOGIC;
  SIGNAL or_tmp_653 : STD_LOGIC;
  SIGNAL mux_tmp_1153 : STD_LOGIC;
  SIGNAL or_tmp_664 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_10_10_0_sva_1_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_11_psp_sva_8 : STD_LOGIC;
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_ncse_sva_7_4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL reg_VEC_LOOP_acc_11_psp_1_reg : STD_LOGIC;
  SIGNAL reg_VEC_LOOP_acc_11_psp_2_reg : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux_827_ssc : STD_LOGIC;
  SIGNAL or_787_cse : STD_LOGIC;
  SIGNAL or_584_cse_1 : STD_LOGIC;
  SIGNAL or_583_cse_1 : STD_LOGIC;
  SIGNAL mux_1024_cse : STD_LOGIC;
  SIGNAL or_834_cse : STD_LOGIC;
  SIGNAL or_869_cse : STD_LOGIC;
  SIGNAL or_870_cse : STD_LOGIC;
  SIGNAL or_788_cse : STD_LOGIC;
  SIGNAL or_728_cse : STD_LOGIC;
  SIGNAL mux_1081_cse : STD_LOGIC;
  SIGNAL mux_1125_cse : STD_LOGIC;
  SIGNAL mux_1145_cse : STD_LOGIC;
  SIGNAL mux_1141_cse : STD_LOGIC;
  SIGNAL mux_1143_cse : STD_LOGIC;
  SIGNAL mux_1095_cse : STD_LOGIC;
  SIGNAL mux_484_cse : STD_LOGIC;
  SIGNAL mux_975_cse : STD_LOGIC;
  SIGNAL mux_981_cse : STD_LOGIC;
  SIGNAL mux_985_cse : STD_LOGIC;
  SIGNAL mux_1025_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_52_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_5_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_46_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_nor_7_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_33_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_36_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_48_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_56_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_60_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_61_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_78_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;
  SIGNAL z_out_2_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_4_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_5_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out_11_10 : STD_LOGIC;
  SIGNAL z_out_12_22_10 : STD_LOGIC_VECTOR (12 DOWNTO 0);

  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL nand_2_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL or_324_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL or_375_nl : STD_LOGIC;
  SIGNAL mux_455_nl : STD_LOGIC;
  SIGNAL mux_453_nl : STD_LOGIC;
  SIGNAL mux_477_nl : STD_LOGIC;
  SIGNAL mux_476_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL mux_553_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL mux_550_nl : STD_LOGIC;
  SIGNAL mux_549_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL mux_575_nl : STD_LOGIC;
  SIGNAL mux_574_nl : STD_LOGIC;
  SIGNAL mux_573_nl : STD_LOGIC;
  SIGNAL mux_572_nl : STD_LOGIC;
  SIGNAL mux_571_nl : STD_LOGIC;
  SIGNAL mux_570_nl : STD_LOGIC;
  SIGNAL mux_569_nl : STD_LOGIC;
  SIGNAL or_452_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL or_450_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL mux_564_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL mux_560_nl : STD_LOGIC;
  SIGNAL mux_559_nl : STD_LOGIC;
  SIGNAL mux_557_nl : STD_LOGIC;
  SIGNAL mux_556_nl : STD_LOGIC;
  SIGNAL mux_576_nl : STD_LOGIC;
  SIGNAL nor_101_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_28_nl : STD_LOGIC;
  SIGNAL mux_577_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL and_296_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_55_nl : STD_LOGIC;
  SIGNAL mux_578_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_85_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL mux_595_nl : STD_LOGIC;
  SIGNAL mux_594_nl : STD_LOGIC;
  SIGNAL mux_593_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL mux_590_nl : STD_LOGIC;
  SIGNAL mux_589_nl : STD_LOGIC;
  SIGNAL mux_588_nl : STD_LOGIC;
  SIGNAL mux_587_nl : STD_LOGIC;
  SIGNAL mux_583_nl : STD_LOGIC;
  SIGNAL mux_582_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_108_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL mux_597_nl : STD_LOGIC;
  SIGNAL or_465_nl : STD_LOGIC;
  SIGNAL and_199_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_153_nl : STD_LOGIC;
  SIGNAL mux_610_nl : STD_LOGIC;
  SIGNAL or_476_nl : STD_LOGIC;
  SIGNAL mux_609_nl : STD_LOGIC;
  SIGNAL mux_608_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL or_475_nl : STD_LOGIC;
  SIGNAL mux_605_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL or_473_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL mux_628_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL mux_625_nl : STD_LOGIC;
  SIGNAL mux_624_nl : STD_LOGIC;
  SIGNAL mux_674_nl : STD_LOGIC;
  SIGNAL mux_671_nl : STD_LOGIC;
  SIGNAL and_217_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_not_nl : STD_LOGIC;
  SIGNAL mux_1061_nl : STD_LOGIC;
  SIGNAL nor_221_nl : STD_LOGIC;
  SIGNAL mux_1060_nl : STD_LOGIC;
  SIGNAL or_785_nl : STD_LOGIC;
  SIGNAL mux_684_nl : STD_LOGIC;
  SIGNAL mux_683_nl : STD_LOGIC;
  SIGNAL mux_682_nl : STD_LOGIC;
  SIGNAL mux_681_nl : STD_LOGIC;
  SIGNAL and_220_nl : STD_LOGIC;
  SIGNAL mux_693_nl : STD_LOGIC;
  SIGNAL mux_692_nl : STD_LOGIC;
  SIGNAL and_316_nl : STD_LOGIC;
  SIGNAL or_533_nl : STD_LOGIC;
  SIGNAL mux_700_nl : STD_LOGIC;
  SIGNAL mux_699_nl : STD_LOGIC;
  SIGNAL mux_698_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL mux_697_nl : STD_LOGIC;
  SIGNAL and_286_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_161_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_not_nl : STD_LOGIC;
  SIGNAL mux_1063_nl : STD_LOGIC;
  SIGNAL mux_1062_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL mux_1067_nl : STD_LOGIC;
  SIGNAL mux_1066_nl : STD_LOGIC;
  SIGNAL mux_1065_nl : STD_LOGIC;
  SIGNAL nor_218_nl : STD_LOGIC;
  SIGNAL nor_219_nl : STD_LOGIC;
  SIGNAL mux_1064_nl : STD_LOGIC;
  SIGNAL or_792_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_mul_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_238_nl : STD_LOGIC;
  SIGNAL mux_1087_nl : STD_LOGIC;
  SIGNAL mux_1086_nl : STD_LOGIC;
  SIGNAL or_805_nl : STD_LOGIC;
  SIGNAL mux_1085_nl : STD_LOGIC;
  SIGNAL mux_1084_nl : STD_LOGIC;
  SIGNAL mux_1083_nl : STD_LOGIC;
  SIGNAL mux_1082_nl : STD_LOGIC;
  SIGNAL mux_1080_nl : STD_LOGIC;
  SIGNAL or_803_nl : STD_LOGIC;
  SIGNAL mux_1079_nl : STD_LOGIC;
  SIGNAL mux_1078_nl : STD_LOGIC;
  SIGNAL mux_1077_nl : STD_LOGIC;
  SIGNAL mux_1076_nl : STD_LOGIC;
  SIGNAL mux_1104_nl : STD_LOGIC;
  SIGNAL mux_1103_nl : STD_LOGIC;
  SIGNAL or_813_nl : STD_LOGIC;
  SIGNAL mux_1102_nl : STD_LOGIC;
  SIGNAL mux_1101_nl : STD_LOGIC;
  SIGNAL mux_1100_nl : STD_LOGIC;
  SIGNAL nand_62_nl : STD_LOGIC;
  SIGNAL mux_1099_nl : STD_LOGIC;
  SIGNAL mux_1098_nl : STD_LOGIC;
  SIGNAL mux_804_nl : STD_LOGIC;
  SIGNAL mux_803_nl : STD_LOGIC;
  SIGNAL or_729_nl : STD_LOGIC;
  SIGNAL or_730_nl : STD_LOGIC;
  SIGNAL nor_79_nl : STD_LOGIC;
  SIGNAL and_281_nl : STD_LOGIC;
  SIGNAL mux_1123_nl : STD_LOGIC;
  SIGNAL mux_1122_nl : STD_LOGIC;
  SIGNAL mux_1121_nl : STD_LOGIC;
  SIGNAL mux_1120_nl : STD_LOGIC;
  SIGNAL mux_1119_nl : STD_LOGIC;
  SIGNAL mux_1118_nl : STD_LOGIC;
  SIGNAL mux_1117_nl : STD_LOGIC;
  SIGNAL mux_1116_nl : STD_LOGIC;
  SIGNAL mux_1115_nl : STD_LOGIC;
  SIGNAL or_827_nl : STD_LOGIC;
  SIGNAL mux_1112_nl : STD_LOGIC;
  SIGNAL mux_1111_nl : STD_LOGIC;
  SIGNAL nand_67_nl : STD_LOGIC;
  SIGNAL mux_1110_nl : STD_LOGIC;
  SIGNAL or_823_nl : STD_LOGIC;
  SIGNAL mux_1109_nl : STD_LOGIC;
  SIGNAL nand_68_nl : STD_LOGIC;
  SIGNAL or_878_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_63_nl : STD_LOGIC;
  SIGNAL mux_1136_nl : STD_LOGIC;
  SIGNAL mux_1135_nl : STD_LOGIC;
  SIGNAL mux_1134_nl : STD_LOGIC;
  SIGNAL nand_65_nl : STD_LOGIC;
  SIGNAL mux_1133_nl : STD_LOGIC;
  SIGNAL nor_213_nl : STD_LOGIC;
  SIGNAL nor_214_nl : STD_LOGIC;
  SIGNAL or_843_nl : STD_LOGIC;
  SIGNAL mux_1131_nl : STD_LOGIC;
  SIGNAL mux_1130_nl : STD_LOGIC;
  SIGNAL or_842_nl : STD_LOGIC;
  SIGNAL mux_1129_nl : STD_LOGIC;
  SIGNAL or_840_nl : STD_LOGIC;
  SIGNAL or_839_nl : STD_LOGIC;
  SIGNAL mux_1128_nl : STD_LOGIC;
  SIGNAL or_837_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_64_nl : STD_LOGIC;
  SIGNAL mux_828_nl : STD_LOGIC;
  SIGNAL mux_690_nl : STD_LOGIC;
  SIGNAL mux_780_nl : STD_LOGIC;
  SIGNAL mux_1148_nl : STD_LOGIC;
  SIGNAL mux_1147_nl : STD_LOGIC;
  SIGNAL mux_1146_nl : STD_LOGIC;
  SIGNAL or_857_nl : STD_LOGIC;
  SIGNAL or_856_nl : STD_LOGIC;
  SIGNAL mux_1142_nl : STD_LOGIC;
  SIGNAL mux_1138_nl : STD_LOGIC;
  SIGNAL nand_66_nl : STD_LOGIC;
  SIGNAL mux_873_nl : STD_LOGIC;
  SIGNAL mux_872_nl : STD_LOGIC;
  SIGNAL mux_871_nl : STD_LOGIC;
  SIGNAL mux_870_nl : STD_LOGIC;
  SIGNAL mux_869_nl : STD_LOGIC;
  SIGNAL mux_868_nl : STD_LOGIC;
  SIGNAL mux_867_nl : STD_LOGIC;
  SIGNAL mux_866_nl : STD_LOGIC;
  SIGNAL mux_865_nl : STD_LOGIC;
  SIGNAL mux_864_nl : STD_LOGIC;
  SIGNAL mux_863_nl : STD_LOGIC;
  SIGNAL mux_862_nl : STD_LOGIC;
  SIGNAL mux_861_nl : STD_LOGIC;
  SIGNAL mux_860_nl : STD_LOGIC;
  SIGNAL mux_859_nl : STD_LOGIC;
  SIGNAL mux_857_nl : STD_LOGIC;
  SIGNAL or_611_nl : STD_LOGIC;
  SIGNAL mux_855_nl : STD_LOGIC;
  SIGNAL mux_854_nl : STD_LOGIC;
  SIGNAL mux_850_nl : STD_LOGIC;
  SIGNAL mux_849_nl : STD_LOGIC;
  SIGNAL mux_846_nl : STD_LOGIC;
  SIGNAL mux_844_nl : STD_LOGIC;
  SIGNAL mux_843_nl : STD_LOGIC;
  SIGNAL or_609_nl : STD_LOGIC;
  SIGNAL mux_842_nl : STD_LOGIC;
  SIGNAL mux_841_nl : STD_LOGIC;
  SIGNAL mux_840_nl : STD_LOGIC;
  SIGNAL mux_839_nl : STD_LOGIC;
  SIGNAL mux_838_nl : STD_LOGIC;
  SIGNAL mux_837_nl : STD_LOGIC;
  SIGNAL mux_835_nl : STD_LOGIC;
  SIGNAL mux_833_nl : STD_LOGIC;
  SIGNAL mux_832_nl : STD_LOGIC;
  SIGNAL mux_829_nl : STD_LOGIC;
  SIGNAL and_243_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_15_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_248_nl : STD_LOGIC;
  SIGNAL mux_889_nl : STD_LOGIC;
  SIGNAL or_630_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nand_nl : STD_LOGIC;
  SIGNAL mux_1165_nl : STD_LOGIC;
  SIGNAL mux_1164_nl : STD_LOGIC;
  SIGNAL mux_1163_nl : STD_LOGIC;
  SIGNAL mux_1162_nl : STD_LOGIC;
  SIGNAL mux_1161_nl : STD_LOGIC;
  SIGNAL mux_1160_nl : STD_LOGIC;
  SIGNAL or_877_nl : STD_LOGIC;
  SIGNAL mux_1159_nl : STD_LOGIC;
  SIGNAL or_876_nl : STD_LOGIC;
  SIGNAL mux_1158_nl : STD_LOGIC;
  SIGNAL or_873_nl : STD_LOGIC;
  SIGNAL mux_1157_nl : STD_LOGIC;
  SIGNAL or_872_nl : STD_LOGIC;
  SIGNAL mux_1156_nl : STD_LOGIC;
  SIGNAL mux_1155_nl : STD_LOGIC;
  SIGNAL or_871_nl : STD_LOGIC;
  SIGNAL mux_1154_nl : STD_LOGIC;
  SIGNAL mux_1152_nl : STD_LOGIC;
  SIGNAL mux_1151_nl : STD_LOGIC;
  SIGNAL or_865_nl : STD_LOGIC;
  SIGNAL mux_1150_nl : STD_LOGIC;
  SIGNAL mux_1149_nl : STD_LOGIC;
  SIGNAL or_862_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_20_nl : STD_LOGIC;
  SIGNAL and_251_nl : STD_LOGIC;
  SIGNAL mux_962_nl : STD_LOGIC;
  SIGNAL mux_961_nl : STD_LOGIC;
  SIGNAL mux_960_nl : STD_LOGIC;
  SIGNAL mux_957_nl : STD_LOGIC;
  SIGNAL mux_956_nl : STD_LOGIC;
  SIGNAL mux_955_nl : STD_LOGIC;
  SIGNAL mux_954_nl : STD_LOGIC;
  SIGNAL mux_971_nl : STD_LOGIC;
  SIGNAL mux_970_nl : STD_LOGIC;
  SIGNAL mux_969_nl : STD_LOGIC;
  SIGNAL mux_968_nl : STD_LOGIC;
  SIGNAL mux_967_nl : STD_LOGIC;
  SIGNAL and_272_nl : STD_LOGIC;
  SIGNAL mux_972_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL nor_84_nl : STD_LOGIC;
  SIGNAL mux_1020_nl : STD_LOGIC;
  SIGNAL mux_1019_nl : STD_LOGIC;
  SIGNAL or_735_nl : STD_LOGIC;
  SIGNAL mux_1018_nl : STD_LOGIC;
  SIGNAL or_722_nl : STD_LOGIC;
  SIGNAL or_721_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL mux_1017_nl : STD_LOGIC;
  SIGNAL mux_1016_nl : STD_LOGIC;
  SIGNAL mux_1015_nl : STD_LOGIC;
  SIGNAL mux_1014_nl : STD_LOGIC;
  SIGNAL nand_23_nl : STD_LOGIC;
  SIGNAL mux_1013_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL mux_1012_nl : STD_LOGIC;
  SIGNAL mux_1010_nl : STD_LOGIC;
  SIGNAL mux_1009_nl : STD_LOGIC;
  SIGNAL mux_1008_nl : STD_LOGIC;
  SIGNAL or_717_nl : STD_LOGIC;
  SIGNAL or_716_nl : STD_LOGIC;
  SIGNAL mux_1007_nl : STD_LOGIC;
  SIGNAL or_714_nl : STD_LOGIC;
  SIGNAL nand_20_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL mux_1005_nl : STD_LOGIC;
  SIGNAL mux_1004_nl : STD_LOGIC;
  SIGNAL and_259_nl : STD_LOGIC;
  SIGNAL and_269_nl : STD_LOGIC;
  SIGNAL mux_1029_nl : STD_LOGIC;
  SIGNAL or_759_nl : STD_LOGIC;
  SIGNAL mux_1028_nl : STD_LOGIC;
  SIGNAL mux_1027_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL or_320_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL or_323_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL mux_395_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL or_346_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL mux_410_nl : STD_LOGIC;
  SIGNAL mux_409_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL mux_407_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL or_5_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL or_355_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL mux_514_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL or_420_nl : STD_LOGIC;
  SIGNAL or_419_nl : STD_LOGIC;
  SIGNAL nand_46_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL mux_545_nl : STD_LOGIC;
  SIGNAL mux_558_nl : STD_LOGIC;
  SIGNAL or_446_nl : STD_LOGIC;
  SIGNAL or_445_nl : STD_LOGIC;
  SIGNAL nand_35_nl : STD_LOGIC;
  SIGNAL or_472_nl : STD_LOGIC;
  SIGNAL or_471_nl : STD_LOGIC;
  SIGNAL mux_611_nl : STD_LOGIC;
  SIGNAL mux_613_nl : STD_LOGIC;
  SIGNAL or_481_nl : STD_LOGIC;
  SIGNAL or_482_nl : STD_LOGIC;
  SIGNAL mux_620_nl : STD_LOGIC;
  SIGNAL mux_639_nl : STD_LOGIC;
  SIGNAL or_496_nl : STD_LOGIC;
  SIGNAL or_494_nl : STD_LOGIC;
  SIGNAL mux_644_nl : STD_LOGIC;
  SIGNAL mux_643_nl : STD_LOGIC;
  SIGNAL mux_642_nl : STD_LOGIC;
  SIGNAL or_498_nl : STD_LOGIC;
  SIGNAL mux_641_nl : STD_LOGIC;
  SIGNAL or_497_nl : STD_LOGIC;
  SIGNAL mux_638_nl : STD_LOGIC;
  SIGNAL mux_637_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL or_493_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL or_488_nl : STD_LOGIC;
  SIGNAL mux_633_nl : STD_LOGIC;
  SIGNAL mux_632_nl : STD_LOGIC;
  SIGNAL or_487_nl : STD_LOGIC;
  SIGNAL or_483_nl : STD_LOGIC;
  SIGNAL nand_48_nl : STD_LOGIC;
  SIGNAL mux_645_nl : STD_LOGIC;
  SIGNAL or_500_nl : STD_LOGIC;
  SIGNAL mux_648_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL mux_654_nl : STD_LOGIC;
  SIGNAL mux_653_nl : STD_LOGIC;
  SIGNAL mux_652_nl : STD_LOGIC;
  SIGNAL mux_651_nl : STD_LOGIC;
  SIGNAL or_511_nl : STD_LOGIC;
  SIGNAL mux_650_nl : STD_LOGIC;
  SIGNAL mux_649_nl : STD_LOGIC;
  SIGNAL or_508_nl : STD_LOGIC;
  SIGNAL mux_647_nl : STD_LOGIC;
  SIGNAL mux_672_nl : STD_LOGIC;
  SIGNAL mux_676_nl : STD_LOGIC;
  SIGNAL mux_675_nl : STD_LOGIC;
  SIGNAL or_762_nl : STD_LOGIC;
  SIGNAL mux_679_nl : STD_LOGIC;
  SIGNAL mux_694_nl : STD_LOGIC;
  SIGNAL and_288_nl : STD_LOGIC;
  SIGNAL and_289_nl : STD_LOGIC;
  SIGNAL mux_703_nl : STD_LOGIC;
  SIGNAL mux_701_nl : STD_LOGIC;
  SIGNAL mux_715_nl : STD_LOGIC;
  SIGNAL mux_714_nl : STD_LOGIC;
  SIGNAL mux_713_nl : STD_LOGIC;
  SIGNAL mux_712_nl : STD_LOGIC;
  SIGNAL mux_711_nl : STD_LOGIC;
  SIGNAL mux_718_nl : STD_LOGIC;
  SIGNAL mux_719_nl : STD_LOGIC;
  SIGNAL mux_847_nl : STD_LOGIC;
  SIGNAL mux_851_nl : STD_LOGIC;
  SIGNAL nor_90_nl : STD_LOGIC;
  SIGNAL mux_887_nl : STD_LOGIC;
  SIGNAL and_276_nl : STD_LOGIC;
  SIGNAL mux_886_nl : STD_LOGIC;
  SIGNAL or_627_nl : STD_LOGIC;
  SIGNAL mux_885_nl : STD_LOGIC;
  SIGNAL mux_880_nl : STD_LOGIC;
  SIGNAL and_277_nl : STD_LOGIC;
  SIGNAL mux_879_nl : STD_LOGIC;
  SIGNAL nor_91_nl : STD_LOGIC;
  SIGNAL nor_92_nl : STD_LOGIC;
  SIGNAL and_278_nl : STD_LOGIC;
  SIGNAL mux_878_nl : STD_LOGIC;
  SIGNAL mux_877_nl : STD_LOGIC;
  SIGNAL mux_875_nl : STD_LOGIC;
  SIGNAL mux_929_nl : STD_LOGIC;
  SIGNAL mux_928_nl : STD_LOGIC;
  SIGNAL mux_927_nl : STD_LOGIC;
  SIGNAL mux_926_nl : STD_LOGIC;
  SIGNAL mux_925_nl : STD_LOGIC;
  SIGNAL or_665_nl : STD_LOGIC;
  SIGNAL mux_924_nl : STD_LOGIC;
  SIGNAL mux_923_nl : STD_LOGIC;
  SIGNAL or_661_nl : STD_LOGIC;
  SIGNAL mux_922_nl : STD_LOGIC;
  SIGNAL nand_18_nl : STD_LOGIC;
  SIGNAL mux_921_nl : STD_LOGIC;
  SIGNAL or_660_nl : STD_LOGIC;
  SIGNAL mux_920_nl : STD_LOGIC;
  SIGNAL mux_919_nl : STD_LOGIC;
  SIGNAL or_658_nl : STD_LOGIC;
  SIGNAL nand_38_nl : STD_LOGIC;
  SIGNAL or_655_nl : STD_LOGIC;
  SIGNAL mux_918_nl : STD_LOGIC;
  SIGNAL or_654_nl : STD_LOGIC;
  SIGNAL or_653_nl : STD_LOGIC;
  SIGNAL mux_963_nl : STD_LOGIC;
  SIGNAL or_686_nl : STD_LOGIC;
  SIGNAL mux_988_nl : STD_LOGIC;
  SIGNAL mux_987_nl : STD_LOGIC;
  SIGNAL mux_986_nl : STD_LOGIC;
  SIGNAL mux_983_nl : STD_LOGIC;
  SIGNAL mux_982_nl : STD_LOGIC;
  SIGNAL or_713_nl : STD_LOGIC;
  SIGNAL nand_44_nl : STD_LOGIC;
  SIGNAL nand_21_nl : STD_LOGIC;
  SIGNAL mux_733_nl : STD_LOGIC;
  SIGNAL mux_732_nl : STD_LOGIC;
  SIGNAL mux_731_nl : STD_LOGIC;
  SIGNAL mux_730_nl : STD_LOGIC;
  SIGNAL mux_729_nl : STD_LOGIC;
  SIGNAL mux_728_nl : STD_LOGIC;
  SIGNAL mux_727_nl : STD_LOGIC;
  SIGNAL mux_726_nl : STD_LOGIC;
  SIGNAL mux_725_nl : STD_LOGIC;
  SIGNAL or_559_nl : STD_LOGIC;
  SIGNAL mux_724_nl : STD_LOGIC;
  SIGNAL or_557_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_10_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_8_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_6_nl : STD_LOGIC;
  SIGNAL and_140_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_4_nl : STD_LOGIC;
  SIGNAL and_137_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL nor_103_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_2_nl : STD_LOGIC;
  SIGNAL and_133_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_39_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_3_nl : STD_LOGIC;
  SIGNAL and_134_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL or_368_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_5_nl : STD_LOGIC;
  SIGNAL and_138_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL or_385_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_7_nl : STD_LOGIC;
  SIGNAL and_141_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL or_398_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_9_nl : STD_LOGIC;
  SIGNAL and_142_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL or_767_nl : STD_LOGIC;
  SIGNAL mux_1033_nl : STD_LOGIC;
  SIGNAL mux_1031_nl : STD_LOGIC;
  SIGNAL mux_1035_nl : STD_LOGIC;
  SIGNAL or_768_nl : STD_LOGIC;
  SIGNAL mux_1045_nl : STD_LOGIC;
  SIGNAL or_775_nl : STD_LOGIC;
  SIGNAL mux_1047_nl : STD_LOGIC;
  SIGNAL or_638_nl : STD_LOGIC;
  SIGNAL or_637_nl : STD_LOGIC;
  SIGNAL or_780_nl : STD_LOGIC;
  SIGNAL mux_1051_nl : STD_LOGIC;
  SIGNAL mux_1058_nl : STD_LOGIC;
  SIGNAL mux_1057_nl : STD_LOGIC;
  SIGNAL mux_1056_nl : STD_LOGIC;
  SIGNAL mux_1055_nl : STD_LOGIC;
  SIGNAL or_784_nl : STD_LOGIC;
  SIGNAL mux_1054_nl : STD_LOGIC;
  SIGNAL mux_1053_nl : STD_LOGIC;
  SIGNAL mux_1050_nl : STD_LOGIC;
  SIGNAL mux_1049_nl : STD_LOGIC;
  SIGNAL mux_1070_nl : STD_LOGIC;
  SIGNAL or_868_nl : STD_LOGIC;
  SIGNAL or_867_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_10_nl : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_f_mux_7_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_8_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_347_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_860_nl : STD_LOGIC;
  SIGNAL and_861_nl : STD_LOGIC;
  SIGNAL and_862_nl : STD_LOGIC;
  SIGNAL and_863_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_12_nl : STD_LOGIC_VECTOR (8
      DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_13_nl : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_348_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_864_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_14_nl : STD_LOGIC_VECTOR (6
      DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_15_nl : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_349_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_66_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_67_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_16_nl : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_68_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_69_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_10_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_or_80_nl : STD_LOGIC;
  SIGNAL mux_1166_nl : STD_LOGIC;
  SIGNAL mux_1167_nl : STD_LOGIC;
  SIGNAL mux_1168_nl : STD_LOGIC;
  SIGNAL mux_1169_nl : STD_LOGIC;
  SIGNAL mux_1170_nl : STD_LOGIC;
  SIGNAL mux_1171_nl : STD_LOGIC;
  SIGNAL mux_1172_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_11_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_4_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_866_nl : STD_LOGIC;
  SIGNAL and_867_nl : STD_LOGIC;
  SIGNAL and_868_nl : STD_LOGIC;
  SIGNAL and_869_nl : STD_LOGIC;
  SIGNAL and_870_nl : STD_LOGIC;
  SIGNAL and_871_nl : STD_LOGIC;
  SIGNAL and_872_nl : STD_LOGIC;
  SIGNAL and_873_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_7_nl : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL VEC_LOOP_or_81_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_8_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_82_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_9_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_and_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_16_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_10_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_83_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_42_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_43_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_or_84_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_85_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_86_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_30_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_31_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_12_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_32_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_44_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_33_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_45_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_34_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_46_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_87_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_47_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_88_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_48_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_89_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_49_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_90_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_13_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_14_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_18_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_15_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_or_91_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_50_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_874_nl : STD_LOGIC;
  SIGNAL and_875_nl : STD_LOGIC;
  SIGNAL and_876_nl : STD_LOGIC;
  SIGNAL and_877_nl : STD_LOGIC;
  SIGNAL and_878_nl : STD_LOGIC;
  SIGNAL and_879_nl : STD_LOGIC;
  SIGNAL and_880_nl : STD_LOGIC;
  SIGNAL and_881_nl : STD_LOGIC;
  SIGNAL and_882_nl : STD_LOGIC;
  SIGNAL and_883_nl : STD_LOGIC;
  SIGNAL and_884_nl : STD_LOGIC;
  SIGNAL and_885_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_51_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_62_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_886_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_16_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_11_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_or_92_nl : STD_LOGIC;
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
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (5 DOWNTO 0);

  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL COMP_LOOP_9_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (10 DOWNTO 0);

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
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_oswt_1 : IN STD_LOGIC;
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt :
      STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_oswt_1 : IN STD_LOGIC;
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct : IN STD_LOGIC_VECTOR
          (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d :
      STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
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
      COMP_LOOP_C_3_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_4_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_5_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_6_tr0 : IN STD_LOGIC;
      COMP_LOOP_5_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_6_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_7_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_9_tr0 : IN STD_LOGIC;
      COMP_LOOP_8_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_10_tr0 : IN STD_LOGIC;
      COMP_LOOP_9_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_10_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
      COMP_LOOP_11_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_13_tr0 : IN STD_LOGIC;
      COMP_LOOP_12_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_14_tr0 : IN STD_LOGIC;
      COMP_LOOP_13_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_15_tr0 : IN STD_LOGIC;
      COMP_LOOP_14_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
      COMP_LOOP_15_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_17_tr0 : IN STD_LOGIC;
      COMP_LOOP_16_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_18_tr0 : IN STD_LOGIC;
      COMP_LOOP_17_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_19_tr0 : IN STD_LOGIC;
      COMP_LOOP_18_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_20_tr0 : IN STD_LOGIC;
      COMP_LOOP_19_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_21_tr0 : IN STD_LOGIC;
      COMP_LOOP_20_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_22_tr0 : IN STD_LOGIC;
      COMP_LOOP_21_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_23_tr0 : IN STD_LOGIC;
      COMP_LOOP_22_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_23_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_25_tr0 : IN STD_LOGIC;
      COMP_LOOP_24_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_26_tr0 : IN STD_LOGIC;
      COMP_LOOP_25_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_27_tr0 : IN STD_LOGIC;
      COMP_LOOP_26_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
      COMP_LOOP_27_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_29_tr0 : IN STD_LOGIC;
      COMP_LOOP_28_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_30_tr0 : IN STD_LOGIC;
      COMP_LOOP_29_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_31_tr0 : IN STD_LOGIC;
      COMP_LOOP_30_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_32_tr0 : IN STD_LOGIC;
      COMP_LOOP_31_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_33_tr0 : IN STD_LOGIC;
      COMP_LOOP_32_VEC_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_34_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (8 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_s_1_10_2(input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(9 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_11_2(input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(10 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_32_2(input_31 : STD_LOGIC;
  input_30 : STD_LOGIC;
  input_29 : STD_LOGIC;
  input_28 : STD_LOGIC;
  input_27 : STD_LOGIC;
  input_26 : STD_LOGIC;
  input_25 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(31 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
      tmp := sel(21);
      result := result or ( input_21 and tmp);
      tmp := sel(22);
      result := result or ( input_22 and tmp);
      tmp := sel(23);
      result := result or ( input_23 and tmp);
      tmp := sel(24);
      result := result or ( input_24 and tmp);
      tmp := sel(25);
      result := result or ( input_25 and tmp);
      tmp := sel(26);
      result := result or ( input_26 and tmp);
      tmp := sel(27);
      result := result or ( input_27 and tmp);
      tmp := sel(28);
      result := result or ( input_28 and tmp);
      tmp := sel(29);
      result := result or ( input_29 and tmp);
      tmp := sel(30);
      result := result or ( input_30 and tmp);
      tmp := sel(31);
      result := result or ( input_31 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_33_2(input_32 : STD_LOGIC;
  input_31 : STD_LOGIC;
  input_30 : STD_LOGIC;
  input_29 : STD_LOGIC;
  input_28 : STD_LOGIC;
  input_27 : STD_LOGIC;
  input_26 : STD_LOGIC;
  input_25 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(32 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
      tmp := sel(21);
      result := result or ( input_21 and tmp);
      tmp := sel(22);
      result := result or ( input_22 and tmp);
      tmp := sel(23);
      result := result or ( input_23 and tmp);
      tmp := sel(24);
      result := result or ( input_24 and tmp);
      tmp := sel(25);
      result := result or ( input_25 and tmp);
      tmp := sel(26);
      result := result or ( input_26 and tmp);
      tmp := sel(27);
      result := result or ( input_27 and tmp);
      tmp := sel(28);
      result := result or ( input_28 and tmp);
      tmp := sel(29);
      result := result or ( input_29 and tmp);
      tmp := sel(30);
      result := result or ( input_30 and tmp);
      tmp := sel(31);
      result := result or ( input_31 and tmp);
      tmp := sel(32);
      result := result or ( input_32 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_34_2(input_33 : STD_LOGIC;
  input_32 : STD_LOGIC;
  input_31 : STD_LOGIC;
  input_30 : STD_LOGIC;
  input_29 : STD_LOGIC;
  input_28 : STD_LOGIC;
  input_27 : STD_LOGIC;
  input_26 : STD_LOGIC;
  input_25 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(33 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
      tmp := sel(21);
      result := result or ( input_21 and tmp);
      tmp := sel(22);
      result := result or ( input_22 and tmp);
      tmp := sel(23);
      result := result or ( input_23 and tmp);
      tmp := sel(24);
      result := result or ( input_24 and tmp);
      tmp := sel(25);
      result := result or ( input_25 and tmp);
      tmp := sel(26);
      result := result or ( input_26 and tmp);
      tmp := sel(27);
      result := result or ( input_27 and tmp);
      tmp := sel(28);
      result := result or ( input_28 and tmp);
      tmp := sel(29);
      result := result or ( input_29 and tmp);
      tmp := sel(30);
      result := result or ( input_30 and tmp);
      tmp := sel(31);
      result := result or ( input_31 and tmp);
      tmp := sel(32);
      result := result or ( input_32 and tmp);
      tmp := sel(33);
      result := result or ( input_33 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_35_2(input_34 : STD_LOGIC;
  input_33 : STD_LOGIC;
  input_32 : STD_LOGIC;
  input_31 : STD_LOGIC;
  input_30 : STD_LOGIC;
  input_29 : STD_LOGIC;
  input_28 : STD_LOGIC;
  input_27 : STD_LOGIC;
  input_26 : STD_LOGIC;
  input_25 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(34 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
      tmp := sel(21);
      result := result or ( input_21 and tmp);
      tmp := sel(22);
      result := result or ( input_22 and tmp);
      tmp := sel(23);
      result := result or ( input_23 and tmp);
      tmp := sel(24);
      result := result or ( input_24 and tmp);
      tmp := sel(25);
      result := result or ( input_25 and tmp);
      tmp := sel(26);
      result := result or ( input_26 and tmp);
      tmp := sel(27);
      result := result or ( input_27 and tmp);
      tmp := sel(28);
      result := result or ( input_28 and tmp);
      tmp := sel(29);
      result := result or ( input_29 and tmp);
      tmp := sel(30);
      result := result or ( input_30 and tmp);
      tmp := sel(31);
      result := result or ( input_31 and tmp);
      tmp := sel(32);
      result := result or ( input_32 and tmp);
      tmp := sel(33);
      result := result or ( input_33 and tmp);
      tmp := sel(34);
      result := result or ( input_34 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_36_2(input_35 : STD_LOGIC;
  input_34 : STD_LOGIC;
  input_33 : STD_LOGIC;
  input_32 : STD_LOGIC;
  input_31 : STD_LOGIC;
  input_30 : STD_LOGIC;
  input_29 : STD_LOGIC;
  input_28 : STD_LOGIC;
  input_27 : STD_LOGIC;
  input_26 : STD_LOGIC;
  input_25 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(35 DOWNTO 0))
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
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
      tmp := sel(21);
      result := result or ( input_21 and tmp);
      tmp := sel(22);
      result := result or ( input_22 and tmp);
      tmp := sel(23);
      result := result or ( input_23 and tmp);
      tmp := sel(24);
      result := result or ( input_24 and tmp);
      tmp := sel(25);
      result := result or ( input_25 and tmp);
      tmp := sel(26);
      result := result or ( input_26 and tmp);
      tmp := sel(27);
      result := result or ( input_27 and tmp);
      tmp := sel(28);
      result := result or ( input_28 and tmp);
      tmp := sel(29);
      result := result or ( input_29 and tmp);
      tmp := sel(30);
      result := result or ( input_30 and tmp);
      tmp := sel(31);
      result := result or ( input_31 and tmp);
      tmp := sel(32);
      result := result or ( input_32 and tmp);
      tmp := sel(33);
      result := result or ( input_33 and tmp);
      tmp := sel(34);
      result := result or ( input_34 and tmp);
      tmp := sel(35);
      result := result or ( input_35 and tmp);
    RETURN result;
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

  FUNCTION MUX1HOT_v_10_29_2(input_28 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(28 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_3_3_2(input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_3_4_2(input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_4_4_2(input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_5_12_2(input_11 : STD_LOGIC_VECTOR(4 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(11 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_27_2(input_26 : STD_LOGIC_VECTOR(4 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(26 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_37_2(input_36 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_35 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_34 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_33 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_32 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_31 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_30 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(4 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(36 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 30));
      result := result or ( input_30 and tmp);
      tmp := (OTHERS=>sel( 31));
      result := result or ( input_31 and tmp);
      tmp := (OTHERS=>sel( 32));
      result := result or ( input_32 and tmp);
      tmp := (OTHERS=>sel( 33));
      result := result or ( input_33 and tmp);
      tmp := (OTHERS=>sel( 34));
      result := result or ( input_34 and tmp);
      tmp := (OTHERS=>sel( 35));
      result := result or ( input_35 and tmp);
      tmp := (OTHERS=>sel( 36));
      result := result or ( input_36 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_8_2(input_7 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_6_7_2(input_6 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_10_2(input_9 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(9 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
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

  FUNCTION MUX_v_11_2_2(input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(10 DOWNTO 0);

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

  FUNCTION MUX_v_6_2_2(input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);

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

  FUNCTION MUX_v_8_2_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

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
      ccs_ccore_start_rsc_dat => and_207_rmff,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat <= z_out_13;
  COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_sub_cmp_return_rsc_z <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1;

  COMP_LOOP_1_modulo_add_cmp : modulo_add
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_add_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => and_207_rmff,
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
  COMP_LOOP_1_mult_cmp_y_rsc_dat <= MUX1HOT_v_32_3_2(COMP_LOOP_twiddle_f_1_sva, COMP_LOOP_twiddle_f_11_sva,
      COMP_LOOP_twiddle_f_9_sva, STD_LOGIC_VECTOR'( and_dcpl_203 & and_dcpl_204 &
      and_dcpl_205));
  COMP_LOOP_1_mult_cmp_y_rsc_dat_1 <= MUX1HOT_v_32_3_2(COMP_LOOP_twiddle_help_1_sva,
      COMP_LOOP_twiddle_help_11_sva, COMP_LOOP_twiddle_help_9_sva, STD_LOGIC_VECTOR'(
      and_dcpl_203 & and_dcpl_204 & and_dcpl_205));
  COMP_LOOP_1_mult_cmp_p_rsc_dat <= p_sva;
  COMP_LOOP_1_mult_cmp_return_rsc_z <= COMP_LOOP_1_mult_cmp_return_rsc_z_1;
  COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat <= (NOT (MUX_s_1_2_2((MUX_s_1_2_2(mux_381_cse,
      (MUX_s_1_2_2(mux_666_cse, mux_380_cse, fsm_output(5))), fsm_output(3))), mux_382_cse,
      fsm_output(1)))) AND (fsm_output(0));

  COMP_LOOP_17_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 6
      )
    PORT MAP(
      a => COMP_LOOP_17_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_17_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_17_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_17_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_17_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva_1;
  COMP_LOOP_17_twiddle_f_lshift_itm_1 <= COMP_LOOP_17_twiddle_f_lshift_rg_z;

  COMP_LOOP_1_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 5
      )
    PORT MAP(
      a => COMP_LOOP_1_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_1_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_1_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_1_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva_1;
  COMP_LOOP_1_twiddle_f_lshift_itm <= COMP_LOOP_1_twiddle_f_lshift_rg_z;

  COMP_LOOP_9_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 11
      )
    PORT MAP(
      a => COMP_LOOP_9_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_9_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_9_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_9_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_9_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, COMP_LOOP_1_twiddle_f_acc_cse_sva_1,
      CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("000000010")));
  z_out_8 <= COMP_LOOP_9_twiddle_f_lshift_rg_z;

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
  COMP_LOOP_2_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0,
      COMP_LOOP_1_twiddle_f_acc_cse_sva_1, nor_98_cse AND nor_183_cse AND and_dcpl_53
      AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10")));
  z_out_9 <= COMP_LOOP_2_twiddle_f_lshift_rg_z;

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
      vec_rsci_oswt_1_pff => and_25_rmff
    );
  vec_rsci_da_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_wea_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core <= STD_LOGIC_VECTOR'(
      "00000000000000000000000000000000") & (MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_11_sva, COMP_LOOP_twiddle_f_9_sva, COMP_LOOP_twiddle_f_1_sva,
      STD_LOGIC_VECTOR'( ((NOT mux_515_itm) AND (fsm_output(0))) & ((NOT (MUX_s_1_2_2(((fsm_output(8))
      OR (NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND mux_tmp_517))),
      mux_tmp_516, fsm_output(1)))) AND nor_132_cse AND (NOT (fsm_output(0)))) &
      (NOT((MUX_s_1_2_2((MUX_s_1_2_2(mux_456_cse, (MUX_s_1_2_2((MUX_s_1_2_2(mux_529_cse,
      mux_452_cse, fsm_output(4))), mux_tmp_526, fsm_output(2))), fsm_output(3))),
      (MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_526, (MUX_s_1_2_2(mux_tmp_454, or_384_cse,
      fsm_output(4))), fsm_output(2))), mux_456_cse, fsm_output(3))), fsm_output(1)))
      OR (fsm_output(0)))) & (and_dcpl_65 AND and_dcpl_145))));
  vec_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct <= STD_LOGIC_VECTOR'(
      '0' & (NOT mux_554_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_25_rmff & and_25_rmff);
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (NOT mux_554_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff <= NOT mux_368_itm;

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
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro <= NOT mux_515_itm;
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 <= NOT mux_630_itm;

  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      twiddle_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_rsci_oswt_1 => reg_twiddle_rsci_oswt_1_cse,
      twiddle_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff => core_wten_iff,
      twiddle_rsci_oswt_1_pff => and_157_rmff,
      twiddle_rsci_oswt_pff => and_152_rmff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_157_rmff & and_152_rmff);

  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      twiddle_h_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_h_rsci_oswt_1 => reg_twiddle_rsci_oswt_1_cse,
      twiddle_h_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff => core_wten_iff,
      twiddle_h_rsci_oswt_1_pff => and_157_rmff,
      twiddle_h_rsci_oswt_pff => and_152_rmff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_157_rmff & and_152_rmff);

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
      COMP_LOOP_C_3_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0,
      COMP_LOOP_2_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_4_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0,
      COMP_LOOP_3_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_5_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0,
      COMP_LOOP_4_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_6_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0,
      COMP_LOOP_5_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_7_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0,
      COMP_LOOP_6_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0,
      COMP_LOOP_7_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_9_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0,
      COMP_LOOP_8_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_10_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0,
      COMP_LOOP_9_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_11_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0,
      COMP_LOOP_10_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_12_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0,
      COMP_LOOP_11_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_13_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0,
      COMP_LOOP_12_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_14_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0,
      COMP_LOOP_13_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_15_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0,
      COMP_LOOP_14_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_16_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0,
      COMP_LOOP_15_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_17_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0,
      COMP_LOOP_16_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_18_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0,
      COMP_LOOP_17_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_19_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0,
      COMP_LOOP_18_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_20_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0,
      COMP_LOOP_19_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_21_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0,
      COMP_LOOP_20_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_22_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0,
      COMP_LOOP_21_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_23_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0,
      COMP_LOOP_22_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_24_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0,
      COMP_LOOP_23_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_25_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0,
      COMP_LOOP_24_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_26_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0,
      COMP_LOOP_25_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_27_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0,
      COMP_LOOP_26_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_28_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0,
      COMP_LOOP_27_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_29_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0,
      COMP_LOOP_28_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_30_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0,
      COMP_LOOP_29_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_31_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0,
      COMP_LOOP_30_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_32_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0,
      COMP_LOOP_31_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_33_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0,
      COMP_LOOP_32_VEC_LOOP_C_8_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_34_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 <= NOT (z_out_14(8));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 <= NOT (z_out_14(7));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 <= NOT (z_out_14(8));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 <= NOT (z_out_14(6));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 <= NOT (z_out_14(8));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 <= NOT z_out_11_10;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 <= NOT (z_out_14(7));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 <= NOT (z_out_14(8));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 <= NOT (z_out_10(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 <= NOT (z_out_14(5));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0 <= reg_VEC_LOOP_j_10_10_0_tmp(5);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 <= NOT (z_out_12_22_10(0));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= STAGE_LOOP_acc_itm_4_1;

  nand_2_nl <= NOT((fsm_output(5)) AND (NOT mux_tmp_338));
  mux_363_nl <= MUX_s_1_2_2(mux_tmp_346, or_tmp_145, fsm_output(5));
  mux_364_nl <= MUX_s_1_2_2(nand_2_nl, mux_363_nl, fsm_output(6));
  mux_361_nl <= MUX_s_1_2_2(or_tmp_145, mux_tmp_346, fsm_output(5));
  or_324_nl <= (fsm_output(5)) OR mux_tmp_345;
  mux_362_nl <= MUX_s_1_2_2(mux_361_nl, or_324_nl, fsm_output(6));
  mux_365_nl <= MUX_s_1_2_2(mux_364_nl, mux_362_nl, fsm_output(1));
  mux_360_nl <= MUX_s_1_2_2(mux_tmp_355, mux_tmp_343, fsm_output(1));
  mux_366_nl <= MUX_s_1_2_2(mux_365_nl, mux_360_nl, fsm_output(4));
  mux_359_nl <= MUX_s_1_2_2(mux_tmp_344, mux_tmp_356, fsm_output(4));
  mux_367_nl <= MUX_s_1_2_2(mux_366_nl, mux_359_nl, fsm_output(3));
  mux_353_nl <= MUX_s_1_2_2(mux_tmp_340, mux_tmp_350, fsm_output(1));
  mux_357_nl <= MUX_s_1_2_2(mux_tmp_356, mux_353_nl, fsm_output(4));
  mux_351_nl <= MUX_s_1_2_2(mux_tmp_350, mux_tmp_348, fsm_output(1));
  mux_352_nl <= MUX_s_1_2_2(mux_351_nl, mux_tmp_344, fsm_output(4));
  mux_358_nl <= MUX_s_1_2_2(mux_357_nl, mux_352_nl, fsm_output(3));
  mux_368_itm <= MUX_s_1_2_2(mux_367_nl, mux_358_nl, fsm_output(2));
  mux_380_cse <= MUX_s_1_2_2(mux_1081_cse, mux_473_cse, fsm_output(2));
  mux_381_cse <= MUX_s_1_2_2(mux_380_cse, mux_tmp_374, fsm_output(5));
  mux_377_nl <= MUX_s_1_2_2(mux_472_cse, mux_1081_cse, fsm_output(2));
  mux_378_cse <= MUX_s_1_2_2(mux_663_cse, mux_377_nl, fsm_output(5));
  mux_382_cse <= MUX_s_1_2_2(mux_664_cse, mux_381_cse, fsm_output(3));
  mux_379_cse <= MUX_s_1_2_2(mux_378_cse, mux_664_cse, fsm_output(3));
  mux_383_nl <= MUX_s_1_2_2(mux_382_cse, mux_379_cse, fsm_output(1));
  and_25_rmff <= (NOT mux_383_nl) AND (fsm_output(0));
  mux_428_cse <= MUX_s_1_2_2(or_tmp_158, or_tmp_157, fsm_output(3));
  mux_429_cse <= MUX_s_1_2_2(mux_tmp_425, mux_428_cse, fsm_output(5));
  nand_47_cse <= NOT((fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(8)))
      AND (fsm_output(6)));
  mux_426_cse <= MUX_s_1_2_2(nand_47_cse, mux_tmp_425, fsm_output(5));
  or_375_nl <= (NOT (fsm_output(3))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_437_cse <= MUX_s_1_2_2(or_tmp_175, or_375_nl, fsm_output(6));
  nand_6_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_405));
  nand_5_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_401));
  or_377_cse <= (fsm_output(6)) OR mux_tmp_405;
  mux_434_cse <= MUX_s_1_2_2(mux_tmp_404, or_tmp_172, fsm_output(4));
  mux_439_cse <= MUX_s_1_2_2(or_377_cse, mux_437_cse, fsm_output(4));
  mux_435_cse <= MUX_s_1_2_2(or_tmp_172, nand_5_cse, fsm_output(4));
  mux_440_cse <= MUX_s_1_2_2(nand_6_cse, mux_tmp_404, fsm_output(4));
  or_390_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("101"));
  or_384_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0101"));
  mux_452_cse <= MUX_s_1_2_2(or_tmp_157, or_tmp_158, fsm_output(5));
  mux_457_cse <= MUX_s_1_2_2(or_tmp_161, or_tmp_157, fsm_output(5));
  mux_455_nl <= MUX_s_1_2_2(mux_tmp_451, mux_tmp_454, fsm_output(4));
  mux_453_nl <= MUX_s_1_2_2(mux_452_cse, mux_tmp_451, fsm_output(4));
  mux_456_cse <= MUX_s_1_2_2(mux_455_nl, mux_453_nl, fsm_output(2));
  or_395_cse <= (NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(8))
      OR (fsm_output(7));
  mux_475_cse <= MUX_s_1_2_2(or_390_cse, or_tmp_160, fsm_output(4));
  mux_472_cse <= MUX_s_1_2_2(or_tmp_161, or_tmp_160, fsm_output(4));
  mux_473_cse <= MUX_s_1_2_2(or_tmp_156, or_tmp_158, fsm_output(4));
  mux_469_cse <= MUX_s_1_2_2(or_tmp_160, or_tmp_157, fsm_output(4));
  mux_474_cse <= MUX_s_1_2_2(mux_473_cse, mux_472_cse, fsm_output(5));
  mux_470_cse <= MUX_s_1_2_2(mux_1081_cse, mux_469_cse, fsm_output(5));
  mux_476_nl <= MUX_s_1_2_2(mux_475_cse, mux_369_cse, fsm_output(5));
  mux_477_nl <= MUX_s_1_2_2(mux_476_nl, mux_474_cse, fsm_output(3));
  mux_471_nl <= MUX_s_1_2_2(mux_470_cse, mux_tmp_467, fsm_output(3));
  mux_478_cse <= MUX_s_1_2_2(mux_477_nl, mux_471_nl, fsm_output(2));
  mux_465_nl <= MUX_s_1_2_2(or_395_cse, mux_369_cse, fsm_output(5));
  mux_468_cse <= MUX_s_1_2_2(mux_tmp_467, mux_465_nl, fsm_output(3));
  mux_484_cse <= MUX_s_1_2_2(mux_469_cse, mux_473_cse, fsm_output(5));
  mux_485_cse <= MUX_s_1_2_2(mux_484_cse, mux_470_cse, fsm_output(3));
  mux_529_cse <= MUX_s_1_2_2(or_tmp_160, or_tmp_156, fsm_output(5));
  mux_550_nl <= MUX_s_1_2_2(mux_437_cse, mux_tmp_404, fsm_output(4));
  mux_551_nl <= MUX_s_1_2_2(mux_tmp_536, mux_550_nl, fsm_output(5));
  mux_552_nl <= MUX_s_1_2_2(mux_551_nl, mux_tmp_543, fsm_output(2));
  mux_553_nl <= MUX_s_1_2_2(mux_552_nl, mux_tmp_548, fsm_output(1));
  mux_539_nl <= MUX_s_1_2_2(mux_434_cse, mux_tmp_536, fsm_output(5));
  mux_544_nl <= MUX_s_1_2_2(mux_tmp_543, mux_539_nl, fsm_output(2));
  mux_549_nl <= MUX_s_1_2_2(mux_tmp_548, mux_544_nl, fsm_output(1));
  mux_554_itm <= MUX_s_1_2_2(mux_553_nl, mux_549_nl, fsm_output(0));
  mux_572_nl <= MUX_s_1_2_2(mux_tmp_562, or_tmp_273, fsm_output(4));
  mux_573_nl <= MUX_s_1_2_2(mux_tmp_561, mux_572_nl, fsm_output(3));
  or_452_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_207;
  mux_569_nl <= MUX_s_1_2_2(or_452_nl, or_tmp_274, fsm_output(7));
  mux_570_nl <= MUX_s_1_2_2(mux_569_nl, mux_tmp_555, fsm_output(4));
  or_450_nl <= COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm OR (fsm_output(5)) OR
      (fsm_output(6)) OR (fsm_output(8));
  mux_567_nl <= MUX_s_1_2_2(or_450_nl, or_tmp_272, fsm_output(7));
  mux_568_nl <= MUX_s_1_2_2(mux_567_nl, mux_tmp_562, fsm_output(4));
  mux_571_nl <= MUX_s_1_2_2(mux_570_nl, mux_568_nl, fsm_output(3));
  mux_574_nl <= MUX_s_1_2_2(mux_573_nl, mux_571_nl, fsm_output(2));
  mux_563_nl <= MUX_s_1_2_2(or_449_cse, or_tmp_272, fsm_output(7));
  mux_564_nl <= MUX_s_1_2_2(mux_563_nl, mux_tmp_562, fsm_output(4));
  mux_565_nl <= MUX_s_1_2_2(mux_564_nl, mux_tmp_561, fsm_output(3));
  mux_557_nl <= MUX_s_1_2_2(or_tmp_274, or_tmp_272, fsm_output(7));
  mux_559_nl <= MUX_s_1_2_2(or_tmp_277, mux_557_nl, fsm_output(4));
  mux_556_nl <= MUX_s_1_2_2(or_tmp_273, mux_tmp_555, fsm_output(4));
  mux_560_nl <= MUX_s_1_2_2(mux_559_nl, mux_556_nl, fsm_output(3));
  mux_566_nl <= MUX_s_1_2_2(mux_565_nl, mux_560_nl, fsm_output(2));
  mux_575_nl <= MUX_s_1_2_2(mux_574_nl, mux_566_nl, fsm_output(1));
  and_152_rmff <= (NOT mux_575_nl) AND (fsm_output(0));
  nor_101_nl <= NOT(COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm OR CONV_SL_1_1(fsm_output(3
      DOWNTO 2)/=STD_LOGIC_VECTOR'("11")));
  mux_576_nl <= MUX_s_1_2_2(nor_101_nl, and_dcpl_53, fsm_output(1));
  and_157_rmff <= mux_576_nl AND (NOT (fsm_output(7))) AND and_dcpl_148 AND (NOT
      (fsm_output(5))) AND and_dcpl_124;
  COMP_LOOP_twiddle_f_or_20_cse <= and_dcpl_154 OR (and_dcpl_59 AND and_dcpl_47 AND
      and_dcpl_37) OR (and_dcpl_82 AND and_dcpl_47 AND and_dcpl_37) OR (and_dcpl_28
      AND and_dcpl_119);
  COMP_LOOP_twiddle_f_or_8_cse <= (and_dcpl_48 AND and_dcpl_40) OR (and_dcpl_56 AND
      and_dcpl_24) OR (and_dcpl_100 AND and_dcpl_24);
  COMP_LOOP_twiddle_f_or_14_cse <= (and_dcpl_51 AND and_dcpl_32) OR (and_dcpl_65
      AND and_dcpl_32) OR (and_dcpl_77 AND and_dcpl_32) OR (and_dcpl_42 AND and_dcpl_113);
  COMP_LOOP_twiddle_f_or_31_cse <= and_dcpl_159 OR (and_dcpl_95 AND and_dcpl_40)
      OR (and_dcpl_108 AND and_dcpl_24) OR (and_dcpl_114 AND and_dcpl_111);
  COMP_LOOP_twiddle_f_or_24_cse <= (and_dcpl_71 AND and_dcpl_24) OR (and_dcpl_85
      AND and_dcpl_40) OR (and_dcpl_89 AND and_dcpl_24) OR (and_dcpl_48 AND and_dcpl_117);
  COMP_LOOP_twiddle_f_or_39_cse <= (and_dcpl_80 AND and_dcpl_24) OR (and_dcpl_104
      AND and_dcpl_40);
  COMP_LOOP_twiddle_f_or_32_cse <= (and_dcpl_87 AND and_dcpl_32) OR (and_dcpl_97
      AND and_dcpl_32) OR (and_dcpl_106 AND and_dcpl_32);
  COMP_LOOP_twiddle_f_or_38_cse <= (and_dcpl_122 AND and_dcpl_37) OR (and_dcpl_99
      AND and_dcpl_33 AND and_dcpl_37);
  COMP_LOOP_twiddle_f_mux1h_28_nl <= MUX1HOT_s_1_10_2((reg_VEC_LOOP_acc_11_psp_2_reg(2)),
      (z_out_2_7_0(1)), (z_out(3)), (z_out_4_8_0(2)), (z_out_6(0)), (z_out_3(3)),
      (z_out_7(3)), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1(3)), (z_out_6(3)), (z_out_5_8_0(2)),
      STD_LOGIC_VECTOR'( and_dcpl_153 & COMP_LOOP_twiddle_f_or_20_cse & COMP_LOOP_twiddle_f_or_8_cse
      & COMP_LOOP_twiddle_f_or_14_cse & COMP_LOOP_twiddle_f_or_38_cse & COMP_LOOP_twiddle_f_or_31_cse
      & COMP_LOOP_twiddle_f_or_24_cse & and_dcpl_164 & COMP_LOOP_twiddle_f_or_39_cse
      & COMP_LOOP_twiddle_f_or_32_cse));
  nor_100_nl <= NOT((fsm_output(3)) OR (fsm_output(7)));
  and_296_nl <= (fsm_output(3)) AND (fsm_output(7));
  mux_577_nl <= MUX_s_1_2_2(nor_100_nl, and_296_nl, fsm_output(2));
  COMP_LOOP_twiddle_f_mux1h_28_rmff <= COMP_LOOP_twiddle_f_mux1h_28_nl AND (NOT(mux_577_nl
      AND and_dcpl_148 AND and_dcpl_167 AND and_291_cse));
  COMP_LOOP_twiddle_f_mux1h_55_nl <= MUX1HOT_s_1_9_2((reg_VEC_LOOP_acc_11_psp_2_reg(1)),
      (z_out_2_7_0(0)), (z_out(2)), (z_out_4_8_0(1)), (z_out_3(2)), (z_out_7(2)),
      (COMP_LOOP_twiddle_f_mul_cse_14_sva_1(2)), (z_out_6(2)), (z_out_5_8_0(1)),
      STD_LOGIC_VECTOR'( and_dcpl_153 & COMP_LOOP_twiddle_f_or_20_cse & COMP_LOOP_twiddle_f_or_8_cse
      & COMP_LOOP_twiddle_f_or_14_cse & COMP_LOOP_twiddle_f_or_31_cse & COMP_LOOP_twiddle_f_or_24_cse
      & and_dcpl_164 & COMP_LOOP_twiddle_f_or_39_cse & COMP_LOOP_twiddle_f_or_32_cse));
  nand_9_nl <= NOT((fsm_output(3)) AND (NOT mux_tmp_419));
  mux_578_nl <= MUX_s_1_2_2(or_dcpl_168, nand_9_nl, fsm_output(2));
  COMP_LOOP_twiddle_f_mux1h_55_rmff <= COMP_LOOP_twiddle_f_mux1h_55_nl AND (NOT((NOT
      mux_578_nl) AND (NOT (fsm_output(8))) AND (fsm_output(1)) AND (fsm_output(0))));
  COMP_LOOP_twiddle_f_mux1h_85_nl <= MUX1HOT_s_1_11_2((reg_VEC_LOOP_acc_11_psp_2_reg(3)),
      (z_out_2_7_0(2)), (z_out(4)), (z_out_4_8_0(3)), (z_out_6(1)), (z_out_3(4)),
      (z_out_7(4)), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1(4)), (z_out_6(4)), (z_out_5_8_0(0)),
      (z_out_5_8_0(3)), STD_LOGIC_VECTOR'( and_dcpl_153 & COMP_LOOP_twiddle_f_or_20_cse
      & COMP_LOOP_twiddle_f_or_8_cse & COMP_LOOP_twiddle_f_or_14_cse & COMP_LOOP_twiddle_f_or_38_cse
      & COMP_LOOP_twiddle_f_or_31_cse & COMP_LOOP_twiddle_f_or_24_cse & and_dcpl_164
      & COMP_LOOP_twiddle_f_or_39_cse & and_dcpl_192 & COMP_LOOP_twiddle_f_or_32_cse));
  mux_593_nl <= MUX_s_1_2_2(mux_tmp_451, mux_452_cse, fsm_output(2));
  mux_594_nl <= MUX_s_1_2_2(mux_593_nl, mux_tmp_581, fsm_output(4));
  mux_590_nl <= MUX_s_1_2_2(or_tmp_291, mux_529_cse, fsm_output(2));
  mux_591_nl <= MUX_s_1_2_2(mux_tmp_586, mux_590_nl, fsm_output(4));
  mux_595_nl <= MUX_s_1_2_2(mux_594_nl, mux_591_nl, fsm_output(3));
  mux_587_nl <= MUX_s_1_2_2(or_384_cse, mux_tmp_454, fsm_output(2));
  mux_588_nl <= MUX_s_1_2_2(mux_587_nl, mux_tmp_586, fsm_output(4));
  mux_582_nl <= MUX_s_1_2_2(mux_tmp_451, or_tmp_291, fsm_output(2));
  mux_583_nl <= MUX_s_1_2_2(mux_582_nl, mux_tmp_581, fsm_output(4));
  mux_589_nl <= MUX_s_1_2_2(mux_588_nl, mux_583_nl, fsm_output(3));
  mux_596_nl <= MUX_s_1_2_2(mux_595_nl, mux_589_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_and_rmff <= COMP_LOOP_twiddle_f_mux1h_85_nl AND (NOT(mux_596_nl
      OR (NOT (fsm_output(0)))));
  COMP_LOOP_twiddle_f_mux1h_108_nl <= MUX1HOT_s_1_8_2((reg_VEC_LOOP_acc_11_psp_2_reg(0)),
      (z_out(1)), (z_out_4_8_0(0)), (z_out_3(1)), (z_out_7(1)), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1(1)),
      (z_out_6(1)), (z_out_5_8_0(0)), STD_LOGIC_VECTOR'( and_dcpl_153 & COMP_LOOP_twiddle_f_or_8_cse
      & COMP_LOOP_twiddle_f_or_14_cse & COMP_LOOP_twiddle_f_or_31_cse & COMP_LOOP_twiddle_f_or_24_cse
      & and_dcpl_164 & COMP_LOOP_twiddle_f_or_39_cse & COMP_LOOP_twiddle_f_or_32_cse));
  mux_597_nl <= MUX_s_1_2_2(mux_806_cse, mux_tmp_419, fsm_output(3));
  mux_598_nl <= MUX_s_1_2_2(or_dcpl_168, mux_597_nl, fsm_output(2));
  or_465_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("000001"));
  mux_599_nl <= MUX_s_1_2_2(mux_598_nl, or_465_nl, fsm_output(8));
  COMP_LOOP_twiddle_f_mux1h_108_rmff <= COMP_LOOP_twiddle_f_mux1h_108_nl AND (NOT((NOT
      mux_599_nl) AND and_291_cse));
  and_199_nl <= and_dcpl_28 AND and_dcpl_32;
  COMP_LOOP_twiddle_f_mux1h_138_rmff <= MUX1HOT_v_5_12_2(VEC_LOOP_j_10_10_0_sva_1_4_0,
      (VEC_LOOP_acc_11_psp_sva_8 & reg_VEC_LOOP_acc_11_psp_1_reg & (reg_VEC_LOOP_acc_11_psp_2_reg(6
      DOWNTO 4))), (z_out_2_7_0(7 DOWNTO 3)), (z_out(9 DOWNTO 5)), (z_out_4_8_0(8
      DOWNTO 4)), (z_out_6(6 DOWNTO 2)), (z_out_3(9 DOWNTO 5)), (z_out_7(9 DOWNTO
      5)), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1(9 DOWNTO 5)), (z_out_6(9 DOWNTO
      5)), (z_out_5_8_0(5 DOWNTO 1)), (z_out_5_8_0(8 DOWNTO 4)), STD_LOGIC_VECTOR'(
      and_199_nl & and_dcpl_153 & COMP_LOOP_twiddle_f_or_20_cse & COMP_LOOP_twiddle_f_or_8_cse
      & COMP_LOOP_twiddle_f_or_14_cse & COMP_LOOP_twiddle_f_or_38_cse & COMP_LOOP_twiddle_f_or_31_cse
      & COMP_LOOP_twiddle_f_or_24_cse & and_dcpl_164 & COMP_LOOP_twiddle_f_or_39_cse
      & and_dcpl_192 & COMP_LOOP_twiddle_f_or_32_cse));
  COMP_LOOP_twiddle_f_mux1h_153_nl <= MUX1HOT_s_1_5_2((z_out(0)), (z_out_3(0)), (z_out_7(0)),
      (COMP_LOOP_twiddle_f_mul_cse_14_sva_1(0)), (z_out_6(0)), STD_LOGIC_VECTOR'(
      COMP_LOOP_twiddle_f_or_8_cse & COMP_LOOP_twiddle_f_or_31_cse & COMP_LOOP_twiddle_f_or_24_cse
      & and_dcpl_164 & COMP_LOOP_twiddle_f_or_39_cse));
  or_476_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000011"));
  mux_606_nl <= MUX_s_1_2_2(or_tmp_295, mux_tmp_603, fsm_output(3));
  or_475_nl <= (fsm_output(3)) OR (NOT (fsm_output(6))) OR (fsm_output(8)) OR (NOT
      (fsm_output(5)));
  mux_607_nl <= MUX_s_1_2_2(mux_606_nl, or_475_nl, fsm_output(7));
  mux_608_nl <= MUX_s_1_2_2(mux_tmp_602, mux_607_nl, fsm_output(4));
  or_473_nl <= (fsm_output(3)) OR mux_tmp_603;
  mux_604_nl <= MUX_s_1_2_2(or_473_nl, or_470_cse, fsm_output(7));
  mux_605_nl <= MUX_s_1_2_2(mux_604_nl, mux_tmp_602, fsm_output(4));
  mux_609_nl <= MUX_s_1_2_2(mux_608_nl, mux_605_nl, fsm_output(2));
  mux_610_nl <= MUX_s_1_2_2(or_476_nl, mux_609_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_mux1h_153_rmff <= COMP_LOOP_twiddle_f_mux1h_153_nl AND (NOT((NOT
      mux_610_nl) AND (fsm_output(0))));
  VEC_LOOP_mux_rmff <= MUX_v_10_2_2(VEC_LOOP_acc_1_cse_10_sva, z_out, and_dcpl_153);
  and_207_rmff <= NOT(mux_515_itm OR (fsm_output(0)));
  mux_627_nl <= MUX_s_1_2_2(mux_tmp_623, mux_tmp_615, fsm_output(2));
  mux_628_nl <= MUX_s_1_2_2(mux_627_nl, mux_tmp_621, fsm_output(5));
  mux_629_nl <= MUX_s_1_2_2(mux_tmp_622, mux_628_nl, fsm_output(3));
  mux_624_nl <= MUX_s_1_2_2(mux_tmp_619, mux_tmp_623, fsm_output(2));
  mux_625_nl <= MUX_s_1_2_2(mux_tmp_616, mux_624_nl, fsm_output(5));
  mux_626_nl <= MUX_s_1_2_2(mux_625_nl, mux_tmp_622, fsm_output(3));
  mux_630_itm <= MUX_s_1_2_2(mux_629_nl, mux_626_nl, fsm_output(1));
  mux_666_cse <= MUX_s_1_2_2(mux_369_cse, mux_469_cse, fsm_output(2));
  mux_663_cse <= MUX_s_1_2_2(mux_473_cse, mux_369_cse, fsm_output(2));
  mux_664_cse <= MUX_s_1_2_2(mux_tmp_374, mux_663_cse, fsm_output(5));
  and_300_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_291_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_285_cse <= (fsm_output(3)) AND (fsm_output(5));
  or_739_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  and_283_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt <= MUX_v_8_2_2((STD_LOGIC_VECTOR'(
      "0000") & COMP_LOOP_1_twiddle_f_acc_cse_sva_1), (z_out_9(7 DOWNTO 0)), and_dcpl_227);
  or_787_cse <= (fsm_output(5)) OR (fsm_output(7));
  or_788_cse <= (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(6));
  or_583_cse_1 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_584_cse_1 <= (fsm_output(8)) OR (fsm_output(6));
  COMP_LOOP_1_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_1_twiddle_f_lshift_itm)
      * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0)), 5));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_1_twiddle_f_mul_nl),
      5)), VEC_LOOP_acc_psp_sva_mx0w0, and_dcpl_29);
  and_238_nl <= (NOT mux_716_itm) AND (fsm_output(0));
  VEC_LOOP_j_VEC_LOOP_j_mux_rgt <= MUX_v_11_2_2((STD_LOGIC_VECTOR'( "000000") & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl),
      z_out_10, and_238_nl);
  mux_1081_cse <= MUX_s_1_2_2(or_tmp_158, or_tmp_161, fsm_output(4));
  mux_1095_cse <= MUX_s_1_2_2(mux_tmp_454, mux_452_cse, fsm_output(3));
  nor_132_cse <= NOT((fsm_output(5)) OR (fsm_output(7)));
  and_322_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  or_725_cse <= (NOT (fsm_output(8))) OR (fsm_output(5)) OR (fsm_output(7));
  or_591_cse <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (fsm_output(7));
  nor_95_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  mux_1021_cse <= MUX_s_1_2_2(or_725_cse, or_tmp_375, fsm_output(6));
  mux_1023_cse <= MUX_s_1_2_2(mux_1125_cse, mux_1021_cse, fsm_output(4));
  mux_806_cse <= MUX_s_1_2_2(or_591_cse, mux_tmp, fsm_output(5));
  COMP_LOOP_twiddle_f_or_2_rgt <= and_dcpl_43 OR and_dcpl_61 OR and_dcpl_74 OR and_dcpl_84
      OR and_dcpl_93 OR and_dcpl_103 OR and_dcpl_112 OR and_dcpl_121;
  or_728_cse <= (NOT (fsm_output(5))) OR (fsm_output(7));
  or_729_nl <= (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_1024_cse <= MUX_s_1_2_2(or_729_nl, or_728_cse, fsm_output(8));
  or_730_nl <= (fsm_output(6)) OR mux_1024_cse;
  mux_1025_cse <= MUX_s_1_2_2(or_730_nl, mux_1125_cse, fsm_output(4));
  nor_79_nl <= NOT((fsm_output(3)) OR and_291_cse OR mux_1025_cse);
  and_281_nl <= (fsm_output(3)) AND (NOT(nor_95_cse OR mux_1023_cse));
  mux_827_ssc <= MUX_s_1_2_2(nor_79_nl, and_281_nl, fsm_output(2));
  or_834_cse <= (fsm_output(8)) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_1125_cse <= MUX_s_1_2_2(or_tmp_375, or_834_cse, fsm_output(6));
  mux_1145_cse <= MUX_s_1_2_2(mux_469_cse, mux_1081_cse, fsm_output(3));
  mux_1141_cse <= MUX_s_1_2_2(mux_473_cse, mux_469_cse, fsm_output(3));
  mux_1143_cse <= MUX_s_1_2_2(or_395_cse, mux_473_cse, fsm_output(3));
  mux_869_nl <= MUX_s_1_2_2(mux_tmp_848, mux_tmp_858, fsm_output(2));
  mux_868_nl <= MUX_s_1_2_2(mux_tmp_830, mux_tmp_831, or_613_cse);
  mux_870_nl <= MUX_s_1_2_2(mux_869_nl, mux_868_nl, fsm_output(3));
  mux_871_nl <= MUX_s_1_2_2(mux_870_nl, mux_tmp_831, fsm_output(5));
  mux_867_nl <= MUX_s_1_2_2(mux_tmp_853, mux_tmp_831, fsm_output(5));
  mux_872_nl <= MUX_s_1_2_2(mux_871_nl, mux_867_nl, fsm_output(1));
  mux_861_nl <= MUX_s_1_2_2(mux_tmp_82, nor_tmp_3, COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm);
  mux_862_nl <= MUX_s_1_2_2(mux_861_nl, or_tmp_39, fsm_output(6));
  mux_863_nl <= MUX_s_1_2_2(mux_862_nl, mux_tmp_831, or_613_cse);
  mux_864_nl <= MUX_s_1_2_2(mux_tmp_852, mux_863_nl, fsm_output(3));
  mux_857_nl <= MUX_s_1_2_2(mux_tmp_831, mux_tmp_856, fsm_output(4));
  mux_859_nl <= MUX_s_1_2_2(mux_tmp_858, mux_857_nl, fsm_output(2));
  or_611_nl <= (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(3));
  mux_860_nl <= MUX_s_1_2_2(mux_859_nl, mux_tmp_831, or_611_nl);
  mux_865_nl <= MUX_s_1_2_2(mux_864_nl, mux_860_nl, fsm_output(5));
  mux_846_nl <= MUX_s_1_2_2(mux_tmp_82, (fsm_output(8)), or_610_cse);
  mux_849_nl <= MUX_s_1_2_2(mux_tmp_848, mux_846_nl, fsm_output(2));
  or_609_nl <= (fsm_output(6)) OR nor_tmp_3;
  mux_843_nl <= MUX_s_1_2_2(or_609_nl, (fsm_output(8)), fsm_output(4));
  mux_841_nl <= MUX_s_1_2_2((fsm_output(7)), or_tmp_39, fsm_output(6));
  mux_842_nl <= MUX_s_1_2_2(mux_841_nl, mux_tmp_836, fsm_output(4));
  mux_844_nl <= MUX_s_1_2_2(mux_843_nl, mux_842_nl, fsm_output(2));
  mux_850_nl <= MUX_s_1_2_2(mux_849_nl, mux_844_nl, fsm_output(3));
  mux_854_nl <= MUX_s_1_2_2(mux_tmp_853, mux_850_nl, reg_VEC_LOOP_j_10_10_0_tmp(5));
  mux_837_nl <= MUX_s_1_2_2(mux_tmp_834, mux_tmp_836, fsm_output(4));
  mux_835_nl <= MUX_s_1_2_2(mux_tmp_830, mux_tmp_834, fsm_output(4));
  mux_838_nl <= MUX_s_1_2_2(mux_837_nl, mux_835_nl, fsm_output(2));
  mux_832_nl <= MUX_s_1_2_2(mux_tmp_831, mux_tmp_830, fsm_output(4));
  mux_829_nl <= MUX_s_1_2_2(nor_tmp_3, (fsm_output(8)), or_610_cse);
  mux_833_nl <= MUX_s_1_2_2(mux_832_nl, mux_829_nl, fsm_output(2));
  mux_839_nl <= MUX_s_1_2_2(mux_838_nl, mux_833_nl, fsm_output(3));
  mux_840_nl <= MUX_s_1_2_2(mux_tmp_831, mux_839_nl, reg_VEC_LOOP_j_10_10_0_tmp(5));
  mux_855_nl <= MUX_s_1_2_2(mux_854_nl, mux_840_nl, fsm_output(5));
  mux_866_nl <= MUX_s_1_2_2(mux_865_nl, mux_855_nl, fsm_output(1));
  mux_873_nl <= MUX_s_1_2_2(mux_872_nl, mux_866_nl, fsm_output(0));
  COMP_LOOP_twiddle_help_and_itm <= complete_rsci_wen_comp AND mux_873_nl;
  or_869_cse <= (fsm_output(8)) OR (NOT (fsm_output(3)));
  or_870_cse <= (fsm_output(8)) OR (fsm_output(3));
  or_736_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_685_cse <= (fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(8))) OR (fsm_output(6));
  VEC_LOOP_acc_psp_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_twiddle_f_11_sva(9
      DOWNTO 5)) + UNSIGNED(COMP_LOOP_k_10_5_sva_4_0), 5));
  or_470_cse <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(5));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_1_twiddle_f_acc_cse_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(NOT
      STAGE_LOOP_i_3_0_sva) + UNSIGNED'( "1011"), 4));
  VEC_LOOP_acc_10_cse_2_sva_mx0w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_3_sva_mx0w2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_4_sva_mx0w3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_5_sva_mx0w4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_6_sva_mx0w5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_7_sva_mx0w6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_8_sva_mx0w7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_10_sva_mx0w9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_11_sva_mx0w10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_12_sva_mx0w11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_13_sva_mx0w12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_14_sva_mx0w13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_15_sva_mx0w14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_16_sva_mx0w15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_18_sva_mx0w17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_19_sva_mx0w18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_20_sva_mx0w19 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_21_sva_mx0w20 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_22_sva_mx0w21 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_23_sva_mx0w22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_24_sva_mx0w23 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_26_sva_mx0w25 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_27_sva_mx0w26 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_28_sva_mx0w27 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_29_sva_mx0w28 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_30_sva_mx0w29 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_31_sva_mx0w30 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  VEC_LOOP_acc_10_cse_sva_mx0w31 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 10));
  COMP_LOOP_twiddle_f_mul_cse_14_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva) * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0
      & STD_LOGIC_VECTOR'( "01101"))), 10));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT STAGE_LOOP_i_3_0_sva_2))
      + SIGNED'( "01011"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  or_tmp_1 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000"));
  or_tmp_2 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  or_3_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp <= MUX_s_1_2_2(or_3_cse, or_tmp_2, fsm_output(4));
  or_tmp_38 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_39 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  nor_tmp_3 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  mux_tmp_82 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(8));
  nor_tmp_11 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  not_tmp_69 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  or_750_cse <= ((CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000")))
      AND (fsm_output(6))) OR (fsm_output(7));
  nor_tmp_29 <= or_750_cse AND (fsm_output(8));
  or_748_cse <= ((CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")))
      AND (fsm_output(6))) OR (fsm_output(7));
  or_dcpl_168 <= or_583_cse_1 OR CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  or_tmp_145 <= (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_tmp_336 <= MUX_s_1_2_2(or_tmp_39, or_tmp_38, fsm_output(0));
  mux_tmp_338 <= MUX_s_1_2_2(or_tmp_38, or_tmp_39, fsm_output(0));
  or_tmp_148 <= (NOT (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(7));
  mux_tmp_339 <= MUX_s_1_2_2(or_tmp_148, mux_tmp_338, fsm_output(5));
  mux_337_nl <= MUX_s_1_2_2(mux_tmp_336, or_tmp_145, fsm_output(5));
  mux_tmp_340 <= MUX_s_1_2_2(mux_tmp_339, mux_337_nl, fsm_output(6));
  or_tmp_149 <= (NOT (fsm_output(0))) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_342_nl <= MUX_s_1_2_2(or_tmp_149, or_tmp_148, fsm_output(5));
  mux_341_nl <= MUX_s_1_2_2(mux_tmp_338, mux_tmp_336, fsm_output(5));
  mux_tmp_343 <= MUX_s_1_2_2(mux_342_nl, mux_341_nl, fsm_output(6));
  mux_tmp_344 <= MUX_s_1_2_2(mux_tmp_343, mux_tmp_340, fsm_output(1));
  or_321_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_345 <= MUX_s_1_2_2(or_321_cse, or_tmp_39, fsm_output(0));
  mux_tmp_346 <= MUX_s_1_2_2(or_tmp_39, (fsm_output(7)), fsm_output(0));
  mux_347_nl <= MUX_s_1_2_2(mux_tmp_346, mux_tmp_345, fsm_output(5));
  or_320_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(0))) OR (fsm_output(8))
      OR (fsm_output(7));
  mux_tmp_348 <= MUX_s_1_2_2(mux_347_nl, or_320_nl, fsm_output(6));
  mux_349_nl <= MUX_s_1_2_2(mux_tmp_338, mux_tmp_346, fsm_output(5));
  or_323_nl <= (fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT
      (fsm_output(7)));
  mux_tmp_350 <= MUX_s_1_2_2(mux_349_nl, or_323_nl, fsm_output(6));
  mux_354_nl <= MUX_s_1_2_2(mux_tmp_345, or_tmp_149, fsm_output(5));
  mux_tmp_355 <= MUX_s_1_2_2(mux_354_nl, mux_tmp_339, fsm_output(6));
  mux_tmp_356 <= MUX_s_1_2_2(mux_tmp_348, mux_tmp_355, fsm_output(1));
  or_tmp_156 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  or_tmp_157 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010"));
  or_tmp_158 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  mux_369_cse <= MUX_s_1_2_2(or_tmp_157, or_tmp_156, fsm_output(4));
  or_tmp_160 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  or_tmp_161 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_374 <= MUX_s_1_2_2(mux_469_cse, mux_472_cse, fsm_output(2));
  and_dcpl_22 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_23 <= (fsm_output(2)) AND (NOT (fsm_output(8)));
  and_dcpl_24 <= and_dcpl_23 AND and_dcpl_22;
  and_dcpl_25 <= NOT((fsm_output(5)) OR (fsm_output(3)));
  and_dcpl_27 <= not_tmp_69 AND (NOT (fsm_output(4)));
  and_dcpl_28 <= and_dcpl_27 AND and_dcpl_25;
  and_dcpl_29 <= and_dcpl_28 AND and_dcpl_24;
  and_dcpl_31 <= NOT((fsm_output(2)) OR (fsm_output(8)));
  and_dcpl_32 <= and_dcpl_31 AND and_291_cse;
  and_dcpl_33 <= (NOT (fsm_output(5))) AND (fsm_output(3));
  and_dcpl_34 <= and_dcpl_27 AND and_dcpl_33;
  mux_394_nl <= MUX_s_1_2_2(mux_475_cse, mux_1081_cse, fsm_output(2));
  mux_395_nl <= MUX_s_1_2_2(mux_394_nl, mux_666_cse, fsm_output(5));
  mux_396_nl <= MUX_s_1_2_2(mux_395_nl, mux_378_cse, fsm_output(3));
  mux_400_nl <= MUX_s_1_2_2(mux_379_cse, mux_396_nl, fsm_output(1));
  and_dcpl_36 <= NOT(mux_400_nl OR (fsm_output(0)));
  and_dcpl_37 <= and_dcpl_23 AND and_291_cse;
  and_dcpl_38 <= and_dcpl_34 AND and_dcpl_37;
  mux_tmp_401 <= MUX_s_1_2_2(or_tmp_39, or_tmp_38, fsm_output(3));
  or_tmp_172 <= (fsm_output(6)) OR mux_tmp_401;
  or_tmp_175 <= (fsm_output(3)) OR (fsm_output(8)) OR (fsm_output(7));
  or_346_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_tmp_404 <= MUX_s_1_2_2(or_346_nl, or_tmp_175, fsm_output(6));
  mux_tmp_405 <= MUX_s_1_2_2(or_321_cse, or_tmp_39, fsm_output(3));
  mux_409_nl <= MUX_s_1_2_2(nand_6_cse, or_tmp_172, fsm_output(5));
  mux_408_nl <= MUX_s_1_2_2(mux_tmp_404, nand_5_cse, fsm_output(5));
  mux_410_nl <= MUX_s_1_2_2(mux_409_nl, mux_408_nl, fsm_output(4));
  mux_406_nl <= MUX_s_1_2_2(or_377_cse, mux_tmp_404, fsm_output(5));
  mux_403_nl <= MUX_s_1_2_2(mux_437_cse, or_tmp_172, fsm_output(5));
  mux_407_nl <= MUX_s_1_2_2(mux_406_nl, mux_403_nl, fsm_output(4));
  mux_411_nl <= MUX_s_1_2_2(mux_410_nl, mux_407_nl, fsm_output(2));
  and_dcpl_39 <= (NOT mux_411_nl) AND and_dcpl_22;
  and_dcpl_40 <= and_dcpl_31 AND and_dcpl_22;
  and_dcpl_41 <= not_tmp_69 AND (fsm_output(4));
  and_dcpl_42 <= and_dcpl_41 AND and_dcpl_33;
  and_dcpl_43 <= and_dcpl_42 AND and_dcpl_40;
  or_tmp_184 <= (fsm_output(4)) OR (NOT nor_tmp_11);
  mux_415_nl <= MUX_s_1_2_2(mux_tmp, or_tmp_184, fsm_output(5));
  mux_416_nl <= MUX_s_1_2_2(mux_415_nl, mux_806_cse, fsm_output(3));
  or_5_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0011"));
  mux_412_nl <= MUX_s_1_2_2(or_5_nl, or_tmp_1, fsm_output(3));
  mux_417_nl <= MUX_s_1_2_2(mux_416_nl, mux_412_nl, fsm_output(8));
  and_dcpl_46 <= (NOT mux_417_nl) AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  and_dcpl_47 <= (fsm_output(5)) AND (NOT (fsm_output(3)));
  and_dcpl_48 <= and_dcpl_27 AND and_dcpl_47;
  and_dcpl_49 <= and_dcpl_48 AND and_dcpl_32;
  and_dcpl_51 <= and_dcpl_27 AND and_285_cse;
  and_dcpl_52 <= and_dcpl_51 AND and_dcpl_24;
  and_dcpl_53 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  mux_tmp_418 <= MUX_s_1_2_2((NOT or_tmp_2), nor_tmp_11, fsm_output(4));
  mux_tmp_419 <= MUX_s_1_2_2((NOT mux_tmp_418), or_591_cse, fsm_output(5));
  or_355_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0010"));
  mux_420_nl <= MUX_s_1_2_2(mux_tmp_419, or_355_nl, fsm_output(8));
  and_dcpl_55 <= (NOT mux_420_nl) AND and_dcpl_53 AND and_291_cse;
  and_dcpl_56 <= and_dcpl_41 AND and_dcpl_47;
  and_dcpl_57 <= and_dcpl_56 AND and_dcpl_37;
  and_dcpl_58 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_59 <= and_dcpl_58 AND (NOT (fsm_output(4)));
  and_dcpl_60 <= and_dcpl_59 AND and_dcpl_25;
  and_dcpl_61 <= and_dcpl_60 AND and_dcpl_40;
  and_dcpl_62 <= and_dcpl_59 AND and_dcpl_33;
  and_dcpl_63 <= and_dcpl_62 AND and_dcpl_32;
  and_dcpl_64 <= and_dcpl_58 AND (fsm_output(4));
  and_dcpl_65 <= and_dcpl_64 AND and_dcpl_25;
  and_dcpl_66 <= and_dcpl_65 AND and_dcpl_24;
  and_dcpl_70 <= xor_dcpl AND (fsm_output(6)) AND (fsm_output(4)) AND (fsm_output(3))
      AND and_dcpl_32;
  and_dcpl_71 <= and_dcpl_64 AND and_dcpl_33;
  and_dcpl_72 <= and_dcpl_71 AND and_dcpl_37;
  and_dcpl_74 <= and_dcpl_59 AND and_285_cse AND and_dcpl_40;
  and_dcpl_75 <= and_dcpl_64 AND and_dcpl_47;
  and_dcpl_76 <= and_dcpl_75 AND and_dcpl_32;
  and_dcpl_77 <= and_dcpl_64 AND and_285_cse;
  and_dcpl_78 <= and_dcpl_77 AND and_dcpl_24;
  and_dcpl_79 <= NOT(or_tmp_2 OR (fsm_output(4)));
  and_dcpl_80 <= and_dcpl_79 AND and_dcpl_25;
  and_dcpl_81 <= and_dcpl_80 AND and_dcpl_37;
  and_dcpl_82 <= (NOT or_tmp_2) AND (fsm_output(4));
  and_dcpl_84 <= and_dcpl_82 AND and_dcpl_25 AND and_dcpl_40;
  and_dcpl_85 <= and_dcpl_82 AND and_dcpl_33;
  and_dcpl_86 <= and_dcpl_85 AND and_dcpl_32;
  and_dcpl_87 <= and_dcpl_79 AND and_dcpl_47;
  and_dcpl_88 <= and_dcpl_87 AND and_dcpl_24;
  and_dcpl_89 <= and_dcpl_79 AND and_285_cse;
  and_dcpl_90 <= and_dcpl_89 AND and_dcpl_32;
  and_dcpl_91 <= and_dcpl_89 AND and_dcpl_37;
  and_dcpl_93 <= and_dcpl_82 AND and_285_cse AND and_dcpl_40;
  and_dcpl_94 <= nor_tmp_11 AND (NOT (fsm_output(4)));
  and_dcpl_95 <= and_dcpl_94 AND and_dcpl_25;
  and_dcpl_96 <= and_dcpl_95 AND and_dcpl_32;
  and_dcpl_97 <= and_dcpl_94 AND and_dcpl_33;
  and_dcpl_98 <= and_dcpl_97 AND and_dcpl_24;
  and_dcpl_99 <= nor_tmp_11 AND (fsm_output(4));
  and_dcpl_100 <= and_dcpl_99 AND and_dcpl_25;
  and_dcpl_101 <= and_dcpl_100 AND and_dcpl_37;
  and_dcpl_103 <= and_dcpl_94 AND and_dcpl_47 AND and_dcpl_40;
  and_dcpl_104 <= and_dcpl_94 AND and_285_cse;
  and_dcpl_105 <= and_dcpl_104 AND and_dcpl_32;
  and_dcpl_106 <= and_dcpl_99 AND and_dcpl_47;
  and_dcpl_107 <= and_dcpl_106 AND and_dcpl_24;
  and_dcpl_108 <= and_dcpl_99 AND and_285_cse;
  and_dcpl_109 <= and_dcpl_108 AND and_dcpl_37;
  and_dcpl_110 <= (NOT (fsm_output(2))) AND (fsm_output(8));
  and_dcpl_111 <= and_dcpl_110 AND and_dcpl_22;
  and_dcpl_112 <= and_dcpl_34 AND and_dcpl_111;
  and_dcpl_113 <= and_dcpl_110 AND and_291_cse;
  and_dcpl_114 <= and_dcpl_41 AND and_dcpl_25;
  and_dcpl_115 <= and_dcpl_114 AND and_dcpl_113;
  and_dcpl_116 <= (fsm_output(2)) AND (fsm_output(8));
  and_dcpl_117 <= and_dcpl_116 AND and_dcpl_22;
  and_dcpl_118 <= and_dcpl_42 AND and_dcpl_117;
  and_dcpl_119 <= and_dcpl_116 AND and_291_cse;
  and_dcpl_120 <= and_dcpl_48 AND and_dcpl_119;
  and_dcpl_121 <= and_dcpl_56 AND and_dcpl_111;
  and_dcpl_122 <= and_dcpl_41 AND and_285_cse;
  and_dcpl_123 <= and_dcpl_122 AND and_dcpl_113;
  and_dcpl_124 <= (NOT (fsm_output(8))) AND (fsm_output(0));
  or_tmp_186 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  mux_421_nl <= MUX_s_1_2_2(or_739_cse, or_tmp_186, fsm_output(1));
  and_dcpl_128 <= (NOT mux_421_nl) AND not_tmp_69 AND CONV_SL_1_1(fsm_output(5 DOWNTO
      4)=STD_LOGIC_VECTOR'("00")) AND and_dcpl_124;
  mux_422_cse <= MUX_s_1_2_2(or_tmp_156, or_tmp_160, fsm_output(3));
  mux_423_cse <= MUX_s_1_2_2(or_tmp_160, or_tmp_158, fsm_output(3));
  mux_tmp_424 <= MUX_s_1_2_2(mux_423_cse, mux_422_cse, fsm_output(5));
  mux_tmp_425 <= MUX_s_1_2_2(or_tmp_157, or_tmp_161, fsm_output(3));
  mux_tmp_446 <= MUX_s_1_2_2(and_dcpl_64, mux_tmp_418, fsm_output(5));
  mux_tmp_451 <= MUX_s_1_2_2(or_tmp_156, or_tmp_161, fsm_output(5));
  mux_tmp_454 <= MUX_s_1_2_2(or_tmp_158, or_tmp_160, fsm_output(5));
  mux_tmp_467 <= MUX_s_1_2_2(mux_369_cse, mux_1081_cse, fsm_output(5));
  mux_tmp_504 <= MUX_s_1_2_2(mux_1081_cse, mux_369_cse, fsm_output(3));
  mux_508_nl <= MUX_s_1_2_2(mux_369_cse, mux_472_cse, fsm_output(3));
  mux_tmp_509 <= MUX_s_1_2_2(mux_508_nl, mux_1145_cse, fsm_output(2));
  mux_512_nl <= MUX_s_1_2_2(mux_475_cse, mux_473_cse, fsm_output(3));
  mux_513_nl <= MUX_s_1_2_2(mux_512_nl, mux_tmp_504, fsm_output(2));
  mux_514_nl <= MUX_s_1_2_2(mux_513_nl, mux_tmp_509, fsm_output(5));
  mux_505_nl <= MUX_s_1_2_2(mux_tmp_504, mux_1141_cse, fsm_output(2));
  mux_510_nl <= MUX_s_1_2_2(mux_tmp_509, mux_505_nl, fsm_output(5));
  mux_515_itm <= MUX_s_1_2_2(mux_514_nl, mux_510_nl, fsm_output(1));
  or_420_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (NOT (fsm_output(4)))
      OR (fsm_output(6));
  or_419_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (NOT (fsm_output(6)));
  mux_tmp_516 <= MUX_s_1_2_2(or_420_nl, or_419_nl, fsm_output(8));
  mux_tmp_517 <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(4));
  nand_46_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 5)=STD_LOGIC_VECTOR'("0111")));
  mux_tmp_526 <= MUX_s_1_2_2(or_384_cse, nand_46_nl, fsm_output(4));
  and_dcpl_144 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_145 <= and_dcpl_31 AND and_dcpl_144;
  mux_tmp_536 <= MUX_s_1_2_2(nand_5_cse, or_377_cse, fsm_output(4));
  mux_tmp_543 <= MUX_s_1_2_2(mux_435_cse, mux_439_cse, fsm_output(5));
  mux_547_nl <= MUX_s_1_2_2(mux_440_cse, mux_435_cse, fsm_output(5));
  mux_545_nl <= MUX_s_1_2_2(mux_439_cse, mux_434_cse, fsm_output(5));
  mux_tmp_548 <= MUX_s_1_2_2(mux_547_nl, mux_545_nl, fsm_output(2));
  or_tmp_271 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  or_tmp_272 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR (NOT
      (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  mux_tmp_555 <= MUX_s_1_2_2(or_tmp_272, or_tmp_271, fsm_output(7));
  or_tmp_273 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100")) OR
      (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  or_tmp_274 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  not_tmp_207 <= NOT((reg_VEC_LOOP_j_10_10_0_tmp(5)) AND (fsm_output(8)));
  or_446_nl <= (fsm_output(6)) OR not_tmp_207;
  or_445_nl <= (NOT (fsm_output(6))) OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR
      (fsm_output(8));
  mux_558_nl <= MUX_s_1_2_2(or_446_nl, or_445_nl, fsm_output(5));
  or_tmp_277 <= (fsm_output(7)) OR mux_558_nl;
  mux_tmp_561 <= MUX_s_1_2_2(mux_tmp_555, or_tmp_277, fsm_output(4));
  nand_35_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND
      (reg_VEC_LOOP_j_10_10_0_tmp(5)) AND (NOT (fsm_output(8))));
  mux_tmp_562 <= MUX_s_1_2_2(or_tmp_271, nand_35_nl, fsm_output(7));
  or_449_cse <= (fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(8));
  and_dcpl_148 <= NOT((fsm_output(6)) OR (fsm_output(4)));
  and_dcpl_153 <= and_dcpl_34 AND and_dcpl_24;
  and_dcpl_154 <= and_dcpl_114 AND and_dcpl_37;
  and_dcpl_159 <= and_dcpl_62 AND and_dcpl_40;
  and_dcpl_164 <= and_dcpl_75 AND and_dcpl_40;
  and_dcpl_167 <= NOT((fsm_output(5)) OR (fsm_output(8)));
  mux_tmp_581 <= MUX_s_1_2_2(mux_tmp_454, mux_tmp_451, fsm_output(2));
  or_tmp_291 <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0100"));
  mux_tmp_586 <= MUX_s_1_2_2(mux_529_cse, mux_457_cse, fsm_output(2));
  and_dcpl_192 <= and_dcpl_79 AND and_dcpl_33 AND and_dcpl_37;
  or_tmp_295 <= (NOT (fsm_output(6))) OR (fsm_output(8)) OR (fsm_output(5));
  or_tmp_297 <= (fsm_output(6)) OR (fsm_output(8)) OR (NOT (fsm_output(5)));
  mux_600_cse <= MUX_s_1_2_2(or_tmp_297, or_tmp_295, fsm_output(3));
  mux_601_cse <= MUX_s_1_2_2(or_449_cse, or_tmp_297, fsm_output(3));
  mux_tmp_602 <= MUX_s_1_2_2(mux_601_cse, mux_600_cse, fsm_output(7));
  or_472_nl <= (NOT (fsm_output(8))) OR (fsm_output(5));
  or_471_nl <= (fsm_output(8)) OR (NOT (fsm_output(5)));
  mux_tmp_603 <= MUX_s_1_2_2(or_472_nl, or_471_nl, fsm_output(6));
  and_dcpl_201 <= and_dcpl_60 AND and_dcpl_116 AND and_dcpl_144;
  not_tmp_218 <= NOT((fsm_output(0)) AND (fsm_output(6)));
  mux_611_nl <= MUX_s_1_2_2(not_tmp_218, (fsm_output(6)), fsm_output(8));
  or_tmp_306 <= (fsm_output(7)) OR mux_611_nl;
  or_tmp_307 <= (fsm_output(8)) OR (NOT (fsm_output(6)));
  or_tmp_308 <= (fsm_output(8)) OR (NOT (fsm_output(0))) OR (fsm_output(6));
  mux_tmp_612 <= MUX_s_1_2_2(or_tmp_308, or_tmp_307, fsm_output(7));
  mux_tmp_614 <= MUX_s_1_2_2(or_584_cse_1, or_tmp_308, fsm_output(7));
  mux_tmp_615 <= MUX_s_1_2_2(or_tmp_306, mux_tmp_614, fsm_output(4));
  mux_613_nl <= MUX_s_1_2_2(mux_tmp_612, or_tmp_306, fsm_output(4));
  mux_tmp_616 <= MUX_s_1_2_2(mux_tmp_615, mux_613_nl, fsm_output(2));
  or_481_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(0))) OR (fsm_output(6));
  mux_tmp_617 <= MUX_s_1_2_2(or_481_nl, or_584_cse_1, fsm_output(7));
  or_482_nl <= (fsm_output(8)) OR not_tmp_218;
  mux_tmp_618 <= MUX_s_1_2_2(or_tmp_307, or_482_nl, fsm_output(7));
  mux_tmp_619 <= MUX_s_1_2_2(mux_tmp_618, mux_tmp_617, fsm_output(4));
  mux_620_nl <= MUX_s_1_2_2(mux_tmp_617, mux_tmp_612, fsm_output(4));
  mux_tmp_621 <= MUX_s_1_2_2(mux_620_nl, mux_tmp_619, fsm_output(2));
  mux_tmp_622 <= MUX_s_1_2_2(mux_tmp_621, mux_tmp_616, fsm_output(5));
  mux_tmp_623 <= MUX_s_1_2_2(mux_tmp_614, mux_tmp_618, fsm_output(4));
  or_496_nl <= (NOT (fsm_output(8))) OR (fsm_output(6));
  mux_639_nl <= MUX_s_1_2_2(or_496_nl, or_tmp_307, fsm_output(5));
  or_494_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(8))) OR (fsm_output(6));
  mux_tmp_640 <= MUX_s_1_2_2(mux_639_nl, or_494_nl, fsm_output(3));
  or_498_nl <= (fsm_output(2)) OR mux_tmp_640;
  or_497_nl <= (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(6));
  mux_641_nl <= MUX_s_1_2_2(or_497_nl, mux_tmp_640, fsm_output(2));
  mux_642_nl <= MUX_s_1_2_2(or_498_nl, mux_641_nl, fsm_output(4));
  or_493_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_636_nl <= MUX_s_1_2_2(or_tmp_295, or_493_nl, fsm_output(3));
  mux_637_nl <= MUX_s_1_2_2(or_470_cse, mux_636_nl, fsm_output(2));
  mux_635_nl <= MUX_s_1_2_2(mux_600_cse, or_470_cse, fsm_output(2));
  mux_638_nl <= MUX_s_1_2_2(mux_637_nl, mux_635_nl, fsm_output(4));
  mux_643_nl <= MUX_s_1_2_2(mux_642_nl, mux_638_nl, fsm_output(7));
  or_487_nl <= (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_632_nl <= MUX_s_1_2_2(or_487_nl, mux_601_cse, fsm_output(2));
  or_483_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(5)) OR (fsm_output(8))
      OR (fsm_output(6));
  mux_633_nl <= MUX_s_1_2_2(mux_632_nl, or_483_nl, fsm_output(4));
  or_488_nl <= (fsm_output(7)) OR mux_633_nl;
  mux_644_nl <= MUX_s_1_2_2(mux_643_nl, or_488_nl, fsm_output(1));
  and_dcpl_203 <= (NOT mux_644_nl) AND (fsm_output(0));
  or_tmp_330 <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(8)))
      OR (fsm_output(6));
  nand_48_nl <= NOT((fsm_output(5)) AND (fsm_output(1)) AND (fsm_output(7)) AND (NOT
      (fsm_output(8))) AND (fsm_output(6)));
  or_500_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(8)) OR (NOT
      (fsm_output(6)));
  mux_645_nl <= MUX_s_1_2_2(or_tmp_330, or_500_nl, fsm_output(5));
  mux_tmp_646 <= MUX_s_1_2_2(nand_48_nl, mux_645_nl, fsm_output(3));
  nor_98_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")));
  nor_99_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010")));
  mux_648_nl <= MUX_s_1_2_2(nor_98_cse, nor_99_nl, fsm_output(1));
  nand_tmp_10 <= NOT((fsm_output(5)) AND mux_648_nl);
  or_511_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(7))) OR (fsm_output(8))
      OR (fsm_output(6));
  mux_651_nl <= MUX_s_1_2_2(or_511_nl, or_tmp_330, fsm_output(5));
  mux_652_nl <= MUX_s_1_2_2(mux_651_nl, nand_tmp_10, fsm_output(3));
  mux_653_nl <= MUX_s_1_2_2(mux_tmp_646, mux_652_nl, fsm_output(4));
  mux_647_nl <= MUX_s_1_2_2(or_tmp_160, or_tmp_156, fsm_output(1));
  or_508_nl <= (fsm_output(5)) OR mux_647_nl;
  mux_649_nl <= MUX_s_1_2_2(nand_tmp_10, or_508_nl, fsm_output(3));
  mux_650_nl <= MUX_s_1_2_2(mux_649_nl, mux_tmp_646, fsm_output(4));
  mux_654_nl <= MUX_s_1_2_2(mux_653_nl, mux_650_nl, fsm_output(2));
  and_dcpl_204 <= (NOT mux_654_nl) AND (fsm_output(0));
  and_dcpl_205 <= and_dcpl_65 AND and_dcpl_37;
  not_tmp_230 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("000000")));
  mux_672_nl <= MUX_s_1_2_2(not_tmp_230, or_748_cse, fsm_output(8));
  mux_tmp_673 <= MUX_s_1_2_2(mux_672_nl, nor_tmp_29, fsm_output(1));
  mux_675_nl <= MUX_s_1_2_2(not_tmp_230, or_750_cse, fsm_output(8));
  mux_676_nl <= MUX_s_1_2_2(mux_675_nl, nor_tmp_29, fsm_output(1));
  mux_tmp_677 <= MUX_s_1_2_2(mux_tmp_673, mux_676_nl, fsm_output(0));
  or_tmp_355 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  and_293_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  or_tmp_356 <= and_293_cse OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_762_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_678 <= MUX_s_1_2_2(or_tmp_356, or_tmp_355, or_762_nl);
  mux_679_nl <= MUX_s_1_2_2(or_tmp_356, or_tmp_355, fsm_output(3));
  mux_tmp_680 <= MUX_s_1_2_2(not_tmp_230, mux_679_nl, fsm_output(8));
  mux_tmp_686 <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(2));
  and_dcpl_216 <= and_dcpl_28 AND and_dcpl_145;
  or_538_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"));
  mux_694_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), or_538_cse);
  and_288_nl <= ((fsm_output(4)) OR (fsm_output(6))) AND (fsm_output(7));
  mux_tmp_695 <= MUX_s_1_2_2(mux_694_nl, and_288_nl, fsm_output(3));
  and_289_nl <= or_538_cse AND (fsm_output(7));
  mux_tmp_696 <= MUX_s_1_2_2(mux_tmp_695, and_289_nl, fsm_output(2));
  mux_701_nl <= MUX_s_1_2_2(or_tmp_161, or_tmp_156, fsm_output(3));
  mux_703_nl <= MUX_s_1_2_2(mux_422_cse, mux_701_nl, fsm_output(5));
  mux_tmp_706 <= MUX_s_1_2_2(mux_tmp_424, mux_703_nl, fsm_output(1));
  mux_713_nl <= MUX_s_1_2_2(mux_428_cse, mux_423_cse, fsm_output(5));
  mux_714_nl <= MUX_s_1_2_2(mux_429_cse, mux_713_nl, fsm_output(1));
  mux_715_nl <= MUX_s_1_2_2(mux_tmp_706, mux_714_nl, fsm_output(4));
  mux_711_nl <= MUX_s_1_2_2(mux_426_cse, mux_429_cse, fsm_output(1));
  mux_712_nl <= MUX_s_1_2_2(mux_711_nl, mux_tmp_706, fsm_output(4));
  mux_716_itm <= MUX_s_1_2_2(mux_715_nl, mux_712_nl, fsm_output(2));
  or_tmp_375 <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (fsm_output(7));
  mux_718_nl <= MUX_s_1_2_2(or_tmp_39, or_321_cse, fsm_output(5));
  or_tmp_378 <= (fsm_output(6)) OR mux_718_nl;
  mux_719_nl <= MUX_s_1_2_2(or_tmp_378, mux_1125_cse, fsm_output(4));
  mux_tmp_722 <= MUX_s_1_2_2(mux_1023_cse, mux_719_nl, fsm_output(2));
  mux_tmp_723 <= MUX_s_1_2_2(or_tmp_38, or_tmp_39, fsm_output(5));
  nand_tmp_11 <= NOT((fsm_output(6)) AND (NOT mux_tmp_723));
  and_dcpl_227 <= and_dcpl_34 AND and_dcpl_23 AND (NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm)
      AND and_dcpl_22;
  and_dcpl_231 <= (fsm_output(6)) AND (fsm_output(4));
  mux_tmp_830 <= MUX_s_1_2_2(nor_tmp_3, or_tmp_39, fsm_output(6));
  mux_tmp_831 <= MUX_s_1_2_2(nor_tmp_3, (fsm_output(8)), fsm_output(6));
  mux_tmp_834 <= MUX_s_1_2_2((fsm_output(7)), (fsm_output(8)), fsm_output(6));
  mux_tmp_836 <= MUX_s_1_2_2(nor_tmp_3, or_tmp_38, fsm_output(6));
  mux_847_nl <= MUX_s_1_2_2(mux_tmp_82, nor_tmp_3, fsm_output(6));
  mux_tmp_848 <= MUX_s_1_2_2(mux_847_nl, mux_tmp_830, fsm_output(4));
  mux_tmp_852 <= MUX_s_1_2_2(mux_tmp_848, mux_tmp_831, fsm_output(2));
  mux_851_nl <= MUX_s_1_2_2(mux_tmp_830, mux_tmp_831, fsm_output(4));
  mux_tmp_853 <= MUX_s_1_2_2(mux_tmp_852, mux_851_nl, fsm_output(3));
  mux_tmp_856 <= MUX_s_1_2_2(mux_tmp_82, (fsm_output(8)), fsm_output(6));
  mux_tmp_858 <= MUX_s_1_2_2(mux_tmp_856, mux_tmp_831, fsm_output(4));
  or_613_cse <= (NOT (fsm_output(2))) OR (fsm_output(4));
  or_610_cse <= (NOT (fsm_output(4))) OR (fsm_output(6));
  nor_90_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000010")));
  or_627_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_885_nl <= MUX_s_1_2_2(mux_1143_cse, mux_tmp_504, fsm_output(2));
  mux_886_nl <= MUX_s_1_2_2(or_627_nl, mux_885_nl, reg_VEC_LOOP_j_10_10_0_tmp(5));
  and_276_nl <= (fsm_output(1)) AND (NOT mux_886_nl);
  nor_91_nl <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(8))
      OR (fsm_output(6)));
  nor_92_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR
      (fsm_output(8)) OR (fsm_output(6)));
  mux_879_nl <= MUX_s_1_2_2(nor_91_nl, nor_92_nl, fsm_output(2));
  and_277_nl <= (reg_VEC_LOOP_j_10_10_0_tmp(5)) AND mux_879_nl;
  mux_877_nl <= MUX_s_1_2_2(mux_369_cse, or_395_cse, fsm_output(3));
  mux_875_nl <= MUX_s_1_2_2(mux_469_cse, or_685_cse, fsm_output(3));
  mux_878_nl <= MUX_s_1_2_2(mux_877_nl, mux_875_nl, fsm_output(2));
  and_278_nl <= (reg_VEC_LOOP_j_10_10_0_tmp(5)) AND (NOT mux_878_nl);
  mux_880_nl <= MUX_s_1_2_2(and_277_nl, and_278_nl, fsm_output(1));
  mux_887_nl <= MUX_s_1_2_2(and_276_nl, mux_880_nl, fsm_output(5));
  not_tmp_267 <= MUX_s_1_2_2(nor_90_nl, mux_887_nl, fsm_output(0));
  and_275_cse <= (fsm_output(4)) AND (fsm_output(2));
  or_tmp_481 <= (fsm_output(4)) OR (NOT (fsm_output(7))) OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5)))
      OR (fsm_output(8));
  or_tmp_486 <= NOT((fsm_output(4)) AND (fsm_output(7)) AND (reg_VEC_LOOP_j_10_10_0_tmp(5))
      AND (NOT (fsm_output(8))));
  or_tmp_487 <= (fsm_output(3)) OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR (NOT
      (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  or_665_nl <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR not_tmp_207;
  mux_925_nl <= MUX_s_1_2_2(or_665_nl, or_tmp_486, fsm_output(3));
  mux_926_nl <= MUX_s_1_2_2(mux_925_nl, or_tmp_487, fsm_output(2));
  or_661_nl <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(8));
  mux_923_nl <= MUX_s_1_2_2(or_tmp_486, or_661_nl, fsm_output(3));
  mux_924_nl <= MUX_s_1_2_2(or_tmp_487, mux_923_nl, fsm_output(2));
  mux_927_nl <= MUX_s_1_2_2(mux_926_nl, mux_924_nl, fsm_output(6));
  or_660_nl <= (fsm_output(4)) OR (fsm_output(7)) OR not_tmp_207;
  mux_921_nl <= MUX_s_1_2_2(or_660_nl, or_tmp_481, fsm_output(3));
  nand_18_nl <= NOT((fsm_output(2)) AND (NOT mux_921_nl));
  or_658_nl <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5)))
      OR (fsm_output(8));
  mux_919_nl <= MUX_s_1_2_2(or_658_nl, or_tmp_481, fsm_output(3));
  nand_38_nl <= NOT((fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(7)) AND (reg_VEC_LOOP_j_10_10_0_tmp(5))
      AND (NOT (fsm_output(8))));
  mux_920_nl <= MUX_s_1_2_2(mux_919_nl, nand_38_nl, fsm_output(2));
  mux_922_nl <= MUX_s_1_2_2(nand_18_nl, mux_920_nl, fsm_output(6));
  mux_928_nl <= MUX_s_1_2_2(mux_927_nl, mux_922_nl, fsm_output(5));
  or_654_nl <= (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(7)) OR (NOT
      (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  or_653_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(8));
  mux_918_nl <= MUX_s_1_2_2(or_654_nl, or_653_nl, fsm_output(2));
  or_655_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR mux_918_nl;
  mux_929_nl <= MUX_s_1_2_2(mux_928_nl, or_655_nl, fsm_output(1));
  and_dcpl_240 <= (NOT mux_929_nl) AND (fsm_output(0));
  nand_tmp_19 <= NOT((fsm_output(5)) AND (NOT mux_369_cse));
  mux_tmp_964 <= MUX_s_1_2_2(and_dcpl_231, or_610_cse, fsm_output(3));
  or_686_nl <= (fsm_output(4)) OR (NOT (fsm_output(6)));
  mux_963_nl <= MUX_s_1_2_2((NOT mux_tmp_517), or_686_nl, fsm_output(3));
  mux_tmp_965 <= MUX_s_1_2_2((NOT mux_tmp_964), mux_963_nl, fsm_output(2));
  mux_tmp_966 <= MUX_s_1_2_2(and_dcpl_231, mux_tmp_517, fsm_output(3));
  mux_975_cse <= MUX_s_1_2_2(mux_529_cse, mux_tmp_454, fsm_output(3));
  mux_tmp_978 <= MUX_s_1_2_2(mux_1095_cse, mux_975_cse, fsm_output(1));
  mux_tmp_980 <= MUX_s_1_2_2(or_384_cse, mux_tmp_451, fsm_output(3));
  mux_981_cse <= MUX_s_1_2_2(mux_tmp_451, mux_529_cse, fsm_output(3));
  mux_985_cse <= MUX_s_1_2_2(mux_452_cse, mux_457_cse, fsm_output(3));
  mux_986_nl <= MUX_s_1_2_2(mux_tmp_980, mux_985_cse, fsm_output(1));
  mux_987_nl <= MUX_s_1_2_2(mux_tmp_978, mux_986_nl, fsm_output(4));
  mux_982_nl <= MUX_s_1_2_2(mux_981_cse, mux_tmp_980, fsm_output(1));
  mux_983_nl <= MUX_s_1_2_2(mux_982_nl, mux_tmp_978, fsm_output(4));
  mux_988_nl <= MUX_s_1_2_2(mux_987_nl, mux_983_nl, fsm_output(2));
  and_dcpl_248 <= NOT(mux_988_nl OR (fsm_output(0)));
  or_tmp_527 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_529 <= (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(2)));
  or_tmp_530 <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("1000"));
  or_713_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_1006 <= MUX_s_1_2_2(or_tmp_527, or_713_nl, fsm_output(4));
  nand_44_nl <= NOT((fsm_output(4)) AND (fsm_output(2)));
  nand_21_nl <= NOT((fsm_output(4)) AND (NOT and_300_cse));
  mux_tmp_1011 <= MUX_s_1_2_2(nand_44_nl, nand_21_nl, fsm_output(3));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_60 AND and_dcpl_117;
  VEC_LOOP_acc_1_cse_10_sva_mx0c1 <= NOT(mux_716_itm OR (fsm_output(0)));
  mux_730_nl <= MUX_s_1_2_2(nand_tmp_11, or_tmp_378, fsm_output(4));
  mux_729_nl <= MUX_s_1_2_2(or_384_cse, nand_tmp_11, fsm_output(4));
  mux_731_nl <= MUX_s_1_2_2(mux_730_nl, mux_729_nl, fsm_output(2));
  mux_732_nl <= MUX_s_1_2_2(mux_tmp_722, mux_731_nl, fsm_output(3));
  or_559_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_725_nl <= MUX_s_1_2_2(or_559_nl, or_725_cse, fsm_output(6));
  mux_726_nl <= MUX_s_1_2_2(mux_725_nl, nand_tmp_11, fsm_output(4));
  or_557_nl <= (fsm_output(6)) OR mux_tmp_723;
  mux_724_nl <= MUX_s_1_2_2(mux_1021_cse, or_557_nl, fsm_output(4));
  mux_727_nl <= MUX_s_1_2_2(mux_726_nl, mux_724_nl, fsm_output(2));
  mux_728_nl <= MUX_s_1_2_2(mux_727_nl, mux_tmp_722, fsm_output(3));
  mux_733_nl <= MUX_s_1_2_2(mux_732_nl, mux_728_nl, fsm_output(1));
  VEC_LOOP_acc_1_cse_10_sva_mx0c3 <= (NOT mux_733_nl) AND (fsm_output(0));
  xor_dcpl <= NOT((fsm_output(7)) XOR (fsm_output(5)));
  VEC_LOOP_or_9_cse <= and_dcpl_49 OR and_dcpl_57 OR and_dcpl_63 OR and_dcpl_72 OR
      and_dcpl_76 OR and_dcpl_81 OR and_dcpl_86 OR and_dcpl_91 OR and_dcpl_96 OR
      and_dcpl_101 OR and_dcpl_105 OR and_dcpl_109 OR and_dcpl_115 OR and_dcpl_120
      OR and_dcpl_123;
  VEC_LOOP_or_26_cse <= and_dcpl_52 OR and_dcpl_78 OR and_dcpl_98 OR and_dcpl_118;
  VEC_LOOP_or_29_cse <= and_dcpl_66 OR and_dcpl_107;
  VEC_LOOP_or_14_cse <= and_dcpl_66 OR and_dcpl_88 OR and_dcpl_107;
  VEC_LOOP_mux1h_10_nl <= MUX1HOT_v_6_7_2((z_out_17(9 DOWNTO 4)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(9
      DOWNTO 4)), (z_out_14(8 DOWNTO 3)), (z_out_14(9 DOWNTO 4)), (z_out_14(7 DOWNTO
      2)), (z_out_14(6 DOWNTO 1)), (z_out_14(5 DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_29
      & and_dcpl_38 & COMP_LOOP_twiddle_f_or_2_rgt & VEC_LOOP_or_9_cse & VEC_LOOP_or_26_cse
      & VEC_LOOP_or_29_cse & and_dcpl_88));
  VEC_LOOP_mux1h_8_nl <= MUX1HOT_s_1_7_2((z_out_17(3)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(3)),
      (z_out_14(2)), (z_out_14(3)), (z_out_14(1)), (z_out_14(0)), (VEC_LOOP_acc_1_cse_10_sva(3)),
      STD_LOGIC_VECTOR'( and_dcpl_29 & and_dcpl_38 & COMP_LOOP_twiddle_f_or_2_rgt
      & VEC_LOOP_or_9_cse & VEC_LOOP_or_26_cse & VEC_LOOP_or_29_cse & and_dcpl_88));
  and_140_nl <= mux_tmp_446 AND (NOT (fsm_output(3))) AND and_dcpl_24;
  VEC_LOOP_mux1h_6_nl <= MUX1HOT_s_1_6_2((z_out_17(2)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(2)),
      (z_out_14(1)), (z_out_14(2)), (z_out_14(0)), (VEC_LOOP_acc_1_cse_10_sva(2)),
      STD_LOGIC_VECTOR'( and_dcpl_29 & and_dcpl_38 & COMP_LOOP_twiddle_f_or_2_rgt
      & VEC_LOOP_or_9_cse & VEC_LOOP_or_26_cse & and_140_nl));
  mux_444_nl <= MUX_s_1_2_2(or_583_cse_1, or_3_cse, fsm_output(4));
  mux_445_nl <= MUX_s_1_2_2(or_tmp_184, mux_444_nl, fsm_output(5));
  mux_447_nl <= MUX_s_1_2_2(mux_tmp_446, (NOT mux_445_nl), fsm_output(3));
  nor_103_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 3)/=STD_LOGIC_VECTOR'("00011")));
  mux_448_nl <= MUX_s_1_2_2(mux_447_nl, nor_103_nl, fsm_output(8));
  and_137_nl <= mux_448_nl AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
  VEC_LOOP_mux1h_4_nl <= MUX1HOT_s_1_5_2((z_out_17(1)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(1)),
      (z_out_14(0)), (z_out_14(1)), (VEC_LOOP_acc_1_cse_10_sva(1)), STD_LOGIC_VECTOR'(
      and_dcpl_29 & and_dcpl_38 & COMP_LOOP_twiddle_f_or_2_rgt & VEC_LOOP_or_9_cse
      & and_137_nl));
  mux_430_nl <= MUX_s_1_2_2(mux_tmp_424, mux_429_cse, fsm_output(4));
  mux_427_nl <= MUX_s_1_2_2(mux_426_cse, mux_tmp_424, fsm_output(4));
  mux_431_nl <= MUX_s_1_2_2(mux_430_nl, mux_427_nl, fsm_output(2));
  and_133_nl <= (NOT mux_431_nl) AND and_dcpl_22;
  VEC_LOOP_mux1h_2_nl <= MUX1HOT_s_1_4_2((z_out_17(0)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(0)),
      (VEC_LOOP_acc_1_cse_10_sva(0)), (z_out_14(0)), STD_LOGIC_VECTOR'( and_dcpl_29
      & and_dcpl_38 & and_133_nl & VEC_LOOP_or_9_cse));
  and_39_nl <= and_dcpl_34 AND and_dcpl_32;
  VEC_LOOP_mux1h_nl <= MUX1HOT_v_5_37_2(VEC_LOOP_acc_psp_sva_mx0w0, VEC_LOOP_j_10_10_0_sva_1_4_0,
      (VEC_LOOP_acc_10_cse_1_sva(9 DOWNTO 5)), (z_out_14(9 DOWNTO 5)), (VEC_LOOP_acc_1_cse_10_sva(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(9 DOWNTO 5)), (VEC_LOOP_acc_11_psp_sva_8
      & reg_VEC_LOOP_acc_11_psp_1_reg & (reg_VEC_LOOP_acc_11_psp_2_reg(6 DOWNTO 4))),
      (VEC_LOOP_acc_10_cse_4_sva_mx0w3(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(9
      DOWNTO 5)), (reg_VEC_LOOP_acc_11_psp_1_reg & (reg_VEC_LOOP_acc_11_psp_2_reg(6
      DOWNTO 3))), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_8_sva_mx0w7(9 DOWNTO 5)), (z_out_17(9 DOWNTO
      5)), (reg_VEC_LOOP_acc_11_psp_2_reg(6 DOWNTO 2)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(9
      DOWNTO 5)), (COMP_LOOP_17_twiddle_f_lshift_itm(5 DOWNTO 1)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_20_sva_mx0w19(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_22_sva_mx0w21(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_24_sva_mx0w23(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(9 DOWNTO 5)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(9
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_sva_mx0w31(9 DOWNTO 5)), STD_LOGIC_VECTOR'(
      and_dcpl_29 & and_39_nl & and_dcpl_36 & and_dcpl_38 & and_dcpl_39 & and_dcpl_43
      & and_dcpl_46 & and_dcpl_49 & and_dcpl_52 & and_dcpl_55 & and_dcpl_57 & and_dcpl_61
      & and_dcpl_63 & VEC_LOOP_or_14_cse & and_dcpl_70 & and_dcpl_72 & and_dcpl_74
      & and_dcpl_76 & and_dcpl_78 & and_dcpl_81 & and_dcpl_84 & and_dcpl_86 & and_dcpl_90
      & and_dcpl_91 & and_dcpl_93 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103
      & and_dcpl_105 & and_dcpl_109 & and_dcpl_112 & and_dcpl_115 & and_dcpl_118
      & and_dcpl_120 & and_dcpl_121 & and_dcpl_123));
  VEC_LOOP_mux1h_1_nl <= MUX1HOT_s_1_36_2((COMP_LOOP_twiddle_f_11_sva(4)), (VEC_LOOP_acc_10_cse_1_sva(4)),
      (z_out_14(4)), (VEC_LOOP_acc_1_cse_10_sva(4)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(4)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(3)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(4)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(4)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(2)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(4)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(4)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(4)), (z_out_17(4)), (reg_VEC_LOOP_acc_11_psp_2_reg(1)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(4)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(4)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(4)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(4)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(4)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(4)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(4)), (COMP_LOOP_17_twiddle_f_lshift_itm(0)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(4)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(4)),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19(4)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(4)),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21(4)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(4)),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23(4)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(4)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(4)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(4)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(4)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(4)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(4)), (VEC_LOOP_acc_10_cse_sva_mx0w31(4)),
      STD_LOGIC_VECTOR'( and_dcpl_128 & and_dcpl_36 & and_dcpl_38 & and_dcpl_39 &
      and_dcpl_43 & and_dcpl_46 & and_dcpl_49 & and_dcpl_52 & and_dcpl_55 & and_dcpl_57
      & and_dcpl_61 & and_dcpl_63 & VEC_LOOP_or_14_cse & and_dcpl_70 & and_dcpl_72
      & and_dcpl_74 & and_dcpl_76 & and_dcpl_78 & and_dcpl_81 & and_dcpl_84 & and_dcpl_86
      & and_dcpl_90 & and_dcpl_91 & and_dcpl_93 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101
      & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 & and_dcpl_112 & and_dcpl_115
      & and_dcpl_118 & and_dcpl_120 & and_dcpl_121 & and_dcpl_123));
  mux_441_nl <= MUX_s_1_2_2(mux_440_cse, mux_439_cse, fsm_output(2));
  mux_436_nl <= MUX_s_1_2_2(mux_435_cse, mux_434_cse, fsm_output(2));
  mux_442_nl <= MUX_s_1_2_2(mux_441_nl, mux_436_nl, fsm_output(5));
  or_368_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)/=STD_LOGIC_VECTOR'("0101010"));
  mux_443_nl <= MUX_s_1_2_2(mux_442_nl, or_368_nl, fsm_output(1));
  and_134_nl <= (NOT mux_443_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_3_nl <= MUX1HOT_s_1_35_2((COMP_LOOP_twiddle_f_11_sva(3)), (VEC_LOOP_acc_10_cse_1_sva(3)),
      (z_out_14(3)), (VEC_LOOP_acc_1_cse_10_sva(3)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(3)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(2)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(3)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(3)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(1)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(3)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(3)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(3)), (z_out_17(3)), (reg_VEC_LOOP_acc_11_psp_2_reg(0)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(3)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(3)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(3)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(3)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(3)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(3)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(3)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(3)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(3)), (VEC_LOOP_acc_10_cse_20_sva_mx0w19(3)),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20(3)), (VEC_LOOP_acc_10_cse_22_sva_mx0w21(3)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(3)), (VEC_LOOP_acc_10_cse_24_sva_mx0w23(3)),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25(3)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(3)),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27(3)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(3)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(3)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(3)),
      (VEC_LOOP_acc_10_cse_sva_mx0w31(3)), STD_LOGIC_VECTOR'( and_dcpl_128 & and_dcpl_36
      & and_dcpl_38 & and_134_nl & and_dcpl_43 & and_dcpl_46 & and_dcpl_49 & and_dcpl_52
      & and_dcpl_55 & and_dcpl_57 & and_dcpl_61 & and_dcpl_63 & VEC_LOOP_or_14_cse
      & and_dcpl_70 & and_dcpl_72 & and_dcpl_74 & and_dcpl_76 & and_dcpl_78 & and_dcpl_81
      & and_dcpl_84 & and_dcpl_86 & and_dcpl_91 & and_dcpl_93 & and_dcpl_96 & and_dcpl_98
      & and_dcpl_101 & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 & and_dcpl_112
      & and_dcpl_115 & and_dcpl_118 & and_dcpl_120 & and_dcpl_121 & and_dcpl_123));
  mux_459_nl <= MUX_s_1_2_2(or_390_cse, or_tmp_157, fsm_output(5));
  mux_460_nl <= MUX_s_1_2_2(mux_459_nl, mux_529_cse, fsm_output(4));
  mux_458_nl <= MUX_s_1_2_2(mux_tmp_454, mux_457_cse, fsm_output(4));
  mux_461_nl <= MUX_s_1_2_2(mux_460_nl, mux_458_nl, fsm_output(2));
  mux_462_nl <= MUX_s_1_2_2(mux_461_nl, mux_456_cse, fsm_output(3));
  mux_450_nl <= MUX_s_1_2_2(or_384_cse, mux_529_cse, fsm_output(4));
  or_385_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")) OR mux_450_nl;
  mux_463_nl <= MUX_s_1_2_2(mux_462_nl, or_385_nl, fsm_output(1));
  and_138_nl <= (NOT mux_463_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_5_nl <= MUX1HOT_s_1_34_2((COMP_LOOP_twiddle_f_11_sva(2)), (VEC_LOOP_acc_10_cse_1_sva(2)),
      (z_out_14(2)), (VEC_LOOP_acc_1_cse_10_sva(2)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(2)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(1)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(2)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(2)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(0)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(2)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(2)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(2)), (z_out_17(2)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(2)),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10(2)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(2)),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12(2)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(2)),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14(2)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(2)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(2)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(2)),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19(2)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(2)),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21(2)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(2)),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23(2)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(2)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(2)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(2)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(2)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(2)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(2)), (VEC_LOOP_acc_10_cse_sva_mx0w31(2)),
      STD_LOGIC_VECTOR'( and_dcpl_128 & and_dcpl_36 & and_dcpl_38 & and_138_nl &
      and_dcpl_43 & and_dcpl_46 & and_dcpl_49 & and_dcpl_52 & and_dcpl_55 & and_dcpl_57
      & and_dcpl_61 & and_dcpl_63 & VEC_LOOP_or_14_cse & and_dcpl_72 & and_dcpl_74
      & and_dcpl_76 & and_dcpl_78 & and_dcpl_81 & and_dcpl_84 & and_dcpl_86 & and_dcpl_91
      & and_dcpl_93 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105
      & and_dcpl_109 & and_dcpl_112 & and_dcpl_115 & and_dcpl_118 & and_dcpl_120
      & and_dcpl_121 & and_dcpl_123));
  or_398_nl <= (fsm_output(2)) OR mux_468_cse;
  mux_479_nl <= MUX_s_1_2_2(mux_478_cse, or_398_nl, fsm_output(1));
  and_141_nl <= (NOT mux_479_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_7_nl <= MUX1HOT_s_1_33_2((COMP_LOOP_twiddle_f_11_sva(1)), (VEC_LOOP_acc_10_cse_1_sva(1)),
      (z_out_14(1)), (VEC_LOOP_acc_1_cse_10_sva(1)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(1)),
      (reg_VEC_LOOP_acc_11_psp_2_reg(0)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(1)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(1)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(1)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(1)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(1)), (z_out_17(1)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(1)),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10(1)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(1)),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12(1)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(1)),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14(1)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(1)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(1)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(1)),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19(1)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(1)),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21(1)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(1)),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23(1)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(1)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(1)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(1)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(1)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(1)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(1)), (VEC_LOOP_acc_10_cse_sva_mx0w31(1)),
      STD_LOGIC_VECTOR'( and_dcpl_128 & and_dcpl_36 & and_dcpl_38 & and_141_nl &
      and_dcpl_43 & and_dcpl_46 & and_dcpl_49 & and_dcpl_52 & and_dcpl_57 & and_dcpl_61
      & and_dcpl_63 & VEC_LOOP_or_14_cse & and_dcpl_72 & and_dcpl_74 & and_dcpl_76
      & and_dcpl_78 & and_dcpl_81 & and_dcpl_84 & and_dcpl_86 & and_dcpl_91 & and_dcpl_93
      & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105 &
      and_dcpl_109 & and_dcpl_112 & and_dcpl_115 & and_dcpl_118 & and_dcpl_120 &
      and_dcpl_121 & and_dcpl_123));
  mux_490_nl <= MUX_s_1_2_2(mux_468_cse, mux_485_cse, fsm_output(2));
  mux_498_nl <= MUX_s_1_2_2(mux_478_cse, mux_490_nl, fsm_output(1));
  and_142_nl <= (NOT mux_498_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_9_nl <= MUX1HOT_s_1_32_2((COMP_LOOP_twiddle_f_11_sva(0)), (VEC_LOOP_acc_10_cse_1_sva(0)),
      (z_out_14(0)), (VEC_LOOP_acc_1_cse_10_sva(0)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(0)),
      (VEC_LOOP_acc_10_cse_4_sva_mx0w3(0)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(0)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(0)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(0)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(0)), (z_out_17(0)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(0)),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10(0)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(0)),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12(0)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(0)),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14(0)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(0)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(0)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(0)),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19(0)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(0)),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21(0)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(0)),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23(0)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(0)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(0)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(0)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(0)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(0)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(0)), (VEC_LOOP_acc_10_cse_sva_mx0w31(0)),
      STD_LOGIC_VECTOR'( and_dcpl_128 & and_dcpl_36 & and_dcpl_38 & and_142_nl &
      and_dcpl_43 & and_dcpl_49 & and_dcpl_52 & and_dcpl_57 & and_dcpl_61 & and_dcpl_63
      & VEC_LOOP_or_14_cse & and_dcpl_72 & and_dcpl_74 & and_dcpl_76 & and_dcpl_78
      & and_dcpl_81 & and_dcpl_84 & and_dcpl_86 & and_dcpl_91 & and_dcpl_93 & and_dcpl_96
      & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 &
      and_dcpl_112 & and_dcpl_115 & and_dcpl_118 & and_dcpl_120 & and_dcpl_121 &
      and_dcpl_123));
  vec_rsci_adra_d <= VEC_LOOP_mux1h_10_nl & VEC_LOOP_mux1h_8_nl & VEC_LOOP_mux1h_6_nl
      & VEC_LOOP_mux1h_4_nl & VEC_LOOP_mux1h_2_nl & VEC_LOOP_mux1h_nl & VEC_LOOP_mux1h_1_nl
      & VEC_LOOP_mux1h_3_nl & VEC_LOOP_mux1h_5_nl & VEC_LOOP_mux1h_7_nl & VEC_LOOP_mux1h_9_nl;
  vec_rsci_wea_d <= vec_rsci_wea_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  twiddle_rsci_adra_d <= VEC_LOOP_mux_rmff & COMP_LOOP_twiddle_f_mux1h_138_rmff &
      COMP_LOOP_twiddle_f_and_rmff & COMP_LOOP_twiddle_f_mux1h_28_rmff & COMP_LOOP_twiddle_f_mux1h_55_rmff
      & COMP_LOOP_twiddle_f_mux1h_108_rmff & COMP_LOOP_twiddle_f_mux1h_153_rmff;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  twiddle_h_rsci_adra_d <= VEC_LOOP_mux_rmff & COMP_LOOP_twiddle_f_mux1h_138_rmff
      & COMP_LOOP_twiddle_f_and_rmff & COMP_LOOP_twiddle_f_mux1h_28_rmff & COMP_LOOP_twiddle_f_mux1h_55_rmff
      & COMP_LOOP_twiddle_f_mux1h_108_rmff & COMP_LOOP_twiddle_f_mux1h_153_rmff;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_da_d <= vec_rsci_da_d_reg;
  and_dcpl_254 <= NOT((fsm_output(5)) OR (fsm_output(1)));
  and_dcpl_261 <= (NOT (fsm_output(3))) AND (fsm_output(0));
  and_dcpl_263 <= (fsm_output(5)) AND (NOT (fsm_output(1))) AND and_dcpl_261;
  and_dcpl_266 <= nor_98_cse AND (NOT (fsm_output(4))) AND (NOT (fsm_output(2)))
      AND and_dcpl_263;
  and_dcpl_269 <= nor_98_cse AND and_275_cse AND and_dcpl_263;
  and_dcpl_274 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011")) AND
      and_275_cse AND and_dcpl_254 AND and_dcpl_261;
  nor_183_cse <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_285 <= nor_98_cse AND nor_183_cse AND and_dcpl_53 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_288 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
  and_dcpl_290 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_293 <= and_dcpl_290 AND CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("001"))
      AND and_dcpl_288;
  and_dcpl_297 <= and_dcpl_290 AND CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("110"))
      AND and_dcpl_288;
  and_dcpl_302 <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("01011"))
      AND and_dcpl_288;
  and_dcpl_307 <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("10000"))
      AND and_dcpl_288;
  and_dcpl_317 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00")) AND
      and_dcpl_22;
  and_dcpl_319 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011"));
  and_dcpl_334 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      and_291_cse;
  and_dcpl_339 <= and_dcpl_290 AND CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("010"))
      AND and_dcpl_334;
  and_dcpl_342 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_343 <= and_dcpl_290 AND (fsm_output(6));
  and_dcpl_345 <= and_dcpl_343 AND and_dcpl_342 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("00")) AND and_291_cse;
  and_dcpl_348 <= and_dcpl_343 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_334;
  and_dcpl_352 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_342 AND and_dcpl_334;
  and_dcpl_358 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("010"));
  and_dcpl_362 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00")) AND
      and_291_cse;
  and_dcpl_365 <= and_dcpl_358 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_362;
  and_dcpl_371 <= and_dcpl_319 AND nor_183_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("10")) AND and_291_cse;
  and_dcpl_374 <= and_dcpl_319 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_362;
  and_dcpl_377 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
  and_dcpl_382 <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("00011"))
      AND and_dcpl_377;
  and_dcpl_387 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_390 <= and_dcpl_387 AND CONV_SL_1_1(fsm_output(6 DOWNTO 2)=STD_LOGIC_VECTOR'("00001"))
      AND and_dcpl_22;
  and_dcpl_392 <= and_dcpl_387 AND (fsm_output(6));
  and_dcpl_394 <= and_dcpl_392 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_377;
  and_dcpl_399 <= and_dcpl_392 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1010"))
      AND and_dcpl_22;
  and_dcpl_402 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_22;
  and_dcpl_413 <= and_dcpl_358 AND and_dcpl_342 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("10")) AND and_dcpl_22;
  and_dcpl_414 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_416 <= and_dcpl_358 AND and_dcpl_414 AND and_dcpl_402;
  and_dcpl_422 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_414 AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_22;
  mux_tmp_1031 <= MUX_s_1_2_2(or_869_cse, or_870_cse, fsm_output(7));
  nand_tmp_23 <= NOT((fsm_output(6)) AND (NOT mux_tmp_1031));
  or_767_nl <= (fsm_output(7)) OR (NOT((fsm_output(8)) AND (fsm_output(3))));
  mux_tmp_1033 <= MUX_s_1_2_2(or_767_nl, or_tmp_175, fsm_output(6));
  mux_1033_nl <= MUX_s_1_2_2(mux_tmp_1033, nand_tmp_23, fsm_output(1));
  mux_1031_nl <= MUX_s_1_2_2(nand_tmp_23, mux_437_cse, fsm_output(1));
  mux_tmp_1035 <= MUX_s_1_2_2(mux_1033_nl, mux_1031_nl, fsm_output(5));
  or_768_nl <= (NOT (fsm_output(8))) OR (fsm_output(3));
  mux_1035_nl <= MUX_s_1_2_2(or_768_nl, or_869_cse, fsm_output(7));
  or_tmp_560 <= (fsm_output(6)) OR mux_1035_nl;
  or_tmp_561 <= (fsm_output(6)) OR mux_tmp_1031;
  mux_tmp_1038 <= MUX_s_1_2_2(or_tmp_561, or_tmp_560, fsm_output(1));
  and_dcpl_451 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_452 <= and_dcpl_451 AND nor_95_cse;
  and_dcpl_457 <= and_dcpl_290 AND (fsm_output(6)) AND and_dcpl_342 AND and_dcpl_452;
  and_dcpl_459 <= and_dcpl_451 AND and_dcpl_144;
  and_dcpl_462 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100"));
  and_dcpl_464 <= and_dcpl_462 AND and_dcpl_414 AND and_dcpl_459;
  and_dcpl_466 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00")) AND
      nor_95_cse;
  and_dcpl_469 <= and_dcpl_462 AND and_293_cse AND and_dcpl_466;
  and_dcpl_471 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      nor_95_cse;
  and_dcpl_474 <= and_dcpl_462 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_471;
  and_dcpl_476 <= and_283_cse AND nor_95_cse;
  and_dcpl_478 <= and_dcpl_462 AND and_dcpl_342 AND and_dcpl_476;
  and_dcpl_479 <= and_dcpl_290 AND (NOT (fsm_output(6)));
  and_dcpl_481 <= and_dcpl_479 AND and_dcpl_342 AND and_dcpl_471;
  and_dcpl_485 <= and_dcpl_392 AND and_293_cse;
  and_dcpl_486 <= and_dcpl_485 AND and_283_cse AND and_dcpl_144;
  and_dcpl_487 <= and_dcpl_485 AND and_dcpl_452;
  and_dcpl_489 <= and_dcpl_392 AND and_dcpl_414 AND and_dcpl_466;
  and_dcpl_490 <= and_dcpl_387 AND (NOT (fsm_output(6)));
  and_dcpl_492 <= and_dcpl_490 AND and_dcpl_342 AND and_dcpl_466;
  and_dcpl_494 <= and_dcpl_392 AND and_dcpl_342 AND and_dcpl_459;
  and_dcpl_496 <= and_dcpl_490 AND and_293_cse AND and_dcpl_471;
  and_dcpl_498 <= and_dcpl_490 AND and_dcpl_414 AND and_dcpl_452;
  and_dcpl_500 <= and_dcpl_479 AND and_293_cse AND and_dcpl_459;
  and_dcpl_502 <= and_dcpl_479 AND and_dcpl_414 AND and_dcpl_476;
  and_dcpl_508 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("001"));
  and_dcpl_518 <= and_283_cse AND and_dcpl_144;
  and_dcpl_555 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("101")) AND
      nor_183_cse AND and_dcpl_451 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("00"));
  mux_tmp_1045 <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), fsm_output(6));
  or_tmp_565 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")) OR mux_tmp_1045;
  or_tmp_567 <= (fsm_output(8)) OR (NOT((fsm_output(2)) AND (fsm_output(6))));
  or_775_nl <= (fsm_output(8)) OR (fsm_output(6)) OR (fsm_output(2));
  mux_1045_nl <= MUX_s_1_2_2(or_tmp_567, or_775_nl, fsm_output(7));
  mux_tmp_1047 <= MUX_s_1_2_2(mux_1045_nl, or_tmp_565, fsm_output(4));
  or_638_nl <= (fsm_output(2)) OR (fsm_output(6));
  or_637_nl <= (NOT (fsm_output(2))) OR (fsm_output(6));
  mux_1047_nl <= MUX_s_1_2_2(or_638_nl, or_637_nl, fsm_output(8));
  or_tmp_570 <= (fsm_output(7)) OR mux_1047_nl;
  or_780_nl <= (NOT (fsm_output(8))) OR (fsm_output(6)) OR (fsm_output(2));
  mux_tmp_1049 <= MUX_s_1_2_2(or_780_nl, or_tmp_567, fsm_output(7));
  or_tmp_573 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")) OR mux_tmp_1045;
  mux_1051_nl <= MUX_s_1_2_2(or_tmp_570, or_tmp_573, fsm_output(4));
  mux_tmp_1053 <= MUX_s_1_2_2(mux_tmp_1047, mux_1051_nl, fsm_output(3));
  or_784_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")) OR mux_tmp_1045;
  mux_1055_nl <= MUX_s_1_2_2(or_784_nl, or_tmp_573, fsm_output(4));
  mux_1054_nl <= MUX_s_1_2_2(or_tmp_565, mux_tmp_1049, fsm_output(4));
  mux_1056_nl <= MUX_s_1_2_2(mux_1055_nl, mux_1054_nl, fsm_output(3));
  mux_1057_nl <= MUX_s_1_2_2(mux_1056_nl, mux_tmp_1053, fsm_output(1));
  mux_1049_nl <= MUX_s_1_2_2(mux_tmp_1049, or_tmp_570, fsm_output(4));
  mux_1050_nl <= MUX_s_1_2_2(mux_1049_nl, mux_tmp_1047, fsm_output(3));
  mux_1053_nl <= MUX_s_1_2_2(mux_tmp_1053, mux_1050_nl, fsm_output(1));
  mux_1058_nl <= MUX_s_1_2_2(mux_1057_nl, mux_1053_nl, fsm_output(5));
  and_dcpl_564 <= NOT(mux_1058_nl OR (fsm_output(0)));
  and_dcpl_567 <= and_dcpl_451 AND and_dcpl_22;
  and_dcpl_571 <= and_dcpl_490 AND and_dcpl_414;
  and_dcpl_572 <= and_dcpl_571 AND and_dcpl_567;
  and_dcpl_575 <= and_283_cse AND and_291_cse;
  and_dcpl_580 <= and_dcpl_479 AND nor_183_cse AND and_dcpl_575;
  and_dcpl_582 <= and_dcpl_53 AND and_291_cse;
  and_dcpl_583 <= and_dcpl_479 AND and_dcpl_414;
  and_dcpl_584 <= and_dcpl_583 AND and_dcpl_582;
  and_dcpl_585 <= and_dcpl_451 AND and_291_cse;
  and_dcpl_588 <= and_dcpl_479 AND and_293_cse AND and_dcpl_585;
  and_dcpl_589 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_590 <= and_dcpl_589 AND and_291_cse;
  and_dcpl_592 <= and_dcpl_343 AND nor_183_cse;
  and_dcpl_593 <= and_dcpl_592 AND and_dcpl_590;
  and_dcpl_595 <= and_dcpl_343 AND and_dcpl_342;
  and_dcpl_596 <= and_dcpl_595 AND and_dcpl_575;
  and_dcpl_597 <= and_dcpl_343 AND and_293_cse;
  and_dcpl_598 <= and_dcpl_597 AND and_dcpl_582;
  and_dcpl_600 <= and_dcpl_490 AND nor_183_cse AND and_dcpl_585;
  and_dcpl_601 <= and_dcpl_490 AND and_dcpl_342;
  and_dcpl_602 <= and_dcpl_601 AND and_dcpl_590;
  and_dcpl_603 <= and_dcpl_571 AND and_dcpl_575;
  and_dcpl_605 <= and_dcpl_392 AND nor_183_cse;
  and_dcpl_606 <= and_dcpl_605 AND and_dcpl_582;
  and_dcpl_608 <= and_dcpl_392 AND and_dcpl_342 AND and_dcpl_585;
  and_dcpl_609 <= and_dcpl_392 AND and_dcpl_414;
  and_dcpl_610 <= and_dcpl_609 AND and_dcpl_590;
  and_dcpl_612 <= and_dcpl_485 AND and_dcpl_575;
  and_dcpl_613 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_614 <= and_dcpl_613 AND (NOT (fsm_output(6)));
  and_dcpl_615 <= and_dcpl_614 AND and_dcpl_342;
  and_dcpl_616 <= and_dcpl_615 AND and_dcpl_582;
  and_dcpl_618 <= and_dcpl_614 AND and_dcpl_414 AND and_dcpl_585;
  and_dcpl_619 <= and_dcpl_614 AND and_293_cse;
  and_dcpl_620 <= and_dcpl_619 AND and_dcpl_590;
  and_dcpl_621 <= and_dcpl_589 AND and_dcpl_22;
  and_dcpl_623 <= and_dcpl_479 AND and_dcpl_342 AND and_dcpl_621;
  and_dcpl_624 <= and_dcpl_53 AND and_dcpl_22;
  and_dcpl_625 <= and_dcpl_592 AND and_dcpl_624;
  and_dcpl_627 <= and_dcpl_343 AND and_dcpl_414 AND and_dcpl_621;
  and_dcpl_628 <= and_dcpl_601 AND and_dcpl_624;
  and_dcpl_630 <= and_dcpl_490 AND and_293_cse AND and_dcpl_621;
  and_dcpl_631 <= and_dcpl_609 AND and_dcpl_624;
  and_dcpl_633 <= and_dcpl_614 AND nor_183_cse AND and_dcpl_621;
  and_dcpl_634 <= and_dcpl_619 AND and_dcpl_624;
  and_dcpl_635 <= and_283_cse AND and_dcpl_22;
  and_dcpl_636 <= and_dcpl_583 AND and_dcpl_635;
  and_dcpl_637 <= and_dcpl_597 AND and_dcpl_635;
  and_dcpl_638 <= and_dcpl_605 AND and_dcpl_635;
  and_dcpl_639 <= and_dcpl_615 AND and_dcpl_635;
  and_dcpl_640 <= and_dcpl_595 AND and_dcpl_567;
  and_dcpl_641 <= and_dcpl_485 AND and_dcpl_567;
  and_dcpl_646 <= and_dcpl_613 AND (fsm_output(6)) AND nor_183_cse AND and_dcpl_451
      AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("00"));
  and_dcpl_648 <= and_dcpl_53 AND and_dcpl_144;
  and_dcpl_649 <= and_dcpl_615 AND and_dcpl_648;
  and_dcpl_650 <= and_dcpl_589 AND and_dcpl_144;
  and_dcpl_651 <= and_dcpl_619 AND and_dcpl_650;
  and_dcpl_652 <= and_dcpl_592 AND and_dcpl_650;
  and_dcpl_653 <= and_dcpl_609 AND and_dcpl_650;
  and_dcpl_654 <= and_dcpl_601 AND and_dcpl_650;
  and_dcpl_655 <= and_dcpl_583 AND and_dcpl_648;
  and_dcpl_656 <= and_dcpl_597 AND and_dcpl_648;
  and_dcpl_657 <= and_dcpl_605 AND and_dcpl_648;
  and_dcpl_660 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
  and_739_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("00101")) AND
      and_dcpl_660;
  and_744_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("01010")) AND
      and_dcpl_660;
  and_749_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("01111")) AND
      and_dcpl_660;
  and_dcpl_698 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01")) AND
      and_291_cse;
  and_dcpl_741 <= and_dcpl_462 AND and_dcpl_342;
  and_dcpl_746 <= and_dcpl_462 AND and_293_cse;
  VEC_LOOP_or_5_ssc <= and_dcpl_580 OR and_dcpl_584 OR and_dcpl_588 OR and_dcpl_593
      OR and_dcpl_596 OR and_dcpl_598 OR and_dcpl_600 OR and_dcpl_602 OR and_dcpl_603
      OR and_dcpl_606 OR and_dcpl_608 OR and_dcpl_610 OR and_dcpl_612 OR and_dcpl_616
      OR and_dcpl_618 OR and_dcpl_620;
  mux_1070_nl <= MUX_s_1_2_2(mux_472_cse, mux_369_cse, fsm_output(5));
  mux_tmp_1074 <= MUX_s_1_2_2(mux_484_cse, mux_1070_nl, fsm_output(2));
  mux_tmp_1093 <= MUX_s_1_2_2(mux_975_cse, mux_981_cse, fsm_output(1));
  mux_tmp_1108 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(7));
  or_tmp_612 <= (fsm_output(8)) OR (NOT mux_tmp_1108);
  not_tmp_481 <= MUX_s_1_2_2((fsm_output(5)), (NOT (fsm_output(5))), fsm_output(7));
  or_tmp_648 <= (NOT (fsm_output(7))) OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR
      (fsm_output(1)) OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT (fsm_output(3)));
  or_tmp_649 <= (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(1)) OR (NOT
      (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(3));
  or_tmp_653 <= (fsm_output(7)) OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (NOT
      (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT (fsm_output(3)));
  or_868_nl <= (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(1)) OR (NOT (fsm_output(0)))
      OR (NOT (fsm_output(8))) OR (fsm_output(3));
  or_867_nl <= (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(1)) OR (NOT (fsm_output(0)))
      OR (fsm_output(8)) OR (NOT (fsm_output(3)));
  mux_tmp_1153 <= MUX_s_1_2_2(or_868_nl, or_867_nl, fsm_output(7));
  or_tmp_664 <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(0)))
      OR (fsm_output(8)) OR (NOT (fsm_output(3)));
  COMP_LOOP_twiddle_f_or_52_itm <= and_dcpl_365 OR and_dcpl_371 OR and_dcpl_374;
  COMP_LOOP_twiddle_f_nor_5_itm <= NOT(and_dcpl_382 OR and_dcpl_394);
  COMP_LOOP_twiddle_f_or_itm <= and_dcpl_390 OR and_dcpl_399;
  VEC_LOOP_or_46_itm <= and_dcpl_457 OR and_dcpl_464 OR and_dcpl_469 OR and_dcpl_474
      OR and_dcpl_478 OR and_dcpl_481 OR and_dcpl_486 OR and_dcpl_487 OR and_dcpl_489
      OR and_dcpl_492 OR and_dcpl_494 OR and_dcpl_496 OR and_dcpl_498 OR and_dcpl_500
      OR and_dcpl_502;
  VEC_LOOP_nor_7_itm <= NOT(and_dcpl_572 OR and_dcpl_623 OR and_dcpl_625 OR and_dcpl_627
      OR and_dcpl_628 OR and_dcpl_630 OR and_dcpl_631 OR and_dcpl_633 OR and_dcpl_634
      OR and_dcpl_636 OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639 OR and_dcpl_640
      OR and_dcpl_641 OR and_dcpl_646 OR and_dcpl_649 OR and_dcpl_651 OR and_dcpl_652
      OR and_dcpl_653 OR and_dcpl_654 OR and_dcpl_655 OR and_dcpl_656 OR and_dcpl_657);
  VEC_LOOP_or_33_itm <= and_dcpl_623 OR and_dcpl_625 OR and_dcpl_627 OR and_dcpl_628
      OR and_dcpl_630 OR and_dcpl_631 OR and_dcpl_633 OR and_dcpl_634;
  VEC_LOOP_or_36_itm <= and_dcpl_636 OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639;
  VEC_LOOP_or_48_itm <= and_dcpl_649 OR and_dcpl_655 OR and_dcpl_656 OR and_dcpl_657;
  VEC_LOOP_or_56_itm <= and_dcpl_636 OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639
      OR and_dcpl_649 OR and_dcpl_655 OR and_dcpl_656 OR and_dcpl_657;
  VEC_LOOP_or_60_itm <= and_dcpl_640 OR and_dcpl_641 OR and_dcpl_652 OR and_dcpl_653;
  VEC_LOOP_or_61_itm <= and_dcpl_572 OR and_dcpl_654;
  VEC_LOOP_or_78_itm <= and_739_cse OR and_749_cse;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        VEC_LOOP_mult_vec_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(63 DOWNTO 32)),
            (vec_rsci_qa_d_mxwt(31 DOWNTO 0)), and_dcpl_248);
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
        reg_twiddle_rsci_oswt_1_cse <= '0';
        reg_complete_rsci_oswt_cse <= '0';
        reg_vec_rsc_triosy_obj_iswt0_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        reg_ensig_cgo_2_cse <= '0';
      ELSIF ( complete_rsci_wen_comp = '1' ) THEN
        reg_run_rsci_oswt_cse <= NOT(or_dcpl_168 OR (fsm_output(2)) OR (fsm_output(8))
            OR (fsm_output(1)) OR (fsm_output(0)));
        reg_vec_rsci_oswt_cse <= NOT mux_368_itm;
        reg_vec_rsci_oswt_1_cse <= and_25_rmff;
        reg_twiddle_rsci_oswt_cse <= and_152_rmff;
        reg_twiddle_rsci_oswt_1_cse <= and_157_rmff;
        reg_complete_rsci_oswt_cse <= and_dcpl_60 AND and_dcpl_116 AND CONV_SL_1_1(fsm_output(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND STAGE_LOOP_acc_itm_4_1;
        reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_201;
        reg_ensig_cgo_cse <= NOT mux_515_itm;
        reg_ensig_cgo_2_cse <= NOT mux_630_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((and_dcpl_28 AND and_dcpl_31 AND nor_95_cse)
          OR STAGE_LOOP_i_3_0_sva_mx0c1)) = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_674_nl) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_tmp_677) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_1061_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_k_10_5_sva_4_0 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), (z_out_14(4
            DOWNTO 0)), COMP_LOOP_k_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_684_nl) = '1' ) THEN
        COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= z_out_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_693_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_9_twiddle_f_lshift_ncse_sva <= z_out_8(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_700_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_17_twiddle_f_lshift_itm <= MUX_v_6_2_2(COMP_LOOP_17_twiddle_f_lshift_itm_1,
            (z_out_14(5 DOWNTO 0)), and_dcpl_88);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_216 OR VEC_LOOP_acc_1_cse_10_sva_mx0c1
          OR and_dcpl_38 OR VEC_LOOP_acc_1_cse_10_sva_mx0c3 OR and_dcpl_49 OR and_dcpl_57
          OR and_dcpl_63 OR and_dcpl_72 OR and_dcpl_76 OR and_dcpl_81 OR and_dcpl_86
          OR and_dcpl_91 OR and_dcpl_96 OR and_dcpl_101 OR and_dcpl_105 OR and_dcpl_109
          OR and_dcpl_115 OR and_dcpl_120 OR and_dcpl_123)) = '1' ) THEN
        VEC_LOOP_acc_1_cse_10_sva <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            COMP_LOOP_twiddle_f_mux1h_161_nl, VEC_LOOP_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_1063_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_ncse_sva_7_4 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt(7
            DOWNTO 4);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_1067_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt(3
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_VEC_LOOP_j_10_10_0_tmp <= STD_LOGIC_VECTOR'( "000000");
      ELSIF ( ((NOT mux_1087_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        reg_VEC_LOOP_j_10_10_0_tmp <= VEC_LOOP_j_VEC_LOOP_j_mux_rgt(10 DOWNTO 5);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_10_10_0_sva_1_4_0 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( ((NOT mux_1104_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_j_10_10_0_sva_1_4_0 <= VEC_LOOP_j_VEC_LOOP_j_mux_rgt(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_804_nl) = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= z_out_9(8 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_1123_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva_8 <= MUX_s_1_2_2((z_out_1(8)), (z_out_14(8)), COMP_LOOP_twiddle_f_or_2_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_1136_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        reg_VEC_LOOP_acc_11_psp_1_reg <= MUX_s_1_2_2((z_out_1(7)), (z_out_14(7)),
            COMP_LOOP_twiddle_f_or_63_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_1148_nl) AND (fsm_output(0)) AND complete_rsci_wen_comp) = '1'
          ) THEN
        reg_VEC_LOOP_acc_11_psp_2_reg <= MUX_v_7_2_2((z_out_1(6 DOWNTO 0)), (z_out_14(6
            DOWNTO 0)), COMP_LOOP_twiddle_f_or_64_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_twiddle_help_and_itm = '1' ) THEN
        COMP_LOOP_twiddle_help_1_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt(63
            DOWNTO 32)), (twiddle_h_rsci_qa_d_mxwt(31 DOWNTO 0)), not_tmp_267);
        COMP_LOOP_twiddle_f_1_sva <= MUX1HOT_v_32_3_2((twiddle_rsci_qa_d_mxwt(63
            DOWNTO 32)), COMP_LOOP_1_modulo_sub_cmp_return_rsc_z, (twiddle_rsci_qa_d_mxwt(31
            DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_227 & and_243_nl & not_tmp_267));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_1165_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_twiddle_f_11_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            VEC_LOOP_mux1h_15_nl, COMP_LOOP_twiddle_f_nand_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (and_dcpl_29 OR and_dcpl_201)) = '1' )
          THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm <= MUX_s_1_2_2((z_out_12_22_10(12)),
            run_rsci_ivld_mxwt, and_dcpl_201);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_29 OR and_dcpl_38 OR and_dcpl_43
          OR and_dcpl_49 OR and_dcpl_52 OR and_dcpl_57 OR and_dcpl_61 OR and_dcpl_63
          OR and_dcpl_66 OR and_dcpl_72 OR and_dcpl_74 OR and_dcpl_76 OR and_dcpl_78
          OR and_dcpl_81 OR and_dcpl_84 OR and_dcpl_86 OR and_dcpl_88 OR and_dcpl_91
          OR and_dcpl_93 OR and_dcpl_96 OR and_dcpl_98 OR and_dcpl_101 OR and_dcpl_103
          OR and_dcpl_105 OR and_dcpl_107 OR and_dcpl_109 OR and_dcpl_112 OR and_dcpl_115
          OR and_dcpl_118 OR and_dcpl_120 OR and_dcpl_121 OR and_dcpl_123)) = '1'
          ) THEN
        VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_10_29_2(z_out_17, VEC_LOOP_acc_10_cse_2_sva_mx0w1,
            VEC_LOOP_acc_10_cse_3_sva_mx0w2, VEC_LOOP_acc_10_cse_4_sva_mx0w3, VEC_LOOP_acc_10_cse_5_sva_mx0w4,
            VEC_LOOP_acc_10_cse_6_sva_mx0w5, VEC_LOOP_acc_10_cse_7_sva_mx0w6, VEC_LOOP_acc_10_cse_8_sva_mx0w7,
            VEC_LOOP_acc_10_cse_10_sva_mx0w9, VEC_LOOP_acc_10_cse_11_sva_mx0w10,
            VEC_LOOP_acc_10_cse_12_sva_mx0w11, VEC_LOOP_acc_10_cse_13_sva_mx0w12,
            VEC_LOOP_acc_10_cse_14_sva_mx0w13, VEC_LOOP_acc_10_cse_15_sva_mx0w14,
            VEC_LOOP_acc_10_cse_16_sva_mx0w15, VEC_LOOP_acc_10_cse_18_sva_mx0w17,
            VEC_LOOP_acc_10_cse_19_sva_mx0w18, VEC_LOOP_acc_10_cse_20_sva_mx0w19,
            VEC_LOOP_acc_10_cse_21_sva_mx0w20, VEC_LOOP_acc_10_cse_22_sva_mx0w21,
            VEC_LOOP_acc_10_cse_23_sva_mx0w22, VEC_LOOP_acc_10_cse_24_sva_mx0w23,
            VEC_LOOP_acc_10_cse_26_sva_mx0w25, VEC_LOOP_acc_10_cse_27_sva_mx0w26,
            VEC_LOOP_acc_10_cse_28_sva_mx0w27, VEC_LOOP_acc_10_cse_29_sva_mx0w28,
            VEC_LOOP_acc_10_cse_30_sva_mx0w29, VEC_LOOP_acc_10_cse_31_sva_mx0w30,
            VEC_LOOP_acc_10_cse_sva_mx0w31, STD_LOGIC_VECTOR'( VEC_LOOP_or_20_nl
            & and_dcpl_38 & and_dcpl_43 & and_dcpl_49 & and_dcpl_52 & and_dcpl_57
            & and_dcpl_61 & and_dcpl_63 & and_dcpl_72 & and_dcpl_74 & and_dcpl_76
            & and_dcpl_78 & and_dcpl_81 & and_dcpl_84 & and_dcpl_86 & and_dcpl_91
            & and_dcpl_93 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103
            & and_dcpl_105 & and_dcpl_109 & and_dcpl_112 & and_dcpl_115 & and_dcpl_118
            & and_dcpl_120 & and_dcpl_121 & and_dcpl_123));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT((NOT mux_971_nl) AND nor_132_cse AND
          (NOT (fsm_output(8)))))) = '1' ) THEN
        COMP_LOOP_twiddle_f_9_sva <= MUX1HOT_v_32_3_2(z_out_13, COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
            (twiddle_rsci_qa_d_mxwt(31 DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_29
            & and_251_nl & and_dcpl_159));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((mux_972_nl AND not_tmp_69 AND and_dcpl_25
          AND (NOT (fsm_output(8))) AND (NOT (fsm_output(0)))) OR and_dcpl_248))
          = '1' ) THEN
        factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(31 DOWNTO 0)), (vec_rsci_qa_d_mxwt(63
            DOWNTO 32)), and_dcpl_248);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT mux_1020_nl)) = '1' ) THEN
        COMP_LOOP_twiddle_help_11_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt(63
            DOWNTO 32)), (twiddle_h_rsci_qa_d_mxwt(31 DOWNTO 0)), and_dcpl_240);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(mux_1029_nl AND and_dcpl_58 AND and_dcpl_167)))
          = '1' ) THEN
        COMP_LOOP_twiddle_help_9_sva <= twiddle_h_rsci_qa_d_mxwt(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  and_217_nl <= (fsm_output(8)) AND or_748_cse;
  mux_671_nl <= MUX_s_1_2_2(and_217_nl, nor_tmp_29, fsm_output(1));
  mux_674_nl <= MUX_s_1_2_2(mux_tmp_673, mux_671_nl, fsm_output(0));
  COMP_LOOP_k_not_nl <= NOT mux_tmp_677;
  nor_221_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000000")));
  or_785_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(7))
      OR (fsm_output(4));
  mux_1060_nl <= MUX_s_1_2_2((fsm_output(7)), or_785_nl, fsm_output(6));
  mux_1061_nl <= MUX_s_1_2_2(nor_221_nl, mux_1060_nl, fsm_output(8));
  mux_682_nl <= MUX_s_1_2_2(not_tmp_230, mux_tmp_678, fsm_output(8));
  mux_683_nl <= MUX_s_1_2_2(mux_tmp_680, mux_682_nl, fsm_output(1));
  and_220_nl <= (fsm_output(8)) AND mux_tmp_678;
  mux_681_nl <= MUX_s_1_2_2(mux_tmp_680, and_220_nl, fsm_output(1));
  mux_684_nl <= MUX_s_1_2_2(mux_683_nl, mux_681_nl, fsm_output(0));
  mux_692_nl <= MUX_s_1_2_2(and_dcpl_27, nor_tmp_11, fsm_output(5));
  and_316_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("111"));
  or_533_nl <= and_291_cse OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  mux_693_nl <= MUX_s_1_2_2(mux_692_nl, and_316_nl, or_533_nl);
  and_284_nl <= (and_285_cse OR (fsm_output(4)) OR (fsm_output(6))) AND (fsm_output(7));
  mux_698_nl <= MUX_s_1_2_2(mux_tmp_695, and_284_nl, fsm_output(2));
  mux_699_nl <= MUX_s_1_2_2(mux_tmp_696, mux_698_nl, fsm_output(1));
  and_286_nl <= ((or_739_cse AND (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(6)))
      AND (fsm_output(7));
  mux_697_nl <= MUX_s_1_2_2(mux_tmp_696, and_286_nl, fsm_output(1));
  mux_700_nl <= MUX_s_1_2_2(mux_699_nl, mux_697_nl, fsm_output(0));
  COMP_LOOP_twiddle_f_or_1_nl <= and_dcpl_38 OR and_dcpl_49 OR and_dcpl_57 OR and_dcpl_63
      OR and_dcpl_72 OR and_dcpl_76 OR and_dcpl_81 OR and_dcpl_86 OR and_dcpl_91
      OR and_dcpl_96 OR and_dcpl_101 OR and_dcpl_105 OR and_dcpl_109 OR and_dcpl_115
      OR and_dcpl_120 OR and_dcpl_123;
  COMP_LOOP_twiddle_f_mux1h_161_nl <= MUX1HOT_v_10_3_2(z_out_1, z_out_14, ((reg_VEC_LOOP_j_10_10_0_tmp(4
      DOWNTO 0)) & VEC_LOOP_j_10_10_0_sva_1_4_0), STD_LOGIC_VECTOR'( and_dcpl_216
      & COMP_LOOP_twiddle_f_or_1_nl & VEC_LOOP_acc_1_cse_10_sva_mx0c3));
  VEC_LOOP_not_nl <= NOT VEC_LOOP_acc_1_cse_10_sva_mx0c1;
  nor_220_nl <= NOT((CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111")))
      OR (fsm_output(4)) OR (fsm_output(6)));
  mux_1062_nl <= MUX_s_1_2_2(nor_220_nl, or_788_cse, fsm_output(8));
  mux_1063_nl <= MUX_s_1_2_2(mux_1062_nl, (fsm_output(8)), or_787_cse);
  nor_218_nl <= NOT((fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(6)));
  or_792_nl <= COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm OR (NOT (fsm_output(3)))
      OR (fsm_output(4)) OR (fsm_output(6));
  mux_1064_nl <= MUX_s_1_2_2(or_788_cse, or_792_nl, fsm_output(2));
  nor_219_nl <= NOT((fsm_output(1)) OR mux_1064_nl);
  mux_1065_nl <= MUX_s_1_2_2(nor_218_nl, nor_219_nl, fsm_output(0));
  mux_1066_nl <= MUX_s_1_2_2(mux_1065_nl, or_788_cse, fsm_output(8));
  mux_1067_nl <= MUX_s_1_2_2(mux_1066_nl, (fsm_output(8)), or_787_cse);
  or_805_nl <= (NOT (fsm_output(1))) OR (fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (fsm_output(8)) OR (fsm_output(6));
  mux_1082_nl <= MUX_s_1_2_2(or_584_cse_1, or_tmp_156, fsm_output(4));
  mux_1083_nl <= MUX_s_1_2_2(mux_1082_nl, mux_1081_cse, fsm_output(5));
  mux_1084_nl <= MUX_s_1_2_2(mux_474_cse, mux_1083_nl, fsm_output(2));
  mux_1085_nl <= MUX_s_1_2_2(mux_tmp_1074, mux_1084_nl, fsm_output(1));
  mux_1086_nl <= MUX_s_1_2_2(or_805_nl, mux_1085_nl, fsm_output(0));
  or_803_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (fsm_output(8)) OR (fsm_output(6));
  mux_1076_nl <= MUX_s_1_2_2(or_583_cse_1, or_tmp_161, fsm_output(4));
  mux_1077_nl <= MUX_s_1_2_2(mux_1076_nl, mux_469_cse, fsm_output(5));
  mux_1078_nl <= MUX_s_1_2_2(mux_1077_nl, mux_474_cse, fsm_output(2));
  mux_1079_nl <= MUX_s_1_2_2(mux_1078_nl, mux_tmp_1074, fsm_output(1));
  mux_1080_nl <= MUX_s_1_2_2(or_803_nl, mux_1079_nl, fsm_output(0));
  mux_1087_nl <= MUX_s_1_2_2(mux_1086_nl, mux_1080_nl, fsm_output(3));
  or_813_nl <= (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(5))
      OR (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(6));
  mux_1100_nl <= MUX_s_1_2_2(mux_457_cse, mux_tmp_451, fsm_output(3));
  mux_1101_nl <= MUX_s_1_2_2(mux_1100_nl, mux_985_cse, fsm_output(1));
  mux_1102_nl <= MUX_s_1_2_2(mux_tmp_1093, mux_1101_nl, fsm_output(2));
  mux_1103_nl <= MUX_s_1_2_2(or_813_nl, mux_1102_nl, fsm_output(0));
  mux_1098_nl <= MUX_s_1_2_2(mux_985_cse, mux_1095_cse, fsm_output(1));
  mux_1099_nl <= MUX_s_1_2_2(mux_1098_nl, mux_tmp_1093, fsm_output(2));
  nand_62_nl <= NOT((fsm_output(0)) AND (NOT mux_1099_nl));
  mux_1104_nl <= MUX_s_1_2_2(mux_1103_nl, nand_62_nl, fsm_output(4));
  mux_803_nl <= MUX_s_1_2_2(or_tmp_355, or_tmp_1, and_283_cse);
  mux_804_nl <= MUX_s_1_2_2(not_tmp_230, mux_803_nl, fsm_output(8));
  mux_1118_nl <= MUX_s_1_2_2(mux_1024_cse, or_tmp_612, fsm_output(6));
  mux_1116_nl <= MUX_s_1_2_2(mux_tmp_1108, or_728_cse, fsm_output(8));
  mux_1117_nl <= MUX_s_1_2_2(mux_1116_nl, or_834_cse, fsm_output(6));
  mux_1119_nl <= MUX_s_1_2_2(mux_1118_nl, mux_1117_nl, fsm_output(4));
  mux_1120_nl <= MUX_s_1_2_2(mux_1025_cse, mux_1119_nl, fsm_output(0));
  or_827_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)/=STD_LOGIC_VECTOR'("00000"));
  mux_1115_nl <= MUX_s_1_2_2(mux_1025_cse, or_827_nl, fsm_output(0));
  mux_1121_nl <= MUX_s_1_2_2(mux_1120_nl, mux_1115_nl, fsm_output(1));
  nand_67_nl <= NOT((fsm_output(4)) AND (fsm_output(6)) AND (NOT (fsm_output(8)))
      AND mux_tmp_1108);
  mux_1110_nl <= MUX_s_1_2_2(mux_1021_cse, or_tmp_612, fsm_output(4));
  mux_1111_nl <= MUX_s_1_2_2(nand_67_nl, mux_1110_nl, fsm_output(0));
  or_823_nl <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6)))
      OR (fsm_output(8)) OR (NOT mux_tmp_1108);
  mux_1112_nl <= MUX_s_1_2_2(mux_1111_nl, or_823_nl, fsm_output(1));
  mux_1122_nl <= MUX_s_1_2_2(mux_1121_nl, mux_1112_nl, fsm_output(3));
  nand_68_nl <= NOT((CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")))
      AND (fsm_output(4)) AND (fsm_output(6)) AND (NOT (fsm_output(8))) AND mux_tmp_1108);
  or_878_nl <= nor_95_cse OR mux_1023_cse;
  mux_1109_nl <= MUX_s_1_2_2(nand_68_nl, or_878_nl, fsm_output(3));
  mux_1123_nl <= MUX_s_1_2_2(mux_1122_nl, mux_1109_nl, fsm_output(2));
  COMP_LOOP_twiddle_f_or_63_nl <= COMP_LOOP_twiddle_f_or_2_rgt OR mux_827_ssc;
  nor_213_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(8)) OR not_tmp_481);
  nor_214_nl <= NOT((fsm_output(6)) OR mux_1024_cse);
  mux_1133_nl <= MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output(4));
  nand_65_nl <= NOT((fsm_output(0)) AND mux_1133_nl);
  or_843_nl <= (NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(8))
      OR (fsm_output(7)) OR (fsm_output(5));
  mux_1134_nl <= MUX_s_1_2_2(nand_65_nl, or_843_nl, fsm_output(1));
  or_842_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(8))
      OR not_tmp_481;
  or_840_nl <= (fsm_output(8)) OR not_tmp_481;
  mux_1129_nl <= MUX_s_1_2_2(mux_1021_cse, or_840_nl, fsm_output(4));
  mux_1130_nl <= MUX_s_1_2_2(or_842_nl, mux_1129_nl, fsm_output(0));
  or_839_nl <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6)))
      OR (fsm_output(8)) OR not_tmp_481;
  mux_1131_nl <= MUX_s_1_2_2(mux_1130_nl, or_839_nl, fsm_output(1));
  mux_1135_nl <= MUX_s_1_2_2(mux_1134_nl, mux_1131_nl, fsm_output(3));
  or_837_nl <= nor_95_cse OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(8))
      OR not_tmp_481;
  or_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR mux_1023_cse;
  mux_1128_nl <= MUX_s_1_2_2(or_837_nl, or_nl, fsm_output(3));
  mux_1136_nl <= MUX_s_1_2_2(mux_1135_nl, mux_1128_nl, fsm_output(2));
  mux_690_nl <= MUX_s_1_2_2(or_tmp_186, mux_tmp_686, fsm_output(1));
  mux_780_nl <= MUX_s_1_2_2(mux_tmp_686, or_739_cse, fsm_output(1));
  mux_828_nl <= MUX_s_1_2_2(mux_690_nl, mux_780_nl, fsm_output(0));
  COMP_LOOP_twiddle_f_or_64_nl <= COMP_LOOP_twiddle_f_or_2_rgt OR mux_827_ssc OR
      ((NOT mux_828_nl) AND xor_dcpl AND and_dcpl_231 AND (NOT (fsm_output(8))));
  mux_1146_nl <= MUX_s_1_2_2(mux_1145_cse, mux_1143_cse, fsm_output(2));
  or_857_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (fsm_output(6)) OR (fsm_output(8));
  mux_1147_nl <= MUX_s_1_2_2(mux_1146_nl, or_857_nl, fsm_output(1));
  nand_66_nl <= NOT((fsm_output(4)) AND (fsm_output(7)) AND (fsm_output(6)) AND (NOT
      (fsm_output(8))));
  mux_1138_nl <= MUX_s_1_2_2(nand_66_nl, mux_472_cse, fsm_output(3));
  mux_1142_nl <= MUX_s_1_2_2(mux_1141_cse, mux_1138_nl, fsm_output(2));
  or_856_nl <= (fsm_output(1)) OR mux_1142_nl;
  mux_1148_nl <= MUX_s_1_2_2(mux_1147_nl, or_856_nl, fsm_output(5));
  and_243_nl <= and_dcpl_65 AND and_dcpl_40;
  or_630_nl <= (fsm_output(8)) OR (fsm_output(2)) OR (NOT((fsm_output(3)) AND mux_tmp_517));
  mux_889_nl <= MUX_s_1_2_2(mux_tmp_516, or_630_nl, fsm_output(1));
  and_248_nl <= (NOT mux_889_nl) AND nor_132_cse AND (fsm_output(0));
  VEC_LOOP_mux1h_15_nl <= MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_9_sva, (twiddle_rsci_qa_d_mxwt(63 DOWNTO 32)), (twiddle_rsci_qa_d_mxwt(31
      DOWNTO 0)), STD_LOGIC_VECTOR'( and_248_nl & and_dcpl_153 & and_dcpl_154 & and_dcpl_240));
  COMP_LOOP_twiddle_f_nand_nl <= NOT(and_dcpl_28 AND and_dcpl_23 AND nor_95_cse);
  mux_1162_nl <= MUX_s_1_2_2(or_tmp_664, or_tmp_653, fsm_output(5));
  or_877_nl <= (fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(8)))
      OR (fsm_output(3));
  mux_1160_nl <= MUX_s_1_2_2(or_877_nl, or_tmp_649, fsm_output(7));
  mux_1161_nl <= MUX_s_1_2_2(mux_1160_nl, or_tmp_648, fsm_output(5));
  mux_1163_nl <= MUX_s_1_2_2(mux_1162_nl, mux_1161_nl, fsm_output(6));
  or_876_nl <= (fsm_output(5)) OR mux_tmp_1153;
  or_873_nl <= (fsm_output(7)) OR (NOT (reg_VEC_LOOP_j_10_10_0_tmp(5))) OR (fsm_output(1))
      OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(3));
  mux_1158_nl <= MUX_s_1_2_2(or_tmp_664, or_873_nl, fsm_output(5));
  mux_1159_nl <= MUX_s_1_2_2(or_876_nl, mux_1158_nl, fsm_output(6));
  mux_1164_nl <= MUX_s_1_2_2(mux_1163_nl, mux_1159_nl, fsm_output(4));
  mux_1154_nl <= MUX_s_1_2_2(or_870_cse, or_869_cse, fsm_output(0));
  or_871_nl <= (fsm_output(1)) OR mux_1154_nl;
  mux_1155_nl <= MUX_s_1_2_2(or_871_nl, or_tmp_649, fsm_output(7));
  mux_1156_nl <= MUX_s_1_2_2(mux_1155_nl, mux_tmp_1153, fsm_output(5));
  or_872_nl <= (fsm_output(6)) OR mux_1156_nl;
  or_865_nl <= (fsm_output(7)) OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(3));
  mux_1151_nl <= MUX_s_1_2_2(or_865_nl, or_tmp_653, fsm_output(5));
  or_862_nl <= (fsm_output(1)) OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT
      (fsm_output(3)));
  mux_1149_nl <= MUX_s_1_2_2(or_862_nl, or_tmp_649, fsm_output(7));
  mux_1150_nl <= MUX_s_1_2_2(mux_1149_nl, or_tmp_648, fsm_output(5));
  mux_1152_nl <= MUX_s_1_2_2(mux_1151_nl, mux_1150_nl, fsm_output(6));
  mux_1157_nl <= MUX_s_1_2_2(or_872_nl, mux_1152_nl, fsm_output(4));
  mux_1165_nl <= MUX_s_1_2_2(mux_1164_nl, mux_1157_nl, fsm_output(2));
  VEC_LOOP_or_20_nl <= and_dcpl_29 OR and_dcpl_66 OR and_dcpl_88 OR and_dcpl_107;
  mux_960_nl <= MUX_s_1_2_2(nand_tmp_19, mux_474_cse, fsm_output(3));
  mux_956_nl <= MUX_s_1_2_2(or_685_cse, mux_469_cse, fsm_output(5));
  mux_957_nl <= MUX_s_1_2_2(mux_956_nl, mux_tmp_467, fsm_output(3));
  mux_961_nl <= MUX_s_1_2_2(mux_960_nl, mux_957_nl, fsm_output(2));
  mux_954_nl <= MUX_s_1_2_2(mux_tmp_467, nand_tmp_19, fsm_output(3));
  mux_955_nl <= MUX_s_1_2_2(mux_954_nl, mux_485_cse, fsm_output(2));
  mux_962_nl <= MUX_s_1_2_2(mux_961_nl, mux_955_nl, fsm_output(1));
  and_251_nl <= (NOT mux_962_nl) AND (fsm_output(0));
  mux_969_nl <= MUX_s_1_2_2(mux_tmp_966, mux_tmp_964, fsm_output(2));
  mux_970_nl <= MUX_s_1_2_2((NOT mux_969_nl), mux_tmp_965, fsm_output(1));
  and_272_nl <= or_736_cse AND (fsm_output(6));
  mux_967_nl <= MUX_s_1_2_2(mux_tmp_966, and_272_nl, fsm_output(2));
  mux_968_nl <= MUX_s_1_2_2((NOT mux_967_nl), mux_tmp_965, fsm_output(1));
  mux_971_nl <= MUX_s_1_2_2(mux_970_nl, mux_968_nl, fsm_output(0));
  nor_83_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(4))));
  nor_84_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)));
  mux_972_nl <= MUX_s_1_2_2(nor_83_nl, nor_84_nl, fsm_output(1));
  or_722_nl <= (fsm_output(5)) OR and_322_cse;
  or_721_nl <= (fsm_output(5)) OR mux_tmp_1011;
  mux_1018_nl <= MUX_s_1_2_2(or_722_nl, or_721_nl, fsm_output(6));
  or_735_nl <= (fsm_output(7)) OR mux_1018_nl;
  nor_80_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR
      (CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111")) AND or_tmp_527));
  mux_1019_nl <= MUX_s_1_2_2(or_735_nl, nor_80_nl, fsm_output(8));
  nor_81_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  mux_1013_nl <= MUX_s_1_2_2(nor_81_nl, and_300_cse, fsm_output(4));
  nand_23_nl <= NOT((fsm_output(3)) AND mux_1013_nl);
  mux_1014_nl <= MUX_s_1_2_2(and_322_cse, nand_23_nl, fsm_output(5));
  mux_1012_nl <= MUX_s_1_2_2(mux_tmp_1011, or_tmp_530, fsm_output(5));
  mux_1015_nl <= MUX_s_1_2_2(mux_1014_nl, mux_1012_nl, fsm_output(6));
  or_717_nl <= (NOT (fsm_output(4))) OR (fsm_output(1)) OR (fsm_output(2));
  mux_1008_nl <= MUX_s_1_2_2(or_tmp_529, or_717_nl, fsm_output(3));
  or_716_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0110"));
  mux_1009_nl <= MUX_s_1_2_2(mux_1008_nl, or_716_nl, fsm_output(5));
  or_714_nl <= (fsm_output(3)) OR mux_tmp_1006;
  nand_20_nl <= NOT((fsm_output(3)) AND (NOT mux_tmp_1006));
  mux_1007_nl <= MUX_s_1_2_2(or_714_nl, nand_20_nl, fsm_output(5));
  mux_1010_nl <= MUX_s_1_2_2(mux_1009_nl, mux_1007_nl, fsm_output(6));
  mux_1016_nl <= MUX_s_1_2_2(mux_1015_nl, mux_1010_nl, fsm_output(7));
  and_259_nl <= (fsm_output(4)) AND or_tmp_527;
  mux_1004_nl <= MUX_s_1_2_2((NOT or_tmp_529), and_259_nl, fsm_output(3));
  mux_1005_nl <= MUX_s_1_2_2((NOT or_tmp_530), mux_1004_nl, fsm_output(5));
  nor_82_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR
      mux_1005_nl);
  mux_1017_nl <= MUX_s_1_2_2(mux_1016_nl, nor_82_nl, fsm_output(8));
  and_269_nl <= (reg_VEC_LOOP_j_10_10_0_tmp(5)) AND (fsm_output(0));
  mux_1020_nl <= MUX_s_1_2_2(mux_1019_nl, mux_1017_nl, and_269_nl);
  or_759_nl <= and_283_cse OR (fsm_output(4));
  mux_1027_nl <= MUX_s_1_2_2((fsm_output(4)), (NOT (fsm_output(4))), fsm_output(3));
  mux_1028_nl <= MUX_s_1_2_2(or_736_cse, mux_1027_nl, fsm_output(2));
  mux_1029_nl <= MUX_s_1_2_2(or_759_nl, mux_1028_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_9_nl <= (NOT((nor_98_cse AND (NOT (fsm_output(4)))
      AND (fsm_output(2)) AND and_dcpl_254 AND (fsm_output(3)) AND (fsm_output(0)))
      OR and_dcpl_266 OR and_dcpl_269)) OR and_dcpl_274;
  COMP_LOOP_twiddle_f_mux_7_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( "01"), STD_LOGIC_VECTOR'(
      "10"), and_dcpl_266);
  COMP_LOOP_twiddle_f_or_65_nl <= and_dcpl_269 OR and_dcpl_274;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_10_nl <= MUX_v_2_2_2(COMP_LOOP_twiddle_f_mux_7_nl,
      STD_LOGIC_VECTOR'("11"), COMP_LOOP_twiddle_f_or_65_nl);
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0 & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_9_nl
      & '0' & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_10_nl & '1')), 10));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_5_nl <= (z_out_9(9)) AND (NOT and_dcpl_285);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl <= (COMP_LOOP_k_10_5_sva_4_0(4))
      AND (NOT and_dcpl_285);
  COMP_LOOP_twiddle_f_mux_8_nl <= MUX_v_4_2_2((COMP_LOOP_k_10_5_sva_4_0(3 DOWNTO
      0)), (COMP_LOOP_k_10_5_sva_4_0(4 DOWNTO 1)), and_dcpl_285);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl <= (COMP_LOOP_k_10_5_sva_4_0(0))
      AND and_dcpl_285;
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_5_nl
      & (z_out_9(8 DOWNTO 0))) * UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl
      & COMP_LOOP_twiddle_f_mux_8_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl
      & STD_LOGIC_VECTOR'( "0001"))), 10));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl <= (NOT(and_dcpl_293 OR and_dcpl_297))
      OR and_dcpl_302 OR and_dcpl_307;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl <= (NOT(and_dcpl_293 OR and_dcpl_302))
      OR and_dcpl_297 OR and_dcpl_307;
  z_out_2_7_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_5_twiddle_f_lshift_ncse_sva_7_4
      & COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0) * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl
      & '1')), 8));
  and_860_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("001")) AND
      nor_183_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_22;
  and_861_nl <= and_dcpl_319 AND nor_183_cse AND and_dcpl_317;
  and_862_nl <= and_dcpl_319 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"))
      AND and_dcpl_22;
  and_863_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("10001")) AND
      and_dcpl_317;
  COMP_LOOP_twiddle_f_mux1h_347_nl <= MUX1HOT_v_4_4_2(STD_LOGIC_VECTOR'( "0100"),
      STD_LOGIC_VECTOR'( "1010"), STD_LOGIC_VECTOR'( "1101"), STD_LOGIC_VECTOR'(
      "1110"), STD_LOGIC_VECTOR'( and_860_nl & and_861_nl & and_862_nl & and_863_nl));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0 & COMP_LOOP_twiddle_f_mux1h_347_nl & '1')),
      10));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl <= (NOT(and_dcpl_339 OR and_dcpl_345
      OR and_dcpl_348)) OR and_dcpl_352;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl <= (NOT and_dcpl_339) OR and_dcpl_345
      OR and_dcpl_348 OR and_dcpl_352;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl <= (NOT and_dcpl_345) OR and_dcpl_339
      OR and_dcpl_348 OR and_dcpl_352;
  z_out_4_8_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_3_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0 & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl
      & '1')), 9));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_12_nl <= MUX_v_9_2_2((STD_LOGIC_VECTOR'(
      "000") & COMP_LOOP_17_twiddle_f_lshift_itm), COMP_LOOP_3_twiddle_f_lshift_ncse_sva,
      COMP_LOOP_twiddle_f_or_52_itm);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_13_nl <= MUX_v_5_2_2((STD_LOGIC_VECTOR'(
      "000") & (COMP_LOOP_k_10_5_sva_4_0(4 DOWNTO 3))), COMP_LOOP_k_10_5_sva_4_0,
      COMP_LOOP_twiddle_f_or_52_itm);
  and_864_nl <= and_dcpl_358 AND nor_183_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("11")) AND and_291_cse;
  COMP_LOOP_twiddle_f_mux1h_348_nl <= MUX1HOT_v_3_4_2((COMP_LOOP_k_10_5_sva_4_0(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'(
      "110"), STD_LOGIC_VECTOR'( and_864_nl & and_dcpl_365 & and_dcpl_371 & and_dcpl_374));
  z_out_5_8_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_12_nl)
      * UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_13_nl & COMP_LOOP_twiddle_f_mux1h_348_nl
      & '1')), 9));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(9 DOWNTO 7)), COMP_LOOP_twiddle_f_nor_5_itm);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_14_nl <= MUX_v_7_2_2(COMP_LOOP_9_twiddle_f_lshift_ncse_sva,
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(6 DOWNTO 0)), COMP_LOOP_twiddle_f_or_itm);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"),
      (COMP_LOOP_k_10_5_sva_4_0(4 DOWNTO 2)), COMP_LOOP_twiddle_f_nor_5_itm);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_15_nl <= MUX_v_2_2_2((COMP_LOOP_k_10_5_sva_4_0(4
      DOWNTO 3)), (COMP_LOOP_k_10_5_sva_4_0(1 DOWNTO 0)), COMP_LOOP_twiddle_f_or_itm);
  COMP_LOOP_twiddle_f_or_66_nl <= and_dcpl_382 OR and_dcpl_394;
  COMP_LOOP_twiddle_f_mux1h_349_nl <= MUX1HOT_v_3_3_2((COMP_LOOP_k_10_5_sva_4_0(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( "011"), STD_LOGIC_VECTOR'( "110"), STD_LOGIC_VECTOR'(
      COMP_LOOP_twiddle_f_or_66_nl & and_dcpl_390 & and_dcpl_399));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl <= (NOT(and_dcpl_382 OR and_dcpl_399))
      OR and_dcpl_390 OR and_dcpl_394;
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_14_nl) * UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_15_nl & COMP_LOOP_twiddle_f_mux1h_349_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl & '1')), 10));
  COMP_LOOP_twiddle_f_or_68_nl <= and_dcpl_413 OR and_dcpl_416;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_16_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'(
      "01"), STD_LOGIC_VECTOR'( "10"), COMP_LOOP_twiddle_f_or_68_nl);
  COMP_LOOP_twiddle_f_or_67_nl <= MUX_v_2_2_2(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_16_nl,
      STD_LOGIC_VECTOR'("11"), and_dcpl_422);
  COMP_LOOP_twiddle_f_or_69_nl <= (NOT and_dcpl_413) OR (CONV_SL_1_1(fsm_output(8
      DOWNTO 6)=STD_LOGIC_VECTOR'("001")) AND and_dcpl_342 AND and_dcpl_402) OR and_dcpl_416
      OR and_dcpl_422;
  z_out_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_10_5_sva_4_0 & COMP_LOOP_twiddle_f_or_67_nl & and_dcpl_422
      & COMP_LOOP_twiddle_f_or_69_nl & '1')), 10));
  VEC_LOOP_VEC_LOOP_or_10_nl <= (STAGE_LOOP_lshift_psp_sva(10)) OR and_dcpl_457 OR
      and_dcpl_464 OR and_dcpl_469 OR and_dcpl_474 OR and_dcpl_478 OR and_dcpl_481
      OR and_dcpl_486 OR and_dcpl_487 OR and_dcpl_489 OR and_dcpl_492 OR and_dcpl_494
      OR and_dcpl_496 OR and_dcpl_498 OR and_dcpl_500 OR and_dcpl_502;
  VEC_LOOP_VEC_LOOP_mux_10_nl <= MUX_v_10_2_2((STAGE_LOOP_lshift_psp_sva(9 DOWNTO
      0)), (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1))), VEC_LOOP_or_46_itm);
  mux_1169_nl <= MUX_s_1_2_2(nand_47_cse, or_tmp_561, fsm_output(1));
  mux_1168_nl <= MUX_s_1_2_2(mux_1169_nl, mux_tmp_1038, fsm_output(5));
  mux_1167_nl <= MUX_s_1_2_2(mux_tmp_1035, mux_1168_nl, fsm_output(2));
  mux_1172_nl <= MUX_s_1_2_2(or_tmp_560, mux_tmp_1033, fsm_output(1));
  mux_1171_nl <= MUX_s_1_2_2(mux_tmp_1038, mux_1172_nl, fsm_output(5));
  mux_1170_nl <= MUX_s_1_2_2(mux_1171_nl, mux_tmp_1035, fsm_output(2));
  mux_1166_nl <= MUX_s_1_2_2(mux_1167_nl, mux_1170_nl, fsm_output(4));
  VEC_LOOP_or_80_nl <= (NOT((NOT mux_1166_nl) AND (fsm_output(0)))) OR and_dcpl_457
      OR and_dcpl_464 OR and_dcpl_469 OR and_dcpl_474 OR and_dcpl_478 OR and_dcpl_481
      OR and_dcpl_486 OR and_dcpl_487 OR and_dcpl_489 OR and_dcpl_492 OR and_dcpl_494
      OR and_dcpl_496 OR and_dcpl_498 OR and_dcpl_500 OR and_dcpl_502;
  VEC_LOOP_VEC_LOOP_mux_11_nl <= MUX_v_5_2_2((VEC_LOOP_acc_1_cse_10_sva(9 DOWNTO
      5)), COMP_LOOP_k_10_5_sva_4_0, VEC_LOOP_or_46_itm);
  VEC_LOOP_VEC_LOOP_or_11_nl <= ((VEC_LOOP_acc_1_cse_10_sva(4)) AND (NOT(and_dcpl_457
      OR and_dcpl_481 OR and_dcpl_492 OR and_dcpl_500 OR and_dcpl_502))) OR and_dcpl_464
      OR and_dcpl_469 OR and_dcpl_474 OR and_dcpl_478 OR and_dcpl_486 OR and_dcpl_487
      OR and_dcpl_489 OR and_dcpl_494 OR and_dcpl_496 OR and_dcpl_498;
  VEC_LOOP_VEC_LOOP_or_12_nl <= ((VEC_LOOP_acc_1_cse_10_sva(3)) AND (NOT(and_dcpl_481
      OR and_dcpl_489 OR and_dcpl_494 OR and_dcpl_496 OR and_dcpl_498 OR and_dcpl_500
      OR and_dcpl_502))) OR and_dcpl_457 OR and_dcpl_464 OR and_dcpl_469 OR and_dcpl_474
      OR and_dcpl_478 OR and_dcpl_486 OR and_dcpl_487 OR and_dcpl_492;
  VEC_LOOP_VEC_LOOP_or_13_nl <= ((VEC_LOOP_acc_1_cse_10_sva(2)) AND (NOT(and_dcpl_457
      OR and_dcpl_474 OR and_dcpl_481 OR and_dcpl_486 OR and_dcpl_487 OR and_dcpl_496
      OR and_dcpl_498))) OR and_dcpl_464 OR and_dcpl_469 OR and_dcpl_478 OR and_dcpl_489
      OR and_dcpl_492 OR and_dcpl_494 OR and_dcpl_500 OR and_dcpl_502;
  VEC_LOOP_VEC_LOOP_or_14_nl <= ((VEC_LOOP_acc_1_cse_10_sva(1)) AND (NOT(and_dcpl_457
      OR and_dcpl_464 OR and_dcpl_478 OR and_dcpl_486 OR and_dcpl_487 OR and_dcpl_494
      OR and_dcpl_498 OR and_dcpl_500 OR and_dcpl_502))) OR and_dcpl_469 OR and_dcpl_474
      OR and_dcpl_481 OR and_dcpl_489 OR and_dcpl_492 OR and_dcpl_496;
  VEC_LOOP_VEC_LOOP_or_15_nl <= ((VEC_LOOP_acc_1_cse_10_sva(0)) AND (NOT(and_dcpl_457
      OR and_dcpl_469 OR and_dcpl_474 OR and_dcpl_478 OR and_dcpl_481 OR and_dcpl_487
      OR and_dcpl_489 OR and_dcpl_492 OR and_dcpl_496 OR and_dcpl_498 OR and_dcpl_502)))
      OR and_dcpl_464 OR and_dcpl_486 OR and_dcpl_494 OR and_dcpl_500;
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_10_nl &
      VEC_LOOP_VEC_LOOP_mux_10_nl & VEC_LOOP_or_80_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_11_nl
      & VEC_LOOP_VEC_LOOP_or_11_nl & VEC_LOOP_VEC_LOOP_or_12_nl & VEC_LOOP_VEC_LOOP_or_13_nl
      & VEC_LOOP_VEC_LOOP_or_14_nl & VEC_LOOP_VEC_LOOP_or_15_nl & '1'), 11), 12),
      12));
  z_out_10 <= acc_nl(11 DOWNTO 1);
  and_866_nl <= and_dcpl_508 AND and_dcpl_414 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("10")) AND nor_95_cse;
  and_867_nl <= and_dcpl_508 AND nor_183_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("00")) AND nor_95_cse;
  and_868_nl <= and_dcpl_508 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_518;
  and_869_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011")) AND
      nor_183_cse AND and_dcpl_476;
  and_870_nl <= and_dcpl_358 AND and_dcpl_414 AND and_dcpl_518;
  and_871_nl <= and_dcpl_358 AND nor_183_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_144;
  and_872_nl <= and_dcpl_508 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_476;
  and_873_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("000")) AND
      nor_183_cse AND and_dcpl_518;
  COMP_LOOP_mux1h_4_nl <= MUX1HOT_v_5_8_2(STD_LOGIC_VECTOR'( "01010"), STD_LOGIC_VECTOR'(
      "00110"), STD_LOGIC_VECTOR'( "01001"), STD_LOGIC_VECTOR'( "10100"), STD_LOGIC_VECTOR'(
      "10001"), STD_LOGIC_VECTOR'( "01101"), STD_LOGIC_VECTOR'( "01100"), STD_LOGIC_VECTOR'(
      "00001"), STD_LOGIC_VECTOR'( and_866_nl & and_867_nl & and_868_nl & and_869_nl
      & and_870_nl & and_871_nl & and_872_nl & and_873_nl));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1))) & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_5_sva_4_0
      & COMP_LOOP_mux1h_4_nl & '1'), 11), 12), 12));
  z_out_11_10 <= acc_1_nl(11);
  VEC_LOOP_mux_7_nl <= MUX_v_22_2_2((z_out_13(31 DOWNTO 10)), (STD_LOGIC_VECTOR'(
      "00000000000") & (z_out_14(5 DOWNTO 0)) & STD_LOGIC_VECTOR'( "00000")), and_dcpl_555);
  VEC_LOOP_or_81_nl <= (NOT(nor_98_cse AND nor_183_cse AND and_dcpl_451 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")))) OR and_dcpl_555;
  VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl <= NOT(MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
      (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1)), and_dcpl_555));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_7_nl
      & VEC_LOOP_or_81_nl), 23), 24) + CONV_UNSIGNED(CONV_SIGNED(SIGNED('1' & VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl
      & '1'), 12), 24), 24));
  z_out_12_22_10 <= acc_2_nl(23 DOWNTO 11);
  VEC_LOOP_mux_8_nl <= MUX_v_32_2_2(COMP_LOOP_twiddle_f_11_sva, factor1_1_sva, and_dcpl_564);
  VEC_LOOP_or_82_nl <= (NOT(nor_98_cse AND nor_183_cse AND CONV_SL_1_1(fsm_output(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("0101")))) OR and_dcpl_564;
  VEC_LOOP_mux_9_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "000000000000000000000")
      & STAGE_LOOP_lshift_psp_sva), (NOT COMP_LOOP_1_mult_cmp_return_rsc_z), and_dcpl_564);
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_8_nl & VEC_LOOP_or_82_nl)
      + UNSIGNED(VEC_LOOP_mux_9_nl & '1'), 33));
  z_out_13 <= acc_3_nl(32 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_and_1_nl <= (VEC_LOOP_acc_1_cse_10_sva(9)) AND VEC_LOOP_nor_7_itm;
  VEC_LOOP_mux_10_nl <= MUX_s_1_2_2((VEC_LOOP_acc_1_cse_10_sva(8)), (VEC_LOOP_acc_1_cse_10_sva(9)),
      VEC_LOOP_or_33_itm);
  VEC_LOOP_VEC_LOOP_or_16_nl <= (VEC_LOOP_mux_10_nl AND (NOT(and_dcpl_572 OR and_dcpl_636
      OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639 OR and_dcpl_640 OR and_dcpl_641
      OR and_dcpl_646 OR and_dcpl_651 OR and_dcpl_652 OR and_dcpl_653 OR and_dcpl_654)))
      OR and_dcpl_649 OR and_dcpl_655 OR and_dcpl_656 OR and_dcpl_657;
  VEC_LOOP_mux1h_42_nl <= MUX1HOT_s_1_4_2((VEC_LOOP_acc_1_cse_10_sva(7)), (VEC_LOOP_acc_1_cse_10_sva(8)),
      (VEC_LOOP_acc_1_cse_10_sva(9)), (NOT (STAGE_LOOP_lshift_psp_sva(10))), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_5_ssc & VEC_LOOP_or_33_itm & VEC_LOOP_or_36_itm & VEC_LOOP_or_48_itm));
  VEC_LOOP_or_83_nl <= (VEC_LOOP_mux1h_42_nl AND (NOT(and_dcpl_572 OR and_dcpl_640
      OR and_dcpl_641 OR and_dcpl_646 OR and_dcpl_651 OR and_dcpl_654))) OR and_dcpl_652
      OR and_dcpl_653;
  VEC_LOOP_or_84_nl <= and_dcpl_640 OR and_dcpl_641;
  VEC_LOOP_or_85_nl <= and_dcpl_652 OR and_dcpl_653;
  VEC_LOOP_mux1h_43_nl <= MUX1HOT_v_7_10_2(('0' & (VEC_LOOP_acc_1_cse_10_sva(9 DOWNTO
      4))), (VEC_LOOP_acc_1_cse_10_sva(6 DOWNTO 0)), (VEC_LOOP_acc_1_cse_10_sva(7
      DOWNTO 1)), (VEC_LOOP_acc_1_cse_10_sva(8 DOWNTO 2)), (VEC_LOOP_acc_1_cse_10_sva(9
      DOWNTO 3)), (STD_LOGIC_VECTOR'( "00") & COMP_LOOP_k_10_5_sva_4_0), (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 3))), (STD_LOGIC_VECTOR'( "01") & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 6)))), (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 4))), ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 5)))), STD_LOGIC_VECTOR'( and_dcpl_572 & VEC_LOOP_or_5_ssc & VEC_LOOP_or_33_itm
      & VEC_LOOP_or_36_itm & VEC_LOOP_or_84_nl & and_dcpl_646 & VEC_LOOP_or_48_itm
      & and_dcpl_651 & VEC_LOOP_or_85_nl & and_dcpl_654));
  VEC_LOOP_or_86_nl <= (NOT(and_dcpl_572 OR and_dcpl_580 OR and_dcpl_584 OR and_dcpl_588
      OR and_dcpl_593 OR and_dcpl_596 OR and_dcpl_598 OR and_dcpl_600 OR and_dcpl_602
      OR and_dcpl_603 OR and_dcpl_606 OR and_dcpl_608 OR and_dcpl_610 OR and_dcpl_612
      OR and_dcpl_616 OR and_dcpl_618 OR and_dcpl_620 OR and_dcpl_623 OR and_dcpl_625
      OR and_dcpl_627 OR and_dcpl_628 OR and_dcpl_630 OR and_dcpl_631 OR and_dcpl_633
      OR and_dcpl_634 OR and_dcpl_636 OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639
      OR and_dcpl_640 OR and_dcpl_641 OR and_dcpl_646)) OR and_dcpl_649 OR and_dcpl_651
      OR and_dcpl_652 OR and_dcpl_653 OR and_dcpl_654 OR and_dcpl_655 OR and_dcpl_656
      OR and_dcpl_657;
  VEC_LOOP_and_30_nl <= (COMP_LOOP_k_10_5_sva_4_0(4)) AND VEC_LOOP_nor_7_itm;
  VEC_LOOP_VEC_LOOP_mux_12_nl <= MUX_s_1_2_2((COMP_LOOP_k_10_5_sva_4_0(3)), (COMP_LOOP_k_10_5_sva_4_0(4)),
      VEC_LOOP_or_33_itm);
  VEC_LOOP_and_31_nl <= VEC_LOOP_VEC_LOOP_mux_12_nl AND (NOT(and_dcpl_572 OR and_dcpl_636
      OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639 OR and_dcpl_640 OR and_dcpl_641
      OR and_dcpl_646 OR and_dcpl_649 OR and_dcpl_651 OR and_dcpl_652 OR and_dcpl_653
      OR and_dcpl_654 OR and_dcpl_655 OR and_dcpl_656 OR and_dcpl_657));
  VEC_LOOP_mux1h_44_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_10_5_sva_4_0(2)), (COMP_LOOP_k_10_5_sva_4_0(3)),
      (COMP_LOOP_k_10_5_sva_4_0(4)), STD_LOGIC_VECTOR'( VEC_LOOP_or_5_ssc & VEC_LOOP_or_33_itm
      & VEC_LOOP_or_56_itm));
  VEC_LOOP_and_32_nl <= VEC_LOOP_mux1h_44_nl AND (NOT(and_dcpl_572 OR and_dcpl_640
      OR and_dcpl_641 OR and_dcpl_646 OR and_dcpl_651 OR and_dcpl_652 OR and_dcpl_653
      OR and_dcpl_654));
  VEC_LOOP_mux1h_45_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_10_5_sva_4_0(1)), (COMP_LOOP_k_10_5_sva_4_0(2)),
      (COMP_LOOP_k_10_5_sva_4_0(3)), (COMP_LOOP_k_10_5_sva_4_0(4)), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_5_ssc & VEC_LOOP_or_33_itm & VEC_LOOP_or_56_itm & VEC_LOOP_or_60_itm));
  VEC_LOOP_and_33_nl <= VEC_LOOP_mux1h_45_nl AND (NOT(and_dcpl_572 OR and_dcpl_646
      OR and_dcpl_651 OR and_dcpl_654));
  VEC_LOOP_mux1h_46_nl <= MUX1HOT_s_1_5_2((COMP_LOOP_k_10_5_sva_4_0(4)), (COMP_LOOP_k_10_5_sva_4_0(0)),
      (COMP_LOOP_k_10_5_sva_4_0(1)), (COMP_LOOP_k_10_5_sva_4_0(2)), (COMP_LOOP_k_10_5_sva_4_0(3)),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_61_itm & VEC_LOOP_or_5_ssc & VEC_LOOP_or_33_itm
      & VEC_LOOP_or_56_itm & VEC_LOOP_or_60_itm));
  VEC_LOOP_and_34_nl <= VEC_LOOP_mux1h_46_nl AND (NOT(and_dcpl_646 OR and_dcpl_651));
  VEC_LOOP_mux1h_47_nl <= MUX1HOT_s_1_5_2((COMP_LOOP_k_10_5_sva_4_0(3)), (COMP_LOOP_k_10_5_sva_4_0(0)),
      (COMP_LOOP_k_10_5_sva_4_0(1)), (COMP_LOOP_k_10_5_sva_4_0(2)), (COMP_LOOP_k_10_5_sva_4_0(4)),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_61_itm & VEC_LOOP_or_33_itm & VEC_LOOP_or_56_itm
      & VEC_LOOP_or_60_itm & and_dcpl_651));
  VEC_LOOP_or_87_nl <= (VEC_LOOP_mux1h_47_nl AND (NOT(and_dcpl_580 OR and_dcpl_584
      OR and_dcpl_588 OR and_dcpl_593 OR and_dcpl_596 OR and_dcpl_598 OR and_dcpl_600
      OR and_dcpl_602 OR and_dcpl_646))) OR and_dcpl_603 OR and_dcpl_606 OR and_dcpl_608
      OR and_dcpl_610 OR and_dcpl_612 OR and_dcpl_616 OR and_dcpl_618 OR and_dcpl_620;
  VEC_LOOP_mux1h_48_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_10_5_sva_4_0(2)), (COMP_LOOP_k_10_5_sva_4_0(0)),
      (COMP_LOOP_k_10_5_sva_4_0(1)), (COMP_LOOP_k_10_5_sva_4_0(3)), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_61_itm & VEC_LOOP_or_56_itm & VEC_LOOP_or_60_itm & and_dcpl_651));
  VEC_LOOP_or_88_nl <= (VEC_LOOP_mux1h_48_nl AND (NOT(and_dcpl_580 OR and_dcpl_584
      OR and_dcpl_588 OR and_dcpl_593 OR and_dcpl_603 OR and_dcpl_606 OR and_dcpl_608
      OR and_dcpl_610 OR and_dcpl_623 OR and_dcpl_625 OR and_dcpl_627 OR and_dcpl_628
      OR and_dcpl_646))) OR and_dcpl_596 OR and_dcpl_598 OR and_dcpl_600 OR and_dcpl_602
      OR and_dcpl_612 OR and_dcpl_616 OR and_dcpl_618 OR and_dcpl_620 OR and_dcpl_630
      OR and_dcpl_631 OR and_dcpl_633 OR and_dcpl_634;
  VEC_LOOP_mux1h_49_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_10_5_sva_4_0(1)), (COMP_LOOP_k_10_5_sva_4_0(0)),
      (COMP_LOOP_k_10_5_sva_4_0(2)), STD_LOGIC_VECTOR'( VEC_LOOP_or_61_itm & VEC_LOOP_or_60_itm
      & and_dcpl_651));
  VEC_LOOP_or_89_nl <= (VEC_LOOP_mux1h_49_nl AND (NOT(and_dcpl_580 OR and_dcpl_584
      OR and_dcpl_596 OR and_dcpl_598 OR and_dcpl_603 OR and_dcpl_606 OR and_dcpl_612
      OR and_dcpl_616 OR and_dcpl_623 OR and_dcpl_625 OR and_dcpl_630 OR and_dcpl_631
      OR and_dcpl_636 OR and_dcpl_637 OR and_dcpl_646 OR and_dcpl_655 OR and_dcpl_656)))
      OR and_dcpl_588 OR and_dcpl_593 OR and_dcpl_600 OR and_dcpl_602 OR and_dcpl_608
      OR and_dcpl_610 OR and_dcpl_618 OR and_dcpl_620 OR and_dcpl_627 OR and_dcpl_628
      OR and_dcpl_633 OR and_dcpl_634 OR and_dcpl_638 OR and_dcpl_639 OR and_dcpl_649
      OR and_dcpl_657;
  VEC_LOOP_VEC_LOOP_mux_13_nl <= MUX_s_1_2_2((COMP_LOOP_k_10_5_sva_4_0(0)), (COMP_LOOP_k_10_5_sva_4_0(1)),
      and_dcpl_651);
  VEC_LOOP_or_90_nl <= (VEC_LOOP_VEC_LOOP_mux_13_nl AND (NOT(and_dcpl_580 OR and_dcpl_588
      OR and_dcpl_596 OR and_dcpl_600 OR and_dcpl_603 OR and_dcpl_608 OR and_dcpl_612
      OR and_dcpl_618 OR and_dcpl_623 OR and_dcpl_627 OR and_dcpl_630 OR and_dcpl_633
      OR and_dcpl_636 OR and_dcpl_638 OR and_dcpl_640 OR and_dcpl_646 OR and_dcpl_652
      OR and_dcpl_655 OR and_dcpl_657))) OR and_dcpl_584 OR and_dcpl_593 OR and_dcpl_598
      OR and_dcpl_602 OR and_dcpl_606 OR and_dcpl_610 OR and_dcpl_616 OR and_dcpl_620
      OR and_dcpl_625 OR and_dcpl_628 OR and_dcpl_631 OR and_dcpl_634 OR and_dcpl_637
      OR and_dcpl_639 OR and_dcpl_641 OR and_dcpl_649 OR and_dcpl_653 OR and_dcpl_656;
  VEC_LOOP_VEC_LOOP_or_17_nl <= ((COMP_LOOP_k_10_5_sva_4_0(0)) AND (NOT(and_dcpl_649
      OR and_dcpl_652 OR and_dcpl_653 OR and_dcpl_655 OR and_dcpl_656 OR and_dcpl_657
      OR and_dcpl_654))) OR and_dcpl_572 OR and_dcpl_580 OR and_dcpl_584 OR and_dcpl_588
      OR and_dcpl_593 OR and_dcpl_596 OR and_dcpl_598 OR and_dcpl_600 OR and_dcpl_602
      OR and_dcpl_603 OR and_dcpl_606 OR and_dcpl_608 OR and_dcpl_610 OR and_dcpl_612
      OR and_dcpl_616 OR and_dcpl_618 OR and_dcpl_620 OR and_dcpl_623 OR and_dcpl_625
      OR and_dcpl_627 OR and_dcpl_628 OR and_dcpl_630 OR and_dcpl_631 OR and_dcpl_633
      OR and_dcpl_634 OR and_dcpl_636 OR and_dcpl_637 OR and_dcpl_638 OR and_dcpl_639
      OR and_dcpl_640 OR and_dcpl_641 OR and_dcpl_646;
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_and_1_nl
      & VEC_LOOP_VEC_LOOP_or_16_nl & VEC_LOOP_or_83_nl & VEC_LOOP_mux1h_43_nl & VEC_LOOP_or_86_nl)
      + UNSIGNED'( VEC_LOOP_and_30_nl & VEC_LOOP_and_31_nl & VEC_LOOP_and_32_nl &
      VEC_LOOP_and_33_nl & VEC_LOOP_and_34_nl & VEC_LOOP_or_87_nl & VEC_LOOP_or_88_nl
      & VEC_LOOP_or_89_nl & VEC_LOOP_or_90_nl & VEC_LOOP_VEC_LOOP_or_17_nl & '1'),
      11));
  z_out_14 <= acc_4_nl(10 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_mux_14_nl <= MUX_v_5_2_2(COMP_LOOP_k_10_5_sva_4_0, ('0' & (COMP_LOOP_k_10_5_sva_4_0(4
      DOWNTO 1))), and_744_cse);
  VEC_LOOP_VEC_LOOP_or_18_nl <= ((COMP_LOOP_k_10_5_sva_4_0(0)) AND (NOT and_739_cse))
      OR and_749_cse;
  VEC_LOOP_VEC_LOOP_mux_15_nl <= MUX_v_7_2_2((STAGE_LOOP_lshift_psp_sva(10 DOWNTO
      4)), ('0' & (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 5))), and_744_cse);
  z_out_15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_14_nl
      & VEC_LOOP_VEC_LOOP_or_18_nl & '1') + UNSIGNED(VEC_LOOP_VEC_LOOP_mux_15_nl),
      7));
  and_874_nl <= and_dcpl_479 AND and_293_cse AND and_dcpl_698;
  and_875_nl <= and_dcpl_343 AND and_dcpl_342 AND and_dcpl_575;
  and_876_nl <= and_dcpl_490 AND nor_183_cse AND and_dcpl_698;
  and_877_nl <= and_dcpl_490 AND and_dcpl_414 AND and_dcpl_575;
  and_878_nl <= and_dcpl_392 AND and_dcpl_342 AND and_dcpl_698;
  and_879_nl <= and_dcpl_392 AND and_293_cse AND and_dcpl_575;
  and_880_nl <= and_dcpl_462 AND nor_183_cse AND and_dcpl_621;
  and_881_nl <= and_dcpl_741 AND and_dcpl_582;
  and_882_nl <= and_dcpl_741 AND and_dcpl_635;
  and_883_nl <= and_dcpl_462 AND and_dcpl_414 AND and_dcpl_698;
  and_884_nl <= and_dcpl_746 AND and_dcpl_624;
  VEC_LOOP_mux1h_50_nl <= MUX1HOT_v_5_27_2(STD_LOGIC_VECTOR'( "00001"), STD_LOGIC_VECTOR'(
      "00010"), STD_LOGIC_VECTOR'( "00011"), STD_LOGIC_VECTOR'( "00100"), STD_LOGIC_VECTOR'(
      "00101"), STD_LOGIC_VECTOR'( "00110"), STD_LOGIC_VECTOR'( "00111"), STD_LOGIC_VECTOR'(
      "01001"), STD_LOGIC_VECTOR'( "01010"), STD_LOGIC_VECTOR'( "01011"), STD_LOGIC_VECTOR'(
      "01100"), STD_LOGIC_VECTOR'( "01101"), STD_LOGIC_VECTOR'( "01110"), STD_LOGIC_VECTOR'(
      "01111"), STD_LOGIC_VECTOR'( "10001"), STD_LOGIC_VECTOR'( "10010"), STD_LOGIC_VECTOR'(
      "10011"), STD_LOGIC_VECTOR'( "10100"), STD_LOGIC_VECTOR'( "10101"), STD_LOGIC_VECTOR'(
      "10110"), STD_LOGIC_VECTOR'( "10111"), STD_LOGIC_VECTOR'( "11001"), STD_LOGIC_VECTOR'(
      "11010"), STD_LOGIC_VECTOR'( "11011"), STD_LOGIC_VECTOR'( "11100"), STD_LOGIC_VECTOR'(
      "11101"), STD_LOGIC_VECTOR'( "11110"), STD_LOGIC_VECTOR'( and_dcpl_580 & and_dcpl_623
      & and_dcpl_584 & and_dcpl_636 & and_874_nl & and_dcpl_625 & and_dcpl_593 &
      and_875_nl & and_dcpl_627 & and_dcpl_598 & and_dcpl_637 & and_876_nl & and_dcpl_628
      & and_dcpl_602 & and_877_nl & and_dcpl_630 & and_dcpl_606 & and_dcpl_638 &
      and_878_nl & and_dcpl_631 & and_dcpl_610 & and_879_nl & and_880_nl & and_881_nl
      & and_882_nl & and_883_nl & and_884_nl));
  and_885_nl <= and_dcpl_746 AND and_dcpl_590;
  VEC_LOOP_or_91_nl <= MUX_v_5_2_2(VEC_LOOP_mux1h_50_nl, STD_LOGIC_VECTOR'("11111"),
      and_885_nl);
  z_out_16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_5_sva_4_0 &
      VEC_LOOP_or_91_nl) + UNSIGNED(STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1)), 10));
  VEC_LOOP_acc_62_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_5_sva_4_0)
      + UNSIGNED(STAGE_LOOP_lshift_psp_sva(10 DOWNTO 6)), 5));
  and_886_nl <= nor_98_cse AND nor_183_cse AND and_dcpl_660;
  VEC_LOOP_mux1h_51_nl <= MUX1HOT_v_6_3_2((STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_acc_62_nl),
      5)) & (STAGE_LOOP_lshift_psp_sva(5))), (z_out_15(6 DOWNTO 1)), (z_out_15(5
      DOWNTO 0)), STD_LOGIC_VECTOR'( and_886_nl & VEC_LOOP_or_78_itm & and_744_cse));
  VEC_LOOP_VEC_LOOP_mux_16_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(4)), (z_out_15(0)),
      VEC_LOOP_or_78_itm);
  VEC_LOOP_or_92_nl <= and_739_cse OR and_744_cse OR and_749_cse;
  VEC_LOOP_mux_11_nl <= MUX_v_10_2_2((COMP_LOOP_twiddle_f_11_sva(9 DOWNTO 0)), VEC_LOOP_acc_1_cse_10_sva,
      VEC_LOOP_or_92_nl);
  z_out_17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux1h_51_nl & VEC_LOOP_VEC_LOOP_mux_16_nl
      & (STAGE_LOOP_lshift_psp_sva(3 DOWNTO 1))) + UNSIGNED(VEC_LOOP_mux_11_nl),
      10));
END v8;

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

ARCHITECTURE v8 OF inPlaceNTT_DIT_precomp IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
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

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
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

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
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
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
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
      (19 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR
      (19 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
  vec_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
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

  twiddle_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
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
  twiddle_rsci_adra_d_1 <= twiddle_rsci_adra_d;
  twiddle_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  twiddle_rsci_qa_d <= twiddle_rsci_qa_d_1;
  twiddle_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  twiddle_h_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
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
  twiddle_h_rsci_adra_d_1 <= twiddle_h_rsci_adra_d;
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

END v8;



